Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id E536578AF2
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Aug 2018 12:16:44 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id h10-v6so4958207wre.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Aug 2018 05:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Y7n95AK1JRIVRlGOlRqpSI33HMFXcCIPwSNjnieGa4M=;
	b=VBg8bBmnkWFmtHGAo4rGBEZILUzcOglrSvd1pqbTloyIlhWB3C9+Qda4CJUP9Z/wVb
	WgCHfANNk00OUUqeltu3kH/78oHjLWqJ4h5AFcLnkwbXJvJ0mPyI1u60hYrHkAqFNEmj
	pvuYq1XvFmI9vwnIddl3JYlZc2knj3+/tADPGk6/VSNfdG71nhdXIGjLkMQHe9aN/gGC
	4tEGnYvGDz/dHUpjDbKp0Fq7wwqLXASzdxB2/b3/qb4L2WP/+f/+iQ3umo8DopYsvee+
	LoiJNoabbe9SnZdjFTaC9XAA3o1fM6LVLbe8ervCMemz8337oPVOrkCDvMGmdyzl/xs/
	9Grw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Y7n95AK1JRIVRlGOlRqpSI33HMFXcCIPwSNjnieGa4M=;
	b=QSPi7qZsEjlMk2Gbp9bI7rHhE3TGyw88tix0wTNPsKXj+db/3N3X8l+gmC6ZwnoCgk
	S8H8672Bvy9glCMl2clOBOZCTgkaTAaVTaxsXqmOO+WDgHy+4EpLHw7pAsOBRSirlDUn
	F/jP5Vr8htbSebphVEDHgLdc6o3plO3NwxGzHsoyUTJeVDK/gEsudQuHMfhcs4Xkx+k6
	us9mTY/B/r3JLP+5mUCdi5bYQfsqSrzs/VvSJbOglAHHrn4OOuhSfU+g98v1FtJSApWR
	67gS6tlVEB28IE2sZ10Ear00hzqlIkwzMWGj7DF9EhsZxSaMstMj3MbQe7BSrCuI0Tzq
	76zQ==
X-Gm-Message-State: AOUpUlHPARXdUx/jbenvdmcVPyTOI3tm3lDjPortj5KrAJ6RXaPBO2Mr
	w2ANVllqaKKOr2InhKKvJGIWH5bc
X-Google-Smtp-Source: AA+uWPwBqIbksAcVAqt3yDy+QKrxpQq2cyQiZeTAykorBN+YCsJFZeMpLmEeAJDFewhBKtQboN3yRg==
X-Received: by 2002:adf:e287:: with SMTP id
	v7-v6mr1354782wri.139.1533817005485; 
	Thu, 09 Aug 2018 05:16:45 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	s5-v6sm5294752wro.33.2018.08.09.05.16.44
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 09 Aug 2018 05:16:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 Aug 2018 12:16:43 +0000
Message-Id: <20180809121643.32277-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] sg3-utils: fix build with glibc-2.28
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
X-List-Received-Date: Thu, 09 Aug 2018 12:16:45 -0000

Fixes:
http://errors.yoctoproject.org/Errors/Details/185896/

TOPDIR/tmp-glibc/work/core2-64-oe-linux/sg3-utils/1.42-r0/recipe-sysroot-native/usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/8.2.0/ld:
sg_map26.o: in function `nd_match_scandir_select':
/usr/src/debug/sg3-utils/1.42-r0/sg3_utils-1.42/src/sg_map26.c:359:
undefined reference to `major'
TOPDIR/tmp-glibc/work/core2-64-oe-linux/sg3-utils/1.42-r0/recipe-sysroot-native/usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/8.2.0/ld:
/usr/src/debug/sg3-utils/1.42-r0/sg3_utils-1.42/src/sg_map26.c:361:
undefined reference to `minor'
TOPDIR/tmp-glibc/work/core2-64-oe-linux/sg3-utils/1.42-r0/recipe-sysroot-native/usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/8.2.0/ld:
sg_map26.o: in function `nt_typ_from_filename':
/usr/src/debug/sg3-utils/1.42-r0/sg3_utils-1.42/src/sg_map26.c:218:
undefined reference to `major'
TOPDIR/tmp-glibc/work/core2-64-oe-linux/sg3-utils/1.42-r0/recipe-sysroot-native/usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/8.2.0/ld:
/usr/src/debug/sg3-utils/1.42-r0/sg3_utils-1.42/src/sg_map26.c:219:
undefined reference to `minor'
collect2: error: ld returned 1 exit status
Makefile:806: recipe for target 'sg_map26' failed

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../sg3-utils/sg3-utils/glibc-2.28.patch      | 24 +++++++++++++++++++
 .../sg3-utils/sg3-utils_1.42.bb               |  4 +++-
 2 files changed, 27 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/sg3-utils/sg3-utils/glibc-2.28.patch

