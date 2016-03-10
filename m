Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id D38B373197
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Mar 2016 11:33:20 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id p65so24500448wmp.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Mar 2016 03:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Ce9vwDi/riYbmglD7CaB27FpedoqxnewYi2ftMv/fdw=;
	b=BhvYJZVDcluxUrKi7gAB5cudi/rX8mnPR0T4N1Etq5J5ZqtE4dW+v3VWg1Z/ATR1VD
	yAsit4VHsctaj+RtHJBNuDmcvUA0rcey5WTQxWZnE7FWBIV0gYirqcUPA3Xn9dYupuUi
	Ek/PEGXKWx04TlFVFiS7prRncNcuijM2mZxXacUWEKPax5DlK9wB7T5DmKmFd6G3vJzt
	z7BWfoOj6P4ZR6ruALwcZPHeLz18HTFGVhMDsHFrK1MsXryGSPZN3Oju4Baf45w24m46
	/npsNr4W2X6rSQvzL8VA0OWVqFXvUgZcKLHQaoU7xVxJdkI4IruPhGzb58r/6eqe2BD9
	gBTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Ce9vwDi/riYbmglD7CaB27FpedoqxnewYi2ftMv/fdw=;
	b=dnsLcO/zxcf3NjjUg0mWibz6C+WDIbcU01lHVDB2FkD7SV4CfxMOPXd414JiUUx18D
	xqKjy7TvM1jqi6cKSy09DzYETmQkq9fM0fUjvUjh/1WwlMVXv3Pu6M/SaaXkfv3u1Xvo
	cfRQvmbbm7OY0qmFtJGzFvpBF6OP03kOMVh42nhNXZwSZfp633ThC8qVc3KSkZwoD4sA
	DjpoURARlROiLd7qH90tsV517PgTKLTmAC9VwEn50jvOvztBeJwyctIe+MLEwDkjypDv
	F0vQQPFv6zJMW7hwRT7iQmTLgiq0GzutJ4NM4We81wvi6ZAE0lmtDnZ0K0E6TeG0QWQ/
	nZZw==
X-Gm-Message-State: AD7BkJLhOHlJ1CFXhRhdbUI2nyF0t7mhOD4TCUi+SY4FrWRlxEctP7Ax5ZHQmZjRduUQAw==
X-Received: by 10.28.224.212 with SMTP id x203mr3396476wmg.75.1457609601254;
	Thu, 10 Mar 2016 03:33:21 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	wr2sm3045553wjc.49.2016.03.10.03.33.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Mar 2016 03:33:20 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Mar 2016 12:36:13 +0100
Message-Id: <1457609775-25093-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.2
In-Reply-To: <1457609775-25093-1-git-send-email-Martin.Jansa@gmail.com>
References: <1457609775-25093-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe 2/4] dfu-util: upgrade to 0.9
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
X-List-Received-Date: Thu, 10 Mar 2016 11:33:23 -0000

* drop
  commit 0792623dfa8156fb0af3f3949c901665e2df3d04
  Author: Stefan `Sec` Zehl <sec@42.org>
  Date:   Wed Jul 29 01:39:11 2015 +0200

    Fix/reimplement USBPATH support

    Using libusb functions to retrieve port and bus numbers.

    Thanks to Topi Kuutela for reviewing and testing the patch.

    Also thanks to Timo Poikola and Topi Kuutela for having submitted
    alternative patches.

    https://sourceforge.net/p/dfu-util/tickets/6/

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...u-util-native_0.8.bb => dfu-util-native_0.9.bb} |  7 ++--
 ...-Revert-Makefile.am-Drop-static-dfu-util.patch} |  6 ++--
 ...0001-configure.ac-Don-t-check-for-usbpath.patch | 38 ----------------------
 meta-oe/recipes-support/dfu-util/dfu-util_0.8.bb   | 17 ----------
 meta-oe/recipes-support/dfu-util/dfu-util_0.9.bb   | 14 ++++++++
 5 files changed, 19 insertions(+), 63 deletions(-)
 rename meta-oe/recipes-support/dfu-util/{dfu-util-native_0.8.bb => dfu-util-native_0.9.bb} (78%)
 rename meta-oe/recipes-support/dfu-util/dfu-util/{0002-Revert-Makefile.am-Drop-static-dfu-util.patch => 0001-Revert-Makefile.am-Drop-static-dfu-util.patch} (90%)
 delete mode 100644 meta-oe/recipes-support/dfu-util/dfu-util/0001-configure.ac-Don-t-check-for-usbpath.patch
 delete mode 100644 meta-oe/recipes-support/dfu-util/dfu-util_0.8.bb
 create mode 100644 meta-oe/recipes-support/dfu-util/dfu-util_0.9.bb

