Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0032AC433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Mar 2022 16:45:21 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web09.802.1647881119306126600
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Mar 2022 09:45:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=17TRg/17;
 spf=pass (domain: burtonini.com, ip: 209.85.221.53,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f53.google.com with SMTP id q8so10161730wrc.0
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Mar 2022 09:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MVr7g8HtS4ri2wXyLk7CyRS3Nx3+4NatZ2EJNy6ASL8=;
        b=17TRg/17C+tynS85f5BD+LMuY21BNNpUi8o0wZ4d8iQcC26hx+odYbicl4j/w/gKfn
         EjkJ4zdqOBYUF93mqyc9zaoHWLFSkj2/lcFaCnl6UJzNTNq0fK6+hiRCsqRcewVJ3Ton
         Hl81FVkAajmLxmEFdz2ZyRiHtCkHbJbVSPZRaaoNjHJWz2e7lQFmLKHmuILmig1KeSRy
         d7D6QY3BiMa6N2tCo92HkyAxM5pCGlTXW+/V/8hMHknd1ybXYBWT1G7i9VrAZC3DJKHW
         zDEKdMeh1u9cd4Eg7QggnxtYDe/P9nTl6dnp9VDnqwsHOE5gD0B1vUilz0/wIw/UZnlW
         YE4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MVr7g8HtS4ri2wXyLk7CyRS3Nx3+4NatZ2EJNy6ASL8=;
        b=wwaA9e+z5EffZSSGP7qMkoIwqUqXVYmBv6Udv4+hPN5Gtvg+D+CQwamQfxKL4/zJCc
         +MNjhmLy38wJzv0rT8/QSWxN8UeQdMuFNN9mHa3SFlEGMjd0fP+7ZaXXnBEohkTkQm7f
         5BXNTr1BLwctSvNwKw3uaAj+dyk0mgnoTcF6VHOrR3MNjILN+ZPZSnM1AFOgZNgOzqFG
         hUVaHOZhIsFFUMTymRXQ+LDdUEqgKdwRfeqieKnNB9Pc+eUdMweckTiNhACD88PqW66/
         gaqCyfK/IFSv5FeJ/1wmbzNFUg7mUXCShEcxJNoOKVDGVLGkNpZgKmc40JKeQnzLAb4h
         D+xQ==
X-Gm-Message-State: AOAM532NGcWkb8yMLM8IMPCObJ4EW3+kuzDaVoS64uYL1B+eYQRNflBj
	flh/9xLnhFo6FQ9u7J12/BeGHfJ/nWAKZLVq/bQ6pQ==
X-Google-Smtp-Source: 
 ABdhPJw6oIosq0QhD6auTB1k8WpKtRaP7xG1vq1M78IlDVzqXxxKtPZzA9J82hfpT6qyNvUPjbRjPrI6bigftyfrU8I=
X-Received: by 2002:a5d:47a8:0:b0:204:72:7051 with SMTP id
 8-20020a5d47a8000000b0020400727051mr9885479wrb.451.1647881117485;
 Mon, 21 Mar 2022 09:45:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220321114353.1731727-1-ross.burton@arm.com>
 <8f64a372-9b1c-7fc1-42ed-f74c664a5f3e@gmail.com>
In-Reply-To: <8f64a372-9b1c-7fc1-42ed-f74c664a5f3e@gmail.com>
From: Ross Burton <ross@burtonini.com>
Date: Mon, 21 Mar 2022 16:45:06 +0000
Message-ID: 
 <CAAnfSTuKtY_Cgd-PWxNNbDUNPMaK8oyWV9gToDfbZZ0RD8Wiiw@mail.gmail.com>
Subject: Re: [oe] [PATCH v2 1/2] python3-lz4: use system lz4 library
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Mar 2022 16:45:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96113

This was just a rebase on top of the python rename, so it's all in now.

Thanks
Ross

On Mon, 21 Mar 2022 at 15:45, Khem Raj <raj.khem@gmail.com> wrote:
>
> v1 was merged. Can you rebase and send the changes on top of
> master/master-next as v3
>
> On 3/21/22 4:43 AM, Ross Burton wrote:
> > Instead of using the copy of lz4 that is embedded in the python3-lz4
> > source code, use the system lz4 library.
> >
> > python3-lz4: PKGSIZE changed from 718282 to 165043 (-77%)
> > python3-lz4: RDEPENDS: added "lz4 (['>= 1.9.3'])"
> >
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >   meta-python/recipes-devtools/python/python3-lz4_4.0.0.bb | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta-python/recipes-devtools/python/python3-lz4_4.0.0.bb b/meta-python/recipes-devtools/python/python3-lz4_4.0.0.bb
> > index 42f0743bea..75472d327e 100644
> > --- a/meta-python/recipes-devtools/python/python3-lz4_4.0.0.bb
> > +++ b/meta-python/recipes-devtools/python/python3-lz4_4.0.0.bb
> > @@ -4,12 +4,13 @@ LICENSE = "BSD-3-Clause"
> >   LIC_FILES_CHKSUM = "file://LICENSE;md5=6231efa4dd4811e62407314d90a57573"
> >
> >   DEPENDS += " \
> > +    lz4 \
> >       ${PYTHON_PN}-setuptools-scm-native \
> >       ${PYTHON_PN}-pkgconfig-native \
> >   "
> >
> >   SRC_URI[sha256sum] = "57c5dfd3b7dae833b0d2b2c1aafd7f9d0dfcab40683d183d010c67c9fd1beca3"
> >
> > -inherit pypi python_setuptools_build_meta
> > +inherit pkgconfig pypi python_setuptools_build_meta
> >
> >   BBCLASSEXTEND = "native nativesdk"
> >
> >
> >
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#96112): https://lists.openembedded.org/g/openembedded-devel/message/96112
> Mute This Topic: https://lists.openembedded.org/mt/89925656/1676615
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [ross@burtonini.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

