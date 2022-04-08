Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 367C4C4332F
	for <webhook@archiver.kernel.org>; Fri,  8 Apr 2022 17:51:27 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web10.183.1649439735571760442
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Apr 2022 10:42:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hYNroFmQ;
 spf=pass (domain: gmail.com, ip: 209.85.160.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id a11so11156803qtb.12
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Apr 2022 10:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=47ft6p1qxRKyCUIJT+Np370EalSHki26RUZLUBJuvzA=;
        b=hYNroFmQlhAzCHr0FaACjzM8wW33OO2FTsbHmN+0nY7pQuZZP2JKm4+0l3nVn/od+g
         Tzz6GsnADbKGzY9nV3la06Nw+yC0bGK1GCCPKYIS9yoDrpcnqhaG6J05lkNJyZa5qiRc
         sb0Pu9cYac74jqrf/zEKFb72YgTZfzYlVnzJsGe8VWjk/divAJg7GwSHOyVouDnbcseA
         B7JILf8uHoX7yVmaSM0ArEAMVlwbMwqF6COBINzGHtXsfBZpBWi72GU6mWL1vG7FqRGw
         /2+79RkRAazeLOJryPw/7BVSgl6diKhKYj2LQX9rwFMrEARj2xZvtPg+Idvdpch1cwmX
         Bw/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=47ft6p1qxRKyCUIJT+Np370EalSHki26RUZLUBJuvzA=;
        b=xXOA72GuMbiXppipXelCR8d7dEJExMMkELUn3WCw5qv5CxRF859to0korbZoSwLpqU
         w6NfWiM/j13zSaE3KNkclzvN6p5So4gi21cEbsWjAsqtYMb/xxsl9Ev0+g4TStrrFRMj
         k7lONFTLoJvCzmT/TIdJNAakpZnF/nW4qXHbxTGa+QC/QBrE0sFbFBq8B3VbYcvtEtYs
         jgB9syb2kASxOi2zA4foSVEPzvEkzcKlzb64etevB/gWIjfMTt4vysyOn/MIQVRh2Lsf
         KlFRlZqaxcRZu6reoLM1suMppCPvyrTVqCgjRITxDxiA0eTXDSjVQ+BFmqySe4+3Ix+o
         RhQA==
X-Gm-Message-State: AOAM530aCghnuSG/jAfLATxW7s8Er5/lujKBlALch/5D9AoijzK2hLml
	GldcWNo7wpxhWXKvig51TPUROT51q5kCLprq7XQ=
X-Google-Smtp-Source: 
 ABdhPJxebHervRZcKn1Hh0+OdZVjMpzDbh1czQwSY2YbyLCsPm+f0oQYWGsBLaSipgDVajaRJ+CtndrvEku1sTfjX+8=
X-Received: by 2002:ac8:7dd1:0:b0:2e1:c708:12fa with SMTP id
 c17-20020ac87dd1000000b002e1c70812famr16521039qte.532.1649439734582; Fri, 08
 Apr 2022 10:42:14 -0700 (PDT)
MIME-Version: 1.0
References: <16E3F6217A8A56EC.6461@lists.openembedded.org>
 <1ae383-3355-e547-def-e61659ebd42@spiteful.org>
In-Reply-To: <1ae383-3355-e547-def-e61659ebd42@spiteful.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 8 Apr 2022 10:41:48 -0700
Message-ID: 
 <CAMKF1srAwURgiKSrMyvJ-feu=4yCBDwzu3e_cSZK2jPh354s5g@mail.gmail.com>
Subject: Re: [oe] [PATCH] wxwidgets: Fix building without x11
To: Scott Murray <scott.murray@konsulko.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Robert Yang <liezhi.yang@windriver.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Apr 2022 17:51:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96484

On Fri, Apr 8, 2022 at 10:36 AM Scott Murray <scott.murray@konsulko.com> wrote:
>
> On Fri, 8 Apr 2022, Scott Murray via lists.openembedded.org wrote:
>
> > Building with wayland and opengl in DISTRO_FEATURES without x11 as
> > well was giving the error:
> >
> > wxwidgets: PACKAGECONFIG[no_gui] Conflict package config 'opengl' set in PACKAGECONFIG.
> >
> > Upon some investigation, it looks like wxwidgets now supports building
> > against Gtk's Wayland support, so we can also enable it if wayland is
> > in DISTRO_FEATURES.  For OpenGL, however, wxwidgets seems to have a
> > dependency on libglu, so the DISTRO_FEATURES check has been changed
> > to only enable it by default if both x11 and opengl are configured.
> >
> > Signed-off-by: Scott Murray <scott.murray@konsulko.com>
> > ---
> >  meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
>
> I hadn't checked the list before sending this, I'd be okay with Robert's
> similar fix instead, though enabling building with wayland support seems
> like it potentially could be useful to somebody.

I have taken the latter fix since it was fixing wayland too.

>
> > diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb
> > index e82143040..e7e89d64a 100644
> > --- a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb
> > +++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb
> > @@ -43,9 +43,9 @@ EXTRA_OECMAKE:append:libc-musl = " \
> >      -DHAVE_LOCALE_T=OFF \
> >  "
> >
> > -# All toolkit-configs except 'no_gui' require x11 explicitly (see toolkit.cmake)
> > -PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk', 'no_gui', d)} \
> > -    ${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d)} \
> > +# OpenGL support currently seems tied to using libglu, which requires x11
> > +PACKAGECONFIG ?= "${@bb.utils.contains_any('DISTRO_FEATURES', 'x11 wayland', 'gtk', 'no_gui', d)} \
> > +    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'opengl', '', d)} \
> >  "
> >
> >  PACKAGECONFIG:remove:class-native = "opengl"
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#96483): https://lists.openembedded.org/g/openembedded-devel/message/96483
> Mute This Topic: https://lists.openembedded.org/mt/90338460/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

