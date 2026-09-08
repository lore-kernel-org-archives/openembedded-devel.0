Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DC83C79F82
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 03:56:06 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.254.1788839756196414745
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Sep 2026 20:55:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=KDMwCcjs;
 spf=pass (domain: mvista.com, ip: 209.85.216.54, mailfrom: hprajapati@mvista.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so3335434a91.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 20:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1788839755; x=1789444555; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/RPCATxFl3uc13agdcZssKSptRmYrgrs5MdFJArdOSU=;
        b=KDMwCcjsfE7As2A1VAGZjJG9IMNix0Fmq8tN6NkmS6NPldzX6yM2IzzRGlG1Kvye6c
         lzUkUoISd8yMT4W2MC2xtr7lYrbVhDkPsIZhiNcgnsGYLO51kpr0ZcYeQkROC28JiKBu
         LaH3r0TRIi1kWhoeuw0LezsuFZwqvA2EPY8ek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788839755; x=1789444555;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/RPCATxFl3uc13agdcZssKSptRmYrgrs5MdFJArdOSU=;
        b=hubmD0DvcRKbBMZ35mYZnJsXjpfL6cQFFa2nPRtNA6BDOKlMyHKaPGaBtJvhxoIPi9
         o4PU5Fd3830t6pmM/YPjXfSX5eXpCadmXGuXjbrwySqlBVPeJh9NoZEvDMZaySNC7dxb
         m4O4RJv8UkzjR0yUD9vprxygkhhn3FiKb3MfEKog/Z1HPT5HXXseRiWu+HP8HItT/IRi
         9dUD0+DBVRT7/5FINAmJusTpJ9ZzOTIJZwCDuC4L+rpTUO9I/iECP5S+zpgoKyYTiZl8
         ITZudDW4oEPAVjkRjJNfLDaCiqqhZWIK7mzha4v4YsQ45hgUCPIlB32P+x5tK+B2ZWG9
         pHZA==
X-Gm-Message-State: AFuF++nPDmp6wN+KInPlZOpLjOlYLwhH3woJJVNjAfPOdUpptCYUW73t
	7TCMeUFcn3ypMGuCfnkW0fPcWrFZ30pkahcEQNQx7AhRr1BtWhi7fhOOqPk4hyyFlLDpq0dCOqv
	81JZC
X-Gm-Gg: AYBFou3P2kFBiGbH8H1PkQPzLHRejokiNkshzya63tcYM2IArEvftK0wStWM/eIkA1e
	YMX1opGbCRe2anV/hhmi0rfF4+VcUe1f32CgZvf1CnwPV9cMceRN9s6iXDsod61UuvAi7lB8d0w
	gmINpijOY/VrhwI4swaO1XN1B7YuyaTQk7rG7jAvqmazMd2K4WiuHXZe5kaLgWh7s/PGNTnRakO
	T51QA9XeIvd9TRRXAP62S5JW/6Nv81khsF8ej/8rBrkj/BYjdUbu0UH//Uwp67+LuS0D0jufqwA
	pM+ycJnsss035rJThmYqaa11OCMwkjwbxJWCMhSZity+PbnLKRDRI8+6JwB/Dzcla3LRXiupsmW
	6e/tMa6U8FpK7SS8sgAXHip86JWhWfpD+X+GciVRPK/DtJjYgcaJRpw542SnoUuYT5a8xJ+TrqQ
	V8vQyxXTnQmoer3JJL2ITli753Zjs6LuwQu4i+Dj2ZDXaQnIBGAqnxJzIFSfcIxi2MAB8kJz9/b
	g==
X-Received: by 2002:a17:90b:5826:b0:38e:7168:281 with SMTP id 98e67ed59e1d1-39b261b07b6mr41844340a91.10.1788839755184;
        Mon, 07 Sep 2026 20:55:55 -0700 (PDT)
Received: from MVIN00013.mvista.com ([103.250.136.160])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432424d27asm42597421c88.2.2026.09.07.20.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 20:55:54 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-python][scarthgap][PATCHv2] python3-pillow: fix CVE-2026-42311
Date: Tue,  8 Sep 2026 09:25:47 +0530
Message-ID: <20260908035547.8571-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Sep 2026 03:56:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129855

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-42311

