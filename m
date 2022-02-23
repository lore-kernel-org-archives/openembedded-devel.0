Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC97DC433F5
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 18:46:18 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web11.317.1645641977395184225
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Feb 2022 10:46:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=i82pmpVj;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id x3so10070391qvd.8
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Feb 2022 10:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DOENnGHdrbYMDIGc8aRrziNiuRGw2mLx3Vzi6EPfLGI=;
        b=i82pmpVjEBJ19y61kPmrd/kUA7oB1qeJJbt99aF+/lONvJ2xlVwZPeeKFQEJ0Mjo2p
         108B3s5sJg2XBcsxHgph2YlsnQGqHiAsTkd6idRPArES1G3WitVdfH2gs5nLSk3e0jg+
         pcNdPMLmKdxgx+x7JKqYbfEFzUc+ZWUpMm3gENMhBUyafTaKHa9qqch+bTWj7cgQ7eKd
         YbxqqtOQ6nNjzCKdg+gMq63GzWyOyNTiUDN6ZKjrCC6nwmk7qfvnT6iPtswSBuiYMsbS
         D8JntJ2yUpNignVBzXdJ6mLGshdfYfpxZTCuhxtO/ZrLSqlyPHunVy50CS5cqzYZ3X6q
         Oc7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DOENnGHdrbYMDIGc8aRrziNiuRGw2mLx3Vzi6EPfLGI=;
        b=eCIQZd65bcPIuqK3HRgJmtLn7nDpno98v13ch8CL2ZSCXWW6ZXxIgEVak1qf+fKZ3m
         g82Wne9BmwzfY3ckrnnLt3Xfpv/eDXbCA7rdqSIq5RRvbK6+3WpFoaTEo3HyjwymrrX6
         Lhyma5sTtwtcCiLEANbfxBa+4tRe5enEOzF+5Z/ObzD4MZqyGMLHxYqyB6fvC90Ix1WA
         Wqk/X65K/5T7uuvr+mMbi9FwwZQcVgQEM/VSBZcYfVLwcGqYBBLKaEUMzAriCdMkFORK
         96LVXIZ3+0hWjUmPL4kc9dzwdg+X8c56l/S0m/1OR0zdZNgjWrScsJhYvReWW78JibxB
         dNRw==
X-Gm-Message-State: AOAM531lrjZyTQ+fTzju42jQZR+8MtipmRB2GK+toPPqCvWfjrrHPBp2
	EI9sOWh55DDZxEkqv9ObApSsvzb6ZCyWnmlPp6w=
X-Google-Smtp-Source: 
 ABdhPJxe7Vk2gHfhBMhZ1HxfuDfQ9SFj05oeDgvSRgzJCpD41jeQZ/XlNRZF+2LPqzqkAwEN5Br8PZZAgcDy+1PbidE=
X-Received: by 2002:ac8:584c:0:b0:2dd:aaa6:7865 with SMTP id
 h12-20020ac8584c000000b002ddaaa67865mr1109322qth.330.1645641976396; Wed, 23
 Feb 2022 10:46:16 -0800 (PST)
MIME-Version: 1.0
References: <20220222064130.17190-1-ceggers@arri.de>
 <CAMKF1srreo8BKes+3DDnJWjkmu-ZdGqFKeGF7_x3dxUj08xrJQ@mail.gmail.com>
 <4795452.0VBMTVartN@localhost.localdomain>
In-Reply-To: <4795452.0VBMTVartN@localhost.localdomain>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 Feb 2022 10:45:50 -0800
Message-ID: 
 <CAMKF1sru1fKBBcBLaG6W4i9oA3hUP_U5YSq2c2L8dK=kO78eLw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH RFC] pcapplusplus: add new recipe
To: Christian Eggers <ceggers@arri.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	=?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Feb 2022 18:46:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95485

On Wed, Feb 23, 2022 at 10:41 AM Christian Eggers <ceggers@arri.de> wrote:
>
> On Wednesday, 23 February 2022, 18:21:00 CET, Khem Raj wrote:
> > https://errors.yoctoproject.org/Errors/Details/636127/
> >
> > NOTE: Applying patch '0001-Fix-timeval-to-timespec-conversions.patch' (sources/meta-openembedded/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus/0001-Fix-timeval-to-timespec-conversions.patch)
> > ERROR: Applying patch '0001-Fix-timeval-to-timespec-conversions.patch' on target directory 'TOPDIR/build/tmp/work/mips32r2-yoe-linux/pcapplusplus/gitAUTOINC+1360d0ed91-r0/git'
> > CmdError('quilt --quiltrc TOPDIR/build/tmp/work/mips32r2-yoe-linux/pcapplusplus/gitAUTOINC+1360d0ed91-r0/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Applying patch 0001-Fix-timeval-to-timespec-conversions.patch
> > patching file Pcap++/src/NetworkUtils.cpp
> > Hunk #1 FAILED at 169 (different line endings).
> > Hunk #2 FAILED at 436 (different line endings).
> > 2 out of 2 hunks FAILED -- rejects in file Pcap++/src/NetworkUtils.cpp
> > patching file Pcap++/src/PcapFileDevice.cpp
> > Hunk #1 FAILED at 188 (different line endings).
> > 1 out of 1 hunk FAILED -- rejects in file Pcap++/src/PcapFileDevice.cpp
> > Patch 0001-Fix-timeval-to-timespec-conversions.patch does not apply (enforce with -f)
>
> After cloning PcapPlusPlus on my machine, Pcap++/src/PcapFileDevice.cpp has
> Windows line endings. The patch has the same for changed lines and the
> context.
>
> Is there an implicit conversion from Windows to Unix line endings on
> the build machine (e.g. by git)? Are line feeds altered on when sent
> via `git send-email`?
>
> For reference, I have a attached the patch file to this email.

maybe inheriting dos2unix would fix this.

>
> regards
> Christian

