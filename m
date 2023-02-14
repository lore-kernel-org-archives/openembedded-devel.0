Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAA79C61DA4
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 18:32:57 +0000 (UTC)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
 by mx.groups.io with SMTP id smtpd.web11.2147.1676399576875219106
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Feb 2023 10:32:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112 header.b=ZxfYdxh9;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.217.42, mailfrom: brgl@bgdev.pl)
Received: by mail-vs1-f42.google.com with SMTP id h19so17394367vsv.13
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Feb 2023 10:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1YaEBMh7r5Q/bBX3ii4rx07XDIGF8N/DkWbNTx0DZmg=;
        b=ZxfYdxh9Nv7gfzBg1jPD5uKs0/KpiOEhFEBzYHHGjoQyE7P41l4kJqnB0nvHNz9S0L
         lFQCBGEXvrRHUJ6yru513Oh5PAmsDgMpCg3gftlEbBmarU2FvQ+lTsfJcRiq5YBWSkNv
         SaCB9gJ8lc+TTE69JsunruEDsPDriUFZK8uMiauP3kuFeeocF8W3XzPZXiy5B4ck2gid
         GPEWowxyxUzaqEJDF7R4Mg27rIU7bAKiZICm4oKrOxYT8jOmOv+Nlu9Wfd2uBCH9IQim
         4h2xR0iHE2ATsicV5xlFW2wdAF8/cwIPtfZCSZuaOSgkeGbkcHT4pbVuYxbJipI8fjx8
         ULTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1YaEBMh7r5Q/bBX3ii4rx07XDIGF8N/DkWbNTx0DZmg=;
        b=Hi+Ow3eAYQJz8LTYNj6ELgotLS3YyhTGyHYRb4Ns4hPIalgmgytnn6gLvw5gBv6+4B
         jFfMDsCVyV99BrsvDsk2D6a4GP7eiSFRbOQOavltOg5XIvXwcqU2My7Oz/spzRZM7rJo
         RAeAvDz2NWPouhBg728KTxjqBDczRWyvtLMlzT7cL53SB0hvNtH7ZJgU5c0Zc7P47tz0
         uFKDvHAcDpCJJPq30/l8w3mzUrz3byjBT7HgoQjdKIoNI5JUbhsRY0C6Tmu0FBIA4/pt
         47SKONE+p6Hcw/jOSZ1ETQ3WN1sUNSCcNptFoKymmJNNCIq/zEPqv9QxcxGkZQDjwApx
         r7iw==
X-Gm-Message-State: AO0yUKUMpScC8RfIJ6zjLQJgnza8gfgMBo3GtW+aNCliAR3X+6C24enz
	XTS368ITCAMnffZSr2ODMk4/ZFdIrPDDW9gzo0UtKQ==
X-Google-Smtp-Source: AK7set+7wQtqGTEAMOcdl94Jp2b8eT9E8fbzUsDc+N9SPYwIhkHXFjT5RpwCx9pU8swm+Lo1/in7xfL/ZKg2DZ58nhM=
X-Received: by 2002:a67:eb06:0:b0:410:e23:4ba with SMTP id a6-20020a67eb06000000b004100e2304bamr446053vso.80.1676399575512;
 Tue, 14 Feb 2023 10:32:55 -0800 (PST)
MIME-Version: 1.0
References: <20230208152541.136848-1-brgl@bgdev.pl> <b49ddb5c-3f15-2887-8f53-c6d73c93afa2@gmail.com>
 <CAMRc=McjbMaNk=DRYvq8deBUWtiHZQEs-8CTvGOSDSYQdBZojA@mail.gmail.com>
 <5e17e6d3-da7b-7222-bcf3-feef6c6fc776@gmail.com> <CAMRc=Md0SRAnbQ=A1qgwJ8thoApe6pOZ9xyim89bigfRkvxGJA@mail.gmail.com>
 <535761c1-07f0-b6fa-3df9-14db6690da82@gmail.com> <CACMJSevdEqhyyV1mDjA2xt5nm28T996aPjyOa69uy8Z-GsuckA@mail.gmail.com>
 <40fc9b0a-32de-81b7-ca51-62c4189d08b5@gmail.com>
In-Reply-To: <40fc9b0a-32de-81b7-ca51-62c4189d08b5@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 14 Feb 2023 19:32:44 +0100
Message-ID: <CAMRc=MfASCLcDTFq+u3pA8TAr-Vpx1md6pY1dzUuB1gUpsWQ-Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 0/3] libgpiod: add support for libgpiod v2
To: Ferry Toth <fntoth@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Khem Raj <raj.khem@gmail.com>, 
	Bruce Ashfield <bruce.ashfield@gmail.com>, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Feb 2023 18:32:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101079

