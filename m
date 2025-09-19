Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1975CAC59A
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 19:25:20 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web11.4897.1758309913717713475
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Sep 2025 12:25:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Qec9Zour;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-73b4e3d0756so16518777b3.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 Sep 2025 12:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758309913; x=1758914713; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WOTW4qZJIQLd+SFCTyfKC+2KY45YpmV1tpKH3FPVAO4=;
        b=Qec9ZournhD3BH/4nCbQZINlrcWJ/jdkxCwOwMMtHwUxtoJTA8DsT80IU3K+9j8m1/
         HpiuCarjIWEdD46TgAWGqBQiAnprdXsK93xDH4xhAxdB+lT478u2Nuj7cS+8nJjFTXEN
         +OE3w57EtjlqfjC7ktMOVRTs33RwXBdhGttH7U+PbHjveOGvRXiQdZGJhT2wH2qg9dOo
         1bggLRU01Dh84Ipo6mfmU/em90SZRzM+AExeqla2GgLbeQs56jFQ2DRY015fjph4c5bk
         +MCoXWi0azNuqnaR7pT8uQGEepTYjqzj7RqQ2dEvWe4fhwCZQfRhPJwQvXHpEKc672D6
         059Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758309913; x=1758914713;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WOTW4qZJIQLd+SFCTyfKC+2KY45YpmV1tpKH3FPVAO4=;
        b=T9FKvDM1q0d1rcXrsca5GhWpLfNR52EFNQ3xz6KZhm2ewr5sxtrctWHEfLpZ02G+Gc
         OJoNukdJri3P4lAGPZ4iVT5s1zAoA2L4QPwhbjhrhPF79V5x+c92GluG1Cl94IF4oUx9
         B6Mek423nASr1z1/NoQ0kISQWloVGlRSV2JA5tVi76m3ZL2cddZ89zblef2/Q0Y7z+g5
         yLoJMIsIqzC1hTIHiwt0LiY6NkMNdYMgM/LPHf45/0NMoimYcpGMcexi3SoBuvynpzK4
         wq3eLF9BzcMNM3HbcHKDSsNcLaBa9F8rRcAjwwWC1P8xZY2uXp6gVOBnZg/eTHwhnj63
         /kuQ==
X-Gm-Message-State: AOJu0YwZmLV+HEqfz2nDE0qF2IBEEjO/RE9bwnMVV5VgW4GbiPtXF0Cd
	7ogNfSXSnI3ZGzOP+uUKuYV+fJxw23wMReFuLIq0uMBDKLcfXTBlmFpcpB2K977j3W1fvPbixvv
	3q0xZSfH///sUmfKNJ7kGpEnciSCkCxw=
X-Gm-Gg: ASbGncuMm1q4wSFCrDUB+MgVxFiimy4I8mRcVxW3X3Lfg1HfQH4I3HumikHdF2P5B2j
	wrTXGycIKDe8p5dIy5ohcma//NOVL5wzdSA+SD/zw/2uyWzJUK56N2xEeqC1ri5n1/WBbYC9AVm
	9lyjPRSZsRdNXHok6qTj2QrHtHqPDkk8KI4fefuDhw4grZBmsiyEI3l0hM8fD8+M9SapCjHpemJ
	dIbE7u5PjFeVKuheg7WrRDtkX8cR6dLS7aDiLxF5ThwVs4KNQa5DdGZxD6XnAUvtkc4IyRdgeKp
	kC/yswkOWucRDptbMHtbWDOE
X-Google-Smtp-Source: AGHT+IHCyuk0W7v6+3D6HJ+iECfHUUnPiFwVe5tfPRqZGCZX3N390w4ZVILOqhWzOaDvhuQdfw31GtCw8eizm38c128=
X-Received: by 2002:a05:690c:4882:b0:73a:27e7:e736 with SMTP id
 00721157ae682-73d3fc9d810mr40659457b3.50.1758309912543; Fri, 19 Sep 2025
 12:25:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250918071548.3934769-1-hongxu.jia@windriver.com> <20250918071548.3934769-3-hongxu.jia@windriver.com>
In-Reply-To: <20250918071548.3934769-3-hongxu.jia@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 19 Sep 2025 12:24:46 -0700
X-Gm-Features: AS18NWDHAjxpFclROXsWTpo_IaGHZlGZrJDXpgyOK-cBLF7hhRmeP50m2qNHK3A
Message-ID: <CAMKF1sqJm2aZsrinVihyfHnZ74D1JznhzhGYqanZkwobLJBZpA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 3/4] python3-propcache: support reproducible
To: hongxu.jia@eng.windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Sep 2025 19:25:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119612

On Thu, Sep 18, 2025 at 12:16=E2=80=AFAM hongxu via lists.openembedded.org
<hongxu.jia=3Deng.windriver.com@lists.openembedded.org> wrote:
>
> In order to make the generated library be reproducible, build wheel
> in source dir other than tmp dir (/tmp/xxxxxx), then yocto toolchain's
> option -fdebug-prefix-map could work as expected
>
> Note: To support reproducible, it also requires oe-core commit [1] to be =
merged
>
> [1] https://lists.openembedded.org/g/openembedded-core/message/223604?p=
=3D%2C%2C%2C20%2C0%2C0%2C0%3A%3ACreated%2C%2C%2C20%2C2%2C0%2C115291386%2Cd%=
253D3&d=3D3
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  .../recipes-devtools/python/python3-propcache_0.3.2.bb        | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta-python/recipes-devtools/python/python3-propcache_0.3.2.=
bb b/meta-python/recipes-devtools/python/python3-propcache_0.3.2.bb
> index e78d7b3428..8e2394a5c4 100644
> --- a/meta-python/recipes-devtools/python/python3-propcache_0.3.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-propcache_0.3.2.bb
> @@ -7,6 +7,10 @@ SRC_URI[sha256sum] =3D "20d7d62e4e7ef05f221e0db2856b9795=
40686342e7dd9973b815599c70
>
>  inherit pypi python_setuptools_build_meta ptest-python-pytest cython
>
> +SRC_URI +=3D " \
> +    file://0001-build-wheel-in-place.patch \
> +"

This patch file is missing

> +
>  DEPENDS +=3D " \
>         python3-expandvars-native \
>  "
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119533): https://lists.openembedded.org/g/openembedde=
d-devel/message/119533
> Mute This Topic: https://lists.openembedded.org/mt/115306111/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

