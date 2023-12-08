Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF9B4C10F04
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 02:42:09 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web10.11430.1702003322314968204
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Dec 2023 18:42:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=krMI2oaS;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-1fa37df6da8so1003016fac.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 07 Dec 2023 18:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702003321; x=1702608121; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fSqMSLkdxyW+RRM1FqLqMs0td1P6E0fvIU3IT+/yUps=;
        b=krMI2oaSP2Stjn7T+QgGznUHzSGQqmBYNgJ5m7Qe/T8e5e/orl9G4RZHsIc/9pmKBi
         iiaIB7nbIzKwas6Hsn6KB9sm7OkIAc18p+ZbW7/Hr7+Y2seaBLeb4aoKJEz8OOXNcG5o
         UplLYWizH7FyhT25KgHd4lyClVIpCcVDSXt5MPyXMLTpTOmVqdkIpWNWDwvpawS3Xrex
         nfo1Ytnz7Tn7hVlhLWHwWsoluvWP1V1MfM3PzVYHV7q6wYdUEzL7ZQ+/psdZAUcE4y4p
         DxU5iSQLuubM1r1uQAEZ6MrBDhXLP9Ilb2orkOGMCyJhYRF0BSlIvdrOmHGlsn+PROdt
         CvTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702003321; x=1702608121;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fSqMSLkdxyW+RRM1FqLqMs0td1P6E0fvIU3IT+/yUps=;
        b=ONgD2xZKqIfCCGHao11/PJ4PIvtR5IuT8LIrriBsCQHn8wheYNDukntYUhds5rWagU
         XTACbhZgrehC1foGCLgixVl7mym4EuokCh4GWVu0H9vra8uktLvA+weHDIY/DZMtKFi8
         2zAQIydV4GyeuPRlIDQhl2Z9+8zkPvS4vuKXe9VNefPk+c33ll8H1SPpy8BG/YJrs1Ym
         p54KhKs7wj4E1V/ufVCzPdxyZIZtRIkAtH+ytYZnHyQNub989cVrwTRZMTEfmZI+Hz4G
         xyUwEUXAEGiWmlg94usVEcfc8CRDCNi/7rCIgsVIKbMjcEVdvhoAoD/JkhtRwu54QehZ
         ipgw==
X-Gm-Message-State: AOJu0Yws9w/P8nE6TDvajoNyQPwPFGr14EUdR0misFdiDAA7fHx4Kg/D
	musQndl/IVJirhqhFLsnvYctAZXFveWbbEfyjY3mZ3JehnU=
X-Google-Smtp-Source: AGHT+IGvVsLJkYJ1ehFiZViLc5r0lPOydDRfUmOC5efNnDEi1PRdLjtz1w3MkVuPwL9rS2udG56No5aNDksaG805L6o=
X-Received: by 2002:a05:6870:724e:b0:1fb:220f:4ec5 with SMTP id
 y14-20020a056870724e00b001fb220f4ec5mr4421100oaf.31.1702003321387; Thu, 07
 Dec 2023 18:42:01 -0800 (PST)
MIME-Version: 1.0
References: <20231204075356.26863-1-alperyasinak1@gmail.com>
 <CAMKF1spxo2r=UkzddHjOvNC2Y1n9JY8MRMteAHSqLOoZ9RKG=Q@mail.gmail.com> <CAGpma=7jgcvruz31dJF8KPY1VC-u=v6HRTYo215mKgYXGt-kxg@mail.gmail.com>
In-Reply-To: <CAGpma=7jgcvruz31dJF8KPY1VC-u=v6HRTYo215mKgYXGt-kxg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 7 Dec 2023 18:41:35 -0800
Message-ID: <CAMKF1spgsHHDo7uQLKs6EWOSmoHtWvoqf7VYSUo9JNk9kgXN=A@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] snappy: upgrade 1.1.9 -> 1.1.10
To: alper ak <alperyasinak1@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Dec 2023 02:42:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107300

On Tue, Dec 5, 2023 at 11:09=E2=80=AFAM alper ak <alperyasinak1@gmail.com> =
wrote:
>
> I think, I found the issue but I don't know how to solve it. Btw,
> works on arm64.
>
> When I looked at the errors, I saw lines like:
>
> error: use of undeclared identifier 'vminvq_u8'; did you mean 'vmvnq_u8'?
> error: use of undeclared identifier 'vmaxvq_u8'
> error: use of undeclared identifier 'vqtbl1q_u8'; did you mean 'vtbl1_u8'=
?
> error: cannot initialize a parameter of type 'uint8x8_t' (vector of 8
> 'uint8_t' values) with an lvalue of type 'V128' (aka 'uint8x16_t')
>
> When I checked the intrinsics from ARM, I saw that the supported
> architecture is A64.

