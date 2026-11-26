Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8044.1795669141472190948
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 20:59:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=cB7+QsM2;
 spf=pass (domain: mvista.com, ip: 74.125.82.179, mailfrom: hprajapati@mvista.com)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-386cf1041cdso2758069eec.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 20:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1795669141; x=1796273941; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wzX1gGp+lshn0nzfsP0lpggHj9GO+CTZtLf+QVYKX4s=;
        b=cB7+QsM29fMQ288UQ+ocsfoWrSAoPXP7lYNih10U5h9JJas65rF62WjRFHKbWAgcta
         iDZ+WPsJDaHWWcgZqEuO475JNio8enc4KAwr9Ir68V1ViUATt9WJSOckZXVqMyZ4OGai
         dokUHzQuB5pNR3YjiQZWf1h632CfWZQWoD/DU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795669141; x=1796273941;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wzX1gGp+lshn0nzfsP0lpggHj9GO+CTZtLf+QVYKX4s=;
        b=I2lXnNd/YMg84ZmDbVlzh535N5kwHM0Bt9b0+L5BexOpm+Ab96LTc8aZwykNUgy4w9
         w6NUJBSpS51K4eZnt2yxzNZr+4ErGlb3astyWNT5iycN5HADl/AOhNSBtPYETG8zafrG
         Wjql47+ZLjDg8Asjmvdgw2pm179GGQ6cd+s2UaWMMcMh3z6bu6/nJ6Xok9CZkTxnby9y
         j/UKF0GjKGpeAwyJZ7xuMOlKhX43XfVeWG6ESiNN/SK9otWVkYtyfLzwxSOiZOYUFeYc
         m1+NYSyq6vrnlao98et+gObIdO/3JTiGRJvIuGXjnO3XTXn5uuFwHT+QKVIHKiqiNRBf
         A0Dg==
X-Gm-Message-State: APuU4Z9jDcut9Lw97ALudCirESiduj1C5KxF09HpQjjJ2BLPe/3JFDiW
	UJ1/WuViNVR8Zw7eEGRrRyF/EFT9Nadtyx7njKJczm5CBk6yfCSqHJUELuLraEYysjW8hkM2MrZ
	hI+gs7Zk=
X-Gm-Gg: AZFdTZdLHsbqAY21P5i4Y2SVuuDPSeebydIZs7RUeoY/wX5qO52qXGDDNPCmwDhSuRp
	AE24TdAmGOqnOLE3AiLaM2WJzhznf17YiGF/zMPUwTuaguzFyEwtu76x4qCk8q8Scf/e+4sPXPb
	xVttSjagvcanOUg0sIs/IW+pexiiBRRfQf3tACbsthfBkRnpiEFGjT/z97Ie5xhTGSbyUV40Kxc
	EbIrFdK1tLSOmWYFnCPP1Z1CFsMfgvWM92SDVby9RZ1VwEWaIU7Ilo6SUSE9+Jr8Hbuxwuzoooi
	ca8QXe7B+ef+VwBHVQ37u5KaADtrrxY/0leL8MgMr//imcrrAo8Qs9/kqjMI4dGqrKzYYyQ1U/C
	t1Lgg2GFrlTwJ5sqlUZ3CRikzaGuEKDCVHqAHtHxvGDaFwzf0ZuoXPbinNNYD1ghjfVf//D+Zpx
	tm/iZGyWJ7lVU74govuPdXzGap+QR+ZMoe91nXFzMt/sM1bsh9HlJlIRp2YLfPBQ8WamxeeTNfp
	RGiG3KqO3DuETHY7b3k/ZBujqoDHn2eQ+46HGvvP6n32H0v5XA6mVwG79fZiSH7/LQnE5ES81sV
	Et0cwm7tGp8X6BMXeuCLHShws+REDYdvQey3MYLg
X-Received: by 2002:a05:693c:37c8:b0:386:a0d1:1b41 with SMTP id 5a478bee46e88-386a0d136aemr21684515eec.34.1795669140565;
        Wed, 25 Nov 2026 20:59:00 -0800 (PST)
