Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFDB2C4828D
	for <webhook@archiver.kernel.org>; Sat,  3 Feb 2024 07:25:49 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web11.13224.1706945141611567665
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Feb 2024 23:25:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VBLAW2bA;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-218f4589f0cso1282741fac.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 02 Feb 2024 23:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706945141; x=1707549941; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E+m8/tVLCEqfi03DU90/mG4l64JUUSFjwJcuv0SEKWI=;
        b=VBLAW2bAfpNkB7PNOoWxFSqSjEWe4HFqiPIc+O6dePUjDQ76ZAJjLyuQ3TlBa4RIRh
         gt3e1+y1EicACVARshhcBddekvxCnmKajlLvSLC63K7r5pj90ool7/oGu3lYncPWdhMk
         w8nPs8YV68ecdYl50gDIcrevMi+cU6zIG7V+Duk1jEImY3h+prRzjmxQGXGHirgw+n5r
         eI7ddJt9ZGPz7byjOpLe+hZQzfBcdXSxijJDfnXn/Jnws7r+VcibppmznYG8o8EwsdcV
         f+1WX145Nuo+gIX4UhmJYWSONBqrsOZtf4HFm4hOdf3eH1eAVsh+rs8CT8mkUvK7L1zY
         4lxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706945141; x=1707549941;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E+m8/tVLCEqfi03DU90/mG4l64JUUSFjwJcuv0SEKWI=;
        b=XZ1axPF8pMaMwT1cnq+blyJirv3vY0eIhAre5yRW1ukdZTRdJ9FqPpD6ABQvLktzNP
         kzZY6UOKj2F+5vdpNZQtqU1loJqvZ/V6Ejr18oW4wR8vBc63UJl9lk4x7JVMMJ2WFRCX
         hkFGQPEGTEa3beUvZIwfT4GXtLoJOgohSctkYDIlNFYM6yqzUMcRv/2xChaw5yqJunxD
         7zj1FIMv2YF8bHLTnSai6XJHeBJWv2nzp6jZwIedUsR2cdWpaWlkf1uqkzx/kccbvdJU
         T5PWkGZvBfaYprmGiS55x3RpI8SmSVZ81ACHg4ckHLxm8dsSUBiAgLj6VQJyAp1wSx9B
         ekYw==
X-Gm-Message-State: AOJu0Yw57DAVAGCDZrEvG4x1Nww/PBfjT5Y/L9b2CkznxP87u1AP26v3
	9V9x3xsaZBdnNsWJ3cyCLKvrTld8kePBs+38GsF+iEuBwNt5BtWSHYtLFHvxtIo6SG09aCpSn4n
	c8cG+6XJY4o5BRi75qWYR+7uz4ZvmwSR5o4V4Rw==
X-Google-Smtp-Source: AGHT+IH/YC2gAFz183F8AgZFHy3eY0UFpwjvaCfDOOVAh1NvuwVqsZhP+rlg/vRRMfHuo1g84HF+e8dLyReL1vUBIVA=
X-Received: by 2002:a05:6870:2249:b0:219:194b:cbfb with SMTP id
 j9-20020a056870224900b00219194bcbfbmr1833033oaf.0.1706945140547; Fri, 02 Feb
 2024 23:25:40 -0800 (PST)
MIME-Version: 1.0
References: <20240202203453.1576669-1-derek@asterius.io>
In-Reply-To: <20240202203453.1576669-1-derek@asterius.io>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 2 Feb 2024 23:25:14 -0800
Message-ID: <CAMKF1sr5WRksy7Z9mWiqdvtcabRka6k8SHCJojwp4ofUn-f8tA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCHv2] python3-pyroute2: update to version 0.7.11
To: Derek Straka <derek@asterius.io>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 03 Feb 2024 07:25:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108555

fails ptests on qemux86-64

you can run it by

bitbake meta-python-image-ptest-python3-pyroute2
runqemu kvm

root@qemux86-64:/usr/lib/python3-pyroute2/ptest# ./run-ptest
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D test session starts =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
platform linux -- Python 3.12.1, pytest-7.4.4, pluggy-1.3.0
rootdir: /usr/lib/python3-pyroute2/ptest
collected 0 items / 1 error

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D ERRORS =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
________________________ ERROR collecting test session ____________________=
_____
Defining 'pytest_plugins' in a non-top-level conftest is no longer supporte=
d:
It affects the entire test suite instead of just below the conftest as expe=
cted.
  /usr/lib/python3-pyroute2/ptest/tests/test_lab/conftest.py
Please move it to a top level conftest file at the rootdir:
  /usr/lib/python3-pyroute2/ptest
For more information, visit:
  https://docs.pytest.org/en/stable/deprecations.html#pytest-plugins-in-non=
-top-level-conftest-files
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D short test summary info =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
ERROR  - Failed: Defining 'pytest_plugins' in a non-top-level conftest is n=
o ...
!!!!!!!!!!!!!!!!!!!! Interrupted: 1 error during collection !!!!!!!!!!!!!!!=
!!!!!
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D 1 error in 0.11s =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

On Fri, Feb 2, 2024 at 12:35=E2=80=AFPM Derek Straka <derek@asterius.io> wr=
ote:
>
> Leverage git repo as src is not published in latest pypi release
>
> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>  ...route2_0.7.10.bb =3D> python3-pyroute2_0.7.11.bb} | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
>  rename meta-python/recipes-devtools/python/{python3-pyroute2_0.7.10.bb =
=3D> python3-pyroute2_0.7.11.bb} (82%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pyroute2_0.7.10.=
bb b/meta-python/recipes-devtools/python/python3-pyroute2_0.7.11.bb
> similarity index 82%
> rename from meta-python/recipes-devtools/python/python3-pyroute2_0.7.10.b=
b
> rename to meta-python/recipes-devtools/python/python3-pyroute2_0.7.11.bb
> index 6b340a18c..7b170147b 100644
> --- a/meta-python/recipes-devtools/python/python3-pyroute2_0.7.10.bb
> +++ b/meta-python/recipes-devtools/python/python3-pyroute2_0.7.11.bb
> @@ -4,9 +4,15 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Ddccbff78d7d79=
ae7e53953d43445c6e6 \
>                      file://LICENSE.GPL-2.0-or-later;md5=3Db234ee4d69f5fc=
e4486a80fdaf4a4263 \
>                      file://LICENSE.Apache-2.0;md5=3D34281e312165f843a2b7=
d1f114fe65ce"
>
> -SRC_URI[sha256sum] =3D "cc2f90aad1517cb0b301041f678cc8d3c3427c26e53f15c7=
8c93c67928d89a02"
> +SRCREV =3D "cd8b8947f18f102875ce64c6d2094ba2be59dc35"
> +SRC_URI =3D " \
> +           git://github.com/svinota/pyroute2.git;branch=3Dmaster;protoco=
l=3Dhttps \
> +           file://run-ptest \
> +"
> +
> +inherit setuptools3 ptest
>
> -inherit setuptools3 pypi ptest
> +S =3D "${WORKDIR}/git"
>
>  RDEPENDS:${PN} +=3D " \
>      python3-ctypes \
> @@ -22,10 +28,6 @@ RDEPENDS:${PN} +=3D " \
>      python3-unixadmin \
>  "
>
> -SRC_URI +=3D " \
> -    file://run-ptest \
> -"
> -
>  RDEPENDS:${PN}-ptest +=3D " \
>      python3-pytest \
>      python3-fcntl \
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108544): https://lists.openembedded.org/g/openembedde=
d-devel/message/108544
> Mute This Topic: https://lists.openembedded.org/mt/104127681/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

