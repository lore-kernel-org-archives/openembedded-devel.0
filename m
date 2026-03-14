Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0184810854B5
	for <webhook@archiver.kernel.org>; Sat, 14 Mar 2026 23:21:23 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20121.1773530477207938920
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Mar 2026 16:21:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mBXD17Nu;
 spf=pass (domain: gmail.com, ip: 209.85.210.52, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7d751ef36ccso1996522a34.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Mar 2026 16:21:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773530476; cv=none;
        d=google.com; s=arc-20240605;
        b=LKAbwFhelO7mSg6xQMYkdiEhD2RMx4USOPX9F7S6cQOuznIRkenHKOVwSTDn/8N0z7
         8/k1QctWiCOjYnKuAGKMt23JeCWXqdFyQn3maJGM8JzNNSnegeR6NjmOwny4Npsj84yy
         j39Tr0deexI5X7UHA0K/Bk0ZiXPV3I9f+o0ak2/gUfpmdV1WBBVZ93Jl7qMJnZ7opEmF
         OlD4FEMK6IhIcrwPfjh/7hbe5KgKQmy2pZ4trWxSRn3QY1JcWGyilv262eKh7hFkX44T
         kHrtRqioDjiCGXx970VsVw6gU/rgNQ4xDdA+t4K66/PC3emeet/iqNm1a/CqGnVSJnVv
         y8pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lvKBnUdqRTCW0q3FCQQaVyOHeB3hD3Rq/hlFVA+Vc6A=;
        fh=wtQJmTNKI5f1UFKEvRhwyoTFPNk3MPf/Yr/dx5nN1Vo=;
        b=MwU76Ozij1ZKcHfyCEPE2guMl1ulbRHRoN1fZ+IbVNzNhiHR2J32q2domvXLuJML5o
         oi+LULu7FxHrBLfEjKHRhj2NSiUapE8uPt0ndhA3OJRF6RZ2wG5U4r63peclUDH+UTnU
         B3oMmvli9UrOPSBW2ho6OxnthUPaQqV8eYUtPj1G/VOxz4iLAlnJmEQHbNguWXRpTXiD
         pthL5pB7ux0C3aV4PAO7grYX69fVDJXmom7P1WDr5YdqxDxix31EV+QXdREHQEVVco5E
         h1MBooG+n2kbk0gdt0jTiFdbS/bEAOd0Upmzgi96hGYAXqzLDC2P654RTHjjgdW3bVpA
         UBzQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773530476; x=1774135276; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lvKBnUdqRTCW0q3FCQQaVyOHeB3hD3Rq/hlFVA+Vc6A=;
        b=mBXD17NuG9g2UfKU+MBRhxV/S+WUzkFazE/0ldbEUkZdWBsxr2eQwPazaWtafse81Z
         I/cr2Ejdckl7x5JwlQH2nRMbh2+fiX1UUuAfk/W9LMXumdykBiGdmi5ArAZ2VU7snZxm
         a+viODrUfneLZ6uR13vbHtK7dLSH5e6n8ZH5PgGOcVjC3UOn8Uo9nnuvY9f8zP4bsH3J
         O05bou3DHczAROK2hsujQeYLSLybjYqkUKl5i+050nQAYIo0saz589FD35Lfh585MpwS
         eu2JcajhsnmEH/MiMas4/X6b/MrgMo2z6bWrn1ruQcPVCOlbIZv9BsQ6gTNgbDWMObZL
         ArjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773530476; x=1774135276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lvKBnUdqRTCW0q3FCQQaVyOHeB3hD3Rq/hlFVA+Vc6A=;
        b=IsNQAGeoaZnGkQJyUH4NNG6DHMrBn5v2+5w+zvZwS5wlg+hlyXSVUEVGiM3R5RKLNN
         Q1qtlBt6mCMo5pevFX4XJnatM+SHOzMnM1hIetu+HPmjFyn90+w56uBME5wzeeZy5zDS
         eWaX39d4lGobqSHNV6nxO2JnCWciABWwaCQLqPvRcupxIetzZH6DuqA6LQ/HAx2iqXT9
         vevHvdmG97Po9mzVxD+yux2mTt+AYGFInAhVFZCd7Z/lDsdma7Jha4dxCJU2pm91WI8m
         lVeWchEJHKespadui7DS9P7jaK4gxZTxQBTzQyhKBySz8ImgE1vR7fdTUFO/84CCiAdZ
         r7Qg==
X-Gm-Message-State: AOJu0YzUFTVMakAdIeB7y+WpgdLwItNkOpRYIL6qWtkHeYytxbYrFHaY
	q8Neh5Xx/TCxv3CtQaYXEfiSW9+qs6X9Kd6WDzjA0121XlNUX4gPXkXyxdL3FWkysS1WsUyTwQl
	VWZ3kkrBJgnCG9CgrLW1BrDSmd/nhB1hNWIEm4Y0=
X-Gm-Gg: ATEYQzwbB7cle/1xJLi2PKPhTNKd730qLF3OOqonvUASaMmBpVxy6mJblc+Y3+pJ6tU
	009JjIOjOHSim/M/HjDA/heB+DGG9pGDxyf36wM633Hk/B0DsugaI68+tOaLP53k5oCKViENmDl
	42jR1bDURnEzjWsqZNDXZ1pSHnPKNSjZSiQRgG4awZtGFstLT/DdeYNh8415btuLKgaiMk6EAZB
	fLUqjV28VBETES69Y2G4DsBwMZuEacyF1OaB41+d3KwpeIHZJ6+L/GTH4g8u8MnXrWDXpxo13r/
	hPrNpTGE
X-Received: by 2002:a05:6830:64c8:b0:7d7:59db:fc5b with SMTP id
 46e09a7af769-7d78253b095mr5335687a34.19.1773530476227; Sat, 14 Mar 2026
 16:21:16 -0700 (PDT)
MIME-Version: 1.0
References: <11abf2a38c37c565257019092e68b85ac257fb4f.1773489599.git.joerg.sommer@navimatix.de>
 <285dcf1ffa906351b9102b15ac1bcc5995c0e674.1773489599.git.joerg.sommer@navimatix.de>
In-Reply-To: <285dcf1ffa906351b9102b15ac1bcc5995c0e674.1773489599.git.joerg.sommer@navimatix.de>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Sun, 15 Mar 2026 12:21:05 +1300
X-Gm-Features: AaiRm51C02nhYspoWVuVrFG3bCajs4lqNukcts9TwmEuhLr5KZ7cfVpiHnPuHvI
Message-ID: <CADySD0HOEst_1e+s_FgULQ_TJmh7B3Cj+nS9tR5f3u0q4Ec37g@mail.gmail.com>
Subject: Re: [oe] [PATCH 2/2] multimedia/fswebcam: New recipe for a webcam
 image grabber
To: joerg.sommer@navimatix.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 14 Mar 2026 23:21:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125215

On Sun, Mar 15, 2026 at 1:00=E2=80=AFAM J=C3=B6rg Sommer via lists.openembe=
dded.org
<joerg.sommer=3Dnavimatix.de@lists.openembedded.org> wrote:
>
> From: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
>
> Taken from
> https://github.com/linux4sam/meta-atmel/blob/master/recipes-multimedia/fs=
webcam/fswebcam_git.bb
> and amended.
>
> Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
> ---
>  .../fswebcam/fswebcam_20200725.bb             | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 meta-multimedia/recipes-multimedia/fswebcam/fswebcam_=
20200725.bb
>
> diff --git a/meta-multimedia/recipes-multimedia/fswebcam/fswebcam_2020072=
5.bb b/meta-multimedia/recipes-multimedia/fswebcam/fswebcam_20200725.bb
> new file mode 100644
> index 0000000000..129735fdac
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/fswebcam/fswebcam_20200725.bb
> @@ -0,0 +1,21 @@
> +SUMMARY =3D "Webcam image grabber and manipulation application"
> +DESCRIPTION =3D "\
> +    fswebcam captures images from a V4L1/V4L2 compatible device or file,=
 \
> +    averages them to reduce noise and draws a caption using the GD Graph=
ics \
> +    Library which also handles compressing the image to PNG or JPEG. The=
 \
> +    resulting image is saved to a file or sent to stdio where it can be =
piped \
> +    to something like ncftpput or scp. \
> +"
> +HOMEPAGE =3D "http://www.sanslogic.co.uk/fswebcam/"
> +BUGTRACKER =3D "https://codeberg.org/fsphil/fswebcam/issues"
> +SECTION =3D "graphics"
> +
> +LICENSE =3D "GPL-2.0-only"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D393a5ca445f6965873eca0259a17f=
833"
> +
> +DEPENDS =3D "gd"
> +
> +SRC_URI =3D "git://github.com/fsphil/fswebcam.git;protocol=3Dhttps;branc=
h=3Dmaster"

can please also include tag=3D${PV} in the SRC_URI

> +SRCREV =3D "db35d4bbd336885a44f017ff142bc9523dbdce3c"
> +
> +inherit autotools-brokensep
> --
> 2.53.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125203): https://lists.openembedded.org/g/openembedde=
d-devel/message/125203
> Mute This Topic: https://lists.openembedded.org/mt/118312259/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

