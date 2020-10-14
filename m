Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web10.934.1602637594876521260
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Oct 2020 18:06:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dIg5sRsO;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id t21so1383703eds.6
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2020 18:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=lZC6ZzIIwhY7TPXsmcHZh+k+ou0LkuR27t4OUfGcZhQ=;
        b=dIg5sRsOPZu5oDYRhr07mxzcvHdF+5f6XphcS6ziy27nW30OIxZ7FTZTTwDuq8/xue
         DnT2gxE5aRHBwGlbIUG8L8viR9g00OUzNuOarWbeZR3dyEH0iuoz9fQi17AR2GmSwtnc
         162aVYfOJkAdejp57OOCMfIW4KwLa/fxu1nU96uAffsJALCWP4Y9BZUAy8k1jHccynS3
         ZzPCOSGSP7UYVYxXSTijb7zhJujB6NdmtOQKK1NBwipmkN5l4xhLyc3aub+fzR2xQkss
         aYt/88e79uIW4HHssx+12nYKSTyhRfPUAJtgwwq6xS1RPCw9A7VGeuBLMfSf2x2wNtM1
         Z6/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lZC6ZzIIwhY7TPXsmcHZh+k+ou0LkuR27t4OUfGcZhQ=;
        b=CL5d+/stP8aYEtRJz7iOp2Fmm3fRbZTT5ALFVoLzxJe01+cvAPwy9BP+2r4lY32wc4
         kYV0q2L1qyB6DedT+eoaiMRmKKNdu8i84dcxi4VPUTWSaGKqlmDYUxHBe9AIPoxofU8h
         aOehWyONS0ZN/E7K6sMhiKZKiJ59sbmKlD7DGWNCpsl8suEZskBT+Te3D3xULfi5Ay01
         JzfNev5VHi2ddayj9QPIHMuqeFmsDYXJam0ppQHdEPfTFb3k1ygkLVQsIxEqr+X8pFjb
         xO6DHLGfNxaB+zZWRGxnlz+KphVcU2a9a0IoG4wQFOzAO9VZVW8g2KceQrw7DHf9CiIy
         vJQg==
X-Gm-Message-State: AOAM530jF//Q3LdVKhRYHUrkGAcqQ3cHYkTJYhzvl5TqdtS6xxh4Fi7o
	t2md0L7UrL7JjMRBW5l/QQlqRsr4BsI=
X-Google-Smtp-Source: ABdhPJwVh6MjY5nU+hHIn88QFhSj9W2bFH5ZRtF0sXieMUU0UeJqgJLS1uDvt2xBdOcuqRQQoR/g+g==
X-Received: by 2002:a05:6402:100e:: with SMTP id c14mr3859edu.365.1602637592957;
        Tue, 13 Oct 2020 18:06:32 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f375957a175fbdd89b9baae.dip0.t-ipconnect.de. [2003:f0:7f37:5957:a175:fbdd:89b9:baae])
        by smtp.gmail.com with ESMTPSA id i20sm592594edv.96.2020.10.13.18.06.31
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 18:06:32 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 4/8] wxwidgets: Add what's necessary so that consumers of wxwidgets_git can find it
Date: Wed, 14 Oct 2020 03:06:13 +0200
Message-Id: <20201014010617.1086948-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201014010617.1086948-1-schnitzeltony@gmail.com>
References: <20201014010617.1086948-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When I created wxwidgets recipe I had no test case for consumers of wxwidgets.
This changed now and it showed that wxwidgets is building fine but is
completely useless: It is a collection of libraries that are impossible to
find for other recipes.

To get rid wxwidgets now inherits binconfig: wxwidgets creates wx-config that
at least cmake relies upon. wx-config content had to be adjusted:

* As is it is a symlink to a useless file: Make it a file with usable contents
* To let wx-config report correct libraries a patch was added disabling cross
  magic not working here.
* Set full sysroot paths for includedir/libdir/bindir so that sstate can adjust
  them when creating recipe-sysroot for recipes depending on wxwidgets

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...able-cross-magic-it-does-not-work-fo.patch | 35 +++++++++++++++++++
 .../wxwidgets/wxwidgets_git.bb                | 25 +++++++++++--
 2 files changed, 58 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-extended/wxwidgets/wxwidgets/0001-wx-config.in-Disable-cross-magic-it-does-not-work-fo.patch

diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets/0001-wx-config.in-Disable-cross-magic-it-does-not-work-fo.patch b/meta-oe/recipes-extended/wxwidgets/wxwidgets/0001-wx-config.in-Disable-cross-magic-it-does-not-work-fo.patch
new file mode 100644
index 000000000..b3b9e79c5
--- /dev/null
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets/0001-wx-config.in-Disable-cross-magic-it-does-not-work-fo.patch
@@ -0,0 +1,35 @@
+From a071243763f4b06fc7e71f541c49cecf380b6f27 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Sun, 11 Oct 2020 22:16:55 +0200
+Subject: [PATCH] wx-config.in: Disable cross magic - it does not work for us
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+E.g 'wx-config --libs' appends a '-Linux' to all libraries (e.g
+-lwx_gtk3u_xrc-3.1 is reported as -lwx_gtk3u_xrc-3.1-Linux) which is wrong and
+make projects depending on wxwidgets fail.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ wx-config.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/wx-config.in b/wx-config.in
+index d132e3182f..d0d162e8a3 100755
+--- a/wx-config.in
++++ b/wx-config.in
+@@ -396,7 +396,7 @@ get_mask()
+ }
+ 
+ # Returns true if this script is for a cross compiled config.
+-is_cross()  { [ "x@cross_compiling@" = "xyes" ]; }
++is_cross()  { [ "xno" = "xyes" ]; }
+ 
+ 
+ # Determine the base directories we require.
+-- 
+2.26.2
+
diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets_git.bb b/meta-oe/recipes-extended/wxwidgets/wxwidgets_git.bb
index 95a6e8527..555399f74 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets_git.bb
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets_git.bb
@@ -10,7 +10,7 @@ LICENSE = "wxWidgets"
 LIC_FILES_CHKSUM = "file://docs/licence.txt;md5=981f50a934828620b08f44d75db557c6"
 
 inherit ${@bb.utils.contains('PACKAGECONFIG', 'qt', 'cmake_qt5', 'cmake', d)}
-inherit features_check lib_package
+inherit features_check lib_package binconfig
 
 # All toolkit-configs except 'no_gui' require x11 explicitly (see toolkit.cmake)
 REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG', 'no_gui', '', 'x11', d)}"
@@ -21,7 +21,10 @@ DEPENDS += " \
     tiff \
 "
 
-SRC_URI = "git://github.com/wxWidgets/wxWidgets.git"
+SRC_URI = " \
+    git://github.com/wxWidgets/wxWidgets.git \
+    file://0001-wx-config.in-Disable-cross-magic-it-does-not-work-fo.patch \
+"
 PV = "3.1.3"
 SRCREV= "8a40d23b27ed1c80b5a2ca9f7e8461df4fbc1a31"
 S = "${WORKDIR}/git"
@@ -67,6 +70,24 @@ PACKAGECONFIG[opengl] = ",,libglu"
 PACKAGECONFIG[sdl_audio] = "-DwxUSE_LIBSDL=ON,-DwxUSE_LIBSDL=OFF,libsdl2"
 PACKAGECONFIG[webkit] = "-DwxUSE_WEBVIEW_WEBKIT=ON,-DwxUSE_WEBVIEW_WEBKIT=OFF,webkitgtk,,,no_gui"
 
+do_compile_append() {
+    # if not at re-compile
+    if [ -L ${B}/wx-config ]; then
+        # ${B}/wx-config is a symlink for build and not needed after compile
+        # So for our purposes do:
+        # 1. make a file out of wx-config so that binconfig.bbclass detects it
+        # 2. make sure we do not move the file used for compiling into sysroot
+        cp --remove-destination `readlink ${B}/wx-config | sed 's:inplace-::'` ${B}/wx-config
+    fi
+    # 3. Set full sysroot paths so sstate can translate them when setting
+    #    up wxwidgets's consumer sysroots
+    sed -i \
+        -e 's,^includedir=.*,includedir="${STAGING_INCDIR}",g' \
+        -e 's,^libdir=.*",libdir="${STAGING_LIBDIR}",g' \
+        -e 's,^bindir=.*",bindir="${STAGING_BINDIR}",g' \
+        ${B}/wx-config
+}
+
 do_install_append() {
     # do not ship bindir if empty
     rmdir --ignore-fail-on-non-empty ${D}${bindir}
-- 
2.26.2

