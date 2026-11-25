Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37950.1795594103699117101
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 00:08:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=QsYOjrU9;
 spf=pass (domain: gmail.com, ip: 74.125.82.172, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-38190551625so10924742eec.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 00:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594103; x=1796198903; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wqIhgKc+RRajIoxChhWVP7wSU3VRwMBDgumT02zbtBs=;
        b=QsYOjrU9iKzqj7E3iILsEnBYR4hNXLrIxWUOtGmobjMIXdXEhZpVQtO4FY+EvQm4tm
         S9i2X9/pMdbXk7Ddt4s/JNE70yYX8YEsK2YunNbxVzsYeX3wpp+eYb1n7fuPmv8eshB2
         y1Tk07+WhjWN92czW1XsxPSxkBRJmp4eF8qJDgN4s1suRof4UmMpfsQ+7g+ULiorZHhz
         9UFItepGYJHRIe/Jbcx8DMSUxYISUBMJGzNlWLtaEJIgGrDiRIG1xWnrqDgvojpHo6dt
         STTrWcrx97hNBtHzP/Zz6lwHQqeYtv17Mv6SP/cxMFMjXkCF5KVPEi0M5/nJW/xRu6Jt
         tX+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594103; x=1796198903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wqIhgKc+RRajIoxChhWVP7wSU3VRwMBDgumT02zbtBs=;
        b=upFdPB7Fo9T005uNWRCBXNYJlapLJKx9JRMaJwBHAIlIQJ7G14Oriv0tPB58WoJEIS
         9UYpVdX+KKj+IXN8P63+w4Kb9Kxhgz5pfrzn+GW1LhL5iRzsfkAz4IVMnoqvyqJ8Yyvj
         4iU2Gwn0WmT3e6TGMWLUtzDQVJS5WscgZQzNechK7jamxtmRUvFuXBe+LWcGGSf9UoUy
         nlvYsOULEbCnKLrE23HhixxACqxF1bx+H0ky3YoESiXjWhhCYyMmwUp2/jujWiOVuFsa
         kY5hII3DscFlTJPCFudicGxjuzrjMl6dcZINU96tkRngcN9LqXQlH5p1fmpYyQu9pZnb
         Qz1w==
X-Gm-Message-State: APuU4Z+C77+tNPw7cYxOeD72XVA+bO6OYuFZ+rpBMWZxjhqWHQOB7rQP
	JdeFnSMBV6spGtUON+cM+8+t1WVOwFob5yZl2oUXf9IYYrC4hFb1kOCqZsRiKpic
X-Gm-Gg: AZFdTZfHKNAcoKS0AKL1j6KuNZLcjUm4nq8EXNF35/EoJuN+FvEPUMuS5D8bUYko4pv
	1uz12Z5qSJrcolTwJS1mIVkf5emhjoUpw4GMgtyaLSh9Nmf0tUHwB3ThhMnFvSjX6CjIQaiCQ9l
	A53Y4e0hDDkDGBEYNGmQ10evfaSE7O1SKcJzCYpZL+Gb+zAapVdNJz9GbyEBQid4CAs6wVqU3Qf
	rRwPOLLvYHRHI+WQxzX6j4cuCVhGgeWS6/0JSwKkA/cezHdR5wg+gl3100okptXj1Zc9abBQM9T
	ylwrVzwf5r+4aFWrrdnK2zVcePBM3ApfJTIClpmM0GZ5hVz4jq9OYj4xLll8MUns+nUPYfr+rQM
	W4JGfOvKZI0Viop6F7UWDTlQiPi4qGQlWXKQwy1Goz22JTLj7LFScmGL0NyOUmv36QxFQkf41vb
	GKf6vBosEV/UDLybrCV+gpH85f3TH5iDTEbAxB/laJbr2Xao52hu5RM3c/aV8kLnvbxuZY6OzQ3
	cfBVMB3DVOtHrgprnq9aOd8aiMV8zTYGFooNocG6xZgMEAwOqgZQAqFJFI+WpycYwiyp2kdrctN
	WAW/zNerbgCkbWp6PqB3yCngoovL+M8PLoihppy9GLr7k4hhEmp3vq8wNrUoXMyKXgZkFD8LTDd
	tKj0p4bzwJshASknC0hxv1Qu0RLj6G2BFm8LolfcYQhhgKnHq06b4B6+IG2gpdShZXlnvV9QeEY
	sLzGP2urjhhE45lGb/+DjHC+oHMk/YnoWp0bzBw+NY/5eXSXzSmOf5KTCDL9F6YdkDcvrOJr0ND
	YOBAxsW0d5vIx3Fpsk2VlAvN6M0yjH/NLPZszrO82Xwdzl/2DSNiBUQX8KerdMUlTqoVcPGUGkO
	t6+I
X-Received: by 2002:a05:693c:8209:b0:383:e7af:c28d with SMTP id 5a478bee46e88-3856f14d5b2mr17844084eec.9.1795594102937;
        Wed, 25 Nov 2026 00:08:22 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm90997971eec.3.2026.11.25.00.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:08:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 32/55] libiio: upgrade 0.26 -> 1.0.0
