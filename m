Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6327FC433EF
	for <webhook@archiver.kernel.org>; Tue, 24 May 2022 20:32:39 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web08.14671.1653424357155484588
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 May 2022 13:32:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dSRerxpW;
 spf=pass (domain: gmail.com, ip: 209.85.160.177,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id g3so15606613qtb.7
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 May 2022 13:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/h6VV1pcEgU4bjPVpueA0BsNoU4SHt29v9XMR8uoJgo=;
        b=dSRerxpWMtV93cbp+K84GpsI/Ef4RXo50OxwAlYjaVZQ8FSWGrtA6r/8sEH4PAHyUj
         pypkf89LZxYvk0h2yS3w+O2mFXIqrJ7fGDZ4M/7yuX574NZ+M6+LsdD5fq9egjnK6zeU
         EPdtF46aD66LJJm7UxrMQscFEFqKHs3XJNenb9JDJMLdX9LLSJloCdNSAD8kVgJI1QqB
         Vkf7781V78FJZ8y3P7LN9/SYtMKbWXCd+MJNGZ8AIn+r9vjvmPecvUwAwnovtv+hYTGT
         gSWOJrplxetCKlbqcuJAeUdPgJTiNJcxLtfGMjdQw2x2EKdqwlzyRC3JXb9ejk0FJhFO
         AAHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/h6VV1pcEgU4bjPVpueA0BsNoU4SHt29v9XMR8uoJgo=;
        b=S2B0plbvUJ5d9Rb8EosVIkJwF3GcdDTByhX5pz4Z5bpH3C8U1sTJKEWZlXFmvdHKqP
         J8PAsUDB1WB/PqljTfIXmW1amnrglKzjrXQqYjJk/JNII2Uf5FkGxtJxHBR+Vr40RQTt
         s77Kj4AL8KsrGyZQgIf9eV6hqDBtvrlySwJi6bPnG38ddqxMQyyMiYn70+1yFl1VOwXM
         Wo15luLE8yzf99eg2MKBgSC4nHn36x6/q6RIkdeIwvi+NGygXP9d69PYeo2s2mnQQuWi
         Z0iq4WiWysznIZdEPTqq8E+zfkb6vBGHUD7m4Dl1DZFavyP1LsIHddMNZ+DFaMm4pcW8
         zXfQ==
X-Gm-Message-State: AOAM532EBzQC+NUUKfKPFnEkCXy/vqGqN+UlraHCFUdGJxTEN7XVC8ww
	pqs22RQnP5nG82LqihE8Pi/BZVcTC4m8JfYgi2I=
X-Google-Smtp-Source: 
 ABdhPJyUrCgOqmXhmlI/IgnRR6utCt82aS6W55H6W8r3ZwKmAV9r6HBElFH/Wkh4oeM943BWP1nOqY9hU1lSqNj1e+s=
X-Received: by 2002:ac8:7f94:0:b0:2f9:2a3f:5fcd with SMTP id
 z20-20020ac87f94000000b002f92a3f5fcdmr14278755qtj.330.1653424356176; Tue, 24
 May 2022 13:32:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220524121153.1175133-1-ross.burton@arm.com>
 <20220524121153.1175133-5-ross.burton@arm.com>
In-Reply-To: <20220524121153.1175133-5-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 24 May 2022 13:32:10 -0700
Message-ID: 
 <CAMKF1soJ-jkyxf-uGNvWK4YANcoMdk-H5VHoHpOr3WXtuB4Z4w@mail.gmail.com>
Subject: Re: [oe] [PATCH 5/7] python3-hatchling: add new recipe and build
 class
To: Ross Burton <ross.burton@arm.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
 nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 May 2022 20:32:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97264

Its failing YP compat checks see

https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1778

On Tue, May 24, 2022 at 5:12 AM Ross Burton <ross.burton@arm.com> wrote:
>
> Hatchling is the build backend used by the Hatch tool.  Add the recipe
> and a pep517 build class.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta-python/classes/python_hatchling.bbclass  |  5 +++++
>  .../packagegroups/packagegroup-meta-python.bb |  1 +
>  .../python/python3-hatchling_1.3.0.bb         | 21 +++++++++++++++++++
>  3 files changed, 27 insertions(+)
>  create mode 100644 meta-python/classes/python_hatchling.bbclass
>  create mode 100644 meta-python/recipes-devtools/python/python3-hatchling_1.3.0.bb
>
> diff --git a/meta-python/classes/python_hatchling.bbclass b/meta-python/classes/python_hatchling.bbclass
> new file mode 100644
> index 0000000000..b3cbe23601
> --- /dev/null
> +++ b/meta-python/classes/python_hatchling.bbclass
> @@ -0,0 +1,5 @@
> +inherit python_pep517 python3native python3-dir setuptools3-base
> +
> +DEPENDS += "python3-hatchling-native"
> +
> +PEP517_BUILD_API = "hatchling.build"
> diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> index 2fcf34260c..80ec0720fd 100644
> --- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> +++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> @@ -168,6 +168,7 @@ RDEPENDS:packagegroup-meta-python3 = "\
>      python3-h11 \
>      python3-h2 \
>      python3-h5py \
> +    python3-hatchling \
>      python3-haversine \
>      python3-hpack \
>      python3-html2text \
> diff --git a/meta-python/recipes-devtools/python/python3-hatchling_1.3.0.bb b/meta-python/recipes-devtools/python/python3-hatchling_1.3.0.bb
> new file mode 100644
> index 0000000000..a6550a9732
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-hatchling_1.3.0.bb
> @@ -0,0 +1,21 @@
> +SUMMARY = "The extensible, standards compliant build backend used by Hatch"
> +HOMEPAGE = "https://hatch.pypa.io/latest/"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=cbe2fd33fc9297692812fc94b7d27fd9"
> +
> +inherit pypi python_hatchling
> +
> +DEPENDS += "python3-pluggy-native python3-tomli-native python3-pathspec-native python3-packaging-native python3-editables-native"
> +DEPENDS:remove:class-native = "python3-hatchling-native"
> +
> +SRC_URI[sha256sum] = "1401d45d3dd6a5910f64d539acaa943486d5e8b7dda1a97f2b0040fdddc5b85e"
> +
> +# Until we have a proper tool to invoke PEP517 builds, hatchling can't
> +# bootstrap itself automatically.
> +PEP517_BUILD_API = "hatchling.ouroboros"
> +
> +do_compile:prepend() {
> +    export PYTHONPATH=src
> +}
> +
> +BBCLASSEXTEND = "native nativesdk"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97246): https://lists.openembedded.org/g/openembedded-devel/message/97246
> Mute This Topic: https://lists.openembedded.org/mt/91309500/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

