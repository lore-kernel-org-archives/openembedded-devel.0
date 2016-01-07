Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id ED0A773183
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Jan 2016 14:49:07 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id u188so101340851wmu.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Jan 2016 06:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=WBZ+2FrPSPrlOb1YCS7RCNSYfXmcUfRFBuQ6zQexbJg=;
	b=KGOpspzlxNTvPeaqVBiPiOEAh52n0m3wg1cPtjBifRqVA2eih6gzfOu4YczGnahuHV
	wkn3AH+c/Wikrpg5GHMAZhUEiyRjnJw1BmCzqwCFLI+hTLGdfjDSnC4BkOIkNLQkR5I0
	cxX/37EhAudbqWwx9iXdUKRNbQYwwKiQii/7D5uOdGepeBcS7wDwpyVLO0XaogneQch3
	ote3Yww8yTDXnE3qG3oNXLvN8mbpN3euC0uXZ6ZmAS/RMkrHXSYjpeF7aPJsERGOOAPS
	4cl3rkFEWmMTbp+7IdT+jat/oFdsXMdmuWTlFVKE1GO8j6QZeaT9yUCL1jlE0stBaK9o
	QxJw==
X-Received: by 10.194.6.37 with SMTP id x5mr104022690wjx.178.1452178146269;
	Thu, 07 Jan 2016 06:49:06 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	ft4sm101175958wjb.37.2016.01.07.06.49.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Jan 2016 06:49:03 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Jan 2016 15:49:27 +0100
Message-Id: <1452178167-12674-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <20160107105634.GA2512@jama>
References: <20160107105634.GA2512@jama>
Subject: [PATCHv3][meta-oe] xterm: 308 -> 320
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
X-List-Received-Date: Thu, 07 Jan 2016 14:49:08 -0000

From: Li xin <lixin.fnst@cn.fujitsu.com>

Upgrade xterm from 308 to 320.

1) Modify LIC_FILES_CHKSUM,since the date in it has been changed, But the LICENSE has not been changed.
2) Fix WARNING: QA Issue: xterm rdepends on libxinerama, but it isn't a build dependency? [build-deps]

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/xorg-app/xterm_308.bb | 30 --------------------------
 meta-oe/recipes-graphics/xorg-app/xterm_320.bb | 30 ++++++++++++++++++++++++++
 2 files changed, 30 insertions(+), 30 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/xorg-app/xterm_308.bb
 create mode 100644 meta-oe/recipes-graphics/xorg-app/xterm_320.bb

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_308.bb b/meta-oe/recipes-graphics/xorg-app/xterm_308.bb
deleted file mode 100644
index 9198ca2..0000000
--- a/meta-oe/recipes-graphics/xorg-app/xterm_308.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-require recipes-graphics/xorg-app/xorg-app-common.inc
-SUMMARY = "xterm is the standard terminal emulator for the X Window System"
-DEPENDS = "libxaw xproto xextproto libxext libxau libxpm ncurses"
-
-LIC_FILES_CHKSUM = "file://xterm.h;beginline=3;endline=31;md5=540cf18ccc16bc3c5fea40d2ab5d8d51"
-
-SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz"
-
-SRC_URI[md5sum] = "1ec76c1a79a70de4f82c24c527ef4626"
-SRC_URI[sha256sum] = "c5bf7377a5bf35e34b7e3a4ab6c848fbc89e8901dd98f8b237662a72bdbfe372"
-
-EXTRA_OECONF = " --x-includes=${STAGING_INCDIR} \
-                 --x-libraries=${STAGING_LIBDIR} \
-                 FREETYPE_CONFIG=${STAGING_BINDIR_CROSS}/freetype-config \
-                 --disable-imake \
-                 --disable-rpath-hack \
-                 --disable-setuid"
-
-B = "${S}"
-
-do_configure() {
-    gnu-configize --force
-    sed -e "s%/usr/contrib/X11R6%${STAGING_LIBDIR}%g" -i configure
-    oe_runconf
-}
-
-FILES_${PN} += " /usr/lib/X11"
-
-PACKAGECONFIG ?= ""
-PACKAGECONFIG[xft] = "--enable-freetype,--disable-freetype,libxft fontconfig"
diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_320.bb b/meta-oe/recipes-graphics/xorg-app/xterm_320.bb
new file mode 100644
index 0000000..f67d890
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_320.bb
@@ -0,0 +1,30 @@
+require recipes-graphics/xorg-app/xorg-app-common.inc
+SUMMARY = "xterm is the standard terminal emulator for the X Window System"
+DEPENDS = "libxaw xproto xextproto libxext libxau libxinerama libxpm ncurses"
+
+LIC_FILES_CHKSUM = "file://xterm.h;beginline=3;endline=31;md5=ee6435019d00b884cde8d7ba2b318ff0"
+
+SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz"
+
+SRC_URI[md5sum] = "0d7f0e6390d132ae59876b3870e5783d"
+SRC_URI[sha256sum] = "a60dbb574334c081425fa30f011cd9f571e3be7a91e2a84e252461798bce24a7"
+
+PACKAGECONFIG ?= ""
+PACKAGECONFIG[xft] = "--enable-freetype,--disable-freetype,libxft fontconfig"
+
+EXTRA_OECONF = " --x-includes=${STAGING_INCDIR} \
+                 --x-libraries=${STAGING_LIBDIR} \
+                 FREETYPE_CONFIG=${STAGING_BINDIR_CROSS}/freetype-config \
+                 --disable-imake \
+                 --disable-rpath-hack \
+                 --disable-setuid"
+
+B = "${S}"
+
+do_configure() {
+    gnu-configize --force
+    sed -e "s%/usr/contrib/X11R6%${STAGING_LIBDIR}%g" -i configure
+    oe_runconf
+}
+
+FILES_${PN} += "${libdir}/X11"
-- 
2.7.0


