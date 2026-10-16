Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9907CCA48F
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 06:23:35 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15654.1792131805734630105
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2026 23:23:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=ghIzV66z;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4185; q=dns/txt;
  s=iport01; t=1792131806; x=1793341406;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=0tbJlo8WCTIlGmaHpH7TBsV5KZdNb7UAsR11vNViaHA=;
  b=ghIzV66zhcAfIcwl7QOu1BnXzKtmh3edvWFkv8oThwhar5SzebQ36jKd
   G2z4IXRKC+kxXQMomXXKQGfLs4faC8GsgBrrliukJ/EU8S2/GmxzV1rB+
   d06bBpxATHECJTrd/Y8PiW/FIds4OPpHkBTMjcPix4ZmxdSkj6B5bIpX2
   jr9DNg5CZMzCUB1zEFrcntQShGRN25GVp4ML/oDz2OcnzlxnhjnIHRDC3
   LtWFqm8V8Yzssndg0mP2PQMwMLWmX1k/ViW0m8fXkjEzGPQFY9KQkZbBc
   +LMY7KLFXsdWt9mGxaTS4qgdsFGHttvYmJOV9BKBADNSaYREkc9xEwZG3
   w==;
X-CSE-ConnectionGUID: owF1SAI0S4K5wPUICInaeg==
X-CSE-MsgGUID: Giq2bM2yT5uN4SxthZVovg==
X-IPAS-Result: =?us-ascii?q?A0BJAgBfwdFq/5X/Ja1aglmCV3VgQ0kDlCaCIQOeHIF+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYQ/RgKOFQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2QEgECAQMnCwEYAT0cAwECLysjCBmDAgGCdAMRvHOBeTOBA?=
 =?us-ascii?q?YMpAYFU2UqBaAELFAGBOIVAiCNdGAGEfCcbgUlEgRWBO4IugQWBXAKIJQSDH?=
 =?us-ascii?q?BKBWpVHSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM+F4EHGwYFgR2BIIIWI?=
 =?us-ascii?q?xk2eoEJXoErKWEQF4EJggcCglSCAAIBSUEOB0VTCSVDEkcmIggSCQETGjALg?=
 =?us-ascii?q?Rs4PAkoQRcMcwwdBXIIAg0JBykYDUgRLDcVGQQ+bgeSFB6CZTFdASsFeoEtH?=
 =?us-ascii?q?qVXoQ+EKIwilToaM4VbpRQLmH2LN4JTlk+EaYFoPIFZMxoIGxWDIglKGQ+OL?=
 =?us-ascii?q?gsLg2DOWicyAgkDLwEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:zXjJuqyVwGgsI9ph4596t+dhxyrEfRIJ4+MujC+fZmUNrF6WrkUGm
 mBNW2jTPP3YYjPwLYh0aN+2/BxQuZ+Bn4IyTwVoqlhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lHyYuCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4yaT/H3Ygf/hWcsazxMsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJEYpE9Qj08cvOj1tq
 OMgFREmTxaKiu3jldpXSsE07igiBNPgMIVavjRryivUSK98B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2cMnWjOX9PYH46tPa1nHDzfhVTqUmeouw85G27IAlZjeOzbIqLJYPRLSlTtmmZv
 zjM2j7oPkwHEoCk2SaFwEyrmOCayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PW0lEO6c9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl/DQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSj1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:z/KD2aspmoQ6wBoQjMMSxEy07skDWtV00zEX/kB9WHVpm6uj5q
 STdZsguyMc5Ax9ZJhko6HiBEDiewK4yXcK2+gs1N6ZNWGM0ldAbrsSj7cKqAeOJ8SRzIJgPN
 9bE5RWOZnXEUVwi9r87U2TFtYtx8TCzYWT7N2uqEuEiWpRGthdB8ATMHf8LnFL
X-Talos-CUID: 9a23:VhRmOGxIpic4Db1YAQLDBgUTBe58SVT8lEyMABKnMVtIY5yTQFKfrfY=
X-Talos-MUID: 9a23:yBowCgbTQrPCReBTmD713jtHbtZUvrmIVHsdjZU0hc6aOnkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="536486773"
Received: from rcdn-l-core-12.cisco.com ([173.37.255.149])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 06:23:25 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-12.cisco.com (Postfix) with ESMTPS id 2BDBF18000335
	for <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 06:23:25 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 7B50FCBF21E; Thu, 15 Oct 2026 23:23:24 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][wrynose][PATCH 5/9] python3-pillow: Fix CVE-2026-59199
Date: Thu, 15 Oct 2026 23:23:19 -0700
Message-Id: <20261016062323.251925-6-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016062323.251925-1-yurade@cisco.com>
References: <20261016062323.251925-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: rcdn-l-core-12.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 06:23:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131061

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/python-pillow/Pillow/commit/ceefc348eb3c3844c7f9796ef2cc3a7dd5fbba7b
[2] https://github.com/python-pillow/Pillow/security/advisories/GHSA-6r8x-57c9-28j4

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../python3-pillow/CVE-2026-59199.patch       | 84 +++++++++++++++++++
 .../python/python3-pillow_12.2.0.bb           |  1 +
 2 files changed, 85 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/CVE-2026-59199.patch

