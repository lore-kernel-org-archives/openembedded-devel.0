Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A8DCE7719C
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 08:02:38 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.13975.1736496149884544130
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jan 2025 00:02:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H78leVGD;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53df80eeeedso1700016e87.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 00:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736496148; x=1737100948; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ySzzlYINyB/LvvjCXs8QtUa5Lul3dOVgarbgeKo71Wg=;
        b=H78leVGD1JlumqFtjp9g9q0IB7q1x/39MpraHgimPy7TJ+a6va1wWOxRCIJ679yf8F
         Ea+oAImePVjb0OfEbVfhWX4a0HswwrSmOGc/MaYKmLNCtqpaJpkMaXjdolz4Cejctx6v
         f86f00PxOqh/H/9DawzIauN/rHr9LNnQZESug59rXlKcAPaFG4kBafeO/QBntCosuR4c
         WrCMmaLoLT9FDpyPYfZNvQMAAu8EiZ9qKHCrbw2H18frgEbNAG8OAiSe20rH2HGPGyk0
         nSei0rvM6CAChAqfx9X/jgYU9rMQhsFSUnqNPTVUfotP93hON9/s/EApcY4pD4XXo+KM
         USUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736496148; x=1737100948;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ySzzlYINyB/LvvjCXs8QtUa5Lul3dOVgarbgeKo71Wg=;
        b=wDQLyNznEegCpPPL90FCbmli6b6BJV0WRAh9spd3qURk91rm/+cQ/Dg8OOdaQNL0mJ
         FpNpVEsZVGx/Pj1v6f92X1aXKnjrIkJn/5CKTksx5N4NodnhD9n0sbpZ7IQhnfZJ/m54
         zkrdG5Vzg5deZd4eoepQ8dRQ5xTBVabilwK3CrQ6B8MRAX99xAt+8VN6aqDCW/lmXRIu
         YclavRYO+yaPGfuN/b8muaT5jKD3mgewV4PtmrWlErZpUdXFg41H/zs21g9oZaJl97e1
         +GBmHm1rw0iv9bBOC6Z4lU+Zr72dSMdkUz+QUqVuIZ1CDKONk47qJ0YmIZcMHDbbyrV+
         Htjg==
X-Gm-Message-State: AOJu0YwM67ugX7CFaNk18d82fyS2i2eYD5A2S4DbkOK044+TnmtndppD
	Amd/MqjpPlBxzgtWpjkJB0nL7ja64OyhlRvHmfATGYZXE8dRYdPN78cXphpHCIozbPjBefQKXv6
	ZCowUI9XntfcMmNJeiOG4V6CaR8I=
X-Gm-Gg: ASbGncs91RGKO8KAmsfm8ELIq9WcyuiifWpTj7Rlh0hL1csIfiO/mcn7B08KI/F9uhK
	rL10TocvcmPtQKfsw4TCCxWhTOT/fbKfAqYkW2sec
X-Google-Smtp-Source: AGHT+IGD/izif9JPQNmegNApbGMJkqOacl+l34JdBXpUwERaELtyU35pqKqvv066x0HtxovmSi5UjqhnKp8YVkr/GxY=
X-Received: by 2002:a05:6512:33ca:b0:53d:f1cb:6266 with SMTP id
 2adb3069b0e04-54284546a9emr3047408e87.28.1736496147410; Fri, 10 Jan 2025
 00:02:27 -0800 (PST)
MIME-Version: 1.0
References: <20250109232946.1556083-1-raj.khem@gmail.com> <20250109232946.1556083-4-raj.khem@gmail.com>
In-Reply-To: <20250109232946.1556083-4-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 10 Jan 2025 09:02:14 +0100
X-Gm-Features: AbW1kvb_v0Y4HviC5f5-I9yabN9gkvelw63TrRo39wFqVsxgOV191hqXWqju94I
Message-ID: <CA+chaQf9R+nrtURSz-dBGv02syyf0_fB0cS+RSbrWMsZ5=5fGg@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCH 4/6] mpd: Drop adding +git to PR
To: raj.khem@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 08:02:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114764

Small typo in subject, PR->PV

On Fri, Jan 10, 2025 at 12:29=E2=80=AFAM Khem Raj via lists.openembedded.or=
g
<raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
>
> We are using latest release SHA1
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.16.bb | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.16.bb b/=
meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.16.bb
> index 51c459cffd..bf95f41b26 100644
> --- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.16.bb
> +++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.16.bb
> @@ -17,7 +17,6 @@ DEPENDS +=3D " \
>      expat \
>  "
>
> -PV .=3D "+git"
>  SRC_URI =3D "git://github.com/MusicPlayerDaemon/MPD;branch=3Dmaster;prot=
ocol=3Dhttps \
>             https://github.com/mesonbuild/wrapdb/releases/download/fmt_11=
.0.2-1/fmt-11.0.2.tar.gz;name=3Dfmt;subdir=3Dgit/subprojects \
>             https://wrapdb.mesonbuild.com/v2/fmt_11.0.2-1/get_patch;downl=
oadfilename=3Dfmt_11.0.2-1_patch.zip;name=3Dfmt-meson;subdir=3Dgit/subproje=
cts \
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#114760): https://lists.openembedded.org/g/openembedde=
d-devel/message/114760
> Mute This Topic: https://lists.openembedded.org/mt/110526837/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

