Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84AA9C52D7C
	for <webhook@archiver.kernel.org>; Fri,  9 Aug 2024 15:16:56 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.86400.1723216608296386458
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Aug 2024 08:16:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Px0NnhKd;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: alperyasinak1@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7a10b293432so1567306a12.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 08:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723216607; x=1723821407; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jCAe1644K9G3hlTphniz5CG+/3Zd1sD0Nk62hLNtL3s=;
        b=Px0NnhKdHL7GeYQZfIG9dv5IYTSjt0tJ9LsEytDc4evJdsj99ljqonQSVtdn4Ee1kS
         IpkrXgBe03B1V8DnS0mmbFBcYT4kruMAVeeOVvUSZ1/BDsu0JYCmuTpYzVef5MJ1F7o7
         W5C98NoKbjgaYMVdY/n+R10Y1W95q/CGc4aLfqvvLZ91Lj0VYKcBKN0O68McZ/8I6L9p
         PFDadMiQR0c/+wJpIf4zwnB7PAp8w+LQNSUpEW1YfZFFk5ewqVOnFaxBqjwSli5uZbFm
         I9WKGx2f9/BXP9VnhtQYr0XSAu4flv5F670BXlVKdVw0VfKn4Otpvji0xS+Bff0bGDrr
         +buA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723216607; x=1723821407;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jCAe1644K9G3hlTphniz5CG+/3Zd1sD0Nk62hLNtL3s=;
        b=Tkr03h5paRGvBgyFsILA4pF+qIQCT8lzdncbH4KjR7NW14O6u414rZlOMURLJ/HZL7
         UPO/0Wf7K4yp01Ib07qEQAhvOGZaeKh8/8NHoaujyAL6mdDGAI2EY6Pj6czUaquyO0Jz
         mpqDcGr80HABnRPcD5lrhNLDtkxxwBBWl46KJAMOP3DsiGKy2e/wrEk6/DHLWLVg1gMf
         7JWDpUsvkv1tMRk8nyP8xlBSmbJ7Jxrzg7PoctP6Gyek++a8NSGEGBigsD0Gvx/sSzyY
         EPj9oIQy99TJUDjJjJ1yKRksrHHU/N97jiifzhz964bxWUeFMw63hCTqepjvYX3W4apU
         pLJQ==
X-Gm-Message-State: AOJu0YwX5hk8+z/9DeDOeSIRnfjOpnefQCkVmMDFF0ebDQu/sy8jbKRF
	k0WXhbbFaNBvVA97Ech2VdGOxJS7pFgB+b0iaV4Byvk2hZg75sJopV+fxHNhXUCkKzb0niAiBU0
	UOIMsqXJO0MvYpY63ECc2TzrAcCh+Ym7K
X-Google-Smtp-Source: AGHT+IFn7PQaS0vkpEkftVCw0qoWaOt9TYIoxMCWz57wRqtTk5HsbU9mnyZEi+fQm/GiepmfUgckc/xPV1VBemBbYBo=
X-Received: by 2002:a17:902:e892:b0:1fa:fc24:afa5 with SMTP id
 d9443c01a7336-200ae4f989amr19168765ad.27.1723216607172; Fri, 09 Aug 2024
 08:16:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240809142453.54368-1-alperyasinak1@gmail.com>
In-Reply-To: <20240809142453.54368-1-alperyasinak1@gmail.com>
From: Alper Ak <alperyasinak1@gmail.com>
Date: Fri, 9 Aug 2024 18:16:35 +0300
Message-ID: <CAGpma=4rc1JxUpLQhjDFcMX8YNj2Upk0Y15xX8-t7ZRVVwpccg@mail.gmail.com>
Subject: Re: [meta-python][PATCH] recipes: switch to PEP-517 build backend
To: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000bde271061f41a1a7"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 15:16:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111695

--000000000000bde271061f41a1a7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please, don't apply this, I did it wrong. Will resend as a series shortly.

alperak <alperyasinak1@gmail.com>, 9 A=C4=9Fu 2024 Cum, 17:24 tarihinde =C5=
=9Funu
yazd=C4=B1:

