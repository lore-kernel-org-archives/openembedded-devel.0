Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA117C4167B
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 19:10:01 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.2384.1701803392514890195
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Dec 2023 11:09:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BB3yTIcZ;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: alperyasinak1@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-28862fdfb44so49647a91.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Dec 2023 11:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701803392; x=1702408192; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gWuNxxSrIw1Kkvjv6V5Y4Lbd/scErdmsEc8JP5klNZs=;
        b=BB3yTIcZPt7vTLMaYm5TzitIt2k4uz8gqhhDOH7h0Ob2VSJIElzC62q+wi1VHGtLGM
         MKsc0RLoxJ19uR4KIrkb0z296PN5Cv4KLs7JaXuUMyN16vvyefqsIiOez3wFbSkkQtf8
         09UPtID4RWUaENCbA0GklqzdoPlniV2c8jJ2BToMG0n1Hygw2Ll5wxWSvsOnt0Vz7EES
         GL5ElscWi/afZfD7RR7TPXc3uDMv8EJBX4PLDGhrLFW3Zerm6tWLS+yFZFxePd4a5tHL
         Uq2TjQZtEhgWFom4WfDFs08pnP9ZjMmdnPgfy7Z6jb5ruazKF/cHbFaf914Id+xJg6j4
         kBgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701803392; x=1702408192;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gWuNxxSrIw1Kkvjv6V5Y4Lbd/scErdmsEc8JP5klNZs=;
        b=JXbq46GJ1SMk4cMynxxeedEb/RLVRor8fUS2UMIRDTTn91h/rZ7+4pYcj/+7t42hik
         XRl60Ki42Lf8sIveXdFQuu/y2PHyweSEEJGqH9Hkmp96yrnJWeGmBeJpaoDFw36jBak7
         dKQtO/6yH5rJloNffNr3e7x9SqQLua64bKbqu457308T8rXhIeQEjvIUt/4Y1ez0fQg/
         FLlARcCI9WUuqtmtDBj8+x24im/Rsjy1XtPENp2B7tB4RgY5qrgzwQnqy4hBjisl8UhI
         ReNW/dpca+zVc7tYk4sPDOXKEL+Wjp+L4vq7TCTTiydSr0JLB77HF04ZLUAdXX17kYd/
         bGTA==
X-Gm-Message-State: AOJu0YynGN1om7YDmoZ+5APoayn716pgZwVudyuJ5qW7zXkqrc92C1bL
	qvkunnQtOCIxqiVAcm1pF880xuCPzlwDybcUALE=
X-Google-Smtp-Source: AGHT+IEEBKKm4VU+/H4ilYJ7jZfvfDvg5Rz1T4cnScGEC3LubU+e8LFCRBJHU6zNrYZCqosk61M9jau/IChD2azsoRU=
X-Received: by 2002:a17:90b:4b8e:b0:286:8672:5199 with SMTP id
 lr14-20020a17090b4b8e00b0028686725199mr1308463pjb.35.1701803391768; Tue, 05
 Dec 2023 11:09:51 -0800 (PST)
MIME-Version: 1.0
References: <20231204075356.26863-1-alperyasinak1@gmail.com> <CAMKF1spxo2r=UkzddHjOvNC2Y1n9JY8MRMteAHSqLOoZ9RKG=Q@mail.gmail.com>
In-Reply-To: <CAMKF1spxo2r=UkzddHjOvNC2Y1n9JY8MRMteAHSqLOoZ9RKG=Q@mail.gmail.com>
From: alper ak <alperyasinak1@gmail.com>
Date: Tue, 5 Dec 2023 22:09:40 +0300
Message-ID: <CAGpma=7jgcvruz31dJF8KPY1VC-u=v6HRTYo215mKgYXGt-kxg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] snappy: upgrade 1.1.9 -> 1.1.10
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Dec 2023 19:10:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107230

I think, I found the issue but I don't know how to solve it. Btw,
works on arm64.

When I looked at the errors, I saw lines like:

error: use of undeclared identifier 'vminvq_u8'; did you mean 'vmvnq_u8'?
error: use of undeclared identifier 'vmaxvq_u8'
error: use of undeclared identifier 'vqtbl1q_u8'; did you mean 'vtbl1_u8'?
error: cannot initialize a parameter of type 'uint8x8_t' (vector of 8
'uint8_t' values) with an lvalue of type 'V128' (aka 'uint8x16_t')

When I checked the intrinsics from ARM, I saw that the supported
architecture is A64.

