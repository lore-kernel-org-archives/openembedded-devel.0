Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A88AC433EF
	for <webhook@archiver.kernel.org>; Tue, 23 Nov 2021 17:28:07 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.14430.1637688485752781616
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Nov 2021 09:28:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=3Ay3YD/h;
 spf=pass (domain: burtonini.com, ip: 209.85.221.43,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f43.google.com with SMTP id r8so40174687wra.7
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Nov 2021 09:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WAZa1F++56tpBpRh4MiikzMtpWH3eVfAdYlVFq/NGZQ=;
        b=3Ay3YD/hVdU6bCPe+tWrFMO6Y0xpVygYY+8g58JhRnnEro9vYIUd/pMe/s5Q4Hu1mf
         OAmBWHV6s+byFSStWmvEEILsOtnMbMadNIM2Srw4bbWS6LWxqZ3S4UJkwKFleKZHw5kL
         p+vDXAannmXGfZFqR/7KK5eo1ymj4ehwWE5XaWXAWZYl3n27UBmKECztL0kV+ZvS7dCz
         RMDlugw0RYT7AeigMikzWRbWYY74GpkgNYeOMuwwAvPV31jRc2MNT7WdNx1tNM5cKN4t
         IWJLtElzS9TOxKeFsQFbcExcyFl3rPbv4VZQjDq+2lcyNUVSbdNwMWw7R44R3+bSB3qr
         +FZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WAZa1F++56tpBpRh4MiikzMtpWH3eVfAdYlVFq/NGZQ=;
        b=D1v/343V82quZZZbeM2GNgY504JEfSGKFchI8E+mxrYRA+3Ps3IQBbPgUWwRe6rO2Q
         Bby5do839UObpwLKtAGqQJRv9KcFyX2iLdoDfy7ol7gE/2jnStZA/oeJDOXlC8na2JFZ
         TPdk4O3IA/iEeQlb4v0/xQwu9NZIYrzsDfjx+iYx5L3GZIZx3ag5nEbLRyIXkvkRAOj/
         C92bvP1C6GyjI97WkezGaZzL+rLn+Ueq7bHNpWQ2fCWu+G7RwNaNJ45ntyQsjOagnEBM
         Kl/HQhQrWdp6F5BC/Zpupvk2CCEBMZ5nPpsvTf9/t73NwozYEHA9xkhUOoJxSWmYJDuS
         OMKw==
X-Gm-Message-State: AOAM533wWntiEUTxsAil6pWY6hRk8XNCvYXwO41epUhF2RNiKjcB8BVJ
	16H5NL9PGPoVbMSzcVBvK1lM77V8UtpG+fgSNk0NOA==
X-Google-Smtp-Source: 
 ABdhPJzg7GzildFnDv3eR2shx3boCnwX/kfHPmp6s3kiq2j03HXUh2riI+cDoLyAa2dq2rCDwkEHURby3KJ6euGS+Dk=
X-Received: by 2002:a5d:6c6a:: with SMTP id r10mr9783473wrz.211.1637688483904;
 Tue, 23 Nov 2021 09:28:03 -0800 (PST)
MIME-Version: 1.0
References: <20211122131956.1240075-1-ross.burton@arm.com>
 <83e579bb-7d43-f905-c658-5cbc32e9f6a6@gmail.com>
 <CAMKF1soY_mbVHbs0fQi5ytpQxFGty1M1ab_9VnHg0XEpJsAc7A@mail.gmail.com>
In-Reply-To: 
 <CAMKF1soY_mbVHbs0fQi5ytpQxFGty1M1ab_9VnHg0XEpJsAc7A@mail.gmail.com>
From: Ross Burton <ross@burtonini.com>
Date: Tue, 23 Nov 2021 17:27:53 +0000
Message-ID: 
 <CAAnfSTs9r_78--LZScH4WqvmoPLzvCiSSvBcckMBJV0=kKWZyA@mail.gmail.com>
Subject: Re: [oe] [PATCH] fwupd: upgrade to 1.7.2
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Nov 2021 17:28:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94109

On Tue, 23 Nov 2021 at 17:20, Khem Raj <raj.khem@gmail.com> wrote:
>
> also seen on YP AB
> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1748

On it, misunderstanding about where lzma is needed.  v2 incoming shortly.

Ross

