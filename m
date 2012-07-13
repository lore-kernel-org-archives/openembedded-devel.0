Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SpbSE-0007zx-JI
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2012 10:42:27 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so2247517bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2012 01:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=W2DsZCdvL2mv3aKJg+C5g1ECMGp5sz2VNm7s6QXwWkQ=;
	b=MDNOUQYyTESbr2KqJk8NJtuGDmgdQJl2Iad5lb3Qg59ltW1JaCnbENULoUsUGdXswm
	YFxOZ0C8nPAKityXEOQW3iCh0K15ZXyilXU+6m0ArtAMF7tgcnsS9IR7w/0mhLL1/oUR
	GvCWTdZ7v6ARIjHJzDOnxqjNjcEfknRDHxEGJsENgGjvPnd7KcoZ96vtslZQmUyfLCbq
	F8scCFlfVSEhZnsWpXW97VpPkfh5C9ZYwMK1RBtN9zl3IDSYDx3wsNxaGpbS7kiAPwep
	XNhB2n+NK80ZR1BtrlceZKro3NpQJfedlVorJcUBe4YOK4PL+/GLTwlRR2FHHF9b9FWO
	exDA==
Received: by 10.205.117.141 with SMTP id fm13mr105370bkc.125.1342168274776;
	Fri, 13 Jul 2012 01:31:14 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-112.unitymediagroup.de.
	[95.222.160.112])
	by mx.google.com with ESMTPS id fu8sm4214355bkc.5.2012.07.13.01.31.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Jul 2012 01:31:14 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Jul 2012 10:30:13 +0200
Message-Id: <1342168240-7760-6-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1342168240-7760-1-git-send-email-schnitzeltony@googlemail.com>
References: <1342168240-7760-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe, V2 05/32] systemd.bbclass: add *-systemd packages to RRECOMMENDS
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
X-List-Received-Date: Fri, 13 Jul 2012 08:42:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-systemd/classes/systemd.bbclass |   26 ++++++++++++++++++++++----
 1 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/meta-systemd/classes/systemd.bbclass b/meta-systemd/classes/systemd.bbclass
index 2e585c3..fce314d 100644
--- a/meta-systemd/classes/systemd.bbclass
+++ b/meta-systemd/classes/systemd.bbclass
@@ -180,8 +180,21 @@ python populate_packages_prepend () {
 					raise bb.build.FuncFailed, "\n\nFor package %s SYSTEMD_SERVICE-entry %s does not exist" % \
 						(pkg_systemd, service)
 
-	# *-systemd packages get RDEPENDS to systemd and their base package
-	def systemd_add_rdepends(pkg_systemd):
+	"""     Setup rdepends / rrecommmends as:
+
+                -----------------------------
+                |  pkg_systemd_base: 'foo'  |
+                -----------------------------
+                           |    ^
+                           |    |                 --------------
+               rrecommends |    | rdepends        | 'systemd'  |
+                           |    |               ->--------------
+                           V    |              / rdepends
+                ------------------------------/
+                | pkg_systemd: 'foo-systemd' |
+                ------------------------------
+	"""
+	def systemd_add_rdepends_rrecommends(pkg_systemd):
 		# RDEPENDS_${pkg_systemd} += pkg_systemd_base systemd
 		rdepends = d.getVar('RDEPENDS_' + pkg_systemd, 1) or ""
 		rdepends_arr = rdepends.split()
@@ -195,13 +208,18 @@ python populate_packages_prepend () {
 		if len(rdepends_arr) == 0 and pkg_systemd != '${PN}' and not pkg_systemd_base in rdepends:
 			rdepends = '%s %s' % (rdepends, pkg_systemd_base)
 		d.setVar('RDEPENDS_' + pkg_systemd, rdepends)
-
+		# RRECOMMENDS_${pkg_systemd_base} += pkg_systemd systemd
+		rrecommends = d.getVar('RRECOMMENDS_' + pkg_systemd_base, 1) or ""
+		# not rrecommending myself AND avoid double entries
+		if pkg_systemd != pkg_systemd_base and not pkg_systemd in rrecommends.split():
+			rrecommends = '%s %s' % (rrecommends, pkg_systemd)
+		d.setVar('RRECOMMENDS_' + pkg_systemd_base, rrecommends)
 
 	# run all modifications once when creating package
 	if os.path.exists('${D}'):
 		for pkg_systemd in d.getVar('SYSTEMD_PACKAGES', 1).split():
 			if get_package_var(d, 'SYSTEMD_SERVICE', pkg_systemd) != "":
 				systemd_generate_package_scripts(pkg_systemd)
-				systemd_add_rdepends(pkg_systemd)
+				systemd_add_rdepends_rrecommends(pkg_systemd)
 		systemd_check_services()
 }
-- 
1.7.6.5



