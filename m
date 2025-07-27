Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1D3BC87FCE
	for <webhook@archiver.kernel.org>; Sun, 27 Jul 2025 19:14:21 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web11.66011.1753643653696193467
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Jul 2025 12:14:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=a8/eBEue;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-7184015180fso38389337b3.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Jul 2025 12:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753643653; x=1754248453; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EUNM5zLmLSsSCni18e13EyO+1+cMap9QB2uv8eaOxwU=;
        b=a8/eBEueP0al0H3usUajMGHDGLtmzvDOg/DHLL8ujk6MFBRU/kyI3bB+zX5ZMLbQ61
         P7FUyMaeStUpXbKNYSiGlFLw+5PfV/NpqXQqsp3NshWdHPdOWFOJJlBpfK8PGhNAkDaf
         GsKuTF8xptJpZvgCoDiQjzL+7np5U0UDZKqzzUt0gZoVdEcGBSlPfiH3gct7ILoaiFRH
         23mQo7XXsolPIZTDzjr1Mq2xKPtAqACGOo1tXgQ+6/0c9i0fFrZi7bZmy0sQOu8uvJWP
         G+ehW30u0+5o2wwtsKJ4drvgVEh8hhH1IefnvcUZTVQN+v5gP6/LpfsPQFriqe3N52PO
         Gx7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753643653; x=1754248453;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EUNM5zLmLSsSCni18e13EyO+1+cMap9QB2uv8eaOxwU=;
        b=M9EtDNFdKILdtlRIUhqCrpAFgdHkQ7/rI8xvyBXKQgsBOsR5BWTiGiii//2TwAitDP
         7HVaJ5T4siOR26vie9DsGmvibFti6R8Ylt4ZWuoSJp9SqbZ6Yd1Ngk03icsC730IqxCL
         g1NRXHHGI7hETCiZjbVR7CGvMXzSEIbHaIh56b+owVertwjAKQ9+mfr1uwJd3BOPjHx4
         950X8jumsgHyM/HgPycaMgA2WdTxOWTKMFF5pa2GHBdlAEOy/P7ADz5Lw0zalz69nE9k
         TnjNx7v6jJL0wZcH2Ex/b3IlE5LOitjHW/PG1ngGpMHEjxArdZg9Czuyi5o87fvYaJNn
         TXMg==
X-Gm-Message-State: AOJu0YxWz1+2iJJcSQVV6TW0RUCOKbheZGmvoxDLpaNnPov//W9vntas
	mfbDVbDWHu63dur0BZdT9BcmXqr63+AS3e0V6PPPv2sGrtj3Zb9VZNmJRjiHEHG+yvTZO/IpRHv
	7SlnxBbvfawXFWB39dWYlt0ENCzl80fX/6Uy1Dsw=
X-Gm-Gg: ASbGncs7U6jmFq3HAj/yWGsfz28Xr6PY4rfGUj0YSZBUwRovMiEfBeQrOJRhYu57ncp
	V85Z9q5WrzJJ2+BOAfTX+RQpDfaN03ZKa8d/GvK58o8HzSXbqFwQ9h/JJU4whxFsdAY0WgEFMTd
	hIg9ni83m88x3MZIVokyUHSgXpEGdIKPbNNDtYM4Q0IXzO5VlpFbpNtWkVO10ozC2PaWn9GWjRg
	rRw7xOktnBmWm5fObMbLJkRWPc1HFgEIil6EFm6
X-Google-Smtp-Source: AGHT+IH8O/QRJO0nf4wziTLB+k+p2GVKwXTTX1PvdhKf+jDoIHB/VM/tE6nKbvTcc6m/tV8T+9g1l8jSuTDhvCBS/7k=
X-Received: by 2002:a05:690c:640e:b0:718:4511:e14e with SMTP id
 00721157ae682-719e32c00f0mr110331107b3.12.1753643652590; Sun, 27 Jul 2025
 12:14:12 -0700 (PDT)
MIME-Version: 1.0
References: <4341066e-e2d3-4636-b0e2-76cb44047e18@gmail.com>
In-Reply-To: <4341066e-e2d3-4636-b0e2-76cb44047e18@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 27 Jul 2025 12:13:45 -0700
X-Gm-Features: Ac12FXw5zWVGABy2-5fi02PqswCWgvmqFuGjXSUDODuolLkn65Gsi7XgGvIcJPQ
Message-ID: <CAMKF1spo-_UAz7pouuRYORc1mwkwvNW1LoJEg3z4Dr0EYBUmfw@mail.gmail.com>
Subject: Re: walnscar merge request: July 27th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Jul 2025 19:14:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118744

merged now, thanks.

