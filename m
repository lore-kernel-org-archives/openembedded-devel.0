Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
	[209.85.216.44])
	by mail.openembedded.org (Postfix) with ESMTP id 3814461C41
	for <openembedded-devel@openembedded.org>;
	Thu, 12 Mar 2020 02:57:50 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id y7so1923515pjn.1
	for <openembedded-devel@openembedded.org>;
	Wed, 11 Mar 2020 19:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=+nOlKKmVTN0Et+ZqNgnX1dPcDL39b9RxYuc++lGXlzk=;
	b=sCIdKU0CAhnT43Q6nE9fuiyeKbHRyxZEKDrc9QNAiElXHTJqmmZyXhTkxjWHkaHS+p
	/CULhF3VZLiav91D8r+3Y9/q8RQlv+0Lkq3oISUGq5e07WObYajSEz6lX1IwHzyBsBX6
	V0xE4fFhyBWvjwi8DYZ+tezftEIXsQEG7A0qur/gKGOMPpGI8MWs/r1tKNRTASFa+s28
	bFCXIEWLMutjNgaIGTz1j4letZzvGnCwfPwrmHxsaOGeidYxUtWyzDMXb5EJJ7kTMr0P
	bzw7ph+oig2qrSyRofkQUHc4DdkGF9NeaSYT7FCpP7UALTi0dW2LGjrcA1GZwHGSJLig
	Xt8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=+nOlKKmVTN0Et+ZqNgnX1dPcDL39b9RxYuc++lGXlzk=;
	b=NKTLagDgHb/oO1sjdEPgbjYrr3MyVLu4PK3KLzP8J7AnL1eYKsqxxbJ/ZPCahNv+bJ
	NbYw4TFkCMgVOoZdThxfl+cH4gMs7+D6sxEGv+v5bjRoBkqZlnI47mO1gt24KX9PTxHL
	5TrpzyegpdMvtT9aXd914MvcRxV37EJZzQ6BiB6B4Y1V6KVpjljN/8ihJTwOV6kAjwOV
	KitARZ+/RB9efmgAPqnE9A1E/Jk0xoTdAqLsUWSEu2ISX/RR+kCbXn/jfYeRxX6V/YfY
	3HjGylhgUDt4KLO0zPX5dlFk3yKHf2qqwt55cKdOaZjvyXthXIF3kSHQMu+4Qtyf9IPe
	k+dw==
X-Gm-Message-State: ANhLgQ2wCY5GuGbwv/RaLXe+DXGdtcNZw3ZpZ4Wd5XrocH4XrcyuG0M4
	r/7Q+WpHPyLkqq9jnCCzKgtI6N2Y
X-Google-Smtp-Source: ADFU+vvEg1XCh5T6Sx5wi2t4fu3BwkaUUiMmQt0mAGNU+YVGj8Qp2A3SxJE7E6rfG4ZvhMgOf5+yUw==
X-Received: by 2002:a17:90b:14c2:: with SMTP id
	jz2mr1818194pjb.152.1583981870843; 
	Wed, 11 Mar 2020 19:57:50 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:60a5:8a88:a7f9:d809])
	by smtp.gmail.com with ESMTPSA id
	e2sm18328236pgv.81.2020.03.11.19.57.49
	for <openembedded-devel@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 11 Mar 2020 19:57:50 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@openembedded.org
Date: Wed, 11 Mar 2020 19:57:31 -0700
Message-Id: <d20c231a946a6c703910808c09a6e26f9401d476.1583981708.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1583981708.git.akuster808@gmail.com>
References: <cover.1583981708.git.akuster808@gmail.com>
Subject: [zeus 12/13] s3c24xx-gpio, s3c64xx-gpio, sjf2410-linux-native, usbpath, wmiconfig: use git fetcher instead of svn fetcher
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
X-List-Received-Date: Thu, 12 Mar 2020 02:57:50 -0000

From: Martin Jansa <martin.jansa@gmail.com>