On Tue, Feb 14, 2023 at 7:16 PM Ferry Toth <fntoth@gmail.com> wrote:
>
> Hi
>
> Op 14-02-2023 om 19:10 schreef Bartosz Golaszewski:
> > On Tue, 14 Feb 2023 at 18:21, Ferry Toth <fntoth@gmail.com> wrote:
> >> Op 14-02-2023 om 15:05 schreef Bartosz Golaszewski:
> >>> On Mon, Feb 13, 2023 at 11:15 PM Ferry Toth <fntoth@gmail.com> wrote:
> >>>> Op 09-02-2023 om 20:57 schreef Bartosz Golaszewski:
> >>>>> On Thu, Feb 9, 2023 at 8:26 PM Ferry Toth <fntoth@gmail.com> wrote:
> >>>>>> Hi,
> >>>>>>
> >>>>>> Op 08-02-2023 om 16:25 schreef Bartosz Golaszewski:
> >>>>>>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >>>>>>>
> >>>>>>> We've just tagged the release candidate for libgpiod v2. This is a major
> >>>>>>> release entirely overhauling the API in a backward incompatible way.
> >>>>>> Thanks for creating this!
> >>>>>>
> >>>>>>> While this is not the final release yet, it's not likely to change much so
> >>>>>>> I'd like to make it available in meta-openembedded to give it exposure to
> >>>>>>> some testing. When we do release v2.0, it'll be just a matter of bumping the
> >>>>>>> version.
> >>>>>>>
> >>>>>>> Currently no other package depends on libgpiod in meta-openembedded, so I'd
> >>>>>>> like to avoid having two packages (libgpiod and libgpiod2). Instead let's
> >>>>>>> provide recipes for both versions but keep them under the common libgpiod name
> >>>>>>> as it's unlikely anyone would need both versions in a single system. This is
> >>>>>>> after all a medium-sized project that shouldn't require too much work in order
> >>>>>>> to port a user to the new major release.
> >>>>>> Nevertheless there may be packages in other layers using it (meta-acpi,
> >>>>>> meta-intel-edison). I think there will be a period where both may need
> >>>>>> to coexist.
> >>>>>>
> >>>>> Can those layers just set the PREFERRED_VERSION?
> >>>> Yes, but it doesn't the problem when one app needs v1 and the other
> >>>> needs v2.
> >>>>
> >>> Yeah, this is what I'm trying to explain. How likely is it that the
> >>> same system will use two versions of libgpiod at the same time? IMO
> >>> highly unlikely because this is not gstreamer or some other huge
> >>> project, it's a small-to-middle-sized library that's most likely ever
> >>> only used by a single program or script on a given system.
> >>>
> >>> I'd prefer to not provide libgpiod and libgpiod2 packages but instea
> >>> allow to alternate between them using PREFERRED_VERSION. If anyone
> >>> complains, then we can rethink it.
> >>
> >> libgpiod2 is in Ubuntu Kinetic and is a dependency of openocd (> 1,1)
> >> and eg25-amanager.
> >>
> > Wait what? libgpiod v2 is not out yet, what's up with ubuntu?
> libgpiod2 (the package) is based on libgpiod 1.6.3 (the source)
> >> Those packages will block libgpiod v2 from going in (that would be a
> >> pity) until they are ported, or until they are dropped (a pity to have
> >> your dependents dropped too).
> >>
> >> On a smaller scale, Intel Edison Arduino uses libgpiod in 2 apps. To
> >> port them I need to figure what changed and how to fix them. Try some
> >> example etc. because at this point in time there is not much example
> >> code. But installing libgpiod v2 breaks some systemd services because v1
> >> gets uninstalled. Luckily in my case it does not break boot.
> > I will be more than happy to assist with porting! In fact I will look
> > at porting openocd myself.
> Thanks, I start a new thread if I get stuck

Feel free to post on the linux-gpio mailing list.

> >>> It's not like we're changing the default version in any of the stable
> >>> branches anyway.
> >> True. I just like libs to change version when they have compatibility
> >> breaks. But maybe that's just me.
> >>
> > I don't really care what distros do. I maintain the meta-openembedded
> > recipe and only have interest in its versioning. Ubuntu can call it
> > libgpiod2137 for what I care.
>
> Of course. That was just an example, I didn't mean to hijack the discussion.
>
> I just seems libgpiod 1.6.3 and 2.0-rc1 can not currently coexist (i.e.
> the packages can not be installed simultaneously). Or I tried (to modify
> the recipe) and did something wrong.
>

No, you're right. Shared objects have different ABI versions but other
than that many files share names: the header, pkgconfig manpages etc.

I have no intention of changing this honestly - better just port the apps.

Bart

