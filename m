Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 034D4C77B7C
	for <webhook@archiver.kernel.org>; Thu,  3 Jul 2025 08:54:05 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web10.17780.1751532840254359721
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Jul 2025 01:54:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NuadC6Gq;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6fd0a91ae98so37217186d6.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Jul 2025 01:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751532839; x=1752137639; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=61K+Svk9dYpc8R8rgcTx2Sl0qIpCLYVrzRlR+6K4LkU=;
        b=NuadC6GqA2bGMbuwI8CS0Ue66cHp3vVtgnD9Vx2LVftw+8W4ICkWgrc2AxEB3z4BkM
         TWIKBDSkxIisZCA9Xd6/10oNaoIXcB7yCYmtac3v6UtZ3nJH7ldYdHaoHGYLo0YTB2Uy
         gqdJJV6Bb+kuFLODbRonolV+wjHs5mthUk4Gn+hlqGg3CfdhWGlXwrpA5woCVZa3xfNb
         CzIg92TyLwuGydhJfa2kyDzo1QWPofsPDEnIyjYYGGVbVXwe3nYwVEl/msMC0/Exxp9X
         vhFfPh5keoj5Mzb37xl5iK9ME1y60Ucu35/U9DugBIy+59ITj9m6kqre7uElgkQbQFsv
         UlxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751532839; x=1752137639;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=61K+Svk9dYpc8R8rgcTx2Sl0qIpCLYVrzRlR+6K4LkU=;
        b=Jj/dsY85y2tBlSxUslQLjZY64j34UEKfq5AbhRp3gRWKrUGyKvHRB2/5CdeBvYqFjq
         nS1ACVSqRmZBx+5m5UkWdNYY7N8YRdvhLzMzMnxCkk9mbRy8lmtugDJVnR7fn2cASoAF
         29vIUt2jt6YkUqe+pCNa8IvOre3vZCNNQACvYqMyPMfbTO6aE+CK131vxtcNikw6zo87
         dtXqBVqhjbV3/re83iX+3EHgVx7Knwll3yp2sZ0xh2zVp1XGUbpVcq/tAAuiWAF79+xa
         tF1NUhG4PlhM2wefPsr5XM3ZHrGUiyxTZZj9MiS3BWJfxsFY6jFTRbGhqCsM16X9qz05
         4nnA==
X-Gm-Message-State: AOJu0YzTwy13guEHHalRNr6EsR5hvSmBXpzf9X8zNmFkEZbCsWuP7NAn
	DP9hyjiV+/POWM+7rafYfvbTXjAKHcaivO/e8+y46odd68kEGFYOBKdrhahWrhKoBqCgJd/kHpT
	0HyoemSIhBW6H/ET07WghdpvBk7Hrsue/cA==
X-Gm-Gg: ASbGncuJqknbXYrqX1MRup8SM2HLhu1U7u4QkgX2QhCusBSaUzXgJXO4R2roD08u2jp
	swa9AA6hL09SICuuKABmX53cOOhLHCv5NMhpRi15UAD5HfMkvd0dgJ+mYP7XZ53OPiqpzWISg0F
	WDDiSIjnF+FzIyhHMaemR+Z/XkPTuk4F8qeZ+viRBbf2eU8U69GR04sWy5UvT3A5bPuzL4OMncL
	vc77yOxXfpL
X-Google-Smtp-Source: AGHT+IEIMkd54u4xQyXFScg7vj+j0CQZSAAc6+lRAGbYk3X1cJk/2G5nJbF506hJbkCHQnKUj+t8XEZNAs7zFIO2deY=
X-Received: by 2002:a05:6214:2aa5:b0:6fb:35f8:a984 with SMTP id
 6a1803df08f44-702b1b82623mr83115976d6.44.1751532839202; Thu, 03 Jul 2025
 01:53:59 -0700 (PDT)
MIME-Version: 1.0
References: <184EB1345CA463A8.15677@lists.openembedded.org>
 <5042bc5b-59ad-4ec8-9e6c-7bb1b55c7c08@gmail.com> <CANNYZj9XpCRxX4FqjzmpmF4bTBxgVvRRFOG9GZfytDwrERnwHg@mail.gmail.com>
In-Reply-To: <CANNYZj9XpCRxX4FqjzmpmF4bTBxgVvRRFOG9GZfytDwrERnwHg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 3 Jul 2025 10:53:50 +0200
X-Gm-Features: Ac12FXyqUtv6mi4Z8Xqs09jusLm6sxKARXyIqWrZqyStGNuNrrf-8Md5g0qBywg
Message-ID: <CANNYZj-Yfqx_wsoOCt_vUfh-wa8V-CuL2cKKdWo-WyXzfpRg6w@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] mozjs-128: avoid using build host's rust toolchain
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Jul 2025 08:54:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118216

Forgot to add, the patch is fine as it is though. Two lines are ok, a
mass copy-paste-tweak of the class would not be ok.

Alex


On Thu, 3 Jul 2025 at 10:48, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> cargo class is intended for components that use cargo as the top level
> build tool.
>
> If they use something else, and cargo usage is 'hidden', then the
> correct class to inherit is cargo_common - if it misses the needed
> bits or does too much, then that class should be fixed.
>
> E.g. see how librsvg recipe works.
>
> Alex
>
> On Thu, 3 Jul 2025 at 10:43, Gyorgy Sarvari via lists.openembedded.org
> <skandigraun=gmail.com@lists.openembedded.org> wrote:
> >
> > Alternatively, instead of inheriting rust class, cargo class could be
> > inherited. This would set up the correct environment also, but would
> > also need to override the do_compile task, with something like
> >
> > do_compile(){
> >     oe_runmake
> > }
> >
> > Though IMO it is technically slightly more correct, I find the two
> > variables in the patch easier to grasp. But if someone would prefer this
> > (or an other solution), I can submit a v2.
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#118214): https://lists.openembedded.org/g/openembedded-devel/message/118214
> > Mute This Topic: https://lists.openembedded.org/mt/113962964/1686489
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [alex.kanavin@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

