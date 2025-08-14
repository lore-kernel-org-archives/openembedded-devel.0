Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0EEFCA0EDC
	for <webhook@archiver.kernel.org>; Thu, 14 Aug 2025 15:53:03 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.26147.1755186775147275351
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Aug 2025 08:52:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hQ4BzZtA;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-55ce4b9c904so1357031e87.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 Aug 2025 08:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755186773; x=1755791573; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dhVWWhLGuHEN/MVFD5pZuHdlOTdmW5obyhSemjvnoEs=;
        b=hQ4BzZtACajDi+dK5rHRIH1f9otH2cF8/PxNOqcYV13N1CIIgOuj6YpRHxOuGsYcmX
         skcD4JJEef6LvqQPoS1IKUbXwPPx0pg6C6Jmzll7QHQ6OPEL9guEQeqP1GgN+JhumLB7
         3CJzmbShEPURwTFPm5c3zqlkdFlWiEUQ7/6vEOJu0aQvwhyAUOGx1WGUN310OFAk/3MT
         A0VjvAJSqLs7He4rHCwx0zXSSgFLVBanfA7coL2amczJIVPijqYZrvCJh9ep2y+U0NuG
         9nW8n8IoFKDioOP4KesJ3C6PX+iRH2/CBD5fCdCS4mx+rPiKUpw62LISmcuJxj4MW7KV
         M6pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755186773; x=1755791573;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dhVWWhLGuHEN/MVFD5pZuHdlOTdmW5obyhSemjvnoEs=;
        b=Mq0BMKhNNy1M5Kko5m1dGGPK35rd1ltkZridtcYfogBSa+sMfpvTnBl60M2B5PmGFT
         GsAI4tjOa8Fw9xw9UWSLJgndfb0nU6m3OS98yvO5+tkRN0PH58AmYjXWVRBf8H2yJDJM
         3jnp8JImUnzqbdZLSnlHhhddYNP1WSui4unQtOzQgTFTQsomV5h07MjjiQL4TspUfITy
         gzC8N5ZF2mk5t6idQtr1r2N4AA5j2DMa8DlwpdBhwhytgaPRVBr+nkCA13B7Db+JzEOO
         mI4UQD3WhAAW7FjuS57dDsC9hARAx4nXtiQb+JrqF/TVYCZtImkACV5Ff0cq64MbyZSx
         jqeA==
X-Gm-Message-State: AOJu0Ywsg8scc9b41byikBbCWx4epA7wpZwfKnTB9MqcDa/XkNxWKWoU
	Q7r6tpwY2SaRHxTLG6zp66DnJDC7hA33eUcqNZNDUMxwpPLIzVpvMRX5OlrciCYkksVh7sLh7+o
	8wPJHSOdy4KgEqNkKmhFZal6jH6al264=
X-Gm-Gg: ASbGnctmmJznPRPGnMZMawQbXLbaH69wdWZAlq3hVKFr7+vBeOymdssCL1T73X52LfF
	jN5c3bhCj4ZdyUqhZHXF17xLOwYablB+sLQ4gAcxo1hjAq6Q/g6/8XHP67hYZuTvsdhXJ6Ayrtc
	kzgSlZ1mXSKBTeee89oybx8fcag24poCngKHZbV4z2Qy29luNzJyp3UpRbpuR32r9vxMImMkqEL
	KM3XpWEjbZRtoJF8HYU
X-Google-Smtp-Source: AGHT+IHWIi+gn1EjXIe3f2UpNU/hfHneLXCVAropBtt5knhTzF/3WTsPRLJuZBgsjdaqYVQbfnNlJs1fUMLJyPEk+T4=
X-Received: by 2002:ac2:5688:0:b0:55b:73e4:1581 with SMTP id
 2adb3069b0e04-55ce645e345mr776472e87.3.1755186772894; Thu, 14 Aug 2025
 08:52:52 -0700 (PDT)
MIME-Version: 1.0
References: <185811E8B1BD090E.15936@lists.openembedded.org>
In-Reply-To: <185811E8B1BD090E.15936@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 14 Aug 2025 17:52:40 +0200
X-Gm-Features: Ac12FXxVJaTtRm3wR0r4YDodxrEHWsv3zU2KBvLAWm2ekn3vSRQRQvWAYHzjoOI
Message-ID: <CA+chaQcUKXUhLw-MjC9G+fbYVHdxS7gjTn8Ne3R6==wcmctYyQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][scarthgap][PATCH] jq: add Upstream-Status and CVE
 tags into .patch files
