Return-Path: <hfranco@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E32FAF8D77C
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 21:07:15 +0000 (UTC)
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26319.1776373631836070815
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Apr 2026 14:07:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20251104.gappssmtp.com header.s=20251104 header.b=yOWQY6hL;
 spf=pass (domain: baylibre.com, ip: 74.125.82.47, mailfrom: hfranco@baylibre.com)
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-12c1a170a50so2805c88.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2026 14:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1776373631; x=1776978431; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y0gv8WNQMHZqduQcHI5dJTn5HspiB/RABqGkAt1FC4Y=;
        b=yOWQY6hLqxFNhNCj5SI3y86KNDI5ZZSt8tqeJYqMKlPH/3MIRftbMw1V37wmfdTIsu
         NE9DanRGs3bYCIzt8OLsKIIjdYTfjaOMXJliX10RaGwQaQXi2DEpjpAB9SWGHDK+4bS2
         reVDrAsMziemsRNM793qkJx9p2SaE13W0N0LLXKzZOI7F167BDTp8bwKBffOOmgDn+Kq
         LSF8nRZvV0J4fHpZMmRyq3xEhdDrfqgVkmc7xAWIhUEaUxb9NHTL0kOYHw68lPRoaxKa
         Jf5cqoltHUID7rY+fCzJdyQ6R2zG9xMLSIoMe2WDzPfFpmuKXI5nz60Z0nTBhyvAVk6Y
         wTDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776373631; x=1776978431;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y0gv8WNQMHZqduQcHI5dJTn5HspiB/RABqGkAt1FC4Y=;
        b=GuUppMRqOS8w7O++rn8aqpr3602u5RvC8YKziiV7hfT+tG+kCOiohMe2cKBixKYcjl
         RoEvVKQb+ETkP7CjtvNR22MgvvpwrnO3x9NAezqujNSSurBDy6XZMRNj5pBU3Jp+7EBk
         sfGp803Fcs2vw9Buy2NPI4XdpDYOy5rHd7Edynf57rYeEgEayQN2Z88vhJvzgRabRL1f
         MGZ3HK6gHMxWV8mqsf1YId2/dJT/lM52vquRliuUzwZ2vzi4bcHYL+JXEkvtUQD78ac/
         9OlFrL/L8WnE9V6XEpnKcw5l0aPSnGzGUCc3QUL77BZBqE2uuN5k5YtHKsNxLiUUJw1e
         x9SQ==
X-Gm-Message-State: AOJu0Ywg4CVnlO4MNxobBeqaQdbGP8F/6n7aDAyXG+xdsj2vcXhu9XRs
	9UK2Y4tG5OAhkTrSS1UzoKjeW/NUxteAnz6l9gcgFYyGaiQoxOS9FuyFM0nu2sReMnY=
X-Gm-Gg: AeBDievTB/fvPprDz+p+VL1ldb5aZ4fWfdd9aPnHzh7i991cOqWCQh6c+xXP0uPJNcD
	upWxrBWZO4gWqEEBEyqeCc/3GWG2X18jp9l5XfThKRBYqRUoixzsHISArJOmJu4H6Ujh3FSfkDJ
	QAdCgPf9jkfCmkYP+QkyOdxqps3MDHdSqJMf54Mw21NLZCc0kvkT8jZUhfyEo0lgIsWdchtl5p7
	z2UAgW05UMGGRtnBQkTsTxKQNhlI7KCeHdROPTJra5lpoLDVFC5GV2PRMzo1k8uslYwbw9ATawo
	FPPsAvaWvWrNXHm6+OJIb7i2tsmH/cl7l0Gt2XxSW6Ok35wlk1txPBYXqIHK+bjqObv8aqOm0aV
	mZ7Xb7NqkLXtQ7ItFPP6OggfS1EpDRG2u38y72VFtyxroyW85Pl0fJY3BhGYMdKnXF4BtwmDowu
	8xCWRy+IyJisoW9fj07jVkRDgRIYDoenT6GnAMkxpgo9WqeDcZrJ/S9ujgHFpRBCAquWRuVSNfZ
	dMmbQs=
X-Received: by 2002:a05:7022:1e0f:b0:12b:ec15:69d2 with SMTP id a92af1059eb24-12c72865996mr423128c88.33.1776373630800;
        Thu, 16 Apr 2026 14:07:10 -0700 (PDT)
