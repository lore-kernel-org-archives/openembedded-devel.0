Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 752FACFA463
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 19:52:57 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web10.7160.1729713175694630781
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Oct 2024 12:52:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nLT4n1pg;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3e612437c09so162057b6e.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Oct 2024 12:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729713175; x=1730317975; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6+ENXE59zH7ySqfex/q9jfsepn7Hn1ntgGOAHhDfJCY=;
        b=nLT4n1pg01JYy5L8RRItjziSGgdGZi/32f9NeVyUUjJbXgSKnh88Os2gFVX4n+PEQF
         bfeViJyCHeSX2/KS6tRvurBuKCBPlSLmA6Yz9k3L2uZt6FH0gO6q07r8xWSHZAazOccF
         I90/MxcSYfJOcIQux0W740Rzh8xgAdhPrO9Mo7MasqMiK/lmbObmb86Hg5lgW+ZGS3yu
         w/NV+xSIODHiF2CZpfNUUmoK7Jhx0lASXs+wURYBItns0yhUA8ak3fpzi+DNGKhWj0jZ
         ozIrNpT9+5aKS2yoN4beVMASo/tWCUEZzqf6As1H++3SA6UN1BtVIydJuxNTS1Nn9yAq
         qStw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729713175; x=1730317975;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6+ENXE59zH7ySqfex/q9jfsepn7Hn1ntgGOAHhDfJCY=;
        b=Z+VVl5owanzCFFMTn1SNz4AKm3ky4fi82lx74wQ2+0+KyLJcXiFs+kQhZPIziA0UJf
         PEX+tkFqDnzUfE5jQdpyG3VkNvgM5nkB6r078pPQA8Bhz/RifvHHTqYcd6SkJoCPnpE3
         qTY7DdxeBv6hmpTuXBIggcdMRCqvttGiUWZ5Cau+PI4e8+Xk8UJXaUB6qxMyOeD+Q2KJ
         yhpgpTAt6KfHTmvrP2ZVjQX7fCLiXZ0cmZOOI8jjd+c+CUGi4KKtCTaSHkqe/gu+DMYt
         fgWPehDYk+e9YsaFIhR2wUhdhRxaxKbECzWGijmD84SopKVTqXRrdEvCWrl6GrYaXNgI
         /3fQ==
X-Gm-Message-State: AOJu0YyXSHbj56lPxi4NaHbsThFbyjhOZ0jHTVuolrLwn0deWO1FQZ75
	uvdL+EtdTaZidTU6CBqFXPYUHFFWGVp2GmOMRPpASr8aJ8sojqpeDrGH2EkmZjA/ERbjDp9PTPa
	zRXuh3YKGCazIdZY/uoI0hNzLSns=
X-Google-Smtp-Source: AGHT+IGJCmgCkd/Mb+x1CYffMXp8NxHGF2YlXLt74gaOK0s1VPHWAMFLQNntwcuZiM9cqi6dnX8JsyuHjSZIO6+5hJE=
X-Received: by 2002:a05:6808:13cc:b0:3e6:f6e:984b with SMTP id
 5614622812f47-3e6245a9804mr4106845b6e.38.1729713174913; Wed, 23 Oct 2024
 12:52:54 -0700 (PDT)
MIME-Version: 1.0
References: <c7b875af-a2c0-4c29-a3fa-21d6e51ae25d@gmail.com>
In-Reply-To: <c7b875af-a2c0-4c29-a3fa-21d6e51ae25d@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 Oct 2024 12:52:28 -0700
Message-ID: <CAMKF1sqFfiTC52K0t=DtR7BV2e051e6X23mQKaQ=e=vBQGKWXA@mail.gmail.com>
Subject: Re: kirkstone merge request: Oct 23rd
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Oct 2024 19:52:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113154

merged now. Thanks Armin

On Wed, Oct 23, 2024 at 7:52=E2=80=AFAM akuster808 <akuster808@gmail.com> w=
rote:
>
> The following changes since commit dd3d2293ffdf2559f8a433f241765a8ab50cd0=
85:
>
>    python3-smbus2: Fix LIC_FILES_CHKSUM (2024-09-22 10:16:22 -0400)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded kirkstone-next
>
> for you to fetch changes up to 4ad41baed6236d499804cbfc4f174042d84fce97:
>
>    sound-theme-freedesktop: Update SRC_URI (2024-10-13 11:19:56 -0400)
>
> ----------------------------------------------------------------
> Divya Chellam (1):
>        frr: fix CVE-2024-44070
>
> Dmitry Baryshkov (1):
>        android-tools: Create flag file /etc/usb-debugging-enabled
>
> Guocai He (1):
>        xmlrpc-c: fix do_fetch error
>
> Liyin Zhang (3):
>        libatasmart: Update SRC_URI to fix fetch issue
>        keyutils: Update SRC_URI
>        sound-theme-freedesktop: Update SRC_URI
>
> Mingli Yu (1):
>        rocksdb: Add ptest support
>
> Peter Kjellerstedt (1):
>        libdevmapper: Inherit nopackages
>
> Peter Marko (1):
>        cjson: upgrade 1.7.17 -> 1.7.18
>
> Raghuvarya S (1):
>        android-tools-adbd.service: Update ConditionPathExists to /etc
>
> Vijay Anusuri (1):
>        tgt: Security fix for CVE-2024-45751
>
>   meta-networking/recipes-extended/tgt/files/CVE-2024-45751.patch | 68
> ++++++++++++++++++++++++++++
>   meta-networking/recipes-extended/tgt/tgt_git.bb                 | 1 +
>   meta-networking/recipes-protocols/frr/frr/CVE-2024-44070.patch  | 69
> +++++++++++++++++++++++++++++
>   meta-networking/recipes-protocols/frr/frr_8.2.2.bb              | 1 +
>   meta-oe/recipes-dbs/rocksdb/files/run-ptest                     | 12 ++=
+++
>   meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb                   | 19
> +++++++-
>   .../android-tools/android-tools/android-tools-adbd.service      | 2 +-
>   .../recipes-devtools/android-tools/android-tools_5.1.1.r37.bb   | 2 +-
>   .../recipes-devtools/cjson/{cjson_1.7.17.bb =3D> cjson_1.7.18.bb} |  2 =
+-
>   meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb           | 2 +-
>   .../sound-themes/sound-theme-freedesktop_0.8.bb                 | 2 +-
>   meta-oe/recipes-security/keyutils/keyutils_1.6.1.bb             | 2 +-
>   meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb         | 2 +-
>   meta-oe/recipes-support/lvm2/libdevmapper_2.03.11.bb            | 2 +
>   14 files changed, 177 insertions(+), 9 deletions(-)
>   create mode 100644
> meta-networking/recipes-extended/tgt/files/CVE-2024-45751.patch
>   create mode 100644
> meta-networking/recipes-protocols/frr/frr/CVE-2024-44070.patch
>   create mode 100644 meta-oe/recipes-dbs/rocksdb/files/run-ptest
>   rename meta-oe/recipes-devtools/cjson/{cjson_1.7.17.bb =3D>
> cjson_1.7.18.bb} (91%)
>

