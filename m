Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web12.421.1612549398647034611
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Feb 2021 10:23:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oBkRDfRF;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id c1so5696452qtc.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 05 Feb 2021 10:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=qxFZJSjciq6mvERf3kfS8pMcAYCbj6WOweaas/Zq6vg=;
        b=oBkRDfRFsYHRzqOfBfSKQ8d7WPzl1LLFSIhydz7t1JMpXDrnng7pldYU5MvMJG4Z5c
         lQJHzc+4NQdNTKfYIkBWjBlbgpmN4Vp5WeNh2I6BerOUu/5kMAtAGpKxMsw2zs0wI540
         6UP3csGlm55S29s9TWiTL96CzLcbHDY5OuwcR+w3ro1oPHEFvVzxLKxY2woq3J45K6pP
         /PJk1dtc1t+wZpJukx5LS6PKELBy+Fd8Spevt7jVZB6TQJcTk59O0WbkCAAjhj7DHsj2
         M1mK/T5uxHowsnjBN6EVKr5ScuWLdwjl1NR55rIbohZceqtnZwiRWvtjK0iFBAc9h2PW
         4PFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=qxFZJSjciq6mvERf3kfS8pMcAYCbj6WOweaas/Zq6vg=;
        b=J2BAvw1uPC5uObEDbZUydcQ/fvZlICJQ3606Vmipnv5CpouheG+JZRgiZ59w2JoSyp
         j/m2HtwIWkiGst/3QrJXqD8GV36qSx/Oh0w1CqlvKTeRUH0e7SoelYSPBZS8PqskII/o
         6Rq64QDR0VQ+jYGEyq4SIdoBf+D8kEdfVJDW5bJFqhGwtODKWwHoRWtp3cYRxTa+bb+N
         LX+ssQWu5ovP30ftV6IwSjTPEbeM/PbrhR9diOvN2L3XOk5k67N2d6b8dverJni45L8R
         JgUoasAucIaxcBLoefqin0dIif/lOqt0cjtfcnPBcbFsHzyIOZPs4SOEBU0AFGBHD9G3
         j8Kw==
X-Gm-Message-State: AOAM532LpFNKY1DVGk1nVYOgRp3qw/V/ghuoI3XHzdmRWB7owVAFqEjY
	ztQs3tp0TTXNbTfPVVUejVd5mI5ferGKXdfeEWA=
X-Google-Smtp-Source: ABdhPJzPDvz631C7pXleQNvbKHAN0k2mb7z6pImYHH0meU3oxlqaZBXOZWna3832NkhJ2H6/w0Umb38ev2qleCIsIdM=
X-Received: by 2002:ac8:5bd1:: with SMTP id b17mr5418955qtb.53.1612549397578;
 Fri, 05 Feb 2021 10:23:17 -0800 (PST)
MIME-Version: 1.0
References: <20210203153822.25077-1-leon.anavi@konsulko.com>
 <20210203153822.25077-5-leon.anavi@konsulko.com> <705cccd4-b386-75b7-374d-5f89484df713@windriver.com>
In-Reply-To: <705cccd4-b386-75b7-374d-5f89484df713@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 5 Feb 2021 10:22:51 -0800
Message-ID: <CAMKF1soqp025hB2_m9eGiJ0832VPokhPxHb-iCV8vX_HVaKSdw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 5/5] python3-h5py: Upgrade 2.10.0 -> 3.1.0
To: Trevor Gamblin <trevor.gamblin@windriver.com>
Cc: Leon Anavi <leon.anavi@konsulko.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 5, 2021 at 6:03 AM Trevor Gamblin
<trevor.gamblin@windriver.com> wrote:
>
>
> On 2021-02-03 10:38 a.m., Leon Anavi wrote:
>
> [Please note: This e-mail is from an EXTERNAL e-mail address]
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
>
> Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
>

hey Trevor can you see the musl failure I am seeing ?
we should hold it until thats fixed.

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
>
>
>
>=20
>
