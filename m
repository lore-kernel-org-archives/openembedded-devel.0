Return-Path: <hfranco@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D017EF8DFFF
	for <webhook@archiver.kernel.org>; Fri, 17 Apr 2026 18:32:20 +0000 (UTC)
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.52020.1776450735053726115
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Apr 2026 11:32:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20251104.gappssmtp.com header.s=20251104 header.b=TTbfIFbq;
 spf=pass (domain: baylibre.com, ip: 74.125.82.41, mailfrom: hfranco@baylibre.com)
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-12c19d23b19so1439596c88.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Apr 2026 11:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1776450734; x=1777055534; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=D9vL+EfooXlosLJcg88oglS8C2ITCc0bu+TzQwNjkVg=;
        b=TTbfIFbqD8e2rRg4CKcf8RXNczXOFxCWbSaR2/8rVB8z0NRUzQjrr4vpaNdZMGdFtE
         QAoBkibLpGsmiWyRYAIA3YEAJTS7O+19K6IW7EXOCG6FYlBvCfu2qh4i5zx1tBaB/E8y
         325ouRMBUaVcsAJrJwlEpRGOvubQ/1a6tqPnc7mGabt5xbCSPIeJO9vA5rSIXUChsqYt
         dFO6C9IKsmf70UAURGJOGJULCATnzE+J9yqs1VUAwHlvSqtbiVdJ87SY0DzAUyMw6dZ+
         kvPf4eDF4XEGS9RMPQTfYpFCyA2lMKBp+000wZPnhffbDJ0yM9t+gusVCwYPmo3Veaqo
         KA/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776450734; x=1777055534;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D9vL+EfooXlosLJcg88oglS8C2ITCc0bu+TzQwNjkVg=;
        b=nVxawp3fU36av6v3YNmpF7KeFpAH7QWYLN0K/JH1I1AiU+20Gwc9K2HGR2FCw1hrZj
         9x/4aWMwf3w8V02g7f+BlzNKPsdbq1BjxT/CG74N2uZBNDjAA3hv+J1lL5GG2tta2j/t
         bjP14zuvfZkPHE9zMlY8C4iE/AAUw2O/VQYV/W+AMXnsUNJPlFZ3EKn4gVQkUm5Hbakk
         KzZBdwfXI1h6/y2TNvMsGvQKR8Jarm/KZksqlaqJPGkBVInRk24gYseH1CgkfrYkrcu1
         wIagqncl5T3RFo4fQpg5hvia20xmyotXnJ0+6KwiaEPrrGVKpPgjk++FWuHLZd/OPKHC
         qfNQ==
X-Gm-Message-State: AOJu0YzMJ012yPWGs+XprD5Bkdery3W9EeXGh/MYliSgPFyghfppx9nx
	SUxcCeJKdI8acn5HPiHpDexWQG6K1JqlkhNEr7IJ4W+7MJPAhqHWfNR0mKC9+M5Yw0k=
X-Gm-Gg: AeBDieuHG/e91OnVPeFzBooS7Zg/zdV/Ekg8TR4G7jWhOOzczIJju0T0CwWHg9gjLmR
	CEODTtVNb8v6iF/itrdna7b9qhlk/u/Vx+tcGTzTDm7/srxngdLylHdQDCFeo9sVe7aNPoVxSuL
	PqXzwmCjH5n5b2riFHNRHKoOMWkTbpOmWJArmBraBlrcN3qSXlr0+3O460xO6rRcdn1Jy0ao2hw
	GdwC2poROPTZ+dHI7l6IzIcnXMk+VvQ8luH9t78E8CZXP2VjhCWCYQqVkdhWBYeaYyxnR+kS061
	A/JvorilwaJgUyEH4S5HhQZGGKNn7m8LOcYumQ8mgPVM9WEiNFkrAZh7UKqvPP4o0OUw2XaERcT
	2vo+K5q21+Osq+eelW8EIptXLagX6fAiec1kjwWieo4udQkCkPJMO8ACPMBJBW+iDvZP83TTy2D
	xWQ8aXipMfZqcxi9ogJgZnHW/KcuXB0WR3zC/clHEyIlYRmHXg/7az2ugSAYvh8NLEPugm