On Sun, Jul 27, 2025 at 11:40=E2=80=AFAM akuster808 <akuster808@gmail.com> =
wrote:
>
> The following changes since commit c009244a045923a9dfc32d7f2996cb61629870=
f6:
>
>    udisks2: Hardening measure of CVE-2025-6019 (2025-07-06 19:23:22 -0400=
)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded walnascar-next
>
> for you to fetch changes up to dca497d728792e3cb655c78455c2d649af312ce8:
>
>    ][PATCH] ufs-utils: fix crash for ufs-utils list_bsg (2025-07-27
> 14:35:10 -0400)
>
> ----------------------------------------------------------------
> Jiaying Song (1):
>        python3-aiohttp: fix CVE-2025-53643
>
> Martin Jansa (1):
>        xmlsec1: fix build with gnutls or openssl PACKAGECONFIG not enable=
d
>
> Peter Marko (4):
>        libcoap: patch CVE-2024-31031
>        spdlog: patch CVE-2025-6140
>        minifi-cpp: patch spdlog CVE-2025-6140
>        poco: patch CVE-2025-6375
>
> Praveen Kumar (2):
>        syslog-ng: upgrade 4.8.1 -> 4.8.2
>        python3-tornado: upgrade 6.4.2 -> 6.5
>
> Wang Mingyu (1):
>        mbedtls: upgrade 3.6.3 -> 3.6.3.1
>
> Yi Zhao (1):
>        ][PATCH] ufs-utils: fix crash for ufs-utils list_bsg
>
> Yogita Urade (2):
>        poppler: upgrade 25.04.0 -> 25.06.0
>        mariadb: upgrade 11.4.5 -> 11.4.6
>
> gudni (1):
>        mbedtls: upgrade 3.6.3.1 -> 3.6.4
>
>   ...1-ufs_cmds-fix-full_path-buffer-size-in-find_bsg_devic.patch | 39 ++=
+
>   meta-filesystems/recipes-utils/ufs-utils/ufs-utils_4.13.5.bb    | 1 +
>   .../mbedtls/{mbedtls_3.6.3.bb =3D> mbedtls_3.6.4.bb} |   7 +-
>   .../recipes-devtools/libcoap/libcoap/CVE-2024-31031.patch       | 82 ++=
+++
>   meta-networking/recipes-devtools/libcoap/libcoap_4.3.4.bb       | 1 +
>   .../{mariadb-native_11.4.5.bb =3D> mariadb-native_11.4.6.bb} |   0
>   meta-oe/recipes-dbs/mysql/mariadb.inc                           | 4 +-
>   .../mariadb/0001-Add-missing-includes-cstdint-and-cstdio.patch  | 40 +-=
-
>   meta-oe/recipes-dbs/mysql/mariadb/3871.patch                    | 29 --
>   meta-oe/recipes-dbs/mysql/mariadb/mm_malloc.patch               | 23 --
>   .../recipes-dbs/mysql/{mariadb_11.4.5.bb =3D> mariadb_11.4.6.bb} |   0
>   meta-oe/recipes-extended/minifi-cpp/files/CVE-2025-6140.patch   | 46 ++=
+
>   meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.1.bb        | 1 +
>   meta-oe/recipes-support/poco/poco/CVE-2025-6375.patch           | 34 ++
>   meta-oe/recipes-support/poco/poco_1.13.3.bb                     | 1 +
>   .../poppler/{poppler_25.04.0.bb =3D> poppler_25.06.0.bb} |   2 +-
>   meta-oe/recipes-support/spdlog/spdlog/CVE-2025-6140.patch       | 46 ++=
+
>   meta-oe/recipes-support/spdlog/spdlog_1.15.0.bb                 | 4 +-
>   .../syslog-ng/{syslog-ng_4.8.1.bb =3D> syslog-ng_4.8.2.bb} |   2 +-
>   meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.7.bb                | 2 +-
>   .../python/python3-aiohttp/CVE-2025-53643.patch                 | 526
> ++++++++++++++++++++++++++++
>   meta-python/recipes-devtools/python/python3-aiohttp_3.11.16.bb  | 2 +
>   .../python/{python3-tornado_6.4.2.bb =3D> python3-tornado_6.5.bb} |   2=
 +-
>   23 files changed, 806 insertions(+), 88 deletions(-)
>   create mode 100644
> meta-filesystems/recipes-utils/ufs-utils/files/0001-ufs_cmds-fix-full_pat=
h-buffer-size-in-find_bsg_devic.patch
>   rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_3.6.3.bb
> =3D> mbedtls_3.6.4.bb} (94%)
>   create mode 100644
> meta-networking/recipes-devtools/libcoap/libcoap/CVE-2024-31031.patch
>   rename meta-oe/recipes-dbs/mysql/{mariadb-native_11.4.5.bb =3D>
> mariadb-native_11.4.6.bb} (100%)
>   delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/3871.patch
>   delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/mm_malloc.patch
>   rename meta-oe/recipes-dbs/mysql/{mariadb_11.4.5.bb =3D>
> mariadb_11.4.6.bb} (100%)
>   create mode 100644
> meta-oe/recipes-extended/minifi-cpp/files/CVE-2025-6140.patch
>   create mode 100644 meta-oe/recipes-support/poco/poco/CVE-2025-6375.patc=
h
>   rename meta-oe/recipes-support/poppler/{poppler_25.04.0.bb =3D>
> poppler_25.06.0.bb} (96%)
>   create mode 100644
> meta-oe/recipes-support/spdlog/spdlog/CVE-2025-6140.patch
>   rename meta-oe/recipes-support/syslog-ng/{syslog-ng_4.8.1.bb =3D>
> syslog-ng_4.8.2.bb} (98%)
>   create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-53643.patch
>   rename meta-python/recipes-devtools/python/{python3-tornado_6.4.2.bb
> =3D> python3-tornado_6.5.bb} (93%)
>

