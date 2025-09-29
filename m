Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CD05CAC5B0
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 16:51:43 +0000 (UTC)
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
 by mx.groups.io with SMTP id smtpd.web10.3421.1759164696468883683
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Sep 2025 09:51:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IxTWV7Jx;
 spf=pass (domain: gmail.com, ip: 74.125.224.44, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-633c1b740c5so3832558d50.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 09:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759164694; x=1759769494; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uOhQfi3lM5cRRvjH6mjWD7Ac6qPYUHkAiP1fZ8KAt80=;
        b=IxTWV7Jxoh6ouIWeEJiKwHG00xeJ8eUhS6TzPqPaQLJ+eJqLZAQW6KDMH3K4a4Oi2f
         A3dlpX0YnWZTTck5WWv6qcxMM0ync6sljw29i+og7mJM+5o/zuKmPnRAzzF71r7yo5+i
         eXgSu6RmG5Ziy3qlhjIKQqontgJ9baZdtuAV37K3v05SQGv1rQwKgtffs6oFFtcJHXBu
         9QL5i4JjD5mmFWVK574xyWnLsUhz5XAh/0tR/v5/SaeVqXAqJwfQtjRyx7AWYhB0nphr
         y6dm7FC8lilqBvovP2k1HEaGXvyS37UzmfH3YZBBbwCpSPkOM++KchAmCmox587qsTjE
         LUKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759164694; x=1759769494;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uOhQfi3lM5cRRvjH6mjWD7Ac6qPYUHkAiP1fZ8KAt80=;
        b=qLaqtjOZYM0LNw9aN+HQsVZPnASZczW2+EilpZ5UKSn6EnFFO7bfk5hXbcA8NjTjoY
         QNxr/9UIpIr3nQ1OKLw95wp+UrFdkCQGpFIhNDP0Ncvi/AU8ilXh4dLq03mBqpZuZ5YK
         nHLNnzSXdDR2KevjhqGbPEHkh1FJkgOZ8HRRZ27bGh0VqMIKtSC2pRvTHBAs70Vtz0+B
         hwOCNGL3EgCssKp+3nRRIP9xWHXDD/f2s5yLY5rzK0MFwMbkFyu156XrCyRODI6cbXmI
         0zpK7ws+wWRDy/bDI0XRbxja7VpwH7qR9JjtRO7MIbumrZxIs2cbzSQbBulcShF0MkRS
         KGmg==
X-Gm-Message-State: AOJu0YzJUv9sLJuHkukk9zWYu6YkccH+OZADhWBMFQx43IPB7HfAVots
	/CPuakVNaaNQvB0UhX7PZnP2BCfjAEvZmZILy9OZV4cnzvqVy5o9M2kKYeWHv51umX/Qk8VgODe
	nJOgflmwSgjxM0GUovvGx0KkbhPhLw7o=
X-Gm-Gg: ASbGncvQ1KtdhajlOGePZC4D729n5wJZ+iszt1l3DIXbNEX53fVo28upX0AwA+aeCPN
	40Cr0ZjYZEK7tS/Nsi6ke0tDp4IXJPPI/HZWfc3uSY2cwZkKMBqRmyT84A1MQSw+D/xNsoarV3w
	i4yiirVS4n36ey6ArUysG6vcaNGTSUZWKBVE2jqFYgHkAHyS8w7cCexwiosmzRmehLZ1FNBOHkV
	Mutc6CvdbiZSo6ElcGXLW3O+LOy4Rm58kWx96LjGdmg7Tjg/KHUyNZQk7YbVJDriPJnFuBZviCG
	Zi2xL2j6BnbMT9qgfQwQ7yx3eN1UTyk91KJ0Ft2IrIrNhuz3T0IEn1ckfef3TlqFz58f
X-Google-Smtp-Source: AGHT+IFsGUo2F7j5Uc4BNXqgcasf6Ikb5329pM8RwPedvzvcpfA6HxSPel1XmnSE4EU1vqMf+lmrYcMiPryz9rErKFU=
X-Received: by 2002:a53:a441:0:b0:633:b6b5:ef2c with SMTP id
 956f58d0204a3-6361a7fca28mr15829429d50.27.1759164692641; Mon, 29 Sep 2025
 09:51:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250929130425.2912077-1-skandigraun@gmail.com> <20250929130425.2912077-2-skandigraun@gmail.com>
In-Reply-To: <20250929130425.2912077-2-skandigraun@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 29 Sep 2025 09:51:06 -0700
X-Gm-Features: AS18NWAOqVt_a5TzgUlBM9iFZh9yGmIN-VCinTDBXurWo_9stZoWtyT7oclAWeI
Message-ID: <CAMKF1souz+s4ex7f+Cqi7sKUKKWRc1tCPXaEU3gU3-sGwaEmdQ@mail.gmail.com>
Subject: Re: [oe] [meta-networking][kirkstone][PATCH 01/22] libtalloc: upgrade
 2.3.3 -> 2.3.4
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 16:51:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120038

I think the changes here are a bit more than I would expect for a
stable release. It also has some impact on python plugin support etc.
if this does not fix anything specific I would be reluctant for this change=
.

On Mon, Sep 29, 2025 at 6:05=E2=80=AFAM Gyorgy Sarvari via
lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
wrote:
>
> From: Yi Zhao <yi.zhao@windriver.com>
>
> * Refresh patches
> * Add a patch to skip checking PYTHONHASHSEED
>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> (cherry picked from commit e558529eed212995aa52be7c99a8e27251d4c41e)
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  ...-Add-configure-options-for-packages.patch} | 12 ++++----
>  ...pyext_PATTERN-for-cross-compilation.patch} | 10 +++----
>  ...wscript-skip-checking-PYTHONHASHSEED.patch | 30 +++++++++++++++++++
>  .../libtalloc/avoid-attr-unless-wanted.patch  | 19 ++++++++++--
>  ...{libtalloc_2.3.3.bb =3D> libtalloc_2.3.4.bb} | 10 +++----
>  5 files changed, 62 insertions(+), 19 deletions(-)
>  rename meta-networking/recipes-support/libtalloc/libtalloc/{options-2.2.=
0.patch =3D> 0001-talloc-Add-configure-options-for-packages.patch} (96%)
>  rename meta-networking/recipes-support/libtalloc/libtalloc/{0001-Fix-pye=
xt_PATTERN-for-cross-compilation.patch =3D> 0002-Fix-pyext_PATTERN-for-cros=
s-compilation.patch} (87%)
>  create mode 100644 meta-networking/recipes-support/libtalloc/libtalloc/0=
003-wscript-skip-checking-PYTHONHASHSEED.patch
>  rename meta-networking/recipes-support/libtalloc/{libtalloc_2.3.3.bb =3D=
> libtalloc_2.3.4.bb} (85%)
>
> diff --git a/meta-networking/recipes-support/libtalloc/libtalloc/options-=
2.2.0.patch b/meta-networking/recipes-support/libtalloc/libtalloc/0001-tall=
oc-Add-configure-options-for-packages.patch
> similarity index 96%
> rename from meta-networking/recipes-support/libtalloc/libtalloc/options-2=
.2.0.patch
> rename to meta-networking/recipes-support/libtalloc/libtalloc/0001-talloc=
-Add-configure-options-for-packages.patch
> index 46fef1096b..026a348992 100644
> --- a/meta-networking/recipes-support/libtalloc/libtalloc/options-2.2.0.p=
atch
> +++ b/meta-networking/recipes-support/libtalloc/libtalloc/0001-talloc-Add=
-configure-options-for-packages.patch
> @@ -1,4 +1,4 @@
> -From 8a82056ba2f70137714f225d82993aa4b11042da Mon Sep 17 00:00:00 2001
> +From 888bfe48236b4ce382dc3aa49791cadb70a1fbe4 Mon Sep 17 00:00:00 2001
>  From: Wang Mingyu <wangmy@cn.fujitsu.com>
>  Date: Fri, 25 Dec 2020 14:14:08 +0900
>  Subject: [PATCH] talloc: Add configure options for packages
> @@ -27,7 +27,7 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com=
>
>   2 files changed, 75 insertions(+), 21 deletions(-)
>
>  diff --git a/lib/replace/wscript b/lib/replace/wscript
> -index a2bc604..2e2e7bf 100644
> +index 827d74f..0348715 100644
>  --- a/lib/replace/wscript
>  +++ b/lib/replace/wscript
>  @@ -25,6 +25,41 @@ def options(opt):
> @@ -72,7 +72,7 @@ index a2bc604..2e2e7bf 100644
>   @Utils.run_once
>   def configure(conf):
>       conf.RECURSE('buildtools/wafsamba')
> -@@ -34,12 +69,25 @@ def configure(conf):
> +@@ -35,12 +70,25 @@ def configure(conf):
>       conf.DEFINE('HAVE_LIBREPLACE', 1)
>       conf.DEFINE('LIBREPLACE_NETWORK_CHECKS', 1)
>
> @@ -102,7 +102,7 @@ index a2bc604..2e2e7bf 100644
>       conf.CHECK_HEADERS('port.h')
>       conf.CHECK_HEADERS('sys/fcntl.h sys/filio.h sys/filsys.h sys/fs/s5p=
aram.h')
>       conf.CHECK_HEADERS('sys/id.h sys/ioctl.h sys/ipc.h sys/mman.h sys/m=
ode.h sys/ndir.h sys/priv.h')
> -@@ -121,8 +169,9 @@ def configure(conf):
> +@@ -110,8 +158,9 @@ def configure(conf):
>       conf.CHECK_HEADERS('sys/fileio.h sys/filesys.h sys/dustat.h sys/sys=
macros.h')
>       conf.CHECK_HEADERS('xfs/libxfs.h netgroup.h')
>
> @@ -114,7 +114,7 @@ index a2bc604..2e2e7bf 100644
>       conf.CHECK_HEADERS('nss_common.h nsswitch.h ns_api.h')
>       conf.CHECK_HEADERS('sys/extattr.h sys/ea.h sys/proplist.h sys/cdefs=
.h')
>       conf.CHECK_HEADERS('utmp.h utmpx.h lastlog.h')
> -@@ -418,20 +467,20 @@ def configure(conf):
> +@@ -431,20 +480,20 @@ def configure(conf):
>
>       strlcpy_in_bsd =3D False
>
> @@ -150,7 +150,7 @@ index a2bc604..2e2e7bf 100644
>       conf.CHECK_CODE('''
>                   struct ucred cred;
>  diff --git a/wscript b/wscript
> -index b955d21..4ac6e1e 100644
> +index 3089663..fdf9510 100644
>  --- a/wscript
>  +++ b/wscript
>  @@ -31,7 +31,12 @@ def options(opt):
> diff --git a/meta-networking/recipes-support/libtalloc/libtalloc/0001-Fix=
-pyext_PATTERN-for-cross-compilation.patch b/meta-networking/recipes-suppor=
t/libtalloc/libtalloc/0002-Fix-pyext_PATTERN-for-cross-compilation.patch
> similarity index 87%
> rename from meta-networking/recipes-support/libtalloc/libtalloc/0001-Fix-=
pyext_PATTERN-for-cross-compilation.patch
> rename to meta-networking/recipes-support/libtalloc/libtalloc/0002-Fix-py=
ext_PATTERN-for-cross-compilation.patch
> index 47ee4bb24e..058ac34f81 100644
> --- a/meta-networking/recipes-support/libtalloc/libtalloc/0001-Fix-pyext_=
PATTERN-for-cross-compilation.patch
> +++ b/meta-networking/recipes-support/libtalloc/libtalloc/0002-Fix-pyext_=
PATTERN-for-cross-compilation.patch
> @@ -1,4 +1,4 @@
> -From b5eaeb7ed4e75012d2715f995e15a13850064f61 Mon Sep 17 00:00:00 2001
> +From 6580e8191c219909d50c991662310e668973722d Mon Sep 17 00:00:00 2001
>  From: Yi Zhao <yi.zhao@windriver.com>
>  Date: Wed, 24 Nov 2021 13:33:35 +0800
>  Subject: [PATCH] Fix pyext_PATTERN for cross compilation
> @@ -40,18 +40,18 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/third_party/waf/waflib/Tools/python.py b/third_party/waf/wa=
flib/Tools/python.py
> -index b1c8dd0..24faa31 100644
> +index a23bd01..af202e0 100644
>  --- a/third_party/waf/waflib/Tools/python.py
>  +++ b/third_party/waf/waflib/Tools/python.py
>  @@ -328,7 +328,7 @@ def check_python_headers(conf, features=3D'pyembed p=
yext'):
>         x =3D 'MACOSX_DEPLOYMENT_TARGET'
>         if dct[x]:
> -               env[x] =3D conf.environ[x] =3D dct[x]
> --      env.pyext_PATTERN =3D '%s' + dct['SO'] # not a mistake
> +               env[x] =3D conf.environ[x] =3D str(dct[x])
> +-      env.pyext_PATTERN =3D '%s' + (dct['EXT_SUFFIX'] or dct['SO']) # S=
O is deprecated in 3.5 and removed in 3.11
>  +      env.pyext_PATTERN =3D '%s.so'
>
>
>         # Try to get pythonX.Y-config
>  --
> -2.17.1
> +2.25.1
>
> diff --git a/meta-networking/recipes-support/libtalloc/libtalloc/0003-wsc=
ript-skip-checking-PYTHONHASHSEED.patch b/meta-networking/recipes-support/l=
ibtalloc/libtalloc/0003-wscript-skip-checking-PYTHONHASHSEED.patch
> new file mode 100644
> index 0000000000..617eaa7dc5
> --- /dev/null
> +++ b/meta-networking/recipes-support/libtalloc/libtalloc/0003-wscript-sk=
ip-checking-PYTHONHASHSEED.patch
> @@ -0,0 +1,30 @@
> +From 4a1b8659235dcac5382a627a4add4d636a65a886 Mon Sep 17 00:00:00 2001
> +From: Yi Zhao <yi.zhao@windriver.com>
> +Date: Wed, 28 Dec 2022 16:31:05 +0800
> +Subject: [PATCH] wscript: skip checking PYTHONHASHSEED
> +
> +Skip checking PYTHONHASHSEED as it is set to 0 in oe-core by default.
> +
> +Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> +---
> + buildtools/wafsamba/wscript | 4 ----
> + 1 file changed, 4 deletions(-)
> +
> +diff --git a/buildtools/wafsamba/wscript b/buildtools/wafsamba/wscript
> +index 8729b08..a4d6f3e 100644
> +--- a/buildtools/wafsamba/wscript
> ++++ b/buildtools/wafsamba/wscript
> +@@ -8,10 +8,6 @@ import wafsamba
> + from samba_utils import symlink
> + from optparse import SUPPRESS_HELP
> +
> +-phs =3D os.environ.get("PYTHONHASHSEED", None)
> +-if phs !=3D "1":
> +-    raise Errors.WafError('''PYTHONHASHSEED=3D1 missing! Don't use waf =
directly, use ./configure and make!''')
> +-
> + # this forces configure to be re-run if any of the configure
> + # sections of the build scripts change. We have to check
> + # for this in sys.argv as options have not yet been parsed when
> +--
> +2.25.1
> +
> diff --git a/meta-networking/recipes-support/libtalloc/libtalloc/avoid-at=
tr-unless-wanted.patch b/meta-networking/recipes-support/libtalloc/libtallo=
c/avoid-attr-unless-wanted.patch
> index 5b7f69ec07..3c85a8a2d4 100644
> --- a/meta-networking/recipes-support/libtalloc/libtalloc/avoid-attr-unle=
ss-wanted.patch
> +++ b/meta-networking/recipes-support/libtalloc/libtalloc/avoid-attr-unle=
ss-wanted.patch
> @@ -1,6 +1,17 @@
> +From e18370c204056de799064d8ac72a656eb3745f95 Mon Sep 17 00:00:00 2001
> +From: Wang Mingyu <wangmy@cn.fujitsu.com>
> +Date: Fri, 25 Dec 2020 15:10:58 +0900
> +Subject: [PATCH] avoid attr unless wanted
> +
> +---
> + lib/replace/wscript | 4 +---
> + 1 file changed, 1 insertion(+), 3 deletions(-)
> +
> +diff --git a/lib/replace/wscript b/lib/replace/wscript
> +index 0348715..a8554d9 100644
>  --- a/lib/replace/wscript
>  +++ b/lib/replace/wscript
> -@@ -947,8 +947,6 @@ def build(bld):
> +@@ -967,8 +967,6 @@ def build(bld):
>       if not bld.CONFIG_SET('HAVE_INET_ATON'):     REPLACE_SOURCE +=3D ' =
inet_aton.c'
>       if not bld.CONFIG_SET('HAVE_INET_NTOP'):     REPLACE_SOURCE +=3D ' =
inet_ntop.c'
>       if not bld.CONFIG_SET('HAVE_INET_PTON'):     REPLACE_SOURCE +=3D ' =
inet_pton.c'
> @@ -9,13 +20,15 @@
>
>       if not bld.CONFIG_SET('HAVE_CLOSEFROM'):
>           REPLACE_SOURCE +=3D ' closefrom.c'
> -@@ -962,7 +960,7 @@ def build(bld):
> -                       # at the moment:
> +@@ -983,7 +981,7 @@ def build(bld):
>                         # hide_symbols=3Dbld.BUILTIN_LIBRARY('replace'),
>                         private_library=3DTrue,
> +                       provide_builtin_linking=3DTrue,
>  -                      deps=3D'dl attr' + extra_libs)
>  +                      deps=3D'dl' + extra_libs)
>
>       replace_test_cflags =3D ''
>       if bld.CONFIG_SET('HAVE_WNO_FORMAT_TRUNCATION'):
> +--
> +2.25.1
>
> diff --git a/meta-networking/recipes-support/libtalloc/libtalloc_2.3.3.bb=
 b/meta-networking/recipes-support/libtalloc/libtalloc_2.3.4.bb
> similarity index 85%
> rename from meta-networking/recipes-support/libtalloc/libtalloc_2.3.3.bb
> rename to meta-networking/recipes-support/libtalloc/libtalloc_2.3.4.bb
> index b3f8b2ce25..ad812da803 100644
> --- a/meta-networking/recipes-support/libtalloc/libtalloc_2.3.3.bb
> +++ b/meta-networking/recipes-support/libtalloc/libtalloc_2.3.4.bb
> @@ -1,17 +1,17 @@
>  SUMMARY =3D "Hierarchical, reference counted memory pool system with des=
tructors"
> -HOMEPAGE =3D "http://talloc.samba.org"
> +HOMEPAGE =3D "https://talloc.samba.org"
>  SECTION =3D "libs"
>  LICENSE =3D "LGPL-3.0-or-later & GPL-3.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://talloc.h;beginline=3D3;endline=3D27;md5=3Da=
301712782cad6dd6d5228bfa7825249 \
>                      file://pytalloc.h;beginline=3D1;endline=3D18;md5=3D2=
1ab13bd853679d7d47a1739cb3b7db6 \
>                      "
>
> -
>  SRC_URI =3D "https://www.samba.org/ftp/talloc/talloc-${PV}.tar.gz \
> -           file://options-2.2.0.patch \
> -           file://0001-Fix-pyext_PATTERN-for-cross-compilation.patch \
> +           file://0001-talloc-Add-configure-options-for-packages.patch \
> +           file://0002-Fix-pyext_PATTERN-for-cross-compilation.patch \
> +           file://0003-wscript-skip-checking-PYTHONHASHSEED.patch \
>  "
> -SRC_URI[sha256sum] =3D "6be95b2368bd0af1c4cd7a88146eb6ceea18e46c3ffc9330=
bf6262b40d1d8aaa"
> +SRC_URI[sha256sum] =3D "179f9ebe265e67e4ab2c26cad2b7de4b6a77c6c212f96690=
3382869f06be6505"
>
>  inherit waf-samba
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#120014): https://lists.openembedded.org/g/openembedde=
d-devel/message/120014
> Mute This Topic: https://lists.openembedded.org/mt/115494435/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