https://arm-software.github.io/acle/neon_intrinsics/advsimd.html

Khem Raj <raj.khem@gmail.com>, 5 Ara 2023 Sal, 21:06 tarihinde =C5=9Funu ya=
zd=C4=B1:
>
> this fails on arm
> https://errors.yoctoproject.org/Errors/Details/745647/
>
> On Sun, Dec 3, 2023 at 11:54=E2=80=AFPM Alper Ak <alperyasinak1@gmail.com=
> wrote:
> >
> > * 0001-Add-inline-with-SNAPPY_ATTRIBUTE_ALWAYS_INLINE.patch removed bec=
ause fixed in the new version
> >
> > Changelog:
> >
> > * Performance improvements
> > * Compilation fixes for various environments
> >
> > Signed-off-by: alperak <alperyasinak1@gmail.com>
> > ---
> >  ...-with-SNAPPY_ATTRIBUTE_ALWAYS_INLINE.patch | 71 -------------------
> >  .../{snappy_1.1.9.bb =3D> snappy_1.1.10.bb}     |  8 +--
> >  2 files changed, 3 insertions(+), 76 deletions(-)
> >  delete mode 100644 meta-oe/recipes-extended/snappy/snappy/0001-Add-inl=
ine-with-SNAPPY_ATTRIBUTE_ALWAYS_INLINE.patch
> >  rename meta-oe/recipes-extended/snappy/{snappy_1.1.9.bb =3D> snappy_1.=
1.10.bb} (85%)
> >
> > diff --git a/meta-oe/recipes-extended/snappy/snappy/0001-Add-inline-wit=
h-SNAPPY_ATTRIBUTE_ALWAYS_INLINE.patch b/meta-oe/recipes-extended/snappy/sn=
appy/0001-Add-inline-with-SNAPPY_ATTRIBUTE_ALWAYS_INLINE.patch
> > deleted file mode 100644
> > index 27357d88a..000000000
> > --- a/meta-oe/recipes-extended/snappy/snappy/0001-Add-inline-with-SNAPP=
Y_ATTRIBUTE_ALWAYS_INLINE.patch
> > +++ /dev/null
> > @@ -1,71 +0,0 @@
> > -From 4728803cc8687431449c8c9fbfabb1da04943400 Mon Sep 17 00:00:00 2001
> > -From: "Georgi D. Sotirov" <gdsotirov@gmail.com>
> > -Date: Wed, 5 May 2021 14:16:46 +0300
> > -Subject: [PATCH] Add inline with SNAPPY_ATTRIBUTE_ALWAYS_INLINE
> > -
> > -Add inline with SNAPPY_ATTRIBUTE_ALWAYS_INLINE on AdvanceToNextTag to
> > -fix the following compilation errors and a warning with GCC:
> > -
> > -[  2%] Building CXX object CMakeFiles/snappy.dir/snappy.cc.o
> > -/usr/bin/c++   -DHAVE_CONFIG_H -Dsnappy_EXPORTS
> > --I/tmp/snappy-1.1.9/build -I/tmp/snappy-1.1.9  -O3
> > --march=3Di586 -mtune=3Di686 -Wall -Wextra -fno-exceptions -fno-rtti -O=
3
> > --DNDEBUG -fPIC   -std=3Dc++11 -o CMakeFiles/snappy.dir/snappy.cc.o -c
> > -/tmp/snappy-1.1.9/snappy.cc
> > -/tmp/snappy-1.1.9/snappy.cc:1017:8: warning: always_inline
> > -function might not be inlinable [-Wattributes]
> > - size_t AdvanceToNextTag(const uint8_t** ip_p, size_t* tag) {
> > -        ^
> > -/tmp/snappy-1.1.9/snappy.cc: In function 'std::pair<const
> > -unsigned char*, int> snappy::DecompressBranchless(const uint8_t*, cons=
t
> > -uint8_t*, ptrdiff_t, T, ptrdiff_t) [with T =3D char*; uint8_t =3D unsi=
gned
> > -char; ptrdiff_t =3D int]':
> > -/tmp/snappy-1.1.9/snappy.cc:1017:8: error: inlining failed in
> > -call to always_inline 'size_t snappy::AdvanceToNextTag(const uint8_t**=
,
> > -size_t*)': function body can be overwritten at link time
> > -/tmp/snappy-1.1.9/snappy.cc:1097:53: error: called from here
> > -         size_t tag_type =3D AdvanceToNextTag(&ip, &tag);
> > -                                                     ^
> > -/tmp/snappy-1.1.9/snappy.cc:1017:8: error: inlining failed in
> > -call to always_inline 'size_t snappy::AdvanceToNextTag(const uint8_t**=
,
> > -size_t*)': function body can be overwritten at link time
> > - size_t AdvanceToNextTag(const uint8_t** ip_p, size_t* tag) {
> > -        ^
> > -/tmp/snappy-1.1.9/snappy.cc:1097:53: error: called from here
> > -         size_t tag_type =3D AdvanceToNextTag(&ip, &tag);
> > -                                                     ^
> > -/tmp/snappy-1.1.9/snappy.cc:1017:8: error: inlining failed in
> > -call to always_inline 'size_t snappy::AdvanceToNextTag(const uint8_t**=
,
> > -size_t*)': function body can be overwritten at link time
> > - size_t AdvanceToNextTag(const uint8_t** ip_p, size_t* tag) {
> > -        ^
> > -/tmp/snappy-1.1.9/snappy.cc:1097:53: error: called from here
> > -         size_t tag_type =3D AdvanceToNextTag(&ip, &tag);
> > -                                                     ^
> > -CMakeFiles/snappy.dir/build.make:137: recipe for target
> > -'CMakeFiles/snappy.dir/snappy.cc.o' failed
> > -
> > -Just like with other functions using SNAPPY_ATTRIBUTE_ALWAYS_INLINE
> > -macro (i.e. __attribute__((always_inline)) ) it is necessary to use C+=
+
> > -inline specifier.
> > -
> > -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > -
> > -Upstream-Status: Submitted [https://github.com/google/snappy/pull/128]
> > ----
> > - snappy.cc | 2 +-
> > - 1 file changed, 1 insertion(+), 1 deletion(-)
> > -
> > -diff --git a/snappy.cc b/snappy.cc
> > -index 79dc0e8..51157be 100644
> > ---- a/snappy.cc
> > -+++ b/snappy.cc
> > -@@ -1014,7 +1014,7 @@ void MemMove(ptrdiff_t dst, const void* src, siz=
e_t size) {
> > - }
> > -
> > - SNAPPY_ATTRIBUTE_ALWAYS_INLINE
> > --size_t AdvanceToNextTag(const uint8_t** ip_p, size_t* tag) {
> > -+inline size_t AdvanceToNextTag(const uint8_t** ip_p, size_t* tag) {
> > -   const uint8_t*& ip =3D *ip_p;
> > -   // This section is crucial for the throughput of the decompression =
loop.
> > -   // The latency of an iteration is fundamentally constrained by the
> > diff --git a/meta-oe/recipes-extended/snappy/snappy_1.1.9.bb b/meta-oe/=
recipes-extended/snappy/snappy_1.1.10.bb
> > similarity index 85%
> > rename from meta-oe/recipes-extended/snappy/snappy_1.1.9.bb
> > rename to meta-oe/recipes-extended/snappy/snappy_1.1.10.bb
> > index 9e0e43ce8..7baf9c647 100644
> > --- a/meta-oe/recipes-extended/snappy/snappy_1.1.9.bb
> > +++ b/meta-oe/recipes-extended/snappy/snappy_1.1.10.bb
> > @@ -10,12 +10,10 @@ compression ratio."
> >  LICENSE =3D "BSD-3-Clause"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df62f3080324a97b3159a7a7e618=
12d0c"
> >
> > -SRC_URI =3D "gitsm://github.com/google/snappy.git;protocol=3Dhttps;bra=
nch=3Dmain \
> > -    file://0001-Add-inline-with-SNAPPY_ATTRIBUTE_ALWAYS_INLINE.patch \
> > -"
> > -SRCREV =3D "2b63814b15a2aaae54b7943f0cd935892fae628f"
> > -S =3D "${WORKDIR}/git"
> > +SRC_URI =3D "gitsm://github.com/google/snappy.git;protocol=3Dhttps;bra=
nch=3Dmain"
> > +SRCREV =3D "dc05e026488865bc69313a68bcc03ef2e4ea8e83"
> >
> > +S =3D "${WORKDIR}/git"
> >
> >  inherit cmake pkgconfig
> >
> > --
> > 2.25.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#107200): https://lists.openembedded.org/g/openembed=
ded-devel/message/107200
> > Mute This Topic: https://lists.openembedded.org/mt/102966758/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

