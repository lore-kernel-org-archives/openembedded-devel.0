Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31ED3EE14AA
	for <webhook@archiver.kernel.org>; Thu,  7 Sep 2023 02:25:54 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web10.4841.1694053552476506218
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Sep 2023 19:25:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=lH397FGl;
 spf=pass (domain: gmail.com, ip: 209.85.167.177, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3a9f87adfe1so344758b6e.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Sep 2023 19:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694053552; x=1694658352; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i2LAR5WONOZRe2piUnxYgv7/SbaIu8Ed5XBo9O1ugy4=;
        b=lH397FGlWwDqH0QuGQFQXuzTKnQXNvkfezAZoKW8dOMCc9C2/m0qJIKvy9W7ky2eH3
         ayGFJliIkhKvJy6eOVL25St2WUhxcQV8NGMn219A3qOIULeriB3M9HqSAfaiUuvboJe5
         qfR9T20DdAhDAz1f9oycXSUgzEudO6fYeiAIKhvCGykUE/i+HsHaNViHOU+a4QPgRRrp
         3otdHCeAsA1OeuZvRAeTmBIQKZF/DMvyh5rtQIOoEw4r/XvnjS/bzfQxMga4USFODHsW
         sBoDsnzNjnsom6kcEjl8AyOw9PDFUgV49vzym6tUksEw4ntD6G/+bfntyMVrbiPrf9MR
         wKuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694053552; x=1694658352;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i2LAR5WONOZRe2piUnxYgv7/SbaIu8Ed5XBo9O1ugy4=;
        b=aLz2w2laqohjz4wfN3JS/fi5vOt3FwAY2For9GwxL14Tm9LIUwgBFKQkvsKbjDx3Xf
         /F8GPBRkXicqOBSqrPEVIVPpyp4rFoaSAt/9JyM8fk7jpOqwVIVzb1/65sUxB1le8dob
         D5k5uYkUR9fOFxQldfao5f4pSJ0iddJ+I6YuF9tJQY3Y8ix7UqkMxbnUA+o6yopMq8Ey
         15to1nGU+/znn9fka1bWmR3krbAMZK7P0p47eyvO2YKK5svN+nz6v2Vqh/DcORSaF4nD
         EJY26PFcAGlvI+U9liEVKawiTl4t5WTdXwbAhjXVk99VQGKairUWWgfzYB/jX3735joT
         Njvg==
X-Gm-Message-State: AOJu0Yzfk0v5VocaaLQKCcw7NBkoZEZqIc4/3rR2Xq59+f7CtR4udxw3
	BQEtsiLOWZz3RjzXN2ztmXWzs6mAt1o79xV67+M=
X-Google-Smtp-Source: AGHT+IEKEH9pOI5BnBFtU9MWLTuzjOyVZHfONclQ/SENYfwQoRIWACDGJwGNUCbkVOKAz7e2Cb1c0X4ZMd4eXpZAirE=
X-Received: by 2002:a05:6808:1156:b0:3a1:dd99:8158 with SMTP id
 u22-20020a056808115600b003a1dd998158mr22644539oiu.6.1694053551656; Wed, 06
 Sep 2023 19:25:51 -0700 (PDT)
MIME-Version: 1.0
References: <1693965700-14701-1-git-send-email-wangmy@fujitsu.com>
 <CAJiuCcdg_U8PdQFFL-+y4b5Dy6HjTUs8ON13gSN7Xs3pewrfkQ@mail.gmail.com> <OSBPR01MB1845F49F2810B5F1FA0431FCDCEEA@OSBPR01MB1845.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB1845F49F2810B5F1FA0431FCDCEEA@OSBPR01MB1845.jpnprd01.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Sep 2023 19:25:25 -0700
Message-ID: <CAMKF1srkJWo2V52vSr3D-JgEyeTbgaVHDejYrT_OBrhbci1VSQ@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-protobuf: upgrade 4.24.1 -> 4.24.2
To: wangmy <wangmy@fujitsu.com>
Cc: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Sep 2023 02:25:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104786

Can you test this upgrade for sanity ? maybe enable ptest and add it
to default ptest image

On Wed, Sep 6, 2023 at 6:00=E2=80=AFPM wangmy <wangmy@fujitsu.com> wrote:
>
> Okay, I understand.
>
> If there are updates to protobuf,  maybe we can continuing to upgrade pyt=
hon3-protobuf.
>
>
>
>   --
>
> Best Regards
>
> ---------------------------------------------------
>
> Wang Mingyu
>
> Development Dept.I
>
> Nanjing Fujitsu Nanda Software Tech. Co., Ltd.(FNST) No. 6 Wenzhu Road, N=
anjing, 210012, China
>
> TEL: +86+25-86630566-8568
>
> COINS: 79988548
>
> FAX: +86+25-83317685
>
> MAIL: wangmy@fujitsu.com
>
> http://www.fujitsu.com/cn/fnst/
>
>
>
> From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists=
.openembedded.org> On Behalf Of Cl=C3=A9ment P=C3=A9ron
> Sent: Wednesday, September 6, 2023 4:46 PM
> To: Wang, Mingyu/=E7=8E=8B =E9=B8=A3=E7=91=9C <wangmy@fujitsu.com>
> Cc: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-python] [PATCH] python3-protobuf: upgrade 4.24.1 =
-> 4.24.2
>
>
>
> Hi,
>
>
>
> On Wed, 6 Sept 2023 at 04:02, wangmy <wangmy@fujitsu.com> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Changelog:
>  Fixes for 32-bit MSVC.
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../{python3-protobuf_4.24.1.bb =3D> python3-protobuf_4.24.2.bb}  | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python/{python3-protobuf_4.24.1.bb =
=3D> python3-protobuf_4.24.2.bb} (92%)
>
>
>
> Does it make sense to continue bumping the python3 protobuf package witho=
ut bumping protobuf itself?
>
>
>
> The protobuf is stuck at 3.21.12.
>
>
>
> Regards,
>
> Clement
>
>
>
>
>
>
> diff --git a/meta-python/recipes-devtools/python/python3-protobuf_4.24.1.=
bb b/meta-python/recipes-devtools/python/python3-protobuf_4.24.2.bb
> similarity index 92%
> rename from meta-python/recipes-devtools/python/python3-protobuf_4.24.1.b=
b
> rename to meta-python/recipes-devtools/python/python3-protobuf_4.24.2.bb
> index 6322ec1f30..3014884a33 100644
> --- a/meta-python/recipes-devtools/python/python3-protobuf_4.24.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-protobuf_4.24.2.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://PKG-INFO;beginline=3D8;endli=
ne=3D8;md5=3D53dbfa56f61b90215a
>
>  inherit pypi setuptools3
>  SRC_URI +=3D "file://0001-message.c-Cast-uintptr_t-types-to-upb_MessageD=
ef.patch"
> -SRC_URI[sha256sum] =3D "44837a5ed9c9418ad5d502f89f28ba102e9cd172b6668bc8=
13f21716f9273348"
> +SRC_URI[sha256sum] =3D "7fda70797ddec31ddfa3576cbdcc3ddbb6b3078b737a1a87=
ab9136af0570cd6e"
>
>  # http://errors.yoctoproject.org/Errors/Details/184715/
>  # Can't find required file: ../src/google/protobuf/descriptor.proto
> --
> 2.34.1
>
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104785): https://lists.openembedded.org/g/openembedde=
d-devel/message/104785
> Mute This Topic: https://lists.openembedded.org/mt/101185171/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

