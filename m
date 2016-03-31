Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id 79A9060116
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2016 17:10:44 +0000 (UTC)
Received: by mail-qg0-f41.google.com with SMTP id w104so64999255qge.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2016 10:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=fMN9KGJMyL0tFLc8K5mmuH5+nvB6ljMz7eY81qgrYyM=;
	b=D1O72yZblsxBplUawduANQA9PRrgQ+15Mhjfa0C9oSerV1dbN95kONXq3hBypQzDU/
	XWFjXAMj4cjCKqoaCLIpD6j00o6XTRRd3WS4hRI+lNHLOH6NjvraR9ZJnfY/QMCa9ozK
	+Z9V+EKOMU4EgAAeGBk6h5mknY6IPvYoZvU4J4doQCrRuMnyaFKylJ9+5udbAWktS0s0
	RPpuagzyafYhFfEz4HW6Slm86xE/BBOy5roO+yciDfm6kxzzSZiOSRQKU/ZtrG7N1N91
	rcZEqoR70xICFR/8F92pUqKo8TEoVQosjaNkObk2C1KihuUTKccSEuyy1hc1SGo/sU/3
	/6Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=fMN9KGJMyL0tFLc8K5mmuH5+nvB6ljMz7eY81qgrYyM=;
	b=ZOp4t6Y+rC7G5Xzygj8PvVcNRxhbUxnjGWmb+kTwwu8y6mSoOQc296PD48J8XICtHZ
	ICGRvPWHgb9QDJiahqCM/qxUjmOsR6OwWR4w46btqp8dAFBDWirjoUgZnq6wvlPkLrSz
	c0TWc4FqMSapHcRGvtavpRmrVqUNXzvy6XNK3G5ZzAkpmSjKejeLHktfUh+L3hAyT/cz
	puMdgcpq1MPpITOS2uLOOESZ4bmrzy55OOrgLirNFnJ8Eov9qLOjIeTFgvMHeN3mazNw
	cSoonBinCx3BuqaEUn5n6QPXEpwlMVitlM/JTtDlKg0DMs9+/faOdxINN8hS/y5iSKbv
	Yrhw==
X-Gm-Message-State: AD7BkJKuh45HYqRoU/1v6p8HB+mZ0t1iv6I5+zqYjqwtU0nFJGV/cYRW79HCh2CfPMLqQg==
X-Received: by 10.140.29.7 with SMTP id a7mr17819306qga.98.1459444244479;
	Thu, 31 Mar 2016 10:10:44 -0700 (PDT)
Received: from eos.sys.comcast.net (a-96-118-179-133.sys.comcast.net.
	[96.118.179.133]) by smtp.gmail.com with ESMTPSA id
	a66sm4309590qkb.20.2016.03.31.10.10.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 31 Mar 2016 10:10:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 31 Mar 2016 17:10:36 +0000
Message-Id: <1459444237-32552-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH 1/2] serialcheck: Fix build with musl and mark BROKENCLEAN
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
X-List-Received-Date: Thu, 31 Mar 2016 17:10:45 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Makefile-Change-order-of-link-flags.patch | 34 ++++++++++++++++++++++
 .../serialcheck/serialcheck_1.0.0.bb               |  9 ++++--
 2 files changed, 41 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/serialcheck/serialcheck/0001-Makefile-Change-order-of-link-flags.patch

diff --git a/meta-oe/recipes-devtools/serialcheck/serialcheck/0001-Makefile-Change-order-of-link-flags.patch b/meta-oe/recipes-devtools/serialcheck/serialcheck/0001-Makefile-Change-order-of-link-flags.patch
new file mode 100644
index 0000000..2ab4834
--- /dev/null
+++ b/meta-oe/recipes-devtools/serialcheck/serialcheck/0001-Makefile-Change-order-of-link-flags.patch
@@ -0,0 +1,34 @@
+From efc8a4e717ba919c869c2da1c7de2d08bc976926 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 24 Feb 2016 18:48:07 +0000
+Subject: [PATCH] Makefile: Change order of link flags
+
+This helps in injectcting LDFLAGS from env to take effect
+as it appears last on cmdline now
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ Makefile | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index ba2bfbb..6d13e68 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1,3 +1,9 @@
+-CFLAGS=-O2 -Wall -Wextra -g -Wno-sign-compare -Wno-pointer-sign
+-CC=gcc
++CFLAGS?=-O2 -Wall -Wextra -g -Wno-sign-compare -Wno-pointer-sign
++CC?=gcc
+ all: serialcheck
++serialcheck : serialcheck.o
++	$(CC) -o serialcheck serialcheck.o $(CFLAGS) $(LDFLAGS)
++
++%.o : %.c
++	$(CC) -c $(CFLAGS) $(CPPFLAGS) $< -o $@
++
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-devtools/serialcheck/serialcheck_1.0.0.bb b/meta-oe/recipes-devtools/serialcheck/serialcheck_1.0.0.bb
index d2de523..cd5e0a4 100644
--- a/meta-oe/recipes-devtools/serialcheck/serialcheck_1.0.0.bb
+++ b/meta-oe/recipes-devtools/serialcheck/serialcheck_1.0.0.bb
@@ -4,16 +4,20 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://git.breakpoint.cc/bigeasy/serialcheck.git \
-            file://0001-Add-option-to-enable-internal-loopback.patch \
-            file://0002-Restore-original-loopback-config.patch"
+           file://0001-Add-option-to-enable-internal-loopback.patch \
+           file://0002-Restore-original-loopback-config.patch \
+           file://0001-Makefile-Change-order-of-link-flags.patch \
+           "
 
 SRCREV = "63854a2d0c0129efab132ec328a75279e013fb84"
 
 S = "${WORKDIR}/git"
 
+DEPENDS_append_libc-musl = " argp-standalone"
 EXTRA_OEMAKE = "-e MAKEFLAGS="
 
 CFLAGS_prepend = "-Wall -Wextra -Wno-sign-compare -Wno-pointer-sign "
+LDFLAGS_append_libc-musl = " -largp"
 
 do_install() {
     install -d ${D}${bindir}
@@ -21,5 +25,6 @@ do_install() {
     install -d ${D}${docdir}/${BP}
     install ${S}/Readme.txt ${D}${docdir}/${BP}
 }
+CLEANBROKEN = "1"
 
 BBCLASSEXTEND = "nativesdk"
-- 
1.9.1


