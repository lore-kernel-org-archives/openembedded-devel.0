Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E641C43334
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 09:15:38 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web08.7079.1657617326761063971
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Jul 2022 02:15:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Owt9oRQF;
 spf=pass (domain: gmail.com, ip: 209.85.208.43,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id y4so9294328edc.4
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Jul 2022 02:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YmF+YeGWC7xitW4620B17HkKdoeaE+oaUJXENgFbjfo=;
        b=Owt9oRQF7qSWn6a1unq/1cmxsUK5PcW/oHZtLMXHGSCe36QO+PMP/upfEfpFtavK7j
         /0lnwSGGkAsXCvLf7K52ncJbV6xXx/8RMZO1VVc8DKQtljclWQyRlCaaDz+jgMRJXPiM
         YRRpXRM9lUzmMxTnIuCi4YuH+A1ha8tw8o1oy4W1XkYVR/wDgVMbK6OG6uCIKdTe7H6E
         mOpxqcB6q1wrFqJYvOmu1yrekRLb17TmQ4JGS7Zyiqs7HO+Q3AzXmxjr51gODGwAY9XD
         eTKvHRi+gsQUTXXJnANPtJhQTYwypwlXWRJ3xrxMFXv5IJ7UEWagiccqvCVnojMtl1mS
         V4jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YmF+YeGWC7xitW4620B17HkKdoeaE+oaUJXENgFbjfo=;
        b=YNn7i9sYOvnI74SJ40XMkBK5uQK6LxoYQjFLYg5cj5V8SCQ+pb4lBByToFgUmznKPf
         jBXmvnRrJbrEVAWpWp9FjbiDyYPQT5bR/A08N2lS5Y74kbLiArgrQvv5pDcbxYJdvrdj
         nowot/NiJkY0awl8zDcNEZDhBjUC/k8PCxPVgoksHx3fll3pA4iIePkA7OwOIkHmoryV
         5Y4Dqp6K5V4wRgHax1SoHvujzPmgTZ5l6IBDABSnK4LZvv9d5TPOxNpVQPLoU6oRKxAr
         yLfBdCERaFXYk1BYlXSGtsr0E7ko3eSg2kXBNshq7W/xDtd5y3ikkIryo8qEYabrIcQ7
         o1sg==
X-Gm-Message-State: AJIora8a4qvhhecOTzzgLvsvVy8HpFYMm1xmMy8nAm25CM46uiQyeXuj
	e8o+MbuAZVdIn7SlFrIhf2JJNu7qArpfV4SfXTE=
X-Google-Smtp-Source: 
 AGRyM1tnAtKYZG6g2f1et0CMOkf6CuhOefV5e5SgC6949v3F0OGzRvud/7kjid6BW7zQhRWTnlKHAjuxW0WaJrM8Y8A=
X-Received: by 2002:a05:6402:528d:b0:43a:eee1:27cc with SMTP id
 en13-20020a056402528d00b0043aeee127ccmr2291885edb.345.1657617325301; Tue, 12
 Jul 2022 02:15:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220708205048.11990-1-alex.kiernan@gmail.com>
 <20220708205048.11990-2-alex.kiernan@gmail.com>
 <CAO5Uq5QnbkKA9q9bk4xoJj2X4GT7+p3z5_QPLp2Zm1kUPRCVkg@mail.gmail.com>
 <CAMKF1srRvTF4cfxo=Mvqrd3pDRVYzz_hQFX5D52GCEfzQa17uw@mail.gmail.com>
 <170081027EF40BB7.14864@lists.openembedded.org>
In-Reply-To: <170081027EF40BB7.14864@lists.openembedded.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 12 Jul 2022 10:15:15 +0100
Message-ID: 
 <CAO5Uq5R2Kq+LL9pf0Hj22zi1wU1GMVPpCydLFTK9KngkweY20Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/2] nftables: Upgrade 1.0.2 -> 1.0.4
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Jul 2022 09:15:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97816

On Sun, Jul 10, 2022 at 4:21 PM Alex Kiernan via
lists.openembedded.org <alex.kiernan=gmail.com@lists.openembedded.org>
wrote:
>
> On Sat, Jul 9, 2022 at 2:48 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Sat, Jul 9, 2022 at 7:08 AM Alex Kiernan <alex.kiernan@gmail.com> wrote:
> > >
> > > Ignore this, need to send a v2
> > >
> >
> > do you want to rework the python packageconfig patch too ?
> >
>
> Yeah, I've had two or three goes at it and struggled to see how to
> make it cooperate...
>

I've singularly failed to make this work (short of just
ripping/replacing the entire python installation process), so have
sent it with the buildpaths issue still there, since the upgrade is
useful regardless.

-- 
Alex Kiernan

