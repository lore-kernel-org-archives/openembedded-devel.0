Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 30E4177C73
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Apr 2017 06:06:46 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id v75so22853974qkb.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Apr 2017 23:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=6M9JeMl5NX59nBpWQ9AB+J3XpRDXI2hAwgFN/e/OVzg=;
	b=HOStYmIXbW6qGhm/D8yC5zhonAbOhua7cZClnGvWlUJ89HwHWflMy+R1Hy+Qr4HrcM
	5rGT1MJ6iOSUEI+LzOKx72FBWPiqhDGoUssc98HgiD6EyXmWaJstrdxI6pBE0VVPLTsU
	ZyFILAPUl5Usy9Ulugj+H5zycBqLcHyeh5otPuf3SwEwOSknxTXDiaOOLwo4akVL9BhI
	geoXdt/MBMujSwRuA/wOqgYknufqRiDPLhqL0gw8c1DBJdVoshz1NB4HqdrAd89VY2NO
	fNYSx04wzWnVjwU2JpX0JIdXJVg9iehkDmwN78BHL+ogKRgPRbTdswM3dDu9eMMBD+CQ
	S4LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6M9JeMl5NX59nBpWQ9AB+J3XpRDXI2hAwgFN/e/OVzg=;
	b=pegxlQ7lVsDIwbotXu3HK306y3fslGF9UeaplswmACZifMqJEcseVHO9r5scmvZB/y
	SFtUI/QHH82cbRQjP6w+QPH8LfLIlwH825zOWYM8aeBBBlSdOHfFeEpub0hUzHytWXrH
	NG/9W/z3yZnJs7hM5ASQFfzThaHi9xEi3sjGfNQQR+vOaifM6pNyA0ti+abStgGfh2Ip
	WnuRWIQiy8v92iGdcv9WJh7FeTbeja4XZyPoowYGiMe7vUyifhZpdgTYM88YVQuf9QHI
	I0X46sQeXTKOsZlbG1+p/1/UPI9GhyIiURAvrVpZ/h0cRGimnwatsA+vkT7gJ1fxK/Uc
	7WvA==
X-Gm-Message-State: AFeK/H38ofI/+sPcJ3hvl0Ti1mCtIo7f2l0IBX5g0QnNEFtnlCy3eGj/hExfi2UeL1gqaw==
X-Received: by 10.55.130.135 with SMTP id e129mr50231713qkd.111.1491890807639; 
	Mon, 10 Apr 2017 23:06:47 -0700 (PDT)
Received: from eos.sys.comcast.net (a-96-118-179-133.sys.comcast.net.
	[96.118.179.133])
	by smtp.gmail.com with ESMTPSA id i2sm2403607qke.15.2017.04.10.23.06.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 10 Apr 2017 23:06:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Apr 2017 06:06:39 +0000
Message-Id: <1491890799-4808-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-browser][PATCH] chromium-wayland: Fix build on armv7ve/rpi3
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
X-List-Received-Date: Tue, 11 Apr 2017 06:06:48 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../chromium/chromium-wayland_53.0.2785.143.bb        |  1 +
 recipes-browser/chromium/chromium.inc                 |  1 +
 .../remove-armv7-a-from-options.patch                 | 19 +++++++++++++++++++
 recipes-browser/chromium/files/armv7ve/include.gypi   | 11 ++++++++++-
 4 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 recipes-browser/chromium/chromium/chromium-wayland/remove-armv7-a-from-options.patch

