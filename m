Return-Path: <hfranco@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C26C9F8DFD0
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 22:04:34 +0000 (UTC)
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27621.1776377068313116623
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Apr 2026 15:04:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20251104.gappssmtp.com header.s=20251104 header.b=bAraaN+K;
 spf=pass (domain: baylibre.com, ip: 74.125.82.174, mailfrom: hfranco@baylibre.com)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2d9916deb14so51775eec.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2026 15:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1776377068; x=1776981868; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=95aeIhZhPcb5tDA3aXjszPF2FhSr4LJ6sV85N1iXWGA=;
        b=bAraaN+KJVia+nFraHvy5vb3//2JkmY94xzBKgt5D/vdJQggk7HLZA0CX2xF1akgpM
         VJv2TQj7U3aKQViLhwG3IrRR437deYVqZ4cWtLn8FdRl3ktFVPX1iNL+kaZ8XNVZyY8I
         7zRtubQPfn3pGdjRHCf6tl6pYGL3B7657NmDZQY9xK/yvItd0NDaNawfiP4hPQcJhW9Z
         j5ApBOL/vYAUNhzGPV6q5XXgG7j8Ofh4fTNdvBe3X/T3jrFInDBXx+sjDS6CwKaRX072
         hkpYtmREQ+mMrOwCGdp+OjwDpwWgzX/QN2FovjQ8QyITssklwuzlCgZyKv1+q26gRc8I
         1bGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776377068; x=1776981868;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=95aeIhZhPcb5tDA3aXjszPF2FhSr4LJ6sV85N1iXWGA=;
        b=sjQ4Tyjur973f/1Y13lP8AU4kf62Gl7t55DkwnlbEv+Q7icCjD1bov7uPJN2eY81cX
         OcAO22axsR/JUEHsjmU+C2jfXlp9ZRRaI1EYHWg1YrB7nIZVYx2OsZRAPjY8RUFWDxEj
         sr1aHQuZvknhme1HqbgFZCuyiCPHkW7kvG6DEdGRZa2be3XQaozStNlIxD3cdgZhME4R
         WV7ylh7qKbhqjARhQ4YqgkYcgH49VWG1LvPH3Sj5hyyn0pEbT/q2vsYoXW8FpiXW112K
         53uhoZJo2yYa7hakGonO3hMkJcWXWHT6vOUWTWMFzr7Bo+MEpcEVSdh0cJP2YsHhz242
         ohAA==
X-Forwarded-Encrypted: i=1; AFNElJ/NytE5Lutt4P7tQCNWJOKPXNkU0GZ0D2lVFmBvR6sqV0DVB4aH1trCiJohroYtW/BWebO0kD7Jz75VC3kWmqus41I=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwcBJjfKCfopwN5S5C4KHB1dVqc242I2MroIeA+ZWTC8QnZDB7k
	FM6nEYlJFvEAMMb5/T4NHCuMnVsjZfCU8n0Bh6+HkdVrhdcA2YfroZRTe47FNLtMTOM=
X-Gm-Gg: AeBDiet9Yb2E6RKC9amWmKGTd0NeZzLh2DnR1t8SzLYKxDhV9oY0O+S/yZLs2Bq2RUT
	xekDAaBH7MRQGCQdZEetd4hPL+ZKCMPNOP5MxHTl59YqUnb/EBuUAv1CrWiMM0TV8OyEsIRtL5b
	YmJ+bbjDzlhAUYbfomyBvwQUDf5Y78VfvFoELeqYg5Mpsqd4f5RA4HsmQENdtbctrHRsdjjtMj2
	hWvJrbgF/igp/lwULz5zEzhw1GhP3/oaYl6ktsl9VRtSZsACMvPIdN1ZUbz0Cf6M5u21H6w0Hpm
	e2JnCU4dt6Q2NOZWRAm4YEdetaF8qOFODLcEKHMwa1ETRbeApQCN3SOo5ic0jOEDq3Z6VmxJ0f+
	jyRvnod88hR4UYsqOe1pb8M8Gu/IwI1lKFrRMVb/7bqLDz3uw7Eafyx/2qg1Te9dooNLUQPycRK
	R7sdQXc6plt4QvzUwYBzz0UvTb8Yg64kCgf2u/FO0S0bbpO+vbhjlrDFJF71A3mJGDOM2i
X-Received: by 2002:a05:7300:6c27:b0:2da:1a81:5ae with SMTP id 5a478bee46e88-2e475b3994cmr49069eec.10.1776377067585;
        Thu, 16 Apr 2026 15:04:27 -0700 (PDT)
Received: from hiagonb ([2804:14c:4c5:9534::d153])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8fa5efb6sm9543064eec.28.2026.04.16.15.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 15:04:27 -0700 (PDT)
Date: Thu, 16 Apr 2026 19:04:23 -0300
From: Hiago De Franco <hfranco@baylibre.com>
To: Gyorgy Sarvari <skandigraun@gmail.com>, 
	openembedded-devel@lists.openembedded.org, Trevor Gamblin <tgamblin@baylibre.com>
