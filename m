Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E88FCD5BD5
	for <webhook@archiver.kernel.org>; Thu, 28 May 2026 22:31:56 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22509.1780007506661114176
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 May 2026 15:31:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=I8iPtYNO;
 spf=pass (domain: gmail.com, ip: 209.85.167.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-479ef2b78f3so11701654b6e.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 28 May 2026 15:31:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780007506; cv=none;
        d=google.com; s=arc-20240605;
        b=aWqXE3vxtyYbx3pVdLKGtyzAZ4my05MP/VecM6P8w3EHnX6lmQLLoYRx4QMMOiSmIy
         MYb1L1M86vzmrhwFibXHH2+QzDAusiK32nk57mFKuiSKf2HQniMwyOdYEaMOQgp4M79c
         c4A835S4cqhEn3qAEf6uGkpa3j95nNHNoQoLCEw1jI9m9FArppXTJma8KZhbLnCXUfKV
         bR4MQ3F38tYhl3c3JJrNaCWKLp9E6RISqcfJQphXk0bUZONhMyiacKulGSBJWrqwRPSb
         BtHMPMGSjYT4NID9Fd6xDI3VF96Yn9gN9RcpkgdhxgLUy6iWDuTS8aVgsulFIJhXL12m
         t/aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K0Hu1yLoOQYm+f35G3wtZ5vTBklrJvko0DdT+4PLrW4=;
        fh=t00iliNe9pL0QaiZgATkfZzbJzbg/gzT7cLy1S2kUZs=;
        b=NLLgAVe2H1Spyl+8PMOACk3h527hpe41n0+I73jwOyKeAYRzA4217H2ce3/GHq9pPF
         9EjztAPCq1l5xnxYjimGj3z+WO+gdrh1CintdxwJb5+0qUS1ilqEYNU4PIuxbQUGwhuY
         5pfm/hQ+5Ves20WaJOHVOlR4gBx7snpIRMVHuKztMAJiWPssFjNCm37u/JOvs+oi0PPN
         UY3/XEAO84d0Us21A4aQ06MyRj1Df8/IQ/BmqQaktR5S8sM50zqNwNzgek9mAEJ36FXR
         yXgyklsLH6UD1aHfq6xhZMYiad1/oqjx1a5QtrEIfKPQBWMloMGg7HVyTw5FCeuGdC3U
         evwA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780007506; x=1780612306; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K0Hu1yLoOQYm+f35G3wtZ5vTBklrJvko0DdT+4PLrW4=;
        b=I8iPtYNO9E7cPDq0L4G7DqeiF7hc7nJiO4P8GLRDG9nMRcluRGmbCwUw5nrt1l0/Af
         3e/uMIVLV+6SESxxdlVsSTs90+yh+QhyZ0w+xEksQXmJnq3rSJwEVJo/2MZ1VeCccXpF
         pIP9Q/LEpccz3YoKr5g500n5IQ0pWX5bw2/o5N+NR5nlE9jXRl3mW7uIzjarKRxTMxyM
         Y9sTxKrPRcQ7Om7pLG1rrOgLWqzk13QX15vcnLCuqVaz6ZxRZ7D9I31EySCAAC1aw3gn
         ZhakuJzHuNmrLQGzimFfLxEXL4C5UF83V8cfn/nyx7PuafkScxckmHX449/ugJtNDpPR
         ZzyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780007506; x=1780612306;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K0Hu1yLoOQYm+f35G3wtZ5vTBklrJvko0DdT+4PLrW4=;
        b=LQmghEUH3Pobs0Y55Ernd5cGvxOZ9NEPQhnd8D4YRsy9n2dbNDatBZWvTlyfA47uQh
         wSVMnXKct24VK9iPoMpLPfCNpriHW6Sbt3MmKpvTLG1NQu3oXweBQ8A1yVszeHuNAnHF
         OfNA/fQ9dE4njCGX76uyvVp6C70w6p6YhHsQdoh1DUSETDlHQEzv+VSPUnqj6pYo/g6T
         YU0YzBME7z6W7q4Znm85GQaO8NKTsQ8+Fjx+O9ySWBAfLg7rCAyxU9udXjaDyHU/l0at
         AERH8UxFyoFU1xmOTBtdgNAGUGgaTnDhBSRQq/N8Xz/4RGLt3Qkut0hTARwt6JkOEohy
         Z3ZQ==
X-Gm-Message-State: AOJu0YyfnoYS/dJefLUL+ASlgmpsy4h/uSfbb9hobYqstmXAxJYR/e5q
	P7En3c7KXyR46wGGcqjgY7sLHGsRi9kfRuKQqVYBsX45L7zJj/ORcF+6rE65T77zT/hsN1SGuFv
	IL2nbUQNDRUcq+sBrV0t74B0Nd0w7WcRqNA==
X-Gm-Gg: Acq92OGV/8Oi/fVW/5qUSCjooxiIbhoZQp7f3DpQmz/X6hq6MNAB+vQ9d5HXdrIZr0m
	wu9geTlod2GRjGvevVT7QiccyZS7ev5sHtE4i6XGkndtFHAhC8XBxx+g0DE/0WlLkVWF3JRKwSX
	EtumNB+SFNRIzuXCqpMK0al1I3TfNIpODSv2jVMjPwjld6OFanRl2erAek/oB2WMPd/g6Mw2aNw
	WaaRQcHAOefl4ELxRLxiuAkeBoWvnQUz2aO6PfldAwvOkscv4/6gSY/3HIFjtRY5jKNNkB19V5H
	2bNHakJVoHlMzs0kHj9T
X-Received: by 2002:a05:6808:6d8e:b0:485:1174:4581 with SMTP id
 5614622812f47-485e6a67edbmr330407b6e.19.1780007505816; Thu, 28 May 2026
 15:31:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260528205816.3586664-1-filipe.pires@konsulko.com> <20260528211626.3591278-1-filipe.pires@konsulko.com>
In-Reply-To: <20260528211626.3591278-1-filipe.pires@konsulko.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Fri, 29 May 2026 10:31:34 +1200
X-Gm-Features: AVHnY4Lliak8_cBbtxqyVqMMGoNF_MoE_XCo-xC2PkBtSAEN2ctJHLovzmKsav4
Message-ID: <CADySD0FfPTgtq69dE4VpCQomg9=ws+EoX07h+rhFmffuyGS+5g@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH v2] radvd: upgrade 2.20 -> 2.21
To: filipe.pires@konsulko.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 May 2026 22:31:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127278

