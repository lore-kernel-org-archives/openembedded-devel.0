Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B588EC83F22
	for <webhook@archiver.kernel.org>; Sun, 20 Jul 2025 20:09:17 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web10.24757.1753042152880048265
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Jul 2025 13:09:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mS7MW19W;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-718389fb988so35168847b3.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 20 Jul 2025 13:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753042152; x=1753646952; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l/CDc8auNz6ebhAmjFoJBB1Muqp8c0TWKAq/Kvda7yI=;
        b=mS7MW19WT8yzHC/7DuSf4ZGEeb0reSVC9NMCfB56sEA7GCQ+lkngB3JsgeEosX3lod
         LKHugtbGQA0CSGVBcVXWp5V6gzqBcYa3pPx6KMfjeAgHZjh49FFNz0xtkoFi39Xymv5L
         LcTtOkvXkJUS8J8R8I5EhvKjJWb0p59u1aiP6tQXLV4QkK5d0NFDdk8aMyTz1ExyxIES
         WZbDJqngi3QSjY+vo0bE4W0QljdjyZpEwvSz11G1ZVZnfQJH0PddU3rmnsq3pkiGsB8F
         MorpP2H99EkHd0ZyRzOBIwhoiAqq/vNDDufpbe6SgFVCECVDHi2Llan9lFWCxU8Tr0+i
         rXWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753042152; x=1753646952;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l/CDc8auNz6ebhAmjFoJBB1Muqp8c0TWKAq/Kvda7yI=;
        b=RzFF6hKT0t/Ahvi+sx0Tbuv8PLRf8rd1mNM883hgxF9glgYuJ/uT3Bdiz8xTcmMIkG
         7eOrxrTj3hncnNSYTay5F+MjZNvJQN1TJYlrBDbAoMUx6zP880C/nRqWU3Le9DCXNwJx
         bM19vaVSn8LtANmjT6bcWpaFqE8Tf5qXyqiDJz7g/0y6vyRs/zzPCdkDNffSvPz7Y4MM
         pcmGjGRakzsC9s58JjnrrtlxQUvKbar7tEg9mlOHcXM6ZZEqbe0MdecRRbRDdjiR8u+L
         Ylgmx5uw9VHejXoLH9kmluoeu5Dy8LiK5VvgOAvfOxUfl/9AVyf39acYRuHvJsbfvlD/
         5siA==
X-Gm-Message-State: AOJu0YxAlQq39ergVf1BwG4NaWOChv7fUhXjLav1FMXJD0ZODxr83Zw7
	Ba48bbTvXAZGydwMb+hmYlCksogi8tq5e5MX+fJF532rNJ78Sm7Ahn3d9Y10u/fKAXkvm6bg2z1
	5MbJAqVIYqo7qTJBqRgoV40RLMvR1HDVXfv25
X-Gm-Gg: ASbGncsSsiiQ5OlnRc2QCfYslGldHnrblSKOohlO1H/drfohrDH2GbUvP/RdNst/c2k
	0jpkKV12gq31IkNuoslkt7rL2W6e2HxaoCa8o72LKY8hp3s3BzSUWwpv23lChQX/PtBcxz385PR
	iLxKDbib8PpzJV2C34YedNtWQPx3yv2R67NtiWkSINMMlep3uXsazFxu4gmM8mu3ynOTN4tPNCl
	RXnUIQvkS6dtxCSZ8lL/RBTxXfber8W
X-Google-Smtp-Source: AGHT+IFdHaZQ9auLbxRRGyKT82bKqtYnuifdbOnRHp4S/DXzX41WCgfylokHyDEPb3tlUw//VD9RTtxXLwBhyA7OrTM=
X-Received: by 2002:a05:690c:4909:b0:70e:2d30:43eb with SMTP id
 00721157ae682-71834f7c4admr248292137b3.12.1753042151804; Sun, 20 Jul 2025
 13:09:11 -0700 (PDT)
MIME-Version: 1.0
References: <848eafbf-de50-4a28-87a0-6f30eadfa543@gmail.com>
In-Reply-To: <848eafbf-de50-4a28-87a0-6f30eadfa543@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 20 Jul 2025 13:08:45 -0700
X-Gm-Features: Ac12FXw7FZ8LDYX52KuywzEmTnW95SAm0EKYfr4YXAWM-quHFZglamFLakiEi0c
Message-ID: <CAMKF1sowY7nv5aBnVsW0QXOzUW+J2EOkNKtWx0a-eqaU9aoARg@mail.gmail.com>
Subject: Re: Kirkstone merge request: July 20th.
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 20 Jul 2025 20:09:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118642

merged.
thanks Armin.

