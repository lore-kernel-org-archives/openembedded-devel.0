Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web12.14122.1611341772432883075
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Jan 2021 10:56:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qtec.com header.s=google header.b=Kqfx1YjM;
 spf=pass (domain: qtec.com, ip: 209.85.167.51, mailfrom: daniel@qtec.com)
Received: by mail-lf1-f51.google.com with SMTP id b26so8940526lff.9
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 Jan 2021 10:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cJno+XxHW7xEiXL+MNIQMMfydkE4ThlmTFXeUN8sWKA=;
        b=Kqfx1YjMw+w9PIfWCUetXViyBipF+4W2pv4zWAN0ftCpJ43WXHmGTT/yI3heRX9iqn
         VYMlha0DPxsRo6VgE4sYfYhgbxcvDy83uv37TNHsH2IsYjW01ULyY3UoAOe5F1rDYur6
         0hzQsaTo9cj1sISXQE4Icucx/MNst7IHhgsljv6FOjgC1Cr6kTu+xCsF/NWA5CnRA431
         bWXARCW0/HcvsZ5ABwgDgMOEy9xHydWEaTHYRlM3eoclt/zLcN9HGPWhx2xCUa8o3wvk
         sK7YRBifExbSsL6WRvaVd55EiXVCblY8dgmCz8ycWVVfqzAf76T+Wqh0G0F06ftA1Q5W
         GkrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cJno+XxHW7xEiXL+MNIQMMfydkE4ThlmTFXeUN8sWKA=;
        b=dVdkfPLAvN5I5wVLPVNnVx71D8x3A0yxLatR7jtOMNAkOIJxQfLxg8sccmlMYYKGOs
         5lWXEulh9ry0QbEfA2XrQescz5ZRZB1P6WnxR/EReudqvMBu4ZhWP6jocgxq64r/4XxM
         OvZtNnQCtyI3I0kz5EcmJVhN+0BqLSP7FHO/z4pbF7+m3K8+whSWOq2afIZ1mYep5llw
         aGNH91Ro+7ohkdyC0OAwmCCuxnIV3SqQGiyMYugNzCkLzZk1RrsZZ2XpLaobBQXCFDC0
         0DtXYeFZ2O4kNR6vyi+fa/aiWWFxaszPt6dpOJt3jxBAIbN6M+jXpKF5LqddHeZUhXy/
         lXYw==
X-Gm-Message-State: AOAM531KJAtPeuT8BHI9dW2kU/OnvxWWNsC8cDGtc+6Zu7I9yC3/NKYY
	6m5Umuy57npBJ5GjJHpoHXyXjDDmvoyQ2XVR0NsH224AXQEfUoQXxtpiaPP+Zn3rEu/rl8igsd3
	CeWlnOLf+gg+ZssOhAHfzI1c70my6W9OImR9808jttkH2FyUrNTPobwR6EBtekMwxkrhNasbjp2
	vrW9bqnWCKId7YnP3A
X-Google-Smtp-Source: ABdhPJxow8mRV6EWPRC7KGwPjKnkZNEnWlw1n0hBmuiRt52EHRW+P99r8UekvdHbKcbWZiwPUxYhtg==
X-Received: by 2002:ac2:57c9:: with SMTP id k9mr2821401lfo.165.1611341770163;
        Fri, 22 Jan 2021 10:56:10 -0800 (PST)
Return-Path: <daniel@qtec.com>
Received: from localhost (80-167-86-46-cable.dk.customer.tdc.net. [80.167.86.46])
        by smtp.gmail.com with ESMTPSA id u30sm977800lfc.238.2021.01.22.10.56.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Jan 2021 10:56:09 -0800 (PST)
From: "Daniel Gomez" <daniel@qtec.com>
To: openembedded-devel@lists.openembedded.org
Cc: Daniel Gomez <daniel@qtec.com>
Subject: [oe][meta-oe][PATCH] zbar: Remove support for 0.10 version
Date: Fri, 22 Jan 2021 19:56:00 +0100
Message-Id: <20210122185600.75080-1-daniel@qtec.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove support for the old ZBar project no longer maintained.

