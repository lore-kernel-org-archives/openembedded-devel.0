Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECC97C433F5
	for <webhook@archiver.kernel.org>; Tue,  1 Feb 2022 21:25:19 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web12.54897.1643750718956756470
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Feb 2022 13:25:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=VX35bpJa;
 spf=pass (domain: burtonini.com, ip: 209.85.221.50,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f50.google.com with SMTP id w11so34466666wra.4
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Feb 2022 13:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1pjEaxSNxALBKH6KJRcC3IQJ0OVzvjWtdspOFxCGemU=;
        b=VX35bpJaAV786+xonXgtByiNtvAcMJzesoFj7NsVe6w1ajZi5EP6sCDiw6Y2BJ2CKd
         O6jfhoiVSvt5Rh6zdo1vxRx48n+w1wdBzYUW23LNkC0QsZR39tbIk+L8lOevQBMCMF51
         50VXn0uyxwFP0U9NQYM58+NP9ABC7RQO7O++o4TKbcHWoINpOwjONd/lWBnmLbFGh96I
         4Izqx2dvwEw1y9Yfebff8JdFrDL9vAM6AoBxfJAzo3/Obgm6q2ya/qVOAgi7G+qZJIh2
         6OaAq6ZPIos0rGPdTRNto8TrLmXCQ2/qHEdoWLgCil0bggc6R1gWOnofiwEWQqc77sjP
         CE5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1pjEaxSNxALBKH6KJRcC3IQJ0OVzvjWtdspOFxCGemU=;
        b=OXotOSyizv1niyRLWnJztd+XCzkK7OzAdvcT14Ml2E2Mbs1UljyUo2rMXlRmKD5bMA
         1w2s5EcyCTDvBKEHVA5uKX1vT8pha2STuIiGkIIdHtfevmH8OlfJ/OYo1m6wbliIHN00
         xH7oL0bE5DRJDzqjgLs8eo15gySJ+sa/DAQtMyaoSzbYmmRw8kWg3O0kxT2Umbz05WA8
         IGo6J28Inq5BDq/Qu01KQATNKRKHx+CNJOOk3vrrDNXbl9seQbFvfmXYXZdMtziF5lpm
         5Wl6VVJXyaW9h5NFMtiTATAWvP6c92GOK+amq+/TauwtqLPmQKj2+1vTwCrpJDQWD5K0
         jZMA==
X-Gm-Message-State: AOAM532aPr3lB+qwGUjVbEvZm09KNbNup9oOv1YaEIKTEyCKFMphdwtg
	f64BYVzbEpTzsQiDukQvaykt78RKXG7/JEUsVRL2OQ==
X-Google-Smtp-Source: 
 ABdhPJx7Hq5PoIaNqen+krpY5O9PvOQErO1ruh6Ro/dMK+PGKNrL1pKcpgFgj3/1+aUO+XykxKhPqKdty7v9sGavlOo=
X-Received: by 2002:a5d:5258:: with SMTP id
 k24mr22281140wrc.231.1643750717279;
 Tue, 01 Feb 2022 13:25:17 -0800 (PST)
MIME-Version: 1.0
References: <20220201165248.1329459-1-ross.burton@arm.com>
 <CAMKF1srakWaXoSHgwziHgRX3MkK_TFZdG5YvMDxUJ1k5weWr+g@mail.gmail.com>
In-Reply-To: 
 <CAMKF1srakWaXoSHgwziHgRX3MkK_TFZdG5YvMDxUJ1k5weWr+g@mail.gmail.com>
From: Ross Burton <ross@burtonini.com>
Date: Tue, 1 Feb 2022 21:25:06 +0000
Message-ID: 
 <CAAnfSTvQo8mCvmwHjk4PK9--fJncufq0hn66mCD4rfugt38Arw@mail.gmail.com>
Subject: Re: [oe] [PATCH] fwupd-efi: upgrade to 1.2
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Feb 2022 21:25:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95209

On Tue, 1 Feb 2022 at 18:11, Khem Raj <raj.khem@gmail.com> wrote:
> > - option('efi-objcopy', type : 'string', value : 'objcopy', description : 'the objcopy utility to use for EFI modules')
>
> is this dropped upstream as well ?

Yes: https://github.com/fwupd/fwupd-efi/commit/6728afd4bca350a0a22aae12f8dc6cca777cbdde

Good work on calling me out on that, I should have explicitly said so
in the commit.

Ross