diff --git a/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-59199.patch b/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-59199.patch
new file mode 100644
index 0000000000..4418b73e99
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-59199.patch
@@ -0,0 +1,84 @@
+From 0d706085cfb87ffac6eea54f1a42ce8bd3f16513 Mon Sep 17 00:00:00 2001
+From: Andrew Murray <3112309+radarhere@users.noreply.github.com>
+Date: Mon, 22 Jun 2026 12:56:41 +1000
+Subject: [PATCH] Use int64_t to calculate paste box dimensions (#9703)
+
+CVE: CVE-2026-59199
+Upstream-Status: Backport [https://github.com/python-pillow/Pillow/commit/ceefc348eb3c3844c7f9796ef2cc3a7dd5fbba7b]
+
+(cherry picked from commit ceefc348eb3c3844c7f9796ef2cc3a7dd5fbba7b)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ Tests/test_image_paste.py | 14 ++++++++++++++
+ src/libImaging/Paste.c    | 12 ++++++------
+ 2 files changed, 20 insertions(+), 6 deletions(-)
+
+diff --git a/Tests/test_image_paste.py b/Tests/test_image_paste.py
+index 37e4df103..f9b72e46f 100644
+--- a/Tests/test_image_paste.py
++++ b/Tests/test_image_paste.py
+@@ -357,6 +357,20 @@ class TestImagingPaste:
+         im.copy().paste(im2)
+         im.copy().paste(im2, (0, 0))
+ 
++    @pytest.mark.parametrize(
++        "box",
++        (
++            (2**31 - 1, 0, -(2**31), 1),
++            (0, 2**31 - 1, 1, -(2**31)),
++        ),
++    )
++    def test_overflow(self, box: tuple[int, int, int, int]) -> None:
++        im = Image.new("1", (1, 1))
++        im.paste(1, box)
++
++        with pytest.raises(ValueError, match="images do not match"):
++            im.paste(im.copy(), box)
++
+     def test_incorrect_abbreviated_form(self) -> None:
+         im = Image.new("L", (1, 1))
+         with pytest.raises(ValueError):
+diff --git a/src/libImaging/Paste.c b/src/libImaging/Paste.c
+index f4b72c5d8..bf72d3a1c 100644
+--- a/src/libImaging/Paste.c
++++ b/src/libImaging/Paste.c
+@@ -274,7 +274,7 @@ int
+ ImagingPaste(
+     Imaging imOut, Imaging imIn, Imaging imMask, int dx0, int dy0, int dx1, int dy1
+ ) {
+-    int xsize, ysize;
++    int64_t xsize, ysize;
+     int pixelsize;
+     int sx0, sy0;
+     ImagingSectionCookie cookie;
+@@ -286,8 +286,8 @@ ImagingPaste(
+ 
+     pixelsize = imOut->pixelsize;
+ 
+-    xsize = dx1 - dx0;
+-    ysize = dy1 - dy0;
++    xsize = (int64_t)dx1 - dx0;
++    ysize = (int64_t)dy1 - dy0;
+ 
+     if (xsize != imIn->xsize || ysize != imIn->ysize || pixelsize != imIn->pixelsize) {
+         (void)ImagingError_Mismatch();
+@@ -598,7 +598,7 @@ ImagingFill2(
+     Imaging imOut, const void *ink, Imaging imMask, int dx0, int dy0, int dx1, int dy1
+ ) {
+     ImagingSectionCookie cookie;
+-    int xsize, ysize;
++    int64_t xsize, ysize;
+     int pixelsize;
+     int sx0, sy0;
+ 
+@@ -609,8 +609,8 @@ ImagingFill2(
+ 
+     pixelsize = imOut->pixelsize;
+ 
+-    xsize = dx1 - dx0;
+-    ysize = dy1 - dy0;
++    xsize = (int64_t)dx1 - dx0;
++    ysize = (int64_t)dy1 - dy0;
+ 
+     if (imMask && (xsize != imMask->xsize || ysize != imMask->ysize)) {
+         (void)ImagingError_Mismatch();
diff --git a/meta-python/recipes-devtools/python/python3-pillow_12.2.0.bb b/meta-python/recipes-devtools/python/python3-pillow_12.2.0.bb
index 331b99622b..5acd020d8f 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_12.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_12.2.0.bb
@@ -13,6 +13,7 @@ SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=main;protocol=https;
            file://CVE-2026-55380.patch \
            file://CVE-2026-59197.patch \
            file://CVE-2026-59198.patch \
+           file://CVE-2026-59199.patch \
            "
 SRCREV = "3c41c095064200a02672d89cc5ff629eaf4b0d4f"
 
-- 
2.35.6


