Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CB30C3DA6E
	for <webhook@archiver.kernel.org>; Fri,  5 Jan 2024 17:35:37 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web11.29524.1704476135011165603
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Jan 2024 09:35:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OVEK6r7e;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-2041c292da8so875818fac.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 05 Jan 2024 09:35:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704476134; x=1705080934; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UEnvD/zRb9QYUn+VvPXaf+4GFCS29Wr48l1JCUdvefg=;
        b=OVEK6r7eBv5oOJtBG1jfMJBEtrxXHz2B+wQwyobO9fYX4fPdy25yiBQ03J+P2ddE5w
         M1cUA1ws5WbSrrTCxbm2u0R9VjOptbo4oUbkifjpNji1n/Br3nax6WE93UYF8nH7jlEa
         SZfOcUagrZx2k5WTJz3gVR0MgoSBBwcn09EwLeO1HMOD48jIr/tbi4N4vHqXmRTjgzpR
         g/4WOVug+a792FNIoqmUajn6son5ZupBanhB10Z5RRSp8TD6P5WgJI/fJNESebYNizoq
         6mvTfTwWlZyHsMLnYB9caa3tUUT7jwkpuqd8umPTmELBpIhN63mPs9cAkSuMkbZRioab
         vB+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704476134; x=1705080934;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UEnvD/zRb9QYUn+VvPXaf+4GFCS29Wr48l1JCUdvefg=;
        b=YhC05P9ToQRzRN8ClOda+xoeagPvmCFiJDJqo8Fk/IBD7rkvLABrKoOpEij69zOBwo
         gVge6KHJF08RUh/rkc9KmCmbarSoCBpyxsRwjJ7WtWug/LQT2cebD4cW2t2s6n7Vocrz
         2hvCcwdX+fkssjc3mvynKTdXds2TEBntXVbeomoE+0nEXIzubcZhs5wWcGrrcJgRxi7F
         W7FjISsjRjCU0klu+tTvCzZnMSLPKkxkeCIun14Rx41siKJjY3wHYRI4JGCoEgngosqf
         tvO4tCeE/VZybB6TXjum8cEvPGBxE24CVLWsRVEmhREKsHVp3QBbCtFusZz6PIx6ZsP6
         r6BQ==
X-Gm-Message-State: AOJu0YxXOHfg+vIIC8RAZ0UMt6ZMXvi7RERQMiAKUrQ/4sf5DMeqLtaU
	tr9I8eDuTyP7mJ+WjTljbP0NteXMCy8DEqiJmMg=
X-Google-Smtp-Source: AGHT+IFc/5YQfHTrMKwMd2LTfDAE4EMi9p4AIno9mhDwP1LaKakabJw95yh3Yn1rZrXzDjHi6ms5ZJIA8aO7Y0mG5Mk=
X-Received: by 2002:a05:6871:a004:b0:203:6d48:cf9f with SMTP id
 vp4-20020a056871a00400b002036d48cf9fmr2114220oab.79.1704476133662; Fri, 05
 Jan 2024 09:35:33 -0800 (PST)
MIME-Version: 1.0
References: <e6668968-0efe-411f-b2ea-efa2a4dc83f5@gmail.com>
In-Reply-To: <e6668968-0efe-411f-b2ea-efa2a4dc83f5@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 5 Jan 2024 09:35:07 -0800
Message-ID: <CAMKF1sqy-OcxBjZMqdvcx108TKdAb9GOwk95f8WTdrXuB2mTeA@mail.gmail.com>
Subject: Re: nanbield merge request: Jan 5th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Jan 2024 17:35:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108049

merged thanks Armin.

