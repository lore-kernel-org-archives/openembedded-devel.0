Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E22AC6FD1D
	for <webhook@archiver.kernel.org>; Sat,  1 Apr 2023 18:35:10 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web11.28290.1680374109636445004
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Apr 2023 11:35:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Xe+cZoW1;
 spf=pass (domain: gmail.com, ip: 209.85.210.41, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f41.google.com with SMTP id o25-20020a9d4119000000b006a11eb19f8eso12424889ote.5
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Apr 2023 11:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680374109;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NXGpMH7keRrNoQ6xsUrlxY8co+VHWtinF0ZhnY7xmrk=;
        b=Xe+cZoW1f53hWwE5/+ieuv8jh73wlEH5pldyy4sD+4HXSul8p1bmvg6bAXkHF7AWPu
         5hBZ1oRiQ5qIfC4iLNLnoWlsWu16HMk+suMxeWXjBWTD2I7ccUeCKxjZ21CoqfTiDkaW
         xfDYG5NmCea1qqPygMSZyxvtPsPBMbSLwTK9XVBWszCCElQMoxXpLPWSLnlo/m01daw/
         5DJTd9hrFkn7a+Nf7JkEakC9rxJ+4dRTq8vXbRMO2gT2IFq4dstmeYDf73LVAEEvFl40
         vgjFgmoLaNeMBlxXMSGjg1yNLER7YrkrfuiB2iXKcRgKdcsH7CPXJdvjhFkh+4tzki8P
         vgnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680374109;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NXGpMH7keRrNoQ6xsUrlxY8co+VHWtinF0ZhnY7xmrk=;
        b=X7yyM33QUrvCItQrCfhw4TM1d+5o6s7eITnPj9rAOfRQe8Eq61cxvVc9jxZWhAKzX6
         I57QW/xRxmTH8Axm6FVqV9oi6Vje1PqeZJZOEe2Gz7Ai4q+wqszWKJ8tGj2+gn43/p6H
         6alNeq9VbqqGT0slO8q4jBsCZkq1JsNFAJ5WiKzWI30ZeQ2i2lIyDcCQlWcnLiOoi+wB
         2Ufq3HvRKvZIUKs1zKREvmcowsvzdJK86BF36akC7g74JOtcuFgnTGgE887OOrhBGca9
         UM+j9mQjNccifLOKypdlmtpq3Br7jeH5md1fHgoZQ/UWBQvXMH7OOsSoVMU8Cz2m/7Nk
         2t/A==
X-Gm-Message-State: AO0yUKWpAacERMGjwyuB1gOduTzTBAPgdUwRShVYcy383LP22utewf8n
	mCBWAAuILLhL5vTb+UygV+x87TKAtEgo8dxXGQo=
X-Google-Smtp-Source: AK7set+iB0w8c7tUIKsCYV+SUlU3+4EwhmTlsiVKD3nV5caVsVCL8lN0zc8pz78HuMFOaZnhoAPdoi4EoIcAwYzQlsw=
X-Received: by 2002:a9d:63c5:0:b0:698:f988:7c30 with SMTP id
 e5-20020a9d63c5000000b00698f9887c30mr10109673otl.2.1680374108800; Sat, 01 Apr
 2023 11:35:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230110102531.619341-1-raj.khem@gmail.com> <CA+chaQdo=psqULY_RQfTb052T=LtbMu_o2R3hkPBryXXeb_63Q@mail.gmail.com>
In-Reply-To: <CA+chaQdo=psqULY_RQfTb052T=LtbMu_o2R3hkPBryXXeb_63Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 1 Apr 2023 11:34:42 -0700
Message-ID: <CAMKF1soWfv0v7-y8SJnKi3iUs3iXmsHXgrGV9OCVEq_8nLogTQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] freeglut: Add packageconfigs for x11/wayland/gles
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Apr 2023 18:35:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101872

On Sat, Apr 1, 2023 at 9:18=E2=80=AFAM Martin Jansa <martin.jansa@gmail.com=
> wrote:
>
> On Tue, Jan 10, 2023 at 11:25=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wr=
ote:
>>
>> helps it compiling on on different openGL implementations which may not
>> implement fulll openGL specs
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  .../freeglut/freeglut_3.4.0.bb                 | 18 ++++++++++++++----
>>  1 file changed, 14 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta-oe/recipes-graphics/freeglut/freeglut_3.4.0.bb b/meta-=
oe/recipes-graphics/freeglut/freeglut_3.4.0.bb
>> index 627ce23544..86b94149bc 100644
>> --- a/meta-oe/recipes-graphics/freeglut/freeglut_3.4.0.bb
>> +++ b/meta-oe/recipes-graphics/freeglut/freeglut_3.4.0.bb
>> @@ -6,14 +6,24 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D89c0b58a3e0=
1ce3d8254c9f59e78adfb"
>>  SRC_URI =3D "https://sourceforge.net/projects/${BPN}/files/${BPN}/${PV}=
/${BPN}-${PV}.tar.gz"
>>  SRC_URI[sha256sum] =3D "3c0bcb915d9b180a97edaebd011b7a1de54583a838644dc=
d42bb0ea0c6f3eaec"
>>
>> -inherit cmake features_check
>> +inherit cmake features_check pkgconfig
>>
>> -# depends on virtual/libx11, virtual/libgl
>> -REQUIRED_DISTRO_FEATURES =3D "x11 opengl"
>> +# depends on virtual/libgl
>> +REQUIRED_DISTRO_FEATURES =3D "opengl"
>
>
> This doesn't seem correct as there is still libxi dependency which requir=
es x11 in DISTRO_FEATURES.
>
> Are you building freeglut without x11 (and want to support this) or shoul=
d I just return x11 to REQUIRED_DISTRO_FEATURES ?
>

yes for some meta-ti machines ( e.g. beaglebone ), I build without
x11, I wonder if libxi depenendency can be made optional.


>> +PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11'=
, d)}"
>> +PACKAGECONFIG[gles] =3D "-DFREEGLUT_GLES=3DON,-DFREEGLUT_GLES=3DOFF,"
>> +PACKAGECONFIG[wayland] =3D "-DFREEGLUT_WAYLAND=3DON,-DFREEGLUT_WAYLAND=
=3DOFF,libxkbcommon"
>> +PACKAGECONFIG[demos] =3D "-DFREEGLUT_BUILD_DEMOS=3DON,-DFREEGLUT_BUILD_=
DEMOS=3DOFF,"
>> +PACKAGECONFIG[x11] =3D ",,virtual/libx11 libice libxmu libglu libxrandr=
 libxext"
>>  # Do not use -fno-common, check back when upgrading to new version it m=
ight not be needed
>>  CFLAGS +=3D "-fcommon"
>>
>>  PROVIDES +=3D "mesa-glut"
>>
>> -DEPENDS =3D "virtual/libx11 libxmu libxi virtual/libgl libglu libxrandr=
"
>> +DEPENDS =3D "virtual/libgl libxi"
>> +
>> +do_install:append() {
>> +    # Remove buildpaths
>> +    sed -i "s#${RECIPE_SYSROOT}##g" ${D}${libdir}/cmake/FreeGLUT/FreeGL=
UTTargets.cmake
>> +}
>> --
>> 2.39.0
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#100516): https://lists.openembedded.org/g/openembedd=
ed-devel/message/100516
>> Mute This Topic: https://lists.openembedded.org/mt/96174302/3617156
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [=
Martin.Jansa@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

