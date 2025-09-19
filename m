Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D309CAC5A5
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 04:01:54 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
 by mx.groups.io with SMTP id smtpd.web11.7960.1758254512390190797
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Sep 2025 21:01:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Jxckw5PX;
 spf=pass (domain: gmail.com, ip: 209.85.219.182, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-ea856357c38so420677276.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 21:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758254511; x=1758859311; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iU0Y9DjQmBINFZ79I/qe1uM6tdPdB2BYkqIBdVe7sYw=;
        b=Jxckw5PXiz2XvqZrEvhNFHM2jqcRnCBSYOdGwHbLIUzF2xnUuJxAkS8wMyYDK3j7CU
         WwN8IHpeU283udF+rCODQ0uTx7NYIFWx5WVBD4GzgVjhD3DoIADvZ2XJMjs1YbbBQINt
         nlMZFsVS3+pTEeiuKFX6Mexu5t17QylzZl7GFNSPqte+9/sdfs+5CQkv6NKCNkaACqub
         iVRplFannLqQ9ooyjaaEfKBZh1cLHr0rCvhcq0M1ibcbbxyOmqDvoSQkDNjqUlEnWaHS
         c1ToMdgxxJ/7Kb4gYiU1P6hG7FYpuZiGfHZRKfj0J8LqmRQiKsJuMAupSFr8u4py+ROa
         Db5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758254511; x=1758859311;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iU0Y9DjQmBINFZ79I/qe1uM6tdPdB2BYkqIBdVe7sYw=;
        b=bVD/8pkYI1Lq+MQMHje6qLKJmVuv7DW1C9p+7vJJiTefLA7rmAWXnBmvZeEh9wheih
         9UwLG1DjtkTlHd2CBR3CMygMx0/Szyh+cBcyAq/OZxospWvzNM3Jgeandl1wYMv/xazH
         Yr+z4emvvtZdJISZ/+8J3bhLTztQOEF/h8TEDc+91sUHzlvvy70FCk/nY3+G5bakXbgO
         PTgYmNFjveIZS6+2FY/VEonR1hmjYScNbi6CaUe4bK4UhStZPgbv+3p25NmP+bh4uOlz
         Gj0uAtFWNV6FpsRqe2sx5tGMSM/FrrVhLpxvMDNu1uOKCTeImTaVRXJEX3rArcyb5iTl
         u7YQ==
X-Gm-Message-State: AOJu0Yyx01VBm4zkPbN1sMBL+hm1nVo/hpa71f9wHkrFjLB9Zxt2b6Co
	u4YSmPTpGyeVc++XL36Bramv+DU+kpGKD/6uXZcS0W9KvnzBPJmt9bLBDHuxn2pvO1YUN1LZiEc
	CARBb1trkB5ygZ3C6Onl5Bfmlzjw1FRPu5gXxa0A=
X-Gm-Gg: ASbGncu8lpi22cHcIFc43+ZT5O1hNDZupSQQZLeLPELd8J/XZSQHipeVrkm8d0Hnab7
	hQ0/ElZyDCQrxhA93Dg4hQsmS/XE2+i+mrTGAstYHIIAz61zCcD9xugtXr5rYnbI3In94WzApLE
	RyWYyJQMajUOsF2wwB/E3f9kd0NQ0qfgF43/n7cH5hI+y674pZSPMuDUx92Yt8OdLmLPJA+fBc6
	lcAwF5un1ruahG0iZikb2Amf3h3bBFoXvb9AxtJMpcoQ/sw0JcbGmRYI2FTqn518UcoZAu7BaMo
	neCL5YEdfYDwWcgdiaTkXWQ=
X-Google-Smtp-Source: AGHT+IFuBLQU6oxWDgRrA1AiFqjx2NwfiNCWoayl36MeP4/ILkKcCvI/tg2LGijKjL/moUDAHEGUq7wxpSQ74KvYyCg=
X-Received: by 2002:a53:daca:0:b0:5fc:53ab:a49c with SMTP id
 956f58d0204a3-634779e8f2fmr1494726d50.11.1758254511304; Thu, 18 Sep 2025
 21:01:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250918071548.3934769-1-hongxu.jia@windriver.com> <20250918071548.3934769-2-hongxu.jia@windriver.com>
In-Reply-To: <20250918071548.3934769-2-hongxu.jia@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 18 Sep 2025 21:01:25 -0700
X-Gm-Features: AS18NWCJ9PVyPXARHUd57t8B8Bhnrn65p_BTDo6sY4TNI5pNkvRa6aq1ttXEzOA
Message-ID: <CAMKF1spt3grZYZw3TmZTWQVWCip3kewWNCdxMhhHsY5yANkraA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 2/4] python3-frozenlist: support reproducible
To: hongxu.jia@eng.windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Sep 2025 04:01:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119587

