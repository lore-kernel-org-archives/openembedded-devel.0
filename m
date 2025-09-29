Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66E84CAC5B0
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 17:02:13 +0000 (UTC)
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
 by mx.groups.io with SMTP id smtpd.web10.3701.1759165332888366551
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Sep 2025 10:02:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Rm+aJi2k;
 spf=pass (domain: gmail.com, ip: 74.125.224.51, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-6360397e8c7so5134394d50.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 10:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759165332; x=1759770132; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HVC1GF6kl1aoWD2lZ91Pswj4cUdTa1Vb9ZYToDhff90=;
        b=Rm+aJi2kJdfRzw89mlEMoEjHNHSDOy1KppNWT1xF6INXrn+n7SuQ2M2opXzR2lkO8z
         QmzVV+5T6aNazhnK4g1j1vLUjdcoX2p6W8vEMzo0UNlG9PSSBdTKonbXR18pCuQJubAh
         TzH5hwz11KVPuufHnqsLERoRqL1SsjTOK57+RqDG83EgjRmysoWs1IptTxOeiJSqZzKe
         QGNv0TRG+hadZfQbvxS2+SojtngCtnB11EUHYc43I/vblS3KGhQcq1YHseOP4M48QAKi
         fTEPD+Wlchn6DODqNjaMGUN1DQHwFyccsTwtb25wKCYBqXtNwSYpxAVdxoZ9jYx2kImQ
         +thA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759165332; x=1759770132;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HVC1GF6kl1aoWD2lZ91Pswj4cUdTa1Vb9ZYToDhff90=;
        b=hlTBwPUmA2njXjq5TVoWnXwSOuvv3txyQkVGS6rVX0OXdJ5+lVVRaDhsx39W7SndPb
         3k4gRqpGOoaZxY+0T4i/YElnipHzZLOutSOWaVDmLT+5LZj8tsRSe8bqCC++NgjC6nbR
         7UD7ONQ1QL43gCHr43byVZxWi/yzfHbNjbx07WR4ggr77CPi1y9McYvN5dQE+iJ5wQOk
         0FmTLS2woWLKFtno4nITMIoA7JYja9h0tKIMYM3Xl8WzLxGR//d7IkKM2vg82Rcp8nK4
         6zZ+cSmbLWQUXDOpp3nCccJ9FEpEIfh88gf0kbqR77JrZndKX/G9D3r74M4iBZd9GMqT
         Rpxw==
X-Gm-Message-State: AOJu0YwjxcHSk0PJI1jH7jZAYrT7E+gPYGjENHwojMvtkt2MdRpG7r+y
	NM9vrdnonq7wGp3+DN1eJvg9Gf+EzjTKt3vviJ/bW/cpF0uENO0idn3jO3Y+jbw6xpaSqWuifn4
	el2QfeMbhpG3H+zdnbZ933CQGgExpZYfMeE9r
X-Gm-Gg: ASbGncuyyBkdgjsBtOB7pYCE/UG+4i5FOoWl4TTaEikFymno7ZcKsSsb/rLasUnp3Ev
	1GScA1dn1qDeKCj55xZ5wkeUQatdgrCUnWW+3+leT+7Kzd/xHhoPDIgo5b36JdsaPu4dtgSt3mG
	t63SGBOsIrFwLGtPdD2B+6LOBN2qXteW6RWLADRm/8RMH3xvuUI+cS85yO+uozVmUyFfpi2bsi3
	NYBHipo1MLMzI5/N5+N6N9C8Bvo+Sto56K3phkXUuEXTty+7bnIzn7MUXCBerF416a0SMZdsy8V
	6osRC6hohvFG46+NYgZatcIbA25fy7VyDmglncrPdlkoSAIAkM+/6BGlrg==
X-Google-Smtp-Source: AGHT+IFscjHaLeFy/dKn9sWpptLfQiO0Pd0sucsKoQgDMvKY8sMRWCNqeJ1SSubxIeUNgIIXUpmvhbnlB229dSWH2nc=
X-Received: by 2002:a05:690e:4341:b0:62c:f19f:794d with SMTP id
 956f58d0204a3-6361a833c7emr15965956d50.36.1759165330045; Mon, 29 Sep 2025
 10:02:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250929130425.2912077-1-skandigraun@gmail.com> <20250929130425.2912077-17-skandigraun@gmail.com>
In-Reply-To: <20250929130425.2912077-17-skandigraun@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 29 Sep 2025 10:01:43 -0700
X-Gm-Features: AS18NWD2Z_hhmrKcURpnJNCq8n1QGByEkv2gENFaqWUI7i0Q1YWFZ7k9GQP28-k
Message-ID: <CAMKF1srcdO5qpYewHLUNEAE-odDrcwUO0mzAiziaK66S4+Gp7Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][kirkstone][PATCH 16/22] iwd: upgrade 1.26 -> 1.27
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 17:02:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120040

is this only bugfix release ?

On Mon, Sep 29, 2025 at 6:06=E2=80=AFAM Gyorgy Sarvari via
lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
wrote:
>
> From: wangmy <wangmy@fujitsu.com>
>
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  Fix issue with hidden networks on connection error.
>  Fix issue with directed roams if already trying to roam.
>  Fix issue with checking for connected in FT frame event.
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> (cherry picked from commit 9f359e3eb01cc0b1511569573062c40909db3ef6)
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  meta-oe/recipes-connectivity/iwd/{iwd_1.26.bb =3D> iwd_1.27.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-connectivity/iwd/{iwd_1.26.bb =3D> iwd_1.27.bb} (=
94%)
>
> diff --git a/meta-oe/recipes-connectivity/iwd/iwd_1.26.bb b/meta-oe/recip=
es-connectivity/iwd/iwd_1.27.bb
> similarity index 94%
> rename from meta-oe/recipes-connectivity/iwd/iwd_1.26.bb
> rename to meta-oe/recipes-connectivity/iwd/iwd_1.27.bb
> index 6248850413..dc29bc3fd5 100644
> --- a/meta-oe/recipes-connectivity/iwd/iwd_1.26.bb
> +++ b/meta-oe/recipes-connectivity/iwd/iwd_1.27.bb
> @@ -8,7 +8,7 @@ DEPENDS =3D "ell"
>  SRC_URI =3D "https://www.kernel.org/pub/linux/network/wireless/${BP}.tar=
.xz \
>             file://0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-fo=
r-e.patch \
>             "
> -SRC_URI[sha256sum] =3D "0ff4541c2b7f14ec010c3cbd1f02350f1b58cb0c103412db=
22550e90d8040d6b"
> +SRC_URI[sha256sum] =3D "013b4a0a79629c20d915954fc3b5d0620ef6e0d6065db3c3=
42f4b3f9111f46ec"
>
>  inherit autotools manpages pkgconfig python3native systemd
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#120029): https://lists.openembedded.org/g/openembedde=
d-devel/message/120029
> Mute This Topic: https://lists.openembedded.org/mt/115494451/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

