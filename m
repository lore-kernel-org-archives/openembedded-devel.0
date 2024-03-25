Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81F50C54E64
	for <webhook@archiver.kernel.org>; Mon, 25 Mar 2024 15:36:43 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web10.55629.1711380998148618495
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Mar 2024 08:36:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GnY47BlE;
 spf=pass (domain: gmail.com, ip: 209.85.167.169, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3c3ac720bceso2727048b6e.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 08:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711380997; x=1711985797; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tnjQPFZU2TyvMfb+h2hInQjIWepb0CS1SA1r15MufLY=;
        b=GnY47BlEfzgaBvVubTzA2s7yw2jA96x85tNbZq8XW3phwiIdH2edJ8A3eUbVwYXQ3d
         XOLbokFhJIXPAHdg3wKw4s60bN9SEZbvqNkEsor9wFN6vcePi1tIGb7RAE052DI/KMOd
         5/qZ0zrUsvV79VFvn/LdLrYXMDPfEmT4/7AMvbjV/XgJmPHOh5JcK+P/vigbSNmy4kfC
         zSYmUVs6vxEUmWYx4xIviG7O6M9wHfeIw4s+lrDOpTgmwtjYhKjtd8Spmpqf8g6DVqPO
         uWMGcq1jaz4fi31ZJ5myp4Erdl0QyO2C6583i+p/9HbjpY9Bb5sbA9dTum0Tx+eqrLRs
         5hng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711380997; x=1711985797;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tnjQPFZU2TyvMfb+h2hInQjIWepb0CS1SA1r15MufLY=;
        b=AO1qWkW//nzVH1tK5jpwI0gbHrBqyTr+6V19HZe1hYki3KZx5cqj8sAF6Lg1pURi0Q
         hwk9/3/4zeux08siCc1CU+X2+lTnoKDk+xkM+sOVvvIXaarZdIa9I7ELq2hosTrJqZWT
         iPlGHoXRJbQaDU50KkCRzgl5qg4YPp0oTKrEk1kfP1HVDbQctTjt8G5OlCA2k7FyDsgv
         RJcWvGA+7NDtsSCZ41xF1oJu3QnwMmxcLdQzwZY6HSpFAfjqzXahOr7acnno7n8JHfF5
         ituCqoATtZK4M97k6P0ZUE1a9XYc/27EKw7zCoC1BYbZN9cA5ivho49E1N65Z/WqkPuE
         b5EQ==
X-Gm-Message-State: AOJu0Yw569rOeUC4dQ0RYdksB4t3bGzi7ZOSm4ccZY36+s42RXMPgLaC
	0V1zKtjoZYeteky1AYLBLs1W5rG1ztR9T0UdHiP2XqT/Uyt4tc/G/IURABYQa3tYCZ8yV/+fc0V
	wz4O88F18Skq1afe+eZL6EyifBOY=
X-Google-Smtp-Source: AGHT+IFG+UCkDaaCVVba4XNseKTcq0INrK71XUrS7s+74WQoBuKbKiyp4rW6Pa+aT3+BG8wHbE+/puFfzMc7RWC/j/E=
X-Received: by 2002:a05:6870:7252:b0:220:a0b0:6d4a with SMTP id
 y18-20020a056870725200b00220a0b06d4amr8651287oaf.57.1711380997336; Mon, 25
 Mar 2024 08:36:37 -0700 (PDT)
MIME-Version: 1.0
References: <4d9e595a-b765-4364-b92c-18deebdc7ce0@gmail.com>
In-Reply-To: <4d9e595a-b765-4364-b92c-18deebdc7ce0@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 25 Mar 2024 08:36:10 -0700
Message-ID: <CAMKF1sqgkN0OFs4LwwC57=_GDDr+zJ+We_mgyy4y4DfUxK45Yw@mail.gmail.com>
Subject: Re: kirkstone merge request: Marck 25th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 15:36:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109593

merged thanks Armin

On Mon, Mar 25, 2024 at 4:14=E2=80=AFAM akuster808 <akuster808@gmail.com> w=
rote:
>
> The following changes since commit fda737ec0cc1d2a5217548a560074a8e4d5ec5=
80:
>
>    mbedtls: Upgrade 3.5.0 -> 3.5.2 (2024-02-28 08:18:18 -0500)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded kirkstone-next
>
> for you to fetch changes up to 8bb16533532b6abc2eded7d9961ab2a108fd7a5b:
>
>    dnsmasq: Upgrade 2.87 -> 2.90 (2024-03-25 07:11:05 -0400)
>
> ----------------------------------------------------------------
> Anuj Mittal (1):
>        opencv: fix reproducibility issues
>
> Soumya Sambu (4):
>        openvpn: ignore CVE-2023-7235
>        postgresql: Upgrade to 14.11
>        unixodbc: Fix CVE-2024-1013
>        dnsmasq: Upgrade 2.87 -> 2.90
>
> Vivek Kumbhar (1):
>        openjpeg: Backport fix CVE-2021-3575
>
> Yogita Urade (1):
>        c-ares: fix CVE-2024-25629
>
>   meta-networking/recipes-support/dnsmasq/dnsmasq.inc             | 1 -
>   meta-networking/recipes-support/dnsmasq/dnsmasq/lua.patch       | 31 --=
-
>   meta-networking/recipes-support/dnsmasq/dnsmasq_2.87.bb         | 7 -
>   meta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb         | 3 +
>   .../recipes-support/dnsmasq/files/CVE-2023-28450.patch          | 48 --=
---
>   meta-networking/recipes-support/openvpn/openvpn_2.5.6.bb        | 3 +
>   .../0001-configure.ac-bypass-autoconf-2.69-version-check.patch  | 6 +-
>   meta-oe/recipes-dbs/postgresql/files/CVE-2023-5868.patch        | 125
> ------------
>   meta-oe/recipes-dbs/postgresql/files/CVE-2023-5869.patch        | 294
> ----------------------------
>   meta-oe/recipes-dbs/postgresql/files/CVE-2023-5870.patch        | 108
> ----------
>   .../postgresql/{postgresql_14.9.bb =3D> postgresql_14.11.bb} |   7 +-
>   meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2021-3575.patch  | 45 ++=
+++
>   meta-oe/recipes-graphics/openjpeg/openjpeg_2.4.0.bb             | 1 +
>   meta-oe/recipes-support/c-ares/c-ares/CVE-2024-25629.patch      | 34 ++=
++
>   meta-oe/recipes-support/c-ares/c-ares_1.18.1.bb                 | 1 +
>   meta-oe/recipes-support/opencv/opencv_4.5.5.bb                  | 34 ++=
--
>   meta-oe/recipes-support/unixodbc/files/CVE-2024-1013.patch      | 53 ++=
+++
>   meta-oe/recipes-support/unixodbc/unixodbc_2.3.9.bb              | 1 +
>   18 files changed, 163 insertions(+), 639 deletions(-)
>   delete mode 100644
> meta-networking/recipes-support/dnsmasq/dnsmasq/lua.patch
>   delete mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq_2.87=
.bb
>   create mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq_2.90=
.bb
>   delete mode 100644
> meta-networking/recipes-support/dnsmasq/files/CVE-2023-28450.patch
>   delete mode 100644
> meta-oe/recipes-dbs/postgresql/files/CVE-2023-5868.patch
>   delete mode 100644
> meta-oe/recipes-dbs/postgresql/files/CVE-2023-5869.patch
>   delete mode 100644
> meta-oe/recipes-dbs/postgresql/files/CVE-2023-5870.patch
>   rename meta-oe/recipes-dbs/postgresql/{postgresql_14.9.bb =3D>
> postgresql_14.11.bb} (61%)
>   create mode 100644
> meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2021-3575.patch
>   create mode 100644
> meta-oe/recipes-support/c-ares/c-ares/CVE-2024-25629.patch
>   create mode 100644
> meta-oe/recipes-support/unixodbc/files/CVE-2024-1013.patch
>