Signed-off-by: Daniel Gomez <daniel@qtec.com>
---
 .../0001-make-relies-GNU-extentions.patch     | 36 -------------------
 meta-oe/recipes-support/zbar/zbar_0.10.bb     | 31 ----------------
 2 files changed, 67 deletions(-)
 delete mode 100644 meta-oe/recipes-support/zbar/zbar/0001-make-relies-GNU-extentions.patch
 delete mode 100644 meta-oe/recipes-support/zbar/zbar_0.10.bb

diff --git a/meta-oe/recipes-support/zbar/zbar/0001-make-relies-GNU-extentions.patch b/meta-oe/recipes-support/zbar/zbar/0001-make-relies-GNU-extentions.patch
deleted file mode 100644
index c93af3296..000000000
--- a/meta-oe/recipes-support/zbar/zbar/0001-make-relies-GNU-extentions.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 224507bc4b6e58f7a6e445bfebfb59d6b8d78bd6 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 2 Dec 2016 17:38:51 -0800
-Subject: [PATCH] make relies GNU extentions
-
-We get errors like
-`%'-style pattern rules are a GNU make extension
-
-Disable this warning, since we use gmake with OE
-anyway
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
---- a/configure.ac
-+++ b/configure.ac
-@@ -3,7 +3,7 @@ AC_PREREQ([2.61])
- AC_INIT([zbar], [0.10], [spadix@users.sourceforge.net])
- AC_CONFIG_AUX_DIR(config)
- AC_CONFIG_MACRO_DIR(config)
--AM_INIT_AUTOMAKE([1.10 -Wall -Werror foreign subdir-objects std-options dist-bzip2])
-+AM_INIT_AUTOMAKE([1.10 -Wall -Wno-error foreign subdir-objects std-options dist-bzip2])
- AC_CONFIG_HEADERS([include/config.h])
- AC_CONFIG_SRCDIR(zbar/scanner.c)
- LT_PREREQ([2.2])
-@@ -47,7 +47,7 @@ AC_DEFINE_UNQUOTED([LIB_VERSION_REVISION
-   [Library revision])
-
- AM_CPPFLAGS="-I$srcdir/include"
--AM_CFLAGS="-Wall -Wno-parentheses -Werror"
-+AM_CFLAGS="-Wall -Wno-parentheses"
- AM_CXXFLAGS="$AM_CFLAGS"
- AC_SUBST([AM_CPPFLAGS])
- AC_SUBST([AM_CFLAGS])
diff --git a/meta-oe/recipes-support/zbar/zbar_0.10.bb b/meta-oe/recipes-support/zbar/zbar_0.10.bb
deleted file mode 100644
index 181d7ae43..000000000
--- a/meta-oe/recipes-support/zbar/zbar_0.10.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-DESCRIPTION = "2D barcode scanner toolkit."
-SECTION = "graphics"
-LICENSE = "LGPL-2.1"
-
-DEPENDS = "pkgconfig intltool-native libpng jpeg"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=4015840237ca7f0175cd626f78714ca8"
-
-PV = "0.10+git${SRCPV}"
-
-#  iPhoneSDK-1.3.1 tag
-SRCREV = "67003d2a985b5f9627bee2d8e3e0b26d0c474b57"
-SRC_URI = "git://github.com/ZBar/Zbar \
-           file://0001-make-relies-GNU-extentions.patch \
-"
-S = "${WORKDIR}/git"
-
-inherit autotools pkgconfig
-
-PACKAGECONFIG = "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
-
-PACKAGECONFIG[x11] = "--with-x,-without-x,libxcb libx11 libsm libxau libxext libxv libice libxdmcp"
-
-EXTRA_OECONF = "--without-imagemagick --without-qt --without-python --disable-video --without-gtk"
-
-CPPFLAGS += "-Wno-error"
-
-do_install_append() {
-    #remove usr/bin if empty
-    rmdir ${D}${bindir}
-}
--
2.29.2

