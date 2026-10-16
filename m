Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14406CCF2C1
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 06:23:36 +0000 (UTC)
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15946.1792131805683302743
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2026 23:23:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=HkCOlyYR;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3719; q=dns/txt;
  s=iport01; t=1792131805; x=1793341405;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=MVY245eX5PHySUoSMW/Av7lc5uNZL2G4GQNwHSaz0bg=;
  b=HkCOlyYRlVqPBHKsOTw9GHlm3/PVDpYHayJPLAfTGJJ0z8PLdSXukiFI
   vj1OfRmShtAFac7mYg8JdDwmWYK8MEKjolWsOCsbv7ls7eQTvF+c6eMTN
   6y3SAOdOF+suoVFWu7MYl0gZfDvQ9gbdGQBp8xAbO0aSCZnPGPHfBsfvy
   EbhOFIye6+7sfp6xAqM6qLteRmtszeK0TxY21n7xXBdszVCDJWVfa4bIO
   y71YniZZF/rORNH3b56gJi0eATwNkGcQi7OMTPHTCQ7YOMChxjdynccNf
   Q9KUHhgX1kpYnodtGyqnrKDV43gX3zsXbiZNFz3RcckoPy8FVCofaFEzv
   A==;
X-CSE-ConnectionGUID: qfqqYxyURsymY4ObJPEF1Q==
X-CSE-MsgGUID: MbF3/rWIQ3ObfKwG3l+TmQ==
X-IPAS-Result: =?us-ascii?q?A0BJAgBfwdFq/4v/Ja1aglmCV3VgQ0kDlCaCIQOeHIF+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYQ/RgKOFQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2QEgECAQMnCwEYAT0cAwECLysjCBmDAgGCdAMRvHOBeTOBA?=
 =?us-ascii?q?YMpAYFU2UqBaAELFAGBOIVAiCNdGAGEfCcbgUlEgRWBO4IugQWBXAKIJQSDH?=
 =?us-ascii?q?BKBWpVHSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM+F4EHGwYFgR2BIIIWI?=
 =?us-ascii?q?xk2eoEJXoErKWEQF4EJggcCglSCAAIBSUEOB0VTCSVDEkcmIggSCQETGjALg?=
 =?us-ascii?q?Rs4PAkoQRcMcwwdBXIIAg0JBykYDUgRLDcVGQQ+bgeSFB6CZQGBDQErBXoSg?=
 =?us-ascii?q?RsepVehD4QojCKVOhozhVulFAuYfYs3glOVPIEThGmBaDyBWTMaCBsVgyIJS?=
 =?us-ascii?q?hkPjjmDa4VkyHYnMgIJAy8BAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:9BIMnqoWFDHJtUtuH03ET5iIzKNeBmJOZBIvgKrLsJaIsI4StFCzt
 garIBmFOarbN2ugfNAnPN7k/RhQup7RztVlHQJk+y8zRHhDouPIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOWn9T8jhfngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgDNNwJcaDpOtfvb8U035ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0v95GHh/5
 e0lEiscayHfoOiU+J+VE9A506zPLOGzVG8ekmtrwTecCbMtRorOBv2Qo9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5MWfrSn8/w7pX7WyxFsluZqII84nPYy0p6172F3N/9J4baHZoOzhfEz
 o7A10HzLEpdLuO+8GGi+HyPmcCUmWDHXbtHQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHt5SN
 UEQ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwBuGxqyR50OSAXIJC2YbLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWra1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:seD7lKD4f9j4b07lHemA55DYdb4zR+YMi2TDsHoBLSC9Hfb3qy
 nDppkmPFrP+VUssRIb6LW90de7IE80nKQdieJ6AV7hZniFhILCFu5fBOXZrwEIYxefysdtkY
 F9bqN5FNr8SXJ+jcr8/U2ENuxI+qjhzEht7t2utkuEimpRGsdd0zs=
X-Talos-CUID: =?us-ascii?q?9a23=3AsiLyK2syAoOI6miyTzoB7BJy6Is8fGTE/WfBHnW?=
 =?us-ascii?q?jGGNYFJqfa2e91vpdxp8=3D?=
X-Talos-MUID: 9a23:w+ajiwRrTj6/DyB4RXTJjh85c91Xwp31L0oDsoop4M3HCSlJbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="528073894"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 06:23:24 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id C61281800022B
	for <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 06:23:24 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 6C31ECBF202; Thu, 15 Oct 2026 23:23:24 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][wrynose][PATCH 2/9] python3-pillow: Fix CVE-2026-55380