> - Recipes updated with correct PEP-517 build backend
> - Dropped unnecessary PYPI_PACKAGE set
> - Dependencies updated
> - python3-greenlet was supposed to be native because of the python3-geven=
t
> build. It's python3-gevent's dependency
>
> Signed-off-by: alperak <alperyasinak1@gmail.com>
> ---
>  .../recipes-devtools/python/python3-argcomplete_3.4.0.bb      | 4 ++--
>  meta-python/recipes-devtools/python/python3-django_5.0.6.bb   | 2 +-
>  meta-python/recipes-devtools/python/python3-gevent_24.2.1.bb  | 4 ++--
>  meta-python/recipes-devtools/python/python3-greenlet_3.0.3.bb | 4 +++-
>  .../recipes-devtools/python/python3-parse-type_0.6.2.bb       | 2 +-
>  .../recipes-devtools/python/python3-py-cpuinfo_9.0.0.bb       | 2 +-
>  .../recipes-devtools/python/python3-pyasn1-modules_0.4.0.bb   | 2 +-
>  meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb    | 2 +-
>  .../recipes-devtools/python/python3-pyroute2_0.7.12.bb        | 2 +-
>  .../recipes-devtools/python/python3-pytest-metadata_2.0.2.bb  | 4 +---
>  .../recipes-devtools/python/python3-pytest-timeout_2.3.1.bb   | 4 +---
>  .../recipes-devtools/python/python3-regex_2024.7.24.bb        | 2 +-
>  .../python/python3-service-identity_21.1.0.bb                 | 2 +-
>  13 files changed, 17 insertions(+), 19 deletions(-)
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-argcomplete_3.4.0.bb b/meta-python/recipes-devtools/python/
> python3-argcomplete_3.4.0.bb
> index be3ded82b..d350a6342 100644
> --- a/meta-python/recipes-devtools/python/python3-argcomplete_3.4.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-argcomplete_3.4.0.bb
> @@ -5,9 +5,9 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE.rst;md5=3D2ee41112a44fe7014dce33e26468ba93"
>
>  SRC_URI[sha256sum] =3D
> "c2abcdfe1be8ace47ba777d4fce319eb13bf8ad9dace8d085dcad6eded88057f"
>
> -PYPI_PACKAGE =3D "argcomplete"
> +inherit pypi python_setuptools_build_meta
>
> -inherit pypi setuptools3
> +DEPENDS +=3D "python3-setuptools-scm-native"
>
>  RDEPENDS:${PN} +=3D "\
>      python3-core \
> diff --git a/meta-python/recipes-devtools/python/python3-django_5.0.6.bb
> b/meta-python/recipes-devtools/python/python3-django_5.0.6.bb
> index 69b25742d..513032876 100644
> --- a/meta-python/recipes-devtools/python/python3-django_5.0.6.bb
> +++ b/meta-python/recipes-devtools/python/python3-django_5.0.6.bb
> @@ -1,5 +1,5 @@
>  require python-django.inc
> -inherit setuptools3
> +inherit python_setuptools_build_meta
>
>  SRC_URI[sha256sum] =3D
> "ff1b61005004e476e0aeea47c7f79b85864c70124030e95146315396f1e7951f"
>
> diff --git a/meta-python/recipes-devtools/python/python3-gevent_24.2.1.bb
> b/meta-python/recipes-devtools/python/python3-gevent_24.2.1.bb
> index 806e09391..e44972178 100644
> --- a/meta-python/recipes-devtools/python/python3-gevent_24.2.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-gevent_24.2.1.bb
> @@ -4,7 +4,7 @@ a high-level synchronous API on top of the libevent event
> loop."
>  HOMEPAGE =3D "http://www.gevent.org"
>  LICENSE =3D "MIT & Python-2.0"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4de99aac27b470c29c6c309e0c279=
b65"
> -DEPENDS +=3D "python3-greenlet libev libuv c-ares python3-cython-native"
> +DEPENDS +=3D "python3-greenlet-native python3-greenlet libev libuv
> python3-cython-native python3-cffi-native"
>
>  RDEPENDS:${PN} =3D "python3-greenlet \
>                   python3-mime \
> @@ -18,7 +18,7 @@ SRC_URI +=3D
> "file://0001-_setuputils.py-Do-not-add-sys_inc_dir.patch \
>
>  SRC_URI[sha256sum] =3D
> "432fc76f680acf7cf188c2ee0f5d3ab73b63c1f03114c7cd8a34cebbe5aa2056"
>
> -inherit pypi setuptools3
> +inherit pypi python_setuptools_build_meta
>
>  # Don't embed libraries, link to the system provided libs instead
>  export GEVENTSETUP_EMBED_CARES =3D "0"
> diff --git a/meta-python/recipes-devtools/python/python3-greenlet_3.0.3.b=
b
> b/meta-python/recipes-devtools/python/python3-greenlet_3.0.3.bb
> index abd6c49ca..a79db0049 100644
> --- a/meta-python/recipes-devtools/python/python3-greenlet_3.0.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-greenlet_3.0.3.bb
> @@ -6,4 +6,6 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3De95668d68e4329085c7ab3535e6a7aee \
>
>  SRC_URI[sha256sum] =3D
> "43374442353259554ce33599da8b692d5aa96f8976d567d4badf263371fbe491"
>
> -inherit pypi setuptools3
> +inherit pypi python_setuptools_build_meta
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> diff --git a/meta-python/recipes-devtools/python/
> python3-parse-type_0.6.2.bb b/meta-python/recipes-devtools/python/
> python3-parse-type_0.6.2.bb
> index a7d8cd86c..7e7ff8926 100644
> --- a/meta-python/recipes-devtools/python/python3-parse-type_0.6.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-parse-type_0.6.2.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D2e469278ace89c246d52505acc39c3da"
>  SRC_URI[sha256sum] =3D
> "79b1f2497060d0928bc46016793f1fca1057c4aacdf15ef876aa48d75a73a355"
>
>  PYPI_PACKAGE =3D "parse_type"
> -inherit pypi ptest setuptools3
> +inherit pypi ptest python_setuptools_build_meta
>
>  RDEPENDS:${PN} +=3D "python3-parse"
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-py-cpuinfo_9.0.0.bb b/meta-python/recipes-devtools/python/
> python3-py-cpuinfo_9.0.0.bb
> index 857afd1db..20a401131 100644
> --- a/meta-python/recipes-devtools/python/python3-py-cpuinfo_9.0.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-py-cpuinfo_9.0.0.bb
> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3Dd2379ecb0d7a8299101b1e4c160cd1f7"
>
>  SRC_URI[sha256sum] =3D
> "3cdbbf3fac90dc6f118bfd64384f309edeadd902d7c8fb17f02ffa1fc3f49690"
>
> -inherit ptest pypi setuptools3
> +inherit ptest pypi python_setuptools_build_meta
>
>  SRC_URI +=3D "file://run-ptest \
>              file://0001-test_cli.py-disable.patch \
> diff --git a/meta-python/recipes-devtools/python/
> python3-pyasn1-modules_0.4.0.bb b/meta-python/recipes-devtools/python/
> python3-pyasn1-modules_0.4.0.bb
> index 34f3639e5..48372d917 100644
> --- a/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.4.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.4.0.bb
> @@ -10,7 +10,7 @@ SRC_URI[sha256sum] =3D
> "831dbcea1b177b28c9baddf4c6d1013c24c3accd14a1873fffaa6a2e90
>
>  PYPI_PACKAGE =3D "pyasn1_modules"
>
> -inherit pypi ptest setuptools3
> +inherit pypi ptest python_setuptools_build_meta
>
>  RDEPENDS:${PN} =3D "python3-pyasn1"
>
> diff --git a/meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb
> b/meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb
> index 92a8f44c6..06d481a3b 100644
> --- a/meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb
> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3De4b56d2c9973d8cf54655555be06e551"
>  SRC_URI[sha256sum] =3D
> "57e28d156e3d5c10088e0c68abb90bfac3df82b40a71bd0daa20c65ccd5c23de"
>
>  PYPI_PACKAGE =3D "PyJWT"
> -inherit pypi setuptools3
> +inherit pypi python_setuptools_build_meta
>
>  RDEPENDS:${PN} =3D " \
>      python3-json \
> diff --git a/meta-python/recipes-devtools/python/
> python3-pyroute2_0.7.12.bb b/meta-python/recipes-devtools/python/
> python3-pyroute2_0.7.12.bb
> index 3ea980f44..cf9885df7 100644
> --- a/meta-python/recipes-devtools/python/python3-pyroute2_0.7.12.bb
> +++ b/meta-python/recipes-devtools/python/python3-pyroute2_0.7.12.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3Ddccbff78d7d79ae7e53953d43445c6e6 \
>
>  SRC_URI[sha256sum] =3D
> "54d226fc3ff2732f49bac9b26853c50c9d05be05a4d9daf09c7cf6d77301eff3"
>
> -inherit setuptools3 pypi ptest
> +inherit python_setuptools_build_meta pypi ptest
>
>  RDEPENDS:${PN} +=3D " \
>      python3-ctypes \
> diff --git a/meta-python/recipes-devtools/python/
> python3-pytest-metadata_2.0.2.bb b/meta-python/recipes-devtools/python/
> python3-pytest-metadata_2.0.2.bb
> index 163a363f8..9243f6646 100644
> --- a/meta-python/recipes-devtools/python/python3-pytest-metadata_2.0.2.b=
b
> +++ b/meta-python/recipes-devtools/python/python3-pytest-metadata_2.0.2.b=
b
> @@ -6,9 +6,7 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D5d425c8f3157dbf212db2ec53d9e5132"
>
>  SRC_URI[sha256sum] =3D
> "fcd2f416f15be295943527b3c8ba16a44ae5a7141939c90c3dc5ce9d167cf2a5"
>
> -PYPI_PACKAGE =3D "pytest-metadata"
> -
> -inherit pypi setuptools3
> +inherit pypi python_poetry_core
>
>  RDEPENDS:${PN} =3D " \
>      python3-pytest \
> diff --git a/meta-python/recipes-devtools/python/
> python3-pytest-timeout_2.3.1.bb b/meta-python/recipes-devtools/python/
> python3-pytest-timeout_2.3.1.bb
> index b56c26aad..fe9d814c0 100644
> --- a/meta-python/recipes-devtools/python/python3-pytest-timeout_2.3.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-pytest-timeout_2.3.1.bb
> @@ -3,10 +3,8 @@ HOMEPAGE =3D "https://github.com/pytest-dev/pytest-timeo=
ut/
> "
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd8048cd156eda3df2e7f111b0ae9c=
eff"
>
> -PYPI_PACKAGE =3D "pytest-timeout"
> -
>  SRC_URI[sha256sum] =3D
> "12397729125c6ecbdaca01035b9e5239d4db97352320af155b3f5de1ba5165d9"
>
> -inherit pypi setuptools3
> +inherit pypi python_setuptools_build_meta
>
>  RDEPENDS:${PN} =3D "python3-pytest"
> diff --git a/meta-python/recipes-devtools/python/
> python3-regex_2024.7.24.bb b/meta-python/recipes-devtools/python/
> python3-regex_2024.7.24.bb
> index 682c30fc9..b6e09fc83 100644
> --- a/meta-python/recipes-devtools/python/python3-regex_2024.7.24.bb
> +++ b/meta-python/recipes-devtools/python/python3-regex_2024.7.24.bb
> @@ -3,7 +3,7 @@ HOMEPAGE =3D "
> https://bitbucket.org/mrabarnett/mrab-regex/src"
>  LICENSE =3D "Apache-2.0"
>  LIC_FILES_CHKSUM =3D
> "file://LICENSE.txt;md5=3D7b5751ddd6b643203c31ff873051d069"
>
> -inherit pypi setuptools3
> +inherit pypi python_setuptools_build_meta
>
>  SRC_URI[sha256sum] =3D
> "9cfd009eed1a46b27c14039ad5bbc5e71b6367c5b2e6d5f5da0ea91600817506"
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-service-identity_21.1.0.bb b/meta-python/recipes-devtools/python/
> python3-service-identity_21.1.0.bb
> index 006fae290..267bbea13 100644
> --- a/meta-python/recipes-devtools/python/
> python3-service-identity_21.1.0.bb
> +++ b/meta-python/recipes-devtools/python/
> python3-service-identity_21.1.0.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D8a0f079f4e6a215d6bd6f9d97cab4d5f"
>  SRC_URI[md5sum] =3D "5e5c195d8fcedc72f9068be2ad9b5a13"
>  SRC_URI[sha256sum] =3D
> "6e6c6086ca271dc11b033d17c3a8bea9f24ebff920c587da090afc9519419d34"
>
> -inherit pypi setuptools3 ptest
> +inherit pypi python_setuptools_build_meta ptest
>
>  SRC_URI +=3D " \
>         file://run-ptest \
> --
> 2.25.1
>
>

