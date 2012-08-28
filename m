Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1T6FRK-0005dC-Ux
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Aug 2012 08:38:19 +0200
Received: by eekb57 with SMTP id b57so1414241eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2012 23:26:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=mB8Mci3rUxu3EK1HBjah050PQ2a7SKBkoqdfHtrMp1s=;
	b=Afo2XFd7s3xAyRwDuLMTI3n2Hk/zmGCkzHpstMk5jduuWA5g6WXO/gLtwqsF6RXpYg
	u6kMHESE71J/KZ6sWDnwSlMhKm15eb0xDJzPklvGeWIUbnoWrdGeX0Bmsmgm0uZy9qNo
	EoiIQHn2PlQ5czQHe+/P7kILDb7583QKZmrjFsRKn2G1I5I0mfwaRHnvvP+f5vxgEimo
	rKhLPB1niXFCNbgrQBVsvHVXgxADhcBjzvShf8cbqHCUXT974S58VkR3UZmCwgi8d+lB
	GQVIi1WBcxg5wFBA0eFTpT0CaGTrao2JVa6Dy1hhYjuB7zAH+/0/j2gxcfuxvWynfaph
	lLpQ==
Received: by 10.14.223.72 with SMTP id u48mr20698324eep.37.1346135166701;
	Mon, 27 Aug 2012 23:26:06 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id z6sm58161657eeo.6.2012.08.27.23.26.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 27 Aug 2012 23:26:05 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Aug 2012 08:25:46 +0200
Message-Id: <1346135149-11256-4-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1346135149-11256-1-git-send-email-koen@dominion.thruhere.net>
References: <1346135149-11256-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
X-Gm-Message-State: ALoCoQnNaFJoJyPDSJtpjaTycNeRbAC4uPdLqFHCIaMxE+XblO6rFSX61m0af4k7j34DJ9dtsqA3
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	=?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [for-denzil][meta-oe][PATCH 4/7] systemd.bbclass: extract SYSTEMD_SERVICE properly
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
X-List-Received-Date: Tue, 28 Aug 2012 06:38:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@googlemail.com>

To set service files the following syntax is allowed:

SYSTEMD_SERVICE = <service_file>
or
SYSTEMD_SERVICE_{<systemd_package_name>} = <service_file>

A function get_package_var was introduced to handle all use-cases [1]
properly.

Build tested / buildhistory checks

[1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2012-May/039870.html

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
Acked-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/classes/systemd.bbclass |   14 +++++++++-----
 1 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/meta-oe/classes/systemd.bbclass b/meta-oe/classes/systemd.bbclass
index 2881abf..2e585c3 100644
--- a/meta-oe/classes/systemd.bbclass
+++ b/meta-oe/classes/systemd.bbclass
@@ -24,6 +24,12 @@ systemd_postrm() {
 systemctl disable ${SYSTEMD_SERVICE}
 }
 
+def get_package_var(d, var, pkg):
+	val = (d.getVar('%s_%s' % (var, pkg), d, 1) or "").strip()
+	if val == "":
+		val = (d.getVar(var, d, 1) or "").strip()
+	return val
+
 def systemd_after_parse(d):
 	def systemd_check_vars():
 		if d.getVar('BB_WORKERCONTEXT', True) is not None:
@@ -155,8 +161,7 @@ python populate_packages_prepend () {
 		systemd_packages = d.getVar('SYSTEMD_PACKAGES', 1)
 		has_exactly_one_service = len(systemd_packages.split()) == 1
 		if has_exactly_one_service:
-			systemd_services = d.getVar('SYSTEMD_SERVICE' + "_" + systemd_packages, 1) or d.getVar('SYSTEMD_SERVICE', 1)
-			has_exactly_one_service = len(systemd_services.split()) == 1
+			has_exactly_one_service = len(get_package_var(d, 'SYSTEMD_SERVICE', systemd_packages).split()) == 1
 
 		keys = 'Also' # Conflicts??
 		if has_exactly_one_service:
@@ -164,8 +169,7 @@ python populate_packages_prepend () {
 			keys = 'Also Conflicts'
 		# scan for all in SYSTEMD_SERVICE[]
 		for pkg_systemd in systemd_packages.split():
-			systemd_services = d.getVar('SYSTEMD_SERVICE' + "_" + pkg_systemd, 1) or d.getVar('SYSTEMD_SERVICE', 1)
-			for service in systemd_services.split():
+			for service in get_package_var(d, 'SYSTEMD_SERVICE', pkg_systemd).split():
 				path_found = ''
 				for path in searchpaths.split():
 					if os.path.exists('${D}' + path + service):
@@ -196,7 +200,7 @@ python populate_packages_prepend () {
 	# run all modifications once when creating package
 	if os.path.exists('${D}'):
 		for pkg_systemd in d.getVar('SYSTEMD_PACKAGES', 1).split():
-			if d.getVar('SYSTEMD_SERVICE' + "_" + pkg_systemd, 1) and d.getVar('SYSTEMD_SERVICE' + "_" + pkg_systemd, 1).strip():
+			if get_package_var(d, 'SYSTEMD_SERVICE', pkg_systemd) != "":
 				systemd_generate_package_scripts(pkg_systemd)
 				systemd_add_rdepends(pkg_systemd)
 		systemd_check_services()
-- 
1.7.7.6



