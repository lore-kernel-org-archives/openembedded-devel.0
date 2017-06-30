Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f45.google.com (mail-pg0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id 4B9E778283
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jun 2017 13:00:35 +0000 (UTC)
Received: by mail-pg0-f45.google.com with SMTP id j186so63482232pge.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jun 2017 06:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=uawfpAPnGIUrB1qXYyQjT9WsbfIjocLurGlvO/vmmEA=;
	b=gSx0+2Jdq/NFnHWOQKDsVwc5d5ZkKt5V0aqF5N3BR6TImjoC0XbOoL7mzuRZg0qeYz
	+1EMsvflGRS2nAn50nmDTOJ0kiU9pXnr0aT5CiV8ko24VQ3pP32X9q7gNvgnc24z/Cf6
	h99tCCQ/qY57P12Xf9BfD0Dss7YH7pVZFJBHlVCSCkwgV7PIKfPrrLKvdeo2ypciqj/s
	WYna2RoJxUa6rddc3yV9Fr6iVdJ1jJpJAmy8M4I0hMYvCuonfHa3yd7ZuvS5pVorz6uf
	ga8PwzG+C3YbbfJzKBx9oU6nCRqjJVrhO9fBc8ZLwlDqa6Fcb+1+f5PznjtvQSImGWso
	RA3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=uawfpAPnGIUrB1qXYyQjT9WsbfIjocLurGlvO/vmmEA=;
	b=s62viFmmI0dl5BqUs4ij/asow8uYO2LUVeptDonXzIpgG4mzyrsdSYlodJvZdIx83s
	tQYlqRTlD5sCRFaETaCOJKr0oSoG9UWMW6U2qAQpzGrRoSvZxcBXVru2zVwgPUWctx0b
	Wv21rMmOBLNUYHFtcEUElnD5Q8LvCAXOSQts6rzlPkZt9J8ztpXQtHxqtxVwlLNXc8wQ
	hHOS8YUMPP3Sc6u7nqbk2gjhscCOeO25wEVthRK6THRsCSilW66IA10CMF3rBJDwTgXj
	iR9CJRDhXQmUVi7BJAL3jtxl/f5l1s0djRbKkehC4bqGDJKQpF6i14vuv/HY2sitCPId
	j05Q==
X-Gm-Message-State: AKS2vOzMeWughzmq2HiMArYZm+zWZsph0nug12BZNJ36IQeu+fT6Rpev
	mU961GtWqTDLnhib
X-Received: by 10.84.232.79 with SMTP id f15mr23843842pln.189.1498827636384;
	Fri, 30 Jun 2017 06:00:36 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	t26sm10735590pfl.41.2017.06.30.06.00.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Jun 2017 06:00:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Jun 2017 05:59:56 -0700
Message-Id: <20170630125957.3342-16-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170630125957.3342-1-raj.khem@gmail.com>
References: <20170630125957.3342-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 16/17] uim: Add support for aarch64
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
X-List-Received-Date: Fri, 30 Jun 2017 13:00:36 -0000

Backport patch from
https://github.com/uim/libgcroots/pull/1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../uim/uim/0001-Add-support-for-aarch64.patch     | 82 ++++++++++++++++++++++
 meta-oe/recipes-support/uim/uim_1.8.6.bb           |  1 +
 2 files changed, 83 insertions(+)
 create mode 100644 meta-oe/recipes-support/uim/uim/0001-Add-support-for-aarch64.patch

