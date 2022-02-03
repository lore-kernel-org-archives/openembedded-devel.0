Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61A28C433EF
	for <webhook@archiver.kernel.org>; Thu,  3 Feb 2022 19:54:38 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web08.2978.1643918077505571093
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Feb 2022 11:54:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dj0kvZnS;
 spf=pass (domain: gmail.com, ip: 209.85.160.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id v5so3831753qto.7
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Feb 2022 11:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Jmnp57Eh7aJLE0jJYBqI5VF7OCR8Va0gnpwPBIadFI8=;
        b=dj0kvZnSCdaZNhfeP2viWZUsQGI67QaN+QpD0LDQtEX/TEL6ibSNX+02JvLl0T083P
         tWf5CuerSwci5ZgZQIIKh1rgYjWOZ0Big956/CITMTz1S8ZzWAQh2REhHoG3t5yo1B7R
         CaApP2n6wcOI4wB45AN48NDCe3X/Nc81GXXj0cdRjboKE0Oxkik7HyAt5L8R1EK11J1s
         Mg2vHh7s5qNEVWW0dWRXdRaMkxZKp5u75ogTPKmywt0/h4wGf5AdZk0UBz4yvM/JPtF6
         GQt5Jv/pzffr7OfulCmRXkKnCdJtrYxLx6OriL5YBYIXKwYA4PbiQev2fBybZIBzp9Sh
         SsXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Jmnp57Eh7aJLE0jJYBqI5VF7OCR8Va0gnpwPBIadFI8=;
        b=Hr4O5o2Q8q/jvb1KQg9HULzmdtNLTHt6UszU7QKO3Z1qlBQ6avl79QWSgxPj7gSimh
         mw7aRAuDWCohVeAzlTacmM/HgTVbekz8t1HjtWGf0/mHsnRExl1/PywjgFIMFXPJiayx
         lZqShsI/SZTJV/UmUtMRmxtk4u1af7FzYJSpmQH05DDzUtPN1mcszLteRgX05haTMaoB
         SdJ+GSFuUyL/UwTVVLX+zicjvYonQJ2p5P/Ay60Jg3HMmuphGzICm3QkZRdmUaK+YUcI
         6b/RbvymCp49pGmNNxoBpSxRghZ4tlG+CX4sAT6+udMZ2zlJdjSnwgvqLqUqUxdQgAeY
         TKsg==
X-Gm-Message-State: AOAM530tLLrAZvLEXW5ssk1HVRlD4jmXUEmA5/9TPXtK3tEV0AVmL3xS
	g0vZjLF6T7latl/7oJABSl15n1ON37lbNQNi5jgHnNPbxPsN+Q==
X-Google-Smtp-Source: 
 ABdhPJxL2sfPU80SqDWLK9U1ZX0qes7+u8qYhT54fjojMCzBhrUvTt1KziqZj2DTfApIY0UUbu8M9i2tmwCT/RHFCaM=
X-Received: by 2002:a05:622a:d:: with SMTP id
 x13mr28372920qtw.54.1643918076355;
 Thu, 03 Feb 2022 11:54:36 -0800 (PST)
MIME-Version: 1.0
References: <20220201163507.1320861-1-ross.burton@arm.com>
 <20220201163507.1320861-3-ross.burton@arm.com>
 <CAMKF1srRuUc033=PpkfiK3AQWRrLch6KTSKYXo7Ar4HiWnmCuA@mail.gmail.com>
In-Reply-To: 
 <CAMKF1srRuUc033=PpkfiK3AQWRrLch6KTSKYXo7Ar4HiWnmCuA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 3 Feb 2022 11:54:10 -0800
Message-ID: 
 <CAMKF1sowLNR1=5L1GHXfAfJD=FP1+mr+H5Zd=aPKSiS4dO9zLA@mail.gmail.com>
Subject: Re: [oe] [PATCH 03/14] concurrencykit: enable 32- and 64-bit Arm
 targets
To: Ross Burton <ross@burtonini.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Feb 2022 19:54:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95216

On Wed, Feb 2, 2022 at 12:16 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Tue, Feb 1, 2022 at 8:35 AM Ross Burton <ross@burtonini.com> wrote:
> >
> > As per upstream, 32- and 64-bit Arm targets are supported.
> >
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > ---
> >  meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb b/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb
> > index 8d04507b09..0018064119 100644
> > --- a/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb
> > +++ b/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb
> > @@ -16,7 +16,7 @@ SRC_URI = "git://github.com/concurrencykit/ck.git;branch=master;protocol=https \
> >
> >  S = "${WORKDIR}/git"
> >
> > -COMPATIBLE_HOST = "(i.86|x86_64|powerpc|powerpc64).*-linux*"
> > +COMPATIBLE_HOST = "(arm|aarch64|i.86|x86_64|powerpc|powerpc64).*-linux*"
> >
>
> this perhaps is fine with gcc but its failing on arm/clang see
> https://errors.yoctoproject.org/Errors/Details/623894/

I have fixed it by disabling internal asm for this recipe in clang and
accepted this into meta-oe
https://github.com/kraj/meta-clang/commit/a4434a00d7fbd212c45c3ecd43ccdc87847f9505

>
> >  inherit autotools-brokensep
> >
> > --
> > 2.25.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#95188): https://lists.openembedded.org/g/openembedded-devel/message/95188
> > Mute This Topic: https://lists.openembedded.org/mt/88836819/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

