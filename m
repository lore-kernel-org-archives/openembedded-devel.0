Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C46EC2D0CD
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 08:33:42 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.46496.1747643615986719603
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 May 2025 01:33:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I2QzdII1;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-550ef1da73dso2827944e87.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 May 2025 01:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747643614; x=1748248414; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Un8JgCcjzyyJcPJ/q6qSfYy6jFxhgKlUWeymmb7yQig=;
        b=I2QzdII1p7x5DnhYQ++t/WrSZlydnQjwLE9Cjox2TOo+8chaqS7y7Ra2crDNMxj5Sk
         2eJFTisMXJroWN+ciJlZTKvOeCUX0+kVA/SdFFGRcnnqVVyyQTzwa7HOiW6Y/9B/3Z4l
         6ko2PvNugKq5ZnADYpKs9x8xUSHbkiPNpbWGDmsnzCelL0SG2ltuGc8hpUPMjpcEUdWa
         tTA01MjuvNMWtOJCsITIGc65Cv1gWxhIJG0MhgJOoUIYuDYl14JbhNSrKR0Wk1j3fc7U
         SFLpn21/EkL53LxBWPZMhe8QAw3EvHyTF/FigOUwD564xxZcEtWQzFTJcU8F86DjKKlm
         Xvfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747643614; x=1748248414;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Un8JgCcjzyyJcPJ/q6qSfYy6jFxhgKlUWeymmb7yQig=;
        b=P0STxhGejvScBn6CEeFLnP+CBIgohk135a0kp76iaqOQsaiaY7eJjiKMqh2pBntBW0
         BY7UylIuQmAwQhJDuw/LK3oPkWP/edZGVlICO+TdhBeGwiJEgwanFfoRJ+EOm6Poe3YV
         hCEgGDvg7XMaDuOA1j0cQA8gxIvTdErfDRV4qnY7sfzKRFp27LCzvz+dvrvBxcGXuX8U
         GmJ5MqgqNTakIotXMaSIvY7MI3lScuqtdznct4Ba8ZR+G/4CU67qWoYG3sNu/U8f5BQ7
         7YtlwCKKN/qykkFJe3XXeL6I9UAzHDuOWYsfJc4Zj0tDqhpyJvKyOO7kMn8EpqdM18eJ
         46iQ==
X-Gm-Message-State: AOJu0YzVLCSx3dTcchVjLGpSsNiGLFbe8BqL8SCsHDt7+tUInQH/rPoN
	xP0zoTe7tJrsL2ZPGOp0/rKFHkLRIyBTjUZUJi4iTvOBLEs7WJ+i89EYyC4tOK4S0/rNDLUeJ7e
	fgZyTZKQLTWFrdEY70t6dgAdbA4Jl01E=
X-Gm-Gg: ASbGncvyh/SxF6AlWVBTt13XDmMAJN2AHspQ7fq5OC7UI2Mw/qma+VATaeb11IeCTGS
	6ARms5c0eHoR0fka18LDmDjuE4sBKpQ33cZBMXqiysQvfjzDKFNAn7JHF23rC6QI2Pqb2oM7jlB
	WrbReSSW/i75rX+EAUz9IYtT/2hwFLWj203BA=
X-Google-Smtp-Source: AGHT+IHuL2wKuYyImI/QxKg7QmhX8bkGDVby9nBykIly43Gvqfh+ER3/vWElSsOlHc1JurCW1/5DxWSk3+KBNZl+20o=
X-Received: by 2002:a05:6512:3d05:b0:550:d5cb:348d with SMTP id
 2adb3069b0e04-550e9900470mr3487223e87.46.1747643613489; Mon, 19 May 2025
 01:33:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250518173309.3600728-1-raj.khem@gmail.com>