diff --git a/meta-oe/recipes-support/dfu-util/dfu-util-native_0.8.bb b/meta-oe/recipes-support/dfu-util/dfu-util-native_0.9.bb
similarity index 78%
rename from meta-oe/recipes-support/dfu-util/dfu-util-native_0.8.bb
rename to meta-oe/recipes-support/dfu-util/dfu-util-native_0.9.bb
index 8be9d85..7a7a662 100644
--- a/meta-oe/recipes-support/dfu-util/dfu-util-native_0.8.bb
+++ b/meta-oe/recipes-support/dfu-util/dfu-util-native_0.9.bb
@@ -1,19 +1,16 @@
 require dfu-util_${PV}.bb
 
 inherit native deploy
-do_deploy[sstate-outputdirs] = "${DEPLOY_DIR_TOOLS}"
 
 DEPENDS = "libusb1-native"
 
-FILESPATH =. "${FILE_DIRNAME}/${BPN}-${PV}:"
-SRC_URI += "file://0002-Revert-Makefile.am-Drop-static-dfu-util.patch"
+SRC_URI += "file://0001-Revert-Makefile.am-Drop-static-dfu-util.patch"
 
+do_deploy[sstate-outputdirs] = "${DEPLOY_DIR_TOOLS}"
 do_deploy() {
     install -d ${DEPLOY_DIR_TOOLS}
     install -m 0755 src/dfu-util_static ${DEPLOY_DIR_TOOLS}/dfu-util-${PV}
     rm -f ${DEPLOY_DIR_TOOLS}/dfu-util
     ln -sf ./dfu-util-${PV} ${DEPLOY_DIR_TOOLS}/dfu-util
-
 }
-
 addtask deploy before do_package after do_install
diff --git a/meta-oe/recipes-support/dfu-util/dfu-util/0002-Revert-Makefile.am-Drop-static-dfu-util.patch b/meta-oe/recipes-support/dfu-util/dfu-util/0001-Revert-Makefile.am-Drop-static-dfu-util.patch
similarity index 90%
rename from meta-oe/recipes-support/dfu-util/dfu-util/0002-Revert-Makefile.am-Drop-static-dfu-util.patch
rename to meta-oe/recipes-support/dfu-util/dfu-util/0001-Revert-Makefile.am-Drop-static-dfu-util.patch
index 7bd965b..1c6ad08 100644
--- a/meta-oe/recipes-support/dfu-util/dfu-util/0002-Revert-Makefile.am-Drop-static-dfu-util.patch
+++ b/meta-oe/recipes-support/dfu-util/dfu-util/0001-Revert-Makefile.am-Drop-static-dfu-util.patch
@@ -1,7 +1,7 @@
-From 7d613b28c1b48b5cc3a0882d24e0ac938faff4c2 Mon Sep 17 00:00:00 2001
+From c2aab3b9ae1febcb6b4c6561a59df1930a57b394 Mon Sep 17 00:00:00 2001
 From: Martin JaMa Jansa <Martin.Jansa@gmail.com>
 Date: Thu, 11 Aug 2011 11:19:52 +0200
-Subject: [PATCH 2/2] Revert "Makefile.am: Drop static dfu-util"
+Subject: [PATCH] Revert "Makefile.am: Drop static dfu-util"
 
 This reverts commit fe0426ddc04f503d148c5e5f931f16b8f674f071.
 
