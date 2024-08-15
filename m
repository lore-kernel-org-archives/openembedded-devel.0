Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E566C52D7C
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 15:14:00 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web11.125896.1723734838936212859
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Aug 2024 08:13:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j1GVTxGh;
 spf=pass (domain: gmail.com, ip: 209.85.167.179, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3db16a98d16so598460b6e.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Aug 2024 08:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723734838; x=1724339638; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4cuu4jGm9irl9XmL5A7051msOx7CPY3P9Rj0oLEifWg=;
        b=j1GVTxGhsu6/TJM8DL8WRuFZRI7PxR0QTbmENa5tD85+e4l0U/gAoK2w+jxnkqRVy/
         BtTgZNv4nx9COnqMFV8JyHaivHO+Qjqn/KG7NtfjcCamNMQ+Xkg6XcRBlUHq4de3DQsn
         9gu0cTraiTSuvUSntUJGdSHpiG1jCBqLjWQT8jWuobicw0itO91uaz6VRIAOrsxTKMmg
         0FreZhpA22K4nOdWHmndnwzyePx4KycSn1IO6jrd9atKaceonQzIvUpoRg9ZCy1dBT3U
         zR3l4bkJ497GWL2R/RTXP8Mevmad2Q8/2DLggrp94BbUIgK5l6jt/1mbjt0CA6RGMWyW
         18vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723734838; x=1724339638;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4cuu4jGm9irl9XmL5A7051msOx7CPY3P9Rj0oLEifWg=;
        b=fW7N3Yq4YQJhaFNB8pseSC71cLHVFGzvdN9zXSe03/WHzdbeli14BMgmf24qMMJxHd
         EFRNl74bxQZ5tLA1VY94rb+D2fLGj6QC/9gkKbP92p15g8leX8tMZgz68CiKMyhfdK8E
         G334Fj+2RKUJNTMnCe0JpXH4XKyLPCsfwXY5t/k+u25eej5yVUriyFi6DLgeBm4zFYOG
         9NJT+6tP1eLjQGhHNa8B7HmEYNXUUXaqajXqEVB7OxgTIfJHzAkyU7qWibWw2fUksuE7
         Nq470GyvR7/VEgeOI5vrmqQSIdSfk8Elbj3fJPL4cEMmvXP1KlFGKSSZ3DRwg/2hWAcg
         FMLg==
X-Gm-Message-State: AOJu0YzlnYvHrOXQJ4RWrfKiboiHaBEEFvNWatdrUFqyd0Cvm9kavo6h
	gEWQ78brMZ0Im7N99bk2NsN5hRz1PanhWmk6v0/SeIIpwUpt8XXY704BwWOaXFa/bRR22HbgaeY
	S3MmEAbENZIaJU4H2BtLt4dDKLVQ=
X-Google-Smtp-Source: AGHT+IEFekxVT7QUbFiuwFrQ/8Kcqq8fYCR3aJ4Fcy5OUpptSW1+UGEIOqAsTsdT+wfYezANJyqsMjlp6WvpGc4A02E=
X-Received: by 2002:a05:6808:2017:b0:3d9:ddab:125c with SMTP id
 5614622812f47-3dd298e0086mr7773030b6e.7.1723734838115; Thu, 15 Aug 2024
 08:13:58 -0700 (PDT)
MIME-Version: 1.0
References: <141465e9-8d41-46a0-b95a-0c50f1def2ba@gmail.com>
In-Reply-To: <141465e9-8d41-46a0-b95a-0c50f1def2ba@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 15 Aug 2024 08:13:31 -0700
Message-ID: <CAMKF1srz+4=D0VL6w3f-cNix5a2h8KttR6c-vSfhY6PB8mzDqg@mail.gmail.com>
Subject: Re: scarthgap merge request: Aug 15th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Aug 2024 15:14:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111823

merged thanks Armin

On Thu, Aug 15, 2024 at 5:04=E2=80=AFAM akuster808 <akuster808@gmail.com> w=
rote:
>
> The following changes since commit 2338409efc51cf2022ff5610a9fb689251706e=
2b:
>
>    python3-pydantic-core: Fix build with python 3.12.4 (2024-08-03
> 12:25:17 -0400)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded scarthgap-next
>
> for you to fetch changes up to 64c481d017c1b5b5eae619a367a5e8fa00f1b156:
>
>    libjs-jquery-icheck: Correct LIC_FILES_CHKSUM (2024-08-14 10:19:55 -04=
00)
>
> ----------------------------------------------------------------
> Changqing Li (2):
>        pavucontrol: update SRC_URI
>        libatasmart: Update SRC_URI
>
> Frank de Brabander (3):
>        python3-pydantic-core: fix incompatible version
>        python3-pydantic-core: fix TMPDIR path reference
>        python3-pydantic-core: add missing RDEPENDS for ptest
>
> J. S. (1):
>        znc: Fix buildpaths QA errors
>
> Khem Raj (2):
>        log4cpp: Fix buildpaths QA error
>        python3-pydantic: Upgrade to 2.7.3
>
> Markus Volk (1):
>        exiv2: update 0.28.0 -> 0.28.2
>
> Mikko Rapeli (3):
>        fwupd: skip buildpaths errors
>        gcab: ignore buildpaths error from sources
>        libjcat: skip buildpaths check
>
> Ninette Adhikari (3):
>        imagemagick: Update status for CVE
>        imagemagick: Update status for CVE
>        imagemagick: Update status for CVE
>
> Peter Kjellerstedt (3):
>        hostapd: Support running "devtool modify hostapd"
>        hostapd: Only include the relevant parts from README in
> LIC_FILES_CHKSUM
>        libjs-jquery-icheck: Correct LIC_FILES_CHKSUM
>
> Scott Murray (2):
>        python3-grpcio: Fix build with gcc-14
>        python3-grpcio: backport abseil-cpp RISC-V fix
>
> Tim Orling (1):
>        python3-pydantic: upgrade 2.7.3 -> 2.7.4
>
> Wang Mingyu (1):
>        python3-pydantic: upgrade 2.7.0 -> 2.7.1
>
> alperak (4):
>        tayga: Fix contains reference to TMPDIR [buildpaths] warning
>        etcd-cpp-apiv3: Fix contains reference to TMPDIR [buildpaths] warn=
ing
>        exiv2: Upgrade 0.28.2 to 0.28.3 for CVE fix
>        jsonrpc: Fix contains reference to TMPDIR [buildpaths] warning
>
>   meta-networking/recipes-connectivity/tayga/tayga_0.9.2.bb       | 3 +
>   meta-networking/recipes-irc/znc/znc_1.8.2.bb                    | 1 +
>   meta-oe/recipes-bsp/fwupd/fwupd_1.9.18.bb                       | 2 +
>   meta-oe/recipes-connectivity/hostapd/hostapd_2.10.bb            | 15 ++=
--
>   meta-oe/recipes-devtools/jsonrpc/jsonrpc_1.4.1.bb               | 4 +
>   meta-oe/recipes-extended/etcd/etcd-cpp-apiv3_0.15.3.bb          | 4 +
>   meta-oe/recipes-gnome/gcab/gcab_1.6.bb                          | 3 +
>   meta-oe/recipes-gnome/libjcat/libjcat_0.2.1.bb                  | 2 +
>   meta-oe/recipes-multimedia/pulseaudio/pavucontrol_5.0.bb        | 2 +-
>   meta-oe/recipes-support/exiv2/exiv2_0.28.0.bb                   | 19 --=
---
>   meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb                   | 11 ++=
+
>   meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb        | 70
> ++++++++++++++++
>   meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb         | 2 +-
>   meta-oe/recipes-support/libjs/libjs-jquery-icheck_1.0.3.bb      | 2 +-
>   meta-oe/recipes-support/log4cpp/log4cpp_1.1.4.bb                | 4 +
>   .../0001-PR-1644-unscaledcycleclock-remove-RISC-V-support.patch | 82
> ++++++++++++++++++
>   .../0001-crypto-use-_Generic-only-if-defined-__cplusplus.patch  | 74
> ++++++++++++++++
>   meta-python/recipes-devtools/python/python3-grpcio_1.62.2.bb    | 2 +
>   .../recipes-devtools/python/python3-pydantic-core-crates.inc    | 88
> +++++++++----------
>   ...1-Bumps-pyo3-https-github.com-pyo3-pyo3-from-0.20.2-to.patch | 126
> ----------------------------
>   .../0001-Fix-generate_self_schema-for-Python-3.12-1299.patch    | 29
> -------
>   .../0001-Set-rust-version-from-1.76-to-1.75-in-Cargo.toml.patch | 29
> +++++++
>   .../0002-Dont-embed-RUSTFLAGS-in-final-binary.patch             | 47
> +++++++++++
>   ...-pydantic-core_2.16.3.bb =3D> python3-pydantic-core_2.18.4.bb} |  13=
 ++-
