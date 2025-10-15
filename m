Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7947CCD18E
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 09:23:21 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web11.11546.1760520194065374180
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Oct 2025 02:23:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kJkdvwex;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-30cce5be7d0so1581494fac.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Oct 2025 02:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760520193; x=1761124993; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KJBcH1jQv9hgB753etpuCjpusIlOpmHrQdI1bDXuqrQ=;
        b=kJkdvwexvP3vmOjFCKl8B8fKYwmeqmk597ST7O7eCs4Iywez0bMEzHxkDBnoJHHl5W
         YcMImvm9CN4itSY+Qx1ZsTiwQm8kpEIz7wBftYe2m1G0PvmqRYyerOmHsBOR20n8/NK0
         z3daH4+12mzAikTro15l/YfLNDg99up7R3t8OHpZlm9Y++OV9ke86VYZ3xJJqbuqs2Y/
         WoKumE/t4RDNW59PLXGoeRCgJQ3tOLrPcph2I/4Ci+2pyYcNFGnp5jSH6FeMws2bJD89
         xeWAGzjKxdzjrxs7yiv2TaUaVOXQ+3HLrQCVfA23LZRFXxLHCAeOjiWWLpGzKddbIIrI
         ytjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760520193; x=1761124993;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KJBcH1jQv9hgB753etpuCjpusIlOpmHrQdI1bDXuqrQ=;
        b=P/AxVH02sTXAeVbJyuzyVMlhNSnXU88e7XKChHf6z5/tQTw42QfAKEc0MBfDunCtDY
         UJgYFwyGTl74FH/6dwl35SbtF32ciNGVkMrAw57QftGCyj6GDLWc3PUbxqUWW5aNwgCi
         2U/HgNDu9RVYexzoURfQUP0oqHpBlufjcd6seZCkqJmHqlktSVHjDn52S61rO9BF/+/O
         7zFB5P9r15zDPEjshb4t7B4iVb+JEpnQlylBqt4B8ltQ2cL8ANaNHPXqKU379vBmOqSQ
         2dT9BVBhHIMWa62gmAZ3uEGm4zkV91bn/P7BLR9RE1sP+DOjnjiKtYByTOxR/GkaZHyE
         O4Cw==
X-Gm-Message-State: AOJu0YxAMGeh4qgdbrSspk1MfA9E/tIzuvQeA2VkcgEH971+MhoMVW0e
	R3p1q3YDdXfUqzkRqeyFrxu4YfYXV8PWhkr4od2h3yUeWZdcAd1tQbGlzALxGnJR90BHNU/ZJ8v
	IxdeSY4GiH1I7h4JJDgJ6gNhIHDI38sA=
X-Gm-Gg: ASbGnctsK3BYA+CAbdf9ACJkkK5eB0xg7Ti32ZDEhSmkgBTud8gDiaU+8lgsBQWc8y6
	CDGo9Xps4Xx04nYwtombLtnq2lsPJfjUDgfB7LDIeYDYeIvDTd3uXV6cvvvkHwLRsaMrCwP6qFQ
	lccKh5rX/U+X4ozEKSaMA3hJ4ou/YONHeAhOrlgIHA2e9qKv4/pJ6ofpOxkJKN7Zhjj/VPlWshO
	WFk+L0mebEs2zr4+iPik9DXQoaH
X-Google-Smtp-Source: AGHT+IH8n0MoNX7RvcbX2ZuErKnHAYLECN+Zsds/wlFhZPmas98izFxhEEJUG3l8LWRohVymkT0u72enDhbhFd8A6Zg=
X-Received: by 2002:a05:6870:9625:b0:36a:9d8c:b2f7 with SMTP id
 586e51a60fabf-3c0f4ab6c11mr11665390fac.18.1760520193084; Wed, 15 Oct 2025
 02:23:13 -0700 (PDT)
MIME-Version: 1.0
References: <20251015063531.1573191-1-ankur.tyagi85@gmail.com>
 <20251015063531.1573191-2-ankur.tyagi85@gmail.com> <300c0fb8-5d58-4500-8122-406549f2d5d7@gmail.com>
