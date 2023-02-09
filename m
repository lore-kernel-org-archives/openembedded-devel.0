Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E16C7C636D3
	for <webhook@archiver.kernel.org>; Thu,  9 Feb 2023 21:30:24 +0000 (UTC)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
 by mx.groups.io with SMTP id smtpd.web10.3820.1675978218819938924
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Feb 2023 13:30:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112 header.b=47zkM0T6;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.217.42, mailfrom: brgl@bgdev.pl)
Received: by mail-vs1-f42.google.com with SMTP id d66so3597653vsd.9
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Feb 2023 13:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MhRvdL9O3rze3xD445pKDLpYHEV+8iHQ9EU6sC5glVw=;
        b=47zkM0T64k+PnrZgIhhKvm7MgD6kBgdiW2ax1KC6UmxiitxRII/FOWGJrnEXVEMaZ9
         hBnpi95dYGuuczRMXtdJBfikfEQ90IMI9X3L1rQOcvR5ordJy7lcQlpA/y7lxxSj1UGU
         PbXOGD0zCKiuoBNgAQvRMkmxcdWNDj0Iqo4H48z76ywwP+3loDRf07ThuwUwwsKYmDDS
         r93jxnnx/2pmv2HjyLTDnBV3MsmqiKUeomn1lmOU98E4bMrGB7/xpZoDxepPNhLC3QJg
         7obWfWkuOSTaQdgNA3TVLqBuHUcbD1GVJqIqi2UsY+E5UZWSMWjQ7ByTMe54BZLLXM7h
         WypQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MhRvdL9O3rze3xD445pKDLpYHEV+8iHQ9EU6sC5glVw=;
        b=TXkcGZfM2i+5zBBXo0HajL+K0Xv5W3iL2dXzC0SbnA9meHnl+Ar5SkwwXmHRLClnoQ
         bgP7XXLHc0XmhSelQQ5zLqfL0CwfUgHTvOnef3TbD0Y95WfFalTc5sEIcfNtQoNU1HHL
         upXNIYNmhUJ1Ag2NxZureLjueLhbc8HskUIt4FR6t4+xZRunkWWZo/rFmE7U2UVCb6VA
         REhAWXqgWJB9/sglGHegaoTa7W6et+DQkguEqo+3KW4/98s5Ne+735L2EYd1UfMjjBdm
         vIW7SwA5B2ZgmrYeSEexQsAioMu6ktjRezNWAIcktOSVluP3IhWh0QuD8qLDi7VTiMHQ
         ukBw==
X-Gm-Message-State: AO0yUKVEBzh2WBvpqINtXs7QriGeM3z1FccjBe1FL8fBTGxbzpcoovgs
	pRCkEn7oOZd13KCEMhm9ifp/seZJizj1EQ0k1WLM9g==
X-Google-Smtp-Source: AK7set9tKfwwV3UPMUDzIyOWQ66JaIDT67jN+kHkn6oUh90Nv35D18BNCYWZnWheM0dm00suffnET+/B7Q7agzwDr+g=
X-Received: by 2002:a05:6102:3c94:b0:3fe:b46c:7889 with SMTP id
 c20-20020a0561023c9400b003feb46c7889mr3524462vsv.78.1675978217642; Thu, 09
 Feb 2023 13:30:17 -0800 (PST)
MIME-Version: 1.0
References: <20230125081731.6157-1-brgl@bgdev.pl> <e1afbab4-9f99-a252-c596-9b865711ccf6@gmail.com>
In-Reply-To: <e1afbab4-9f99-a252-c596-9b865711ccf6@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 9 Feb 2023 22:30:06 +0100
Message-ID: <CAMRc=Mf3HzqFHGXKz8q=G6tosfhDr=5y3ODkHjicQjSW3KSuZg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libgpiod: fix python bindings build
To: Ferry Toth <fntoth@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, Bruce Ashfield <bruce.ashfield@gmail.com>, 
	openembedded-devel@lists.openembedded.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Feb 2023 21:30:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101011

On Thu, Feb 9, 2023 at 10:09 PM Ferry Toth <fntoth@gmail.com> wrote:
>
> Op 25-01-2023 om 09:17 schreef Bartosz Golaszewski:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > It seems that automake's AM_PATH_PYTHON() macro no longer sets the
> > $PYTHON variable. This means the python bindings build for libgpiod has
> > been broken for some time. As we know which version we're using -
>
> I have in my conf file:
> # Build python bindings for libgpiod
> PACKAGECONFIG:append:pn-libgpiod = " python3"
>
> and it work ok on Kirkstone which builds automake-native 1.16.5.
> Which version is causing you trouble?

It builds on kirkstone but doesn't build on master (not sure which
subsequent branch first failed) without that change. I can see the
automake version didn't change but for libgpiod v2 we moved away from
automake python support in favor of setup.py so I don't want to spend
too much time on it unnecessarily. I just noticed that
AM_PATH_PYTHON() no longer sets the PYTHON variable for some reason.
AFAIK python support in autotools is quite wonky anyway so good
riddance for libgpiod v2.

Bart

