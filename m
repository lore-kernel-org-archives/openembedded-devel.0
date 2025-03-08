Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0645BC282DE
	for <webhook@archiver.kernel.org>; Sat,  8 Mar 2025 01:14:59 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web11.1234.1741396498550325190
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Mar 2025 17:14:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fIo0nAcK;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3f68460865aso1090137b6e.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 07 Mar 2025 17:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741396498; x=1742001298; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fs4nAxgI+TSVQQ0wP51fYu4lWdIq5wbidMFxCp7deTw=;
        b=fIo0nAcKXGuNeOasFrBL4jB3Zdg5BPxzK4B2i1EK19iKiQ1CwHiq2SECo4weG6uf+B
         Dv/JKBWyRQlsN3dEpSfUXXfGAdGzZBTmyVdoruM+3D907IW/5B23zSUa5JPNvtdhzEAP
         ILjrermyEAgu1UdbGGOZA8hsn/DksIJgyO7QaUjYEiEzNJor42Z0nNDnR00ZxeMO8EuM
         /8mq91kVPROkur9SlvUdneL7zZKXlEhHdatg/59rilEiQxZf2dducqtNQ5sgJsfgIc/L
         VZIxRY8a+K/0uSxXr+fvp5DQ+GvkSVRL/UQ3S1EeckE6iP3AXUrTeGxlF8FKH5j4mxY8
         dRhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741396498; x=1742001298;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fs4nAxgI+TSVQQ0wP51fYu4lWdIq5wbidMFxCp7deTw=;
        b=gJ7FUFmKzuoOr305GY7KOVmc2Ex4q6QMPbUxSzGro80YM7MyiT8mgoibXDBMOnPbv+
         vpnOLrlyO8ixVDiB1cnDyZ3JWEMhzBJ6/74JuYyxdsuUE674wfqBcc67E/7B5cgJq03Y
         qqN6fHfXCmw4HcRrh7aM1DJXj0cFB3z/28D4O0eyqYdvZXm4ObnAppP6QgYf3w1YNTWJ
         mBlGHQPPyDiwJe9fJZJKxTw9iuXieYWBbiE7gRUd/LzQNClj/cc13E4sWmfRa5lGE569
         rI++2yLQeoKrNalRvR3YxsOQJprSHaO1RP0EERdv1H4c2dSD3jHxvin5YI3H3BjsCArW
         MK8g==
X-Gm-Message-State: AOJu0YzIftrYfJNFd3qPL+MRtTF5UwDYvIWUS9IXmP5cvoBNE+NYAiTC
	J+9GmM9/vU5lkU49S/CQCYUfydCLb/9TTRAxrx4t+j79z0S2+kMPUEEzlDyDuOxzpO83tZxHXNK
	lCEh6uadmEN4CwG844/Pcl92Fu6I=
X-Gm-Gg: ASbGncsUzb1zgYaBsie6zvPgiG4Zx74W7IeCj7xbNpu1/MAZGKqSYMSmXgqE4JH/nGD
	FFISafnOC2vqhY4gf89VtKlL/CklcQ2lE/k2mVY8mzCkJ2jCnMv4i64SWteewJeCNYOBZHs2Hnu
	q1HXnlNUXOnaWV4k7fY0aE8F0pTTsecuJLy5mY0XdI
X-Google-Smtp-Source: AGHT+IGxtzqbcMNiZCUyPaXpZFbsLhaSjypqfxhmMDv8m1gkqlvbvgLfqgDYSWa5Ygk017UGKTlBAJ9bGEYv1+vk/t4=
X-Received: by 2002:a05:6808:21a1:b0:3f4:8b3:8fe3 with SMTP id
 5614622812f47-3f697b0eec6mr3487472b6e.5.1741396497689; Fri, 07 Mar 2025
 17:14:57 -0800 (PST)
MIME-Version: 1.0
References: <25c3cee9-ab12-4db6-b5bd-96a435557f59@gmail.com>
In-Reply-To: <25c3cee9-ab12-4db6-b5bd-96a435557f59@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 7 Mar 2025 17:14:31 -0800
X-Gm-Features: AQ5f1JpWTosGX5IUfjkLUy7bqGa4mNWXT2RCiDoaHqSKN50Oi7t2R8N2ZD84GrU
Message-ID: <CAMKF1sraO-dPDSVoEWhAAft3SdXdEdDupOQT6=vGyz16L-yqXw@mail.gmail.com>
Subject: Re: kirkstone merge request: March 7th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 08 Mar 2025 01:14:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115802

