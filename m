Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE4FFC433F5
	for <webhook@archiver.kernel.org>; Fri, 28 Jan 2022 18:29:25 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web09.5.1643394565273889684
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Jan 2022 10:29:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ELkA3z+3;
 spf=pass (domain: gmail.com, ip: 209.85.222.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id 71so6346848qkf.4
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Jan 2022 10:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g8HmSJVKCP3HeGUN2dkFhwXRzPYcm4ccWzTh0BpRAvE=;
        b=ELkA3z+3uUoZcAJMDrS/O0y6y9FmAIYylUJOhFgfDktxoAf3goINiOC139t31RIBUo
         QPJJbeSiDsgVPFRwLZbL1cvlFqDu6HOAdvlN1e8vyYtpKFrPDzrWC++LxRUXVce0Ujlx
         2jNLEacr4BsQzfNtnTJ893tWqNLdWzkREYgPNCdFxZecmMXmPjEQWtvRwr3NC9Ic09iH
         fN2QClOGMbIM8xR0mzpKjYRJynd6BTvNJyOXhWDp1V2mDzZGEFJ+8u7GDi5ZvluDjC1J
         i7t7kUuORyphI8tgCfycc3jTEGCcbUHWwCeMC3jjsAvKf32npqs1//63RwxjNz1h6QKa
         hNcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g8HmSJVKCP3HeGUN2dkFhwXRzPYcm4ccWzTh0BpRAvE=;
        b=b30DmLQHf9itpUHVdSPu2S775f5hQAVEhALWq5dOg3NXp7n9pMWA1qZlKFK48h25ch
         5EjQK0aoQcJFLtnlA+qWuDOZv+AxYfTt9twh/KvRjPUdFT8U0kY33i0xiXAeeIArOh6N
         NJeOYtlkrArGwPJtY0v1UmMeiiR9sWKSZzZngat6FxjeF8wZRlj66HzTifjbDC9SfvDb
         9682nnxUi5xMmsrVcyiCEHlObfv+AoJ/QSJlOgw7wzscujMMjeJcpvuRv6PCl6NuOvW1
         wlBXVhebJV7PdYPxqYNyiKQXu68oczAL8T0PYIjwejTvODOfPeQjdmonNuPsJGCuXT6S
         DovA==
X-Gm-Message-State: AOAM531a+6fQzxwuUUVsZAZei2H5NtbJYS16xzVKQRIqcpM0TrasxSbu
	utHrOT3AtENAi8P3ndQkk+Z5MfvSLmF68h728P0=
X-Google-Smtp-Source: 
 ABdhPJw8D5pSTRzycPg35PeuRStIh5p7GY7OgD8k8siP0EqkKtcZfb4xFjW43R6VpAsg/f4lDJ0dYqxtoTxz7xXqpko=
X-Received: by 2002:a37:6493:: with SMTP id
 y141mr6596855qkb.180.1643394564251;
 Fri, 28 Jan 2022 10:29:24 -0800 (PST)
MIME-Version: 1.0
References: <20220125181339.114315-1-f_l_k@t-online.de>
 <26359.1643390123448861343@lists.openembedded.org>
 <81dde554-b80e-43aa-cc85-033f858ff2a0@t-online.de>
 <CAMKF1srApj-60009gE=U=RgCO_XGbgPJPP9HuPvp99yQ8cAyiQ@mail.gmail.com>
 <0cbe12a2-5804-e8ba-7e4e-638ef1ef8021@t-online.de>
 <CAMKF1sqrLsFvLwxWt9g6Ktt+-EjtEfVBowvuXp-CcEzJdxc1bg@mail.gmail.com>
 <a1395a8e-ba6e-9148-b028-5fbdf8caf41f@t-online.de>
In-Reply-To: <a1395a8e-ba6e-9148-b028-5fbdf8caf41f@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 28 Jan 2022 10:28:58 -0800
Message-ID: 
 <CAMKF1son2JrcBe8jia4=Mdjwkp=jDgP6y5wX0b4kT_eUPc0uag@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH] folks: make some dependencies optional
To: Markus Volk <f_l_k@t-online.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Jan 2022 18:29:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95158

On Fri, Jan 28, 2022 at 9:54 AM Markus Volk <f_l_k@t-online.de> wrote:
>
> inspect_tool has a dependency on readline. That is pulled in
> automatically but should we also add it like this to make clear it is
> needed here?
>
> PACKAGECONFIG[inspect_tool] =
> "-Dinspect_tool=true,-Dinspect_tool=false,readline"
>

hmm it is hard dependency on readline ? or will it also work with
libedit provided editline
it would be good to check and perhaps have both the options, some
policies may prefer
to not use readline. Regardless if it supports both, adding a
dependency is preferred in packageconfig
if thats the feature needing that dependency.

> Am 28.01.22 um 18:43 schrieb Khem Raj:
> > On Fri, Jan 28, 2022 at 9:42 AM Markus Volk <f_l_k@t-online.de> wrote:
> >> Like this ?
> >>
> >> PACKAGECONFIG:append:class-native =
> >> "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'tests','', d)}"
> >>
> >> or just with
> >>
> >> EXTRA_OEMESON = "-Dtests=false" ?
> >>
> > you cant control ptest distro feature here so its better to remove
> > that packageconfig and just set
> >
> > EXTRA_OEMESON += "-Dtests=false"
> >> Am 28.01.22 um 18:38 schrieb Khem Raj:
> >>> On Fri, Jan 28, 2022 at 9:35 AM Markus Volk <f_l_k@t-online.de> wrote:
> >>>> https://github.com/openembedded/meta-openembedded/blob/aa22894fa352986a62c4530ad8facd8868b2e535/meta-gnome/recipes-connectivity/folks/folks_0.15.4.bb#L24
> >>>>
> >>>> Doesn't this line explicitly disable tests until DISTRO_FEATURE ptests
> >>>> is set ?
> >>> yes but it means we think that tests do work when ptest feature is
> >>> enabled which is not true. So it should be disabled even for distros
> >>> enabling ptest feature.
> >>>
> >>>> Am 28.01.22 um 18:15 schrieb Ross Burton:
> >>>>> +PACKAGECONFIG[tests] = "-Dtests=true,-Dtests=false,python3-dbusmock-native"
> >>>>>
> >>>>> You don't install the tests, so this serves no purpose.
> >>>>>
> >>>>> Just set -Dtests=false explicitly, unless you install the tests and do the ptest integration.
> >>>>>
> >>>>> Also the dbusmock test in folks is broken, it should be cross-aware.  As you can't check for target python modules it should avoid the check in cross builds.
> >>>>>
> >>>>> Ross
> >>>>>
> >>>>>
> >>>>>
> >>>>
> >>>>
> >>>>
> >>>>
> >>
> >>
> >>
> >>
> >>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95156): https://lists.openembedded.org/g/openembedded-devel/message/95156
> Mute This Topic: https://lists.openembedded.org/mt/88678231/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