>   .../{python3-pydantic_2.7.0.bb =3D> python3-pydantic_2.7.4.bb} |   2 +-
>   25 files changed, 403 insertions(+), 233 deletions(-)
>   delete mode 100644 meta-oe/recipes-support/exiv2/exiv2_0.28.0.bb
>   create mode 100644 meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb
>   create mode 100644
> meta-python/recipes-devtools/python/python3-grpcio/0001-PR-1644-unscaledc=
ycleclock-remove-RISC-V-support.patch
>   create mode 100644
> meta-python/recipes-devtools/python/python3-grpcio/0001-crypto-use-_Gener=
ic-only-if-defined-__cplusplus.patch
>   delete mode 100644
> meta-python/recipes-devtools/python/python3-pydantic-core/0001-Bumps-pyo3=
-https-github.com-pyo3-pyo3-from-0.20.2-to.patch
>   delete mode 100644
> meta-python/recipes-devtools/python/python3-pydantic-core/0001-Fix-genera=
te_self_schema-for-Python-3.12-1299.patch
>   create mode 100644
> meta-python/recipes-devtools/python/python3-pydantic-core/0001-Set-rust-v=
ersion-from-1.76-to-1.75-in-Cargo.toml.patch
>   create mode 100644
> meta-python/recipes-devtools/python/python3-pydantic-core/0002-Dont-embed=
-RUSTFLAGS-in-final-binary.patch
>   rename
> meta-python/recipes-devtools/python/{python3-pydantic-core_2.16.3.bb =3D>
> python3-pydantic-core_2.18.4.bb} (80%)
>   rename meta-python/recipes-devtools/python/{python3-pydantic_2.7.0.bb
> =3D> python3-pydantic_2.7.4.bb} (95%)
> t

