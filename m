Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FBC5E909AC
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 14:23:17 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13006.1771338194404867924
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Feb 2026 06:23:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FnDha0Kr;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-59e6491f1a2so4479166e87.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Feb 2026 06:23:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771338192; cv=none;
        d=google.com; s=arc-20240605;
        b=ZHCJPdvrlzwoYKlJmy/ICRmz9B5gEkbK+/4t1fahzQxdwG2SmJEp4AUfBt+Ysx8nDK
         q+Ik/nqjwWwZ5N8Ns2239asbqbMlenCA6IwxaiWm04ipbxVchcvnDax4wwvwThAbNA/H
         TqRRjA6oApAqPpbmFxR4QEyKKUTlsJQT5m94chbUp2e9S0wcWv543Jpn1QuA86DXd1sP
         UMLrP/L2ArtWDobnXXrLsuBy5nQF5rZ+3mOFKt2CexTaI1fqMT+lUJ49EJvClfbQ1NSO
         ChSrZ1XFcySAheo0Tv07BLQJsMC4QZXFNwpCMMJBn3An7e6EmEFBWWusXyrPX1hQiCyl
         DcHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eilSE3vu9Y+8Pn/Krv7FoHJuVNvgJlU2Xh9HgSx/Czo=;
        fh=gNJnxlK2y1JLVZ8XCCHKMQIOJhlgqkC6jL6DxvWrqmI=;
        b=e4xu0FzJinKfIG3qw8hald5Nt5vx0CsNygZevgmuSq+W4TfC/ppX5wuu0PO0WBCEjB
         jKyKbmNJPsO0C0DRnTLktBXLE8Pm3n/TxwdlkeAWwmEGUe9xbcAX/ElmJIp5oQzudPNr
         FUYMbngdOgtU5k+TUAl3a+leaPS76L/8MQc7VR+Z7iPUry3scBOsD61LLzMLLwut1UTf
         s5cMO+aPfcuUL1lpC5DSB7fjH4/Y6UvA8p5jPNQ9cRL/+jPJJisnOoaQqWqTG3Tc1Vhc
         tK9iCfVJklexAx2Od4J5Rx/5gAnDSWDPeLQEgG4gSyS2FXyCfrB2Tcenpmy5ScxZ5aq5
         zWNg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771338192; x=1771942992; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eilSE3vu9Y+8Pn/Krv7FoHJuVNvgJlU2Xh9HgSx/Czo=;
        b=FnDha0KrMYqJlIXfAZhN6d8F/B+pjC1NUBkc/HFGbtLoL7/Y0Efy+pUheClHjG6Ypg
         0YMgi4xb3TeHLSekkqwtMqDorXC2o11eOTT0P+h0cHJImtuSIt+DdHkrplrUhhp+TQ+3
         zhvDK4kczvjd2WuMWAHrj6/7MnVhUH3LWKf5k9uX+imPSfFe8g4Gnnt8j0ObJh4E0sHK
         xqU/ONxriXLGCsLDF+GcGYPmCTuL6dGvR2ZsBhCsmJiWIPl43lsTjC3H9q36SOy7A92K
         VSKJrjt+w0bvflDY/WldkOEray2mNxsRlibeRvcSrNfk3LBUypBrfgGp3jAVp3nw3Iqd
         sF2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771338192; x=1771942992;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eilSE3vu9Y+8Pn/Krv7FoHJuVNvgJlU2Xh9HgSx/Czo=;
        b=grFITB+vRODBwAuFKPdIRWTzWzkf7n37x1JlTOZPbkLtORBDOrgKNZ6XNR/88YR1Cf
         IagP26uIUg3/SWiqytL8E32RRsv5CcdDqHivyaDsAj4d9QJGi/Jdzm8haSU8rHQeMPQp
         GzBg4ULw1TQHZwYD5pkvCxN5XQfvC+nulVOGgr1exEGz/tYwsv/iQNbqcyb8jj5+pFs/
         3uUjvpZesLs7dmfM+eFABQGUiwyshxIoEvb9wzd5lxfcNruuhArFzdY4Xsf+AkCMebdB
         DQxO91Zrrpf5He1yCufdijQF6Zth1txzD9ar39y+fGz+mQMmGED5ATtnIB0e9Nr1qx0+
         dc3w==
