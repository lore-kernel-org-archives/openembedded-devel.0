Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1EF2EB64CA
	for <webhook@archiver.kernel.org>; Sat,  7 Sep 2024 15:24:28 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.web10.9763.1725722662362258557
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Sep 2024 08:24:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kn4fPziG;
 spf=pass (domain: gmail.com, ip: 209.85.161.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5e1b55346c0so725262eaf.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Sep 2024 08:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725722660; x=1726327460; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nbBWuZX23Sus1LweB2BKNYxHY96+GDVYF45phQFowls=;
        b=kn4fPziGGXImmQtnrk80Yft3aO5GXoECv62iTyKTrXByxyDcfHi/Ra/EGkjdhT1+Oa
         folFDO/bOoRVc4LtFBR4fWiVsvgYZIkH5mUEwLmCFL//U53fa+Aq4StT9KNZ+9wna8zd
         dKgTLPMjQw1cc6xC8Cm8XSLXyH2Fp/QjPgTzHzsMYRND1Ia4QeZJ6aSVqkK0D5EZzLR0
         hrXd/aD3I4SaJpfP2CHRZqiq56YbyUEGcAGZL+oidTOYg4+O0G6n68KvsX/fZBC4JsXE
         D7ueve9F7m5HIQhPvoLzVjaucs660t7/kvyRJx+IddZhMpE6dyeyu/lTTVP9H4KbMcvG
         ndWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725722660; x=1726327460;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nbBWuZX23Sus1LweB2BKNYxHY96+GDVYF45phQFowls=;
        b=qHCmMhdtF+Bgt3eI3Kuqu+InFrIPTJEp0DRfDpk+YzJTJweXi7HAXQ9a9sucZcAN4V
         hj6CWpq4Yc6AlGhMnwQzMfgtLfeb7q4xiexg2e7xjjoo+2FwI6TLp4y83aXWfhNBRARJ
         6jR1L8+RhYoHhx9ndvGuEXRR2ChRuOuL4WGWDjBLqJ4VhQmURAkchW1L+9jeaNHT7ftC
         pPsuL71VnlBS7A8CR0MWrncTvhrF/6gWAgEtWcB9g5Ifw3LuLSknLMed2b3a5UcnEKbz
         fjaROhD6DEFUkMRTi2S/peLQOcDs/yjoSm9HUieLLO8vM+STh+NBJCs9lnMki8RAHfa8
         Zljw==
X-Gm-Message-State: AOJu0YzhaeiCN70mG9f7QVzQNHzIZGM7XszEmNaQ5kic1ta45A5rFZT/
	LDIunFjcgSbA8r/X1XcdemXeeqwGfv2s7I43CsM3TeTb5C+1Y9aQuS75ELwGO3tzoIOU98kNdPT
	oeSe10K7RQie4TZXEIfv6fcdcuRY=
X-Google-Smtp-Source: AGHT+IElraNvUGCZl3V+jnQkcttZuHtHn7lg+LDHzihOpEXIq+Zg1VCdFbopmDlLoN5Et1/7iTwfoD8kC5DzG+kRkZw=
X-Received: by 2002:a05:6820:809:b0:5e1:9741:962c with SMTP id
 006d021491bc7-5e1a9bf3af1mr6370952eaf.2.1725722658534; Sat, 07 Sep 2024
 08:24:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240907083446.80928-1-f_l_k@t-online.de>
In-Reply-To: <20240907083446.80928-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 7 Sep 2024 08:23:52 -0700
Message-ID: <CAMKF1sqt1BZt_frP-rbPVFzKz4QCo9LrTFVxHsRR9Kp1MjE+qA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] iwd: use internal ell
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 07 Sep 2024 15:24:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112114

On Sat, Sep 7, 2024 at 1:33=E2=80=AFAM Markus Volk via lists.openembedded.o=
rg
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:
>
> iwd and ell need to be updated in sync. This is regularly neglected.
> Also the fact that they reside in different layers compicates the update =
process.
>

yes this has happened in past as well.

> Beside iwd, there are not a lot of consumers for ell.
>

if this is the case then, I would like to suggest that either iwd moves to =
core
or ell moves out of core into meta-oe next to iwd. I think ideally it
can be deleted
but there might be other consumers of ell outside of meta-openembedded
layers and core

> Building with internal ell makes iwd updates easier
>

Building with internal ell is fine if its not generating duplicate
copies of ell artifacts. Can you confirm what happens when
switching between internal and external ell ?

> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta-oe/recipes-connectivity/iwd/iwd_2.20.bb | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/meta-oe/recipes-connectivity/iwd/iwd_2.20.bb b/meta-oe/recip=
es-connectivity/iwd/iwd_2.20.bb
> index ffdab0260..16d900ddc 100644
> --- a/meta-oe/recipes-connectivity/iwd/iwd_2.20.bb
> +++ b/meta-oe/recipes-connectivity/iwd/iwd_2.20.bb
> @@ -3,7 +3,7 @@ HOMEPAGE =3D "https://iwd.wiki.kernel.org/"
>  LICENSE =3D "LGPL-2.1-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfb504b67c50331fc78734fed90fb0=
e09"
>
> -DEPENDS =3D "ell"
> +DEPENDS =3D "dbus"
>
>  SRC_URI =3D "https://www.kernel.org/pub/linux/network/wireless/${BP}.tar=
.xz \
>             file://0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-fo=
r-e.patch \
> @@ -24,8 +24,6 @@ PACKAGECONFIG[wired] =3D "--enable-wired,--disable-wire=
d"
>  PACKAGECONFIG[ofono] =3D "--enable-ofono,--disable-ofono"
>  PACKAGECONFIG[systemd] =3D "--with-systemd-unitdir=3D${systemd_system_un=
itdir},--disable-systemd-service,systemd"
>
> -EXTRA_OECONF =3D "--enable-external-ell"
> -
>  SYSTEMD_SERVICE:${PN} =3D " \
>      iwd.service \
>      ${@bb.utils.contains('PACKAGECONFIG', 'wired', 'ead.service', '', d)=
} \
> --
> 2.46.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#112113): https://lists.openembedded.org/g/openembedde=
d-devel/message/112113
> Mute This Topic: https://lists.openembedded.org/mt/108319324/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