Return-Path: <hprajapati@mvista.com>
Received: from MVIN00013.mvista.com ([43.249.234.255])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm55197905eec.16.2026.11.25.20.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 20:59:00 -0800 (PST)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-python][scarthgap][PATCH 1/2] python3-pillow: Fix CVE-2026-54059 CVE-2026-54060 CVE-2026-55379
Date: Thu, 26 Nov 2026 10:28:47 +0530
Message-ID: <20261126045850.28407-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 04:59:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133085
Content-Type: text/plain; charset="utf-8"

This patch applies the upstream fix as referenced in [2], [3]
and [4], using the commit shown in [1].

[1] https://github.com/python-pillow/Pillow/commit/0a263e6264aa5399988d9acd3bbfbca2ca3ec77d
[2] https://nvd.nist.gov/vuln/detail/cve-2026-54059
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-54060
[4] https://nvd.nist.gov/vuln/detail/cve-2026-55379

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 ...-54059-CVE-2026-54060-CVE-2026-55379.patch | 169 ++++++++++++++++++
 .../python/python3-pillow_10.3.0.bb           |   1 +
 2 files changed, 170 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/CVE-2026-54059-CVE-2026-54060-CVE-2026-55379.patch

diff --git a/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-54059-CVE-2026-54060-CVE-2026-55379.patch b/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-54059-CVE-2026-54060-CVE-2026-55379.patch
new file mode 100644
index 0000000000..d1575afac4
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-54059-CVE-2026-54060-CVE-2026-55379.patch
@@ -0,0 +1,169 @@
+From 7d525ae2ccf9109079f6f640ad88c8cb117853d9 Mon Sep 17 00:00:00 2001
+From: Andrew Murray <3112309+radarhere@users.noreply.github.com>
+Date: Tue, 23 Jun 2026 11:41:22 +1000
+Subject: [PATCH] Add decompression bomb checks to FontFile classes (#9711)
+
+Backport Changes:
+- scarthgap 10.3.0 handles standard and jumbo PCF metrics in separate loops,
+  so the decompression-bomb check is added at both call sites in
+  src/PIL/PcfFontFile.py file, upstream’s shared append helper needs only
+  one check.
+
+Ref: https://security-tracker.debian.org/tracker/CVE-2026-54059
+
+(cherry picked from commit 0a263e6264aa5399988d9acd3bbfbca2ca3ec77d)
+
+CVE: CVE-2026-54059 CVE-2026-54060 CVE-2026-55379
+Upstream-Status: Backport [https://github.com/python-pillow/Pillow/commit/0a263e6264aa5399988d9acd3bbfbca2ca3ec77d]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ Tests/test_font_bdf.py | 10 +++++++++-
+ Tests/test_font_pcf.py | 21 ++++++++++++++++++++-
+ Tests/test_fontfile.py |  7 +++++++
+ src/PIL/BdfFontFile.py |  1 +
+ src/PIL/FontFile.py    |  3 ++-
+ src/PIL/PcfFontFile.py |  2 ++
+ 6 files changed, 41 insertions(+), 3 deletions(-)
+
+diff --git a/Tests/test_font_bdf.py b/Tests/test_font_bdf.py
+index 136070f9e..14e01f301 100644
+--- a/Tests/test_font_bdf.py
++++ b/Tests/test_font_bdf.py
+@@ -2,7 +2,7 @@ from __future__ import annotations
+ 
+ import pytest
+ 
+-from PIL import BdfFontFile, FontFile
++from PIL import BdfFontFile, FontFile, Image
+ 
+ filename = "Tests/images/courB08.bdf"
+ 
+@@ -15,6 +15,14 @@ def test_sanity() -> None:
+     assert len([_f for _f in font.glyph if _f]) == 190
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
+diff --git a/Tests/test_font_pcf.py b/Tests/test_font_pcf.py
+index 997809e46..3aba19a35 100644
+--- a/Tests/test_font_pcf.py
++++ b/Tests/test_font_pcf.py
+@@ -1,11 +1,12 @@
+ from __future__ import annotations
+ 
+ import os
++from io import BytesIO
+ from pathlib import Path
+ 
+ import pytest
+ 
+-from PIL import FontFile, Image, ImageDraw, ImageFont, PcfFontFile
++from PIL import FontFile, Image, ImageDraw, ImageFont, PcfFontFile, _binary
+ 
+ from .helper import (
+     assert_image_equal_tofile,
+@@ -107,3 +108,21 @@ def test_high_characters(request: pytest.FixtureRequest, tmp_path: Path) -> None
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
+diff --git a/Tests/test_fontfile.py b/Tests/test_fontfile.py
+index 206499a04..0908a9953 100644
+--- a/Tests/test_fontfile.py
++++ b/Tests/test_fontfile.py
+@@ -7,6 +7,13 @@ import pytest
+ from PIL import FontFile
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
+diff --git a/src/PIL/BdfFontFile.py b/src/PIL/BdfFontFile.py
+index e3eda4fe9..ff71e236e 100644
+--- a/src/PIL/BdfFontFile.py
++++ b/src/PIL/BdfFontFile.py
+@@ -80,6 +80,7 @@ def bdf_char(
+     # and x and y displacement (BBxoff0, BByoff0)
+     # of the lower left corner from the origin of the character.
+     width, height, x_disp, y_disp = (int(p) for p in props["BBX"].split())
++    Image._decompression_bomb_check((width, height))
+ 
+     # The word DWIDTH
+     # followed by the width in x and y of the character in device pixels.
+diff --git a/src/PIL/FontFile.py b/src/PIL/FontFile.py
+index 1e0c1c166..abd092e91 100644
+--- a/src/PIL/FontFile.py
++++ b/src/PIL/FontFile.py
+@@ -74,7 +74,7 @@ class FontFile:
+             if glyph:
+                 d, dst, src, im = glyph
+                 h = max(h, src[3] - src[1])
+-                w = w + (src[2] - src[0])
++                w += src[2] - src[0]
+                 if w > WIDTH:
+                     lines += 1
+                     w = src[2] - src[0]
+@@ -89,6 +89,7 @@ class FontFile:
+         self.ysize = h
+ 
+         # paste glyphs into bitmap
++        Image._decompression_bomb_check((xsize, ysize))
+         self.bitmap = Image.new("1", (xsize, ysize))
+         self.metrics: list[
+             tuple[tuple[int, int], tuple[int, int, int, int], tuple[int, int, int, int]]
+diff --git a/src/PIL/PcfFontFile.py b/src/PIL/PcfFontFile.py
+index 0d1968b14..48c5c3ab1 100644
+--- a/src/PIL/PcfFontFile.py
++++ b/src/PIL/PcfFontFile.py
+@@ -166,6 +166,7 @@ class PcfFontFile(FontFile.FontFile):
+                 descent = i8(fp.read(1)) - 128
+                 xsize = right - left
+                 ysize = ascent + descent
++                Image._decompression_bomb_check((xsize, ysize))
+                 append((xsize, ysize, left, right, width, ascent, descent, 0))
+ 
+         else:
+@@ -179,6 +180,7 @@ class PcfFontFile(FontFile.FontFile):
+                 attributes = i16(fp.read(2))
+                 xsize = right - left
+                 ysize = ascent + descent
++                Image._decompression_bomb_check((xsize, ysize))
+                 append((xsize, ysize, left, right, width, ascent, descent, attributes))
+ 
+         return metrics
+-- 
+2.50.1
+
diff --git a/meta-python/recipes-devtools/python/python3-pillow_10.3.0.bb b/meta-python/recipes-devtools/python/python3-pillow_10.3.0.bb
index 240fec967f..55df58ef4b 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_10.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_10.3.0.bb
@@ -14,6 +14,7 @@ SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=main;protocol=https
            file://CVE-2026-59198.patch \
            file://CVE-2026-59204.patch \
            file://CVE-2026-112393.patch \
+           file://CVE-2026-54059-CVE-2026-54060-CVE-2026-55379.patch \
            "
 SRCREV = "5c89d88eee199ba53f64581ea39b6a1bc52feb1a"
 
-- 
2.50.1

