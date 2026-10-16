Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38741CCF2C2
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 06:23:36 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15947.1792131805799741436
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2026 23:23:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Qy9gTU4i;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=7543; q=dns/txt;
  s=iport01; t=1792131805; x=1793341405;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=2onkLKYj8Y7rtqJDbgZkAVcpSzOfPNiE41LKJ3S0TuY=;
  b=Qy9gTU4i26IfTmv+sXn//Sq2seh+0Qy4BWGIbGHfbp36LcXKz0asLMdV
   GmfUT4lZRA4RqK5FAKt0MHe3vGL5vwc4PUYyUDRQYm9Sxmt9n/tfvsYGR
   90saUOAsBjNP3QCw9BJkmXYeoABw3+rDY8FjAdNx88Bep50a3v+AV+pNf
   od1RMpe2V46ndiZ80cdOj4SXRy/YDFjTGKxpWc5pF3RDGH68Xsv34oLyu
   2uN8b9mWIyy6KvUhQgCU5fkiVChdKdMAxLQbU35Xh8pY3qE2YwPoIBO1v
   kI8hGnFNBUSDF+L2sn9w8l9pxDS3yaArSb43prglp+UWfEL+408Be2Amu
   A==;
X-CSE-ConnectionGUID: 85hAigUXReqSZ4Jypj0i0w==
X-CSE-MsgGUID: tkkI2TUqSj2qtSG86tBIYA==
X-IPAS-Result: =?us-ascii?q?A0BLAgBRwtFq/43/Ja1aHgEBCxIMggULgld1YENJhFePU?=
 =?us-ascii?q?oIhA54cgX4PAQEBD0QNBAEBhD9GAo4VAiY0CQ4BAgQDAgMBAQEBAQEBAQEBA?=
 =?us-ascii?q?QEKAQEFAQEBAgEHBYEOE4ZPDZASAQIBAyMECwEYAT0cAwECAwImAgIrIwgZg?=
 =?us-ascii?q?wIBgnQDEbx0en8zgQGDKQE/AkPaGoFoAQsUAYEKLoVAgx8BhQNdGAGEfCcbg?=
 =?us-ascii?q?UlEglCCLoEFgVwBAYU7gmoEgg2BDxKBWoEDhAuQOUiBAhwDWSwBVRMNCgsHB?=
 =?us-ascii?q?YFoAzUSKhVuMh2BIz4XL1gbBgWBHYEgghYjGTZ6gQlegSspYRAXgQmCBwKCV?=
 =?us-ascii?q?IIAAgFJQQ4HRVMJJUMSRyYiCBIJARMaMAuBGzg8CShBFwxzDB0FcggCDQkHK?=
 =?us-ascii?q?RgNSBEsNxUZBD0BbgeSFB6CZQGBDQErBXoGDIEqAg2TGpI9oQ+EKIwilToaM?=
 =?us-ascii?q?4QEgVeSQJJUC5h9izeCU5U8Q1CEaYFoPIFHCwczGggbFTuCZwlKGQ+OKw4LH?=
 =?us-ascii?q?INEgX+DZch2JzICCTIBAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:jI62ta9IY/BquPzjquskDrUD1n+TJUtcMsCJ2f8bNWPcYEJGY0x3m
 zZMDzuGMq2DMzTxLdoia4u2pk0BvMSAnIVkQAM5rnxEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmB4E/rbei5xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mtyyHjEAX9gWAtajtKs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2lmYI0x++lKMVtD7
 McqdBIcdhLbhrqplefTpulE3qzPLeHxN48Z/3UlxjbDALN+HdbIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZP0Qn1lQ/UPrSmM+5m2P2fzBwo1OOrq1x6G/WpOB0+OW3aoKMKoDaFK25mG6Ep
 WHnpVjEGyoYbsWD8hXVrG6Gp97myHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rby1h1CzX/pbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBWi4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rEnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:5vCIyK16jIid87VZp69GogqjBJAkLtp133Aq2lEZdPUzSL3+qy
 nOpoV+6faaslgssR0b9OxofZPwIk80lqQFhLX5Q43CYOCOggLBR+tfBMnZsl/d8kbFmdK1u5
 0NT0EHMr3NJGk/q9rm6w+lFNtl6tyG/Ke0wdr69R5WPGdXg2UK1XYANu5deXcGPTV7OQ==
X-Talos-CUID: =?us-ascii?q?9a23=3AWypeBWl7v0+oYdISFVYdbNxQtwLXOS2AzF7RLHK?=
 =?us-ascii?q?IM2twc4/Ja06I+vtly9U7zg=3D=3D?=
X-Talos-MUID: 9a23:EuAQAQQs1wFQNUjsRXTwhzJDbvtV+p+sUlkRqrpW5dWuFB1ZbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="522018489"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 06:23:24 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id C0572180004AE
	for <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 06:23:24 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 66C0BCBF201; Thu, 15 Oct 2026 23:23:24 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][wrynose][PATCH 1/9] python3-pillow: Fix CVE-2026-54059 CVE-2026-54060 CVE-2026-55379
