Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97360C3601E
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 01:57:07 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web11.15557.1744336622520335920
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Apr 2025 18:57:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WrutOxq0;
 spf=pass (domain: gmail.com, ip: 209.85.210.43, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-72b82c8230aso444803a34.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Apr 2025 18:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744336622; x=1744941422; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xm9p/8M0CH2ZaE/7X+WTWX3/H9hiGhZAsgpmhwKV9CY=;
        b=WrutOxq0oH73Ac+S/xNOOikhiA38cwoYCmH5lXoErktme/4zEIX1wforT1dsg2o9U+
         yH4i3jBg/9Di3PX2TTjo/nUjh3Ehom2PPXvSH5o4Y94zaZoaTBigPKGXR5Lx7V4NekiW
         Y6NGpUawky2wL9aaL2/wACyrnmajBPMi+rXHiaWPkXMz3cwWGin4M6C8gFjzr9YWdxyO
         WRxq6JQlEO7cmi6197SpKxPkoewj0xCGcuFiYMY4fIIKdiv8I4S+ORqU9OIq0nfy4FSD
         Vvt36ClfuLqaPjknM7TuJ8qZLzNlMYrNfYtckOrfu7CBIXnS3H1AXss0EFRXVK3lx3ND
         NJJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744336622; x=1744941422;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xm9p/8M0CH2ZaE/7X+WTWX3/H9hiGhZAsgpmhwKV9CY=;
        b=d732fg7MUVLEUujBIu/bWLPSA0Ykip9TJyn9yIP2motH9gbCrWoUfX9CQbcEMJemfh
         6/FdFuABQrp3BaALeZJv/GjluOVzHyBxjpKRBLEsfHgLyoOQB7yh982KPSJRLIgca6+V
         TyTeFHhcWEY0BgGsf+DYXuyRfzaRgTCo9O1fjdqxH2839N+k9pXnjPL6ZaXU9gPSsMhh
         TTrUBRFNRtWeh+y/y4nQUCYZC0hUyfWSF+Ksc47f+OVtLI7WVznPARiWZv6WzXbGi2p5
         bpqyRPr70Ep0UAh5FEqZcF1089Pi09reCvmo7uYR7O7ezkFBMZj/1RuQzOCYfkOB4Yeu
         /0pQ==
X-Gm-Message-State: AOJu0Yz5jBS2nRyUxGnC3ih6KfbVoCOJ8DgIP9tRz06Q7LKpZ5tWxhAZ
	gO0V3RgCiOAKb8ZFuLh0E1XZuRncJiwz3JWdj6/zTZx9w3urDT6SWBI5atHGoyGUCogkWHtMmbK
	LecYDyHt7OvyYAaIvBsxWfB8Xmt4=
X-Gm-Gg: ASbGnctPv+e89SIrww59HXQtOLv0Ug2FiaWA4EeOKKDARrDFfkm7nk62AAYzHeixMoK
	aLi31u4B3zm4HW453nb0E5VdhMb0n2O9CH6zFDOteTnr8hOGl8QCLMPFxmOAWevFS9Fn4JX2WeV
	YS9w3tr82Rv5nCz4CZNQC4
X-Google-Smtp-Source: AGHT+IF+vukgJpOYd7VXDpf+RZLkok42ULAgNTOPpAsVMONt0YKDiwSzQLL37Rc6x3pDU0inmqdielOPLfYqL9AQbqg=
X-Received: by 2002:a05:6830:d10:b0:727:3664:ca25 with SMTP id
 46e09a7af769-72e86265c04mr863642a34.0.1744336621506; Thu, 10 Apr 2025
 18:57:01 -0700 (PDT)
MIME-Version: 1.0
References: <1744189624-6858-1-git-send-email-wangmy@fujitsu.com> <CAMKF1soQDwGmhh=uvuL1pCTm5aZZg4QYOTPx+VX1fAi9BvFcYw@mail.gmail.com>
In-Reply-To: <CAMKF1soQDwGmhh=uvuL1pCTm5aZZg4QYOTPx+VX1fAi9BvFcYw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 10 Apr 2025 18:56:34 -0700
X-Gm-Features: ATxdqUEuf2nrB3vqZ4kh6wsjIgZxdrjVvJHRcMzene2NZksLPgQP3QqldfsBuuU
Message-ID: <CAMKF1soS0p0pNX1NNYAkBNJCBpTELboR_08H9657iFb1oEyz3Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH v2] libspdm: upgrade 3.6.0 -> 3.7.0
To: wangmy@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Apr 2025 01:57:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116790

