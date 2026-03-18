Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2385AFCD0CE
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 08:00:28 +0000 (UTC)
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8911.1773820825821595118
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Mar 2026 01:00:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=PQli/n28;
 spf=pass (domain: mvista.com, ip: 74.125.82.42, mailfrom: hprajapati@mvista.com)
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1279eced0b9so9247359c88.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Mar 2026 01:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1773820825; x=1774425625; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=96R3/x67NN68a5PcO42l1DUoHWi2eEo/Xh55vsb/MVg=;
        b=PQli/n28g3PaO9dOL3wKLxT/I/1nHMvQgvLdBOm24M09/9ij1kPYoyAJcxBdO0QiiX
         3RAwR9lI+lZkBWe5kxo9Bb6FDwF0bOagdiuGHRf9v3mK50iZLtjo8CnkG9jOW4aOVMVm
         6G4W37SiYf5fzudHw74JJMs9HFBis5B7pKgeo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773820825; x=1774425625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=96R3/x67NN68a5PcO42l1DUoHWi2eEo/Xh55vsb/MVg=;
        b=lBF0Z0PV2X+tjrfgrF2lj7jNm75JBmLBjLhlHMc+C7Fy8h/df7J4hgWaNcgKcpml3n
         Us1gcDevrnwYVtDOKfNV+6Rwz0bWT3cKPsBGC/TOGeuDD8G8N8LANsoyKD+nosLHraeA
         DCeEI1NKqYdyNMeKMEaOZAtcZnjuF90Mqz97wQUUX6YnsbL6zniMCObs4q/0fC4xN/X6
         vRkFHhVkFuu1UjqTMGAMCBzhevBkFN1Ho96vS03qzxwOrR0lOVq6nZ7tyAVtbdQKpbGF
         YocR67bR2A4bwrGiU8xcRtf8ldPEjuToJiM2ZyT+spuA0X4ZdZ1IMirU/L1SXu3NCuA9
         25xw==
X-Gm-Message-State: AOJu0Yx94BcxurqdMhQUCCMp+/fW7IcrmMOMFGefc+m/BuXFXfPixf5X
	cCl+KEhjJ8nKtLEHIFVZo3TZ1UachMlFR7ZWWj2Tcq3vfMIhKJFIGVVUaMx0wO/be+peolwAiiP
	JjCil
X-Gm-Gg: ATEYQzy0EZVGkH4HZ/xQ8Qu29Fhah5ckKcUMRetwUTXihx69U2JIG53rT6oQCtDsovF
	ijcuaUYnbq4RY/kdqyBFyLFwKwiL1hfF3W0sY8Jt6lO57mruTxErg8/4o4Dxf74eNsO2xWRK21g
	I2a+T92jt2m0nmCCacYmaJTUJfqiujj+keRP7fSwv8Qchrf16HvjxDO2/fRXXxHjUbLzB/cQ9mW
	1MiLfl8eE2lePu0CH+hdVgQJgPCn2AclHOUbJoYLyOUIWAmp7t7ljPACdB4zlcZnuKhnUscRJFh
	D183wZKPJ005L22ocxL19ILlNTRMofvN1z7/16zO3JYxdLAiNoLtDlVqZWSUDomwWpjfB65tcds
	NqtMKHVlkKYYwJpK4SLvWq4scPkEm6DKWf+/OLVdOkJL+ACMtf9r0thq6OkTISskcUTKd92n66q
	qzVKdON7mfS8Dl3HndA8F996OOzAGCDA+QKfI=
X-Received: by 2002:a05:7022:e1d:b0:11b:9386:8254 with SMTP id a92af1059eb24-129a719b379mr1265325c88.41.1773820824514;
        Wed, 18 Mar 2026 01:00:24 -0700 (PDT)
Received: from MVIN00013.mvista.com ([43.249.234.147])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-129a7256263sm2488176c88.4.2026.03.18.01.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 01:00:23 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-python][scarthgap][PATCH] python3-pillow: fix CVE-2026-25990
Date: Wed, 18 Mar 2026 13:30:15 +0530
Message-ID: <20260318080015.159556-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Mar 2026 08:00:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125349

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-25990

Backport commit[1] which fixes this vulnerability as mentioned NVD report in [2].

[1] https://github.com/python-pillow/Pillow/commit/9000313cc5d4a31bdcdd6d7f0781101abab553aa
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-25990

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../python3-pillow/CVE-2026-25990.patch       | 91 +++++++++++++++++++
 .../python/python3-pillow_10.3.0.bb           |  1 +
 2 files changed, 92 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/CVE-2026-25990.patch

