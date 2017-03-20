Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id EA40477979
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Mar 2017 05:32:24 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id 79so9252033pgf.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Mar 2017 22:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=zthYBR9y7jwNfAhaas9QexA3IJ7nuQA0VO3pXhubldQ=;
	b=iRaO/snSnnGHH+WeUqHKPjJFFZf9uJfw36dcXihYHVWRDbXsKvsTxQEyGmenroK3y8
	q4qrb4NKSxQo+HnOLp4thTHJhOtcpavB83MrbBtNpywa3C8OBALmve0IPNatRHVBq8+2
	z7vl6CjPjDq0mvw4LX/WiA0RzNZvbFSgi/fwNWhTCnDaKKTK/Eof+RH4W1mmoP401Ohl
	rxFAdfYXhw3B/r4Sq0XYSNhvgnDOlmnehEObf0r2+KoFAJpoaL+WLJlQLrpt4L6d7Q3b
	2kT6G6oV7TTBdg3l01Unh7ZBGE9/cwicuqYg93Pco2unltURf5D8aixMRNb8momeAZGW
	4sbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=zthYBR9y7jwNfAhaas9QexA3IJ7nuQA0VO3pXhubldQ=;
	b=T/7MAOpylXeUatGS/6So3zjJoy9WIwFWC6A39hZZEjDwrpVU6vHlmBH+Bnp8VALW0v
	9m9pCePRpm8b/FTi7qJ1B4+X4po92hDsE1KPtzgnD1Jx+Z+ZradtKCvPm2ZIyogYx0X7
	ln0D/ucavs4enfYF9kx8sLIGnULTOOW+7vIWhj/ux0Glf3GHAOKF0q7oBU7cIMJ3Gcbn
	VmEwZq+suCxIE4FvkVeR6QNqbBHwr6OvUcJrSKYQyYqA9zdPUCqvPA6OhzkuBZd0pX2D
	WT/0c6ePQq1QdIhVFbEpx7vQa8GDL0Sgod6I6eG2zhcirraxp3kz4zU81e0pJat+xXQT
	CYpg==
X-Gm-Message-State: AFeK/H2UjygLP4/By+39H++3gM6Bg+MGcAv/xNtu4G1Ac2APuJz9iMOnVzcgF00V0VRotg==
X-Received: by 10.84.245.8 with SMTP id i8mr37730668pll.131.1489987945675;
	Sun, 19 Mar 2017 22:32:25 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	o189sm30203934pga.12.2017.03.19.22.32.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 19 Mar 2017 22:32:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 19 Mar 2017 22:31:50 -0700
Message-Id: <20170320053152.29352-14-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170320053152.29352-1-raj.khem@gmail.com>
References: <20170320053152.29352-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 14/16] digitemp: Update past 3.7.1 release
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
X-List-Received-Date: Mon, 20 Mar 2017 05:32:25 -0000

Fetch from github

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../digitemp/digitemp/makefile-fix.patch           | 20 ----------------
 meta-oe/recipes-support/digitemp/digitemp_3.6.0.bb | 27 ----------------------
 meta-oe/recipes-support/digitemp/digitemp_git.bb   | 25 ++++++++++++++++++++
 3 files changed, 25 insertions(+), 47 deletions(-)
 delete mode 100644 meta-oe/recipes-support/digitemp/digitemp/makefile-fix.patch
 delete mode 100644 meta-oe/recipes-support/digitemp/digitemp_3.6.0.bb
 create mode 100644 meta-oe/recipes-support/digitemp/digitemp_git.bb

diff --git a/meta-oe/recipes-support/digitemp/digitemp/makefile-fix.patch b/meta-oe/recipes-support/digitemp/digitemp/makefile-fix.patch
deleted file mode 100644
index c0d552d54..000000000
--- a/meta-oe/recipes-support/digitemp/digitemp/makefile-fix.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-digitemp: allow override of CC and CFLAGS vars
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
-
---- a/Makefile	2008-08-28 21:37:00.000000000 +0000
-+++ b/Makefile	2011-11-24 22:22:39.882511272 +0000
-@@ -11,8 +11,9 @@
- 
- VERSION = 3.6.0
- 
--CC	= gcc
--CFLAGS	= -I./src -I./userial -O2 -Wall # -g
-+CC	?= gcc
-+CFLAGS	?=  -O2 -Wall # -g
-+CFLAGS += -I./src -I./userial
- 
- OBJS		=	src/digitemp.o src/device_name.o src/ds2438.o
- HDRS		= 	src/digitemp.h src/device_name.h
diff --git a/meta-oe/recipes-support/digitemp/digitemp_3.6.0.bb b/meta-oe/recipes-support/digitemp/digitemp_3.6.0.bb
deleted file mode 100644
index 2582820e6..000000000
--- a/meta-oe/recipes-support/digitemp/digitemp_3.6.0.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-SUMMARY = "read temperature sensors in a 1-Wire net"
-SECTION = "util"
-DEPENDS = "libusb1"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=44fee82a1d2ed0676cf35478283e0aa0"
-
-PR = "r2"
-
-SRC_URI = "http://www.digitemp.com/software/linux/digitemp-${PV}.tar.gz \
-           file://makefile-fix.patch"
-SRC_URI[md5sum] = "9be2e48db37920f21925ae6e88f83b84"
-SRC_URI[sha256sum] = "14cfc584cd3714fe8c9a2cdc8388be49e08b5e395d95e6bcd11d4410e2505ca2"
-
-EXTRA_OEMAKE = "ds9097 ds9097u \
-                SYSTYPE='Linux' \
-"
-# Fix GNU_HASH QA errors
-TARGET_CC_ARCH += "${CFLAGS} ${LDFLAGS}"
-
-do_configure() {
-    rm -f digitemp_*
-}
-
-do_install() {
-    install -d ${D}${sbindir}
-    install digitemp_* ${D}${sbindir}
-}
diff --git a/meta-oe/recipes-support/digitemp/digitemp_git.bb b/meta-oe/recipes-support/digitemp/digitemp_git.bb
new file mode 100644
index 000000000..460aa1438
--- /dev/null
+++ b/meta-oe/recipes-support/digitemp/digitemp_git.bb
@@ -0,0 +1,25 @@
+SUMMARY = "read temperature sensors in a 1-Wire net"
+SECTION = "util"
+DEPENDS = "libusb1"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=44fee82a1d2ed0676cf35478283e0aa0"
+
+PV = "3.7.1+git${SRCPV}"
+
+SRC_URI = "git://github.com/bcl/digitemp"
+
+SRCREV = "389f67655efa1674f595106c3a47b5ad082609a7"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OEMAKE = "ds9097 ds9097u \
+                SYSTYPE='Linux' \
+"
+do_configure() {
+    rm -f digitemp_*
+}
+
+do_install() {
+    install -d ${D}${sbindir}
+    install -m 0755 digitemp_* ${D}${sbindir}
+}
-- 
2.12.0