This seems likely due to openssl upgrade in core

92c32a6de92 openssl: upgrade 3.4.1 -> 3.5.0

On Thu, Apr 10, 2025 at 6:51=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> it still fails for me.
>
>
> build/tmp/work/core2-64-yoe-linux/libspdm/3.7.0/git/os_stub/cryptlib_open=
ssl/pem/pem.c
>    In file included from
> build/tmp/work/core2-64-yoe-linux/libspdm/3.7.0/git/os_stub/cryptlib_open=
ssl/pem/pem.c:12:
>   build/tmp/work/core2-64-yoe-linux/libspdm/3.7.0/recipe-sysroot/usr/incl=
ude/openssl/pem.h:399:28:
> error: unknown type name '
>    =E2=86=AA OSSL_i2d_of_void_ctx'
>      399 | int PEM_ASN1_write_bio_ctx(OSSL_i2d_of_void_ctx *i2d, void *vc=
tx,
>          |                            ^
>    1 error generated.
>    [37/176] Building C object
> os_stub/cryptlib_openssl/CMakeFiles/cryptlib_openssl.dir/pk/x509.c.o
>    FAILED: os_stub/cryptlib_openssl/CMakeFiles/cryptlib_openssl.dir/pk/x5=
09.c.o
>
> On Wed, Apr 9, 2025 at 2:07=E2=80=AFAM wangmy via lists.openembedded.org
> <wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
> >
> > From: Wang Mingyu <wangmy@fujitsu.com>
> >
> > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > ---
> >  .../libspdm/{libspdm_3.6.0.bb =3D> libspdm_3.7.0.bb}             | 3 +=
+-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >  rename meta-oe/recipes-support/libspdm/{libspdm_3.6.0.bb =3D> libspdm_=
3.7.0.bb} (95%)
> >
> > diff --git a/meta-oe/recipes-support/libspdm/libspdm_3.6.0.bb b/meta-oe=
/recipes-support/libspdm/libspdm_3.7.0.bb
> > similarity index 95%
> > rename from meta-oe/recipes-support/libspdm/libspdm_3.6.0.bb
> > rename to meta-oe/recipes-support/libspdm/libspdm_3.7.0.bb
> > index 4c0483ebac..a3012e10bd 100644
> > --- a/meta-oe/recipes-support/libspdm/libspdm_3.6.0.bb
> > +++ b/meta-oe/recipes-support/libspdm/libspdm_3.7.0.bb
> > @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D8f9b59a=
81a88da8e812af43728b72dd7"
> >  DEPENDS =3D "openssl"
> >
> >  SRC_URI =3D "git://github.com/DMTF/libspdm.git;branch=3Dmain;protocol=
=3Dhttps"
> > -SRCREV =3D "5ebe5e3946b9439928fa3a7548268c29cccc1b16"
> > +SRCREV =3D "1be116c7b7713fa9003e1bd53b53a34758549eb9"
> >
> >  S =3D "${WORKDIR}/git"
> >
> > @@ -23,6 +23,7 @@ LIBSPDM_CFLAGS =3D "\
> >         -DLIBSPDM_ENABLE_CAPABILITY_GET_KEY_PAIR_INFO_CAP=3D0 \
> >         -DLIBSPDM_ENABLE_CAPABILITY_SET_KEY_PAIR_INFO_CAP=3D0 \
> >         -DLIBSPDM_HAL_PASS_SPDM_CONTEXT=3D1 \
> > +        -DLIBSPDM_ENABLE_CAPABILITY_ENDPOINT_INFO_CAP=3D0 \
> >         "
> >
> >  LIBSPDM_CFLAGS:append:toolchain-gcc =3D " -fPIE"
> > --
> > 2.43.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#116728): https://lists.openembedded.org/g/openembed=
ded-devel/message/116728
> > Mute This Topic: https://lists.openembedded.org/mt/112168951/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

