Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2356C05027
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 14:05:14 +0000 (UTC)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
 by mx.groups.io with SMTP id smtpd.web11.7539.1676383513854158561
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Feb 2023 06:05:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112 header.b=qrWRBQ5V;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.169, mailfrom: brgl@bgdev.pl)
Received: by mail-vk1-f169.google.com with SMTP id t74so3928035vkc.7
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Feb 2023 06:05:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=F1qHsdx0rL49niMo3WHYtugoVyntzmFs+eHWgpMSco8=;
        b=qrWRBQ5VPvT9kXogDReifRxzA90qecIgJN87p8kL8LBFhRTCeOtD0BgXJSPMXP8NKa
         MWcjDa6850fDqpce/Oi4ti+QMtu1FpsE8s9PN1v2jj8/idr5Q6Zbs76zjtcsee23y6/T
         w/aBT39Xp1OywEgq495CMsNi9Mg/2JhkkuWlmObRegKkiRyFQcElDqJXuuLPSTNV1dD/
         0ZXwaeP1hn2UDGul4cjDVxWR7UvD428G3o2PJ8sJt7vwDZoE9BZ2KDaeU8ckZXm0Xk+5
         lwoU6QfMvfFj+6bra3p77ziYrPqpsm4pvSLyjYchJ7hZ+wll7j7o8FnZ24eZ0S9JY3Cc
         QGWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F1qHsdx0rL49niMo3WHYtugoVyntzmFs+eHWgpMSco8=;
        b=rBNyZMmMkOrrJgsMBMiB7pYBmQrPCI0giZxCJEs1B6u5wEgYxAKWTTE9ZVVswJfs4d
         dQnOLpQZQt65fbBKt6gWPxhvaSLsxcFjGqlfz+DmOxUPmfK6dspD9ldPGapOF0jk6kNt
         okh6gDKlcdalTUmfXcehCmT0rpjf3lOkPBzuwqp9ooiWjpWMUdEwtUpbnHHVKKh/40eB
         mOh1TIrhUduQf2cWZxQ1GIQhpEuheGqZJFKM+naV5yvsdQWXTdxefxZcY2Ga4nb6atXK
         Sv1EBDKwQal+hP+OepX83xurosaq7euNqO4enji/n4g5DISR/oJaWRKQCDL93/h504uh
         OUHw==
X-Gm-Message-State: AO0yUKUUN7+z9zlDBTAb2clxUhcI+YfVG7TFA22B9rXaVoPEhfj6MjUw
	bS1BCaTD0tUDUd6eNA0yMYbwJk60TUHSrqL+0goDcQ==
X-Google-Smtp-Source: AK7set8IVv6BGOjscQ8PpfBGxRq/dWuNR4g2o0lj4DrgHjfhGQpwd55g2eoJkLjw7zoB79ctNC+yqHB92h8yAWn6nR4=
X-Received: by 2002:a1f:1108:0:b0:3e2:446a:18a6 with SMTP id
 8-20020a1f1108000000b003e2446a18a6mr352452vkr.36.1676383512716; Tue, 14 Feb
 2023 06:05:12 -0800 (PST)
MIME-Version: 1.0
References: <20230208152541.136848-1-brgl@bgdev.pl> <b49ddb5c-3f15-2887-8f53-c6d73c93afa2@gmail.com>
 <CAMRc=McjbMaNk=DRYvq8deBUWtiHZQEs-8CTvGOSDSYQdBZojA@mail.gmail.com> <5e17e6d3-da7b-7222-bcf3-feef6c6fc776@gmail.com>
In-Reply-To: <5e17e6d3-da7b-7222-bcf3-feef6c6fc776@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 14 Feb 2023 15:05:01 +0100
Message-ID: <CAMRc=Md0SRAnbQ=A1qgwJ8thoApe6pOZ9xyim89bigfRkvxGJA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 0/3] libgpiod: add support for libgpiod v2
To: Ferry Toth <fntoth@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, Bruce Ashfield <bruce.ashfield@gmail.com>, 
	openembedded-devel@lists.openembedded.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Feb 2023 14:05:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101074

On Mon, Feb 13, 2023 at 11:15 PM Ferry Toth <fntoth@gmail.com> wrote:
>
> Op 09-02-2023 om 20:57 schreef Bartosz Golaszewski:
> > On Thu, Feb 9, 2023 at 8:26 PM Ferry Toth <fntoth@gmail.com> wrote:
> >>
> >> Hi,
> >>
> >> Op 08-02-2023 om 16:25 schreef Bartosz Golaszewski:
> >>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >>>
> >>> We've just tagged the release candidate for libgpiod v2. This is a major
> >>> release entirely overhauling the API in a backward incompatible way.
> >>
> >> Thanks for creating this!
> >>
> >>> While this is not the final release yet, it's not likely to change much so
> >>> I'd like to make it available in meta-openembedded to give it exposure to
> >>> some testing. When we do release v2.0, it'll be just a matter of bumping the
> >>> version.
> >>>
> >>> Currently no other package depends on libgpiod in meta-openembedded, so I'd
> >>> like to avoid having two packages (libgpiod and libgpiod2). Instead let's
> >>> provide recipes for both versions but keep them under the common libgpiod name
> >>> as it's unlikely anyone would need both versions in a single system. This is
> >>> after all a medium-sized project that shouldn't require too much work in order
> >>> to port a user to the new major release.
> >>
> >> Nevertheless there may be packages in other layers using it (meta-acpi,
> >> meta-intel-edison). I think there will be a period where both may need
> >> to coexist.
> >>
> >
> > Can those layers just set the PREFERRED_VERSION?
>
> Yes, but it doesn't the problem when one app needs v1 and the other
> needs v2.
>

Yeah, this is what I'm trying to explain. How likely is it that the
same system will use two versions of libgpiod at the same time? IMO
highly unlikely because this is not gstreamer or some other huge
project, it's a small-to-middle-sized library that's most likely ever
only used by a single program or script on a given system.

I'd prefer to not provide libgpiod and libgpiod2 packages but instead
allow to alternate between them using PREFERRED_VERSION. If anyone
complains, then we can rethink it.

It's not like we're changing the default version in any of the stable
branches anyway.

Bart