diff --git a/meta-oe/recipes-support/sg3-utils/sg3-utils/glibc-2.28.patch b/meta-oe/recipes-support/sg3-utils/sg3-utils/glibc-2.28.patch
new file mode 100644
index 0000000000..fbad4135df
--- /dev/null
+++ b/meta-oe/recipes-support/sg3-utils/sg3-utils/glibc-2.28.patch
@@ -0,0 +1,24 @@
+Fixes:
+http://errors.yoctoproject.org/Errors/Details/185896/
+
+TOPDIR/tmp-glibc/work/core2-64-oe-linux/sg3-utils/1.42-r0/recipe-sysroot-native/usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/8.2.0/ld: sg_map26.o: in function `nd_match_scandir_select':
+/usr/src/debug/sg3-utils/1.42-r0/sg3_utils-1.42/src/sg_map26.c:359: undefined reference to `major'
+TOPDIR/tmp-glibc/work/core2-64-oe-linux/sg3-utils/1.42-r0/recipe-sysroot-native/usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/8.2.0/ld: /usr/src/debug/sg3-utils/1.42-r0/sg3_utils-1.42/src/sg_map26.c:361: undefined reference to `minor'
+TOPDIR/tmp-glibc/work/core2-64-oe-linux/sg3-utils/1.42-r0/recipe-sysroot-native/usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/8.2.0/ld: sg_map26.o: in function `nt_typ_from_filename':
+/usr/src/debug/sg3-utils/1.42-r0/sg3_utils-1.42/src/sg_map26.c:218: undefined reference to `major'
+TOPDIR/tmp-glibc/work/core2-64-oe-linux/sg3-utils/1.42-r0/recipe-sysroot-native/usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/8.2.0/ld: /usr/src/debug/sg3-utils/1.42-r0/sg3_utils-1.42/src/sg_map26.c:219: undefined reference to `minor'
+collect2: error: ld returned 1 exit status
+Makefile:806: recipe for target 'sg_map26' failed
+
+Upstream-Status: Pending
+
+--- sg3_utils-1.42.orig/src/sg_map26.c	2018-08-09 11:53:26.907493996 +0000
++++ sg3_utils-1.42/src/sg_map26.c	2018-08-09 11:51:56.713490763 +0000
+@@ -33,6 +33,7 @@
+ #include <sys/ioctl.h>
+ #include <sys/types.h>
+ #include <sys/stat.h>
++#include <sys/sysmacros.h>
+ #include <linux/major.h>
+ 
+ #ifdef HAVE_CONFIG_H
diff --git a/meta-oe/recipes-support/sg3-utils/sg3-utils_1.42.bb b/meta-oe/recipes-support/sg3-utils/sg3-utils_1.42.bb
index f14a5314a2..c37c5e952e 100644
--- a/meta-oe/recipes-support/sg3-utils/sg3-utils_1.42.bb
+++ b/meta-oe/recipes-support/sg3-utils/sg3-utils_1.42.bb
@@ -8,7 +8,9 @@ SECTION = "console/admin"
 LICENSE = "GPLv2+ & BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f90da7fc52172599dbf082d7620f18ca"
 
-SRC_URI = "http://sg.danny.cz/sg/p/sg3_utils-${PV}.tgz"
+SRC_URI = "http://sg.danny.cz/sg/p/sg3_utils-${PV}.tgz \
+    file://glibc-2.28.patch \
+"
 MIRRORS += "http://sg.danny.cz/sg/p https://fossies.org/linux/misc"
 
 UPSTREAM_CHECK_REGEX = "sg3_utils-(?P<pver>\d+(\.\d+)+)\.tgz"
-- 
2.17.1


