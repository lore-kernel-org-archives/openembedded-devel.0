Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A482FC6FD18
	for <webhook@archiver.kernel.org>; Sat, 22 Apr 2023 19:18:30 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web10.14377.1682191102156351123
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 Apr 2023 12:18:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=EbBgeuQO;
 spf=pass (domain: gmail.com, ip: 209.85.167.174, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-38de3338abeso1878409b6e.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 22 Apr 2023 12:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682191101; x=1684783101;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+8o7ptaQwXRmYoafZ5YfTmuHebzkS13IO2LDFn26zGc=;
        b=EbBgeuQOw86RYqtfH/RvtHvEzlPAc3avdlinV1PRC5xvsnSHHE4kIEQeF8khmjpeJ3
         E6Vx8nOS6OIk+tSRnIxkuv0colg3egLdu0RnmeHVDPwGfeTKpovZgvwPJDGPVhfSTrJp
         hU2EmvhGlzLI1FRFaeGUhjavIyZtt1g/MxMS3KCRLLbBYEOQqNo0FXzO61o/jwvoL55Q
         27v4+SwyVZJ39PXeqyCFrhjKU5u3uGMV6Rd7TBwABNOtUHicSGLzLhQ/5HX/EsP1P7Dv
         Y7cjfchEW7a5a1G65f7p08iLoyLRmgkwADjjRTelnlAuttorL/QbRsVthBpVVokBl6QW
         Y8vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682191101; x=1684783101;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+8o7ptaQwXRmYoafZ5YfTmuHebzkS13IO2LDFn26zGc=;
        b=bGRYdWYFnJ1+YA9N7rCeBHsXCC1vBFwwEPO9BMdXNQI/p5Rfb7SGt1YoJ2BxDijakz
         15B38a9Tm97NN61Stz6AiOA8VpIDI4sIfIBLOSMey5ZY7nvx4Z70pz9yhkpfg/uPTswh
         Q+g4zpQB2jpiONlUzA+VVks+7ZxjPiavLhCa24Pq1LIa23+E9oIh3xu8qH13/cF6rPyp
         Zo6A7WNIlsHUPCiKnXOnuw3kY0Kji6pA3JaO/4PVOxt5O5bPw82dzp4/ZtP/eGiY2JLK
         nU30XNhUTRADSrIpNrLYtDlSHKANRBfPa164oWIZFLzdQWUnl13L7e70Bb/htG0RoUSH
         1lbQ==
X-Gm-Message-State: AAQBX9dilh43j+GGl8CSvkDHgXojQVDiqz8icPabKpXSy9YB45YKIji6
	u+RuuIp9GB3nEzO4EGxugOxI2aUx7fepx8/SY1M=
X-Google-Smtp-Source: AKy350bzmk7mSSsXcEZupdCIfpoEsWvsjlINv+RAOUbuEthO/ntTh8ERtxWCnftoyyZEEp0GNeKpQ8uDoVZhaZefHtg=
X-Received: by 2002:a05:6808:f11:b0:387:795b:567d with SMTP id
 m17-20020a0568080f1100b00387795b567dmr4996342oiw.41.1682191101185; Sat, 22
 Apr 2023 12:18:21 -0700 (PDT)
MIME-Version: 1.0
References: <36fcb067-96d6-d2a6-c5b8-a695715febdd@gmail.com>
In-Reply-To: <36fcb067-96d6-d2a6-c5b8-a695715febdd@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 22 Apr 2023 12:17:55 -0700
Message-ID: <CAMKF1sqeaVox=0UzCMFG9zyGpQNEg6nWxyCKD2LjhKvA8k2MtA@mail.gmail.com>
Subject: Re: langdale merge request: April 22
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 22 Apr 2023 19:18:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102148

merged thanks Armin.

On Sat, Apr 22, 2023 at 12:01=E2=80=AFPM akuster808 <akuster808@gmail.com> =
wrote:
>
> The following changes since commit b4ff73905b887cf7c489248de80dab2721090c=
bf:
>
>    dnsmasq: fix CVE-2023-28450 (2023-03-25 09:07:27 -0400)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded langdale-next
>
> for you to fetch changes up to 3d1ec70ed319c1b7f561fcda7b8cd0c2e0b2c262:
>
>    dleyna-{server,renderer}: fix dev-so QA issue with multilib
> (2023-04-18 06:45:59 -0400)
>
> ----------------------------------------------------------------
> Martin Jansa (7):
>        zsh: fix installed-vs-shipped with multilib
>        restinio: fix S variable in multilib builds
>        mongodb: fix chown user for multilib builds
>        pahole: respect libdir
>        lvgl,lv-lib-png,lv-drivers: fix installed-vs-shipped QA issue
> with multilib
>        lirc: fix do_install with multilib
>        dleyna-{server,renderer}: fix dev-so QA issue with multilib
>
> Wang Mingyu (1):
>        openwsman: Change download branch from master to main.
>
>   meta-multimedia/recipes-multimedia/dleyna/dleyna-renderer_0.6.0.bb | 2 =
+-
>   meta-multimedia/recipes-multimedia/dleyna/dleyna-server_0.6.0.bb | 2 +-
>   meta-networking/recipes-connectivity/restinio/restinio_0.6.13.bb | 4 ++=
--
>   meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.=
2.bb | 6 +++---
>   meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
> | 2 +-
>   meta-oe/recipes-devtools/pahole/pahole_1.22.bb | 2 +-
>   meta-oe/recipes-extended/openwsman/openwsman_2.7.2.bb | 2 +-
>   meta-oe/recipes-graphics/lvgl/lv-drivers_7.11.0.bb | 8 ++++----
>   meta-oe/recipes-graphics/lvgl/lv-lib-png_8.0.2.bb | 8 +++++---
>   meta-oe/recipes-graphics/lvgl/lvgl_8.1.0.bb | 6 +++---
>   meta-oe/recipes-shells/zsh/zsh_5.8.bb | 4 ++--
>   11 files changed, 24 insertions(+), 22 deletions(-)
>

