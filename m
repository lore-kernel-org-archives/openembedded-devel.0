Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id E71E6606BF
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jan 2016 02:07:47 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="2171850"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 04 Jan 2016 10:07:43 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 38A2D41887DF
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jan 2016 10:07:19 +0800 (CST)
Received: from localhost.localdomain (10.167.226.51) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 4 Jan 2016 10:07:19 +0800
From: Li Xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 3 Jan 2016 18:07:17 -0800
Message-ID: <1451873237-4467-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.51]
X-yoursite-MailScanner-ID: 38A2D41887DF.A9834
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: lixin.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] dfu-util: 0.7 -> 0.8
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
X-List-Received-Date: Mon, 04 Jan 2016 02:07:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Upgrade dfu-util from 0.7 to 0.8.

Modify SRC_URI,since the original one can‘t be opened.
Modify 0001-configure.ac-Don-t-check-for-usbpath.patch,since the datas has been changed.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../dfu-util/{dfu-util-native_0.7.bb => dfu-util-native_0.8.bb}   | 0
 .../dfu-util/0001-configure.ac-Don-t-check-for-usbpath.patch      | 6 +++---
 .../recipes-support/dfu-util/{dfu-util_0.7.bb => dfu-util_0.8.bb} | 8 +++-----
 3 files changed, 6 insertions(+), 8 deletions(-)
 rename meta-oe/recipes-support/dfu-util/{dfu-util-native_0.7.bb => dfu-util-native_0.8.bb} (100%)
 rename meta-oe/recipes-support/dfu-util/{dfu-util_0.7.bb => dfu-util_0.8.bb} (54%)

diff --git a/meta-oe/recipes-support/dfu-util/dfu-util-native_0.7.bb b/meta-oe/recipes-support/dfu-util/dfu-util-native_0.8.bb
similarity index 100%
rename from meta-oe/recipes-support/dfu-util/dfu-util-native_0.7.bb
rename to meta-oe/recipes-support/dfu-util/dfu-util-native_0.8.bb
diff --git a/meta-oe/recipes-support/dfu-util/dfu-util/0001-configure.ac-Don-t-check-for-usbpath.patch b/meta-oe/recipes-support/dfu-util/dfu-util/0001-configure.ac-Don-t-check-for-usbpath.patch
index a583c33..0d48a76 100644
--- a/meta-oe/recipes-support/dfu-util/dfu-util/0001-configure.ac-Don-t-check-for-usbpath.patch
+++ b/meta-oe/recipes-support/dfu-util/dfu-util/0001-configure.ac-Don-t-check-for-usbpath.patch
@@ -5,7 +5,7 @@ Subject: [PATCH 1/2] configure.ac: Don't check for usbpath
 
 * otherwise it fails to build with -lusb
   | main.o: In function `resolve_device_path':
-  | dfu-util/0.7-r0/dfu-util-0.7/src/main.c:371: undefined reference to `usb_path2devnum'
+  | dfu-util/0.8-r0/dfu-util-0.8/src/main.c:371: undefined reference to `usb_path2devnum'
   | collect2: error: ld returned 1 exit status
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
@@ -17,7 +17,7 @@ diff --git a/configure.ac b/configure.ac
 index 700b556..fb58473 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -22,14 +22,13 @@ AS_IF([test x$native_libusb = xno], [
+@@ -20,14 +20,13 @@ AS_IF([test x$native_libusb = xno], [
      PKG_CHECK_MODULES([USB], [libusb-1.0 >= 1.0.0],,
          AC_MSG_ERROR([*** Required libusb-1.0 >= 1.0.0 not installed ***]))
  ])
@@ -28,7 +28,7 @@ index 700b556..fb58473 100644
  
  # Checks for header files.
  AC_HEADER_STDC
--AC_CHECK_HEADERS([usbpath.h windows.h])
+-AC_CHECK_HEADERS([usbpath.h windows.h sysexits.h])
 +AC_CHECK_HEADERS([windows.h])
  
  # Checks for typedefs, structures, and compiler characteristics.
diff --git a/meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb b/meta-oe/recipes-support/dfu-util/dfu-util_0.8.bb
similarity index 54%
rename from meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb
rename to meta-oe/recipes-support/dfu-util/dfu-util_0.8.bb
index 7f06f8f..51d00c6 100644
--- a/meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb
+++ b/meta-oe/recipes-support/dfu-util/dfu-util_0.8.bb
@@ -4,16 +4,14 @@ AUTHOR = "Harald Welte <laforge@openmoko.org>"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-S = "${WORKDIR}/git"
 
-SRC_URI = "git://gitorious.org/dfu-util/dfu-util.git \
+SRC_URI = "http://dfu-util.gnumonks.org/releases/${PN}-${PV}.tar.gz \
     file://0001-configure.ac-Don-t-check-for-usbpath.patch \
 "
-SRCREV="a0a3668e0571a9b007f7d62b01e7dcfd7754ce50"
 
 inherit autotools pkgconfig
 
 DEPENDS = "libusb1"
 
-SRC_URI[md5sum] = "1de724551604bce1962960b7a301cc08"
-SRC_URI[sha256sum] = "5d253f924fd29bc13054b664bba9aa86b865299971195969478253c1775b7e56"
+SRC_URI[md5sum] = "fc6daf6b0ee57d7e40ffa3e8111023d1"
+SRC_URI[sha256sum] = "55cbde9be12a212bd84bce9d1e63941d9a16139ed0d4912401367eba1502f058"
-- 
1.9.1




