Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA22BC433F5
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 16:40:12 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web12.616.1646412012294444649
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Mar 2022 08:40:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gnfj5i6K;
 spf=pass (domain: gmail.com, ip: 209.85.222.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id t21so6850403qkg.6
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Mar 2022 08:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qLVy92K1a16ufSQt6sZ22P1nLgJpAVvgW3GnjxAm3fM=;
        b=gnfj5i6Ke8us6BmqicWEVEM87UovzU+0Cb5pzND35F8AIP16fpNSj2tqyxezVvYTeN
         HVETvkaI61x4ah5OwIzchquF0FR7H1fFm+PpB9cXZAqeq4cuROdMWifQXsXzp9kQ8ylV
         pdC2xPUmgspSYlDaLuH37GbJrQ4p7zE4HyWYPHsT2+N/GjjqRNcuC3b5tCpKx9qb112p
         QW6OiJ72rKUXZrmgH1BXYh3Q3KO6xBu0HlU40rBGOw8bc7EvkDVSWVqwTK3KEvtODSZL
         ZRh5BBvU43eRF/QmRJGsJJkDY9hy0+G3bo2a6LkYYlbmjZJsntBGlJk3lVVQFDn1M0TA
         F8aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qLVy92K1a16ufSQt6sZ22P1nLgJpAVvgW3GnjxAm3fM=;
        b=nRbLnzpnSGwDHIH+0Y3LTRnxMJovuI+ujOuj/JkoLyr8GoKXBWGEI3mQlJ8c6T6BLz
         Zdk80qlybRNrfdkWNN+rfHVzp2/iFCqVpgCI7OVtn/mIfbdyamhOmN5ImWks7ZresT6z
         3qr2/jLfldeR45djcO007h7yDM59FHEp9DrorAtNAzW93cFyWxP6DblPm2HZJfD63QRD
         dGauNs9hn9G2JpsgCtgzwSTqFgtxRUA2uSkH97A4PRIJ0lnWvpsKJjrS2gRjYQzWM9VF
         yTBHaS3/BHIqSkVCPj5qycRWsyszOY5LBJvS9SiFzC1BRAMKvym8ewHgZAMm8cwlrjF/
         hD8w==
X-Gm-Message-State: AOAM532z98mTMsaIGip1wDguOCveMqCcNulSeuIh61BMyUpEP9ofrNS+
	u2NhFS1Ytuf6lv7ALUTjlX7YxgY3wc29xk9UmiAdt1KTsjg=
X-Google-Smtp-Source: 
 ABdhPJxqgBex58G0RNuaKKsY5OkQY0BIjAZdqS5208lhQ8/XPfnd4OvEpLYQa/c/oQEaRxpY07XN5YsAu98q7Uq5K3U=
X-Received: by 2002:a05:620a:16d5:b0:60d:d3a7:af9e with SMTP id
 a21-20020a05620a16d500b0060dd3a7af9emr3018341qkn.463.1646412011178; Fri, 04
 Mar 2022 08:40:11 -0800 (PST)
MIME-Version: 1.0
References: <20220304134220.2254908-1-ross.burton@arm.com>
 <CAAnfSTsCm7yVOPfuJd4fXkp_fZzrP3MfyeOKyZuRt0x+_DyBHQ@mail.gmail.com>
In-Reply-To: 
 <CAAnfSTsCm7yVOPfuJd4fXkp_fZzrP3MfyeOKyZuRt0x+_DyBHQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 4 Mar 2022 08:39:45 -0800
Message-ID: 
 <CAMKF1sq+21P6xE7CTwsjnHeFZ3tCJhXu9qTEFiMZ8HDViMXvMg@mail.gmail.com>
Subject: Re: [oe] [PATCH] ufw: port to setuptools, use setuptools_legacy
To: Ross Burton <ross@burtonini.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Mar 2022 16:40:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95791

On Fri, Mar 4, 2022 at 5:43 AM Ross Burton <ross@burtonini.com> wrote:
>
> Obviously this depends on the addition of setuptools_legacy to
> oe-core, which is on the list now.

yeah I have cherry-picked that patch into my distro testing for now.

>
> Ross
>
> On Fri, 4 Mar 2022 at 13:42, Ross Burton via lists.openembedded.org
> <ross=burtonini.com@lists.openembedded.org> wrote:
> >
> > This package has a traditional setup.py which has a custom install command,
> > which isn't supported with the modern wheel/pip installation method.
> >
> > Until upstream has moved away from distutils, use setuptools_legacy so
> > the installation is correct.
> >
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > ---
> >  .../ufw/ufw/setuptools.patch                  | 20 +++++++++++++++++++
> >  .../recipes-connectivity/ufw/ufw_0.36.1.bb    |  3 ++-
> >  2 files changed, 22 insertions(+), 1 deletion(-)
> >  create mode 100644 meta-networking/recipes-connectivity/ufw/ufw/setuptools.patch
> >
> > diff --git a/meta-networking/recipes-connectivity/ufw/ufw/setuptools.patch b/meta-networking/recipes-connectivity/ufw/ufw/setuptools.patch
> > new file mode 100644
> > index 0000000000..ad5391cb98
> > --- /dev/null
> > +++ b/meta-networking/recipes-connectivity/ufw/ufw/setuptools.patch
> > @@ -0,0 +1,20 @@
> > +Move to setuptools as distutils is now deprecated.
> > +
> > +Upstream-Status: Submitted [https://code.launchpad.net/~tgamblin/ufw/distutils-to-setuptools]
> > +Signed-off-by: Ross Burton <ross.burton@arm.com>
> > +
> > +diff --git a/setup.py b/setup.py
> > +index cb67a6a..de648d3 100644
> > +--- a/setup.py
> > ++++ b/setup.py
> > +@@ -25,8 +25,8 @@
> > + #
> > +
> > + from __future__ import print_function
> > +-from distutils.command.install import install as _install
> > +-from distutils.core import setup
> > ++from setuptools.command.install import install as _install
> > ++from setuptools import setup
> > + import errno
> > + import os
> > + import re
> > diff --git a/meta-networking/recipes-connectivity/ufw/ufw_0.36.1.bb b/meta-networking/recipes-connectivity/ufw/ufw_0.36.1.bb
> > index c427e4ffde..70216a85e3 100644
> > --- a/meta-networking/recipes-connectivity/ufw/ufw_0.36.1.bb
> > +++ b/meta-networking/recipes-connectivity/ufw/ufw_0.36.1.bb
> > @@ -12,12 +12,13 @@ SRC_URI = "https://launchpad.net/ufw/0.36/0.36.1/+download/ufw-0.36.1.tar.gz \
> >             file://0001-optimize-boot.patch \
> >             file://0002-add-an-option-to-specify-iptables-location.patch \
> >             file://0003-only-make-one-reference-to-env.patch \
> > +           file://setuptools.patch \
> >             "
> >  SRC_URI[sha256sum] = "1c57e78fbf2970f0cc9c56ea87a231e6d83d825e55b9e31e2c88b91b0ea03c8c"
> >
> >  UPSTREAM_CHECK_URI = "https://launchpad.net/ufw"
> >
> > -inherit distutils3 features_check systemd update-rc.d
> > +inherit setuptools3_legacy features_check systemd update-rc.d
> >
> >  RDEPENDS:${PN} = " \
> >                    iptables \
> > --
> > 2.25.1
> >
> >
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95784): https://lists.openembedded.org/g/openembedded-devel/message/95784
> Mute This Topic: https://lists.openembedded.org/mt/89548753/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

