Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7F27EE57DF
	for <webhook@archiver.kernel.org>; Mon, 11 Sep 2023 15:11:43 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.61745.1694445098233206397
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Sep 2023 08:11:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=jCtbfa7g;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-68fb85afef4so1095677b3a.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 11 Sep 2023 08:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694445098; x=1695049898; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YTGib0cDStnEnf1ff828ce8P+zU0Z5EK0LMLKFb6vHo=;
        b=jCtbfa7gx3QWi3KAi3XEOXy89avabf2Ws3okeKN3F6ryGxHScWn/Llhv/wScORIeMr
         kwPYTbJtet7d0w8jTJrd2ao0YupkSRA6D/7JJZFn9WOkQB1lZrSmlwpWAM1QJOoisg7x
         halLahehaX2ngUMw2NR5Rvf39eCOrdkyxoejWT1AWomcjWIIwupczIACYtzyH40vHZgC
         RZEFkPriBMbvegugdiAp9GgfkdO7ibTlk08eHOLVcEtimxhPl3KP2MZ1YTJV+8Ph9cW2
         Z/t/O1mkeM6nJr6DKpSwpeguAk1DjJJbzp/q5jdLS02T3cUqJNg20mIZ5YCfQd7T3E4e
         q+mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694445098; x=1695049898;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YTGib0cDStnEnf1ff828ce8P+zU0Z5EK0LMLKFb6vHo=;
        b=u91WA2DtE2e0Hv+vjnCLBnYkCdGQyU9AJ94KEvDnFwrdnQFlHt1DQl/mKrujkQyNe7
         ZgEbJh1EBrCoWukE3uav8HtHRGCCP0+fk/yBmg2QPtdMADTwf3iQd8Ji7rCfYFU1vcV4
         KhMRaZ4YpaKtwXPosvAS3roymtgtlgzkWZobCmioHtIWgTiH808Ggyna5dY1IA7I2erC
         sTeft7aYWf+7pFQXiNESFQKzA+XmEaRzCBeqvrb9ZpUHI7C42S1yUUSRKP1FNmDaKUI7
         NniusCTkdG51okTKBZ4Zx82XZlZ2RFtnGxtsfgzcUt1T8W7MFpU0E9BfyPDzy3wa0moQ
         BtVA==
X-Gm-Message-State: AOJu0YzUcKa1cF56OeGpgHEqbJmLVt24P4j/Z5oh/JZQ4R3/WmAwCbx1
	kYjp8q+Lkz9ADYCz559k4CmIX9RRUWaZO63CjYr5XIeqmfs=
X-Google-Smtp-Source: AGHT+IFcyOMJpQL/8W95xeW8dQsK806dnqpL4G0X0ytSAGvbxjNDiB2IXGJcmz3YQe3IwU16/lV0VEVqhMItIKlsVH8=
X-Received: by 2002:a05:6870:fb8a:b0:1b0:17f2:6518 with SMTP id
 kv10-20020a056870fb8a00b001b017f26518mr12530039oab.42.1694445076484; Mon, 11
 Sep 2023 08:11:16 -0700 (PDT)
MIME-Version: 1.0
References: <9c4a9d38-5e62-f2d5-a0cf-60511b7912dc@gmail.com>
In-Reply-To: <9c4a9d38-5e62-f2d5-a0cf-60511b7912dc@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 11 Sep 2023 08:10:50 -0700
Message-ID: <CAMKF1sqAvEH6kitnnSd9OmK87bTFdSnwpMPMXM+1U+mJWKNUAQ@mail.gmail.com>
Subject: Re: dunfell pull request: Sept 11th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Sep 2023 15:11:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104839

merged thanks Armin