On Fri, Jan 5, 2024 at 4:58=E2=80=AFAM akuster808 <akuster808@gmail.com> wr=
ote:
>
> The following changes since commit 1750c66ae8e4268c472c0b2b94748a59d6ef86=
6d:
>
>    emlog: Add PV (2023-11-01 08:16:30 -0400)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded nanbield-next
>
> for you to fetch changes up to 2da6e1b0e43a8993fd422fee3f83940100b59f4c:
>
>    poco: fix branch (2024-01-05 07:52:17 -0500)
>
> ----------------------------------------------------------------
> Alexandre Belloni (1):
>        poco: fix branch
>
> Christian Eggers (1):
>        python3-gcovr: switch to main branch
>
> Dylan Turner (1):
>        apache2: v2.4.57 to v2.4.58 to fix CVE-2023-43622
>
> Edi Feschiyan (1):
>        libbytesize: update SRC_URI
>
> Fabio Estevam (3):
>        openocd: Use https for github
>        python3-piccata: Use https for github
>        multipath-tools: Use https for github
>
> Jeffrey Pautler (1):
>        apache2: add vendor to product name used for CVE checking
>
> Jonas Gorski (1):
>        frr: fix CVEs CVE-2023-4675{2,3} and CVE-2023-4723{4,5}
>
> Khem Raj (3):
>        hwdata: upgrade 0.370 -> 0.375
>        openvpn: upgrade 2.6.3 -> 2.6.6
>        python3-scapy: upgrade to latest revision
>
> Ross Burton (1):
>        yajl: fix CVE-2017-16516, CVE-2022-24795, CVE-2023-33460
>
> Wang Mingyu (3):
>        hdf5: Fix install conflict when enable multilib.
>        dnf-plugin-tui: Recover BBCLASSEXTEND variants
>        strongswan: upgrade 5.9.11 -> 5.9.12
>
> Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi (3):
>        python3-ninja-syntax: Set BBCLASSEXTEND =3D "native nativesdk"
>        python3-ninja: Set BBCLASSEXTEND =3D "native nativesdk"
>        geos: Fix packaging
>
>   meta-networking/recipes-devtools/python/python3-scapy_2.5.0.bb  | 2 +-
>   meta-networking/recipes-protocols/frr/frr/CVE-2023-46752.patch  | 125
> ++++++++++++++++++++++++++++
>   meta-networking/recipes-protocols/frr/frr/CVE-2023-46753.patch  | 117
> ++++++++++++++++++++++++++
>   meta-networking/recipes-protocols/frr/frr/CVE-2023-47234.patch  | 95
> +++++++++++++++++++++
>   meta-networking/recipes-protocols/frr/frr/CVE-2023-47235.patch  | 112
> +++++++++++++++++++++++++
>   meta-networking/recipes-protocols/frr/frr_9.0.1.bb              | 6 ++
>   .../openvpn/{openvpn_2.6.3.bb =3D> openvpn_2.6.6.bb} |   4 +-
>   .../strongswan/{strongswan_5.9.11.bb =3D> strongswan_5.9.12.bb} |   2 +=
-
>   meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb   | 2 +
>   meta-oe/recipes-devtools/openocd/openocd_git.bb                 | 2 +-
>   meta-oe/recipes-devtools/yajl/yajl/CVE-2017-16516.patch         | 37
> ++++++++
>   meta-oe/recipes-devtools/yajl/yajl/CVE-2022-24795.patch         | 59
> +++++++++++++
>   meta-oe/recipes-devtools/yajl/yajl/CVE-2023-33460.patch         | 35
> ++++++++
>   meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb                     | 6 +-
>   meta-oe/recipes-navigation/geos/geos_3.12.0.bb                  | 2 +-
>   meta-oe/recipes-support/hdf5/hdf5_1.14.2.bb                     | 6 +-
>   .../recipes-support/hwdata/{hwdata_0.370.bb =3D> hwdata_0.375.bb} |   2=
 +-
>   meta-oe/recipes-support/libbytesize/libbytesize_2.10.bb         | 2 +-
>   .../recipes-support/multipath-tools/multipath-tools_0.9.3.bb    | 2 +-
>   meta-oe/recipes-support/poco/poco_1.12.4.bb                     | 4 +-
>   meta-python/recipes-devtools/python/python3-gcovr_6.0.bb        | 2 +-
>   .../recipes-devtools/python/python3-ninja-syntax_1.7.2.bb       | 4 +-
>   meta-python/recipes-devtools/python/python3-ninja_1.11.1.bb     | 1 +
>   .../recipes-devtools/python3-piccata/python3-piccata_2.0.3.bb   | 2 +-
>   ...1-modules-mappers-config9.m4-Add-server-directory-to-i.patch | 31
> -------
>   .../apache2/{apache2_2.4.57.bb =3D> apache2_2.4.58.bb} |   5 +-
>   26 files changed, 617 insertions(+), 50 deletions(-)
>   create mode 100644
> meta-networking/recipes-protocols/frr/frr/CVE-2023-46752.patch
>   create mode 100644
> meta-networking/recipes-protocols/frr/frr/CVE-2023-46753.patch
>   create mode 100644
> meta-networking/recipes-protocols/frr/frr/CVE-2023-47234.patch
>   create mode 100644
> meta-networking/recipes-protocols/frr/frr/CVE-2023-47235.patch
>   rename meta-networking/recipes-support/openvpn/{openvpn_2.6.3.bb =3D>
> openvpn_2.6.6.bb} (95%)
>   rename
> meta-networking/recipes-support/strongswan/{strongswan_5.9.11.bb =3D>
> strongswan_5.9.12.bb} (99%)
>   create mode 100644 meta-oe/recipes-devtools/yajl/yajl/CVE-2017-16516.pa=
tch
>   create mode 100644 meta-oe/recipes-devtools/yajl/yajl/CVE-2022-24795.pa=
tch
>   create mode 100644 meta-oe/recipes-devtools/yajl/yajl/CVE-2023-33460.pa=
tch
>   rename meta-oe/recipes-support/hwdata/{hwdata_0.370.bb =3D>
> hwdata_0.375.bb} (91%)
>   delete mode 100644
> meta-webserver/recipes-httpd/apache2/apache2/0011-modules-mappers-config9=
.m4-Add-server-directory-to-i.patch
>   rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.57.bb =3D>
> apache2_2.4.58.bb} (98%)
>

