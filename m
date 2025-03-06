Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60CDDC19F32
	for <webhook@archiver.kernel.org>; Thu,  6 Mar 2025 00:54:39 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web10.1460.1741222471696352404
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Mar 2025 16:54:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KpKHy0ic;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-2a9ef75a20dso211907fac.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Mar 2025 16:54:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741222471; x=1741827271; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nhp2O2Glk7LFnqoGPop5T36vea7qbkX1N1tBYvedIPs=;
        b=KpKHy0ic/DRb8r1eRVmiW07uxjpdylmAN8y/DqKzkC6iTtXljRDbzk7/mViJqVJ0gM
         6e8Tsji4QoG4may0TSQzmL762IwibNWQ5t6BzAKdC7aX5ZC55mSckqNGrS63Mvxa6hqJ
         qdea6jOZ7V27mHtZyAjDdQAgEv1BpiXTA4yzyoxloRvFzTy4o4fJwYGrnW3vaA+hAasw
         j+qmYhHIXeqfcLUHRObd/1OuB+IAnfQyd3Ybv4tWU8Cec7JzjLV0qT61uiepReFX0Ffs
         +Qby303Y5L7t2nGACb4EnS3EdxS5ObdDA0WNu+J4aIRUCpyyylFIxqILKZ55NjBGUzk9
         c6Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741222471; x=1741827271;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nhp2O2Glk7LFnqoGPop5T36vea7qbkX1N1tBYvedIPs=;
        b=ojV37bOTMvL7s2xv5WIdW8DgrR/LrMDfQ7X2V5ZkWDRxF3S4SUUzXEKsSdTwApqmeT
         oBk644tWGWDXmBzCON8vsa9mAZVCmf4w9MHTV8zU04oUwYI2g/s/79pJu31+Qgmi2sWH
         YbqvYSGdDEnI5IZDrC/0eUSXRiwCxu+UsgvwGuJMFWz6dvK8ino6tiPGXL3X86GLgyfg
         6AUFqzvdDhq8AKnREf3B5AtuDRVYU4Ur1VQ6D0RPW9N/UHcwLwBJovtCqqLhHCqpMK6O
         pNBsNNDiYTHs/hPwBE8LRXHlu/FjhjYbUqbgj7UUpsPm/bAgbebw/duvwAf7CXRGTLUl
         59UQ==
X-Gm-Message-State: AOJu0YzbSsr1TivDALPtUgoxUOn6RVqEGW1ZY4NgITExI3tRieZvCUJY
	8BwsIXXvyo5tjdyeEzD+c1qORv8jv/rWE8DlFhX/KoCgyhTq5ZrK5dKLubGwjNpIEJygZQDJACV
	7eUuOWhWmGAC5ceTg9HjCMPRn2L5h61jt
X-Gm-Gg: ASbGncsMG4HIzLg1uXiS3gilmpDhJPIWpKb4ZOhNaY4YvTUakvIJ5IGz0t+r4jRsn8I
	34Ggq3bpqRl7ckSvIW39vfKl4kL2ExqNwhOhymkW4ScvQ9Cn2AI6lSyujZpMYoCU/NO0npxWFoP
	/te40bPPEF1W21SKRmKlu45PW0
X-Google-Smtp-Source: AGHT+IGbcjiDvnZSajqp98iELzU093VQuMx7q8Z9/8K1g15CRB9QH0N8ytKuyjXaH4k09DpsZKkqc3yHd3qW/m0mWDk=
X-Received: by 2002:a05:6870:f14e:b0:2c1:ade0:26a0 with SMTP id
 586e51a60fabf-2c21c955437mr3014447fac.10.1741222470982; Wed, 05 Mar 2025
 16:54:30 -0800 (PST)
MIME-Version: 1.0
References: <6096f37f-7ec2-4816-baf0-97973927b279@gmail.com>
In-Reply-To: <6096f37f-7ec2-4816-baf0-97973927b279@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 5 Mar 2025 19:54:05 -0500
X-Gm-Features: AQ5f1Jp8yLjj6KxkXSZF718eOhB8YJwc0NdHNprD1S-nPh20c_E6bINjYsQHUUM
Message-ID: <CAMKF1spNmCg0YZFimGwWYLT7sSwNhcwtgSPgnmJekV_DC9SVCw@mail.gmail.com>
Subject: Re: scarthgap merge request: March 5th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Mar 2025 00:54:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115763

installed now, thanks Armin.

