Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D1BFC001E0
	for <webhook@archiver.kernel.org>; Sat, 21 Oct 2023 20:49:19 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web10.87423.1697921350662016243
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Oct 2023 13:49:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gyf5XD+t;
 spf=pass (domain: gmail.com, ip: 209.85.210.54, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-6ce2c5b2154so1400749a34.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Oct 2023 13:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697921350; x=1698526150; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6zKtbxPPSSUg8su1R4L2Ljd1JYhP4uPjL8DI0uQ3+iA=;
        b=gyf5XD+t0wn9PHeCK8Ja3KZrp8HaDd9l3u9XgKXVEBG1d7D313g9AgGgVkM4yGRkyG
         9Agyuo73wskoj9G3zI0/RNaMRZj1rm4VGDHu0DHxafplArlCC4QcGtH5XZfU+CR/dlrS
         IF9ZEWTw2+8qCVGfjP5rOQOCySUZmuj6c3T1iqjUeGw6E111sCDqvkK8bVC+pXQG6jKR
         j8wi7oPxO8Y/ZmNrnfBQ3sOSLFUl7gZtbzn2smtLuHBfmCMhJnwhE/SjTLMtnBsjEjfP
         Xd7syL0wjCqR5nLsJGUD2+i9JTN/ynFi2nU0JutW/twM7LLwAtW8tr5I9GOJEUrMBj8T
         AT5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697921350; x=1698526150;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6zKtbxPPSSUg8su1R4L2Ljd1JYhP4uPjL8DI0uQ3+iA=;
        b=O14f5nsZE4V7LXVylTFtsrB0TOOOyhqy/QTQxy1mmqqpI0/UxJokAgCJVkH57qQ+a4
         MW/HKrY63FVnpBv/SkQLPHeBVWI5NBtZU9B10GYO9L7e33BKeM0Hj1fxeFiUkRKZk7ze
         Gm7WvR/m/lq/JN+lyd6cJ1cv6uvTL7+DYun6Gvk2kzVjOIexAvfB+ZcWfWophfQb0+qo
         iyC55zw5euaaMRkLuTmZrO+TOKwjcFxVKsaHZDRTd02kw7/fl5RUrCItuBCVKbDUmgi8
         xW39YmROg4thd6E8vb+E+b8hPN0XwfWZp60ruLiPdqGaI2kXXxPfaIimXIiLjmgPng5d
         bwQQ==
X-Gm-Message-State: AOJu0YzVYTPIx34jBGrjaY1d7+13WrT5oOYJRMG5C3Q5gJ6QIMKhlOCP
	nlGAXf4CMdFNqsrWCWrmpq8KbEeYcrJbL34wL30=
X-Google-Smtp-Source: AGHT+IGSWzQKaKUbiaaoG3eZhBqpYxLR7kvnp6Z4q3LMuWMoHvupKSozHxnEyHyZZbZ+nMP/viZ5eyPUrBeQ4QDZQf8=
X-Received: by 2002:a05:6870:3d96:b0:1e9:bd5c:ae8b with SMTP id
 lm22-20020a0568703d9600b001e9bd5cae8bmr6542558oab.5.1697921349696; Sat, 21
 Oct 2023 13:49:09 -0700 (PDT)
MIME-Version: 1.0
References: <0a760190-585a-4a5b-a8bb-031f6bc2fbe2@gmail.com>
In-Reply-To: <0a760190-585a-4a5b-a8bb-031f6bc2fbe2@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 21 Oct 2023 13:48:43 -0700
Message-ID: <CAMKF1srus-yUyYWogVia1z9wJ=u_8X+Q20XtzQw+LTkFbSYbNQ@mail.gmail.com>
Subject: Re: kirkstone merge request: Oct 21
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Oct 2023 20:49:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105627

merged thanks Armin.

On Sat, Oct 21, 2023 at 1:29=E2=80=AFPM akuster808 <akuster808@gmail.com> w=
rote:
>
> The following changes since commit 9c5541f7e18a1fac3b8dea71e1ebb8398d58e6=
ff:
>
>    python3-django: upgrade 4.2.3 -> 4.2.5 (2023-09-27 10:23:28 -0400)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded kirkstone-next
>
> for you to fetch changes up to 79a6f60dabad9e5b0e041efa91379447ef030482:
>
>    mbedtls: upgrade 2.28.2 -> 2.28.5 (2023-10-17 09:07:38 -0400)
>
> ----------------------------------------------------------------
> Denys Dmytriyenko (1):
>        mbedtls: set up /usr/bin/hello as alternative
>
> Gianfranco Costamagna (3):
>        mosquitto: do not automatically depend on dlt-daemon, it's a
> non-mandatory logging system
>        mosquitto: upgrade 2.0.15 -> 2.0.17
>        mosquitto: upgrade 2.0.17 -> 2.0.18
>
> Joe Slater (1):
>        nginx: add configure option
>
> Martin Jansa (1):
>        mosquitto: add missing Upstream-Status
>
> Meenali Gupta (1):
>        open-vm-tools: fix CVE-2023-20867
>
> Narpat Mali (1):
>        python3-gevent: fix CVE-2023-41419
>
> Polampalli, Archana (4):
>        samba: fix CVE-2023-34966
>        samba: fix CVE-2022-2127
>        samba:fix CVE-2023-34967
>        samba: fix CVE-2023-34968
>
> Wang Mingyu (1):
>        mosquitto: upgrade 2.0.14 -> 2.0.15
>
> Yi Zhao (1):
>        mbedtls: upgrade 2.28.2 -> 2.28.5
>
>   .../mbedtls/{mbedtls_2.28.2.bb =3D> mbedtls_2.28.5.bb} |   7 +-
>   meta-networking/recipes-connectivity/mosquitto/files/2894.patch | 25 ++
>   meta-networking/recipes-connectivity/mosquitto/files/2895.patch | 27 ++
>   .../recipes-connectivity/mosquitto/files/mosquitto.init         | 20 +-
>   .../mosquitto/{mosquitto_2.0.14.bb =3D> mosquitto_2.0.18.bb} |   6 +-
>   .../recipes-connectivity/samba/samba/CVE-2022-2127.patch        | 44 ++
>   .../recipes-connectivity/samba/samba/CVE-2023-34966_0001.patch  | 78 ++=
++
>   .../recipes-connectivity/samba/samba/CVE-2023-34966_0002.patch  | 140
> ++++++
>   .../recipes-connectivity/samba/samba/CVE-2023-34967_0001.patch  | 178
> ++++++++
>   .../recipes-connectivity/samba/samba/CVE-2023-34967_0002.patch  | 125
> ++++++
>   .../recipes-connectivity/samba/samba/CVE-2023-34968_0001.patch  | 104
> +++++
>   .../recipes-connectivity/samba/samba/CVE-2023-34968_0002.patch  | 39 ++
>   .../recipes-connectivity/samba/samba/CVE-2023-34968_0003.patch  | 65 ++=
+
>   .../recipes-connectivity/samba/samba/CVE-2023-34968_0004.patch  | 85 ++=
++
>   .../recipes-connectivity/samba/samba/CVE-2023-34968_0005.patch  | 83 ++=
++
>   .../recipes-connectivity/samba/samba/CVE-2023-34968_0006.patch  | 57 ++=
+
>   .../recipes-connectivity/samba/samba/CVE-2023-34968_0007.patch  | 49 ++
>   .../recipes-connectivity/samba/samba/CVE-2023-34968_0008.patch  | 62 ++=
+
>   .../recipes-connectivity/samba/samba/CVE-2023-34968_0009.patch  | 465
> +++++++++++++++++++
>   .../recipes-connectivity/samba/samba/CVE-2023-34968_0010.patch  | 484
> ++++++++++++++++++++
>   .../recipes-connectivity/samba/samba/CVE-2023-34968_0011.patch  | 295
> ++++++++++++
>   meta-networking/recipes-connectivity/samba/samba_4.14.14.bb     | 16 +
>   .../open-vm-tools/open-vm-tools/CVE-2023-20867.patch            | 158
> +++++++
>   .../recipes-support/open-vm-tools/open-vm-tools_11.3.5.bb       | 1 +
>   .../recipes-devtools/python/python3-gevent/CVE-2023-41419.patch | 673
> ++++++++++++++++++++++++++++
>   meta-python/recipes-devtools/python/python3-gevent_21.12.0.bb   | 2 +
>   .../recipes-httpd/nginx/files/0001-configure-libxslt-conf.patch | 39 ++
>   meta-webserver/recipes-httpd/nginx/nginx.inc                    | 3 +
>   28 files changed, 3316 insertions(+), 14 deletions(-)
>   rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_2.28.2.bb
> =3D> mbedtls_2.28.5.bb} (91%)
>   create mode 100644
> meta-networking/recipes-connectivity/mosquitto/files/2894.patch
>   create mode 100644
> meta-networking/recipes-connectivity/mosquitto/files/2895.patch
>   rename
> meta-networking/recipes-connectivity/mosquitto/{mosquitto_2.0.14.bb =3D>
> mosquitto_2.0.18.bb} (94%)
>   create mode 100644
> meta-networking/recipes-connectivity/samba/samba/CVE-2022-2127.patch
>   create mode 100644
> meta-networking/recipes-connectivity/samba/samba/CVE-2023-34966_0001.patc=
h
>   create mode 100644
> meta-networking/recipes-connectivity/samba/samba/CVE-2023-34966_0002.patc=
h
>   create mode 100644
> meta-networking/recipes-connectivity/samba/samba/CVE-2023-34967_0001.patc=
h
>   create mode 100644
> meta-networking/recipes-connectivity/samba/samba/CVE-2023-34967_0002.patc=
h
>   create mode 100644
> meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0001.patc=
h
>   create mode 100644
> meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0002.patc=
h
>   create mode 100644
> meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0003.patc=
h
>   create mode 100644
> meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0004.patc=
h
>   create mode 100644
> meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0005.patc=
h
>   create mode 100644
> meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0006.patc=
h
>   create mode 100644
> meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0007.patc=
h
>   create mode 100644
> meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0008.patc=
h
>   create mode 100644
> meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0009.patc=
h
>   create mode 100644
> meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0010.patc=
h
>   create mode 100644
> meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0011.patc=
h
>   create mode 100644
> meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2023-2086=
7.patch
>   create mode 100644
> meta-python/recipes-devtools/python/python3-gevent/CVE-2023-41419.patch
>   create mode 100644
> meta-webserver/recipes-httpd/nginx/files/0001-configure-libxslt-conf.patc=
h
>

