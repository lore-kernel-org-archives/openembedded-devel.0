Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95AF1C433EF
	for <webhook@archiver.kernel.org>; Wed, 12 Jan 2022 13:04:18 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web09.22688.1641992657572269204
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Jan 2022 05:04:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=0tnqz9ie;
 spf=pass (domain: burtonini.com, ip: 209.85.221.52,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f52.google.com with SMTP id l25so4050698wrb.13
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Jan 2022 05:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qvXxcy9SHVfoJP2Y7Www38gXgUAXNOUoFWJlDSCj0J4=;
        b=0tnqz9iefRrPu9SqoPPJtxRRA8AH1P23QSDNdnoOV5r6icaulE2FeDU+NxG7BLlboJ
         PNUlZqhekfalWcORUblrhwIbHNoAip8a9QwLQMp61ZKnd2FBRAq6Rfkj5YP/FqIpzBuw
         oXxKY2cCW94tJuUMa0cd66T8uVn8WbTFcGtt0FJpkSS7Xf47AHIbnNhR0zKB2nVuH0+D
         pGHhLFlhfgFhhprLMmvid2s04FdRCvkyD/uRHzTI7HacQLBZ/ifpT9WJdPvrW1PuyvRa
         ugt/KGmQ/ZAG2+eRAWgnmYNwPKyXO4HZlwW+R2xxesvLATKelh1zL+PScFAFAsqr6lpR
         4FcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qvXxcy9SHVfoJP2Y7Www38gXgUAXNOUoFWJlDSCj0J4=;
        b=da0LNCaNo51zEj/xljPOwaFSv1/OLt6PGD20/LkiuhKzNwuxKVvZKOifZRe1kBDgTy
         vrT81HJBHal12NI71E0hmY5qI1erU1Y/CNlk0i2y6fJgbli2guWisa7YN9FTq/Rb/Eqs
         ecihMkiCm7/CWcYtLv3Ei7s+1dRjiYXsYXjE6y65bu07FsQixFin0N5XXhXuQJ9I6mk5
         KMwGILbAMmO9Osdr9VsyBehklBqXpP9EaSXw+htcNQTlzD0Yup40xbmddJlCd4Q+jDDB
         3Ydp1n3/aKrX0cmtjUh8S0CNX/hbUtkXVJzOokSvEiKw/aeZcbZZmB3A4lUBYET8IJja
         RbyA==
X-Gm-Message-State: AOAM531XPd0KQv0DfYn7lUdtBmdnUG6/ToeaTjr9cnudlEDmFA82VwlX
	BK6UBmUwRBMER+0outB0mwJR07ROSh7lI6B5ygf8xA==
X-Google-Smtp-Source: 
 ABdhPJygPJTIEhgmVwRNGsBGN+wxewcr5SDcNxQTIFpIPqQ3NPcQUYLdy3aTzPhN5S05TO9KsnrfXpAwpmg3hr7GcyA=
X-Received: by 2002:a05:6000:381:: with SMTP id
 u1mr2041194wrf.451.1641992655879;
 Wed, 12 Jan 2022 05:04:15 -0800 (PST)
MIME-Version: 1.0
References: 
 <CANx9H-CHGrSzA=vZUAs=5Gg=5xw4W2MUKnvANv-a7xxQvJq5qA@mail.gmail.com>
In-Reply-To: 
 <CANx9H-CHGrSzA=vZUAs=5Gg=5xw4W2MUKnvANv-a7xxQvJq5qA@mail.gmail.com>
From: Ross Burton <ross@burtonini.com>
Date: Wed, 12 Jan 2022 13:04:04 +0000
Message-ID: 
 <CAAnfSTs7Uu5OHb3n6AikSHHr6b-t=fJyqbGBbVnSDaEdg_ttNQ@mail.gmail.com>
Subject: Re: [oe] python3-cryptography "success"
To: Tim Orling <ticotimo@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jan 2022 13:04:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94786

On Wed, 12 Jan 2022 at 04:34, Tim Orling <ticotimo@gmail.com> wrote:
> I finally cracked a nut that was at the root of our cross-compile woes with pyo3, which was the root cause of python3-cryptography not building.
>
> For those interested, my WIP branch is:
> https://git.openembedded.org/meta-openembedded-contrib/log/?h=timo/python3-cryptography_36.0.1

I've just built this on aarch64 host for aarch64 target, and it built
successfully. Congratulations! :)

Ross

