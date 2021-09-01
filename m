Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web10.22.1630521453806950284
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Sep 2021 11:37:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DSedHQtF;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id t190so470858qke.7
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Sep 2021 11:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=W1nJ9ZhbwjlZewNtNzo1W2GyFSSjJZeyJ3iegPvdPzg=;
        b=DSedHQtFKZc//AfucC4Vv009MzWZXWfkEbwA2o1fXLPzzXHTghz7rSZ+sv+NnOIOyS
         CT7W+/5qV65K2bacw0wtXNQdoW2AECbFlnRpzcVTQyniTyLpts9rOQcnOAmxgEZGhosK
         7S15X4vP0DbfGx9JgWb6I6QEAXSnIK1hQd6dUVe62fMtPFLmsDVBFBC3/A7p0G8BiLua
         cjZKFSlBPmx6YF0SZ/Loy4a6Js7KSGqK7L3Tr75V0jCn8YpqgI7Q5EWZ3Ox3HHBdK2ed
         ubXf/+nhxwhTVVMj1RFq63E++HGuILO8D3Yr6egWspbrgeRlVDFXXNWj2Rkhin6d4s0w
         FDtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W1nJ9ZhbwjlZewNtNzo1W2GyFSSjJZeyJ3iegPvdPzg=;
        b=p9vsnQfmI9pVfrCgta5CM+5B6ggb4FxwxIRgrhpapHG6esLDAdM66uM64Pbm9D4vsZ
         qR+rrScVBif/Zl5l7v8pukHmalUoHOZ7cSTI3jT4Tx1JslYhFo6duAz72gXruzpTzSJF
         TjD/SLQtESv2UCTOQ9K1BdUuyjtzcp4Itp0Eem3i/BNJONuSwwnSgxytSk2pwucsLZet
         RDXZ7DAnIcjp8tU3GX4iwcEMaiMDEbQwpxrPIZEhcSYBSS4Vs9WkJefz9+HunvDqLjxm
         SJotKsZjc7CKlP64Y2dPZ+VVWpeO4BVcNIAUen4ZMGE4AJ/syF7SME4OHeeEv2Mjq6mv
         oOSw==
X-Gm-Message-State: AOAM5309gHH1TnzWH0DL+4YfSFZ7TVPpYpKp7+k96P3PIYh2/ydj7NHt
	3qYEJC0I5WpC6jMw+gV/VtOx+dvXPHNcljLSzwL3tgAmckY=
X-Google-Smtp-Source: ABdhPJzLR4YtECPjDCiS22nThaUHe9bltlfd0s4kUx2nxXZfarzblxXP1jHLLekAN7h9zxK/b7Gnr+oVvmmTkq5BaXU=
X-Received: by 2002:ae9:f201:: with SMTP id m1mr987947qkg.381.1630521452773;
 Wed, 01 Sep 2021 11:37:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210901152108.24811-1-raj.khem@gmail.com> <1306bb1-e75e-6481-47d9-39215ae41a3@spiteful.org>
In-Reply-To: <1306bb1-e75e-6481-47d9-39215ae41a3@spiteful.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 1 Sep 2021 11:37:06 -0700
Message-ID: <CAMKF1sr8z4stAxEsAVNJM+Ag4mj9zeKBA_rpF==GUKzQvkFOXg@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCH 1/2] pipewire: Upgrade to 0.3.34
To: Scott Murray <scott.murray@konsulko.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 1, 2021 at 11:24 AM Scott Murray <scott.murray@konsulko.com> wrote:
>
> On Wed, 1 Sep 2021, Khem Raj wrote:
>
> > Enable systemd user services as well as they are required for user
> > pipewire sessions
> >
> > enable pw-cat which also needs sndfile enabled
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  .../pipewire/{pipewire_0.3.31.bb => pipewire_0.3.34.bb}   | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> >  rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_0.3.31.bb => pipewire_0.3.34.bb} (97%)
> >
> > diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.31.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.34.bb
> > similarity index 97%
> > rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.31.bb
> > rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.34.bb
> > index 1c18ba0328..33b5d88a2e 100644
> > --- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.31.bb
> > +++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.34.bb
> > @@ -11,7 +11,7 @@ SECTION = "multimedia"
> >
> >  DEPENDS = "dbus"
> >
> > -SRCREV = "c43dabcc96e2e072cdf08e5f094bb677d9017c6b"
> > +SRCREV = "1924c2c29824955b5e763f1def6967f68e403c7c"
> >  SRC_URI = "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=master;protocol=https"
> >
> >  S = "${WORKDIR}/git"
> > @@ -46,7 +46,7 @@ USERADD_PARAM:${PN} = "--system --home / --no-create-home \
> >  EXTRA_OEMESON += " \
> >      -Daudiotestsrc=enabled \
> >      -Devl=disabled \
> > -    -Dsystemd-user-service=disabled \
> > +    -Dsystemd-user-service=enabled \
>
> Shouldn't this perhaps be tied to the existing systemd PACKAGECONFIG?
>

yes it could be, although if we are not using systemd then it wont do
harm. Let me do that

> >      -Dtests=disabled \
> >      -Dudevrulesdir=${nonarch_base_libdir}/udev/rules.d/ \
> >      -Dvideotestsrc=enabled \
> > @@ -54,12 +54,13 @@ EXTRA_OEMESON += " \
> >      -Dvulkan=disabled \
> >      -Dlibcamera=disabled \
> >      -Dman=disabled \
> > +    -Dpw-cat=enabled \
> >  "
> >
> >  PACKAGECONFIG ??= "\
> >      ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
> >      ${@bb.utils.filter('DISTRO_FEATURES', 'alsa systemd', d)} \
> > -    gstreamer jack v4l2 \
> > +    gstreamer jack sndfile v4l2 \
> >  "
> >
> >  # "jack" and "pipewire-jack" packageconfigs cannot be both enabled,
> > @@ -250,6 +251,7 @@ FILES:${PN}-media-session = " \
> >      ${bindir}/pipewire-media-session \
> >      ${datadir}/pipewire/media-session.d/* \
> >      ${systemd_system_unitdir}/pipewire-media-session.service \
> > +    ${systemd_user_unitdir}/pipewire-media-session.service \
> >  "
> >  RPROVIDES:${PN}-media-session = "virtual-pipewire-sessionmanager"
> >
> > --
> > 2.33.0
> >
