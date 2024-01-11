Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EFD9C47077
	for <webhook@archiver.kernel.org>; Thu, 11 Jan 2024 20:05:37 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web11.2544.1705003529355612772
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jan 2024 12:05:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b52XJHSG;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-20503dc09adso3620500fac.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Jan 2024 12:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705003528; x=1705608328; darn=lists.openembedded.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2cCoeDaRBrjNXE/+hg5+b1IHMIftSC4CeVe2JS1Uulw=;
        b=b52XJHSGoe/iLzm/mHPdYwRoNaUJY5kcLNZTwFnp3765K22vZbyzf1247MsfuyWp6M
         +zi3Gepv2s6ZFCOCjuo7e0boP2d2GCs5Ti3AYFOMA3KTghdn027Wx95Y0dmNDses/Ufr
         j4sSq5ce9fDBS3beC1upOvo0S7NY0B5Reu0ZUBJy2O6OepTe2pFvuizM2NTVd48n0mgn
         MQu+jxIvXgBWp7aHykV628JMwHZFxHc7ADD1LDAFQ4cTcBgzFTBTUzaVCAyT4RUHeeCi
         f+QocMTIlrTpjhRIiVigaKiq5Wz5rTdIll9I2AkDJJ9281fWH6hHrbtzEekoyn8BCbPU
         HPhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705003528; x=1705608328;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2cCoeDaRBrjNXE/+hg5+b1IHMIftSC4CeVe2JS1Uulw=;
        b=CLWZZoffLCkJMPsPT2Go6iVXefXxVtM5hDez/XNQXanRvlHNkiSzgnwlaNuYEEoR3W
         9sl4KhE00PbRstLe34Pmjz20HmEltunPEeTtPExccsOVhHnitorN3cVPjJwM/sHCWeqO
         LHMRzsCoR9BO5qCD4Wun4PYyxfjdW+iaSuFBzMWRlMHj7hr2JXw3+06KjGmpD8H6xWvI
         yQAuth/fwVTCRvZoVWJtwFJCEF/b6/Ey5v/NbVkT6wtBzvQ2b2O3bNiNn413iDfxfLH6
         YWNk+uA1oUcMKnM1iArV3w9dR98Jzos3+52NSIwBxKoGZG7ojLjoQCAvYefc6tp67sNF
         BoIA==
X-Gm-Message-State: AOJu0Ywyrb3idRnUYGMwVyvVcZwW9yDf/37SK1UGbIHXjKAqcF2cbpeX
	memxLNAVQBcscOHa9YBZthrv86AZhwVXDxFrN+FJsZueaWCVlA==
X-Google-Smtp-Source: AGHT+IH8dJqlwL71Ga3OsqYkoyhmMSiGGYgH2RfqQbi6UV/GSrrOMNlEy2/ueKSsdeQ6mtnYYVwYNpFTfU9+HOoRSn0=
X-Received: by 2002:a05:6870:9688:b0:204:79e0:5813 with SMTP id
 o8-20020a056870968800b0020479e05813mr306042oaq.78.1705003528448; Thu, 11 Jan
 2024 12:05:28 -0800 (PST)
MIME-Version: 1.0
References: <46cae1fba005a8ec9bbd21ac6a50500dfa1dfb79.1703696315.git.joerg.sommer@navimatix.de>
 <170398312590.873206.7532428426055962097.b4-ty@gmail.com>
In-Reply-To: <170398312590.873206.7532428426055962097.b4-ty@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 11 Jan 2024 12:05:02 -0800
Message-ID: <CAMKF1sp0VJ6b9jF2BLdvVhWC15mjqmH8mQ3+qPcpVzzBU4Fr+Q@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] i2cdev: New recipe with i2c tools
To: openembedded-devel@lists.openembedded.org, joerg.sommer@navimatix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Jan 2024 20:05:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108226

brw, I accepted it into master, it still fails with musl so it should
either be fixed or skipped

https://errors.yoctoproject.org/Errors/Details/749650/

On Sat, Dec 30, 2023 at 4:38=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
>
> On Wed, 27 Dec 2023 17:58:35 +0100, joerg.sommer@navimatix.de wrote:
> > The main part is the tool lsi2c to scan the i2c bus, like lspci and lsu=
sb
> > do.
> >
> > This recipe also ships a static library *libi2cdev.a*. Because this lib=
rary
> > contains the file *smbus.c* which is *GPL v2+,* and a static library ca=
n't
> > be linked dynamically to satisfy the LGPL, the whole recipe is marked
> > as *GPL-2.0-or-later.*
> >
> > [...]
>
> Applied, thanks!
>
> [1/1] i2cdev: New recipe with i2c tools
>       commit: 813fb0def8a8bca81706496dd6f106692616a11f
>
> Best regards,
> --
> Khem Raj <raj.khem@gmail.com>
>

