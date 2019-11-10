Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id C1D057F948
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Nov 2019 22:05:13 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id 8so11346931wmo.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Nov 2019 14:05:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=VT2uH2w5aznguMRA1x8qH4lJolto0Bzo29IdPbDjxak=;
	b=dvzG3IuvuOaWNe7KDMbN6GajL2SO7WSr4DQI5VNUZgalyQNe1f1PQ8KYG3D+KTJQd7
	y//lUSV3jDQ8HpDmcbz4OIOQgSfFwxxyRDrEBiBHQFVb38ofOnsbWTbjWLWGrKjOw42M
	OEVVlh8utEMz7VutWlQ/titWR1UVmeB5++q0bwmGWo0NedDZ7aD6cK4VxPGhVXmnaekw
	NYgE2UAWkaAZh3ig068ThG6+iGzHgWHKt3K1WiHd5ZIzTZQI/OJL+TGROY51hyrONto+
	/AHSXTqislABWWNKevkW/5qseADhUbxpiHL2xUqxQdJo7zfOCputmLiDJJBfJIcmHNEP
	imRQ==
X-Gm-Message-State: APjAAAU02xZlDjcAUqTD65tlflZkAXhAMQfsZD0HEfyjGzdimyYpnsyz
	rTcRNLglDQYv/crEtxSS52MO1JOo
X-Google-Smtp-Source: APXvYqz6TDtnqbJOwGo/oJ8UISkuxEaqMDjuh2tFRCRHPp8vCbQhADTkYbI7JpHMNgSlieX/QYrS1A==
X-Received: by 2002:a7b:c055:: with SMTP id u21mr18340653wmc.55.1573423513969; 
	Sun, 10 Nov 2019 14:05:13 -0800 (PST)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	t24sm29925375wra.55.2019.11.10.14.05.13
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 10 Nov 2019 14:05:13 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Nov 2019 22:05:09 +0000
Message-Id: <20191110220510.10077-4-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20191110220510.10077-1-git@andred.net>
References: <20191110220510.10077-1-git@andred.net>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 4/5] nodejs: use OE-provided compiler flags (arm)
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
X-List-Received-Date: Sun, 10 Nov 2019 22:05:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This overrides yocto-provided build flags with its own, e.g we get
    arm-poky-linux-musleabi-g++  -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a7 \
                                 ... \
                                  -march=armv7-a -mfpu=neon -mfloat-abi=hard -marm

Causing the latter to override the former, and compiler warnings:
    cc1plus: warning: switch '-mcpu=cortex-a7' conflicts with '-march=armv7-a' switch

Patch this out, so that yocto-provided flags take precedence.
Note that in reality the same should probably be done for all the other
supported architectures, too.

Note that this also switches to Thumb(2) mode (in my case). No obvious
problems have been noted during compilation or runtime.

