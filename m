Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8113DC4167B
	for <webhook@archiver.kernel.org>; Mon, 26 Dec 2022 03:16:07 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web10.129617.1672024562770438123
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Dec 2022 19:16:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AFiYYdkD;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-1442977d77dso11695331fac.6
        for <openembedded-devel@lists.openembedded.org>; Sun, 25 Dec 2022 19:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uKYNqyZ8sdqdEIrPOws9s6NVF4jbriOLgJLPglZrxb0=;
        b=AFiYYdkD0c8WqJUlsV7Cxe2fLhQERdesI4j6TqL967iOh5oxILq6UwesLiJgBYKv7I
         8A4w0OBGhjsUi9D1aU+tcMedT20vMmxOP3UBo5dNEnEdEgRTt2H/HIjgYHzGc7FhY2gF
         U3lh/SpDDzXVtgjXzPUGHALeiVO1C+nTKchFh9M9x9oMwtRr/POFwNilAIfn+HGdPrgY
         Yp7dC1fT5Ya1wU6Ys03qNMgKIIDWlUfEFqvjIAJbgYwhBfTY2grRqZOyAaJHTXgZn+ju
         kOfn58okNjxNrIH+WlSmpiPnrhG7akHo42Iy43WNBTRObnMTq0jwhWIF5NU43//cQeD4
         kR3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uKYNqyZ8sdqdEIrPOws9s6NVF4jbriOLgJLPglZrxb0=;
        b=6j/+sKGohFiGecY2VwYKDxtNOgTXV8480YpsPRvSbT53ME+B957tdEaw3vtQ48jlAX
         n7z7IC58N1cmcByvBkxUhdfBCaau1se5YjuKeT6sfDvtmzRZ/UNjxgTb2/eMH6VRctfE
         5RpJxvGs3mdd0vPMmJPZyErHP1Sk4x1bZPIBXA+tA62HcAVpbhdFadIFz7tt7tF7Kghn
         oNL1uJJOc5SX1r/3bsTiGdW92J0DJvCWk1qCgyn+RhlrTCE4D5bjkHWR6s2TnRj5vZgv
         aNQR3KWijpiLoAVsG1YygMrtW/UAk7As0WCcc/5mhlg3jCklVg6Z9OJddvFQ8Yn1z/Y1
         scHA==
X-Gm-Message-State: AFqh2krQKeOAEDWsr26zUY6gj0pWA426KBUXyVBUbPndVClS941Emiil
	ALcfIooaOXNFRoiLJzU3hvfAisAxnbJeU7M7Tdk=
X-Google-Smtp-Source: AMrXdXtBLJpdvR+VHsIi4bF1DWqpnW1chqi9Ot/7XAH+ivUHkoY6fsOmgRq7YMq5n9ye/jU3y7DYqx+4Un7H8ycuXos=
X-Received: by 2002:a05:6870:b01d:b0:144:e1eb:419 with SMTP id
 y29-20020a056870b01d00b00144e1eb0419mr1154818oae.262.1672024561867; Sun, 25
 Dec 2022 19:16:01 -0800 (PST)
MIME-Version: 1.0
References: <20221224213347.39959-1-kai.kang@windriver.com>
 <CAMKF1srPffhVDHQ4-RfkmK+OhebrLc5Xc232RAVvDmMb5ao-Yw@mail.gmail.com> <c24b48cb-4c80-c5cc-ac6d-4a911f7ec3b7@windriver.com>
In-Reply-To: <c24b48cb-4c80-c5cc-ac6d-4a911f7ec3b7@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 25 Dec 2022 19:15:35 -0800
Message-ID: <CAMKF1soO3eFZaONBUOaBKfigaDHVzyiDn_uZCb=NzJpG8tj8bw@mail.gmail.com>
Subject: Re: [oe] [meta-xfce][PATCH 00/16] Update core xfce components to 4.18.0
To: Kai <kai.kang@windriver.com>
Cc: Kai Kang <kai.kang@eng.windriver.com>, schnitzeltony@gmail.com, 
	openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Dec 2022 03:16:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100233

I also see it on qemuarm

https://errors.yoctoproject.org/Errors/Build/157426/

x86

https://errors.yoctoproject.org/Errors/Build/157418/

