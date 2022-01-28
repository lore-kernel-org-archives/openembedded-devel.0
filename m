Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39B13C433EF
	for <webhook@archiver.kernel.org>; Fri, 28 Jan 2022 17:39:06 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web08.1663.1643391544684632080
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Jan 2022 09:39:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=B0UuA5A1;
 spf=pass (domain: gmail.com, ip: 209.85.160.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id g12so5753277qto.13
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Jan 2022 09:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5pxkIOS08VVmRt9TLczovrdvIAiITEV8A0dbFk6lNWc=;
        b=B0UuA5A1ra7mTpDn+RNtIRGBM5lrw7Rll6/w1b4O6XrWB9Nyshc64pvEMOIs9ykVfA
         oDGmrLs3YtLvNkJv/7xTZssyr8ZT+ZtUk8B/V8jY5I9F1Locac4hBXuGvH0jjH7cPuWQ
         RQrlKa7hg/uD6qPSi0dgTOZbfkacY5/O30OD5lo8f4xFSvvUnSWd+G3f8dpt6Y1Dp37P
         g6K9hccwbFvuuelu0DH5Vv4Iula2EdrWF/53TuGhv12ASujLbi3y1t2ilMpZplsdioYp
         wV2lSbEufFGdDD5zkg7a/N3EUlZgP+4NshVhOa7W3+QfzH0e0WN5VijKk5C7Z4X5gU95
         6RNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5pxkIOS08VVmRt9TLczovrdvIAiITEV8A0dbFk6lNWc=;
        b=afxl5Zeq0KxH8XQOUI+WrGayKliSNqQHArdo7T0RR5g5hH7stddP5YOYpAZp1mFwIA
         Km2ZcU8EbxiiQyNEcq4udu/VzeVaY35WXwByRm+opFNTRar+7sXnoY+hqzba5ojF9Zby
         0DnJA1fGFZM+Du841j2YdeVv8bgRc+j2VdBdSF2dyvKrjsK4G2f7VrNEIDWNBogRvLlr
         aGxRvudpKOjLGh+R2etPPY0+5GdSDnMILwOtOAYDdlaPhcFg8SQIOxgmQlUAJbbpVbMP
         SCimzhbsMyG+a3FVejVj3ib+noXVZSsH69whEvCnU6pYX73d8ULbCV5fSkbE1W9LROUS
         luSw==
X-Gm-Message-State: AOAM530Ve314Z1l3Q19D29pbKKh1ORHk3KKL+LnoCttxjOLj1l4DkX+3
	0fsVye927Mm+e/XDmNjfNJXawu+KNwgmBvYxVm8=
X-Google-Smtp-Source: 
 ABdhPJyGdUzadSQ+8N3gyZKk4LERdekxzciekGBm5XzPaVFQ3aGakfVm5LL0Z4aTiWf3uqOM6XjKM3U8wS7hMGV+u7M=
X-Received: by 2002:ac8:75c6:: with SMTP id z6mr6899588qtq.532.1643391543767;
 Fri, 28 Jan 2022 09:39:03 -0800 (PST)
MIME-Version: 1.0
References: <20220125181339.114315-1-f_l_k@t-online.de>
 <26359.1643390123448861343@lists.openembedded.org>
 <81dde554-b80e-43aa-cc85-033f858ff2a0@t-online.de>
In-Reply-To: <81dde554-b80e-43aa-cc85-033f858ff2a0@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 28 Jan 2022 09:38:37 -0800
Message-ID: 
 <CAMKF1srApj-60009gE=U=RgCO_XGbgPJPP9HuPvp99yQ8cAyiQ@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH] folks: make some dependencies optional
To: Markus Volk <f_l_k@t-online.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Jan 2022 17:39:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95152

On Fri, Jan 28, 2022 at 9:35 AM Markus Volk <f_l_k@t-online.de> wrote:
>
> https://github.com/openembedded/meta-openembedded/blob/aa22894fa352986a62c4530ad8facd8868b2e535/meta-gnome/recipes-connectivity/folks/folks_0.15.4.bb#L24
>
> Doesn't this line explicitly disable tests until DISTRO_FEATURE ptests
> is set ?

yes but it means we think that tests do work when ptest feature is
enabled which is not true. So it should be disabled even for distros
enabling ptest feature.

>
> Am 28.01.22 um 18:15 schrieb Ross Burton:
> > +PACKAGECONFIG[tests] = "-Dtests=true,-Dtests=false,python3-dbusmock-native"
> >
> > You don't install the tests, so this serves no purpose.
> >
> > Just set -Dtests=false explicitly, unless you install the tests and do the ptest integration.
> >
> > Also the dbusmock test in folks is broken, it should be cross-aware.  As you can't check for target python modules it should avoid the check in cross builds.
> >
> > Ross
> >
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95151): https://lists.openembedded.org/g/openembedded-devel/message/95151
> Mute This Topic: https://lists.openembedded.org/mt/88678231/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

