Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2F1C874D36
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  6 May 2018 06:18:15 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id j11-v6so18081202pgf.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 May 2018 23:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=F7wcdIYjy57x0m46Bx5eIb6cNUtYHVF+Nk4LrFZeNNk=;
	b=qmUBA+ndElLFhaFh+mNcQcZSmT5FIk7tI2OlTVI9i8zrtonJT56vqbRPscP8ZRghd7
	/W9/uCpYBeGdyaEuGxvY+mMUlM1cqHa2n9Yh7KIm6K09zQDZ0ZCfpXPoe5lj1yzxA0zM
	d45CqGJTT0qKag0m3fPJEeZXB/UUC+oVc6zFADaqaMZs8syUrPRgG/wiuVMIdvuVL5pb
	UhbSTcz8Hd07ZCBt5DLh+2Ef4n0beHJuJiqJxYbLdgeXohJ1A+/YTxwK2MZ+B7B+IDfO
	YXnfZneUgjHKvIGAeHnLJ+VrZw4qniWWa+DEDXtPqT+xU/RROT7tLB2JCyyYt1ncd9FX
	0fDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=F7wcdIYjy57x0m46Bx5eIb6cNUtYHVF+Nk4LrFZeNNk=;
	b=gP4WIXKlZuJUHf2knpB8sMaX5puJgJUBr3SVr8rmSgzh1BxwtRx0LdEQZIg3XaFMNq
	011igT5uF2gdeKZu28FPXfTABuJK1ZlgLgIPw1m0fbmo95v9FurT1ephoAXNpy0y1Oy2
	etJ9sF+Mr5K2+5dUut6Roh37U/z2UXxFxONtoxVBZhKW9Jjd23ZuRh4klJ/W1/Xu4ipr
	STS9hwDVOYIVUETbNo8cia2E1DKJDDvTax04gmbDR2/8g/QSCZW3QcRy+4drb/hEMEAU
	jjTFVbqkGrlU0pCU/eq5xAm0NlH5B32Nrqm8VyQbePU7JaFMLwL3tGhja6W0jlrDEwFf
	tp+Q==
X-Gm-Message-State: ALQs6tACREb5QXZHRsBCtIz5WxWxgNRkAyeNaB0X971Uh1Mpf5yX6Dhr
	5JtzJUjLoa0m9vumfkWrkm1ZRw==
X-Google-Smtp-Source: AB8JxZoMCznXk0JlnR/Yac6hpFvWGHAnDzvdyi3sO//KRAiJG0YXKdQquUjkBgLxEfihVmCpLoOX2g==
X-Received: by 2002:a17:902:14cb:: with SMTP id
	y11-v6mr8422508plg.229.1525587496187; 
	Sat, 05 May 2018 23:18:16 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	s65sm46674457pfj.124.2018.05.05.23.18.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 05 May 2018 23:18:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  5 May 2018 23:18:04 -0700
Message-Id: <20180506061804.19509-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180506061804.19509-1-raj.khem@gmail.com>
References: <20180506061804.19509-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 6/6] squid: Upgrade to 3.5.27
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
X-List-Received-Date: Sun, 06 May 2018 06:18:15 -0000

Drop upstreamed/backported patches

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...xcept-instead-of-throw-for-C-11-comp.patch | 46 -------------------
 .../squid/files/gcc7-fixes.patch              | 26 -----------
 .../{squid_3.5.26.bb => squid_3.5.27.bb}      |  6 +--
 3 files changed, 2 insertions(+), 76 deletions(-)
 delete mode 100644 meta-networking/recipes-daemons/squid/files/0001-SquidNew-use-noexcept-instead-of-throw-for-C-11-comp.patch
 delete mode 100644 meta-networking/recipes-daemons/squid/files/gcc7-fixes.patch
 rename meta-networking/recipes-daemons/squid/{squid_3.5.26.bb => squid_3.5.27.bb} (94%)

