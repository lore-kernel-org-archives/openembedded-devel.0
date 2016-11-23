Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3071171AB8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 09:22:35 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id x23so663987pgx.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 01:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=66vNGmr1LzA33bI6ssDDpSDCFqax9ie2bHOD6f9D0kg=;
	b=bmr9TyBh2nR1xGvBK9sw5AwR7TcG6A9Peh6WlKNLsjWd44ushIWgjPN8R8zsHOSzRG
	/Jfz9PC9JfmRRq3Y2m7AfJ0mmZx8dAnJg5kVxcLC9t4Y265Gi91l7SqSLOMjkh7zdbzo
	Ll1i4yElmMs1hQh3ZJfqNueK++6wLqYnfGekKZ5FNcIt8baN76epzbsFRfT4HQOqTnU1
	GqXbZPGovdTfQL4eJV+3wjIfVYAuHv5KcskHsJ8iy0H7dUtHASciniCrg0G4B58sgjYA
	RKp/p4S2plFthSoh3M+c4fs1MdQ36N01lPlvJTPl8Xtj0Dq9sc+uJJtubbF0muN+0+VH
	vA8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=66vNGmr1LzA33bI6ssDDpSDCFqax9ie2bHOD6f9D0kg=;
	b=Wl0/lXt7gMyU6XsknFosnXvXxZ0GiKhehltb/tZ05nJQFI3fNR7C48uPurSu0BxQUH
	3rpzRc/fhNR6l5KWLZgMsTecx78PpcNfb01iQpwocDPZinkUD4s/f4iHXztaQP4kcdbk
	W3X2qtGShNt6ObDim0ZFh21J2Oz24ouTLl0dvk2FjVF7fApJsliQh1jAwZuF6V6krcwc
	enFyqgoDL9uZe2Anu9k/q8anp7FAjth2pYdUzHSmjKQ2OzYzONMxlGQpLiAEj9nTUZy7
	jTeNUi203iLY4lo08pGmQFF+yna73jKsohWesHoZs37kBkbdJvVxUY04EFqaHGf5NVRd
	gnPw==
X-Gm-Message-State: AKaTC00cswIgvJO1G87SIyf75gEPjaJjhvlyWxFeoodUB3JjyO2ASUPVFac9okiSCtFspA==
X-Received: by 10.99.67.7 with SMTP id q7mr3530693pga.45.1479892956784;
	Wed, 23 Nov 2016 01:22:36 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	u23sm51056087pfg.86.2016.11.23.01.22.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Nov 2016 01:22:36 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Nov 2016 01:21:46 -0800
Message-Id: <20161123092209.23699-26-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161123092209.23699-1-raj.khem@gmail.com>
References: <20161123092209.23699-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 26/49] ne10: Update to latest
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
X-List-Received-Date: Wed, 23 Nov 2016 09:22:35 -0000

* Patch to build with clang
* license checksum changed due to Copyright year change
https://github.com/kraj/Ne10/commit/fee112eb2278469e7cfe2516dffa2ecfa5ad4c9a

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...01-CMakeLists.txt-Remove-mthumb-interwork.patch | 44 ++++++++++++++++++++++
 meta-oe/recipes-support/ne10/ne10_1.2.1.bb         |  9 +++--
 2 files changed, 50 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-support/ne10/ne10/0001-CMakeLists.txt-Remove-mthumb-interwork.patch

diff --git a/meta-oe/recipes-support/ne10/ne10/0001-CMakeLists.txt-Remove-mthumb-interwork.patch b/meta-oe/recipes-support/ne10/ne10/0001-CMakeLists.txt-Remove-mthumb-interwork.patch
new file mode 100644
index 0000000..9f2faaa
--- /dev/null
+++ b/meta-oe/recipes-support/ne10/ne10/0001-CMakeLists.txt-Remove-mthumb-interwork.patch
@@ -0,0 +1,44 @@
+From 8a0d1cbfcc0649b2696c9cf20f877366de259ce3 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 12 Nov 2016 18:15:26 +0000
+Subject: [PATCH] CMakeLists.txt: Remove -mthumb-interwork
+
+This option is meaningless with aapcs ABI
+which is the default for Linux and android
+for armv7+ architectures
+
+As an aside it helps in compiling with clang
+where this option is absent
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ CMakeLists.txt | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 784a5a8..68da920 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -117,7 +117,7 @@ if(ANDROID_PLATFORM)
+ 
+     # Adding cflags for armv7. Aarch64 does not need such flags.
+     if(${NE10_TARGET_ARCH} STREQUAL "armv7")
+-        set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -mthumb-interwork -mthumb -march=armv7-a -mfloat-abi=${FLOAT_ABI} -mfpu=vfp3")
++        set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -mthumb -march=armv7-a -mfloat-abi=${FLOAT_ABI} -mfpu=vfp3")
+         if(NE10_ARM_HARD_FLOAT)
+             # "--no-warn-mismatch" is needed for linker to suppress linker error about not all functions use VFP register to pass argument, eg.
+             #   .../arm-linux-androideabi/bin/ld: error: ..../test-float.o
+@@ -138,8 +138,8 @@ if(ANDROID_PLATFORM)
+     ${CMAKE_C_FLAGS}")
+ elseif(GNULINUX_PLATFORM)
+     if("${NE10_TARGET_ARCH}" STREQUAL "armv7")
+-      set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -mthumb-interwork -mthumb -march=armv7-a -mfpu=vfp3 -funsafe-math-optimizations")
+-      set(CMAKE_ASM_FLAGS "${CMAKE_C_FLAGS} -mthumb-interwork -mthumb -march=armv7-a -mfpu=neon")
++      set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -mthumb -march=armv7-a -mfpu=vfp3 -funsafe-math-optimizations")
++      set(CMAKE_ASM_FLAGS "${CMAKE_C_FLAGS} -mthumb -march=armv7-a -mfpu=neon")
+       # Turn on asm optimization for Linux on ARM v7.
+       set(NE10_ASM_OPTIMIZATION on)
+     endif()
+-- 
+1.8.3.1
+
diff --git a/meta-oe/recipes-support/ne10/ne10_1.2.1.bb b/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
index de97982..2fb9d64 100644
--- a/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
+++ b/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
@@ -1,13 +1,16 @@
 DESCRIPTION = "Library containing NEON-optimized implementations for a common set of functions"
 HOMEPAGE = "http://projectne10.github.io/Ne10/"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=463ac0a7d64edc2b787c4206635ca2b1"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e7fe20c9be97be5579e3ab5d92d3a218"
 SECTION = "libs"
 
-SRC_URI = "git://github.com/projectNe10/Ne10.git"
-SRCREV = "a08b29d88e3c94d32b5b8f827e7fcf0bc2b34ac2"
+SRC_URI = "git://github.com/projectNe10/Ne10.git \
+           file://0001-CMakeLists.txt-Remove-mthumb-interwork.patch \
+"
+SRCREV = "18c4c982a595dad069cd8df4932aefb1d257591f"
 
 S = "${WORKDIR}/git"
+PV .= "gitr+${SRCPV}"
 
 inherit cmake
 
-- 
2.10.2