diff --git a/recipes-browser/chromium/chromium-wayland_53.0.2785.143.bb b/recipes-browser/chromium/chromium-wayland_53.0.2785.143.bb
index ab52bc2..f31c509 100644
--- a/recipes-browser/chromium/chromium-wayland_53.0.2785.143.bb
+++ b/recipes-browser/chromium/chromium-wayland_53.0.2785.143.bb
@@ -9,6 +9,7 @@ SRC_URI += "\
         file://0003-Remove-hard-coded-values-for-CC-and-CXX.patch \
         file://0004-Create-empty-i18n_process_css_test.html-file-to-avoi.patch \
         file://0005-Override-root-filesystem-access-restriction.patch \
+        file://chromium-wayland/remove-armv7-a-from-options.patch \
 	file://chromium-wayland/0007-Workaround-for-glib-related-build-error-with-ozone-w.patch \
         file://chromium-wayland/0011-Replace-readdir_r-with-readdir.patch \
         file://chromium-wayland/remove-Werror.patch \
diff --git a/recipes-browser/chromium/chromium.inc b/recipes-browser/chromium/chromium.inc
index cc390eb..f7e56eb 100644
--- a/recipes-browser/chromium/chromium.inc
+++ b/recipes-browser/chromium/chromium.inc
@@ -16,6 +16,7 @@ CHROMIUM_BUILD_TYPE ??= "Release"
 inherit gettext pythonnative
 
 ARMFPABI_armv7a = "${@bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', 'arm_float_abi=hard', 'arm_float_abi=softfp', d)}"
+ARMFPABI_armv7ve = "${@bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', 'arm_float_abi=hard', 'arm_float_abi=softfp', d)}"
 GYP_DEFINES += "${ARMFPABI} release_extra_cflags='-Wno-error=unused-local-typedefs' sysroot='' \
 	${@bb.utils.contains("AVAILTUNES", "mips", "", "release_extra_cflags='-fno-delete-null-pointer-checks'", d)}"
 GYP_DEFINES_append_x86 = " generate_character_data=0"
diff --git a/recipes-browser/chromium/chromium/chromium-wayland/remove-armv7-a-from-options.patch b/recipes-browser/chromium/chromium/chromium-wayland/remove-armv7-a-from-options.patch
new file mode 100644
index 0000000..9002945
--- /dev/null
+++ b/recipes-browser/chromium/chromium/chromium-wayland/remove-armv7-a-from-options.patch
@@ -0,0 +1,19 @@
+Fix build errors like
+| ../../v8/src/base/ieee754.cc:1:0: error: switch -mcpu=cortex-a7 conflicts with -march=armv7-a switch [-Werror]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: chromium-53.0.2785.143/v8/gypfiles/toolchain.gypi
+===================================================================
+--- chromium-53.0.2785.143.orig/v8/gypfiles/toolchain.gypi
++++ chromium-53.0.2785.143/v8/gypfiles/toolchain.gypi
+@@ -247,9 +247,6 @@
+               ['v8_target_arch==target_arch', {
+                 # Target built with an Arm CXX compiler.
+                 'conditions': [
+-                  [ 'arm_version==7', {
+-                    'cflags': ['-march=armv7-a',],
+-                  }],
+                   [ 'arm_version==7 or arm_version=="default"', {
+                     'conditions': [
+                       [ 'arm_fpu!="default"', {
diff --git a/recipes-browser/chromium/files/armv7ve/include.gypi b/recipes-browser/chromium/files/armv7ve/include.gypi
index 316cf48..9809078 100644
--- a/recipes-browser/chromium/files/armv7ve/include.gypi
+++ b/recipes-browser/chromium/files/armv7ve/include.gypi
@@ -3,7 +3,16 @@
     # Configure for armv7 compilation
     'target_arch': 'arm',
     'armv7': 1,
+    'arm_arch': 'armv7ve',
     'arm_thumb': 1,
     'arm_neon': 1,
-  }, 
+  'cflags!': [
+    # Some components in Chromium (e.g. v8, skia, ffmpeg)
+    # define their own cflags for arm builds that could
+    # conflict with the flags we set here (e.g.
+    # '-mcpu=cortex-a9'). Remove these flags explicitly.
+    '-march=armv7-a',
+    '-mtune=cortex-a8',
+  ],
+  },
 }
-- 
1.9.1


