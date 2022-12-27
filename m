Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC8E4C4332F
	for <webhook@archiver.kernel.org>; Tue, 27 Dec 2022 00:09:43 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web11.148308.1672099775248190861
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Dec 2022 16:09:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=et8Gljdb;
 spf=pass (domain: gmail.com, ip: 209.85.210.48, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f48.google.com with SMTP id k7-20020a056830168700b0067832816190so7412590otr.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Dec 2022 16:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xAPSCMW52ZtXX9aw97/DS6+wnkd/MjQ7xYT1HOiEPbk=;
        b=et8GljdbHMM7RBj3h6yO0em2ymqFm6WfiG3TeZTICF4TRzKApWsYlbH/QQLB+XxMx+
         NaduNF1WQh1688wUcjFMIa/tQStsDqGNU8d87iCqpXfGlm/1VJ0tqwMiEwDBTwib2Jxq
         BlWrR6X2hg74HKorg4h4y42TqIwX5M+gWoQaix+QXISK7ImxIFPnqgeg+C465Vfw+zXG
         d4EGZ6sFo4Zov3iIQgYpW8T+UsKj6rNcUTM8+40gS+GfxFj3UYoEaFObOKcm59hVhb15
         rVbLz47GLUgnAF6WnfesR05WOZ3PBjba6hKctbXhBUZfof8lLnd1GAoADcug+daYS+EW
         Xdzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xAPSCMW52ZtXX9aw97/DS6+wnkd/MjQ7xYT1HOiEPbk=;
        b=M7gBRHopiYux2FvtHsv95xCfXoayTiIa6QN/h4X+xO2b5fZCjf8d49FfJSGcxGI60i
         Z2cMKVfCg3mWwiSSkXl17Z8A4kSCwjGZoshrW9JAUDdQhp/R6TdtrEnzOgwzNd+Xo9sQ
         xdM9+DyGay5bsm7qCjYT+wc1PSQQRU3KQJ1zZtrwZfddRyCiHiovgbXnUWI+zjPPH8mQ
         KX06j19DSP+8Uu1XQ2lOO2TUrkN+sXTPdmZx9Q+RnR8AF+f/5vLEsPLb2S0ycTcI6mJ1
         /JmkJvfvq6J6tGwv3t9+TT/WCifMTeFumnl9ME5AYI0xz9REG2XN6IkQqVTwQQvPEYqf
         Cs1Q==
X-Gm-Message-State: AFqh2krUYr415drUjSU0blKigojKjE2f6EfnEHO4xEr8I3pQNbmAk0jE
	xFtd7ptIoQxhxK/L2kDyTECFpxyX+ptfUPvH6Bg=
X-Google-Smtp-Source: AMrXdXt7MiNmn91Mx/6mhxJcjwo6Gs5HWyNrMpHByxri8fSc11FGNMvGCpmF0SPGLmU59NXHrE8Y4dYXRX0Fz3LJHJA=
X-Received: by 2002:a9d:5cc5:0:b0:676:92ca:f7f4 with SMTP id
 r5-20020a9d5cc5000000b0067692caf7f4mr1047426oti.55.1672099774453; Mon, 26 Dec
 2022 16:09:34 -0800 (PST)
MIME-Version: 1.0
References: <20221225150006.3008502-1-f_l_k@t-online.de> <CAMKF1srCLxrB9FB=6SAjRX8ZQo=wTqYj55QEN4WieYmD953U5A@mail.gmail.com>
In-Reply-To: <CAMKF1srCLxrB9FB=6SAjRX8ZQo=wTqYj55QEN4WieYmD953U5A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 26 Dec 2022 16:09:08 -0800
Message-ID: <CAMKF1spZbn24jX54+41zvPoOZPgjKGp-HvFwqYJnjGhfZVocKQ@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH] gnome-desktop: update 42.0 -> 43
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 00:09:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100248

here is  another failure in configure

https://errors.yoctoproject.org/Errors/Details/685581/

On Mon, Dec 26, 2022 at 2:35 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Evince and nautilus fails with this update.
>
> https://errors.yoctoproject.org/Errors/Details/685561/
> https://errors.yoctoproject.org/Errors/Details/685562/
>
> On Sun, Dec 25, 2022 at 7:00 AM Markus Volk <f_l_k@t-online.de> wrote:
> >
> > Signed-off-by: Markus Volk <f_l_k@t-online.de>
> > ---
> >  ...ome-desktop_42.0.bb => gnome-desktop_43.bb} | 18 +++++++++---------
> >  1 file changed, 9 insertions(+), 9 deletions(-)
> >  rename meta-gnome/recipes-gnome/gnome-desktop/{gnome-desktop_42.0.bb => gnome-desktop_43.bb} (76%)
> >
> > diff --git a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_42.0.bb b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_43.bb
> > similarity index 76%
> > rename from meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_42.0.bb
> > rename to meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_43.bb
> > index 6eeaed0e1..ed61c2e1f 100644
> > --- a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_42.0.bb
> > +++ b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_43.bb
> > @@ -16,21 +16,21 @@ REQUIRED_DISTRO_FEATURES += "gobject-introspection-data"
> >
> >  GIR_MESON_OPTION = ""
> >
> > -SRC_URI[archive.sha256sum] = "f3caa293a5e86f6ccad18f817273db1c67061e680d79d839aa8a7528e5bb26d6"
> > -SRC_URI += " \
> > -    file://gnome-desktop-thumbnail-don-t-assume-time_t-is-long.patch \
> > -    file://0001-meson.build-Disable-libseccomp-for-all-archs.patch \
> > -"
> > +SRC_URI += "file://gnome-desktop-thumbnail-don-t-assume-time_t-is-long.patch"
> > +SRC_URI[archive.sha256sum] = "3d6e153317486157596aa3802f87676414c570738f450a94a041fe8835420a69"
> >
> >  DEPENDS += " \
> > +    fontconfig \
> > +    gdk-pixbuf \
> > +    glib-2.0 \
> >      gsettings-desktop-schemas \
> > -    virtual/libx11 \
> >      gtk+3 \
> >      gtk4 \
> > -    startup-notification \
> > -    xkeyboard-config \
> >      iso-codes \
> > -    udev \
> > +    xext \
> > +    libxkbcommon \
> > +    xkeyboard-config \
> > +    xrandr \
> >  "
> >
> >  GTKDOC_MESON_OPTION = "gtk_doc"
> > --
> > 2.34.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#100229): https://lists.openembedded.org/g/openembedded-devel/message/100229
> > Mute This Topic: https://lists.openembedded.org/mt/95876147/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

