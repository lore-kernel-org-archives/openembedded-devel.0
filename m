Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91CD1C28B30
	for <webhook@archiver.kernel.org>; Sun, 23 Mar 2025 19:14:37 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.web11.21862.1742757271027329129
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Mar 2025 12:14:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AZUIXj+F;
 spf=pass (domain: gmail.com, ip: 209.85.210.49, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-72c0b4a038fso1844580a34.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 23 Mar 2025 12:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742757270; x=1743362070; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9T1tGqwPIE4F5Bc8ClRqxpt5lNAxpaYJnbwXaxkHTkY=;
        b=AZUIXj+FXzdXZqakuNbTW0AQ96f5Ffe6kMgjB/BhvwU82AOCTy69+OyReMCU81X0sZ
         jkjkcj+PKvRE8eAX/Kn6tkZsWy6GtqHDls1PyTQPaCMvTYzmljVQ42ohKaai/tibHpKz
         FG2RK3Jbr+78lFS4wVLCm/X+SZuF7n8PDW9bBkoghu8wlceYfBz2P3mKGgS6tibCC5Ur
         XmW4rBtt3GJDEOH6BWNN43b7GiFvGcVSW4n8SqDH/48a59Z1hXL0rTk7gGUv8J7G6okL
         dJH2cth52Hy0fwQ8hm7fQzfbAkqp4bL3DhkS2WPnEhDce4oQQvz7tpB/Odk1d9Prh1vo
         vjkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742757270; x=1743362070;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9T1tGqwPIE4F5Bc8ClRqxpt5lNAxpaYJnbwXaxkHTkY=;
        b=hmrh5seTDlWCZn3O9s9SwuA1RbwcqUnbOZdRXwlJRq1iC/yXhLvS0bYDDY3xPuO72l
         eAUOSXsosXOys4sMvBT2jP55/vL0IwmCNmG3qHsiUBf/SbtyZOeFOCttVnwHG+utpukZ
         i9NIOmlBagdCFs2oUV/d6UP3HqwIgXtHAW8PzA/KdEx0i67bRyafpK/sh6z/XQg8lVQZ
         NoGv9sNDrLIrwKTsafMcEP+GjfQfPJ9Tjrav6u9x+cHSOGgbjAEPeXqMGPlYz7z/UfjA
         E52XpZndKfswBLo6ILbqrGsJearJKClru5sMg5nnwWEO2BgOHIArgxPE0xjZUrrqVQMj
         VEuA==
X-Gm-Message-State: AOJu0YwmCC2EYZGDfVkUcOTxGUq0aci0tzDAHC305fgcg4qQMu8/cheU
	CwOqybmneZ4cwAuVsHXGGTVwl9ypbSTx8g58n2rS3btQDydgpuupNEkROKV7+b08RpsXVWyW436
	DtNjuAOShlKLoijxpLSiUnSgag7w=
X-Gm-Gg: ASbGncsSoMLaob2TvNZ3/HIpZXhiXi+ywM5ucEnOCJPMN6qGI41MeU0eJgUrhSNVBjA
	shWDDV+v1qkqcLz00Arr2nuQIQ42KTSI6dL/C86OShL0QJiFqrqChHltXCCPBuU/SPzj1Bj6SqA
	dAhEnF5Bc2pSVleXN7az1LaKqU
X-Google-Smtp-Source: AGHT+IEdnsQSuyEjtb3ErSsDlOdtZOF3DkUjGWxTpk3GvsOyHkPuYHlm3vPgkT4RwcnMPGxh2BtsCT+kdSfVIUEgno0=
X-Received: by 2002:a05:6808:1184:b0:3f6:7e4e:96fb with SMTP id
 5614622812f47-3febf73948dmr7524570b6e.17.1742757270020; Sun, 23 Mar 2025
 12:14:30 -0700 (PDT)
MIME-Version: 1.0
References: <952235ba-b7ee-4ba7-831f-3a679c900cf3@gmail.com>
In-Reply-To: <952235ba-b7ee-4ba7-831f-3a679c900cf3@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 23 Mar 2025 12:14:04 -0700
X-Gm-Features: AQ5f1JqKxTfCWbPTo1qLngJfKMRebBq-hCa_ZOmPzII4kaRfIG0HbE7bg2AccOk
Message-ID: <CAMKF1spz4vz10bCmMjfdXmVexFahFCC_2yhrR+O5-FRv8pAHdQ@mail.gmail.com>
Subject: Re: scarthgap merge request: March 23rd
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 23 Mar 2025 19:14:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116204

merged thanks Armin

On Sun, Mar 23, 2025 at 12:06=E2=80=AFPM akuster808 <akuster808@gmail.com> =
wrote:
>
> The following changes since commit 6c9f1f8d4538119803bf793747b65e4d23c335=
44:
>
>    nginx: fix CVE-2025-23419 (2025-03-03 08:09:03 -0500)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded scarthgap-next
>
> for you to fetch changes up to edd1a1e284fdcb80cd48d411f235d47f23bc27ae:
>
>    mongodb: fix build with python 3.12 (2025-03-07 19:40:51 -0500)
>
> ----------------------------------------------------------------
> Awais Belal (1):
>        mongodb: fix build with python 3.12
>
> Peter Marko (1):
>        libmodbus: patch CVE-2024-10918
>
> Virendra Thakur (1):
>        unbound: Fix CVE-2024-8508
>
>   .../recipes-support/unbound/unbound/CVE-2024-8508.patch         | 247
> ++++++++++++++++++++++++++++
>   meta-networking/recipes-support/unbound/unbound_1.19.3.bb       | 4 +-
>   .../0001-moduleconfig.py-python-3.12-compatibility.patch        | 57
> +++++++
>   .../meta-python/recipes-dbs/mongodb/mongodb_git.bb              | 3 +-
>   .../libmodbus/libmodbus/CVE-2024-10918-01.patch                 | 177
> ++++++++++++++++++++
>   .../libmodbus/libmodbus/CVE-2024-10918-02.patch                 | 121
> ++++++++++++++
>   .../libmodbus/libmodbus/CVE-2024-10918-03.patch                 | 84
> ++++++++++
>   .../libmodbus/libmodbus/CVE-2024-10918-04.patch                 | 239
> +++++++++++++++++++++++++++
>   meta-oe/recipes-extended/libmodbus/libmodbus_3.1.10.bb          | 8 +-
>   9 files changed, 936 insertions(+), 4 deletions(-)
>   create mode 100644
> meta-networking/recipes-support/unbound/unbound/CVE-2024-8508.patch
>   create mode 100644
> meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-modul=
econfig.py-python-3.12-compatibility.patch
>   create mode 100644
> meta-oe/recipes-extended/libmodbus/libmodbus/CVE-2024-10918-01.patch
>   create mode 100644
> meta-oe/recipes-extended/libmodbus/libmodbus/CVE-2024-10918-02.patch
>   create mode 100644
> meta-oe/recipes-extended/libmodbus/libmodbus/CVE-2024-10918-03.patch
>   create mode 100644
> meta-oe/recipes-extended/libmodbus/libmodbus/CVE-2024-10918-04.patc