To: martin.jansa@gmail.com
Cc: openembedded-devel@lists.openembedded.org, 
	Armin Kuster <akuster808@gmail.com>, Roland Kovacs <roland.kovacs@est.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Aug 2025 15:53:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118935

Ping

Armin: I see scarthgap-next was updated now, but this isn't included.

On Sat, Aug 2, 2025 at 11:55=E2=80=AFPM Martin Jansa via
lists.openembedded.org <martin.jansa=3Dgmail.com@lists.openembedded.org>
wrote:
>
> From: Roland Kovacs <roland.kovacs@est.tech>
>
> v1 version was merged instead of v2 from:
> https://lists.openembedded.org/g/openembedded-devel/message/118302
> add missing Upstream-Status and CVE tags from v2.
>
> Signed-off-by: Roland Kovacs <roland.kovacs@est.tech>
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
>  meta-oe/recipes-devtools/jq/jq/CVE-2024-23337.patch | 3 +++
>  meta-oe/recipes-devtools/jq/jq/CVE-2024-53427.patch | 3 +++
>  meta-oe/recipes-devtools/jq/jq/CVE-2025-48060.patch | 3 +++
>  3 files changed, 9 insertions(+)
>
> diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2024-23337.patch b/meta-o=
e/recipes-devtools/jq/jq/CVE-2024-23337.patch
> index 93f55eecd0..8b8243b752 100644
> --- a/meta-oe/recipes-devtools/jq/jq/CVE-2024-23337.patch
> +++ b/meta-oe/recipes-devtools/jq/jq/CVE-2024-23337.patch
> @@ -8,6 +8,9 @@ This commit fixes signed integer overflow and SEGV issues=
 on growing
>  arrays and objects. The size of arrays and objects is now limited to
>  `536870912` (`0x20000000`). This fixes CVE-2024-23337 and fixes #3262.
>
> +Upstream-Status: Backport [https://github.com/jqlang/jq.git/commit/de213=
86681c0df0104a99d9d09db23a9b2a78b1e]
> +CVE: CVE-2024-23337
> +
>  (cherry picked from commit de21386681c0df0104a99d9d09db23a9b2a78b1e)
>  Signed-off-by: Roland Kovacs <roland.kovacs@est.tech>
>  ---
> diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2024-53427.patch b/meta-o=
e/recipes-devtools/jq/jq/CVE-2024-53427.patch
> index 3e27a13036..64a44a1307 100644
> --- a/meta-oe/recipes-devtools/jq/jq/CVE-2024-53427.patch
> +++ b/meta-oe/recipes-devtools/jq/jq/CVE-2024-53427.patch
> @@ -7,6 +7,9 @@ This commit drops support for parsing NaN with payload in=
 JSON like
>  `NaN123` and fixes CVE-2024-53427. Other JSON extensions like `NaN` and
>  `Infinity` are still supported. Fixes #3023, fixes #3196, fixes #3246.
>
> +Upstream-Status: Backport [https://github.com/jqlang/jq.git/commit/a09a4=
dfd55e6c24d04b35062ccfe4509748b1dd3]
> +CVE: CVE-2024-53427
> +
>  (cherry picked from commit a09a4dfd55e6c24d04b35062ccfe4509748b1dd3)
>  Signed-off-by: Roland Kovacs <roland.kovacs@est.tech>
>  ---
> diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2025-48060.patch b/meta-o=
e/recipes-devtools/jq/jq/CVE-2025-48060.patch
> index 237a50413f..c3dfd8ce21 100644
> --- a/meta-oe/recipes-devtools/jq/jq/CVE-2025-48060.patch
> +++ b/meta-oe/recipes-devtools/jq/jq/CVE-2025-48060.patch
> @@ -9,6 +9,9 @@ GHSA-p7rr-28xf-3m5w (`0[""*0]`) was fixed by the commit d=
c849e9bb74a,
>  but another case (`0[[]|implode]`) was still vulnerable. This commit
>  ensures string data is properly null-terminated, and fixes CVE-2025-4806=
0.
>
> +Upstream-Status: Backport [https://github.com/jqlang/jq.git/commit/c6e04=
1699d8cd31b97375a2596217aff2cfca85b]
> +CVE: CVE-2025-48060
> +
>  (cherry picked from commit c6e041699d8cd31b97375a2596217aff2cfca85b)
>  Signed-off-by: Roland Kovacs <roland.kovacs@est.tech>
>  ---
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#118831): https://lists.openembedded.org/g/openembedde=
d-devel/message/118831
> Mute This Topic: https://lists.openembedded.org/mt/114507508/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

