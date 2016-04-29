Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 7A89A76A51
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Apr 2016 05:58:12 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="6093838"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 29 Apr 2016 13:58:12 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 24D2E42AC854
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Apr 2016 13:58:11 +0800 (CST)
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Fri, 29 Apr 2016 13:58:10 +0800
From: Li Xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 29 Apr 2016 08:58:08 +0300
Message-ID: <1461909488-1844-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
X-yoursite-MailScanner-ID: 24D2E42AC854.AF6D3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: lixin.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-qt5][PATCH] qtchooser: add new recipe
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
X-List-Received-Date: Fri, 29 Apr 2016 05:58:13 -0000
Content-Type: text/plain

qtchooser is a wrapper used to select between Qt binary versions.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../0001-Makefile-install-the-man-dir.patch        | 35 ++++++++++++++++++++++
 recipes-qt/qtchooser/qtchooser_39.bb               | 24 +++++++++++++++
 2 files changed, 59 insertions(+)
 create mode 100644 recipes-qt/qtchooser/qtchooser/0001-Makefile-install-the-man-dir.patch
 create mode 100644 recipes-qt/qtchooser/qtchooser_39.bb

diff --git a/recipes-qt/qtchooser/qtchooser/0001-Makefile-install-the-man-dir.patch b/recipes-qt/qtchooser/qtchooser/0001-Makefile-install-the-man-dir.patch
new file mode 100644
index 0000000..8e8e1c6
--- /dev/null
+++ b/recipes-qt/qtchooser/qtchooser/0001-Makefile-install-the-man-dir.patch
@@ -0,0 +1,35 @@
+From 3f142e100cc3dd69b816ce79152760c823cb86e9 Mon Sep 17 00:00:00 2001
+From: Li Xin <lixin.fnst@cn.fujitsu.com>
+Date: Fri, 29 Apr 2016 12:41:34 +0900
+Subject: [PATCH] Makefile: install the man dir
+
+upstream-status: backported
+
+Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
+---
+ Makefile | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/Makefile b/Makefile
+index 20b9100..1fd8cd3 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1,5 +1,6 @@
+ prefix = /usr
+ bindir = $(prefix)/bin
++MKDIR  = mkdir -p
+ TOOLS = assistant \
+ 	designer \
+ 	lconvert \
+@@ -56,6 +57,8 @@ install:
+ 	case `uname -s` in Darwin) \
+ 	    for tool in $(MACTOOLS); do ln -sf qtchooser "$(INSTALL_ROOT)$(bindir)/$$tool"; done \
+ 	;; esac
++	$(MKDIR) $(INSTALL_ROOT)$(prefix)/share/man/man1
++	install -m 644 -p doc/qtchooser.1 $(INSTALL_ROOT)$(prefix)/share/man/man1
+ 
+ uninstall:
+ 	cd src/qtchooser && $(MAKE) uninstall
+-- 
+1.8.4.2
+
diff --git a/recipes-qt/qtchooser/qtchooser_39.bb b/recipes-qt/qtchooser/qtchooser_39.bb
new file mode 100644
index 0000000..7fceb9c
--- /dev/null
+++ b/recipes-qt/qtchooser/qtchooser_39.bb
@@ -0,0 +1,24 @@
+DESCRIPTION = "Wrapper to select between Qt development binary versions"
+HOMEPAGE = "http://macieira.org/qtchooser"
+LICENSE = "LGPLv2 | GPLv3"
+SRC_URI = "http://macieira.org/qtchooser/${BP}-g4717841.tar.gz \
+           file://0001-Makefile-install-the-man-dir.patch"
+SRC_URI[md5sum] = "fcf1b5e8373147e48ce72b9c1ffe3d10"
+SRC_URI[sha256sum] = "4681d0561bf96599bf9bf5eb25103d07ee8f045f31576dc2e72b8529587a67c6"
+
+LIC_FILES_CHKSUM = " \
+    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
+    file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
+"
+S = "${WORKDIR}/${BP}-g4717841"
+
+inherit pkgconfig
+
+do_compile() {
+    oe_runmake
+}
+
+do_install() {
+    oe_runmake install INSTALL_ROOT=${D}
+}
-- 
1.8.4.2




