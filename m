Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21BB1CD4F5D
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 13:37:47 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web11.21812.1695389861547387059
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Sep 2023 06:37:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nl/YOTRz;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-1d682fd3c58so1146880fac.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 Sep 2023 06:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695389861; x=1695994661; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4pH7G8zTeOHj3tM3yO75yCYJYRlmRiq0BtDV4u6igQk=;
        b=nl/YOTRz3AsRzy9Ma1A1nkP1jQah16I3m2DhhVdGfYkvDKroHT4S1XcCR3RsURpUrj
         eE98Jf+HPVlM4Lse06OoauHq0Z12VhEgKcT7geSirWJmhrh2AKsT4jKWd4CLdR+LM78+
         hyU18gJMYJZIZDBoaH0AkI5PAi8QVTKuqiaqPt/+g8SPLvcT9wUejet7j8ndufRqBX+g
         A62vlouhaGDjClpgPkUqqtLFnViNFfKiwXFSk+1VpmjSDKthcZ5kgkx3Kx/KD3yZOTt6
         Yog6tJTw+arV6UrywG3JrGOwVdtB3JWBdqKhdZmEx0oOduEvxZkfO0irjmod/IuOCayE
         jcCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695389861; x=1695994661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4pH7G8zTeOHj3tM3yO75yCYJYRlmRiq0BtDV4u6igQk=;
        b=S/wzQ2cyCODoxz462SSIFkmYh8HFNrbhA+nk+XoGkjC47kxFYMZo/oFUIxamA0O0JE
         uBMKt8MbfeTxl9l3MEZghuRnwD844Dh/m0n+nvGn1i7czt0UZSozwTX2G4lN1Y4GlpNt
         6WHH5L4T6aWCcjUOvDwqiNvszeESZHBu4Qe+eg+o0DS1fEFRnY9i3Yw4G4I7p7bo7rJ4
         YoEpfwQKb0RrHcsYur9ghzUK0Vqf4J6zbWK040OAXT+dM9PF9/FeTeyq4pUOjQIKod2Y
         gGMyD3ajJ69qZO5m6llNCvR3taZ2s+OiQ+1wZ7Wtnr0XYQLSkM9P1aVOYHmAwf4HY7Le
         Qe4g==
X-Gm-Message-State: AOJu0Yw3yYLlEqa9Wdw4Y4TzOMhqrmMnc1g8/er7DH3H3PvOkOZttoHI
	3XsBDHrrdY57Br2xnRJLzCY5RDOQt3e/o90XPfc=
X-Google-Smtp-Source: AGHT+IEagTULaoq0axNCKzFXBlz4dobmNK8kLbuwvlOWSYEJ8cNHJpFNmhwg0XgdC13bDpncut0BxHvuYnPKKeoLWmY=
X-Received: by 2002:a05:6870:e388:b0:1bf:e2a6:b287 with SMTP id
 x8-20020a056870e38800b001bfe2a6b287mr9417967oad.0.1695389860675; Fri, 22 Sep
 2023 06:37:40 -0700 (PDT)
MIME-Version: 1.0
References: <099ed3ed-bab2-9659-b148-b66a74e04cdb@gmail.com>
In-Reply-To: <099ed3ed-bab2-9659-b148-b66a74e04cdb@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 22 Sep 2023 06:37:14 -0700
Message-ID: <CAMKF1srdJD6ecW1eiimpBrFxm+Bo3uCO4UerAAUYv=LP1yLOnA@mail.gmail.com>
Subject: Re: mickledore merge request Sept 22nd
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Sep 2023 13:37:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105068

merged thanks Armin

On Fri, Sep 22, 2023 at 5:30=E2=80=AFAM akuster808 <akuster808@gmail.com> w=
rote:
>
> The following changes since commit 57c516973978ca2667339bf1aae7dc722b5bca=
c7:
>
>    tcpdump: upgrade 4.99.3 -> 4.99.4 (2023-09-05 13:40:23 -0400)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded mickledore-next
>
> for you to fetch changes up to 32c529d435c45e60151c714936d451ed9e341466:
>
>    poppler: fix CVE-2023-34872 (2023-09-19 07:22:00 -0400)
>
> ----------------------------------------------------------------
> Chen Qi (2):
>        grpc: fix CVE-2023-32732
>        grpc: fix CVE-2023-33953
>
> Chris Dimich (1):
>        image_types_sparse: Fix syntax error
>
> Martin Jansa (4):
>        mongodb: enable hardware crc32 only with crc in TUNE_FEATURES
>        khronos-cts.inc: respect MLPREFIX when appending DEPENDS with
> anonymous python
>        libcyusbserial: fix installed-vs-shipped QA issue with multilib
>        tcpreplay: fix pcap detection with /usr/lib32 multilib
>
> Polampalli, Archana (1):
>        python3-appdirs: print ptest results in unified format
>
> Yogita Urade (1):
>        poppler: fix CVE-2023-34872
>
>   ...1-configure.ac-unify-search-dirs-for-pcap-and-add-lib3.patch | 82
> ++++++++++
>   meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb    | 9 +-
>   meta-oe/classes/image_types_sparse.bbclass                      | 12 +-
>   .../meta-python/recipes-dbs/mongodb/mongodb_git.bb              | 1 +
>   ...1-backport-iomgr-EventEngine-Improve-server-handling-o.patch | 224
> ++++++++++++++++++++++++++++
>   .../recipes-devtools/grpc/grpc/0001-fix-CVE-2023-32732.patch    | 81
> ++++++++++
>   meta-oe/recipes-devtools/grpc/grpc_1.50.1.bb                    | 2 +
>   meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc              | 4 +-
>   ...1-CMakeLists.txt-don-t-fall-back-CMAKE_INSTALL_LIBDIR-.patch | 43
> ++++++
>   meta-oe/recipes-support/libcyusbserial/libcyusbserial_git.bb    | 4 +-
>   meta-oe/recipes-support/poppler/poppler/CVE-2023-34872.patch    | 46
> ++++++
>   meta-oe/recipes-support/poppler/poppler_23.03.0.bb              | 1 +
>   meta-python/recipes-devtools/python/python3-appdirs/run-ptest   | 2 +-
>   13 files changed, 498 insertions(+), 13 deletions(-)
>   create mode 100644
> meta-networking/recipes-support/tcpreplay/tcpreplay/0001-configure.ac-uni=
fy-search-dirs-for-pcap-and-add-lib3.patch
>   create mode 100644
> meta-oe/recipes-devtools/grpc/grpc/0001-backport-iomgr-EventEngine-Improv=
e-server-handling-o.patch
>   create mode 100644
> meta-oe/recipes-devtools/grpc/grpc/0001-fix-CVE-2023-32732.patch
>   create mode 100644
> meta-oe/recipes-support/libcyusbserial/libcyusbserial/0001-CMakeLists.txt=
-don-t-fall-back-CMAKE_INSTALL_LIBDIR-.patch
>   create mode 100644
> meta-oe/recipes-support/poppler/poppler/CVE-2023-34872.patch