On Wed, Mar 5, 2025 at 10:52=E2=80=AFAM akuster808 <akuster808@gmail.com> w=
rote:
>
> The following changes since commit 4f11a12b2352bbdfafb6b7d956bf424af49929=
77:
>
>    modejs: upgrade 20.18.0 -> 20.18.2 (2025-02-04 15:04:57 -0800)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded scarthgap-next
>
> for you to fetch changes up to 6c9f1f8d4538119803bf793747b65e4d23c33544:
>
>    nginx: fix CVE-2025-23419 (2025-03-03 08:09:03 -0500)
>
> ----------------------------------------------------------------
> Alexandre Truong (1):
>        source-han-sans-*-fonts: Switch away from SVN fetcher in SRC_URI
>
> Changqing Li (3):
>        dlt-daemon: make DLT_WatchdogSec configurable
>        abseil-cpp: upgrade 20240116.2 -> 20240116.3
>        nginx: fix CVE-2025-23419
>
> Chris Laplante (1):
>        poco: fix branch: master =3D> poco-1.12.5
>
> Etienne Cordonnier (1):
>        uutils-coreutils: fix compilation with selinux
>
> Leon Anavi (1):
>        sip: Fix homepage and license
>
> Peter Kjellerstedt (2):
>        ebtables: Remove the dependecy on bash
>        libeigen: Remove LGPL code
>
> Peter Marko (1):
>        python3-grpcio(-tools): fix build concurrency issue
>
> Soumya Sambu (2):
>        python3-django: upgrade 5.0.10 -> 5.0.11
>        python3-django: upgrade 4.2.17 -> 4.2.18
>
> Trevor Woerner (1):
>        iperf3: throughput fix
>
> Vijay Anusuri (1):
>        openjpeg: upgrade 2.5.0 -> 2.5.3
>
>   .../ebtables/ebtables-2.0.11/ebtables-legacy-save               | 19 +-
>   meta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb |    2 -
>   .../iperf3/iperf3/do-not-listen-to-old-udp-prot-listener.patch  | 30 +
>   meta-oe/recipes-benchmark/iperf3/iperf3_3.16.bb |    1 +
>   ...1-Cargo.lock-revert-to-selinux-sys-0.6.9-and-fts-sys-0.patch | 178
> +++++
>   .../recipes-core/uutils-coreutils/uutils-coreutils-crates.inc   | 20 +-
>   .../recipes-core/uutils-coreutils/uutils-coreutils_0.0.28.bb |    3 +-
>   .../{abseil-cpp_20240116.2.bb =3D> abseil-cpp_20240116.3.bb} |    2 +-
>   meta-oe/recipes-devtools/sip/sip_6.8.6.bb |    4 +-
>   ...CMakeLists-txt-make-DLT_WatchdogSec-can-be-set-by-user.patch | 40 ++
>   meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb |    1 +
>   ...-Do-not-ask-cmake-to-export-binaries-they-don-t-make-.patch} | 10 +-
>   .../openjpeg/{openjpeg_2.5.0.bb =3D> openjpeg_2.5.3.bb} |    4 +-
>   .../ttf-fonts/source-han-sans-cn-fonts_2.004.bb |    7 +-
>   .../ttf-fonts/source-han-sans-jp-fonts_2.004.bb |    7 +-
>   .../ttf-fonts/source-han-sans-kr-fonts_2.004.bb |    7 +-
>   .../ttf-fonts/source-han-sans-tw-fonts_2.004.bb |    7 +-
>   .../libeigen/0002-Remove-LGPL-Code-and-references.patch         | 1040
> +++++++++++++++++++++++++++
>   meta-oe/recipes-support/libeigen/libeigen_3.4.0.bb |    9 +-
>   meta-oe/recipes-support/poco/poco_1.12.5p2.bb |    2 +-
>   .../{python3-django_4.2.17.bb =3D> python3-django_4.2.18.bb} |    4 +-
>   .../{python3-django_5.0.10.bb =3D> python3-django_5.0.11.bb} |    2 +-
>   .../recipes-devtools/python/python3-grpcio-tools_1.62.2.bb |    4 +
>   meta-python/recipes-devtools/python/python3-grpcio_1.62.2.bb |    4 +
>   meta-webserver/recipes-httpd/nginx/files/CVE-2025-23419.patch   | 87 ++=
+
>   meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb |    3 +-
>   26 files changed, 1441 insertions(+), 56 deletions(-)
>   create mode 100644
> meta-oe/recipes-benchmark/iperf3/iperf3/do-not-listen-to-old-udp-prot-lis=
tener.patch
>   create mode 100644
> meta-oe/recipes-core/uutils-coreutils/files/0001-Cargo.lock-revert-to-sel=
inux-sys-0.6.9-and-fts-sys-0.patch
>   rename meta-oe/recipes-devtools/abseil-cpp/{abseil-cpp_20240116.2.bb
> =3D> abseil-cpp_20240116.3.bb} (97%)
>   create mode 100644
> meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-CMakeLists-txt-make-D=
LT_WatchdogSec-can-be-set-by-user.patch
>   rename
> meta-oe/recipes-graphics/openjpeg/openjpeg/{0002-Do-not-ask-cmake-to-expo=
rt-binaries-they-don-t-make-.patch
> =3D> 0001-Do-not-ask-cmake-to-export-binaries-they-don-t-make-.patch} (75=
%)
>   rename meta-oe/recipes-graphics/openjpeg/{openjpeg_2.5.0.bb =3D>
> openjpeg_2.5.3.bb} (82%)
>   create mode 100644
> meta-oe/recipes-support/libeigen/libeigen/0002-Remove-LGPL-Code-and-refer=
ences.patch
>   rename meta-python/recipes-devtools/python/{python3-django_4.2.17.bb
> =3D> python3-django_4.2.18.bb} (63%)
>   rename meta-python/recipes-devtools/python/{python3-django_5.0.10.bb
> =3D> python3-django_5.0.11.bb} (56%)
>   create mode 100644
> meta-webserver/recipes-httpd/nginx/files/CVE-2025-23419.patch
>