Date: Wed, 25 Nov 2026 00:06:48 -0800
Message-ID: <20261125080732.2419614-38-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
References: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 08:08:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133035
Content-Type: text/plain; charset="utf-8"

First stable 1.x release; it breaks both the API and the ABI of 0.x.
- Header moved to <iio/iio.h>; SONAME is now libiio.so.1 with a frozen
  version script; errors are returned as pointer-encoded codes
- Contexts are created with iio_create_context(params, uri);
  attributes use iio_attr objects; streaming is block based
  (iio_channels_mask, iio_buffer_open, iio_block, iio_stream)
- New binary IIOD protocol negotiated at connect time, multi-buffer
  and DMABUF support; IIOD still serves v0.x clients
- A libiio.so.0 compatibility library keeps v0.x binaries running
- iio_readdev and iio_writedev merged into iio_rwdev

Track main and the v1.0.0 tag instead of the libiio-v0 branch. Add
zstd to DEPENDS, which iiod needs for its USB/network/serial/async
I/O support. The Python bindings are now a standalone pyproject
package (pylibiio) without a CMake option, so build them with
python_setuptools_build_meta from bindings/python when the
libiio-python3 PACKAGECONFIG is enabled. Several sources are now MIT
licensed, so add MIT and the per-package licences (utils are
GPL-2.0-or-later, as before, and iiod has one BSD-3-Clause header).

License-Update: add MIT (new COPYING_MIT.txt) and the existing
COPYING_GPL.txt; COPYING.txt is unchanged.

Add UPSTREAM_CHECK_GITTAGREGEX matching release tags only.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{libiio_0.26.bb => libiio_1.0.0.bb}       | 34 +++++++++++--------
 1 file changed, 20 insertions(+), 14 deletions(-)
 rename meta-oe/recipes-support/libiio/{libiio_0.26.bb => libiio_1.0.0.bb} (75%)

diff --git a/meta-oe/recipes-support/libiio/libiio_0.26.bb b/meta-oe/recipes-support/libiio/libiio_1.0.0.bb
similarity index 75%
rename from meta-oe/recipes-support/libiio/libiio_0.26.bb
rename to meta-oe/recipes-support/libiio/libiio_1.0.0.bb
index dcd1ebffd9..9fc2e0909d 100644
--- a/meta-oe/recipes-support/libiio/libiio_0.26.bb
+++ b/meta-oe/recipes-support/libiio/libiio_1.0.0.bb
@@ -1,22 +1,28 @@
 SUMMARY = "Library for interfacing with IIO devices"
 HOMEPAGE = "https://wiki.analog.com/resources/tools-software/linux-software/libiio"
 SECTION = "libs"
