Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F14DFC4345F
	for <webhook@archiver.kernel.org>; Sun, 28 Apr 2024 17:56:32 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web10.2062.1714326982681651076
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Apr 2024 10:56:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LuHX2vb9;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-22f01274622so2197092fac.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Apr 2024 10:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714326982; x=1714931782; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/G/zGGcLKN/ctzdO/5bw/3EQ6UhE/lNZ0DFrmeROfCg=;
        b=LuHX2vb9K4dDqsS9msziC+7Nx8Fhh2dkyq6WiihegdnlpKckZnDEactYFVIFqvR/lp
         GwM5m7iz+rc0zAVZDYBRLS8g37jjzwVr+hoHvSXxfJz9AOCPVuChvYa2i5q1uwA3xlzO
         HSlEYvnMTn01wVWrecM67tr/aboplw4DwDBgvom6MKtfhamLe+qiv3xoNYiUvkrETc7Q
         0SK55deTRxQot720/5wb3o0gHENOU2KvM6jXp4BkfBbKmfvA5Cu2+j68rzn/4Per9UvC
         O+azfoxpGIY/BZyq/K/z+2M20Wdgh87/cXuRXZo/j3zuXlHWuCMBfHJI8iSr7t08f6/Q
         2yyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714326982; x=1714931782;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/G/zGGcLKN/ctzdO/5bw/3EQ6UhE/lNZ0DFrmeROfCg=;
        b=kS391liqxwXlyWVLcqPz4U3ivoj5Ff+G2503ex4FkICZABVz4ZcrwHyzPd2D9j/K/N
         UcbhthzJvYEAORnsaVNz0fxoeqlUNTjqbXgUCdhBcO7ROf0YrGgnxXA628MB93d12Otu
         wevPXT2muoXsP3qveuJbRUZdGjSaPtS3J+rn4vNvtXCyCPEA54nwpaqr6Wmg4bGXm50H
         /BSAxGNluJOWYMxfcGIWTUyUBFbULpBZNONRj4a7G//L2OsI5a3U+neMnFFLzX3aJM8T
         1+QamE3zpZxkljWy6C/9ho2V/7NqRPWVtiVs9wb6OryFp40P6UnR8/lF9eMJaVzv4iGX
         Trrg==
X-Gm-Message-State: AOJu0YxxgbhAvTe16mH9M2iU6w+nj+57s19Xix5poaoinsQJCDVTQNn2
	P5zdbkLa1ORP4WnMONAc87W+ZUw6IQYouyOMxe91GwWs/EWdLhEv41ViBJdw8E+VqGNB9FOHsEq
	XNV2viQ0xdsoHnewRfy0wpasold1CLAIf
X-Google-Smtp-Source: AGHT+IGIOVZI7APnhczElorhqkvIjVc/RgeBeKMkOrZGyKqVdvmwMHS8P//2p2Cfg4UWXf3NaTyZyLGM+gpZaI47Ea4=
X-Received: by 2002:a05:6870:17a4:b0:22e:d38d:7444 with SMTP id
 r36-20020a05687017a400b0022ed38d7444mr6423750oae.57.1714326981789; Sun, 28
 Apr 2024 10:56:21 -0700 (PDT)
MIME-Version: 1.0
References: <8848eecd-9588-40ab-8806-0cafc2cf7554@gmail.com>
In-Reply-To: <8848eecd-9588-40ab-8806-0cafc2cf7554@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 28 Apr 2024 10:55:55 -0700
Message-ID: <CAMKF1soXKMLa7v69CV1v01Ju6T1Y6pU9k=AipxNPbLV2_6cmHA@mail.gmail.com>
Subject: Re: kirkstone merge request: April 28th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Apr 2024 17:56:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110163

merged thanks Armin.

