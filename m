Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EC44C4167B
	for <webhook@archiver.kernel.org>; Wed, 29 Nov 2023 16:02:34 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web11.40692.1701273743958368968
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Nov 2023 08:02:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gLT5EpoV;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-1f055438492so3985755fac.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Nov 2023 08:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701273743; x=1701878543; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WTaTBsRhdueTfRMaCrpT3/cV5aM9tgJksyxMzM6Icdc=;
        b=gLT5EpoVX9gbODVeKG2ygp/oo/lazVly/UAC/iDakg/1eoigL9f8DVD3h4rsYnhNP4
         RCC7Lx/6j1IwpltUDcO9hlrAIrWIrpDROrmn5FY99K6TtH47JH/Hk+rENf/CJ53XyKKp
         QtTqczuG9sNGHJ12Lu2HJF5AGTjuCwgJp2vG9ePG2p6vyb4XASYiEzVc51OUHmV+Z3j8
         iXlSUAe9WkhkKIrBfmPZ+BNOnznJ8gitpvFeIQEaq6T+SVaXuoJX0/aWCgDp5yERw5Kf
         vq5yxZhjLwLtM0UiR8U9mRO/kXdrP+MYHoLy+J1/Y3KUfxEwr+Cz9Rezv+8NwBfapgtE
         uNZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701273743; x=1701878543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WTaTBsRhdueTfRMaCrpT3/cV5aM9tgJksyxMzM6Icdc=;
        b=ZeNSe/j2xgX0JDa5lMSbCyuJT598Z7ADLxcnKQabqw2aUxQfD4MRzxTCpGlmT/ZSg+
         lqtPPc8sPKVQULRm/nhDRVfuqqBNWYOc43SyDr720iLscHFTPqEkGw9Dy8ak4xeyM5xv
         xLONyaB0l/hLLqKBfaKZvyptvgDx5fBY0eMT7zFoqyBAMxrTv25xgwTTQ14ePqujeqYn
         LqcETGU+2+dSRjxRjum6DkkKdd0PoRiv3l9e3sqRgeXJj+ulXRoJSLLTtuS0oLU8t1w+
         bW6/nvWt21JkbvO+UST21cVxgBUP9svjM6KTcs8O0nMrwbc9F2hm0OQcEhdg90Nu+VaJ
         HquA==
X-Gm-Message-State: AOJu0YxwCrKd/P1MZmXVlP6pyzRT83SJixWKbnxzcUTcItul6cPpyfGl
	vAg6ZTEFk+OKV/y4nNjQVJC+5V3eVxPbirPG3nY=
X-Google-Smtp-Source: AGHT+IF9QtL4zuQaGJ3a7xTbvYV79vIJgsmc4V+mhskw82qGv4OI/vZ9VwTQehC4XNPC034pLH23sYovbKHijx1/b4A=
X-Received: by 2002:a05:6871:7515:b0:1fa:6f5:7b11 with SMTP id
 ny21-20020a056871751500b001fa06f57b11mr20192341oac.36.1701273743069; Wed, 29
 Nov 2023 08:02:23 -0800 (PST)
MIME-Version: 1.0
References: <522d304e-5148-4d3f-ad9b-caccc8a9fb31@gmail.com>
In-Reply-To: <522d304e-5148-4d3f-ad9b-caccc8a9fb31@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 29 Nov 2023 08:01:57 -0800
Message-ID: <CAMKF1sqVDapwZhf4kf8q8E3g1msefrLGc5=bRtyCcHYjouyRZw@mail.gmail.com>
Subject: Re: kirkstone merge request: Nove 29th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Nov 2023 16:02:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107140

merged thanks Armin

