Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
 by mx.groups.io with SMTP id smtpd.web12.7662.1602665930875939585
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2020 01:58:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tYCd63Bo;
 spf=pass (domain: gmail.com, ip: 209.85.214.194, mailfrom: schnitzeltony@gmail.com)
Received: by mail-pl1-f194.google.com with SMTP id h2so1398890pll.11
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2020 01:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=2bVwhGPFx8rQ7abYFMuO9rpbphVA2jl2Fxr/CrVIMRM=;
        b=tYCd63BoBrhQwbTrQRfPtNayR3P/Cv5dvlK1Mz3V43e69pyp12caI7t+rzIdPmeUeg
         1Zvyg7iPjxHQxH2mxnx7JtGM8ujj+6VK97DACbULjeJDUKn8mTgvd/21ay61yXbFC3Ab
         8SsXpN4pnKad55u9I2tRD3HXiRRJ2UVyGthtYXD+Ns1j/kRhh4GJnUCBX9hF5HOC6S3z
         dneXIU0+ab/csbVgO2hdSm/fkBsekeW7bpZVJRLCnX9pbMYjAOJWyYIa6X5Er/vk4t3j
         0jlpwRow+mArlyIerY1tTgCmwx3+Ar56/iYZ2vOSdVAHB1SHbA/5b0xHMu8Tj7LGw15G
         YhvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2bVwhGPFx8rQ7abYFMuO9rpbphVA2jl2Fxr/CrVIMRM=;
        b=r00SbSCUkF+joU7Nwz5QTmebRIiP6i/SSj92xLVqtskYd/7WaYbezE0+pGMoPR1MRn
         YmjoIn1Of3dvJaZa5BzUhrGOErHIaksRR+CYlTh2jPAxOO1kZObakNfX/DGMzCOiykCt
         640vJCgrnjuYmE6oAekuiR4PRVc79E2zSK8we6p10BIRswRkkCco6EPf/PmdGi+lOZh/
         GTSFCPuU7HZgiECmAyhI+Mj5PL8bHB7HlAccE3Y+uV5CggA23Y1ww943tRil4sJHt+Zh
         hszKAuScG5EQEKm/dCAkz8VL6uDJ7Oh9AUkVA1UCrO8wgHPg/X1piOCeQ52SZycB60qa
         PdvQ==
X-Gm-Message-State: AOAM532NoXOcTDRqt3Ct0M4UA8qjk6je5apOC18JFSrG7zA9sgKgp2gG
	oZ2bI1w9Z+8Q393v+fnI7L0VcSmTVUzOZe4DzNo=
X-Google-Smtp-Source: ABdhPJzWRSx6+31OUZah7FArS+0sJv9V+OvI3vRBxmfo8kfKePT9jPRSMAaR1Yu/YePwwg29dspp51mpN8TkzRGjYBI=
X-Received: by 2002:a17:902:d683:b029:d3:803f:1c55 with SMTP id
 v3-20020a170902d683b02900d3803f1c55mr3395734ply.60.1602665930302; Wed, 14 Oct
 2020 01:58:50 -0700 (PDT)
MIME-Version: 1.0
References: <20201014010617.1086948-1-schnitzeltony@gmail.com>
 <20201014010617.1086948-3-schnitzeltony@gmail.com> <CAMKF1sr5XQrxteG2Qg3dmgZ=EuVeRixnT-yp6thHFYreohL4SA@mail.gmail.com>
 <CALbNGRQ_KfvVcWYO-VXO40PEb-vsd4PKSUktWXyAeLTAtCQm7Q@mail.gmail.com>
In-Reply-To: <CALbNGRQ_KfvVcWYO-VXO40PEb-vsd4PKSUktWXyAeLTAtCQm7Q@mail.gmail.com>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Wed, 14 Oct 2020 10:58:38 +0200
Message-ID: <CALbNGRT=TXHz90jihkJkrso4LmydOwvHGVXp+bf4Z9GgWZY_Cw@mail.gmail.com>
Subject: Re: [oe] [PATCH 3/8] wxwidgets: add opengl PACKAGECONFIG / enable it if opengl is in DISTRO_FEATURES
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2020 at 10:52 AM Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
>
> On Wed, Oct 14, 2020 at 7:50 AM Khem Raj <raj.khem@gmail.com> wrote:
> > > -PACKAGECONFIG ?=3D "gtk"
> > > +PACKAGECONFIG ?=3D "gtk ${@bb.utils.filter('DISTRO_FEATURES', 'openg=
l', d)}"
> >
> > libglu also needs X11, so checking for opengl won't be enough
> It's not that simple:
>
> * wxwidgets has three PACKAGECONFIGs for the backend: no_gui/gtk/qt
> and users should (there is a note in the recipe) select exactly one of
> them.
Forgot that I did a python check that one of no_gui/gtk/qt is selected.

Andreas
> * For qt and gtk x11 is added to REQUIRED_DISTRO_FEATURES
> * PACKAGECONFIG no_gui (the only non x11) is marked as conflicting with o=
pengl
>
> =3D> To select opengl successfully, x11 must be in DISTRO_FEATURES. Hope
> that's good enough
>
> Andreas
