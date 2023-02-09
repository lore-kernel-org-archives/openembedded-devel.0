Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C5BEC61DA4
	for <webhook@archiver.kernel.org>; Thu,  9 Feb 2023 19:57:54 +0000 (UTC)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
 by mx.groups.io with SMTP id smtpd.web11.801.1675972670658117737
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Feb 2023 11:57:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112 header.b=7crD/YNB;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.222.45, mailfrom: brgl@bgdev.pl)
Received: by mail-ua1-f45.google.com with SMTP id 89so583116uao.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Feb 2023 11:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5RC48w4icnbaIApbhoddagIj/foWE3X6tMCQ4PutABs=;
        b=7crD/YNBw04lA9MZfVtei0p79BjQg2fxDT6FyRjQHxkFyxadBDLtfMqP3lHlRCMURG
         yQka3//OdmDO4FWCke1xsknp1epCtQR0MJhz2aO/cFVErublk6qDXZ0yDtnFeDvuzweY
         GC4+swHs+XZ/3AUnuV4791WYCg7CDks5En95oyhCm+w1lhVwA6Ux20p6WZ2qVv6H8YfE
         qrwK6rYdmEDwR57vGuHG5WGyke0iYvYeZI7jB77Yd8MAlHg8JzDOTDZK2djLwIr3IpjF
         JFsMgs8yEAhCUvSYankwXjHG4FgNxS5MyqlIIwVqCz4Yxmb07jW2UK0cqf/vfaIY+/rk
         mFaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5RC48w4icnbaIApbhoddagIj/foWE3X6tMCQ4PutABs=;
        b=3rCm3pXfMEegtHINRTll2xYi0eFE3NtfFdQUq4HaB03OJ19SsxXJ1JkxqznDM3UAwX
         Mz8n0E7wfsvbH9ZDvB7Z6RyJrd8SbQWF3JcjfmWrlsSFg3BbfkSb+fwusUnBqwpfGCTb
         MuRpsqgQthSJyPpNmaFkbsUxB6xiOiCOT3F6bL9DzICgnR6+blrseFDQn5x4kGlQe/mD
         jWijZg/iVKjJMYjPk/VvuyvDth5huk6EpBIpgPpKkHhby77TINo2jt4ynoGKflaty8Po
         E8SGckR3Wg9OuPZeMN/vxI5nbJq/IMh+njhwab4tkoyT5AYyhna9CALgjQi/ICE99mdl
         fLZg==
X-Gm-Message-State: AO0yUKUHRvwX5ZUmwl2i9ox72dorlCs5FDB3v2Gudqwz3Pzgd0WQ+g1X
	HpiB9JwmK489u9zsD2RFAr5+Jfe5LEqVuVnrwr/YNA==
X-Google-Smtp-Source: AK7set+fnWYfUT2t5W6HCS3tUUe/T5ppax5PQIMN+Q+5BdGbwIyirKOam8lqnn7bVq07hoU8Ld6fUAbxGuOl+1iVdWc=
X-Received: by 2002:ab0:719a:0:b0:419:5b8b:4cda with SMTP id
 l26-20020ab0719a000000b004195b8b4cdamr2850970uao.8.1675972669401; Thu, 09 Feb
 2023 11:57:49 -0800 (PST)
MIME-Version: 1.0
References: <20230208152541.136848-1-brgl@bgdev.pl> <b49ddb5c-3f15-2887-8f53-c6d73c93afa2@gmail.com>
In-Reply-To: <b49ddb5c-3f15-2887-8f53-c6d73c93afa2@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 9 Feb 2023 20:57:38 +0100
Message-ID: <CAMRc=McjbMaNk=DRYvq8deBUWtiHZQEs-8CTvGOSDSYQdBZojA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 0/3] libgpiod: add support for libgpiod v2
To: Ferry Toth <fntoth@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, Bruce Ashfield <bruce.ashfield@gmail.com>, 
	openembedded-devel@lists.openembedded.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Feb 2023 19:57:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101008

On Thu, Feb 9, 2023 at 8:26 PM Ferry Toth <fntoth@gmail.com> wrote:
>
> Hi,
>
> Op 08-02-2023 om 16:25 schreef Bartosz Golaszewski:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > We've just tagged the release candidate for libgpiod v2. This is a major
> > release entirely overhauling the API in a backward incompatible way.
>
> Thanks for creating this!
>
> > While this is not the final release yet, it's not likely to change much so
> > I'd like to make it available in meta-openembedded to give it exposure to
> > some testing. When we do release v2.0, it'll be just a matter of bumping the
> > version.
> >
> > Currently no other package depends on libgpiod in meta-openembedded, so I'd
> > like to avoid having two packages (libgpiod and libgpiod2). Instead let's
> > provide recipes for both versions but keep them under the common libgpiod name
> > as it's unlikely anyone would need both versions in a single system. This is
> > after all a medium-sized project that shouldn't require too much work in order
> > to port a user to the new major release.
>
> Nevertheless there may be packages in other layers using it (meta-acpi,
> meta-intel-edison). I think there will be a period where both may need
> to coexist.
>

Can those layers just set the PREFERRED_VERSION?

Bart

