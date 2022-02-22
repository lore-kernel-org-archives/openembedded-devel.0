Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0475C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 06:24:56 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web10.9822.1645511095483515658
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Feb 2022 22:24:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=h433Y979;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 8so2702304qvf.2
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Feb 2022 22:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YkqMGvWq2VAES4i/eG9dPhxBHkZmwAIzMHofXdN8DrE=;
        b=h433Y9796qIOAYEaIDCt1cFknypt25C6bX13VF3PkLKjrPK1Y0TJJOpMNQ+k13Ynft
         W14bIQ/HKcWlmKgm0iduLgWaBM7/xpKhSa5Zo57xLMeY5WeyrHFev38ZsziIFGs7luzM
         LEwjN6mbo5w5TG6abmIXD+gv8FWtiD8djK7Mwc7lkNA0rtKXxKkr1Yohzp/6Vg7GBLAA
         94o/VXNY0HOJg96k1yF78jCCwDzZKx9CSNLUj4zg+tK32mlTJkL2EclVy4ctUrMs2Ii8
         Uo78+G0QGFOKYsQQvbhtjmh/offJ7KpcPPXgwtbf+x/rFu1kNNnJ9dbbFFGHL/OHoglX
         JuJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YkqMGvWq2VAES4i/eG9dPhxBHkZmwAIzMHofXdN8DrE=;
        b=IzXeYPFAfmtDY8LFYrKbyf+GKXyPN6bdSvhIEPaCdHHXRsV/8AJkAUANGFhvNWNFrU
         rpssPtUH2Jfbmb5XRIDfLHN10AHvatUcboxsNyNcFoQ+GnKfbFc8sQR5NY56jaTZy4I2
         w5zngv2cQ+bI2ZmytScfMIXfG4zYAMNpVJaaIHyep9o+/3lcRh4vWc45+qbS7GdzQezY
         9gmK1RR5kzcLif4JRycuNMygoYYZoUGYYjd/mVp8vYIUis+vYAHS8JEG9Ui8Sr4JG0RC
         80e99etSzGs9trAqskRr5/LBxOAv4tHdjtrqCT0nIJNfH/9M8t5J38FswxSgBIjKegwm
         oXjA==
X-Gm-Message-State: AOAM532IIDVBiIFYBBDiGbleidm1h7o6hR3LRL67T4yBKlUuVBIafOvf
	H3euAMeLZnwmL9KB1TMmJ5o5JBIUzSV74ojTuck=
X-Google-Smtp-Source: 
 ABdhPJwEMBNriDtO7IcRJntppEHbr+8fh/MUI+GMuG9uwLGpFZNgGWjPqs8qfxhLNY6UKwZTLRXZpNxmKjV1Kjf/A8E=
X-Received: by 2002:ac8:5742:0:b0:2cb:96f2:a4da with SMTP id
 2-20020ac85742000000b002cb96f2a4damr20595253qtx.634.1645511094202; Mon, 21
 Feb 2022 22:24:54 -0800 (PST)
MIME-Version: 1.0
References: <20220221182012.2513597-1-f_l_k@t-online.de>
 <CAMKF1soMv7n5_0qXH9T4ZR=QEpGFAWdwdfGERbSMTpCW356FsQ@mail.gmail.com>
 <abe798dc-a561-b461-23d8-54ffcabbc718@t-online.de>
In-Reply-To: <abe798dc-a561-b461-23d8-54ffcabbc718@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 21 Feb 2022 22:24:28 -0800
Message-ID: 
 <CAMKF1spuUeqY6-D3=BU8o-HRM1gYs9uPJ8k6P_dh44Fciv72Jg@mail.gmail.com>
Subject: Re: [oe] [meta-xfce][PATCH] libxfce4util: inherit vala
To: Markus Volk <f_l_k@t-online.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Feb 2022 06:24:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95438

On Mon, Feb 21, 2022 at 9:57 PM Markus Volk <f_l_k@t-online.de> wrote:
>
> I dont think this is related. Its more like after updating poky to
> current master some of the xfce4 recipes try to build vapi, not caring
> that its not explicitly enabled. That was in fact the reason for adding
> vala to xfconf and libxfce4util. Both recipes started to fail after poky
> update.
>
> libxfce4ui and xfce4-panel are failing too, but it doesnt help to
> inherit vala here. Both of them will then fail with different error
> messages. What helps for me is to to disable vala like this
>
> EXTRA_OECONF += "--disable-vala"

Yeah I briefly looked at it and seems that gir and vapi are being mixed somehow

>
> I guess it would be ok to just dont build vapi for libxfceui and
> xfce4-panel because even upstream builds it like this:
>
> https://gitlab.xfce.org/xfce/libxfce4ui/-/blob/master/Makefile.am#L46
>
> I'll send patches if you agree on this

yeah sounds good

>
> Am 22.02.22 um 03:10 schrieb Khem Raj:
> > I am seeing libxfce4ui is failing in install task I wonder if it is
> > related these changes
> >
> > see
> > https://errors.yoctoproject.org/Errors/Details/633079/
> >
> > On Mon, Feb 21, 2022 at 10:20 AM Markus Volk <f_l_k@t-online.de> wrote:
> >> This fixes do_configure error:
> >>
> >> | libxfce4util/Makefile.am:159: error: ENABLE_VAPIGEN does not appear in AM_CONDITIONAL
> >>
> >> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> >> ---
> >>   meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.16.0.bb | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.16.0.bb b/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.16.0.bb
> >> index 1a0b7183e..9462b28ac 100644
> >> --- a/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.16.0.bb
> >> +++ b/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.16.0.bb
> >> @@ -4,6 +4,6 @@ LICENSE = "GPLv2"
> >>   LIC_FILES_CHKSUM = "file://COPYING;md5=252890d9eee26aab7b432e8b8a616475"
> >>   DEPENDS = "intltool-native xfce4-dev-tools-native glib-2.0"
> >>
> >> -inherit xfce gtk-doc gobject-introspection
> >> +inherit xfce gtk-doc gobject-introspection vala
> >>
> >>   SRC_URI[sha256sum] = "60598d745d1fc81ff5ad3cecc3a8d1b85990dd22023e7743f55abd87d8b55b83"
> >> --
> >> 2.25.1
> >>
> >>
> >> -=-=-=-=-=-=-=-=-=-=-=-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#95423): https://lists.openembedded.org/g/openembedded-devel/message/95423
> >> Mute This Topic: https://lists.openembedded.org/mt/89300196/1997914
> >> Group Owner: openembedded-devel+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> >> -=-=-=-=-=-=-=-=-=-=-=-
> >>