X-Received: by 2002:a05:7022:6988:b0:128:ceac:6da6 with SMTP id a92af1059eb24-12c73fad1e2mr1674817c88.30.1776450733518;
        Fri, 17 Apr 2026 11:32:13 -0700 (PDT)
Received: from hiagonb ([2804:14c:4c5:9534::d153])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c74a20c55sm3261298c88.13.2026.04.17.11.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 11:32:13 -0700 (PDT)
Date: Fri, 17 Apr 2026 15:32:09 -0300
From: Hiago De Franco <hfranco@baylibre.com>
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Trevor Gamblin <tgamblin@baylibre.com>, majortomtosourcecontrol@gmail.com
Subject: Re: [oe] [meta-oe][PATCH] uutils-coreutils: make selinux
 PACKAGECONFIG dependend on clang-layer
Message-ID: <xksltmjzbxphschh52ujild5u5hbo2lgdyl3s3ndeb7os2jcn5@t2xx4lwuet62>
References: <20260416191754.3910026-1-hfranco@baylibre.com>
 <a64fce2a-a609-47e7-a60f-634ddee418f6@gmail.com>
 <18A6F268395035B3.1570320@lists.openembedded.org>
 <7cryzdxdowehb5ig7rd3boyt2kjheqrtchhgimeu76qz3dmvog@7i53kqjpxctl>
 <04d018b2-00d7-4147-8933-b84171bc20e4@gmail.com>
 <57p2oi523zvfjbffibnnbtlc2d6uc743up4s3tgxoai6ndczlh@b25xfcjuvfzs>
 <4f2f37e1-321a-40ec-8881-af676788ad20@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4f2f37e1-321a-40ec-8881-af676788ad20@gmail.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Apr 2026 18:32:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126449

On Fri, Apr 17, 2026 at 06:21:12PM +0200, Gyorgy Sarvari wrote:
> On 4/17/26 15:56, Hiago De Franco wrote:
> > On Fri, Apr 17, 2026 at 06:14:14AM +0200, Gyorgy Sarvari wrote:
> >>
> >>
> >> On 4/17/26 00:04, Hiago De Franco wrote:
> >>> On Thu, Apr 16, 2026 at 06:07:05PM -0300, Hiago De Franco via lists.openembedded.org wrote:
> >>>> On Thu, Apr 16, 2026 at 09:33:48PM +0200, Gyorgy Sarvari wrote:
> >>>>> On 4/16/26 21:17, Hiago De Franco via lists.openembedded.org wrote:
> >>>>>> SELinux layer build fails if 'meta-clang' is not present, which
> >>>>>> shouldn't happen, since 'meta-clang' isn't a dependency.
> >>>>>>
> >>>>>> If 'selinux' is on DISTRO_FEATURES, PACKAGECONFIG calls
> >>>>>> 'clang-native' even if uutils-coreutils is not being used (this is
> >>>>>> enough to make the recipe fails on parsing time if meta-clang is not
> >>>>>> present).
> >>>>>>
> >>>>>
> >>>>>
> >>>>> But meta-clang doesn't provide clang-native anymore, it's a shadow of
> >>>>> what it used to be - clang-native comes from oe-core. Or am I
> >>>>> misunderstanding the problem here? I don't really get the role of
> >>>>> meta-clang with this recipe.
> >>>>
> >>>> You are correct, actually this is only affecting Scarthgap branch. I
> >>>> fist spotted this on scarthgap, changed to master to test it too but I
> >>>> probably did something wrong and kept the clang-layer or something
> >>>> during my test. Sorry, my mistake.
> >>>>
> >>>> Thanks for letting me know clang-native is actually on oe-core now, I
> >>>> fount the commit [0]. So maybe I should propose a backport of this to
> >>>> fix the scarthgap issue?
> >>>>
> >>>> I will do a test now on Scarthgap, cherry-picking this commit to see how
> >>>> it goes.
> >>>>
> >>>> [0] https://github.com/openembedded/openembedded-core/commit/43ba5ed17e069b13cd43c36650524a0113c81955
> >>>
> >>> So it is actually harder than only cherry-picking this commit, there are
> >>> more commits needed and they do not actually fit into Scarthgap.
> >>
> >> That commit was a very major change in oe-core that took months to sort
> >> out, it wouldn't be considered for acceptance in Scarthgap.
> >>
> >>>
> >>> A BBMASK on uutils-coreutils will fix the issue for now, until I move to
> >>> the next LTS.
> >>
> >>
> >> I think your patch could be acceptable and useful for Scarthgap, if you
> >> are interested in that.
> > 
> > I am interested. Just for clarification, you mean the original patch I
> > sent, not the BBMASK patch, right?
> > 
> > If this is about the original patch, I can add it to Scarthgap and
> > re-send.
> > 
> 
> Yes, I meant it for the original patch - I didn't realize that Clayton
> took a stab at the very same issue also. This is an issue that I think
> deserves a patch, it does have a hidden dependency on meta-clang which
> is not nice, and apparently caused some headaches for multiple people.
> 
> I do see Anuj's issue with Clayton's patch, as it changes the default
> behavior - I think this patch could have a better chance as it tries to
> keep the original behavior.
> 
> But overall I don't have a strong opinion on the way it is solved, if
> there is a patch that makes everyone happy.