--000000000000bde271061f41a1a7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Please, don&#39;t apply this, I did it wrong. Will resend =
as a series shortly.<br></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">alperak &lt;<a href=3D"mailto:alperyasinak1@gmail.c=
om">alperyasinak1@gmail.com</a>&gt;, 9 A=C4=9Fu 2024 Cum, 17:24 tarihinde =
=C5=9Funu yazd=C4=B1:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">- Recipes updated with correct PEP-517 build backend<br>
- Dropped unnecessary PYPI_PACKAGE set<br>
- Dependencies updated<br>
- python3-greenlet was supposed to be native because of the python3-gevent =
build. It&#39;s python3-gevent&#39;s dependency<br>
<br>
Signed-off-by: alperak &lt;<a href=3D"mailto:alperyasinak1@gmail.com" targe=
t=3D"_blank">alperyasinak1@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-argcomplete_3.4=
.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-argcomplete_3.4.0.bb</a=
>=C2=A0 =C2=A0 =C2=A0 | 4 ++--<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-django_=
5.0.6.bb" rel=3D"noreferrer" target=3D"_blank">python3-django_5.0.6.bb</a>=
=C2=A0 =C2=A0| 2 +-<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-gevent_=
24.2.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-gevent_24.2.1.bb</a=
>=C2=A0 | 4 ++--<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-greenle=
t_3.0.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-greenlet_3.0.3.bb<=
/a> | 4 +++-<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-parse-type_0.6.=
2.bb" rel=3D"noreferrer" target=3D"_blank">python3-parse-type_0.6.2.bb</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-py-cpuinfo_9.0.=
0.bb" rel=3D"noreferrer" target=3D"_blank">python3-py-cpuinfo_9.0.0.bb</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-pyasn1-modules_=
0.4.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyasn1-modules_0.4.0=
.bb</a>=C2=A0 =C2=A0| 2 +-<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-pyjwt_2=
.8.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyjwt_2.8.0.bb</a>=C2=
=A0 =C2=A0 | 2 +-<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-pyroute2_0.7.12=
.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyroute2_0.7.12.bb</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-pytest-metadata=
_2.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-metadata_2.0=
.2.bb</a>=C2=A0 | 4 +---<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-pytest-timeout_=
2.3.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-timeout_2.3.1=
.bb</a>=C2=A0 =C2=A0| 4 +---<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-regex_2024.7.24=
.bb" rel=3D"noreferrer" target=3D"_blank">python3-regex_2024.7.24.bb</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0.../python/<a href=3D"http://python3-service-identity_21.1.0.bb" rel=
=3D"noreferrer" target=3D"_blank">python3-service-identity_21.1.0.bb</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A013 files changed, 17 insertions(+), 19 deletions(-)<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
argcomplete_3.4.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-argcompl=
ete_3.4.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://py=
thon3-argcomplete_3.4.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-ar=
gcomplete_3.4.0.bb</a><br>
index be3ded82b..d350a6342 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-argcomp=
lete_3.4.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-argcomplete_3.4=
.0.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-argcomp=
lete_3.4.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-argcomplete_3.4=
.0.bb</a><br>
@@ -5,9 +5,9 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE.rst;md5=3D2ee4111=
2a44fe7014dce33e26468ba93&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;c2abcdfe1be8ace47ba777d4fce319eb13bf8ad9=
dace8d085dcad6eded88057f&quot;<br>
<br>
-PYPI_PACKAGE =3D &quot;argcomplete&quot;<br>
+inherit pypi python_setuptools_build_meta<br>
<br>
-inherit pypi setuptools3<br>
+DEPENDS +=3D &quot;python3-setuptools-scm-native&quot;<br>
<br>
=C2=A0RDEPENDS:${PN} +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0python3-core \<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
django_5.0.6.bb" rel=3D"noreferrer" target=3D"_blank">python3-django_5.0.6.=
bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-djan=
go_5.0.6.bb" rel=3D"noreferrer" target=3D"_blank">python3-django_5.0.6.bb</=
a><br>
index 69b25742d..513032876 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-django_=
5.0.6.bb" rel=3D"noreferrer" target=3D"_blank">python3-django_5.0.6.bb</a><=
br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-django_=
5.0.6.bb" rel=3D"noreferrer" target=3D"_blank">python3-django_5.0.6.bb</a><=
br>
@@ -1,5 +1,5 @@<br>
=C2=A0require python-django.inc<br>
-inherit setuptools3<br>
+inherit python_setuptools_build_meta<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;ff1b61005004e476e0aeea47c7f79b85864c7012=
4030e95146315396f1e7951f&quot;<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
gevent_24.2.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-gevent_24.2.=
1.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-ge=
vent_24.2.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-gevent_24.2.1.=
bb</a><br>
index 806e09391..e44972178 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-gevent_=
24.2.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-gevent_24.2.1.bb</a=
><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-gevent_=
24.2.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-gevent_24.2.1.bb</a=
><br>
@@ -4,7 +4,7 @@ a high-level synchronous API on top of the libevent event l=
oop.&quot;<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"http://www.gevent.org" rel=3D"noreferre=
r" target=3D"_blank">http://www.gevent.org</a>&quot;<br>
=C2=A0LICENSE =3D &quot;MIT &amp; Python-2.0&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D4de99aac27b470c29c6c3=
09e0c279b65&quot;<br>
-DEPENDS +=3D &quot;python3-greenlet libev libuv c-ares python3-cython-nati=
ve&quot;<br>
+DEPENDS +=3D &quot;python3-greenlet-native python3-greenlet libev libuv py=
thon3-cython-native python3-cffi-native&quot;<br>
<br>
=C2=A0RDEPENDS:${PN} =3D &quot;python3-greenlet \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 python3-mime=
 \<br>
