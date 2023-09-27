Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7228FE82CDF
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 21:22:25 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web10.490.1695849740475390348
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Sep 2023 14:22:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cZggj3Xw;
 spf=pass (domain: gmail.com, ip: 209.85.167.182, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3af5fda8f6fso734013b6e.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 14:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695849740; x=1696454540; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ErWMcTam8kPqhHE69ak4WPcsGclNKztdGVqzhBjV9+I=;
        b=cZggj3Xw9KtU85kg/9zQDCd9pZJyA2PyqaIf3Jls7MkqYuSi3CJnvR+DkxiU3hGYzY
         hL7IdJOpbeCCvbNJeuhRZX57MmO6ZulQEYgBTnc6rvZCjIFxH/nZOYLSgdSJQE+nSKHy
         ebCG161vkk20B4+exMSt7ToTOWAPRPdfHuYLRrYP/xjkWoxn5mRldqoV0HWrl2LhTyIf
         nRcoc1B1BUQF3U/6kFeV8PhubxTP0yxqtaEIZ6n8S1/tzI5wyd4kRkltSnqj0/LrKb9w
         xV9C9k6Dch0mjRIdVJTX6i4hHUDwx02GCUfrg5L5dQcPIbz6FqOyk/1xla4ocpZAar63
         zlRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695849740; x=1696454540;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ErWMcTam8kPqhHE69ak4WPcsGclNKztdGVqzhBjV9+I=;
        b=kqZACezHtwR3M8hVFLT1tJ82jNZldOsuXaSpjR0XzeV19UfUj4amYIpOZlMOyESJc9
         cYbChzB7L6HQyvUbGQVz8EhStq4Oc+K+gSJCU1xifcAGX24uk+ccV7K/M07bgcYOkmwv
         kDgxbWEh0OqzKQng2ke7FJgAD95RabW1ZMG5YI6GCxmQSqflLIgGG6Ql058EdAotLs66
         lYURnYjzhv+UEVTOTr/vehPLwBwwdZHCcsOJq/T4rcCE1Rb7fPIsgeyT5TrR8cDnSBvk
         U5cGOSg3ygUkpvmjp2b8c6zR0dTzVercW4vPApZ7yWM++OtZdB+YIHTwxo93kvdwbwRG
         M7vw==
X-Gm-Message-State: AOJu0Yy6s7omJ7FIX9Cprpd0Qw9bwYq9m8s55EvN72+me8gPOWsbNaFG
	NE9QG6q/5B4RWxUzemce6BvuIsDTU+P0ltwv253eXxZMwnR6oA==
X-Google-Smtp-Source: AGHT+IFwEg/Ri+Z1EF8HGK42MJeaoVs57n7m0OkJyvYLXWr/QVlDIkfS0LWPXYzX7/XnkMw8sWOfYEYksjb9P6VFCvE=
X-Received: by 2002:a05:6870:f718:b0:1d0:e372:6c2d with SMTP id
 ej24-20020a056870f71800b001d0e3726c2dmr3764340oab.0.1695849739563; Wed, 27
 Sep 2023 14:22:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230927062605.1703566-1-derek@asterius.io>
In-Reply-To: <20230927062605.1703566-1-derek@asterius.io>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 Sep 2023 14:21:53 -0700
Message-ID: <CAMKF1spTyPVsn4StBfFFkwyECV9giRc=UGC=XN7BmoxXZKSvYw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-pytz-deprecation-shim: Remove
 outdated recipe meant to be a short lived shim
To: Derek Straka <derek@asterius.io>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 21:22:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105211

On Tue, Sep 26, 2023 at 11:26=E2=80=AFPM Derek Straka <derek@asterius.io> w=
rote:
>
> The upstream package hasn't been updated since 2020 and was meant to be a=
 short term bridge to remote pytz.  As noted in the usage documents, "This =
library is intended for temporary usage only, and should allow you to drop =
your dependency on pytz while also giving your users notice that eventually=
 you will remove support for the pytz-specific interface."  Three years sho=
uld be sufficient for folks to move on from a temp library, so removing the=
 recipe.

I am fine with reasoning to remove it but we also need to remove the
recipes depending on it.
meta-python/recipes-devtools/python/python3-tzlocal_5.0.1.bb depends
on it. Additionally this needs to be
removed from meta-python/recipes-core/packagegroups/packagegroup-meta-pytho=
n.bb

Finally, commit msg is a long one line. Please reformat it so it is
readable on a terminal with 80 columns.

>
> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>  .../python3-pytz-deprecation-shim_0.1.0.post0.bb  | 15 ---------------
>  1 file changed, 15 deletions(-)
>  delete mode 100644 meta-python/recipes-devtools/python/python3-pytz-depr=
ecation-shim_0.1.0.post0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-pytz-deprecation=
-shim_0.1.0.post0.bb b/meta-python/recipes-devtools/python/python3-pytz-dep=
recation-shim_0.1.0.post0.bb
> deleted file mode 100644
> index 022cf39ac..000000000
> --- a/meta-python/recipes-devtools/python/python3-pytz-deprecation-shim_0=
.1.0.post0.bb
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -SUMMARY =3D "Shims to help you safely remove pytz"
> -HOMEPAGE =3D "https://github.com/pganssle/pytz-deprecation-shim"
> -LICENSE =3D "Apache-2.0"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dfca9fd5c15a28eb874ba38577a585=
d48"
> -
> -SRC_URI[sha256sum] =3D "af097bae1b616dde5c5744441e2ddc69e74dfdcb0c263129=
610d85b87445a59d"
> -
> -PYPI_PACKAGE =3D "pytz_deprecation_shim"
> -PYPI_SRC_URI =3D "https://files.pythonhosted.org/packages/94/f0/909f94fe=
a74759654390a3e1a9e4e185b6cd9aa810e533e3586f39da3097/${PYPI_PACKAGE}-${PV}.=
tar.gz"
> -
> -inherit pypi python_setuptools_build_meta
> -
> -RDEPENDS:${PN} +=3D "\
> -        ${PYTHON_PN}-zoneinfo \
> -"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105170): https://lists.openembedded.org/g/openembedde=
d-devel/message/105170
> Mute This Topic: https://lists.openembedded.org/mt/101612869/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

