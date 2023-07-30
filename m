Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4CFEC00528
	for <webhook@archiver.kernel.org>; Sun, 30 Jul 2023 16:34:21 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web11.76814.1690734853448151394
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Jul 2023 09:34:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=BX/H53BP;
 spf=pass (domain: gmail.com, ip: 209.85.167.180, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-38c35975545so2963677b6e.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 Jul 2023 09:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690734852; x=1691339652;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tKOeKxFUStczjKp3pZEwxBurTuwwL74M21WhopzYQJM=;
        b=BX/H53BPxWdivG8XQw/7FBq9m9cE2Bqd1sCmGmlP3ABYgpkbpcKcfkMV4PRoLSRXUo
         sDZjnPug2PAMqmNplhjJ5iKk5eUv0SeU/CxvDezh22SQ9LKXNml6XulXKc4RuTEMvmWT
         ycFKQ9MRWDXpjNOMEHRWqBEwXiir7yMiOPC/lrd7P3iPwt+4XHyzHlay4rREVFjQx968
         6bc3xB4/8g92e1H78JRBLKjGAG1PhREe9yPeBaGIcfobWa2n+SgPl84Jhz5r9iYeEeFS
         WEdrBFY98yenNzG7nhlBzeAQY5N5OYL7hs9T5u9FQQTf/z4LS3TDqyDgZEvTQIG3f24F
         VWyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690734852; x=1691339652;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tKOeKxFUStczjKp3pZEwxBurTuwwL74M21WhopzYQJM=;
        b=GjFVApMYtErBc+lgxKvgn+atKlFAZl98JMk+QvnNqXvUs7GLfi+pIxAqUpSQ2RaFo7
         PaZ8vUmthf0Tew9N1SxOdLJZJ0O18P7IhkXKC5PgrkY6CEhjORoO4wTYchPeBMy2/XIC
         uvkauSFBWHGLjElwODlN2XLT2/8PHaBZUymfPog9fkI7r7AeCXnaMYWTziV1wQEmwnLU
         wMNrNnZrOISiJ1fs4ybVzsCaI+lK10JIjs06UJOb3NX6tb74x1HAHoL4lrALjsyaHx8N
         F/+ndAZ6OT9KsXFVW6gmHyFG46e3Ld3m6JVAXwGN3w5o9kcrAEUwg7PwebAjLzLnrbbb
         pLZw==
X-Gm-Message-State: ABy/qLareKn/dqx3CflG7C0ssktzZGmoBabQyFfucdvfO0D0ll0dDhUb
	JQrw7fuFaZ9A8KTY+NNvbMM3NrrBu68ggNXKj0M=
X-Google-Smtp-Source: APBJJlHSN3cFPwDRXItpCWIjZklk0Yh2NQBSiD8Q2rMynmcjpymklnBJPqtQyNBAfmwGvvF4Sa7hT1y1M2T264AQHZQ=
X-Received: by 2002:aca:110d:0:b0:3a6:f634:720 with SMTP id
 13-20020aca110d000000b003a6f6340720mr6288303oir.56.1690734851790; Sun, 30 Jul
 2023 09:34:11 -0700 (PDT)
MIME-Version: 1.0
References: <fe54b2a9-06c6-a509-20af-3b61ddb71dba@gmail.com>
In-Reply-To: <fe54b2a9-06c6-a509-20af-3b61ddb71dba@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 30 Jul 2023 09:33:45 -0700
Message-ID: <CAMKF1sqxqgs1CCOF9wc2gDS45t1p-fmxzqfA5E8wus_o4j9nvg@mail.gmail.com>
Subject: Re: mickeldore merge request: July 30th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Jul 2023 16:34:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104076

merged thanks Armin.

On Sun, Jul 30, 2023 at 5:50=E2=80=AFAM akuster808 <akuster808@gmail.com> w=
rote:
>
> The following changes since commit d71a08b3d8fc69d3213c10885af9cc693056a8=
bd:
>
>    mbedtls: upgrade 2.28.2 -> 2.28.3 (2023-06-28 16:28:35 -0400)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded mickledore-next
>
> for you to fetch changes up to 03fd1d368ac19793b3e4c35159ba2ce802247e4d:
>
>    yasm: fix CVE-2023-31975 (2023-07-25 07:15:34 -0400)
>
> ----------------------------------------------------------------
> Chee Yang Lee (2):
>        rabbitmq-c: Fix CVE-2023-35789
>        c-ares: upgrade 1.19.0 -> 1.19.1
>
> Jasper Orschulko (1):
>        yaml-cpp: Fix cmake export
>
> Joe Slater (1):
>        libgpiod: modify RDEPENDS for ptest
>
> Mingli Yu (2):
>        dialog: Update the SRC_URI
>        gnulib: Update SRC_URI
>
> Polampalli, Archana (2):
>        nodejs: upgrade 18.14.2 -> 18.16.1
>        yasm: fix CVE-2023-31975
>
> Yi Zhao (1):
>        open-vm-tools: Security fix CVE-2023-20867
>
>   .../open-vm-tools/open-vm-tools/CVE-2023-20867.patch            | 163
> ++++++++++++++++++++++++++++
>   .../recipes-support/open-vm-tools/open-vm-tools_12.1.5.bb       | 1 +
>   .../recipes-connectivity/rabbitmq-c/files/CVE-2023-35789.patch  | 131
> ++++++++++++++++++++++
>   meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.13.0.bb    | 4 +-
>   .../oe-npm-cache                                                | 0
>   ...oe-cache-native_18.14.bb =3D> nodejs-oe-cache-native_18.16.bb} |   0
>   .../0001-Disable-running-gyp-files-for-bundled-deps.patch       | 7 +-
>   .../nodejs/{nodejs_18.14.2.bb =3D> nodejs_18.16.1.bb} |   4 +-
>   meta-oe/recipes-devtools/yasm/yasm/CVE-2023-31975.patch         | 29 ++=
+++
>   meta-oe/recipes-devtools/yasm/yasm_git.bb                       | 1 +
>   meta-oe/recipes-extended/dialog/dialog_1.3-20210509.bb          | 2 +-
>   meta-oe/recipes-support/c-ares/c-ares/CVE-2023-32067.patch      | 87
> ---------------
>   .../c-ares/{c-ares_1.19.0.bb =3D> c-ares_1.19.1.bb} |   6 +-
>   meta-oe/recipes-support/gnulib/gnulib_2018-12-18.bb             | 2 +-
>   meta-oe/recipes-support/libgpiod/libgpiod.inc                   | 2 +-
>   .../yaml-cpp/yaml-cpp/0001-Fix-CMake-export-files-1077.patch    | 117
> ++++++++++++++++++++
>   meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.7.0.bb              | 1 +
>   17 files changed, 459 insertions(+), 98 deletions(-)
>   create mode 100644
> meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2023-2086=
7.patch
>   create mode 100644
> meta-oe/recipes-connectivity/rabbitmq-c/files/CVE-2023-35789.patch
>   rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-18.14 =3D>
> nodejs-oe-cache-18.16}/oe-npm-cache (100%)
>   rename
> meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_18.14.bb =3D>
> nodejs-oe-cache-native_18.16.bb} (100%)
>   rename meta-oe/recipes-devtools/nodejs/{nodejs_18.14.2.bb =3D>
> nodejs_18.16.1.bb} (97%)
>   create mode 100644 meta-oe/recipes-devtools/yasm/yasm/CVE-2023-31975.pa=
tch
>   delete mode 100644
> meta-oe/recipes-support/c-ares/c-ares/CVE-2023-32067.patch
>   rename meta-oe/recipes-support/c-ares/{c-ares_1.19.0.bb =3D>
> c-ares_1.19.1.bb} (83%)
>   create mode 100644
> meta-oe/recipes-support/yaml-cpp/yaml-cpp/0001-Fix-CMake-export-files-107=
7.patch
>

