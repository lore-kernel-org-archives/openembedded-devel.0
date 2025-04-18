Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53517C369C9
	for <webhook@archiver.kernel.org>; Fri, 18 Apr 2025 18:55:43 +0000 (UTC)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
 by mx.groups.io with SMTP id smtpd.web11.3107.1745002533951382024
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Apr 2025 11:55:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b8cvlHla;
 spf=pass (domain: gmail.com, ip: 209.85.161.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-603ff8e90acso429649eaf.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Apr 2025 11:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745002533; x=1745607333; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TFtcnUT9B5mhvF1da8JVJ12WUAGu8SdmEzMRIp4+T1I=;
        b=b8cvlHlaHBDK0errlw9foJIf4niggAvKWm/Su0NOGfGtmLImxrEWQUQbFPX+dC3DOx
         cXOpVDci0F4kGx1VjakbbsDZRW+LdGsEltq4fTDpBj22eGe68SL4rlGC6l3ermcLhdta
         RtZNiWbyTc3GOePIxGjhF1kJnGsCl0wPzzLCsozRQ7KhaXnNsDYFUhveADrLwBq6FbSt
         FkNCvXfNtsSCtmizPWaHNobab+20ODxJF2cSbCzyLaEsEibKd424k2uiWDqJ/DZB6b3i
         a9dwiDDKlntQAMVGK55enxA4IBkbWixFov0rg+SAC39UXmKbHN24RuGVdzJ1eUWINWnt
         CbVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745002533; x=1745607333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TFtcnUT9B5mhvF1da8JVJ12WUAGu8SdmEzMRIp4+T1I=;
        b=FGvizNHZvBgnwdr64m3oe/79L4JFpT3PeovjBCYBOyqRI4V12k8+m/Q/qeXmqf5fKA
         lj0yMSpYjFMjnxtrzQkJoxO8F3IifzYxTbQ1kkXeB7jsAR0UkjO4W1K8dS8mYvsHyMdU
         8M+lrMJAGRGLyDZakwmjb1by8Lv/lw7KqohSQI+mbsiU0vlpdJxvRP2jU7uMUrKG30rd
         fqbMWDRmbM6aES+uu9NJeeBVBg3ab7PfG+Zq7n+q9Ixo8xAx4bklxZGEHb2wD7gm0hME
         U0uu4XTustiIlgF4wA4LyoViKxPMXfm5m6JOKofIHEcJS4Q7j+wMWoihtHQKPtvIVoU+
         so9w==
X-Gm-Message-State: AOJu0YxNadjNbVo/r0YFhQZLiD4WqYje+nHIp6kpQV2diVxnmXqq/aO4
	jJbCOZA3+65pCk6CEqTyxG0kIYhWmNrDK+XlS1b5S4YZLy31x8cVQsJqE+n18xN83m2Zw3KAD0z
	TMqVpdLGFwqe1+fALrp0V0/8ooee85Zgf3rE=
X-Gm-Gg: ASbGncto552Qk+TXRurTqymyZY3KJhJ4LAlR2lWWlHZL5YXMd0d4Yo4hgj8cAR41gNr
	UrfQJSmYOrIH6bMTaBEyJyYqO4uKNdl4/yugBdff4caSqlwL4zoSmDNZyPgVir1k5aWLIsRrcAd
	KU6GgySytFXJiASA5XvN0+CYC4x5304ZI=
X-Google-Smtp-Source: AGHT+IEjGpyg1voY2cHvEv2nBjvNsw4x/saZVFKTCM1KmCdV87xoFTWeqWwdEgIRBtVuFGf0PogZTZJl3Feu65z9zyA=
X-Received: by 2002:a05:6820:1688:b0:603:f191:a93b with SMTP id
 006d021491bc7-6060053f74cmr2010857eaf.1.1745002532951; Fri, 18 Apr 2025
 11:55:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250418105119.3211549-1-leon.anavi@konsulko.com> <CAMKF1sqhR5FRsw3cfM1J1V4qhbdo4YYgf+NQ3CODAk9O9nD4iA@mail.gmail.com>
In-Reply-To: <CAMKF1sqhR5FRsw3cfM1J1V4qhbdo4YYgf+NQ3CODAk9O9nD4iA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 18 Apr 2025 11:55:07 -0700
X-Gm-Features: ATxdqUHP9J3pf4cYs5p5nC6l4WXuZRRzFuQaKfE3g5e9j6J4XdRj0rybwfBpJTs
Message-ID: <CAMKF1sqjHe7JoGBTQrOfzUi_em8nXw5yVrDhNWTHzy+mFo0HEg@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCHv2] python3-eth-utils: Upgrade 5.2.0 -> 5.3.0
To: leon.anavi@konsulko.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Apr 2025 18:55:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116975

Here is further recipes which need this check

