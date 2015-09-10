Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 9F3C3736B6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Sep 2015 12:50:48 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so21901920wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Sep 2015 05:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=HVdTzTfSzn7HwMExo+WctFTbzT7llwN3uC9qSDM7PwY=;
	b=inxKJDDu/BodmLarIOktGX+pRx66cAvMZZyg+w/9DA9Q5dHMVSXCDtK01+JY57/iWj
	jeTyde1WOExpf9BdyV4ujQwuyOFfqrrNMjtEPzKCYidWdFhz90OQMj0UKkgRhGZxg1Iq
	n3BoP9Rleb73lVBQWCy/Mol7d0909iEcuwr4OSFUg4SwNRvlmU0VgL8EXK9P1JXcIJG1
	Ykri8/CvTsSvpsXLdFrpc/AsrDCDNkzfzcTpwRdZThJufA1qVal/IB+yDJCmd1OTb4Ow
	TSOttSqBBbDdXJwWiwqVBMaLw+Uj2QJoHjku1xj4GUDcRP4VGeOKwaMYUFjqhPrydzah
	nHvA==
X-Received: by 10.180.90.107 with SMTP id bv11mr6203382wib.69.1441889448734;
	Thu, 10 Sep 2015 05:50:48 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	wj4sm2070369wjb.10.2015.09.10.05.50.48
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Sep 2015 05:50:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Sep 2015 14:51:45 +0200
Message-Id: <1441889505-17454-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.5.1
Subject: [meta-oe][PATCH] gpsd: Fix build with gcc-5.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Sep 2015 12:50:53 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../0001-Include-stdatomic.h-only-in-C-mode.patch  | 43 ++++++++++++++++++++++
 meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb       |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd-3.14/0001-Include-stdatomic.h-only-in-C-mode.patch

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-3.14/0001-Include-stdatomic.h-only-in-C-mode.patch b/meta-oe/recipes-navigation/gpsd/gpsd-3.14/0001-Include-stdatomic.h-only-in-C-mode.patch
new file mode 100644
index 0000000..bc9167e
--- /dev/null
+++ b/meta-oe/recipes-navigation/gpsd/gpsd-3.14/0001-Include-stdatomic.h-only-in-C-mode.patch
@@ -0,0 +1,43 @@
+From 79f6d9133378325d70a92e66f7352c1becefbb88 Mon Sep 17 00:00:00 2001
+From: Gleb Smirnoff <glebius@FreeBSD.org>
+Date: Sat, 16 May 2015 02:47:28 +0300
+Subject: [PATCH] Include <stdatomic.h> only in C mode.
+
+Upstream-Status: Backport from 3.15
+
+Without this build with gcc-5.2 fails with:
+| arm-oe-linux-gnueabi-g++ -march=armv4t -mthumb -mthumb-interwork -mtune=arm920t --sysroot=/OE/build/shr-core/tmp-glibc/sysroots/om-gta02 -o clock_gettime-qt.os -c -O2 -pipe -g -feliminate-unused-debug-types --sysroot=/OE/build/shr-core/tmp-glibc/sysroots/om-gta02 -Wextra -Wall -Wno-uninitialized -Wno-missing-field-initializers -Wcast-align -Wmissing-declarations -Wpointer-arith -Wreturn-type -pthread -Wmissing-declarations -g -O0 -pthread -fPIC -DUSE_QT -DQT_SHARED -I/OE/build/shr-core/tmp-glibc/sysroots/om-gta02/usr/include/dbus-1.0 -I/OE/build/shr-core/tmp-glibc/sysroots/om-gta02/usr/lib/dbus-1.0/include -I/OE/build/shr-core/tmp-glibc/sysroots/om-gta02/usr/include/qt4/QtNetwork -I/OE/build/shr-core/tmp-glibc/sysroots/om-gta02/usr/include/qt4 -I/OE/build/shr-core/tmp-glibc/sysroots/om-gta02/usr/include/qt4/QtCore clock_gettime.c
+| In file included from compiler.h:50:0,
+|                  from clock_gettime.c:10:
+| /OE/build/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/5.2.0/include/stdatomic.h:40:9: error: '_Atomic' does not name a type
+|  typedef _Atomic _Bool atomic_bool;
+|          ^
+....
+
+More info:
+https://gcc.gnu.org/bugzilla/show_bug.cgi?id=60932
+
+Signed-off-by: Gary E. Miller <gem@rellim.com>
+---
+ compiler.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/compiler.h b/compiler.h
+index 837c935..03430c0 100644
+--- a/compiler.h
++++ b/compiler.h
+@@ -66,9 +66,9 @@
+     } while (0)
+ 
+ #ifdef HAVE_STDATOMIC_H
+-#ifndef __COVERITY__	/* Coverity is confused by a GNU typedef */
++#if !defined(__COVERITY__) && !defined(__cplusplus)
+ #include <stdatomic.h>
+-#endif /* __COVERITY__ */
++#endif /* __COVERITY__ || __cplusplus */
+ #endif /* HAVE_STDATOMIC_H */
+ 
+ #ifdef HAVE_OSATOMIC_H
+-- 
+2.5.1
+
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
index 272bba8..dae39c2 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
@@ -15,6 +15,7 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/${BPN}/${BP}.tar.gz \
     file://0001-Check-for-__STDC_NO_ATOMICS__-before-using-stdatomic.patch \
     file://0002-Add-a-test-for-C11-and-check-we-have-C11-before-usin.patch \
     file://0003-Whoops-check-for-C11-not-for-not-C11-in-stdatomic.h-.patch \
+    file://0001-Include-stdatomic.h-only-in-C-mode.patch \
     file://gpsd-default \
     file://gpsd \
     file://60-gpsd.rules \
-- 
2.5.1


