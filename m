Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6683C47074
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 10:22:48 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web10.10199.1700043767467936486
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Nov 2023 02:22:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RJJe1ikd;
 spf=pass (domain: gmail.com, ip: 209.85.210.53, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-6ce344fa7e4so4145660a34.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Nov 2023 02:22:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700043766; x=1700648566; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z9LegcLcCUNRQij5zXmk0iUIQFgrGaFhFwH1K+7cNRc=;
        b=RJJe1ikdIzKQ+pm9lZPBGAy9qV4SltOHPU4hAfsVy9Y9T8+xQD3J6NCJNaKpkBDhZO
         voalypmCM4oIbjs3SZHlaWStrzW1fUnGyKCon+h6gG6q63HWU0M7oBNvfwvC0pDm4BxZ
         611azdWMNE3puaqCbucxcoNpWx2pf4jabsiILDv2NrLp1g/InTqV7m9epffxFpTIHUHv
         VQp035mHM43vH0lKdJk8gUIqcwxnCs/tHhaje/4bjqjAG9iEhERyvyXDRERnjKSFI5vy
         kB65gAAlQDfKEoiTorbo80CJt4R30WRCh/v8V2P8tfnrfRaxMxAktqHLLiLMcrFvV/Xu
         gQiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700043766; x=1700648566;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z9LegcLcCUNRQij5zXmk0iUIQFgrGaFhFwH1K+7cNRc=;
        b=UZIgB6kw3vnjSMk6YJ3wJ4RVYYOjqcbJqlSIhtJw6r05zR0bVvLzC4qXxd/O3+xotE
         pSPjWyDUKFsqseius7SRZJEqBszHTlXsx4SODlDHWY92JhUAF77v3Pt0KhtO/JLMFjup
         Yxh1oo+FhR4LQXXw1WB7/NUOSYfZiRbnkObwdS9Ave5nLO6lhra6tsKJ+L6+xnriN6nc
         oew9TSAVURGK3YkgvbbbODuDuM9jBaNAtih3KKrzL4flpQOJZhS3vPGz4DZoR3GOSsMM
         Rpf5Yt3Wzwu/eQ9nbpy4rTZIC34g4J0zxCjc5RHfAhloOOEpP35i4DjZRpN03F8PlIz4
         zCgQ==
X-Gm-Message-State: AOJu0YxKkRWRywrq2x60Bt7Mtz1c+2N4OIuN8dhqJ6Tvx8i8n+JD1Rem
	aKTdteF62NRcqBarQMPfSLl2OIAPuSWC+7ZBOq4=
X-Google-Smtp-Source: AGHT+IGTcdNgI9S6IJWsy1wzhT65JjTOR333eoRbMUoMTzEqcx3lmJ18NQVnTO4PS2a++gX/wXIozF+7HJvbTW4dI4w=
X-Received: by 2002:a05:6871:2304:b0:1e9:9c34:af67 with SMTP id
 sf4-20020a056871230400b001e99c34af67mr14454399oab.18.1700043766680; Wed, 15
 Nov 2023 02:22:46 -0800 (PST)
MIME-Version: 1.0
References: <20231114-remove-vte9-v1-0-720f287a1da3@gmail.com>
 <20231114-remove-vte9-v1-1-720f287a1da3@gmail.com> <D9P54S.WFDJ0FIJUBB2@t-online.de>
In-Reply-To: <D9P54S.WFDJ0FIJUBB2@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 15 Nov 2023 02:22:20 -0800
Message-ID: <CAMKF1sobLavcTb20ZoB6t5a2AsTOMQo3RPrHwM1aEYuMH7kOpA@mail.gmail.com>
Subject: Re: [oe] [PATCH 1/3] gnome-console,gnome-terminal: Depend on vte from
 core layer
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Nov 2023 10:22:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106751

On Wed, Nov 15, 2023 at 12:36=E2=80=AFAM Markus Volk <f_l_k@t-online.de> wr=
ote:
>
> On Tue, Nov 14 2023 at 11:36:52 PM -08:00:00, Khem Raj <raj.khem@gmail.co=
m> wrote:
>
> diff --git a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.50.=
1.bb b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.50.1.bb ind=
ex 014b329b34..594e1c0b22 100644 --- a/meta-gnome/recipes-gnome/gnome-termi=
nal/gnome-terminal_3.50.1.bb +++ b/meta-gnome/recipes-gnome/gnome-terminal/=
gnome-terminal_3.50.1.bb @@ -13,7 +13,7 @@ DEPENDS =3D " \ desktop-file-uti=
ls-native \ gtk+3 \ gsettings-desktop-schemas \ - vte9 \ + vte \ dconf \ li=
bhandy \ libpcre2 \
>
>
> For gnome-terminal this must probably also be reverted
> https://git.openembedded.org/meta-openembedded/commit/?h=3Dmaster-next&id=
=3Df3d3bc7620427dc1d47daab52a81593509cf2737

right yes.

