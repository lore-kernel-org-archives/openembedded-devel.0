Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61646C433FE
	for <webhook@archiver.kernel.org>; Fri, 30 Sep 2022 22:14:24 +0000 (UTC)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com
 [209.85.161.54])
 by mx.groups.io with SMTP id smtpd.web10.540.1664576055103553614
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Sep 2022 15:14:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MyE8vflP;
 spf=pass (domain: gmail.com, ip: 209.85.161.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f54.google.com with SMTP id
 m11-20020a4aab8b000000b00476743c0743so3139112oon.10
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Sep 2022 15:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date;
        bh=lPwHiRxLn2m6fX8vjqad59pSKDRWFCc3NewGjS50MDc=;
        b=MyE8vflPxjMv5AQN3Oxqfc0++dxwDVgAybXaoei7vr0elgCfPPbhLRU1zJZyWE3HmR
         FqY7XnOXT510Cy5QMgHHWThF4L2CmniU0ZKA13jIU1oLahvGlwqrQsiQAc3dBv/BXCg0
         2srr8xrVQwplHXDlhtraeG1amuO3GJn5PpehIjMyx6S4xtEChB+vy6z4mRo7cJtf5Twb
         6ftuqN6y4nu03UGNbk/tdSSnDG9bv5Q6OhwlMIenGB+wnO/98blnGmdwcD/x7iWES1g5
         iwZvYNuJePVXxH5sstn/ITLcvU+gQ9qJlrE1f9eWK4mlMfoRTG2FkAL5K6yvLb10UieM
         6LLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=lPwHiRxLn2m6fX8vjqad59pSKDRWFCc3NewGjS50MDc=;
        b=UMMuA3VPsUD+hn5cHAj+iYjV0leSQAJDOWmJoGw6Or6+pVIJW7QqOsuKS3xpxkLAp4
         PlSPo+hoFuameSden5AGppJZ9Sn8iDKwXqA8zf/PvJIhLP303ZyZOjmtfTg89zpumXft
         QKDJIEjTWz/xyHXIx3nQrGiHs8r6ZIDsmAazPdmQs3BeD3f9Y/7/l47vHK3f00Xq3pBq
         iVPje8i9lvto5YNKqM1PkgJDgFqbMD1gWzhC1A+9yrFHcq9uQJmvA6mWA27NJBaT5e8w
         LMmDGmjUPTzhlg4ucEDpT9SXYkNtj0Eou1bktA8A1RLldSiZhAM44ONeDRxc6RsY3dYQ
         Xqng==
X-Gm-Message-State: ACrzQf2ytZmkK9D960VjeKmMiZCdR8gFiSfGtYDRzeM4nSEA3ComDSAC
	OkwDAoytRKwUuHUO9JujxkkvayQY1c8xnQ4naHmeLbKYJPhRyg==
X-Google-Smtp-Source: 
 AMsMyM4uvM18CKnup0QKfsX5g4U6b+OKISIoLwz7Os4+Byq7QQ0SV1M18XiKss5XfxxJnPr155GXIb8VkkWhMBCSCPM=
X-Received: by 2002:a4a:d129:0:b0:475:62e0:d7fb with SMTP id
 n9-20020a4ad129000000b0047562e0d7fbmr4070251oor.9.1664576054319; Fri, 30 Sep
 2022 15:14:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220926193424.427667-1-wak@google.com>
 <a8c55901-06a2-8400-ce2c-4cbc5ee3da84@gmail.com>
In-Reply-To: <a8c55901-06a2-8400-ce2c-4cbc5ee3da84@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 30 Sep 2022 15:13:48 -0700
Message-ID: 
 <CAMKF1sqzVTMQMhcBOXqbGX-e2bksR_tNXZyq73NBeqADjj8gzA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] fmt: upgrade 8.1.1 -> 9.1.0
To: wak@google.com, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 Sep 2022 22:14:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99030

I am seeing a. build failure with clang/x86

https://errors.yoctoproject.org/Errors/Details/672380/

On Mon, Sep 26, 2022 at 3:14 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On 9/26/22 12:34 PM, William A. Kennington III via
> lists.openembedded.org wrote:
> > Signed-off-by: William A. Kennington III <wak@google.com>
> > ---
> >   meta-oe/recipes-support/fmt/{fmt_8.1.1.bb => fmt_9.1.0.bb} | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >   rename meta-oe/recipes-support/fmt/{fmt_8.1.1.bb => fmt_9.1.0.bb} (90%)
> >
> > diff --git a/meta-oe/recipes-support/fmt/fmt_8.1.1.bb b/meta-oe/recipes-support/fmt/fmt_9.1.0.bb
> > similarity index 90%
> > rename from meta-oe/recipes-support/fmt/fmt_8.1.1.bb
> > rename to meta-oe/recipes-support/fmt/fmt_9.1.0.bb
> > index c53dd3890..34896153c 100644
> > --- a/meta-oe/recipes-support/fmt/fmt_8.1.1.bb
> > +++ b/meta-oe/recipes-support/fmt/fmt_9.1.0.bb
> > @@ -5,7 +5,7 @@ LICENSE = "MIT"
> >   LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=af88d758f75f3c5c48a967501f24384b"
> >
> >   SRC_URI = "git://github.com/fmtlib/fmt;branch=master;protocol=https"
> > -SRCREV = "b6f4ceaed0a0a24ccf575fab6c56dd50ccf6f1a9"
> > +SRCREV = "a33701196adfad74917046096bf5a2aa0ab0bb50"
> >
> >   S = "${WORKDIR}/git"
>
>
> thanks for patch, similar patch has been proposed in past and it ended
> with a build regression see
>
> https://lists.openembedded.org/g/openembedded-devel/message/98535?p=%2C%2C%2C20%2C0%2C0%2C0%3A%3Acreated%2C0%2Cfmt%2C20%2C2%2C0%2C93321367
>
> can you check if this regression is addressed ?
>
> >
> >
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#98955): https://lists.openembedded.org/g/openembedded-devel/message/98955
> > Mute This Topic: https://lists.openembedded.org/mt/93935031/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

