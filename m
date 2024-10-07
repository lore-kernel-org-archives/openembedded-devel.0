Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0667ACFB441
	for <webhook@archiver.kernel.org>; Mon,  7 Oct 2024 13:37:54 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.53283.1728308268333850574
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Oct 2024 06:37:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MDCCBL4p;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53993c115cfso5596608e87.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Oct 2024 06:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728308266; x=1728913066; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Euti9a7anyBKIbeGL7gYB/fpQcEmpsfdRrBovaye47k=;
        b=MDCCBL4p3KfMrVytB3+rniYjLCeIdvU0y46IJytfNS2AaxWKFFJ82CqrwykmPxmtuS
         BBbQuvH5zBeQxqsvcQL1sKrcj5ZsF9blSgeXyyduKwjRIy0P5rs+iM8fLUVK3/eYQNsx
         wLzq6u8cFfn/UYDPcAeVMaPy6nM9pWu156pT2yI5SO4tl7pe+RYu7HRc5thZJKJagEAU
         vT2sG8iLDltJukuSWj5r1KdcMJ22xEisaE2elNqwvhVLx4VwBmdB9Nxvaicbk6d3JghE
         RVTc26+vpAOfjw6iB6jXjlq7Ynb+KKpEuYtNJDz084h6vYNzyOZMoBwBrB/xTSUYcLWQ
         /tfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728308266; x=1728913066;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Euti9a7anyBKIbeGL7gYB/fpQcEmpsfdRrBovaye47k=;
        b=szuUMD6RYqIRgROWG0N0RWsfjvt0uqONuGUmAeS3gEuIyyCqRjEo7L0eEK+fLe5R++
         G1P+QIreBmlF6XAogA+R/N8bIC3LgnngrHvSQWZyFN/CILWsW1MGpvDazb7HxLjEVlIx
         wLjoDLt1bEri60QsDoBU+xOnLM1CyHb+LPFhnz5czw4l6SR6jGBRiEJ7ad0I4c/zIgG+
         4VjKmi/g9UJN7YM0xsDeIS+6epV+vambZrjyKEfCdqQniKGl/hDE8zvK5EZWMt+HTG0T
         ZLENyGmC+KZ7W+OEUO8cRFr0aoWMx3p4G5XAeq/Iak7ZTGh2g9UsOLGl05oxt/BmHYsa
         DBgw==
X-Gm-Message-State: AOJu0YzDYiZh/m7LpVnHeHabxJ8el3DLZVdmlcc9BuoekikP81bCNZSI
	3vMv1AXbA440HgYd9oQuCrDEaETRvS91H9SrNzCeZyhQJd61wNsDtW5Q5UFp6AohPWFvhdxLou4
	+/Rk0HxmeRybSgWQDr54CaKubvQU=
X-Google-Smtp-Source: AGHT+IFGr0HKzuemgZON2HxUwBfCWHBKnOsZcMYyHRXDYlXj0QFrkngMMVBKyzq2OLtRltzQZPBrnmGE+6N2FoDNX6k=
X-Received: by 2002:a05:6512:3b21:b0:536:52c4:d7d3 with SMTP id
 2adb3069b0e04-539ab85bf6fmr5044224e87.9.1728308265974; Mon, 07 Oct 2024
 06:37:45 -0700 (PDT)
MIME-Version: 1.0
References: <ae23174dc7aa9aa7cd5e8fbfbc912bf8d6a3e4db.camel@infinera.com>
In-Reply-To: <ae23174dc7aa9aa7cd5e8fbfbc912bf8d6a3e4db.camel@infinera.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 7 Oct 2024 15:37:34 +0200
Message-ID: <CANNYZj9FdP6GUi_SzY1_041EHbtbtncM=oCMfN9w8DhAGQ93mA@mail.gmail.com>
Subject: Re: [oe] scarthgap: How to revert zstd from ipk ?
To: Joakim.Tjernlund@infinera.com
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Oct 2024 13:37:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112696

I don't understand. Do you have zstd on the target image or not? Where
do you want to avoid it?

Which ipks are you seeing specifically? Do they get installed on the
target image?

Basically it's hard to understand what is going on if the problem
description isn't clear and there's no way to reproduce or observe it.

Alex

Alex

On Mon, 7 Oct 2024 at 15:27, Joakim Tjernlund via
lists.openembedded.org
<Joakim.Tjernlund=infinera.com@lists.openembedded.org> wrote:
>
> We don't have zstd on out target and since it is rather large we want to avoid it.
> Tried to back zstd out by doing:
>
> Added opkg_%bbappend:
>  DEPENDS:remove = "zstd"
>  EXTRA_OECONF:remove = "--enable-zstd"
> and set:
>  PACKAGECONFIG:pn-libarchive = "zlib bz2 xz"
> in our own disto.conf
>
> But bitbake still builds *ipk's with zstd compression, what am I missing?
>
>    Joakim
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#112695): https://lists.openembedded.org/g/openembedded-devel/message/112695
> Mute This Topic: https://lists.openembedded.org/mt/108867495/1686489
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

