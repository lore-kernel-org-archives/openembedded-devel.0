Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DAA2D0D16A
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 18:42:48 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13539.1767811359867241349
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jan 2026 10:42:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vi1lAAn/;
 spf=pass (domain: gmail.com, ip: 209.85.167.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-450be85b7d9so1538628b6e.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 10:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767811359; x=1768416159; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zLs6zcRPrNSyyDuaRvxTz1E5eOuqu2klQJkpNABhecw=;
        b=Vi1lAAn/rQsvxK1vrbUCphTIsWVnXoWGPFWmwg08CnoeYGM3v/fkLtDPWqGgdG+XnK
         XA3D1E2erlLkgisSMmjfGELFG1iLTpJx1VlAHHFao0xeEVbqxS+EF5oeJnZX/wEbgFj5
         zBwp9fF1JPaeQLGbV3p0v7WnNIJ37Iy0lvdRZno2wpR4k/os60GCu2vuvDwMBh1mkZkW
         /YWnbmoF6iMmPtyvoI+fGj7xZcAc7QfYUTbMXxNST3fEjXxI/KCWqk64qflUHMofq42F
         ei6c1d1BN9EZxrScE4d/fjx4/Vf3ZIzwyTscC/0WUSrlMRZkO1WZycBK4vgsZtKjd4Ev
         64RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767811359; x=1768416159;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zLs6zcRPrNSyyDuaRvxTz1E5eOuqu2klQJkpNABhecw=;
        b=kxdqujjI7s/aQkHgaejRcGMKtHBfcArIxgNkeEKpm+hZQcIXSO2LcjgW1+IqfbGi3g
         xBU4cdjZ3Q7USAtzBlJvDxFCx3erg7WnuReaZ8FexsZIDMpGXv5GIwFeA/TXUA5TS8HW
         XbILFp8bAesp7uoOYkqwQrBJqgzCNHIorsPTviYSqgAxUk/bhxXU9xluGswnKW/+4XUn
         Av/jko/wFl61o5spii8I1S7FrNreTICjaEDRvA+c/qLM0MXyD9Ax1WeWfvfuVY4tTaMr
         gQp+cnj7JFTRU9qVufQuQh5JnNFXGt4ytoBkqq11A73+n1MSxMHPcHo+emncnAPmt+GI
         YVEA==
X-Forwarded-Encrypted: i=1; AJvYcCV4VVzF6FjNga9GXqsCHOQ1/nk4C6A5noYeJS326qKgjIxDTzJ6zcdhqoCPD6azt1YpOsGZeZwv60A1PyWuowGI95M=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy+tQvb7ndDD6pMpiknKXrZl2fsQ31qMrtcVtvcyJlpNkc/lANy
	vczYfFZKd5z958VHJKQ/Ga9HW9SnAbN//cAK1tZdojz+YtgLRVl+KqEyNrVd1DwVwBA3ulnEY3N
	l5ly0Z4e4YU3zeyjS3oS2w1ziAR0/KTy/7g==
X-Gm-Gg: AY/fxX7/K3s0D+ybgrWku7bBWCp/dwPKtSGNbpymCM6YaKYTAnhrmWvYA9pls7ko94u
	A5SeLj17P+LSl/15yX5vERQCgRTPHiYfpFKiLATfBZnJlnRdF98eE921Ov6qnwqYxNP4hQPgI+S
	5uphsPz/slSywtwHKLN9ViaPDl35lITimK6JKeX8hWw3feXvNBEu7s99UrvWhawiVv173AHK/Fl
	1/f3cA2hz7nlZolvlpYu9Pqp/uit67wN9n6LVtVnTanPo4n78GIbKnRXTwyIJDM6iA6CEWo
X-Google-Smtp-Source: AGHT+IGlkD6WV0EOIDrjXMKNVtNhFn32u33ldZ9Ju+5lXsrQrdFUWO8yoQY2RcqaK6QHR5r94NUlEuxGUvwXqB6NUc8=
X-Received: by 2002:a05:6808:2443:b0:459:9961:5114 with SMTP id
 5614622812f47-45a6bd6828fmr1364634b6e.16.1767811358931; Wed, 07 Jan 2026
 10:42:38 -0800 (PST)
MIME-Version: 1.0
References: <20260107102855.228-1-wangmy@fujitsu.com> <20260107102855.228-5-wangmy@fujitsu.com>
 <CAMKF1spSkeMXW8RkvxvjO8bjFVappLtyD_8TFY3zEpasMFLdpQ@mail.gmail.com>
In-Reply-To: <CAMKF1spSkeMXW8RkvxvjO8bjFVappLtyD_8TFY3zEpasMFLdpQ@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Thu, 8 Jan 2026 07:42:27 +1300
X-Gm-Features: AQt7F2pr0bnWAD45gHwLlhK3QD3WdRctnCBl-P88WmgUZu2kdRwwUkJSh4AeJOM
Message-ID: <CADySD0G-Rfv_Yg3vHeAgQ1CqsMyvpGh1XODRXurLHu62vQVH5Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH 05/24] imlib2: upgrade 1.12.5 -> 1.12.6
To: raj.khem@gmail.com
Cc: wangmy@fujitsu.com, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 18:42:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123237

