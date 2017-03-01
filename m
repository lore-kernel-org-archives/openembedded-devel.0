Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8A26377553
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Mar 2017 18:54:06 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id g10so6674112wrg.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Mar 2017 10:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=vgtRQkgg5JG+GiFQThrUXInuXNh33DpoCpZsLjMMLg8=;
	b=mIDjkRIrai2N1gz+TKk2rK8CJ7zJZDe4j5aRK5bL5MpbthJ7oFmvNKWURv9N5qgvnG
	d/MLv1zSwHTENY1uBm4Qq88KOtYGfw5b1gG9Xaw0+nJTzC02wZdnAjvd/2UGuUKUwslT
	mToDrMdpNBshULxiJXjnT6NoM7qvcyHv2844W3wYvkBODcmqL5zPau4Ei2xfT3avUz7u
	fXYO/lpx6rAJ6dqWinrOCKW5OxHsPUECRGN8LVjL6+cAxQtD5IcG4mU1oadny1/evE3U
	prVBzWB/YWfC/lFrmR6JMrPY/2Z/zh0K8R4XSIQLOQ4bBeLFEDFxAx8XSYMao9tPvpvB
	j36Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=vgtRQkgg5JG+GiFQThrUXInuXNh33DpoCpZsLjMMLg8=;
	b=ZPE03/JIuTLc8I1rJ0SiBqi9dRQdflIlPiEm3WIdtRQPTXYjdSkC1GOyAoojnldN3P
	uC2aT3Gqydc8QDy2K3R010YrSHwzvjHAbZMoLj1wsfQ6KHeXmx6p6sf+RWPwT8aKgwwU
	saVZ5hDRG7Fa/XL37aPy8n/dpZ+IFhRKmjnga42BTLyFbgDfGmu7FFuHo4T8i507Zmuc
	vSV/7etYvw+zHg8ECxRcxQS6Ye2Behfb5kxJuxRlU89j1//hMiIUqUYI9/yLyprEHjYs
	iyPzNF6aNrdpNB2E07jS51jGVsMdRVfuvcRqbL/V4pY+6Vjy/jw82oL2itU4l2bLFVXw
	d3fg==
X-Gm-Message-State: AMke39kEFpfzNZU8m7VO9JPtcVtqVqecYMMILBo5iytgeS4CW2cmzZIFx/N02EYkjpB65w==
X-Received: by 10.223.174.165 with SMTP id y34mr8788530wrc.40.1488394446801;
	Wed, 01 Mar 2017 10:54:06 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	v102sm7703424wrb.11.2017.03.01.10.54.04
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 01 Mar 2017 10:54:04 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 1 Mar 2017 19:54:05 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20170301185405.GC3290@jama>
References: <20170217081125.9677-1-koen.kooi@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20170217081125.9677-1-koen.kooi@linaro.org>
User-Agent: Mutt/1.8.0 (2017-02-23)
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: Re: [meta-oe][PATCH] efivar: update to 0.30 to fix readdir* issues
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Mar 2017 18:54:07 -0000
X-Groupsio-MsgNum: 65637
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="f0KYrhQ4vYSV2aJu"
Content-Disposition: inline

--f0KYrhQ4vYSV2aJu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 17, 2017 at 09:11:25AM +0100, Koen Kooi wrote:
> Drop patches with upstream fixes.
>=20
> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> ---
>  .../efivar/efivar/0002-disable-static-build.patch  | 33 ----------------
>  .../0004-fix-unknow-option-for-gold-linker.patch   | 38 ----------------=
--
>  .../fix-compile-failure-with-host-gcc-4.6.patch    | 45 ----------------=
------
>  .../efivar/{efivar_0.24.bb =3D> efivar_0.30.bb}      |  8 +---
>  4 files changed, 2 insertions(+), 122 deletions(-)
>  delete mode 100644 meta-oe/recipes-extended/efivar/efivar/0002-disable-s=
tatic-build.patch
>  delete mode 100644 meta-oe/recipes-extended/efivar/efivar/0004-fix-unkno=
w-option-for-gold-linker.patch
>  delete mode 100644 meta-oe/recipes-extended/efivar/efivar/fix-compile-fa=
ilure-with-host-gcc-4.6.patch
>  rename meta-oe/recipes-extended/efivar/{efivar_0.24.bb =3D> efivar_0.30.=
bb} (72%)

Looks like 0004-fix-unknow-option-for-gold-linker.patch is still needed
for building with gold:
http://errors.yoctoproject.org/Errors/Details/134455/