@@ -18,7 +18,7 @@ SRC_URI +=3D &quot;file://0001-_setuputils.py-Do-not-add-=
sys_inc_dir.patch \<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;432fc76f680acf7cf188c2ee0f5d3ab73b63c1f0=
3114c7cd8a34cebbe5aa2056&quot;<br>
<br>
-inherit pypi setuptools3<br>
+inherit pypi python_setuptools_build_meta<br>
<br>
=C2=A0# Don&#39;t embed libraries, link to the system provided libs instead=
<br>
=C2=A0export GEVENTSETUP_EMBED_CARES =3D &quot;0&quot;<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
greenlet_3.0.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-greenlet_3.=
0.3.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
greenlet_3.0.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-greenlet_3.=
0.3.bb</a><br>
index abd6c49ca..a79db0049 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-greenle=
t_3.0.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-greenlet_3.0.3.bb<=
/a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-greenle=
t_3.0.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-greenlet_3.0.3.bb<=
/a><br>
@@ -6,4 +6,6 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3De95668d68e4=
329085c7ab3535e6a7aee \<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;43374442353259554ce33599da8b692d5aa96f89=
76d567d4badf263371fbe491&quot;<br>
<br>
-inherit pypi setuptools3<br>
+inherit pypi python_setuptools_build_meta<br>
+<br>
+BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
parse-type_0.6.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-parse-typ=
e_0.6.2.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://pyth=
on3-parse-type_0.6.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-parse=
-type_0.6.2.bb</a><br>
index a7d8cd86c..7e7ff8926 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-parse-t=
ype_0.6.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-parse-type_0.6.2=
.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-parse-t=
ype_0.6.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-parse-type_0.6.2=
.bb</a><br>
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D2e469278ace=
89c246d52505acc39c3da&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;79b1f2497060d0928bc46016793f1fca1057c4aa=
cdf15ef876aa48d75a73a355&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;parse_type&quot;<br>
-inherit pypi ptest setuptools3<br>
+inherit pypi ptest python_setuptools_build_meta<br>
<br>
=C2=A0RDEPENDS:${PN} +=3D &quot;python3-parse&quot;<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
py-cpuinfo_9.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-py-cpuinf=
o_9.0.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://pyth=
on3-py-cpuinfo_9.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-py-cp=
uinfo_9.0.0.bb</a><br>
index 857afd1db..20a401131 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-py-cpui=
nfo_9.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-py-cpuinfo_9.0.0=
.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-py-cpui=
nfo_9.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-py-cpuinfo_9.0.0=
.bb</a><br>
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dd2379ecb0d7=
a8299101b1e4c160cd1f7&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;3cdbbf3fac90dc6f118bfd64384f309edeadd902=
d7c8fb17f02ffa1fc3f49690&quot;<br>
<br>
-inherit ptest pypi setuptools3<br>
+inherit ptest pypi python_setuptools_build_meta<br>
<br>
=C2=A0SRC_URI +=3D &quot;file://run-ptest \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-test_cli.py-dis=
able.patch \<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
pyasn1-modules_0.4.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyasn=
1-modules_0.4.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-pyasn1-modules_0.4.0.bb" rel=3D"noreferrer" target=3D"_blank">p=
ython3-pyasn1-modules_0.4.0.bb</a><br>
index 34f3639e5..48372d917 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-pyasn1-=
modules_0.4.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyasn1-modul=
es_0.4.0.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pyasn1-=
modules_0.4.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyasn1-modul=
es_0.4.0.bb</a><br>
@@ -10,7 +10,7 @@ SRC_URI[sha256sum] =3D &quot;831dbcea1b177b28c9baddf4c6d1=
013c24c3accd14a1873fffaa6a2e90<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;pyasn1_modules&quot;<br>
<br>
-inherit pypi ptest setuptools3<br>
+inherit pypi ptest python_setuptools_build_meta<br>
<br>
=C2=A0RDEPENDS:${PN} =3D &quot;python3-pyasn1&quot;<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
pyjwt_2.8.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyjwt_2.8.0.bb=
</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pyjwt_=
2.8.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyjwt_2.8.0.bb</a><b=
r>
index 92a8f44c6..06d481a3b 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-pyjwt_2=
.8.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyjwt_2.8.0.bb</a><br=
>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pyjwt_2=
.8.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyjwt_2.8.0.bb</a><br=
>
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3De4b56d2c997=
3d8cf54655555be06e551&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;57e28d156e3d5c10088e0c68abb90bfac3df82b4=
0a71bd0daa20c65ccd5c23de&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;PyJWT&quot;<br>
-inherit pypi setuptools3<br>
+inherit pypi python_setuptools_build_meta<br>
<br>
=C2=A0RDEPENDS:${PN} =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0python3-json \<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
pyroute2_0.7.12.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyroute2_0=
.7.12.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python=
3-pyroute2_0.7.12.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyroute2=
_0.7.12.bb</a><br>
index 3ea980f44..cf9885df7 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-pyroute=
2_0.7.12.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyroute2_0.7.12.b=
b</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pyroute=
2_0.7.12.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyroute2_0.7.12.b=
b</a><br>
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Ddccbff78d7d=
79ae7e53953d43445c6e6 \<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;54d226fc3ff2732f49bac9b26853c50c9d05be05=
a4d9daf09c7cf6d77301eff3&quot;<br>
<br>
-inherit setuptools3 pypi ptest<br>
+inherit python_setuptools_build_meta pypi ptest<br>
<br>
=C2=A0RDEPENDS:${PN} +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0python3-ctypes \<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
pytest-metadata_2.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyte=
st-metadata_2.0.2.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"h=
ttp://python3-pytest-metadata_2.0.2.bb" rel=3D"noreferrer" target=3D"_blank=
">python3-pytest-metadata_2.0.2.bb</a><br>
index 163a363f8..9243f6646 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-pytest-=
metadata_2.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-meta=
data_2.0.2.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pytest-=
metadata_2.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-meta=
data_2.0.2.bb</a><br>
@@ -6,9 +6,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D5d425c8f315=
7dbf212db2ec53d9e5132&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;fcd2f416f15be295943527b3c8ba16a44ae5a714=
1939c90c3dc5ce9d167cf2a5&quot;<br>
<br>
-PYPI_PACKAGE =3D &quot;pytest-metadata&quot;<br>
-<br>
-inherit pypi setuptools3<br>
+inherit pypi python_poetry_core<br>
<br>
=C2=A0RDEPENDS:${PN} =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0python3-pytest \<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
pytest-timeout_2.3.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytes=
t-timeout_2.3.1.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-pytest-timeout_2.3.1.bb" rel=3D"noreferrer" target=3D"_blank">p=
ython3-pytest-timeout_2.3.1.bb</a><br>
index b56c26aad..fe9d814c0 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-pytest-=
timeout_2.3.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-timeo=
ut_2.3.1.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pytest-=
timeout_2.3.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest-timeo=
ut_2.3.1.bb</a><br>
@@ -3,10 +3,8 @@ HOMEPAGE =3D &quot;<a href=3D"https://github.com/pytest-de=
v/pytest-timeout/" rel=3D"noreferrer" target=3D"_blank">https://github.com/=
pytest-dev/pytest-timeout/</a>&quot;<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dd8048cd156eda3df2e7f1=
11b0ae9ceff&quot;<br>
<br>
-PYPI_PACKAGE =3D &quot;pytest-timeout&quot;<br>
-<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;12397729125c6ecbdaca01035b9e5239d4db9735=
2320af155b3f5de1ba5165d9&quot;<br>
<br>
-inherit pypi setuptools3<br>
+inherit pypi python_setuptools_build_meta<br>
<br>
=C2=A0RDEPENDS:${PN} =3D &quot;python3-pytest&quot;<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
regex_2024.7.24.bb" rel=3D"noreferrer" target=3D"_blank">python3-regex_2024=
.7.24.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python=
3-regex_2024.7.24.bb" rel=3D"noreferrer" target=3D"_blank">python3-regex_20=
24.7.24.bb</a><br>
index 682c30fc9..b6e09fc83 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-regex_2=
024.7.24.bb" rel=3D"noreferrer" target=3D"_blank">python3-regex_2024.7.24.b=
b</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-regex_2=
024.7.24.bb" rel=3D"noreferrer" target=3D"_blank">python3-regex_2024.7.24.b=
b</a><br>
@@ -3,7 +3,7 @@ HOMEPAGE =3D &quot;<a href=3D"https://bitbucket.org/mrabarn=
ett/mrab-regex/src" rel=3D"noreferrer" target=3D"_blank">https://bitbucket.=
org/mrabarnett/mrab-regex/src</a>&quot;<br>
=C2=A0LICENSE =3D &quot;Apache-2.0&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3D7b5751ddd6b643203=
c31ff873051d069&quot;<br>
<br>
-inherit pypi setuptools3<br>
+inherit pypi python_setuptools_build_meta<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;9cfd009eed1a46b27c14039ad5bbc5e71b6367c5=
b2e6d5f5da0ea91600817506&quot;<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
service-identity_21.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-se=
rvice-identity_21.1.0.bb</a> b/meta-python/recipes-devtools/python/<a href=
=3D"http://python3-service-identity_21.1.0.bb" rel=3D"noreferrer" target=3D=
"_blank">python3-service-identity_21.1.0.bb</a><br>
index 006fae290..267bbea13 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-service=
-identity_21.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-service-i=
dentity_21.1.0.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-service=
-identity_21.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-service-i=
dentity_21.1.0.bb</a><br>
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D8a0f079f4e6=
a215d6bd6f9d97cab4d5f&quot;<br>
=C2=A0SRC_URI[md5sum] =3D &quot;5e5c195d8fcedc72f9068be2ad9b5a13&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;6e6c6086ca271dc11b033d17c3a8bea9f24ebff9=
20c587da090afc9519419d34&quot;<br>
<br>
-inherit pypi setuptools3 ptest<br>
+inherit pypi python_setuptools_build_meta ptest<br>
<br>
=C2=A0SRC_URI +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div>

--000000000000bde271061f41a1a7--

