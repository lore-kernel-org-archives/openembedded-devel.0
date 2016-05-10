Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id BE19971E63
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 May 2016 05:37:03 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="6383877"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 10 May 2016 13:36:54 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id AB1CF42B561A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 May 2016 13:36:54 +0800 (CST)
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Tue, 10 May 2016 13:36:54 +0800
From: Li Xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 10 May 2016 08:36:43 +0300
Message-ID: <1462858603-1895-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <CANwerB2JV=wDngzfxLzTehOHwQ95=VcfYQsD2RfeAm6hcyE8tw@mail.gmail.com>
References: <CANwerB2JV=wDngzfxLzTehOHwQ95=VcfYQsD2RfeAm6hcyE8tw@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
X-yoursite-MailScanner-ID: AB1CF42B561A.AF76A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: lixin.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-qt5][PATCH v2] qtchooser: add new recipe
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
X-List-Received-Date: Tue, 10 May 2016 05:37:06 -0000
Content-Type: text/plain

qtchooser is a wrapper used to select between Qt binary versions.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../0001-Makefile-install-the-man-dir.patch        | 35 ++++++++++++++++++++++
 recipes-qt/qtchooser/qtchooser_git.bb              | 30 +++++++++++++++++++
 2 files changed, 65 insertions(+)
 create mode 100644 recipes-qt/qtchooser/qtchooser/0001-Makefile-install-the-man-dir.patch
 create mode 100644 recipes-qt/qtchooser/qtchooser_git.bb

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
diff --git a/recipes-qt/qtchooser/qtchooser_git.bb b/recipes-qt/qtchooser/qtchooser_git.bb
new file mode 100644
index 0000000..68b1c80
--- /dev/null
+++ b/recipes-qt/qtchooser/qtchooser_git.bb
@@ -0,0 +1,30 @@
+DESCRIPTION = "Wrapper to select between Qt development binary versions"
+HOMEPAGE = "http://macieira.org/qtchooser"
+LICENSE = "LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | GPL-3.0"
+SRC_URI = "git://code.qt.io/qt/qtchooser.git;branch=master \
+           file://0001-Makefile-install-the-man-dir.patch"
+
+LIC_FILES_CHKSUM = " \
+    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
+    file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
+"
+S = "${WORKDIR}/git"
+SRCREV = "4717841185d34bbe450e3b24445f2d35e3325a6a"
+PV = "39+git${SRCREV}"
+
+inherit pkgconfig
+
+do_compile() {
+    oe_runmake
+}
+
+do_install() {
+    oe_runmake install INSTALL_ROOT=${D}
+    #install configure file
+    install -d ${D}${sysconfdir}/xdg/qtchooser/
+    install -m 0644 ${S}/tests/auto/qtchooser/testdata/config2/qtchooser/*.conf \
+               ${D}${sysconfdir}/xdg/qtchooser/
+    install -m 0644 ${S}/tests/auto/qtchooser/testdata/default/qtchooser/default.conf \
+               ${D}${sysconfdir}/xdg/qtchooser/
+}
-- 
1.8.4.2




