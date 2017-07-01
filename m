Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id CFA2C71ADA
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Jul 2017 20:15:23 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id j186so18904390pge.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 01 Jul 2017 13:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=NXRPuSDYGRnCaZ7r97+0ykwTeT82ILsp3q5QE0ukSgw=;
	b=qiC5zLuJTxF3+AQhCO0+A5PpwxTDJuv5/6qys0Mi4XU/O/zWhfJmD9o6zqYslyJoDV
	JmK0KSQB/VciZx5qEzXk1RkWNCY3N5eGOvjuSHU2UXywpK6ytwRmEtwdOR3cdSlfl3Xl
	P/2SG/FAXTHT4d9dteGs9cBc1J9uz1xfIgQgVg26JYUtLV0YIcguQavhKJJnBrYBTAF9
	CLG4qNGYmIYsMBci0yUDTve9WuX32oI/gDiV92o3fV55qY5a7U+mYpI4LqY/+Uwdbalj
	LBc900tBe4A/hesC+38UBeM4l0F6bNc2BqtaEtJaANxze41Jj7gqAmsFAwWq8iant+KU
	NIbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=NXRPuSDYGRnCaZ7r97+0ykwTeT82ILsp3q5QE0ukSgw=;
	b=eSF5dkCCmkaxBj2YfYfPz/mzC7j1pTCFZ11qdZFr+UE2BtMvCf9KpoOIfqliMN8v3u
	/ZSblHc5ldrjcEtBIGX/1n/KA/lvMhO+S8TROgDk2lnNSjF6mt9cYKoXjzkVyTLLjr8b
	a6HXdlet14m7jilJygxtdLWHAyVPSPYD6W6BH0ZEu0s1N7vMemElajOinqOWHbLLMXNJ
	D7EYNmTWK8QXc73zs986tyDnpaO5RZJmKrQuGfZYF2cOSRhzP4ptMl7Lt1ii//mfopTR
	tk0Uc5LTWctJLUmtSPaghn/oxo40gEuXEvlVdynQmdywvhoHhsEUjDXVpw2ozi6ko6Ir
	l5gA==
X-Gm-Message-State: AIVw113l/mJgjJQimFj8CIm5OFzeI03G/lPhHeCJw02uxHvCYuuNpdWs
	4Vff+sKLKXy9aGau
X-Received: by 10.101.85.14 with SMTP id f14mr2206019pgr.112.1498940124665;
	Sat, 01 Jul 2017 13:15:24 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	g5sm20020227pgc.42.2017.07.01.13.15.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 01 Jul 2017 13:15:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  1 Jul 2017 13:15:14 -0700
Message-Id: <20170701201515.24835-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
Subject: [meta-oe][PATCH 1/2] libtorrent: Link in 64bit atomics for ppc
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
X-List-Received-Date: Sat, 01 Jul 2017 20:15:24 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...efine-64bit-atomic-helpers-for-ppc-32-bit.patch | 30 ++++++++++++++++++++++
 .../libtorrent/libtorrent_git.bb                   |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/libtorrent/libtorrent/0001-Define-64bit-atomic-helpers-for-ppc-32-bit.patch

diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0001-Define-64bit-atomic-helpers-for-ppc-32-bit.patch b/meta-oe/recipes-connectivity/libtorrent/libtorrent/0001-Define-64bit-atomic-helpers-for-ppc-32-bit.patch
new file mode 100644
index 000000000..4d0979710
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libtorrent/libtorrent/0001-Define-64bit-atomic-helpers-for-ppc-32-bit.patch
@@ -0,0 +1,30 @@
+From c9859a38a58996b8767a30e14febc03845f66f95 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 1 Jul 2017 13:10:53 -0700
+Subject: [PATCH] Define 64bit atomic helpers for ppc 32-bit
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/atomic64.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/atomic64.c b/src/atomic64.c
+index f841b39b..35c7c9d8 100644
+--- a/src/atomic64.c
++++ b/src/atomic64.c
+@@ -18,10 +18,10 @@
+ #include <stdbool.h>
+ 
+ /*
+- * only need these on MIPS, since it lacks hardware 64-bit atomics,
++ * only need these on MIPS & PPC32, since it lacks hardware 64-bit atomics,
+  * unlike x86 and ARM.
+  */
+-#if defined(__mips__) || defined(__mipsel__)
++#if defined(__mips__) || defined(__mipsel__) || defined(__powerpc__)
+ 
+ static void __spin_lock(volatile int *lock) {
+   while (__sync_lock_test_and_set(lock, 1))
+-- 
+2.13.2
+
diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb b/meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb
index 0febebd93..92e65289a 100644
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb
+++ b/meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb
@@ -9,6 +9,7 @@ DEPENDS = "zlib libsigc++-2.0 openssl cppunit"
 SRC_URI = "git://github.com/rakshasa/libtorrent \
            file://don-t-run-code-while-configuring-package.patch \
            file://0001-implement-64bit-atomic-for-mips.patch \
+           file://0001-Define-64bit-atomic-helpers-for-ppc-32-bit.patch \
            "
 SRCREV = "c167c5a9e0bcf0df23ae5efd91396aae0e37eb87"
 
-- 
2.13.2


