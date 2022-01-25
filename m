Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8007C433F5
	for <webhook@archiver.kernel.org>; Tue, 25 Jan 2022 15:15:22 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web08.8416.1643123721503137582
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 07:15:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=PsUMchJ6;
 spf=pass (domain: burtonini.com, ip: 209.85.221.41,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f41.google.com with SMTP id c23so4830281wrb.5
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 07:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kwsiRmJ+LSBlzqonTd6zfNu0uItz5CpocUcBQLEwVeI=;
        b=PsUMchJ6QEqxxGoLbTrQdZmHn9fYv/m945ODyJPxITrmJ9Y8A1Gx+2+/gf+XZgpPOw
         c7ylG21ph1C+Ra6VNOkac+g/98xs+I7UlDHK6lCh8x5TgKXPyOAlqOxLoCRsxNRszGAx
         6uDzCi/a3rP5+PVQ7Imy7r7WqWEpXQqCLaR7mZO3aR3imV6jE6/5ReNxuwauZ0OPR8rw
         AwAjdtfNlRt7cKQJWx8iU426whCuQiAh2PDbUZ/0iHzBfzxp3k5tlha5IJ8i4SdXe7qB
         QSVyxt6a1u2ZzNLjsyKLQTUO2pEeny2JF5scjmeGX+tivVM1ScpkeBeuqWqBJ1AFGTN9
         AHFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kwsiRmJ+LSBlzqonTd6zfNu0uItz5CpocUcBQLEwVeI=;
        b=x21wNK35fykHHOg4yShVAzLTmO0+b8mzdInisIS77b0ia3om8iav8RYhF3k5BdIBi1
         ArwNbO3bASHs/hI4TDEQNMPItQ/qWOpY1uO+mEvFHh61LjJ2L9AqP1pX5Mrb3LmxFuYO
         AZRIJvJ5WOHAiJirc2dTbvXH44RTKlBpjG215n41Hz9swf2zrIsBkrNPJ80cUmCkz070
         nwpXuuHV4FzCFpeoOa4kt8SSpdpnv6UdW4yGx9YA3HAzl0RCYVA4zTeiHfG/+K/Cf4Wy
         ZZiC+YRuZxmUVa4T/8Tdgo50c9i/pjWWJkywx+OIjXBnFXiRhy245VVCxH1zFIby3btG
         WFxQ==
X-Gm-Message-State: AOAM533HPWSC1fTxY1gsZL52ke3WjSV6lp3HdLFG9K6k8EZez2cVG3Ag
	kzQpG17GSXmNRNiy1+SpnYCGxwvrw5gid+bw3FMF9Q==
X-Google-Smtp-Source: 
 ABdhPJz1MvZKqJt6AZbcjhY6zx1ZiVdrD/usG55WCfFXR6RVuZlJ4Zkp32KWKQXz6Sax8jQqWaXZsMbv8CPjU18ywgU=
X-Received: by 2002:a5d:59a7:: with SMTP id p7mr13994512wrr.620.1643123719834;
 Tue, 25 Jan 2022 07:15:19 -0800 (PST)
MIME-Version: 1.0
References: <5dd6e735-8d84-b877-5976-371cb26c5367@pr.hu>
In-Reply-To: <5dd6e735-8d84-b877-5976-371cb26c5367@pr.hu>
From: Ross Burton <ross@burtonini.com>
Date: Tue, 25 Jan 2022 15:15:08 +0000
Message-ID: 
 <CAAnfSTss=nvahTKa82hdaKQ6r-6JCPuzUxTeeAZ-XQg_03XAuQ@mail.gmail.com>
Subject: Re: [oe] do_compile sandboxed in kirkstone?
To: zboszor@pr.hu
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jan 2022 15:15:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95067

On Tue, 25 Jan 2022 at 14:38, Zoltan Boszormenyi via
lists.openembedded.org <zboszor=pr.hu@lists.openembedded.org> wrote:
> What has changed in kirkstone?
> Is there some kind of sandbox now for do_compile that prevent networking?
> Is there a switch that I can use in the recipe to disable this?

Yes:

https://git.yoctoproject.org/poky/commit/?id=4eea21b7addd091c7e549684699897fe7d60533c

The best solution is to stop the recipe doing fetches in do_compile
and instead do the fetching in do_fetch, but it's possible to allow
network access.

Ross

