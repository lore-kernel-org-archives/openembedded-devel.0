Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id D612B606D0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Mar 2016 11:33:19 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id n186so25785705wmn.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Mar 2016 03:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/1O3wlww4p0mwMg7g2+7OzK0Z2CYPTsYbc9KE9O3a0g=;
	b=mYkvZ+9E6uF7oMgKuiBURouO//eMANDxHhIUCS94/KcQVsMJ41VuMMFP5u6l/gzo9r
	/yM//+Nr6yXvAtILX1Ryj/zBmLaXZMCvylwNztEhWGh1+N8M3YIPYatgdIIuw+RPzl4k
	ibeIC6l14P3M+Vt5pbQgvfQ/DnXybf+wvab8dXjJF5BsINhXHDvhjiE/telL6KdCP24J
	JKcmeZA0gtqGwqk+FLOInK5K3OnC9bJLI2Op9171MnWK5cKRpOM7a1N4Ti5AHZ/prveP
	DNI0QilPD1n8dHugydddXuX6yvUI9+DA4DK9T7cjR1B1E6lo7N5PtCp4lcWK18bx3mBj
	dGZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/1O3wlww4p0mwMg7g2+7OzK0Z2CYPTsYbc9KE9O3a0g=;
	b=mSnz/UAjSmymyXpupzSbGkvTzfdY4tEkNBkrf8ep7zvyIKkUMEGYj7DONeig5wqnP5
	0CtjGtgZPyQTs3a6UuqQKsUwiSEOI/JlMPWtiHi6c2Kq+a9p/46/nh7liMNkL0QNQCoc
	cMpR0JxJnUJpUCK5r5cEVYC7hTHhRkIx0fxxz/3Y/rCCdGgtaPrvrEB08/yvztOHxYF3
	KKRaf5jMU7qe3AFW6RtIvAOs6qqNveW0V3yUf8B2tlnLMSGCPJYD/F8Oxk7wYPa4lptG
	NsSLI+guePMVmo9XNmFr6qEW0tFExJ2GR2Bwo0BvWaLBVqTaTEBk3jJNzqNyHIehVr6i
	vahg==
X-Gm-Message-State: AD7BkJL5UchzhKxOVQlgEUVn4RhWnDFVnqbkmeWtja3RoZt6mwA4rshoK3KWPvpuliNinA==
X-Received: by 10.28.18.194 with SMTP id 185mr3476846wms.14.1457609599764;
	Thu, 10 Mar 2016 03:33:19 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	cb2sm3106472wjc.16.2016.03.10.03.33.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Mar 2016 03:33:18 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Mar 2016 12:36:12 +0100
Message-Id: <1457609775-25093-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.2
MIME-Version: 1.0
Subject: [PATCH][meta-oe 1/4] dfu-util: fix .patch files
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
X-List-Received-Date: Thu, 10 Mar 2016 11:33:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* dfu-util-native was broken since last upgrade in:
  commit c2652c90f726fa1728307afad73c3051ca7660f5
  Author: Li xin <lixin.fnst@cn.fujitsu.com>
  Date:   Sun Jan 3 18:07:17 2016 -0800

    dfu-util: 0.7 -> 0.8

    Upgrade dfu-util from 0.7 to 0.8.

    Modify SRC_URI,since the original one can�t be opened.
    Modify 0001-configure.ac-Don-t-check-for-usbpath.patch,since the datas has been changed.
  because
  0002-Revert-Makefile.am-Drop-static-dfu-util.patch
  didn't apply anymore.
* update
  0001-configure.ac-Don-t-check-for-usbpath.patch
  to keep check for sysexits.h

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...0001-configure.ac-Don-t-check-for-usbpath.patch | 10 ++++----
 ...2-Revert-Makefile.am-Drop-static-dfu-util.patch | 27 +++++++++++-----------
 2 files changed, 19 insertions(+), 18 deletions(-)