merged now

thanks Armin.

On Fri, Mar 7, 2025 at 4:20=E2=80=AFPM akuster808 <akuster808@gmail.com> wr=
ote:
>
> The following changes since commit 880df90c865b57d38f1ff836fe8900c9443432=
2f:
>
>    phpmyadmin: fix CVE-2025-24529/CVE-2025-24530 (2025-02-09 07:58:44 -08=
00)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded kirkstone-next
>
> for you to fetch changes up to 7e18b3fc774b7efabf9a20ae3cd6abd0e0715b59:
>
>    lapack: upgrade 3.10.0 -> 3.10.1 (2025-03-07 19:18:02 -0500)
>
> ----------------------------------------------------------------
> Changqing Li (2):
>        abseil-cpp: fix CVE-2025-0838
>        nginx: fix CVE-2025-23419
>
> Haixiao Yan (1):
>        freediameter: fix do_fetch warning
>
> Jinfeng Wang (1):
>        net-snmp: fix memory leak
>
> Peter Marko (1):
>        python3-grpcio(-tools): fix build concurrency issue
>
> Vijay Anusuri (1):
>        postgresql: upgrade 14.14 -> 14.17
>
> Wang Mingyu (1):
>        python3-future: upgrade 0.18.2 -> 0.18.3
>
> Yogita Urade (2):
>        dlt-daemon: fix CVE-2022-39836 and CVE-2022-39837
>        dlt-daemon: fix CVE-2023-36321
>
> wangmy (1):
>        lapack: upgrade 3.10.0 -> 3.10.1
>
>   .../recipes-protocols/freediameter/freediameter_1.4.0.bb        | 8 +-
>   ...0001-unload_all_mibs-fix-memory-leak-by-freeing-tclist.patch | 40 ++=
+++
>   meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb    | 1 +
>   .../0001-configure.ac-bypass-autoconf-2.69-version-check.patch  | 2 +-
>   .../postgresql/{postgresql_14.14.bb =3D> postgresql_14.17.bb} |   4 +-
>   .../recipes-devtools/abseil-cpp/abseil-cpp/CVE-2025-0838.patch  | 114
> +++++++++++++
>   meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb           | 1 +
>   .../lapack/{lapack_3.10.0.bb =3D> lapack_3.10.1.bb} |   4 +-
>   .../dlt-daemon/dlt-daemon/CVE-2022-39836-CVE-2022-39837.patch   | 251
> ++++++++++++++++++++++++++++
>   .../recipes-extended/dlt-daemon/dlt-daemon/CVE-2023-36321.patch | 32 ++=
++
>   meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.8.bb        | 2 +
>   .../{python3-future_0.18.2.bb =3D> python3-future_0.18.3.bb} |   3 +-
>   .../recipes-devtools/python/python3-grpcio-tools_1.45.0.bb      | 4 +
>   meta-python/recipes-devtools/python/python3-grpcio_1.45.0.bb    | 4 +
>   meta-webserver/recipes-httpd/nginx/files/CVE-2025-23419.patch   | 87
> ++++++++++
>   meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb              | 2 +
>   16 files changed, 547 insertions(+), 12 deletions(-)
>   create mode 100644
> meta-networking/recipes-protocols/net-snmp/net-snmp/0001-unload_all_mibs-=
fix-memory-leak-by-freeing-tclist.patch
>   rename meta-oe/recipes-dbs/postgresql/{postgresql_14.14.bb =3D>
> postgresql_14.17.bb} (71%)
>   create mode 100644
> meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/CVE-2025-0838.patch
>   rename meta-oe/recipes-devtools/lapack/{lapack_3.10.0.bb =3D>
> lapack_3.10.1.bb} (86%)
>   create mode 100644
> meta-oe/recipes-extended/dlt-daemon/dlt-daemon/CVE-2022-39836-CVE-2022-39=
837.patch
>   create mode 100644
> meta-oe/recipes-extended/dlt-daemon/dlt-daemon/CVE-2023-36321.patch
>   rename meta-python/recipes-devtools/python/{python3-future_0.18.2.bb
> =3D> python3-future_0.18.3.bb} (70%)
>   create mode 100644
> meta-webserver/recipes-httpd/nginx/files/CVE-2025-23419.patch
>

