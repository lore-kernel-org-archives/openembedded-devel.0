Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web12.3229.1585630871892072062
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Mar 2020 22:01:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DIsugmm/;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id u4so21691813qkj.13
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2020 22:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o3dVb/AKEe3eKPF2el6wvYW4lG73aUBZNi0362jXLv8=;
        b=DIsugmm/qxV95PcrjOmD5CZsnKNhOakuzp49JfeFBNpFi6Yeh28EaP03lBrM1TnHd+
         ppQZ0w6Ot2GaTyc1BVrzpeM9FRUl0kaxwvAJ84QSVqTptqBQ1QbauGnNgcjepBHSkXv+
         JTYFC1mgE50zdahlC8S0e43sAXwjbY6x34T/yZclr9m/OFBg48Dx3E+KMOe19onOmwlt
         Sg9B0RDhjd/av5/ghed1zA9TFqXFpEzDCZ9rfHZV+9qN6YQ9yk2o2C+w6vD2ekW20t9s
         NfADXuSTWy6uIQqO8VbA+1Hk4eLGQJmmP4IPH+GOdKkD4ViBCz78UbX8caCkYnFeCQKg
         CFow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o3dVb/AKEe3eKPF2el6wvYW4lG73aUBZNi0362jXLv8=;
        b=PA4jXM07hT62D/uTue/TLhNySfvPZqh9+TD8nngFY9eMStLcGk418yfAiUB/q9Ku+o
         Z1M4jSxHRqJ2s+jFxJ6IEt9oeWEIx4pLpBLrnrYXs1GfniBWuDvoPbbDcANNyTGX10TW
         NIbvGhb2fP1qqsk42n/U4/OwbAjF9pQb5nUkLqsomSrJXKuNPt3PWDyhr8dalnTpco3Q
         +DRboDy6MHMsY6N4bJ77oANv1Gl1YB/QUzt4rD3oSt5R+0RbMS412WuozJDvt5ICZX9Y
         2DRscoBYH/LFydqKLGhDPYtEt2HXZ7WyaNy0naWNGVTiO/7ZaLY/r2XJf6sbPHhkYR1O
         c/kg==
X-Gm-Message-State: ANhLgQ2Ml+ya8rhr8RO4g/wFGRX2QN6xiq92+9uMQUbE9fQZFh6Qt5IG
	aooJGHPhZAGZofcXuNQQCv89gRySMSV3C6JyVkfRxv2tOPk=
X-Google-Smtp-Source: ADFU+vsqPmjqB1Udv1vzCxhRlMdEGiCOF/A7MQB5vrGZC1c3cadB6bvJtw+TKcKdYffNDsXU0QTi2qUmLpwEQ7Cp97k=
X-Received: by 2002:a37:a746:: with SMTP id q67mr3377036qke.215.1585630870752;
 Mon, 30 Mar 2020 22:01:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200330055645.18477-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20200330055645.18477-1-zangrc.fnst@cn.fujitsu.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 30 Mar 2020 22:00:44 -0700
Message-ID: <CAMKF1spPh32=VTCTYgJ872vxdbeg4J1jBHJfJpFR163qya24RQ@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-test-generator: Enable ptest
To: zangrc <zangrc.fnst@cn.fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

I see

19:39:18 ERROR: Nothing RPROVIDES 'python3-mock' (but
/mnt/jenkins/workspace/yocto-world-glibc/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-test-generator_0.1.2.bb
RDEPENDS on or otherwise requires it)
19:39:19 ERROR: Nothing RPROVIDES 'python3-test-generator-dev' (but
/mnt/jenkins/workspace/yocto-world-glibc/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-test-generator_0.1.2.bb
RDEPENDS on or otherwise requires it)
19:39:19 No eligible RPROVIDERs exist for 'python3-test-generator-dev'


On Sun, Mar 29, 2020 at 10:54 PM zangrc <zangrc.fnst@cn.fujitsu.com> wrote:
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../python/python3-test-generator/run-ptest      |  3 +++
>  .../python/python3-test-generator_0.1.2.bb       | 16 +++++++++++++++-
>  2 files changed, 18 insertions(+), 1 deletion(-)
>  create mode 100644 meta-python/recipes-devtools/python/python3-test-generator/run-ptest
>
> diff --git a/meta-python/recipes-devtools/python/python3-test-generator/run-ptest b/meta-python/recipes-devtools/python/python3-test-generator/run-ptest
> new file mode 100644
> index 000000000..5cec71169
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-test-generator/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +pytest
> diff --git a/meta-python/recipes-devtools/python/python3-test-generator_0.1.2.bb b/meta-python/recipes-devtools/python/python3-test-generator_0.1.2.bb
> index 14943a4bd..a83ee5efc 100644
> --- a/meta-python/recipes-devtools/python/python3-test-generator_0.1.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-test-generator_0.1.2.bb
> @@ -5,10 +5,24 @@ parsers that prevent any potentially malicious operation."
>  LICENSE = "ISC"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=041a2bff595d40ccb4b36356f89dab00"
>
> +SRC_URI += " \
> +       file://run-ptest \
> +"
> +
>  SRC_URI[md5sum] = "6c69e73ba5b4b3ed62f7bcda071c64f1"
>  SRC_URI[sha256sum] = "ad5925c814bfe79497b43df096e3bb52c166d1577f7aff160137301676232f4a"
>
> -inherit pypi setuptools3
> +inherit pypi setuptools3 ptest
> +
> +RDEPENDS_${PN}-ptest += " \
> +       ${PYTHON_PN}-pytest \
> +       ${PYTHON_PN}-mock \
> +"
> +
> +do_install_ptest() {
> +       install -d ${D}${PTEST_PATH}/tests
> +       cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> +}
>
>  DEPENDS += "python3-nose-native"
>
> --
> 2.20.1
>
>
>
> 
