Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2431C4828D
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 16:19:32 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web11.19550.1706804362542657503
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Feb 2024 08:19:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V6elOmpH;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-20503dc09adso695922fac.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 Feb 2024 08:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706804362; x=1707409162; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y4BinZ58aHwbMeEgLhgBL8M4VFqJU3a0EPtqGjX8reQ=;
        b=V6elOmpHoPcEROKS337WjyI+uqi5pilW9uR0xdMM6sz+OcwCRxcTa+tm/mxbVQyUvW
         oeboJfTOqgb0T5CnngvjKc3arBv5itRSmnNcnZV+BjOd2WbGrCQyeF8fbFffwxW1GnpO
         ohnHqmIogA8INN/Ce5/UJvIj2Zx6EoEHV07F4GnrnZkpGSgDDQCa6CuxriwoHTw6Ake3
         Hx1z7A6W1oc+dztwOS7fLVrp3A1fq3BG6dZaVNWUCQiJV2OvcagJKrDiTD1wfS/b789n
         tBv1mDO8XwTvbtkVtlpeir49rE0EX7FMjxCEGf3Q1n4xtLyp8Feg5ss/2HDMeS3AWV2+
         PlzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706804362; x=1707409162;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y4BinZ58aHwbMeEgLhgBL8M4VFqJU3a0EPtqGjX8reQ=;
        b=hvjhFp+i8Ny7axP1ze3ozZ/SkCVq1D8rYkgOvFrqIYDXnWTtR9BNnNf+nWVH8H5RSt
         Sf/yJ+VaZB+diMYHneM7CsjbcF6sv1sRPGmaUB0ogMrN70tNzOIp41Ly2z77RoTFm32G
         vPBQ+tSil6ohPKwDKQCWCfn2qOgbfS5Md4oTYtHyNS+D8bRg4zzWZiwa5JvYMicLUKaf
         p7EIAkhR8Zd/weyKeOWfolJgZAmZwO2KXQtuxap6wiw3uwLJGe7JG6+aUOyDSxScxJ4p
         gweAhXYABf8HRbD7yEhMSpRzxBEQGndJOHP6lMR0ZT83OrAv59UZlR8SS/LHENQI9bP8
         dRWg==
X-Gm-Message-State: AOJu0YxWWfIELrxrq/KbPoKIpLVPzSlYISyRS6sO4AQOJDAp0YI2tWUU
	TNZX1zRbJAOIm1w6gFJkea0dJZMh+Kk2Bbr01XOos4ojQ3YaSv6NaPZc9VmpukK5pUpJ9LuwwnM
	bM0MbLUsGHLOk+jXokUMFK+569WQ=
X-Google-Smtp-Source: AGHT+IGniWWRQnJH+GY2vQqjzxI/NlMzQ1v90yhudMJoqyF8t2iiXFvhHqtOy8zNWSLXQ6Wl4QOK28t1rHT2Mf2ElXk=
X-Received: by 2002:a05:6870:d8d3:b0:210:d5a5:7d41 with SMTP id
 of19-20020a056870d8d300b00210d5a57d41mr6169488oac.45.1706804361641; Thu, 01
 Feb 2024 08:19:21 -0800 (PST)
MIME-Version: 1.0
References: <20240131074948.18462-1-alperyasinak1@gmail.com>
 <630968c2-01ba-450e-b714-c02b9561c98c@baylibre.com> <CAGpma=5Rb8dow=a8DM4pi+piifi_FE0x_7hOF_CBO7JPnatR9A@mail.gmail.com>
In-Reply-To: <CAGpma=5Rb8dow=a8DM4pi+piifi_FE0x_7hOF_CBO7JPnatR9A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 1 Feb 2024 08:18:55 -0800
Message-ID: <CAMKF1sp_VbLaikjK36GygBODbmYUMpHaVJProf5YyUN3i-gOag@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-google-auth-oauthlib: add recipe
To: Alper Ak <alperyasinak1@gmail.com>
Cc: Trevor Gamblin <tgamblin@baylibre.com>, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Feb 2024 16:19:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108519

On Wed, Jan 31, 2024 at 9:36=E2=80=AFPM Alper Ak <alperyasinak1@gmail.com> =
wrote:
>
> Thanks for feedback. I will be more careful.
>

Please send a v2 of this patch addressing the review feedback. I have
dropped it from master-next.

> Trevor Gamblin <tgamblin@baylibre.com>, 31 Oca 2024 =C3=87ar, 23:36 tarih=
inde =C5=9Funu yazd=C4=B1:
>>
>>
>> On 2024-01-31 02:49, Alper Ak wrote:
>> > Signed-off-by: alperak <alperyasinak1@gmail.com>
>> I know that the recipe name is fairly self-explanatory, but you should
>> submit new recipes like this with a short commit message describing what
>> the recipe does and why it'd be useful to have in the layer.
>> > ---
>> >   .../python/python3-google-auth-oauthlib_1.2.0.bb   | 14 ++++++++++++=
++
>> >   1 file changed, 14 insertions(+)
>> >   create mode 100644 meta-python/recipes-devtools/python/python3-googl=
e-auth-oauthlib_1.2.0.bb
>> >
>> > diff --git a/meta-python/recipes-devtools/python/python3-google-auth-o=
authlib_1.2.0.bb b/meta-python/recipes-devtools/python/python3-google-auth-=
oauthlib_1.2.0.bb
>> > new file mode 100644
>> > index 000000000..b1e89e4b4
>> > --- /dev/null
>> > +++ b/meta-python/recipes-devtools/python/python3-google-auth-oauthlib=
_1.2.0.bb
>> > @@ -0,0 +1,14 @@
>> > +SUMMARY =3D "Google Authentication Library"
>> > +DESCRIPTION =3D "This library provides oauthlib integration with goog=
le-auth"
>> > +HOMEPAGE =3D "https://github.com/googleapis/google-auth-library-pytho=
n-oauthlib"
>> > +LICENSE =3D "Apache-2.0"
>> > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3=
c6bd57"
>> > +
>> > +SRC_URI[sha256sum] =3D "292d2d3783349f2b0734a0a0207b1e1e322ac193c2c09=
d8f7c613fb7cc501ea8"
>> > +
>> > +inherit pypi setuptools3
>> > +
>> > +RDEPENDS:${PN} =3D " \
>> > +    ${PYTHON_PN}-google-auth \
>> > +    ${PYTHON_PN}-requests-oauthlib \
>> > +"
>> >
>> >
>> >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108513): https://lists.openembedded.org/g/openembedde=
d-devel/message/108513
> Mute This Topic: https://lists.openembedded.org/mt/104071227/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

