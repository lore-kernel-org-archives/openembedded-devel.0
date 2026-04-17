Return-Path: <hfranco@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 811A1F436A8
	for <webhook@archiver.kernel.org>; Fri, 17 Apr 2026 13:56:53 +0000 (UTC)
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45630.1776434206179554170
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Apr 2026 06:56:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20251104.gappssmtp.com header.s=20251104 header.b=p0o9f4bd;
 spf=pass (domain: baylibre.com, ip: 74.125.82.42, mailfrom: hfranco@baylibre.com)
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-12c565dd3a7so852561c88.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Apr 2026 06:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1776434206; x=1777039006; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=50OETDNKzTcln0yIWTAgJL+voejss0L3QV4fY3/q31I=;
        b=p0o9f4bdX+iXTwDJL7g5BcbPWZ4fXW/FZb9Dbo+xDA14jOgLuGm6q5q4m2Q7YuJJVR
         MiYK0888njHKvxEMOFUubcMpbFA70WE6ryQMGaaB9FmyTc6i7YYMR46PAZkq2+bpcP+Y
         iTFqitoEWy8WNI804mdg1nVFPm+N25pLjcwXqXNCHpfF7UME2zo2bV6L2j/kErhogHWq
         vwnWWk0waSf/YKBPR/kHcTIenLvjBoMSj9pO87oIGLKORHxlCSPQavgsiFzEk0anbfI1
         TaiWnXjWb4b0TNaB6Z7teNvIrI2SSHJvcQ87X/YxY19jHkhMWxpaSb43+iJ9o4w3mOTU
         ChuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776434206; x=1777039006;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=50OETDNKzTcln0yIWTAgJL+voejss0L3QV4fY3/q31I=;
        b=iXKevKfJ+uUhDbIxU9cpwGmC6wHY1NQesXJBG/yOVu57IBmRlApkn4SKt9X/FqxaZl
         l2RhYtg8qJmhCfc24iPohr0qTSqm1zKK5PwlCQfCKFzkSs84/CUacOXxtp2Q03cGCdJH
         YPRNiWyx9jPz+JDZNTaz42pzAhma71aLIEKKPCeAeTIesoIyV/ATq7hZ3cvGWS4/Ltc1
         7Nz/Nukl8WB5ZIRYnXKhP5keL271rTK4PUCx+irw4gmA6YsHzPsVP/gIHqqFA55tE8qB
         ez9kIGBJK/qMVDaS9w3aD55mmUAqXmuFkv6EhvjkJZhhb6BpVBJ2aA4KKR8ZDOOuvM49
         vQ3w==
X-Gm-Message-State: AOJu0Yxq1L1v+iTWIYk8eK+92ME1gNsEHHAFVFc2U0gnz13ZCnDH/EYC
	lW4kL10Wlouic8Hl2w2H+uyc5la4/3n4lmWIuJymvW9sVEWOPPM1hNYrU06z9U2poL4=
X-Gm-Gg: AeBDiesqiSCc3Thl3OwX4rbj++8um5SX0lAxEynrD22cN6MOs4hezfrXfQQpYp/0jto
	l5Q6ihkvdC5JA/WLsBKhA3y57Pq7TRUTYCZArv7nizfkiXQXZWRKOSXdACuR6Xn2xwDpw0TOul7
	eJkRJLHUFDEgZ+tKuUWO9JQGLoAuKG3LF9veeooHi+i1Cqh7kXFXAF9MkjrwHYhwoynqbHuV2BH
	76Xo1enGwOP5NrR9m4P8yhjnhqn+kYsna2UVNK1cXrneuUqaC5SuX1qPXYdxWqu6DH8NfBUTNUV
	OsCZL20s08RuNLgtt8zH/tqzvVIfGKFaVOuY+Id4fxLu51MhWUogln0rbr10cr5bws0gjfs7C7M
	6oUFrbmiPci4hXX0eC0Z9bBvReJ1Ed0HlyIok20V6xCewCvyZ7gZAj7Cr8GX2d3aMlGMkGwT0wb
	68ajBbbTKL5OOcDceoKoP8+ODrSdpBXOZ3SVT7OYVazd1CyVWBhre790Vl44xJycFZE8E2
X-Received: by 2002:a05:7022:6b96:b0:11b:bf3f:5240 with SMTP id a92af1059eb24-12c73f70cd0mr1399228c88.9.1776434205436;
        Fri, 17 Apr 2026 06:56:45 -0700 (PDT)
Received: from hiagonb ([2804:14c:4c5:9534::d153])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c74a2ac32sm2188761c88.15.2026.04.17.06.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 06:56:44 -0700 (PDT)
Date: Fri, 17 Apr 2026 10:56:41 -0300
From: Hiago De Franco <hfranco@baylibre.com>
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Trevor Gamblin <tgamblin@baylibre.com>
Subject: Re: [oe] [meta-oe][PATCH] uutils-coreutils: make selinux
 PACKAGECONFIG dependend on clang-layer
Message-ID: <57p2oi523zvfjbffibnnbtlc2d6uc743up4s3tgxoai6ndczlh@b25xfcjuvfzs>
References: <20260416191754.3910026-1-hfranco@baylibre.com>
 <a64fce2a-a609-47e7-a60f-634ddee418f6@gmail.com>
 <18A6F268395035B3.1570320@lists.openembedded.org>
 <7cryzdxdowehb5ig7rd3boyt2kjheqrtchhgimeu76qz3dmvog@7i53kqjpxctl>
 <04d018b2-00d7-4147-8933-b84171bc20e4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <04d018b2-00d7-4147-8933-b84171bc20e4@gmail.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Apr 2026 13:56:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126439

