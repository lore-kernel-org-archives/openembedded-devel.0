Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6511CC43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 09:01:54 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.147049.1783328513454152810
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jul 2026 02:01:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=cyB7/2AM;
 spf=pass (domain: linaro.org, ip: 209.85.216.50, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38426d04bb4so971964a91.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Jul 2026 02:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783328513; x=1783933313; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4tmaif043FcwWnPPwgSMkj3Otny+x1bcWqozUpq/0Rs=;
        b=cyB7/2AMVuoQxnZ6Tf2JRNuGv1RqhhoCsRO8vdD2rM43xtTXU0gDQuDuyfl9pFlso9
         kEjEomDx2oHts5w+sGN8HnTrEuwXzVUd6OO+beecSUb0EupbFjXSDVxEGfySsDTmPiL3
         lRDecXUMnYs4U7t7/ty70GEpsUmxrF/Sbd46f3ONTRRyI8u3reG0davXOXlbBO4TAjLn
         i5Y7ctB+/lovMN278/N2QA5vKSUvrdPum6DkGRJmUWjCLsFJ22uyhalONhEcyGL407Rf
         uKAMb6RdZHT2FnukUUa4jBxmyFYRRMcJffw4gzxth3V2tHyxURIHCQkuPpkjiBE2AfvP
         bpaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783328513; x=1783933313;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4tmaif043FcwWnPPwgSMkj3Otny+x1bcWqozUpq/0Rs=;
        b=emcbWA397w3HHN2KG+3WvbvFAHS4/G+ntN9CdO0Dji5m4uqbnPQ9KIU/TgB30qqNst
         fOpWFZqXj52W+Y9pcez0BiC3IKpRyf1SfUlUiiOz2iuvrH6f0nfW8FBlkWQsfSm+iWf4
         HBtPDRCz4i750m4wDH3k/0bMYlFUICeQBv6K/ob4rIElplvuuFW95hpm4Ky6HWUPUszf
         PZ1mpAm/Kh1qPzqj2PWAWzEnT+hO5SPJtW8dvWokmRB5eM81xXikbhlyZgdQqv9pG18+
         RbNBIXpjiG7xuv3XiBJIns4e9A1rHam4uYmP9HmOWUK7tZeF9unFepcPFZP2MWSCMYDD
         iC0w==
X-Forwarded-Encrypted: i=1; AHgh+RqolriONFl9l5HL+NtPIpjoM7GTQNDbs/c4NkPfeGcVTTgajo6GV5XDzE5uSj8AWjU6+HNoRbn3fZQWiX0C2D2dTro=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx/MeGlCqma6Sx3zTDLGDdrER6SVYj4dyFhTYZIeHnznvfE1QXm
	ST0k8IW3gP0Q0Xv/XinXjs+zQ3gJ5geCLUeSyQw/dzCGFh8iTiLCc7o/5xwa90TKXRU=
X-Gm-Gg: AfdE7ckX58amB4jlNQmp4S5ZkglaDIrTc2Sh4FwS1mM7/IRwbfL8FJhHNZxbFgXRtoD
	4KBvrLBHkWI3u8ocEkWz3L1VFmIK6G/IBYMzxe3jQVcTOub2HX2iRT5klPDrLC9gKBdiO/B+h3f
	EJVLAtPU0izxPy0aMhFd+yfg2SGEOt6s9OoTJRwX+7tBSaYFH5Js96X/zUBil/VCU0VSKuXJ5XN
	qApm4He3PFplMNV0BWDLXADKu2mVpLw+c0rgCiok5zZxX8L7AgZrdnHjEf4VEfAayaEvZF4t0Gh
	XLYwUF4Nuvw+ur0OCwgvm9o+/NSK/imyp3M8DV/fGNrOo160DToN/WOnA9ajOVPRo7WW9zDMSVH
	4qUs4KH4TmQ3dqR7gC7Quwb+Hkj+QOu5k/9VoaSlHm37pBKvGstVrH4im1DTgYyb1fypBJ+mINJ
	QniScIDcyMkSycnmsOhv5YMyporTJu9lHEwr2cObkR
X-Received: by 2002:a17:90b:4c52:b0:37c:8df2:9f58 with SMTP id 98e67ed59e1d1-381120ee1c1mr15080450a91.7.1783328512614;
        Mon, 06 Jul 2026 02:01:52 -0700 (PDT)
Received: from nuoska (78-27-71-225.bb.dnainternet.fi. [78.27.71.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3812718e1b6sm4613549a91.0.2026.07.06.02.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:01:52 -0700 (PDT)
Date: Mon, 6 Jul 2026 12:01:48 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: ecordonnier@snap.com
Cc: ross.burton@arm.com, openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [PATCH 2/2] uutils-coreutils: delete .cargo/config.toml
Message-ID: <aktu_EN4zkSjImFj@nuoska>
References: <20260706083445.2842309-1-ross.burton@arm.com>
 <20260706083445.2842309-2-ross.burton@arm.com>
 <CAHUKmYa5UeP58KtKS8KgM3aF0ejnKMiUHTRaGSP7CeHb-P7mdg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHUKmYa5UeP58KtKS8KgM3aF0ejnKMiUHTRaGSP7CeHb-P7mdg@mail.gmail.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Jul 2026 09:01:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128034

Hi,

The file is not ignored. It gets used and overrides linker set by cargo.bbclass/rust.
uutils-coreutils builds are currently broken on arm64 build hosts and this
patch fixed them.

Cheers,

-Mikko

On Mon, Jul 06, 2026 at 10:50:19AM +0200, Etienne Cordonnier via lists.openembedded.org wrote:
> Hi Ross,
> 
> what is the use-case of the patch? config.toml file is ignored in
> out-of-tree builds ( https://github.com/rust-lang/cargo/issues/2930 ), so
> AFAIU removing it shouldn't make any difference for a bitbake build. Is it
> for devtool builds?
> 
> Étienne
> 
> 
> On Mon, Jul 6, 2026 at 10:34 AM Ross Burton via lists.openembedded.org
> <ross.burton=arm.com@lists.openembedded.org> wrote:
> 
> > This file hardcodes a specific compiler for aarch64-linux builds, which
> > is not the compiler that we provide.  As it's otherwise useless, we can
> > just delete the file.
> >
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > ---
> >  .../recipes-core/uutils-coreutils/uutils-coreutils_0.9.0.bb   | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/meta-oe/recipes-core/uutils-coreutils/
> > uutils-coreutils_0.9.0.bb b/meta-oe/recipes-core/uutils-coreutils/
> > uutils-coreutils_0.9.0.bb
> > index d294736395..2c7d3a3200 100644
> > --- a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.9.0.bb
> > +++ b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.9.0.bb
> > @@ -65,6 +65,10 @@ python __anonymous() {
> >
> >  BBCLASSEXTEND = "native nativesdk"
> >
> > +do_configure:prepend() {
> > +    rm -f ${S}/.cargo/config.toml
> > +}
> > +
> >  do_compile:prepend() {
> >      export LIBSTDBUF_DIR="${libdir}/coreutils"
> >  }
> > --
> > 2.43.0
> >
> >
> > 
> >
> >

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#128031): https://lists.openembedded.org/g/openembedded-devel/message/128031
> Mute This Topic: https://lists.openembedded.org/mt/120136596/7159507
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [mikko.rapeli@linaro.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


