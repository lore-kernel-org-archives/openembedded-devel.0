Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 392B2C4167B
	for <webhook@archiver.kernel.org>; Wed, 29 Nov 2023 05:32:11 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web11.25101.1701235929270313675
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Nov 2023 21:32:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y5sBmIHM;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-1fa26074783so2323345fac.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 21:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701235928; x=1701840728; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hYtYIp3i0P83Gegbull9pmewZTQS2AFin6VaAipFHrs=;
        b=Y5sBmIHMB/g4s2BT15L907GJVimT/mIEwsDaKE8uzB8VZ/4COqWJhpayZLQTDN24Mk
         QyQQZgyToOqzcwGAZHowzI3JfVfgA54x/aodHXbnzqzwQXBVvrJ7lyzMr8awAUIsl2G6
         oKvk0ig6+GCEjOR8L4HrLTV9SHautIBwX93RvgmlLdsaHBZxs8U1vV5dZpa3LbH9kqHW
         OPf14CubTx8A7OHpJBddsZyO+mPT8CXsYNGa2bVCQgE61n/Q9hoq0wTVFsk32BbhlPrI
         3NE9ZQSnj9jzDFjbI01GavJ0dxrDIitbaVvOJdIiSa0jb4LHTQo2i/ZPnIx7F9uu7XoU
         J8MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701235928; x=1701840728;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hYtYIp3i0P83Gegbull9pmewZTQS2AFin6VaAipFHrs=;
        b=YkjDQ/Zr2kO4x1Va49Rrrg4Bl0FjCC5xWA/aA0CeSTTHXAq6W0t3wtAoII2sULwfq3
         5S0x2yGmG+VxZUihHVITUUD4/sS0nBrgex8jxNo8tpqmnfVbZnIu5hTElsCIz28eTAvT
         NRvw+hGbPPNCfZiFL3qO8xpyQk9bqrvv6lRkm0T6UQtzdA+wI+OdC5FE5tVHnmj3wx1R
         LMqZRG28KJX75SGHHAgvqeqbhikFcwYhPeYeHcEAe7aTVL+AWBKQRrfYR6QqZv3GBXPC
         +NWVFhBanniOq2GFe4MJW9oaBmBDqst9hxBBJS2DfqJ7r1XOfPwbYQc9pO9NkuCx0gix
         Hw/Q==
X-Gm-Message-State: AOJu0Yxi3aFN8EbtYr/i1qLnz/gCCrxUTLqF5AH9+jrPnrHFkAzQNzOt
	io46QAtxYv61rnd09oAbvOovOz59/E4cePnTk3I=
X-Google-Smtp-Source: AGHT+IHAvBGcAKp63FFyCjFF+JRAVDvN4Kuz05P7FjLmi+guwP+EvS2WnuHur2W+Q0vN9vxcbCS41ziEWITeNgLuH3s=
X-Received: by 2002:a05:6870:568a:b0:1ea:85a:db2e with SMTP id
 p10-20020a056870568a00b001ea085adb2emr22835265oao.45.1701235928354; Tue, 28
 Nov 2023 21:32:08 -0800 (PST)
MIME-Version: 1.0
References: <1701160714-28412-1-git-send-email-wangmy@fujitsu.com>
 <170121573096.1187527.4630232823668380798.b4-ty@gmail.com> <CANx9H-Cg6wAgafNMVRAWGMsH3NCoEr7x92cMmQ6DjO6Shdp95A@mail.gmail.com>
In-Reply-To: <CANx9H-Cg6wAgafNMVRAWGMsH3NCoEr7x92cMmQ6DjO6Shdp95A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 28 Nov 2023 21:31:41 -0800
Message-ID: <CAMKF1sps+xAsL+_Jw6JzS8jY6vQsrEtDBTkxrLrYg7S6DhwSjg@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-pydantic: upgrade 2.5.1 -> 2.5.2
To: Tim Orling <ticotimo@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Nov 2023 05:32:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107131

On Tue, Nov 28, 2023 at 8:43=E2=80=AFPM Tim Orling <ticotimo@gmail.com> wro=
te:
>
> FWIW, this is not run-time useful because of the missing python3-pydantic=
-core dependency (which requires 'maturin' backend).
> Since https://github.com/pydantic/pydantic/commit/594effa279668bd955e98f1=
cd5c036b37d3bbd40
>

Adding ptests might be good to catch runtime errors. Perhaps after
maturin backend. There is no easy way otherwise to check runtime
validity.

> Sadly, the build does not report any issues and this has been lurking qui=
etly for quite some time. There is no reason to skip this
> particular update. The issue crept in quite a while ago.
>

> This will be corrected in the coming days as python3-maturin and a python=
_maturin.bbclass are added to oe-core to enable
> building the python3-pydantic-core package. Backporting will have to be d=
one in a mixin layer.
>
> On Tue, Nov 28, 2023 at 3:55=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wro=
te:
>>
>>
>> On Tue, 28 Nov 2023 16:38:34 +0800, wangmy@fujitsu.com wrote:
>> > Changelog:
>> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> > -uprev pydantic-core to 2.14.5
>> > -Add ConfigDict.ser_json_inf_nan
>> > -Fix validation of Literal from JSON keys when used as dict key
>> > -Fix bug re custom_init on members of Union
>> > -Fix JsonValue bool serialization
>> > -Fix handling of unhashable inputs with Literal in Unions
>> >
>> > [...]
>>
>> Applied, thanks!
>>
>> [1/1] python3-pydantic: upgrade 2.5.1 -> 2.5.2
>>       commit: 0260e1498e475899d1c13c05f928c5a886d151c4
>>
>> Best regards,
>> --
>> Khem Raj <raj.khem@gmail.com>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#107117): https://lists.openembedded.org/g/openembedd=
ed-devel/message/107117
>> Mute This Topic: https://lists.openembedded.org/mt/102847338/924729
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [=
ticotimo@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

