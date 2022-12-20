Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76D75C4332F
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 07:01:11 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
 by mx.groups.io with SMTP id smtpd.web10.44854.1671519668263673408
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Dec 2022 23:01:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TcuhWhXi;
 spf=pass (domain: gmail.com, ip: 209.85.161.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f50.google.com with SMTP id z20-20020a4a4914000000b004b026afa844so756640ooa.13
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Dec 2022 23:01:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=d+Lipd4q778T3a/4FYA1qWP7voohYt/AMfwiRb1xrqc=;
        b=TcuhWhXisHWsxQxEsXLXn0c58xjtQmypKrByP3ZfEEHRYCnC7138K/Mp4XZ34IQm8n
         wmgD2wMHRZ2zbVlrAzm0j7W/z9aSPh4K4QT8+F0hka+UddLlJGWSi+DqjWrgCpysRVHG
         6H8mOKHI55S9krEICDpLB/ObluYfbJ1S4TiGVLPGrUiJiBhpRILMeKV8rHeY+NgfGTTQ
         qv3dbQKxOumJ0Rl+unW4ePW1ifhrbulM+fcpN7C39WciwUVq6UuD6TxWJ65pdr6Fqc8f
         VQ8A0//9kggReT/p36hC6gVLFQoKR1oM3kqnlsJVFHO5bysS+mlAhvRzxOGDG2hs4ppn
         NZhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d+Lipd4q778T3a/4FYA1qWP7voohYt/AMfwiRb1xrqc=;
        b=JxDD6Zmibga8M+L4FJhKqC2aK/G303SQCNYdLIjOo5LxoTnXip5kYoTD+KJRvcGFhb
         X3lhMzQ2Ly4HovfG+D0oFI7ogk41Oax+3tXCi62ydMTQeI48PqPdWej65F5dKFeDXX0j
         npHAV/La0cB3AKDqf33B20KSrSWIB/ovpZIBD+s2ikbOwYooJ46vDh5PtqO6Eu8klP6h
         uD61Ya/hpZ4ZaRSUgVUsE1U/iK9T+CIu7dDM6jqrvAYg3um5qmO5wWJD0mh7dVXAL2nX
         e0o/WQ4/u9YW65PUdCYjHXQbNg8uSa9UDQcqqZtLje0L3YqwwbaH8EBNrAMK8B3HpUjg
         xecw==
X-Gm-Message-State: AFqh2kr4rI7BDYOwGRdIZZ+EEvXWWpk9EwlZQV9JHoK5ENtHSjuVqcYb
	0cvr9HGfmE0C0+z599QoMhhjwkdjSlZ3Kiht8bM=
X-Google-Smtp-Source: AMrXdXsmL1LNilnMFNdNWwFvrxZupyC/sEwuoP+HkPQQ+04l/Da65CzhopU0M4ZWuO7Hu85KQelnO0CBhQgOkBU9dUM=
X-Received: by 2002:a4a:cf15:0:b0:4b1:52d7:5963 with SMTP id
 l21-20020a4acf15000000b004b152d75963mr128325oos.73.1671519667441; Mon, 19 Dec
 2022 23:01:07 -0800 (PST)
MIME-Version: 1.0
References: <20221219131041.452949-1-f_l_k@t-online.de> <20221219131041.452949-5-f_l_k@t-online.de>
 <CAMKF1sp9N2VHygKfpE0ybEspjd27X8LJbGg+i1+y_AEn6f2Lfw@mail.gmail.com>
In-Reply-To: <CAMKF1sp9N2VHygKfpE0ybEspjd27X8LJbGg+i1+y_AEn6f2Lfw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 19 Dec 2022 23:00:41 -0800
Message-ID: <CAMKF1sqAyUyGJjdTPV8hUTid0JQYdVfhD4yZckSp4Pn4kxawVg@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH 05/10] xdg-desktop-portal-wlr: add recipe
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 07:01:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100124

next error is with non-systemd distros see

https://errors.yoctoproject.org/Errors/Details/684619/

On Mon, Dec 19, 2022 at 10:57 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> this depends on pipewire, which is in meta-multimedia, I wonder if
> this recipe should be in meta-multimedia as well.
>
> On Mon, Dec 19, 2022 at 5:11 AM Markus Volk <f_l_k@t-online.de> wrote:
> >
> > Signed-off-by: Markus Volk <f_l_k@t-online.de>
> > ---
> >  .../xdg-desktop-portal-wlr_0.6.0.bb           | 28 +++++++++++++++++++
> >  1 file changed, 28 insertions(+)
> >  create mode 100644 meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal-wlr_0.6.0.bb
> >
> > diff --git a/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal-wlr_0.6.0.bb b/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal-wlr_0.6.0.bb
> > new file mode 100644
> > index 000000000..07650a139
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal-wlr_0.6.0.bb
> > @@ -0,0 +1,28 @@
> > +SUMMARY = "A xdg-desktop-portal backend for gnome."
> > +HOMEPAGE = "https://gitlab.gnome.org/GNOME/xdg-desktop-portal-gnome"
> > +LICENSE = "MIT"
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=e316e9609dd7672b87ff25b46b2cf3e1"
> > +
> > +DEPENDS = " \
> > +    wayland \
> > +    wayland-native \
> > +    wayland-protocols \
> > +    libdrm \
> > +    libinih \
> > +    pipewire \
> > +    virtual/libgbm \
> > +"
> > +
> > +inherit meson pkgconfig
> > +
> > +SRC_URI = "git://github.com/emersion/xdg-desktop-portal-wlr.git;protocol=https;nobranch=1"
> > +
> > +S = "${WORKDIR}/git"
> > +SRCREV = "0a8bfa14607022a080f8b6eabc4757d1918d3cd9"
> > +
> > +PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
> > +
> > +PACKAGECONFIG[man-pages] = "-Dman-pages=enabled,-Dman-pages=disabled,scdoc-native"
> > +PACKAGECONFIG[systemd] = "-Dsystemd=enabled,-Dsystemd=disabled"
> > +
> > +FILES:${PN} += "${systemd_user_unitdir} ${datadir}"
> > --
> > 2.34.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#100098): https://lists.openembedded.org/g/openembedded-devel/message/100098
> > Mute This Topic: https://lists.openembedded.org/mt/95764267/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

