Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 33E327F274
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Sep 2019 04:37:56 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id e1so1134505pgj.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Sep 2019 21:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=B/hIOJQ4sLjk4G4xPop9zj/WM6hyOOwLaVFVFxoBH+Q=;
	b=roH0w6Os085EB1hsQUa+O31me/QlVPn7HdEZL7Az3Q5RLE440j+nwvZwb4MjjAkwcX
	PwOYrKTAHbaGYM0JTeVy/mGHnOG9V37fzRkd1673jyDJ41a49+Hred62v1qG6/LFrJwZ
	OZX7sZMldtGYjfIlh0eeApAuOR2iNnbPkYCJ3BUIx9/KmywtT510Mzu4t7IhS98Az+g4
	2z1ALchX3pHxKsteVqqu7NvxAM0jY8y3zMZVIUSwC9PGqGd50XU2h6FuXmcZBOZFqER2
	YcluG0KGh3z+554lNFcUUdrjLN95zb8WAPVPQ/6h0MnMwAF40oj7YaZxz+DtmMYpKSt1
	CmFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=B/hIOJQ4sLjk4G4xPop9zj/WM6hyOOwLaVFVFxoBH+Q=;
	b=ThjNYm2V3Kp3FXh4RpEtpefdNFmj+1W0eqibf4cZxx9qEoob+7obbjp9ybjneU2TGm
	JnypfjCSuWAGPmPHfpRFkG5ZTHCsWP0A1msD4CvPDEDESq7nSVCHvY2ln9f2w1u/8z4l
	Y7Cviayjmd7YeesOeQ7uX7x97V7QwHU0+aKuqZzO5QgeudcthmPa0YaV00sjcC5DN2PZ
	cQ0nsqcp/bBdjBrZNgK9+ZaBBlh9oDKMNjcwupm5tbVoD0A8FppCI5tqcAEZoHfb2+hg
	QW7bYurMeXuqE3UaX88uBeYSTqQ9wGoYN7uscr0XNUScnmGK2ZjViNoeNC4sAv8PNL/Y
	1RYw==
X-Gm-Message-State: APjAAAXuXjYQS2hWiRnPhHF7RRShp2lpL/S2n3J1/OfFezPJZC7rpWib
	fZ3I0BK1lcNKgKdH25m8gMHKVwOCr+0=
X-Google-Smtp-Source: APXvYqxe2Luz6r8f902RR9PbOJJG4oufvmIpenAya1CqYveHhPPqW9wNbogJZSqz1RZ1bMBFSkQheQ==
X-Received: by 2002:a63:2254:: with SMTP id t20mr22488535pgm.173.1569818276676;
	Sun, 29 Sep 2019 21:37:56 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	u31sm22513345pgn.93.2019.09.29.21.37.55
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 29 Sep 2019 21:37:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 Sep 2019 21:37:33 -0700
Message-Id: <20190930043733.2840975-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190930043733.2840975-1-raj.khem@gmail.com>
References: <20190930043733.2840975-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 4/4] fontforge: Upgrade to 20190801 release
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
X-List-Received-Date: Mon, 30 Sep 2019 04:37:56 -0000
Content-Transfer-Encoding: 8bit

License-Update: Dropped plugins [1] and gnulib [2]

- Add a fix for musl build to include sys/select.h
- gnulib dependency is not needed anymore
- Disable libuninameslist, recipe is missing in OE

[1] https://github.com/fontforge/fontforge/commit/ed62345e3ad7484cd0bf714f5ef9c7012dad157c#diff-9879d6db96fd29134fc802214163b95a

[2] https://github.com/fontforge/fontforge/commit/51c045a09804c20725527878c753df6ba96dafa8#diff-9879d6db96fd29134fc802214163b95a

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...de-sys-select-on-non-glibc-platforms.patch | 29 +++++++++
 .../fontforge/fontforge_20190413.bb           | 62 -------------------
 .../fontforge/fontforge_20190801.bb           | 46 ++++++++++++++
 3 files changed, 75 insertions(+), 62 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/fontforge/fontforge/0001-include-sys-select-on-non-glibc-platforms.patch
 delete mode 100644 meta-oe/recipes-graphics/fontforge/fontforge_20190413.bb
 create mode 100644 meta-oe/recipes-graphics/fontforge/fontforge_20190801.bb

