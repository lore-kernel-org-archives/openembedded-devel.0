Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FB79C2BD09
	for <webhook@archiver.kernel.org>; Fri, 12 Jul 2024 09:16:41 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.3805.1720775795665523534
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jul 2024 02:16:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A7g1YOcF;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52e9c6b5a62so1901635e87.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jul 2024 02:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720775793; x=1721380593; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mehJt6yNjX7wO5nZff7y9wtbkYj0KadyvSr7xgDEA4I=;
        b=A7g1YOcFUHGRn82J/FOWmm1UrjpqjEF4PHAzvn60MNN9GrjEBdup+6kUsPopxPgJsV
         JyMt+cuVNqum7ucsjp05EGcenREKturUEiOp72Qd3bUvDZumx9obW6SOJwXh5uW3/bYU
         7qXZT9+9xkh8d6K0+/8fywxZfv9UMEEJQiNh4V4vjzNAqtCiosucvTu8XzvJGndP6PJl
         H/1t59Xd0kjoAYnqhTgiPRwVPT0d4dBvN5VkC/pyont3k3+TNrhAKq+2hcQxXEwidQQj
         BzuIxBr0RCMaBCQWQWixRCwqmd+VHEfj17ODBxZsTRNibxD++NZqMCKa0ITBPAFpU5VH
         +Y1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720775793; x=1721380593;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mehJt6yNjX7wO5nZff7y9wtbkYj0KadyvSr7xgDEA4I=;
        b=aLxPbg0zw1+rHP8EnWx9ve6kB1Tz7deby3TUTMQhfNhCdZhrfQfIwmUgwv5lSUqcyA
         5TE3/8L8u4kc85ddsLacHkVbECRfgtSXiV6cnLtiCpzNJXcIxSGvff52oaW8kE7oPBbd
         ThFgx2mVIsR/skxevLlSuq9x3XEHnhUT6PwS1Fs7yPE73f2M0gs2KAXOTv8sP4iFW94C
         xJ+3X442/ZiXTEp8ZTo3r4FirThV0/ho+tMCLSzkDfQwGlc8UDrVmz46zb8R1A8vscFw
         wZpM2lj+v5fslLM0wFlWtk2zpl27N50wYn32LOa7GrzSZjzxuGoKUrVV39f7V80gGslX
         FTqw==
X-Forwarded-Encrypted: i=1; AJvYcCU7HBsHP7VC8+INb0kiowRfrwMWMYxwaNQCOwqiXBpNikcr/gG2Zm73/TUMtf2EYtVH+wm+hTwFyCFbnNZWeFpqtnN1DvdXUUrplI9xipVupPEMJQNnzqpVSA==
X-Gm-Message-State: AOJu0YwXKhhVmqD+BYNDL4KdHQeGgwVnLnqt4mfREFzKjEiX7Hrsiszx
	C6BzoIDSBXjIXR0LR50TWiicSCqbt112fKOftib+VUxatr/0KPWzrIgvwuXfrfB3nXaO43LE+hJ
	M24TLtuqQJ6qoEzouul9YxP/6Hkg=
X-Google-Smtp-Source: AGHT+IG29YcOutXzTliilCqpbzEKQ20/gfK0CFqZfISjRqitP1Qp3sQohjJB98u4TMxctASIyCOIadjgP8BLxW9SYfQ=
X-Received: by 2002:a05:6512:3ae:b0:516:d219:3779 with SMTP id
 2adb3069b0e04-52eb99d6c96mr5579089e87.58.1720775793204; Fri, 12 Jul 2024
 02:16:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240705094344.1595555-1-niko.mauno@vaisala.com> <17E089FC16D3C66B.26166@lists.openembedded.org>
In-Reply-To: <17E089FC16D3C66B.26166@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 12 Jul 2024 11:16:18 +0200
Message-ID: <CA+chaQdafYg_QQhi12bJaJ5f7vskiqwPZGJKeZ4gq+UXg7SHiA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] pkcs11-provider: Upgrade 0.3 -> 0.5
To: martin.jansa@gmail.com
Cc: niko.mauno@vaisala.com, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Jul 2024 09:16:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111316

Looks like it's reproducible only with 32bit MACHINEs, e.g. full log
from qemux86:
http://errors.yoctoproject.org/Errors/Details/790494/

