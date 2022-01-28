Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57886C433F5
	for <webhook@archiver.kernel.org>; Fri, 28 Jan 2022 17:44:20 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web09.1704.1643391859555233885
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Jan 2022 09:44:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JSCocYDq;
 spf=pass (domain: gmail.com, ip: 209.85.222.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id c189so6201537qkg.11
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Jan 2022 09:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CHM4OFqNQxBoClPt9Jcydt/YcGn2kxVPsVAletz06c4=;
        b=JSCocYDqe2FR69bNBHVbWGvcVGIDwRt0ISG5gZl+5Jyn/1f6cRkNxxcoLb3pFBbnU4
         bgmvagX6q1cEdysjKL7Bl5wh47nuGkbZuikr6JB5xJ2IBxAO6oMkdbX4YQCYLSDD38nM
         8xhi4L1puX4uW1hqK8p4vJWZGEKIiUC/Ooo+6bZ/K39X40ah0E+NHKp95Dwi4h+XaYqb
         dMZYrlTelHY9cB1hLGTTKMvT9KjLxqd9Cflxbea09QbtqEqciyNVGL6cM500+rkVBCQs
         PKr2mHqL6ppEsjkKo/O0XyFrzSCVgvZGNw+jLNQQmEVmFQIZsUlPE2AKEBxvdBLBV8mc
         n2SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CHM4OFqNQxBoClPt9Jcydt/YcGn2kxVPsVAletz06c4=;
        b=ya21HqeFFHYVcXSQrj86XoKyKm2uvvaVv0FRgmxONVPfGGWzCMsmSNNKbug59yJ2sO
         HPZJTElGz1f9Mh5ubvKiZUs/jX3PBc6weD/soG85TazsYEKdaF2FJR1ZeazxAwcBiP22
         Nwfy92PDEd9ftECvFY+ANKI87bo4I/9r6P1vb0YQkZPGEkXuuHcFAqnyFTTNl+XSIX2r
         M+jo9JtEWycLnt6lSJGeicxYHO2/rX7cm/Pc8c1W8wlrAsSWx04AEGIStzMkhL8+CsrA
         rNRCOickKkF+xbshUKtJFshKFCVkW3AZBV2xESgTGjRaF/7c90WUQ5VllpHIflZl8Csa
         UVrQ==
X-Gm-Message-State: AOAM531IFurZ/0tz8JFRep13u1/wjtBm8zYWQlaoSoptXEsA1Tf6q6Gh
	1mFUD+qeOqhSa1tswtl2pa1+VCFOeil84hTdlps=
X-Google-Smtp-Source: 
 ABdhPJxgLfOE6UyNQ2Y4k7uOK98gsqwdxsQSCCuEgaFhkYLLtWtGJ0f6WkKX2TgJNLmXtSNg7gjV8DVW0TzK7EnsSSM=
X-Received: by 2002:a37:6493:: with SMTP id
 y141mr6447557qkb.180.1643391858604;
 Fri, 28 Jan 2022 09:44:18 -0800 (PST)
MIME-Version: 1.0
References: <20220125181339.114315-1-f_l_k@t-online.de>
 <26359.1643390123448861343@lists.openembedded.org>
 <81dde554-b80e-43aa-cc85-033f858ff2a0@t-online.de>
 <CAMKF1srApj-60009gE=U=RgCO_XGbgPJPP9HuPvp99yQ8cAyiQ@mail.gmail.com>
 <0cbe12a2-5804-e8ba-7e4e-638ef1ef8021@t-online.de>
In-Reply-To: <0cbe12a2-5804-e8ba-7e4e-638ef1ef8021@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 28 Jan 2022 09:43:52 -0800
Message-ID: 
 <CAMKF1sqrLsFvLwxWt9g6Ktt+-EjtEfVBowvuXp-CcEzJdxc1bg@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH] folks: make some dependencies optional
To: Markus Volk <f_l_k@t-online.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Jan 2022 17:44:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95155

On Fri, Jan 28, 2022 at 9:42 AM Markus Volk <f_l_k@t-online.de> wrote:
>
> Like this ?
>
> PACKAGECONFIG:append:class-native =
> "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'tests','', d)}"
>
> or just with
>
> EXTRA_OEMESON = "-Dtests=false" ?
>

you cant control ptest distro feature here so its better to remove
that packageconfig and just set

EXTRA_OEMESON += "-Dtests=false"
>
> Am 28.01.22 um 18:38 schrieb Khem Raj:
> > On Fri, Jan 28, 2022 at 9:35 AM Markus Volk <f_l_k@t-online.de> wrote:
> >> https://github.com/openembedded/meta-openembedded/blob/aa22894fa352986a62c4530ad8facd8868b2e535/meta-gnome/recipes-connectivity/folks/folks_0.15.4.bb#L24
> >>
> >> Doesn't this line explicitly disable tests until DISTRO_FEATURE ptests
> >> is set ?
> > yes but it means we think that tests do work when ptest feature is
> > enabled which is not true. So it should be disabled even for distros
> > enabling ptest feature.
> >
> >> Am 28.01.22 um 18:15 schrieb Ross Burton:
> >>> +PACKAGECONFIG[tests] = "-Dtests=true,-Dtests=false,python3-dbusmock-native"
> >>>
> >>> You don't install the tests, so this serves no purpose.
> >>>
> >>> Just set -Dtests=false explicitly, unless you install the tests and do the ptest integration.
> >>>
> >>> Also the dbusmock test in folks is broken, it should be cross-aware.  As you can't check for target python modules it should avoid the check in cross builds.
> >>>
> >>> Ross
> >>>
> >>>
> >>>
> >>
> >>
> >>
> >>
> >>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95153): https://lists.openembedded.org/g/openembedded-devel/message/95153
> Mute This Topic: https://lists.openembedded.org/mt/88678231/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

