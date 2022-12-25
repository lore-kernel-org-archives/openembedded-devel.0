Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3733C3DA7A
	for <webhook@archiver.kernel.org>; Sun, 25 Dec 2022 17:57:04 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web10.121763.1671991020551842008
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Dec 2022 09:57:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KI8rm5TO;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-1433ef3b61fso10982304fac.10
        for <openembedded-devel@lists.openembedded.org>; Sun, 25 Dec 2022 09:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9ZGqHvKltDdKFspbwjbVveCgBbdjuHtIMvyNEpKMboo=;
        b=KI8rm5TOklf/XhbZeoIm/SRRqPC7OI4bz2vo3GdkcI774ibVMZgBPRxfz06CBkRN8D
         MDwKKgJnvT7vz6GgAH0ubE7o65U+6rNKuUTHZImmXRZH+nfxMCoX0NjHth9tx3scwGeY
         uRzCmDjDrCin4Kf1miOAKidbOCQl96uaEmDyltBkubJWlHdAeG0DJ4w+46FcftcQV/6Y
         R1jBTvzUyI+QZE26LWfHCvYZaypgOYuXjbJ8HxQNQViWW9fATZdswyjCzk9uer4yeqgJ
         b+K05oHsN50rUOhRRnLPUk8h6HgdVqAuEGCwH+nJ/u4ktxcEu629C4CLCgKx2Jut3xD2
         XCxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ZGqHvKltDdKFspbwjbVveCgBbdjuHtIMvyNEpKMboo=;
        b=ltDpAcMjWGb7oonI4IHHzOGECH2qTbaMY3HjPbNl8I6BnbEHZ8pw1xQ2avHQ3lVJw0
         MBV2DEB8uR+VqkXXwa8RRhix9M8M3aKKwVXCXC40590Pov4XEyXFinKRWHrcq6PX0Jsm
         woLii8/NwVj6wWYaOgG69tk5JudN41qzw5i4L5+1+YjG0e2ufpsEokp7a4OjzpgRu8RI
         b5i75qXrjDl/p60/N22gMdyK/uv5obh9UfeVHmhE8Jkh8rywzIENp53pyWGSm/HaK9ww
         iedI/lVTgXC0l248eZLE6Mgu/BzW9soEk7VIz4OzyVcFIYAtfVswNm1AtMxZclW5nbby
         usCw==
X-Gm-Message-State: AFqh2koMBCTH3gCWh3n8DH9uwD86TS5CrAJmgenydimRwsvkhY5lf7JR
	Ptutx9MkbiKda1/0fOm7WcgpfgqbIx7kNHOG3OU=
X-Google-Smtp-Source: AMrXdXvW0c66yfYSmVJ2Vl8o61ummf5O6W1AwV6AtkCPfKjqlBluQasBltX4WxCxyBGtDGKsbmfQnN435z2XsRrJPkM=
X-Received: by 2002:a05:6870:ee14:b0:14c:733d:3b1 with SMTP id
 ga20-20020a056870ee1400b0014c733d03b1mr888977oab.55.1671991019719; Sun, 25
 Dec 2022 09:56:59 -0800 (PST)
MIME-Version: 1.0
References: <20221224213347.39959-1-kai.kang@windriver.com>
In-Reply-To: <20221224213347.39959-1-kai.kang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 25 Dec 2022 09:56:33 -0800
Message-ID: <CAMKF1srPffhVDHQ4-RfkmK+OhebrLc5Xc232RAVvDmMb5ao-Yw@mail.gmail.com>
Subject: Re: [oe] [meta-xfce][PATCH 00/16] Update core xfce components to 4.18.0
To: Kai Kang <kai.kang@eng.windriver.com>
Cc: schnitzeltony@gmail.com, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 25 Dec 2022 17:57:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100230

Thanks for that patches. They fail to build see xfce related recipe
failures here.

https://errors.yoctoproject.org/Errors/Build/157414/

