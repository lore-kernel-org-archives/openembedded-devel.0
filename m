Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f51.google.com (mail-pl0-f51.google.com
	[209.85.160.51])
	by mail.openembedded.org (Postfix) with ESMTP id 7E42174EB2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jun 2018 19:19:46 +0000 (UTC)
Received: by mail-pl0-f51.google.com with SMTP id c41-v6so5744285plj.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jun 2018 12:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=8yK/aLyI+nyUkNwc40NEo42O/WUWfVGKuvM93c51rBU=;
	b=R7tf7g5GFl5mu6vewD5YMlzV+DEU3tKYcMeR88c5GSRANUOwrFLkkqJtmSzIrVBQ+R
	FdIS/Zg91H36WhUY0U3t5MBEJWVPxVKg7tPWBqj1Rv3X6pHpwKSfTmWDgEzYkbUkpeZb
	M3+xqIV5Z/83HJQxWlBnTEKAHeI0UUCW4Sm6MyBKkdv1cgm+ZmFlt72KBs4gC9UF/7y0
	BHxXKhGVvaxRKP2QBw8quss7mAaCWan9MVZd8cKcJHfSc60p6A1+fUCHckOg0249DwgW
	vmhl1ti5k6AyKOn95kjTc9Cwu77nlCYFc2Y02K9ThzwpwkRCqc3nak+95gM2yY4Q6BO1
	jvhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=8yK/aLyI+nyUkNwc40NEo42O/WUWfVGKuvM93c51rBU=;
	b=rDC+/88MGXSiK5XFijS7sJq5uli7cVMY7HCXcZsWxLP7/qz7jp01vlvNHORA0WaFuO
	x13ZTQ/offJSLdwKUGuQ4r3I/X5SAz7wn8oWPRPnVsina6bYFrmV59iyQhdPQuBQpABh
	I/P6LN6g4jMrg4yUXYGO0KuOhxmSvnsBccZgahmHjbmpZiUX/05Af2l2PGNoVeuuFvAx
	h/DfPh7Sc3gLue8jNOs5kblFsEMwI8rFpdtmhZCVCFzlij9CEMgouxS5pnfsFm3TKksQ
	yyZVhzMYxa6zxXTycGUHue6MPAgBdNO93weutvdEP3SQTpRzdIfOgHSRyA1rcygHu2md
	cATg==
X-Gm-Message-State: APt69E0W/ZFi79wOQvvdaqy1+Rve6HfXYFsYLL/ESQ37edcbJPT780St
	rIESOzqnF+zxoovweOlbmXPcYA==
X-Google-Smtp-Source: ADUXVKIs6RCku6rrKt1eyrgu/NUipI3DQNaYNI8TZ+9B7Z59wXkMxWkC2DyFpQd5OmyYLGDiVRsyrQ==
X-Received: by 2002:a17:902:7785:: with SMTP id
	o5-v6mr9678530pll.42.1529867987069; 
	Sun, 24 Jun 2018 12:19:47 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::91a0])
	by smtp.gmail.com with ESMTPSA id
	m11-v6sm36700461pfj.25.2018.06.24.12.19.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 24 Jun 2018 12:19:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 Jun 2018 12:18:42 -0700
Message-Id: <20180624191845.31082-17-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180624191845.31082-1-raj.khem@gmail.com>
References: <20180624191845.31082-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 17/20] civetweb: Fix paths to librt and libm, use -l linker option
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
X-List-Received-Date: Sun, 24 Jun 2018 19:19:46 -0000

Fixes build where it pokes for libraries on host system

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-librt-and-libm-during-native-compil.patch | 42 -------------------
 ...t-Link-librt-and-libm-using-l-option.patch | 40 ++++++++++++++++++
 .../civetweb/civetweb_git.bb                  | 10 ++---
 3 files changed, 45 insertions(+), 47 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/civetweb/civetweb/0001-Test-Fix-missing-librt-and-libm-during-native-compil.patch
 create mode 100644 meta-networking/recipes-connectivity/civetweb/civetweb/0001-Unittest-Link-librt-and-libm-using-l-option.patch