* svn checkouts from http://svn.openmoko.org/ are now redirected to github:
  svn --non-interactive --trust-server-cert co --no-auth-cache --ignore-externals -r 4949 http://svn.openmoko.org/trunk/src/target/gpio@4949 gpio

Redirecting to URL 'https://github.com/openmoko/openmoko-svn':
A    gpio/branches
A    gpio/branches/oe
A    gpio/branches/oe/pre-20070305
A    gpio/branches/oe/pre-20070305/README
A    gpio/branches/oe/pre-20070305/classes
A    gpio/branches/oe/pre-20070305/classes/autotools.bbclass
A    gpio/branches/oe/pre-20070305/classes/base.bbclass
A    gpio/branches/oe/pre-20070305/classes/openmoko-base.bbclass
A    gpio/branches/oe/pre-20070305/classes/openmoko-panel-plugin.bbclass

* unfortunately this is causing the checkout to start from trunk, not the
  subdirectory specified in the URL (e.g. /trunk/src/target/gpio) and then
  S variable points to incorrect directory as discussed here:
  http://lists.openembedded.org/pipermail/openembedded-devel/2020-February/205028.html

* use git fetcher directly to remove the dependency on subversion-native

* for simplicity use the same SRCREV and PV for all of these, there wasn't any
  commit in last 8 years (not anyone can expect new commits), I don't
  expect anyone nowadays actually using these recipes which I've imported
  from meta-smartphone in 2011 - that's why I will send their removal in
  follow-up commit.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 6902dcd2edc3a08f6929e19e9a9c18493883f9d2)
[ak: fixes build issue
WARNING: s3c24xx-gpio-1.0+svnr4949-r2 do_populate_lic: Could not copy license file /home/build/builds/zeus/tmp-glibc/work/core2-64-oe-linux/s3c24xx-gpio/1.0+svnr4949-r2/gpio/gpio.c to /home/build/builds/zeus/tmp-glibc/work/core2-64-oe-linux/s3c24xx-gpio/1.0+svnr4949-r2/license-destdir/s3c24xx-gpio/gpio.c: [Errno 2] No such file or directory: '/home/build/builds/zeus/tmp-glibc/work/core2-64-oe-linux/s3c24xx-gpio/1.0+svnr4949-r2/gpio/gpio.c'
ERROR: s3c24xx-gpio-1.0+svnr4949-r2 do_populate_lic: QA Issue: s3c24xx-gpio: LIC_FILES_CHKSUM points to an invalid file: /home/build/builds/zeus/tmp-glibc/work/core2-64-oe-linux/s3c24xx-gpio/1.0+svnr4949-r2/gpio/gpio.c [license-checksum]
]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{s3c24xx-gpio_svn.bb => s3c24xx-gpio_git.bb}    |  7 +++----
 .../{s3c64xx-gpio_svn.bb => s3c64xx-gpio_git.bb}    |  6 +++---
 ...ux-native_svn.bb => sjf2410-linux-native_git.bb} | 11 +++++------
 .../usbpath/{usbpath_svn.bb => usbpath_git.bb}      | 10 +++++-----
 .../{wmiconfig_svn.bb => wmiconfig_git.bb}          | 13 ++++++-------
 5 files changed, 22 insertions(+), 25 deletions(-)
 rename meta-oe/recipes-support/samsung-soc-utils/{s3c24xx-gpio_svn.bb => s3c24xx-gpio_git.bb} (73%)
 rename meta-oe/recipes-support/samsung-soc-utils/{s3c64xx-gpio_svn.bb => s3c64xx-gpio_git.bb} (74%)
 rename meta-oe/recipes-support/samsung-soc-utils/{sjf2410-linux-native_svn.bb => sjf2410-linux-native_git.bb} (72%)
 rename meta-oe/recipes-support/usbpath/{usbpath_svn.bb => usbpath_git.bb} (68%)
 rename meta-oe/recipes-support/wmiconfig/{wmiconfig_svn.bb => wmiconfig_git.bb} (58%)