-LICENSE = "LGPL-2.1-or-later"
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=7c13b3376cea0ce68d2d2da0a1b3a72c"
-
-SRCREV = "a0eca0d2bf10326506fb762f0eec14255b27bef5"
+LICENSE = "LGPL-2.1-or-later AND MIT AND GPL-2.0-or-later AND BSD-3-Clause"
+LICENSE:${PN} = "LGPL-2.1-or-later AND MIT"
+LICENSE:${PN}-iiod = "LGPL-2.1-or-later AND MIT AND BSD-3-Clause"
+LICENSE:${PN}-tests = "GPL-2.0-or-later"
+LICENSE:${PN}-python3 = "LGPL-2.1-or-later"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=7c13b3376cea0ce68d2d2da0a1b3a72c \
+                    file://COPYING_GPL.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://COPYING_MIT.txt;md5=6adb420b1f4ed98678908c60d934265a \
+"
 
-SRC_URI = "git://github.com/analogdevicesinc/libiio.git;protocol=https;branch=libiio-v0"
-UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
+SRCREV = "9a929664fd3effa500430626803ac59ecf2f4ed3"
 
+SRC_URI = "git://github.com/analogdevicesinc/libiio.git;protocol=https;branch=main;tag=v${PV}"
+UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
 
-SETUPTOOLS_SETUP_PATH ?= "${B}/bindings/python/"
+PEP517_SOURCE_PATH = "${S}/bindings/python"
 
 DEPENDS = " \
-    flex-native bison-native libaio \
+    flex-native bison-native libaio zstd \
 "
 
-inherit cmake python3native systemd setuptools3 pkgconfig update-rc.d
+inherit python_setuptools_build_meta cmake systemd pkgconfig update-rc.d
 
 EXTRA_OECMAKE = " \
     -DCMAKE_BUILD_TYPE=RelWithDebInfo \
@@ -41,12 +47,12 @@ PACKAGECONFIG[network_backend] = "-DWITH_NETWORK_BACKEND=ON -DWITH_XML_BACKEND=O
 PACKAGECONFIG[serial_backend] = "-DWITH_SERIAL_BACKEND=ON -DWITH_XML_BACKEND=ON,-DWITH_SERIAL_BACKEND=off,libserialport libxml2"
 PACKAGECONFIG[xml_backend] = "-DWITH_XML_BACKEND=ON,${XML_BACKEND_DISABLE},libxml2"
 PACKAGECONFIG[dnssd] = "-DHAVE_DNS_SD=ON,-DHAVE_DNS_SD=off,avahi"
-PACKAGECONFIG[libiio-python3] = "-DPYTHON_BINDINGS=ON,-DPYTHON_BINDINGS=OFF"
+PACKAGECONFIG[libiio-python3] = ""
 PACKAGECONFIG[hwmon] = "-DWITH_HWMON=ON,-DWITH_HWMON=OFF"
 
 PACKAGES =+ "${PN}-iiod ${PN}-tests ${PN}-python3"
 
-# Inheriting setuptools3 incorrectly adds the dependency on python3-core
+# Inheriting python_setuptools_build_meta incorrectly adds the dependency on python3-core
 # to ${PN} instead of to ${PN}-python3 where it belongs.
 RDEPENDS:${PN}:remove = "python3-core"
 RDEPENDS:${PN}-python3 = "${PN} python3-core python3-ctypes python3-stringold"
@@ -64,7 +70,7 @@ SYSTEMD_SERVICE:${PN}-iiod = "iiod.service"
 INITSCRIPT_PACKAGES = "${PN}-iiod"
 INITSCRIPT_NAME:${PN}-iiod = "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'iiod', '', d)}"
 
-# Explicitly define do_configure, do_compile and do_install because both cmake and setuptools3 have
+# Explicitly define do_configure, do_compile and do_install because both cmake and python_pep517 have
 # EXPORT_FUNCTIONS do_configure do_compile do_install
 do_configure() {
     cmake_do_configure
@@ -72,14 +78,14 @@ do_configure() {
 
 do_compile() {
     if ${@bb.utils.contains('PACKAGECONFIG', 'libiio-python3', 'true', 'false', d)}; then
-        setuptools3_do_compile
+        python_pep517_do_compile
     fi
     cmake_do_compile
 }
 
 do_install() {
     if ${@bb.utils.contains('PACKAGECONFIG', 'libiio-python3', 'true', 'false', d)}; then
-        setuptools3_do_install
+        python_pep517_do_install
     fi
     cmake_do_install
 }
