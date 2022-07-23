Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5C81C43334
	for <webhook@archiver.kernel.org>; Tue, 26 Jul 2022 03:31:10 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web11.2507.1658806266655787157
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Jul 2022 20:31:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=NAEHeZz2;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1658806265; i=@fujitsu.com;
	bh=9yBE2prYXh780+Sz0bV0vjJJityIg+6KIjR0eXjUe5A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=NAEHeZz2jOYWVjhbGn3AUYOxErMKmhgHPKBGfQjz1+s+HBJIaWTUc2UV9ToCUC3LJ
	 rlibSoaLNWbAOOgqFWzJe8p73gNM65gpGOvtpnIKHyWNlMPiE9CMFjZRraPTa2TNPd
	 Gk8JpB4HNVlwIGB7qIcPcbyqjBfO+/RgfkBJFvvmoyU98INa+cJe+UihLjmJdx6guL
	 gnU93x9yEpe3P3wNJuLihxSmqTVFrg5t1x/0Q5dDnRw+qM4togb8UqijBaxEgjl1VY
	 OosJeBK+1qkO0+UMQOqNPYRdFohyjs6Tn0P0idPUwEbLKFXnfDhmpLhusDM6UpB3Zv
	 gbH+1dJEIdePw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrLIsWRWlGSWpSXmKPExsViZ8ORpPsj/n6
  Swe0OXouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePz5P/sBTckKhZN3cfewHhOtIuRi0NI4CGj
  xNJXc9khnMtMEqcm7YZy9jBKLPpwibWLkZODTUBNYvqtG2C2iIC+xNLZe5hBbGYBFYkXv3vYQ
  WxhAQeJ58cPsIDYLAKqEkvadrN1MXJw8Ao4Snz6aQcSlhBQkJjy8D1YK6eAk8T5ZSfByoWASr
  bc/QIW5xUQlDg58wkLxHgJiYMvXjBD9CpKzL7czAJhV0jMmLGNDcJWk7h6bhPzBEbBWUjaZyF
  pX8DItIrROqkoMz2jJDcxM0fX0MBA19DQVNfYUtfIwEAvsUo3US+1VLc8tbhE10gvsbxYL7W4
  WK+4Mjc5J0UvL7VkEyMwjFOK1U/sYHy68qfeIUZJDiYlUd4tnfeShPiS8lMqMxKLM+KLSnNSi
  w8xynBwKEnwvo67nyQkWJSanlqRlpkDjCmYtAQHj5IIb2kMUJq3uCAxtzgzHSJ1itGY4+qVK3
  uZOWZ+bTvALMSSl5+XKiXOuwJkkgBIaUZpHtwgWKxfYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7
  BqCTMmwpMHEI8mXklcPteAZ3CBHTKJ+07IKeUJCKkpBqY+uJPPuraKvP3oGGLrOyHLPMVk6pM
  Q6pv7OLnXMHpc93f96nlSm+HP1Gr3du/VtiIa7xlaXu44sWiWzM6NU0+nHX+OEvAZvrP/4xPH
  ecmnbjR+u2B+8WvzG2mL6Jcb3dej8rjn7LGKOQAh2iI7Yz+kz4a55/rtd/qDF+Q99ppTdyEBP
  OvuXGOErs4F69+qcTt/nRN41n7WdON25a6F9g8FgqexHx+QdH17ikzt+0QbjPyV01zu/WxtbP
  0wM9e1+TPTDOK1swLFP32X9pb+ZbhjtziuoU2S+4zGj0852qVNFevO0Q++Wj3x1uSfKvbOe6b
  pCzWNp0bJ/CtYOts74y5670mW5+6cH/HhouVdx4eUWIpzkg01GIuKk4EANzubBdwAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-565.messagelabs.com!1658806264!117100!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7050 invoked from network); 26 Jul 2022 03:31:04 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-7.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 26 Jul 2022 03:31:04 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id E6CD41AE
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Jul 2022 04:31:03 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id DBF0F7C
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Jul 2022 04:31:03 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 26 Jul 2022 04:31:02 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] nanopb: upgrade 0.4.5 -> 0.4.6.4
Date: Sat, 23 Jul 2022 13:36:05 +0800
Message-ID: <1658554568-9257-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1658554568-9257-1-git-send-email-wangmy@fujitsu.com>
References: <1658554568-9257-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Jul 2022 03:31:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97974

Changelog:
=========
 Fix passing of error message from substream callback (#703)
 Fix comments going to wrong member variables (#701)
 Fix regression in 0.4.3 where generator did not find all dependencies (#720)
 Fix FindNanopb.cmake not finding options file (#659)
 Fix double-definition errors with size_union (#692)
 Fix generator error with same inner message name (#746)
 Fix infinite recursion in generator/protoc script (#762)
 Fix unicode comment handling for Python 2 (#740)
 Fix compiler warnings with PB_BUFFER_ONLY (#717)
 Fix options dependency in nanopb.mk (#666)
 Fix handling of filenames with dot in them in FindNanopb.cmake (#756)
 Add fallback_type option (#772, #773)
 Use C11 static assert mechanism by default (#761, #766)
 Use 'static_assert'  keyword for iar (#679)
 Explicitly check for pItem == NULL to satisfy Xcode analyzer (#667, #674)
 Support --proto-path as alias to -I (#749)
 Refactor name mangling to separate class, improve error messages (#735)
 Move PB_WT_PACKED definition to the header to fix compiler warnings (#671)
 FindNanopb.cmake: use --nanopb_opt for option passing by default (#752)
 FindNanopb.cmake: Add option NANOPB_GENERATE_CPP_STANDALONE (#741)
 FindNanopb.cmake: Add PROTOC_OPTIONS variable (#768, #771)
 CMakeLists: add build interface for using as a submodule (#669)
 CMakeLists: fix error with nanopb_BUILD_GENERATOR=OFF (#764)
 CMakeLists: make more uniform (#676)
 CMakeLists: Fix uninitialized PYTHON_INSTDIR (#652)
 Clean up CMake examples (#741)
 Rebuild nanopb_pb2.py and print version numbers on import failure (#733, #742)
 Use memcpy instead of iterating on buf_read/write (#751)
 Add generator support for PlatformIO (#718)
 Add clean target to generator/proto/Makefile (#681)
 Windows .bats: use standard python invocation instead of py.exe launcher (#657)
 Fix problems running tests with newer SCons version
 Improve handling of varint overflows
 Improve optimization for little-endian platforms

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nanopb/{nanopb_0.4.5.bb => nanopb_0.4.6.4.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/{nanopb_0.4.5.bb => nanopb_0.4.6.4.bb} (93%)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb_0.4.5.bb b/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb_0.4.6.4.bb
similarity index 93%
rename from meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb_0.4.5.bb
rename to meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb_0.4.6.4.bb
index 4b1853cc80..691bbce9ac 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb_0.4.5.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb_0.4.6.4.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9db4b73a55a3994384112efcdb37c01f"
 DEPENDS = "protobuf-native"
 
 SRC_URI = "git://github.com/nanopb/nanopb.git;branch=master;protocol=https"
-SRCREV = "c9124132a604047d0ef97a09c0e99cd9bed2c818"
+SRCREV = "afc499f9a410fc9bbf6c9c48cdd8d8b199d49eb4"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