diff --git a/meta-oe/recipes-support/samsung-soc-utils/s3c24xx-gpio_svn.bb b/meta-oe/recipes-support/samsung-soc-utils/s3c24xx-gpio_git.bb
similarity index 73%
rename from meta-oe/recipes-support/samsung-soc-utils/s3c24xx-gpio_svn.bb
rename to meta-oe/recipes-support/samsung-soc-utils/s3c24xx-gpio_git.bb
index 255754d5d1..98573a062c 100644
--- a/meta-oe/recipes-support/samsung-soc-utils/s3c24xx-gpio_svn.bb
+++ b/meta-oe/recipes-support/samsung-soc-utils/s3c24xx-gpio_git.bb
@@ -3,11 +3,10 @@ SECTION = "console/utils"
 AUTHOR = "Werner Almesberger <werner@openmoko.org>"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://gpio.c;endline=12;md5=cfb91c686857b2e60852b4925d90a3e1"
-SRCREV = "4949"
-PV = "1.0+svnr${SRCPV}"
-PR = "r2"
+PV = "1.0+git${SRCPV}"
 
-SRC_URI = "svn://svn.openmoko.org/trunk/src/target;module=gpio;protocol=http"
+SRCREV = "0bde889e6fc09a330d0e0b9eb9808b20b2bf13d1"
+SRC_URI = "git://github.com/openmoko/openmoko-svn.git;protocol=https;subpath=src/target/gpio"
 S = "${WORKDIR}/gpio"
 
 CLEANBROKEN = "1"
diff --git a/meta-oe/recipes-support/samsung-soc-utils/s3c64xx-gpio_svn.bb b/meta-oe/recipes-support/samsung-soc-utils/s3c64xx-gpio_git.bb
similarity index 74%
rename from meta-oe/recipes-support/samsung-soc-utils/s3c64xx-gpio_svn.bb
rename to meta-oe/recipes-support/samsung-soc-utils/s3c64xx-gpio_git.bb
index 976a4f15ec..99781718c8 100644
--- a/meta-oe/recipes-support/samsung-soc-utils/s3c64xx-gpio_svn.bb
+++ b/meta-oe/recipes-support/samsung-soc-utils/s3c64xx-gpio_git.bb
@@ -3,10 +3,10 @@ SECTION = "console/utils"
 AUTHOR = "Werner Almesberger <werner@openmoko.org>"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://gpio-s3c6410.c;endline=12;md5=060cda1be945ad9194593f11d56d55c7"
-SRCREV = "4949"
-PV = "1.0+svnr${SRCPV}"
+PV = "1.0+git${SRCPV}"
 
-SRC_URI = "svn://svn.openmoko.org/trunk/src/target;module=gpio;protocol=http"
+SRCREV = "0bde889e6fc09a330d0e0b9eb9808b20b2bf13d1"
+SRC_URI = "git://github.com/openmoko/openmoko-svn.git;protocol=https;subpath=src/target/gpio"
 S = "${WORKDIR}/gpio"
 
 CLEANBROKEN = "1"
diff --git a/meta-oe/recipes-support/samsung-soc-utils/sjf2410-linux-native_svn.bb b/meta-oe/recipes-support/samsung-soc-utils/sjf2410-linux-native_git.bb
similarity index 72%
rename from meta-oe/recipes-support/samsung-soc-utils/sjf2410-linux-native_svn.bb
rename to meta-oe/recipes-support/samsung-soc-utils/sjf2410-linux-native_git.bb
index 9e609c4dd8..7d468bae18 100644
--- a/meta-oe/recipes-support/samsung-soc-utils/sjf2410-linux-native_svn.bb
+++ b/meta-oe/recipes-support/samsung-soc-utils/sjf2410-linux-native_git.bb
@@ -3,13 +3,12 @@ SECTION = "devel"
 AUTHOR = "Harald Welte <laforge@openmoko.org>"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://parport.c;endline=19;md5=b5681091b0fd8c5f7068835c441bf0c8"
