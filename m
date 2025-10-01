Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFB20CCA470
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 15:55:56 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web10.748.1759334154533482258
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Oct 2025 08:55:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TceiH0CC;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-71d603a269cso365177b3.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 08:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759334153; x=1759938953; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R7N0AyYC9hvtp27lfZw5UvfNLNCgi7P93cOX5BU1kGo=;
        b=TceiH0CCZhiz1jkEZzJsTzg+vDP7s1kNeZudP4s5U0d1MZ3eCMokVXktwT6wApmoJv
         ucg7UeqyRRJ7m8mo9eCfspcAW0TJbdR/hVU0DCprJscrqz8SHN56/oFnydtvfodQOBJa
         WWu8jIcEPbiOeSr9w04zKUS4OYBf+X/ntGVRa1cyT1u361auYoayFMyQqDYohEa7aE+B
         zUrwvXvOu8H56US0ocDW8mITJ//uda2bFdNC8MQ+WdUlVvjc//BDkKu2GEuRtltwajVY
         dkbRudNdQ0Uae6cIUMdGxobuEuahLel0mmwKGdHNgcC11p9V9s/kZ8jFUTOjOXQwoY/Z
         C7mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759334153; x=1759938953;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R7N0AyYC9hvtp27lfZw5UvfNLNCgi7P93cOX5BU1kGo=;
        b=BMAJ4Q0H78KracS9FCxYYFYVCqbU5jgprX14SVvbTOnJbQc1E0kQ8hfob/EZdxOyDk
         kuSLHHYVyR9PXAWYqCRAcD1Golv2QuW4APcZ96TN4JHy4k+DMEtutoAaXcP4ooNLk33C
         xsuTigHeTASyhH94KXdNQUP8oZRQXtRk2pGMG23IeKpR+8j9ysjbRZRj85d1yAekVb00
         Ni/tSvaYkL7k0f4fQW/VLgmViUJRRd+bTZW0ZGQlEtXr/JE568y5bAsMPUo2iz6K4Ez9
         LVb39wYwU4DXsR7UfwpgT/SVIhbYtBQfmuXjS47HgGe1OkGi8Tl4qO7WVJgtrRrSWq+G
         hZqw==
X-Gm-Message-State: AOJu0YwX3AxjCm5mtc6g9/32eyXTxTMqJl+W1hh1Ca/JULgNJv8gCekf
	5phQjAdpkQesGJpmyRSFz34BagruVPMvpf13WRo2PDkBtQpNn9fBENLJF7VjyjZx3s3CK6hGypD
	4vm9SGga4eDJiVVX297lHW7ZLaiSRXMxF5RyJ
X-Gm-Gg: ASbGnctu8MlE1W+MSGLW1nTfN8Rp1cQ6derKWw6Wgi6rxUaYPo6nV0WkzwWd/CtJW8o
	N/iXrPcO58ji21LWM5N4TPaKPvR3Dy327XgugGMjUlI/guL7biDvmGAdpuSoGillLWFhLoiq0+E
	bTq1TeT6jHzHw1Dfr8eQ0XV2jbm+7geAPfeECa6MrjWWpgUO//7WrVTcXA4cEtNZCsY5Wb/e6CP
	JE55zO14UutawZmbATdLXlAFiPFzt7UQkxl7W+CPcwZ7O0yoECgMeUhRxK+w5tFcoLoiQMAKPx3
	CJfGVdCB9oxK3r9mYd3IcbrsIMfmkxJOpqJonAjNIJRTehPY
X-Google-Smtp-Source: AGHT+IHYx1WkWSC3eg3sO17/BK7BmvYa2Y6P4iM98M8lu9Wnnmd5FtsNpu7k7hNCxDb7TTgXzie9g2Ol60zpTjvVgFM=
X-Received: by 2002:a53:d8c4:0:b0:62a:b545:54b6 with SMTP id
 956f58d0204a3-63b700b906amr4287364d50.35.1759334153433; Wed, 01 Oct 2025
 08:55:53 -0700 (PDT)
MIME-Version: 1.0
References: <20251001135243.1490753-1-skandigraun@gmail.com>
In-Reply-To: <20251001135243.1490753-1-skandigraun@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 1 Oct 2025 08:55:27 -0700
X-Gm-Features: AS18NWBV3-cEzukp9U8ebXQPt6ynHmzF-5bic-j95dPJ8Fk4K-jXLcWX1eKkAPw
Message-ID: <CAMKF1srRU0mv69d6hrZDwWvenuvFNFUJYO4XupfB5_Ke1hx5ug@mail.gmail.com>
Subject: Re: [oe] [meta-oe][kirkstone][PATCH 00/25] Cherry-picks from Master
 Batch F
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 15:55:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120141

This series looks good to me.

