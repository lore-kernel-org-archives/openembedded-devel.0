Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE1B2C433EF
	for <webhook@archiver.kernel.org>; Fri, 28 Jan 2022 17:33:41 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web11.1584.1643391221110507838
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Jan 2022 09:33:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WHlkveBO;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id k9so6470047qvv.9
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Jan 2022 09:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JnwG3fcQwRIKkUvGLarbL4avqJmy55aXw565FNBcUBo=;
        b=WHlkveBO5D+aLunCouZMxkKGf08VSEFXZxhhPxSLev/RzGE9hsUxOAqckweBRH5XSn
         sxZvhqG3cfkY08FB8IWRJjmrz+7PDznV9S/KZjK2Y2Jq2gW9CU4qpy140EEFafvrr9r0
         O8ULctCQ4cQrfFOiI9EGod5Eu2Ol9mWb8JjMF8Bl4suaAXhxzKNfMy3vvUV2tSQJhIwo
         XgcD6WagHqsJHLSk6IrIaq5DNvDn6WvCgSEl9cc4gLdcem/2gwbEJ8hcBELJ15EyUIh0
         GiR5FW/BD8D6dev8XUoJXitRNAAa1n1znIVcrnpAebyzeA7GlgrrJhPdYzBdtveAJBoc
         tH6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JnwG3fcQwRIKkUvGLarbL4avqJmy55aXw565FNBcUBo=;
        b=nCu2V9g0lMYmnYcZkgD8O0iDn7zq3XuwN0vYowkQbpngEmggVVknTExZe52CU39Kyh
         bhx8UEII+rwUvOn7CPqYPjjnI22DNqPAjj39Pxpgyb1SkzbzGQBXhgnyLvVNn0b5mdWf
         srj2hXpHXnWdicv5zQ8e8tZ8Ne2QWa7/vll/2NSIej8dnboxxO2aWBMHJ90dHUESqVWO
         D0Jug/Ixtih5J2OS8SfCNoBt7ZIR4hBq4gezTUrzwmBcO7g6oQi+HxEW9eM096H9h+r6
         8YK8JGmE38zQVdcFpceklKXVKMN9tRxGJ6pSQ/Js/iGCOYqFelXB9XbrLluL4K8fDIK0
         Pp2w==
X-Gm-Message-State: AOAM530xK7n4GU7P7qcH/KAHlziOLutFAPzdsLgRaPGAOcWWxRjZuUVk
	vlFGQ3FNLk7OnmgP7BUCt9txjLs2mZxHDeLh1ho=
X-Google-Smtp-Source: 
 ABdhPJyxNGPQOvdjpZZYKlQdoSO0/pZI//2nbB4fWcmI3lym/qWP3Tk+PH3EO8ZIn+2H7HPoilieP9mdv23uwMfYJXo=
X-Received: by 2002:ad4:5def:: with SMTP id jn15mr2513852qvb.16.1643391220058;
 Fri, 28 Jan 2022 09:33:40 -0800 (PST)
MIME-Version: 1.0
References: <20220125181339.114315-1-f_l_k@t-online.de>
 <26359.1643390123448861343@lists.openembedded.org>
In-Reply-To: <26359.1643390123448861343@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 28 Jan 2022 09:33:14 -0800
Message-ID: 
 <CAMKF1soJj_4Z_HR2TLyCouT474N4OgaP=oGxH4gSNvRxXMuDvA@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH] folks: make some dependencies optional
To: Ross Burton <ross@burtonini.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Jan 2022 17:33:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95150

On Fri, Jan 28, 2022 at 9:15 AM Ross Burton <ross@burtonini.com> wrote:
>
> +PACKAGECONFIG[tests] = "-Dtests=true,-Dtests=false,python3-dbusmock-native"
>
> You don't install the tests, so this serves no purpose.
>
> Just set -Dtests=false explicitly, unless you install the tests and do the ptest integration.
>
> Also the dbusmock test in folks is broken, it should be cross-aware.  As you can't check for target python modules it should avoid the check in cross builds.
>

yeah if the tests are not cross building then it might make sense to
disable them atleast for target recipe.

> Ross
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95149): https://lists.openembedded.org/g/openembedded-devel/message/95149
> Mute This Topic: https://lists.openembedded.org/mt/88678231/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