In-Reply-To: <300c0fb8-5d58-4500-8122-406549f2d5d7@gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Wed, 15 Oct 2025 22:23:02 +1300
X-Gm-Features: AS18NWDnbApQVaDi7wq_fqQKDW6xyVpPfK4L6j90c3ZpBYqrhWNvXE-c9KEI8XY
Message-ID: <CADySD0Fxa2qpEWV++s=tA-sUeHZBbS1rhQdBXYgS5fmbPtoGaA@mail.gmail.com>
Subject: Re: [oe][meta-oe][scarthgap][PATCH 2/4] libvpx: patch CVE-2024-5197
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Oct 2025 09:23:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120701

On Wed, Oct 15, 2025 at 9:44=E2=80=AFPM Gyorgy Sarvari <skandigraun@gmail.c=
om> wrote:
>
> It looks that v1.14.1 contains this fix also - can the relevant commit
> be cherry-picked from master? (Maybe not because it's a big change,
> haven't checked, this is just a question...)
>
Yeah, the patch is big but the CVE fix is actually three commits which
I cherry-picked from v1.14.1 and squashed in one patch.
It made the patch big but I thought it was better than keeping three
separate patches for a single CVE.
I included all three commit details in the patch description along
with bug ID to avoid any loss of information.

But open to other ideas if it simplifies the situation.

> On 10/15/25 08:35, Ankur Tyagi via lists.openembedded.org wrote:
> > Details https://nvd.nist.gov/vuln/detail/CVE-2024-5197
> > ---
> >  .../webm/libvpx/CVE-2024-5197.patch           | 225 ++++++++++++++++++
> >  .../recipes-multimedia/webm/libvpx_1.14.0.bb  |   1 +
> >  2 files changed, 226 insertions(+)
> >  create mode 100644 meta-oe/recipes-multimedia/webm/libvpx/CVE-2024-519=
7.patch
> >
> > diff --git a/meta-oe/recipes-multimedia/webm/libvpx/CVE-2024-5197.patch=
 b/meta-oe/recipes-multimedia/webm/libvpx/CVE-2024-5197.patch
> > new file mode 100644
> > index 0000000000..5ab7f6d8d5
> > --- /dev/null
> > +++ b/meta-oe/recipes-multimedia/webm/libvpx/CVE-2024-5197.patch
> > @@ -0,0 +1,225 @@
> > +From 402e649a26196152a1703a949a71e4c8985edb8a Mon Sep 17 00:00:00 2001
> > +From: Wan-Teh Chang <wtc@google.com>
> > +Date: Wed, 10 Apr 2024 17:01:10 -0700
> > +Subject: [PATCH] CVE-2024-5197
> > +
> > +[1] Fix integer overflows in calc of stride_in_bytes
> > +
> > +A port of the libaom CL
> > +https://aomedia-review.googlesource.com/c/aom/+/188761.
> > +
> > +Fix unsigned integer overflows in the calculation of stride_in_bytes i=
n
> > +img_alloc_helper() when d_w is huge.
> > +
> > +Change the type of stride_in_bytes from unsigned int to int because it
> > +will be assigned to img->stride[VPX_PLANE_Y], which is of the int type=
.
> > +
> > +Test:
> > +. ../libvpx/tools/set_analyzer_env.sh integer
> > +../libvpx/configure --enable-debug --disable-optimizations
> > +make -j
> > +./test_libvpx --gtest_filter=3DVpxImageTest.VpxImgAllocHugeWidth
> > +
> > +Bug: chromium:332382766
> > +Change-Id: I3b39d78f61c7255e10cbf72ba2f4975425a05a82
> > +
> > +[2] Avoid integer overflows in arithmetic operations
> > +
> > +A port of the libaom CL
> > +https://aomedia-review.googlesource.com/c/aom/+/188823.
> > +
> > +Impose maximum values on the input parameters so that we can perform
> > +arithmetic operations without worrying about overflows.
> > +
> > +Also change the VpxImageTest.VpxImgAllocHugeWidth test to write to the
> > +first and last samples in the first row of the Y plane, so that the te=
st
> > +will crash if there is unsigned integer overflow in the calculation of
> > +stride_in_bytes.
> > +
> > +Bug: chromium:332382766
> > +Change-Id: I54cec6c9e26377abaa8a991042ba277ff70afdf3
> > +
> > +[3] Fix a bug in alloc_size for high bit depths
> > +
> > +I introduced this bug in commit 2e32276:
> > +https://chromium-review.googlesource.com/c/webm/libvpx/+/5446333
> > +
> > +I changed the line
> > +
> > +  stride_in_bytes =3D (fmt & VPX_IMG_FMT_HIGHBITDEPTH) ? s * 2 : s;
> > +
> > +to three lines:
> > +
> > +  s =3D (fmt & VPX_IMG_FMT_HIGHBITDEPTH) ? s * 2 : s;
> > +  if (s > INT_MAX) goto fail;
> > +  stride_in_bytes =3D (int)s;
> > +
> > +But I didn't realize that `s` is used later in the calculation of
> > +alloc_size.
> > +
> > +As a quick fix, undo the effect of s * 2 for high bit depths after `s`
> > +has been assigned to stride_in_bytes.
> > +
> > +Bug: chromium:332382766
> > +Change-Id: I53fbf405555645ab1d7254d31aadabe4f426be8c
> > +
> > +(cherry picked from commit c5640e3300690705c336966e2a8bb346a388c829)
> > +(cherry picked from commit 9d7054c0cb83665a74cf6f59b6261f455e692149)
> > +(cherry picked from commit 61c4d556bd03b97d84e3fa49180d14bde5a62baa)
> > +Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > +
> > +CVE: CVE-2024-5197
> > +Upstream-Status: Backport
> > +[1] [https://chromium.googlesource.com/webm/libvpx/+/c5640e3300690705c=
336966e2a8bb346a388c829]
> > +[2] [https://chromium.googlesource.com/webm/libvpx/+/9d7054c0cb83665a7=
4cf6f59b6261f455e692149]
> > +[3] [https://chromium.googlesource.com/webm/libvpx/+/61c4d556bd03b97d8=
4e3fa49180d14bde5a62baa]
> > +---
> > + vpx/src/vpx_image.c | 45 +++++++++++++++++++++++++++++++++-----------=
-
> > + vpx/vpx_image.h     | 16 +++++++++++-----
> > + 2 files changed, 44 insertions(+), 17 deletions(-)
> > +
> > +diff --git a/vpx/src/vpx_image.c b/vpx/src/vpx_image.c
> > +index f9f0dd602..838a9ea4e 100644
> > +--- a/vpx/src/vpx_image.c
> > ++++ b/vpx/src/vpx_image.c
> > +@@ -8,6 +8,7 @@
> > +  *  be found in the AUTHORS file in the root of the source tree.
> > +  */
> > +
> > ++#include <assert.h>
> > + #include <limits.h>
> > + #include <stdlib.h>
> > + #include <string.h>
> > +@@ -21,12 +22,23 @@ static vpx_image_t *img_alloc_helper(vpx_image_t *=
img, vpx_img_fmt_t fmt,
> > +                                      unsigned int buf_align,
> > +                                      unsigned int stride_align,
> > +                                      unsigned char *img_data) {
> > +-  unsigned int h, w, s, xcs, ycs, bps;
> > +-  unsigned int stride_in_bytes;
> > ++  unsigned int h, w, xcs, ycs, bps;
> > ++  uint64_t s;
> > ++  int stride_in_bytes;
> > +   unsigned int align;
> > +
> > +   if (img !=3D NULL) memset(img, 0, sizeof(vpx_image_t));
> > +
> > ++  if (fmt =3D=3D VPX_IMG_FMT_NONE) goto fail;
> > ++
> > ++  /* Impose maximum values on input parameters so that this function =
can
> > ++   * perform arithmetic operations without worrying about overflows.
> > ++   */
> > ++  if (d_w > 0x08000000 || d_h > 0x08000000 || buf_align > 65536 ||
> > ++      stride_align > 65536) {
> > ++    goto fail;
> > ++  }
> > ++
> > +   /* Treat align=3D=3D0 like align=3D=3D1 */
> > +   if (!buf_align) buf_align =3D 1;
> > +
> > +@@ -80,9 +92,12 @@ static vpx_image_t *img_alloc_helper(vpx_image_t *i=
mg, vpx_img_fmt_t fmt,
> > +    * and height shouldn't be adjusted. */
> > +   w =3D d_w;
> > +   h =3D d_h;
> > +-  s =3D (fmt & VPX_IMG_FMT_PLANAR) ? w : bps * w / 8;
> > +-  s =3D (s + stride_align - 1) & ~(stride_align - 1);
> > +-  stride_in_bytes =3D (fmt & VPX_IMG_FMT_HIGHBITDEPTH) ? s * 2 : s;
> > ++  s =3D (fmt & VPX_IMG_FMT_PLANAR) ? w : (uint64_t)bps * w / 8;
> > ++  s =3D (s + stride_align - 1) & ~((uint64_t)stride_align - 1);
> > ++  s =3D (fmt & VPX_IMG_FMT_HIGHBITDEPTH) ? s * 2 : s;
> > ++  if (s > INT_MAX) goto fail;
> > ++  stride_in_bytes =3D (int)s;
> > ++  s =3D (fmt & VPX_IMG_FMT_HIGHBITDEPTH) ? s / 2 : s;
> > +
> > +   /* Allocate the new image */
> > +   if (!img) {
> > +@@ -100,12 +115,16 @@ static vpx_image_t *img_alloc_helper(vpx_image_t=
 *img, vpx_img_fmt_t fmt,
> > +     /* Calculate storage sizes given the chroma subsampling */
> > +     align =3D (1 << xcs) - 1;
> > +     w =3D (d_w + align) & ~align;
> > ++    assert(d_w <=3D w);
> > +     align =3D (1 << ycs) - 1;
> > +     h =3D (d_h + align) & ~align;
> > ++    assert(d_h <=3D h);
> > +
> > +-    s =3D (fmt & VPX_IMG_FMT_PLANAR) ? w : bps * w / 8;
> > +-    s =3D (s + stride_align - 1) & ~(stride_align - 1);
> > +-    stride_in_bytes =3D (fmt & VPX_IMG_FMT_HIGHBITDEPTH) ? s * 2 : s;
> > ++    s =3D (fmt & VPX_IMG_FMT_PLANAR) ? w : (uint64_t)bps * w / 8;
> > ++    s =3D (s + stride_align - 1) & ~((uint64_t)stride_align - 1);
> > ++    s =3D (fmt & VPX_IMG_FMT_HIGHBITDEPTH) ? s * 2 : s;
> > ++    if (s > INT_MAX) goto fail;
> > ++    stride_in_bytes =3D (int)s;
> > +     alloc_size =3D (fmt & VPX_IMG_FMT_PLANAR) ? (uint64_t)h * s * bps=
 / 8
> > +                                             : (uint64_t)h * s;
> > +
> > +@@ -170,12 +189,12 @@ int vpx_img_set_rect(vpx_image_t *img, unsigned =
int x, unsigned int y,
> > +       if (img->fmt & VPX_IMG_FMT_HAS_ALPHA) {
> > +         img->planes[VPX_PLANE_ALPHA] =3D
> > +             data + x * bytes_per_sample + y * img->stride[VPX_PLANE_A=
LPHA];
> > +-        data +=3D img->h * img->stride[VPX_PLANE_ALPHA];
> > ++        data +=3D (size_t)img->h * img->stride[VPX_PLANE_ALPHA];
> > +       }
> > +
> > +       img->planes[VPX_PLANE_Y] =3D
> > +           data + x * bytes_per_sample + y * img->stride[VPX_PLANE_Y];
> > +-      data +=3D img->h * img->stride[VPX_PLANE_Y];
> > ++      data +=3D (size_t)img->h * img->stride[VPX_PLANE_Y];
> > +
> > +       if (img->fmt =3D=3D VPX_IMG_FMT_NV12) {
> > +         img->planes[VPX_PLANE_U] =3D
> > +@@ -186,7 +205,8 @@ int vpx_img_set_rect(vpx_image_t *img, unsigned in=
t x, unsigned int y,
> > +         img->planes[VPX_PLANE_U] =3D
> > +             data + (x >> img->x_chroma_shift) * bytes_per_sample +
> > +             (y >> img->y_chroma_shift) * img->stride[VPX_PLANE_U];
> > +-        data +=3D (img->h >> img->y_chroma_shift) * img->stride[VPX_P=
LANE_U];
> > ++        data +=3D
> > ++            (size_t)(img->h >> img->y_chroma_shift) * img->stride[VPX=
_PLANE_U];
> > +         img->planes[VPX_PLANE_V] =3D
> > +             data + (x >> img->x_chroma_shift) * bytes_per_sample +
> > +             (y >> img->y_chroma_shift) * img->stride[VPX_PLANE_V];
> > +@@ -194,7 +214,8 @@ int vpx_img_set_rect(vpx_image_t *img, unsigned in=
t x, unsigned int y,
> > +         img->planes[VPX_PLANE_V] =3D
> > +             data + (x >> img->x_chroma_shift) * bytes_per_sample +
> > +             (y >> img->y_chroma_shift) * img->stride[VPX_PLANE_V];
> > +-        data +=3D (img->h >> img->y_chroma_shift) * img->stride[VPX_P=
LANE_V];
> > ++        data +=3D
> > ++            (size_t)(img->h >> img->y_chroma_shift) * img->stride[VPX=
_PLANE_V];
> > +         img->planes[VPX_PLANE_U] =3D
> > +             data + (x >> img->x_chroma_shift) * bytes_per_sample +
> > +             (y >> img->y_chroma_shift) * img->stride[VPX_PLANE_U];
> > +diff --git a/vpx/vpx_image.h b/vpx/vpx_image.h
> > +index 1adc9b9d9..2c30a8993 100644
> > +--- a/vpx/vpx_image.h
> > ++++ b/vpx/vpx_image.h
> > +@@ -132,10 +132,13 @@ typedef struct vpx_image_rect {
> > +  *                         is NULL, the storage for the descriptor wi=
ll be
> > +  *                         allocated on the heap.
> > +  * \param[in]    fmt       Format for the image
> > +- * \param[in]    d_w       Width of the image
> > +- * \param[in]    d_h       Height of the image
> > ++ * \param[in]    d_w       Width of the image. Must not exceed 0x0800=
0000
> > ++ *                         (2^27).
> > ++ * \param[in]    d_h       Height of the image. Must not exceed 0x080=
00000
> > ++ *                         (2^27).
> > +  * \param[in]    align     Alignment, in bytes, of the image buffer a=
nd
> > +- *                         each row in the image(stride).
> > ++ *                         each row in the image (stride). Must not e=
xceed
> > ++ *                         65536.
> > +  *
> > +  * \return Returns a pointer to the initialized image descriptor. If =
the img
> > +  *         parameter is non-null, the value of the img parameter will=
 be
> > +@@ -155,9 +158,12 @@ vpx_image_t *vpx_img_alloc(vpx_image_t *img, vpx_=
img_fmt_t fmt,
> > +  *                             parameter is NULL, the storage for the=
 descriptor
> > +  *                             will be allocated on the heap.
> > +  * \param[in]    fmt           Format for the image
> > +- * \param[in]    d_w           Width of the image
> > +- * \param[in]    d_h           Height of the image
> > ++ * \param[in]    d_w           Width of the image. Must not exceed 0x=
08000000
> > ++ *                             (2^27).
> > ++ * \param[in]    d_h           Height of the image. Must not exceed 0=
x08000000
> > ++ *                             (2^27).
> > +  * \param[in]    stride_align  Alignment, in bytes, of each row in th=
e image.
> > ++ *                             Must not exceed 65536.
> > +  * \param[in]    img_data      Storage to use for the image
> > +  *
> > +  * \return Returns a pointer to the initialized image descriptor. If =
the img
> > diff --git a/meta-oe/recipes-multimedia/webm/libvpx_1.14.0.bb b/meta-oe=
/recipes-multimedia/webm/libvpx_1.14.0.bb
> > index b4d49842ea..13e342d420 100644
> > --- a/meta-oe/recipes-multimedia/webm/libvpx_1.14.0.bb
> > +++ b/meta-oe/recipes-multimedia/webm/libvpx_1.14.0.bb
> > @@ -10,6 +10,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd5b0475501=
5be901744a78cc30d390d4"
> >  SRCREV =3D "602e2e8979d111b02c959470da5322797dd96a19"
> >  SRC_URI +=3D "git://chromium.googlesource.com/webm/libvpx;protocol=3Dh=
ttps;branch=3Dmain \
> >             file://libvpx-configure-support-blank-prefix.patch \
> > +           file://CVE-2024-5197.patch \
> >             "
> >
> >  S =3D "${WORKDIR}/git"
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#120691): https://lists.openembedded.org/g/openembed=
ded-devel/message/120691
> > Mute This Topic: https://lists.openembedded.org/mt/115766812/6084445
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[skandigraun@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

