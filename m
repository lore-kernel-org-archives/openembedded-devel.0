Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52E6EC43217
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 13:57:32 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.43873.1669903045594054250
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Dec 2022 05:57:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=E65g3xHl;
 spf=pass (domain: linaro.org, ip: 209.85.167.43, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f43.google.com with SMTP id j16so2578292lfe.12
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 Dec 2022 05:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xsfA17C1XzZAmO+oZTCIBWlkJS2J1ExcyE5HMuYok1s=;
        b=E65g3xHlkPZBygQZLVzG5qAF1orwrtt/zZ725ZxN3EHPrRTMR9sEtSY1HpRUcLkwV9
         00Nwe9td2VlXQQqK/Hk5WYldoIlDSLf2lEng5k4OFVFJXb/O/wsTQmrDVT3Daw/dmiF5
         O5wnmSKtJEX+QyqjNUOkGqUOV03EK5eRBIODvJ/v+oSCbeh1oEGqNk+FyVXD49SFzoU1
         mI6TwewuqVFKy9hyDsSsdxREIknjIyGZJMivGuK7WmuTVRU5oM6LxPAYY+9R8sqJj8aU
         mmUKnjQw/eppRZ2SAMsMxXJTw+wKkLNrQWrAlnyyfcWKVvZq3RrYGCBs7PKi1vXJoWMR
         8uKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xsfA17C1XzZAmO+oZTCIBWlkJS2J1ExcyE5HMuYok1s=;
        b=EVU1MOC+VpfV/GLjs7xagvNMyVUytjWBMlFMlr6s6MManCELpM/y5CxmxsHJIKQQ+N
         9GCxwIeje4Lb0a1Sy+y1XE/P/5nuWL5mgYXNIic7are4N/IfrtTczadySn26fTETAJSv
         18vfnbSTAKXR3oye3ykAb2eaj7fThH98F2ITP2Bixsm7OZm/CPDw9i41RL03OgAZMgT7
         HAHpCAob0LxLW5lik9YDjGaqU+1Bd4KYlErfLq14qnpIxze/0ByaFzqw7nrVCGnRU6al
         bwOKLVwOw4op3YeYaaeMKPfnwE87pvcplGoJPhSfKRAb5iiCOsNoEK+KZiMW83u7g4wp
         8XYg==
X-Gm-Message-State: ANoB5plEFieUUKjGKM3sMc1AidIhJOBawDEG0X/lZBp2lQIOLwCRa7uN
	PMjb6B6OMW2oUE8ugPsX56YAVA==
X-Google-Smtp-Source: AA0mqf5avluFMHK5lam+PghKxbhLZs0/BB5woBSHjgvEzi9Iz5gHt3eu3fhOOfBL24AwJc9GuZWjEg==
X-Received: by 2002:a05:6512:3f9a:b0:4b4:bcaf:5713 with SMTP id x26-20020a0565123f9a00b004b4bcaf5713mr15628992lfa.103.1669903043839;
        Thu, 01 Dec 2022 05:57:23 -0800 (PST)
Received: from nuoska (dsl-olubng11-54f814-94.dhcp.inet.fi. [84.248.20.94])
        by smtp.gmail.com with ESMTPSA id s21-20020a056512203500b004ab98cd5644sm655231lfs.182.2022.12.01.05.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 05:57:23 -0800 (PST)
Date: Thu, 1 Dec 2022 15:57:21 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Alex Stewart <alex.stewart@ni.com>
Cc: openembedded-devel@lists.openembedded.org, schnitzeltony@gmail.com
Subject: Re: [oe][meta-gnome][PATCH 0/3] gvfs: use native ssh client
Message-ID: <Y4iywSGqI+lA2qkV@nuoska>
References: <20221201134148.116754-1-alex.stewart@ni.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221201134148.116754-1-alex.stewart@ni.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Dec 2022 13:57:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99890

Hi,

On Thu, Dec 01, 2022 at 07:41:45AM -0600, Alex Stewart wrote:
> While rebasing the NI LinuxRT distro to kirkstone, I noticed that my
> pyrex container fails gvfs:do_configure with a meson error about not
> finding an `ssh` client.
> 
> | Program ssh found: NO
> |
> | ../gvfs-1.50.0/meson.build:462:2: ERROR: Assert failed: SFTP backend requested but a ssh client is required
> 
> 
> After some investigation, it seems that gvfs is configured to use the
> `ssh` client implementation in the build machine's PATH. If no native
> implementation is provided in the native sysroot, it will default to
> using the host machine's implementation.
> 
> My new kirkstone pyrex container happened to not install an ssh client,
> and so would fail. Since ssh isn't a requirement to run BB or OE, I
> don't think it's appropriate to use the host's ssh.
> 
> 
> This patchset adds the native bbclass to openssh, when the user includes
> meta-oe in his layerstack, and then provides the openssh-native content
> to gvfs through its DEPENDS. This is sufficient to resolve the error on
> my kirkstone pyrex container.
> 
> NOTE: It's a little odd to me that the OE-core openssh recipe doesn't
> already inherit native.bbclass - when it *does* inherit
> nativesdk.bbclass. I would be open to moving the openssh changes in this
> PR to OE-core directly, if someone can ACK that it would be more
> appropriate to do so.

Why would one really need to build native, the compiler host machine,
version of openssh? Why even gvfs is needed for native?!
For target or nativesdk the needs are clear, but for native?

These kind of things really need good justifications or the whole host
tooling graph explodes and build times with it. In most cases the native
host target has a lot less build dependencies and features enabled
because of this reason.

Cheers,

-Mikko