Pick patch from [1] & [2] also mentioned at Debian report in [3]

[1] https://github.com/python-pillow/Pillow/commit/58f9a1d166dcb0c274807d4423522d205b0c35ea
[2] https://github.com/python-pillow/Pillow/commit/3b1f70da
[3] https://security-tracker.debian.org/tracker/CVE-2026-42311

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../python3-pillow/CVE-2026-42311.patch       | 356 ++++++++++++++++++
 .../python/python3-pillow_10.3.0.bb           |   1 +
 2 files changed, 357 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/CVE-2026-42311.patch

diff --git a/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-42311.patch b/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-42311.patch
new file mode 100644
index 0000000000..326b747d1b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-42311.patch
@@ -0,0 +1,356 @@
+From 4bada07dc6c24319edd1eb76f1dd28d968d58207 Mon Sep 17 00:00:00 2001
+From: Andrew Murray <radarhere@users.noreply.github.com>
+Date: Wed, 18 Feb 2026 22:24:03 +1100
+Subject: [PATCH] Avoid overflow by not adding extents together
+
+Reference : https://security-tracker.debian.org/tracker/DSA-6357-1
+
+CVE: CVE-2026-42311
+Upstream-Status: Backport [https://github.com/python-pillow/Pillow/commit/58f9a1d166dcb0c274807d4423522d205b0c35ea]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ Tests/test_imagefile.py | 70 +++++++++++++++++++++++++++++++++++++++--
+ src/PIL/Image.py        |  4 +--
+ src/PIL/ImageFile.py    | 18 ++++-------
+ src/decode.c            | 61 +++++++++++++++++++++++------------
+ src/encode.c            | 60 ++++++++++++++++++++++-------------
+ 5 files changed, 156 insertions(+), 57 deletions(-)
+
+diff --git a/Tests/test_imagefile.py b/Tests/test_imagefile.py
+index 8aa102729..a00f111e1 100644
+--- a/Tests/test_imagefile.py
++++ b/Tests/test_imagefile.py
+@@ -142,6 +142,27 @@ class TestImageFile:
+         with pytest.raises(SystemError, match="tile cannot extend outside image"):
+             ImageFile._save(im, fp, [ImageFile._Tile("raw", xy + (1, 1), 0, "1")])
+ 
++    def test_extents_none(self) -> None:
++        with Image.open("Tests/images/hopper.jpg") as im:
++            im.tile = [im.tile[0]._replace(extents=None)]
++            im.load()
++
++        for extents in ("invalid", (0,), ("0", "0", "0", "0")):
++            with Image.open("Tests/images/hopper.jpg") as im:
++                im.tile = [im.tile[0]._replace(extents=extents)]  # type: ignore[arg-type]
++                with pytest.raises(ValueError, match="invalid extents"):
++                    im.load()
++
++        im2 = Image.new("L", (1, 1))
++        fp = BytesIO()
++        tile = ImageFile._Tile("jpeg", None, 0, "L")
++        ImageFile._save(im2, fp, [tile])
++
++        for extents in ("invalid", (0,), ("0", "0", "0", "0")):
++            tile = tile._replace(extents=extents)  # type: ignore[arg-type]
++            with pytest.raises(ValueError, match="invalid extents"):
++                ImageFile._save(im2, fp, [tile])
++
+     def test_no_format(self) -> None:
+         buf = BytesIO(b"\x00" * 255)
+ 
+@@ -279,7 +300,20 @@ class TestPyDecoder(CodecsTest):
+         assert MockPyDecoder.last.state.xsize == 200
+         assert MockPyDecoder.last.state.ysize == 200
+ 
+-    def test_negsize(self) -> None:
++    def test_negative_offset(self) -> None:
++        buf = BytesIO(b"\x00" * 255)
++
++        im = MockImageFile(buf)
++        im.tile = [ImageFile._Tile("MOCK", (-10, yoff, xsize, ysize), 32, None)]
++
++        with pytest.raises(ValueError):
++            im.load()
++
++        im.tile = [ImageFile._Tile("MOCK", (xoff, -10, xsize, ysize), 32, None)]
++        with pytest.raises(ValueError):
++            im.load()
++
++    def test_negative_size(self) -> None:
+         buf = BytesIO(b"\x00" * 255)
+ 
+         im = MockImageFile(buf)
+@@ -341,7 +375,39 @@ class TestPyEncoder(CodecsTest):
+         assert MockPyEncoder.last.state.xsize == 200
+         assert MockPyEncoder.last.state.ysize == 200
+ 
+-    def test_negsize(self) -> None:
++    def test_negative_offset(self) -> None:
++        buf = BytesIO(b"\x00" * 255)
++
++        im = MockImageFile(buf)
++
++        fp = BytesIO()
++        MockPyEncoder.last = None
++        with pytest.raises(ValueError):
++            ImageFile._save(
++                im,
++                fp,
++                [
++                    ImageFile._Tile(
++                        "MOCK", (-10, yoff, xoff + xsize, yoff + ysize), 0, "RGB"
++                    )
++                ],
++            )
++        last: MockPyEncoder | None = MockPyEncoder.last
++        assert last
++        assert last.cleanup_called
++
++        with pytest.raises(ValueError):
++            ImageFile._save(
++                im,
++                fp,
++                [
++                    ImageFile._Tile(
++                        "MOCK", (xoff, -10, xoff + xsize, yoff + ysize), 0, "RGB"
++                    )
++                ],
++            )
++
++    def test_negative_size(self) -> None:
+         buf = BytesIO(b"\x00" * 255)
+ 
+         im = MockImageFile(buf)
+diff --git a/src/PIL/Image.py b/src/PIL/Image.py
+index baef0aa11..94e021a48 100644
+--- a/src/PIL/Image.py
++++ b/src/PIL/Image.py
+@@ -759,7 +759,7 @@ class Image:
+ 
+         # unpack data
+         e = _getencoder(self.mode, encoder_name, args)
+-        e.setimage(self.im)
++        e.setimage(self.im, (0, 0) + self.size)
+ 
+         bufsize = max(65536, self.size[0] * 4)  # see RawEncode.c
+ 
+@@ -822,7 +822,7 @@ class Image:
+ 
+         # unpack data
+         d = _getdecoder(self.mode, decoder_name, args)
+-        d.setimage(self.im)
++        d.setimage(self.im, (0, 0) + self.size)
+         s = d.decode(data)
+ 
+         if s[0] >= 0:
+diff --git a/src/PIL/ImageFile.py b/src/PIL/ImageFile.py
+index 0283fa2fd..ac14d53ed 100644
+--- a/src/PIL/ImageFile.py
++++ b/src/PIL/ImageFile.py
+@@ -666,28 +666,22 @@ class PyCodec:
+ 
+         if extents:
+             (x0, y0, x1, y1) = extents
+-        else:
+-            (x0, y0, x1, y1) = (0, 0, 0, 0)
+ 
+-        if x0 == 0 and x1 == 0:
+-            self.state.xsize, self.state.ysize = self.im.size
+-        else:
++            if x0 < 0 or y0 < 0 or x1 > self.im.size[0] or y1 > self.im.size[1]:
++                msg = "Tile cannot extend outside image"
++                raise ValueError(msg)
++
+             self.state.xoff = x0
+             self.state.yoff = y0
+             self.state.xsize = x1 - x0
+             self.state.ysize = y1 - y0
++        else:
++            self.state.xsize, self.state.ysize = self.im.size
+ 
+         if self.state.xsize <= 0 or self.state.ysize <= 0:
+             msg = "Size cannot be negative"
+             raise ValueError(msg)
+ 
+-        if (
+-            self.state.xsize + self.state.xoff > self.im.size[0]
+-            or self.state.ysize + self.state.yoff > self.im.size[1]
+-        ):
+-            msg = "Tile cannot extend outside image"
+-            raise ValueError(msg)
+-
+ 
+ class PyDecoder(PyCodec):
+     """
+diff --git a/src/decode.c b/src/decode.c
+index 43fa0ae3e..2b12a29bf 100644
+--- a/src/decode.c
++++ b/src/decode.c
+@@ -154,44 +154,65 @@ PyImaging_AsImaging(PyObject *op);
+ 
+ static PyObject *
+ _setimage(ImagingDecoderObject *decoder, PyObject *args) {
+-    PyObject *op;
++    PyObject *op, *extents;
+     Imaging im;
+     ImagingCodecState state;
+     int x0, y0, x1, y1;
+ 
+-    x0 = y0 = x1 = y1 = 0;
+-
+     /* FIXME: should publish the ImagingType descriptor */
+-    if (!PyArg_ParseTuple(args, "O|(iiii)", &op, &x0, &y0, &x1, &y1)) {
++    if (!PyArg_ParseTuple(args, "OO", &op, &extents)) {
+         return NULL;
+     }
+     im = PyImaging_AsImaging(op);
+     if (!im) {
+         return NULL;
+     }
+-
+-    decoder->im = im;
+-
+-    state = &decoder->state;
+-
+-    /* Setup decoding tile extent */
+-    if (x0 == 0 && x1 == 0) {
+-        state->xsize = im->xsize;
+-        state->ysize = im->ysize;
++    if (extents == Py_None) {
++        x0 = 0;
++        y0 = 0;
++        x1 = im->xsize;
++        y1 = im->ysize;
+     } else {
+-        state->xoff = x0;
+-        state->yoff = y0;
+-        state->xsize = x1 - x0;
+-        state->ysize = y1 - y0;
++        if (!PyTuple_Check(extents) || PyTuple_GET_SIZE(extents) != 4) {
++            PyErr_SetString(PyExc_ValueError, "invalid extents");
++            return NULL;
++        }
++        for (int i = 0; i < 4; i++) {
++            PyObject *extent = PyTuple_GetItem(extents, i);
++            if (!PyLong_Check(extent)) {
++                PyErr_SetString(PyExc_ValueError, "invalid extents");
++                return NULL;
++            }
++            int e = (int)PyLong_AsLong(extent);
++
++            if (i == 0) {
++                x0 = e;
++            } else if (i == 1) {
++                y0 = e;
++            } else if (i == 2) {
++                x1 = e;
++            } else {
++                y1 = e;
++            }
++        }
+     }
+ 
+-    if (state->xoff < 0 || state->xsize <= 0 ||
+-        state->xsize + state->xoff > (int)im->xsize || state->yoff < 0 ||
+-        state->ysize <= 0 || state->ysize + state->yoff > (int)im->ysize) {
++    if (x0 < 0 || y0 < 0 || x1 <= x0 || y1 <= y0 || x1 > (int)im->xsize ||
++        y1 > (int)im->ysize) {
+         PyErr_SetString(PyExc_ValueError, "tile cannot extend outside image");
+         return NULL;
+     }
+ 
++    decoder->im = im;
++
++    state = &decoder->state;
++
++    /* Setup decoding tile extent */
++    state->xoff = x0;
++    state->yoff = y0;
++    state->xsize = x1 - x0;
++    state->ysize = y1 - y0;
++
+     /* Allocate memory buffer (if bits field is set) */
+     if (state->bits > 0) {
+         if (!state->bytes) {
+diff --git a/src/encode.c b/src/encode.c
+index 87426cdec..360f26f97 100644
+--- a/src/encode.c
++++ b/src/encode.c
+@@ -218,45 +218,63 @@ PyImaging_AsImaging(PyObject *op);
+ 
+ static PyObject *
+ _setimage(ImagingEncoderObject *encoder, PyObject *args) {
+-    PyObject *op;
++    PyObject *op, *extents;
+     Imaging im;
+     ImagingCodecState state;
+     Py_ssize_t x0, y0, x1, y1;
+ 
+-    /* Define where image data should be stored */
+-
+-    x0 = y0 = x1 = y1 = 0;
+-
+     /* FIXME: should publish the ImagingType descriptor */
+-    if (!PyArg_ParseTuple(args, "O|(nnnn)", &op, &x0, &y0, &x1, &y1)) {
++    if (!PyArg_ParseTuple(args, "OO", &op, &extents)) {
+         return NULL;
+     }
+     im = PyImaging_AsImaging(op);
+     if (!im) {
+         return NULL;
+     }
+-
+-    encoder->im = im;
+-
+-    state = &encoder->state;
+-
+-    if (x0 == 0 && x1 == 0) {
+-        state->xsize = im->xsize;
+-        state->ysize = im->ysize;
++    if (extents == Py_None) {
++        x0 = 0;
++        y0 = 0;
++        x1 = im->xsize;
++        y1 = im->ysize;
+     } else {
+-        state->xoff = x0;
+-        state->yoff = y0;
+-        state->xsize = x1 - x0;
+-        state->ysize = y1 - y0;
++        if (!PyTuple_Check(extents) || PyTuple_GET_SIZE(extents) != 4) {
++            PyErr_SetString(PyExc_ValueError, "invalid extents");
++            return NULL;
++        }
++        for (int i = 0; i < 4; i++) {
++            PyObject *extent = PyTuple_GetItem(extents, i);
++            if (!PyLong_Check(extent)) {
++                PyErr_SetString(PyExc_ValueError, "invalid extents");
++                return NULL;
++            }
++            Py_ssize_t e = (Py_ssize_t)PyLong_AsLong(extent);
++
++            if (i == 0) {
++                x0 = e;
++            } else if (i == 1) {
++                y0 = e;
++            } else if (i == 2) {
++                x1 = e;
++            } else {
++                y1 = e;
++            }
++        }
+     }
+ 
+-    if (state->xoff < 0 || state->xsize <= 0 ||
+-        state->xsize + state->xoff > im->xsize || state->yoff < 0 ||
+-        state->ysize <= 0 || state->ysize + state->yoff > im->ysize) {
++    if (x0 < 0 || y0 < 0 || x1 <= x0 || y1 <= y0 || x1 > im->xsize || y1 > im->ysize) {
+         PyErr_SetString(PyExc_SystemError, "tile cannot extend outside image");
+         return NULL;
+     }
+ 
++    encoder->im = im;
++
++    state = &encoder->state;
++
++    state->xoff = x0;
++    state->yoff = y0;
++    state->xsize = x1 - x0;
++    state->ysize = y1 - y0;
++
+     /* Allocate memory buffer (if bits field is set) */
+     if (state->bits > 0) {
+         if (state->xsize > ((INT_MAX / state->bits) - 7)) {
+-- 
+2.50.1
+
diff --git a/meta-python/recipes-devtools/python/python3-pillow_10.3.0.bb b/meta-python/recipes-devtools/python/python3-pillow_10.3.0.bb
index 9f1ef87a46..8f7d11195d 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_10.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_10.3.0.bb
@@ -10,6 +10,7 @@ SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=main;protocol=https
            file://run-ptest \
            file://CVE-2026-25990.patch \
            file://CVE-2026-40192.patch \
+           file://CVE-2026-42311.patch \
            "
 SRCREV = "5c89d88eee199ba53f64581ea39b6a1bc52feb1a"
 
-- 
2.50.1


