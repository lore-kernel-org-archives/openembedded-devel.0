Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1FADC3DA41
	for <webhook@archiver.kernel.org>; Tue,  9 Jul 2024 12:06:19 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.11308.1720526773053019407
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jul 2024 05:06:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FouPF9zc;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52e94eaf5efso6045202e87.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Jul 2024 05:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720526771; x=1721131571; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uhojmzeVdibn/H31GMjm0LTM3s43vn6lFvSQPyYhVk8=;
        b=FouPF9zcJdmNxwRWFD21af631m+FTt2nKcby0xOMX74NwS8uWczrErVIzgvDVf4hwL
         9J1XFilP2J72E4v02d4lQr8n1Jlzi39D/cIh3ky9pd+0xfeJlNkLNoLAr8zvHLRNiAyU
         9c3yNXHY9XoC8E02G/mb4oGIROCzUG9G01Z9fMUd/+kS2EbtMcJoZCnrYr9Okb9ZL1Jc
         FF8W72gMjqnxnDEaHfjLDKnaKSh1aeIU3yHvuH7+ojxLj4eq6tLAl6cEI6fRpi/+Lgod
         Vvs2eSb3ir0ZEMYK/gpWKBxWas7a9nEIPE3yVrW7ep+yceBKze9QYGzDsgpcqw1uk71E
         nRKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720526771; x=1721131571;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uhojmzeVdibn/H31GMjm0LTM3s43vn6lFvSQPyYhVk8=;
        b=Bu3+NPxktfhDwC4Juf2ixh3JaVgm09iHp3bMaCUcNNl7NF0ZKC9ov+Px/N9ezHe0BW
         GnI88WAFP/jMpCoqnlqqwjvN9uuk378FKPZra3j1Z5KrGbdOpXwLSUIP5N/beC4saPHE
         UWiBOv28ACbdFErtB/mP29MEs5248Zu++U1RgaWMBQRNGPWZBjeKaTY9KVyE71Qfh/3R
         7Oz9QCQrWU+gLG8Q5qljBSKYuUAJbgFNoaFHIJCbHbhKbO6yIaXXD+1re/bKh4M3oEO2
         qr05HVFzd9cUYzOnFC7nygBUCatzeoomvk8vgiG1tW9Toht7o3EKLY8uBWqjhGYQdair
         EpGA==
X-Gm-Message-State: AOJu0YzhgL7CfiC5AIB2SfslAmo8Kvle6NavJn9vE0BWr3oatUbmmQR8
	56ghSf1BCHcsXOINmf2GmMaSEifr12NmUEWgrC4kvgmHH0ijQv7nSZc6rgkEAuy9UvwjuHJa0ST
	zjusXVVGSWOI/DYmtmL5jte3rcvc=
X-Google-Smtp-Source: AGHT+IEL5hwIP7c9NhU/YAm0FwE2fZrHoVAuagUD7j3CZRVbCK5/xYLx5nYLHM+TmDYeemWOtX7dlCyySEtp3mZPk0Q=
X-Received: by 2002:a05:6512:1385:b0:52c:e050:452a with SMTP id
 2adb3069b0e04-52eb99a31fcmr1554396e87.37.1720526770870; Tue, 09 Jul 2024
 05:06:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240705094344.1595555-1-niko.mauno@vaisala.com>
In-Reply-To: <20240705094344.1595555-1-niko.mauno@vaisala.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 9 Jul 2024 14:06:01 +0200
Message-ID: <CA+chaQcNNQPLjg14o-5Nv8e3nmYDH+-7nAcdtUV7nxhVKti=pQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] pkcs11-provider: Upgrade 0.3 -> 0.5
To: niko.mauno@vaisala.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jul 2024 12:06:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111283

Hi,

this fails to build with gcc-14, can you please check and fix that?

