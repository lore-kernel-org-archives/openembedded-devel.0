Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id C5BB3730B1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 11:57:08 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id i186so56930wmf.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 03:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=To7t8vdm6TJQSmoOR5JJl8hi+CVwwcQ1pszaNpLxexg=;
	b=gxablEDU+EiHx6BJEriBuDemwzsek8GONih6ZqaOqfW9qvfcmpYVWo5/7XQLs0cKeu
	+n8VzxDs7VR9AVzLRhSUQivK2cvk/3fPF7n53iIF5hb+WffV2dqJIL7DNpKRw+U3Huyo
	s49q99qjHVFHedqvjm3RT2LUnKCYEOviqly/o71d++o8eSj9k0HYWiLhNA5gqoOob3H7
	zYKSQRwsUObo4T0VU0HI2AqF0OSDUQg7N63MlVQF1UUsIkPnqxMWPd6eqMPJQtB5bsCA
	cNL75Tb+Qu+vfcrqNQdzLp075yA58aMwYndngkUzJX4q177xajP70Jzl05l+IDGLT7S7
	aMcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=To7t8vdm6TJQSmoOR5JJl8hi+CVwwcQ1pszaNpLxexg=;
	b=DTeY7r2XXt+VFIgEQtZhM9fIiyPUP/RC1KgoeEoxhjXTXddyM5kqw2q4076f52JRsZ
	RhVZUupreDw4BD+x6IRo+a5Lvd2TJKrNhSq5PXoM6xlXUsvt6hXagLlbyhB+RGsU1viu
	BJYtk902IF/mTpWlIx1F10oTKVC+QceI87TqdGI8WiZ/067xq9cjFi2w4GnQlbvtbrCm
	xA9I6gbRqNaaVWsKjmwWloCvgzFeKflWUTZEb910LLL1z/WCfxX7p8Lg07PDkUmPMyeJ
	HwHfHOfFcZBqwpT0GcX3qVZsl8frVc3cb0gNiLYSfhezre4ATQVkZkYdJEMivv/CMTJ2
	B2Tg==
X-Gm-Message-State: AMke39n+nn0hO9Sg/UMFl+o1GEuSYOYbAqm0aEe/UIMmywA431HDKW97l9KibWFhi1vu4w==
X-Received: by 10.28.71.133 with SMTP id m5mr2034648wmi.132.1487764629581;
	Wed, 22 Feb 2017 03:57:09 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	l140sm2273974wmg.12.2017.02.22.03.57.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Feb 2017 03:57:08 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Feb 2017 12:57:07 +0100
Message-Id: <20170222115707.14711-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.11.1
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: [PATCH] android-tools: add libcap dependency and fix build on big endian systems
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
X-List-Received-Date: Wed, 22 Feb 2017 11:57:11 -0000

* add dependency on libcap to fix:
  android-tools/5.1.1.r37-r0/git/system/core/adb/adb.c:39:28: fatal error: sys/capability.h: No such file or directory
   #include <sys/capability.h>
                            ^
* add patch from buildroot to fix build with newer glibc and on
  bit-endian systems
  android-tools/5.1.1.r37-r0/git/system/core/adb/usb_linux_client.c:38:25: error: initializer element is not constant
    #define cpu_to_le32(x)  htole32(x)
                            ^

* and also disable thumb to fix:
  http://errors.yoctoproject.org/Errors/Details/133881/

