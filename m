Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 498E8C48292
	for <webhook@archiver.kernel.org>; Mon,  5 Feb 2024 17:44:58 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web11.297.1707155095072114846
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Feb 2024 09:44:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SLOmKzqX;
 spf=pass (domain: gmail.com, ip: 209.85.210.41, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6e118b528aeso2301155a34.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Feb 2024 09:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707155094; x=1707759894; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GYPNAERWAkbn8qYCmXmpT8DI22sO7jJYy/6+XyxjrjE=;
        b=SLOmKzqXvk1v/e3LRjAiUlRCmWzaapYW/CNSBaHSbQGxrwAoZVUCcHAsy4D6waBbUv
         HtbyUsm/PySUqeK/2ABS9jiKraT+xNdbUTH0RnE8oDu4POq0EUjP0ICsvYEc1sqhSaD0
         Cu0u3ARsdwfITey0Y6RwGYRLQSks7hu4ddTdj0SYyXkVyMXwZAWeP4rdBHqjoYwdNu13
         gf9ZwMZyVjTkRKPkN++yGsiJLFoWsMjkjBysIScI6JUhtA5+D6csHAQ2cvj8dvBbBhSe
         gsuORnNOeO+T86ksfUX9AquewOMQXlEf/tvqMIuwQ2BWGUlLJRQ3QbwGb1Ha8jxk5o3A
         sbLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707155094; x=1707759894;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GYPNAERWAkbn8qYCmXmpT8DI22sO7jJYy/6+XyxjrjE=;
        b=FIUuxrYQ9nx/Xr+YJS7rWuACflKwU+JRuwpTNR1fE0b7/ReK5AGI8HPqGAFFrUWRlW
         CaaIAw9Ro/FW/khnkfWL/Emy0NsJKsbDIEexrXTr1e0yo4StMRQI24/N3t7nUtG35EMI
         tbBWPPELnDlsuY7EJTdiDOEvsV14o3PqJymDg36XTUjh0z+PiOKOxBy0XpeMKnwh3oQw
         DCrUvLlKO/uca1DeZ+dEdydYJCpNlnu+y8ryNakslUdHhxIIMjCwioXtpdPsPO4b7pdv
         XzDxuy8W/OYPfFcsN5d9y7i5CRuVZ2w39IZT7+/S9aibv3OujVoWMZP2xFf3/K2nTGMJ
         6DsA==
X-Gm-Message-State: AOJu0YxAC5FCDCcV6LYXoeWZWm3ecH6rU+zUTvBef3WuAbYWiw5WeMdX
	7GNvGZQ/AdAP4EXfWaohkSfqEOPLl7vEp8fwDT9738HUeUO6tEgeUeREhKFExe1hwUlTKAHIDV3
	WbYiQWDZniO6wtcf5ybS5e14IG9Q=
X-Google-Smtp-Source: AGHT+IGRZaWGCZsPzp1YeDeAo6dy5motV252BaP8rxMp/Fi2fOTTWBrKZ0XcgoCuwk5xhpRVWblkzzK1tYwqhdS5bVg=
X-Received: by 2002:a05:6870:5688:b0:219:3e93:1c33 with SMTP id
 p8-20020a056870568800b002193e931c33mr458953oao.12.1707155094196; Mon, 05 Feb
 2024 09:44:54 -0800 (PST)
MIME-Version: 1.0
References: <20240205125829.152301-1-dev@g0hl1n.net> <CANx9H-DF58NnD=2qWRsOCJENTy2H4700Ba1+TZMukrxB=woJFA@mail.gmail.com>
In-Reply-To: <CANx9H-DF58NnD=2qWRsOCJENTy2H4700Ba1+TZMukrxB=woJFA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 5 Feb 2024 09:44:28 -0800
Message-ID: <CAMKF1sqH8CHESnv+0XCMP-mui46OiVZ3ADbViEb7Mc6=twU5Jg@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 0/5] Add python3-httpx support
To: Tim Orling <ticotimo@gmail.com>
Cc: dev@g0hl1n.net, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Feb 2024 17:44:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108576

On Mon, Feb 5, 2024 at 7:55=E2=80=AFAM Tim Orling <ticotimo@gmail.com> wrot=
e:
>
>
>
> On Mon, Feb 5, 2024 at 4:58=E2=80=AFAM Richard Leitner via lists.openembe=
dded.org <dev=3Dg0hl1n.net@lists.openembedded.org> wrote:
>>
>> This series adds support for python3-httpx and its dependencies.
>>
>
> Can you look into adding ptest also for these new packages? It doesn't ne=
cessarily block adding them, but we don't want to keep piling on technical =
debt of more recipes without ptest.

I think this is a good idea. We run ptests for meta-python regularly
as acceptance and do find issues these days. So adding ptest would
be good here, perhaps for meta-python it could be made a needed thing
for new recipes.

>
>>
>> Richard Leitner (5):
>>   python3-socksio: add recipe for v1.0.0
>>   python3-anyio: add recipe for v4.2.0
>>   python3-sniffio: add recipe for v1.3.0
>>   python3-httpcore: add recipe for v1.0.2
>>   python3-httpx: add recipe for v0.26.0
>>
>>  .../python/python3-anyio_4.2.0.bb             | 23 ++++++++++
>>  .../python/python3-httpcore_1.0.2.bb          | 26 +++++++++++
>>  .../python/python3-httpx_0.26.0.bb            | 44 +++++++++++++++++++
>>  .../python/python3-sniffio_1.3.0.bb           | 12 +++++
>>  .../0001-Unpin-flit-core-dependency.patch     | 21 +++++++++
>>  .../python/python3-socksio_1.0.0.bb           | 10 +++++
>>  6 files changed, 136 insertions(+)
>>  create mode 100644 meta-python/recipes-devtools/python/python3-anyio_4.=
2.0.bb
>>  create mode 100644 meta-python/recipes-devtools/python/python3-httpcore=
_1.0.2.bb
>>  create mode 100644 meta-python/recipes-devtools/python/python3-httpx_0.=
26.0.bb
>>  create mode 100644 meta-python/recipes-devtools/python/python3-sniffio_=
1.3.0.bb
>>  create mode 100644 meta-python/recipes-devtools/python/python3-socksio/=
0001-Unpin-flit-core-dependency.patch
>>  create mode 100644 meta-python/recipes-devtools/python/python3-socksio_=
1.0.0.bb
>>
>> --
>> 2.40.1
>>
>>
>>
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108574): https://lists.openembedded.org/g/openembedde=
d-devel/message/108574
> Mute This Topic: https://lists.openembedded.org/mt/104175047/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