Received: from hiagonb ([2804:14c:4c5:9534::d153])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c5e62b9d1sm7387659c88.5.2026.04.16.14.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 14:07:10 -0700 (PDT)
Date: Thu, 16 Apr 2026 18:07:05 -0300
From: Hiago De Franco <hfranco@baylibre.com>
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Trevor Gamblin <tgamblin@baylibre.com>
Subject: Re: [oe] [meta-oe][PATCH] uutils-coreutils: make selinux
 PACKAGECONFIG dependend on clang-layer
Message-ID: <y6m2etmgi3tlokwm75xlltjsecqnt6r2r5qxhhjs3i6u7m7sas@qgv42ntkotug>
References: <20260416191754.3910026-1-hfranco@baylibre.com>
 <a64fce2a-a609-47e7-a60f-634ddee418f6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a64fce2a-a609-47e7-a60f-634ddee418f6@gmail.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2026 21:07:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126414

On Thu, Apr 16, 2026 at 09:33:48PM +0200, Gyorgy Sarvari wrote:
> On 4/16/26 21:17, Hiago De Franco via lists.openembedded.org wrote:
> > SELinux layer build fails if 'meta-clang' is not present, which
> > shouldn't happen, since 'meta-clang' isn't a dependency.
> > 
> > If 'selinux' is on DISTRO_FEATURES, PACKAGECONFIG calls
> > 'clang-native' even if uutils-coreutils is not being used (this is
> > enough to make the recipe fails on parsing time if meta-clang is not
> > present).
> > 
> 
> 
> But meta-clang doesn't provide clang-native anymore, it's a shadow of
> what it used to be - clang-native comes from oe-core. Or am I
> misunderstanding the problem here? I don't really get the role of
> meta-clang with this recipe.

You are correct, actually this is only affecting Scarthgap branch. I
fist spotted this on scarthgap, changed to master to test it too but I
probably did something wrong and kept the clang-layer or something
during my test. Sorry, my mistake.

Thanks for letting me know clang-native is actually on oe-core now, I
fount the commit [0]. So maybe I should propose a backport of this to
fix the scarthgap issue?

I will do a test now on Scarthgap, cherry-picking this commit to see how
it goes.

[0] https://github.com/openembedded/openembedded-core/commit/43ba5ed17e069b13cd43c36650524a0113c81955

Thanks,
Hiago.
> 
> 
> 
> > Make 'selinux' PACKAGECONFIG dependend on clang-layer, and print a
> > warning if the user wants selinux support o uutils-coreutils but haven't
> > add clang-layer.
> > 
> > Signed-off-by: Hiago De Franco <hfranco@baylibre.com>
> > ---
> >  .../uutils-coreutils/uutils-coreutils_0.8.0.bb       | 12 +++++++++++-
> >  1 file changed, 11 insertions(+), 1 deletion(-)
> > 
> > diff --git a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.8.0.bb b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.8.0.bb
> > index 8b9b4dc199..99beb70104 100644
> > --- a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.8.0.bb
> > +++ b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.8.0.bb
> > @@ -18,7 +18,17 @@ require ${BPN}-crates.inc
> >  PROVIDES = "coreutils"
> >  RPROVIDES:${PN} = "coreutils"
> >  
> > -PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'selinux systemd', d)}"
> > +PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
> > +# This is required since uutils-coreutils uses selinux features that require clang-layer
> > +python __anonymous() {
> > +    if bb.utils.contains('DISTRO_FEATURES', 'selinux', True, False, d):
> > +        if bb.utils.contains('BBFILE_COLLECTIONS', 'clang-layer', True, False, d):
> > +            d.appendVar('PACKAGECONFIG', ' selinux')
> > +        else:
> > +            bb.warn("selinux is enabled but clang-layer is not in BBFILE_COLLECTIONS, "
> > +                "selinux support will be disabled. Add meta-clang to your bblayers.conf "
> > +                "if selinux support on uutils-coreutils is required.")
> > +}
> >  PACKAGECONFIG[selinux] = "--features feat_selinux,,clang-native libselinux-native libselinux"
> >  PACKAGECONFIG[systemd] = "--features feat_systemd_logind,,systemd"
> >  
> > 
> > 
> > 
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#126407): https://lists.openembedded.org/g/openembedded-devel/message/126407
> > Mute This Topic: https://lists.openembedded.org/mt/118863961/6084445
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> > 
> 