On Fri, Apr 17, 2026 at 06:14:14AM +0200, Gyorgy Sarvari wrote:
> 
> 
> On 4/17/26 00:04, Hiago De Franco wrote:
> > On Thu, Apr 16, 2026 at 06:07:05PM -0300, Hiago De Franco via lists.openembedded.org wrote:
> >> On Thu, Apr 16, 2026 at 09:33:48PM +0200, Gyorgy Sarvari wrote:
> >>> On 4/16/26 21:17, Hiago De Franco via lists.openembedded.org wrote:
> >>>> SELinux layer build fails if 'meta-clang' is not present, which
> >>>> shouldn't happen, since 'meta-clang' isn't a dependency.
> >>>>
> >>>> If 'selinux' is on DISTRO_FEATURES, PACKAGECONFIG calls
> >>>> 'clang-native' even if uutils-coreutils is not being used (this is
> >>>> enough to make the recipe fails on parsing time if meta-clang is not
> >>>> present).
> >>>>
> >>>
> >>>
> >>> But meta-clang doesn't provide clang-native anymore, it's a shadow of
> >>> what it used to be - clang-native comes from oe-core. Or am I
> >>> misunderstanding the problem here? I don't really get the role of
> >>> meta-clang with this recipe.
> >>
> >> You are correct, actually this is only affecting Scarthgap branch. I
> >> fist spotted this on scarthgap, changed to master to test it too but I
> >> probably did something wrong and kept the clang-layer or something
> >> during my test. Sorry, my mistake.
> >>
> >> Thanks for letting me know clang-native is actually on oe-core now, I
> >> fount the commit [0]. So maybe I should propose a backport of this to
> >> fix the scarthgap issue?
> >>
> >> I will do a test now on Scarthgap, cherry-picking this commit to see how
> >> it goes.
> >>
> >> [0] https://github.com/openembedded/openembedded-core/commit/43ba5ed17e069b13cd43c36650524a0113c81955
> > 
> > So it is actually harder than only cherry-picking this commit, there are
> > more commits needed and they do not actually fit into Scarthgap.
> 
> That commit was a very major change in oe-core that took months to sort
> out, it wouldn't be considered for acceptance in Scarthgap.
> 
> > 
> > A BBMASK on uutils-coreutils will fix the issue for now, until I move to
> > the next LTS.
> 
> 
> I think your patch could be acceptable and useful for Scarthgap, if you
> are interested in that.

I am interested. Just for clarification, you mean the original patch I
sent, not the BBMASK patch, right?

If this is about the original patch, I can add it to Scarthgap and
re-send.

Regards,
Hiago.

> 
> 
> > 
> > Sorry for the noise, please ignore this patch since it is not suitable
> > for master branch.
> > 
> > Regards,
> > Hiago.
> >>
> >> Thanks,
> >> Hiago.
> >>>
> >>>
> >>>
> >>>> Make 'selinux' PACKAGECONFIG dependend on clang-layer, and print a
> >>>> warning if the user wants selinux support o uutils-coreutils but haven't
> >>>> add clang-layer.
> >>>>
> >>>> Signed-off-by: Hiago De Franco <hfranco@baylibre.com>
> >>>> ---
> >>>>  .../uutils-coreutils/uutils-coreutils_0.8.0.bb       | 12 +++++++++++-
> >>>>  1 file changed, 11 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.8.0.bb b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.8.0.bb
> >>>> index 8b9b4dc199..99beb70104 100644
> >>>> --- a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.8.0.bb
> >>>> +++ b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.8.0.bb
> >>>> @@ -18,7 +18,17 @@ require ${BPN}-crates.inc
> >>>>  PROVIDES = "coreutils"
> >>>>  RPROVIDES:${PN} = "coreutils"
> >>>>  
> >>>> -PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'selinux systemd', d)}"
> >>>> +PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
> >>>> +# This is required since uutils-coreutils uses selinux features that require clang-layer
> >>>> +python __anonymous() {
> >>>> +    if bb.utils.contains('DISTRO_FEATURES', 'selinux', True, False, d):
> >>>> +        if bb.utils.contains('BBFILE_COLLECTIONS', 'clang-layer', True, False, d):
> >>>> +            d.appendVar('PACKAGECONFIG', ' selinux')
> >>>> +        else:
> >>>> +            bb.warn("selinux is enabled but clang-layer is not in BBFILE_COLLECTIONS, "
> >>>> +                "selinux support will be disabled. Add meta-clang to your bblayers.conf "
> >>>> +                "if selinux support on uutils-coreutils is required.")
> >>>> +}
> >>>>  PACKAGECONFIG[selinux] = "--features feat_selinux,,clang-native libselinux-native libselinux"
> >>>>  PACKAGECONFIG[systemd] = "--features feat_systemd_logind,,systemd"
> >>>>  
> >>>>
> >>>>
> >>>>
> >>>>
> >>>>
> >>>
> > 
> >>
> >> -=-=-=-=-=-=-=-=-=-=-=-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#126414): https://lists.openembedded.org/g/openembedded-devel/message/126414
> >> Mute This Topic: https://lists.openembedded.org/mt/118863961/10204532
> >> Group Owner: openembedded-devel+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [hfranco@baylibre.com]
> >> -=-=-=-=-=-=-=-=-=-=-=-
> >>
> > 
> 