On Fri, May 29, 2026 at 9:16=E2=80=AFAM fpires96 via lists.openembedded.org
<filipe.pires=3Dkonsulko.com@lists.openembedded.org> wrote:
>
> From: Filipe Pires <filipe.pires@konsulko.com>
>
> The litech.org distribution URL is no longer available for this release,
> so switch to fetching directly from the upstream git repository. This
> also fixes the src-uri-bad QA warning for using GitHub archive URLs.
>
> radvd 2.21 hardens radvdump against malformed input (CVE-2026-48715).
> ---
>  .../radvd/{radvd_2.20.bb =3D> radvd_2.21.bb}                | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>  rename meta-networking/recipes-daemons/radvd/{radvd_2.20.bb =3D> radvd_2=
.21.bb} (93%)
>
> diff --git a/meta-networking/recipes-daemons/radvd/radvd_2.20.bb b/meta-n=
etworking/recipes-daemons/radvd/radvd_2.21.bb
> similarity index 93%
> rename from meta-networking/recipes-daemons/radvd/radvd_2.20.bb
> rename to meta-networking/recipes-daemons/radvd/radvd_2.21.bb
> index d02433c5ec..b10a96f945 100644
> --- a/meta-networking/recipes-daemons/radvd/radvd_2.20.bb
> +++ b/meta-networking/recipes-daemons/radvd/radvd_2.21.bb
> @@ -6,7 +6,7 @@ Discovery for IP Version 6 (IPv6). With these \
>  advertisements hosts can automatically configure their \
>  addresses and some other parameters. They also can \
>  choose a default router based on these advertisements."
> -HOMEPAGE =3D "http://www.litech.org/radvd/"
> +HOMEPAGE =3D "https://github.com/radvd-project/radvd"
>  SECTION =3D "net"
>  DEPENDS =3D "flex-native bison-native libdaemon libbsd"
>
> @@ -14,14 +14,16 @@ DEPENDS =3D "flex-native bison-native libdaemon libbs=
d"
>  LICENSE =3D "radvd"
>  LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3D73ebbf7182ae996e65e8fadc9a8=
c45db"
>
> -SRC_URI =3D "http://v6web.litech.org/radvd/dist/radvd-${PV}.tar.gz \
> +SRCREV =3D "a8500f4035b52028c90b0a938dfe8cd65e38fb50"
> +SRC_URI =3D "git://github.com/radvd-project/radvd.git;branch=3Dmaster;pr=
otocol=3Dhttps \

can please include tag=3Dv${PV} in the SRC_URI

>             file://radvd.init \
>             file://radvd.service \
>             file://volatiles.03_radvd \
>             file://radvd.default \
>             file://radvd.conf \
>             "
> -SRC_URI[sha256sum] =3D "af37c5a81d59f3bdc00d83056606ffa1810d4550beed6caa=
4f81181246494220"
> +
> +S =3D "${WORKDIR}/git"
>
>  UPSTREAM_CHECK_URI =3D "https://github.com/radvd-project/radvd/releases"
>  UPSTREAM_CHECK_REGEX =3D "releases/tag/v(?P<pver>\d+(\.\d+)+)"
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#127276): https://lists.openembedded.org/g/openembedde=
d-devel/message/127276
> Mute This Topic: https://lists.openembedded.org/mt/119537911/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