FAILED: src/pkcs11.so.p/asymmetric_cipher.c.o
ccache arm-webosmllib32-linux-gnueabi-gcc -march=3Darmv7-a -mthumb
-mfpu=3Dneon -mfloat-abi=3Dsoftfp -fstack-protector-strong -O2
-D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-security
-Werror=3Dreturn-type -funwind-tables -D_TIME_BITS=3D64
-D_FILE_OFFSET_BITS=3D64
--sysroot=3DTOPDIR/BUILD/work/ah212-webosmllib32-linux-gnueabi/lib32-pkcs11=
-provider/0.5/lib32-recipe-sysroot
-Isrc/pkcs11.so.p -Isrc -I../git/src -I. -I../git
-fdiagnostics-color=3Dalways -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch
-std=3Dc11 -Wwrite-strings -Wpointer-arith
-Wno-missing-field-initializers -Wformat -Wshadow
-Wno-unused-parameter -Werror=3Dimplicit-function-declaration
-Werror=3Dmissing-prototypes -Werror=3Dformat-security -Werror=3Dparenthese=
s
-Werror=3Dimplicit -Werror=3Dstrict-prototypes -fno-strict-aliasing
-fno-delete-null-pointer-checks -fdiagnostics-show-option -O2 -pipe -g
-feliminate-unused-debug-types -fcanon-prefix-map
-fmacro-prefix-map=3DTOPDIR/BUILD/work/ah212-webosmllib32-linux-gnueabi/lib=
32-pkcs11-provider/0.5/git=3D/usr/src/debug/lib32-pkcs11-provider/0.5
-fdebug-prefix-map=3DTOPDIR/BUILD/work/ah212-webosmllib32-linux-gnueabi/lib=
32-pkcs11-provider/0.5/git=3D/usr/src/debug/lib32-pkcs11-provider/0.5
-fmacro-prefix-map=3DTOPDIR/BUILD/work/ah212-webosmllib32-linux-gnueabi/lib=
32-pkcs11-provider/0.5/build=3D/usr/src/debug/lib32-pkcs11-provider/0.5
-fdebug-prefix-map=3DTOPDIR/BUILD/work/ah212-webosmllib32-linux-gnueabi/lib=
32-pkcs11-provider/0.5/build=3D/usr/src/debug/lib32-pkcs11-provider/0.5
-fdebug-prefix-map=3DTOPDIR/BUILD/work/ah212-webosmllib32-linux-gnueabi/lib=
32-pkcs11-provider/0.5/lib32-recipe-sysroot=3D
-fmacro-prefix-map=3DTOPDIR/BUILD/work/ah212-webosmllib32-linux-gnueabi/lib=
32-pkcs11-provider/0.5/lib32-recipe-sysroot=3D
-fdebug-prefix-map=3DTOPDIR/BUILD/work/ah212-webosmllib32-linux-gnueabi/lib=
32-pkcs11-provider/0.5/recipe-sysroot-native=3D
-fPIC -MD -MQ src/pkcs11.so.p/asymmetric_cipher.c.o -MF
src/pkcs11.so.p/asymmetric_cipher.c.o.d -o
src/pkcs11.so.p/asymmetric_cipher.c.o -c
../git/src/asymmetric_cipher.c
../git/src/asymmetric_cipher.c: In function 'p11prov_rsaenc_decrypt':
../git/src/asymmetric_cipher.c:422:58: error: passing argument 4 of
'p11prov_tls_constant_time_depadding' from incompatible pointer type
[-Wincompatible-pointer-types]
  422 |
&out_size, &tls_cond);
      |                                                          ^~~~~~~~~
      |                                                          |
      |
CK_ULONG * {aka long unsigned int *}
../git/src/asymmetric_cipher.c:254:45: note: expected 'size_t *' {aka
'unsigned int *'} but argument is of type 'CK_ULONG *' {aka 'long
unsigned int *'}
  254 |                                     size_t *out_size, CK_ULONG
*ret_cond)
      |                                     ~~~~~~~~^~~~~~~~

On Fri, Jul 5, 2024 at 11:44=E2=80=AFAM Niko Mauno via lists.openembedded.o=
rg
<niko.mauno=3Dvaisala.com@lists.openembedded.org> wrote:
>
> From: Niko Mauno <niko.mauno@vaisala.com>
>
> Changelogs:
>  - https://github.com/latchset/pkcs11-provider/releases/tag/v0.4
>  - https://github.com/latchset/pkcs11-provider/releases/tag/v0.5
>
> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
> ---
>  .../{pkcs11-provider_0.3.bb =3D> pkcs11-provider_0.5.bb} | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
>  rename meta-oe/recipes-support/pkcs11-provider/{pkcs11-provider_0.3.bb =
=3D> pkcs11-provider_0.5.bb} (81%)
>
> diff --git a/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_0.3.=
bb b/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_0.5.bb
> similarity index 81%
> rename from meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_0.3.b=
b
> rename to meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_0.5.bb
> index 816ee967c..6c19b6616 100644
> --- a/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_0.3.bb
> +++ b/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_0.5.bb
> @@ -10,18 +10,14 @@ HOMEPAGE =3D "https://github.com/latchset/pkcs11-prov=
ider"
>  SECTION =3D "libs"
>  LICENSE =3D "Apache-2.0"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db53b787444a60266932bd270d1cf2=
d45"
> -DEPENDS =3D "\
> -    autoconf-archive \
> -    openssl \
> -    p11-kit \
> -"
> +DEPENDS =3D "openssl"
>
> -SRCREV =3D "58040b4e32975cc1d7f39e424ee7b0097cd11311"
> +SRCREV =3D "3a4fdd2a2e5643af2a0f857b66a19b9fa109d40f"
>
>  SRC_URI =3D "git://github.com/latchset/${BPN}.git;branch=3Dmain;protocol=
=3Dhttps"
>
>  S =3D "${WORKDIR}/git"
>
> -inherit autotools pkgconfig
> +inherit meson pkgconfig
>
>  FILES:${PN} +=3D "${libdir}/ossl-modules/pkcs11.so"
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111257): https://lists.openembedded.org/g/openembedde=
d-devel/message/111257
> Mute This Topic: https://lists.openembedded.org/mt/107051199/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