@@ -12,7 +12,7 @@ Signed-off-by: Martin JaMa Jansa <Martin.Jansa@gmail.com>
  2 files changed, 22 insertions(+), 2 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index a1dcc7a..bb71e02 100644
+index f5a43b8..6a3757e 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -21,7 +21,7 @@ AS_IF([test x$native_libusb = xno], [
diff --git a/meta-oe/recipes-support/dfu-util/dfu-util/0001-configure.ac-Don-t-check-for-usbpath.patch b/meta-oe/recipes-support/dfu-util/dfu-util/0001-configure.ac-Don-t-check-for-usbpath.patch
deleted file mode 100644
index bab4a71..0000000
--- a/meta-oe/recipes-support/dfu-util/dfu-util/0001-configure.ac-Don-t-check-for-usbpath.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From e1811274b61db0f5ca55c50ec96d799e2d85fa06 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Sun, 3 Aug 2014 17:50:06 +0200
-Subject: [PATCH 1/2] configure.ac: Don't check for usbpath
-
-* otherwise it fails to build with -lusb
-  | main.o: In function `resolve_device_path':
-  | dfu-util/0.7-r0/dfu-util-0.7/src/main.c:371: undefined reference to `usb_path2devnum'
-  | collect2: error: ld returned 1 exit status
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- configure.ac | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 8622114..a1dcc7a 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -20,14 +20,13 @@ AS_IF([test x$native_libusb = xno], [
-     PKG_CHECK_MODULES([USB], [libusb-1.0 >= 1.0.0],,
-         AC_MSG_ERROR([*** Required libusb-1.0 >= 1.0.0 not installed ***]))
- ])
--AC_CHECK_LIB([usbpath],[usb_path2devnum],,,-lusb)
- 
- LIBS="$LIBS $USB_LIBS"
- CFLAGS="$CFLAGS $USB_CFLAGS"
- 
- # Checks for header files.
- AC_HEADER_STDC
--AC_CHECK_HEADERS([usbpath.h windows.h sysexits.h])
-+AC_CHECK_HEADERS([windows.h sysexits.h])
- 
- # Checks for typedefs, structures, and compiler characteristics.
- AC_C_CONST
--- 
-2.7.2
-
diff --git a/meta-oe/recipes-support/dfu-util/dfu-util_0.8.bb b/meta-oe/recipes-support/dfu-util/dfu-util_0.8.bb
deleted file mode 100644
index 51f4ae1..0000000
--- a/meta-oe/recipes-support/dfu-util/dfu-util_0.8.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-DESCRIPTION = "USB Device Firmware Upgrade utility"
-SECTION = "devel"
-AUTHOR = "Harald Welte <laforge@openmoko.org>"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-
-
-SRC_URI = "http://dfu-util.gnumonks.org/releases/${BP}.tar.gz \
-    file://0001-configure.ac-Don-t-check-for-usbpath.patch \
-"
-
-inherit autotools pkgconfig
-
-DEPENDS = "libusb1"
-
-SRC_URI[md5sum] = "fc6daf6b0ee57d7e40ffa3e8111023d1"
-SRC_URI[sha256sum] = "55cbde9be12a212bd84bce9d1e63941d9a16139ed0d4912401367eba1502f058"
diff --git a/meta-oe/recipes-support/dfu-util/dfu-util_0.9.bb b/meta-oe/recipes-support/dfu-util/dfu-util_0.9.bb
new file mode 100644
index 0000000..01bca22
--- /dev/null
+++ b/meta-oe/recipes-support/dfu-util/dfu-util_0.9.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "USB Device Firmware Upgrade utility"
+SECTION = "devel"
+AUTHOR = "Harald Welte <laforge@openmoko.org>"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+SRC_URI = "http://dfu-util.gnumonks.org/releases/${BP}.tar.gz"
+
+inherit autotools pkgconfig
+
+DEPENDS = "libusb1"
+
+SRC_URI[md5sum] = "233bb1e08ef4b405062445d84e28fde6"
+SRC_URI[sha256sum] = "36428c6a6cb3088cad5a3592933385253da5f29f2effa61518ee5991ea38f833"
-- 
2.7.2