ERROR: Nothing RPROVIDES 'python3-eth-utils' (but
/home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/pyt=
hon3-eth-abi_5.2.0.bb,
/home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/pyt=
hon3-eth-keys_0.5.0.bb,
/home/yoe/sources/meta-openembedded/meta-
   =E2=86=AA python/recipes-devtools/python/python3-eth-account_0.12.1.bb,
/home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/pyt=
hon3-eth-rlp_2.1.0.bb,
/home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/pyt=
hon3-rlp_4.1.0.bb
RDEPENDS on or otherwise requires it)
   python3-eth-utils was skipped: incompatible with host
riscv32-yoe-linux (not in COMPATIBLE_HOST)
   NOTE: Runtime target 'python3-eth-utils' is unbuildable, removing...
   Missing or unbuildable dependency chain was: ['python3-eth-utils']
   ERROR: Nothing RPROVIDES 'python3-eth-abi' (but
/home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/pyt=
hon3-eth-abi_5.2.0.bb,
/home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/pyt=
hon3-eth-account_0.12.1.bb
RDEPENDS on or otherwise requires it)
   No eligible RPROVIDERs exist for 'python3-eth-abi'
   NOTE: Runtime target 'python3-eth-abi' is unbuildable, removing...
   Missing or unbuildable dependency chain was: ['python3-eth-abi']
   ERROR: Nothing RPROVIDES 'python3-eth-abi-dev' (but
/home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/pyt=
hon3-eth-abi_5.2.0.bb
RDEPENDS on or otherwise requires it)
   No eligible RPROVIDERs exist for 'python3-eth-abi-dev'
   NOTE: Runtime target 'python3-eth-abi-dev' is unbuildable, removing...
   Missing or unbuildable dependency chain was: ['python3-eth-abi-dev']
   ERROR: Nothing RPROVIDES 'python3-eth-keys' (but
/home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/pyt=
hon3-eth-keyfile_0.8.0.bb,
/home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/pyt=
hon3-eth-keys_0.5.0.bb,
/home/yoe/sources/meta-openembedded/
   =E2=86=AA meta-python/recipes-devtools/python/python3-eth-account_0.12.1=
.bb
RDEPENDS on or otherwise requires it)
   No eligible RPROVIDERs exist for 'python3-eth-keys'
   NOTE: Runtime target 'python3-eth-keys' is unbuildable, removing...
   Missing or unbuildable dependency chain was: ['python3-eth-keys']
   ERROR: Nothing RPROVIDES 'python3-eth-keyfile' (but
/home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/pyt=
hon3-eth-keyfile_0.8.0.bb,
/home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/pyt=
hon3-eth-account_0.12.1.bb
RDEPENDS on or otherwise requires it)
   No eligible RPROVIDERs exist for 'python3-eth-keyfile'
   NOTE: Runtime target 'python3-eth-keyfile' is unbuildable, removing...
   Missing or unbuildable dependency chain was: ['python3-eth-keyfile']
   ERROR: Nothing RPROVIDES 'python3-eth-keyfile-dev' (but
/home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/pyt=
hon3-eth-keyfile_0.8.0.bb
RDEPENDS on or otherwise requires it)
   No eligible RPROVIDERs exist for 'python3-eth-keyfile-dev'
   NOTE: Runtime target 'python3-eth-keyfile-dev' is unbuildable, removing.=
..
   Missing or unbuildable dependency chain was: ['python3-eth-keyfile-dev']
   ERROR: Nothing RPROVIDES 'python3-eth-keys-dev' (but
/home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/pyt=
hon3-eth-keys_0.5.0.bb
RDEPENDS on or otherwise requires it)
   No eligible RPROVIDERs exist for 'python3-eth-keys-dev'
   NOTE: Runtime target 'python3-eth-keys-dev' is unbuildable, removing...
   Missing or unbuildable dependency chain was: ['python3-eth-keys-dev']
   ERROR: Nothing RPROVIDES 'python3-rlp' (but
/home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/pyt=
hon3-eth-account_0.12.1.bb,
/home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/pyt=
hon3-eth-rlp_2.1.0.bb,
/home/yoe/sources/meta-openembedded/meta-
   =E2=86=AA python/recipes-devtools/python/python3-rlp_4.1.0.bb RDEPENDS o=
n
or otherwise requires it)
   No eligible RPROVIDERs exist for 'python3-rlp'
   NOTE: Runtime target 'python3-rlp' is unbuildable, removing...
   Missing or unbuildable dependency chain was: ['python3-rlp']
   ERROR: Nothing RPROVIDES 'python3-eth-rlp' (but
/home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/pyt=
hon3-eth-account_0.12.1.bb,
/home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/pyt=
hon3-eth-rlp_2.1.0.bb
RDEPENDS on or otherwise requires it)
   No eligible RPROVIDERs exist for 'python3-eth-rlp'
   NOTE: Runtime target 'python3-eth-rlp' is unbuildable, removing...
   Missing or unbuildable dependency chain was: ['python3-eth-rlp']
   ERROR: Nothing RPROVIDES 'python3-eth-account-dev' (but
/home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/pyt=
hon3-eth-account_0.12.1.bb
RDEPENDS on or otherwise requires it)
   No eligible RPROVIDERs exist for 'python3-eth-account-dev'
   NOTE: Runtime target 'python3-eth-account-dev' is unbuildable, removing.=
