Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E2BBC35FFA
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 19:46:59 +0000 (UTC)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
 by mx.groups.io with SMTP id smtpd.web11.3872.1742413610355390106
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Mar 2025 12:46:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Lvka43iV;
 spf=pass (domain: gmail.com, ip: 209.85.161.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-601b1132110so3463379eaf.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 12:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742413609; x=1743018409; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cMTslTx9GXMxkUu0hsmmjiYIkxwMTLPsNhvJ54lndZI=;
        b=Lvka43iVzPoTYHeuerao62jKLHMW91bOzBunNxaWPUhzleTF98OleSfMBSJTwZBRa3
         dmT6JCrhGBmJNaJXgDjCYmlgPC0Bi4ItmlqDh2/QP1sSy9g+V/YTRCBj8YuBSNF7jsOp
         EEbut8DkDA8tZxKAM5nwpSVii+kETsXIpsOT53H43NI4Wkd+KH7EAHzySbRo8AMeXLFe
         qNExtJeOQBJ9M0HwNvrlRXVDpCP+Fnxr1bBqMf0tyHUPL2ppU/jXAeb/DmL34R/nmiHy
         bY39YkOqbbqr0pKCjK6rZe2aBS1R22ySehBXBcDcAusw8oGt7xfkCDcuZObxG260sspg
         6LQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742413609; x=1743018409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cMTslTx9GXMxkUu0hsmmjiYIkxwMTLPsNhvJ54lndZI=;
        b=n5IOETqncAR2VCjzDOA8Igi0vxEBsXeRA1ctChAPDvINHS6FTtykduvOKsd6+tT96w
         TtvUn9Jj3OhR2r70tyhpgpChs5Ff5fBKiP70yHnsau++xj3Gu2lWUYvJNYJNR6OljtWn
         omJ5HiBZQCi7c70kzG+mjSdGTsXsJOROME6jR9+jykFSaA+x3WN7f8+kUu8m1p2w2vpN
         MGK/5esAWp671SkaQvZdshBcoSyy5ABUsL1koyZh3fF6CfFh9FwWj5MF0YS5QopzgEbU
         dmW+ihzcmXWyX7P+U8OQLP4xPIwVfz+ja9IIPQI8RM6ZZrGUI5l4RM3egVIKO9NMI0JR
         tNaw==
X-Gm-Message-State: AOJu0Yz3TSo1P6Mq5N28HFFb2hBTIJqgA89BbAFjGslr8q9s8CPFBLt3
	SvjIo7O07d1/H301+mNTmFNIXzfHYh2XdTb9cGVBNmwyKuJtHz+gBozl0SwsSFhGnjSH0LkX3of
	HAW3JAyXslVP/4qBjcWtliOP9bTE=
X-Gm-Gg: ASbGnctjRLdAYXkjzDoYtif1gDhd7c6GLS6E1YkXHFsxSJ4eLjaFqfsfOxDY5+r6gax
	qahqJO1Pkva2zPyysbHlB/qkZYtVW8wjKl9XiPBx+IhPW+sANz3A2Be1y9jGQB8VLKWFVp5purs
	NeIoP4dBeTGyP5Jv30VjrCa2nLNML4NnaBYvoHr9tgKDeN2X7umhEsSI4=
X-Google-Smtp-Source: AGHT+IFXKkOZkeUKQwrBbH8TR8syztwz2LWLsD2Emfx7l1q4pVJ/V2FuebXCbUDimQRwX8dH82Pu6UNHrFUBIjQN/Tg=
X-Received: by 2002:a05:6820:3287:b0:600:d98:e3e8 with SMTP id
 006d021491bc7-6021e146338mr2395835eaf.0.1742413609586; Wed, 19 Mar 2025
 12:46:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250319174152.706861-1-ross.burton@arm.com> <20250319174152.706861-12-ross.burton@arm.com>
In-Reply-To: <20250319174152.706861-12-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 19 Mar 2025 12:46:22 -0700
X-Gm-Features: AQ5f1Jon0yWdt0O4UmEHplITrricG9dzmQM2ZGaIl0Pj8ml1oYnz5abHox2N1CQ
Message-ID: <CAMKF1sqPNEo1zcGA28SwZ6Vr2K+PPNr9-U3axePZRbPz-V=FtQ@mail.gmail.com>
Subject: Re: [oe] [PATCH v2 12/12] fbgrab: don't inherit autotools
To: ross.burton@arm.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 19:46:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116108

On Wed, Mar 19, 2025 at 10:42=E2=80=AFAM Ross Burton via
lists.openembedded.org <ross.burton=3Darm.com@lists.openembedded.org>
wrote:
>
> This upstream does not in fact use autotools, so remove the inherit and
> implement the required do_install.
>
> Also fix the hardcoded /usr/bin to use ${bindir}.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta-oe/recipes-graphics/fbgrab/fbgrab_1.5.bb | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/meta-oe/recipes-graphics/fbgrab/fbgrab_1.5.bb b/meta-oe/reci=
pes-graphics/fbgrab/fbgrab_1.5.bb
> index 7b52ead909..efcf5a9ea6 100644
> --- a/meta-oe/recipes-graphics/fbgrab/fbgrab_1.5.bb
> +++ b/meta-oe/recipes-graphics/fbgrab/fbgrab_1.5.bb
> @@ -9,8 +9,13 @@ SRC_URI =3D "git://github.com/GunnarMonell/fbgrab.git;pr=
otocol=3Dhttps;branch=3Dmaster
>  SRCREV =3D "f43ce6d5ce48fb01360eaa7c4a92c2573a1d02f8"
>  S =3D "${WORKDIR}/git"
>
> -inherit autotools-brokensep
> -
>  do_configure:prepend() {

should this prepend to do_configure still ?

> -    sed -i 's|$(DESTDIR)/usr/man/|$(DESTDIR)${mandir}/|g' ${S}/Makefile
> +    sed \
> +        -e 's|$(DESTDIR)/usr/bin/|$(DESTDIR)${bindir}/|g' \
> +        -e 's|$(DESTDIR)/usr/man/|$(DESTDIR)${mandir}/|g' \
> +        -i ${S}/Makefile
> +}
> +
> +do_install() {
> +    oe_runmake 'DESTDIR=3D${D}' install
>  }
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116097): https://lists.openembedded.org/g/openembedde=
d-devel/message/116097
> Mute This Topic: https://lists.openembedded.org/mt/111794448/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