diff --git a/meta-networking/recipes-daemons/squid/files/0001-SquidNew-use-noexcept-instead-of-throw-for-C-11-comp.patch b/meta-networking/recipes-daemons/squid/files/0001-SquidNew-use-noexcept-instead-of-throw-for-C-11-comp.patch
deleted file mode 100644
index f482f8088..000000000
--- a/meta-networking/recipes-daemons/squid/files/0001-SquidNew-use-noexcept-instead-of-throw-for-C-11-comp.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 27e10667bf27baf5f119a791e3473bb9435a786a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 23 Apr 2017 10:28:28 -0700
-Subject: [PATCH] SquidNew: use noexcept instead of throw for C++11 compilers
-
-Fixes errors with gcc7 which is more pedantic about c++11
-conformance regarding deprecated features
-
-include/SquidNew.h:21:51: error: dynamic exception specifications are deprecated in C++11
-_SQUID_EXTERNNEW_ void *operator new[] (size_t size) throw (std::bad_alloc)
-                                                       ^~~~~
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- include/SquidNew.h | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/include/SquidNew.h b/include/SquidNew.h
-index 39fcee0..c960347 100644
---- a/include/SquidNew.h
-+++ b/include/SquidNew.h
-@@ -18,19 +18,19 @@
-  */
- #include <new>
- 
--_SQUID_EXTERNNEW_ void *operator new(size_t size) throw (std::bad_alloc)
-+_SQUID_EXTERNNEW_ void *operator new(size_t size) noexcept(false)
- {
-     return xmalloc(size);
- }
--_SQUID_EXTERNNEW_ void operator delete (void *address) throw()
-+_SQUID_EXTERNNEW_ void operator delete (void *address) noexcept(true)
- {
-     xfree(address);
- }
--_SQUID_EXTERNNEW_ void *operator new[] (size_t size) throw (std::bad_alloc)
-+_SQUID_EXTERNNEW_ void *operator new[] (size_t size) noexcept(false)
- {
-     return xmalloc(size);
- }
--_SQUID_EXTERNNEW_ void operator delete[] (void *address) throw()
-+_SQUID_EXTERNNEW_ void operator delete[] (void *address) noexcept(true)
- {
-     xfree(address);
- }
diff --git a/meta-networking/recipes-daemons/squid/files/gcc7-fixes.patch b/meta-networking/recipes-daemons/squid/files/gcc7-fixes.patch
deleted file mode 100644
index 2feca4986..000000000
--- a/meta-networking/recipes-daemons/squid/files/gcc7-fixes.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 660fce9cfa00a57e5b7cec46116a31e21595c306 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 19 Jun 2017 23:47:01 -0700
-Subject: [PATCH] squid: Upgrade to 3.5.26
-
-../../squid-3.5.26/src/DiskIO/DiskThreads/aiops.cc: In function 'void squidaio_init()':                                                              ../../squid-3.5.26/src/DiskIO/DiskThreads/DiskThreads.h:30:50: error: '*' in boolean context, suggest '&&' instead [-Werror=int-in-bool-context]      #define NUMTHREADS (Config.cacheSwap.n_configured*16)
-
-Upstream-Status: Backport
-
----
- src/DiskIO/DiskThreads/aiops.cc | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/DiskIO/DiskThreads/aiops.cc b/src/DiskIO/DiskThreads/aiops.cc
-index b44adfa..e11f948 100644
---- a/src/DiskIO/DiskThreads/aiops.cc
-+++ b/src/DiskIO/DiskThreads/aiops.cc
-@@ -290,7 +290,7 @@ squidaio_init(void)
-     /* Create threads and get them to sit in their wait loop */
-     squidaio_thread_pool = memPoolCreate("aio_thread", sizeof(squidaio_thread_t));
- 
--    assert(NUMTHREADS);
-+    assert(NUMTHREADS != 0);
- 
-     for (i = 0; i < NUMTHREADS; ++i) {
-         threadp = (squidaio_thread_t *)squidaio_thread_pool->alloc();
diff --git a/meta-networking/recipes-daemons/squid/squid_3.5.26.bb b/meta-networking/recipes-daemons/squid/squid_3.5.27.bb
similarity index 94%
rename from meta-networking/recipes-daemons/squid/squid_3.5.26.bb
rename to meta-networking/recipes-daemons/squid/squid_3.5.27.bb
index 3ee96abb7..7dae3cd83 100644
--- a/meta-networking/recipes-daemons/squid/squid_3.5.26.bb
+++ b/meta-networking/recipes-daemons/squid/squid_3.5.27.bb
@@ -21,16 +21,14 @@ SRC_URI = "http://www.squid-cache.org/Versions/v${MAJ_VER}/${MIN_VER}/${BPN}-${P
            file://volatiles.03_squid \
            file://set_sysroot_patch.patch \
            file://squid-don-t-do-squid-conf-tests-at-build-time.patch \
-           file://0001-SquidNew-use-noexcept-instead-of-throw-for-C-11-comp.patch \
            file://0001-configure-Check-for-Wno-error-format-truncation-comp.patch \
-           file://gcc7-fixes.patch \
            file://0001-tools.cc-fixed-unused-result-warning.patch \
            "
 
 SRC_URI_remove_toolchain-clang = "file://0001-configure-Check-for-Wno-error-format-truncation-comp.patch"
 
-SRC_URI[md5sum] = "dc1830cd361e077814aa39bcc3691d8b"
-SRC_URI[sha256sum] = "41d8845863dcd026c856508cd1599d417c8947ffd96e86e24085f9893cb8b8c2"
+SRC_URI[md5sum] = "c17a3ed3a40cd59c23f48b8539dafcd8"
+SRC_URI[sha256sum] = "467da134eaf0f7962ba5881793d106772fb05fefa4aea7d9569eec0412c52433"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=c492e2d6d32ec5c1aad0e0609a141ce9 \
                     file://errors/COPYRIGHT;md5=8861130fae91400bcf99b66f133172b3 \
-- 
2.17.0