On Mon, Sep 11, 2023 at 4:13=E2=80=AFAM akuster808 <akuster808@gmail.com> w=
rote:
>
> The following changes since commit b8b0b06821d4d4df0cce4f07fa31a8ca1dd38f=
46:
>
>    sysdig: Depend on system libb64 (2023-07-22 07:49:35 -0400)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded dunfell-next
>
> for you to fetch changes up to e42d1e758f9f08b98c0e8c6f0532316951bb276f:
>
>    postgresql: refresh patches (2023-09-09 12:52:03 -0400)
>
> ----------------------------------------------------------------
> Armin Kuster (1):
>        postgresql: refresh patches
>
> Ashish Sharma (1):
>        php: Backport fix CVE-2023-3247
>
> Khem Raj (1):
>        nodejs: Fix build with gcc13
>
> Martin Jansa (1):
>        nodejs-14: add -fpermissive BUILD_CXXFLAGS to fix build with
> gcc-13 on host
>
> Robert Joslyn (1):
>        postgresql: Update to 12.16
>
> Sourav Kumar Pramanik (1):
>        meta-oe-components: Avoid usage of nobranch=3D1
>
> Sourav Pramanik (2):
>        rapidjson: Avoid usage of nobranch=3D1
>        nlohmann-json: Avoid usage of nobranch=3D1
>
> Vijay Anusuri (1):
>        c-ares: CVE-2023-32067 0-byte UDP payload Denial of Service
>
>   .../dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem_1.2.bb   | 2 +-
>   .../postgresql/files/0001-Add-support-for-RISC-V.patch          | 13 +-
>   .../postgresql/files/0001-Improve-reproducibility.patch         | 13 +-
>   meta-oe/recipes-dbs/postgresql/files/CVE-2022-1552.patch        | 947
> ----------------------------
>   meta-oe/recipes-dbs/postgresql/files/CVE-2022-2625.patch        | 904
> --------------------------
>   meta-oe/recipes-dbs/postgresql/files/CVE-2022-41862.patch       | 48 --
>   meta-oe/recipes-dbs/postgresql/files/CVE-2023-2454.patch        | 235
> -------
>   meta-oe/recipes-dbs/postgresql/files/CVE-2023-2455.patch        | 118 -=
---
>   meta-oe/recipes-dbs/postgresql/files/not-check-libperl.patch    | 13 +-
>   meta-oe/recipes-dbs/postgresql/files/remove_duplicate.patch     | 38 --
>   meta-oe/recipes-dbs/postgresql/postgresql_12.16.bb              | 11 +
>   meta-oe/recipes-dbs/postgresql/postgresql_12.9.bb               | 17 -
>   meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.7.3.bb   | 2 +-
>   meta-oe/recipes-devtools/nodejs/nodejs/gcc13.patch              | 63 ++
>   meta-oe/recipes-devtools/nodejs/nodejs_12.22.12.bb              | 1 +
>   meta-oe/recipes-devtools/nodejs/nodejs_14.18.1.bb               | 4 +
>   meta-oe/recipes-devtools/php/php/CVE-2023-3247-1.patch          | 87 ++=
+
>   meta-oe/recipes-devtools/php/php/CVE-2023-3247-2.patch          | 29 +
>   meta-oe/recipes-devtools/php/php_7.4.33.bb                      | 2 +
>   meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb             | 2 +-
>   meta-oe/recipes-extended/zstd/zstd_1.4.5.bb                     | 2 +-
>   meta-oe/recipes-support/c-ares/c-ares/CVE-2023-32067.patch      | 84 ++=
+
>   meta-oe/recipes-support/c-ares/c-ares_1.18.1.bb                 | 1 +
>   23 files changed, 301 insertions(+), 2335 deletions(-)
>   delete mode 100644
> meta-oe/recipes-dbs/postgresql/files/CVE-2022-1552.patch
>   delete mode 100644
> meta-oe/recipes-dbs/postgresql/files/CVE-2022-2625.patch
>   delete mode 100644
> meta-oe/recipes-dbs/postgresql/files/CVE-2022-41862.patch
>   delete mode 100644
> meta-oe/recipes-dbs/postgresql/files/CVE-2023-2454.patch
>   delete mode 100644
> meta-oe/recipes-dbs/postgresql/files/CVE-2023-2455.patch
>   delete mode 100644
> meta-oe/recipes-dbs/postgresql/files/remove_duplicate.patch
>   create mode 100644 meta-oe/recipes-dbs/postgresql/postgresql_12.16.bb
>   delete mode 100644 meta-oe/recipes-dbs/postgresql/postgresql_12.9.bb
>   create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/gcc13.patch
>   create mode 100644 meta-oe/recipes-devtools/php/php/CVE-2023-3247-1.pat=
ch
>   create mode 100644 meta-oe/recipes-devtools/php/php/CVE-2023-3247-2.pat=
ch
>   create mode 100644
> meta-oe/recipes-support/c-ares/c-ares/CVE-2023-32067.patch
>