On Wed, Nov 29, 2023 at 4:32=E2=80=AFAM akuster808 <akuster808@gmail.com> w=
rote:
>
> The following changes since commit 7da6cb848bc42b3e6bd5d2b37b52ba75510a6c=
a0:
>
>    indent: fix CVE-2023-40305 (2023-11-03 10:52:59 -0400)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded kirkstone-next
>
> for you to fetch changes up to 8a75c61cce2aa1d6e5a3597ab8fc5a7e6aeae1e4:
>
>    nginx: upgrade to 1.24.0 release (2023-11-18 10:03:19 -0500)
>
> ----------------------------------------------------------------
> Archana Polampalli (1):
>        open-vm-tools: fix CVE-2023-34058
>
> Bartosz Golaszewski (1):
>        python3-cson: fix run-time dependencies
>
> Khem Raj (1):
>        emlog: Add PV
>
> Michael Haener (1):
>        nginx: upgrade to 1.24.0 release
>
> Mingli Yu (1):
>        nlohmann-json: Add ptest support
>
> Narpat Mali (2):
>        open-vm-tools: fix CVE-2023-20900
>        traceroute: upgrade 2.1.0 -> 2.1.3
>
> Peter Kjellerstedt (1):
>        libwebsockets: Support building for native
>
> Richard Purdie (4):
>        meta-perl: Drop broken BBCLASSEXTEND variants
>        meta-networking: Drop broken BBCLASSEXTEND variants
>        meta-oe: Drop broken BBCLASSEXTEND variants
>        meta-python: Drop broken BBCLASSEXTEND variants
>
> Yoann Congal (3):
>        emlog: ignore CVE-2022-3968 & CVE-2023-43291
>        python3-soupsieve: Break circular dependency with beautifulsoup4
>        packagegroup-meta-oe-extended: RDEPENDS on an existing mozjs-91
> package
>
>   .../recipes-connectivity/mosquitto/mosquitto_2.0.18.bb          | 2 +-
>   .../recipes-support/netsniff-ng/netsniff-ng_0.6.8.bb            | 2 +-
>   .../open-vm-tools/open-vm-tools/CVE-2023-20900.patch            | 36 ++=
+++
>   .../open-vm-tools/open-vm-tools/CVE-2023-34058.patch            | 241
> ++++++++++++++++++++++++++++
>   .../recipes-support/open-vm-tools/open-vm-tools_11.3.5.bb       | 2 +
>   .../traceroute/{traceroute_2.1.0.bb =3D> traceroute_2.1.3.bb} |   3 +-
>   .../recipes-core/packagegroups/packagegroup-meta-oe.bbappend    | 2 +-
>   .../recipes-connectivity/libwebsockets/libwebsockets_4.2.2.bb   | 3 +
>   meta-oe/recipes-connectivity/ser2net/ser2net_4.3.5.bb           | 2 -
>   meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb               | 2 -
>   meta-oe/recipes-core/emlog/emlog.inc                            | 2 +-
>   meta-oe/recipes-core/emlog/emlog_git.bb                         | 2 +
>   meta-oe/recipes-devtools/heaptrack/heaptrack_1.2.0.bb           | 2 +-
>   meta-oe/recipes-devtools/nlohmann-json/files/run-ptest          | 12 ++
>   meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.10.5.bb  | 20 ++=
-
>   meta-oe/recipes-devtools/unifex/unifex_git.bb                   | 2 -
>   meta-oe/recipes-graphics/openjpeg/openjpeg_2.4.0.bb             | 2 +-
>   meta-oe/recipes-graphics/xorg-app/xkbutils_1.0.4.bb             | 2 -
>   meta-oe/recipes-graphics/xorg-app/xsetroot_1.1.2.bb             | 1 -
>   .../recipes-perl/libconfig/libconfig-autoconf-perl_0.319.bb     | 2 +-
>   meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.074.bb     | 2 -
>   meta-perl/recipes-perl/libnet/libnet-dns-perl_1.33.bb           | 2 -
>   meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.68.bb          | 2 -
>   meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb    | 2 -
>   .../recipes-devtools/python/python3-aiohttp-jinja2_1.5.bb       | 2 -
>   meta-python/recipes-devtools/python/python3-autobahn_22.3.2.bb  | 2 -
>   meta-python/recipes-devtools/python/python3-pyudev_0.23.2.bb    | 2 +-
>   .../python/python3-robotframework-seriallibrary_0.3.1.bb        | 2 -
>   meta-python/recipes-devtools/python/python3-snappy_0.6.1.bb     | 2 -
>   meta-python/recipes-devtools/python/python3-soupsieve_2.3.1.bb  | 4 -
>   meta-python/recipes-devtools/python/python3-txaio_22.2.1.bb     | 2 -
>   meta-python/recipes-extended/python-cson/python3-cson_git.bb    | 3 +-
>   .../recipes-extended/pywbemtools/python3-pywbemtools_1.0.0.bb   | 2 -
>   meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb              | 6 +
>   34 files changed, 329 insertions(+), 48 deletions(-)
>   create mode 100644
> meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2023-2090=
0.patch
>   create mode 100644
> meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2023-3405=
8.patch
>   rename meta-networking/recipes-support/traceroute/{traceroute_2.1.0.bb
> =3D> traceroute_2.1.3.bb} (91%)
>   create mode 100755 meta-oe/recipes-devtools/nlohmann-json/files/run-pte=
st
>   create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
>

