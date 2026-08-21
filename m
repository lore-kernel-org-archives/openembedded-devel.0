Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F60FC5DF87
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 06:51:41 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2007.1787295096454845017
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Aug 2026 23:51:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=ajLy9ERJ;
 spf=pass (domain: mvista.com, ip: 209.85.216.50, mailfrom: hprajapati@mvista.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso643339a91.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 Aug 2026 23:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1787295096; x=1787899896; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7Wf3zdn4Cgsx7XC4+J5ytuBpeTajOWuqXwTCdbLy1c8=;
        b=ajLy9ERJZ8twysTzZTpovufGM8LkADlo7pDD8xiBo6NHBnPVE0yQUvcDBUa3NEd+G7
         Tddou9opxokwCF54h2oQg1wwh9T+Te2m06WlMCPtg0Dxp3da8QtQSApJqi1yci/wuVOt
         OSDbAFy5JRPo4XK45aC4INyc68eLlt0BlgvaM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787295096; x=1787899896;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7Wf3zdn4Cgsx7XC4+J5ytuBpeTajOWuqXwTCdbLy1c8=;
        b=jhVYtepUFnBagFm/eLXqsvJ9T+kzqz3hfvDJXBrwCIdKtDGOwfEzhWg4LLA8eIo+tc
         VJ6zvV0gSVMRXco82aJf8/K9RkvJoQbN9GHgDujGDekwrym+yoxBBvP1i/7byULceKta
         /P4ECtgw7ZJ9k5JG0XbH38qTdiV2T8UBljovsIgFEZN1diklJNpfuxBz0rB/GSDK8RRW
         cgsWrcBaaKcqr6684X443w30cOPyeoTrevOTBZDGXRvvpS3/HRuWTCepTLEd+f7L2H7t
         El7w1Bx/6UTbflhhQYeDpQ5/MXVCviPusVhE8wfKpw20vAxZuqgB6plmqxru6585oRaf
         W83A==
X-Gm-Message-State: AFuF++mRK72L0eEgM5oBErhjJyZAcTj2M6FinGfbBwrtiSuz/WSDngre
	2AdOk9z/iD84JHqck2Zyy4+fuGwtxa/bJsJuH58Ax3M0xdIouPYX6bqM9X32fZ463fBiU3oxEfZ
	h6794
X-Gm-Gg: AR+sD13tC+aGKnZy1otEYc03PQ8dqIs45c6S3BEDMsMbAODCFljTTt+xatkUWvIM5cE
	Xhk/z12DbxvXF30Zw97eVvCM9KDPO+1/QI2ZclfKqgwLJ+fjonqhuLBGB15H/QB2RSVtQQn6eTo
	mbB2EvneEqtwpzteKDJ9TwiayP66vfidSCME1p2Th6FsPhMWKP6X9sWlMQk8+IQ+s4PzSJb6l83
	FXRqUJ7y9h2n9Xi3ErMApJwyMjjG+ecj8qx55lTGkF5n5suq6cyZTkhCnge6T1mYMAvSqIe3u1y
	forLQtsUd8Uwxta7cKu4wFt4TO0VF5PkoblYG/oGihaBM1XhYRfQRa93PuSUKyDk4+IPLpbL/dJ
	/YRpgcnwdec20+37uSxh5JCkBcbEazPAJqXloexciu13P1QdVWaz1mJV8RKks9t9RpLzhzcyyDB
	1AwjUxK3gDBVPrex/MCN9C2VwyIIQWdHPlf43LAkrlVxL7GDR/8BlyFA2hDMZ40vn4JTl5D4ss0
	w==
X-Received: by 2002:a17:90b:2687:b0:38f:26c7:165e with SMTP id 98e67ed59e1d1-395c383cae0mr8297705a91.9.1787295095787;
        Thu, 20 Aug 2026 23:51:35 -0700 (PDT)
Received: from MVIN00013.mvista.com ([150.129.170.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327d6168e5bsm13256007eec.1.2026.08.20.23.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 23:51:35 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-python][scarthgap][PATCH] python3-pillow: fix CVE-2026-42311
Date: Fri, 21 Aug 2026 12:21:27 +0530
Message-ID: <20260821065127.67925-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2026 06:51:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129415

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-42311

Pick patch from [1] also mentioned at Debian report in [2]

[1] https://github.com/python-pillow/Pillow/commit/58f9a1d166dcb0c274807d4423522d205b0c35ea
[2] https://security-tracker.debian.org/tracker/CVE-2026-42311

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