On Sun, Apr 28, 2024 at 10:14=E2=80=AFAM akuster808 <akuster808@gmail.com> =
wrote:
>
> The following changes since commit 8bb16533532b6abc2eded7d9961ab2a108fd7a=
5b:
>
>    dnsmasq: Upgrade 2.87 -> 2.90 (2024-03-25 07:11:05 -0400)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded kirkstone-next
>
> for you to fetch changes up to 5a6f7925bd2b885955c942573f70a5594f231563:
>
>    python3-twisted: Add python3-typing-extensions to RDEPENDS
> (2024-04-28 13:10:23 -0400)
>
> ----------------------------------------------------------------
> Ashish Sharma (1):
>        wireshark: Backport fix for CVE-2024-2955
>
> Derek Straka (1):
>        python3-pyyaml-include: add initial recipe for version 1.3.2
>
> Hains van den Bosch (2):
>        python3-twisted: Add python3-asyncio to RDEPENDS
>        python3-twisted: Add python3-typing-extensions to RDEPENDS
>
> Hitendra Prajapati (1):
>        wireshark: fix CVE-2023-6175
>
> Mingli Yu (1):
>        python3-pyyaml-include: Upgrade 1.3.2 -> 1.4.1
>
> Rahul Janani Pandi (3):
>        python3-pillow: Fix CVE-2023-50447
>        python3-django: fix CVE-2024-24680
>        python3-aiohttp: Fix CVE-2024-23334
>
> Rohini Sangam (1):
>        xterm: Security fix for CVE-2023-40359
>
> Soumya Sambu (2):
>        iniparser: Fix CVE-2023-33461
>        apache2: Upgrade v2.4.58 -> v2.4.59
>
> Tim Orling (1):
>        python3-pyyaml-include: switch to pytest --automake
>
> Xiangyu Chen (1):
>        bats: fix bats-format-pretty report error when multilib enabled
>
> nikhil (1):
>        giflib: Fix CVE CVE-2022-28506
>
>   .../recipes-support/wireshark/files/CVE-2023-6175.patch         | 246
> ++++++++++++++++++
>   .../recipes-support/wireshark/files/CVE-2024-2955.patch         | 52 ++=
++
>   meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb   | 2 +
>   meta-oe/recipes-devtools/giflib/files/CVE-2022-28506.patch      | 40 ++=
+
>   meta-oe/recipes-devtools/giflib/giflib_5.2.1.bb                 | 4 +-
>   meta-oe/recipes-graphics/xorg-app/xterm/CVE-2023-40359.patch    | 388
> ++++++++++++++++++++++++++++
>   meta-oe/recipes-graphics/xorg-app/xterm_372.bb                  | 1 +
>   .../recipes-support/iniparser/iniparser/CVE-2023-33461.patch    | 51 ++=
++
>   meta-oe/recipes-support/iniparser/iniparser_4.1.bb              | 4 +-
>   meta-oe/recipes-test/bats/bats_1.6.1.bb                         | 1 +
>   .../python/python3-aiohttp/CVE-2024-23334.patch                 | 222
> ++++++++++++++++
>   meta-python/recipes-devtools/python/python3-aiohttp_3.8.6.bb    | 3 +
>   .../recipes-devtools/python/python3-django/CVE-2024-24680.patch | 48 ++=
++
>   meta-python/recipes-devtools/python/python3-django_2.2.28.bb    | 1 +
>   .../python/python3-pillow/CVE-2023-50447-1.patch                | 29 ++=
+
>   .../python/python3-pillow/CVE-2023-50447-2.patch                | 31 ++=
+
>   .../python/python3-pillow/CVE-2023-50447-3.patch                | 56 ++=
++
>   .../python/python3-pillow/CVE-2023-50447-4.patch                | 66 ++=
+++
>   meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb     | 4 +
>   .../recipes-devtools/python/python3-pyyaml-include/run-ptest    | 3 +
>   .../recipes-devtools/python/python3-pyyaml-include_1.4.1.bb     | 29 ++=
+
>   meta-python/recipes-devtools/python/python3-twisted_22.2.0.bb   | 2 +
>   .../0004-apache2-log-the-SELinux-context-at-startup.patch       | 16 +-
>   .../apache2/0007-apache2-allow-to-disable-selinux-support.patch | 10 +-
>   .../apache2/{apache2_2.4.58.bb =3D> apache2_2.4.59.bb} |   2 +-
>   25 files changed, 1295 insertions(+), 16 deletions(-)
>   create mode 100644
> meta-networking/recipes-support/wireshark/files/CVE-2023-6175.patch
>   create mode 100644
> meta-networking/recipes-support/wireshark/files/CVE-2024-2955.patch
>   create mode 100644
> meta-oe/recipes-devtools/giflib/files/CVE-2022-28506.patch
>   create mode 100644
> meta-oe/recipes-graphics/xorg-app/xterm/CVE-2023-40359.patch
>   create mode 100644
> meta-oe/recipes-support/iniparser/iniparser/CVE-2023-33461.patch
>   create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2024-23334.patch
>   create mode 100644
> meta-python/recipes-devtools/python/python3-django/CVE-2024-24680.patch
>   create mode 100644
> meta-python/recipes-devtools/python/python3-pillow/CVE-2023-50447-1.patch
>   create mode 100644
> meta-python/recipes-devtools/python/python3-pillow/CVE-2023-50447-2.patch
>   create mode 100644
> meta-python/recipes-devtools/python/python3-pillow/CVE-2023-50447-3.patch
>   create mode 100644
> meta-python/recipes-devtools/python/python3-pillow/CVE-2023-50447-4.patch
>   create mode 100755
> meta-python/recipes-devtools/python/python3-pyyaml-include/run-ptest
>   create mode 100644
> meta-python/recipes-devtools/python/python3-pyyaml-include_1.4.1.bb
>   rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.58.bb =3D>
> apache2_2.4.59.bb} (99%)
>