On Sun, Jul 20, 2025 at 11:38=E2=80=AFAM akuster808 <akuster808@gmail.com> =
wrote:
>
> The following changes since commit 058249f9a836e3aa866436aa6e37d6d48ff768=
fd:
>
>    libssh: fix CVE-2025-5318 (2025-07-02 20:42:48 -0400)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded kirkstone-next
>
> for you to fetch changes up to 06fc0278f10d630838d703dde707bbf0e2999873:
>
>    poco: Fix ptests (2025-07-13 14:41:35 -0400)
>
> ----------------------------------------------------------------
> Archana Polampalli (1):
>        tcpreplay: fix CVE-2024-22654
>
> Changqing Li (2):
>        libblockdev: fix CVE-2025-6019
>        udisks2: Hardening measure of CVE-2025-6019
>
> Colin McAllister (1):
>        jq: Fix CVEs
>
> Hitendra Prajapati (1):
>        open-vm-tools: fix CVE-2025-22247
>
> Khem Raj (2):
>        poco: Remove pushd/popd from run-ptest
>        poco: Fix ptests
>
> Peter Marko (2):
>        spdlog: patch CVE-2025-6140
>        poco: patch CVE-2025-6375
>
> Sana Kazi (1):
>        imagemagick: Fix CVE vulnerablities
>
>   .../open-vm-tools/open-vm-tools/CVE-2025-22247.patch            | 383
> ++++++++++++++++++++++++++++
>   .../recipes-support/open-vm-tools/open-vm-tools_11.3.5.bb       | 1 +
>   .../tcpreplay/tcpreplay/CVE-2024-22654-0001.patch               | 90
> +++++++
>   .../tcpreplay/tcpreplay/CVE-2024-22654-0002.patch               | 35 ++=
+
>   meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb    | 2 +
>   meta-oe/recipes-devtools/jq/jq/CVE-2024-23337.patch             | 219
> ++++++++++++++++
>   meta-oe/recipes-devtools/jq/jq/CVE-2024-53427-01.patch          | 69 ++=
+++
>   meta-oe/recipes-devtools/jq/jq/CVE-2024-53427-02.patch          | 56 ++=
++
>   meta-oe/recipes-devtools/jq/jq/CVE-2025-48060.patch             | 46 ++=
++
>   meta-oe/recipes-devtools/jq/jq_git.bb                           | 8 +-
>   meta-oe/recipes-extended/libblockdev/files/CVE-2025-6019.patch  | 31 ++=
+
>   meta-oe/recipes-extended/libblockdev/libblockdev_2.26.bb        | 1 +
>   meta-oe/recipes-support/imagemagick/files/CVE-2022-1114.patch   | 44 ++=
++
>   meta-oe/recipes-support/imagemagick/files/CVE-2023-1289-1.patch | 114
> +++++++++
>   meta-oe/recipes-support/imagemagick/files/CVE-2023-1289.patch   | 21 ++
>   meta-oe/recipes-support/imagemagick/files/CVE-2023-34474.patch  | 35 ++=
+
>   meta-oe/recipes-support/imagemagick/files/CVE-2023-5341.patch   | 28 ++
>   meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb       | 5 +
>   meta-oe/recipes-support/poco/poco/CVE-2025-6375.patch           | 34 ++=
+
>   meta-oe/recipes-support/poco/poco/run-ptest                     | 7 +-
>   meta-oe/recipes-support/poco/poco_1.11.2.bb                     | 10 +-
>   meta-oe/recipes-support/spdlog/spdlog/CVE-2025-6140.patch       | 35 ++=
+
>   meta-oe/recipes-support/spdlog/spdlog_1.9.2.bb                  | 4 +-
>   meta-oe/recipes-support/udisks/udisks2/CVE-2025-6019.patch      | 51 ++=
++
>   meta-oe/recipes-support/udisks/udisks2_2.9.4.bb                 | 3 +-
>   25 files changed, 1321 insertions(+), 11 deletions(-)
>   create mode 100644
> meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2025-2224=
7.patch
>   create mode 100644
> meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2024-22654-0001.p=
atch
>   create mode 100644
> meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2024-22654-0002.p=
atch
>   create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2024-23337.patch
>   create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2024-53427-01.pat=
ch
>   create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2024-53427-02.pat=
ch
>   create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2025-48060.patch
>   create mode 100644
> meta-oe/recipes-extended/libblockdev/files/CVE-2025-6019.patch
>   create mode 100644
> meta-oe/recipes-support/imagemagick/files/CVE-2022-1114.patch
>   create mode 100644
> meta-oe/recipes-support/imagemagick/files/CVE-2023-1289-1.patch
>   create mode 100644
> meta-oe/recipes-support/imagemagick/files/CVE-2023-1289.patch
>   create mode 100644
> meta-oe/recipes-support/imagemagick/files/CVE-2023-34474.patch
>   create mode 100644
> meta-oe/recipes-support/imagemagick/files/CVE-2023-5341.patch
>   create mode 100644 meta-oe/recipes-support/poco/poco/CVE-2025-6375.patc=
h
>   create mode 100644
> meta-oe/recipes-support/spdlog/spdlog/CVE-2025-6140.patch
>   create mode 100644
> meta-oe/recipes-support/udisks/udisks2/CVE-2025-6019.patch
>

