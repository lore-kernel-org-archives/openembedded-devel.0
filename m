Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Rxqlw-00063o-Hf
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Feb 2012 03:08:36 +0100
Received: by mail-ey0-f175.google.com with SMTP id l10so479834eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Feb 2012 18:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=M/b8ygi1CjTFScW8+xFGduZFZnjdIbY6FrK9xV5NFuM=;
	b=fBKK+WT8MxC0gEewid0d0BtpQrMRboW9x3/uXgxE1ipiwRW5PFh5h9ZlS1Nhmg6mE/
	RjACjInFAT6T+ucJ71OVCNfSTkUTlJ/qKArhb5F7TfZBjXEQTss8RQTAQRlADHEpzP8D
	++ewImQ4BNux58pVKSGmWikkmMYV2w3kO2PYg=
Received: by 10.14.52.7 with SMTP id d7mr335526eec.80.1329357626397;
	Wed, 15 Feb 2012 18:00:26 -0800 (PST)
Received: from localhost.localdomain (p5B0A2E3F.dip.t-dialin.net.
	[91.10.46.63])
	by mx.google.com with ESMTPS id n58sm17552669een.10.2012.02.15.18.00.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 15 Feb 2012 18:00:25 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Feb 2012 03:03:01 +0100
Message-Id: <1329357796-27398-8-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
References: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe][v2] 07/22] systemd.bbclass: automatically extend RDEPENDS for *-systemd packages
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
X-List-Received-Date: Thu, 16 Feb 2012 02:08:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* append systemd:  functionalty moved into systemd_add_rdepends
* append base-pgk: create warning if *-systemd package already rdepends
                   it's base package

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/classes/systemd.bbclass |   19 +++++++++++++++++++
 1 files changed, 19 insertions(+), 0 deletions(-)

diff --git a/meta-oe/classes/systemd.bbclass b/meta-oe/classes/systemd.bbclass
index 1e0f3e0..ecd3b8d 100644
--- a/meta-oe/classes/systemd.bbclass
+++ b/meta-oe/classes/systemd.bbclass
@@ -187,8 +187,27 @@ python populate_packages_prepend () {
 					raise bb.build.FuncFailed, "\n\nFor package %s SYSTEMD_SERVICE-entry %s does not exist" % \
 						(pkg_systemd, service)
 
+	# *-systemd packages get RDEPENDS to systemd and their base package
+	def systemd_add_rdepends(pkg_systemd):
+		pn_pkg = d.getVar('PN', 1)
+		# RDEPENDS_${pkg_systemd} += pkg_systemd_base systemd
+		rdepends = explode_deps(d.getVar('RDEPENDS_' + pkg_systemd, 1) or "")
+		if not 'systemd' in rdepends:
+			rdepends.append('systemd')
+		pkg_systemd_base = pkg_systemd.replace('-systemd', '')
+		# not rdepending myself
+		if pkg_systemd != pn_pkg:
+			#  avoid double entries
+			if not pkg_systemd_base in rdepends:
+				rdepends.append(pkg_systemd_base)
+			else:
+				bb.warn("%s: it is recommended to remove %s from RDEPENDS_%s since systemd.bbclass takes care" % \
+					(d.getVar('FILE'), pkg_systemd_base, pkg_systemd))
+		d.setVar('RDEPENDS_' + pkg_systemd, " " + " ".join(rdepends))
+
 
 	for pkg_systemd in d.getVar('SYSTEMD_PACKAGES', 1).split():
 		systemd_generate_package_scripts(pkg_systemd)
+		systemd_add_rdepends(pkg_systemd)
 	systemd_check_services()
 }
-- 
1.7.4.4



