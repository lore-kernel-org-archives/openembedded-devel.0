Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C232CC02181
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 04:17:29 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web11.4514.1737692245520064697
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jan 2025 20:17:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fPe5JeDs;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-2a3a40c69e3so917358fac.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Jan 2025 20:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737692245; x=1738297045; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c/IJJFglIKa3Yw7BbGis3aXUh5jhhFNzMMiq7zpSTlU=;
        b=fPe5JeDsfRCmR9k88BU/klDa+wjcWLb+4vOj2gh2RDqzavASOILE2pTqzV/BJIVl/1
         liJZ5OdnfcK8LBkUu6xRcbrEaz1q9V3JZGqqws9uPcxxiw+8gp30NFjB9w+1CT468aK4
         MOtCyG7k1URglP44a5nloSpuPRXUp5mxaLQht7c9LJnkWXZMZ/8QxLjie+qKn6RS1qCF
         WhzmhgysMfgY4KOQx5uA/CwCs+J1evNtJsB8gAUK5bTdepsHgA2ptkIFAC72jlWW0sgh
         F+r8lH4vh/Nw/+QPi6m66q/HxppogCasLijlIjXkMxstWTCiWo9Zr05DIiIrnTFS1FqD
         UoMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737692245; x=1738297045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c/IJJFglIKa3Yw7BbGis3aXUh5jhhFNzMMiq7zpSTlU=;
        b=s+iFjbjPUwAArc3SK1xHF8MNnrD+YjPi1H0Up+yx+gCDRilQpy+phqPVphly3C1NCY
         /u03Gt2ZgWirSXiU5dlWha3k8MjjP0I/3btMmU/wy+gFXzKn9PSbxBVUpQbr+YuI77NP
         nDvTKmDf0ACk2G3RG7pDX1RnYLur+aIm5ODoJ8+AKNdN0TCJQbRMOghPV9xhKI3l0E/9
         oYEjqp8t+cOioeMs4gampV5vmd36cUc5vYeuLwwr6DCkkVmLSbtU5StSwh16P0Q73ugk
         bDvBEjFoEaLbade6GWAOLUfqFGJhw/YZOMqAZQTxdFlG55XBlXbjAauZFqLMCs2E8oHB
         oYOw==
X-Gm-Message-State: AOJu0Yyn86Wu3Zro2DH9ARZeq+I+ZQiTKt6cAmxbefW/6KV8W7kcYtKK
	0hGF6a+yOwC6//iH4gGOsJLmNQGvHyK00qLfCWjmrakw1xLiCRxWAi0e0aQY53MSUKQ8tEGe5/o
	sEo8L6IEbX9e4WdS07QQqcPY7XiQ=
X-Gm-Gg: ASbGncuQOPjKFbHywmuGtHsdBuhwmFGqE0plxlZu4gGb87Zym/h+s56wGh6XasVbfWb
	DLN7iXQDd35oPP9Ge1cfrI2wkbTXXfSoTskdBdaEqCPgABI3BjiD+a/d/Hbg9dC5q73APy0vUIa
	cq
X-Google-Smtp-Source: AGHT+IHxox2i4ArP9qGaHusvQJl/pntPaNOjFBTqRHalYzyB3w+tuzF7YJiRrYj/F4TZ7iM7wXc2tWnag91WSEg50Dg=
X-Received: by 2002:a05:6870:548f:b0:29e:29e1:db1d with SMTP id
 586e51a60fabf-2b1c0842960mr16190000fac.3.1737692244601; Thu, 23 Jan 2025
 20:17:24 -0800 (PST)
MIME-Version: 1.0
References: <20250117203030.3648575-1-derek@asterius.io> <20250117203030.3648575-10-derek@asterius.io>
In-Reply-To: <20250117203030.3648575-10-derek@asterius.io>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 23 Jan 2025 20:16:58 -0800
X-Gm-Features: AWEUYZkqKHFyF9VdaaxcG28NpR_2ricrqbipMJv5yyzK_kQ_er9YymvfNBOYjqA
Message-ID: <CAMKF1sr3PSAn5xQ2xMOk3dKEc7Y2fB6E_v_thR-LK44rkDVznQ@mail.gmail.com>
Subject: Re: [oe][meta-python][PATCH 10/10] python3-portion: update recipe to
 use the ptest-python-pytest class
To: derek@asterius.io
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Jan 2025 04:17:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115048

On Fri, Jan 17, 2025 at 12:30=E2=80=AFPM Derek Straka via
lists.openembedded.org <derek=3Dasterius.io@lists.openembedded.org>
wrote:
>
> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>  .../python/python3-portion/run-ptest            |  3 ---
>  .../python/python3-portion_2.6.0.bb             | 17 +++--------------
>  2 files changed, 3 insertions(+), 17 deletions(-)
>  delete mode 100644 meta-python/recipes-devtools/python/python3-portion/r=
un-ptest
>
> diff --git a/meta-python/recipes-devtools/python/python3-portion/run-ptes=
t b/meta-python/recipes-devtools/python/python3-portion/run-ptest
> deleted file mode 100644
> index 8d2017d39..000000000
> --- a/meta-python/recipes-devtools/python/python3-portion/run-ptest
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -#!/bin/sh
> -
> -pytest --automake
> diff --git a/meta-python/recipes-devtools/python/python3-portion_2.6.0.bb=
 b/meta-python/recipes-devtools/python/python3-portion_2.6.0.bb
> index 31c6f0731..8bdbc032c 100644
> --- a/meta-python/recipes-devtools/python/python3-portion_2.6.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-portion_2.6.0.bb
> @@ -5,28 +5,17 @@ SECTION =3D "devel/python"
>  LICENSE =3D "LGPL-3.0-only"
>  LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D3000208d539ec061b899bce1d=
9ce9404"
>
> -inherit pypi python_setuptools_build_meta ptest
> +inherit pypi python_setuptools_build_meta ptest-python-pytest
>
>  SRC_URI[sha256sum] =3D "6fb538b57a92058f0edd360667694448aa3fc028ab97e41e=
3091359d14ba4dd5"
>
> -SRC_URI +=3D " \
> -       file://run-ptest \
> -"
> -
>  RDEPENDS:${PN} +=3D "\
>         python3-sortedcontainers \
>  "
>
> -RDEPENDS:${PN}-ptest +=3D " \
> -       python3-pytest \
> -       python3-unittest-automake-output \
> -"
> -
> -do_install_ptest() {
> -       install -d ${D}${PTEST_PATH}/tests
> +do_install_ptest:append () {
>         # This file tests README.md and deleted as redundant.
> -       rm -f ${S}/tests/test_doc.py
> -       cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> +       rm -f ${D}/tests/test_doc.py
>  }
>

It causes a ptest failure.

Failed ptests:
{'python3-portion': ['tests/test_doc.py:test_readme']}

I think removing test_doc.py needs to be fixed to work as it was, or
perhaps package README.md so it can pass.

>  BBCLASSEXTEND =3D "native"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#114943): https://lists.openembedded.org/g/openembedde=
d-devel/message/114943
> Mute This Topic: https://lists.openembedded.org/mt/110673713/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