-SRCREV = "4268"
-PV = "0.1+svnr${SRCPV}"
-PR = "r1"
+PV = "1.0+git${SRCPV}"
 
-SRC_URI = "svn://svn.openmoko.org/trunk/src/host/;module=sjf2410-linux;protocol=http \
-           file://0001-ppt.c-Do-not-include-sys-io.h.patch \
-          "
+SRCREV = "0bde889e6fc09a330d0e0b9eb9808b20b2bf13d1"
+SRC_URI = "git://github.com/openmoko/openmoko-svn.git;protocol=https;subpath=src/host/sjf2410-linux \
+    file://0001-ppt.c-Do-not-include-sys-io.h.patch \
+"
 S = "${WORKDIR}/sjf2410-linux"
 
 inherit native deploy
diff --git a/meta-oe/recipes-support/usbpath/usbpath_svn.bb b/meta-oe/recipes-support/usbpath/usbpath_git.bb
similarity index 68%
rename from meta-oe/recipes-support/usbpath/usbpath_svn.bb
rename to meta-oe/recipes-support/usbpath/usbpath_git.bb
index 6c9cd049fe..a3c75901fb 100644
--- a/meta-oe/recipes-support/usbpath/usbpath_svn.bb
+++ b/meta-oe/recipes-support/usbpath/usbpath_git.bb
@@ -8,12 +8,12 @@ DEPENDS_class-native = "virtual/libusb0-native"
 
 BBCLASSEXTEND = "native"
 
-SRCREV = "3172"
-PV = "0.0+svnr${SRCPV}"
-
-SRC_URI = "svn://svn.openmoko.org/trunk/src/host;module=usbpath;protocol=http \
-           file://configure.patch"
+PV = "1.0+git${SRCPV}"
 
+SRCREV = "0bde889e6fc09a330d0e0b9eb9808b20b2bf13d1"
+SRC_URI = "git://github.com/openmoko/openmoko-svn.git;protocol=https;subpath=src/host/usbpath \
+    file://configure.patch \
+"
 S = "${WORKDIR}/usbpath"
 
 inherit autotools pkgconfig
diff --git a/meta-oe/recipes-support/wmiconfig/wmiconfig_svn.bb b/meta-oe/recipes-support/wmiconfig/wmiconfig_git.bb
similarity index 58%
rename from meta-oe/recipes-support/wmiconfig/wmiconfig_svn.bb
rename to meta-oe/recipes-support/wmiconfig/wmiconfig_git.bb
index c66572b1c1..23273caf8e 100644
--- a/meta-oe/recipes-support/wmiconfig/wmiconfig_svn.bb
+++ b/meta-oe/recipes-support/wmiconfig/wmiconfig_git.bb
@@ -2,14 +2,13 @@ SUMMARY = "Atheros 6K Wifi configuration utility"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://wmiconfig.c;endline=19;md5=4394a56bca1c5b2446c9f8e406c82911"
 SECTION = "console/network"
-SRCREV = "5394"
-PV = "0.0.0+svnr${SRCPV}"
-PR = "r2"
+PV = "1.0+git${SRCPV}"
 
-SRC_URI = "svn://svn.openmoko.org/trunk/src/target;module=AR6kSDK.build_sw.18;protocol=http \
-           file://0001-makefile-Pass-CFLAGS-to-compile.patch \
-           file://0002-fix-err-API-to-have-format-string.patch \
-           "
+SRCREV = "0bde889e6fc09a330d0e0b9eb9808b20b2bf13d1"
+SRC_URI = "git://github.com/openmoko/openmoko-svn.git;protocol=https;subpath=src/target/AR6kSDK.build_sw.18 \
+    file://0001-makefile-Pass-CFLAGS-to-compile.patch \
+    file://0002-fix-err-API-to-have-format-string.patch \
+"
 S = "${WORKDIR}/AR6kSDK.build_sw.18/host/tools/wmiconfig"
 
 CLEANBROKEN = "1"
-- 
2.17.1


