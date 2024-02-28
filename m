Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95730C5478C
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 16:24:36 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web11.959.1709137470981914281
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Feb 2024 08:24:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dWQJHRsH;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-21edca2a89dso3066521fac.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 28 Feb 2024 08:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709137470; x=1709742270; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wyU0Sld9Oq1DNNIodVjmuG5Gp4FlF4McFzxM2XGi/PI=;
        b=dWQJHRsH8IEOFe+39Of5hhKZZilPXfMMMl4eRHjPUWO14pnaJl4m2Bv1i0P/RlM5ST
         AQ9AICqquBPh3FbyQjd8AYP7HNAUeKOF9+yRbvQctcuzbrfMcH8hlwwMHor/KIO4UL09
         pn1qId10yB+Uo7XyMQswdgnlrm691egMQLk+IdUKErFyAyY+CjVjJhYk6jThNkP/8eHt
         LMrja/SMqkpQZV4FtqU2UiJQvTVaDh7LSqfQ5eUqmMWTi3p99fsF0mtIMuu+crAwdsFM
         BFK9zLtP+c9+4I3H09oZxMBWCb/rPfzA7FNwcyHDdHrzJPluhjtBb14D6WIiP55hKE6T
         grAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709137470; x=1709742270;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wyU0Sld9Oq1DNNIodVjmuG5Gp4FlF4McFzxM2XGi/PI=;
        b=WCZDQbo4KrIMXPZIoEbSckTM5TCJc8lad1HcA1GXVaEn/1kES3g8ebs7DgRTrsF+5W
         D7cTtP7q0zrdqGWrSaRbu8H7lAI2mFg+CIpiws1usfy3xtH3YTeqPE1c4n5cGw4SA33l
         7++mLCXPlAvLn6SQt16nVUmCeYauPWVv9idLKIabx1pobdC/1L02pu1HdKo36phiI1yW
         HbA+7DMtKIRwNihwJ72omgA16SSpY1KjsqGkhFYDwLUFjDUV0jZXw9huebw3iTZrUKtZ
         VrQRYf1rpVnrlUMKjV9BZVVKLAeHLCW6A5KJVmOBKQEuNZy3wzqF4aT8mU1I7Y747SNV
         VfnA==
X-Gm-Message-State: AOJu0Ywyf7xTRqoGKmgtBdiquWeYs/c3t8ruYQYbIcagsrhWhypLK4j3
	ou31+HVNaRPVVu9TWuIMelEC8jxk54smj0qvqF7mNkFI90MpKHTe7fLeaDwz5QcFciAYt97dAn4
	LOHDyJOHNFZms4HAc+9lROFlHT60=
X-Google-Smtp-Source: AGHT+IFu3GhGVM8Xy48zBfyj35vpe56OMQ1cyvjW+hO6cnoqC0X9g5TIjvqomie47sI8L3V/bNS9Lmkvmn22D6Lo/KE=
X-Received: by 2002:a05:6870:718b:b0:21e:3d6e:bb85 with SMTP id
 d11-20020a056870718b00b0021e3d6ebb85mr244382oah.0.1709137470154; Wed, 28 Feb
 2024 08:24:30 -0800 (PST)
MIME-Version: 1.0
References: <a7d682bd-3f5d-4b16-af5e-b762bbf64420@gmail.com>
In-Reply-To: <a7d682bd-3f5d-4b16-af5e-b762bbf64420@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 28 Feb 2024 08:24:04 -0800
Message-ID: <CAMKF1spam6DYTARtHUQxAOogyrN9FjByycZTOVSKhfsDKfAPuQ@mail.gmail.com>
Subject: Re: kirkstone-next merge request: Feb 28th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Feb 2024 16:24:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109054

merged into kirkstone, thanks Armin

On Wed, Feb 28, 2024 at 5:22=E2=80=AFAM akuster808 <akuster808@gmail.com> w=
rote:
>
> The following changes since commit 8609de00952d65bb813a48c535c937324efeb1=
8a:
>
>    Revert "libcroco: Add fix for CVE-2020-12825" (2024-02-07 18:41:41 -05=
00)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded kirkstone-next
>
> for you to fetch changes up to fda737ec0cc1d2a5217548a560074a8e4d5ec580:
>
>    mbedtls: Upgrade 3.5.0 -> 3.5.2 (2024-02-28 08:18:18 -0500)
>
> ----------------------------------------------------------------
> Fathi Boudra (1):
>        python3-django: upgrade from 4.2.7 to 4.2.10
>
> Meenali Gupta (1):
>        graphviz: fix CVE-2023-46045
>
> Soumya Sambu (2):
>        mbedtls: upgrade 2.28.5 -> 2.28.7
>        mbedtls: Upgrade 3.5.0 -> 3.5.2
>
> Vijay Anusuri (1):
>        squid: Backport fix for CVE-2023-49286 and CVE-2023-50269
>
> Yogita Urade (1):
>        mariadb: fix CVE-2023-22084
>
> virendra thakur (1):
>        nodejs: Set CVE_PRODUCT to "node.js"
>
>   .../mbedtls/{mbedtls_2.28.5.bb =3D> mbedtls_2.28.7.bb} |  6 +-
>   .../mbedtls/{mbedtls_3.5.0.bb =3D> mbedtls_3.5.2.bb} |  7 ++-
>   .../recipes-daemons/squid/files/CVE-2023-49286.patch            | 87
> +++++++++++++++++++++++++++
>   .../recipes-daemons/squid/files/CVE-2023-50269.patch            | 62
> ++++++++++++++++++++
>   meta-networking/recipes-daemons/squid/squid_4.15.bb             | 2 +
>   meta-oe/recipes-dbs/mysql/mariadb.inc                           | 1 +
>   meta-oe/recipes-dbs/mysql/mariadb/CVE-2023-22084.patch          | 91
> +++++++++++++++++++++++++++++
>   meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb               | 2 +
>   .../recipes-graphics/graphviz/graphviz/CVE-2023-46045-1.patch   | 38
> ++++++++++++
>   .../recipes-graphics/graphviz/graphviz/CVE-2023-46045-2.patch   | 39
> +++++++++++++
>   .../recipes-graphics/graphviz/graphviz/CVE-2023-46045-3.patch   | 31
> ++++++++++
>   meta-oe/recipes-graphics/graphviz/graphviz_2.50.0.bb            | 3 +
>   .../{python3-django_4.2.7.bb =3D> python3-django_4.2.10.bb} |  2 +-
>   13 files changed, 364 insertions(+), 7 deletions(-)
>   rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_2.28.5.bb
> =3D> mbedtls_2.28.7.bb} (91%)
>   rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_3.5.0.bb
> =3D> mbedtls_3.5.2.bb} (93%)
>   create mode 100644
> meta-networking/recipes-daemons/squid/files/CVE-2023-49286.patch
>   create mode 100644
> meta-networking/recipes-daemons/squid/files/CVE-2023-50269.patch
>   create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/CVE-2023-22084.pat=
ch
>   create mode 100644
> meta-oe/recipes-graphics/graphviz/graphviz/CVE-2023-46045-1.patch
>   create mode 100644
> meta-oe/recipes-graphics/graphviz/graphviz/CVE-2023-46045-2.patch
>   create mode 100644
> meta-oe/recipes-graphics/graphviz/graphviz/CVE-2023-46045-3.patch
>   rename meta-python/recipes-devtools/python/{python3-django_4.2.7.bb =3D=
>
> python3-django_4.2.10.bb} (77%)
>

