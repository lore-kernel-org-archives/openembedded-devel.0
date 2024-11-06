Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 378DBD29F9F
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 06:31:34 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.40029.1730874683801793480
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 22:31:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=IN1DOj8M;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1730874684; x=1762410684;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=byccKWOMGBpW2sSMgNVfHFjVrGZQouprZustjEnNCZ0=;
  b=IN1DOj8M/wdAUs9fP0JV/TMZLJgpXVSaQfe/Wp1YnVJJTYQBoLebW4LI
   /xjJGMGp+qbVPpumeqhD9Z6kVWG/Wfvd9C8QDUOm5bNE8CsUBe14luVya
   MNj32EDt+Mm9vx6DTZ/HtG5aeiuGvP0O7jYYKYWPp/OMXz2WFvPu0VIBO
   AHVxAGC4p+yFr9L/zziCy2g0gX2vk+c5/Xvwm2anmSZV3dQOy591AIyI1
   gkbrwBHr2Amt/xaCBIarocjtridJIkc2su7IImTsnCGn5QsuaQuXsgGQW
   Ef6LqzJXHvEOpsjSaM2m38aKDGvgZzhgSD/NPC6abEFYhxgvA3/qaXcKP
   w==;
X-CSE-ConnectionGUID: qlt4xDSFSYq4jN8lNTHWTA==
X-CSE-MsgGUID: CxRgQL25QOOiuB2ulsiNPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="167636025"
X-IronPort-AV: E=Sophos;i="6.11,262,1725289200"; 
   d="scan'208";a="167636025"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 15:31:23 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1B050DB3C6
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:21 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 49E87D50E0
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:20 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id D68EA20071A01
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:19 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 85E391A01E9;
	Wed,  6 Nov 2024 14:31:19 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 25/46] python3-grpcio-tools: upgrade 1.66.2 -> 1.67.1
Date: Wed,  6 Nov 2024 14:30:39 +0800
Message-Id: <1730874660-2364-25-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
References: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28778.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28778.005
X-TMASE-Result: 10-0.133800-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yX84FZpy/6JVkdS3kPlaZyXfUZT83lbkENb2
	e7N2CFQy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AZskwWqoib3GSYicW3M8Of0yN
	1ObUQ2lAbUWQQYnnz4DeChXZ2Heqeny8X/DSjpXx5deF6OSK9l1pjn692i6cI0753H8N3nYvnAw
	8yp081LN4PiAm1Fe4BQr7W/2h+I70fE8yM4pjsDwtuKBGekqUpnH7sbImOEBTRW7O3yR3DdOzou
	MeVqIy1XF/HFcfRP3pGkDVQWojNBJj5YjQ0x8X2NGruAKKWR4WMdyo0ekXiZZMnlBTmxc6pOMxP
	XCzKPI7sfZ9V6Q6rCZgvUoiYqGrVm457vI8IG8B/Y4nFsBWAdD6Qrn3xh/cy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Nov 2024 06:31:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113710

From: Wang Mingyu <wangmy@fujitsu.com>

0001-protobuf-Disable-musttail-attribute-on-mips.patch
0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
refreshed for 1.67.1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...tobuf-Disable-musttail-attribute-on-mips.patch | 10 ++++++----
 ...p.py-Do-not-mix-C-and-C-compiler-options.patch | 15 ++++++---------
 ...s_1.66.2.bb => python3-grpcio-tools_1.67.1.bb} |  2 +-
 3 files changed, 13 insertions(+), 14 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio-tools_1.66.2.bb => python3-grpcio-tools_1.67.1.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-protobuf-Disable-musttail-attribute-on-mips.patch b/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-protobuf-Disable-musttail-attribute-on-mips.patch
index 67505d0ce..bf13c71cd 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-protobuf-Disable-musttail-attribute-on-mips.patch
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-protobuf-Disable-musttail-attribute-on-mips.patch
@@ -1,4 +1,4 @@
-From 64d737318656286f69ddc5ad654072785ddcbbed Mon Sep 17 00:00:00 2001
+From 028a02fa7f03a3bcd590624d32b09100129e096a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 16 Sep 2022 19:09:15 -0700
 Subject: [PATCH] protobuf: Disable musttail attribute on mips
@@ -9,12 +9,14 @@ Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
 ---
- third_party/protobuf/src/google/protobuf/port_def.inc | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
+ third_party/protobuf/src/google/protobuf/port_def.inc | 1 +
+ 1 file changed, 1 insertion(+)
 
+diff --git a/third_party/protobuf/src/google/protobuf/port_def.inc b/third_party/protobuf/src/google/protobuf/port_def.inc
+index 2b13718..8875e3e 100644
 --- a/third_party/protobuf/src/google/protobuf/port_def.inc
 +++ b/third_party/protobuf/src/google/protobuf/port_def.inc
-@@ -298,6 +298,7 @@
+@@ -242,6 +242,7 @@ static_assert(PROTOBUF_ABSL_MIN(20230125, 3),
  #error PROTOBUF_TAILCALL was previously defined
  #endif
  #if ABSL_HAVE_CPP_ATTRIBUTE(clang::musttail) && !defined(__arm__) &&  \
diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch b/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
index 07276c17f..5366a1e1c 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
@@ -1,4 +1,4 @@
-From 9b2f1d400db8b8d0045f5a58a748a2dc52b5c9ef Mon Sep 17 00:00:00 2001
+From f1bf68aaa5417bcb7ad4996f1be8d2c0f53c521c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 17 Feb 2021 13:38:55 -0800
 Subject: [PATCH] setup.py: Do not mix C and C++ compiler options
@@ -23,14 +23,14 @@ Upstream-Status: Inappropriate [oe specific]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- setup.py | 9 ++++++---
- 1 file changed, 6 insertions(+), 3 deletions(-)
+ setup.py | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
 
 diff --git a/setup.py b/setup.py
-index cc53e79..be3bc78 100644
+index 5e19b63..61b30d8 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -88,9 +88,11 @@
+@@ -90,9 +90,11 @@ def check_linker_need_libatomic():
          b"#include <atomic>\n"
          + b"int main() { return std::atomic<int64_t>{}; }"
      )
@@ -45,7 +45,7 @@ index cc53e79..be3bc78 100644
          stdin=PIPE,
          stdout=PIPE,
          stderr=PIPE,
-@@ -101,7 +103,7 @@
+@@ -103,7 +105,7 @@ def check_linker_need_libatomic():
      # Double-check to see if -latomic actually can solve the problem.
      # https://github.com/grpc/grpc/issues/22491
      cpp_test = subprocess.Popen(
@@ -54,6 +54,3 @@ index cc53e79..be3bc78 100644
          stdin=PIPE,
          stdout=PIPE,
          stderr=PIPE,
--- 
-2.25.1
-
diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.66.2.bb b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.67.1.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-grpcio-tools_1.66.2.bb
rename to meta-python/recipes-devtools/python/python3-grpcio-tools_1.67.1.bb
index 6765bed04..6ac826c5c 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.66.2.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.67.1.bb
@@ -14,7 +14,7 @@ DEPENDS += "python3-grpcio"
 SRC_URI += "file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch \
             file://0001-protobuf-Disable-musttail-attribute-on-mips.patch \
             "
-SRC_URI[sha256sum] = "4a36e07913d26ba5ccfd2685ba63ca97f26b08c249d2cc9e74dda37efa49d7e4"
+SRC_URI[sha256sum] = "d9657f5ddc62b52f58904e6054b7d8a8909ed08a1e28b734be3a707087bcf004"
 
 RDEPENDS:${PN} = "python3-grpcio"
 
-- 
2.34.1