On Tue, Jul 9, 2024 at 2:06=E2=80=AFPM Martin Jansa via lists.openembedded.=
org
<martin.jansa=3Dgmail.com@lists.openembedded.org> wrote:
>
> Hi,
>
> this fails to build with gcc-14, can you please check and fix that?
>
> FAILED: src/pkcs11.so.p/asymmetric_cipher.c.o
> ccache arm-webosmllib32-linux-gnueabi-gcc -march=3Darmv7-a -mthumb
> -mfpu=3Dneon -mfloat-abi=3Dsoftfp -fstack-protector-strong -O2
> -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-securit=
y
> -Werror=3Dreturn-type -funwind-tables -D_TIME_BITS=3D64
> -D_FILE_OFFSET_BITS=3D64
> --sysroot=3DTOPDIR/BUILD/work/ah212-webosmllib32-linux-gnueabi/lib32-pkcs=
11-provider/0.5/lib32-recipe-sysroot
> -Isrc/pkcs11.so.p -Isrc -I../git/src -I. -I../git
> -fdiagnostics-color=3Dalways -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch
> -std=3Dc11 -Wwrite-strings -Wpointer-arith
> -Wno-missing-field-initializers -Wformat -Wshadow
> -Wno-unused-parameter -Werror=3Dimplicit-function-declaration
> -Werror=3Dmissing-prototypes -Werror=3Dformat-security -Werror=3Dparenthe=
ses
> -Werror=3Dimplicit -Werror=3Dstrict-prototypes -fno-strict-aliasing
> -fno-delete-null-pointer-checks -fdiagnostics-show-option -O2 -pipe -g
> -feliminate-unused-debug-types -fcanon-prefix-map
> -fmacro-prefix-map=3DTOPDIR/BUILD/work/ah212-webosmllib32-linux-gnueabi/l=
ib32-pkcs11-provider/0.5/git=3D/usr/src/debug/lib32-pkcs11-provider/0.5
> -fdebug-prefix-map=3DTOPDIR/BUILD/work/ah212-webosmllib32-linux-gnueabi/l=
ib32-pkcs11-provider/0.5/git=3D/usr/src/debug/lib32-pkcs11-provider/0.5
> -fmacro-prefix-map=3DTOPDIR/BUILD/work/ah212-webosmllib32-linux-gnueabi/l=
ib32-pkcs11-provider/0.5/build=3D/usr/src/debug/lib32-pkcs11-provider/0.5
> -fdebug-prefix-map=3DTOPDIR/BUILD/work/ah212-webosmllib32-linux-gnueabi/l=
ib32-pkcs11-provider/0.5/build=3D/usr/src/debug/lib32-pkcs11-provider/0.5
> -fdebug-prefix-map=3DTOPDIR/BUILD/work/ah212-webosmllib32-linux-gnueabi/l=
ib32-pkcs11-provider/0.5/lib32-recipe-sysroot=3D
> -fmacro-prefix-map=3DTOPDIR/BUILD/work/ah212-webosmllib32-linux-gnueabi/l=
ib32-pkcs11-provider/0.5/lib32-recipe-sysroot=3D
> -fdebug-prefix-map=3DTOPDIR/BUILD/work/ah212-webosmllib32-linux-gnueabi/l=
ib32-pkcs11-provider/0.5/recipe-sysroot-native=3D
> -fPIC -MD -MQ src/pkcs11.so.p/asymmetric_cipher.c.o -MF
> src/pkcs11.so.p/asymmetric_cipher.c.o.d -o
> src/pkcs11.so.p/asymmetric_cipher.c.o -c
> ../git/src/asymmetric_cipher.c
> ../git/src/asymmetric_cipher.c: In function 'p11prov_rsaenc_decrypt':
> ../git/src/asymmetric_cipher.c:422:58: error: passing argument 4 of
> 'p11prov_tls_constant_time_depadding' from incompatible pointer type
> [-Wincompatible-pointer-types]
>   422 |
> &out_size, &tls_cond);
>       |                                                          ^~~~~~~~=
~
>       |                                                          |
>       |
> CK_ULONG * {aka long unsigned int *}
> ../git/src/asymmetric_cipher.c:254:45: note: expected 'size_t *' {aka
> 'unsigned int *'} but argument is of type 'CK_ULONG *' {aka 'long
> unsigned int *'}
>   254 |                                     size_t *out_size, CK_ULONG
> *ret_cond)
>       |                                     ~~~~~~~~^~~~~~~~
>
> On Fri, Jul 5, 2024 at 11:44=E2=80=AFAM Niko Mauno via lists.openembedded=
.org
> <niko.mauno=3Dvaisala.com@lists.openembedded.org> wrote:
> >
> > From: Niko Mauno <niko.mauno@vaisala.com>
> >
> > Changelogs:
> >  - https://github.com/latchset/pkcs11-provider/releases/tag/v0.4
> >  - https://github.com/latchset/pkcs11-provider/releases/tag/v0.5
> >
> > Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
> > ---
> >  .../{pkcs11-provider_0.3.bb =3D> pkcs11-provider_0.5.bb} | 10 +++-----=
--
> >  1 file changed, 3 insertions(+), 7 deletions(-)
> >  rename meta-oe/recipes-support/pkcs11-provider/{pkcs11-provider_0.3.bb=
 =3D> pkcs11-provider_0.5.bb} (81%)
> >
> > diff --git a/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_0.=
3.bb b/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_0.5.bb
> > similarity index 81%
> > rename from meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_0.3=
.bb
> > rename to meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_0.5.b=
b
> > index 816ee967c..6c19b6616 100644
> > --- a/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_0.3.bb
> > +++ b/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_0.5.bb
> > @@ -10,18 +10,14 @@ HOMEPAGE =3D "https://github.com/latchset/pkcs11-pr=
ovider"
> >  SECTION =3D "libs"
> >  LICENSE =3D "Apache-2.0"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db53b787444a60266932bd270d1c=
f2d45"
> > -DEPENDS =3D "\
> > -    autoconf-archive \
> > -    openssl \
> > -    p11-kit \
> > -"
> > +DEPENDS =3D "openssl"
> >
> > -SRCREV =3D "58040b4e32975cc1d7f39e424ee7b0097cd11311"
> > +SRCREV =3D "3a4fdd2a2e5643af2a0f857b66a19b9fa109d40f"
> >
> >  SRC_URI =3D "git://github.com/latchset/${BPN}.git;branch=3Dmain;protoc=
ol=3Dhttps"
> >
> >  S =3D "${WORKDIR}/git"
> >
> > -inherit autotools pkgconfig
> > +inherit meson pkgconfig
> >
> >  FILES:${PN} +=3D "${libdir}/ossl-modules/pkcs11.so"
> > --
> > 2.39.2
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111283): https://lists.openembedded.org/g/openembedde=
d-devel/message/111283
> Mute This Topic: https://lists.openembedded.org/mt/107051199/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

