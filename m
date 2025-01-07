Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 716D1C3DA4A
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 09:02:06 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.16410.1736240511075164031
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Jan 2025 01:01:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ZKzC6uP7;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1736240519; x=1767776519;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Fq4UWSaAVKju3iUC9mK44542h5FUSeFhgKE4l99KMtU=;
  b=ZKzC6uP7IADHPQbjA0VndyoTL1vrF8LYd9ephyw/luOSIeaaZdElbVoW
   GnOAw8tXgpJjfuIWI3Ogr04WzwpV+jvhi2l5FVtkvlbmDgb+pjXBJKdn5
   L+RUuH7gGUHDHuqlUiusik8EJBksh1dl30jhidZc7DcKWH5SDn5OnYIiL
   55Whb3pSPf4pBCwig24MOD8ypkyRnJdv3C8mcP7mzpMdOGHYQdgL94z0x
   5pgla8Rq689W7RuJwND2qyhjcDt+7YyrXZmmlKK612NcGQnIjw1jCWdrR
   2BpK0eum6gVyzLD5zQlq5Js0GQnV8lZzka96u0A4BpFY2go6BOrjRAYzM
   g==;
X-CSE-ConnectionGUID: jPA/9Gj/TGGFtgudNj+nCA==
X-CSE-MsgGUID: NLisrM6HSXWbKggoSwqVag==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="188263575"
X-IronPort-AV: E=Sophos;i="6.12,295,1728918000"; 
   d="scan'208";a="188263575"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 18:01:58 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 2212FD4C3C
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:55 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id ED7EFD4BD2
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:54 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8396A2235EE
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:54 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5A7A51A0073;
	Tue,  7 Jan 2025 17:01:54 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 10/18] python3-grpcio: upgrade 1.68.1 -> 1.69.0
Date: Tue,  7 Jan 2025 17:01:36 +0800
Message-Id: <1736240504-5315-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1736240504-5315-1-git-send-email-wangmy@fujitsu.com>
References: <1736240504-5315-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28908.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28908.003
X-TMASE-Result: 10-1.731200-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yX84FZpy/6JVkdS3kPlaZyXfUZT83lbkENb2
	e7N2CFQy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AZskwWqoib3GSYicW3M8Of2bB
	B17cIjBqpnGND0sWisCF7sdJartlTkfRhdidsajMURSScn+QSXt0H8LFZNFG76sBnwpOylLPc3e
	CERlXMVgdwtOx43jTu10htCJdofahmgp3UIwMOymKSxIYzN337W+TgECOwXiRd94t54tr6oo1BV
	uHrUlburEoYQZt7o1aIHqaUMp7VXtL/LK0d4I30Ze/gJB41STsbqpM7Cr+fvX7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Jan 2025 09:02:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114681

From: Wang Mingyu <wangmy@fujitsu.com>

0001-protobuf-Disable-musttail-attribute-on-mips.patch
refreshed for 1.69.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-protobuf-Disable-musttail-attribute-on-mips.patch  | 6 +++---
 ...rpcio-tools_1.68.1.bb => python3-grpcio-tools_1.69.0.bb} | 2 +-
 .../{python3-grpcio_1.68.1.bb => python3-grpcio_1.69.0.bb}  | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio-tools_1.68.1.bb => python3-grpcio-tools_1.69.0.bb} (86%)
 rename meta-python/recipes-devtools/python/{python3-grpcio_1.68.1.bb => python3-grpcio_1.69.0.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-protobuf-Disable-musttail-attribute-on-mips.patch b/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-protobuf-Disable-musttail-attribute-on-mips.patch
index 0f6844df57..cb12fb4983 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-protobuf-Disable-musttail-attribute-on-mips.patch
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-protobuf-Disable-musttail-attribute-on-mips.patch
@@ -1,4 +1,4 @@
-From 7d2d5d39b7dcf9b6336d78b9e977b0550f7afe9e Mon Sep 17 00:00:00 2001
+From ded393c799d4d970d69a75c458f3672b03099aeb Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 16 Sep 2022 19:09:15 -0700
 Subject: [PATCH] protobuf: Disable musttail attribute on mips
@@ -13,10 +13,10 @@ Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/third_party/protobuf/src/google/protobuf/port_def.inc b/third_party/protobuf/src/google/protobuf/port_def.inc
-index 37d80e5..c136654 100644
+index 56f995e..4d36c2f 100644
 --- a/third_party/protobuf/src/google/protobuf/port_def.inc
 +++ b/third_party/protobuf/src/google/protobuf/port_def.inc
-@@ -222,6 +222,7 @@ static_assert(PROTOBUF_ABSL_MIN(20230125, 3),
+@@ -227,6 +227,7 @@ static_assert(PROTOBUF_ABSL_MIN(20230125, 3),
  #error PROTOBUF_TAILCALL was previously defined
  #endif
  #if ABSL_HAVE_CPP_ATTRIBUTE(clang::musttail) && !defined(__arm__) &&  \
diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.68.1.bb b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.69.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-grpcio-tools_1.68.1.bb
rename to meta-python/recipes-devtools/python/python3-grpcio-tools_1.69.0.bb
index 88183189a3..76f5739f95 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.68.1.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.69.0.bb
@@ -15,7 +15,7 @@ DEPENDS += "python3-grpcio"
 SRC_URI += "file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch \
             file://0001-protobuf-Disable-musttail-attribute-on-mips.patch \
             "
-SRC_URI[sha256sum] = "2413a17ad16c9c821b36e4a67fc64c37b9e4636ab1c3a07778018801378739ba"
+SRC_URI[sha256sum] = "3e1a98f4d9decb84979e1ddd3deb09c0a33a84b6e3c0776d5bde4097e3ab66dd"
 
 RDEPENDS:${PN} = "python3-grpcio"
 
diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.68.1.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.69.0.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-grpcio_1.68.1.bb
rename to meta-python/recipes-devtools/python/python3-grpcio_1.69.0.bb
index 6967483ace..617e982382 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.68.1.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.69.0.bb
@@ -12,7 +12,7 @@ SRC_URI += "file://0001-Include-missing-cstdint-header.patch \
            file://0001-crypto-use-_Generic-only-if-defined-__cplusplus.patch;patchdir=third_party/boringssl-with-bazel/src/ \
            file://0001-target.h-define-proper-macro-for-ppc-ppc64.patch \
            "
-SRC_URI[sha256sum] = "44a8502dd5de653ae6a73e2de50a401d84184f0331d0ac3daeb044e66d5c5054"
+SRC_URI[sha256sum] = "936fa44241b5379c5afc344e1260d467bee495747eaf478de825bab2791da6f5"
 
 RDEPENDS:${PN} = "python3-protobuf"
 
-- 
2.43.0