Upstream-Status: Inappropriate [oe-specific]
Signed-off-by: André Draszik <git@andred.net>
---
 .../0007-v8-don-t-override-ARM-CFLAGS.patch   | 102 ++++++++++++++++++
 .../recipes-devtools/nodejs/nodejs_10.17.0.bb |   1 +
 2 files changed, 103 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0007-v8-don-t-override-ARM-CFLAGS.patch

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0007-v8-don-t-override-ARM-CFLAGS.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0007-v8-don-t-override-ARM-CFLAGS.patch
new file mode 100644
index 000000000..eb2cbfb8b
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0007-v8-don-t-override-ARM-CFLAGS.patch
@@ -0,0 +1,102 @@
+From 47ee5cc5501289205d3e8e9f27ea9daf18cebac1 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
+Date: Sat, 9 Nov 2019 14:45:30 +0000
+Subject: [PATCH] v8: don't override ARM CFLAGS
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This overrides yocto-provided build flags with its own, e.g we get
+    arm-poky-linux-musleabi-g++  -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a7 \
+                                 ... \
+                                  -march=armv7-a -mfpu=neon -mfloat-abi=hard -marm
+
+Causing the latter to override the former, and compiler warnings:
+    cc1plus: warning: switch '-mcpu=cortex-a7' conflicts with '-march=armv7-a' switch
+
+Patch this out, so that yocto-provided flags take precedence.
+Note that in reality the same should probably be done for all the other
+supported architectures, too.
+
+Note that this also switches to Thumb(2) mode (in my case). No obvious
+problems have been noted during compilation or runtime.
+
+Upstream-Status: Inappropriate [oe-specific]
+Signed-off-by: André Draszik <git@andred.net>
+---
+ deps/v8/gypfiles/toolchain.gypi | 52 ++-------------------------------
+ 1 file changed, 2 insertions(+), 50 deletions(-)
+
+diff --git a/deps/v8/gypfiles/toolchain.gypi b/deps/v8/gypfiles/toolchain.gypi
+index 910a212..1390b15 100644
+--- a/deps/v8/gypfiles/toolchain.gypi
++++ b/deps/v8/gypfiles/toolchain.gypi
+@@ -199,31 +199,7 @@
+         'target_conditions': [
+           ['_toolset=="host"', {
+             'conditions': [
+-              ['v8_target_arch==host_arch', {
+-                # Host built with an Arm CXX compiler.
+-                'conditions': [
+-                  [ 'arm_version==7', {
+-                    'cflags': ['-march=armv7-a',],
+-                  }],
+-                  [ 'arm_version==7 or arm_version=="default"', {
+-                    'conditions': [
+-                      [ 'arm_fpu!="default"', {
+-                        'cflags': ['-mfpu=<(arm_fpu)',],
+-                      }],
+-                    ],
+-                  }],
+-                  [ 'arm_float_abi!="default"', {
+-                    'cflags': ['-mfloat-abi=<(arm_float_abi)',],
+-                  }],
+-                  [ 'arm_thumb==1', {
+-                    'cflags': ['-mthumb',],
+-                  }],
+-                  [ 'arm_thumb==0', {
+-                    'cflags': ['-marm',],
+-                  }],
+-                ],
+-              }, {
+-                # 'v8_target_arch!=host_arch'
++              ['v8_target_arch!=host_arch', {
+                 # Host not built with an Arm CXX compiler (simulator build).
+                 'conditions': [
+                   [ 'arm_float_abi=="hard"', {
+@@ -242,31 +218,7 @@
+           }],  # _toolset=="host"
+           ['_toolset=="target"', {
+             'conditions': [
+-              ['v8_target_arch==target_arch', {
+-                # Target built with an Arm CXX compiler.
+-                'conditions': [
+-                  [ 'arm_version==7', {
+-                    'cflags': ['-march=armv7-a',],
+-                  }],
+-                  [ 'arm_version==7 or arm_version=="default"', {
+-                    'conditions': [
+-                      [ 'arm_fpu!="default"', {
+-                        'cflags': ['-mfpu=<(arm_fpu)',],
+-                      }],
+-                    ],
+-                  }],
+-                  [ 'arm_float_abi!="default"', {
+-                    'cflags': ['-mfloat-abi=<(arm_float_abi)',],
+-                  }],
+-                  [ 'arm_thumb==1', {
+-                    'cflags': ['-mthumb',],
+-                  }],
+-                  [ 'arm_thumb==0', {
+-                    'cflags': ['-marm',],
+-                  }],
+-                ],
+-              }, {
+-                # 'v8_target_arch!=target_arch'
++              ['v8_target_arch!=target_arch', {
+                 # Target not built with an Arm CXX compiler (simulator build).
+                 'conditions': [
+                   [ 'arm_float_abi=="hard"', {
+-- 
+2.23.0.rc1
+
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_10.17.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_10.17.0.bb
index 7c3728cc6..b189d2247 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_10.17.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_10.17.0.bb
@@ -19,6 +19,7 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://0001-Disable-running-gyp-files-for-bundled-deps.patch \
            file://0004-Make-compatibility-with-gcc-4.8.patch \
            file://0005-Link-atomic-library.patch \
+           file://0007-v8-don-t-override-ARM-CFLAGS.patch \
            "
 SRC_URI_append_class-target = " \
            file://0002-Using-native-torque.patch \
-- 
2.23.0.rc1


