Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.10513.1612043599514860580
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Jan 2021 13:53:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Q74pdTXG;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: andrey.z@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id p21so17533574lfu.11
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 Jan 2021 13:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=wga59Xu6k+ftcCYcQX6LVbOBYh1vwASZK8n8F766Grw=;
        b=Q74pdTXGaLYPpzjuRPs9kC6FT++VkZQygoDibEXblC7k2DebNn4exS7UM/LAn/9RqJ
         x1GxP/tqN3IccCooYC2HqEBTk7tQwijFxvkUgiWsJwvOwomGwJi4XIzprvIWrdi9rooM
         BeZ2eaK0zuvTXvimYDpz92g2jiCmS2pmPTCw6/n3J7aUITX6lV/1r+aza2PGcu9OWbgG
         Iyp+ExpiKbF+OG5zkNo9yiAzBMM+DX3gzJGvQ+HSX5TyvuMmtMe+PtevytglxkaqMVTC
         UqMB4ch4w1qECxuBsITbgTWoyfKw18mtMe7s2GfVDJUQkxrNQMQZxqBkhckyZchBi+rz
         UTtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=wga59Xu6k+ftcCYcQX6LVbOBYh1vwASZK8n8F766Grw=;
        b=MkhnfBz2Gd2kCibTPE+2YV/bDkqJ0ENlmYglMnFGq8p8TnXwOl1KpruvEVTVxvVp4S
         G97cNeymv1tQ/zjkhsmLTc5wS9hzhtVg2c57ShuklwZbWnZU9sDXtEJjRsg/m2/G0ge/
         O0T54yftvM4eYEvMfvzno41AmEGYqSOPDbSX1dG399+PgKHOebGU6saikn5s1KQv9IFl
         LcUHFm+CO+fFbb2adcTyMk7i44j38N8T83YtMRwjgDDt8eYegE/TaG/K5ki3nMC10XIj
         BAMfS0H3w0/vGDRcmDPnRjd4zw3DamNx3rVpNUSoyuHaDFe3amfnYC9Eo8+jSn7M78TN
         gmMQ==
X-Gm-Message-State: AOAM533wjVbti5NV/2JJVvT6mGKgVBOyDyTtVIjjW/0K6bA1C0vL4RjR
	4UJ2T/jjWgXkKuwd3MyRNb7IRAH36QmZCoqq3Mk=
X-Google-Smtp-Source: ABdhPJz4/c9fbOL3+LkybRCiUbftQArYmJrLoOkMIwE07dcgmXnWgUZhNelZcikK9Z87h1eYkRCcz7Unq9YGXX5U+7c=
X-Received: by 2002:a19:4158:: with SMTP id o85mr5416049lfa.429.1612043597664;
 Sat, 30 Jan 2021 13:53:17 -0800 (PST)
MIME-Version: 1.0
References: <cover.1612035229.git.akuster808@gmail.com>
In-Reply-To: <cover.1612035229.git.akuster808@gmail.com>
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
Date: Sat, 30 Jan 2021 22:53:05 +0100
Message-ID: <CAHtQpK4jpZET4UZ=-34AJSvOCUGqOAVKMn-L-dh7WiLzerJPKg@mail.gmail.com>
Subject: Re: [oe] [dunfell 00/13] Patch review Jan 30
To: akuster <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Armin,

On Sat, Jan 30, 2021 at 8:37 PM akuster <akuster808@gmail.com> wrote:
>
> Here are the next block of changes for dunfell.
> Please have comments back my Tues

Would it be possible to include also the following commit from master:
04afc692a gpsd: mark CLEANBROKEN

This solves sporadic build errors for gpsd on dunfell, see
https://lists.openembedded.org/g/openembedded-core/message/147317

>
> Yes, this is out-of-sync with Gatesgath but I am seeing build issues the=
re and did not want to hold up this review cycle.
>
> Clean world build
>
> The following changes since commit 5bba79488b7d393d2258d6e917f7bf7b0d7c4=
073:
>
>   gupnp: Upgrade to 1.2.2 -> 1.2.4 (2021-01-18 08:40:15 -0800)
>
> are available in the Git repository at:
>
>   git://git.openembedded.org/meta-openembedded-contrib stable/dunfell-nu=
t
>   http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=3Dstable=
/dunfell-nut
>
> Dan Murphy (1):
>   mariadb: Fix 64bit builds if pam is enabled
>
> Dmitry Baryshkov (2):
>   xterm: install xterm and uxterm desktop files
>   xterm: provide virtual/x-terminal-emulator
>
> Harpritkaur Bhandari (1):
>   rapidjson: Upgrade SRCREV to latest
>
> Khem Raj (2):
>   iscsi-initiator-utils: Upgrade to _2.1.2
>   iscsi-initiator-utils: Silence a clang warning on 64bit systems
>
> Leon Anavi (2):
>   sip3: Consolidate in a single file
>   sip3: Upgrade 4.19.19 -> 4.19.23
>
> Martin Jansa (1):
>   networkd-dispatcher: use git fetcher
>
> Mikko Rapeli (2):
>   flatbuffers: whitelist CVE-2020-35864
>   giflib: apply patch for CVE-2019-15133 and set CVE_PRODUCT
>
> S=C3=B8ren Andersen (1):
>   zram: fix sourcing of zram parameters
>
> zangrc (1):
>   iscsi-initiator-utils: upgrade 2.1.2 -> 2.1.3
>
>  .../0001-Makefile-Do-not-set-Werror.patch     | 31 +++++++++++++++++++
>  ....1.0.bb =3D> iscsi-initiator-utils_2.1.3.bb} |  9 ++----
>  .../networkd-dispatcher_2.0.1.bb              |  7 +++--
>  meta-oe/recipes-dbs/mysql/mariadb.inc         |  8 +++--
>  .../flatbuffers/flatbuffers_1.12.0.bb         |  3 ++
>  .../giflib/files/CVE-2019-15133.patch         | 23 ++++++++++++++
>  .../recipes-devtools/giflib/giflib_5.1.4.bb   |  7 ++++-
>  .../rapidjson/rapidjson_git.bb                |  5 ++-
>  meta-oe/recipes-devtools/sip/sip3_4.19.19.bb  | 11 -------
>  .../sip/{sip.inc =3D> sip3_4.19.23.bb}          | 17 ++++++++--
>  .../recipes-extended/zram/zram/zram-swap-init |  2 +-
>  .../recipes-graphics/xorg-app/xterm_353.bb    | 16 ++++++++--
>  12 files changed, 107 insertions(+), 32 deletions(-)
>  create mode 100644 meta-networking/recipes-daemons/iscsi-initiator-util=
s/files/0001-Makefile-Do-not-set-Werror.patch
>  rename meta-networking/recipes-daemons/iscsi-initiator-utils/{iscsi-ini=
tiator-utils_2.1.0.bb =3D> iscsi-initiator-utils_2.1.3.bb} (96%)
>  create mode 100644 meta-oe/recipes-devtools/giflib/files/CVE-2019-15133=
.patch
>  delete mode 100644 meta-oe/recipes-devtools/sip/sip3_4.19.19.bb
>  rename meta-oe/recipes-devtools/sip/{sip.inc =3D> sip3_4.19.23.bb} (79%=
)
>
> --
> 2.17.1
>
>
>=20
>

Thanks a lot!

--=20
Regards,
Andrey.