diff --git a/meta-oe/recipes-graphics/fontforge/fontforge/0001-include-sys-select-on-non-glibc-platforms.patch b/meta-oe/recipes-graphics/fontforge/fontforge/0001-include-sys-select-on-non-glibc-platforms.patch
new file mode 100644
index 0000000000..54ff7b76d2
--- /dev/null
+++ b/meta-oe/recipes-graphics/fontforge/fontforge/0001-include-sys-select-on-non-glibc-platforms.patch
@@ -0,0 +1,29 @@
+From 798f2816130838f3618212291de6ab0ea814c868 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 29 Sep 2019 20:39:02 -0700
+Subject: [PATCH] include sys/select on non-glibc platforms
+
+musl needs sys/select.h for defining fd_set
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ gdraw/gdraw.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gdraw/gdraw.c b/gdraw/gdraw.c
+index 24591b778..217c63140 100644
+--- a/gdraw/gdraw.c
++++ b/gdraw/gdraw.c
+@@ -32,7 +32,7 @@
+ #include "gkeysym.h"
+ #include "ustring.h"
+ 
+-#if __Mac || __FreeBSD__ || __NetBSD__ || __OpenBSD__ || __DragonFly__
++#if __Mac || __FreeBSD__ || __NetBSD__ || __OpenBSD__ || __DragonFly__ || !defined(__GLIBC__)
+ #  include <sys/select.h>
+ #endif
+ 
+-- 
+2.23.0
+
diff --git a/meta-oe/recipes-graphics/fontforge/fontforge_20190413.bb b/meta-oe/recipes-graphics/fontforge/fontforge_20190413.bb
deleted file mode 100644
index ee3bc58bc4..0000000000
--- a/meta-oe/recipes-graphics/fontforge/fontforge_20190413.bb
+++ /dev/null
@@ -1,62 +0,0 @@
-SUMMARY = "A font editor"
-HOMEPAGE = "http://fontforge.github.io/en-US/"
-LICENSE = "BSD-3-Clause & GPLv3"
-LIC_FILES_CHKSUM = " \
-    file://COPYING.gplv3;md5=d32239bcb673463ab874e80d47fae504 \
-    file://LICENSE;md5=5f9637af5c51f2e8d06385ef38eb48f1 \
-"
-
-DEPENDS = "glib-2.0 pango giflib tiff libxml2 jpeg python libtool uthash gnulib gettext-native"
-DEPENDS_append_class-target = " libxi"
-
-inherit autotools pkgconfig pythonnative distro_features_check gettext gtk-icon-cache mime
-
-REQUIRED_DISTRO_FEATURES_append_class-target = " x11"
-
-SRC_URI = "git://github.com/${BPN}/${BPN}.git"
-# tag 20190413
-SRCREV = "7f6f1d021fdfea7789972f9534ba3241616d8dfc"
-S = "${WORKDIR}/git"
-
-EXTRA_OECONF_append_class-native = " with_x=no"
-
-do_configure_prepend() {
-    # uthash sources are expected in uthash/src
-    currdir=`pwd`
-    cd ${S}
-
-    mkdir -p uthash/src
-    cp ${STAGING_INCDIR}/ut*.h uthash/src
-
-    # avoid bootstrap cloning gnulib on every configure
-    cat >.gitmodules <<EOF
-[submodule "gnulib"]
-       path = gnulib
-       url = git://git.sv.gnu.org/gnulib
-EOF
-    cp -rf ${STAGING_DATADIR}/gnulib ${S}
-
-    # --force to avoid errors on reconfigure e.g if recipes changed we depend on
-    # | bootstrap: running: libtoolize --quiet
-    # | libtoolize:   error: 'libltdl/COPYING.LIB' exists: use '--force' to overwrite
-    # | ...
-    ./bootstrap --force
-
-    cd $currdir
-}
-
-PACKAGES =+ "${PN}-python"
-
-RPROVIDES_${PN}-dbg += "${PN}-python-dbg"
-
-FILES_${PN} += " \
-    ${datadir}/appdata \
-    ${datadir}/metainfo \
-    ${datadir}/mime \
-"
-
-FILES_${PN}-python = "${PYTHON_SITEPACKAGES_DIR} ${datadir}/${BPN}/python"
-RDEPENDS_${PN}-python = "python"
-
-# for e.g kde's oxygen-fonts
-BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-graphics/fontforge/fontforge_20190801.bb b/meta-oe/recipes-graphics/fontforge/fontforge_20190801.bb
new file mode 100644
index 0000000000..25c2ce81f8
--- /dev/null
+++ b/meta-oe/recipes-graphics/fontforge/fontforge_20190801.bb
@@ -0,0 +1,46 @@
+SUMMARY = "A font editor"
+HOMEPAGE = "http://fontforge.github.io/en-US/"
+LICENSE = "BSD-3-Clause & GPLv3"
+LIC_FILES_CHKSUM = " \
+    file://COPYING.gplv3;md5=d32239bcb673463ab874e80d47fae504 \
+    file://LICENSE;md5=d042f3d2a8fd7208b704a499168e3c89 \
+"
+
+DEPENDS = "glib-2.0 pango giflib tiff libxml2 jpeg python libtool uthash gettext-native"
+DEPENDS_append_class-target = " libxi"
+
+inherit autotools pkgconfig pythonnative distro_features_check gettext gtk-icon-cache mime
+
+REQUIRED_DISTRO_FEATURES_append_class-target = " x11"
+
+# tag 20190801
+SRCREV = "ac635b818e38ddb8e7e2e1057330a32b4e25476e"
+SRC_URI = "git://github.com/${BPN}/${BPN}.git \
+           file://0001-include-sys-select-on-non-glibc-platforms.patch \
+"
+S = "${WORKDIR}/git"
+
+EXTRA_OECONF += "--without-libuninameslist"
+EXTRA_OECONF_append_class-native = " with_x=no"
+
+#do_configure_prepend() {
+# uthash sources are expected in uthash/src
+#    mkdir -p ${S}/uthash/src
+#    cp ${STAGING_INCDIR}/ut*.h ${S}/uthash/src
+#}
+
+PACKAGES =+ "${PN}-python"
+
+RPROVIDES_${PN}-dbg += "${PN}-python-dbg"
+
+FILES_${PN} += " \
+    ${datadir}/appdata \
+    ${datadir}/metainfo \
+    ${datadir}/mime \
+"
+
+FILES_${PN}-python = "${PYTHON_SITEPACKAGES_DIR} ${datadir}/${BPN}/python"
+RDEPENDS_${PN}-python = "python"
+
+# for e.g kde's oxygen-fonts
+BBCLASSEXTEND = "native"
-- 
2.23.0


