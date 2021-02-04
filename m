Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web08.3176.1612475139401013164
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Feb 2021 13:45:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dmROzKek;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id c1so3619129qtc.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Feb 2021 13:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=2DgCU+lCl7JwRhJSUt/y4vsA419yNYkq8YmeSJBZZf4=;
        b=dmROzKekR4h+aC3BgeIy3ST/whzQNc4VplW6R5HMV2UzReXpugFtuEnQ9SVPgpR3jR
         SZ7PjyIVvq43hmEhEMp/Ll1ulp1GoLGnO6fUL67xNI8oVBWNadw+UOzea2FhLHp455gu
         I0ZpVTvY08rFLwy4791MeffBYsDg1qVbSsAB2F2Q8/JCUCAn0X9f7YEKfYY7eRwDvf5o
         kz6Ed50YmP5VIVJUrlm7yWz8+Vsd/cnPM2FDxRS4ZeuiEmg0ATlXt/sXTqBAeYk70di4
         5GUXyTRu4vgZwh+SL+y+rRcKLR70Yg3osaNBUo8CG53M3iEfdjC6FRXrV1JOAp+18XeO
         L9jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2DgCU+lCl7JwRhJSUt/y4vsA419yNYkq8YmeSJBZZf4=;
        b=ZFGPbrFL16QJ0LMSBvLA9iPrtabOJzj7qgIqmaW/Ba78VinKxqBQAsjTNS0f8Ewf2F
         9wolZnG1dOraEOe1yuDegLCgbhWKJajkUkpYYDWEQNAASRFIgj/0FDpJRYgW64ydYSgS
         RMu8g5H6gPR6n4YB+4sEXe897IHAc0WJ1PfRT96R//Fz7shgrU9Fg0aMeQKWhMHqEJNM
         5W/D3fzheJ7eZFDRaj7j5ZxlUW2k5xM+LH5pnKNWngS17YPy9eXcLARurG4DmCDVTskc
         jZy+sxxEISwHe3dZywQFKgXXoEjxyMh4TBoxXH8cZhmciExKjdnCytZ72npYAlCUka7H
         w9pw==
X-Gm-Message-State: AOAM531eB1Ao4/3Ys0hjh5FCu1btQdJcopC6G7oxr9zf/OQmJRooRK5S
	ijUu3cryAIToRIJGk9idc5bvhavlDE7dJda3DCE=
X-Google-Smtp-Source: ABdhPJwp2vQz4DazkIWIc43dVfCdyspoaNomPTfn6c+HA1aTGa0N7lEFeMV/81nyg0titGe0utrQcznS8kc/aZSPyR0=
X-Received: by 2002:ac8:6f06:: with SMTP id g6mr1655494qtv.80.1612475138359;
 Thu, 04 Feb 2021 13:45:38 -0800 (PST)
MIME-Version: 1.0
References: <20210203153822.25077-1-leon.anavi@konsulko.com> <20210203153822.25077-5-leon.anavi@konsulko.com>
In-Reply-To: <20210203153822.25077-5-leon.anavi@konsulko.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 4 Feb 2021 13:45:12 -0800
Message-ID: <CAMKF1spWuFexdU0_Rwx=e576aWFismaEHDvepMoxPdojic1Yuw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 5/5] python3-h5py: Upgrade 2.10.0 -> 3.1.0
To: Leon Anavi <leon.anavi@konsulko.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Fails on musl/x86
https://errors.yoctoproject.org/Errors/Details/567807/