Subject: Re: [oe] [meta-oe][PATCH] uutils-coreutils: make selinux
 PACKAGECONFIG dependend on clang-layer
Message-ID: <7cryzdxdowehb5ig7rd3boyt2kjheqrtchhgimeu76qz3dmvog@7i53kqjpxctl>
References: <20260416191754.3910026-1-hfranco@baylibre.com>
 <a64fce2a-a609-47e7-a60f-634ddee418f6@gmail.com>
 <18A6F268395035B3.1570320@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18A6F268395035B3.1570320@lists.openembedded.org>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2026 22:04:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126419

On Thu, Apr 16, 2026 at 06:07:05PM -0300, Hiago De Franco via lists.openembedded.org wrote:
> On Thu, Apr 16, 2026 at 09:33:48PM +0200, Gyorgy Sarvari wrote:
> > On 4/16/26 21:17, Hiago De Franco via lists.openembedded.org wrote:
> > > SELinux layer build fails if 'meta-clang' is not present, which
> > > shouldn't happen, since 'meta-clang' isn't a dependency.
> > > 
> > > If 'selinux' is on DISTRO_FEATURES, PACKAGECONFIG calls
> > > 'clang-native' even if uutils-coreutils is not being used (this is
> > > enough to make the recipe fails on parsing time if meta-clang is not
> > > present).
> > > 
> > 
> > 
> > But meta-clang doesn't provide clang-native anymore, it's a shadow of
> > what it used to be - clang-native comes from oe-core. Or am I
> > misunderstanding the problem here? I don't really get the role of
> > meta-clang with this recipe.
> 
> You are correct, actually this is only affecting Scarthgap branch. I
> fist spotted this on scarthgap, changed to master to test it too but I
> probably did something wrong and kept the clang-layer or something
> during my test. Sorry, my mistake.
> 
> Thanks for letting me know clang-native is actually on oe-core now, I
> fount the commit [0]. So maybe I should propose a backport of this to
> fix the scarthgap issue?
> 
> I will do a test now on Scarthgap, cherry-picking this commit to see how
> it goes.
> 
> [0] https://github.com/openembedded/openembedded-core/commit/43ba5ed17e069b13cd43c36650524a0113c81955

So it is actually harder than only cherry-picking this commit, there are
more commits needed and they do not actually fit into Scarthgap.

A BBMASK on uutils-coreutils will fix the issue for now, until I move to
the next LTS.

Sorry for the noise, please ignore this patch since it is not suitable
for master branch.

Regards,
Hiago.
> 
> Thanks,
> Hiago.
> > 
> > 
> > 
> > > Make 'selinux' PACKAGECONFIG dependend on clang-layer, and print a
> > > warning if the user wants selinux support o uutils-coreutils but haven't
> > > add clang-layer.
> > > 
> > > Signed-off-by: Hiago De Franco <hfranco@baylibre.com>
> > > ---
> > >  .../uutils-coreutils/uutils-coreutils_0.8.0.bb       | 12 +++++++++++-
> > >  1 file changed, 11 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.8.0.bb b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.8.0.bb
> > > index 8b9b4dc199..99beb70104 100644
> > > --- a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.8.0.bb
> > > +++ b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.8.0.bb
> > > @@ -18,7 +18,17 @@ require ${BPN}-crates.inc
> > >  PROVIDES = "coreutils"
> > >  RPROVIDES:${PN} = "coreutils"
> > >  
> > > -PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'selinux systemd', d)}"
> > > +PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
> > > +# This is required since uutils-coreutils uses selinux features that require clang-layer
> > > +python __anonymous() {
> > > +    if bb.utils.contains('DISTRO_FEATURES', 'selinux', True, False, d):
> > > +        if bb.utils.contains('BBFILE_COLLECTIONS', 'clang-layer', True, False, d):
> > > +            d.appendVar('PACKAGECONFIG', ' selinux')
> > > +        else:
> > > +            bb.warn("selinux is enabled but clang-layer is not in BBFILE_COLLECTIONS, "
> > > +                "selinux support will be disabled. Add meta-clang to your bblayers.conf "
> > > +                "if selinux support on uutils-coreutils is required.")
> > > +}
> > >  PACKAGECONFIG[selinux] = "--features feat_selinux,,clang-native libselinux-native libselinux"
> > >  PACKAGECONFIG[systemd] = "--features feat_systemd_logind,,systemd"
> > >  
> > > 
> > > 
> > > 
> > > 
> > > 
> > 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#126414): https://lists.openembedded.org/g/openembedded-devel/message/126414
> Mute This Topic: https://lists.openembedded.org/mt/118863961/10204532
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [hfranco@baylibre.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