Date: Thu, 15 Oct 2026 23:23:15 -0700
Message-Id: <20261016062323.251925-2-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016062323.251925-1-yurade@cisco.com>
References: <20261016062323.251925-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 06:23:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131058

This patch applies the upstream fix as referenced in [2], [3]
and [4], using the commit shown in [1].

[1] https://github.com/python-pillow/Pillow/commit/0a263e6264aa5399988d9acd3bbfbca2ca3ec77d
[2] https://nvd.nist.gov/vuln/detail/cve-2026-54059
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-54060
[4] https://nvd.nist.gov/vuln/detail/cve-2026-55379

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 ...-54059_CVE-2026-54060_CVE-2026-55379.patch | 168 ++++++++++++++++++
 .../python/python3-pillow_12.2.0.bb           |   1 +
 2 files changed, 169 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/CVE-2026-54059_CVE-2026-54060_CVE-2026-55379.patch

diff --git a/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-54059_CVE-2026-54060_CVE-2026-55379.patch b/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-54059_CVE-2026-54060_CVE-2026-55379.patch
new file mode 100644
index 0000000000..72a83a178e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-54059_CVE-2026-54060_CVE-2026-55379.patch
@@ -0,0 +1,168 @@
+From 7d525ae2ccf9109079f6f640ad88c8cb117853d9 Mon Sep 17 00:00:00 2001
+From: Andrew Murray <3112309+radarhere@users.noreply.github.com>
+Date: Tue, 23 Jun 2026 11:41:22 +1000
+Subject: [PATCH] Add decompression bomb checks to FontFile classes (#9711)
+
+CVE: CVE-2026-54059 CVE-2026-54060 CVE-2026-55379
+Upstream-Status: Backport [https://github.com/python-pillow/Pillow/commit/0a263e6264aa5399988d9acd3bbfbca2ca3ec77d]
+
+Backport Changes:
+- Wrynose 12.2.0 handles standard and jumbo PCF metrics in separate loops,
+  so the decompression-bomb check is added at both call sites in
+  src/PIL/PcfFontFile.py file, upstream’s shared append helper needs only
+  one check.
+
+(cherry picked from commit 0a263e6264aa5399988d9acd3bbfbca2ca3ec77d)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ Tests/test_font_bdf.py | 10 +++++++++-
+ Tests/test_font_pcf.py | 21 ++++++++++++++++++++-
+ Tests/test_fontfile.py |  7 +++++++
+ src/PIL/BdfFontFile.py |  1 +
+ src/PIL/FontFile.py    |  3 ++-
+ src/PIL/PcfFontFile.py |  2 ++
+ 6 files changed, 41 insertions(+), 3 deletions(-)
+diff --git a/Tests/test_font_pcf.py b/Tests/test_font_pcf.py
+index 321dd8560..d5b080add 100644
+--- a/Tests/test_font_pcf.py
++++ b/Tests/test_font_pcf.py
+@@ -1,12 +1,13 @@
+ from __future__ import annotations
+ 
+ import os
++from io import BytesIO
+ from pathlib import Path
+ from typing import AnyStr
+ 
+ import pytest
+ 
+-from PIL import FontFile, Image, ImageDraw, ImageFont, PcfFontFile
++from PIL import FontFile, Image, ImageDraw, ImageFont, PcfFontFile, _binary
+ 
+ from .helper import (
+     assert_image_equal_tofile,
+@@ -117,3 +118,21 @@ def test_high_characters(request: pytest.FixtureRequest, tmp_path: Path) -> None
+     _test_high_characters(request, tmp_path, message)
+     # accept bytes instances.
+     _test_high_characters(request, tmp_path, message.encode("latin1"))
++
++
++def test_decompression_bomb() -> None:
++    with open(fontname, "rb") as fp:
++        data = fp.read()
++    b = BytesIO(
++        data[:900]
++        + _binary.o32le(0)  # jumbo format
++        + _binary.o32le(1)  # number of metrics
++        + _binary.o16le(0)  # left
++        + _binary.o16le(65535)  # right
++        + _binary.o16le(0)  # width
++        + _binary.o16le(0)  # ascent
++        + _binary.o16le(65535)  # descent
++        + _binary.o16le(0)  # attributes
++    )
++    with pytest.raises(Image.DecompressionBombError):
++        PcfFontFile.PcfFontFile(b)
+diff --git a/src/PIL/PcfFontFile.py b/src/PIL/PcfFontFile.py
+index b923293b0..52947ff04 100644
+--- a/src/PIL/PcfFontFile.py
++++ b/src/PIL/PcfFontFile.py
+@@ -170,6 +170,7 @@ class PcfFontFile(FontFile.FontFile):
+                 descent = i8(fp.read(1)) - 128
+                 xsize = right - left
+                 ysize = ascent + descent
++                Image._decompression_bomb_check((xsize, ysize))
+                 append((xsize, ysize, left, right, width, ascent, descent, 0))
+ 
+         else:
+@@ -183,6 +184,7 @@ class PcfFontFile(FontFile.FontFile):
+                 attributes = i16(fp.read(2))
+                 xsize = right - left
+                 ysize = ascent + descent
++                Image._decompression_bomb_check((xsize, ysize))
+                 append((xsize, ysize, left, right, width, ascent, descent, attributes))
+ 
+         return metrics
+
+diff --git a/Tests/test_font_bdf.py b/Tests/test_font_bdf.py
+index b4155c8793b..033b5f8fbd5 100644
+--- a/Tests/test_font_bdf.py
++++ b/Tests/test_font_bdf.py
+@@ -4,7 +4,7 @@
+ 
+ import pytest
+ 
+-from PIL import BdfFontFile, FontFile
++from PIL import BdfFontFile, FontFile, Image
+ 
+ filename = "Tests/images/courB08.bdf"
+ 
+@@ -24,6 +24,14 @@ def test_zero_width_chars() -> None:
+     BdfFontFile.BdfFontFile(io.BytesIO(data))
+ 
+ 
++def test_decompression_bomb() -> None:
++    with open(filename, "rb") as fp:
++        data = fp.read()
++    b = io.BytesIO(data.replace(b"BBX 1 1", b"BBX 13378 13378"))
++    with pytest.raises(Image.DecompressionBombError):
++        BdfFontFile.BdfFontFile(b)
++
++
+ def test_invalid_file() -> None:
+     with open("Tests/images/flower.jpg", "rb") as fp:
+         with pytest.raises(SyntaxError):
+
+diff --git a/Tests/test_fontfile.py b/Tests/test_fontfile.py
+index 1a9069fd892..bf857e230b8 100644
+--- a/Tests/test_fontfile.py
++++ b/Tests/test_fontfile.py
+@@ -30,6 +30,13 @@ def test_compile() -> None:
+     assert font.ysize == 2
+ 
+ 
++def test_decompression_bomb() -> None:
++    font = FontFile.FontFile()
++    font.glyph[0] = ((0, 0), (0, 0, 0, 0), (0, 0, 10000, 10000), Image.new("L", (0, 0)))
++    with pytest.raises(Image.DecompressionBombError):
++        font.compile()
++
++
+ def test_save(tmp_path: Path) -> None:
+     tempname = str(tmp_path / "temp.pil")
+ 
+
+diff --git a/src/PIL/BdfFontFile.py b/src/PIL/BdfFontFile.py
+index 1c8c28ff038..098779bfd6e 100644
+--- a/src/PIL/BdfFontFile.py
++++ b/src/PIL/BdfFontFile.py
+@@ -70,6 +70,7 @@ def bdf_char(
+     # and x and y displacement (BBxoff0, BByoff0)
+     # of the lower left corner from the origin of the character.
+     width, height, x_disp, y_disp = (int(p) for p in props["BBX"].split())
++    Image._decompression_bomb_check((width, height))
+ 
+     # The word DWIDTH
+     # followed by the width in x and y of the character in device pixels.
+
+diff --git a/src/PIL/FontFile.py b/src/PIL/FontFile.py
+index 341431d3f45..c3be4ae3ddd 100644
+--- a/src/PIL/FontFile.py
++++ b/src/PIL/FontFile.py
+@@ -74,7 +74,7 @@ def compile(self) -> None:
+             if glyph:
+                 d, dst, src, im = glyph
+                 h = max(h, src[3] - src[1])
+-                w = w + (src[2] - src[0])
++                w += src[2] - src[0]
+                 if w > WIDTH:
+                     lines += 1
+                     w = src[2] - src[0]
+@@ -89,6 +89,7 @@ def compile(self) -> None:
+         self.ysize = h
+ 
+         # paste glyphs into bitmap
++        Image._decompression_bomb_check((xsize, ysize))
+         self.bitmap = Image.new("1", (xsize, ysize))
+         self.metrics: list[
+             tuple[tuple[int, int], tuple[int, int, int, int], tuple[int, int, int, int]]
diff --git a/meta-python/recipes-devtools/python/python3-pillow_12.2.0.bb b/meta-python/recipes-devtools/python/python3-pillow_12.2.0.bb
index d5c65fbd11..aa7de55fab 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_12.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_12.2.0.bb
@@ -9,6 +9,7 @@ SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=main;protocol=https;
            file://0001-support-cross-compiling.patch \
            file://CVE-2026-54058.patch \
            file://CVE-2026-59204.patch \
+           file://CVE-2026-54059_CVE-2026-54060_CVE-2026-55379.patch \
            "
 SRCREV = "3c41c095064200a02672d89cc5ff629eaf4b0d4f"
 
-- 
2.35.6