diff --git a/meta-oe/recipes-support/uim/uim/0001-Add-support-for-aarch64.patch b/meta-oe/recipes-support/uim/uim/0001-Add-support-for-aarch64.patch
new file mode 100644
index 000000000..4b1249436
--- /dev/null
+++ b/meta-oe/recipes-support/uim/uim/0001-Add-support-for-aarch64.patch
@@ -0,0 +1,82 @@
+From 24fd52cc45f7b5ff45afe072f5fbe66485df8c8e Mon Sep 17 00:00:00 2001
+From: Andreas Schwab <schwab@suse.de>
+Date: Wed, 29 Oct 2014 14:18:28 +0100
+Subject: [PATCH] Add support for aarch64
+
+* include/private/gcconfig.h: Add support for aarch64.
+---
+ sigscheme/libgcroots/include/private/gcconfig.h | 37 +++++++++++++++++++++++++
+ 1 file changed, 37 insertions(+)
+
+diff --git a/sigscheme/libgcroots/include/private/gcconfig.h b/sigscheme/libgcroots/include/private/gcconfig.h
+index 4d42b03..0f13db6 100644
+--- a/sigscheme/libgcroots/include/private/gcconfig.h
++++ b/sigscheme/libgcroots/include/private/gcconfig.h
+@@ -62,6 +62,13 @@
+ # endif
+ 
+ /* Determine the machine type: */
++# if defined(__aarch64__)
++#    define AARCH64
++#    if !defined(LINUX)
++#      define NOSYS
++#      define mach_type_known
++#    endif
++# endif
+ # if defined(__arm__) || defined(__thumb__)
+ #    define ARM32
+ #    if !defined(LINUX) && !defined(NETBSD)
+@@ -231,6 +238,10 @@
+ #    define IA64
+ #    define mach_type_known
+ # endif
++# if defined(LINUX) && defined(__aarch64__)
++#    define AARCH64
++#    define mach_type_known
++# endif
+ # if defined(LINUX) && defined(__arm__)
+ #    define ARM32
+ #    define mach_type_known
+@@ -504,6 +515,7 @@
+ 		    /* 			running Amdahl UTS4		*/
+                     /*             S390       ==> 390-like machine      */
+ 		    /*                  running LINUX                   */
++                    /*             AARCH64    ==> ARM AArch64           */
+ 		    /* 		   ARM32      ==> Intel StrongARM	*/
+ 		    /* 		   IA64	      ==> Intel IPF		*/
+ 		    /*				  (e.g. Itanium)	*/
+@@ -1724,6 +1736,31 @@
+ #   endif
+ # endif
+ 
++# ifdef AARCH64
++#   define CPP_WORDSZ 64
++#   define MACH_TYPE "AARCH64"
++#   define ALIGNMENT 8
++#   ifndef HBLKSIZE
++#     define HBLKSIZE 4096
++#   endif
++#   ifdef LINUX
++#     define OS_TYPE "LINUX"
++#     define LINUX_STACKBOTTOM
++#     define DYNAMIC_LOADING
++      extern int __data_start[];
++#     define DATASTART ((ptr_t)__data_start)
++      extern char _end[];
++#     define DATAEND ((ptr_t)(&_end))
++#   endif
++#   ifdef NOSYS
++      /* __data_start is usually defined in the target linker script.   */
++      extern int __data_start[];
++#     define DATASTART ((ptr_t)__data_start)
++      extern void *__stack_base__;
++#     define STACKBOTTOM ((ptr_t)__stack_base__)
++#   endif
++# endif
++
+ # ifdef ARM32
+ #   define CPP_WORDSZ 32
+ #   define MACH_TYPE "ARM32"
+-- 
+2.13.2
+
diff --git a/meta-oe/recipes-support/uim/uim_1.8.6.bb b/meta-oe/recipes-support/uim/uim_1.8.6.bb
index 76a41252d..ed846b968 100644
--- a/meta-oe/recipes-support/uim/uim_1.8.6.bb
+++ b/meta-oe/recipes-support/uim/uim_1.8.6.bb
@@ -8,6 +8,7 @@ SRC_URI = "http://uim.googlecode.com/files/uim-${PV}.tar.bz2"
 
 SRC_URI_append_class-target = " file://uim-module-manager.patch \
     file://0001-fix-bug-for-cross-compile.patch \
+    file://0001-Add-support-for-aarch64.patch \
 "
 SRC_URI[md5sum] = "ecea4c597bab1fd4ba98ea84edcece59"
 SRC_URI[sha256sum] = "7b1ea803c73f3478917166f04f67cce6e45ad7ea5ab6df99b948c17eb1cb235f"
-- 
2.13.2