X-Forwarded-Encrypted: i=1; AJvYcCUewSIDuF/UpUVt72NwnUZKaQ4TIsRxnhM+Jo6j4xDdI6TuBiuX0kT8AdvbWEkk+/0kWlRF90AXTBiDelkWqg8GZlQ=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzDLGiSEAMm811H1Nc9QAlFAwUPOeKrqfW9LSqe8U912BCCjLzn
	UsnkiIbwrpdoONOiLr61kx1YBV4tDdx5CCXl3mYRJC2IBLPKbxKEiAiZfiOAL4syJRpDxpcjhiK
	Crip9ak3hlVJZTEp6iTAnaXJFkBg8a6Q=
X-Gm-Gg: AZuq6aIleI4ZhVovPLsVbIcHPVZNNxQJzvUGmm18fCQ/HR1m1j3SDdlYqkO2hjmyiR3
	+i6gv+d3rQ13fr7+spEICn4Ekt5op/Nu5QvVybG7ZCa6n3zyHM4NJ0q220l4+AfmwUI0gDnuu66
	ZRo+V/O1lkijFLD1pWGdMNPQaPfMEtmc3RHztkiuJMUcpu0kgjZpCUchpynAnVIpTFMKwmkQ7Hu
	NROCygRCgPhv2mnw2AkMlx1swFHAM3ryZgQbbSjpgIt2N6VAtxVGmgUJ7qUaOTmDWEjbG78pJ7s
	Zal731zt4BL7nhlKecod
X-Received: by 2002:a05:6512:2316:b0:59d:dffb:cd70 with SMTP id
 2adb3069b0e04-59f6cfdad33mr3873931e87.21.1771338192184; Tue, 17 Feb 2026
 06:23:12 -0800 (PST)
MIME-Version: 1.0
References: <cover.1770970700.git.anuj.mittal@oss.qualcomm.com> <CAMKF1soLJVcZEOcLzE1MUERuAgSv0nq86xWy2ssP6933t1Mf+w@mail.gmail.com>
In-Reply-To: <CAMKF1soLJVcZEOcLzE1MUERuAgSv0nq86xWy2ssP6933t1Mf+w@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 17 Feb 2026 15:23:00 +0100
X-Gm-Features: AaiRm53DUz59qctKN8mfHSBMrvPe0PfHgTozq7lVXlrcjh2u6mPhA6aDQBCeb78
Message-ID: <CA+chaQdLs=1ua6CpS1uQPY-sGFQwVx=AGVQ8GuHd3aPF1c8-jQ@mail.gmail.com>
Subject: Re: [oe] [PATCH 00/73] Scarthgap pull request
To: raj.khem@gmail.com, Gyorgy Sarvari <skandigraun@gmail.com>
Cc: Anuj Mittal <anuj.mittal@oss.qualcomm.com>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Feb 2026 14:23:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124453

