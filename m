Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1603D6B6AD
	for <webhook@archiver.kernel.org>; Wed, 30 Oct 2024 16:36:09 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.19789.1730306164308967102
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Oct 2024 09:36:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20230601.gappssmtp.com header.s=20230601 header.b=piS4lMP2;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.167.50, mailfrom: brgl@bgdev.pl)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-539f4d8ef66so24486e87.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Oct 2024 09:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1730306162; x=1730910962; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3vdVy8nbHRtaHiwVzHbTQs/5HIEqxPpugDi/zLtZmvk=;
        b=piS4lMP2vKlVh97Y59i7Q6sU81tn73JOMSnhs6ReIuALgpwPMoFM5L9dfqdfAdT9XR
         1bjd7Jj6fak8kjeeqd7oapxSWWqeywkorDLP0MJm0ZIGhXEA4sNEbuZ2+ln8I8tKQSO1
         OSdYsRpulOCNZgz+VfyNQNP3FX3CYcmzmYWHduYFQXHwMCL0hu9WtiyK7Ja8cMnOeoro
         q9+sLJaxPfXS2qGK3abQvmfF+GWtvXK62nBDlx6uNxNg08ROaQB/QB+VBLvo2a2FadT6
         gI4jFUDpLI52chgA45J2wRr7QVbNxYQ1AC1SFoTwScyZkF1a0PfPt21XW/gd0FxabCqA
         IEIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730306162; x=1730910962;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3vdVy8nbHRtaHiwVzHbTQs/5HIEqxPpugDi/zLtZmvk=;
        b=n1VMDU1feuJk4iaHNEl3Zw550WJNUaZuqiLLzCD48YTXEBzKZXsfNt0SM+XhonsLmi
         bz/lcMPePnp1r4skHvNtIVUpWd77J3ItRV3d9GLWpQ9xPhD5yu2v3oknTRNT4+Zros9L
         D+mfYKbIQF44tPMVJzj4IRxiRpTU1WDJnZg4Lskj4lF/6L7OFWmo5lc4at+JN75riHAf
         2F7Y35i5UHfVG8dL8jaCnVGMmd7nQTCOSjK0WURzcl7MaPSM95/yzGNLQnYLpWJAyZPu
         JsSvL2kjiusTMkxxcbtryaWjGGEhTiMNgJE3yMfuFkfn8jX5yHGCaKjvPs3d6Omp2HtL
         i93g==
X-Forwarded-Encrypted: i=1; AJvYcCWHMVzKB/ZFMBCU8hvkxPnpJjMu+rAUMGW8j1Q4My70S1MUSaigHLccEOBHFKP+EEKgsnxymu4KnpsWPrcspW8Zb7U=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwMHnClzZmqxVqgcC/Ra9Zn5UG3hHuHIwpSrw2QTkw6YZN9VxXX
	Ycon6HYRmYKKJRqIW4TQn3182q4Y9F3VVHeLicsKd+oWuKN70Ne3WFrPIo1wwl2HBpRtVBWydEZ
	ZrZEG0g37fVKTuzSLHe4wkVeRP+cjFgVYeROWvw==
X-Google-Smtp-Source: AGHT+IHK3ViZbFs818K2r5eJzh9JbUvYmtfcoYuvoGcUrzNgCClKHjXYvjOcIwa3q6Wt58jsNW61yPyZXPvtVEeoteI=
X-Received: by 2002:a05:6512:3405:b0:539:fcb7:8d53 with SMTP id
 2adb3069b0e04-53b34c5fa2cmr8462893e87.46.1730306161626; Wed, 30 Oct 2024
 09:36:01 -0700 (PDT)
MIME-Version: 1.0
References: <20241028112450.2793248-1-max.oss.09@gmail.com>
 <CAMRc=MdUQ59LmOZAJd=E7qjFiT9UGq2vx4zsHgR3cx7-kNhd=g@mail.gmail.com>
 <CAMKF1srnqVmyuX+PTVAJUWXyN5QZJjc_6JqWy+SNHBpo+LC-tA@mail.gmail.com> <CAMKF1srFVBeLFv99OKbThkepdGv+pE4Op0gbX4HdtMeXW=ok=Q@mail.gmail.com>
In-Reply-To: <CAMKF1srFVBeLFv99OKbThkepdGv+pE4Op0gbX4HdtMeXW=ok=Q@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 30 Oct 2024 17:35:49 +0100
Message-ID: <CAMRc=MecGFRXfdNSwPHrM1uVWOBEoBKuQ=j2gWq6ZM5pQiv0QQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libgpiod_2.2: depend on glib-2.0
To: Khem Raj <raj.khem@gmail.com>
Cc: max.oss.09@gmail.com, openembedded-devel@lists.openembedded.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Max Krummenacher <max.krummenacher@toradex.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Oct 2024 16:36:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113348

Resending from the right account...

On Wed, 30 Oct 2024 at 02:33, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Tue, Oct 29, 2024 at 6:31=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wro=
te:
> >
> > It seems that glib-2.0 is a hard dep for gobject-introspection so it
> > might be better to add it in bbclass itself.

I hope this becomes a conditional thing based on something like:

GOBJECT_INTROSPECTION_PACKAGES =3D "libgpiod-glib"

and won't just pull in GLib for the entire recipe inheriting it? On that no=
te:

>
> Forgot to mention that I will apply this patch since some devs have
> reported this so they can keep chugging
> along, we can unbolt it when we have a proper fix.
>

Well this now does pull GLib even for core libgpiod and gpio-tools
which in reality have no dependencies other than libc. :( I hope we
can get a proper fix in before this ends up in a release...

I'm coming home tomorrow and will have time to look at it.

Bartosz

