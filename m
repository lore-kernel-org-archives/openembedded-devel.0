Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 14CCE7CCB9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Feb 2019 01:40:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x1S1dQge006978
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Feb 2019 17:39:51 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.435.0; Wed, 27 Feb 2019 17:39:20 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 28 Feb 2019 09:39:19 +0800
Message-ID: <1551317959-85504-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH] vim: remove xfce vim bbappend
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Feb 2019 01:40:01 -0000
Content-Type: text/plain

From: Mark Hatle <mark.hatle@windriver.com>

Changing the behavior of a recipe by including a layer is not allowed
by the yocto-check-layer script.

INFO: ======================================================================
INFO: FAIL: test_signatures (common.CommonCheckLayer)
INFO: ----------------------------------------------------------------------
INFO: Traceback (most recent call last):
  File "/poky/scripts/lib/checklayer/cases/common.py", line 53, in test_signatures
    self.fail('Adding layer %s changed signatures.\n%s' % (self.tc.layer['name'], msg))
AssertionError: Adding layer meta-xfce changed signatures.
19 signatures changed, initial differences (first hash before, second after):
   vim:do_install: 7f165dbd724ca0127dfb653ef0ecd8e7fb882713adedfd0e14f59d7f54cb645e -> 6e4a49063534d67f70186bf8bdb313184f42426e2c42b12b127638b586c7ffe8
      bitbake-diffsigs --task vim do_install --signature 7f165dbd724ca0127dfb653ef0ecd8e7fb882713adedfd0e14f59d7f54cb645e

fix by move the logic into recipe vim

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-oe/recipes-support/vim/vim_8.1.0347.bb  | 7 +++++++
 meta-xfce/recipes-support/vim/vim_%.bbappend | 1 -
 meta-xfce/recipes-support/vim/vim_xfce.inc   | 6 ------
 3 files changed, 7 insertions(+), 7 deletions(-)
 delete mode 100644 meta-xfce/recipes-support/vim/vim_%.bbappend
 delete mode 100644 meta-xfce/recipes-support/vim/vim_xfce.inc

diff --git a/meta-oe/recipes-support/vim/vim_8.1.0347.bb b/meta-oe/recipes-support/vim/vim_8.1.0347.bb
index 0705831..654741e 100644
--- a/meta-oe/recipes-support/vim/vim_8.1.0347.bb
+++ b/meta-oe/recipes-support/vim/vim_8.1.0347.bb
@@ -79,6 +79,13 @@ do_install() {
 
     # we use --with-features=big as default
     mv ${D}${bindir}/${BPN} ${D}${bindir}/${BPN}.${BPN}
+
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'true', 'false', d)}; then
+	# The mouse being autoenabled is just annoying in xfce4-terminal (mouse
+	# drag make vim go into visual mode and there is no right click menu),
+	# delete the block.
+	sed -i '/the mouse works just fine/,+4d' ${D}/${datadir}/${BPN}/vimrc
+    fi
 }
 
 PARALLEL_MAKEINST = ""
diff --git a/meta-xfce/recipes-support/vim/vim_%.bbappend b/meta-xfce/recipes-support/vim/vim_%.bbappend
deleted file mode 100644
index 7b44963..0000000
--- a/meta-xfce/recipes-support/vim/vim_%.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-require ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '${BPN}_xfce.inc', '', d)}
diff --git a/meta-xfce/recipes-support/vim/vim_xfce.inc b/meta-xfce/recipes-support/vim/vim_xfce.inc
deleted file mode 100644
index 25403e6..0000000
--- a/meta-xfce/recipes-support/vim/vim_xfce.inc
+++ /dev/null
@@ -1,6 +0,0 @@
-do_install_append() {
-	# The mouse being autoenabled is just annoying in xfce4-terminal (mouse
-	# drag make vim go into visual mode and there is no right click menu),
-	# delete the block.
-	sed -i '/the mouse works just fine/,+4d' ${D}/${datadir}/${BPN}/vimrc
-}
-- 
2.7.4


