Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70974C3DA61
	for <webhook@archiver.kernel.org>; Sun, 21 Jul 2024 20:41:50 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web11.4548.1721594501964642168
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 21 Jul 2024 13:41:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iP/l9SUl;
 spf=pass (domain: gmail.com, ip: 209.85.219.178, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e02b79c6f21so3626452276.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 21 Jul 2024 13:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721594501; x=1722199301; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SYaTLySsTNLhNuYusu5aw3Qb/JTvy3ROSfZoJuhRXi8=;
        b=iP/l9SUly8PwIp9c5FgccarMaXG3ZaOiXPO1pOmnmXF0b19pTYU7nMLNqZmhFAHJhu
         H3jR5n6XRiKuOEbbuV8n5vk6U4Sl0CtH8sckBNg8OTsEILOTJZNqY07sN+EKU19UEj3b
         ZKccc2I0v386R9rR4st2sEwwAzIdzfR97faadgrHz8RM0bfpkqQiWkS2x7JjvcBBlD+g
         ubt34Slpt07XqaqxryO+e41dnYu0Fd+B1der/KCDnSyf5BfhVM2AL0xT0Zsf3NQVD08n
         uw8X23zOxxBaDVQ1yjdLHtpY5NYLcZEWzxgu2ZxsklHdxJ1umLV3PR8chvi3iscsG5AI
         hWyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721594501; x=1722199301;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SYaTLySsTNLhNuYusu5aw3Qb/JTvy3ROSfZoJuhRXi8=;
        b=cXrwr+z4Wa1z+OtjCcJYkbEUF4z/HU5P77xUHJtPu6ZDdlq2B6O6pRt/6Kd9g+0dhm
         2Bi7oM0gAERaZemQfuFp0KdO8yGKs4X5kcw2c5KPUBVjEHRqALabuGHnkKqZgGjax9gP
         OSCRK2S/2oOa4uJhQ50wEZE0HNfj/FxKmOWjowxBNqdQPjTxmlng3ttgR2I2WPCzwDja
         xWv4P7lkIU9tREvgG/izf8UkIrb5Uiv3iJEbqxX/dhK6NwyDarHGQbvUnIEgc1pp/Hgb
         p14I5dREMCd4I2W4qPNajIfLX9lhRp/Ky84e081iE+QmCOGRlwph4B97G6HFY/vKnmnv
         MwJw==
X-Gm-Message-State: AOJu0YwJzBylrmoVtws/n+VOy5wgWm9Sg7KY9WQBYCKw0Izby9mjEQem
	8m7qdVRoYLiMtoTqCk73xH1u7J+IibIeuz7UQ4UNFTpX0IpngZ0Ku+MiSlIpekDOdHWv7L/e3+d
	IjOOOO1W81exHLZyIQUT5nKGqfIg=
X-Google-Smtp-Source: AGHT+IH33xP3fEu2ffMPepolm/aDVlyQR3PIAMiAo6NkUMiW6A7uBNWiGD35nKZkBknKB8tZN7cPHNkiXkxBtXFYAKI=
X-Received: by 2002:a05:6902:d43:b0:e03:a2d0:3387 with SMTP id
 3f1490d57ef6-e0870073c17mr5797205276.23.1721594500962; Sun, 21 Jul 2024
 13:41:40 -0700 (PDT)
MIME-Version: 1.0
References: <f022bce3-ae11-41d6-9f74-954192be0a98@gmail.com>
In-Reply-To: <f022bce3-ae11-41d6-9f74-954192be0a98@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 21 Jul 2024 13:41:14 -0700
Message-ID: <CAMKF1sp2ve_=v12YVJ6WB+2nkeYca2yptdR3k4NHa4J-dCmTBQ@mail.gmail.com>
Subject: Re: kirkstone merge request: July 21st
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 21 Jul 2024 20:41:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111423

meged thanks Armin.

On Sun, Jul 21, 2024 at 11:43=E2=80=AFAM akuster808 <akuster808@gmail.com> =
wrote:
>
> The following changes since commit 6ff0748a4741517519a281985fc3cd95dadb63=
3e:
>
>    php: Upgrade to 8.1.29 (2024-06-27 11:32:38 -0400)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded kirkstone-next
>
> for you to fetch changes up to 4052c97dc83d0c88fc277d6fc1815e0699020daa:
>
>    xfce4-panel-profiles:fix tar error (2024-07-17 20:10:27 -0400)
>
> ----------------------------------------------------------------
> Jasper Orschulko (1):
>        nginx-1.20.1: Drop reference to removed patch
>
> Kai Kang (1):
>        xfce4-panel-profiles:fix tar error
>
> Martin Jansa (1):
>        giflib: fix build with gold and avoid imagemagick-native dependenc=
y
>
> Siddharth Doshi (1):
>        apache2: Upgrade 2.4.59 -> 2.4.60
>
> Vijay Anusuri (1):
>        krb5: Fix for CVE-2024-37370 and CVE-2024-37371
>
>   .../krb5/krb5/CVE-2024-37370_37371-pre1.patch                   | 168
> +++++++++
>   .../recipes-connectivity/krb5/krb5/CVE-2024-37370_37371.patch   | 538
> ++++++++++++++++++++++++++++
>   meta-oe/recipes-connectivity/krb5/krb5_1.17.2.bb                | 2 +
>   .../files/add_suffix_to_convert_binary_used_in_Makefile.patch   | 42 --=
-
>   .../giflib/0001-Makefile-fix-typo-in-soname-argument.patch      | 34 ++
>   meta-oe/recipes-devtools/giflib/giflib_5.2.2.bb                 | 8 +-
>   .../apache2/{apache2_2.4.59.bb =3D> apache2_2.4.60.bb} |   2 +-
>   meta-webserver/recipes-httpd/nginx/nginx_1.20.1.bb              | 1 -
>   .../0001-Makefile.in.in-Pass-arguments-to-tar.patch             | 30 ++
>   .../xfce4-panel-profiles/xfce4-panel-profiles_1.0.13.bb         | 1 +
>   10 files changed, 779 insertions(+), 47 deletions(-)
>   create mode 100644
> meta-oe/recipes-connectivity/krb5/krb5/CVE-2024-37370_37371-pre1.patch
>   create mode 100644
> meta-oe/recipes-connectivity/krb5/krb5/CVE-2024-37370_37371.patch
>   delete mode 100644
> meta-oe/recipes-devtools/giflib/files/add_suffix_to_convert_binary_used_i=
n_Makefile.patch
>   create mode 100644
> meta-oe/recipes-devtools/giflib/giflib/0001-Makefile-fix-typo-in-soname-a=
rgument.patch
>   rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.59.bb =3D>
> apache2_2.4.60.bb} (99%)
>   create mode 100644
> meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles/0001-Mak=
efile.in.in-Pass-arguments-to-tar.patch
>

