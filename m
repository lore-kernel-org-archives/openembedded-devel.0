Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 038F3C4345F
	for <webhook@archiver.kernel.org>; Thu, 11 Apr 2024 17:29:38 +0000 (UTC)
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
 by mx.groups.io with SMTP id smtpd.web11.24383.1712856570429558005
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Apr 2024 10:29:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VXCHGUzC;
 spf=pass (domain: gmail.com, ip: 209.85.161.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-5aa25e99414so54842eaf.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Apr 2024 10:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712856570; x=1713461370; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jtb/eqgkCvvN6b9Qxe/84cGM1b/WjwIiq4Ur6dOPSuQ=;
        b=VXCHGUzClKwNxWRHT2ZrtxiGISJvqGmx6Bp/9XKf7TKkJb4JuxKEq/xAXzi8xZGLYX
         zhg3EVvxiU6tvFZWcF2xc+ZW5+1NTolwN7Z8LHfRr+PNT+QyNEUn2jGFwkLDZen7nz8B
         6trPwI2gkJKrWHE+V3YkjKO1VU6P7xH1Pc0HS60imiZlxAMJLYnuZaGpVk96cTTlueqT
         xro1OIWCxYxbWm1t0n8MlSAUhm4ICyCGLj1NTuXqH0AjToMo6iWzL7/H8H2k8Ee2i3nR
         JO8BO30BigoOiMCJ+rZoC8U5QKeMMpZeWIdmPJskUX3/054Tt13hsBDktiBIOVTb8jYp
         x0kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712856570; x=1713461370;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jtb/eqgkCvvN6b9Qxe/84cGM1b/WjwIiq4Ur6dOPSuQ=;
        b=rEikbwrOq+TVzGmALLey6eckECKz87q4W0aC2n5s1cXc5gToNKA6ezLWaWsyZH5HkN
         a/lrLSSGqmHHnlTJElylY+cjnqkL35qZq9m+YKmmYp1ePuPBSI/Crs0xCZmsYfaOh1zv
         8LWwPJygXuEGzgtZu+Dn6e1kY4/PlYAqDw5c62n8YfKnIHVrdGDyVNnsMhHSUSiVN1M3
         l3q4SVM7wPGuaYFatjnf4XSfi8RhDDTwv3mYVMhVoAQ8t3e5vWqseHz1hTJije5Y9u4k
         1DGq22BMu2O+ouyjm2oBDVeDAXmNFhLEB+HDbRX1xrj5Zp6FYvv046TdCAlTrKdXwVGa
         JiRg==
X-Gm-Message-State: AOJu0YyEKlfdSip24/ZlPkeerzXy/CAxh5PfdP6E92KIL0u6Evo6kLtF
	m4bIg9jXYPb8Zt8RmX6kaqeqeIg9AqeT6S+GT+XQgYevrzm85Row3xUPALejCcV2R88zI5nPZox
	5EBvjJYwlyTrbdbSq4gtVkfw2Lks=
X-Google-Smtp-Source: AGHT+IEBwawB9xqdgXZyMUV3jcotWcU8q+nc074ycvr2aNVkveAqtTvjwgeC1aREZeoj6MrdBbHHf1Un1pRJR9w+yo4=
X-Received: by 2002:a05:6870:2b1c:b0:22a:a40c:4bde with SMTP id
 ld28-20020a0568702b1c00b0022aa40c4bdemr224921oab.11.1712856569629; Thu, 11
 Apr 2024 10:29:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240411112318.167362-1-alperyasinak1@gmail.com>
In-Reply-To: <20240411112318.167362-1-alperyasinak1@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 11 Apr 2024 10:29:03 -0700
Message-ID: <CAMKF1srk1y01auNxgbKQrTK0NKZ_BKBTQFJeVKQKSM9MgD0NSw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-flexparser: enable ptest and
 add missing runtime dependencies
To: Alper Ak <alperyasinak1@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Apr 2024 17:29:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109922

thanks for doing this.

On Thu, Apr 11, 2024 at 4:23=E2=80=AFAM Alper Ak <alperyasinak1@gmail.com> =
wrote:
>
> * Ptest and library example tested on qemux86-64 and qemuarm64
>
> * Add ptest into PTESTS_FAST_META_PYTHON
>
> Ptest result:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> qemux86-64:
>
> Testsuite summary
> TOTAL: 59
> PASS: 59
> SKIP: 0
> XFAIL: 0
> FAIL: 0
> XPASS: 0
> ERROR: 0
> DURATION: 12
> END: /usr/lib/python3-flexparser/ptest
> 2024-04-11T11:06
> STOP: ptest-runner
> TOTAL: 1 FAIL: 0
>
> qemuarm64:
>
> Testsuite summary
> TOTAL: 59
> PASS: 59
> SKIP: 0
> XFAIL: 0
> FAIL: 0
> XPASS: 0
> ERROR: 0
> DURATION: 11
> END: /usr/lib/python3-flexparser/ptest
> 2024-04-11T11:09
> STOP: ptest-runner
> TOTAL: 1 FAIL: 0
>
> Signed-off-by: alperak <alperyasinak1@gmail.com>
> ---
>  .../ptest-packagelists-meta-python.inc        |  1 +
>  .../python/python3-flexparser/run-ptest       |  3 +++
>  .../python/python3-flexparser_0.3.bb          | 22 ++++++++++++++++++-
>  3 files changed, 25 insertions(+), 1 deletion(-)
>  create mode 100644 meta-python/recipes-devtools/python/python3-flexparse=
r/run-ptest
>
> diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc =
b/meta-python/conf/include/ptest-packagelists-meta-python.inc
> index acb09aaca..6bd48156d 100644
> --- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
> +++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
> @@ -20,6 +20,7 @@ PTESTS_FAST_META_PYTHON =3D "\
>      python3-dominate \
>      python3-execnet \
>      python3-flexcache \
> +    python3-flexparser \
>      python3-freezegun \
>      python3-geojson \
>      python3-google-auth-oauthlib \
> diff --git a/meta-python/recipes-devtools/python/python3-flexparser/run-p=
test b/meta-python/recipes-devtools/python/python3-flexparser/run-ptest
> new file mode 100644
> index 000000000..8d2017d39
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-flexparser/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +pytest --automake
> diff --git a/meta-python/recipes-devtools/python/python3-flexparser_0.3.b=
b b/meta-python/recipes-devtools/python/python3-flexparser_0.3.bb
> index fb94235f0..e45175f5a 100644
> --- a/meta-python/recipes-devtools/python/python3-flexparser_0.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-flexparser_0.3.bb
> @@ -6,6 +6,26 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D32f547dac365c=
355d2cdbcd7ebea9144"
>  DEPENDS +=3D "python3-setuptools-scm-native"
>  SRC_URI[sha256sum] =3D "692e7524d9e14b2b1231b772b091d7d6296951deb383f5a6=
7bfbd0ecb0b9fa9a"
>
> -inherit pypi python_setuptools_build_meta
> +inherit pypi python_setuptools_build_meta ptest
>
>  PYPI_PACKAGE =3D "flexparser"
> +
> +SRC_URI +=3D " \
> +       file://run-ptest \
> +"
> +
> +RDEPENDS:${PN}-ptest +=3D " \
> +       python3-pytest \
> +       python3-unittest-automake-output \
> +"
> +
> +do_install_ptest() {
> +       install -d ${D}${PTEST_PATH}/testsuite
> +       cp -rf ${S}/flexparser/testsuite/* ${D}${PTEST_PATH}/testsuite/
> +}
> +
> +RDEPENDS:${PN} +=3D " \
> +       python3-compression \
> +       python3-email \
> +       python3-logging \
> +"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109919): https://lists.openembedded.org/g/openembedde=
d-devel/message/109919
> Mute This Topic: https://lists.openembedded.org/mt/105460442/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

