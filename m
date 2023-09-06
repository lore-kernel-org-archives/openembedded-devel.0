Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38688EB8FDE
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 14:36:34 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.web11.10487.1694010987241439248
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Sep 2023 07:36:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=lCW2/SvU;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-1cc61f514baso2225085fac.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Sep 2023 07:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694010986; x=1694615786; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c6YLl5spo1iDoMj3q3A90gXGg+kmZP17FbjwSxrcQXI=;
        b=lCW2/SvULVObN7bW2j79NKgGJ1wTVe1Rjih0vr0/unITsMRde5hJ0nR2+NA2coY1Og
         SMdJxv7GxEkwQ4gqAh8ZA4HMy+0XamC15m8OLQ08x26MxceCpIGcAi6T3mDrte7R0qzQ
         Tbs4sFlF5R94dklMjbN6Tw6fHGe+OXiHIPIZI2sotxpMuXqMhKD4taKR7UhzV6byfHIm
         ZumnZ77ZE0R5eUT9ed7FTI8IpwwIiVlsBcDzMBtOgrUlmd8PuO+CbpfmQMYk/Rz0XvKf
         gbqQogDAk1oJPz9CP1CpKN2KGP2X0GySRq87Sf8Uzvvm8KFtI+FkyjZUJPpUgONtMkHT
         eSIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694010986; x=1694615786;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c6YLl5spo1iDoMj3q3A90gXGg+kmZP17FbjwSxrcQXI=;
        b=JkVfuXAhJQDcfmIVnTQ+1J0i8eF3DTGwgrPtD3y1SSr0Yiq5SqGa2MvRJd2atf5QR5
         4sj4w36MLmc3A2Y7a8wpTsZXJq2B1iJoo/EcI1eEUFEOeH2SFlxU9MmsYGGwsmwmPssT
         4qUkYrHYpawm/jf1dXy4CmcYOzZ0qyDSFhdniDxZ17r5s9wp7ctJnYaRaciNWO9WwlNk
         PnTWRPlkDYc4yOFaD57mhcxla9ViC608uybi/f1fSxoU3FBq008EFP8DPcqMpD0aP9yI
         rW/ieoIf+viuPy9zGdqqeT1dumB3ENWEAsyAdZ3ZchjewcfDyB6dhvPcF1EuaTlAyzMP
         kn8Q==
X-Gm-Message-State: AOJu0YwV0xWt1u23EYd9GP5FwgQiUHrdw7DkHBeCRtQ8mbhZR7b0WvTD
	SpV71EgvXjzxUbuXqqhsUar3dfuJJOjq8F30e/k=
X-Google-Smtp-Source: AGHT+IFSn0dvh3H5+/pK4tKyad1RKqWq4qpsE1vx29XEDUJk/txpLk4SJfbvvoU5JDqcjdldm9sPttQhisYtkeBv+18=
X-Received: by 2002:a05:6871:8713:b0:1d1:265c:9477 with SMTP id
 tc19-20020a056871871300b001d1265c9477mr12969541oab.18.1694010986431; Wed, 06
 Sep 2023 07:36:26 -0700 (PDT)
MIME-Version: 1.0
References: <1693965700-14701-1-git-send-email-wangmy@fujitsu.com> <CAJiuCcdg_U8PdQFFL-+y4b5Dy6HjTUs8ON13gSN7Xs3pewrfkQ@mail.gmail.com>
In-Reply-To: <CAJiuCcdg_U8PdQFFL-+y4b5Dy6HjTUs8ON13gSN7Xs3pewrfkQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Sep 2023 07:36:00 -0700
Message-ID: <CAMKF1sp-wGY61-oJKSrZrtEp=EFAywQubwVNoCnoi44Wn67vMw@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-protobuf: upgrade 4.24.1 -> 4.24.2
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc: wangmy <wangmy@fujitsu.com>, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Sep 2023 14:36:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104781

On Wed, Sep 6, 2023 at 1:46=E2=80=AFAM Cl=C3=A9ment P=C3=A9ron <peron.clem@=
gmail.com> wrote:
>
> Hi,
>
> On Wed, 6 Sept 2023 at 04:02, wangmy <wangmy@fujitsu.com> wrote:
>>
>> From: Wang Mingyu <wangmy@fujitsu.com>
>>
>> Changelog:
>>  Fixes for 32-bit MSVC.
>>
>> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
>> ---
>>  .../{python3-protobuf_4.24.1.bb =3D> python3-protobuf_4.24.2.bb}  | 2 +=
-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>  rename meta-python/recipes-devtools/python/{python3-protobuf_4.24.1.bb =
=3D> python3-protobuf_4.24.2.bb} (92%)
>
>
> Does it make sense to continue bumping the python3 protobuf package witho=
ut bumping protobuf itself?
>
> The protobuf is stuck at 3.21.12.

are they locked with versions in terms of compatibility?
if so then we should otherwise if there are no huge testing gaps it
should be ok.

>
> Regards,
> Clement
>
>
>>
>>
>> diff --git a/meta-python/recipes-devtools/python/python3-protobuf_4.24.1=
.bb b/meta-python/recipes-devtools/python/python3-protobuf_4.24.2.bb
>> similarity index 92%
>> rename from meta-python/recipes-devtools/python/python3-protobuf_4.24.1.=
bb
>> rename to meta-python/recipes-devtools/python/python3-protobuf_4.24.2.bb
>> index 6322ec1f30..3014884a33 100644
>> --- a/meta-python/recipes-devtools/python/python3-protobuf_4.24.1.bb
>> +++ b/meta-python/recipes-devtools/python/python3-protobuf_4.24.2.bb
>> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://PKG-INFO;beginline=3D8;endl=
ine=3D8;md5=3D53dbfa56f61b90215a
>>
>>  inherit pypi setuptools3
>>  SRC_URI +=3D "file://0001-message.c-Cast-uintptr_t-types-to-upb_Message=
Def.patch"
>> -SRC_URI[sha256sum] =3D "44837a5ed9c9418ad5d502f89f28ba102e9cd172b6668bc=
813f21716f9273348"
>> +SRC_URI[sha256sum] =3D "7fda70797ddec31ddfa3576cbdcc3ddbb6b3078b737a1a8=
7ab9136af0570cd6e"
>>
>>  # http://errors.yoctoproject.org/Errors/Details/184715/
>>  # Can't find required file: ../src/google/protobuf/descriptor.proto
>> --
>> 2.34.1
>>
>>
>>
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104771): https://lists.openembedded.org/g/openembedde=
d-devel/message/104771
> Mute This Topic: https://lists.openembedded.org/mt/101185171/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