seeing

stdio: ERROR: python3-frozenlist-1.7.0-r0 do_package_qa: QA Issue:
File /usr/src/debug/python3-frozenlist/1.7.0/frozenlist/_frozenlist.cpp
in package python3-frozenlist-src contains reference to TMPDIR
[buildpaths]
stdio: ERROR: python3-frozenlist-1.7.0-r0 do_package_qa: Fatal QA
errors were found, failing task.


See - https://autobuilder.yoctoproject.org/valkyrie/?#/builders/81/builds/9=
35

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
>  .../files/0001-build-wheel-in-place.patch     | 31 +++++++++++++++++++
>  .../python/python3-frozenlist_1.7.0.bb        |  3 ++
>  2 files changed, 34 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/files/0001-build-=
wheel-in-place.patch
>
> diff --git a/meta-python/recipes-devtools/python/files/0001-build-wheel-i=
n-place.patch b/meta-python/recipes-devtools/python/files/0001-build-wheel-=
in-place.patch
> new file mode 100644
> index 0000000000..84f81da775
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/files/0001-build-wheel-in-place=
.patch
> @@ -0,0 +1,31 @@
> +From 606843ad079d9d0dac1172533d42b5a2327b99ed Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Wed, 17 Sep 2025 15:41:09 +0800
> +Subject: [PATCH] build wheel in place
> +
> +In order to make the generated library be reproducible, build wheel
> +in source dir other than tmp dir (/tmp/xxxxxx), then yocto toolchain's
> +option -fdebug-prefix-map could work as expected
> +
> +Upstream-Status: Pending
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + packaging/pep517_backend/_backend.py | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/packaging/pep517_backend/_backend.py b/packaging/pep517_bac=
kend/_backend.py
> +index 61cad34..d5d839e 100644
> +--- a/packaging/pep517_backend/_backend.py
> ++++ b/packaging/pep517_backend/_backend.py
> +@@ -316,7 +316,7 @@ def build_wheel(
> +     """
> +     with maybe_prebuild_c_extensions(
> +             line_trace_cython_when_unset=3DFalse,
> +-            build_inplace=3DFalse,
> ++            build_inplace=3DTrue,
> +             config_settings=3Dconfig_settings,
> +     ):
> +         return _setuptools_build_wheel(
> +--
> +2.34.1
> +
> diff --git a/meta-python/recipes-devtools/python/python3-frozenlist_1.7.0=
.bb b/meta-python/recipes-devtools/python/python3-frozenlist_1.7.0.bb
> index 7d813a026c..d832494c82 100644
> --- a/meta-python/recipes-devtools/python/python3-frozenlist_1.7.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-frozenlist_1.7.0.bb
> @@ -7,6 +7,9 @@ SRC_URI[sha256sum] =3D "2e310d81923c2437ea8670467121cc3e9=
b0f76d3043cc1d2331d56c7fb
>
>  inherit pypi python_setuptools_build_meta cython
>
> +SRC_URI +=3D " \
> +    file://0001-build-wheel-in-place.patch \
> +"
>  DEPENDS +=3D " \
>      python3-expandvars-native \
>  "
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119531): https://lists.openembedded.org/g/openembedde=
d-devel/message/119531
> Mute This Topic: https://lists.openembedded.org/mt/115306109/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