diff --git a/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-25990.patch b/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-25990.patch
new file mode 100644
index 0000000000..807207274e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-25990.patch
@@ -0,0 +1,91 @@
+From 9000313cc5d4a31bdcdd6d7f0781101abab553aa Mon Sep 17 00:00:00 2001
+From: Andrew Murray <3112309+radarhere@users.noreply.github.com>
+Date: Wed, 11 Feb 2026 10:24:50 +1100
+Subject: [PATCH] Fix OOB Write with invalid tile extents (#9427)
+
+Co-authored-by: Eric Soroos <eric-github@soroos.net>
+
+CVE: CVE-2026-25990
+Upstream-Status: Backport [https://github.com/python-pillow/Pillow/commit/9000313cc5d4a31bdcdd6d7f0781101abab553aa]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ Tests/test_file_psd.py           |  17 +++++++++++++++++
+ Tests/test_imagefile.py          |   7 +++++++
+ src/decode.c                     |   3 ++-
+ src/encode.c                     |   3 ++-
+ 4 files changed, 28 insertions(+), 2 deletions(-)
+
+diff --git a/Tests/test_file_psd.py b/Tests/test_file_psd.py
+index 484a1be8f..1a98daffe 100644
+--- a/Tests/test_file_psd.py
++++ b/Tests/test_file_psd.py
+@@ -167,3 +167,20 @@ def test_crashes(test_file: str, raises) -> None:
+         with pytest.raises(raises):
+             with Image.open(f):
+                 pass
++
++
++@pytest.mark.parametrize(
++    "test_file",
++    [
++        "Tests/images/psd-oob-write.psd",
++        "Tests/images/psd-oob-write-x.psd",
++        "Tests/images/psd-oob-write-y.psd",
++    ],
++)
++def test_bounds_crash(test_file: str) -> None:
++    with Image.open(test_file) as im:
++        assert isinstance(im, PsdImagePlugin.PsdImageFile)
++        im.seek(im.n_frames)
++
++        with pytest.raises(ValueError):
++            im.load()
+diff --git a/Tests/test_imagefile.py b/Tests/test_imagefile.py
+index ddcae80d6..8aa102729 100644
+--- a/Tests/test_imagefile.py
++++ b/Tests/test_imagefile.py
+@@ -135,6 +135,13 @@ class TestImageFile:
+         with pytest.raises(OSError):
+             p.close()
+ 
++    @pytest.mark.parametrize("xy", ((-1, 0), (0, -1)))
++    def test_negative_tile_extents(self, xy: tuple[int, int]) -> None:
++        im = Image.new("1", (1, 1))
++        fp = BytesIO()
++        with pytest.raises(SystemError, match="tile cannot extend outside image"):
++            ImageFile._save(im, fp, [ImageFile._Tile("raw", xy + (1, 1), 0, "1")])
++
+     def test_no_format(self) -> None:
+         buf = BytesIO(b"\x00" * 255)
+ 
+diff --git a/src/decode.c b/src/decode.c
+index ea2f3af80..43fa0ae3e 100644
+--- a/src/decode.c
++++ b/src/decode.c
+@@ -185,7 +185,8 @@ _setimage(ImagingDecoderObject *decoder, PyObject *args) {
+         state->ysize = y1 - y0;
+     }
+ 
+-    if (state->xsize <= 0 || state->xsize + state->xoff > (int)im->xsize ||
++    if (state->xoff < 0 || state->xsize <= 0 ||
++        state->xsize + state->xoff > (int)im->xsize || state->yoff < 0 ||
+         state->ysize <= 0 || state->ysize + state->yoff > (int)im->ysize) {
+         PyErr_SetString(PyExc_ValueError, "tile cannot extend outside image");
+         return NULL;
+diff --git a/src/encode.c b/src/encode.c
+index c7dd51015..87426cdec 100644
+--- a/src/encode.c
++++ b/src/encode.c
+@@ -250,7 +250,8 @@ _setimage(ImagingEncoderObject *encoder, PyObject *args) {
+         state->ysize = y1 - y0;
+     }
+ 
+-    if (state->xsize <= 0 || state->xsize + state->xoff > im->xsize ||
++    if (state->xoff < 0 || state->xsize <= 0 ||
++        state->xsize + state->xoff > im->xsize || state->yoff < 0 ||
+         state->ysize <= 0 || state->ysize + state->yoff > im->ysize) {
+         PyErr_SetString(PyExc_SystemError, "tile cannot extend outside image");
+         return NULL;
+-- 
+2.50.1
+
diff --git a/meta-python/recipes-devtools/python/python3-pillow_10.3.0.bb b/meta-python/recipes-devtools/python/python3-pillow_10.3.0.bb
index 8b0bcf55dd..a81bcca215 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_10.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_10.3.0.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c349a4b4b9ec2377a8fd6a7df87dbffe"
 SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=main;protocol=https \
            file://0001-support-cross-compiling.patch \
            file://run-ptest \
+           file://CVE-2026-25990.patch \
            "
 SRCREV = "5c89d88eee199ba53f64581ea39b6a1bc52feb1a"
 
-- 
2.50.1