On Sun, Dec 25, 2022 at 5:01 PM Kai <kai.kang@windriver.com> wrote:
>
> On 12/26/22 01:56, Khem Raj wrote:
> > Thanks for that patches. They fail to build see xfce related recipe
> > failures here.
> >
> > https://errors.yoctoproject.org/Errors/Build/157414/
>
> It seems all are qemumips related. I'll check them.
>
> Kai
>
> >
> > On Sat, Dec 24, 2022 at 1:34 PM Kai Kang <kai.kang@eng.windriver.com> wrote:
> >> From: Kai Kang <kai.kang@windriver.com>
> >>
> >>
> >> Kai Kang (16):
> >>    xfce4-dev-tools: 4.16.0 -> 4.18.0
> >>    libxfce4util: 4.16.0 -> 4.18.0
> >>    libxfce4ui: 4.16.1 -> 4.18.0
> >>    exo: 4.16.4 -> 4.18.0
> >>    garcon: 4.16.1 -> 4.18.0
> >>    xfce4-panel: 4.16.3 -> 4.18.0
> >>    thunar: 4.16.9 -> 4.18.0
> >>    thunar-volman: 4.16.0 -> 4.18.0
> >>    tumbler: 4.16.0 -> 4.18.0
> >>    xfconf: 4.16.0 -> 4.18.0
> >>    xfce4-appfinder: 4.16.1 -> 4.18.0
> >>    xfce4-power-manager: 4.16.0 -> 4.18.0
> >>    xfce4-session: 4.16.0 -> 4.18.0
> >>    xfce4-settings: 4.16.5 -> 4.18.0
> >>    xfdesktop: 4.16.0 -> 4.18.0
> >>    xfwm4: 4.16.1 -> 4.18.0
> >>
> >>   .../recipes-xfce/exo/exo/configure.patch      | 57 ------------
> >>   .../exo/exo/exo-no-tests-0.8.patch            |  9 +-
> >>   .../reduce-build-to-exo-csource-only.patch    | 90 -------------------
> >>   .../exo/{exo_4.16.4.bb => exo_4.18.0.bb}      |  5 +-
> >>   .../{garcon_4.16.1.bb => garcon_4.18.0.bb}    |  2 +-
> >>   ...xfce4ui_4.16.1.bb => libxfce4ui_4.18.0.bb} |  6 +-
> >>   .../libxfce4util/libxfce4util_4.16.0.bb       |  9 --
> >>   .../libxfce4util/libxfce4util_4.18.0.bb       |  9 ++
> >>   ...lman_4.16.0.bb => thunar-volman_4.18.0.bb} |  6 +-
> >>   .../{thunar_4.16.9.bb => thunar_4.18.0.bb}    |  8 +-
> >>   .../{tumbler_4.16.0.bb => tumbler_4.18.0.bb}  |  9 +-
> >>   ...er_4.16.1.bb => xfce4-appfinder_4.18.0.bb} |  6 +-
> >>   ...ls_4.16.0.bb => xfce4-dev-tools_4.18.0.bb} | 14 +--
> >>   ...t-display-desktop-icon-when-no-windo.patch | 15 ++--
> >>   ...-panel_4.16.3.bb => xfce4-panel_4.18.0.bb} |  4 +-
> >>   ....16.0.bb => xfce4-power-manager_4.18.0.bb} |  2 +-
> >>   ...sion_4.16.0.bb => xfce4-session_4.18.0.bb} | 10 +--
> >>   ...ngs_4.16.5.bb => xfce4-settings_4.18.0.bb} |  6 +-
> >>   .../{xfconf_4.16.0.bb => xfconf_4.18.0.bb}    |  4 +-
> >>   ...fdesktop_4.16.0.bb => xfdesktop_4.18.0.bb} |  4 +-
> >>   .../{xfwm4_4.16.1.bb => xfwm4_4.18.0.bb}      |  4 +-
> >>   21 files changed, 69 insertions(+), 210 deletions(-)
> >>   delete mode 100644 meta-xfce/recipes-xfce/exo/exo/configure.patch
> >>   delete mode 100644 meta-xfce/recipes-xfce/exo/exo/reduce-build-to-exo-csource-only.patch
> >>   rename meta-xfce/recipes-xfce/exo/{exo_4.16.4.bb => exo_4.18.0.bb} (84%)
> >>   rename meta-xfce/recipes-xfce/garcon/{garcon_4.16.1.bb => garcon_4.18.0.bb} (89%)
> >>   rename meta-xfce/recipes-xfce/libxfce4ui/{libxfce4ui_4.16.1.bb => libxfce4ui_4.18.0.bb} (84%)
> >>   delete mode 100644 meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.16.0.bb
> >>   create mode 100644 meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.18.0.bb
> >>   rename meta-xfce/recipes-xfce/thunar-volman/{thunar-volman_4.16.0.bb => thunar-volman_4.18.0.bb} (63%)
> >>   rename meta-xfce/recipes-xfce/thunar/{thunar_4.16.9.bb => thunar_4.18.0.bb} (77%)
> >>   rename meta-xfce/recipes-xfce/tumbler/{tumbler_4.16.0.bb => tumbler_4.18.0.bb} (80%)
> >>   rename meta-xfce/recipes-xfce/xfce4-appfinder/{xfce4-appfinder_4.16.1.bb => xfce4-appfinder_4.18.0.bb} (54%)
> >>   rename meta-xfce/recipes-xfce/xfce4-dev-tools/{xfce4-dev-tools_4.16.0.bb => xfce4-dev-tools_4.18.0.bb} (78%)
> >>   rename meta-xfce/recipes-xfce/xfce4-panel/{xfce4-panel_4.16.3.bb => xfce4-panel_4.18.0.bb} (93%)
> >>   rename meta-xfce/recipes-xfce/xfce4-power-manager/{xfce4-power-manager_4.16.0.bb => xfce4-power-manager_4.18.0.bb} (93%)
> >>   rename meta-xfce/recipes-xfce/xfce4-session/{xfce4-session_4.16.0.bb => xfce4-session_4.18.0.bb} (82%)
> >>   rename meta-xfce/recipes-xfce/xfce4-settings/{xfce4-settings_4.16.5.bb => xfce4-settings_4.18.0.bb} (85%)
> >>   rename meta-xfce/recipes-xfce/xfconf/{xfconf_4.16.0.bb => xfconf_4.18.0.bb} (85%)
> >>   rename meta-xfce/recipes-xfce/xfdesktop/{xfdesktop_4.16.0.bb => xfdesktop_4.18.0.bb} (77%)
> >>   rename meta-xfce/recipes-xfce/xfwm4/{xfwm4_4.16.1.bb => xfwm4_4.18.0.bb} (90%)
> >>
> >> --
> >> 2.17.1
> >>
> >>
> >> -=-=-=-=-=-=-=-=-=-=-=-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#100209): https://lists.openembedded.org/g/openembedded-devel/message/100209
> >> Mute This Topic: https://lists.openembedded.org/mt/95868220/1997914
> >> Group Owner: openembedded-devel+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> >> -=-=-=-=-=-=-=-=-=-=-=-
> >>
>
> --
> Kai Kang
> Wind River Linux
>