* drop default apply=yes for the .patch files

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../android-tools/fix-big-endian-build.patch       | 39 ++++++++++++++++++++++
 .../android-tools/android-tools_5.1.1.r37.bb       | 23 ++++++++-----
 2 files changed, 53 insertions(+), 9 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/fix-big-endian-build.patch

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/fix-big-endian-build.patch b/meta-oe/recipes-devtools/android-tools/android-tools/fix-big-endian-build.patch
new file mode 100644
index 000000000..8deaf3a3d
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/fix-big-endian-build.patch
@@ -0,0 +1,39 @@
+Fix build on big endian systems
+
+The usb_linux_client.c file defines cpu_to_le16/32 by using the C
+library htole16/32 function calls. However, cpu_to_le16/32 are used
+when initializing structures, i.e in a context where a function call
+is not allowed.
+
+It works fine on little endian systems because htole16/32 are defined
+by the C library as no-ops. But on big-endian systems, they are
+actually doing something, which might involve calling a function,
+causing build failures.
+
+To solve this, we simply open-code cpu_to_le16/32 in a way that allows
+them to be used when initializing structures.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/system/core/adb/usb_linux_client.c
+===================================================================
+--- a/system/core/adb/usb_linux_client.c
++++ b/system/core/adb/usb_linux_client.c
+@@ -34,8 +34,15 @@
+ #define MAX_PACKET_SIZE_FS	64
+ #define MAX_PACKET_SIZE_HS	512
+ 
+-#define cpu_to_le16(x)  htole16(x)
+-#define cpu_to_le32(x)  htole32(x)
++#if __BYTE_ORDER == __LITTLE_ENDIAN
++# define cpu_to_le16(x) (x)
++# define cpu_to_le32(x) (x)
++#else
++# define cpu_to_le16(x) ((((x) >> 8) & 0xffu) | (((x) & 0xffu) << 8))
++# define cpu_to_le32(x) \
++	((((x) & 0xff000000u) >> 24) | (((x) & 0x00ff0000u) >>  8) | \
++	 (((x) & 0x0000ff00u) <<  8) | (((x) & 0x000000ffu) << 24))
++#endif
+ 
+ struct usb_handle
+ {
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
index a9e7d5d82..f39a82ccc 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = " \
     file://${COMMON_LICENSE_DIR}/BSD-2-Clause;md5=8bef8e6712b1be5aa76af1ebde9d6378 \
     file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9 \
 "
-DEPENDS = "libbsd libpcre openssl zlib"
+DEPENDS = "libbsd libpcre openssl zlib libcap"
 
 ANDROID_TAG = "android-5.1.1_r37"
 ANDROID_MIRROR = "android.googlesource.com"
@@ -23,14 +23,15 @@ SRC_URI = " \
     git://${LIBHARDWARE_REPO};name=libhardware;protocol=https;nobranch=1;destsuffix=git/hardware/libhardware;tag=${ANDROID_TAG} \
     git://${LIBSELINUX_REPO};name=libselinux;protocol=https;nobranch=1;destsuffix=git/external/libselinux;tag=${ANDROID_TAG} \
     git://${BUILD_REPO};name=build;protocol=https;nobranch=1;destsuffix=git/build;tag=${ANDROID_TAG} \
-    file://remove-selinux-android.patch;apply=yes \
-    file://use-capability.patch;apply=yes \
-    file://use-local-socket.patch;apply=yes \
-    file://preserve-ownership.patch;apply=yes \
-    file://mkbootimg-Add-dt-parameter-to-specify-DT-image.patch;apply=yes \
-    file://remove-bionic-android.patch;apply=yes \
-    file://define-shell-command.patch;apply=yes \
-    file://implicit-declaration-function-strlcat-strlcopy.patch;apply=yes \
+    file://remove-selinux-android.patch \
+    file://use-capability.patch \
+    file://use-local-socket.patch \
+    file://preserve-ownership.patch \
+    file://mkbootimg-Add-dt-parameter-to-specify-DT-image.patch \
+    file://remove-bionic-android.patch \
+    file://define-shell-command.patch \
+    file://implicit-declaration-function-strlcat-strlcopy.patch \
+    file://fix-big-endian-build.patch \
     file://android-tools-adbd.service \
     file://.gitignore;subdir=git \
     file://adb.mk;subdir=${BPN} \
@@ -43,6 +44,10 @@ SRC_URI = " \
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/${BPN}"
 
+# http://errors.yoctoproject.org/Errors/Details/133881/
+ARM_INSTRUCTION_SET_armv4 = "arm"
+ARM_INSTRUCTION_SET_armv5 = "arm"
+
 inherit systemd
 
 SYSTEMD_SERVICE_${PN} = "android-tools-adbd.service"
-- 
2.11.1


