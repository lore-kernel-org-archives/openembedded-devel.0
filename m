Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 733976132B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Feb 2020 17:52:39 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id k11so5597488wrd.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Feb 2020 09:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=mE/Wf5+3/hmzO5VNWIMD7sTqeqBuwGu/+2sMn3LSTZs=;
	b=H8/4VCRbqBSmSUXJWICLnFtpV0GLdqaHGmEarmpjWS4CIwTxiOGHMnzZOS8x2nFJyN
	98+/NUd7Uvo5ASIhZejmJommSYrnw30FA1oWZG3NPxoMb9cNYpZJGHToiZioQ3twh5Tq
	FR/z4x4em0BVxV2ZC+x56Y2NN8bzfDgL4WztGb8adIFUwpnBtA1nqaOVbZ+UrwwHMZD9
	CTI/gVwDPzByymQGzfqrVrl1G0CIWxRmx+9d4V+yRee4jSr5Z2UezH23aUqaYbmvCzvl
	VyKPm/h99Y+QOhFZMUeaKtFR7+LDpGU6gXxMrMQLce915gZMfMGGQPegf7TLgcrAMXsE
	3WDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=mE/Wf5+3/hmzO5VNWIMD7sTqeqBuwGu/+2sMn3LSTZs=;
	b=UET20+FymPb3Qa6wsVUDARu5wGXp35ZLYQ4TwJK8yvNAwzWfr7wWxqMZqh3S3IvkuG
	Kb+Cd+U1qLk1zUdmJY6NXBviCdW6SZ/qUqtRgpNG5/ytJ9G+ikRokH3AxCgjL2RXVRpI
	5X3CZhpIM2X0yjGpqCD2zkqs62bb8Z7YeYpsm/2YL7Bs+QfyfsuSuR2dFbULNtiWBQW/
	/ZmU6MJODrGMtnmkIz0cyaXxyNxuR2lxx3aR6ErVWyk09hY8CpyZvamlJ7FrUiOGAexl
	Qph7/xswIoACiboALwNtqqQhU/woc5FntQSa/hcn1pZa+NIjn1I+Bt1j8EW9ZwdBvgvI
	i3mQ==
X-Gm-Message-State: APjAAAUvSWX8LfH4ILBQ1B99LTMsTtkOUBADdM9ejw0MphZV0LZl8im4
	5mNOvUxJQ4oE5MBEB4YSRG0dHdLQ
X-Google-Smtp-Source: APXvYqyWwEj9hHE6pDIR0sF15rPVbCSfYbmfGUrHZFPIwZrpoYZB3WnZBpip+HHIlweuNFmeGwhMww==
X-Received: by 2002:adf:f491:: with SMTP id l17mr46739989wro.149.1582221159640;
	Thu, 20 Feb 2020 09:52:39 -0800 (PST)
Received: from localhost ([109.238.218.228])
	by smtp.gmail.com with ESMTPSA id s65sm25732wmf.48.2020.02.20.09.52.38
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 20 Feb 2020 09:52:38 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Feb 2020 18:52:34 +0100
Message-Id: <20200220175235.367-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/2] s3c24xx-gpio, s3c64xx-gpio, sjf2410-linux-native, usbpath, wmiconfig: use git fetcher instead of svn fetcher
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
X-List-Received-Date: Thu, 20 Feb 2020 17:52:39 -0000
Content-Transfer-Encoding: 8bit

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
---
 .../{s3c24xx-gpio_svn.bb => s3c24xx-gpio_git.bb}    |  7 +++----
 .../{s3c64xx-gpio_svn.bb => s3c64xx-gpio_git.bb}    |  6 +++---
 ...ux-native_svn.bb => sjf2410-linux-native_git.bb} | 11 +++++------
 .../usbpath/{usbpath_svn.bb => usbpath_git.bb}      | 10 +++++-----
 .../{wmiconfig_svn.bb => wmiconfig_git.bb}          | 13 ++++++-------
 5 files changed, 22 insertions(+), 25 deletions(-)
 rename meta-oe/recipes-support/samsung-soc-utils/{s3c24xx-gpio_svn.bb => s3c24xx-gpio_git.bb} (73%)
 rename meta-oe/recipes-support/samsung-soc-utils/{s3c64xx-gpio_svn.bb => s3c64xx-gpio_git.bb} (74%)
 rename meta-oe/recipes-support/samsung-soc-utils/{sjf2410-linux-native_svn.bb => sjf2410-linux-native_git.bb} (78%)
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
similarity index 78%
rename from meta-oe/recipes-support/samsung-soc-utils/sjf2410-linux-native_svn.bb
rename to meta-oe/recipes-support/samsung-soc-utils/sjf2410-linux-native_git.bb
index 3a5172eecc..283740396b 100644
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
2.20.1


