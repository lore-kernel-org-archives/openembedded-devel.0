Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 0F0A465CAF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Dec 2014 09:32:24 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="44948455"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 12 Dec 2014 17:29:05 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sBC9W0Jp012328
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Dec 2014 17:32:00 +0800
Received: from localhost.localdomain (10.167.226.35) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 12 Dec 2014 17:32:23 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 12 Dec 2014 17:31:35 +0800
Message-ID: <1418376695-7152-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.35]
Subject: [meta-oe][PATCH] system-setup-keyboard: add new recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Dec 2014 09:32:34 -0000
Content-Type: text/plain

system-setup-keyboard is a daemon to monitor the keyboard layout
configured in /etc/sysconfig/keyboard and transfer this into
the matching xorg.conf.d snippet.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 ...modify-path-of-python-and-add-v-parameter.patch | 30 ++++++++++++++++++++++
 .../system-setup-keyboard_0.8.8.bb                 | 26 +++++++++++++++++++
 2 files changed, 56 insertions(+)
 create mode 100644 meta-oe/recipes-support/system-setup-keyboard/files/0001-modify-path-of-python-and-add-v-parameter.patch
 create mode 100644 meta-oe/recipes-support/system-setup-keyboard/system-setup-keyboard_0.8.8.bb

diff --git a/meta-oe/recipes-support/system-setup-keyboard/files/0001-modify-path-of-python-and-add-v-parameter.patch b/meta-oe/recipes-support/system-setup-keyboard/files/0001-modify-path-of-python-and-add-v-parameter.patch
new file mode 100644
index 0000000..4b56935
--- /dev/null
+++ b/meta-oe/recipes-support/system-setup-keyboard/files/0001-modify-path-of-python-and-add-v-parameter.patch
@@ -0,0 +1,30 @@
+From 3d2bbd78e5583ef4290b3a64e4ecc19bebd4a698 Mon Sep 17 00:00:00 2001
+From: Li xin <lixin.fnst@cn.fujitsu.com>
+Date: Tue, 11 Nov 2014 14:20:29 +0900
+Subject: [PATCH] modify path of python and add -v parameter
+
+fix error: ImportError: No module named system_config_keyboard.keyboard_models
+
+Upstream-Status: pending
+
+Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 55c5b60..c528f36 100644
+--- a/Makefile
++++ b/Makefile
+@@ -5,7 +5,7 @@ MAN_SECTION=1
+ all: system-setup-keyboard
+ 
+ keyboards.h:
+-	python get_layouts.py > keyboards.h
++	/usr/bin/python -v get_layouts.py > keyboards.h
+ 
+ system-setup-keyboard: keyboards.h system-setup-keyboard.c
+ 	$(CC) system-setup-keyboard.c `pkg-config --cflags --libs glib-2.0` $(CFLAGS) -o system-setup-keyboard
+-- 
+1.8.4.2
+
diff --git a/meta-oe/recipes-support/system-setup-keyboard/system-setup-keyboard_0.8.8.bb b/meta-oe/recipes-support/system-setup-keyboard/system-setup-keyboard_0.8.8.bb
new file mode 100644
index 0000000..3b34167
--- /dev/null
+++ b/meta-oe/recipes-support/system-setup-keyboard/system-setup-keyboard_0.8.8.bb
@@ -0,0 +1,26 @@
+SUMMARY = "xorg.conf keyboard layout callout"
+DESCRIPTION = "system-setup-keyboard is a daemon to monitor the keyboard layout configured in\
+/etc/sysconfig/keyboard and transfer this into the matching xorg.conf.d snippet."
+
+HOMEPAGE = "https://git.fedorahosted.org/git/system-setup-keyboard.git"
+SECTION = "Applications/System"
+
+SRC_URI = " \
+    https://git.fedorahosted.org/cgit/${PN}.git/snapshot/${BP}.tar.gz \
+    file://0001-modify-path-of-python-and-add-v-parameter.patch \
+"
+SRC_URI[md5sum] = "399003968ccc739cddd9cc370af377a0"
+SRC_URI[sha256sum] = "1ef6ef79c3588e85d7f42e99eb80a2e459f966284cf029c2d6fc1b645abcb860"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=bf57969a59612c5aca007b340c49d3a2"
+
+DEPENDS = "glib-2.0"
+
+do_install() {
+    oe_runmake install DESTDIR=${D}
+    install -d ${D}/etc/X11/xorg.conf.d
+    touch ${D}/etc/X11/xorg.conf.d/00-system-setup-keyboard.conf
+}
+
+FILES_${PN} += "${systemd_unitdir}/system/${PN}.service"
-- 
1.8.4.2


