Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 7BA7862133
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Apr 2018 23:54:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 001F120B70;
	Wed,  4 Apr 2018 23:54:14 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id zOpnzL_Dkypf; Wed,  4 Apr 2018 23:54:13 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CB0162014F;
	Wed,  4 Apr 2018 23:54:12 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 5473A1633B6;
	Wed,  4 Apr 2018 19:54:12 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Apr 2018 19:54:10 -0400
Message-Id: <1522886051-4482-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH 1/2] iperf3: drop patch to include stdint.h
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
X-List-Received-Date: Wed, 04 Apr 2018 23:54:13 -0000

From: Denys Dmytriyenko <denys@ti.com>

Fixed upstream:
https://github.com/esnet/iperf/commit/a8ee9c650b3efe4453a69ceebe4d71c3cb4bcadf

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...de-stdint.h-for-various-std-c99-int-types.patch | 39 ----------------------
 meta-oe/recipes-benchmark/iperf3/iperf3_3.2.bb     |  1 -
 2 files changed, 40 deletions(-)
 delete mode 100644 meta-oe/recipes-benchmark/iperf3/iperf3/0001-include-stdint.h-for-various-std-c99-int-types.patch

diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3/0001-include-stdint.h-for-various-std-c99-int-types.patch b/meta-oe/recipes-benchmark/iperf3/iperf3/0001-include-stdint.h-for-various-std-c99-int-types.patch
deleted file mode 100644
index ae36208..0000000
--- a/meta-oe/recipes-benchmark/iperf3/iperf3/0001-include-stdint.h-for-various-std-c99-int-types.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From be653711fb92d2430b3ecc546b4e3ad927d19ec5 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 14 Jul 2017 12:59:42 -0700
-Subject: [PATCH 1/2] include stdint.h for various std c99 int types
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/cjson.h | 2 ++
- src/timer.h | 1 +
- 2 files changed, 3 insertions(+)
-
-diff --git a/src/cjson.h b/src/cjson.h
-index fb8cd3b..69cd272 100644
---- a/src/cjson.h
-+++ b/src/cjson.h
-@@ -23,6 +23,8 @@
- #ifndef cJSON__h
- #define cJSON__h
- 
-+#include <stdint.h>
-+
- #ifdef __cplusplus
- extern "C"
- {
-diff --git a/src/timer.h b/src/timer.h
-index 0f9c5eb..0b195be 100644
---- a/src/timer.h
-+++ b/src/timer.h
-@@ -31,6 +31,7 @@
- #define __TIMER_H
- 
- #include <sys/time.h>
-+#include <stdint.h>
- 
- /* TimerClientData is an opaque value that tags along with a timer.  The
- ** client can use it for whatever, and it gets passed to the callback when
--- 
-2.13.3
-
diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_3.2.bb b/meta-oe/recipes-benchmark/iperf3/iperf3_3.2.bb
index 4d1b0c4..2ed0811 100644
--- a/meta-oe/recipes-benchmark/iperf3/iperf3_3.2.bb
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3_3.2.bb
@@ -15,7 +15,6 @@ DEPENDS = "openssl"
 
 SRC_URI = "git://github.com/esnet/iperf.git \
            file://automake-foreign.patch \
-           file://0001-include-stdint.h-for-various-std-c99-int-types.patch \
            file://0002-Remove-pg-from-profile_CFLAGS.patch \
            "
 
-- 
2.7.4