On Sat, Dec 24, 2022 at 1:34 PM Kai Kang <kai.kang@eng.windriver.com> wrote:
>
> From: Kai Kang <kai.kang@windriver.com>
>
>
> Kai Kang (16):
>   xfce4-dev-tools: 4.16.0 -> 4.18.0
>   libxfce4util: 4.16.0 -> 4.18.0
>   libxfce4ui: 4.16.1 -> 4.18.0
>   exo: 4.16.4 -> 4.18.0
>   garcon: 4.16.1 -> 4.18.0
>   xfce4-panel: 4.16.3 -> 4.18.0
>   thunar: 4.16.9 -> 4.18.0
>   thunar-volman: 4.16.0 -> 4.18.0
>   tumbler: 4.16.0 -> 4.18.0
>   xfconf: 4.16.0 -> 4.18.0
>   xfce4-appfinder: 4.16.1 -> 4.18.0
>   xfce4-power-manager: 4.16.0 -> 4.18.0
>   xfce4-session: 4.16.0 -> 4.18.0
>   xfce4-settings: 4.16.5 -> 4.18.0
>   xfdesktop: 4.16.0 -> 4.18.0
>   xfwm4: 4.16.1 -> 4.18.0
>
>  .../recipes-xfce/exo/exo/configure.patch      | 57 ------------
>  .../exo/exo/exo-no-tests-0.8.patch            |  9 +-
>  .../reduce-build-to-exo-csource-only.patch    | 90 -------------------
>  .../exo/{exo_4.16.4.bb => exo_4.18.0.bb}      |  5 +-
>  .../{garcon_4.16.1.bb => garcon_4.18.0.bb}    |  2 +-
>  ...xfce4ui_4.16.1.bb => libxfce4ui_4.18.0.bb} |  6 +-
>  .../libxfce4util/libxfce4util_4.16.0.bb       |  9 --
>  .../libxfce4util/libxfce4util_4.18.0.bb       |  9 ++
>  ...lman_4.16.0.bb => thunar-volman_4.18.0.bb} |  6 +-
>  .../{thunar_4.16.9.bb => thunar_4.18.0.bb}    |  8 +-
>  .../{tumbler_4.16.0.bb => tumbler_4.18.0.bb}  |  9 +-
>  ...er_4.16.1.bb => xfce4-appfinder_4.18.0.bb} |  6 +-
>  ...ls_4.16.0.bb => xfce4-dev-tools_4.18.0.bb} | 14 +--
>  ...t-display-desktop-icon-when-no-windo.patch | 15 ++--
>  ...-panel_4.16.3.bb => xfce4-panel_4.18.0.bb} |  4 +-
>  ....16.0.bb => xfce4-power-manager_4.18.0.bb} |  2 +-
>  ...sion_4.16.0.bb => xfce4-session_4.18.0.bb} | 10 +--
>  ...ngs_4.16.5.bb => xfce4-settings_4.18.0.bb} |  6 +-
>  .../{xfconf_4.16.0.bb => xfconf_4.18.0.bb}    |  4 +-
>  ...fdesktop_4.16.0.bb => xfdesktop_4.18.0.bb} |  4 +-
>  .../{xfwm4_4.16.1.bb => xfwm4_4.18.0.bb}      |  4 +-
>  21 files changed, 69 insertions(+), 210 deletions(-)
>  delete mode 100644 meta-xfce/recipes-xfce/exo/exo/configure.patch
>  delete mode 100644 meta-xfce/recipes-xfce/exo/exo/reduce-build-to-exo-csource-only.patch
>  rename meta-xfce/recipes-xfce/exo/{exo_4.16.4.bb => exo_4.18.0.bb} (84%)
>  rename meta-xfce/recipes-xfce/garcon/{garcon_4.16.1.bb => garcon_4.18.0.bb} (89%)
>  rename meta-xfce/recipes-xfce/libxfce4ui/{libxfce4ui_4.16.1.bb => libxfce4ui_4.18.0.bb} (84%)
>  delete mode 100644 meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.16.0.bb
>  create mode 100644 meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.18.0.bb
>  rename meta-xfce/recipes-xfce/thunar-volman/{thunar-volman_4.16.0.bb => thunar-volman_4.18.0.bb} (63%)
>  rename meta-xfce/recipes-xfce/thunar/{thunar_4.16.9.bb => thunar_4.18.0.bb} (77%)
>  rename meta-xfce/recipes-xfce/tumbler/{tumbler_4.16.0.bb => tumbler_4.18.0.bb} (80%)
>  rename meta-xfce/recipes-xfce/xfce4-appfinder/{xfce4-appfinder_4.16.1.bb => xfce4-appfinder_4.18.0.bb} (54%)
>  rename meta-xfce/recipes-xfce/xfce4-dev-tools/{xfce4-dev-tools_4.16.0.bb => xfce4-dev-tools_4.18.0.bb} (78%)
>  rename meta-xfce/recipes-xfce/xfce4-panel/{xfce4-panel_4.16.3.bb => xfce4-panel_4.18.0.bb} (93%)
>  rename meta-xfce/recipes-xfce/xfce4-power-manager/{xfce4-power-manager_4.16.0.bb => xfce4-power-manager_4.18.0.bb} (93%)
>  rename meta-xfce/recipes-xfce/xfce4-session/{xfce4-session_4.16.0.bb => xfce4-session_4.18.0.bb} (82%)
>  rename meta-xfce/recipes-xfce/xfce4-settings/{xfce4-settings_4.16.5.bb => xfce4-settings_4.18.0.bb} (85%)
>  rename meta-xfce/recipes-xfce/xfconf/{xfconf_4.16.0.bb => xfconf_4.18.0.bb} (85%)
>  rename meta-xfce/recipes-xfce/xfdesktop/{xfdesktop_4.16.0.bb => xfdesktop_4.18.0.bb} (77%)
>  rename meta-xfce/recipes-xfce/xfwm4/{xfwm4_4.16.1.bb => xfwm4_4.18.0.bb} (90%)
>
> --
> 2.17.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#100209): https://lists.openembedded.org/g/openembedded-devel/message/100209
> Mute This Topic: https://lists.openembedded.org/mt/95868220/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

