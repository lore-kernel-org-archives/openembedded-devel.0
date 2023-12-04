Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1008FC4167B
	for <webhook@archiver.kernel.org>; Mon,  4 Dec 2023 22:46:15 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.web10.85425.1701729974056412315
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Dec 2023 14:46:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nJ602+3Y;
 spf=pass (domain: gmail.com, ip: 209.85.210.49, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-6d858670630so2699267a34.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 04 Dec 2023 14:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701729973; x=1702334773; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B7TqVoWzh4l/urIMaaajcuL7o54xfp+pvKGA/E010/Y=;
        b=nJ602+3Y6PdeX4O1NPiESBDFZuZq54uZV/i4Bjiyt70U1XvwEZxM26FJ3sYbE/SUQ/
         izJ8HUGZRRrwIax1p2vUSSA78zXmfAhxBkZe9Z7fexImgNuHt5hhSgol68do3V1ontCj
         kWdXuzxPuRqLFEWyzeTIvej0Zc+1T4BwjnERkMGfHUwdIG3KmuvU5TESxh4P1mCqPCga
         Z92cg/3wWgnkzUN1zxXVq5XUDSK/V1X8Ro8jCx+BogG/CNvBUeQ/ttND562rXj+OXJqJ
         A1JHMBpBxLHwLNpYWt/4Vw2su/u7Wh3QxQZDmctXlQd62ZrkuZx/tHfJ2gNmb6xBoaka
         W5TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701729973; x=1702334773;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B7TqVoWzh4l/urIMaaajcuL7o54xfp+pvKGA/E010/Y=;
        b=NQWZpuUIjThyL+6K5mDLJQ65iUIOdjc0ahtCW2iNbp/5Re/fBIaAMiAxlttLXioUwD
         IdSNgFw53auB6kq0BhT+ZimM1H6WxhhhqNTqnjenM7UOGwSCtMkQ4XHUGzkuJSjcVxIl
         M+NsCXrXR/R6IIKN7mrB/R5GQcOHevxP3o2A4IYPfy3HJn0kSvt9318bVEI+aRlVaGVC
         Bs/Zy6bp+Da4MdQaP5AGlqZPrORAA4a5oANWevEdwv8NxdaBIvG0lkYqQhBfhgyC+lI9
         r8byGlh7SL8MNjE+YMID5Z9My7rogz1Rh7uZsKhqCxEiVemfoT7sK0oXrxybOLLRrO9s
         pX6Q==
X-Gm-Message-State: AOJu0YwoUyx42L0N4IEcoLZwceEem/oDn81PwhRXm1lQuIFK9yzSrAP6
	qjE5jxzmOXgFcl43iOQRkUe+K6VqH0MJgl767qY7CaR58FI=
X-Google-Smtp-Source: AGHT+IERFCm4mqiDtQ3aU7nLwl1kLv76WSEaq4a1OBy29x9JxlUREe5eq5MUQlSLM+GE3MNUrBQO4MOZRcB0lqUXPz0=
X-Received: by 2002:a05:6870:44c9:b0:1fb:75b:99c8 with SMTP id
 t9-20020a05687044c900b001fb075b99c8mr6859443oai.119.1701729973059; Mon, 04
 Dec 2023 14:46:13 -0800 (PST)
MIME-Version: 1.0
References: <20231204141856.2977926-1-p.chernikov@yadro.com> <CAMKF1sqszUOsKDu42Z73AvLBMta4tauXCaCm_ZJbOa7UXVPUzg@mail.gmail.com>
In-Reply-To: <CAMKF1sqszUOsKDu42Z73AvLBMta4tauXCaCm_ZJbOa7UXVPUzg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 4 Dec 2023 14:45:46 -0800
Message-ID: <CAMKF1sqf=jKN3tbeO9nn2Gc2dgLh8Ctaw=_BwaLVHoahAg_KpQ@mail.gmail.com>
Subject: Re: [oe] [PATCH] abseil-cpp: remove -Dcmake_cxx_standard=14 flag from extra_oecmake
To: Petr Chernikov <p.chernikov@yadro.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Dec 2023 22:46:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107215

here is a problem which might be related to this change

https://errors.yoctoproject.org/Errors/Details/745165/

On Mon, Dec 4, 2023 at 7:22=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote:
>
>
>
> On Mon, Dec 4, 2023 at 6:23=E2=80=AFAM Petr Chernikov <p.chernikov@yadro.=
com> wrote:
>>
>> Old versions of abseil-cpp could not be compiled using C++ Standard 17.
>> For now this cmake flag is not needed.
>
>
> Can you check if this works with clang compiler as well
>>
>>
>>
>> Signed-off-by: Petr Chernikov <p.chernikov@yadro.com>
>>
>> diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb b/met=
a-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
>> index f847ebf15..4705b6f8c 100644
>> --- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
>> +++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
>> @@ -26,7 +26,6 @@ inherit cmake
>>
>>  EXTRA_OECMAKE =3D "-DBUILD_SHARED_LIBS=3DON \
>>                   -DBUILD_TESTING=3DOFF    \
>> -                 -DCMAKE_CXX_STANDARD=3D14 \
>>                   -DABSL_ENABLE_INSTALL=3DON \
>>                  "
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#107204): https://lists.openembedded.org/g/openembedd=
ed-devel/message/107204
>> Mute This Topic: https://lists.openembedded.org/mt/102970930/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [=
raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

