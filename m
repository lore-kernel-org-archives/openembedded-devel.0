Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20CC0C77B75
	for <webhook@archiver.kernel.org>; Wed, 10 May 2023 00:23:36 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web11.5114.1683678209442869510
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 May 2023 17:23:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=IIocoxjF;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-195c83a9ed8so3803767fac.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 17:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683678209; x=1686270209;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aU1fSHU/MDBPHSnVeeqWXZCGqiU+exP6tfPs+JlXL5k=;
        b=IIocoxjFCtnDbUmrV0gg1oM7yJZ6ylbZKwYj0ZicJLwtveaQf99+u0bp8QHpH1aAI8
         3DXrB29/CdpeSIMA867+febQoBOp8aVX5SiZvkhWucrSO17ViHEigCPXP5G0NwPT+3mE
         P8dx09s9a0Cq3ZRJgfOjcwQC3DgRfHbWrM3GulHZlOnxqTX2mLiUrncyLaSmnbb4FCQz
         4CPgN/tNwzKqQaknmDSUA5equGKxpkBlq3kzCW7uNoHzoselZkW1QdGFGyl19AwySTE9
         RD0ZEeUcZlxZnGk/DZV9Ozr2U5VoLmq4vJsZbLLnHuJN2klIVxuXAO2+XSyDMg6gJyAj
         OOsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683678209; x=1686270209;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aU1fSHU/MDBPHSnVeeqWXZCGqiU+exP6tfPs+JlXL5k=;
        b=ZcdSWK3e9eAs4DhTaS5PBdQhxnHU3ZT/NJo9rqhubrzf7P5Oc9zK5dRZI0Ym+gf+K+
         e1A6mLhzQHW6rovIYY+ry26OSDaDi6v4OcPBShbkSW43JM9ZPHmUBGDICa1wtsG7NjYq
         R1HlMSaojND14nja4JPuIJobdt2SKgZPdd7GfTI5DUks3b3t2w93F1B/6AzdwuD4aOpH
         daDq/OK3sLveyQKaO/XQym0O1U1lxK35AJipx+adRwp3R1YS8/RgfzIb6xu7W10Lbh5t
         PTwJPN5hWCw5zjz8TfwRAm907rpOunY50tLABiVfEOIPW2fGv6UgGsb0XAxB9bq5vHup
         bDNg==
X-Gm-Message-State: AC+VfDxwA96Vmrlqm9EaqEr1GPpZUOaIpcVlzg7NdSuWxAumvA3nFTP4
	8BcZ7jmKELWzYyrXQXqYVJOA9NfMg2aGUNkK0Gg=
X-Google-Smtp-Source: ACHHUZ4NUnlih75wHbfaBvHoXKhJD02jV8gpoJAXwu4M8VTrio9/HL9fbZsaEkx4Ltbk2t/LVEM5LpkDuFEik9Ayk3s=
X-Received: by 2002:a05:6808:614e:b0:38c:5a32:325b with SMTP id
 dl14-20020a056808614e00b0038c5a32325bmr2541016oib.41.1683678208500; Tue, 09
 May 2023 17:23:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230509065940.1584276-1-jun.nie@linaro.org> <20230509065940.1584276-3-jun.nie@linaro.org>
In-Reply-To: <20230509065940.1584276-3-jun.nie@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 9 May 2023 17:23:02 -0700
Message-ID: <CAMKF1srzicnZJ8kC6UMk76TeEcuDfMFoyowkhgACY+o0P51riA@mail.gmail.com>
Subject: Re: [meta-oe 2/3] python3-pefile: Add initial support
To: Jun Nie <jun.nie@linaro.org>
Cc: richard@hughsie.com, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 May 2023 00:23:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102516

how was this tested ?

For new recipes its always good to do a bitbake -ccleanall <recipe> &&
bitbake recipe as a sanity check before sending.

I am seeing fetch errors like below

File: '/mnt/b/yoe/master/downloads/pefile-2023.2.7.tar.gz.tmp' has
sha256 checksum
'82e6114004b3d6911c77c3953e3838654b04511b8b66e8583db70c65998017dc'
when '11cd7ed7082d5256e9741e8b98c654f061723fafb5b2719c01a0b4cc6f
89e09d' was expected
If this change is expected (e.g. you have upgraded to a new version
without updating the checksums) then you can use these lines within
the recipe:
SRC_URI[sha256sum] =3D
"82e6114004b3d6911c77c3953e3838654b04511b8b66e8583db70c65998017dc"

On Mon, May 8, 2023 at 11:58=E2=80=AFPM Jun Nie <jun.nie@linaro.org> wrote:
>
> To parse and work with Portable Executable (PE) files
>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  .../python/python3-pefile_2023.2.7.bb               | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-pefile_20=
23.2.7.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-pefile_2023.2.7.=
bb b/meta-python/recipes-devtools/python/python3-pefile_2023.2.7.bb
> new file mode 100644
> index 0000000000..37e27b1a03
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pefile_2023.2.7.bb
> @@ -0,0 +1,13 @@
> +SUMMARY =3D "Python PE parsing module"
> +DESCRIPTION =3D "A multi-platform Python module to parse and work with P=
ortable Executable (PE) files."
> +HOMEPAGE =3D "https://github.com/erocarrera/pefile"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D38066667888b01d8118ff9cc23da1=
873"
> +
> +inherit setuptools3 pypi ptest
> +SRC_URI[sha256sum] =3D "11cd7ed7082d5256e9741e8b98c654f061723fafb5b2719c=
01a0b4cc6f89e09d"
> +
> +PIP_INSTALL_PACKAGE =3D "pefile"
> +PIP_INSTALL_DIST_PATH =3D "${S}/dist"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.34.1
>

