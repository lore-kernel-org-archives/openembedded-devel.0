Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D39D4C54EE9
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 02:22:34 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.7336.1663640543100849093
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Sep 2022 19:22:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Pr5c70Ma;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1663640541; i=@fujitsu.com;
	bh=aFIGrZ+C3ES63jzL6WDd1bfYfKL0NtvnXOvi8zfQ8zE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Pr5c70MaV/IhzZwtGP9k914yX/L/2aosofU20eraxAC6pw+6D+F/I0//9lPghGWZC
	 QfTKP2jrSIMPRlYUfUjJ/oXJR0tYbZLAC77PbVC27ToA79GlYj4Mm/mgEzlOV0jJMh
	 +mcR9LbBuTlx4f5LSpaOisdC20tZsHV9rcyozUf69/bns9X3AdkIMK/vN+sm6XwRos
	 5VZSJDVfoxZNQOwSkbR8ftS8+Z8aoPxp7wHCio7vnXm9e9R/Nuds04yR0FjTUzj+pD
	 8djGmpn8nSgdXpMnxDqtHlF9zF9dKmXccc1TsBBaLULqycoM3Xqb8Y6bwo8Bmhos9E
	 qdlATN42LnI0g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPIsWRWlGSWpSXmKPExsViZ8MxSfeOsma
  ywYpp4hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0bXpKiCVqmK4/e72RsYN4p3MXJxCAk8YZQ4
  uG4NK4RznUnib0MrC4Szh1Hi/f8XzF2MnBxsAmoS02/dYAWxRQT0JZbO3gMWZxZQkXjxu4cdx
  BYWCJJo3PcCzGYRUJXo/7mMDcTmFXCSWHRsJlivhICCxJSH75kh4oISJ2c+YYGYIyFx8AXELg
  kBRYnZl5tZIOwKicbph5ggbDWJq+c2MU9g5J+FpH0WkvYFjEyrGK2TijLTM0pyEzNzdA0NDHQ
  NDU11Lc10Dc30Eqt0E/VSS3Xz8otKMnQN9RLLi/VSi4v1iitzk3NS9PJSSzYxAsMypThBYAfj
  3n2/9A4xSnIwKYnyctVpJAvxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4LUX1EwWEixKTU+tSMvMA
  cYITFqCg0dJhHerElCat7ggMbc4Mx0idYpRl2Pm17YDzEIsefl5qVLivBtAigRAijJK8+BGwO
  L1EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVh3okgU3gy80rgNr0COoIJ6IgbKuogR5QkIqS
  kGpimf3reUjbpoCz7d+9jt19JeU+QNOo+FMvS9ztg9vnItOS6E6u2uL/Js7oU8+f6/EOhtVez
  LTU+6F9sn3pgs55Z3EpR2XstvCrHrqpd/nE820H6tPV6To71x2/N4LrYWe1SMG/XxuULXQX0J
  oQ2std82HvxwJmQOznv/zyYsnD75+dT3SaaviiJWaaSvuKe0PfsTxmXP21WZJ9ltOTOL+dbda
  ZueYHV4oYvV0+akMC48lHiNN/MW1cZv86/vtpqecmGLxMznaLqFPd2bynebnThNb9M2ao8f9W
  Hv058dudwfWVSHdr5716P3lElBrlP/Uy5Nb9nP805EP5o/+7n7eVu+qWGNp6X2PY8WpNQcvqo
  kRJLcUaioRZzUXEiAA5x79xSAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-745.messagelabs.com!1663640539!253527!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14967 invoked from network); 20 Sep 2022 02:22:20 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-15.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 20 Sep 2022 02:22:20 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id C16021000DC
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 03:22:19 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id B4B771000CC
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 03:22:19 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 20 Sep 2022 03:22:18 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-grpcio-tools: upgrade 1.48.1 ->
 1.49.0
Date: Tue, 20 Sep 2022 10:22:05 +0800
Message-ID: <1663640525-27494-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Sep 2022 02:22:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98883

0001-protobuf-Disable-musttail-attribute-on-mips.patch
refreshed for new version.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...f-Disable-musttail-attribute-on-mips.patch | 19 ++++++++++---------
 ...48.1.bb => python3-grpcio-tools_1.49.0.bb} |  2 +-
 2 files changed, 11 insertions(+), 10 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio-tools_1.48.1.bb => python3-grpcio-tools_1.49.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-protobuf-Disable-musttail-attribute-on-mips.patch b/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-protobuf-Disable-musttail-attribute-on-mips.patch
index d19d1eee4c..5e8184b636 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-protobuf-Disable-musttail-attribute-on-mips.patch
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-protobuf-Disable-musttail-attribute-on-mips.patch
@@ -7,24 +7,25 @@ See https://github.com/llvm/llvm-project/issues/57795
 
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
 ---
  third_party/protobuf/src/google/protobuf/port_def.inc | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/third_party/protobuf/src/google/protobuf/port_def.inc b/third_party/protobuf/src/google/protobuf/port_def.inc
-index 37632cf..3c3c1e4 100644
+index e4b0753..4f603e6 100644
 --- a/third_party/protobuf/src/google/protobuf/port_def.inc
 +++ b/third_party/protobuf/src/google/protobuf/port_def.inc
-@@ -230,7 +230,8 @@
- #error PROTOBUF_TAILCALL was previously defined
- #endif
- #if __has_cpp_attribute(clang::musttail) && \
--  !defined(__arm__) && !defined(_ARCH_PPC) && !defined(__wasm__)
-+  !defined(__arm__) && !defined(_ARCH_PPC) && !defined(__wasm__) && \
-+  !defined(__mips__)
+@@ -257,7 +257,8 @@
+ #if __has_cpp_attribute(clang::musttail) && !defined(__arm__) && \
+     !defined(_ARCH_PPC) && !defined(__wasm__) &&                 \
+     !(defined(_MSC_VER) && defined(_M_IX86)) &&                  \
+-    !(defined(__NDK_MAJOR__) && __NDK_MAJOR <= 24)
++    !(defined(__NDK_MAJOR__) && !defined(__mips__) && \
++     __NDK_MAJOR <= 24)
  #  ifndef PROTO2_OPENSOURCE
  // Compilation fails on ARM32: b/195943306
  // Compilation fails on powerpc64le: b/187985113
 -- 
-2.37.3
+2.25.1
 
diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.48.1.bb b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.49.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-grpcio-tools_1.48.1.bb
rename to meta-python/recipes-devtools/python/python3-grpcio-tools_1.49.0.bb
index 002211a8c1..d2b599ae7a 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.48.1.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.49.0.bb
@@ -12,7 +12,7 @@ DEPENDS += "${PYTHON_PN}-grpcio"
 SRC_URI += "file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch \
             file://0001-protobuf-Disable-musttail-attribute-on-mips.patch \
             "
-SRC_URI[sha256sum] = "1178f2ea531f80cc2027ec64728df6ffc8e98cf1df61652a496eafd612127183"
+SRC_URI[sha256sum] = "16ac93ac515194f63febcf6f8a96a7f17390268972acc15e765d257f5008f2af"
 
 RDEPENDS:${PN} = "${PYTHON_PN}-grpcio"
 
-- 
2.25.1