On Thu, Jan 8, 2026 at 6:40=E2=80=AFAM Khem Raj via lists.openembedded.org
<raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
>
>
>
> On Wed, Jan 7, 2026 at 2:29=E2=80=AFAM wangmy via lists.openembedded.org =
<wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
>>
>> From: Wang Mingyu <wangmy@fujitsu.com>
>>
>> Changelog:
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> - Y4M loader: add support for 10-bit 4:4:4
>> - Y4M loader: add support for 10-bit 4:2:2
>> - Y4M loader: add example for 8-bit mono
>> - Y4M loader: add support for 10-bit mono
>> - Y4M loader: fix support for full-range mono
>> - Y4M loader: fix support for odd dimensions
>> - Y4M loader: add support for 12/14/16-bit mono
>> - test/images: Remove intermediate generated file
>> - imlib2_view: Set title
>> - imlib2_view: Scale image when resizing window
>> - imlib2_view: A couple of fixes to previous commit
>> - test_load_2: Add new y4m test images
>> - test_load_2: Add more new y4m test images
>> - test_load_2: Add more new y4m test images
>> - autofoo: Use AM_LIBTOOLFLAGS, not LIBTOOLFLAGS
>> - gradients: Fix rendering of gradients in larger images
>> - imlib2_conv: Fix constness warning
>> - gradients: Better gradients with angles
>> - Compile cleanly with -Wdouble-promotion
>> - XPM loader: Add missing progress callback on incomplete image data
>>
>> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
>> ---
>>  meta-oe/recipes-graphics/imlib2/imlib2_git.bb | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-oe/recipes-graphics/imlib2/imlib2_git.bb b/meta-oe/rec=
ipes-graphics/imlib2/imlib2_git.bb
>> index 66e9f8a0c4..c02e497a86 100644
>> --- a/meta-oe/recipes-graphics/imlib2/imlib2_git.bb
>> +++ b/meta-oe/recipes-graphics/imlib2/imlib2_git.bb
>> @@ -7,8 +7,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D344895f253c32=
f38e182dcaf30fe8a35"
>>
>>  DEPENDS =3D "freetype "
>>  PROVIDES =3D "virtual/imlib2"
>> -PV =3D "1.12.5"
>> -SRCREV =3D "df73df52ddf0e1ea40507f5ee8c6b794b328b3bc"
>> +PV =3D "1.12.6"
>> +SRCREV =3D "8c6a7640c91d7815a6318d3641554869c62cc926"
>>
>
> If we are bumping SRCREV from release to release then rename the recipe t=
o represent version in it might be
> better.
>

Agree, and please also include tag=3Dv{PV} in the SRC_URI.

>>
>>  inherit autotools pkgconfig lib_package
>>
>> --
>> 2.43.0
>>
>>
>>
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123227): https://lists.openembedded.org/g/openembedde=
d-devel/message/123227
> Mute This Topic: https://lists.openembedded.org/mt/117131892/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

