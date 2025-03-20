Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5681C28B30
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 08:10:36 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web10.2554.1742458220117619061
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Mar 2025 01:10:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GO+nXa3b;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3fcfc85f1f5so129368b6e.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 Mar 2025 01:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742458219; x=1743063019; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+yVEwy1VbKXDtdcgh3fh1RH4tg0HwuFha/k8/NZ5sNU=;
        b=GO+nXa3byvI/u2qxWp3V+lv2QzqzBX6rPNHvqvXuBlY4zHAnJVqni8CNEhwJCzlXpZ
         W/HQ3XAjmubZKrXd+yO+yrfrxb+57MVBepKtddjIHZWDRTTdIO/SmoaALKRev75jTy2b
         DJZbsxiEVQWtUouRdTppJavE11P7wjGKRfHfKIZ8mebVpkCUPVhMf3caoqnYABwg5A6A
         FO/jlV4+wRhHOPdcwWhlsace87bGF5EM6cFX834IXNN3JA+iaD2Qf1AMfMVtLTKS32N8
         om31lNjsprXa0Td4zqysVmtHjQIIMpErHlCniZggYzYBc6g/s2GJ2s6sbPcopsqUn9iu
         rb8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742458219; x=1743063019;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+yVEwy1VbKXDtdcgh3fh1RH4tg0HwuFha/k8/NZ5sNU=;
        b=D1CW0mMLWE7FrCZuI5g10qNXDidmel0odRcSjanUn250G5BYfNeCF6r0BruQcl/2sx
         qM5Thspc76ckGPR3TEgpw6rn+UmhYAr0E+FenuwrayJdiLZ+qIS8OPgr0LeZYJRdmO4c
         zoaW9uJu9CdZCQKOxLwnvVUqHqlE8xf0QQ0TsebtYokLEDz7yAsPPlb4VsJn848kqNFV
         SI5uqozZv5jmAIbWSVlGXCwxt2O79sh8lICvVLmbw5a7ff/ekds69PwSt6dOuUHmLh8y
         oM8lMJTdWKqdK09HsGBLreAfT9Oo0e6Uo+1ZLU7RjGqJO984uulVCXee2GlFHc/KMhAl
         qMeQ==
X-Gm-Message-State: AOJu0YzoDhp8661AhwOSfoxj8u0fbtduDYkax9pTZdlHAnsRjoEB+2ku
	mlPKnRxuyqXMGmu2ruJkl0rhbe3/bpj0ZhnapteqQ+6HMDXzUYQKFwpASo/M1446t+jlrfniUIx
	6RyyICLTd+1jlgYpfw5r2wlBvvNw=
X-Gm-Gg: ASbGnctvPjAEaDsd+kVAqPtud9DEO1OKVfsbzn0e0QPnWAY9s/M/OHlcd94dKZsVhjz
	UFhWaOSclZEzrLIMGZ+oK9egDbvH3hU7OCGnpzUnd/E1mPRhGETmmEK6T5oQqDnhudYGtzPYPOI
	Xp2YgMCHbuPlV0YjALg8TIuy1u
X-Google-Smtp-Source: AGHT+IE4tfLCO78pTphWkynE9D03xmT2J3GRYBbHB71fzZkrW3Rofvf5J4K6vnrrOTeGwrHtRj0snSqSj/DTPVhrflI=
X-Received: by 2002:a05:6808:d52:b0:3fa:25c8:a037 with SMTP id
 5614622812f47-3fead5f73aamr3616767b6e.29.1742458219277; Thu, 20 Mar 2025
 01:10:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250320080451.1063409-1-omri.sarig13@gmail.com>
In-Reply-To: <20250320080451.1063409-1-omri.sarig13@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Mar 2025 01:09:53 -0700
X-Gm-Features: AQ5f1Jp7a3oHxcLhpiATvmaCBsB6wKFndyTJk7sP_DbfeiCW_8Ad13ogSWuU-KE
Message-ID: <CAMKF1sqej34GVnCnEM0SUcd8Z90nE_npxetmWATPXKWgA+xj4A@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-varlink: Add recipe
To: omri.sarig13@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Mar 2025 08:10:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116122

does this package have unittests ? if so can we add ptest support as
well while here ?

On Thu, Mar 20, 2025 at 1:06=E2=80=AFAM Omri Sarig via lists.openembedded.o=
rg
<omri.sarig13=3Dgmail.com@lists.openembedded.org> wrote:
>
> Add a python recipe to install the python implementation for the varlink
> interface.
>
> The recipe is using the current master head, instead of the version from
> pypi. This is done as the pypi version is 4 years old, while the master
> is continuously maintained in GitHub.
>
> The runtime dependencies were created by looking at all the import
> statement in the installed files of the repository and looking at the
> relevant packages from the python3 manifest file in meta-poky.
>
> The repository contains a test directory, however, these tests are not
> fully automated, and can be used as an example for running the package
> on target. Therefore, the package is not added to the ptest system.
>
> Signed-off-by: Omri Sarig <omri.sarig13@gmail.com>
> ---
>  .../python/python3-varlink_git.bb             | 26 +++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-varlink_g=
it.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-varlink_git.bb b=
/meta-python/recipes-devtools/python/python3-varlink_git.bb
> new file mode 100644
> index 0000000000..d3c89527ea
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-varlink_git.bb
> @@ -0,0 +1,26 @@
> +SUMMARY =3D " Python implementation of the Varlink protocol"
> +HOMEPAGE =3D "https://varlink.org/python/"
> +LICENSE =3D "Apache-2.0"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3De3fc50a88d0a364313df4b21e=
f20c29e"
> +
> +SRC_URI =3D "git://github.com/varlink/python.git;protocol=3Dhttps;branch=
=3Dmaster"
> +
> +SRCREV =3D "6012b8805bf2ebcc981c84bd56a3e949a2141c16"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit python_setuptools_build_meta
> +
> +DEPENDS +=3D "python3-setuptools-scm-native"
> +
> +RDEPENDS:${PN} +=3D " \
> +    python3-core \
> +    python3-datetime \
> +    python3-io \
> +    python3-json \
> +    python3-netclient \
> +    python3-netserver \
> +    python3-shell \
> +    python3-stringold \
> +    python3-unittest \
> +"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116121): https://lists.openembedded.org/g/openembedde=
d-devel/message/116121
> Mute This Topic: https://lists.openembedded.org/mt/111804882/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

