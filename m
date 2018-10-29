Return-Path: <jpewhacker@gmail.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 99DD579A16
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 17:23:04 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id m15so10364438itl.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 10:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=n3VXjI3jQIizWZXyCmPNJpLariQQZHCyDy116WGyLto=;
	b=pBN8VC1vQtMxGPaS5ntm5ItE1MXMKzLY/djKnJzwLO5yOLs+CAbx3SPHM4dCzHgZ4C
	1eJShYaO6j/15eiHIe9CNHXPCFw8nMkrOe7MjWrqeeIYhCkH9wlbQU9/U8o9eQVx1h5y
	1FUZ+nJ8B86E8wot5ovEz6GOsaORY29ENRFrS6GfYHoTrKZFmHQtOwx5Lor+9ROMLbk/
	cC0bXOVnowlyJD84E/q53YNVkzQB6QKVsqEuP2XIxbbpQpa1UUq1xPyQm2c8dVIDCxPZ
	/QGjz5H6dwcbspuAkD+vuDcXze+RgaMHdbFORbA06d8vjJVT6EcmZFe+igpyYd+OEG5N
	XSPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=n3VXjI3jQIizWZXyCmPNJpLariQQZHCyDy116WGyLto=;
	b=kZEadze1Tr/Ebj23S4VmoV6tBQuRp3nHlh7YdxKftzMQzLVJ3U/GpND/GSBrpEdTqj
	OhjJunbCoapqincZ5v3qPQkiuRV1vxJ0IHIfuSKqakMvIRkKlDXo9fZV7uRmXWsnNP7I
	ZXn24ewdrG/Jap2st6ucZRqF5MeiAPXLHoWYDmFhldIlSqQeJg1HBCg+iMnHCFZc1Ejy
	AzlbmdITpmX9DrH21GO9t3fmHpwCxrzB73x6LqHQjwKrHY8uWJqhZk8fhugjprdZHJD4
	RLtqCn1eMjdXuHkQ6imRjLuQVzXmKCeAMUVUkqg9ZwSt3aKvxzt39TkaA73NxoeFSygj
	g3jg==
X-Gm-Message-State: AGRZ1gLXVt0wV43p7aXfiO8szMnNHOwlVn8TcYigUmq30KbD7Qj58z3T
	rbgXNdFV9tqkRBOAMgElWcP1yKB/
X-Google-Smtp-Source: AJdET5c9buQy07tLR//3nOHQrhVX8yCJJ6wyY4rMaIdqnODraNXK+PSPUQlbE2rI6un2ADQSLGVOPw==
X-Received: by 2002:a24:d5d5:: with SMTP id
	a204-v6mr10754454itg.58.1540833785108; 
	Mon, 29 Oct 2018 10:23:05 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	j19-v6sm7284245itj.31.2018.10.29.10.23.03
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 29 Oct 2018 10:23:04 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Oct 2018 12:23:01 -0500
Message-Id: <20181029172301.22106-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][sumo][PATCH] rapidjson: Fix data abort on ARM
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
X-List-Received-Date: Mon, 29 Oct 2018 17:23:04 -0000

The internal memory allocator that RapidJSON uses wasn't correctly
aligning memory in all cases, which resulted in data aborts when running
on ARM-based processors.

This was fixed upstream in 748a652f04cd3a202ce3639770238bd9473b300c

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 ...1-Fix-SIGBUS-due-to-unaligned-access.patch | 100 ++++++++++++++++++
 .../rapidjson/rapidjson_git.bb                |   1 +
 2 files changed, 101 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/rapidjson/rapidjson/0001-Fix-SIGBUS-due-to-unaligned-access.patch

diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson/0001-Fix-SIGBUS-due-to-unaligned-access.patch b/meta-oe/recipes-devtools/rapidjson/rapidjson/0001-Fix-SIGBUS-due-to-unaligned-access.patch
new file mode 100644
index 0000000000..0299fc81a0
--- /dev/null
+++ b/meta-oe/recipes-devtools/rapidjson/rapidjson/0001-Fix-SIGBUS-due-to-unaligned-access.patch
@@ -0,0 +1,100 @@
+From 748a652f04cd3a202ce3639770238bd9473b300c Mon Sep 17 00:00:00 2001
+From: Veselin Georgiev <veselin.georgiev@garmin.com>
+Date: Fri, 27 Jul 2018 13:33:09 -0500
+Subject: [PATCH] Fix SIGBUS due to unaligned access
+
+Update RAPIDJSON_ALIGN() to always align on an 8-byte boundary
+unless otherwise overridden.
+
+On some platforms (such as ARM), 64-bit items (such as doubles and
+64-bit integers) must be aligned to an 8 byte address, even though the
+architecture is only 32-bits. On these platforms, MemoryPoolAllocator
+must match the malloc() behavior and return a 8 byte aligned allocation.
+This eliminates any alignment issues that may occur at the expense of
+additional memory overhead.
+
+Failure to do so caused a SIGBUS signal when calling
+GenericValue::SetNull(). The size of the data_ member of the
+GenericValue class is 16 bytes in 32-bit mode and its constructor
+requires an 8-byte aligned access.
+
+While parsing a JSON formatted string using Document::ParseStream(), a
+stack object containing GenericValue items was constructed. Since the
+stack was 8-byte aligned, the constructor calls would succeed. When the
+lifetime of the object ends, SetObjectRaw() is invoked. This triggered
+an allocation with 4-byte alignment to which the previously 8-byte
+aligned GenericValue array was copied. After this, any call to a
+GenericValue API that triggered the constructor and thus the placement
+new operation on the Data type member would trigger a SIGBUS.
+
+Signed-off-by: Veselin Georgiev <veselin.georgiev@garmin.com>
+Signed-off-by: Joshua Watt <Joshua.Watt@garmin.com>
+Upstream-Status: Accepted 748a652f04cd3a202ce3639770238bd9473b300c
+---
+ include/rapidjson/rapidjson.h    |  9 ++-------
+ test/unittest/allocatorstest.cpp | 26 ++++++++++++--------------
+ 2 files changed, 14 insertions(+), 21 deletions(-)
+
+diff --git a/include/rapidjson/rapidjson.h b/include/rapidjson/rapidjson.h
+index a256c86e7..8cff38c2d 100644
+--- a/include/rapidjson/rapidjson.h
++++ b/include/rapidjson/rapidjson.h
+@@ -269,16 +269,11 @@
+ /*! \ingroup RAPIDJSON_CONFIG
+     \param x pointer to align
+ 
+-    Some machines require strict data alignment. Currently the default uses 4 bytes
+-    alignment on 32-bit platforms and 8 bytes alignment for 64-bit platforms.
++    Some machines require strict data alignment. The default is 8 bytes.
+     User can customize by defining the RAPIDJSON_ALIGN function macro.
+ */
+ #ifndef RAPIDJSON_ALIGN
+-#if RAPIDJSON_64BIT == 1
+-#define RAPIDJSON_ALIGN(x) (((x) + static_cast<uint64_t>(7u)) & ~static_cast<uint64_t>(7u))
+-#else
+-#define RAPIDJSON_ALIGN(x) (((x) + 3u) & ~3u)
+-#endif
++#define RAPIDJSON_ALIGN(x) (((x) + static_cast<size_t>(7u)) & ~static_cast<size_t>(7u))
+ #endif
+ 
+ ///////////////////////////////////////////////////////////////////////////////
+diff --git a/test/unittest/allocatorstest.cpp b/test/unittest/allocatorstest.cpp
+index a5958de19..2202c11f6 100644
+--- a/test/unittest/allocatorstest.cpp
++++ b/test/unittest/allocatorstest.cpp
+@@ -63,23 +63,21 @@ TEST(Allocator, MemoryPoolAllocator) {
+ }
+ 
+ TEST(Allocator, Alignment) {
+-#if RAPIDJSON_64BIT == 1
+-    EXPECT_EQ(RAPIDJSON_UINT64_C2(0x00000000, 0x00000000), RAPIDJSON_ALIGN(0));
+-    for (uint64_t i = 1; i < 8; i++) {
+-        EXPECT_EQ(RAPIDJSON_UINT64_C2(0x00000000, 0x00000008), RAPIDJSON_ALIGN(i));
+-        EXPECT_EQ(RAPIDJSON_UINT64_C2(0x00000000, 0x00000010), RAPIDJSON_ALIGN(RAPIDJSON_UINT64_C2(0x00000000, 0x00000008) + i));
+-        EXPECT_EQ(RAPIDJSON_UINT64_C2(0x00000001, 0x00000000), RAPIDJSON_ALIGN(RAPIDJSON_UINT64_C2(0x00000000, 0xFFFFFFF8) + i));
+-        EXPECT_EQ(RAPIDJSON_UINT64_C2(0xFFFFFFFF, 0xFFFFFFF8), RAPIDJSON_ALIGN(RAPIDJSON_UINT64_C2(0xFFFFFFFF, 0xFFFFFFF0) + i));
++    if (sizeof(size_t) >= 8) {
++        EXPECT_EQ(RAPIDJSON_UINT64_C2(0x00000000, 0x00000000), RAPIDJSON_ALIGN(0));
++        for (uint64_t i = 1; i < 8; i++) {
++            EXPECT_EQ(RAPIDJSON_UINT64_C2(0x00000000, 0x00000008), RAPIDJSON_ALIGN(i));
++            EXPECT_EQ(RAPIDJSON_UINT64_C2(0x00000000, 0x00000010), RAPIDJSON_ALIGN(RAPIDJSON_UINT64_C2(0x00000000, 0x00000008) + i));
++            EXPECT_EQ(RAPIDJSON_UINT64_C2(0x00000001, 0x00000000), RAPIDJSON_ALIGN(RAPIDJSON_UINT64_C2(0x00000000, 0xFFFFFFF8) + i));
++            EXPECT_EQ(RAPIDJSON_UINT64_C2(0xFFFFFFFF, 0xFFFFFFF8), RAPIDJSON_ALIGN(RAPIDJSON_UINT64_C2(0xFFFFFFFF, 0xFFFFFFF0) + i));
++        }
+     }
+-#else
++
+     EXPECT_EQ(0u, RAPIDJSON_ALIGN(0u));
+-    for (uint32_t i = 1; i < 4; i++) {
+-        EXPECT_EQ(4u, RAPIDJSON_ALIGN(i));
+-        EXPECT_EQ(8u, RAPIDJSON_ALIGN(4u + i));
+-        EXPECT_EQ(0xFFFFFFF8u, RAPIDJSON_ALIGN(0xFFFFFFF4u + i));
+-        EXPECT_EQ(0xFFFFFFFCu, RAPIDJSON_ALIGN(0xFFFFFFF8u + i));
++    for (uint32_t i = 1; i < 8; i++) {
++        EXPECT_EQ(8u, RAPIDJSON_ALIGN(i));
++        EXPECT_EQ(0xFFFFFFF8u, RAPIDJSON_ALIGN(0xFFFFFFF0u + i));
+     }
+-#endif
+ }
+ 
+ TEST(Allocator, Issue399) {
diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
index 8ab35d224b..6fcdf8d844 100644
--- a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
+++ b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://license.txt;md5=ba04aa8f65de1396a7e59d1d746c2125"
 
 SRC_URI = "git://github.com/miloyip/rapidjson.git;nobranch=1 \
            file://remove-march-native-from-CMAKE_CXX_FLAGS.patch \
+           file://0001-Fix-SIGBUS-due-to-unaligned-access.patch \
 "
 
 SRCREV = "e5635fb27feab7f6e8d7b916aa20ad799045a641"
-- 
2.17.1