On Mon, Feb 16, 2026 at 9:22=E2=80=AFPM Khem Raj via lists.openembedded.org
<raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
>
> Merged now thanks Anuj
>
> On Mon, Feb 16, 2026, 1:55 AM Anuj Mittal via lists.openembedded.org <anu=
j.mittal=3Doss.qualcomm.com@lists.openembedded.org> wrote:
>>
>> Please merge these changes in scarthgap. Tested locally with
>> qemuarm/qemuarm64/qemux86-64 and on autobuilder.
>>
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1305
>>
>> The following changes since commit 7a5075cef77b5f7af454e9868e1d0019f2fd1=
394:
>>
>>   gnome-keyring: set CVE_PRODUCT (2026-01-26 11:16:37 +0530)
>>
>> are available in the Git repository at:
>>
>>   https://git.openembedded.org/meta-openembedded-contrib anujm/scarthgap
>>   https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Danujm/=
scarthgap
>>
>> Anil Dongare (2):
>>   php 8.2.29: Fix CVE-2025-14178
>>   php 8.2.29: Fix CVE-2025-14180
>>
>> Gyorgy Sarvari (52):
>>   sox: patch CVE-2017-11332
>>   sox: patch CVE-2017-11358
>>   sox: patch CVE-2017-11359
>>   sox: patch CVE-2017-15370
>>   sox: patch CVE-2017-15371
>>   sox: patch CVE-2017-15372
>>   sox: patch CVE-2017-15642
>>   sox: patch CVE-2017-18189
>>   sox: mark CVE-2019-1010004 as patched
>>   sox: patch CVE-2019-13590
>>   sox: patch CVE-2019-8354
>>   tigervnc: sync xserver component with oe-core
>>   tigervnc: ignore CVE-2014-8241
>>   tigervnc: ignore CVE-2023-6377
>>   tigervnc: ignore CVE-2023-6478
>>   tigervnc: ignore CVE-2025-26594...26601
>>   fontforge: patch CVE-2025-15279
>>   fontforge: patch CVE-2025-15275
>>   fontforge: patch CVE-2025-15269
>>   fontforge: patch CVE-2025-15270
>>   ez-ipupdate: patch CVE-2003-0887
>>   freerdp: ignore CVE-2025-68118
>>   gimp: ignore CVE-2025-14423
>>   gnome-settings-daemon: ignore CVE-2024-38394
>>   imagemagick: patch CVE-2025-66628
>>   libcupsfilters: patch CVE-2025-64503
>>   mongodb: upgrade 4.4.29 -> 4.4.30
>>   mongodb: ignore CVE-2025-14911
>>   netdata: ignore CVE-2024-32019
>>   proftpd: ignore CVE-2021-47865
>>   python3-aiohttp: patch CVE-2025-69225
>>   python3-aiohttp: patch CVE-2025-69226
>>   python3-aiohttp: patch CVE-2025-69228
>>   python3-django: patch CVE-2025-64460
>>   raptor2: patch CVE-2024-57822 and CVE-2024-57823
>>   python3-tornado: mark CVE-2025-67725 patched
>>   python3-virtualenv: patch CVE-2026-22702
>>   gnome-desktop: upgrade 44.0 -> 44.4
>>   gtksourceview5: upgrade 5.12.0 -> 5.12.1
>>   gnuchess: upgrade 6.2.9 -> 6.2.11
>>   gnome-calculator: upgrade 46.0 -> 46.2
>>   gdm: upgrade 46.0 -> 46.2
>>   mutter: upgrade 46.1 -> 46.9
>>   mutter: fix profiler PACKAGECONFIG
>>   gnome-bluetooth: upgrade 46.0 -> 46.2
>>   gnome-shell-extensions: upgrade 46.1 -> 46.4
>>   nautilus: upgrade 45.1 -> 45.2.1
>>   gnome-tweaks: upgrade 40.0 -> 40.10
>>   tigervnc: mark CVE-2024-0408 and CVE-2024-0409 patched
>>   python3-django: upgrade 4.2.27 -> 4.2.28
>>   gnome-commander: upgrade 1.16.1 -> 1.16.2
>>   nodejs: upgrade 20.18.2 -> 20.20.0

This introduces patch-status issue with missing Upstream-Status in
meta-oe/meta-oe/recipes-devtools/nodejs/nodejs/0001-Revert-stop-using-depre=
cated-ares_query.patch

patch-status isn't in default ERROR_QA for scarthgap, but can we
please add Upstream-Status here?

I can send a fix if needed.

