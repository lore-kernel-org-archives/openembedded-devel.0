Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6EAEC4332F
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 14:48:27 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web10.15600.1699454901882011567
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Nov 2023 06:48:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bBm45mWi;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-1efabc436e4so4010450fac.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Nov 2023 06:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699454901; x=1700059701; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=byuW2r1VfCxTzr4bVjyq+z8Y2HkUZ91jC/aSTvcydDM=;
        b=bBm45mWiYedlZDXQM4Rs66DqVUexixkUcsBPuv7b+370Bj/WGG9D8KZSKIjh4/mXaz
         02GWa74l1kWM1ah1qr1+ylH0MdumA4Cy8swGpxHTlkVvQjDTBl6C6dLcc5FEY3AWhr3Z
         e7xKeIi9divT53dRrNYxW6cY3xKkhyDdKNKNNWKoxI3AWp0iPSS+r3O+Nj9XQFmxkc73
         2Go3i5/xeViR4RX15aatGgFgHy/kht/Q2C5LFSKzBhRY4IioXFBn0HMoMD48VJSm5vas
         awfTm6CldgD9yF2Chu89uMNhZZH8T/s4xd6kkq7BjTlFARsw9BwjvN5TPqcrB4ZK5sr0
         9nnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699454901; x=1700059701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=byuW2r1VfCxTzr4bVjyq+z8Y2HkUZ91jC/aSTvcydDM=;
        b=CEBl0vCeqlSD9pTteZqJdmv23/ymgE/hEo7IK7g3W2mitxBZRIBvjksoFgUMsFDRja
         xon51hloXfftIT6Dg6PK4wFRslJICjtY+LtunbmMywKSXhupkFGJ6IFIudtNSlOFIHk+
         J/T5GP0jSPWZIFsU+6ihh1kaz2klw1hkpTb/1LuG7vfutA+cDmrr4OINvnnf9aUn9Kiu
         ohJ3a2R0Dsamg8h7AiPgpn/m3aa3lBIXaiIhFw7/XzQomEJa31RZKlh2/rPcrSF2tSNM
         zpKCZLxkWh/CaUTObSgt0is23HLKZAO2z+GiSs8mE7eIlXjKsp2u5/y4pwqc3+EWCKXK
         v2YQ==
X-Gm-Message-State: AOJu0YyPoJ6az+MoedRFGur/SARWfIos0KRUbon8ESbYs4UW1DQ26me0
	gc3yLQhWWYQs9qD8zIaRJJIBqdt8Skh7PWZiy28=
X-Google-Smtp-Source: AGHT+IFAt+zdEF4l4XCrfq7+bXo4Q7xp8azqVzkkoNJEUKL3bQGPsvFmWgYbpB+1UQqExjXWpqfor+P05q+w4b7JSO8=
X-Received: by 2002:a05:6870:50:b0:1ea:c913:3494 with SMTP id
 16-20020a056870005000b001eac9133494mr1719614oaz.6.1699454900863; Wed, 08 Nov
 2023 06:48:20 -0800 (PST)
MIME-Version: 1.0
References: <05f768c6-fb99-4da3-87af-0ab94e216edf@gmail.com>
In-Reply-To: <05f768c6-fb99-4da3-87af-0ab94e216edf@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 8 Nov 2023 06:47:54 -0800
Message-ID: <CAMKF1sqDTEc0QrxpWNeMCn-i320LFysEXFFLAkTDbCGXtywjTg@mail.gmail.com>
Subject: Re: kirkstone merge request: Nov 8th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Nov 2023 14:48:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106478

merged thanks Armin

On Wed, Nov 8, 2023 at 5:57=E2=80=AFAM akuster808 <akuster808@gmail.com> wr=
ote:
>
> The following changes since commit 79a6f60dabad9e5b0e041efa91379447ef0304=
82:
>
>    mbedtls: upgrade 2.28.2 -> 2.28.5 (2023-10-17 09:07:38 -0400)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded kirkstone-next
>
> for you to fetch changes up to 7da6cb848bc42b3e6bd5d2b37b52ba75510a6ca0:
>
>    indent: fix CVE-2023-40305 (2023-11-03 10:52:59 -0400)
>
> ----------------------------------------------------------------
> Beniamin Sandu (1):
>        mbedtls: upgrade 3.4.0 -> 3.5.0
>
> Martin Jansa (1):
>        packagegroup-meta-multimedia: restore x11 restriction for projucer
>
> Omkar Patil (1):
>        ntfs-3g-ntfsprogs: Upgrade 2022.5.17 to 2022.10.3
>
> Richard Purdie (3):
>        grubby: Update branchname to match upstream
>        python-blivet: Adapt to upstream branch name changes
>        suiteparse: Adapt to upstream branch name changes
>
> Yogita Urade (1):
>        indent: fix CVE-2023-40305
>
>   ...3g-ntfsprogs_2022.5.17.bb =3D> ntfs-3g-ntfsprogs_2022.10.3.bb} |    =
2 +-
>   meta-initramfs/recipes-devtools/grubby/grubby_git.bb |    2 +-
>   .../packagegroups/packagegroup-meta-multimedia.bb |    2 +-
>   ...1-AES-NI-use-target-attributes-for-x86-32-bit-intrinsi.patch | 87 +
>   ...1-aesce-do-not-specify-an-arch-version-when-enabling-c.patch | 33 -
>   ...2-aesce-use-correct-target-attribute-when-building-wit.patch | 34 -
>   .../mbedtls/{mbedtls_3.4.0.bb =3D> mbedtls_3.5.0.bb} |   10 +-
>   meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb |    2 +-
>   .../recipes-extended/indent/indent/CVE-2023-40305_0001.patch    | 4196
> ++++++++++++++++++++++++++
>   .../recipes-extended/indent/indent/CVE-2023-40305_0002.patch    | 4254
> +++++++++++++++++++++++++++
>   meta-oe/recipes-extended/indent/indent_2.2.12.bb |    2 +
>   .../recipes-extended/python-blivet/python3-blivetgui_2.3.0.bb |    2 +-
>   12 files changed, 8546 insertions(+), 80 deletions(-)
>   rename
> meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/{ntfs-3g-ntfsprogs=
_2022.5.17.bb
> =3D> ntfs-3g-ntfsprogs_2022.10.3.bb} (95%)
>   create mode 100644
> meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-AES-NI-use-targ=
et-attributes-for-x86-32-bit-intrinsi.patch
>   delete mode 100644
> meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-aesce-do-not-sp=
ecify-an-arch-version-when-enabling-c.patch
>   delete mode 100644
> meta-networking/recipes-connectivity/mbedtls/mbedtls/0002-aesce-use-corre=
ct-target-attribute-when-building-wit.patch
>   rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_3.4.0.bb
> =3D> mbedtls_3.5.0.bb} (87%)
>   create mode 100644
> meta-oe/recipes-extended/indent/indent/CVE-2023-40305_0001.patch
>   create mode 100644
> meta-oe/recipes-extended/indent/indent/CVE-2023-40305_0002.patch
>