>=20
> diff --git a/meta-oe/recipes-extended/efivar/efivar/0002-disable-static-b=
uild.patch b/meta-oe/recipes-extended/efivar/efivar/0002-disable-static-bui=
ld.patch
> deleted file mode 100644
> index 951b159..0000000
> --- a/meta-oe/recipes-extended/efivar/efivar/0002-disable-static-build.pa=
tch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -From 126e0d3c1ad74cf5b0abe9e98ec444bcc3c83159 Mon Sep 17 00:00:00 2001
> -From: Koen Kooi <koen.kooi@linaro.org>
> -Date: Fri, 4 Mar 2016 14:53:55 +0100
> -Subject: [PATCH 2/2] disable static build
> -
> -Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> -
> -Upstream-Status: Inappropriate [meta-oe specific]
> -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> -
> ----
> - src/Makefile | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/src/Makefile b/src/Makefile
> -index 1829d22..c7a0ca3 100644
> ---- a/src/Makefile
> -+++ b/src/Makefile
> -@@ -8,9 +8,9 @@ include $(TOPDIR)/Make.defaults
> -=20
> - LIBTARGETS=3Dlibefivar.so libefiboot.so
> - STATICLIBTARGETS=3Dlibefivar.a libefiboot.a
> --BINTARGETS=3Defivar efivar-static
> -+BINTARGETS=3Defivar
> - PCTARGETS=3Defivar.pc efiboot.pc
> --TARGETS=3D$(LIBTARGETS) $(STATICLIBTARGETS) $(BINTARGETS) $(PCTARGETS)
> -+TARGETS=3D$(LIBTARGETS) $(BINTARGETS) $(PCTARGETS)
> -=20
> - LIBEFIBOOT_SOURCES =3D crc32.c creator.c disk.c gpt.c linux.c loadopt.c
> - LIBEFIBOOT_OBJECTS =3D $(patsubst %.c,%.o,$(LIBEFIBOOT_SOURCES))
> ---=20
> -2.4.3
> -
> diff --git a/meta-oe/recipes-extended/efivar/efivar/0004-fix-unknow-optio=
n-for-gold-linker.patch b/meta-oe/recipes-extended/efivar/efivar/0004-fix-u=
nknow-option-for-gold-linker.patch
> deleted file mode 100644
> index 5d50c19..0000000
> --- a/meta-oe/recipes-extended/efivar/efivar/0004-fix-unknow-option-for-g=
old-linker.patch
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -From b3d35e7dd27a755df5acbe050837885914dbb28b Mon Sep 17 00:00:00 2001
> -From: Hongxu Jia <hongxu.jia@windriver.com>
> -Date: Tue, 10 May 2016 11:34:50 -0400
> -Subject: [PATCH]  fix unknow option for gold linker
> -
> -- Revert the following patch, since oe-core work with gcc 5
> -...
> -commit 3055a3797f16693dfdd855fa68bc57fd900dc408
> -Author: Peter Jones <pjones@redhat.com>
> -Date:   Mon Feb 15 14:15:40 2016 -0500
> -
> -    Make gcc.specs work with gcc 6 / binutils 2.26
> -
> -    Apparently binutils 2.26 gets real picky about "ld -PIC" vs "ld -fPI=
C".
> -
> -    Signed-off-by: Peter Jones <pjones@redhat.com>
> -...
> -
> -- Remove unknown option '--add-needed'
> -
> -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ----
> - gcc.specs | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/gcc.specs b/gcc.specs
> -index 24fabc2..5b0fdef 100644
> ---- a/gcc.specs
> -+++ b/gcc.specs
> -@@ -14,4 +14,4 @@
> - + %{!shared:%{!static:%{!r:-pie}}} %{static:-Wl,-no-fatal-warnings -Wl,=
-static -static -Wl,-z,relro,-z,now}
> -=20
> - *link:
> --+ %{!static:--fatal-warnings} --no-undefined-version --no-allow-shlib-u=
ndefined --add-needed -z now --build-id %{!static:%{!shared:-PIE}} %{shared=
:-z relro -PIC} %{static:%<pie}
> -++ %{!static:--fatal-warnings} --no-undefined-version --no-allow-shlib-u=
ndefined -z now --build-id %{!static:%{!shared:-pie}} %{shared:-z relro -fP=
IC} %{static:%<pie}
> ---=20
> -2.8.1
> -
> diff --git a/meta-oe/recipes-extended/efivar/efivar/fix-compile-failure-w=
ith-host-gcc-4.6.patch b/meta-oe/recipes-extended/efivar/efivar/fix-compile=
-failure-with-host-gcc-4.6.patch
> deleted file mode 100644
> index 1c68a29..0000000
> --- a/meta-oe/recipes-extended/efivar/efivar/fix-compile-failure-with-hos=
t-gcc-4.6.patch
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -From 1361225abbaba878960f970df39a4570bbc39553 Mon Sep 17 00:00:00 2001
> -From: Hongxu Jia <hongxu.jia@windriver.com>
> -Date: Thu, 26 May 2016 21:50:01 -0400
> -Subject: [PATCH] fix compile failure with older host gcc (<=3D4.6)
> -
> -While host gcc version is 4.6.3 in ubuntu 1204, it
> -did not recognize -std=3Dgnu11 and -Wmaybe-uninitialized.
> -
> -While host gcc version is 4.4.7 in centos6, it
> -did not recognize -std=3Dgnu11, -Wmaybe-uninitialized,
> -and -flto.
> -
> -For native build, use -std=3Dgnu99 to replace -std=3Dgnu11,
> -and directly remove -Wmaybe-uninitialized and -flto.
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ----
> - gcc.specs | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/gcc.specs b/gcc.specs
> -index 0d4bbda..3802ca6 100644
> ---- a/gcc.specs
> -+++ b/gcc.specs
> -@@ -2,13 +2,13 @@
> - + -D_GNU_SOURCE
> -=20
> - *efivar_cpp_options:
> -- -Werror -Wall -std=3Dgnu11 -Wextra
> -+ -Werror -Wall -std=3Dgnu99 -Wextra
> -=20
> - *cpp_options:
> - + %(efivar_cpp_options)
> -=20
> - *cc1_options:
> --+ %(efivar_cpp_options) -Wmaybe-uninitialized -fno-merge-constants -flt=
o -fvisibility=3Dhidden %{!r:%{!fpie:%{!fPIE:%{!fpic:%{!fPIC:%{!fno-pic:-fP=
IE}}}}}}
> -++ %(efivar_cpp_options) -fno-merge-constants -fvisibility=3Dhidden %{!r=
:%{!fpie:%{!fPIE:%{!fpic:%{!fPIC:%{!fno-pic:-fPIE}}}}}}
> -=20
> - *self_spec:
> - + %{!shared:%{!static:%{!r:-pie}}} %{static:-Wl,-no-fatal-warnings -Wl,=
-static -static -Wl,-z,relro,-z,now}
> ---=20
> -2.8.1
> -
> diff --git a/meta-oe/recipes-extended/efivar/efivar_0.24.bb b/meta-oe/rec=
ipes-extended/efivar/efivar_0.30.bb
> similarity index 72%
> rename from meta-oe/recipes-extended/efivar/efivar_0.24.bb
> rename to meta-oe/recipes-extended/efivar/efivar_0.30.bb
> index 4c7793f..f002a27 100644
> --- a/meta-oe/recipes-extended/efivar/efivar_0.24.bb
> +++ b/meta-oe/recipes-extended/efivar/efivar_0.30.bb
> @@ -10,15 +10,13 @@ DEPENDS_append_class-target =3D " efivar-native"
> =20
>  COMPATIBLE_HOST =3D "(i.86|x86_64|arm|aarch64).*-linux"
> =20
> -SRCREV =3D "963cb2e5adc145fe00717f94e382f2973f80e753"
> +SRCREV =3D "270205d88598d60d4e75f9cec13b8d25d82ee550"
>  SRC_URI =3D "git://github.com/rhinstaller/efivar.git \
> -           file://0002-disable-static-build.patch \
>  "
>  SRC_URI_append_class-target =3D " file://0001-efivar-fix-for-cross-compi=
le.patch \
>                                  file://0003-efivar-fix-for-cross-compile=
=2Epatch \
> -                                ${@bb.utils.contains('DISTRO_FEATURES', =
'ld-is-gold', 'file://0004-fix-unknow-option-for-gold-linker.patch', '', d)=
} \
>                                "
> -SRC_URI_append_class-native =3D " file://fix-compile-failure-with-host-g=
cc-4.6.patch \
> +SRC_URI_append_class-native =3D " \=20
>                                  file://allow-multi-definitions-for-nativ=
e.patch \
>                                "
> =20
> @@ -41,5 +39,3 @@ do_install_append_class-native() {
> =20
>  BBCLASSEXTEND =3D "native"
> =20
> -
> -PNBLACKLIST[efivar] ?=3D "Fails to build with RSS http://errors.yoctopro=
ject.org/Errors/Details/132821/"
> --=20
> 2.9.3
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--f0KYrhQ4vYSV2aJu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iFwEARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWLcYzQAKCRA3VSO3ZXaA
HGRYAJUVJ+wx/rwnnOHfexNYoI6q31AsAKCQ38Bl/G5bKEKC6h8WMPkp6RV2wg==
=REIk
-----END PGP SIGNATURE-----

--f0KYrhQ4vYSV2aJu--
