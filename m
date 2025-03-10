Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CF73C28B28
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 03:19:24 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web10.29551.1741576762681856909
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Mar 2025 20:19:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EKfST67e;
 spf=pass (domain: gmail.com, ip: 209.85.167.178, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3f9832f798aso13797b6e.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 09 Mar 2025 20:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741576762; x=1742181562; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=15tKjEBzkwcYO5vKCUPfb35iFz4TpmqsmOZgAa8oLFs=;
        b=EKfST67eg3fRKiEupgETTFWaq+fS3MJkepMhovhIUrffQGgPMEkPYXQ8nS2QU3Xbqq
         ZTwMyw8q9IDtqMPEaNjim0vtTDXo971MVEtsdIy1aPvRAecqQKZuEN4V9nCdLSYu0OGx
         8rpoU/PVzhVp0ZOfqGtn0LZMIUaYISWIm8v4am6GaN9jg7l5NeRLxsp8py9LeVi176lN
         aaXqAx9yHvnUIJQZcdDeohIIR8HIPl2PunvjA1cqnv7yqlaYdayGjWUfJ9RSVTde+6up
         l0yl4QRvCrRJLBZW8Iw7vgUj0qtdyec+T6Sf06bJZAbuKqEr+svlKvPiFVZRNGe5yVQl
         HZ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741576762; x=1742181562;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=15tKjEBzkwcYO5vKCUPfb35iFz4TpmqsmOZgAa8oLFs=;
        b=mcExFPjsDkRcL7jy49tRKk5oFaiIP0JPgejGsdLrlE0GCNUh7aiumc8yXYGSRjvjGm
         LdTeawILTIbkCIXL3a8mEfp4SSA7JwLfcB3L71jX/aHJj0G5CP8Oq8KE5fXasUi0C7RP
         fUhYEhfOjxGbQJEucKDgEU/2pt7lv2nGzyBZDHoKyit56TCUkPcgD8x8BwIzIk9R47sW
         SNYgzNoCi60ZfTuf3pY9LXxAji3j1HOboWG41AekGm3FZPrldCnZOkXSeih5zI8bcham
         Swo5MMwVDu/0MlT6Qaxw/VznWSTrc7lXhzyqx6DEFH+KJx0Og8TIrIK7/RIPmREDMpWP
         TSlw==
X-Gm-Message-State: AOJu0YwMNCVHiuuhVEMQPSQUXZlEGm0jB5BDrNKBS4Try9SfU+6bHsnn
	vMC20E5VfU8rcRvJ6zaUHoskR/pGuBtgySZ8VJ54EE+Q34oG1dgKQWIaZ0YjSLW44ENsvXrhFhY
	tWpG12aknTo4BJymWn0LaiBWhasg=
X-Gm-Gg: ASbGncsGPLzmKa6HNZ6R6Kbz/xV3xJHliV23B+aodrKRk2Im2JZHulFn2CH2IaPM8gA
	Ytlq+oLrQl6o3pGjGDCaDaVjLtaXgxUYgDrhHlLdLHEKlsGc56lkPqOGDlvpLmZvuFYgu3ZsVYz
	Lgpmzsj8xpYUwYiFIwkS53t0Ov
X-Google-Smtp-Source: AGHT+IHlgvBX3w5x1rr4F14ea2WPVMlr0SEXywkCN2o8B0wUIesCx014De7O576HjICt0e3rTJOokQ87JHo45MfxWQs=
X-Received: by 2002:a05:6808:10c8:b0:3f9:17f9:309b with SMTP id
 5614622812f47-3f917f93906mr676695b6e.8.1741576761864; Sun, 09 Mar 2025
 20:19:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250309194302.451216-1-skandigraun@gmail.com>
In-Reply-To: <20250309194302.451216-1-skandigraun@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 9 Mar 2025 20:18:55 -0700
X-Gm-Features: AQ5f1JpX80c5q1wXBz7wSa3cjsny1SQn-jfl7rKQAc8h_LbN1_9fKOd3RBoRNzo
Message-ID: <CAMKF1sppxXzaetEbHtLGet9cKLZ82f0na7tjTnzkgGj_EvcngQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-pandas: compile against target
 version of numpy
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Mar 2025 03:19:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115817

Patch is ok but the commit message should not contain diffs, it
confuses tool like b4 while pulling this patch into my staging area,
so please send a v2 after removing diffs from commit msg.

On Sun, Mar 9, 2025 at 12:43=E2=80=AFPM Gyorgy Sarvari via
lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
wrote:
>
> python3-numpy headers are required by pandas to compile successfully.
> By default, this recipe used python3-numpy-native for compilation,
> which usually works. However in case the bitness of the build-host
> differs from the target, then problems arise.
>
> For example when compiling for 32-bit ARM on a x86-64 machine, the follow=
ing
> error appears when trying to import the module:
>
> ValueError: Buffer dtype mismatch, expected 'const int64_t' but got 'long=
 long'
>
> When running a diff on all numpy headers across native and target,
> only one header differs, but that one in a significant way:
>
> --- ./_numpyconfig.h    2025-03-07 08:08:58.949476926 +0100
> +++ <ARM32_FOLDER>/_numpyconfig.h    2025-03-07 08:09:10.811983538 +0100
> @@ -2,16 +2,16 @@
>
>  #define NPY_SIZEOF_SHORT 2
>  #define NPY_SIZEOF_INT 4
> -#define NPY_SIZEOF_LONG 8
> +#define NPY_SIZEOF_LONG 4
>  #define NPY_SIZEOF_FLOAT 4
>  #define NPY_SIZEOF_COMPLEX_FLOAT 8
>  #define NPY_SIZEOF_DOUBLE 8
>  #define NPY_SIZEOF_COMPLEX_DOUBLE 16
> -#define NPY_SIZEOF_LONGDOUBLE 16
> -#define NPY_SIZEOF_COMPLEX_LONGDOUBLE 32
> -#define NPY_SIZEOF_PY_INTPTR_T 8
> -#define NPY_SIZEOF_INTP 8
> -#define NPY_SIZEOF_UINTP 8
> +#define NPY_SIZEOF_LONGDOUBLE 8
> +#define NPY_SIZEOF_COMPLEX_LONGDOUBLE 16
> +#define NPY_SIZEOF_PY_INTPTR_T 4
> +#define NPY_SIZEOF_INTP 4
> +#define NPY_SIZEOF_UINTP 4
>  #define NPY_SIZEOF_WCHAR_T 4
>  #define NPY_SIZEOF_OFF_T 8
>  #define NPY_SIZEOF_PY_LONG_LONG 8
>
> This change switches from python3-numpy-native dependency to python3-nump=
y to
> ensure that the correct headers are used. Beside this also patch the meso=
n script,
> so it accepts an option (numpy_inc_dir) to specify the location of these =
headers,
> since it is not able to query them from the class-target module
>
> The PYTHONPATH variable is extended with the target's RECIPE_SYSROOT, bec=
ause
> numpy is specified as a dependency in meson, and it needs to find the mod=
ule
> to continue successfully.
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  ...fy-numpy-header-path-as-meson-option.patch | 52 +++++++++++++++++++
>  .../python/python3-pandas_2.2.2.bb            |  9 +++-
>  2 files changed, 60 insertions(+), 1 deletion(-)
>  create mode 100644 meta-python/recipes-devtools/python/python3-pandas/00=
01-specify-numpy-header-path-as-meson-option.patch
>
> diff --git a/meta-python/recipes-devtools/python/python3-pandas/0001-spec=
ify-numpy-header-path-as-meson-option.patch b/meta-python/recipes-devtools/=
python/python3-pandas/0001-specify-numpy-header-path-as-meson-option.patch
> new file mode 100644
> index 0000000000..039f116ff1
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pandas/0001-specify-num=
py-header-path-as-meson-option.patch
> @@ -0,0 +1,52 @@
> +From 46b3c3ee68f271acbc178260939ca8423f9244a5 Mon Sep 17 00:00:00 2001
> +From: Gyorgy Sarvari <skandigraun@gmail.com>
> +Date: Sun, 9 Mar 2025 19:57:26 +0100
> +Subject: [PATCH] specify numpy header path as meson option
> +
> +In case pandas is compiled against the class-target version of numpy, it=
 is
> +not possible to import the module, due to target-compiled binary files -
> +it just fails with an error. However this also means that meson isn't
> +able to query the include folder location, so the compilation fails.
> +
> +To avoid this, the new "numpy_inc_dir" meson option allows specifying th=
e
> +location of the required headers.
> +
> +Upstream-Status: Inappropriate [oe-specific]
> +---
> + meson.options      | 1 +
> + pandas/meson.build | 6 +++---
> + 2 files changed, 4 insertions(+), 3 deletions(-)
> + create mode 100644 meson.options
> +
> +diff --git a/meson.options b/meson.options
> +new file mode 100644
> +index 0000000000..3d3a18d145
> +--- /dev/null
> ++++ b/meson.options
> +@@ -0,0 +1 @@
> ++option('numpy_inc_dir', type : 'string', description : 'The absolute pa=
th to the numpy headers')
> +diff --git a/pandas/meson.build b/pandas/meson.build
> +index 435103a954..32ad04bd8e 100644
> +--- a/pandas/meson.build
> ++++ b/pandas/meson.build
> +@@ -3,17 +3,17 @@ incdir_numpy =3D run_command(py,
> +     '-c',
> +     '''
> + import os
> +-import numpy as np
> + try:
> +     # Check if include directory is inside the pandas dir
> +     # e.g. a venv created inside the pandas dir
> +     # If so, convert it to a relative path
> +-    incdir =3D os.path.relpath(np.get_include())
> ++    incdir =3D os.path.relpath(os.getenv('NUMPY_INC_DIR'))
> + except Exception:
> +-    incdir =3D np.get_include()
> ++    incdir =3D os.getenv('NUMPY_INC_DIR')
> + print(incdir)
> +      '''
> +   ],
> ++  env: {'NUMPY_INC_DIR': get_option('numpy_inc_dir')},
> +   check: true
> + ).stdout().strip()
> +
> diff --git a/meta-python/recipes-devtools/python/python3-pandas_2.2.2.bb =
b/meta-python/recipes-devtools/python/python3-pandas_2.2.2.bb
> index c12a237653..5676d98cd0 100644
> --- a/meta-python/recipes-devtools/python/python3-pandas_2.2.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-pandas_2.2.2.bb
> @@ -11,12 +11,14 @@ SRC_URI +=3D " \
>              file://0001-pyproject.toml-Downgrade-numpy-version-needs-to-=
1.x.patch \
>              "
>
> +SRC_URI:append:class-target =3D " file://0001-specify-numpy-header-path-=
as-meson-option.patch "
> +
>  SRC_URI[sha256sum] =3D "9e79019aba43cb4fda9e4d983f8e88ca0373adbb697ae9c6=
c43093218de28b54"
>
>  inherit pkgconfig pypi python_mesonpy cython
>
>  DEPENDS +=3D " \
> -    python3-numpy-native \
> +    python3-numpy \
>      python3-versioneer-native \
>  "
>
> @@ -30,3 +32,8 @@ RDEPENDS:${PN} +=3D " \
>      python3-pytz \
>      python3-profile \
>  "
> +
> +PYTHONPATH:prepend:class-target =3D "${RECIPE_SYSROOT}${PYTHON_SITEPACKA=
GES_DIR}:"
> +export PYTHONPATH
> +
> +EXTRA_OEMESON:append:class-target =3D " -Dnumpy_inc_dir=3D${RECIPE_SYSRO=
OT}${PYTHON_SITEPACKAGES_DIR}/numpy/_core/include "
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#115816): https://lists.openembedded.org/g/openembedde=
d-devel/message/115816
> Mute This Topic: https://lists.openembedded.org/mt/111606607/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

