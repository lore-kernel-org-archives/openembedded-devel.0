Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 476F3C433FE
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 15:20:18 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web09.707.1652282410035264491
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 May 2022 08:20:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VzuQF88e;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id kk28so2323145qvb.3
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 May 2022 08:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+yWLM8wFsSEawZ8JmSwH8Fzz+Ihdkdr07+EaJX4LPeI=;
        b=VzuQF88e6r/v/sQo2dfJAXKb2Io4Y0NPLIVWCNoMk/DcEKO5N2tzXXD4sJ3gGhWG3J
         VSJak1nvl2eWizIeWjxhDeLsoAGGkH2bWQ/ummIAowwINdvxebMcwHlBs6Pe/65baYo7
         3D4dyP7cRdm+Ho037GFY8qztUhLSWv0dgzzKzKdFCCUBCO4rWYX6/vVvMnxBC9A8VtPb
         ia6kSF4ofdF1sW0+wVXbjVIikTrXQzrKbYKDhB+2AJAgo8Ek/W0JBZzoW7uGfMDa3yNi
         rSrHy5LNAOCAhSdQnJWU9POVquSHJDRoedtW1Kp2qOHzY7nBHVF5D3F76DzbyD9rQ0Jn
         YurA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+yWLM8wFsSEawZ8JmSwH8Fzz+Ihdkdr07+EaJX4LPeI=;
        b=R4PsGHhX3lh75DFhOL238uV2q0kCUMvigHhJBdZ1hCrERZ49ujoCoOFVlmLH2o3psW
         EtsO7dy+EdgXYbrTECaOnd5Vnk83Mvt8I3xvxTn9EhZK+dMKeB/M3IubtdAMjy/G7Q68
         G4lxBKStnSQC695iT0s+++w5fg+9ZbmXu3UgBsjN2hXLeSkRITKkeJ6f07fXO11oYk1W
         1CiyQMBcgYwYI/vC0KUA1nTwNRAD7ITb2/AmYLLw6buzTpyBSZHH5yw1n1h8XmZWWoOU
         Vfz36BYWGd1tRhG3Vf5e+C/frNcUjXtMVgWNJ5rXeBq9n0kYB2XlKVzWiOA9/ALjXlPY
         Q9zQ==
X-Gm-Message-State: AOAM53337Oc3Bx45s6UXNdSs/ge3cMDVYtFb0uPrS6xBvs8D5g+H44zj
	bZcR0PQX1zGc2sx+qufsY9GDJBHgVSmp4LoOZWo=
X-Google-Smtp-Source: 
 ABdhPJz4wv67Fflid9E85vLV4y4bOPv4Mw8aOhrOzBknJeSn8Sg5uHjgakwCohUODs+E1sR2Rh3zFsQXZTeBYCb6lok=
X-Received: by 2002:a05:6214:e6b:b0:45b:1ee:86ec with SMTP id
 jz11-20020a0562140e6b00b0045b01ee86ecmr16133156qvb.36.1652282408937; Wed, 11
 May 2022 08:20:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220511081409.3437145-1-jstephan@baylibre.com>
 <4429f4ed-3b2c-20dd-4356-37c5fb0b6bf6@linux.intel.com>
In-Reply-To: <4429f4ed-3b2c-20dd-4356-37c5fb0b6bf6@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 11 May 2022 08:19:42 -0700
Message-ID: 
 <CAMKF1spKcrzPWZvZBGFbneFcrpcSgbEw3jEAk8aMGvNAksvmmA@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][kirkstone][PATCH] libcamera: fix packaging
To: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
Cc: Julien STEPHAN <jstephan@baylibre.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 May 2022 15:20:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97038

On Wed, May 11, 2022 at 8:17 AM Jiaqing Zhao
<jiaqing.zhao@linux.intel.com> wrote:
>
> On 2022-05-11 16:14, Julien STEPHAN wrote:
> > libcamera.so.0 and libcamera-base.so.0 are packaged in ${PN}-dev although
> > they should be packaged in ${PN}. See poky/meta/conf/bitbake.conf.
> > This trigger the following error when trying to run the `cam` utility
> > (packaged inside ${PN}):
> >
> > $ cam -l
> > cam: error while loading shared libraries: libcamera.so.0: cannot open shared object file: No such file or directory
> >
> > $ read-elf -d /usr/bin/cam
> > Dynamic section at offset 0x2c740 contains 37 entries:
> >   Tag        Type                         Name/Value
> >  0x0000000000000001 (NEEDED)             Shared library: [libcamera.so.0]
> >  0x0000000000000001 (NEEDED)             Shared library: [libcamera-base.so.0]
> > [...]
> >
> > So package libcamera is broken and need to be installed along with
> > libcamera-dev to be functionnal. Fix it by packaging libcamera.so.0 and
> > libcamera-base.so.0 into ${PN}
> >
> > Signed-off-by: Julien STEPHAN <jstephan@baylibre.com>
> > ---
> >  meta-multimedia/recipes-multimedia/libcamera/libcamera.bb | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
> > index 713626069..0b9f3f7a5 100644
> > --- a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
> > +++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
> > @@ -64,10 +64,10 @@ do_recalculate_ipa_signatures_package() {
> >
> >  FILES:${PN}-dev = "${includedir} ${libdir}/pkgconfig"
> >  FILES:${PN}-dev += " ${libdir}/libcamera.so"
>
> Maybe this should also be added to be packaged in ${PN}, this should be a link to libcamera.so.0.0.0

.so are normally dev symlinks, so this should be fine as long as it is
not used as unversioned lib.

>
> > -FILES:${PN}-dev += " ${libdir}/libcamera.so.0"
> > +FILES:${PN} += " ${libdir}/libcamera.so.0"
> >  FILES:${PN} += " ${libdir}/libcamera.so.0.0.0"
> >  FILES:${PN}-dev += " ${libdir}/libcamera-base.so"
>
> Also this one
>
> > -FILES:${PN}-dev += " ${libdir}/libcamera-base.so.0"
> > +FILES:${PN} += " ${libdir}/libcamera-base.so.0"
> >  FILES:${PN} += " ${libdir}/libcamera-base.so.0.0.0"
> >  FILES:${PN} += " ${libdir}/v4l2-compat.so"
> >  FILES:${PN}-gst = "${libdir}/gstreamer-1.0/libgstlibcamera.so"
> >
> >
> >
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97037): https://lists.openembedded.org/g/openembedded-devel/message/97037
> Mute This Topic: https://lists.openembedded.org/mt/91031240/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