..
   Missing or unbuildable dependency chain was: ['python3-eth-account-dev']
   ERROR: Nothing RPROVIDES 'python3-eth-account' (but
/home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/pyt=
hon3-eth-account_0.12.1.bb
RDEPENDS on or otherwise requires it)
   No eligible RPROVIDERs exist for 'python3-eth-account'
   NOTE: Runtime target 'python3-eth-account' is unbuildable, removing...
   Missing or unbuildable dependency chain was: ['python3-eth-account']
   ERROR: Nothing RPROVIDES 'python3-eth-rlp-dev' (but
/home/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/pyt=
hon3-eth-rlp_2.1.0.bb
RDEPENDS on or otherwise requires it)
   No eligible RPROVIDERs exist for 'python3-eth-rlp-dev'
   NOTE: Runtime target 'python3-eth-rlp-dev' is unbuildable, removing...
   Missing or unbuildable dependency chain was: ['python3-eth-rlp-dev']
   ERROR: Nothing RPROVIDES 'python3-rlp-dev' (but
/home/oe/sources/meta-openembedded/meta-python/recipes-devtools/python/pyth=
on3-rlp_4.1.0.bb
RDEPENDS on or otherwise requires it)
   No eligible RPROVIDERs exist for 'python3-rlp-dev'
   NOTE: Runtime target 'python3-rlp-dev' is unbuildable, removing...
   Missing or unbuildable dependency chain was: ['python3-rlp-dev']

On Fri, Apr 18, 2025 at 8:26=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> On Fri, Apr 18, 2025 at 3:51=E2=80=AFAM Leon Anavi via lists.openembedded=
.org
> <leon.anavi=3Dkonsulko.com@lists.openembedded.org> wrote:
> >
> > Upgrade to release 5.3.0:
> >
> > - Replace arg["name"] with arg.get("name") to correctly handle
> >   optional names
> > - Add new methods: to_wei_decimals, and from_wei_decimals which
> >   take a number instead of a string
> > - Add CamelModel pydantic model for validating objects and
> >   serializing to camelCase when used with by_alias=3DTrue, with
> >   the general expectation of a well-formed JSON-RPC object.
> >
> > Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> > ---
> >  ...python3-eth-utils_5.2.0.bb =3D> python3-eth-utils_5.3.0.bb} | 5 +++=
+-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >  rename meta-python/recipes-devtools/python/{python3-eth-utils_5.2.0.bb=
 =3D> python3-eth-utils_5.3.0.bb} (76%)
> >
> > diff --git a/meta-python/recipes-devtools/python/python3-eth-utils_5.2.=
0.bb b/meta-python/recipes-devtools/python/python3-eth-utils_5.3.0.bb
> > similarity index 76%
> > rename from meta-python/recipes-devtools/python/python3-eth-utils_5.2.0=
.bb
> > rename to meta-python/recipes-devtools/python/python3-eth-utils_5.3.0.b=
b
> > index 435d032a84..3b71684820 100644
> > --- a/meta-python/recipes-devtools/python/python3-eth-utils_5.2.0.bb
> > +++ b/meta-python/recipes-devtools/python/python3-eth-utils_5.3.0.bb
> > @@ -4,7 +4,7 @@ SECTION =3D "devel/python"
> >  LICENSE =3D "MIT"
> >  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd3f53e7cc5bf80b16eff1f4a38c=
73182"
> >
> > -SRC_URI[sha256sum] =3D "17e474eb654df6e18f20797b22c6caabb77415a996b3ba=
0f3cc8df3437463134"
> > +SRC_URI[sha256sum] =3D "1f096867ac6be895f456fa3acb26e9573ae66e753abad9=
208f316d24d6178156"
> >
> >  PYPI_PACKAGE =3D "eth_utils"
> >  UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
> > @@ -16,4 +16,7 @@ RDEPENDS:${PN} +=3D " \
> >      python3-eth-typing \
> >      python3-setuptools \
> >      python3-toolz \
> > +    python3-pydantic \
> >  "
> > +
> > +COMPATIBLE_HOST:riscv32 =3D "null"
>
> this should also be applied to recipes which depend upon python3-eth-util=
s
> > --
> > 2.39.5
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#116947): https://lists.openembedded.org/g/openembed=
ded-devel/message/116947
> > Mute This Topic: https://lists.openembedded.org/mt/112328943/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

