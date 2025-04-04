Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39473C3600C
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 00:56:59 +0000 (UTC)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
 by mx.groups.io with SMTP id smtpd.web10.1349.1743728214566337531
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Apr 2025 17:56:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Inv0aH1V;
 spf=pass (domain: gmail.com, ip: 209.85.161.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-601b1132110so819263eaf.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Apr 2025 17:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743728214; x=1744333014; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RMp/1tIuS3A9yJdAmHaf3EksPpym+abYdMcbimzghYU=;
        b=Inv0aH1VhuKSUf7WTkkytXlPzCBvJ3QTW1Z0n/4ZcnyLT5khVPkQrTs2B4H3IPfg7u
         u0dyjSTKEIw/xSXJ1pFklDCUJvx+MUvELOwEeFr0oLJsYHshEQiUoA1AcLhKnK7/DrHS
         YjTZiRT6Jr5Cq4kYmKygtwu5IBzk5Mo5MSQjxmCiB3v9AnPmrSTUpaWBpQeBuH7swdbX
         +Yv/dKt3JLGiimJeF5VmCZRrfRt2RGtMccGsenY02IjHr17wd3pHBHg2WS30JHPbTbsb
         mund33mkstTvZfO+/g2AnlO3Yjifo06r2zrOfPl4XKKGR/5vxnYfUaHTMky88Zo7e0Cw
         Tp6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743728214; x=1744333014;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RMp/1tIuS3A9yJdAmHaf3EksPpym+abYdMcbimzghYU=;
        b=JzKkjA1A0TYOTeJt6FNFf3TvxJokKeMJDGPRdt0EcBNYFwELCepQVZqUsh5TU2LUTg
         YYMvrhm5ACI3uFeXOodFlVWrGiufTYG97coFTDV3mVIQe1oySt1BeaYzsRTDHVs2lqQM
         /fXRTYieq/ig03G1RR1KK/PSY+01bESaKmcREiLsIOdvKkuTjodw+zuWsmKXGedEG0iW
         70cqes2/CR1HR5bzvxx/gttWkHVhh/zbdzEoyp/7QrPWIBR7Om/xnwSC7DG1/y/HyIJz
         iBRzD86kCdVKWdk4znz3Lfxc2HObA84jPpOfzZ6Hh4B6ajsXnlezJ1m/vV3evmK4gMdQ
         K2aA==
X-Gm-Message-State: AOJu0Yx3H7vKnjyfKR7XZBXfVghPz1tiBMOw+NqK3k1GS/E9olQaOOXR
	AMF6IwLVfzZnaNJQZYjjdxxVWLM5h0IfqHOYZk2WZG8conF+fTQpDNRF4mOWga949KdyZnTf6hN
	g8MmKXed7fp3dA1WXtPqjxOZGiMrftg7Ia+c=
X-Gm-Gg: ASbGncsNfXTjW6zK6E5CAs50xPLR9xttYnXWgT28WP1LPgDhF5ymB4fliohSbV6CnYk
	+nbZ1aJdfAuneZcpLhhC9YWox9Jv5BddAUOyKBDFz9fCv9gm0754nnud2T7nFqkL86+zFXAoDqi
	2TeaFwbhhfM9Kp+s/KBqB2+lB7
X-Google-Smtp-Source: AGHT+IGIcQpgRjaBgbN+5AH5b0ao5Q983TIjNevKOhmgFCMSLoiuHAHbvnGDEKyckgIVfB0BPoN0mgqL7F3lx0igKkc=
X-Received: by 2002:a05:6820:810:b0:601:af96:36eb with SMTP id
 006d021491bc7-604156cc24fmr659084eaf.4.1743728213779; Thu, 03 Apr 2025
 17:56:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250403204412.1686638-1-Randy.MacLeod@windriver.com>
 <CAMKF1sqQBe535z056kEL6RSHqnaAgELjTPRghwfQo_1N+UPkmw@mail.gmail.com> <c13725c6-ebda-46fc-8241-c15455425cf1@windriver.com>
In-Reply-To: <c13725c6-ebda-46fc-8241-c15455425cf1@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 3 Apr 2025 17:56:27 -0700
X-Gm-Features: AQ5f1Jr1UkKbre2pda5Vk-EUl4mLCibZ5XkSeJ760d5CzMfxPr5QjGqE6RkewvQ
Message-ID: <CAMKF1sory-jGJB3QuboBfr9-9HP6VVWB_R-DmL+zxnSE9fVE2A@mail.gmail.com>
Subject: Re: [oe] [PATCH] valkey: update from 8.0.2 -> 8.1.0
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Apr 2025 00:56:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116555

On Thu, Apr 3, 2025 at 5:33=E2=80=AFPM Randy MacLeod
<randy.macleod@windriver.com> wrote:
>
> On 2025-04-03 5:03 p.m., Khem Raj wrote:
>
>
>
> On Thu, Apr 3, 2025 at 1:44=E2=80=AFPM Randy MacLeod via lists.openembedd=
ed.org <randy.macleod=3Dwindriver.com@lists.openembedded.org> wrote:
>>
>> From: Randy MacLeod <Randy.MacLeod@windriver.com>
>>
>> Release notes:
>>    https://github.com/valkey-io/valkey/releases/tag/8.1.0
>>
>> The license file checksum changed because upstream added the line:
>>    SPDX-License-Identifier: BSD-3-Clause
>> Add OECONF to avoid build-time checks for strcase[str|cmp], both of
>> which have been in glibc and musl for > 10 years so it's sensible to
>> default to yes.
>
>
> Why do they fail I wonder
>
> I dug a bit but wanted to get the package update in.

I looked a bit and it seems that gnulib got updated
https://git.savannah.gnu.org/cgit/nano.git/commit/?id=3Dc7033324a9e31d7b004=
54db04496880e889d32f0

which perhaps added new logic which is not working in cross compile maybe ?



>
> It's not a key package so whatever.
>
>
> ALSO: I need to resend with a corrected subject line!
>
> It's nano, not valkey - copy pasta!!!
>
> v2 sent.
>
> ../Randy
>
>
>>
>>
>> Adjust the patches using devtool and manually munge the Upstream-Status-=
es.
>>
>> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
>> ---
>>  .../recipes-support/nano/{nano_8.3.bb =3D> nano_8.4.bb}    | 9 ++++++++=
-
>>  1 file changed, 8 insertions(+), 1 deletion(-)
>>  rename meta-oe/recipes-support/nano/{nano_8.3.bb =3D> nano_8.4.bb} (75%=
)
>>
>> diff --git a/meta-oe/recipes-support/nano/nano_8.3.bb b/meta-oe/recipes-=
support/nano/nano_8.4.bb
>> similarity index 75%
>> rename from meta-oe/recipes-support/nano/nano_8.3.bb
>> rename to meta-oe/recipes-support/nano/nano_8.4.bb
>> index d1af89ef8d..1aae49d3b6 100644
>> --- a/meta-oe/recipes-support/nano/nano_8.3.bb
>> +++ b/meta-oe/recipes-support/nano/nano_8.4.bb
>> @@ -13,10 +13,17 @@ RDEPENDS:${PN} =3D "ncurses-terminfo-base"
>>  PV_MAJOR =3D "${@d.getVar('PV').split('.')[0]}"
>>
>>  SRC_URI =3D "https://nano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.tar.x=
z"
>> -SRC_URI[sha256sum] =3D "551b717b2e28f7e90f749323686a1b5bbbd84cfa1390604=
d854a3ca3778f111e"
>> +SRC_URI[sha256sum] =3D "5ad29222bbd55624d87ea677928b3106a743114d6c6f9b4=
1f36c97be2a8e628d"
>>
>>  UPSTREAM_CHECK_URI =3D "https://ftp.gnu.org/gnu/nano"
>>
>>  inherit autotools gettext pkgconfig
>>
>> +EXTRA_OECONF =3D " \
>> +    ac_cv_func_strcasestr=3Dyes \
>> +    gl_cv_func_strcasecmp_works=3Dyes \
>> +    ac_cv_func_strcasecmp=3Dyes \
>> +"
>> +
>> +
>>  PACKAGECONFIG[tiny] =3D "--enable-tiny,"
>> --
>> 2.34.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#116546): https://lists.openembedded.org/g/openembedd=
ed-devel/message/116546
>> Mute This Topic: https://lists.openembedded.org/mt/112047294/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [=
raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>
> --
> # Randy MacLeod
> # Wind River Linux