diff --git a/meta-oe/recipes-support/dfu-util/dfu-util/0001-configure.ac-Don-t-check-for-usbpath.patch b/meta-oe/recipes-support/dfu-util/dfu-util/0001-configure.ac-Don-t-check-for-usbpath.patch
index 0d48a76..bab4a71 100644
--- a/meta-oe/recipes-support/dfu-util/dfu-util/0001-configure.ac-Don-t-check-for-usbpath.patch
+++ b/meta-oe/recipes-support/dfu-util/dfu-util/0001-configure.ac-Don-t-check-for-usbpath.patch
@@ -1,11 +1,11 @@
-From 63f6f6882f3813ab22c62806feeab942579a2acf Mon Sep 17 00:00:00 2001
+From e1811274b61db0f5ca55c50ec96d799e2d85fa06 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sun, 3 Aug 2014 17:50:06 +0200
 Subject: [PATCH 1/2] configure.ac: Don't check for usbpath
 
 * otherwise it fails to build with -lusb
   | main.o: In function `resolve_device_path':
-  | dfu-util/0.8-r0/dfu-util-0.8/src/main.c:371: undefined reference to `usb_path2devnum'
+  | dfu-util/0.7-r0/dfu-util-0.7/src/main.c:371: undefined reference to `usb_path2devnum'
   | collect2: error: ld returned 1 exit status
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
@@ -14,7 +14,7 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 1 insertion(+), 2 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 700b556..fb58473 100644
+index 8622114..a1dcc7a 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -20,14 +20,13 @@ AS_IF([test x$native_libusb = xno], [
@@ -29,10 +29,10 @@ index 700b556..fb58473 100644
  # Checks for header files.
  AC_HEADER_STDC
 -AC_CHECK_HEADERS([usbpath.h windows.h sysexits.h])
-+AC_CHECK_HEADERS([windows.h])
++AC_CHECK_HEADERS([windows.h sysexits.h])
  
  # Checks for typedefs, structures, and compiler characteristics.
  AC_C_CONST
 -- 
-2.0.2
+2.7.2
 
diff --git a/meta-oe/recipes-support/dfu-util/dfu-util/0002-Revert-Makefile.am-Drop-static-dfu-util.patch b/meta-oe/recipes-support/dfu-util/dfu-util/0002-Revert-Makefile.am-Drop-static-dfu-util.patch
index de17808..7bd965b 100644
--- a/meta-oe/recipes-support/dfu-util/dfu-util/0002-Revert-Makefile.am-Drop-static-dfu-util.patch
+++ b/meta-oe/recipes-support/dfu-util/dfu-util/0002-Revert-Makefile.am-Drop-static-dfu-util.patch
@@ -1,4 +1,4 @@
-From 440a026379ff111aaa8314db1c29ffae8f482824 Mon Sep 17 00:00:00 2001
+From 7d613b28c1b48b5cc3a0882d24e0ac938faff4c2 Mon Sep 17 00:00:00 2001
 From: Martin JaMa Jansa <Martin.Jansa@gmail.com>
 Date: Thu, 11 Aug 2011 11:19:52 +0200
 Subject: [PATCH 2/2] Revert "Makefile.am: Drop static dfu-util"
@@ -6,17 +6,16 @@ Subject: [PATCH 2/2] Revert "Makefile.am: Drop static dfu-util"
 This reverts commit fe0426ddc04f503d148c5e5f931f16b8f674f071.
 
 Signed-off-by: Martin JaMa Jansa <Martin.Jansa@gmail.com>
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
  configure.ac    |  2 +-
- src/Makefile.am | 20 +++++++++++++++++++-
- 2 files changed, 20 insertions(+), 2 deletions(-)
+ src/Makefile.am | 22 +++++++++++++++++++++-
+ 2 files changed, 22 insertions(+), 2 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index fb58473..09b9e5a 100644
+index a1dcc7a..bb71e02 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -23,7 +23,7 @@ AS_IF([test x$native_libusb = xno], [
+@@ -21,7 +21,7 @@ AS_IF([test x$native_libusb = xno], [
          AC_MSG_ERROR([*** Required libusb-1.0 >= 1.0.0 not installed ***]))
  ])
  
@@ -26,18 +25,18 @@ index fb58473..09b9e5a 100644
  
  # Checks for header files.
 diff --git a/src/Makefile.am b/src/Makefile.am
-index 99df307..28d53f7 100644
+index 70179c4..e8736ee 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
 @@ -1,6 +1,6 @@
- AM_CFLAGS = -Wall
+ AM_CFLAGS = -Wall -Wextra
  
--bin_PROGRAMS = dfu-util dfu-suffix
-+bin_PROGRAMS = dfu-util dfu-util_static dfu-suffix
+-bin_PROGRAMS = dfu-util dfu-suffix dfu-prefix
++bin_PROGRAMS = dfu-util dfu-util_static dfu-suffix dfu-prefix
  dfu_util_SOURCES = main.c \
  		portable.h \
  		dfu_load.c \
-@@ -17,6 +17,24 @@ dfu_util_SOURCES = main.c \
+@@ -19,6 +19,26 @@ dfu_util_SOURCES = main.c \
  		quirks.c \
  		quirks.h
  
@@ -45,6 +44,8 @@ index 99df307..28d53f7 100644
 +		portable.h \
 +		dfu_load.c \
 +		dfu_load.h \
++		dfu_util.c \
++		dfu_util.h \
 +		dfuse.c \
 +		dfuse.h \
 +		dfuse_mem.c \
@@ -61,7 +62,7 @@ index 99df307..28d53f7 100644
 +
  dfu_suffix_SOURCES = suffix.c \
  		dfu_file.h \
- 		dfu_file.c \
+ 		dfu_file.c
 -- 
-2.0.2
+2.7.2
 
-- 
2.7.2