In-Reply-To: <20250518173309.3600728-1-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 19 May 2025 10:33:21 +0200
X-Gm-Features: AX0GCFtfo_QmdMQw3YeOqW8hTFA3G8bEcfu0hExupG9bzf2cs9xSHq3xcj5uKqc
Message-ID: <CA+chaQcNWb7RZciBZ4qT013aUzpT_MhSP+svSNiBZt_RSam96A@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 1/4] python3-pandas: Upgrade to 2.2.3
To: raj.khem@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 May 2025 08:33:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117474

Hi,

with this update I'm seeing:
ERROR: QA Issue: File
/usr/src/debug/python3-pandas/2.2.3/pandas/_libs/sparse.cpython-313-aarch64=
-linux-gnu.so.p/pandas/_libs/sparse.pyx.c
in package python3-pandas-src contains reference to TMPDIR
[buildpaths]

Have you seen it as well or is it something specific to my setup?

On Sun, May 18, 2025 at 7:33=E2=80=AFPM Khem Raj via lists.openembedded.org
<raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
>
> Fixes build with cython >=3D3.1
> Drop patch to pin numpy to 1.x
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...ion-to-specify-numpy-header-location.patch |  5 ----
>  ...Downgrade-numpy-version-needs-to-1.x.patch | 27 -------------------
>  ...t.toml-don-t-pin-dependency-versions.patch | 11 +++-----
>  ...andas_2.2.2.bb =3D> python3-pandas_2.2.3.bb} |  3 +--
>  4 files changed, 4 insertions(+), 42 deletions(-)
>  delete mode 100644 meta-python/recipes-devtools/python/python3-pandas/00=
01-pyproject.toml-Downgrade-numpy-version-needs-to-1.x.patch
>  rename meta-python/recipes-devtools/python/{python3-pandas_2.2.2.bb =3D>=
 python3-pandas_2.2.3.bb} (87%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pandas/0001-BLD-=
add-option-to-specify-numpy-header-location.patch b/meta-python/recipes-dev=
tools/python/python3-pandas/0001-BLD-add-option-to-specify-numpy-header-loc=
ation.patch
> index 87023a24ec..e83576eb62 100644
> --- a/meta-python/recipes-devtools/python/python3-pandas/0001-BLD-add-opt=
ion-to-specify-numpy-header-location.patch
> +++ b/meta-python/recipes-devtools/python/python3-pandas/0001-BLD-add-opt=
ion-to-specify-numpy-header-location.patch
> @@ -25,15 +25,10 @@ Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
>   2 files changed, 11 insertions(+), 3 deletions(-)
>   create mode 100644 meson.options
>
> -diff --git a/meson.options b/meson.options
> -new file mode 100644
> -index 0000000000..3d3a18d145
>  --- /dev/null
>  +++ b/meson.options
>  @@ -0,0 +1 @@
>  +option('numpy_inc_dir', type : 'string', description : 'The absolute pa=
th to the numpy headers')
> -diff --git a/pandas/meson.build b/pandas/meson.build
> -index 435103a..a08c77a 100644
>  --- a/pandas/meson.build
>  +++ b/pandas/meson.build
>  @@ -3,17 +3,24 @@ incdir_numpy =3D run_command(py,
> diff --git a/meta-python/recipes-devtools/python/python3-pandas/0001-pypr=
oject.toml-Downgrade-numpy-version-needs-to-1.x.patch b/meta-python/recipes=
-devtools/python/python3-pandas/0001-pyproject.toml-Downgrade-numpy-version=
-needs-to-1.x.patch
> deleted file mode 100644
> index b0ef8ce00c..0000000000
> --- a/meta-python/recipes-devtools/python/python3-pandas/0001-pyproject.t=
oml-Downgrade-numpy-version-needs-to-1.x.patch
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -From d81d95274d84ac51fc02e0fa91affc7f3cbefccb Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Sat, 24 Aug 2024 10:21:43 -0700
> -Subject: [PATCH] pyproject.toml: Downgrade numpy version needs to 1.x
> -
> -Drop it when numpy is upgraded to 2.x or newer in core
> -
> -Upstream-Status: Inappropriate [OE workaround]
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - pyproject.toml | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/pyproject.toml b/pyproject.toml
> -index 5158d60..d3daa78 100644
> ---- a/pyproject.toml
> -+++ b/pyproject.toml
> -@@ -8,7 +8,7 @@ requires =3D [
> -     "Cython>=3D3.0.5",  # Note: sync with setup.py, environment.yml and=
 asv.conf.json
> -     # Force numpy higher than 2.0rc1, so that built wheels are compatib=
le
> -     # with both numpy 1 and 2
> --    "numpy>=3D2.0.0rc1",
> -+    "numpy>=3D1.24.0",
> -     "versioneer[toml]"
> - ]
> -
> diff --git a/meta-python/recipes-devtools/python/python3-pandas/0001-pypr=
oject.toml-don-t-pin-dependency-versions.patch b/meta-python/recipes-devtoo=
ls/python/python3-pandas/0001-pyproject.toml-don-t-pin-dependency-versions.=
patch
> index f60f43a5b0..950f25303f 100644
> --- a/meta-python/recipes-devtools/python/python3-pandas/0001-pyproject.t=
oml-don-t-pin-dependency-versions.patch
> +++ b/meta-python/recipes-devtools/python/python3-pandas/0001-pyproject.t=
oml-don-t-pin-dependency-versions.patch
> @@ -14,8 +14,6 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
>   pyproject.toml | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> -diff --git a/pyproject.toml b/pyproject.toml
> -index db9f055799..5158d60f59 100644
>  --- a/pyproject.toml
>  +++ b/pyproject.toml
>  @@ -2,10 +2,10 @@
> @@ -27,11 +25,8 @@ index db9f055799..5158d60f59 100644
>  +    "meson-python>=3D0.13.1",
>  +    "meson>=3D1.2.1",
>       "wheel",
> --    "Cython=3D=3D3.0.5",  # Note: sync with setup.py, environment.yml a=
nd asv.conf.json
> +-    "Cython~=3D3.0.5",  # Note: sync with setup.py, environment.yml and=
 asv.conf.json
>  +    "Cython>=3D3.0.5",  # Note: sync with setup.py, environment.yml and=
 asv.conf.json
> -     # Force numpy higher than 2.0rc1, so that built wheels are compatib=
le
> +     # Force numpy higher than 2.0, so that built wheels are compatible
>       # with both numpy 1 and 2
> -     "numpy>=3D2.0.0rc1",
> ---
> -2.39.2
> -
> +     "numpy>=3D2.0",
> diff --git a/meta-python/recipes-devtools/python/python3-pandas_2.2.2.bb =
b/meta-python/recipes-devtools/python/python3-pandas_2.2.3.bb
> similarity index 87%
> rename from meta-python/recipes-devtools/python/python3-pandas_2.2.2.bb
> rename to meta-python/recipes-devtools/python/python3-pandas_2.2.3.bb
> index b956f5ca2f..3e41e4aa6f 100644
> --- a/meta-python/recipes-devtools/python/python3-pandas_2.2.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-pandas_2.2.3.bb
> @@ -8,12 +8,11 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dcb819092901d=
db13a7d0a4f5e05f098a"
>
>  SRC_URI +=3D " \
>              file://0001-pyproject.toml-don-t-pin-dependency-versions.pat=
ch \
> -            file://0001-pyproject.toml-Downgrade-numpy-version-needs-to-=
1.x.patch \
>              "
>
>  SRC_URI:append:class-target =3D " file://0001-BLD-add-option-to-specify-=
numpy-header-location.patch "
>
> -SRC_URI[sha256sum] =3D "9e79019aba43cb4fda9e4d983f8e88ca0373adbb697ae9c6=
c43093218de28b54"
> +SRC_URI[sha256sum] =3D "4f18ba62b61d7e192368b84517265a99b4d7ee8912f87086=
60fb4a366cc82667"
>
>  inherit pkgconfig pypi python_mesonpy cython
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117456): https://lists.openembedded.org/g/openembedde=
d-devel/message/117456
> Mute This Topic: https://lists.openembedded.org/mt/113179377/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

