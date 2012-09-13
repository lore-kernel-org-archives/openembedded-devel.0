Received: from db3ehsobe002.messaging.microsoft.com ([213.199.154.140]
	helo=db3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B28495@freescale.com>) id 1TC4tQ-0007Rl-Gs
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Sep 2012 10:35:24 +0200
Received: from mail42-db3-R.bigfish.com (10.3.81.228) by
	DB3EHSOBE010.bigfish.com (10.3.84.30) with Microsoft SMTP Server id
	14.1.225.23; Thu, 13 Sep 2012 07:37:38 +0000
Received: from mail42-db3 (localhost [127.0.0.1])	by mail42-db3-R.bigfish.com
	(Postfix) with ESMTP id 4735DA00AE	for
	<openembedded-devel@lists.openembedded.org>;
	Thu, 13 Sep 2012 07:37:38 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 1
X-BigFish: VS1(zzd6f1izz1202h1d1ah1d2ahzz8275bhz2dh2a8h668h839hd24he5bhf0ah107ah1288h12a5h12bdh12e5h1155h)
Received: from mail42-db3 (localhost.localdomain [127.0.0.1]) by mail42-db3
	(MessageSwitch) id 1347521856672742_2580;
	Thu, 13 Sep 2012 07:37:36 +0000 (UTC)
Received: from DB3EHSMHS016.bigfish.com (unknown [10.3.81.235])	by
	mail42-db3.bigfish.com (Postfix) with ESMTP id A0F13140047	for
	<openembedded-devel@lists.openembedded.org>;
	Thu, 13 Sep 2012 07:37:36 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS016.bigfish.com
	(10.3.87.116) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 13 Sep 2012 07:37:36 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server (TLS) id 14.2.309.3; Thu, 13 Sep 2012 02:37:34 -0500
Received: from sbuilder136.ap.freescale.net ([10.192.208.136])	by
	az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id q8D7bWiN006424;
	Thu, 13 Sep 2012 00:37:33 -0700
From: <b28495@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 13 Sep 2012 15:33:58 +0800
Message-ID: <1347521638-3093-1-git-send-email-b28495@freescale.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: b29882@freescale.com
Subject: [meta-oe][for-denzil][PATCH] systemd.bbclass: use system variables instead of hardcoded paths
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Sep 2012 08:35:24 -0000
Content-Type: text/plain

From: Ting Liu <b28495@freescale.com>

Fix below issue when check service-files for 64bit target:
| DEBUG: adding systemd calls to postinst/postrm for busybox-syslog-systemd
| ERROR: Function failed:
|
| For package busybox-syslog-systemd SYSTEMD_SERVICE-entry busybox-syslog.service does not exist
NOTE: package busybox-1.19.4-r6+fsl.0: task do_package: Failed

Signed-off-by: Ting Liu <b28495@freescale.com>
---
 meta-oe/classes/systemd.bbclass |   11 +++++++----
 1 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta-oe/classes/systemd.bbclass b/meta-oe/classes/systemd.bbclass
index a2c8ddf..9690c18 100644
--- a/meta-oe/classes/systemd.bbclass
+++ b/meta-oe/classes/systemd.bbclass
@@ -154,7 +154,10 @@ python populate_packages_prepend () {
 
 	# check service-files and call systemd_add_files_and_parse for each entry
 	def systemd_check_services():
-		searchpaths = '/etc/systemd/system/ /lib/systemd/system/ /usr/lib/systemd/system/'
+		searchpaths = []
+		searchpaths.append(d.getVar('sysconfdir', True))
+		searchpaths.append(d.getVar('libdir', True))
+		searchpaths.append(d.getVar('base_libdir', True))
 		systemd_packages = d.getVar('SYSTEMD_PACKAGES', 1)
 		has_exactly_one_service = len(systemd_packages.split()) == 1
 		if has_exactly_one_service:
@@ -168,9 +171,9 @@ python populate_packages_prepend () {
 		for pkg_systemd in systemd_packages.split():
 			for service in get_package_var(d, 'SYSTEMD_SERVICE', pkg_systemd).split():
 				path_found = ''
-				for path in searchpaths.split():
-					if os.path.exists('${D}' + path + service):
-						path_found = path
+				for path in searchpaths:
+					if os.path.exists('${D}' + path + '/systemd/system/' + service):
+						path_found = path + '/systemd/system/'
 				if path_found != '':
 					systemd_add_files_and_parse(pkg_systemd, path_found, service, keys)
 				else:
-- 
1.7.5.4




