Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9483C433EF
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 20:08:59 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web08.1231.1646424538302174712
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Mar 2022 12:08:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=F2edYFP2;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id e22so7458363qvf.9
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Mar 2022 12:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=/QyfZr/7KdBJyx+S80eiSuR5wLfTdEEmyfS0ciAuyB8=;
        b=F2edYFP21vdd8HIv9ucigbjuQG8FjBdJt6v4EUSsA/+Q3MY4KCsCUftBnQS3Gg4m1W
         Q4Et6AjNagd4wK0KDLbYyskig36t4UCs2qpDR1Kze4yobtCtID7c8tYEUUNlHsJLMkvX
         GvGsV1iy5nyEwAXIMv+YfVrU+dROxY5086D8RYtX2Te135zf6No48H5Qua4AySAW8Ws0
         vyBXFVqXTlfg2sVC2i6OSCle/le4B3Q5ah3z1ZTBJpRxCx8weSXeDvmR6C8+6/jagruT
         dyj6eRA/aUqAKEShqeO5xPp0X2KMGFUYmD1icDLzsg4Gvk4h9oPAsQypfsV778ElWoVe
         UdCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=/QyfZr/7KdBJyx+S80eiSuR5wLfTdEEmyfS0ciAuyB8=;
        b=BlLk1Ye+lcGdRbivYzk8vC4OgNcCsA7F6rCb1RZW97CpUUFv777GpaYeSg8jXIOfNn
         h39gvDKnLmBxj94hfFCYNwdIraWOis8Qsou2NrsXCrP3R9aVoYMdYDAJzwaOtm3Ujayf
         hrtpSq30YwEAkil6m+5k7JUu9XM6ayCGHKDwLale2/6gcm1SwvprU+roQDfm9qonMjT6
         mCVGSzLIVuckiLgsk6VldMj/0frDO0n2hBH2SCnWmvIpAlQLLcgeWK52wAiLKpMImSaZ
         tMBggWpFKp7qEnUDr/gWNnjXjJXIg0gV2tg0TaFcOkRzxZR3GwUdKWkoIRkmZ6gRYwWo
         JsdA==
X-Gm-Message-State: AOAM533ahVONdvMP2GfDh6AgYO9QaKCstjtTaswcDqTC2H5nAdWXN2wG
	DffXABwaxB5Ppk8aVL3FbccBgMJhyN3ymFb/V0RGbDWGHAU=
X-Google-Smtp-Source: 
 ABdhPJyWjEdgtg8fjCI9ad1g858KRkO0Ad4GKoNGQDfhFF1X2BZHEU4UX+E7ZcC2Icu32dPr6L8J++DjS0a2g3INQRc=
X-Received: by 2002:a05:6214:2a83:b0:435:3075:e990 with SMTP id
 jr3-20020a0562142a8300b004353075e990mr68865qvb.110.1646424537147; Fri, 04 Mar
 2022 12:08:57 -0800 (PST)
MIME-Version: 1.0
References: <20220303164013.3149208-1-raj.khem@gmail.com>
In-Reply-To: <20220303164013.3149208-1-raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 4 Mar 2022 12:08:31 -0800
Message-ID: 
 <CAMKF1sr7ekT8YN+_eH3HyWs+g3_8LXvDx0A4TcSpa10iT0V1qA@mail.gmail.com>
Subject: Re: [meta-python][PATCH 1/2] unattended-upgrades: Move to meta-python
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Mar 2022 20:08:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95795

ignore this one, since setuptools3_legacy will fix it and we can keep
it in meta-oe

On Thu, Mar 3, 2022 at 8:40 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> It needs distutils, until its ported to use setuptools, keep it in
> meta-python as it depends on distutils infra from here.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../recipes-core/packagegroups/packagegroup-meta-python.bb    | 1 +
>  ...unattended-upgrade-Remove-distro_info-usage-to-check.patch | 0
>  .../unattended-upgrades/unattended-upgrades_2.6.bb            | 4 ++--
>  3 files changed, 3 insertions(+), 2 deletions(-)
>  rename {meta-oe => meta-python}/recipes-devtools/unattended-upgrades/files/0001-unattended-upgrade-Remove-distro_info-usage-to-check.patch (100%)
>  rename {meta-oe => meta-python}/recipes-devtools/unattended-upgrades/unattended-upgrades_2.6.bb (92%)
>
> diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> index 670361598e..b2d31282e6 100644
> --- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> +++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> @@ -474,6 +474,7 @@ RDEPENDS:packagegroup-meta-python3 = "\
>      python3-yarl \
>      python3-zopeinterface \
>      telepathy-python3 \
> +    unattended-upgrades \
>  "
>  RDEPENDS:packagegroup-meta-python3:remove:libc-musl:powerpc64le = "python3-grpcio python3-grpcio-tools"
>
> diff --git a/meta-oe/recipes-devtools/unattended-upgrades/files/0001-unattended-upgrade-Remove-distro_info-usage-to-check.patch b/meta-python/recipes-devtools/unattended-upgrades/files/0001-unattended-upgrade-Remove-distro_info-usage-to-check.patch
> similarity index 100%
> rename from meta-oe/recipes-devtools/unattended-upgrades/files/0001-unattended-upgrade-Remove-distro_info-usage-to-check.patch
> rename to meta-python/recipes-devtools/unattended-upgrades/files/0001-unattended-upgrade-Remove-distro_info-usage-to-check.patch
> diff --git a/meta-oe/recipes-devtools/unattended-upgrades/unattended-upgrades_2.6.bb b/meta-python/recipes-devtools/unattended-upgrades/unattended-upgrades_2.6.bb
> similarity index 92%
> rename from meta-oe/recipes-devtools/unattended-upgrades/unattended-upgrades_2.6.bb
> rename to meta-python/recipes-devtools/unattended-upgrades/unattended-upgrades_2.6.bb
> index 85e5f59c7a..0629bf6db1 100644
> --- a/meta-oe/recipes-devtools/unattended-upgrades/unattended-upgrades_2.6.bb
> +++ b/meta-python/recipes-devtools/unattended-upgrades/unattended-upgrades_2.6.bb
> @@ -13,8 +13,8 @@ SRCREV = "c6db6fad26a2b83ba301b52ff5dee98cef7558ca"
>
>  S = "${WORKDIR}/git"
>
> -inherit setuptools_build_meta
> -PYPA_WHEEL = "${PIP_INSTALL_DIST_PATH}/${PIP_INSTALL_PACKAGE}-0.1-*.whl"
> +inherit distutils3
> +#PYPA_WHEEL = "${PIP_INSTALL_DIST_PATH}/${PIP_INSTALL_PACKAGE}-0.1-*.whl"
>
>  DEPENDS += "apt intltool-native python3-distutils-extra-native"
>  RDEPENDS:${PN} += "apt lsb-release python3-apt python3-core python3-datetime python3-email python3-fcntl python3-io python3-logging python3-stringold python3-syslog"
> --
> 2.35.1
>