On Wed, Oct 1, 2025 at 6:52=E2=80=AFAM Gyorgy Sarvari via
lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
wrote:
>
> This batch contains only CVE patches and generic recipe fixes (SRC_URI up=
date, dependencies...).
>
> These have been tested so far with x86-64 - testing with other platforms =
is still underway.
> If wnything would fail, will reply to this thread..
>
> Please let me know if you have any questions or comments about these patc=
hes.
>
> Thank you.
>
> ---
>
> Alexandre Videgrain (1):
>   openbox: fix crash on alt+tab with fullscreen app
>
> Bartosz Golaszewski (1):
>   python3-nmap: add missing run-time dependencies
>
> Etienne Cordonnier (1):
>   fsverity-utils: fix SRC_URI
>
> Gyorgy Sarvari (1):
>   nmap: add missing dependency
>
> Jiaying Song (3):
>   libconfig: switch source to GitHub repository
>   vlock: fix do_fetch error
>   softhsm: switch source to GitHub repository
>
> Justin Bronder (1):
>   tk: inherit pkgconfig
>
> Khem Raj (1):
>   nicstat: Use SOURCEFORGE_MIRROR in SRC_URI
>
> Lee Chee Yang (2):
>   libsdl: fix CVE-2022-34568
>   x11vnc: Fix CVE-2020-29074
>
> Markus Volk (1):
>   p8platform: unbreak do_populate_sdk
>
> Mingli Yu (2):
>   dialog: Update the SRC_URI
>   minicoredumper: correct the sysvinit service file attribute
>
> Peter Kjellerstedt (1):
>   paho-mqtt-cpp: Improve the license information
>
> Peter Marko (8):
>   audiofile: fix multiple CVEs
>   audiofile: patch CVE-2017-6829
>   audiofile: fix multiple CVEs
>   audiofile: patch CVE-2017-6831
>   audiofile: patch CVE-2017-6839
>   libmad: ignore CVE-2017-11552 and CVE-2018-7263
>   libmad: patch CVE-2017-8372 and CVE-2017-8373
>   libmad: patch CVE-2017-8372 and CVE-2017-8373
>
> Randy MacLeod (1):
>   libmad: switch links/SRC_URI to https sites
>
> Soumya Sambu (1):
>   gtk+: Fix CVE-2024-6655
>
>  .../paho-mqtt-cpp/paho-mqtt-cpp_1.2.0.bb      |   3 +-
>  .../fsverity-utils/fsverity-utils_1.5.bb      |   2 +-
>  meta-oe/recipes-devtools/tcltk/tk_8.6.10.bb   |   2 +-
>  .../dialog/dialog_1.3-20210509.bb             |   2 +-
>  .../libconfig/libconfig_1.7.3.bb              |   9 +-
>  .../recipes-extended/nicstat/nicstat_1.95.bb  |   2 +-
>  .../p8platform/p8platform_git.bb              |   2 +
>  meta-oe/recipes-extended/vlock/vlock_2.2.3.bb |   2 +-
>  .../gtk+/gtk+/CVE-2024-6655.patch             |  40 +
>  meta-oe/recipes-gnome/gtk+/gtk+_2.24.33.bb    |   1 +
>  .../libsdl/libsdl-1.2.15/CVE-2022-34568.patch |  28 +
>  .../recipes-graphics/libsdl/libsdl_1.2.15.bb  |   1 +
>  ...traversal-issue-in-client_calc_layer.patch |  56 ++
>  .../recipes-graphics/openbox/openbox_3.6.1.bb |   1 +
>  .../x11vnc/files/CVE-2020-29074.patch         |  27 +
>  .../recipes-graphics/x11vnc/x11vnc_0.9.16.bb  |   1 +
>  .../minicoredumper/minicoredumper_2.0.1.bb    |   2 +-
>  .../audiofile/audiofile_0.3.6.bb              |   5 +
>  ...ays-check-the-number-of-coefficients.patch |  45 +
>  ...ues-to-fix-index-overflow-in-IMA.cpp.patch |  43 +
>  ...multiplication-overflow-in-sfconvert.patch |  79 ++
>  ...ail-when-error-occurs-in-parseFormat.patch |  46 +
>  ...lication-overflow-in-MSADPCM-decodeS.patch | 126 +++
>  .../libmad/CVE-2017-8372_CVE-2017-8373.patch  |  69 ++
>  .../libmad/libmad/CVE-2017-8374.patch         | 830 ++++++++++++++++++
>  .../libmad/libmad_0.15.1b.bb                  |  12 +-
>  meta-oe/recipes-security/nmap/nmap_7.80.bb    |   8 +-
>  .../recipes-security/softhsm/softhsm_2.6.1.bb |   5 +-
>  28 files changed, 1429 insertions(+), 20 deletions(-)
>  create mode 100644 meta-oe/recipes-gnome/gtk+/gtk+/CVE-2024-6655.patch
>  create mode 100644 meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/CVE-202=
2-34568.patch
>  create mode 100644 meta-oe/recipes-graphics/openbox/files/0001-Fix-list-=
traversal-issue-in-client_calc_layer.patch
>  create mode 100644 meta-oe/recipes-graphics/x11vnc/files/CVE-2020-29074.=
patch
>  create mode 100644 meta-oe/recipes-multimedia/audiofile/files/0004-Alway=
s-check-the-number-of-coefficients.patch
>  create mode 100644 meta-oe/recipes-multimedia/audiofile/files/0005-clamp=
-index-values-to-fix-index-overflow-in-IMA.cpp.patch
>  create mode 100644 meta-oe/recipes-multimedia/audiofile/files/0006-Check=
-for-multiplication-overflow-in-sfconvert.patch
>  create mode 100644 meta-oe/recipes-multimedia/audiofile/files/0007-Actua=
lly-fail-when-error-occurs-in-parseFormat.patch
>  create mode 100644 meta-oe/recipes-multimedia/audiofile/files/0008-Check=
-for-multiplication-overflow-in-MSADPCM-decodeS.patch
>  create mode 100644 meta-oe/recipes-multimedia/libmad/libmad/CVE-2017-837=
2_CVE-2017-8373.patch
>  create mode 100644 meta-oe/recipes-multimedia/libmad/libmad/CVE-2017-837=
4.patch
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#120115): https://lists.openembedded.org/g/openembedde=
d-devel/message/120115
> Mute This Topic: https://lists.openembedded.org/mt/115533769/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