diff --git a/meta-networking/recipes-connectivity/civetweb/civetweb/0001-Test-Fix-missing-librt-and-libm-during-native-compil.patch b/meta-networking/recipes-connectivity/civetweb/civetweb/0001-Test-Fix-missing-librt-and-libm-during-native-compil.patch
deleted file mode 100644
index 401cf39ad8..0000000000
--- a/meta-networking/recipes-connectivity/civetweb/civetweb/0001-Test-Fix-missing-librt-and-libm-during-native-compil.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From cd93e2c538cecb3192fd24c0fbd6e834d0c47eec Mon Sep 17 00:00:00 2001
-From: Krzysztof Kozlowski <krzk@kernel.org>
-Date: Wed, 18 Apr 2018 14:11:52 +0200
-Subject: [PATCH] Unittest: Fix missing librt and libm during native compilation
-
-civetweb looks for librt and libm in weird places and for native build
-this fails:
-
-    | ../third_party/lib/libcheck.a(check.c.o): In function `tcase_create':
-    | build/tmp/work/x86_64-linux/civetweb-native/1.10-r0/build/third_party/src/check-unit-test-framework/src/check.c:145: undefined reference to `floor'
-    | build/tmp/work/x86_64-linux/civetweb-native/1.10-r0/build/third_party/src/check-unit-test-framework/src/check.c:148: undefined reference to `floor'
-
-These are needed dependencies so try regular system linkage in such
-case.
-
-Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
----
- unittest/CMakeLists.txt | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/unittest/CMakeLists.txt b/unittest/CMakeLists.txt
-index f34b2e0e4ce4..05d25702178c 100644
---- a/unittest/CMakeLists.txt
-+++ b/unittest/CMakeLists.txt
-@@ -60,10 +60,14 @@ endif()
- find_package(LibM)
- if (LIBM_FOUND)
-   set(CHECK_LIBRARIES "${CHECK_LIBRARIES};LIBM::LIBM")
-+else()
-+  set(CHECK_LIBRARIES "${CHECK_LIBRARIES};-lm")
- endif()
- find_package(LibRt)
- if (LIBRT_FOUND)
-   set(CHECK_LIBRARIES "${CHECK_LIBRARIES};LIBRT::LIBRT")
-+else()
-+  set(CHECK_LIBRARIES "${CHECK_LIBRARIES};-lrt")
- endif()
- 
- # Build the C unit tests
--- 
-2.7.4
-
diff --git a/meta-networking/recipes-connectivity/civetweb/civetweb/0001-Unittest-Link-librt-and-libm-using-l-option.patch b/meta-networking/recipes-connectivity/civetweb/civetweb/0001-Unittest-Link-librt-and-libm-using-l-option.patch
new file mode 100644
index 0000000000..eecbc14682
--- /dev/null
+++ b/meta-networking/recipes-connectivity/civetweb/civetweb/0001-Unittest-Link-librt-and-libm-using-l-option.patch
@@ -0,0 +1,40 @@
+From 21e9a4bb214648ffd43c66b535fbf096bfcc9f4f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 24 Jun 2018 00:04:37 -0700
+Subject: [PATCH] Unittest: Link librt and libm using -l option
+
+cmake'ry forces full path to .so files when found using
+find_package and since we have proper sysrooted toolchain
+-lm and -lrt is all we need
+
+Upstream-Status: Inappropriate [Cross compile specific]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ unittest/CMakeLists.txt | 10 ++--------
+ 1 file changed, 2 insertions(+), 8 deletions(-)
+
+diff --git a/unittest/CMakeLists.txt b/unittest/CMakeLists.txt
+index c4cdf229..e1b63caf 100644
+--- a/unittest/CMakeLists.txt
++++ b/unittest/CMakeLists.txt
+@@ -57,14 +57,8 @@ elseif (WIN32)
+ else()
+   set(CHECK_LIBRARIES "${CHECK_INSTALL_DIR}/lib/libcheck.a")
+ endif()
+-find_package(LibM)
+-if (LIBM_FOUND)
+-  set(CHECK_LIBRARIES "${CHECK_LIBRARIES};LIBM::LIBM")
+-endif()
+-find_package(LibRt)
+-if (LIBRT_FOUND)
+-  set(CHECK_LIBRARIES "${CHECK_LIBRARIES};LIBRT::LIBRT")
+-endif()
++set(CHECK_LIBRARIES "${CHECK_LIBRARIES};-lm")
++set(CHECK_LIBRARIES "${CHECK_LIBRARIES};-lrt")
+ 
+ # Build the C unit tests
+ add_library(shared-c-unit-tests STATIC shared.c)
+-- 
+2.18.0
+
diff --git a/meta-networking/recipes-connectivity/civetweb/civetweb_git.bb b/meta-networking/recipes-connectivity/civetweb/civetweb_git.bb
index 45d6ec8864..471a665099 100644
--- a/meta-networking/recipes-connectivity/civetweb/civetweb_git.bb
+++ b/meta-networking/recipes-connectivity/civetweb/civetweb_git.bb
@@ -4,12 +4,12 @@ HOMEPAGE = "https://github.com/civetweb/civetweb"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=6f28fdcba0dda735eed62bac6a397562"
 
-SRCREV = "b8148afe8fa44c64f75e69655c4fdc9095565568"
+SRCREV = "19f31ba8dd8443e86c7028a4b4c37f4b299aa68c"
 PV = "1.10+git${SRCPV}"
-SRC_URI = "git://github.com/civetweb/civetweb.git"
-SRC_URI_append_class-native = " \
-    file://0001-Test-Fix-missing-librt-and-libm-during-native-compil.patch \
-"
+SRC_URI = "git://github.com/civetweb/civetweb.git \
+           file://0001-Unittest-Link-librt-and-libm-using-l-option.patch \
+          "
+
 S = "${WORKDIR}/git"
 
 # civetweb supports building with make or cmake (although cmake lacks few features)
-- 
2.18.0