On Wed, Feb 3, 2021 at 7:38 AM Leon Anavi <leon.anavi@konsulko.com> wrote:
>
> Upgrade to release 3.1.0:
>
> - Fix using bytes as names for :meth:`~Group.create_dataset` and
> =EF=BF=BC  :meth:`~Group.create_virtual_dataset`.
> - Fix writing data as a list to a dataset with a sub-array data
>   type.
> - Preserve endianess in Cython dataset Reader
> - If pytest is missing pytest-mpi then it will now fail
>   immediately with a clear warning message
> - Fix a test which was failing on big-endian systems
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  .../0001-cross-compiling-support.patch        | 47 -------------------
>  .../0001-setup.py-Fix-numpy-version.patch     | 30 ++++++++++++
>  ...1-setup_build.py-avoid-absolute-path.patch | 13 ++---
>  ...3-h5py_2.10.0.bb =3D> python3-h5py_3.1.0.bb} |  5 +-
>  4 files changed, 39 insertions(+), 56 deletions(-)
>  delete mode 100644 meta-python/recipes-devtools/python/python3-h5py/000=
1-cross-compiling-support.patch
>  create mode 100644 meta-python/recipes-devtools/python/python3-h5py/000=
1-setup.py-Fix-numpy-version.patch
>  rename meta-python/recipes-devtools/python/{python3-h5py_2.10.0.bb =3D>=
 python3-h5py_3.1.0.bb} (78%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-h5py/0001-cross=
-compiling-support.patch b/meta-python/recipes-devtools/python/python3-h5py=
/0001-cross-compiling-support.patch
> deleted file mode 100644
> index 8c0b91432..000000000
> --- a/meta-python/recipes-devtools/python/python3-h5py/0001-cross-compil=
ing-support.patch
> +++ /dev/null
> @@ -1,47 +0,0 @@
> -From 364fd0906efa349ea44a761820408dcf6b2b8726 Mon Sep 17 00:00:00 2001
> -From: Hongxu Jia <hongxu.jia@windriver.com>
> -Date: Tue, 29 Jan 2019 17:08:32 +0800
> -Subject: [PATCH] cross compiling support
> -
> -Remove useless dirs
> -
> -Upstream-Status: Inappropriate [oe specific]
> -
> -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> -Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ----
> - setup_build.py     | 4 ----
> - setup_configure.py | 2 +-
> - 2 files changed, 1 insertion(+), 5 deletions(-)
> -
> -diff --git a/setup_build.py b/setup_build.py
> -index c0e9a28c..ffd3bef7 100644
> ---- a/setup_build.py
> -+++ b/setup_build.py
> -@@ -55,10 +55,6 @@ if sys.platform.startswith('win'):
> -         ('_HDF5USEDLL_', None),
> -         ('H5_BUILT_AS_DYNAMIC_LIB', None)
> -     ])
> --else:
> --    FALLBACK_PATHS['include_dirs'].extend(['/opt/local/include', '/usr=
/local/include'])
> --    FALLBACK_PATHS['library_dirs'].extend(['/opt/local/lib', '/usr/loc=
al/lib'])
> --
> -
> - class h5py_build_ext(build_ext):
> -
> -diff --git a/setup_configure.py b/setup_configure.py
> -index 5576775e..75f4141e 100644
> ---- a/setup_configure.py
> -+++ b/setup_configure.py
> -@@ -206,7 +206,7 @@ def autodetect_version(hdf5_dir=3DNone):
> -         default_path =3D 'libhdf5.so'
> -         regexp =3D re.compile(r'^libhdf5.so')
> -
> --    libdirs =3D ['/usr/local/lib', '/opt/local/lib']
> -+    libdirs =3D []
> -     try:
> -         if pkgconfig.exists("hdf5"):
> -             libdirs.extend(pkgconfig.parse("hdf5")['library_dirs'])
> ---
> -2.17.1
> -
> diff --git a/meta-python/recipes-devtools/python/python3-h5py/0001-setup=
.py-Fix-numpy-version.patch b/meta-python/recipes-devtools/python/python3-h=
5py/0001-setup.py-Fix-numpy-version.patch
> new file mode 100644
> index 000000000..57037a91a
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-h5py/0001-setup.py-Fix=
-numpy-version.patch
> @@ -0,0 +1,30 @@
> +From 7c88e3762c2381a507dc86b90152216abe79a804 Mon Sep 17 00:00:00 2001
> +From: Leon Anavi <leon.anavi@konsulko.com>
> +Date: Wed, 3 Feb 2021 17:23:29 +0200
> +Subject: [PATCH] setup.py: Fix numpy version
> +
> +Fix numpy version to ensure bitbake will find the pip package.
> +
> +Upstream-Status: Inappropriate [oe specific]
> +
> +Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> +---
> + setup.py | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/setup.py b/setup.py
> +index 7dbe5835..8fc15bc8 100755
> +--- a/setup.py
> ++++ b/setup.py
> +@@ -30,7 +30,7 @@ NUMPY_MIN_VERSIONS =3D [
> +     ('1.12',   "=3D=3D'3.6'"),
> +     ('1.14.5', "=3D=3D'3.7'"),
> +     ('1.17.5', "=3D=3D'3.8'"),
> +-    ('1.19.3', ">=3D'3.9'"),
> ++    ('1.19.5', ">=3D'3.9'"),
> + ]
> +
> + # these are required to use h5py
> +--
> +2.17.1
> +
> diff --git a/meta-python/recipes-devtools/python/python3-h5py/0001-setup=
_build.py-avoid-absolute-path.patch b/meta-python/recipes-devtools/python/p=
ython3-h5py/0001-setup_build.py-avoid-absolute-path.patch
> index da95ee7af..05c126e54 100644
> --- a/meta-python/recipes-devtools/python/python3-h5py/0001-setup_build.=
py-avoid-absolute-path.patch
> +++ b/meta-python/recipes-devtools/python/python3-h5py/0001-setup_build.=
py-avoid-absolute-path.patch
> @@ -1,6 +1,6 @@
> -From b5d5a7efc7aaa2be830731001ed17c5b71bcefb1 Mon Sep 17 00:00:00 2001
> +From 86a2c95941a3854fda763037a16b5b22ec6f15e9 Mon Sep 17 00:00:00 2001
>  From: Mingli Yu <mingli.yu@windriver.com>
> -Date: Fri, 29 Jan 2021 02:33:06 +0000
> +Date: Thu, 28 Jan 2021 18:44:10 -0800
>  Subject: [PATCH] setup_build.py: avoid absolute path
>
>  Prevent absolute path from ending up in the egg-info SOURCES.txt.
> @@ -8,15 +8,16 @@ Prevent absolute path from ending up in the egg-info S=
OURCES.txt.
>  Upstream-Status: Submitted [https://github.com/h5py/h5py/pull/1803]
>
>  Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> +Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>  ---
>   setup_build.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/setup_build.py b/setup_build.py
> -index ffd3bef..fb196c0 100644
> +index 3c7c7adb..d824bdda 100644
>  --- a/setup_build.py
>  +++ b/setup_build.py
> -@@ -20,7 +20,7 @@ import api_gen
> +@@ -21,7 +21,7 @@ from setup_configure import BuildConfig
>
>
>   def localpath(*args):
> @@ -24,7 +25,7 @@ index ffd3bef..fb196c0 100644
>  +    return op.join(*args)
>
>
> - MODULES =3D  ['defs','_errors','_objects','_proxy', 'h5fd', 'h5z',
> + MODULES =3D ['defs', '_errors', '_objects', '_proxy', 'h5fd', 'h5z',
>  --
> -2.29.2
> +2.17.1
>
> diff --git a/meta-python/recipes-devtools/python/python3-h5py_2.10.0.bb =
b/meta-python/recipes-devtools/python/python3-h5py_3.1.0.bb
> similarity index 78%
> rename from meta-python/recipes-devtools/python/python3-h5py_2.10.0.bb
> rename to meta-python/recipes-devtools/python/python3-h5py_3.1.0.bb
> index b812b323f..03ae4c9db 100644
> --- a/meta-python/recipes-devtools/python/python3-h5py_2.10.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-h5py_3.1.0.bb
> @@ -4,12 +4,11 @@ SECTION =3D "devel/python"
>  LICENSE =3D "BSD-3-Clause"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D113251d71fb0384712c719b56726=
1c5c"
>
> -SRC_URI[md5sum] =3D "504b595237409ab766fbbe568e60a080"
> -SRC_URI[sha256sum] =3D "84412798925dc870ffd7107f045d7659e60f5d46d1c70c7=
00375248bf6bf512d"
> +SRC_URI[sha256sum] =3D "1e2516f190652beedcb8c7acfa1c6fa92d99b42331cbef5=
e5c7ec2d65b0fc3c2"
>
>  SRC_URI_append =3D " \
> -           file://0001-cross-compiling-support.patch \
>             file://0001-setup_build.py-avoid-absolute-path.patch \
> +           file://0001-setup.py-Fix-numpy-version.patch \
>            "
>
>  inherit pypi setuptools3
> --
> 2.17.1
>
>
>=20
>