Got it, thanks. I will submit the patch to scarthgap, let's seeh how it
goes.

> 
> 
> > Regards,
> > Hiago.
> > 
> >>
> >>
> >>>
> >>> Sorry for the noise, please ignore this patch since it is not suitable
> >>> for master branch.
> >>>
> >>> Regards,
> >>> Hiago.
> >>>>
> >>>> Thanks,
> >>>> Hiago.
> >>>>>
> >>>>>
> >>>>>
> >>>>>> Make 'selinux' PACKAGECONFIG dependend on clang-layer, and print a
> >>>>>> warning if the user wants selinux support o uutils-coreutils but haven't
> >>>>>> add clang-layer.
> >>>>>>
> >>>>>> Signed-off-by: Hiago De Franco <hfranco@baylibre.com>
> >>>>>> ---
> >>>>>>  .../uutils-coreutils/uutils-coreutils_0.8.0.bb       | 12 +++++++++++-
> >>>>>>  1 file changed, 11 insertions(+), 1 deletion(-)
> >>>>>>
> >>>>>> diff --git a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.8.0.bb b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.8.0.bb
> >>>>>> index 8b9b4dc199..99beb70104 100644
> >>>>>> --- a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.8.0.bb
> >>>>>> +++ b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.8.0.bb
> >>>>>> @@ -18,7 +18,17 @@ require ${BPN}-crates.inc
> >>>>>>  PROVIDES = "coreutils"
> >>>>>>  RPROVIDES:${PN} = "coreutils"
> >>>>>>  
> >>>>>> -PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'selinux systemd', d)}"
> >>>>>> +PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
> >>>>>> +# This is required since uutils-coreutils uses selinux features that require clang-layer
> >>>>>> +python __anonymous() {
> >>>>>> +    if bb.utils.contains('DISTRO_FEATURES', 'selinux', True, False, d):
> >>>>>> +        if bb.utils.contains('BBFILE_COLLECTIONS', 'clang-layer', True, False, d):
> >>>>>> +            d.appendVar('PACKAGECONFIG', ' selinux')
> >>>>>> +        else:
> >>>>>> +            bb.warn("selinux is enabled but clang-layer is not in BBFILE_COLLECTIONS, "
> >>>>>> +                "selinux support will be disabled. Add meta-clang to your bblayers.conf "
> >>>>>> +                "if selinux support on uutils-coreutils is required.")
> >>>>>> +}
> >>>>>>  PACKAGECONFIG[selinux] = "--features feat_selinux,,clang-native libselinux-native libselinux"
> >>>>>>  PACKAGECONFIG[systemd] = "--features feat_systemd_logind,,systemd"
> >>>>>>  
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>
> >>>
> >>>>
> >>>> -=-=-=-=-=-=-=-=-=-=-=-
> >>>> Links: You receive all messages sent to this group.
> >>>> View/Reply Online (#126414): https://lists.openembedded.org/g/openembedded-devel/message/126414
> >>>> Mute This Topic: https://lists.openembedded.org/mt/118863961/10204532
> >>>> Group Owner: openembedded-devel+owner@lists.openembedded.org
> >>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [hfranco@baylibre.com]
> >>>> -=-=-=-=-=-=-=-=-=-=-=-
> >>>>
> >>>
> >>
> 