Date: Thu, 15 Oct 2026 23:23:16 -0700
Message-Id: <20261016062323.251925-3-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016062323.251925-1-yurade@cisco.com>
References: <20261016062323.251925-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 06:23:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131056

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/python-pillow/Pillow/commit/f39b0ae6624eb2d7c5c5d651d9bb5fdbd96a8675
[2] https://github.com/python-pillow/Pillow/security/advisories/GHSA-phj9-mv4w-65pm

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../python3-pillow/CVE-2026-55380.patch       | 62 +++++++++++++++++++
 .../python/python3-pillow_12.2.0.bb           |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/CVE-2026-55380.patch

diff --git a/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-55380.patch b/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-55380.patch
new file mode 100644
index 0000000000..16321294c9
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-55380.patch
@@ -0,0 +1,62 @@
+From 176781ac99ebf9aa5486384e6e2e4896b30d95b5 Mon Sep 17 00:00:00 2001
+From: Andrew Murray <3112309+radarhere@users.noreply.github.com>
+Date: Sun, 21 Jun 2026 14:06:24 +1000
+Subject: [PATCH] Add decompression bomb check to GdImageFile (#9693)
+
+CVE: CVE-2026-55380
+Upstream-Status: Backport [https://github.com/python-pillow/Pillow/commit/f39b0ae6624eb2d7c5c5d651d9bb5fdbd96a8675]
+
+(cherry picked from commit f39b0ae6624eb2d7c5c5d651d9bb5fdbd96a8675)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ Tests/test_file_gd.py  | 8 +++++++-
+ src/PIL/GdImageFile.py | 3 ++-
+ 2 files changed, 9 insertions(+), 2 deletions(-)
+
+diff --git a/Tests/test_file_gd.py b/Tests/test_file_gd.py
+index 8a49fd4fa..7d9e85976 100644
+--- a/Tests/test_file_gd.py
++++ b/Tests/test_file_gd.py
+@@ -4,7 +4,7 @@ from io import BytesIO
+ 
+ import pytest
+ 
+-from PIL import GdImageFile, UnidentifiedImageError
++from PIL import GdImageFile, Image, UnidentifiedImageError, _binary
+ 
+ from .helper import assert_image_similar_tofile
+ 
+@@ -31,6 +31,12 @@ def test_bad_mode() -> None:
+         GdImageFile.open(TEST_GD_FILE, "bad mode")
+ 
+ 
++def test_decompression_bomb() -> None:
++    b = BytesIO(_binary.o16be(65535) + _binary.o16be(50000) + _binary.o16be(50000))
++    with pytest.raises(Image.DecompressionBombError):
++        GdImageFile.open(b)
++
++
+ def test_invalid_file() -> None:
+     invalid_file = "Tests/images/flower.jpg"
+ 
+diff --git a/src/PIL/GdImageFile.py b/src/PIL/GdImageFile.py
+index d73bc1982..4ff96f1fa 100644
+--- a/src/PIL/GdImageFile.py
++++ b/src/PIL/GdImageFile.py
+@@ -30,7 +30,7 @@ from __future__ import annotations
+ 
+ from typing import IO
+ 
+-from . import ImageFile, ImagePalette, UnidentifiedImageError
++from . import Image, ImageFile, ImagePalette, UnidentifiedImageError
+ from ._binary import i16be as i16
+ from ._binary import i32be as i32
+ from ._typing import StrOrBytesPath
+@@ -59,6 +59,7 @@ class GdImageFile(ImageFile.ImageFile):
+ 
+         self._mode = "P"
+         self._size = i16(s, 2), i16(s, 4)
++        Image._decompression_bomb_check(self.size)
+ 
+         true_color = s[6]
+         true_color_offset = 2 if true_color else 0
diff --git a/meta-python/recipes-devtools/python/python3-pillow_12.2.0.bb b/meta-python/recipes-devtools/python/python3-pillow_12.2.0.bb
index aa7de55fab..d5576560e7 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_12.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_12.2.0.bb
@@ -10,6 +10,7 @@ SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=main;protocol=https;
            file://CVE-2026-54058.patch \
            file://CVE-2026-59204.patch \
            file://CVE-2026-54059_CVE-2026-54060_CVE-2026-55379.patch \
+           file://CVE-2026-55380.patch \
            "
 SRCREV = "3c41c095064200a02672d89cc5ff629eaf4b0d4f"
 
-- 
2.35.6