Please bring this patch along
https://github.com/google/snappy/pull/169

Which should help fix the 32 bit arm build failure.

>
> https://arm-software.github.io/acle/neon_intrinsics/advsimd.html
>
> Khem Raj <raj.khem@gmail.com>, 5 Ara 2023 Sal, 21:06 tarihinde =C5=9Funu =
yazd=C4=B1:
> >
> > this fails on arm
> > https://errors.yoctoproject.org/Errors/Details/745647/
> >
> > On Sun, Dec 3, 2023 at 11:54=E2=80=AFPM Alper Ak <alperyasinak1@gmail.c=
om> wrote:
> > >
> > > * 0001-Add-inline-with-SNAPPY_ATTRIBUTE_ALWAYS_INLINE.patch removed b=
ecause fixed in the new version
> > >
> > > Changelog:
> > >
> > > * Performance improvements
> > > * Compilation fixes for various environments
> > >
> > > Signed-off-by: alperak <alperyasinak1@gmail.com>
> > > ---
> > >  ...-with-SNAPPY_ATTRIBUTE_ALWAYS_INLINE.patch | 71 -----------------=
--
> > >  .../{snappy_1.1.9.bb =3D> snappy_1.1.10.bb}     |  8 +--
> > >  2 files changed, 3 insertions(+), 76 deletions(-)
> > >  delete mode 100644 meta-oe/recipes-extended/snappy/snappy/0001-Add-i=
nline-with-SNAPPY_ATTRIBUTE_ALWAYS_INLINE.patch
> > >  rename meta-oe/recipes-extended/snappy/{snappy_1.1.9.bb =3D> snappy_=
1.1.10.bb} (85%)
> > >
> > > diff --git a/meta-oe/recipes-extended/snappy/snappy/0001-Add-inline-w=
ith-SNAPPY_ATTRIBUTE_ALWAYS_INLINE.patch b/meta-oe/recipes-extended/snappy/=
snappy/0001-Add-inline-with-SNAPPY_ATTRIBUTE_ALWAYS_INLINE.patch
> > > deleted file mode 100644
> > > index 27357d88a..000000000
> > > --- a/meta-oe/recipes-extended/snappy/snappy/0001-Add-inline-with-SNA=
PPY_ATTRIBUTE_ALWAYS_INLINE.patch
> > > +++ /dev/null
> > > @@ -1,71 +0,0 @@
> > > -From 4728803cc8687431449c8c9fbfabb1da04943400 Mon Sep 17 00:00:00 20=
01
> > > -From: "Georgi D. Sotirov" <gdsotirov@gmail.com>
> > > -Date: Wed, 5 May 2021 14:16:46 +0300
> > > -Subject: [PATCH] Add inline with SNAPPY_ATTRIBUTE_ALWAYS_INLINE
> > > -
> > > -Add inline with SNAPPY_ATTRIBUTE_ALWAYS_INLINE on AdvanceToNextTag t=
o
> > > -fix the following compilation errors and a warning with GCC:
> > > -
> > > -[  2%] Building CXX object CMakeFiles/snappy.dir/snappy.cc.o
> > > -/usr/bin/c++   -DHAVE_CONFIG_H -Dsnappy_EXPORTS
> > > --I/tmp/snappy-1.1.9/build -I/tmp/snappy-1.1.9  -O3
> > > --march=3Di586 -mtune=3Di686 -Wall -Wextra -fno-exceptions -fno-rtti =
-O3
> > > --DNDEBUG -fPIC   -std=3Dc++11 -o CMakeFiles/snappy.dir/snappy.cc.o -=
c
> > > -/tmp/snappy-1.1.9/snappy.cc
> > > -/tmp/snappy-1.1.9/snappy.cc:1017:8: warning: always_inline
> > > -function might not be inlinable [-Wattributes]
> > > - size_t AdvanceToNextTag(const uint8_t** ip_p, size_t* tag) {
> > > -        ^
> > > -/tmp/snappy-1.1.9/snappy.cc: In function 'std::pair<const
> > > -unsigned char*, int> snappy::DecompressBranchless(const uint8_t*, co=
nst
> > > -uint8_t*, ptrdiff_t, T, ptrdiff_t) [with T =3D char*; uint8_t =3D un=
signed
> > > -char; ptrdiff_t =3D int]':
> > > -/tmp/snappy-1.1.9/snappy.cc:1017:8: error: inlining failed in
> > > -call to always_inline 'size_t snappy::AdvanceToNextTag(const uint8_t=
**,
> > > -size_t*)': function body can be overwritten at link time
> > > -/tmp/snappy-1.1.9/snappy.cc:1097:53: error: called from here
> > > -         size_t tag_type =3D AdvanceToNextTag(&ip, &tag);
> > > -                                                     ^
> > > -/tmp/snappy-1.1.9/snappy.cc:1017:8: error: inlining failed in
> > > -call to always_inline 'size_t snappy::AdvanceToNextTag(const uint8_t=
**,
> > > -size_t*)': function body can be overwritten at link time
> > > - size_t AdvanceToNextTag(const uint8_t** ip_p, size_t* tag) {
> > > -        ^
> > > -/tmp/snappy-1.1.9/snappy.cc:1097:53: error: called from here
> > > -         size_t tag_type =3D AdvanceToNextTag(&ip, &tag);
> > > -                                                     ^
> > > -/tmp/snappy-1.1.9/snappy.cc:1017:8: error: inlining failed in
> > > -call to always_inline 'size_t snappy::AdvanceToNextTag(const uint8_t=
**,
> > > -size_t*)': function body can be overwritten at link time
> > > - size_t AdvanceToNextTag(const uint8_t** ip_p, size_t* tag) {
> > > -        ^
> > > -/tmp/snappy-1.1.9/snappy.cc:1097:53: error: called from here
> > > -         size_t tag_type =3D AdvanceToNextTag(&ip, &tag);
> > > -                                                     ^
> > > -CMakeFiles/snappy.dir/build.make:137: recipe for target
> > > -'CMakeFiles/snappy.dir/snappy.cc.o' failed
> > > -
> > > -Just like with other functions using SNAPPY_ATTRIBUTE_ALWAYS_INLINE
> > > -macro (i.e. __attribute__((always_inline)) ) it is necessary to use =
C++
> > > -inline specifier.
> > > -
> > > -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > -
> > > -Upstream-Status: Submitted [https://github.com/google/snappy/pull/12=
8]
> > > ----
> > > - snappy.cc | 2 +-
> > > - 1 file changed, 1 insertion(+), 1 deletion(-)
> > > -
> > > -diff --git a/snappy.cc b/snappy.cc
> > > -index 79dc0e8..51157be 100644
> > > ---- a/snappy.cc
> > > -+++ b/snappy.cc
> > > -@@ -1014,7 +1014,7 @@ void MemMove(ptrdiff_t dst, const void* src, s=
ize_t size) {
> > > - }
> > > -
> > > - SNAPPY_ATTRIBUTE_ALWAYS_INLINE
> > > --size_t AdvanceToNextTag(const uint8_t** ip_p, size_t* tag) {
> > > -+inline size_t AdvanceToNextTag(const uint8_t** ip_p, size_t* tag) {
> > > -   const uint8_t*& ip =3D *ip_p;
> > > -   // This section is crucial for the throughput of the decompressio=
n loop.
> > > -   // The latency of an iteration is fundamentally constrained by th=
e
> > > diff --git a/meta-oe/recipes-extended/snappy/snappy_1.1.9.bb b/meta-o=
e/recipes-extended/snappy/snappy_1.1.10.bb
> > > similarity index 85%
> > > rename from meta-oe/recipes-extended/snappy/snappy_1.1.9.bb
> > > rename to meta-oe/recipes-extended/snappy/snappy_1.1.10.bb
> > > index 9e0e43ce8..7baf9c647 100644
> > > --- a/meta-oe/recipes-extended/snappy/snappy_1.1.9.bb
> > > +++ b/meta-oe/recipes-extended/snappy/snappy_1.1.10.bb
> > > @@ -10,12 +10,10 @@ compression ratio."
> > >  LICENSE =3D "BSD-3-Clause"
> > >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df62f3080324a97b3159a7a7e6=
1812d0c"
> > >
> > > -SRC_URI =3D "gitsm://github.com/google/snappy.git;protocol=3Dhttps;b=
ranch=3Dmain \
> > > -    file://0001-Add-inline-with-SNAPPY_ATTRIBUTE_ALWAYS_INLINE.patch=
 \
> > > -"
> > > -SRCREV =3D "2b63814b15a2aaae54b7943f0cd935892fae628f"
> > > -S =3D "${WORKDIR}/git"
> > > +SRC_URI =3D "gitsm://github.com/google/snappy.git;protocol=3Dhttps;b=
ranch=3Dmain"
> > > +SRCREV =3D "dc05e026488865bc69313a68bcc03ef2e4ea8e83"
> > >
> > > +S =3D "${WORKDIR}/git"
> > >
> > >  inherit cmake pkgconfig
> > >
> > > --
> > > 2.25.1
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#107200): https://lists.openembedded.org/g/openemb=
edded-devel/message/107200
> > > Mute This Topic: https://lists.openembedded.org/mt/102966758/1997914
> > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsu=
b [raj.khem@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >

