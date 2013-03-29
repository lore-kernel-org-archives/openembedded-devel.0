Received: from mail-pa0-f42.google.com ([209.85.220.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1ULUQg-0007k7-Tx
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Mar 2013 09:13:20 +0100
Received: by mail-pa0-f42.google.com with SMTP id kq13so255451pab.15
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Mar 2013 00:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=04+J0FhzqsLHfNd+2u1nJmPfMXcW9BOxDV4eWrnX7Ss=;
	b=mtLzcS/PgLPOLdNrQLkgm8qb2jH4Bj87N2hMKSoDoP5cbEsdRqRE+mA8YPC5DILBbQ
	00fbgJN+oTV9RDCcCpRBQK5spVJVmOSUH77cl8W2qnZHwENGEYiThx1CeZIy0rKyvQ6K
	6fo3ApYd1RfbbYV/hcpCNOxhqLZcd+ynFQqR0N5rkjUhaD7vGWbM+38fx5OPf4pm1WlI
	c2gvfbESTcQHhjRXQnnEWo9NdOh6YdqP+++NDFBGOBp58tRvBfUV4vwvWM5KB/EB9DEV
	rDqNCLSX6tTa1TW5fwAksinmNalAw70113LYmyJ8rCn2OMjzKO4K7V4H9qKlAznVZ/rx
	233A==
X-Received: by 10.66.220.10 with SMTP id ps10mr2151568pac.117.1364543750229;
	Fri, 29 Mar 2013 00:55:50 -0700 (PDT)
Received: from vspringer-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPS id cn1sm1981698pbb.7.2013.03.29.00.55.42
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 29 Mar 2013 00:55:48 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1364543252-18751-1-git-send-email-elvis.dowson@gmail.com>
Date: Fri, 29 Mar 2013 00:55:41 -0700
Message-Id: <EEAF4EC9-48F2-494E-8738-288B1786D9B2@gmail.com>
References: <y> <1364543252-18751-1-git-send-email-elvis.dowson@gmail.com>
To: Elvis Dowson <elvis.dowson@gmail.com>
X-Mailer: Apple Mail (2.1503)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [openembedded-core-contrib] gcc-4.8: Refactor gcc-4.8.0 patch files.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Mar 2013 08:13:32 -0000
X-List-Received-Date: Fri, 29 Mar 2013 08:13:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

You did not mention whats refactored. One thing I notice they are git =
am'able now
however you are signed up as author of all the patches if you send that =
email via git send-email
and if you send patches upstream like that you will be frowned upon. So =
if you were adamant to gitify them
you should have done --autho=3Dblah while committing them

besides this is there anything else=20

On Mar 29, 2013, at 12:47 AM, Elvis Dowson <elvis.dowson@gmail.com> =
wrote:

> Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
> ---
> meta/recipes-devtools/gcc/gcc-4.8.inc              |   70 +-
> .../0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch     |   42 +
> .../gcc/gcc-4.8/0002-uclibc-conf.patch             |   53 +
> .../0003-gcc-uclibc-locale-ctype_touplow_t.patch   |   87 +
> .../gcc/gcc-4.8/0004-uclibc-locale.patch           | 2862 =
++++++++++++++++++++
> .../gcc/gcc-4.8/0005-uclibc-locale-no__x.patch     |  257 ++
> .../gcc/gcc-4.8/0006-uclibc-locale-wchar_fix.patch |   68 +
> .../gcc/gcc-4.8/0007-uclibc-locale-update.patch    |  542 ++++
> .../gcc/gcc-4.8/0008-missing-execinfo_h.patch      |   28 +
> .../gcc/gcc-4.8/0009-c99-snprintf.patch            |   28 +
> .../gcc/gcc-4.8/0010-c99-complex-ugly-hack.patch   |   29 +
> .../gcc/gcc-4.8/0011-index_macro.patch             |   44 +
> .../gcc/gcc-4.8/0012-libmudflap-susv3-legacy.patch |   64 +
> .../gcc/gcc-4.8/0013-libstdc-namespace.patch       |   54 +
> .../gcc/gcc-4.8/0014-sh-pr24836.patch              |   45 +
> ...GET_ENDIAN_OPTION-for-determining-MULTILI.patch |   29 +
> .../0016-gcc-poison-system-directories.patch       |  224 ++
> .../gcc/gcc-4.8/0017-gcc-poison-dir-extend.patch   |   39 +
> .../0018-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch |   73 +
> .../gcc/gcc-4.8/0019-64-bit-multilib-hack.patch    |   82 +
> .../gcc/gcc-4.8/0020-optional-libstdc.patch        |  102 +
> ...0021-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch |   59 +
> .../gcc/gcc-4.8/0022-COLLECT_GCC_OPTIONS.patch     |   38 +
> ...efaults.h-in-B-instead-of-S-and-t-oe-in-B.patch |   88 +
> .../gcc/gcc-4.8/0024-PR-target-32219.patch         |   67 +
> .../gcc-4.8/0025-fortran-cross-compile-hack.patch  |   46 +
> .../gcc/gcc-4.8/0026-libgcc-sjlj-check.patch       |   74 +
> .../gcc/gcc-4.8/0027-cpp-honor-sysroot.patch       |   54 +
> .../gcc-4.8/0028-MIPS64-Default-to-N64-ABI.patch   |   31 +
> ...C_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch |  190 ++
> ...0030-gcc-Fix-argument-list-too-long-error.patch |   40 +
> .../gcc/gcc-4.8/0031-Disable-sdt.patch             |   45 +
> .../gcc/gcc-4.8/0032-libtool.patch                 |   42 +
> ...4-pass-fix-v4bx-to-linker-to-support-EABI.patch |   43 +
> ...tilib-config-files-from-B-instead-of-usin.patch |  102 +
> .../gcc/gcc-4.8/0035-wcast-qual-PR-55383.patch     |   55 +
> .../gcc/gcc-4.8/100-uclibc-conf.patch              |   39 -
> .../gcc/gcc-4.8/200-uclibc-locale.patch            | 2810 =
-------------------
> .../gcc/gcc-4.8/203-uclibc-locale-no__x.patch      |  235 --
> .../gcc/gcc-4.8/204-uclibc-locale-wchar_fix.patch  |   54 -
> .../gcc/gcc-4.8/205-uclibc-locale-update.patch     |  521 ----
> .../gcc/gcc-4.8/301-missing-execinfo_h.patch       |   15 -
> .../gcc/gcc-4.8/302-c99-snprintf.patch             |   15 -
> .../gcc/gcc-4.8/303-c99-complex-ugly-hack.patch    |   16 -
> .../gcc/gcc-4.8/304-index_macro.patch              |   30 -
> .../gcc/gcc-4.8/305-libmudflap-susv3-legacy.patch  |   51 -
> .../gcc/gcc-4.8/306-libstdc++-namespace.patch      |   40 -
> meta/recipes-devtools/gcc/gcc-4.8/64bithack.patch  |   66 -
> .../gcc/gcc-4.8/740-sh-pr24836.patch               |   31 -
> .../gcc/gcc-4.8/800-arm-bigendian.patch            |   20 -
> .../gcc/gcc-4.8/COLLECT_GCC_OPTIONS.patch          |   25 -
> .../gcc/gcc-4.8/GLIBC_DYNAMIC_LINKER.patch         |  167 --
> .../gcc/gcc-4.8/cpp-honor-sysroot.patch            |   40 -
> .../gcc/gcc-4.8/disable_relax_pic_calls_flag.patch |   48 -
> meta/recipes-devtools/gcc/gcc-4.8/disablesdt.patch |   32 -
> .../gcc/gcc-4.8/fortran-cross-compile-hack.patch   |   32 -
> .../gcc-4.8/gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch  |   33 -
> .../gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch      |  116 -
> .../gcc/gcc-4.8/gcc-argument-list-too-long.patch   |   33 -
> .../gcc-4.8/gcc-armv4-pass-fix-v4bx-to-ld.patch    |   31 -
> .../gcc/gcc-4.8/gcc-poison-dir-extend.patch        |   27 -
> .../gcc-4.8/gcc-poison-system-directories.patch    |  231 --
> .../gcc-uclibc-locale-ctype_touplow_t.patch        |   72 -
> .../gcc/gcc-4.8/libgcc-sjlj-check.patch            |   61 -
> meta/recipes-devtools/gcc/gcc-4.8/libtool.patch    |   29 -
> .../gcc/gcc-4.8/mips64-default-n64.patch           |   19 -
> .../gcc/gcc-4.8/optional_libstdc.patch             |   86 -
> meta/recipes-devtools/gcc/gcc-4.8/pr32219.patch    |   72 -
> .../gcc/gcc-4.8/use-defaults.h-and-t-oe-in-B.patch |   77 -
> .../gcc/gcc-4.8/use-ml-conf-files-from-B.patch     |   87 -
> .../gcc/gcc-4.8/wcast-qual-PR55383.patch           |   43 -
> 71 files changed, 5761 insertions(+), 5339 deletions(-)
> create mode 100644 =
meta/recipes-devtools/gcc/gcc-4.8/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.pat=
ch
> create mode 100644 =
meta/recipes-devtools/gcc/gcc-4.8/0002-uclibc-conf.patch
> create mode 100644 =
meta/recipes-devtools/gcc/gcc-4.8/0003-gcc-uclibc-locale-ctype_touplow_t.p=
atch
> create mode 100644 =
meta/recipes-devtools/gcc/gcc-4.8/0004-uclibc-locale.patch
> create mode 100644 =
meta/recipes-devtools/gcc/gcc-4.8/0005-uclibc-locale-no__x.patch
> create mode 100644 =
meta/recipes-devtools/gcc/gcc-4.8/0006-uclibc-locale-wchar_fix.patch
> create mode 100644 =
meta/recipes-devtools/gcc/gcc-4.8/0007-uclibc-locale-update.patch
> create mode 100644 =
meta/recipes-devtools/gcc/gcc-4.8/0008-missing-execinfo_h.patch
> create mode 100644 =
meta/recipes-devtools/gcc/gcc-4.8/0009-c99-snprintf.patch
> create mode 100644 =
meta/recipes-devtools/gcc/gcc-4.8/0010-c99-complex-ugly-hack.patch
> create mode 100644 =
meta/recipes-devtools/gcc/gcc-4.8/0011-index_macro.patch
> create mode 100644 =
meta/recipes-devtools/gcc/gcc-4.8/0012-libmudflap-susv3-legacy.patch
> create mode 100644 =
meta/recipes-devtools/gcc/gcc-4.8/0013-libstdc-namespace.patch
> create mode 100644 =
meta/recipes-devtools/gcc/gcc-4.8/0014-sh-pr24836.patch
> create mode 100644 =
meta/recipes-devtools/gcc/gcc-4.8/0015-arm-Use-TARGET_ENDIAN_OPTION-for-de=
termining-MULTILI.patch
> create mode 100644 =
meta/recipes-devtools/gcc/gcc-4.8/0016-gcc-poison-system-directories.patch=

> create mode 100644 =
meta/recipes-devtools/gcc/gcc-4.8/0017-gcc-poison-dir-extend.patch
> create mode 100644 =
meta/recipes-devtools/gcc/gcc-4.8/0018-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET=
.patch
> create mode 100644 =
meta/recipes-devtools/gcc/gcc-4.8/0019-64-bit-multilib-hack.patch
> create mode 100644 =
meta/recipes-devtools/gcc/gcc-4.8/0020-optional-libstdc.patch
> create mode 100644 =
meta/recipes-devtools/gcc/gcc-4.8/0021-gcc-disable-MASK_RELAX_PIC_CALLS-bi=
t.patch
> create mode 100644 =
meta/recipes-devtools/gcc/gcc-4.8/0022-COLLECT_GCC_OPTIONS.patch
> create mode 100644 =
meta/recipes-devtools/gcc/gcc-4.8/0023-Use-the-defaults.h-in-B-instead-of-=
S-and-t-oe-in-B.patch
> create mode 100644 =
meta/recipes-devtools/gcc/gcc-4.8/0024-PR-target-32219.patch
> create mode 100644 =
meta/recipes-devtools/gcc/gcc-4.8/0025-fortran-cross-compile-hack.patch
> create mode 100644 =
meta/recipes-devtools/gcc/gcc-4.8/0026-libgcc-sjlj-check.patch
> create mode 100644 =
meta/recipes-devtools/gcc/gcc-4.8/0027-cpp-honor-sysroot.patch
> create mode 100644 =
meta/recipes-devtools/gcc/gcc-4.8/0028-MIPS64-Default-to-N64-ABI.patch
> create mode 100644 =
meta/recipes-devtools/gcc/gcc-4.8/0029-Define-GLIBC_DYNAMIC_LINKER-and-UCL=
IBC_DYNAMIC_LINKE.patch
> create mode 100644 =
meta/recipes-devtools/gcc/gcc-4.8/0030-gcc-Fix-argument-list-too-long-erro=
r.patch
> create mode 100644 =
meta/recipes-devtools/gcc/gcc-4.8/0031-Disable-sdt.patch
> create mode 100644 =
meta/recipes-devtools/gcc/gcc-4.8/0032-libtool.patch
> create mode 100644 =
meta/recipes-devtools/gcc/gcc-4.8/0033-gcc-armv4-pass-fix-v4bx-to-linker-t=
o-support-EABI.patch
> create mode 100644 =
meta/recipes-devtools/gcc/gcc-4.8/0034-Use-the-multilib-config-files-from-=
B-instead-of-usin.patch
> create mode 100644 =
meta/recipes-devtools/gcc/gcc-4.8/0035-wcast-qual-PR-55383.patch
> delete mode 100644 =
meta/recipes-devtools/gcc/gcc-4.8/100-uclibc-conf.patch
> delete mode 100644 =
meta/recipes-devtools/gcc/gcc-4.8/200-uclibc-locale.patch
> delete mode 100644 =
meta/recipes-devtools/gcc/gcc-4.8/203-uclibc-locale-no__x.patch
> delete mode 100644 =
meta/recipes-devtools/gcc/gcc-4.8/204-uclibc-locale-wchar_fix.patch
> delete mode 100644 =
meta/recipes-devtools/gcc/gcc-4.8/205-uclibc-locale-update.patch
> delete mode 100644 =
meta/recipes-devtools/gcc/gcc-4.8/301-missing-execinfo_h.patch
> delete mode 100644 =
meta/recipes-devtools/gcc/gcc-4.8/302-c99-snprintf.patch
> delete mode 100644 =
meta/recipes-devtools/gcc/gcc-4.8/303-c99-complex-ugly-hack.patch
> delete mode 100644 =
meta/recipes-devtools/gcc/gcc-4.8/304-index_macro.patch
> delete mode 100644 =
meta/recipes-devtools/gcc/gcc-4.8/305-libmudflap-susv3-legacy.patch
> delete mode 100644 =
meta/recipes-devtools/gcc/gcc-4.8/306-libstdc++-namespace.patch
> delete mode 100644 meta/recipes-devtools/gcc/gcc-4.8/64bithack.patch
> delete mode 100644 =
meta/recipes-devtools/gcc/gcc-4.8/740-sh-pr24836.patch
> delete mode 100644 =
meta/recipes-devtools/gcc/gcc-4.8/800-arm-bigendian.patch
> delete mode 100644 =
meta/recipes-devtools/gcc/gcc-4.8/COLLECT_GCC_OPTIONS.patch
> delete mode 100644 =
meta/recipes-devtools/gcc/gcc-4.8/GLIBC_DYNAMIC_LINKER.patch
> delete mode 100644 =
meta/recipes-devtools/gcc/gcc-4.8/cpp-honor-sysroot.patch
> delete mode 100644 =
meta/recipes-devtools/gcc/gcc-4.8/disable_relax_pic_calls_flag.patch
> delete mode 100644 meta/recipes-devtools/gcc/gcc-4.8/disablesdt.patch
> delete mode 100644 =
meta/recipes-devtools/gcc/gcc-4.8/fortran-cross-compile-hack.patch
> delete mode 100644 =
meta/recipes-devtools/gcc/gcc-4.8/gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
> delete mode 100644 =
meta/recipes-devtools/gcc/gcc-4.8/gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patc=
h
> delete mode 100644 =
meta/recipes-devtools/gcc/gcc-4.8/gcc-argument-list-too-long.patch
> delete mode 100644 =
meta/recipes-devtools/gcc/gcc-4.8/gcc-armv4-pass-fix-v4bx-to-ld.patch
> delete mode 100644 =
meta/recipes-devtools/gcc/gcc-4.8/gcc-poison-dir-extend.patch
> delete mode 100644 =
meta/recipes-devtools/gcc/gcc-4.8/gcc-poison-system-directories.patch
> delete mode 100644 =
meta/recipes-devtools/gcc/gcc-4.8/gcc-uclibc-locale-ctype_touplow_t.patch
> delete mode 100644 =
meta/recipes-devtools/gcc/gcc-4.8/libgcc-sjlj-check.patch
> delete mode 100644 meta/recipes-devtools/gcc/gcc-4.8/libtool.patch
> delete mode 100644 =
meta/recipes-devtools/gcc/gcc-4.8/mips64-default-n64.patch
> delete mode 100644 =
meta/recipes-devtools/gcc/gcc-4.8/optional_libstdc.patch
> delete mode 100644 meta/recipes-devtools/gcc/gcc-4.8/pr32219.patch
> delete mode 100644 =
meta/recipes-devtools/gcc/gcc-4.8/use-defaults.h-and-t-oe-in-B.patch
> delete mode 100644 =
meta/recipes-devtools/gcc/gcc-4.8/use-ml-conf-files-from-B.patch
> delete mode 100644 =
meta/recipes-devtools/gcc/gcc-4.8/wcast-qual-PR55383.patch
>=20
> diff --git a/meta/recipes-devtools/gcc/gcc-4.8.inc =
b/meta/recipes-devtools/gcc/gcc-4.8.inc
> index 25b5f2c..87af783 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.8.inc
> +++ b/meta/recipes-devtools/gcc/gcc-4.8.inc
> @@ -30,41 +30,41 @@ LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6552 \
> 		   =
file://COPYING.RUNTIME;md5=3Dfe60d87048567d4fe8c8a0ed2448bcc8"
>=20
> SRC_URI =3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
> -	   file://gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
> -	   file://100-uclibc-conf.patch \
> -           file://gcc-uclibc-locale-ctype_touplow_t.patch \
> -           file://200-uclibc-locale.patch  \
> -           file://203-uclibc-locale-no__x.patch; \
> -           file://204-uclibc-locale-wchar_fix.patch; \
> -           file://205-uclibc-locale-update.patch; \
> -           file://301-missing-execinfo_h.patch  \
> -           file://302-c99-snprintf.patch  \
> -           file://303-c99-complex-ugly-hack.patch  \
> -           file://304-index_macro.patch  \
> -           file://305-libmudflap-susv3-legacy.patch  \
> -           file://306-libstdc++-namespace.patch  \
> -           file://740-sh-pr24836.patch  \
> -           file://800-arm-bigendian.patch  \
> -           file://gcc-poison-system-directories.patch \
> -           file://gcc-poison-dir-extend.patch \
> -           file://gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch \
> -	   file://64bithack.patch \
> -	   file://optional_libstdc.patch \
> -	   file://disable_relax_pic_calls_flag.patch \
> -	   file://COLLECT_GCC_OPTIONS.patch \
> -           file://use-defaults.h-and-t-oe-in-B.patch \
> -	   file://pr32219.patch \
> -	   file://fortran-cross-compile-hack.patch \
> -	   file://libgcc-sjlj-check.patch \
> -	   file://cpp-honor-sysroot.patch \
> -	   file://mips64-default-n64.patch \
> -	   file://GLIBC_DYNAMIC_LINKER.patch \
> -	   file://gcc-argument-list-too-long.patch \
> -	   file://disablesdt.patch \
> -	   file://libtool.patch \
> -	   file://gcc-armv4-pass-fix-v4bx-to-ld.patch \
> -	   file://use-ml-conf-files-from-B.patch \
> -	   file://wcast-qual-PR55383.patch \
> +	   file://0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
> +	   file://0002-uclibc-conf.patch \
> +	   file://0003-gcc-uclibc-locale-ctype_touplow_t.patch \
> +	   file://0004-uclibc-locale.patch \
> +	   file://0005-uclibc-locale-no__x.patch \
> +	   file://0006-uclibc-locale-wchar_fix.patch \
> +	   file://0007-uclibc-locale-update.patch \
> +	   file://0008-missing-execinfo_h.patch \
> +	   file://0009-c99-snprintf.patch \
> +	   file://0010-c99-complex-ugly-hack.patch \
> +	   file://0011-index_macro.patch \
> +	   file://0012-libmudflap-susv3-legacy.patch \
> +	   file://0013-libstdc-namespace.patch \
> +	   file://0014-sh-pr24836.patch \
> +	   =
file://0015-arm-Use-TARGET_ENDIAN_OPTION-for-determining-MULTILI.patch \
> +	   file://0016-gcc-poison-system-directories.patch \
> +	   file://0017-gcc-poison-dir-extend.patch \
> +	   file://0018-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch \
> +	   file://0019-64-bit-multilib-hack.patch \
> +	   file://0020-optional-libstdc.patch \
> +	   file://0021-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch \
> +	   file://0022-COLLECT_GCC_OPTIONS.patch \
> +	   =
file://0023-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch \
> +	   file://0024-PR-target-32219.patch \
> +	   file://0025-fortran-cross-compile-hack.patch \
> +	   file://0026-libgcc-sjlj-check.patch \
> +	   file://0027-cpp-honor-sysroot.patch \
> +	   file://0028-MIPS64-Default-to-N64-ABI.patch \
> +	   =
file://0029-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch \
> +	   file://0030-gcc-Fix-argument-list-too-long-error.patch \
> +	   file://0031-Disable-sdt.patch \
> +	   file://0032-libtool.patch \
> +	   =
file://0033-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch \
> +	   =
file://0034-Use-the-multilib-config-files-from-B-instead-of-usin.patch \
> +	   file://0035-wcast-qual-PR-55383.patch \
> 	  "
> SRC_URI[md5sum] =3D "e6040024eb9e761c3bea348d1fa5abb0"
> SRC_URI[sha256sum] =3D =
"b037fe5132b71ecad2ea7141ec92292b5d32427bf90fd90cde432b1d5abacc2c"
> diff --git =
a/meta/recipes-devtools/gcc/gcc-4.8/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.p=
atch =
b/meta/recipes-devtools/gcc/gcc-4.8/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.p=
atch
> new file mode 100644
> index 0000000..8698a1c
> --- /dev/null
> +++ =
b/meta/recipes-devtools/gcc/gcc-4.8/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.p=
atch
> @@ -0,0 +1,42 @@
> +=46rom bf3d96ae58fa180b8b468d25dc2e0209daca2751 Mon Sep 17 00:00:00 =
2001
> +From: Elvis Dowson <elvis.dowson@gmail.com>
> +Date: Fri, 29 Mar 2013 08:37:11 +0400
> +Subject: [PATCH 01/35] gcc-4.3.1: ARCH_FLAGS_FOR_TARGET
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Upstream-Status: Inappropriate [embedded specific]
> +---
> + configure    |    2 +-
> + configure.ac |    2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/configure b/configure
> +index d809535..1b76c90 100755
> +--- a/configure
> ++++ b/configure
> +@@ -7439,7 +7439,7 @@ fi
> + # for target_alias and gcc doesn't manage it consistently.
> + target_configargs=3D"--cache-file=3D./config.cache =
${target_configargs}"
> +=20
> +-FLAGS_FOR_TARGET=3D
> ++FLAGS_FOR_TARGET=3D"$ARCH_FLAGS_FOR_TARGET"
> + case " $target_configdirs " in
> +  *" newlib "*)
> +   case " $target_configargs " in
> +diff --git a/configure.ac b/configure.ac
> +index 48ec1aa..89d1d3f 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -2873,7 +2873,7 @@ fi
> + # for target_alias and gcc doesn't manage it consistently.
> + target_configargs=3D"--cache-file=3D./config.cache =
${target_configargs}"
> +=20
> +-FLAGS_FOR_TARGET=3D
> ++FLAGS_FOR_TARGET=3D"$ARCH_FLAGS_FOR_TARGET"
> + case " $target_configdirs " in
> +  *" newlib "*)
> +   case " $target_configargs " in
> +--=20
> +1.7.10.4
> +
> diff --git a/meta/recipes-devtools/gcc/gcc-4.8/0002-uclibc-conf.patch =
b/meta/recipes-devtools/gcc/gcc-4.8/0002-uclibc-conf.patch
> new file mode 100644
> index 0000000..87c242e
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-4.8/0002-uclibc-conf.patch
> @@ -0,0 +1,53 @@
> +=46rom d030973c872c00d916921d84deee0af2c0d38081 Mon Sep 17 00:00:00 =
2001
> +From: Elvis Dowson <elvis.dowson@gmail.com>
> +Date: Fri, 29 Mar 2013 08:38:25 +0400
> +Subject: [PATCH 02/35] uclibc-conf
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Upstream-Status: Pending
> +---
> + contrib/regression/objs-gcc.sh |    4 ++++
> + libjava/classpath/ltconfig     |    4 ++--
> + 2 files changed, 6 insertions(+), 2 deletions(-)
> +
> +diff --git a/contrib/regression/objs-gcc.sh =
b/contrib/regression/objs-gcc.sh
> +index 60b0497..6dc7ead 100755
> +--- a/contrib/regression/objs-gcc.sh
> ++++ b/contrib/regression/objs-gcc.sh
> +@@ -106,6 +106,10 @@ if [ $H_REAL_TARGET =3D $H_REAL_HOST -a =
$H_REAL_TARGET =3D i686-pc-linux-gnu ]
> +  then
> +   make all-gdb all-dejagnu all-ld || exit 1
> +   make install-gdb install-dejagnu install-ld || exit 1
> ++elif [ $H_REAL_TARGET =3D $H_REAL_HOST -a $H_REAL_TARGET =3D =
i686-pc-linux-uclibc ]
> ++ then
> ++  make all-gdb all-dejagnu all-ld || exit 1
> ++  make install-gdb install-dejagnu install-ld || exit 1
> + elif [ $H_REAL_TARGET =3D $H_REAL_HOST ] ; then
> +   make bootstrap || exit 1
> +   make install || exit 1
> +diff --git a/libjava/classpath/ltconfig b/libjava/classpath/ltconfig
> +index 743d951..ae4ea60 100755
> +--- a/libjava/classpath/ltconfig
> ++++ b/libjava/classpath/ltconfig
> +@@ -603,7 +603,7 @@ host_os=3D`echo $host | sed =
's/^\([^-]*\)-\([^-]*\)-\(.*\)$/\3/'`
> +=20
> + # Transform linux* to *-*-linux-gnu*, to support old configure =
scripts.
> + case $host_os in
> +-linux-gnu*) ;;
> ++linux-gnu*|linux-uclibc*) ;;
> + linux*) host=3D`echo $host | sed =
's/^\(.*-.*-linux\)\(.*\)$/\1-gnu\2/'`
> + esac
> +=20
> +@@ -1247,7 +1247,7 @@ linux-gnuoldld* | linux-gnuaout* | =
linux-gnucoff*)
> +   ;;
> +=20
> + # This must be Linux ELF.
> +-linux-gnu*)
> ++linux*)
> +   version_type=3Dlinux
> +   need_lib_prefix=3Dno
> +   need_version=3Dno
> +--=20
> +1.7.10.4
> +
> diff --git =
a/meta/recipes-devtools/gcc/gcc-4.8/0003-gcc-uclibc-locale-ctype_touplow_t=
.patch =
b/meta/recipes-devtools/gcc/gcc-4.8/0003-gcc-uclibc-locale-ctype_touplow_t=
.patch
> new file mode 100644
> index 0000000..1aa94ca
> --- /dev/null
> +++ =
b/meta/recipes-devtools/gcc/gcc-4.8/0003-gcc-uclibc-locale-ctype_touplow_t=
.patch
> @@ -0,0 +1,87 @@
> +=46rom d2d9dd756c4356d14dd7ae003856344cb4f37985 Mon Sep 17 00:00:00 =
2001
> +From: Elvis Dowson <elvis.dowson@gmail.com>
> +Date: Fri, 29 Mar 2013 08:40:12 +0400
> +Subject: [PATCH 03/35] gcc-uclibc-locale-ctype_touplow_t
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Upstream-Status: Pending
> +---
> + libstdc++-v3/config/locale/generic/c_locale.cc |    5 +++++
> + libstdc++-v3/config/locale/generic/c_locale.h  |    9 +++++++++
> + libstdc++-v3/config/os/gnu-linux/ctype_base.h  |    9 +++++++++
> + 3 files changed, 23 insertions(+)
> +
> +diff --git a/libstdc++-v3/config/locale/generic/c_locale.cc =
b/libstdc++-v3/config/locale/generic/c_locale.cc
> +index 0d309a5..f2f1e1f 100644
> +--- a/libstdc++-v3/config/locale/generic/c_locale.cc
> ++++ b/libstdc++-v3/config/locale/generic/c_locale.cc
> +@@ -263,5 +263,10 @@ _GLIBCXX_END_NAMESPACE_VERSION
> + #ifdef _GLIBCXX_LONG_DOUBLE_COMPAT
> + #define _GLIBCXX_LDBL_COMPAT(dbl, ldbl) \
> +   extern "C" void ldbl (void) __attribute__ ((alias (#dbl)))
> ++#ifdef __UCLIBC__
> ++// This is because __c_locale is of type __ctype_touplow_t* which is =
short on uclibc. for glibc its int*
> =
++_GLIBCXX_LDBL_COMPAT(_ZSt14__convert_to_vIdEvPKcRT_RSt12_Ios_IostateRKPs=
, _ZSt14__convert_to_vIeEvPKcRT_RSt12_Ios_IostateRKPs);
> ++#else
> + =
_GLIBCXX_LDBL_COMPAT(_ZSt14__convert_to_vIdEvPKcRT_RSt12_Ios_IostateRKPi, =
_ZSt14__convert_to_vIeEvPKcRT_RSt12_Ios_IostateRKPi);
> ++#endif
> + #endif // _GLIBCXX_LONG_DOUBLE_COMPAT
> +diff --git a/libstdc++-v3/config/locale/generic/c_locale.h =
b/libstdc++-v3/config/locale/generic/c_locale.h
> +index b5fd989..3da9a5d 100644
> +--- a/libstdc++-v3/config/locale/generic/c_locale.h
> ++++ b/libstdc++-v3/config/locale/generic/c_locale.h
> +@@ -40,13 +40,22 @@
> +=20
> + #include <clocale>
> +=20
> ++#ifdef __UCLIBC__
> ++#include <features.h>
> ++#include <ctype.h>
> ++#endif
> ++
> + #define _GLIBCXX_NUM_CATEGORIES 0
> +=20
> + namespace std _GLIBCXX_VISIBILITY(default)
> + {
> + _GLIBCXX_BEGIN_NAMESPACE_VERSION
> +=20
> ++#ifdef __UCLIBC__
> ++  typedef __ctype_touplow_t*	__c_locale;
> ++#else
> +   typedef int*			__c_locale;
> ++#endif
> +=20
> +   // Convert numeric value of type double and long double to string =
and
> +   // return length of string.  If vsnprintf is available use it, =
otherwise
> +diff --git a/libstdc++-v3/config/os/gnu-linux/ctype_base.h =
b/libstdc++-v3/config/os/gnu-linux/ctype_base.h
> +index 2d8e978..14eb08f 100644
> +--- a/libstdc++-v3/config/os/gnu-linux/ctype_base.h
> ++++ b/libstdc++-v3/config/os/gnu-linux/ctype_base.h
> +@@ -33,6 +33,11 @@
> +=20
> + // Information as gleaned from /usr/include/ctype.h
> +=20
> ++#ifdef __UCLIBC__
> ++#include <features.h>
> ++#include <ctype.h>
> ++#endif
> ++
> + namespace std _GLIBCXX_VISIBILITY(default)
> + {
> + _GLIBCXX_BEGIN_NAMESPACE_VERSION
> +@@ -41,7 +46,11 @@ _GLIBCXX_BEGIN_NAMESPACE_VERSION
> +   struct ctype_base
> +   {
> +     // Non-standard typedefs.
> ++#ifdef __UCLIBC__
> ++    typedef const __ctype_touplow_t*	__to_type;
> ++#else
> +     typedef const int* 		__to_type;
> ++#endif
> +=20
> +     // NB: Offsets into ctype<char>::_M_table force a particular =
size
> +     // on the mask type. Because of this, we don't use an enum.
> +--=20
> +1.7.10.4
> +
> diff --git =
a/meta/recipes-devtools/gcc/gcc-4.8/0004-uclibc-locale.patch =
b/meta/recipes-devtools/gcc/gcc-4.8/0004-uclibc-locale.patch
> new file mode 100644
> index 0000000..34cc164
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-4.8/0004-uclibc-locale.patch
> @@ -0,0 +1,2862 @@
> +=46rom a55c751a449c2cbf0b3fcc07aab1b86bf9661510 Mon Sep 17 00:00:00 =
2001
> +From: Elvis Dowson <elvis.dowson@gmail.com>
> +Date: Fri, 29 Mar 2013 08:41:39 +0400
> +Subject: [PATCH 04/35] uclibc-locale
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Upstream-Status: Pending
> +---
> + libstdc++-v3/acinclude.m4                          |   37 ++
> + .../config/locale/uclibc/c++locale_internal.h      |   63 ++
> + libstdc++-v3/config/locale/uclibc/c_locale.cc      |  160 +++++
> + libstdc++-v3/config/locale/uclibc/c_locale.h       |  117 ++++
> + .../config/locale/uclibc/codecvt_members.cc        |  308 +++++++++
> + .../config/locale/uclibc/collate_members.cc        |   80 +++
> + libstdc++-v3/config/locale/uclibc/ctype_members.cc |  300 +++++++++
> + .../config/locale/uclibc/messages_members.cc       |  100 +++
> + .../config/locale/uclibc/messages_members.h        |  118 ++++
> + .../config/locale/uclibc/monetary_members.cc       |  692 =
++++++++++++++++++++
> + .../config/locale/uclibc/numeric_members.cc        |  160 +++++
> + libstdc++-v3/config/locale/uclibc/time_members.cc  |  406 =
++++++++++++
> + libstdc++-v3/config/locale/uclibc/time_members.h   |   68 ++
> + libstdc++-v3/configure                             |   75 +++
> + libstdc++-v3/include/c_compatibility/wchar.h       |    2 +
> + libstdc++-v3/include/c_std/cwchar                  |    2 +
> + 16 files changed, 2688 insertions(+)
> + create mode 100644 =
libstdc++-v3/config/locale/uclibc/c++locale_internal.h
> + create mode 100644 libstdc++-v3/config/locale/uclibc/c_locale.cc
> + create mode 100644 libstdc++-v3/config/locale/uclibc/c_locale.h
> + create mode 100644 =
libstdc++-v3/config/locale/uclibc/codecvt_members.cc
> + create mode 100644 =
libstdc++-v3/config/locale/uclibc/collate_members.cc
> + create mode 100644 =
libstdc++-v3/config/locale/uclibc/ctype_members.cc
> + create mode 100644 =
libstdc++-v3/config/locale/uclibc/messages_members.cc
> + create mode 100644 =
libstdc++-v3/config/locale/uclibc/messages_members.h
> + create mode 100644 =
libstdc++-v3/config/locale/uclibc/monetary_members.cc
> + create mode 100644 =
libstdc++-v3/config/locale/uclibc/numeric_members.cc
> + create mode 100644 libstdc++-v3/config/locale/uclibc/time_members.cc
> + create mode 100644 libstdc++-v3/config/locale/uclibc/time_members.h
> +
> +diff --git a/libstdc++-v3/acinclude.m4 b/libstdc++-v3/acinclude.m4
> +index 0871a6a..326d7ef 100644
> +--- a/libstdc++-v3/acinclude.m4
> ++++ b/libstdc++-v3/acinclude.m4
> +@@ -1905,6 +1905,9 @@ AC_DEFUN([GLIBCXX_ENABLE_CLOCALE], [
> +   # Default to "generic".
> +   if test $enable_clocale_flag =3D auto; then
> +     case ${target_os} in
> ++      *-uclibc*)
> ++        enable_clocale_flag=3Duclibc
> ++        ;;
> +       linux* | gnu* | kfreebsd*-gnu | knetbsd*-gnu)
> + 	enable_clocale_flag=3Dgnu
> + 	;;
> +@@ -2069,6 +2072,40 @@ AC_DEFUN([GLIBCXX_ENABLE_CLOCALE], [
> +       CTIME_CC=3Dconfig/locale/generic/time_members.cc
> +       CLOCALE_INTERNAL_H=3Dconfig/locale/generic/c++locale_internal.h
> +       ;;
> ++    uclibc)
> ++      AC_MSG_RESULT(uclibc)
> ++
> ++      # Declare intention to use gettext, and add support for =
specific
> ++      # languages.
> ++      # For some reason, ALL_LINGUAS has to be before AM-GNU-GETTEXT
> ++      ALL_LINGUAS=3D"de fr"
> ++
> ++      # Don't call AM-GNU-GETTEXT here. Instead, assume glibc.
> ++      AC_CHECK_PROG(check_msgfmt, msgfmt, yes, no)
> ++      if test x"$check_msgfmt" =3D x"yes" && test x"$enable_nls" =3D =
x"yes"; then
> ++        USE_NLS=3Dyes
> ++      fi
> ++      # Export the build objects.
> ++      for ling in $ALL_LINGUAS; do \
> ++        glibcxx_MOFILES=3D"$glibcxx_MOFILES $ling.mo"; \
> ++        glibcxx_POFILES=3D"$glibcxx_POFILES $ling.po"; \
> ++      done
> ++      AC_SUBST(glibcxx_MOFILES)
> ++      AC_SUBST(glibcxx_POFILES)
> ++
> ++      CLOCALE_H=3Dconfig/locale/uclibc/c_locale.h
> ++      CLOCALE_CC=3Dconfig/locale/uclibc/c_locale.cc
> ++      CCODECVT_CC=3Dconfig/locale/uclibc/codecvt_members.cc
> ++      CCOLLATE_CC=3Dconfig/locale/uclibc/collate_members.cc
> ++      CCTYPE_CC=3Dconfig/locale/uclibc/ctype_members.cc
> ++      CMESSAGES_H=3Dconfig/locale/uclibc/messages_members.h
> ++      CMESSAGES_CC=3Dconfig/locale/uclibc/messages_members.cc
> ++      CMONEY_CC=3Dconfig/locale/uclibc/monetary_members.cc
> ++      CNUMERIC_CC=3Dconfig/locale/uclibc/numeric_members.cc
> ++      CTIME_H=3Dconfig/locale/uclibc/time_members.h
> ++      CTIME_CC=3Dconfig/locale/uclibc/time_members.cc
> ++      CLOCALE_INTERNAL_H=3Dconfig/locale/uclibc/c++locale_internal.h
> ++      ;;
> +   esac
> +=20
> +   # This is where the testsuite looks for locale catalogs, using the
> +diff --git a/libstdc++-v3/config/locale/uclibc/c++locale_internal.h =
b/libstdc++-v3/config/locale/uclibc/c++locale_internal.h
> +new file mode 100644
> +index 0000000..2ae3e4a
> +--- /dev/null
> ++++ b/libstdc++-v3/config/locale/uclibc/c++locale_internal.h
> +@@ -0,0 +1,63 @@
> ++// Prototypes for GLIBC thread locale __-prefixed functions -*- C++ =
-*-
> ++
> ++// Copyright (C) 2002, 2004, 2005 Free Software Foundation, Inc.
> ++//
> ++// This file is part of the GNU ISO C++ Library.  This library is =
free
> ++// software; you can redistribute it and/or modify it under the
> ++// terms of the GNU General Public License as published by the
> ++// Free Software Foundation; either version 2, or (at your option)
> ++// any later version.
> ++
> ++// This library is distributed in the hope that it will be useful,
> ++// but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> ++// GNU General Public License for more details.
> ++
> ++// You should have received a copy of the GNU General Public License =
along
> ++// with this library; see the file COPYING.  If not, write to the =
Free
> ++// Software Foundation, 59 Temple Place - Suite 330, Boston, MA =
02111-1307,
> ++// USA.
> ++
> ++// As a special exception, you may use this file as part of a free =
software
> ++// library without restriction.  Specifically, if other files =
instantiate
> ++// templates or use macros or inline functions from this file, or =
you compile
> ++// this file and link it with other files to produce an executable, =
this
> ++// file does not by itself cause the resulting executable to be =
covered by
> ++// the GNU General Public License.  This exception does not however
> ++// invalidate any other reasons why the executable file might be =
covered by
> ++// the GNU General Public License.
> ++
> ++// Written by Jakub Jelinek <jakub@redhat.com>
> ++
> ++#include <bits/c++config.h>
> ++#include <clocale>
> ++
> ++#ifdef __UCLIBC_MJN3_ONLY__
> ++#warning clean this up
> ++#endif
> ++
> ++#ifdef __UCLIBC_HAS_XLOCALE__
> ++
> ++extern "C" __typeof(nl_langinfo_l) __nl_langinfo_l;
> ++extern "C" __typeof(strcoll_l) __strcoll_l;
> ++extern "C" __typeof(strftime_l) __strftime_l;
> ++extern "C" __typeof(strtod_l) __strtod_l;
> ++extern "C" __typeof(strtof_l) __strtof_l;
> ++extern "C" __typeof(strtold_l) __strtold_l;
> ++extern "C" __typeof(strxfrm_l) __strxfrm_l;
> ++extern "C" __typeof(newlocale) __newlocale;
> ++extern "C" __typeof(freelocale) __freelocale;
> ++extern "C" __typeof(duplocale) __duplocale;
> ++extern "C" __typeof(uselocale) __uselocale;
> ++
> ++#ifdef _GLIBCXX_USE_WCHAR_T
> ++extern "C" __typeof(iswctype_l) __iswctype_l;
> ++extern "C" __typeof(towlower_l) __towlower_l;
> ++extern "C" __typeof(towupper_l) __towupper_l;
> ++extern "C" __typeof(wcscoll_l) __wcscoll_l;
> ++extern "C" __typeof(wcsftime_l) __wcsftime_l;
> ++extern "C" __typeof(wcsxfrm_l) __wcsxfrm_l;
> ++extern "C" __typeof(wctype_l) __wctype_l;
> ++#endif
> ++
> ++#endif // GLIBC 2.3 and later
> +diff --git a/libstdc++-v3/config/locale/uclibc/c_locale.cc =
b/libstdc++-v3/config/locale/uclibc/c_locale.cc
> +new file mode 100644
> +index 0000000..5081dc1
> +--- /dev/null
> ++++ b/libstdc++-v3/config/locale/uclibc/c_locale.cc
> +@@ -0,0 +1,160 @@
> ++// Wrapper for underlying C-language localization -*- C++ -*-
> ++
> ++// Copyright (C) 2001, 2002, 2003 Free Software Foundation, Inc.
> ++//
> ++// This file is part of the GNU ISO C++ Library.  This library is =
free
> ++// software; you can redistribute it and/or modify it under the
> ++// terms of the GNU General Public License as published by the
> ++// Free Software Foundation; either version 2, or (at your option)
> ++// any later version.
> ++
> ++// This library is distributed in the hope that it will be useful,
> ++// but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> ++// GNU General Public License for more details.
> ++
> ++// You should have received a copy of the GNU General Public License =
along
> ++// with this library; see the file COPYING.  If not, write to the =
Free
> ++// Software Foundation, 59 Temple Place - Suite 330, Boston, MA =
02111-1307,
> ++// USA.
> ++
> ++// As a special exception, you may use this file as part of a free =
software
> ++// library without restriction.  Specifically, if other files =
instantiate
> ++// templates or use macros or inline functions from this file, or =
you compile
> ++// this file and link it with other files to produce an executable, =
this
> ++// file does not by itself cause the resulting executable to be =
covered by
> ++// the GNU General Public License.  This exception does not however
> ++// invalidate any other reasons why the executable file might be =
covered by
> ++// the GNU General Public License.
> ++
> ++//
> ++// ISO C++ 14882: 22.8  Standard locale categories.
> ++//
> ++
> ++// Written by Benjamin Kosnik <bkoz@redhat.com>
> ++
> ++#include <cerrno>  // For errno
> ++#include <locale>
> ++#include <stdexcept>
> ++#include <langinfo.h>
> ++#include <bits/c++locale_internal.h>
> ++
> ++#ifndef __UCLIBC_HAS_XLOCALE__
> ++#define __strtol_l(S, E, B, L)      strtol((S), (E), (B))
> ++#define __strtoul_l(S, E, B, L)     strtoul((S), (E), (B))
> ++#define __strtoll_l(S, E, B, L)     strtoll((S), (E), (B))
> ++#define __strtoull_l(S, E, B, L)    strtoull((S), (E), (B))
> ++#define __strtof_l(S, E, L)         strtof((S), (E))
> ++#define __strtod_l(S, E, L)         strtod((S), (E))
> ++#define __strtold_l(S, E, L)        strtold((S), (E))
> ++#warning should dummy __newlocale check for C|POSIX ?
> ++#define __newlocale(a, b, c)        NULL
> ++#define __freelocale(a)             ((void)0)
> ++#define __duplocale(a)              __c_locale()
> ++#endif
> ++
> ++namespace std
> ++{
> ++  template<>
> ++    void
> ++    __convert_to_v(const char* __s, float& __v, ios_base::iostate& =
__err,
> ++		   const __c_locale& __cloc)
> ++    {
> ++      if (!(__err & ios_base::failbit))
> ++	{
> ++	  char* __sanity;
> ++	  errno =3D 0;
> ++	  float __f =3D __strtof_l(__s, &__sanity, __cloc);
> ++          if (__sanity !=3D __s && errno !=3D ERANGE)
> ++	    __v =3D __f;
> ++	  else
> ++	    __err |=3D ios_base::failbit;
> ++	}
> ++    }
> ++
> ++  template<>
> ++    void
> ++    __convert_to_v(const char* __s, double& __v, ios_base::iostate& =
__err,
> ++		   const __c_locale& __cloc)
> ++    {
> ++      if (!(__err & ios_base::failbit))
> ++	{
> ++	  char* __sanity;
> ++	  errno =3D 0;
> ++	  double __d =3D __strtod_l(__s, &__sanity, __cloc);
> ++          if (__sanity !=3D __s && errno !=3D ERANGE)
> ++	    __v =3D __d;
> ++	  else
> ++	    __err |=3D ios_base::failbit;
> ++	}
> ++    }
> ++
> ++  template<>
> ++    void
> ++    __convert_to_v(const char* __s, long double& __v, =
ios_base::iostate& __err,
> ++		   const __c_locale& __cloc)
> ++    {
> ++      if (!(__err & ios_base::failbit))
> ++	{
> ++	  char* __sanity;
> ++	  errno =3D 0;
> ++	  long double __ld =3D __strtold_l(__s, &__sanity, __cloc);
> ++          if (__sanity !=3D __s && errno !=3D ERANGE)
> ++	    __v =3D __ld;
> ++	  else
> ++	    __err |=3D ios_base::failbit;
> ++	}
> ++    }
> ++
> ++  void
> ++  locale::facet::_S_create_c_locale(__c_locale& __cloc, const char* =
__s,
> ++				    __c_locale __old)
> ++  {
> ++    __cloc =3D __newlocale(1 << LC_ALL, __s, __old);
> ++#ifdef __UCLIBC_HAS_XLOCALE__
> ++    if (!__cloc)
> ++      {
> ++	// This named locale is not supported by the underlying OS.
> ++	__throw_runtime_error(__N("locale::facet::_S_create_c_locale "
> ++			      "name not valid"));
> ++      }
> ++#endif
> ++  }
> ++
> ++  void
> ++  locale::facet::_S_destroy_c_locale(__c_locale& __cloc)
> ++  {
> ++    if (_S_get_c_locale() !=3D __cloc)
> ++      __freelocale(__cloc);
> ++  }
> ++
> ++  __c_locale
> ++  locale::facet::_S_clone_c_locale(__c_locale& __cloc)
> ++  { return __duplocale(__cloc); }
> ++} // namespace std
> ++
> ++namespace __gnu_cxx
> ++{
> ++  const char* const category_names[6 + _GLIBCXX_NUM_CATEGORIES] =3D
> ++    {
> ++      "LC_CTYPE",
> ++      "LC_NUMERIC",
> ++      "LC_TIME",
> ++      "LC_COLLATE",
> ++      "LC_MONETARY",
> ++      "LC_MESSAGES",
> ++#if _GLIBCXX_NUM_CATEGORIES !=3D 0
> ++      "LC_PAPER",
> ++      "LC_NAME",
> ++      "LC_ADDRESS",
> ++      "LC_TELEPHONE",
> ++      "LC_MEASUREMENT",
> ++      "LC_IDENTIFICATION"
> ++#endif
> ++    };
> ++}
> ++
> ++namespace std
> ++{
> ++  const char* const* const locale::_S_categories =3D =
__gnu_cxx::category_names;
> ++}  // namespace std
> +diff --git a/libstdc++-v3/config/locale/uclibc/c_locale.h =
b/libstdc++-v3/config/locale/uclibc/c_locale.h
> +new file mode 100644
> +index 0000000..da07c1f
> +--- /dev/null
> ++++ b/libstdc++-v3/config/locale/uclibc/c_locale.h
> +@@ -0,0 +1,117 @@
> ++// Wrapper for underlying C-language localization -*- C++ -*-
> ++
> ++// Copyright (C) 2001, 2002, 2003, 2004, 2005 Free Software =
Foundation, Inc.
> ++//
> ++// This file is part of the GNU ISO C++ Library.  This library is =
free
> ++// software; you can redistribute it and/or modify it under the
> ++// terms of the GNU General Public License as published by the
> ++// Free Software Foundation; either version 2, or (at your option)
> ++// any later version.
> ++
> ++// This library is distributed in the hope that it will be useful,
> ++// but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> ++// GNU General Public License for more details.
> ++
> ++// You should have received a copy of the GNU General Public License =
along
> ++// with this library; see the file COPYING.  If not, write to the =
Free
> ++// Software Foundation, 59 Temple Place - Suite 330, Boston, MA =
02111-1307,
> ++// USA.
> ++
> ++// As a special exception, you may use this file as part of a free =
software
> ++// library without restriction.  Specifically, if other files =
instantiate
> ++// templates or use macros or inline functions from this file, or =
you compile
> ++// this file and link it with other files to produce an executable, =
this
> ++// file does not by itself cause the resulting executable to be =
covered by
> ++// the GNU General Public License.  This exception does not however
> ++// invalidate any other reasons why the executable file might be =
covered by
> ++// the GNU General Public License.
> ++
> ++//
> ++// ISO C++ 14882: 22.8  Standard locale categories.
> ++//
> ++
> ++// Written by Benjamin Kosnik <bkoz@redhat.com>
> ++
> ++#ifndef _C_LOCALE_H
> ++#define _C_LOCALE_H 1
> ++
> ++#pragma GCC system_header
> ++
> ++#include <cstring>              // get std::strlen
> ++#include <cstdio>               // get std::snprintf or std::sprintf
> ++#include <clocale>
> ++#include <langinfo.h>		// For codecvt
> ++#ifdef __UCLIBC_MJN3_ONLY__
> ++#warning fix this
> ++#endif
> ++#ifdef __UCLIBC_HAS_LOCALE__
> ++#include <iconv.h>		// For codecvt using iconv, iconv_t
> ++#endif
> ++#ifdef __UCLIBC_HAS_GETTEXT_AWARENESS__
> ++#include <libintl.h> 		// For messages
> ++#endif
> ++
> ++#ifdef __UCLIBC_MJN3_ONLY__
> ++#warning what is _GLIBCXX_C_LOCALE_GNU for
> ++#endif
> ++#define _GLIBCXX_C_LOCALE_GNU 1
> ++
> ++#ifdef __UCLIBC_MJN3_ONLY__
> ++#warning fix categories
> ++#endif
> ++// #define _GLIBCXX_NUM_CATEGORIES 6
> ++#define _GLIBCXX_NUM_CATEGORIES 0
> ++
> ++#ifdef __UCLIBC_HAS_XLOCALE__
> ++namespace __gnu_cxx
> ++{
> ++  extern "C" __typeof(uselocale) __uselocale;
> ++}
> ++#endif
> ++
> ++namespace std
> ++{
> ++#ifdef __UCLIBC_HAS_XLOCALE__
> ++  typedef __locale_t		__c_locale;
> ++#else
> ++  typedef int*			__c_locale;
> ++#endif
> ++
> ++  // Convert numeric value of type _Tv to string and return length =
of
> ++  // string.  If snprintf is available use it, otherwise fall back =
to
> ++  // the unsafe sprintf which, in general, can be dangerous and =
should
> ++  // be avoided.
> ++  template<typename _Tv>
> ++    int
> ++    __convert_from_v(char* __out,
> ++		     const int __size __attribute__ ((__unused__)),
> ++		     const char* __fmt,
> ++#ifdef __UCLIBC_HAS_XCLOCALE__
> ++		     _Tv __v, const __c_locale& __cloc, int __prec)
> ++    {
> ++      __c_locale __old =3D __gnu_cxx::__uselocale(__cloc);
> ++#else
> ++		     _Tv __v, const __c_locale&, int __prec)
> ++    {
> ++# ifdef __UCLIBC_HAS_LOCALE__
> ++      char* __old =3D std::setlocale(LC_ALL, NULL);
> ++      char* __sav =3D new char[std::strlen(__old) + 1];
> ++      std::strcpy(__sav, __old);
> ++      std::setlocale(LC_ALL, "C");
> ++# endif
> ++#endif
> ++
> ++      const int __ret =3D std::snprintf(__out, __size, __fmt, =
__prec, __v);
> ++
> ++#ifdef __UCLIBC_HAS_XCLOCALE__
> ++      __gnu_cxx::__uselocale(__old);
> ++#elif defined __UCLIBC_HAS_LOCALE__
> ++      std::setlocale(LC_ALL, __sav);
> ++      delete [] __sav;
> ++#endif
> ++      return __ret;
> ++    }
> ++}
> ++
> ++#endif
> +diff --git a/libstdc++-v3/config/locale/uclibc/codecvt_members.cc =
b/libstdc++-v3/config/locale/uclibc/codecvt_members.cc
> +new file mode 100644
> +index 0000000..64aa962
> +--- /dev/null
> ++++ b/libstdc++-v3/config/locale/uclibc/codecvt_members.cc
> +@@ -0,0 +1,308 @@
> ++// std::codecvt implementation details, GNU version -*- C++ -*-
> ++
> ++// Copyright (C) 2002, 2003 Free Software Foundation, Inc.
> ++//
> ++// This file is part of the GNU ISO C++ Library.  This library is =
free
> ++// software; you can redistribute it and/or modify it under the
> ++// terms of the GNU General Public License as published by the
> ++// Free Software Foundation; either version 2, or (at your option)
> ++// any later version.
> ++
> ++// This library is distributed in the hope that it will be useful,
> ++// but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> ++// GNU General Public License for more details.
> ++
> ++// You should have received a copy of the GNU General Public License =
along
> ++// with this library; see the file COPYING.  If not, write to the =
Free
> ++// Software Foundation, 59 Temple Place - Suite 330, Boston, MA =
02111-1307,
> ++// USA.
> ++
> ++// As a special exception, you may use this file as part of a free =
software
> ++// library without restriction.  Specifically, if other files =
instantiate
> ++// templates or use macros or inline functions from this file, or =
you compile
> ++// this file and link it with other files to produce an executable, =
this
> ++// file does not by itself cause the resulting executable to be =
covered by
> ++// the GNU General Public License.  This exception does not however
> ++// invalidate any other reasons why the executable file might be =
covered by
> ++// the GNU General Public License.
> ++
> ++//
> ++// ISO C++ 14882: 22.2.1.5 - Template class codecvt
> ++//
> ++
> ++// Written by Benjamin Kosnik <bkoz@redhat.com>
> ++
> ++#include <locale>
> ++#include <cstdlib>  // For MB_CUR_MAX
> ++#include <climits>  // For MB_LEN_MAX
> ++#include <bits/c++locale_internal.h>
> ++
> ++namespace std
> ++{
> ++  // Specializations.
> ++#ifdef _GLIBCXX_USE_WCHAR_T
> ++  codecvt_base::result
> ++  codecvt<wchar_t, char, mbstate_t>::
> ++  do_out(state_type& __state, const intern_type* __from,
> ++	 const intern_type* __from_end, const intern_type*& __from_next,
> ++	 extern_type* __to, extern_type* __to_end,
> ++	 extern_type*& __to_next) const
> ++  {
> ++    result __ret =3D ok;
> ++    state_type __tmp_state(__state);
> ++
> ++#ifdef __UCLIBC_HAS_XLOCALE__
> ++    __c_locale __old =3D __uselocale(_M_c_locale_codecvt);
> ++#endif
> ++
> ++    // wcsnrtombs is *very* fast but stops if encounters NUL =
characters:
> ++    // in case we fall back to wcrtomb and then continue, in a loop.
> ++    // NB: wcsnrtombs is a GNU extension
> ++    for (__from_next =3D __from, __to_next =3D __to;
> ++	 __from_next < __from_end && __to_next < __to_end
> ++	 && __ret =3D=3D ok;)
> ++      {
> ++	const intern_type* __from_chunk_end =3D wmemchr(__from_next, =
L'\0',
> ++						      __from_end - =
__from_next);
> ++	if (!__from_chunk_end)
> ++	  __from_chunk_end =3D __from_end;
> ++
> ++	__from =3D __from_next;
> ++	const size_t __conv =3D wcsnrtombs(__to_next, &__from_next,
> ++					 __from_chunk_end - __from_next,
> ++					 __to_end - __to_next, =
&__state);
> ++	if (__conv =3D=3D static_cast<size_t>(-1))
> ++	  {
> ++	    // In case of error, in order to stop at the exact place we
> ++	    // have to start again from the beginning with a series of
> ++	    // wcrtomb.
> ++	    for (; __from < __from_next; ++__from)
> ++	      __to_next +=3D wcrtomb(__to_next, *__from, &__tmp_state);
> ++	    __state =3D __tmp_state;
> ++	    __ret =3D error;
> ++	  }
> ++	else if (__from_next && __from_next < __from_chunk_end)
> ++	  {
> ++	    __to_next +=3D __conv;
> ++	    __ret =3D partial;
> ++	  }
> ++	else
> ++	  {
> ++	    __from_next =3D __from_chunk_end;
> ++	    __to_next +=3D __conv;
> ++	  }
> ++
> ++	if (__from_next < __from_end && __ret =3D=3D ok)
> ++	  {
> ++	    extern_type __buf[MB_LEN_MAX];
> ++	    __tmp_state =3D __state;
> ++	    const size_t __conv =3D wcrtomb(__buf, *__from_next, =
&__tmp_state);
> ++	    if (__conv > static_cast<size_t>(__to_end - __to_next))
> ++	      __ret =3D partial;
> ++	    else
> ++	      {
> ++		memcpy(__to_next, __buf, __conv);
> ++		__state =3D __tmp_state;
> ++		__to_next +=3D __conv;
> ++		++__from_next;
> ++	      }
> ++	  }
> ++      }
> ++
> ++#ifdef __UCLIBC_HAS_XLOCALE__
> ++    __uselocale(__old);
> ++#endif
> ++
> ++    return __ret;
> ++  }
> ++
> ++  codecvt_base::result
> ++  codecvt<wchar_t, char, mbstate_t>::
> ++  do_in(state_type& __state, const extern_type* __from,
> ++	const extern_type* __from_end, const extern_type*& __from_next,
> ++	intern_type* __to, intern_type* __to_end,
> ++	intern_type*& __to_next) const
> ++  {
> ++    result __ret =3D ok;
> ++    state_type __tmp_state(__state);
> ++
> ++#ifdef __UCLIBC_HAS_XLOCALE__
> ++    __c_locale __old =3D __uselocale(_M_c_locale_codecvt);
> ++#endif
> ++
> ++    // mbsnrtowcs is *very* fast but stops if encounters NUL =
characters:
> ++    // in case we store a L'\0' and then continue, in a loop.
> ++    // NB: mbsnrtowcs is a GNU extension
> ++    for (__from_next =3D __from, __to_next =3D __to;
> ++	 __from_next < __from_end && __to_next < __to_end
> ++	 && __ret =3D=3D ok;)
> ++      {
> ++	const extern_type* __from_chunk_end;
> ++	__from_chunk_end =3D static_cast<const =
extern_type*>(memchr(__from_next, '\0',
> ++								  =
__from_end
> ++								  - =
__from_next));
> ++	if (!__from_chunk_end)
> ++	  __from_chunk_end =3D __from_end;
> ++
> ++	__from =3D __from_next;
> ++	size_t __conv =3D mbsnrtowcs(__to_next, &__from_next,
> ++				   __from_chunk_end - __from_next,
> ++				   __to_end - __to_next, &__state);
> ++	if (__conv =3D=3D static_cast<size_t>(-1))
> ++	  {
> ++	    // In case of error, in order to stop at the exact place we
> ++	    // have to start again from the beginning with a series of
> ++	    // mbrtowc.
> ++	    for (;; ++__to_next, __from +=3D __conv)
> ++	      {
> ++		__conv =3D mbrtowc(__to_next, __from, __from_end - =
__from,
> ++				 &__tmp_state);
> ++		if (__conv =3D=3D static_cast<size_t>(-1)
> ++		    || __conv =3D=3D static_cast<size_t>(-2))
> ++		  break;
> ++	      }
> ++	    __from_next =3D __from;
> ++	    __state =3D __tmp_state;
> ++	    __ret =3D error;
> ++	  }
> ++	else if (__from_next && __from_next < __from_chunk_end)
> ++	  {
> ++	    // It is unclear what to return in this case (see DR 382).
> ++	    __to_next +=3D __conv;
> ++	    __ret =3D partial;
> ++	  }
> ++	else
> ++	  {
> ++	    __from_next =3D __from_chunk_end;
> ++	    __to_next +=3D __conv;
> ++	  }
> ++
> ++	if (__from_next < __from_end && __ret =3D=3D ok)
> ++	  {
> ++	    if (__to_next < __to_end)
> ++	      {
> ++		// XXX Probably wrong for stateful encodings
> ++		__tmp_state =3D __state;
> ++		++__from_next;
> ++		*__to_next++ =3D L'\0';
> ++	      }
> ++	    else
> ++	      __ret =3D partial;
> ++	  }
> ++      }
> ++
> ++#ifdef __UCLIBC_HAS_XLOCALE__
> ++    __uselocale(__old);
> ++#endif
> ++
> ++    return __ret;
> ++  }
> ++
> ++  int
> ++  codecvt<wchar_t, char, mbstate_t>::
> ++  do_encoding() const throw()
> ++  {
> ++    // XXX This implementation assumes that the encoding is
> ++    // stateless and is either single-byte or variable-width.
> ++    int __ret =3D 0;
> ++#ifdef __UCLIBC_HAS_XLOCALE__
> ++    __c_locale __old =3D __uselocale(_M_c_locale_codecvt);
> ++#endif
> ++    if (MB_CUR_MAX =3D=3D 1)
> ++      __ret =3D 1;
> ++#ifdef __UCLIBC_HAS_XLOCALE__
> ++    __uselocale(__old);
> ++#endif
> ++    return __ret;
> ++  }
> ++
> ++  int
> ++  codecvt<wchar_t, char, mbstate_t>::
> ++  do_max_length() const throw()
> ++  {
> ++#ifdef __UCLIBC_HAS_XLOCALE__
> ++    __c_locale __old =3D __uselocale(_M_c_locale_codecvt);
> ++#endif
> ++    // XXX Probably wrong for stateful encodings.
> ++    int __ret =3D MB_CUR_MAX;
> ++#ifdef __UCLIBC_HAS_XLOCALE__
> ++    __uselocale(__old);
> ++#endif
> ++    return __ret;
> ++  }
> ++
> ++  int
> ++  codecvt<wchar_t, char, mbstate_t>::
> ++  do_length(state_type& __state, const extern_type* __from,
> ++	    const extern_type* __end, size_t __max) const
> ++  {
> ++    int __ret =3D 0;
> ++    state_type __tmp_state(__state);
> ++
> ++#ifdef __UCLIBC_HAS_XLOCALE__
> ++    __c_locale __old =3D __uselocale(_M_c_locale_codecvt);
> ++#endif
> ++
> ++    // mbsnrtowcs is *very* fast but stops if encounters NUL =
characters:
> ++    // in case we advance past it and then continue, in a loop.
> ++    // NB: mbsnrtowcs is a GNU extension
> ++
> ++    // A dummy internal buffer is needed in order for mbsnrtocws to =
consider
> ++    // its fourth parameter (it wouldn't with NULL as first =
parameter).
> ++    wchar_t* __to =3D =
static_cast<wchar_t*>(__builtin_alloca(sizeof(wchar_t)
> ++							   * __max));
> ++    while (__from < __end && __max)
> ++      {
> ++	const extern_type* __from_chunk_end;
> ++	__from_chunk_end =3D static_cast<const =
extern_type*>(memchr(__from, '\0',
> ++								  __end
> ++								  - =
__from));
> ++	if (!__from_chunk_end)
> ++	  __from_chunk_end =3D __end;
> ++
> ++	const extern_type* __tmp_from =3D __from;
> ++	size_t __conv =3D mbsnrtowcs(__to, &__from,
> ++				   __from_chunk_end - __from,
> ++				   __max, &__state);
> ++	if (__conv =3D=3D static_cast<size_t>(-1))
> ++	  {
> ++	    // In case of error, in order to stop at the exact place we
> ++	    // have to start again from the beginning with a series of
> ++	    // mbrtowc.
> ++	    for (__from =3D __tmp_from;; __from +=3D __conv)
> ++	      {
> ++		__conv =3D mbrtowc(NULL, __from, __end - __from,
> ++				 &__tmp_state);
> ++		if (__conv =3D=3D static_cast<size_t>(-1)
> ++		    || __conv =3D=3D static_cast<size_t>(-2))
> ++		  break;
> ++	      }
> ++	    __state =3D __tmp_state;
> ++	    __ret +=3D __from - __tmp_from;
> ++	    break;
> ++	  }
> ++	if (!__from)
> ++	  __from =3D __from_chunk_end;
> ++
> ++	__ret +=3D __from - __tmp_from;
> ++	__max -=3D __conv;
> ++
> ++	if (__from < __end && __max)
> ++	  {
> ++	    // XXX Probably wrong for stateful encodings
> ++	    __tmp_state =3D __state;
> ++	    ++__from;
> ++	    ++__ret;
> ++	    --__max;
> ++	  }
> ++      }
> ++
> ++#ifdef __UCLIBC_HAS_XLOCALE__
> ++    __uselocale(__old);
> ++#endif
> ++
> ++    return __ret;
> ++  }
> ++#endif
> ++}
> +diff --git a/libstdc++-v3/config/locale/uclibc/collate_members.cc =
b/libstdc++-v3/config/locale/uclibc/collate_members.cc
> +new file mode 100644
> +index 0000000..c2664a7
> +--- /dev/null
> ++++ b/libstdc++-v3/config/locale/uclibc/collate_members.cc
> +@@ -0,0 +1,80 @@
> ++// std::collate implementation details, GNU version -*- C++ -*-
> ++
> ++// Copyright (C) 2001, 2002 Free Software Foundation, Inc.
> ++//
> ++// This file is part of the GNU ISO C++ Library.  This library is =
free
> ++// software; you can redistribute it and/or modify it under the
> ++// terms of the GNU General Public License as published by the
> ++// Free Software Foundation; either version 2, or (at your option)
> ++// any later version.
> ++
> ++// This library is distributed in the hope that it will be useful,
> ++// but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> ++// GNU General Public License for more details.
> ++
> ++// You should have received a copy of the GNU General Public License =
along
> ++// with this library; see the file COPYING.  If not, write to the =
Free
> ++// Software Foundation, 59 Temple Place - Suite 330, Boston, MA =
02111-1307,
> ++// USA.
> ++
> ++// As a special exception, you may use this file as part of a free =
software
> ++// library without restriction.  Specifically, if other files =
instantiate
> ++// templates or use macros or inline functions from this file, or =
you compile
> ++// this file and link it with other files to produce an executable, =
this
> ++// file does not by itself cause the resulting executable to be =
covered by
> ++// the GNU General Public License.  This exception does not however
> ++// invalidate any other reasons why the executable file might be =
covered by
> ++// the GNU General Public License.
> ++
> ++//
> ++// ISO C++ 14882: 22.2.4.1.2  collate virtual functions
> ++//
> ++
> ++// Written by Benjamin Kosnik <bkoz@redhat.com>
> ++
> ++#include <locale>
> ++#include <bits/c++locale_internal.h>
> ++
> ++#ifndef __UCLIBC_HAS_XLOCALE__
> ++#define __strcoll_l(S1, S2, L)      strcoll((S1), (S2))
> ++#define __strxfrm_l(S1, S2, N, L)   strxfrm((S1), (S2), (N))
> ++#define __wcscoll_l(S1, S2, L)      wcscoll((S1), (S2))
> ++#define __wcsxfrm_l(S1, S2, N, L)   wcsxfrm((S1), (S2), (N))
> ++#endif
> ++
> ++namespace std
> ++{
> ++  // These are basically extensions to char_traits, and perhaps =
should
> ++  // be put there instead of here.
> ++  template<>
> ++    int
> ++    collate<char>::_M_compare(const char* __one, const char* __two) =
const
> ++    {
> ++      int __cmp =3D __strcoll_l(__one, __two, _M_c_locale_collate);
> ++      return (__cmp >> (8 * sizeof (int) - 2)) | (__cmp !=3D 0);
> ++    }
> ++
> ++  template<>
> ++    size_t
> ++    collate<char>::_M_transform(char* __to, const char* __from,
> ++				size_t __n) const
> ++    { return __strxfrm_l(__to, __from, __n, _M_c_locale_collate); }
> ++
> ++#ifdef _GLIBCXX_USE_WCHAR_T
> ++  template<>
> ++    int
> ++    collate<wchar_t>::_M_compare(const wchar_t* __one,
> ++				 const wchar_t* __two) const
> ++    {
> ++      int __cmp =3D __wcscoll_l(__one, __two, _M_c_locale_collate);
> ++      return (__cmp >> (8 * sizeof (int) - 2)) | (__cmp !=3D 0);
> ++    }
> ++
> ++  template<>
> ++    size_t
> ++    collate<wchar_t>::_M_transform(wchar_t* __to, const wchar_t* =
__from,
> ++				   size_t __n) const
> ++    { return __wcsxfrm_l(__to, __from, __n, _M_c_locale_collate); }
> ++#endif
> ++}
> +diff --git a/libstdc++-v3/config/locale/uclibc/ctype_members.cc =
b/libstdc++-v3/config/locale/uclibc/ctype_members.cc
> +new file mode 100644
> +index 0000000..7294e3a
> +--- /dev/null
> ++++ b/libstdc++-v3/config/locale/uclibc/ctype_members.cc
> +@@ -0,0 +1,300 @@
> ++// std::ctype implementation details, GNU version -*- C++ -*-
> ++
> ++// Copyright (C) 2001, 2002, 2003, 2004 Free Software Foundation, =
Inc.
> ++//
> ++// This file is part of the GNU ISO C++ Library.  This library is =
free
> ++// software; you can redistribute it and/or modify it under the
> ++// terms of the GNU General Public License as published by the
> ++// Free Software Foundation; either version 2, or (at your option)
> ++// any later version.
> ++
> ++// This library is distributed in the hope that it will be useful,
> ++// but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> ++// GNU General Public License for more details.
> ++
> ++// You should have received a copy of the GNU General Public License =
along
> ++// with this library; see the file COPYING.  If not, write to the =
Free
> ++// Software Foundation, 59 Temple Place - Suite 330, Boston, MA =
02111-1307,
> ++// USA.
> ++
> ++// As a special exception, you may use this file as part of a free =
software
> ++// library without restriction.  Specifically, if other files =
instantiate
> ++// templates or use macros or inline functions from this file, or =
you compile
> ++// this file and link it with other files to produce an executable, =
this
> ++// file does not by itself cause the resulting executable to be =
covered by
> ++// the GNU General Public License.  This exception does not however
> ++// invalidate any other reasons why the executable file might be =
covered by
> ++// the GNU General Public License.
> ++
> ++//
> ++// ISO C++ 14882: 22.2.1.1.2  ctype virtual functions.
> ++//
> ++
> ++// Written by Benjamin Kosnik <bkoz@redhat.com>
> ++
> ++#define _LIBC
> ++#include <locale>
> ++#undef _LIBC
> ++#include <bits/c++locale_internal.h>
> ++
> ++#ifndef __UCLIBC_HAS_XLOCALE__
> ++#define __wctype_l(S, L)           wctype((S))
> ++#define __towupper_l(C, L)         towupper((C))
> ++#define __towlower_l(C, L)         towlower((C))
> ++#define __iswctype_l(C, M, L)      iswctype((C), (M))
> ++#endif
> ++
> ++namespace std
> ++{
> ++  // NB: The other ctype<char> specializations are in src/locale.cc =
and
> ++  // various /config/os/* files.
> ++  template<>
> ++    ctype_byname<char>::ctype_byname(const char* __s, size_t __refs)
> ++    : ctype<char>(0, false, __refs)
> ++    {
> ++      if (std::strcmp(__s, "C") !=3D 0 && std::strcmp(__s, "POSIX") =
!=3D 0)
> ++	{
> ++	  this->_S_destroy_c_locale(this->_M_c_locale_ctype);
> ++	  this->_S_create_c_locale(this->_M_c_locale_ctype, __s);
> ++#ifdef __UCLIBC_HAS_XLOCALE__
> ++	  this->_M_toupper =3D this->_M_c_locale_ctype->__ctype_toupper;
> ++	  this->_M_tolower =3D this->_M_c_locale_ctype->__ctype_tolower;
> ++	  this->_M_table =3D this->_M_c_locale_ctype->__ctype_b;
> ++#endif
> ++	}
> ++    }
> ++
> ++#ifdef _GLIBCXX_USE_WCHAR_T
> ++  ctype<wchar_t>::__wmask_type
> ++  ctype<wchar_t>::_M_convert_to_wmask(const mask __m) const
> ++  {
> ++    __wmask_type __ret;
> ++    switch (__m)
> ++      {
> ++      case space:
> ++	__ret =3D __wctype_l("space", _M_c_locale_ctype);
> ++	break;
> ++      case print:
> ++	__ret =3D __wctype_l("print", _M_c_locale_ctype);
> ++	break;
> ++      case cntrl:
> ++	__ret =3D __wctype_l("cntrl", _M_c_locale_ctype);
> ++	break;
> ++      case upper:
> ++	__ret =3D __wctype_l("upper", _M_c_locale_ctype);
> ++	break;
> ++      case lower:
> ++	__ret =3D __wctype_l("lower", _M_c_locale_ctype);
> ++	break;
> ++      case alpha:
> ++	__ret =3D __wctype_l("alpha", _M_c_locale_ctype);
> ++	break;
> ++      case digit:
> ++	__ret =3D __wctype_l("digit", _M_c_locale_ctype);
> ++	break;
> ++      case punct:
> ++	__ret =3D __wctype_l("punct", _M_c_locale_ctype);
> ++	break;
> ++      case xdigit:
> ++	__ret =3D __wctype_l("xdigit", _M_c_locale_ctype);
> ++	break;
> ++      case alnum:
> ++	__ret =3D __wctype_l("alnum", _M_c_locale_ctype);
> ++	break;
> ++      case graph:
> ++	__ret =3D __wctype_l("graph", _M_c_locale_ctype);
> ++	break;
> ++      default:
> ++	__ret =3D __wmask_type();
> ++      }
> ++    return __ret;
> ++  }
> ++
> ++  wchar_t
> ++  ctype<wchar_t>::do_toupper(wchar_t __c) const
> ++  { return __towupper_l(__c, _M_c_locale_ctype); }
> ++
> ++  const wchar_t*
> ++  ctype<wchar_t>::do_toupper(wchar_t* __lo, const wchar_t* __hi) =
const
> ++  {
> ++    while (__lo < __hi)
> ++      {
> ++        *__lo =3D __towupper_l(*__lo, _M_c_locale_ctype);
> ++        ++__lo;
> ++      }
> ++    return __hi;
> ++  }
> ++
> ++  wchar_t
> ++  ctype<wchar_t>::do_tolower(wchar_t __c) const
> ++  { return __towlower_l(__c, _M_c_locale_ctype); }
> ++
> ++  const wchar_t*
> ++  ctype<wchar_t>::do_tolower(wchar_t* __lo, const wchar_t* __hi) =
const
> ++  {
> ++    while (__lo < __hi)
> ++      {
> ++        *__lo =3D __towlower_l(*__lo, _M_c_locale_ctype);
> ++        ++__lo;
> ++      }
> ++    return __hi;
> ++  }
> ++
> ++  bool
> ++  ctype<wchar_t>::
> ++  do_is(mask __m, wchar_t __c) const
> ++  {
> ++    // Highest bitmask in ctype_base =3D=3D 10, but extra in "C"
> ++    // library for blank.
> ++    bool __ret =3D false;
> ++    const size_t __bitmasksize =3D 11;
> ++    for (size_t __bitcur =3D 0; __bitcur <=3D __bitmasksize; =
++__bitcur)
> ++      if (__m & _M_bit[__bitcur]
> ++	  && __iswctype_l(__c, _M_wmask[__bitcur], _M_c_locale_ctype))
> ++	{
> ++	  __ret =3D true;
> ++	  break;
> ++	}
> ++    return __ret;
> ++  }
> ++
> ++  const wchar_t*
> ++  ctype<wchar_t>::
> ++  do_is(const wchar_t* __lo, const wchar_t* __hi, mask* __vec) const
> ++  {
> ++    for (; __lo < __hi; ++__vec, ++__lo)
> ++      {
> ++	// Highest bitmask in ctype_base =3D=3D 10, but extra in "C"
> ++	// library for blank.
> ++	const size_t __bitmasksize =3D 11;
> ++	mask __m =3D 0;
> ++	for (size_t __bitcur =3D 0; __bitcur <=3D __bitmasksize; =
++__bitcur)
> ++	  if (__iswctype_l(*__lo, _M_wmask[__bitcur], =
_M_c_locale_ctype))
> ++	    __m |=3D _M_bit[__bitcur];
> ++	*__vec =3D __m;
> ++      }
> ++    return __hi;
> ++  }
> ++
> ++  const wchar_t*
> ++  ctype<wchar_t>::
> ++  do_scan_is(mask __m, const wchar_t* __lo, const wchar_t* __hi) =
const
> ++  {
> ++    while (__lo < __hi && !this->do_is(__m, *__lo))
> ++      ++__lo;
> ++    return __lo;
> ++  }
> ++
> ++  const wchar_t*
> ++  ctype<wchar_t>::
> ++  do_scan_not(mask __m, const char_type* __lo, const char_type* =
__hi) const
> ++  {
> ++    while (__lo < __hi && this->do_is(__m, *__lo) !=3D 0)
> ++      ++__lo;
> ++    return __lo;
> ++  }
> ++
> ++  wchar_t
> ++  ctype<wchar_t>::
> ++  do_widen(char __c) const
> ++  { return _M_widen[static_cast<unsigned char>(__c)]; }
> ++
> ++  const char*
> ++  ctype<wchar_t>::
> ++  do_widen(const char* __lo, const char* __hi, wchar_t* __dest) =
const
> ++  {
> ++    while (__lo < __hi)
> ++      {
> ++	*__dest =3D _M_widen[static_cast<unsigned char>(*__lo)];
> ++	++__lo;
> ++	++__dest;
> ++      }
> ++    return __hi;
> ++  }
> ++
> ++  char
> ++  ctype<wchar_t>::
> ++  do_narrow(wchar_t __wc, char __dfault) const
> ++  {
> ++    if (__wc >=3D 0 && __wc < 128 && _M_narrow_ok)
> ++      return _M_narrow[__wc];
> ++#ifdef __UCLIBC_HAS_XLOCALE__
> ++    __c_locale __old =3D __uselocale(_M_c_locale_ctype);
> ++#endif
> ++    const int __c =3D wctob(__wc);
> ++#ifdef __UCLIBC_HAS_XLOCALE__
> ++    __uselocale(__old);
> ++#endif
> ++    return (__c =3D=3D EOF ? __dfault : static_cast<char>(__c));
> ++  }
> ++
> ++  const wchar_t*
> ++  ctype<wchar_t>::
> ++  do_narrow(const wchar_t* __lo, const wchar_t* __hi, char __dfault,
> ++	    char* __dest) const
> ++  {
> ++#ifdef __UCLIBC_HAS_XLOCALE__
> ++    __c_locale __old =3D __uselocale(_M_c_locale_ctype);
> ++#endif
> ++    if (_M_narrow_ok)
> ++      while (__lo < __hi)
> ++	{
> ++	  if (*__lo >=3D 0 && *__lo < 128)
> ++	    *__dest =3D _M_narrow[*__lo];
> ++	  else
> ++	    {
> ++	      const int __c =3D wctob(*__lo);
> ++	      *__dest =3D (__c =3D=3D EOF ? __dfault : =
static_cast<char>(__c));
> ++	    }
> ++	  ++__lo;
> ++	  ++__dest;
> ++	}
> ++    else
> ++      while (__lo < __hi)
> ++	{
> ++	  const int __c =3D wctob(*__lo);
> ++	  *__dest =3D (__c =3D=3D EOF ? __dfault : =
static_cast<char>(__c));
> ++	  ++__lo;
> ++	  ++__dest;
> ++	}
> ++#ifdef __UCLIBC_HAS_XLOCALE__
> ++    __uselocale(__old);
> ++#endif
> ++    return __hi;
> ++  }
> ++
> ++  void
> ++  ctype<wchar_t>::_M_initialize_ctype()
> ++  {
> ++#ifdef __UCLIBC_HAS_XLOCALE__
> ++    __c_locale __old =3D __uselocale(_M_c_locale_ctype);
> ++#endif
> ++    wint_t __i;
> ++    for (__i =3D 0; __i < 128; ++__i)
> ++      {
> ++	const int __c =3D wctob(__i);
> ++	if (__c =3D=3D EOF)
> ++	  break;
> ++	else
> ++	  _M_narrow[__i] =3D static_cast<char>(__c);
> ++      }
> ++    if (__i =3D=3D 128)
> ++      _M_narrow_ok =3D true;
> ++    else
> ++      _M_narrow_ok =3D false;
> ++    for (size_t __j =3D 0;
> ++	 __j < sizeof(_M_widen) / sizeof(wint_t); ++__j)
> ++      _M_widen[__j] =3D btowc(__j);
> ++
> ++    for (size_t __k =3D 0; __k <=3D 11; ++__k)
> ++      {
> ++	_M_bit[__k] =3D static_cast<mask>(_ISbit(__k));
> ++	_M_wmask[__k] =3D _M_convert_to_wmask(_M_bit[__k]);
> ++      }
> ++#ifdef __UCLIBC_HAS_XLOCALE__
> ++    __uselocale(__old);
> ++#endif
> ++  }
> ++#endif //  _GLIBCXX_USE_WCHAR_T
> ++}
> +diff --git a/libstdc++-v3/config/locale/uclibc/messages_members.cc =
b/libstdc++-v3/config/locale/uclibc/messages_members.cc
> +new file mode 100644
> +index 0000000..13594d9
> +--- /dev/null
> ++++ b/libstdc++-v3/config/locale/uclibc/messages_members.cc
> +@@ -0,0 +1,100 @@
> ++// std::messages implementation details, GNU version -*- C++ -*-
> ++
> ++// Copyright (C) 2001, 2002 Free Software Foundation, Inc.
> ++//
> ++// This file is part of the GNU ISO C++ Library.  This library is =
free
> ++// software; you can redistribute it and/or modify it under the
> ++// terms of the GNU General Public License as published by the
> ++// Free Software Foundation; either version 2, or (at your option)
> ++// any later version.
> ++
> ++// This library is distributed in the hope that it will be useful,
> ++// but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> ++// GNU General Public License for more details.
> ++
> ++// You should have received a copy of the GNU General Public License =
along
> ++// with this library; see the file COPYING.  If not, write to the =
Free
> ++// Software Foundation, 59 Temple Place - Suite 330, Boston, MA =
02111-1307,
> ++// USA.
> ++
> ++// As a special exception, you may use this file as part of a free =
software
> ++// library without restriction.  Specifically, if other files =
instantiate
> ++// templates or use macros or inline functions from this file, or =
you compile
> ++// this file and link it with other files to produce an executable, =
this
> ++// file does not by itself cause the resulting executable to be =
covered by
> ++// the GNU General Public License.  This exception does not however
> ++// invalidate any other reasons why the executable file might be =
covered by
> ++// the GNU General Public License.
> ++
> ++//
> ++// ISO C++ 14882: 22.2.7.1.2  messages virtual functions
> ++//
> ++
> ++// Written by Benjamin Kosnik <bkoz@redhat.com>
> ++
> ++#include <locale>
> ++#include <bits/c++locale_internal.h>
> ++
> ++#ifdef __UCLIBC_MJN3_ONLY__
> ++#warning fix gettext stuff
> ++#endif
> ++#ifdef __UCLIBC_HAS_GETTEXT_AWARENESS__
> ++extern "C" char *__dcgettext(const char *domainname,
> ++			     const char *msgid, int category);
> ++#undef gettext
> ++#define gettext(msgid) __dcgettext(NULL, msgid, LC_MESSAGES)
> ++#else
> ++#undef gettext
> ++#define gettext(msgid) (msgid)
> ++#endif
> ++
> ++namespace std
> ++{
> ++  // Specializations.
> ++  template<>
> ++    string
> ++    messages<char>::do_get(catalog, int, int, const string& =
__dfault) const
> ++    {
> ++#ifdef __UCLIBC_HAS_XLOCALE__
> ++      __c_locale __old =3D __uselocale(_M_c_locale_messages);
> ++      const char* __msg =3D const_cast<const =
char*>(gettext(__dfault.c_str()));
> ++      __uselocale(__old);
> ++      return string(__msg);
> ++#elif defined __UCLIBC_HAS_LOCALE__
> ++      char* __old =3D strdup(setlocale(LC_ALL, NULL));
> ++      setlocale(LC_ALL, _M_name_messages);
> ++      const char* __msg =3D gettext(__dfault.c_str());
> ++      setlocale(LC_ALL, __old);
> ++      free(__old);
> ++      return string(__msg);
> ++#else
> ++      const char* __msg =3D gettext(__dfault.c_str());
> ++      return string(__msg);
> ++#endif
> ++    }
> ++
> ++#ifdef _GLIBCXX_USE_WCHAR_T
> ++  template<>
> ++    wstring
> ++    messages<wchar_t>::do_get(catalog, int, int, const wstring& =
__dfault) const
> ++    {
> ++# ifdef __UCLIBC_HAS_XLOCALE__
> ++      __c_locale __old =3D __uselocale(_M_c_locale_messages);
> ++      char* __msg =3D gettext(_M_convert_to_char(__dfault));
> ++      __uselocale(__old);
> ++      return _M_convert_from_char(__msg);
> ++# elif defined __UCLIBC_HAS_LOCALE__
> ++      char* __old =3D strdup(setlocale(LC_ALL, NULL));
> ++      setlocale(LC_ALL, _M_name_messages);
> ++      char* __msg =3D gettext(_M_convert_to_char(__dfault));
> ++      setlocale(LC_ALL, __old);
> ++      free(__old);
> ++      return _M_convert_from_char(__msg);
> ++# else
> ++      char* __msg =3D gettext(_M_convert_to_char(__dfault));
> ++      return _M_convert_from_char(__msg);
> ++# endif
> ++    }
> ++#endif
> ++}
> +diff --git a/libstdc++-v3/config/locale/uclibc/messages_members.h =
b/libstdc++-v3/config/locale/uclibc/messages_members.h
> +new file mode 100644
> +index 0000000..1424078
> +--- /dev/null
> ++++ b/libstdc++-v3/config/locale/uclibc/messages_members.h
> +@@ -0,0 +1,118 @@
> ++// std::messages implementation details, GNU version -*- C++ -*-
> ++
> ++// Copyright (C) 2001, 2002, 2003, 2004 Free Software Foundation, =
Inc.
> ++//
> ++// This file is part of the GNU ISO C++ Library.  This library is =
free
> ++// software; you can redistribute it and/or modify it under the
> ++// terms of the GNU General Public License as published by the
> ++// Free Software Foundation; either version 2, or (at your option)
> ++// any later version.
> ++
> ++// This library is distributed in the hope that it will be useful,
> ++// but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> ++// GNU General Public License for more details.
> ++
> ++// You should have received a copy of the GNU General Public License =
along
> ++// with this library; see the file COPYING.  If not, write to the =
Free
> ++// Software Foundation, 59 Temple Place - Suite 330, Boston, MA =
02111-1307,
> ++// USA.
> ++
> ++// As a special exception, you may use this file as part of a free =
software
> ++// library without restriction.  Specifically, if other files =
instantiate
> ++// templates or use macros or inline functions from this file, or =
you compile
> ++// this file and link it with other files to produce an executable, =
this
> ++// file does not by itself cause the resulting executable to be =
covered by
> ++// the GNU General Public License.  This exception does not however
> ++// invalidate any other reasons why the executable file might be =
covered by
> ++// the GNU General Public License.
> ++
> ++//
> ++// ISO C++ 14882: 22.2.7.1.2  messages functions
> ++//
> ++
> ++// Written by Benjamin Kosnik <bkoz@redhat.com>
> ++
> ++#ifdef __UCLIBC_MJN3_ONLY__
> ++#warning fix prototypes for *textdomain funcs
> ++#endif
> ++#ifdef __UCLIBC_HAS_GETTEXT_AWARENESS__
> ++extern "C" char *__textdomain(const char *domainname);
> ++extern "C" char *__bindtextdomain(const char *domainname,
> ++				  const char *dirname);
> ++#else
> ++#undef __textdomain
> ++#undef __bindtextdomain
> ++#define __textdomain(D)           ((void)0)
> ++#define __bindtextdomain(D,P)     ((void)0)
> ++#endif
> ++
> ++  // Non-virtual member functions.
> ++  template<typename _CharT>
> ++     messages<_CharT>::messages(size_t __refs)
> ++     : facet(__refs), _M_c_locale_messages(_S_get_c_locale()),
> ++     _M_name_messages(_S_get_c_name())
> ++     { }
> ++
> ++  template<typename _CharT>
> ++     messages<_CharT>::messages(__c_locale __cloc, const char* __s,
> ++				size_t __refs)
> ++     : facet(__refs), =
_M_c_locale_messages(_S_clone_c_locale(__cloc)),
> ++     _M_name_messages(__s)
> ++     {
> ++       char* __tmp =3D new char[std::strlen(__s) + 1];
> ++       std::strcpy(__tmp, __s);
> ++       _M_name_messages =3D __tmp;
> ++     }
> ++
> ++  template<typename _CharT>
> ++    typename messages<_CharT>::catalog
> ++    messages<_CharT>::open(const basic_string<char>& __s, const =
locale& __loc,
> ++			   const char* __dir) const
> ++    {
> ++      __bindtextdomain(__s.c_str(), __dir);
> ++      return this->do_open(__s, __loc);
> ++    }
> ++
> ++  // Virtual member functions.
> ++  template<typename _CharT>
> ++    messages<_CharT>::~messages()
> ++    {
> ++      if (_M_name_messages !=3D _S_get_c_name())
> ++	delete [] _M_name_messages;
> ++      _S_destroy_c_locale(_M_c_locale_messages);
> ++    }
> ++
> ++  template<typename _CharT>
> ++    typename messages<_CharT>::catalog
> ++    messages<_CharT>::do_open(const basic_string<char>& __s,
> ++			      const locale&) const
> ++    {
> ++      // No error checking is done, assume the catalog exists and =
can
> ++      // be used.
> ++      __textdomain(__s.c_str());
> ++      return 0;
> ++    }
> ++
> ++  template<typename _CharT>
> ++    void
> ++    messages<_CharT>::do_close(catalog) const
> ++    { }
> ++
> ++   // messages_byname
> ++   template<typename _CharT>
> ++     messages_byname<_CharT>::messages_byname(const char* __s, =
size_t __refs)
> ++     : messages<_CharT>(__refs)
> ++     {
> ++       if (this->_M_name_messages !=3D =
locale::facet::_S_get_c_name())
> ++	 delete [] this->_M_name_messages;
> ++       char* __tmp =3D new char[std::strlen(__s) + 1];
> ++       std::strcpy(__tmp, __s);
> ++       this->_M_name_messages =3D __tmp;
> ++
> ++       if (std::strcmp(__s, "C") !=3D 0 && std::strcmp(__s, "POSIX") =
!=3D 0)
> ++	 {
> ++	   this->_S_destroy_c_locale(this->_M_c_locale_messages);
> ++	   this->_S_create_c_locale(this->_M_c_locale_messages, __s);
> ++	 }
> ++     }
> +diff --git a/libstdc++-v3/config/locale/uclibc/monetary_members.cc =
b/libstdc++-v3/config/locale/uclibc/monetary_members.cc
> +new file mode 100644
> +index 0000000..aa52731
> +--- /dev/null
> ++++ b/libstdc++-v3/config/locale/uclibc/monetary_members.cc
> +@@ -0,0 +1,692 @@
> ++// std::moneypunct implementation details, GNU version -*- C++ -*-
> ++
> ++// Copyright (C) 2001, 2002, 2003, 2004 Free Software Foundation, =
Inc.
> ++//
> ++// This file is part of the GNU ISO C++ Library.  This library is =
free
> ++// software; you can redistribute it and/or modify it under the
> ++// terms of the GNU General Public License as published by the
> ++// Free Software Foundation; either version 2, or (at your option)
> ++// any later version.
> ++
> ++// This library is distributed in the hope that it will be useful,
> ++// but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> ++// GNU General Public License for more details.
> ++
> ++// You should have received a copy of the GNU General Public License =
along
> ++// with this library; see the file COPYING.  If not, write to the =
Free
> ++// Software Foundation, 59 Temple Place - Suite 330, Boston, MA =
02111-1307,
> ++// USA.
> ++
> ++// As a special exception, you may use this file as part of a free =
software
> ++// library without restriction.  Specifically, if other files =
instantiate
> ++// templates or use macros or inline functions from this file, or =
you compile
> ++// this file and link it with other files to produce an executable, =
this
> ++// file does not by itself cause the resulting executable to be =
covered by
> ++// the GNU General Public License.  This exception does not however
> ++// invalidate any other reasons why the executable file might be =
covered by
> ++// the GNU General Public License.
> ++
> ++//
> ++// ISO C++ 14882: 22.2.6.3.2  moneypunct virtual functions
> ++//
> ++
> ++// Written by Benjamin Kosnik <bkoz@redhat.com>
> ++
> ++#define _LIBC
> ++#include <locale>
> ++#undef _LIBC
> ++#include <bits/c++locale_internal.h>
> ++
> ++#ifdef __UCLIBC_MJN3_ONLY__
> ++#warning optimize this for uclibc
> ++#warning tailor for stub locale support
> ++#endif
> ++
> ++#ifndef __UCLIBC_HAS_XLOCALE__
> ++#define __nl_langinfo_l(N, L)         nl_langinfo((N))
> ++#endif
> ++
> ++namespace std
> ++{
> ++  // Construct and return valid pattern consisting of some =
combination of:
> ++  // space none symbol sign value
> ++  money_base::pattern
> ++  money_base::_S_construct_pattern(char __precedes, char __space, =
char __posn)
> ++  {
> ++    pattern __ret;
> ++
> ++    // This insanely complicated routine attempts to construct a =
valid
> ++    // pattern for use with monyepunct. A couple of invariants:
> ++
> ++    // if (__precedes) symbol -> value
> ++    // else value -> symbol
> ++
> ++    // if (__space) space
> ++    // else none
> ++
> ++    // none =3D=3D never first
> ++    // space never first or last
> ++
> ++    // Any elegant implementations of this are welcome.
> ++    switch (__posn)
> ++      {
> ++      case 0:
> ++      case 1:
> ++	// 1 The sign precedes the value and symbol.
> ++	__ret.field[0] =3D sign;
> ++	if (__space)
> ++	  {
> ++	    // Pattern starts with sign.
> ++	    if (__precedes)
> ++	      {
> ++		__ret.field[1] =3D symbol;
> ++		__ret.field[3] =3D value;
> ++	      }
> ++	    else
> ++	      {
> ++		__ret.field[1] =3D value;
> ++		__ret.field[3] =3D symbol;
> ++	      }
> ++	    __ret.field[2] =3D space;
> ++	  }
> ++	else
> ++	  {
> ++	    // Pattern starts with sign and ends with none.
> ++	    if (__precedes)
> ++	      {
> ++		__ret.field[1] =3D symbol;
> ++		__ret.field[2] =3D value;
> ++	      }
> ++	    else
> ++	      {
> ++		__ret.field[1] =3D value;
> ++		__ret.field[2] =3D symbol;
> ++	      }
> ++	    __ret.field[3] =3D none;
> ++	  }
> ++	break;
> ++      case 2:
> ++	// 2 The sign follows the value and symbol.
> ++	if (__space)
> ++	  {
> ++	    // Pattern either ends with sign.
> ++	    if (__precedes)
> ++	      {
> ++		__ret.field[0] =3D symbol;
> ++		__ret.field[2] =3D value;
> ++	      }
> ++	    else
> ++	      {
> ++		__ret.field[0] =3D value;
> ++		__ret.field[2] =3D symbol;
> ++	      }
> ++	    __ret.field[1] =3D space;
> ++	    __ret.field[3] =3D sign;
> ++	  }
> ++	else
> ++	  {
> ++	    // Pattern ends with sign then none.
> ++	    if (__precedes)
> ++	      {
> ++		__ret.field[0] =3D symbol;
> ++		__ret.field[1] =3D value;
> ++	      }
> ++	    else
> ++	      {
> ++		__ret.field[0] =3D value;
> ++		__ret.field[1] =3D symbol;
> ++	      }
> ++	    __ret.field[2] =3D sign;
> ++	    __ret.field[3] =3D none;
> ++	  }
> ++	break;
> ++      case 3:
> ++	// 3 The sign immediately precedes the symbol.
> ++	if (__precedes)
> ++	  {
> ++	    __ret.field[0] =3D sign;
> ++	    __ret.field[1] =3D symbol;
> ++	    if (__space)
> ++	      {
> ++		__ret.field[2] =3D space;
> ++		__ret.field[3] =3D value;
> ++	      }
> ++	    else
> ++	      {
> ++		__ret.field[2] =3D value;
> ++		__ret.field[3] =3D none;
> ++	      }
> ++	  }
> ++	else
> ++	  {
> ++	    __ret.field[0] =3D value;
> ++	    if (__space)
> ++	      {
> ++		__ret.field[1] =3D space;
> ++		__ret.field[2] =3D sign;
> ++		__ret.field[3] =3D symbol;
> ++	      }
> ++	    else
> ++	      {
> ++		__ret.field[1] =3D sign;
> ++		__ret.field[2] =3D symbol;
> ++		__ret.field[3] =3D none;
> ++	      }
> ++	  }
> ++	break;
> ++      case 4:
> ++	// 4 The sign immediately follows the symbol.
> ++	if (__precedes)
> ++	  {
> ++	    __ret.field[0] =3D symbol;
> ++	    __ret.field[1] =3D sign;
> ++	    if (__space)
> ++	      {
> ++		__ret.field[2] =3D space;
> ++		__ret.field[3] =3D value;
> ++	      }
> ++	    else
> ++	      {
> ++		__ret.field[2] =3D value;
> ++		__ret.field[3] =3D none;
> ++	      }
> ++	  }
> ++	else
> ++	  {
> ++	    __ret.field[0] =3D value;
> ++	    if (__space)
> ++	      {
> ++		__ret.field[1] =3D space;
> ++		__ret.field[2] =3D symbol;
> ++		__ret.field[3] =3D sign;
> ++	      }
> ++	    else
> ++	      {
> ++		__ret.field[1] =3D symbol;
> ++		__ret.field[2] =3D sign;
> ++		__ret.field[3] =3D none;
> ++	      }
> ++	  }
> ++	break;
> ++      default:
> ++	;
> ++      }
> ++    return __ret;
> ++  }
> ++
> ++  template<>
> ++    void
> ++    moneypunct<char, true>::_M_initialize_moneypunct(__c_locale =
__cloc,
> ++						     const char*)
> ++    {
> ++      if (!_M_data)
> ++	_M_data =3D new __moneypunct_cache<char, true>;
> ++
> ++      if (!__cloc)
> ++	{
> ++	  // "C" locale
> ++	  _M_data->_M_decimal_point =3D '.';
> ++	  _M_data->_M_thousands_sep =3D ',';
> ++	  _M_data->_M_grouping =3D "";
> ++	  _M_data->_M_grouping_size =3D 0;
> ++	  _M_data->_M_curr_symbol =3D "";
> ++	  _M_data->_M_curr_symbol_size =3D 0;
> ++	  _M_data->_M_positive_sign =3D "";
> ++	  _M_data->_M_positive_sign_size =3D 0;
> ++	  _M_data->_M_negative_sign =3D "";
> ++	  _M_data->_M_negative_sign_size =3D 0;
> ++	  _M_data->_M_frac_digits =3D 0;
> ++	  _M_data->_M_pos_format =3D money_base::_S_default_pattern;
> ++	  _M_data->_M_neg_format =3D money_base::_S_default_pattern;
> ++
> ++	  for (size_t __i =3D 0; __i < money_base::_S_end; ++__i)
> ++	    _M_data->_M_atoms[__i] =3D money_base::_S_atoms[__i];
> ++	}
> ++      else
> ++	{
> ++	  // Named locale.
> ++	  _M_data->_M_decimal_point =3D =
*(__nl_langinfo_l(__MON_DECIMAL_POINT,
> ++							__cloc));
> ++	  _M_data->_M_thousands_sep =3D =
*(__nl_langinfo_l(__MON_THOUSANDS_SEP,
> ++							__cloc));
> ++	  _M_data->_M_grouping =3D __nl_langinfo_l(__MON_GROUPING, =
__cloc);
> ++	  _M_data->_M_grouping_size =3D strlen(_M_data->_M_grouping);
> ++	  _M_data->_M_positive_sign =3D __nl_langinfo_l(__POSITIVE_SIGN, =
__cloc);
> ++	  _M_data->_M_positive_sign_size =3D =
strlen(_M_data->_M_positive_sign);
> ++
> ++	  char __nposn =3D *(__nl_langinfo_l(__INT_N_SIGN_POSN, =
__cloc));
> ++	  if (!__nposn)
> ++	    _M_data->_M_negative_sign =3D "()";
> ++	  else
> ++	    _M_data->_M_negative_sign =3D =
__nl_langinfo_l(__NEGATIVE_SIGN,
> ++							__cloc);
> ++	  _M_data->_M_negative_sign_size =3D =
strlen(_M_data->_M_negative_sign);
> ++
> ++	  // _Intl =3D=3D true
> ++	  _M_data->_M_curr_symbol =3D __nl_langinfo_l(__INT_CURR_SYMBOL, =
__cloc);
> ++	  _M_data->_M_curr_symbol_size =3D =
strlen(_M_data->_M_curr_symbol);
> ++	  _M_data->_M_frac_digits =3D =
*(__nl_langinfo_l(__INT_FRAC_DIGITS,
> ++						      __cloc));
> ++	  char __pprecedes =3D *(__nl_langinfo_l(__INT_P_CS_PRECEDES, =
__cloc));
> ++	  char __pspace =3D *(__nl_langinfo_l(__INT_P_SEP_BY_SPACE, =
__cloc));
> ++	  char __pposn =3D *(__nl_langinfo_l(__INT_P_SIGN_POSN, =
__cloc));
> ++	  _M_data->_M_pos_format =3D _S_construct_pattern(__pprecedes, =
__pspace,
> ++							__pposn);
> ++	  char __nprecedes =3D *(__nl_langinfo_l(__INT_N_CS_PRECEDES, =
__cloc));
> ++	  char __nspace =3D *(__nl_langinfo_l(__INT_N_SEP_BY_SPACE, =
__cloc));
> ++	  _M_data->_M_neg_format =3D _S_construct_pattern(__nprecedes, =
__nspace,
> ++							__nposn);
> ++	}
> ++    }
> ++
> ++  template<>
> ++    void
> ++    moneypunct<char, false>::_M_initialize_moneypunct(__c_locale =
__cloc,
> ++						      const char*)
> ++    {
> ++      if (!_M_data)
> ++	_M_data =3D new __moneypunct_cache<char, false>;
> ++
> ++      if (!__cloc)
> ++	{
> ++	  // "C" locale
> ++	  _M_data->_M_decimal_point =3D '.';
> ++	  _M_data->_M_thousands_sep =3D ',';
> ++	  _M_data->_M_grouping =3D "";
> ++	  _M_data->_M_grouping_size =3D 0;
> ++	  _M_data->_M_curr_symbol =3D "";
> ++	  _M_data->_M_curr_symbol_size =3D 0;
> ++	  _M_data->_M_positive_sign =3D "";
> ++	  _M_data->_M_positive_sign_size =3D 0;
> ++	  _M_data->_M_negative_sign =3D "";
> ++	  _M_data->_M_negative_sign_size =3D 0;
> ++	  _M_data->_M_frac_digits =3D 0;
> ++	  _M_data->_M_pos_format =3D money_base::_S_default_pattern;
> ++	  _M_data->_M_neg_format =3D money_base::_S_default_pattern;
> ++
> ++	  for (size_t __i =3D 0; __i < money_base::_S_end; ++__i)
> ++	    _M_data->_M_atoms[__i] =3D money_base::_S_atoms[__i];
> ++	}
> ++      else
> ++	{
> ++	  // Named locale.
> ++	  _M_data->_M_decimal_point =3D =
*(__nl_langinfo_l(__MON_DECIMAL_POINT,
> ++							__cloc));
> ++	  _M_data->_M_thousands_sep =3D =
*(__nl_langinfo_l(__MON_THOUSANDS_SEP,
> ++							__cloc));
> ++	  _M_data->_M_grouping =3D __nl_langinfo_l(__MON_GROUPING, =
__cloc);
> ++	  _M_data->_M_grouping_size =3D strlen(_M_data->_M_grouping);
> ++	  _M_data->_M_positive_sign =3D __nl_langinfo_l(__POSITIVE_SIGN, =
__cloc);
> ++	  _M_data->_M_positive_sign_size =3D =
strlen(_M_data->_M_positive_sign);
> ++
> ++	  char __nposn =3D *(__nl_langinfo_l(__N_SIGN_POSN, __cloc));
> ++	  if (!__nposn)
> ++	    _M_data->_M_negative_sign =3D "()";
> ++	  else
> ++	    _M_data->_M_negative_sign =3D =
__nl_langinfo_l(__NEGATIVE_SIGN,
> ++							__cloc);
> ++	  _M_data->_M_negative_sign_size =3D =
strlen(_M_data->_M_negative_sign);
> ++
> ++	  // _Intl =3D=3D false
> ++	  _M_data->_M_curr_symbol =3D __nl_langinfo_l(__CURRENCY_SYMBOL, =
__cloc);
> ++	  _M_data->_M_curr_symbol_size =3D =
strlen(_M_data->_M_curr_symbol);
> ++	  _M_data->_M_frac_digits =3D *(__nl_langinfo_l(__FRAC_DIGITS, =
__cloc));
> ++	  char __pprecedes =3D *(__nl_langinfo_l(__P_CS_PRECEDES, =
__cloc));
> ++	  char __pspace =3D *(__nl_langinfo_l(__P_SEP_BY_SPACE, =
__cloc));
> ++	  char __pposn =3D *(__nl_langinfo_l(__P_SIGN_POSN, __cloc));
> ++	  _M_data->_M_pos_format =3D _S_construct_pattern(__pprecedes, =
__pspace,
> ++							__pposn);
> ++	  char __nprecedes =3D *(__nl_langinfo_l(__N_CS_PRECEDES, =
__cloc));
> ++	  char __nspace =3D *(__nl_langinfo_l(__N_SEP_BY_SPACE, =
__cloc));
> ++	  _M_data->_M_neg_format =3D _S_construct_pattern(__nprecedes, =
__nspace,
> ++							__nposn);
> ++	}
> ++    }
> ++
> ++  template<>
> ++    moneypunct<char, true>::~moneypunct()
> ++    { delete _M_data; }
> ++
> ++  template<>
> ++    moneypunct<char, false>::~moneypunct()
> ++    { delete _M_data; }
> ++
> ++#ifdef _GLIBCXX_USE_WCHAR_T
> ++  template<>
> ++    void
> ++    moneypunct<wchar_t, true>::_M_initialize_moneypunct(__c_locale =
__cloc,
> ++#ifdef __UCLIBC_HAS_XLOCALE__
> ++							const char*)
> ++#else
> ++							const char* =
__name)
> ++#endif
> ++    {
> ++      if (!_M_data)
> ++	_M_data =3D new __moneypunct_cache<wchar_t, true>;
> ++
> ++      if (!__cloc)
> ++	{
> ++	  // "C" locale
> ++	  _M_data->_M_decimal_point =3D L'.';
> ++	  _M_data->_M_thousands_sep =3D L',';
> ++	  _M_data->_M_grouping =3D "";
> ++	  _M_data->_M_grouping_size =3D 0;
> ++	  _M_data->_M_curr_symbol =3D L"";
> ++	  _M_data->_M_curr_symbol_size =3D 0;
> ++	  _M_data->_M_positive_sign =3D L"";
> ++	  _M_data->_M_positive_sign_size =3D 0;
> ++	  _M_data->_M_negative_sign =3D L"";
> ++	  _M_data->_M_negative_sign_size =3D 0;
> ++	  _M_data->_M_frac_digits =3D 0;
> ++	  _M_data->_M_pos_format =3D money_base::_S_default_pattern;
> ++	  _M_data->_M_neg_format =3D money_base::_S_default_pattern;
> ++
> ++	  // Use ctype::widen code without the facet...
> ++	  for (size_t __i =3D 0; __i < money_base::_S_end; ++__i)
> ++	    _M_data->_M_atoms[__i] =3D
> ++	      static_cast<wchar_t>(money_base::_S_atoms[__i]);
> ++	}
> ++      else
> ++	{
> ++	  // Named locale.
> ++#ifdef __UCLIBC_HAS_XLOCALE__
> ++	  __c_locale __old =3D __uselocale(__cloc);
> ++#else
> ++	  // Switch to named locale so that mbsrtowcs will work.
> ++	  char* __old =3D strdup(setlocale(LC_ALL, NULL));
> ++	  setlocale(LC_ALL, __name);
> ++#endif
> ++
> ++#ifdef __UCLIBC_MJN3_ONLY__
> ++#warning fix this... should be monetary
> ++#endif
> ++#ifdef __UCLIBC__
> ++# ifdef __UCLIBC_HAS_XLOCALE__
> ++	  _M_data->_M_decimal_point =3D __cloc->decimal_point_wc;
> ++	  _M_data->_M_thousands_sep =3D __cloc->thousands_sep_wc;
> ++# else
> ++	  _M_data->_M_decimal_point =3D =
__global_locale->decimal_point_wc;
> ++	  _M_data->_M_thousands_sep =3D =
__global_locale->thousands_sep_wc;
> ++# endif
> ++#else
> ++	  union { char *__s; wchar_t __w; } __u;
> ++	  __u.__s =3D __nl_langinfo_l(_NL_MONETARY_DECIMAL_POINT_WC, =
__cloc);
> ++	  _M_data->_M_decimal_point =3D __u.__w;
> ++
> ++	  __u.__s =3D __nl_langinfo_l(_NL_MONETARY_THOUSANDS_SEP_WC, =
__cloc);
> ++	  _M_data->_M_thousands_sep =3D __u.__w;
> ++#endif
> ++	  _M_data->_M_grouping =3D __nl_langinfo_l(__MON_GROUPING, =
__cloc);
> ++	  _M_data->_M_grouping_size =3D strlen(_M_data->_M_grouping);
> ++
> ++	  const char* __cpossign =3D __nl_langinfo_l(__POSITIVE_SIGN, =
__cloc);
> ++	  const char* __cnegsign =3D __nl_langinfo_l(__NEGATIVE_SIGN, =
__cloc);
> ++	  const char* __ccurr =3D __nl_langinfo_l(__INT_CURR_SYMBOL, =
__cloc);
> ++
> ++	  wchar_t* __wcs_ps =3D 0;
> ++	  wchar_t* __wcs_ns =3D 0;
> ++	  const char __nposn =3D *(__nl_langinfo_l(__INT_N_SIGN_POSN, =
__cloc));
> ++	  try
> ++	    {
> ++	      mbstate_t __state;
> ++	      size_t __len =3D strlen(__cpossign);
> ++	      if (__len)
> ++		{
> ++		  ++__len;
> ++		  memset(&__state, 0, sizeof(mbstate_t));
> ++		  __wcs_ps =3D new wchar_t[__len];
> ++		  mbsrtowcs(__wcs_ps, &__cpossign, __len, &__state);
> ++		  _M_data->_M_positive_sign =3D __wcs_ps;
> ++		}
> ++	      else
> ++		_M_data->_M_positive_sign =3D L"";
> ++	      _M_data->_M_positive_sign_size =3D =
wcslen(_M_data->_M_positive_sign);
> ++
> ++	      __len =3D strlen(__cnegsign);
> ++	      if (!__nposn)
> ++		_M_data->_M_negative_sign =3D L"()";
> ++	      else if (__len)
> ++		{
> ++		  ++__len;
> ++		  memset(&__state, 0, sizeof(mbstate_t));
> ++		  __wcs_ns =3D new wchar_t[__len];
> ++		  mbsrtowcs(__wcs_ns, &__cnegsign, __len, &__state);
> ++		  _M_data->_M_negative_sign =3D __wcs_ns;
> ++		}
> ++	      else
> ++		_M_data->_M_negative_sign =3D L"";
> ++	      _M_data->_M_negative_sign_size =3D =
wcslen(_M_data->_M_negative_sign);
> ++
> ++	      // _Intl =3D=3D true.
> ++	      __len =3D strlen(__ccurr);
> ++	      if (__len)
> ++		{
> ++		  ++__len;
> ++		  memset(&__state, 0, sizeof(mbstate_t));
> ++		  wchar_t* __wcs =3D new wchar_t[__len];
> ++		  mbsrtowcs(__wcs, &__ccurr, __len, &__state);
> ++		  _M_data->_M_curr_symbol =3D __wcs;
> ++		}
> ++	      else
> ++		_M_data->_M_curr_symbol =3D L"";
> ++	      _M_data->_M_curr_symbol_size =3D =
wcslen(_M_data->_M_curr_symbol);
> ++	    }
> ++	  catch (...)
> ++	    {
> ++	      delete _M_data;
> ++	      _M_data =3D 0;
> ++	      delete __wcs_ps;
> ++	      delete __wcs_ns;
> ++#ifdef __UCLIBC_HAS_XLOCALE__
> ++	      __uselocale(__old);
> ++#else
> ++	      setlocale(LC_ALL, __old);
> ++	      free(__old);
> ++#endif
> ++	      __throw_exception_again;
> ++	    }
> ++
> ++	  _M_data->_M_frac_digits =3D =
*(__nl_langinfo_l(__INT_FRAC_DIGITS,
> ++						      __cloc));
> ++	  char __pprecedes =3D *(__nl_langinfo_l(__INT_P_CS_PRECEDES, =
__cloc));
> ++	  char __pspace =3D *(__nl_langinfo_l(__INT_P_SEP_BY_SPACE, =
__cloc));
> ++	  char __pposn =3D *(__nl_langinfo_l(__INT_P_SIGN_POSN, =
__cloc));
> ++	  _M_data->_M_pos_format =3D _S_construct_pattern(__pprecedes, =
__pspace,
> ++							__pposn);
> ++	  char __nprecedes =3D *(__nl_langinfo_l(__INT_N_CS_PRECEDES, =
__cloc));
> ++	  char __nspace =3D *(__nl_langinfo_l(__INT_N_SEP_BY_SPACE, =
__cloc));
> ++	  _M_data->_M_neg_format =3D _S_construct_pattern(__nprecedes, =
__nspace,
> ++							__nposn);
> ++
> ++#ifdef __UCLIBC_HAS_XLOCALE__
> ++	  __uselocale(__old);
> ++#else
> ++	  setlocale(LC_ALL, __old);
> ++	  free(__old);
> ++#endif
> ++	}
> ++    }
> ++
> ++  template<>
> ++  void
> ++  moneypunct<wchar_t, false>::_M_initialize_moneypunct(__c_locale =
__cloc,
> ++#ifdef __UCLIBC_HAS_XLOCALE__
> ++						       const char*)
> ++#else
> ++                                                       const char* =
__name)
> ++#endif
> ++  {
> ++    if (!_M_data)
> ++      _M_data =3D new __moneypunct_cache<wchar_t, false>;
> ++
> ++    if (!__cloc)
> ++	{
> ++	  // "C" locale
> ++	  _M_data->_M_decimal_point =3D L'.';
> ++	  _M_data->_M_thousands_sep =3D L',';
> ++	  _M_data->_M_grouping =3D "";
> ++          _M_data->_M_grouping_size =3D 0;
> ++	  _M_data->_M_curr_symbol =3D L"";
> ++	  _M_data->_M_curr_symbol_size =3D 0;
> ++	  _M_data->_M_positive_sign =3D L"";
> ++	  _M_data->_M_positive_sign_size =3D 0;
> ++	  _M_data->_M_negative_sign =3D L"";
> ++	  _M_data->_M_negative_sign_size =3D 0;
> ++	  _M_data->_M_frac_digits =3D 0;
> ++	  _M_data->_M_pos_format =3D money_base::_S_default_pattern;
> ++	  _M_data->_M_neg_format =3D money_base::_S_default_pattern;
> ++
> ++	  // Use ctype::widen code without the facet...
> ++	  for (size_t __i =3D 0; __i < money_base::_S_end; ++__i)
> ++	    _M_data->_M_atoms[__i] =3D
> ++	      static_cast<wchar_t>(money_base::_S_atoms[__i]);
> ++	}
> ++      else
> ++	{
> ++	  // Named locale.
> ++#ifdef __UCLIBC_HAS_XLOCALE__
> ++	  __c_locale __old =3D __uselocale(__cloc);
> ++#else
> ++	  // Switch to named locale so that mbsrtowcs will work.
> ++	  char* __old =3D strdup(setlocale(LC_ALL, NULL));
> ++	  setlocale(LC_ALL, __name);
> ++#endif
> ++
> ++#ifdef __UCLIBC_MJN3_ONLY__
> ++#warning fix this... should be monetary
> ++#endif
> ++#ifdef __UCLIBC__
> ++# ifdef __UCLIBC_HAS_XLOCALE__
> ++	  _M_data->_M_decimal_point =3D __cloc->decimal_point_wc;
> ++	  _M_data->_M_thousands_sep =3D __cloc->thousands_sep_wc;
> ++# else
> ++	  _M_data->_M_decimal_point =3D =
__global_locale->decimal_point_wc;
> ++	  _M_data->_M_thousands_sep =3D =
__global_locale->thousands_sep_wc;
> ++# endif
> ++#else
> ++          union { char *__s; wchar_t __w; } __u;
> ++	  __u.__s =3D __nl_langinfo_l(_NL_MONETARY_DECIMAL_POINT_WC, =
__cloc);
> ++	  _M_data->_M_decimal_point =3D __u.__w;
> ++
> ++	  __u.__s =3D __nl_langinfo_l(_NL_MONETARY_THOUSANDS_SEP_WC, =
__cloc);
> ++	  _M_data->_M_thousands_sep =3D __u.__w;
> ++#endif
> ++	  _M_data->_M_grouping =3D __nl_langinfo_l(__MON_GROUPING, =
__cloc);
> ++          _M_data->_M_grouping_size =3D =
strlen(_M_data->_M_grouping);
> ++
> ++	  const char* __cpossign =3D __nl_langinfo_l(__POSITIVE_SIGN, =
__cloc);
> ++	  const char* __cnegsign =3D __nl_langinfo_l(__NEGATIVE_SIGN, =
__cloc);
> ++	  const char* __ccurr =3D __nl_langinfo_l(__CURRENCY_SYMBOL, =
__cloc);
> ++
> ++	  wchar_t* __wcs_ps =3D 0;
> ++	  wchar_t* __wcs_ns =3D 0;
> ++	  const char __nposn =3D *(__nl_langinfo_l(__N_SIGN_POSN, =
__cloc));
> ++	  try
> ++            {
> ++              mbstate_t __state;
> ++              size_t __len;
> ++              __len =3D strlen(__cpossign);
> ++              if (__len)
> ++                {
> ++		  ++__len;
> ++		  memset(&__state, 0, sizeof(mbstate_t));
> ++		  __wcs_ps =3D new wchar_t[__len];
> ++		  mbsrtowcs(__wcs_ps, &__cpossign, __len, &__state);
> ++		  _M_data->_M_positive_sign =3D __wcs_ps;
> ++		}
> ++	      else
> ++		_M_data->_M_positive_sign =3D L"";
> ++              _M_data->_M_positive_sign_size =3D =
wcslen(_M_data->_M_positive_sign);
> ++
> ++	      __len =3D strlen(__cnegsign);
> ++	      if (!__nposn)
> ++		_M_data->_M_negative_sign =3D L"()";
> ++	      else if (__len)
> ++		{
> ++		  ++__len;
> ++		  memset(&__state, 0, sizeof(mbstate_t));
> ++		  __wcs_ns =3D new wchar_t[__len];
> ++		  mbsrtowcs(__wcs_ns, &__cnegsign, __len, &__state);
> ++		  _M_data->_M_negative_sign =3D __wcs_ns;
> ++		}
> ++	      else
> ++		_M_data->_M_negative_sign =3D L"";
> ++              _M_data->_M_negative_sign_size =3D =
wcslen(_M_data->_M_negative_sign);
> ++
> ++	      // _Intl =3D=3D true.
> ++	      __len =3D strlen(__ccurr);
> ++	      if (__len)
> ++		{
> ++		  ++__len;
> ++		  memset(&__state, 0, sizeof(mbstate_t));
> ++		  wchar_t* __wcs =3D new wchar_t[__len];
> ++		  mbsrtowcs(__wcs, &__ccurr, __len, &__state);
> ++		  _M_data->_M_curr_symbol =3D __wcs;
> ++		}
> ++	      else
> ++		_M_data->_M_curr_symbol =3D L"";
> ++              _M_data->_M_curr_symbol_size =3D =
wcslen(_M_data->_M_curr_symbol);
> ++	    }
> ++          catch (...)
> ++	    {
> ++	      delete _M_data;
> ++              _M_data =3D 0;
> ++	      delete __wcs_ps;
> ++	      delete __wcs_ns;
> ++#ifdef __UCLIBC_HAS_XLOCALE__
> ++	      __uselocale(__old);
> ++#else
> ++	      setlocale(LC_ALL, __old);
> ++	      free(__old);
> ++#endif
> ++              __throw_exception_again;
> ++	    }
> ++
> ++	  _M_data->_M_frac_digits =3D *(__nl_langinfo_l(__FRAC_DIGITS, =
__cloc));
> ++	  char __pprecedes =3D *(__nl_langinfo_l(__P_CS_PRECEDES, =
__cloc));
> ++	  char __pspace =3D *(__nl_langinfo_l(__P_SEP_BY_SPACE, =
__cloc));
> ++	  char __pposn =3D *(__nl_langinfo_l(__P_SIGN_POSN, __cloc));
> ++	  _M_data->_M_pos_format =3D _S_construct_pattern(__pprecedes, =
__pspace,
> ++	                                                __pposn);
> ++	  char __nprecedes =3D *(__nl_langinfo_l(__N_CS_PRECEDES, =
__cloc));
> ++	  char __nspace =3D *(__nl_langinfo_l(__N_SEP_BY_SPACE, =
__cloc));
> ++	  _M_data->_M_neg_format =3D _S_construct_pattern(__nprecedes, =
__nspace,
> ++	                                                __nposn);
> ++
> ++#ifdef __UCLIBC_HAS_XLOCALE__
> ++	  __uselocale(__old);
> ++#else
> ++	  setlocale(LC_ALL, __old);
> ++	  free(__old);
> ++#endif
> ++	}
> ++    }
> ++
> ++  template<>
> ++    moneypunct<wchar_t, true>::~moneypunct()
> ++    {
> ++      if (_M_data->_M_positive_sign_size)
> ++	delete [] _M_data->_M_positive_sign;
> ++      if (_M_data->_M_negative_sign_size
> ++          && wcscmp(_M_data->_M_negative_sign, L"()") !=3D 0)
> ++	delete [] _M_data->_M_negative_sign;
> ++      if (_M_data->_M_curr_symbol_size)
> ++	delete [] _M_data->_M_curr_symbol;
> ++      delete _M_data;
> ++    }
> ++
> ++  template<>
> ++    moneypunct<wchar_t, false>::~moneypunct()
> ++    {
> ++      if (_M_data->_M_positive_sign_size)
> ++	delete [] _M_data->_M_positive_sign;
> ++      if (_M_data->_M_negative_sign_size
> ++          && wcscmp(_M_data->_M_negative_sign, L"()") !=3D 0)
> ++	delete [] _M_data->_M_negative_sign;
> ++      if (_M_data->_M_curr_symbol_size)
> ++	delete [] _M_data->_M_curr_symbol;
> ++      delete _M_data;
> ++    }
> ++#endif
> ++}
> +diff --git a/libstdc++-v3/config/locale/uclibc/numeric_members.cc =
b/libstdc++-v3/config/locale/uclibc/numeric_members.cc
> +new file mode 100644
> +index 0000000..883ec1a
> +--- /dev/null
> ++++ b/libstdc++-v3/config/locale/uclibc/numeric_members.cc
> +@@ -0,0 +1,160 @@
> ++// std::numpunct implementation details, GNU version -*- C++ -*-
> ++
> ++// Copyright (C) 2001, 2002, 2003, 2004 Free Software Foundation, =
Inc.
> ++//
> ++// This file is part of the GNU ISO C++ Library.  This library is =
free
> ++// software; you can redistribute it and/or modify it under the
> ++// terms of the GNU General Public License as published by the
> ++// Free Software Foundation; either version 2, or (at your option)
> ++// any later version.
> ++
> ++// This library is distributed in the hope that it will be useful,
> ++// but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> ++// GNU General Public License for more details.
> ++
> ++// You should have received a copy of the GNU General Public License =
along
> ++// with this library; see the file COPYING.  If not, write to the =
Free
> ++// Software Foundation, 59 Temple Place - Suite 330, Boston, MA =
02111-1307,
> ++// USA.
> ++
> ++// As a special exception, you may use this file as part of a free =
software
> ++// library without restriction.  Specifically, if other files =
instantiate
> ++// templates or use macros or inline functions from this file, or =
you compile
> ++// this file and link it with other files to produce an executable, =
this
> ++// file does not by itself cause the resulting executable to be =
covered by
> ++// the GNU General Public License.  This exception does not however
> ++// invalidate any other reasons why the executable file might be =
covered by
> ++// the GNU General Public License.
> ++
> ++//
> ++// ISO C++ 14882: 22.2.3.1.2  numpunct virtual functions
> ++//
> ++
> ++// Written by Benjamin Kosnik <bkoz@redhat.com>
> ++
> ++#define _LIBC
> ++#include <locale>
> ++#undef _LIBC
> ++#include <bits/c++locale_internal.h>
> ++
> ++#ifdef __UCLIBC_MJN3_ONLY__
> ++#warning tailor for stub locale support
> ++#endif
> ++#ifndef __UCLIBC_HAS_XLOCALE__
> ++#define __nl_langinfo_l(N, L)         nl_langinfo((N))
> ++#endif
> ++
> ++namespace std
> ++{
> ++  template<>
> ++    void
> ++    numpunct<char>::_M_initialize_numpunct(__c_locale __cloc)
> ++    {
> ++      if (!_M_data)
> ++	_M_data =3D new __numpunct_cache<char>;
> ++
> ++      if (!__cloc)
> ++	{
> ++	  // "C" locale
> ++	  _M_data->_M_grouping =3D "";
> ++	  _M_data->_M_grouping_size =3D 0;
> ++	  _M_data->_M_use_grouping =3D false;
> ++
> ++	  _M_data->_M_decimal_point =3D '.';
> ++	  _M_data->_M_thousands_sep =3D ',';
> ++
> ++	  for (size_t __i =3D 0; __i < __num_base::_S_oend; ++__i)
> ++	    _M_data->_M_atoms_out[__i] =3D =
__num_base::_S_atoms_out[__i];
> ++
> ++	  for (size_t __j =3D 0; __j < __num_base::_S_iend; ++__j)
> ++	    _M_data->_M_atoms_in[__j] =3D __num_base::_S_atoms_in[__j];
> ++	}
> ++      else
> ++	{
> ++	  // Named locale.
> ++	  _M_data->_M_decimal_point =3D *(__nl_langinfo_l(DECIMAL_POINT,
> ++							__cloc));
> ++	  _M_data->_M_thousands_sep =3D *(__nl_langinfo_l(THOUSANDS_SEP,
> ++							__cloc));
> ++
> ++	  // Check for NULL, which implies no grouping.
> ++	  if (_M_data->_M_thousands_sep =3D=3D '\0')
> ++	    _M_data->_M_grouping =3D "";
> ++	  else
> ++	    _M_data->_M_grouping =3D __nl_langinfo_l(GROUPING, __cloc);
> ++	  _M_data->_M_grouping_size =3D strlen(_M_data->_M_grouping);
> ++	}
> ++
> ++      // NB: There is no way to extact this info from posix locales.
> ++      // _M_truename =3D __nl_langinfo_l(YESSTR, __cloc);
> ++      _M_data->_M_truename =3D "true";
> ++      _M_data->_M_truename_size =3D 4;
> ++      // _M_falsename =3D __nl_langinfo_l(NOSTR, __cloc);
> ++      _M_data->_M_falsename =3D "false";
> ++      _M_data->_M_falsename_size =3D 5;
> ++    }
> ++
> ++  template<>
> ++    numpunct<char>::~numpunct()
> ++    { delete _M_data; }
> ++
> ++#ifdef _GLIBCXX_USE_WCHAR_T
> ++  template<>
> ++    void
> ++    numpunct<wchar_t>::_M_initialize_numpunct(__c_locale __cloc)
> ++    {
> ++      if (!_M_data)
> ++	_M_data =3D new __numpunct_cache<wchar_t>;
> ++
> ++      if (!__cloc)
> ++	{
> ++	  // "C" locale
> ++	  _M_data->_M_grouping =3D "";
> ++	  _M_data->_M_grouping_size =3D 0;
> ++	  _M_data->_M_use_grouping =3D false;
> ++
> ++	  _M_data->_M_decimal_point =3D L'.';
> ++	  _M_data->_M_thousands_sep =3D L',';
> ++
> ++	  // Use ctype::widen code without the facet...
> ++	  for (size_t __i =3D 0; __i < __num_base::_S_oend; ++__i)
> ++	    _M_data->_M_atoms_out[__i] =3D
> ++	      static_cast<wchar_t>(__num_base::_S_atoms_out[__i]);
> ++
> ++	  for (size_t __j =3D 0; __j < __num_base::_S_iend; ++__j)
> ++	    _M_data->_M_atoms_in[__j] =3D
> ++	      static_cast<wchar_t>(__num_base::_S_atoms_in[__j]);
> ++	}
> ++      else
> ++	{
> ++	  // Named locale.
> ++	  // NB: In the GNU model wchar_t is always 32 bit wide.
> ++	  union { char *__s; wchar_t __w; } __u;
> ++	  __u.__s =3D __nl_langinfo_l(_NL_NUMERIC_DECIMAL_POINT_WC, =
__cloc);
> ++	  _M_data->_M_decimal_point =3D __u.__w;
> ++
> ++	  __u.__s =3D __nl_langinfo_l(_NL_NUMERIC_THOUSANDS_SEP_WC, =
__cloc);
> ++	  _M_data->_M_thousands_sep =3D __u.__w;
> ++
> ++	  if (_M_data->_M_thousands_sep =3D=3D L'\0')
> ++	    _M_data->_M_grouping =3D "";
> ++	  else
> ++	    _M_data->_M_grouping =3D __nl_langinfo_l(GROUPING, __cloc);
> ++	  _M_data->_M_grouping_size =3D strlen(_M_data->_M_grouping);
> ++	}
> ++
> ++      // NB: There is no way to extact this info from posix locales.
> ++      // _M_truename =3D __nl_langinfo_l(YESSTR, __cloc);
> ++      _M_data->_M_truename =3D L"true";
> ++      _M_data->_M_truename_size =3D 4;
> ++      // _M_falsename =3D __nl_langinfo_l(NOSTR, __cloc);
> ++      _M_data->_M_falsename =3D L"false";
> ++      _M_data->_M_falsename_size =3D 5;
> ++    }
> ++
> ++  template<>
> ++    numpunct<wchar_t>::~numpunct()
> ++    { delete _M_data; }
> ++ #endif
> ++}
> +diff --git a/libstdc++-v3/config/locale/uclibc/time_members.cc =
b/libstdc++-v3/config/locale/uclibc/time_members.cc
> +new file mode 100644
> +index 0000000..e0707d7
> +--- /dev/null
> ++++ b/libstdc++-v3/config/locale/uclibc/time_members.cc
> +@@ -0,0 +1,406 @@
> ++// std::time_get, std::time_put implementation, GNU version -*- C++ =
-*-
> ++
> ++// Copyright (C) 2001, 2002, 2003, 2004 Free Software Foundation, =
Inc.
> ++//
> ++// This file is part of the GNU ISO C++ Library.  This library is =
free
> ++// software; you can redistribute it and/or modify it under the
> ++// terms of the GNU General Public License as published by the
> ++// Free Software Foundation; either version 2, or (at your option)
> ++// any later version.
> ++
> ++// This library is distributed in the hope that it will be useful,
> ++// but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> ++// GNU General Public License for more details.
> ++
> ++// You should have received a copy of the GNU General Public License =
along
> ++// with this library; see the file COPYING.  If not, write to the =
Free
> ++// Software Foundation, 59 Temple Place - Suite 330, Boston, MA =
02111-1307,
> ++// USA.
> ++
> ++// As a special exception, you may use this file as part of a free =
software
> ++// library without restriction.  Specifically, if other files =
instantiate
> ++// templates or use macros or inline functions from this file, or =
you compile
> ++// this file and link it with other files to produce an executable, =
this
> ++// file does not by itself cause the resulting executable to be =
covered by
> ++// the GNU General Public License.  This exception does not however
> ++// invalidate any other reasons why the executable file might be =
covered by
> ++// the GNU General Public License.
> ++
> ++//
> ++// ISO C++ 14882: 22.2.5.1.2 - time_get virtual functions
> ++// ISO C++ 14882: 22.2.5.3.2 - time_put virtual functions
> ++//
> ++
> ++// Written by Benjamin Kosnik <bkoz@redhat.com>
> ++
> ++#include <locale>
> ++#include <bits/c++locale_internal.h>
> ++
> ++#ifdef __UCLIBC_MJN3_ONLY__
> ++#warning tailor for stub locale support
> ++#endif
> ++#ifndef __UCLIBC_HAS_XLOCALE__
> ++#define __nl_langinfo_l(N, L)         nl_langinfo((N))
> ++#endif
> ++
> ++namespace std
> ++{
> ++  template<>
> ++    void
> ++    __timepunct<char>::
> ++    _M_put(char* __s, size_t __maxlen, const char* __format,
> ++	   const tm* __tm) const
> ++    {
> ++#ifdef __UCLIBC_HAS_XLOCALE__
> ++      const size_t __len =3D __strftime_l(__s, __maxlen, __format, =
__tm,
> ++					_M_c_locale_timepunct);
> ++#else
> ++      char* __old =3D strdup(setlocale(LC_ALL, NULL));
> ++      setlocale(LC_ALL, _M_name_timepunct);
> ++      const size_t __len =3D strftime(__s, __maxlen, __format, =
__tm);
> ++      setlocale(LC_ALL, __old);
> ++      free(__old);
> ++#endif
> ++      // Make sure __s is null terminated.
> ++      if (__len =3D=3D 0)
> ++	__s[0] =3D '\0';
> ++    }
> ++
> ++  template<>
> ++    void
> ++    __timepunct<char>::_M_initialize_timepunct(__c_locale __cloc)
> ++    {
> ++      if (!_M_data)
> ++	_M_data =3D new __timepunct_cache<char>;
> ++
> ++      if (!__cloc)
> ++	{
> ++	  // "C" locale
> ++	  _M_c_locale_timepunct =3D _S_get_c_locale();
> ++
> ++	  _M_data->_M_date_format =3D "%m/%d/%y";
> ++	  _M_data->_M_date_era_format =3D "%m/%d/%y";
> ++	  _M_data->_M_time_format =3D "%H:%M:%S";
> ++	  _M_data->_M_time_era_format =3D "%H:%M:%S";
> ++	  _M_data->_M_date_time_format =3D "";
> ++	  _M_data->_M_date_time_era_format =3D "";
> ++	  _M_data->_M_am =3D "AM";
> ++	  _M_data->_M_pm =3D "PM";
> ++	  _M_data->_M_am_pm_format =3D "";
> ++
> ++	  // Day names, starting with "C"'s Sunday.
> ++	  _M_data->_M_day1 =3D "Sunday";
> ++	  _M_data->_M_day2 =3D "Monday";
> ++	  _M_data->_M_day3 =3D "Tuesday";
> ++	  _M_data->_M_day4 =3D "Wednesday";
> ++	  _M_data->_M_day5 =3D "Thursday";
> ++	  _M_data->_M_day6 =3D "Friday";
> ++	  _M_data->_M_day7 =3D "Saturday";
> ++
> ++	  // Abbreviated day names, starting with "C"'s Sun.
> ++	  _M_data->_M_aday1 =3D "Sun";
> ++	  _M_data->_M_aday2 =3D "Mon";
> ++	  _M_data->_M_aday3 =3D "Tue";
> ++	  _M_data->_M_aday4 =3D "Wed";
> ++	  _M_data->_M_aday5 =3D "Thu";
> ++	  _M_data->_M_aday6 =3D "Fri";
> ++	  _M_data->_M_aday7 =3D "Sat";
> ++
> ++	  // Month names, starting with "C"'s January.
> ++	  _M_data->_M_month01 =3D "January";
> ++	  _M_data->_M_month02 =3D "February";
> ++	  _M_data->_M_month03 =3D "March";
> ++	  _M_data->_M_month04 =3D "April";
> ++	  _M_data->_M_month05 =3D "May";
> ++	  _M_data->_M_month06 =3D "June";
> ++	  _M_data->_M_month07 =3D "July";
> ++	  _M_data->_M_month08 =3D "August";
> ++	  _M_data->_M_month09 =3D "September";
> ++	  _M_data->_M_month10 =3D "October";
> ++	  _M_data->_M_month11 =3D "November";
> ++	  _M_data->_M_month12 =3D "December";
> ++
> ++	  // Abbreviated month names, starting with "C"'s Jan.
> ++	  _M_data->_M_amonth01 =3D "Jan";
> ++	  _M_data->_M_amonth02 =3D "Feb";
> ++	  _M_data->_M_amonth03 =3D "Mar";
> ++	  _M_data->_M_amonth04 =3D "Apr";
> ++	  _M_data->_M_amonth05 =3D "May";
> ++	  _M_data->_M_amonth06 =3D "Jun";
> ++	  _M_data->_M_amonth07 =3D "Jul";
> ++	  _M_data->_M_amonth08 =3D "Aug";
> ++	  _M_data->_M_amonth09 =3D "Sep";
> ++	  _M_data->_M_amonth10 =3D "Oct";
> ++	  _M_data->_M_amonth11 =3D "Nov";
> ++	  _M_data->_M_amonth12 =3D "Dec";
> ++	}
> ++      else
> ++	{
> ++	  _M_c_locale_timepunct =3D _S_clone_c_locale(__cloc);
> ++
> ++	  _M_data->_M_date_format =3D __nl_langinfo_l(D_FMT, __cloc);
> ++	  _M_data->_M_date_era_format =3D __nl_langinfo_l(ERA_D_FMT, =
__cloc);
> ++	  _M_data->_M_time_format =3D __nl_langinfo_l(T_FMT, __cloc);
> ++	  _M_data->_M_time_era_format =3D __nl_langinfo_l(ERA_T_FMT, =
__cloc);
> ++	  _M_data->_M_date_time_format =3D __nl_langinfo_l(D_T_FMT, =
__cloc);
> ++	  _M_data->_M_date_time_era_format =3D =
__nl_langinfo_l(ERA_D_T_FMT,
> ++							     __cloc);
> ++	  _M_data->_M_am =3D __nl_langinfo_l(AM_STR, __cloc);
> ++	  _M_data->_M_pm =3D __nl_langinfo_l(PM_STR, __cloc);
> ++	  _M_data->_M_am_pm_format =3D __nl_langinfo_l(T_FMT_AMPM, =
__cloc);
> ++
> ++	  // Day names, starting with "C"'s Sunday.
> ++	  _M_data->_M_day1 =3D __nl_langinfo_l(DAY_1, __cloc);
> ++	  _M_data->_M_day2 =3D __nl_langinfo_l(DAY_2, __cloc);
> ++	  _M_data->_M_day3 =3D __nl_langinfo_l(DAY_3, __cloc);
> ++	  _M_data->_M_day4 =3D __nl_langinfo_l(DAY_4, __cloc);
> ++	  _M_data->_M_day5 =3D __nl_langinfo_l(DAY_5, __cloc);
> ++	  _M_data->_M_day6 =3D __nl_langinfo_l(DAY_6, __cloc);
> ++	  _M_data->_M_day7 =3D __nl_langinfo_l(DAY_7, __cloc);
> ++
> ++	  // Abbreviated day names, starting with "C"'s Sun.
> ++	  _M_data->_M_aday1 =3D __nl_langinfo_l(ABDAY_1, __cloc);
> ++	  _M_data->_M_aday2 =3D __nl_langinfo_l(ABDAY_2, __cloc);
> ++	  _M_data->_M_aday3 =3D __nl_langinfo_l(ABDAY_3, __cloc);
> ++	  _M_data->_M_aday4 =3D __nl_langinfo_l(ABDAY_4, __cloc);
> ++	  _M_data->_M_aday5 =3D __nl_langinfo_l(ABDAY_5, __cloc);
> ++	  _M_data->_M_aday6 =3D __nl_langinfo_l(ABDAY_6, __cloc);
> ++	  _M_data->_M_aday7 =3D __nl_langinfo_l(ABDAY_7, __cloc);
> ++
> ++	  // Month names, starting with "C"'s January.
> ++	  _M_data->_M_month01 =3D __nl_langinfo_l(MON_1, __cloc);
> ++	  _M_data->_M_month02 =3D __nl_langinfo_l(MON_2, __cloc);
> ++	  _M_data->_M_month03 =3D __nl_langinfo_l(MON_3, __cloc);
> ++	  _M_data->_M_month04 =3D __nl_langinfo_l(MON_4, __cloc);
> ++	  _M_data->_M_month05 =3D __nl_langinfo_l(MON_5, __cloc);
> ++	  _M_data->_M_month06 =3D __nl_langinfo_l(MON_6, __cloc);
> ++	  _M_data->_M_month07 =3D __nl_langinfo_l(MON_7, __cloc);
> ++	  _M_data->_M_month08 =3D __nl_langinfo_l(MON_8, __cloc);
> ++	  _M_data->_M_month09 =3D __nl_langinfo_l(MON_9, __cloc);
> ++	  _M_data->_M_month10 =3D __nl_langinfo_l(MON_10, __cloc);
> ++	  _M_data->_M_month11 =3D __nl_langinfo_l(MON_11, __cloc);
> ++	  _M_data->_M_month12 =3D __nl_langinfo_l(MON_12, __cloc);
> ++
> ++	  // Abbreviated month names, starting with "C"'s Jan.
> ++	  _M_data->_M_amonth01 =3D __nl_langinfo_l(ABMON_1, __cloc);
> ++	  _M_data->_M_amonth02 =3D __nl_langinfo_l(ABMON_2, __cloc);
> ++	  _M_data->_M_amonth03 =3D __nl_langinfo_l(ABMON_3, __cloc);
> ++	  _M_data->_M_amonth04 =3D __nl_langinfo_l(ABMON_4, __cloc);
> ++	  _M_data->_M_amonth05 =3D __nl_langinfo_l(ABMON_5, __cloc);
> ++	  _M_data->_M_amonth06 =3D __nl_langinfo_l(ABMON_6, __cloc);
> ++	  _M_data->_M_amonth07 =3D __nl_langinfo_l(ABMON_7, __cloc);
> ++	  _M_data->_M_amonth08 =3D __nl_langinfo_l(ABMON_8, __cloc);
> ++	  _M_data->_M_amonth09 =3D __nl_langinfo_l(ABMON_9, __cloc);
> ++	  _M_data->_M_amonth10 =3D __nl_langinfo_l(ABMON_10, __cloc);
> ++	  _M_data->_M_amonth11 =3D __nl_langinfo_l(ABMON_11, __cloc);
> ++	  _M_data->_M_amonth12 =3D __nl_langinfo_l(ABMON_12, __cloc);
> ++	}
> ++    }
> ++
> ++#ifdef _GLIBCXX_USE_WCHAR_T
> ++  template<>
> ++    void
> ++    __timepunct<wchar_t>::
> ++    _M_put(wchar_t* __s, size_t __maxlen, const wchar_t* __format,
> ++	   const tm* __tm) const
> ++    {
> ++#ifdef __UCLIBC_HAS_XLOCALE__
> ++      __wcsftime_l(__s, __maxlen, __format, __tm, =
_M_c_locale_timepunct);
> ++      const size_t __len =3D __wcsftime_l(__s, __maxlen, __format, =
__tm,
> ++					_M_c_locale_timepunct);
> ++#else
> ++      char* __old =3D strdup(setlocale(LC_ALL, NULL));
> ++      setlocale(LC_ALL, _M_name_timepunct);
> ++      const size_t __len =3D wcsftime(__s, __maxlen, __format, =
__tm);
> ++      setlocale(LC_ALL, __old);
> ++      free(__old);
> ++#endif
> ++      // Make sure __s is null terminated.
> ++      if (__len =3D=3D 0)
> ++	__s[0] =3D L'\0';
> ++    }
> ++
> ++  template<>
> ++    void
> ++    __timepunct<wchar_t>::_M_initialize_timepunct(__c_locale __cloc)
> ++    {
> ++      if (!_M_data)
> ++	_M_data =3D new __timepunct_cache<wchar_t>;
> ++
> ++#warning wide time stuff
> ++//       if (!__cloc)
> ++	{
> ++	  // "C" locale
> ++	  _M_c_locale_timepunct =3D _S_get_c_locale();
> ++
> ++	  _M_data->_M_date_format =3D L"%m/%d/%y";
> ++	  _M_data->_M_date_era_format =3D L"%m/%d/%y";
> ++	  _M_data->_M_time_format =3D L"%H:%M:%S";
> ++	  _M_data->_M_time_era_format =3D L"%H:%M:%S";
> ++	  _M_data->_M_date_time_format =3D L"";
> ++	  _M_data->_M_date_time_era_format =3D L"";
> ++	  _M_data->_M_am =3D L"AM";
> ++	  _M_data->_M_pm =3D L"PM";
> ++	  _M_data->_M_am_pm_format =3D L"";
> ++
> ++	  // Day names, starting with "C"'s Sunday.
> ++	  _M_data->_M_day1 =3D L"Sunday";
> ++	  _M_data->_M_day2 =3D L"Monday";
> ++	  _M_data->_M_day3 =3D L"Tuesday";
> ++	  _M_data->_M_day4 =3D L"Wednesday";
> ++	  _M_data->_M_day5 =3D L"Thursday";
> ++	  _M_data->_M_day6 =3D L"Friday";
> ++	  _M_data->_M_day7 =3D L"Saturday";
> ++
> ++	  // Abbreviated day names, starting with "C"'s Sun.
> ++	  _M_data->_M_aday1 =3D L"Sun";
> ++	  _M_data->_M_aday2 =3D L"Mon";
> ++	  _M_data->_M_aday3 =3D L"Tue";
> ++	  _M_data->_M_aday4 =3D L"Wed";
> ++	  _M_data->_M_aday5 =3D L"Thu";
> ++	  _M_data->_M_aday6 =3D L"Fri";
> ++	  _M_data->_M_aday7 =3D L"Sat";
> ++
> ++	  // Month names, starting with "C"'s January.
> ++	  _M_data->_M_month01 =3D L"January";
> ++	  _M_data->_M_month02 =3D L"February";
> ++	  _M_data->_M_month03 =3D L"March";
> ++	  _M_data->_M_month04 =3D L"April";
> ++	  _M_data->_M_month05 =3D L"May";
> ++	  _M_data->_M_month06 =3D L"June";
> ++	  _M_data->_M_month07 =3D L"July";
> ++	  _M_data->_M_month08 =3D L"August";
> ++	  _M_data->_M_month09 =3D L"September";
> ++	  _M_data->_M_month10 =3D L"October";
> ++	  _M_data->_M_month11 =3D L"November";
> ++	  _M_data->_M_month12 =3D L"December";
> ++
> ++	  // Abbreviated month names, starting with "C"'s Jan.
> ++	  _M_data->_M_amonth01 =3D L"Jan";
> ++	  _M_data->_M_amonth02 =3D L"Feb";
> ++	  _M_data->_M_amonth03 =3D L"Mar";
> ++	  _M_data->_M_amonth04 =3D L"Apr";
> ++	  _M_data->_M_amonth05 =3D L"May";
> ++	  _M_data->_M_amonth06 =3D L"Jun";
> ++	  _M_data->_M_amonth07 =3D L"Jul";
> ++	  _M_data->_M_amonth08 =3D L"Aug";
> ++	  _M_data->_M_amonth09 =3D L"Sep";
> ++	  _M_data->_M_amonth10 =3D L"Oct";
> ++	  _M_data->_M_amonth11 =3D L"Nov";
> ++	  _M_data->_M_amonth12 =3D L"Dec";
> ++	}
> ++#if 0
> ++      else
> ++	{
> ++	  _M_c_locale_timepunct =3D _S_clone_c_locale(__cloc);
> ++
> ++	  union { char *__s; wchar_t *__w; } __u;
> ++
> ++	  __u.__s =3D __nl_langinfo_l(_NL_WD_FMT, __cloc);
> ++	  _M_data->_M_date_format =3D __u.__w;
> ++	  __u.__s =3D __nl_langinfo_l(_NL_WERA_D_FMT, __cloc);
> ++	  _M_data->_M_date_era_format =3D __u.__w;
> ++	  __u.__s =3D __nl_langinfo_l(_NL_WT_FMT, __cloc);
> ++	  _M_data->_M_time_format =3D __u.__w;
> ++	  __u.__s =3D __nl_langinfo_l(_NL_WERA_T_FMT, __cloc);
> ++	  _M_data->_M_time_era_format =3D __u.__w;
> ++	  __u.__s =3D __nl_langinfo_l(_NL_WD_T_FMT, __cloc);
> ++	  _M_data->_M_date_time_format =3D __u.__w;
> ++	  __u.__s =3D __nl_langinfo_l(_NL_WERA_D_T_FMT, __cloc);
> ++	  _M_data->_M_date_time_era_format =3D __u.__w;
> ++	  __u.__s =3D __nl_langinfo_l(_NL_WAM_STR, __cloc);
> ++	  _M_data->_M_am =3D __u.__w;
> ++	  __u.__s =3D __nl_langinfo_l(_NL_WPM_STR, __cloc);
> ++	  _M_data->_M_pm =3D __u.__w;
> ++	  __u.__s =3D __nl_langinfo_l(_NL_WT_FMT_AMPM, __cloc);
> ++	  _M_data->_M_am_pm_format =3D __u.__w;
> ++
> ++	  // Day names, starting with "C"'s Sunday.
> ++	  __u.__s =3D __nl_langinfo_l(_NL_WDAY_1, __cloc);
> ++	  _M_data->_M_day1 =3D __u.__w;
> ++	  __u.__s =3D __nl_langinfo_l(_NL_WDAY_2, __cloc);
> ++	  _M_data->_M_day2 =3D __u.__w;
> ++	  __u.__s =3D __nl_langinfo_l(_NL_WDAY_3, __cloc);
> ++	  _M_data->_M_day3 =3D __u.__w;
> ++	  __u.__s =3D __nl_langinfo_l(_NL_WDAY_4, __cloc);
> ++	  _M_data->_M_day4 =3D __u.__w;
> ++	  __u.__s =3D __nl_langinfo_l(_NL_WDAY_5, __cloc);
> ++	  _M_data->_M_day5 =3D __u.__w;
> ++	  __u.__s =3D __nl_langinfo_l(_NL_WDAY_6, __cloc);
> ++	  _M_data->_M_day6 =3D __u.__w;
> ++	  __u.__s =3D __nl_langinfo_l(_NL_WDAY_7, __cloc);
> ++	  _M_data->_M_day7 =3D __u.__w;
> ++
> ++	  // Abbreviated day names, starting with "C"'s Sun.
> ++	  __u.__s =3D __nl_langinfo_l(_NL_WABDAY_1, __cloc);
> ++	  _M_data->_M_aday1 =3D __u.__w;
> ++	  __u.__s =3D __nl_langinfo_l(_NL_WABDAY_2, __cloc);
> ++	  _M_data->_M_aday2 =3D __u.__w;
> ++	  __u.__s =3D __nl_langinfo_l(_NL_WABDAY_3, __cloc);
> ++	  _M_data->_M_aday3 =3D __u.__w;
> ++	  __u.__s =3D __nl_langinfo_l(_NL_WABDAY_4, __cloc);
> ++	  _M_data->_M_aday4 =3D __u.__w;
> ++	  __u.__s =3D __nl_langinfo_l(_NL_WABDAY_5, __cloc);
> ++	  _M_data->_M_aday5 =3D __u.__w;
> ++	  __u.__s =3D __nl_langinfo_l(_NL_WABDAY_6, __cloc);
> ++	  _M_data->_M_aday6 =3D __u.__w;
> ++	  __u.__s =3D __nl_langinfo_l(_NL_WABDAY_7, __cloc);
> ++	  _M_data->_M_aday7 =3D __u.__w;
> ++
> ++	  // Month names, starting with "C"'s January.
> ++	  __u.__s =3D __nl_langinfo_l(_NL_WMON_1, __cloc);
> ++	  _M_data->_M_month01 =3D __u.__w;
> ++	  __u.__s =3D __nl_langinfo_l(_NL_WMON_2, __cloc);
> ++	  _M_data->_M_month02 =3D __u.__w;
> ++	  __u.__s =3D __nl_langinfo_l(_NL_WMON_3, __cloc);
> ++	  _M_data->_M_month03 =3D __u.__w;
> ++	  __u.__s =3D __nl_langinfo_l(_NL_WMON_4, __cloc);
> ++	  _M_data->_M_month04 =3D __u.__w;
> ++	  __u.__s =3D __nl_langinfo_l(_NL_WMON_5, __cloc);
> ++	  _M_data->_M_month05 =3D __u.__w;
> ++	  __u.__s =3D __nl_langinfo_l(_NL_WMON_6, __cloc);
> ++	  _M_data->_M_month06 =3D __u.__w;
> ++	  __u.__s =3D __nl_langinfo_l(_NL_WMON_7, __cloc);
> ++	  _M_data->_M_month07 =3D __u.__w;
> ++	  __u.__s =3D __nl_langinfo_l(_NL_WMON_8, __cloc);
> ++	  _M_data->_M_month08 =3D __u.__w;
> ++	  __u.__s =3D __nl_langinfo_l(_NL_WMON_9, __cloc);
> ++	  _M_data->_M_month09 =3D __u.__w;
> ++	  __u.__s =3D __nl_langinfo_l(_NL_WMON_10, __cloc);
> ++	  _M_data->_M_month10 =3D __u.__w;
> ++	  __u.__s =3D __nl_langinfo_l(_NL_WMON_11, __cloc);
> ++	  _M_data->_M_month11 =3D __u.__w;
> ++	  __u.__s =3D __nl_langinfo_l(_NL_WMON_12, __cloc);
> ++	  _M_data->_M_month12 =3D __u.__w;
> ++
> ++	  // Abbreviated month names, starting with "C"'s Jan.
> ++	  __u.__s =3D __nl_langinfo_l(_NL_WABMON_1, __cloc);
> ++	  _M_data->_M_amonth01 =3D __u.__w;
> ++	  __u.__s =3D __nl_langinfo_l(_NL_WABMON_2, __cloc);
> ++	  _M_data->_M_amonth02 =3D __u.__w;
> ++	  __u.__s =3D __nl_langinfo_l(_NL_WABMON_3, __cloc);
> ++	  _M_data->_M_amonth03 =3D __u.__w;
> ++	  __u.__s =3D __nl_langinfo_l(_NL_WABMON_4, __cloc);
> ++	  _M_data->_M_amonth04 =3D __u.__w;
> ++	  __u.__s =3D __nl_langinfo_l(_NL_WABMON_5, __cloc);
> ++	  _M_data->_M_amonth05 =3D __u.__w;
> ++	  __u.__s =3D __nl_langinfo_l(_NL_WABMON_6, __cloc);
> ++	  _M_data->_M_amonth06 =3D __u.__w;
> ++	  __u.__s =3D __nl_langinfo_l(_NL_WABMON_7, __cloc);
> ++	  _M_data->_M_amonth07 =3D __u.__w;
> ++	  __u.__s =3D __nl_langinfo_l(_NL_WABMON_8, __cloc);
> ++	  _M_data->_M_amonth08 =3D __u.__w;
> ++	  __u.__s =3D __nl_langinfo_l(_NL_WABMON_9, __cloc);
> ++	  _M_data->_M_amonth09 =3D __u.__w;
> ++	  __u.__s =3D __nl_langinfo_l(_NL_WABMON_10, __cloc);
> ++	  _M_data->_M_amonth10 =3D __u.__w;
> ++	  __u.__s =3D __nl_langinfo_l(_NL_WABMON_11, __cloc);
> ++	  _M_data->_M_amonth11 =3D __u.__w;
> ++	  __u.__s =3D __nl_langinfo_l(_NL_WABMON_12, __cloc);
> ++	  _M_data->_M_amonth12 =3D __u.__w;
> ++	}
> ++#endif // 0
> ++    }
> ++#endif
> ++}
> +diff --git a/libstdc++-v3/config/locale/uclibc/time_members.h =
b/libstdc++-v3/config/locale/uclibc/time_members.h
> +new file mode 100644
> +index 0000000..ba8e858
> +--- /dev/null
> ++++ b/libstdc++-v3/config/locale/uclibc/time_members.h
> +@@ -0,0 +1,68 @@
> ++// std::time_get, std::time_put implementation, GNU version -*- C++ =
-*-
> ++
> ++// Copyright (C) 2001, 2002, 2003, 2004 Free Software Foundation, =
Inc.
> ++//
> ++// This file is part of the GNU ISO C++ Library.  This library is =
free
> ++// software; you can redistribute it and/or modify it under the
> ++// terms of the GNU General Public License as published by the
> ++// Free Software Foundation; either version 2, or (at your option)
> ++// any later version.
> ++
> ++// This library is distributed in the hope that it will be useful,
> ++// but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> ++// GNU General Public License for more details.
> ++
> ++// You should have received a copy of the GNU General Public License =
along
> ++// with this library; see the file COPYING.  If not, write to the =
Free
> ++// Software Foundation, 59 Temple Place - Suite 330, Boston, MA =
02111-1307,
> ++// USA.
> ++
> ++// As a special exception, you may use this file as part of a free =
software
> ++// library without restriction.  Specifically, if other files =
instantiate
> ++// templates or use macros or inline functions from this file, or =
you compile
> ++// this file and link it with other files to produce an executable, =
this
> ++// file does not by itself cause the resulting executable to be =
covered by
> ++// the GNU General Public License.  This exception does not however
> ++// invalidate any other reasons why the executable file might be =
covered by
> ++// the GNU General Public License.
> ++
> ++//
> ++// ISO C++ 14882: 22.2.5.1.2 - time_get functions
> ++// ISO C++ 14882: 22.2.5.3.2 - time_put functions
> ++//
> ++
> ++// Written by Benjamin Kosnik <bkoz@redhat.com>
> ++
> ++  template<typename _CharT>
> ++    __timepunct<_CharT>::__timepunct(size_t __refs)
> ++    : facet(__refs), _M_data(NULL), _M_c_locale_timepunct(NULL),
> ++    _M_name_timepunct(_S_get_c_name())
> ++    { _M_initialize_timepunct(); }
> ++
> ++  template<typename _CharT>
> ++    __timepunct<_CharT>::__timepunct(__cache_type* __cache, size_t =
__refs)
> ++    : facet(__refs), _M_data(__cache), _M_c_locale_timepunct(NULL),
> ++    _M_name_timepunct(_S_get_c_name())
> ++    { _M_initialize_timepunct(); }
> ++
> ++  template<typename _CharT>
> ++    __timepunct<_CharT>::__timepunct(__c_locale __cloc, const char* =
__s,
> ++				     size_t __refs)
> ++    : facet(__refs), _M_data(NULL), _M_c_locale_timepunct(NULL),
> ++    _M_name_timepunct(__s)
> ++    {
> ++      char* __tmp =3D new char[std::strlen(__s) + 1];
> ++      std::strcpy(__tmp, __s);
> ++      _M_name_timepunct =3D __tmp;
> ++      _M_initialize_timepunct(__cloc);
> ++    }
> ++
> ++  template<typename _CharT>
> ++    __timepunct<_CharT>::~__timepunct()
> ++    {
> ++      if (_M_name_timepunct !=3D _S_get_c_name())
> ++	delete [] _M_name_timepunct;
> ++      delete _M_data;
> ++      _S_destroy_c_locale(_M_c_locale_timepunct);
> ++    }
> +diff --git a/libstdc++-v3/configure b/libstdc++-v3/configure
> +index f40ddcf..c57a751 100755
> +--- a/libstdc++-v3/configure
> ++++ b/libstdc++-v3/configure
> +@@ -15822,6 +15822,9 @@ fi
> +   # Default to "generic".
> +   if test $enable_clocale_flag =3D auto; then
> +     case ${target_os} in
> ++      *-uclibc*)
> ++        enable_clocale_flag=3Duclibc
> ++        ;;
> +       linux* | gnu* | kfreebsd*-gnu | knetbsd*-gnu)
> + 	enable_clocale_flag=3Dgnu
> + 	;;
> +@@ -16079,6 +16082,78 @@ $as_echo "newlib" >&6; }
> +       CTIME_CC=3Dconfig/locale/generic/time_members.cc
> +       CLOCALE_INTERNAL_H=3Dconfig/locale/generic/c++locale_internal.h
> +       ;;
> ++    uclibc)
> ++      { $as_echo "$as_me:${as_lineno-$LINENO}: result: uclibc" >&5
> ++$as_echo "uclibc" >&6; }
> ++
> ++      # Declare intention to use gettext, and add support for =
specific
> ++      # languages.
> ++      # For some reason, ALL_LINGUAS has to be before AM-GNU-GETTEXT
> ++      ALL_LINGUAS=3D"de fr"
> ++
> ++      # Don't call AM-GNU-GETTEXT here. Instead, assume glibc.
> ++      # Extract the first word of "msgfmt", so it can be a program =
name with args.
> ++set dummy msgfmt; ac_word=3D$2
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
> ++$as_echo_n "checking for $ac_word... " >&6; }
> ++if test "${ac_cv_prog_check_msgfmt+set}" =3D set; then :
> ++  $as_echo_n "(cached) " >&6
> ++else
> ++  if test -n "$check_msgfmt"; then
> ++  ac_cv_prog_check_msgfmt=3D"$check_msgfmt" # Let the user override =
the test.
> ++else
> ++as_save_IFS=3D$IFS; IFS=3D$PATH_SEPARATOR
> ++for as_dir in $PATH
> ++do
> ++  IFS=3D$as_save_IFS
> ++  test -z "$as_dir" && as_dir=3D.
> ++    for ac_exec_ext in '' $ac_executable_extensions; do
> ++  if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x =
"$as_dir/$ac_word$ac_exec_ext"; }; then
> ++    ac_cv_prog_check_msgfmt=3D"yes"
> ++    $as_echo "$as_me:${as_lineno-$LINENO}: found =
$as_dir/$ac_word$ac_exec_ext" >&5
> ++    break 2
> ++  fi
> ++done
> ++  done
> ++IFS=3D$as_save_IFS
> ++
> ++  test -z "$ac_cv_prog_check_msgfmt" && ac_cv_prog_check_msgfmt=3D"no"=

> ++fi
> ++fi
> ++check_msgfmt=3D$ac_cv_prog_check_msgfmt
> ++if test -n "$check_msgfmt"; then
> ++  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $check_msgfmt" =
>&5
> ++$as_echo "$check_msgfmt" >&6; }
> ++else
> ++  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
> ++$as_echo "no" >&6; }
> ++fi
> ++
> ++
> ++      if test x"$check_msgfmt" =3D x"yes" && test x"$enable_nls" =3D =
x"yes"; then
> ++        USE_NLS=3Dyes
> ++      fi
> ++      # Export the build objects.
> ++      for ling in $ALL_LINGUAS; do \
> ++        glibcxx_MOFILES=3D"$glibcxx_MOFILES $ling.mo"; \
> ++        glibcxx_POFILES=3D"$glibcxx_POFILES $ling.po"; \
> ++      done
> ++
> ++
> ++
> ++      CLOCALE_H=3Dconfig/locale/uclibc/c_locale.h
> ++      CLOCALE_CC=3Dconfig/locale/uclibc/c_locale.cc
> ++      CCODECVT_CC=3Dconfig/locale/uclibc/codecvt_members.cc
> ++      CCOLLATE_CC=3Dconfig/locale/uclibc/collate_members.cc
> ++      CCTYPE_CC=3Dconfig/locale/uclibc/ctype_members.cc
> ++      CMESSAGES_H=3Dconfig/locale/uclibc/messages_members.h
> ++      CMESSAGES_CC=3Dconfig/locale/uclibc/messages_members.cc
> ++      CMONEY_CC=3Dconfig/locale/uclibc/monetary_members.cc
> ++      CNUMERIC_CC=3Dconfig/locale/uclibc/numeric_members.cc
> ++      CTIME_H=3Dconfig/locale/uclibc/time_members.h
> ++      CTIME_CC=3Dconfig/locale/uclibc/time_members.cc
> ++      CLOCALE_INTERNAL_H=3Dconfig/locale/uclibc/c++locale_internal.h
> ++      ;;
> +   esac
> +=20
> +   # This is where the testsuite looks for locale catalogs, using the
> +diff --git a/libstdc++-v3/include/c_compatibility/wchar.h =
b/libstdc++-v3/include/c_compatibility/wchar.h
> +index 580d725..3fe61b8 100644
> +--- a/libstdc++-v3/include/c_compatibility/wchar.h
> ++++ b/libstdc++-v3/include/c_compatibility/wchar.h
> +@@ -101,7 +101,9 @@ using std::wmemcmp;
> + using std::wmemcpy;
> + using std::wmemmove;
> + using std::wmemset;
> ++#if _GLIBCXX_HAVE_WCSFTIME
> + using std::wcsftime;
> ++#endif
> +=20
> + #if _GLIBCXX_USE_C99
> + using std::wcstold;
> +diff --git a/libstdc++-v3/include/c_std/cwchar =
b/libstdc++-v3/include/c_std/cwchar
> +index 0e6b1fc..405aee2 100644
> +--- a/libstdc++-v3/include/c_std/cwchar
> ++++ b/libstdc++-v3/include/c_std/cwchar
> +@@ -175,7 +175,9 @@ _GLIBCXX_BEGIN_NAMESPACE_VERSION
> +   using ::wcscoll;
> +   using ::wcscpy;
> +   using ::wcscspn;
> ++#if _GLIBCXX_HAVE_WCSFTIME
> +   using ::wcsftime;
> ++#endif
> +   using ::wcslen;
> +   using ::wcsncat;
> +   using ::wcsncmp;
> +--=20
> +1.7.10.4
> +
> diff --git =
a/meta/recipes-devtools/gcc/gcc-4.8/0005-uclibc-locale-no__x.patch =
b/meta/recipes-devtools/gcc/gcc-4.8/0005-uclibc-locale-no__x.patch
> new file mode 100644
> index 0000000..1a26d39
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-4.8/0005-uclibc-locale-no__x.patch
> @@ -0,0 +1,257 @@
> +=46rom 6a3e8506a12c12728d8b29901defd738be43757f Mon Sep 17 00:00:00 =
2001
> +From: Elvis Dowson <elvis.dowson@gmail.com>
> +Date: Fri, 29 Mar 2013 08:42:36 +0400
> +Subject: [PATCH 05/35] uclibc-locale-no__x
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Upstream-Status: Pending
> +---
> + .../config/locale/uclibc/c++locale_internal.h      |   45 =
++++++++++++++++++++
> + libstdc++-v3/config/locale/uclibc/c_locale.cc      |   14 ------
> + libstdc++-v3/config/locale/uclibc/c_locale.h       |    1 +
> + .../config/locale/uclibc/collate_members.cc        |    7 ---
> + libstdc++-v3/config/locale/uclibc/ctype_members.cc |    7 ---
> + .../config/locale/uclibc/messages_members.cc       |    7 +--
> + .../config/locale/uclibc/messages_members.h        |   18 +++-----
> + .../config/locale/uclibc/monetary_members.cc       |    4 --
> + .../config/locale/uclibc/numeric_members.cc        |    3 --
> + libstdc++-v3/config/locale/uclibc/time_members.cc  |    3 --
> + 10 files changed, 55 insertions(+), 54 deletions(-)
> +
> +diff --git a/libstdc++-v3/config/locale/uclibc/c++locale_internal.h =
b/libstdc++-v3/config/locale/uclibc/c++locale_internal.h
> +index 2ae3e4a..e74fddf 100644
> +--- a/libstdc++-v3/config/locale/uclibc/c++locale_internal.h
> ++++ b/libstdc++-v3/config/locale/uclibc/c++locale_internal.h
> +@@ -60,4 +60,49 @@ extern "C" __typeof(wcsxfrm_l) __wcsxfrm_l;
> + extern "C" __typeof(wctype_l) __wctype_l;
> + #endif
> +=20
> ++# define __nl_langinfo_l nl_langinfo_l
> ++# define __strcoll_l strcoll_l
> ++# define __strftime_l strftime_l
> ++# define __strtod_l strtod_l
> ++# define __strtof_l strtof_l
> ++# define __strtold_l strtold_l
> ++# define __strxfrm_l strxfrm_l
> ++# define __newlocale newlocale
> ++# define __freelocale freelocale
> ++# define __duplocale duplocale
> ++# define __uselocale uselocale
> ++
> ++# ifdef _GLIBCXX_USE_WCHAR_T
> ++#  define __iswctype_l iswctype_l
> ++#  define __towlower_l towlower_l
> ++#  define __towupper_l towupper_l
> ++#  define __wcscoll_l wcscoll_l
> ++#  define __wcsftime_l wcsftime_l
> ++#  define __wcsxfrm_l wcsxfrm_l
> ++#  define __wctype_l wctype_l
> ++# endif
> ++
> ++#else
> ++# define __nl_langinfo_l(N, L)       nl_langinfo((N))
> ++# define __strcoll_l(S1, S2, L)      strcoll((S1), (S2))
> ++# define __strtod_l(S, E, L)         strtod((S), (E))
> ++# define __strtof_l(S, E, L)         strtof((S), (E))
> ++# define __strtold_l(S, E, L)        strtold((S), (E))
> ++# define __strxfrm_l(S1, S2, N, L)   strxfrm((S1), (S2), (N))
> ++# warning should dummy __newlocale check for C|POSIX ?
> ++# define __newlocale(a, b, c)        NULL
> ++# define __freelocale(a)             ((void)0)
> ++# define __duplocale(a)              __c_locale()
> ++//# define __uselocale ?
> ++//
> ++# ifdef _GLIBCXX_USE_WCHAR_T
> ++#  define __iswctype_l(C, M, L)       iswctype((C), (M))
> ++#  define __towlower_l(C, L)          towlower((C))
> ++#  define __towupper_l(C, L)          towupper((C))
> ++#  define __wcscoll_l(S1, S2, L)      wcscoll((S1), (S2))
> ++//#  define __wcsftime_l(S, M, F, T, L)  wcsftime((S), (M), (F), =
(T))
> ++#  define __wcsxfrm_l(S1, S2, N, L)   wcsxfrm((S1), (S2), (N))
> ++#  define __wctype_l(S, L)            wctype((S))
> ++# endif
> ++
> + #endif // GLIBC 2.3 and later
> +diff --git a/libstdc++-v3/config/locale/uclibc/c_locale.cc =
b/libstdc++-v3/config/locale/uclibc/c_locale.cc
> +index 5081dc1..21430d0 100644
> +--- a/libstdc++-v3/config/locale/uclibc/c_locale.cc
> ++++ b/libstdc++-v3/config/locale/uclibc/c_locale.cc
> +@@ -39,20 +39,6 @@
> + #include <langinfo.h>
> + #include <bits/c++locale_internal.h>
> +=20
> +-#ifndef __UCLIBC_HAS_XLOCALE__
> +-#define __strtol_l(S, E, B, L)      strtol((S), (E), (B))
> +-#define __strtoul_l(S, E, B, L)     strtoul((S), (E), (B))
> +-#define __strtoll_l(S, E, B, L)     strtoll((S), (E), (B))
> +-#define __strtoull_l(S, E, B, L)    strtoull((S), (E), (B))
> +-#define __strtof_l(S, E, L)         strtof((S), (E))
> +-#define __strtod_l(S, E, L)         strtod((S), (E))
> +-#define __strtold_l(S, E, L)        strtold((S), (E))
> +-#warning should dummy __newlocale check for C|POSIX ?
> +-#define __newlocale(a, b, c)        NULL
> +-#define __freelocale(a)             ((void)0)
> +-#define __duplocale(a)              __c_locale()
> +-#endif
> +-
> + namespace std
> + {
> +   template<>
> +diff --git a/libstdc++-v3/config/locale/uclibc/c_locale.h =
b/libstdc++-v3/config/locale/uclibc/c_locale.h
> +index da07c1f..4bca5f1 100644
> +--- a/libstdc++-v3/config/locale/uclibc/c_locale.h
> ++++ b/libstdc++-v3/config/locale/uclibc/c_locale.h
> +@@ -68,6 +68,7 @@ namespace __gnu_cxx
> + {
> +   extern "C" __typeof(uselocale) __uselocale;
> + }
> ++#define __uselocale uselocale
> + #endif
> +=20
> + namespace std
> +diff --git a/libstdc++-v3/config/locale/uclibc/collate_members.cc =
b/libstdc++-v3/config/locale/uclibc/collate_members.cc
> +index c2664a7..ec5c329 100644
> +--- a/libstdc++-v3/config/locale/uclibc/collate_members.cc
> ++++ b/libstdc++-v3/config/locale/uclibc/collate_members.cc
> +@@ -36,13 +36,6 @@
> + #include <locale>
> + #include <bits/c++locale_internal.h>
> +=20
> +-#ifndef __UCLIBC_HAS_XLOCALE__
> +-#define __strcoll_l(S1, S2, L)      strcoll((S1), (S2))
> +-#define __strxfrm_l(S1, S2, N, L)   strxfrm((S1), (S2), (N))
> +-#define __wcscoll_l(S1, S2, L)      wcscoll((S1), (S2))
> +-#define __wcsxfrm_l(S1, S2, N, L)   wcsxfrm((S1), (S2), (N))
> +-#endif
> +-
> + namespace std
> + {
> +   // These are basically extensions to char_traits, and perhaps =
should
> +diff --git a/libstdc++-v3/config/locale/uclibc/ctype_members.cc =
b/libstdc++-v3/config/locale/uclibc/ctype_members.cc
> +index 7294e3a..7b12861 100644
> +--- a/libstdc++-v3/config/locale/uclibc/ctype_members.cc
> ++++ b/libstdc++-v3/config/locale/uclibc/ctype_members.cc
> +@@ -38,13 +38,6 @@
> + #undef _LIBC
> + #include <bits/c++locale_internal.h>
> +=20
> +-#ifndef __UCLIBC_HAS_XLOCALE__
> +-#define __wctype_l(S, L)           wctype((S))
> +-#define __towupper_l(C, L)         towupper((C))
> +-#define __towlower_l(C, L)         towlower((C))
> +-#define __iswctype_l(C, M, L)      iswctype((C), (M))
> +-#endif
> +-
> + namespace std
> + {
> +   // NB: The other ctype<char> specializations are in src/locale.cc =
and
> +diff --git a/libstdc++-v3/config/locale/uclibc/messages_members.cc =
b/libstdc++-v3/config/locale/uclibc/messages_members.cc
> +index 13594d9..d7693b4 100644
> +--- a/libstdc++-v3/config/locale/uclibc/messages_members.cc
> ++++ b/libstdc++-v3/config/locale/uclibc/messages_members.cc
> +@@ -39,13 +39,10 @@
> + #ifdef __UCLIBC_MJN3_ONLY__
> + #warning fix gettext stuff
> + #endif
> +-#ifdef __UCLIBC_HAS_GETTEXT_AWARENESS__
> +-extern "C" char *__dcgettext(const char *domainname,
> +-			     const char *msgid, int category);
> + #undef gettext
> +-#define gettext(msgid) __dcgettext(NULL, msgid, LC_MESSAGES)
> ++#ifdef __UCLIBC_HAS_GETTEXT_AWARENESS__
> ++#define gettext(msgid) dcgettext(NULL, msgid, LC_MESSAGES)
> + #else
> +-#undef gettext
> + #define gettext(msgid) (msgid)
> + #endif
> +=20
> +diff --git a/libstdc++-v3/config/locale/uclibc/messages_members.h =
b/libstdc++-v3/config/locale/uclibc/messages_members.h
> +index 1424078..d89da33 100644
> +--- a/libstdc++-v3/config/locale/uclibc/messages_members.h
> ++++ b/libstdc++-v3/config/locale/uclibc/messages_members.h
> +@@ -36,15 +36,11 @@
> + #ifdef __UCLIBC_MJN3_ONLY__
> + #warning fix prototypes for *textdomain funcs
> + #endif
> +-#ifdef __UCLIBC_HAS_GETTEXT_AWARENESS__
> +-extern "C" char *__textdomain(const char *domainname);
> +-extern "C" char *__bindtextdomain(const char *domainname,
> +-				  const char *dirname);
> +-#else
> +-#undef __textdomain
> +-#undef __bindtextdomain
> +-#define __textdomain(D)           ((void)0)
> +-#define __bindtextdomain(D,P)     ((void)0)
> ++#ifndef __UCLIBC_HAS_GETTEXT_AWARENESS__
> ++#undef textdomain
> ++#undef bindtextdomain
> ++#define textdomain(D)           ((void)0)
> ++#define bindtextdomain(D,P)     ((void)0)
> + #endif
> +=20
> +   // Non-virtual member functions.
> +@@ -70,7 +66,7 @@ extern "C" char *__bindtextdomain(const char =
*domainname,
> +     messages<_CharT>::open(const basic_string<char>& __s, const =
locale& __loc,
> + 			   const char* __dir) const
> +     {
> +-      __bindtextdomain(__s.c_str(), __dir);
> ++      bindtextdomain(__s.c_str(), __dir);
> +       return this->do_open(__s, __loc);
> +     }
> +=20
> +@@ -90,7 +86,7 @@ extern "C" char *__bindtextdomain(const char =
*domainname,
> +     {
> +       // No error checking is done, assume the catalog exists and =
can
> +       // be used.
> +-      __textdomain(__s.c_str());
> ++      textdomain(__s.c_str());
> +       return 0;
> +     }
> +=20
> +diff --git a/libstdc++-v3/config/locale/uclibc/monetary_members.cc =
b/libstdc++-v3/config/locale/uclibc/monetary_members.cc
> +index aa52731..2e6f80a 100644
> +--- a/libstdc++-v3/config/locale/uclibc/monetary_members.cc
> ++++ b/libstdc++-v3/config/locale/uclibc/monetary_members.cc
> +@@ -43,10 +43,6 @@
> + #warning tailor for stub locale support
> + #endif
> +=20
> +-#ifndef __UCLIBC_HAS_XLOCALE__
> +-#define __nl_langinfo_l(N, L)         nl_langinfo((N))
> +-#endif
> +-
> + namespace std
> + {
> +   // Construct and return valid pattern consisting of some =
combination of:
> +diff --git a/libstdc++-v3/config/locale/uclibc/numeric_members.cc =
b/libstdc++-v3/config/locale/uclibc/numeric_members.cc
> +index 883ec1a..2c70642 100644
> +--- a/libstdc++-v3/config/locale/uclibc/numeric_members.cc
> ++++ b/libstdc++-v3/config/locale/uclibc/numeric_members.cc
> +@@ -41,9 +41,6 @@
> + #ifdef __UCLIBC_MJN3_ONLY__
> + #warning tailor for stub locale support
> + #endif
> +-#ifndef __UCLIBC_HAS_XLOCALE__
> +-#define __nl_langinfo_l(N, L)         nl_langinfo((N))
> +-#endif
> +=20
> + namespace std
> + {
> +diff --git a/libstdc++-v3/config/locale/uclibc/time_members.cc =
b/libstdc++-v3/config/locale/uclibc/time_members.cc
> +index e0707d7..d848ed5 100644
> +--- a/libstdc++-v3/config/locale/uclibc/time_members.cc
> ++++ b/libstdc++-v3/config/locale/uclibc/time_members.cc
> +@@ -40,9 +40,6 @@
> + #ifdef __UCLIBC_MJN3_ONLY__
> + #warning tailor for stub locale support
> + #endif
> +-#ifndef __UCLIBC_HAS_XLOCALE__
> +-#define __nl_langinfo_l(N, L)         nl_langinfo((N))
> +-#endif
> +=20
> + namespace std
> + {
> +--=20
> +1.7.10.4
> +
> diff --git =
a/meta/recipes-devtools/gcc/gcc-4.8/0006-uclibc-locale-wchar_fix.patch =
b/meta/recipes-devtools/gcc/gcc-4.8/0006-uclibc-locale-wchar_fix.patch
> new file mode 100644
> index 0000000..6ca697f
> --- /dev/null
> +++ =
b/meta/recipes-devtools/gcc/gcc-4.8/0006-uclibc-locale-wchar_fix.patch
> @@ -0,0 +1,68 @@
> +=46rom 225511a3aeb193a916b3999f0b640a392caa67cd Mon Sep 17 00:00:00 =
2001
> +From: Elvis Dowson <elvis.dowson@gmail.com>
> +Date: Fri, 29 Mar 2013 08:45:57 +0400
> +Subject: [PATCH 06/35] uclibc-locale-wchar_fix
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Upstream-Status: Pending
> +---
> + libstdc++-v3/config/locale/uclibc/monetary_members.cc |    4 ++--
> + libstdc++-v3/config/locale/uclibc/numeric_members.cc  |   13 =
+++++++++++++
> + 2 files changed, 15 insertions(+), 2 deletions(-)
> +
> +diff --git a/libstdc++-v3/config/locale/uclibc/monetary_members.cc =
b/libstdc++-v3/config/locale/uclibc/monetary_members.cc
> +index 2e6f80a..31ebb9f 100644
> +--- a/libstdc++-v3/config/locale/uclibc/monetary_members.cc
> ++++ b/libstdc++-v3/config/locale/uclibc/monetary_members.cc
> +@@ -401,7 +401,7 @@ namespace std
> + # ifdef __UCLIBC_HAS_XLOCALE__
> + 	  _M_data->_M_decimal_point =3D __cloc->decimal_point_wc;
> + 	  _M_data->_M_thousands_sep =3D __cloc->thousands_sep_wc;
> +-# else
> ++# elif defined __UCLIBC_HAS_LOCALE__
> + 	  _M_data->_M_decimal_point =3D =
__global_locale->decimal_point_wc;
> + 	  _M_data->_M_thousands_sep =3D =
__global_locale->thousands_sep_wc;
> + # endif
> +@@ -556,7 +556,7 @@ namespace std
> + # ifdef __UCLIBC_HAS_XLOCALE__
> + 	  _M_data->_M_decimal_point =3D __cloc->decimal_point_wc;
> + 	  _M_data->_M_thousands_sep =3D __cloc->thousands_sep_wc;
> +-# else
> ++# elif defined __UCLIBC_HAS_LOCALE__
> + 	  _M_data->_M_decimal_point =3D =
__global_locale->decimal_point_wc;
> + 	  _M_data->_M_thousands_sep =3D =
__global_locale->thousands_sep_wc;
> + # endif
> +diff --git a/libstdc++-v3/config/locale/uclibc/numeric_members.cc =
b/libstdc++-v3/config/locale/uclibc/numeric_members.cc
> +index 2c70642..d5c8961 100644
> +--- a/libstdc++-v3/config/locale/uclibc/numeric_members.cc
> ++++ b/libstdc++-v3/config/locale/uclibc/numeric_members.cc
> +@@ -127,12 +127,25 @@ namespace std
> + 	{
> + 	  // Named locale.
> + 	  // NB: In the GNU model wchar_t is always 32 bit wide.
> ++#ifdef __UCLIBC_MJN3_ONLY__
> ++#warning fix this... should be numeric
> ++#endif
> ++#ifdef __UCLIBC__
> ++# ifdef __UCLIBC_HAS_XLOCALE__
> ++	  _M_data->_M_decimal_point =3D __cloc->decimal_point_wc;
> ++	  _M_data->_M_thousands_sep =3D __cloc->thousands_sep_wc;
> ++# elif defined __UCLIBC_HAS_LOCALE__
> ++	  _M_data->_M_decimal_point =3D =
__global_locale->decimal_point_wc;
> ++	  _M_data->_M_thousands_sep =3D =
__global_locale->thousands_sep_wc;
> ++# endif
> ++#else
> + 	  union { char *__s; wchar_t __w; } __u;
> + 	  __u.__s =3D __nl_langinfo_l(_NL_NUMERIC_DECIMAL_POINT_WC, =
__cloc);
> + 	  _M_data->_M_decimal_point =3D __u.__w;
> +=20
> + 	  __u.__s =3D __nl_langinfo_l(_NL_NUMERIC_THOUSANDS_SEP_WC, =
__cloc);
> + 	  _M_data->_M_thousands_sep =3D __u.__w;
> ++#endif
> +=20
> + 	  if (_M_data->_M_thousands_sep =3D=3D L'\0')
> + 	    _M_data->_M_grouping =3D "";
> +--=20
> +1.7.10.4
> +
> diff --git =
a/meta/recipes-devtools/gcc/gcc-4.8/0007-uclibc-locale-update.patch =
b/meta/recipes-devtools/gcc/gcc-4.8/0007-uclibc-locale-update.patch
> new file mode 100644
> index 0000000..ba915c4
> --- /dev/null
> +++ =
b/meta/recipes-devtools/gcc/gcc-4.8/0007-uclibc-locale-update.patch
> @@ -0,0 +1,542 @@
> +=46rom 6ffe7c46f52d27864c3df3663e16ec9ddee71e8f Mon Sep 17 00:00:00 =
2001
> +From: Elvis Dowson <elvis.dowson@gmail.com>
> +Date: Fri, 29 Mar 2013 08:46:58 +0400
> +Subject: [PATCH 07/35] uclibc-locale-update
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Upstream-Status: Pending
> +---
> + .../config/locale/uclibc/c++locale_internal.h      |    3 +
> + libstdc++-v3/config/locale/uclibc/c_locale.cc      |   74 =
+++++++++-----------
> + libstdc++-v3/config/locale/uclibc/c_locale.h       |   42 =
++++++-----
> + libstdc++-v3/config/locale/uclibc/ctype_members.cc |   51 =
++++++++++----
> + .../config/locale/uclibc/messages_members.h        |   12 ++--
> + .../config/locale/uclibc/monetary_members.cc       |   34 +++++----
> + .../config/locale/uclibc/numeric_members.cc        |    5 ++
> + libstdc++-v3/config/locale/uclibc/time_members.cc  |   18 +++--
> + libstdc++-v3/config/locale/uclibc/time_members.h   |   17 +++--
> + 9 files changed, 158 insertions(+), 98 deletions(-)
> +
> +diff --git a/libstdc++-v3/config/locale/uclibc/c++locale_internal.h =
b/libstdc++-v3/config/locale/uclibc/c++locale_internal.h
> +index e74fddf..971a6b4 100644
> +--- a/libstdc++-v3/config/locale/uclibc/c++locale_internal.h
> ++++ b/libstdc++-v3/config/locale/uclibc/c++locale_internal.h
> +@@ -31,6 +31,9 @@
> +=20
> + #include <bits/c++config.h>
> + #include <clocale>
> ++#include <cstdlib>
> ++#include <cstring>
> ++#include <cstddef>
> +=20
> + #ifdef __UCLIBC_MJN3_ONLY__
> + #warning clean this up
> +diff --git a/libstdc++-v3/config/locale/uclibc/c_locale.cc =
b/libstdc++-v3/config/locale/uclibc/c_locale.cc
> +index 21430d0..1b9d8e1 100644
> +--- a/libstdc++-v3/config/locale/uclibc/c_locale.cc
> ++++ b/libstdc++-v3/config/locale/uclibc/c_locale.cc
> +@@ -39,23 +39,20 @@
> + #include <langinfo.h>
> + #include <bits/c++locale_internal.h>
> +=20
> +-namespace std
> +-{
> ++_GLIBCXX_BEGIN_NAMESPACE(std)
> ++
> +   template<>
> +     void
> +     __convert_to_v(const char* __s, float& __v, ios_base::iostate& =
__err,
> + 		   const __c_locale& __cloc)
> +     {
> +-      if (!(__err & ios_base::failbit))
> +-	{
> +-	  char* __sanity;
> +-	  errno =3D 0;
> +-	  float __f =3D __strtof_l(__s, &__sanity, __cloc);
> +-          if (__sanity !=3D __s && errno !=3D ERANGE)
> +-	    __v =3D __f;
> +-	  else
> +-	    __err |=3D ios_base::failbit;
> +-	}
> ++      char* __sanity;
> ++      errno =3D 0;
> ++      float __f =3D __strtof_l(__s, &__sanity, __cloc);
> ++      if (__sanity !=3D __s && errno !=3D ERANGE)
> ++	__v =3D __f;
> ++      else
> ++	__err |=3D ios_base::failbit;
> +     }
> +=20
> +   template<>
> +@@ -63,16 +60,13 @@ namespace std
> +     __convert_to_v(const char* __s, double& __v, ios_base::iostate& =
__err,
> + 		   const __c_locale& __cloc)
> +     {
> +-      if (!(__err & ios_base::failbit))
> +-	{
> +-	  char* __sanity;
> +-	  errno =3D 0;
> +-	  double __d =3D __strtod_l(__s, &__sanity, __cloc);
> +-          if (__sanity !=3D __s && errno !=3D ERANGE)
> +-	    __v =3D __d;
> +-	  else
> +-	    __err |=3D ios_base::failbit;
> +-	}
> ++      char* __sanity;
> ++      errno =3D 0;
> ++      double __d =3D __strtod_l(__s, &__sanity, __cloc);
> ++      if (__sanity !=3D __s && errno !=3D ERANGE)
> ++	__v =3D __d;
> ++      else
> ++	__err |=3D ios_base::failbit;
> +     }
> +=20
> +   template<>
> +@@ -80,16 +74,13 @@ namespace std
> +     __convert_to_v(const char* __s, long double& __v, =
ios_base::iostate& __err,
> + 		   const __c_locale& __cloc)
> +     {
> +-      if (!(__err & ios_base::failbit))
> +-	{
> +-	  char* __sanity;
> +-	  errno =3D 0;
> +-	  long double __ld =3D __strtold_l(__s, &__sanity, __cloc);
> +-          if (__sanity !=3D __s && errno !=3D ERANGE)
> +-	    __v =3D __ld;
> +-	  else
> +-	    __err |=3D ios_base::failbit;
> +-	}
> ++      char* __sanity;
> ++      errno =3D 0;
> ++      long double __ld =3D __strtold_l(__s, &__sanity, __cloc);
> ++      if (__sanity !=3D __s && errno !=3D ERANGE)
> ++	__v =3D __ld;
> ++      else
> ++	__err |=3D ios_base::failbit;
> +     }
> +=20
> +   void
> +@@ -110,17 +101,18 @@ namespace std
> +   void
> +   locale::facet::_S_destroy_c_locale(__c_locale& __cloc)
> +   {
> +-    if (_S_get_c_locale() !=3D __cloc)
> ++    if (__cloc && _S_get_c_locale() !=3D __cloc)
> +       __freelocale(__cloc);
> +   }
> +=20
> +   __c_locale
> +   locale::facet::_S_clone_c_locale(__c_locale& __cloc)
> +   { return __duplocale(__cloc); }
> +-} // namespace std
> +=20
> +-namespace __gnu_cxx
> +-{
> ++_GLIBCXX_END_NAMESPACE
> ++
> ++_GLIBCXX_BEGIN_NAMESPACE(__gnu_cxx)
> ++
> +   const char* const category_names[6 + _GLIBCXX_NUM_CATEGORIES] =3D
> +     {
> +       "LC_CTYPE",
> +@@ -138,9 +130,11 @@ namespace __gnu_cxx
> +       "LC_IDENTIFICATION"
> + #endif
> +     };
> +-}
> +=20
> +-namespace std
> +-{
> ++_GLIBCXX_END_NAMESPACE
> ++
> ++_GLIBCXX_BEGIN_NAMESPACE(std)
> ++
> +   const char* const* const locale::_S_categories =3D =
__gnu_cxx::category_names;
> +-}  // namespace std
> ++
> ++_GLIBCXX_END_NAMESPACE
> +diff --git a/libstdc++-v3/config/locale/uclibc/c_locale.h =
b/libstdc++-v3/config/locale/uclibc/c_locale.h
> +index 4bca5f1..64a6d46 100644
> +--- a/libstdc++-v3/config/locale/uclibc/c_locale.h
> ++++ b/libstdc++-v3/config/locale/uclibc/c_locale.h
> +@@ -39,21 +39,23 @@
> + #pragma GCC system_header
> +=20
> + #include <cstring>              // get std::strlen
> +-#include <cstdio>               // get std::snprintf or std::sprintf
> ++#include <cstdio>               // get std::vsnprintf or =
std::vsprintf
> + #include <clocale>
> + #include <langinfo.h>		// For codecvt
> + #ifdef __UCLIBC_MJN3_ONLY__
> + #warning fix this
> + #endif
> +-#ifdef __UCLIBC_HAS_LOCALE__
> ++#ifdef _GLIBCXX_USE_ICONV
> + #include <iconv.h>		// For codecvt using iconv, iconv_t
> + #endif
> +-#ifdef __UCLIBC_HAS_GETTEXT_AWARENESS__
> +-#include <libintl.h> 		// For messages
> ++#ifdef HAVE_LIBINTL_H
> ++#include <libintl.h>		// For messages
> + #endif
> ++#include <cstdarg>
> +=20
> + #ifdef __UCLIBC_MJN3_ONLY__
> + #warning what is _GLIBCXX_C_LOCALE_GNU for
> ++// psm: used in os/gnu-linux/ctype_noninline.h
> + #endif
> + #define _GLIBCXX_C_LOCALE_GNU 1
> +=20
> +@@ -78,23 +80,25 @@ namespace std
> + #else
> +   typedef int*			__c_locale;
> + #endif
> +-
> +-  // Convert numeric value of type _Tv to string and return length =
of
> +-  // string.  If snprintf is available use it, otherwise fall back =
to
> +-  // the unsafe sprintf which, in general, can be dangerous and =
should
> ++  // Convert numeric value of type double to string and return =
length of
> ++  // string.  If vsnprintf is available use it, otherwise fall back =
to
> ++  // the unsafe vsprintf which, in general, can be dangerous and =
should
> +   // be avoided.
> +-  template<typename _Tv>
> +-    int
> +-    __convert_from_v(char* __out,
> +-		     const int __size __attribute__ ((__unused__)),
> +-		     const char* __fmt,
> +-#ifdef __UCLIBC_HAS_XCLOCALE__
> +-		     _Tv __v, const __c_locale& __cloc, int __prec)
> ++    inline int
> ++    __convert_from_v(const __c_locale&
> ++#ifndef __UCLIBC_HAS_XCLOCALE__
> ++	__cloc __attribute__ ((__unused__))
> ++#endif
> ++		     ,
> ++		     char* __out,
> ++		     const int __size,
> ++		     const char* __fmt, ...)
> +     {
> ++      va_list __args;
> ++#ifdef __UCLIBC_HAS_XCLOCALE__
> ++
> +       __c_locale __old =3D __gnu_cxx::__uselocale(__cloc);
> + #else
> +-		     _Tv __v, const __c_locale&, int __prec)
> +-    {
> + # ifdef __UCLIBC_HAS_LOCALE__
> +       char* __old =3D std::setlocale(LC_ALL, NULL);
> +       char* __sav =3D new char[std::strlen(__old) + 1];
> +@@ -103,7 +107,9 @@ namespace std
> + # endif
> + #endif
> +=20
> +-      const int __ret =3D std::snprintf(__out, __size, __fmt, =
__prec, __v);
> ++      va_start(__args, __fmt);
> ++      const int __ret =3D std::vsnprintf(__out, __size, __fmt, =
__args);
> ++      va_end(__args);
> +=20
> + #ifdef __UCLIBC_HAS_XCLOCALE__
> +       __gnu_cxx::__uselocale(__old);
> +diff --git a/libstdc++-v3/config/locale/uclibc/ctype_members.cc =
b/libstdc++-v3/config/locale/uclibc/ctype_members.cc
> +index 7b12861..13e011d 100644
> +--- a/libstdc++-v3/config/locale/uclibc/ctype_members.cc
> ++++ b/libstdc++-v3/config/locale/uclibc/ctype_members.cc
> +@@ -33,16 +33,20 @@
> +=20
> + // Written by Benjamin Kosnik <bkoz@redhat.com>
> +=20
> ++#include <features.h>
> ++#ifdef __UCLIBC_HAS_LOCALE__
> + #define _LIBC
> + #include <locale>
> + #undef _LIBC
> ++#else
> ++#include <locale>
> ++#endif
> + #include <bits/c++locale_internal.h>
> +=20
> +-namespace std
> +-{
> ++_GLIBCXX_BEGIN_NAMESPACE(std)
> ++
> +   // NB: The other ctype<char> specializations are in src/locale.cc =
and
> +   // various /config/os/* files.
> +-  template<>
> +     ctype_byname<char>::ctype_byname(const char* __s, size_t __refs)
> +     : ctype<char>(0, false, __refs)
> +     {
> +@@ -57,6 +61,8 @@ namespace std
> + #endif
> + 	}
> +     }
> ++    ctype_byname<char>::~ctype_byname()
> ++    { }
> +=20
> + #ifdef _GLIBCXX_USE_WCHAR_T
> +   ctype<wchar_t>::__wmask_type
> +@@ -138,17 +144,33 @@ namespace std
> +   ctype<wchar_t>::
> +   do_is(mask __m, wchar_t __c) const
> +   {
> +-    // Highest bitmask in ctype_base =3D=3D 10, but extra in "C"
> +-    // library for blank.
> ++    // The case of __m =3D=3D ctype_base::space is particularly =
important,
> ++    // due to its use in many istream functions.  Therefore we deal =
with
> ++    // it first, exploiting the knowledge that on GNU systems =
_M_bit[5]
> ++    // is the mask corresponding to ctype_base::space.  NB: an =
encoding
> ++    // change would not affect correctness!
> ++
> +     bool __ret =3D false;
> +-    const size_t __bitmasksize =3D 11;
> +-    for (size_t __bitcur =3D 0; __bitcur <=3D __bitmasksize; =
++__bitcur)
> +-      if (__m & _M_bit[__bitcur]
> +-	  && __iswctype_l(__c, _M_wmask[__bitcur], _M_c_locale_ctype))
> +-	{
> +-	  __ret =3D true;
> +-	  break;
> +-	}
> ++    if (__m =3D=3D _M_bit[5])
> ++      __ret =3D __iswctype_l(__c, _M_wmask[5], _M_c_locale_ctype);
> ++    else
> ++      {
> ++	// Highest bitmask in ctype_base =3D=3D 10, but extra in "C"
> ++	// library for blank.
> ++	const size_t __bitmasksize =3D 11;
> ++	for (size_t __bitcur =3D 0; __bitcur <=3D __bitmasksize; =
++__bitcur)
> ++	  if (__m & _M_bit[__bitcur])
> ++	    {
> ++	      if (__iswctype_l(__c, _M_wmask[__bitcur], =
_M_c_locale_ctype))
> ++		{
> ++		  __ret =3D true;
> ++		  break;
> ++		}
> ++	      else if (__m =3D=3D _M_bit[__bitcur])
> ++		break;
> ++	    }
> ++      }
> ++
> +     return __ret;
> +   }
> +=20
> +@@ -290,4 +312,5 @@ namespace std
> + #endif
> +   }
> + #endif //  _GLIBCXX_USE_WCHAR_T
> +-}
> ++
> ++_GLIBCXX_END_NAMESPACE
> +diff --git a/libstdc++-v3/config/locale/uclibc/messages_members.h =
b/libstdc++-v3/config/locale/uclibc/messages_members.h
> +index d89da33..067657a 100644
> +--- a/libstdc++-v3/config/locale/uclibc/messages_members.h
> ++++ b/libstdc++-v3/config/locale/uclibc/messages_members.h
> +@@ -53,12 +53,16 @@
> +   template<typename _CharT>
> +      messages<_CharT>::messages(__c_locale __cloc, const char* __s,
> + 				size_t __refs)
> +-     : facet(__refs), =
_M_c_locale_messages(_S_clone_c_locale(__cloc)),
> +-     _M_name_messages(__s)
> ++     : facet(__refs), _M_c_locale_messages(NULL),
> ++     _M_name_messages(NULL)
> +      {
> +-       char* __tmp =3D new char[std::strlen(__s) + 1];
> +-       std::strcpy(__tmp, __s);
> ++       const size_t __len =3D std::strlen(__s) + 1;
> ++       char* __tmp =3D new char[__len];
> ++       std::memcpy(__tmp, __s, __len);
> +        _M_name_messages =3D __tmp;
> ++
> ++       // Last to avoid leaking memory if new throws.
> ++       _M_c_locale_messages =3D _S_clone_c_locale(__cloc);
> +      }
> +=20
> +   template<typename _CharT>
> +diff --git a/libstdc++-v3/config/locale/uclibc/monetary_members.cc =
b/libstdc++-v3/config/locale/uclibc/monetary_members.cc
> +index 31ebb9f..7679b9c 100644
> +--- a/libstdc++-v3/config/locale/uclibc/monetary_members.cc
> ++++ b/libstdc++-v3/config/locale/uclibc/monetary_members.cc
> +@@ -33,9 +33,14 @@
> +=20
> + // Written by Benjamin Kosnik <bkoz@redhat.com>
> +=20
> ++#include <features.h>
> ++#ifdef __UCLIBC_HAS_LOCALE__
> + #define _LIBC
> + #include <locale>
> + #undef _LIBC
> ++#else
> ++#include <locale>
> ++#endif
> + #include <bits/c++locale_internal.h>
> +=20
> + #ifdef __UCLIBC_MJN3_ONLY__
> +@@ -206,7 +211,7 @@ namespace std
> + 	  }
> + 	break;
> +       default:
> +-	;
> ++	__ret =3D pattern();
> +       }
> +     return __ret;
> +   }
> +@@ -390,7 +395,9 @@ namespace std
> + 	  __c_locale __old =3D __uselocale(__cloc);
> + #else
> + 	  // Switch to named locale so that mbsrtowcs will work.
> +-	  char* __old =3D strdup(setlocale(LC_ALL, NULL));
> ++  	  char* __old =3D setlocale(LC_ALL, NULL);
> ++          const size_t __llen =3D strlen(__old) + 1;
> ++          char* __sav =3D new char[__llen];
> + 	  setlocale(LC_ALL, __name);
> + #endif
> +=20
> +@@ -477,8 +484,8 @@ namespace std
> + #ifdef __UCLIBC_HAS_XLOCALE__
> + 	      __uselocale(__old);
> + #else
> +-	      setlocale(LC_ALL, __old);
> +-	      free(__old);
> ++	      setlocale(LC_ALL, __sav);
> ++	      delete [] __sav;
> + #endif
> + 	      __throw_exception_again;
> + 	    }
> +@@ -498,8 +505,8 @@ namespace std
> + #ifdef __UCLIBC_HAS_XLOCALE__
> + 	  __uselocale(__old);
> + #else
> +-	  setlocale(LC_ALL, __old);
> +-	  free(__old);
> ++	  setlocale(LC_ALL, __sav);
> ++	  delete [] __sav;
> + #endif
> + 	}
> +     }
> +@@ -545,8 +552,11 @@ namespace std
> + 	  __c_locale __old =3D __uselocale(__cloc);
> + #else
> + 	  // Switch to named locale so that mbsrtowcs will work.
> +-	  char* __old =3D strdup(setlocale(LC_ALL, NULL));
> +-	  setlocale(LC_ALL, __name);
> ++          char* __old =3D setlocale(LC_ALL, NULL);
> ++          const size_t __llen =3D strlen(__old) + 1;
> ++          char* __sav =3D new char[__llen];
> ++          memcpy(__sav, __old, __llen);
> ++          setlocale(LC_ALL, __name);
> + #endif
> +=20
> + #ifdef __UCLIBC_MJN3_ONLY__
> +@@ -633,8 +643,8 @@ namespace std
> + #ifdef __UCLIBC_HAS_XLOCALE__
> + 	      __uselocale(__old);
> + #else
> +-	      setlocale(LC_ALL, __old);
> +-	      free(__old);
> ++	      setlocale(LC_ALL, __sav);
> ++	      delete [] __sav;
> + #endif
> +               __throw_exception_again;
> + 	    }
> +@@ -653,8 +663,8 @@ namespace std
> + #ifdef __UCLIBC_HAS_XLOCALE__
> + 	  __uselocale(__old);
> + #else
> +-	  setlocale(LC_ALL, __old);
> +-	  free(__old);
> ++	  setlocale(LC_ALL, __sav);
> ++	  delete [] __sav;
> + #endif
> + 	}
> +     }
> +diff --git a/libstdc++-v3/config/locale/uclibc/numeric_members.cc =
b/libstdc++-v3/config/locale/uclibc/numeric_members.cc
> +index d5c8961..8ae8969 100644
> +--- a/libstdc++-v3/config/locale/uclibc/numeric_members.cc
> ++++ b/libstdc++-v3/config/locale/uclibc/numeric_members.cc
> +@@ -33,9 +33,14 @@
> +=20
> + // Written by Benjamin Kosnik <bkoz@redhat.com>
> +=20
> ++#include <features.h>
> ++#ifdef __UCLIBC_HAS_LOCALE__
> + #define _LIBC
> + #include <locale>
> + #undef _LIBC
> ++#else
> ++#include <locale>
> ++#endif
> + #include <bits/c++locale_internal.h>
> +=20
> + #ifdef __UCLIBC_MJN3_ONLY__
> +diff --git a/libstdc++-v3/config/locale/uclibc/time_members.cc =
b/libstdc++-v3/config/locale/uclibc/time_members.cc
> +index d848ed5..f24d53e 100644
> +--- a/libstdc++-v3/config/locale/uclibc/time_members.cc
> ++++ b/libstdc++-v3/config/locale/uclibc/time_members.cc
> +@@ -53,11 +53,14 @@ namespace std
> +       const size_t __len =3D __strftime_l(__s, __maxlen, __format, =
__tm,
> + 					_M_c_locale_timepunct);
> + #else
> +-      char* __old =3D strdup(setlocale(LC_ALL, NULL));
> ++      char* __old =3D setlocale(LC_ALL, NULL);
> ++      const size_t __llen =3D strlen(__old) + 1;
> ++      char* __sav =3D new char[__llen];
> ++      memcpy(__sav, __old, __llen);
> +       setlocale(LC_ALL, _M_name_timepunct);
> +       const size_t __len =3D strftime(__s, __maxlen, __format, =
__tm);
> +-      setlocale(LC_ALL, __old);
> +-      free(__old);
> ++      setlocale(LC_ALL, __sav);
> ++      delete [] __sav;
> + #endif
> +       // Make sure __s is null terminated.
> +       if (__len =3D=3D 0)
> +@@ -207,11 +210,14 @@ namespace std
> +       const size_t __len =3D __wcsftime_l(__s, __maxlen, __format, =
__tm,
> + 					_M_c_locale_timepunct);
> + #else
> +-      char* __old =3D strdup(setlocale(LC_ALL, NULL));
> ++      char* __old =3D setlocale(LC_ALL, NULL);
> ++      const size_t __llen =3D strlen(__old) + 1;
> ++      char* __sav =3D new char[__llen];
> ++      memcpy(__sav, __old, __llen);
> +       setlocale(LC_ALL, _M_name_timepunct);
> +       const size_t __len =3D wcsftime(__s, __maxlen, __format, =
__tm);
> +-      setlocale(LC_ALL, __old);
> +-      free(__old);
> ++      setlocale(LC_ALL, __sav);
> ++      delete [] __sav;
> + #endif
> +       // Make sure __s is null terminated.
> +       if (__len =3D=3D 0)
> +diff --git a/libstdc++-v3/config/locale/uclibc/time_members.h =
b/libstdc++-v3/config/locale/uclibc/time_members.h
> +index ba8e858..1665dde 100644
> +--- a/libstdc++-v3/config/locale/uclibc/time_members.h
> ++++ b/libstdc++-v3/config/locale/uclibc/time_members.h
> +@@ -50,12 +50,21 @@
> +     __timepunct<_CharT>::__timepunct(__c_locale __cloc, const char* =
__s,
> + 				     size_t __refs)
> +     : facet(__refs), _M_data(NULL), _M_c_locale_timepunct(NULL),
> +-    _M_name_timepunct(__s)
> ++    _M_name_timepunct(NULL)
> +     {
> +-      char* __tmp =3D new char[std::strlen(__s) + 1];
> +-      std::strcpy(__tmp, __s);
> ++      const size_t __len =3D std::strlen(__s) + 1;
> ++      char* __tmp =3D new char[__len];
> ++      std::memcpy(__tmp, __s, __len);
> +       _M_name_timepunct =3D __tmp;
> +-      _M_initialize_timepunct(__cloc);
> ++
> ++      try
> ++	{ _M_initialize_timepunct(__cloc); }
> ++      catch(...)
> ++	{
> ++	  delete [] _M_name_timepunct;
> ++	  __throw_exception_again;
> ++	}
> ++
> +     }
> +=20
> +   template<typename _CharT>
> +--=20
> +1.7.10.4
> +
> diff --git =
a/meta/recipes-devtools/gcc/gcc-4.8/0008-missing-execinfo_h.patch =
b/meta/recipes-devtools/gcc/gcc-4.8/0008-missing-execinfo_h.patch
> new file mode 100644
> index 0000000..b84492c
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-4.8/0008-missing-execinfo_h.patch
> @@ -0,0 +1,28 @@
> +=46rom 9f2158451981cf0a80cfabdc79ae31bb6976a801 Mon Sep 17 00:00:00 =
2001
> +From: Elvis Dowson <elvis.dowson@gmail.com>
> +Date: Fri, 29 Mar 2013 08:48:10 +0400
> +Subject: [PATCH 08/35] missing-execinfo_h
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Upstream-Status: Pending
> +---
> + boehm-gc/include/gc.h |    2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/boehm-gc/include/gc.h b/boehm-gc/include/gc.h
> +index c51e017..a7ba8dc 100644
> +--- a/boehm-gc/include/gc.h
> ++++ b/boehm-gc/include/gc.h
> +@@ -503,7 +503,7 @@ GC_API GC_PTR GC_malloc_atomic_ignore_off_page =
GC_PROTO((size_t lb));
> + #if defined(__linux__) || defined(__GLIBC__)
> + # include <features.h>
> + # if (__GLIBC__ =3D=3D 2 && __GLIBC_MINOR__ >=3D 1 || __GLIBC__ > 2) =
\
> +-     && !defined(__ia64__)
> ++     && !defined(__ia64__) && !defined(__UCLIBC__)
> + #   ifndef GC_HAVE_BUILTIN_BACKTRACE
> + #     define GC_HAVE_BUILTIN_BACKTRACE
> + #   endif
> +--=20
> +1.7.10.4
> +
> diff --git a/meta/recipes-devtools/gcc/gcc-4.8/0009-c99-snprintf.patch =
b/meta/recipes-devtools/gcc/gcc-4.8/0009-c99-snprintf.patch
> new file mode 100644
> index 0000000..228e1a7
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-4.8/0009-c99-snprintf.patch
> @@ -0,0 +1,28 @@
> +=46rom e393e076f1ab82d25e1aa04d6edea27b41d3eb06 Mon Sep 17 00:00:00 =
2001
> +From: Elvis Dowson <elvis.dowson@gmail.com>
> +Date: Fri, 29 Mar 2013 08:49:03 +0400
> +Subject: [PATCH 09/35] c99-snprintf
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Upstream-Status: Pending
> +---
> + libstdc++-v3/include/c_std/cstdio |    2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/libstdc++-v3/include/c_std/cstdio =
b/libstdc++-v3/include/c_std/cstdio
> +index e85bd83..6af839a 100644
> +--- a/libstdc++-v3/include/c_std/cstdio
> ++++ b/libstdc++-v3/include/c_std/cstdio
> +@@ -139,7 +139,7 @@ namespace std
> +   using ::vsprintf;
> + } // namespace std
> +=20
> +-#if _GLIBCXX_USE_C99
> ++#if _GLIBCXX_USE_C99 || defined(__UCLIBC__)
> +=20
> + #undef snprintf
> + #undef vfscanf
> +--=20
> +1.7.10.4
> +
> diff --git =
a/meta/recipes-devtools/gcc/gcc-4.8/0010-c99-complex-ugly-hack.patch =
b/meta/recipes-devtools/gcc/gcc-4.8/0010-c99-complex-ugly-hack.patch
> new file mode 100644
> index 0000000..a933770
> --- /dev/null
> +++ =
b/meta/recipes-devtools/gcc/gcc-4.8/0010-c99-complex-ugly-hack.patch
> @@ -0,0 +1,29 @@
> +=46rom 73f69d806e2c9561a54995223431a1076cfd6164 Mon Sep 17 00:00:00 =
2001
> +From: Elvis Dowson <elvis.dowson@gmail.com>
> +Date: Fri, 29 Mar 2013 08:49:57 +0400
> +Subject: [PATCH 10/35] c99-complex-ugly-hack
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Upstream-Status: Inappropriate [embedded specific]
> +---
> + libstdc++-v3/configure |    3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/libstdc++-v3/configure b/libstdc++-v3/configure
> +index c57a751..a1333e2 100755
> +--- a/libstdc++-v3/configure
> ++++ b/libstdc++-v3/configure
> +@@ -18734,6 +18734,9 @@ $as_echo_n "checking for ISO C99 support to =
TR1 in <complex.h>... " >&6; }
> +     cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> + /* end confdefs.h.  */
> + #include <complex.h>
> ++#ifdef __UCLIBC__
> ++#error ugly hack to make sure configure test fails here for cross =
until uClibc supports the complex funcs
> ++#endif
> + int
> + main ()
> + {
> +--=20
> +1.7.10.4
> +
> diff --git a/meta/recipes-devtools/gcc/gcc-4.8/0011-index_macro.patch =
b/meta/recipes-devtools/gcc/gcc-4.8/0011-index_macro.patch
> new file mode 100644
> index 0000000..f44b3d2
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-4.8/0011-index_macro.patch
> @@ -0,0 +1,44 @@
> +=46rom b037953e40312b45ab84ed0a3ad882bb5e413101 Mon Sep 17 00:00:00 =
2001
> +From: Elvis Dowson <elvis.dowson@gmail.com>
> +Date: Fri, 29 Mar 2013 08:51:02 +0400
> +Subject: [PATCH 11/35] index_macro
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Upstream-Status: Pending
> +---
> + libstdc++-v3/include/ext/rope       |    3 +++
> + libstdc++-v3/include/ext/ropeimpl.h |    3 +++
> + 2 files changed, 6 insertions(+)
> +
> +diff --git a/libstdc++-v3/include/ext/rope =
b/libstdc++-v3/include/ext/rope
> +index 38eb1e8..158d21a 100644
> +--- a/libstdc++-v3/include/ext/rope
> ++++ b/libstdc++-v3/include/ext/rope
> +@@ -55,6 +55,9 @@
> + #include <bits/gthr.h>
> + #include <tr1/functional>
> +=20
> ++/* cope w/ index defined as macro, SuSv3 proposal */
> ++#undef index
> ++
> + # ifdef __GC
> + #   define __GC_CONST const
> + # else
> +diff --git a/libstdc++-v3/include/ext/ropeimpl.h =
b/libstdc++-v3/include/ext/ropeimpl.h
> +index d7b5cbd..b9b3acb 100644
> +--- a/libstdc++-v3/include/ext/ropeimpl.h
> ++++ b/libstdc++-v3/include/ext/ropeimpl.h
> +@@ -48,6 +48,9 @@
> + #include <ext/memory> // For uninitialized_copy_n
> + #include <ext/numeric> // For power
> +=20
> ++/* cope w/ index defined as macro, SuSv3 proposal */
> ++#undef index
> ++
> + namespace __gnu_cxx _GLIBCXX_VISIBILITY(default)
> + {
> + _GLIBCXX_BEGIN_NAMESPACE_VERSION
> +--=20
> +1.7.10.4
> +
> diff --git =
a/meta/recipes-devtools/gcc/gcc-4.8/0012-libmudflap-susv3-legacy.patch =
b/meta/recipes-devtools/gcc/gcc-4.8/0012-libmudflap-susv3-legacy.patch
> new file mode 100644
> index 0000000..5ef0e5d
> --- /dev/null
> +++ =
b/meta/recipes-devtools/gcc/gcc-4.8/0012-libmudflap-susv3-legacy.patch
> @@ -0,0 +1,64 @@
> +=46rom a0cb13bdd98a941b81fdafe4cd96e4c569feb651 Mon Sep 17 00:00:00 =
2001
> +From: Elvis Dowson <elvis.dowson@gmail.com>
> +Date: Fri, 29 Mar 2013 08:52:36 +0400
> +Subject: [PATCH 12/35] libmudflap-susv3-legacy
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Upstream-Status: Inappropriate [embedded specific]
> +---
> + libmudflap/mf-hooks2.c |   10 +++++-----
> + 1 file changed, 5 insertions(+), 5 deletions(-)
> +
> +diff --git a/libmudflap/mf-hooks2.c b/libmudflap/mf-hooks2.c
> +index 4af17df..a3c6b2f 100644
> +--- a/libmudflap/mf-hooks2.c
> ++++ b/libmudflap/mf-hooks2.c
> +@@ -424,7 +424,7 @@ WRAPPER2(void, bzero, void *s, size_t n)
> + {
> +   TRACE ("%s\n", __PRETTY_FUNCTION__);
> +   MF_VALIDATE_EXTENT(s, n, __MF_CHECK_WRITE, "bzero region");
> +-  bzero (s, n);
> ++  memset (s, 0, n);
> + }
> +=20
> +=20
> +@@ -434,7 +434,7 @@ WRAPPER2(void, bcopy, const void *src, void =
*dest, size_t n)
> +   TRACE ("%s\n", __PRETTY_FUNCTION__);
> +   MF_VALIDATE_EXTENT(src, n, __MF_CHECK_READ, "bcopy src");
> +   MF_VALIDATE_EXTENT(dest, n, __MF_CHECK_WRITE, "bcopy dest");
> +-  bcopy (src, dest, n);
> ++  memmove (dest, src, n);
> + }
> +=20
> +=20
> +@@ -444,7 +444,7 @@ WRAPPER2(int, bcmp, const void *s1, const void =
*s2, size_t n)
> +   TRACE ("%s\n", __PRETTY_FUNCTION__);
> +   MF_VALIDATE_EXTENT(s1, n, __MF_CHECK_READ, "bcmp 1st arg");
> +   MF_VALIDATE_EXTENT(s2, n, __MF_CHECK_READ, "bcmp 2nd arg");
> +-  return bcmp (s1, s2, n);
> ++  return n =3D=3D 0 ? 0 : memcmp (s1, s2, n);
> + }
> +=20
> +=20
> +@@ -453,7 +453,7 @@ WRAPPER2(char *, index, const char *s, int c)
> +   size_t n =3D strlen (s);
> +   TRACE ("%s\n", __PRETTY_FUNCTION__);
> +   MF_VALIDATE_EXTENT(s, CLAMPADD(n, 1), __MF_CHECK_READ, "index =
region");
> +-  return index (s, c);
> ++  return strchr (s, c);
> + }
> +=20
> +=20
> +@@ -462,7 +462,7 @@ WRAPPER2(char *, rindex, const char *s, int c)
> +   size_t n =3D strlen (s);
> +   TRACE ("%s\n", __PRETTY_FUNCTION__);
> +   MF_VALIDATE_EXTENT(s, CLAMPADD(n, 1), __MF_CHECK_READ, "rindex =
region");
> +-  return rindex (s, c);
> ++  return strrchr (s, c);
> + }
> +=20
> + /* XXX:  stpcpy, memccpy */
> +--=20
> +1.7.10.4
> +
> diff --git =
a/meta/recipes-devtools/gcc/gcc-4.8/0013-libstdc-namespace.patch =
b/meta/recipes-devtools/gcc/gcc-4.8/0013-libstdc-namespace.patch
> new file mode 100644
> index 0000000..2b79076
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-4.8/0013-libstdc-namespace.patch
> @@ -0,0 +1,54 @@
> +=46rom 104e4d66208f2726b14d2f5eebce90700cbc83c8 Mon Sep 17 00:00:00 =
2001
> +From: Elvis Dowson <elvis.dowson@gmail.com>
> +Date: Fri, 29 Mar 2013 08:54:02 +0400
> +Subject: [PATCH 13/35] libstdc++-namespace
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Upstream-Status: Pending
> +---
> + libstdc++-v3/config/locale/uclibc/messages_members.h |    4 +++-
> + libstdc++-v3/config/locale/uclibc/time_members.h     |    4 +++-
> + 2 files changed, 6 insertions(+), 2 deletions(-)
> +
> +diff --git a/libstdc++-v3/config/locale/uclibc/messages_members.h =
b/libstdc++-v3/config/locale/uclibc/messages_members.h
> +index 067657a..dd76a6c 100644
> +--- a/libstdc++-v3/config/locale/uclibc/messages_members.h
> ++++ b/libstdc++-v3/config/locale/uclibc/messages_members.h
> +@@ -32,7 +32,8 @@
> + //
> +=20
> + // Written by Benjamin Kosnik <bkoz@redhat.com>
> +-
> ++namespace std
> ++{
> + #ifdef __UCLIBC_MJN3_ONLY__
> + #warning fix prototypes for *textdomain funcs
> + #endif
> +@@ -116,3 +117,4 @@
> + 	   this->_S_create_c_locale(this->_M_c_locale_messages, __s);
> + 	 }
> +      }
> ++}
> +diff --git a/libstdc++-v3/config/locale/uclibc/time_members.h =
b/libstdc++-v3/config/locale/uclibc/time_members.h
> +index 1665dde..905c433 100644
> +--- a/libstdc++-v3/config/locale/uclibc/time_members.h
> ++++ b/libstdc++-v3/config/locale/uclibc/time_members.h
> +@@ -33,7 +33,8 @@
> + //
> +=20
> + // Written by Benjamin Kosnik <bkoz@redhat.com>
> +-
> ++namespace std
> ++{
> +   template<typename _CharT>
> +     __timepunct<_CharT>::__timepunct(size_t __refs)
> +     : facet(__refs), _M_data(NULL), _M_c_locale_timepunct(NULL),
> +@@ -75,3 +76,4 @@
> +       delete _M_data;
> +       _S_destroy_c_locale(_M_c_locale_timepunct);
> +     }
> ++}
> +--=20
> +1.7.10.4
> +
> diff --git a/meta/recipes-devtools/gcc/gcc-4.8/0014-sh-pr24836.patch =
b/meta/recipes-devtools/gcc/gcc-4.8/0014-sh-pr24836.patch
> new file mode 100644
> index 0000000..f7d6e1e
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-4.8/0014-sh-pr24836.patch
> @@ -0,0 +1,45 @@
> +=46rom edc9acb181810f234b6b9f7d2820b0e4f6a1eeaf Mon Sep 17 00:00:00 =
2001
> +From: Elvis Dowson <elvis.dowson@gmail.com>
> +Date: Fri, 29 Mar 2013 08:54:48 +0400
> +Subject: [PATCH 14/35] sh-pr24836
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Upstream-Status: Pending
> +
> =
+http://sourceforge.net/mailarchive/forum.php?thread_id=3D8959304&forum_id=
=3D5348
> +http://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D24836
> +---
> + gcc/configure    |    2 +-
> + gcc/configure.ac |    2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/gcc/configure b/gcc/configure
> +index e12a180..135bbf5 100755
> +--- a/gcc/configure
> ++++ b/gcc/configure
> +@@ -23378,7 +23378,7 @@ foo:	.long	25
> + 	tls_first_minor=3D14
> + 	tls_as_opt=3D"-m64 -Aesame --fatal-warnings"
> + 	;;
> +-  sh-*-* | sh[34]-*-*)
> ++  sh-*-* | sh[34]*-*-*)
> +     conftest_s=3D'
> + 	.section ".tdata","awT",@progbits
> + foo:	.long	25
> +diff --git a/gcc/configure.ac b/gcc/configure.ac
> +index eba3577..6363a21 100644
> +--- a/gcc/configure.ac
> ++++ b/gcc/configure.ac
> +@@ -3141,7 +3141,7 @@ foo:	.long	25
> + 	tls_first_minor=3D14
> + 	tls_as_opt=3D"-m64 -Aesame --fatal-warnings"
> + 	;;
> +-  sh-*-* | sh[34]-*-*)
> ++  sh-*-* | sh[34]*-*-*)
> +     conftest_s=3D'
> + 	.section ".tdata","awT",@progbits
> + foo:	.long	25
> +--=20
> +1.7.10.4
> +
> diff --git =
a/meta/recipes-devtools/gcc/gcc-4.8/0015-arm-Use-TARGET_ENDIAN_OPTION-for-=
determining-MULTILI.patch =
b/meta/recipes-devtools/gcc/gcc-4.8/0015-arm-Use-TARGET_ENDIAN_OPTION-for-=
determining-MULTILI.patch
> new file mode 100644
> index 0000000..eda7b99
> --- /dev/null
> +++ =
b/meta/recipes-devtools/gcc/gcc-4.8/0015-arm-Use-TARGET_ENDIAN_OPTION-for-=
determining-MULTILI.patch
> @@ -0,0 +1,29 @@
> +=46rom 50e5366005b0f6af27378e2a5c3cb9f9936a7e62 Mon Sep 17 00:00:00 =
2001
> +From: Elvis Dowson <elvis.dowson@gmail.com>
> +Date: Fri, 29 Mar 2013 08:58:36 +0400
> +Subject: [PATCH 15/35] arm: Use TARGET_ENDIAN_OPTION for determining
> + MULTILIB_DEFAULTS
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Upstream-Status: Pending
> +---
> + gcc/config/arm/linux-elf.h |    2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/gcc/config/arm/linux-elf.h b/gcc/config/arm/linux-elf.h
> +index 488efa4..753dc3a 100644
> +--- a/gcc/config/arm/linux-elf.h
> ++++ b/gcc/config/arm/linux-elf.h
> +@@ -46,7 +46,7 @@
> +=20
> + #undef  MULTILIB_DEFAULTS
> + #define MULTILIB_DEFAULTS \
> +-	{ "marm", "mlittle-endian", "mfloat-abi=3Dhard", =
"mno-thumb-interwork" }
> ++	{ "marm", TARGET_ENDIAN_OPTION, "mfloat-abi=3Dhard", =
"mno-thumb-interwork" }
> +=20
> + /* Now we define the strings used to build the spec file.  */
> + #undef  LIB_SPEC
> +--=20
> +1.7.10.4
> +
> diff --git =
a/meta/recipes-devtools/gcc/gcc-4.8/0016-gcc-poison-system-directories.pat=
ch =
b/meta/recipes-devtools/gcc/gcc-4.8/0016-gcc-poison-system-directories.pat=
ch
> new file mode 100644
> index 0000000..c389154
> --- /dev/null
> +++ =
b/meta/recipes-devtools/gcc/gcc-4.8/0016-gcc-poison-system-directories.pat=
ch
> @@ -0,0 +1,224 @@
> +=46rom 160397ef3c3331099af028f1b8d3e085b07d88ad Mon Sep 17 00:00:00 =
2001
> +From: Elvis Dowson <elvis.dowson@gmail.com>
> +Date: Fri, 29 Mar 2013 08:59:00 +0400
> +Subject: [PATCH 16/35] gcc: poison-system-directories
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Upstream-Status: Inappropriate [distribution: codesourcery]
> +---
> + gcc/Makefile.in     |    2 +-
> + gcc/common.opt      |    4 ++++
> + gcc/config.in       |    6 ++++++
> + gcc/configure       |   20 ++++++++++++++++++--
> + gcc/configure.ac    |   10 ++++++++++
> + gcc/doc/invoke.texi |    9 +++++++++
> + gcc/gcc.c           |    2 ++
> + gcc/incpath.c       |   19 +++++++++++++++++++
> + 8 files changed, 69 insertions(+), 3 deletions(-)
> +
> +diff --git a/gcc/Makefile.in b/gcc/Makefile.in
> +index 54ea04f..90a2bba 100644
> +--- a/gcc/Makefile.in
> ++++ b/gcc/Makefile.in
> +@@ -2018,7 +2018,7 @@ attribs.o : attribs.c $(CONFIG_H) $(SYSTEM_H) =
coretypes.h $(TM_H) $(TREE_H) \
> +=20
> + incpath.o: incpath.c incpath.h $(CONFIG_H) $(SYSTEM_H) $(CPPLIB_H) \
> + 		intl.h prefix.h coretypes.h $(TM_H) cppdefault.h =
$(TARGET_H) \
> +-		$(MACHMODE_H)
> ++		$(MACHMODE_H) $(FLAGS_H) toplev.h
> +=20
> + CFLAGS-prefix.o +=3D -DPREFIX=3D\"$(prefix)\" -DBASEVER=3D$(BASEVER_s)=

> + prefix.o: prefix.c $(CONFIG_H) $(SYSTEM_H) coretypes.h prefix.h \
> +diff --git a/gcc/common.opt b/gcc/common.opt
> +index bdbd3b6..ab86b00 100644
> +--- a/gcc/common.opt
> ++++ b/gcc/common.opt
> +@@ -595,6 +595,10 @@ Wpedantic
> + Common Var(pedantic) Warning
> + Issue warnings needed for strict compliance to the standard
> +=20
> ++Wpoison-system-directories
> ++Common Var(flag_poison_system_directories) Init(1) Warning
> ++Warn for -I and -L options using system directories if cross =
compiling
> ++
> + Wshadow
> + Common Var(warn_shadow) Warning
> + Warn when one local variable shadows another
> +diff --git a/gcc/config.in b/gcc/config.in
> +index d80fb9f..0524af7 100644
> +--- a/gcc/config.in
> ++++ b/gcc/config.in
> +@@ -138,6 +138,12 @@
> + #endif
> +=20
> +=20
> ++/* Define to warn for use of native system header directories */
> ++#ifndef USED_FOR_TARGET
> ++#undef ENABLE_POISON_SYSTEM_DIRECTORIES
> ++#endif
> ++
> ++
> + /* Define if you want all operations on RTL (the basic data =
structure of the
> +    optimizer and back end) to be checked for dynamic type safety at =
runtime.
> +    This is quite expensive. */
> +diff --git a/gcc/configure b/gcc/configure
> +index 135bbf5..b65d21d 100755
> +--- a/gcc/configure
> ++++ b/gcc/configure
> +@@ -917,6 +917,7 @@ with_gc
> + with_system_zlib
> + enable_maintainer_mode
> + enable_version_specific_runtime_libs
> ++enable_poison_system_directories
> + enable_plugin
> + enable_libquadmath_support
> + with_linker_hash_style
> +@@ -1630,6 +1631,8 @@ Optional Features:
> +   --enable-version-specific-runtime-libs
> +                           specify that runtime libraries should be =
installed
> +                           in a compiler-specific directory
> ++  --enable-poison-system-directories
> ++                          warn for use of native system header =
directories
> +   --enable-plugin         enable plugin support
> +   --disable-libquadmath-support
> +                           disable libquadmath support for Fortran
> +@@ -17828,7 +17831,7 @@ else
> +   lt_dlunknown=3D0; lt_dlno_uscore=3D1; lt_dlneed_uscore=3D2
> +   lt_status=3D$lt_dlunknown
> +   cat > conftest.$ac_ext <<_LT_EOF
> +-#line 17831 "configure"
> ++#line 17834 "configure"
> + #include "confdefs.h"
> +=20
> + #if HAVE_DLFCN_H
> +@@ -17934,7 +17937,7 @@ else
> +   lt_dlunknown=3D0; lt_dlno_uscore=3D1; lt_dlneed_uscore=3D2
> +   lt_status=3D$lt_dlunknown
> +   cat > conftest.$ac_ext <<_LT_EOF
> +-#line 17937 "configure"
> ++#line 17940 "configure"
> + #include "confdefs.h"
> +=20
> + #if HAVE_DLFCN_H
> +@@ -27103,6 +27106,19 @@ if test =
"${enable_version_specific_runtime_libs+set}" =3D set; then :
> + fi
> +=20
> +=20
> ++# Check whether --enable-poison-system-directories was given.
> ++if test "${enable_poison_system_directories+set}" =3D set; then :
> ++  enableval=3D$enable_poison_system_directories;
> ++else
> ++  enable_poison_system_directories=3Dno
> ++fi
> ++
> ++if test "x${enable_poison_system_directories}" =3D "xyes"; then
> ++
> ++$as_echo "#define ENABLE_POISON_SYSTEM_DIRECTORIES 1" >>confdefs.h
> ++
> ++fi
> ++
> + # Substitute configuration variables
> +=20
> +=20
> +diff --git a/gcc/configure.ac b/gcc/configure.ac
> +index 6363a21..e226b85 100644
> +--- a/gcc/configure.ac
> ++++ b/gcc/configure.ac
> +@@ -5063,6 +5063,16 @@ AC_ARG_ENABLE(version-specific-runtime-libs,
> +                 [specify that runtime libraries should be
> +                  installed in a compiler-specific directory])])
> +=20
> ++AC_ARG_ENABLE([poison-system-directories],
> ++             AS_HELP_STRING([--enable-poison-system-directories],
> ++                            [warn for use of native system header =
directories]),,
> ++             [enable_poison_system_directories=3Dno])
> ++if test "x${enable_poison_system_directories}" =3D "xyes"; then
> ++  AC_DEFINE([ENABLE_POISON_SYSTEM_DIRECTORIES],
> ++           [1],
> ++           [Define to warn for use of native system header =
directories])
> ++fi
> ++
> + # Substitute configuration variables
> + AC_SUBST(subdirs)
> + AC_SUBST(srcdir)
> +diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
> +index 9273d7d..a022622 100644
> +--- a/gcc/doc/invoke.texi
> ++++ b/gcc/doc/invoke.texi
> +@@ -258,6 +258,7 @@ Objective-C and Objective-C++ Dialects}.
> + -Woverlength-strings  -Wpacked  -Wpacked-bitfield-compat  -Wpadded =
@gol
> + -Wparentheses  -Wpedantic-ms-format -Wno-pedantic-ms-format @gol
> + -Wpointer-arith  -Wno-pointer-to-int-cast @gol
> ++-Wno-poison-system-directories @gol
> + -Wredundant-decls  -Wno-return-local-addr @gol
> + -Wreturn-type  -Wsequence-point  -Wshadow @gol
> + -Wsign-compare  -Wsign-conversion  -Wsizeof-pointer-memaccess @gol
> +@@ -4007,6 +4008,14 @@ headers---for that, @option{-Wunknown-pragmas} =
must also be used.
> +  for most targets, it is made up of code and thus requires the stack
> +  to be made executable in order for the program to work properly.
> +=20
> ++@item -Wno-poison-system-directories
> ++@opindex Wno-poison-system-directories
> ++Do not warn for @option{-I} or @option{-L} options using system
> ++directories such as @file{/usr/include} when cross compiling.  This
> ++option is intended for use in chroot environments when such
> ++directories contain the correct headers and libraries for the target
> ++system rather than the host.
> ++
> + @item -Wfloat-equal
> + @opindex Wfloat-equal
> + @opindex Wno-float-equal
> +diff --git a/gcc/gcc.c b/gcc/gcc.c
> +index 86077f8..efdb625 100644
> +--- a/gcc/gcc.c
> ++++ b/gcc/gcc.c
> +@@ -740,6 +740,8 @@ proper position among the other output files.  */
> +    "%{fuse-ld=3D*:-fuse-ld=3D%*}\
> +     %X %{o*} %{e*} %{N} %{n} %{r}\
> +     %{s} %{t} %{u*} %{z} %{Z} %{!nostdlib:%{!nostartfiles:%S}}\
> ++    %{Wno-poison-system-directories:--no-poison-system-directories}\
> ++    =
%{Werror=3Dpoison-system-directories:--error-poison-system-directories}\
> +     %{static:} %{L*} %(mfwrap) %(link_libgcc) " SANITIZER_EARLY_SPEC =
" %o\
> +     =
%{fopenmp|ftree-parallelize-loops=3D*:%:include(libgomp.spec)%(link_gomp)}=
\
> +     %{fgnu-tm:%:include(libitm.spec)%(link_itm)}\
> +diff --git a/gcc/incpath.c b/gcc/incpath.c
> +index 018da98..cd41c78 100644
> +--- a/gcc/incpath.c
> ++++ b/gcc/incpath.c
> +@@ -28,6 +28,7 @@
> + #include "intl.h"
> + #include "incpath.h"
> + #include "cppdefault.h"
> ++#include "diagnostic-core.h"
> +=20
> + /* Microsoft Windows does not natively support inodes.
> +    VMS has non-numeric inodes.  */
> +@@ -382,6 +383,24 @@ merge_include_chains (const char *sysroot, =
cpp_reader *pfile, int verbose)
> + 	}
> +       fprintf (stderr, _("End of search list.\n"));
> +     }
> ++
> ++#ifdef ENABLE_POISON_SYSTEM_DIRECTORIES
> ++  if (flag_poison_system_directories)
> ++    {
> ++       struct cpp_dir *p;
> ++
> ++       for (p =3D heads[QUOTE]; p; p =3D p->next)
> ++         {
> ++          if ((!strncmp (p->name, "/usr/include", 12))
> ++              || (!strncmp (p->name, "/usr/local/include", 18))
> ++              || (!strncmp (p->name, "/usr/X11R6/include", 18)))
> ++            warning (OPT_Wpoison_system_directories,
> ++                     "include location \"%s\" is unsafe for "
> ++                     "cross-compilation",
> ++                     p->name);
> ++         }
> ++    }
> ++#endif
> + }
> +=20
> + /* Use given -I paths for #include "..." but not #include <...>, and
> +--=20
> +1.7.10.4
> +
> diff --git =
a/meta/recipes-devtools/gcc/gcc-4.8/0017-gcc-poison-dir-extend.patch =
b/meta/recipes-devtools/gcc/gcc-4.8/0017-gcc-poison-dir-extend.patch
> new file mode 100644
> index 0000000..7f3d000
> --- /dev/null
> +++ =
b/meta/recipes-devtools/gcc/gcc-4.8/0017-gcc-poison-dir-extend.patch
> @@ -0,0 +1,39 @@
> +=46rom e99c9c97266d6d3e8cac798aa91408250c4d60cf Mon Sep 17 00:00:00 =
2001
> +From: Elvis Dowson <elvis.dowson@gmail.com>
> +Date: Fri, 29 Mar 2013 09:00:34 +0400
> +Subject: [PATCH 17/35] gcc-poison-dir-extend
> +
> +Add /sw/include and /opt/include based on the original
> +zecke-no-host-includes.patch patch.  The original patch checked for
> +/usr/include, /sw/include and /opt/include and then triggered a =
failure and
> +aborted.
> +
> +Instead, we add the two missing items to the current scan.  If the =
user
> +wants this to be a failure, they can add =
"-Werror=3Dpoison-system-directories".
> +
> +Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Upstream-Status: Pending
> +---
> + gcc/incpath.c |    4 +++-
> + 1 file changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/gcc/incpath.c b/gcc/incpath.c
> +index cd41c78..eac4a92 100644
> +--- a/gcc/incpath.c
> ++++ b/gcc/incpath.c
> +@@ -393,7 +393,9 @@ merge_include_chains (const char *sysroot, =
cpp_reader *pfile, int verbose)
> +          {
> +           if ((!strncmp (p->name, "/usr/include", 12))
> +               || (!strncmp (p->name, "/usr/local/include", 18))
> +-              || (!strncmp (p->name, "/usr/X11R6/include", 18)))
> ++              || (!strncmp (p->name, "/usr/X11R6/include", 18))
> ++              || (!strncmp (p->name, "/sw/include", 11))
> ++              || (!strncmp (p->name, "/opt/include", 12)))
> +             warning (OPT_Wpoison_system_directories,
> +                      "include location \"%s\" is unsafe for "
> +                      "cross-compilation",
> +--=20
> +1.7.10.4
> +
> diff --git =
a/meta/recipes-devtools/gcc/gcc-4.8/0018-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARG=
ET.patch =
b/meta/recipes-devtools/gcc/gcc-4.8/0018-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARG=
ET.patch
> new file mode 100644
> index 0000000..b2d657e
> --- /dev/null
> +++ =
b/meta/recipes-devtools/gcc/gcc-4.8/0018-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARG=
ET.patch
> @@ -0,0 +1,73 @@
> +=46rom 56207fa2923e8edf774e98ffac82666091076be3 Mon Sep 17 00:00:00 =
2001
> +From: Elvis Dowson <elvis.dowson@gmail.com>
> +Date: Fri, 29 Mar 2013 09:08:31 +0400
> +Subject: [PATCH 18/35] gcc-4.3.3: SYSROOT_CFLAGS_FOR_TARGET
> +
> +Before committing, I noticed that PR/32161 was marked as a dup of =
PR/32009, but my previous patch did not fix it.
> +
> +This alternative patch is better because it lets you just use =
CFLAGS_FOR_TARGET to set the compilation flags for libgcc. Since =
bootstrapped target libraries are never compiled with the native =
compiler, it makes little sense to use different flags for stage1 and =
later stages. And it also makes little sense to use a different variable =
than CFLAGS_FOR_TARGET.
> +
> +Other changes I had to do include:
> +
> +- moving the creation of default CFLAGS_FOR_TARGET from Makefile.am =
to configure.ac, because otherwise the BOOT_CFLAGS are substituted into =
CFLAGS_FOR_TARGET (which is "-O2 -g $(CFLAGS)") via $(CFLAGS). It is =
also cleaner this way though.
> +
> +- passing the right CFLAGS to configure scripts as exported =
environment variables
> +
> +I also stopped passing LIBCFLAGS to configure scripts since they are =
unused in the whole src tree. And I updated the documentation as H-P =
reminded me to do.
> +
> +Bootstrapped/regtested i686-pc-linux-gnu, will commit to 4.4 shortly. =
Ok for 4.3?
> +
> +Signed-off-by: Paolo Bonzini  <bonzini@gnu.org>
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Upstream-Status: Pending
> +---
> + configure |   32 ++++++++++++++++++++++++++++++++
> + 1 file changed, 32 insertions(+)
> +
> +diff --git a/configure b/configure
> +index 1b76c90..e4dce7c 100755
> +--- a/configure
> ++++ b/configure
> +@@ -6772,6 +6772,38 @@ fi
> +=20
> +=20
> +=20
> ++# During gcc bootstrap, if we use some random cc for stage1 then =
CFLAGS
> ++# might be empty or "-g".  We don't require a C++ compiler, so =
CXXFLAGS
> ++# might also be empty (or "-g", if a non-GCC C++ compiler is in the =
path).
> ++# We want to ensure that TARGET libraries (which we know are built =
with
> ++# gcc) are built with "-O2 -g", so include those options when =
setting
> ++# CFLAGS_FOR_TARGET and CXXFLAGS_FOR_TARGET.
> ++if test "x$CFLAGS_FOR_TARGET" =3D x; then
> ++  CFLAGS_FOR_TARGET=3D$CFLAGS
> ++  case " $CFLAGS " in
> ++    *" -O2 "*) ;;
> ++    *) CFLAGS_FOR_TARGET=3D"-O2 $CFLAGS" ;;
> ++  esac
> ++  case " $CFLAGS " in
> ++    *" -g "* | *" -g3 "*) ;;
> ++    *) CFLAGS_FOR_TARGET=3D"-g $CFLAGS" ;;
> ++  esac
> ++fi
> ++
> ++
> ++if test "x$CXXFLAGS_FOR_TARGET" =3D x; then
> ++  CXXFLAGS_FOR_TARGET=3D$CXXFLAGS
> ++  case " $CXXFLAGS " in
> ++    *" -O2 "*) ;;
> ++    *) CXXFLAGS_FOR_TARGET=3D"-O2 $CXXFLAGS" ;;
> ++  esac
> ++  case " $CXXFLAGS " in
> ++    *" -g "* | *" -g3 "*) ;;
> ++    *) CXXFLAGS_FOR_TARGET=3D"-g $CXXFLAGS" ;;
> ++  esac
> ++fi
> ++
> ++
> + # Handle --with-headers=3DXXX.  If the value is not "yes", the =
contents of
> + # the named directory are copied to $(tooldir)/sys-include.
> + if test x"${with_headers}" !=3D x && test x"${with_headers}" !=3D =
xno ; then
> +--=20
> +1.7.10.4
> +
> diff --git =
a/meta/recipes-devtools/gcc/gcc-4.8/0019-64-bit-multilib-hack.patch =
b/meta/recipes-devtools/gcc/gcc-4.8/0019-64-bit-multilib-hack.patch
> new file mode 100644
> index 0000000..dddda41
> --- /dev/null
> +++ =
b/meta/recipes-devtools/gcc/gcc-4.8/0019-64-bit-multilib-hack.patch
> @@ -0,0 +1,82 @@
> +=46rom 18fde5740b09324dfb9cf41e9849672573ff5fa0 Mon Sep 17 00:00:00 =
2001
> +From: Elvis Dowson <elvis.dowson@gmail.com>
> +Date: Fri, 29 Mar 2013 09:10:06 +0400
> +Subject: [PATCH 19/35] 64-bit multilib hack.
> +
> +GCC has internal multilib handling code but it assumes a very =
specific rigid directory
> +layout. The build system implementation of multilib layout is very =
generic and allows
> +complete customisation of the library directories.
> +
> +This patch is a partial solution to allow any custom directories to =
be passed into gcc
> +and handled correctly. It forces gcc to use the base_libdir (which is =
the current
> +directory, "."). We need to do this for each multilib that is =
configured as we don't
> +know which compiler options may be being passed into the compiler. =
Since we have a compiler
> +per mulitlib at this point that isn't an issue.
> +
> +The one problem is the target compiler is only going to work for the =
default multlilib at
> +this point. Ideally we'd figure out which multilibs were being =
enabled with which paths
> +and be able to patch these entries with a complete set of correct =
paths but this we
> +don't have such code at this point. This is something the target gcc =
recipe should do
> +and override these platform defaults in its build config.
> +
> +RP 15/8/11
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
> +
> +Upstream-Status: Pending
> +---
> + gcc/config/i386/t-linux64   |    6 ++----
> + gcc/config/mips/t-linux64   |   10 +++-------
> + gcc/config/rs6000/t-linux64 |    5 ++---
> + 3 files changed, 7 insertions(+), 14 deletions(-)
> +
> +diff --git a/gcc/config/i386/t-linux64 b/gcc/config/i386/t-linux64
> +index bcea0c6..eb004d7 100644
> +--- a/gcc/config/i386/t-linux64
> ++++ b/gcc/config/i386/t-linux64
> +@@ -32,7 +32,5 @@
> + #
> + comma=3D,
> + MULTILIB_OPTIONS    =3D $(subst $(comma),/,$(TM_MULTILIB_CONFIG))
> +-MULTILIB_DIRNAMES   =3D $(patsubst m%, %, $(subst /, =
,$(MULTILIB_OPTIONS)))
> +-MULTILIB_OSDIRNAMES =3D m64=3D../lib64$(call =
if_multiarch,:x86_64-linux-gnu)
> +-MULTILIB_OSDIRNAMES+=3D m32=3D$(if $(wildcard $(shell echo =
$(SYSTEM_HEADER_DIR))/../../usr/lib32),../lib32,../lib)$(call =
if_multiarch,:i386-linux-gnu)
> +-MULTILIB_OSDIRNAMES+=3D mx32=3D../libx32$(call =
if_multiarch,:x86_64-linux-gnux32)
> ++MULTILIB_DIRNAMES =3D . .
> ++MULTILIB_OSDIRNAMES =3D ../$(shell basename $(base_libdir)) =
../$(shell basename $(base_libdir))
> +diff --git a/gcc/config/mips/t-linux64 b/gcc/config/mips/t-linux64
> +index bdbbd4f..16a6366 100644
> +--- a/gcc/config/mips/t-linux64
> ++++ b/gcc/config/mips/t-linux64
> +@@ -17,10 +17,6 @@
> + # <http://www.gnu.org/licenses/>.
> +=20
> + MULTILIB_OPTIONS =3D mabi=3Dn32/mabi=3D32/mabi=3D64
> +-MULTILIB_DIRNAMES =3D n32 32 64
> +-MIPS_EL =3D $(if $(filter %el, $(firstword $(subst -, =
,$(target)))),el)
> +-MIPS_SOFT =3D $(if $(strip $(filter MASK_SOFT_FLOAT_ABI, =
$(target_cpu_default)) $(filter soft, $(with_float))),soft)
> +-MULTILIB_OSDIRNAMES =3D \
> +-	../lib32$(call =
if_multiarch,:mips64$(MIPS_EL)-linux-gnuabin32$(MIPS_SOFT)) \
> +-	../lib$(call if_multiarch,:mips$(MIPS_EL)-linux-gnu$(MIPS_SOFT)) =
\
> +-	../lib64$(call =
if_multiarch,:mips64$(MIPS_EL)-linux-gnuabi64$(MIPS_SOFT))
> ++MULTILIB_DIRNAMES =3D . . .
> ++MULTILIB_OSDIRNAMES =3D ../$(shell basename $(base_libdir)) =
../$(shell basename $(base_libdir)) ../$(shell basename $(base_libdir))
> ++
> +diff --git a/gcc/config/rs6000/t-linux64 =
b/gcc/config/rs6000/t-linux64
> +index 9175de2..3971019 100644
> +--- a/gcc/config/rs6000/t-linux64
> ++++ b/gcc/config/rs6000/t-linux64
> +@@ -26,7 +26,6 @@
> + # MULTILIB_OSDIRNAMES according to what is found on the target.
> +=20
> + MULTILIB_OPTIONS        =3D m64/m32
> +-MULTILIB_DIRNAMES       =3D 64 32
> ++MULTILIB_DIRNAMES       =3D . .
> + MULTILIB_EXTRA_OPTS     =3D fPIC
> +-MULTILIB_OSDIRNAMES	=3D ../lib64$(call =
if_multiarch,:powerpc64-linux-gnu)
> +-MULTILIB_OSDIRNAMES    +=3D $(if $(wildcard $(shell echo =
$(SYSTEM_HEADER_DIR))/../../usr/lib32),../lib32,../lib)$(call =
if_multiarch,:powerpc-linux-gnu)
> ++MULTILIB_OSDIRNAMES    =3D ../$(shell basename $(base_libdir)) =
../$(shell basename $(base_libdir))
> +--=20
> +1.7.10.4
> +
> diff --git =
a/meta/recipes-devtools/gcc/gcc-4.8/0020-optional-libstdc.patch =
b/meta/recipes-devtools/gcc/gcc-4.8/0020-optional-libstdc.patch
> new file mode 100644
> index 0000000..a7a9f0d
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-4.8/0020-optional-libstdc.patch
> @@ -0,0 +1,102 @@
> +=46rom 307c8ff3ef666b7bd5ac733863f2fbb27a9d521e Mon Sep 17 00:00:00 =
2001
> +From: Elvis Dowson <elvis.dowson@gmail.com>
> +Date: Fri, 29 Mar 2013 09:12:56 +0400
> +Subject: [PATCH 20/35] optional libstdc
> +
> +gcc-runtime builds libstdc++ separately from gcc-cross-*. Its =
configure tests using g++
> +will not run correctly since by default the linker will try to link =
against libstdc++
> +which shouldn't exist yet. We need an option to disable -lstdc++
> +option whilst leaving -lc, -lgcc and other automatic library =
dependencies added by gcc
> +driver. This patch adds such an option which only disables the =
-lstdc++.
> +
> +A "standard" gcc build uses xgcc and hence avoids this. We should ask =
upstream how to
> +do this officially, the likely answer is don't build libstdc++ =
separately.
> +
> +RP 29/6/10
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Upstream-Status: Inappropriate [embedded specific]
> +---
> + gcc/c-family/c.opt  |    4 ++++
> + gcc/cp/g++spec.c    |    1 +
> + gcc/doc/invoke.texi |    9 +++++++--
> + gcc/gcc.c           |    1 +
> + 4 files changed, 13 insertions(+), 2 deletions(-)
> +
> +diff --git a/gcc/c-family/c.opt b/gcc/c-family/c.opt
> +index 10ae84d..dc3ffdf 100644
> +--- a/gcc/c-family/c.opt
> ++++ b/gcc/c-family/c.opt
> +@@ -1299,6 +1299,10 @@ nostdinc++
> + C++ ObjC++
> + Do not search standard system include directories for C++
> +=20
> ++nostdlib++
> ++Driver
> ++Do not link standard C++ runtime library
> ++
> + o
> + C ObjC C++ ObjC++ Joined Separate
> + ; Documented in common.opt
> +diff --git a/gcc/cp/g++spec.c b/gcc/cp/g++spec.c
> +index b896eea..f55216b 100644
> +--- a/gcc/cp/g++spec.c
> ++++ b/gcc/cp/g++spec.c
> +@@ -126,6 +126,7 @@ lang_specific_driver (struct cl_decoded_option =
**in_decoded_options,
> +       switch (decoded_options[i].opt_index)
> + 	{
> + 	case OPT_nostdlib:
> ++	case OPT_nostdlib__:
> + 	case OPT_nodefaultlibs:
> + 	  library =3D -1;
> + 	  break;
> +diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
> +index a022622..f15c991 100644
> +--- a/gcc/doc/invoke.texi
> ++++ b/gcc/doc/invoke.texi
> +@@ -190,7 +190,7 @@ in the following sections.
> + -frepo  -fno-rtti  -fstats  -ftemplate-backtrace-limit=3D@var{n} =
@gol
> + -ftemplate-depth=3D@var{n} @gol
> + -fno-threadsafe-statics -fuse-cxa-atexit  -fno-weak  -nostdinc++ =
@gol
> +--fno-default-inline  -fvisibility-inlines-hidden @gol
> ++-nostdlib++ -fno-default-inline  -fvisibility-inlines-hidden @gol
> + -fvisibility-ms-compat @gol
> + -fext-numeric-literals @gol
> + -Wabi  -Wconversion-null  -Wctor-dtor-privacy @gol
> +@@ -453,7 +453,7 @@ Objective-C and Objective-C++ Dialects}.
> + -nostartfiles  -nodefaultlibs  -nostdlib -pie -rdynamic @gol
> + -s  -static -static-libgcc -static-libstdc++ @gol
> + -static-libasan -static-libtsan @gol
> +--shared -shared-libgcc  -symbolic @gol
> ++-shared -shared-libgcc  -symbolic -nostdlib++ @gol
> + -T @var{script}  -Wl,@var{option}  -Xlinker @var{option} @gol
> + -u @var{symbol}}
> +=20
> +@@ -9886,6 +9886,11 @@ These entries are usually resolved by entries =
in
> + libc.  These entry points should be supplied through some other
> + mechanism when this option is specified.
> +=20
> ++@item -nostdlib++
> ++@opindex nostdlib++
> ++Do not use the standard system C++ runtime libraries when linking.
> ++Only the libraries you specify will be passed to the linker.
> ++
> + @cindex @option{-lgcc}, use with @option{-nostdlib}
> + @cindex @option{-nostdlib} and unresolved references
> + @cindex unresolved references and @option{-nostdlib}
> +diff --git a/gcc/gcc.c b/gcc/gcc.c
> +index efdb625..477752f 100644
> +--- a/gcc/gcc.c
> ++++ b/gcc/gcc.c
> +@@ -748,6 +748,7 @@ proper position among the other output files.  */
> +     %(mflib) " STACK_SPLIT_SPEC "\
> +     %{fprofile-arcs|fprofile-generate*|coverage:-lgcov} " =
SANITIZER_SPEC " \
> +     %{!nostdlib:%{!nodefaultlibs:%(link_ssp) =
%(link_gcc_c_sequence)}}\
> ++    %{!nostdlib++:}\
> +     %{!nostdlib:%{!nostartfiles:%E}} %{T*} }}}}}}"
> + #endif
> +=20
> +--=20
> +1.7.10.4
> +
> diff --git =
a/meta/recipes-devtools/gcc/gcc-4.8/0021-gcc-disable-MASK_RELAX_PIC_CALLS-=
bit.patch =
b/meta/recipes-devtools/gcc/gcc-4.8/0021-gcc-disable-MASK_RELAX_PIC_CALLS-=
bit.patch
> new file mode 100644
> index 0000000..26c0647
> --- /dev/null
> +++ =
b/meta/recipes-devtools/gcc/gcc-4.8/0021-gcc-disable-MASK_RELAX_PIC_CALLS-=
bit.patch
> @@ -0,0 +1,59 @@
> +=46rom 004696e054ae9dc71d512cc755ccc4074fc62b2d Mon Sep 17 00:00:00 =
2001
> +From: Elvis Dowson <elvis.dowson@gmail.com>
> +Date: Fri, 29 Mar 2013 09:14:20 +0400
> +Subject: [PATCH 21/35] gcc: disable MASK_RELAX_PIC_CALLS bit
> +
> +The new feature added after 4.3.3
> =
+"http://www.pubbs.net/200909/gcc/94048-patch-add-support-for-rmipsjalr.ht=
ml"
> +will cause cc1plus eat up all the system memory when build =
webkit-gtk.
> +The function mips_get_pic_call_symbol keeps on recursively calling =
itself.
> +Disable this feature to walk aside the bug.
> +
> +Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Upstream-Status: Inappropriate [configuration]
> +---
> + gcc/configure    |    7 -------
> + gcc/configure.ac |    7 -------
> + 2 files changed, 14 deletions(-)
> +
> +diff --git a/gcc/configure b/gcc/configure
> +index b65d21d..bdab45a 100755
> +--- a/gcc/configure
> ++++ b/gcc/configure
> +@@ -25829,13 +25829,6 @@ $as_echo_n "checking assembler and linker =
for explicit JALR relocation... " >&6;
> +         rm -f conftest.*
> +       fi
> +     fi
> +-    if test $gcc_cv_as_ld_jalr_reloc =3D yes; then
> +-      if test x$target_cpu_default =3D x; then
> +-        target_cpu_default=3DMASK_RELAX_PIC_CALLS
> +-      else
> +-        =
target_cpu_default=3D"($target_cpu_default)|MASK_RELAX_PIC_CALLS"
> +-      fi
> +-    fi
> +     { $as_echo "$as_me:${as_lineno-$LINENO}: result: =
$gcc_cv_as_ld_jalr_reloc" >&5
> + $as_echo "$gcc_cv_as_ld_jalr_reloc" >&6; }
> +=20
> +diff --git a/gcc/configure.ac b/gcc/configure.ac
> +index e226b85..5f5c909 100644
> +--- a/gcc/configure.ac
> ++++ b/gcc/configure.ac
> +@@ -4099,13 +4099,6 @@ x:
> +         rm -f conftest.*
> +       fi
> +     fi
> +-    if test $gcc_cv_as_ld_jalr_reloc =3D yes; then
> +-      if test x$target_cpu_default =3D x; then
> +-        target_cpu_default=3DMASK_RELAX_PIC_CALLS
> +-      else
> +-        =
target_cpu_default=3D"($target_cpu_default)|MASK_RELAX_PIC_CALLS"
> +-      fi
> +-    fi
> +     AC_MSG_RESULT($gcc_cv_as_ld_jalr_reloc)
> +=20
> +     AC_CACHE_CHECK([linker for .eh_frame personality relaxation],
> +--=20
> +1.7.10.4
> +
> diff --git =
a/meta/recipes-devtools/gcc/gcc-4.8/0022-COLLECT_GCC_OPTIONS.patch =
b/meta/recipes-devtools/gcc/gcc-4.8/0022-COLLECT_GCC_OPTIONS.patch
> new file mode 100644
> index 0000000..e8fa5db
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-4.8/0022-COLLECT_GCC_OPTIONS.patch
> @@ -0,0 +1,38 @@
> +=46rom 7f5c9dcc71c8b83a0b5596266cc4bdf0936e8e00 Mon Sep 17 00:00:00 =
2001
> +From: Elvis Dowson <elvis.dowson@gmail.com>
> +Date: Fri, 29 Mar 2013 09:16:28 +0400
> +Subject: [PATCH 22/35] COLLECT_GCC_OPTIONS
> +
> +This patch adds --sysroot into COLLECT_GCC_OPTIONS which is used to
> +invoke collect2.
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Upstream-Status: Pending
> +---
> + gcc/gcc.c |    9 +++++++++
> + 1 file changed, 9 insertions(+)
> +
> +diff --git a/gcc/gcc.c b/gcc/gcc.c
> +index 477752f..51062aa 100644
> +--- a/gcc/gcc.c
> ++++ b/gcc/gcc.c
> +@@ -4098,6 +4098,15 @@ set_collect_gcc_options (void)
> + 		sizeof ("COLLECT_GCC_OPTIONS=3D") - 1);
> +=20
> +   first_time =3D TRUE;
> ++#ifdef HAVE_LD_SYSROOT
> ++  if (target_system_root_changed && target_system_root)
> ++    {
> ++      obstack_grow (&collect_obstack, "'--sysroot=3D", =
sizeof("'--sysroot=3D")-1);
> ++      obstack_grow (&collect_obstack, =
target_system_root,strlen(target_system_root));
> ++      obstack_grow (&collect_obstack, "'", 1);
> ++      first_time =3D FALSE;
> ++    }
> ++#endif
> +   for (i =3D 0; (int) i < n_switches; i++)
> +     {
> +       const char *const *args;
> +--=20
> +1.7.10.4
> +
> diff --git =
a/meta/recipes-devtools/gcc/gcc-4.8/0023-Use-the-defaults.h-in-B-instead-o=
f-S-and-t-oe-in-B.patch =
b/meta/recipes-devtools/gcc/gcc-4.8/0023-Use-the-defaults.h-in-B-instead-o=
f-S-and-t-oe-in-B.patch
> new file mode 100644
> index 0000000..a6d6fcd
> --- /dev/null
> +++ =
b/meta/recipes-devtools/gcc/gcc-4.8/0023-Use-the-defaults.h-in-B-instead-o=
f-S-and-t-oe-in-B.patch
> @@ -0,0 +1,88 @@
> +=46rom 46d52439052f0876a92dcf8a0ab9c60d75c8030b Mon Sep 17 00:00:00 =
2001
> +From: Elvis Dowson <elvis.dowson@gmail.com>
> +Date: Fri, 29 Mar 2013 09:17:25 +0400
> +Subject: [PATCH 23/35] Use the defaults.h in ${B} instead of ${S}, =
and t-oe
> + in ${B}
> +
> +Use the defaults.h in ${B} instead of ${S}, and t-oe in ${B}, so that
> +the source can be shared between gcc-cross-initial,
> +gcc-cross-intermediate, gcc-cross, gcc-runtime, and also the sdk =
build.
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Upstream-Status: Pending
> +---
> + gcc/Makefile.in  |    2 +-
> + gcc/configure    |    4 ++--
> + gcc/configure.ac |    4 ++--
> + gcc/mkconfig.sh  |    4 ++--
> + 4 files changed, 7 insertions(+), 7 deletions(-)
> +
> +diff --git a/gcc/Makefile.in b/gcc/Makefile.in
> +index 90a2bba..2320497 100644
> +--- a/gcc/Makefile.in
> ++++ b/gcc/Makefile.in
> +@@ -469,7 +469,7 @@ TARGET_SYSTEM_ROOT =3D @TARGET_SYSTEM_ROOT@
> + TARGET_SYSTEM_ROOT_DEFINE =3D @TARGET_SYSTEM_ROOT_DEFINE@
> +=20
> + xmake_file=3D@xmake_file@
> +-tmake_file=3D@tmake_file@
> ++tmake_file=3D@tmake_file@ ./t-oe
> + TM_ENDIAN_CONFIG=3D@TM_ENDIAN_CONFIG@
> + TM_MULTILIB_CONFIG=3D@TM_MULTILIB_CONFIG@
> + TM_MULTILIB_EXCEPTIONS_CONFIG=3D@TM_MULTILIB_EXCEPTIONS_CONFIG@
> +diff --git a/gcc/configure b/gcc/configure
> +index bdab45a..d587993 100755
> +--- a/gcc/configure
> ++++ b/gcc/configure
> +@@ -11539,8 +11539,8 @@ for f in $tm_file; do
> +        tm_include_list=3D"${tm_include_list} $f"
> +        ;;
> +     defaults.h )
> +-       tm_file_list=3D"${tm_file_list} \$(srcdir)/$f"
> +-       tm_include_list=3D"${tm_include_list} $f"
> ++       tm_file_list=3D"${tm_file_list} ./$f"
> ++       tm_include_list=3D"${tm_include_list} ./$f"
> +        ;;
> +     * )
> +        tm_file_list=3D"${tm_file_list} \$(srcdir)/config/$f"
> +diff --git a/gcc/configure.ac b/gcc/configure.ac
> +index 5f5c909..5e5e84f 100644
> +--- a/gcc/configure.ac
> ++++ b/gcc/configure.ac
> +@@ -1720,8 +1720,8 @@ for f in $tm_file; do
> +        tm_include_list=3D"${tm_include_list} $f"
> +        ;;
> +     defaults.h )
> +-       tm_file_list=3D"${tm_file_list} \$(srcdir)/$f"
> +-       tm_include_list=3D"${tm_include_list} $f"
> ++       tm_file_list=3D"${tm_file_list} ./$f"
> ++       tm_include_list=3D"${tm_include_list} ./$f"
> +        ;;
> +     * )
> +        tm_file_list=3D"${tm_file_list} \$(srcdir)/config/$f"
> +diff --git a/gcc/mkconfig.sh b/gcc/mkconfig.sh
> +index 29fdfc7..e048dce 100644
> +--- a/gcc/mkconfig.sh
> ++++ b/gcc/mkconfig.sh
> +@@ -77,7 +77,7 @@ if [ -n "$HEADERS" ]; then
> +     if [ $# -ge 1 ]; then
> + 	echo '#ifdef IN_GCC' >> ${output}T
> + 	for file in "$@"; do
> +-	    if test x"$file" =3D x"defaults.h"; then
> ++	    if test x"$file" =3D x"./defaults.h"; then
> + 		postpone_defaults_h=3D"yes"
> + 	    else
> + 		echo "# include \"$file\"" >> ${output}T
> +@@ -103,7 +103,7 @@ esac
> +=20
> + # If we postponed including defaults.h, add the #include now.
> + if test x"$postpone_defaults_h" =3D x"yes"; then
> +-    echo "# include \"defaults.h\"" >> ${output}T
> ++    echo "# include \"./defaults.h\"" >> ${output}T
> + fi
> +=20
> + # Add multiple inclusion protection guard, part two.
> +--=20
> +1.7.10.4
> +
> diff --git =
a/meta/recipes-devtools/gcc/gcc-4.8/0024-PR-target-32219.patch =
b/meta/recipes-devtools/gcc/gcc-4.8/0024-PR-target-32219.patch
> new file mode 100644
> index 0000000..5f2274f
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-4.8/0024-PR-target-32219.patch
> @@ -0,0 +1,67 @@
> +=46rom e0d15f4f8bf28c351b9215ca37f1caa24df0e1fd Mon Sep 17 00:00:00 =
2001
> +From: Elvis Dowson <elvis.dowson@gmail.com>
> +Date: Fri, 29 Mar 2013 09:18:54 +0400
> +Subject: [PATCH 24/35] PR target/32219
> +
> +* varasm.c (default_binds_local_p_1): Weak data is not local.
> +
> +Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Upstream-Status: Backport
> +---
> + gcc/testsuite/gcc.dg/visibility-21.c |   14 ++++++++++++++
> + gcc/varasm.c                         |    9 ++++-----
> + 2 files changed, 18 insertions(+), 5 deletions(-)
> + create mode 100644 gcc/testsuite/gcc.dg/visibility-21.c
> +
> +diff --git a/gcc/testsuite/gcc.dg/visibility-21.c =
b/gcc/testsuite/gcc.dg/visibility-21.c
> +new file mode 100644
> +index 0000000..be7deda
> +--- /dev/null
> ++++ b/gcc/testsuite/gcc.dg/visibility-21.c
> +@@ -0,0 +1,14 @@
> ++/* PR target/32219 */
> ++/* { dg-do run } */
> ++/* { dg-require-visibility "" } */
> ++/* { dg-options "-fPIC" { target fpic } } */
> ++
> ++extern void f() __attribute__((weak,visibility("hidden")));
> ++extern int puts( char const* );
> ++int main()
> ++{
> ++	if (f)
> ++		f();
> ++	return 0;
> ++}
> ++
> +diff --git a/gcc/varasm.c b/gcc/varasm.c
> +index 6648103..fadba78 100644
> +--- a/gcc/varasm.c
> ++++ b/gcc/varasm.c
> +@@ -6675,6 +6675,10 @@ default_binds_local_p_1 (const_tree exp, int =
shlib)
> +   /* Static variables are always local.  */
> +   else if (! TREE_PUBLIC (exp))
> +     local_p =3D true;
> ++  /* hidden weak can't be overridden by something non-local, all
> ++     that is possible is that it is not defined at all. */
> ++  else if (DECL_WEAK (exp))
> ++    local_p =3D false;
> +   /* A variable is local if the user has said explicitly that it =
will
> +      be.  */
> +   else if ((DECL_VISIBILITY_SPECIFIED (exp)
> +@@ -6688,11 +6692,6 @@ default_binds_local_p_1 (const_tree exp, int =
shlib)
> +      local.  */
> +   else if (DECL_VISIBILITY (exp) !=3D VISIBILITY_DEFAULT)
> +     local_p =3D true;
> +-  /* Default visibility weak data can be overridden by a strong =
symbol
> +-     in another module and so are not local.  */
> +-  else if (DECL_WEAK (exp)
> +-	   && !resolved_locally)
> +-    local_p =3D false;
> +   /* If PIC, then assume that any global name can be overridden by
> +      symbols resolved from other modules.  */
> +   else if (shlib)
> +--=20
> +1.7.10.4
> +
> diff --git =
a/meta/recipes-devtools/gcc/gcc-4.8/0025-fortran-cross-compile-hack.patch =
b/meta/recipes-devtools/gcc/gcc-4.8/0025-fortran-cross-compile-hack.patch
> new file mode 100644
> index 0000000..34af5fc
> --- /dev/null
> +++ =
b/meta/recipes-devtools/gcc/gcc-4.8/0025-fortran-cross-compile-hack.patch
> @@ -0,0 +1,46 @@
> +=46rom af8a56ea4e17b2909eff2c57704ab43ef24f28d3 Mon Sep 17 00:00:00 =
2001
> +From: Elvis Dowson <elvis.dowson@gmail.com>
> +Date: Fri, 29 Mar 2013 09:20:01 +0400
> +Subject: [PATCH 25/35] fortran cross-compile hack.
> +
> +* Fortran would have searched for arm-angstrom-gnueabi-gfortran but =
would have used
> +used gfortan. For gcc_4.2.2.bb we want to use the gfortran compiler =
from our cross
> +directory.
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Upstream-Status: Inappropriate [embedded specific]
> +---
> + libgfortran/configure    |    2 +-
> + libgfortran/configure.ac |    2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/libgfortran/configure b/libgfortran/configure
> +index 8385e96..b8f7a92 100755
> +--- a/libgfortran/configure
> ++++ b/libgfortran/configure
> +@@ -12704,7 +12704,7 @@ esac
> +=20
> + # We need gfortran to compile parts of the library
> + #AC_PROG_FC(gfortran)
> +-FC=3D"$GFORTRAN"
> ++#FC=3D"$GFORTRAN"
> + ac_ext=3D${ac_fc_srcext-f}
> + ac_compile=3D'$FC -c $FCFLAGS $ac_fcflags_srcext conftest.$ac_ext =
>&5'
> + ac_link=3D'$FC -o conftest$ac_exeext $FCFLAGS $LDFLAGS =
$ac_fcflags_srcext conftest.$ac_ext $LIBS >&5'
> +diff --git a/libgfortran/configure.ac b/libgfortran/configure.ac
> +index 7d97fed..3f9f484 100644
> +--- a/libgfortran/configure.ac
> ++++ b/libgfortran/configure.ac
> +@@ -227,7 +227,7 @@ AC_SUBST(enable_static)
> +=20
> + # We need gfortran to compile parts of the library
> + #AC_PROG_FC(gfortran)
> +-FC=3D"$GFORTRAN"
> ++#FC=3D"$GFORTRAN"
> + AC_PROG_FC(gfortran)
> +=20
> + # extra LD Flags which are required for targets
> +--=20
> +1.7.10.4
> +
> diff --git =
a/meta/recipes-devtools/gcc/gcc-4.8/0026-libgcc-sjlj-check.patch =
b/meta/recipes-devtools/gcc/gcc-4.8/0026-libgcc-sjlj-check.patch
> new file mode 100644
> index 0000000..fbc6e75
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-4.8/0026-libgcc-sjlj-check.patch
> @@ -0,0 +1,74 @@
> +=46rom 08c2398445e6cac282488f64ae6bf29cbcd8db23 Mon Sep 17 00:00:00 =
2001
> +From: Elvis Dowson <elvis.dowson@gmail.com>
> +Date: Fri, 29 Mar 2013 09:20:50 +0400
> +Subject: [PATCH 26/35] libgcc-sjlj-check
> +
> +ac_fn_c_try_compile doesnt seem to keep the intermediate files
> +which are needed for sjlj test to pass since it greps into the
> +generated file. So we run the compiler command using AC_TRY_COMMAND
> +which then generates the needed .s file
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Upstream-Status: Pending
> +---
> + libgcc/configure    |   10 ++++++----
> + libgcc/configure.ac |   10 ++++------
> + 2 files changed, 10 insertions(+), 10 deletions(-)
> +
> +diff --git a/libgcc/configure b/libgcc/configure
> +index 1425df6..d18e3cb 100644
> +--- a/libgcc/configure
> ++++ b/libgcc/configure
> +@@ -4208,17 +4208,19 @@ void foo ()
> + }
> +=20
> + _ACEOF
> +-CFLAGS_hold=3D$CFLAGS
> +-CFLAGS=3D"--save-temps -fexceptions"
> + libgcc_cv_lib_sjlj_exceptions=3Dunknown
> +-if ac_fn_c_try_compile; then :
> ++if { ac_try=3D'${CC-cc} -fexceptions -S conftest.c -o conftest.s =
1>&5'
> ++  { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_try\""; } =
>&5
> ++  (eval $ac_try) 2>&5
> ++  ac_status=3D$?
> ++  $as_echo "$as_me:${as_lineno-$LINENO}: \$? =3D $ac_status" >&5
> ++  test $ac_status =3D 0; }; }; then
> +   if grep _Unwind_SjLj_Resume conftest.s >/dev/null 2>&1; then
> +     libgcc_cv_lib_sjlj_exceptions=3Dyes
> +   elif grep _Unwind_Resume conftest.s >/dev/null 2>&1; then
> +     libgcc_cv_lib_sjlj_exceptions=3Dno
> +   fi
> + fi
> +-CFLAGS=3D$CFLAGS_hold
> + rm -f conftest*
> +=20
> + fi
> +diff --git a/libgcc/configure.ac b/libgcc/configure.ac
> +index 8b7aba5..c7c9644 100644
> +--- a/libgcc/configure.ac
> ++++ b/libgcc/configure.ac
> +@@ -216,16 +216,14 @@ void foo ()
> +   bar();
> + }
> + ])])
> +-CFLAGS_hold=3D$CFLAGS
> +-CFLAGS=3D"--save-temps -fexceptions"
> + libgcc_cv_lib_sjlj_exceptions=3Dunknown
> +-AS_IF([ac_fn_c_try_compile],
> +-  [if grep _Unwind_SjLj_Resume conftest.s >/dev/null 2>&1; then
> ++if AC_TRY_COMMAND(${CC-cc} -fexceptions -S conftest.c -o conftest.s =
1>&AS_MESSAGE_LOG_FD); then
> ++  if grep _Unwind_SjLj_Resume conftest.s >/dev/null 2>&1; then
> +     libgcc_cv_lib_sjlj_exceptions=3Dyes
> +   elif grep _Unwind_Resume conftest.s >/dev/null 2>&1; then
> +     libgcc_cv_lib_sjlj_exceptions=3Dno
> +-  fi])
> +-CFLAGS=3D$CFLAGS_hold
> ++  fi
> ++fi
> + rm -f conftest*
> + ])
> +=20
> +--=20
> +1.7.10.4
> +
> diff --git =
a/meta/recipes-devtools/gcc/gcc-4.8/0027-cpp-honor-sysroot.patch =
b/meta/recipes-devtools/gcc/gcc-4.8/0027-cpp-honor-sysroot.patch
> new file mode 100644
> index 0000000..dd06f9b
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-4.8/0027-cpp-honor-sysroot.patch
> @@ -0,0 +1,54 @@
> +=46rom a0f9bd09c816ad29ecf7c29d6c27f7df97710364 Mon Sep 17 00:00:00 =
2001
> +From: Elvis Dowson <elvis.dowson@gmail.com>
> +Date: Fri, 29 Mar 2013 09:22:00 +0400
> +Subject: [PATCH 27/35] cpp: honor sysroot.
> +
> +Currently, if the gcc toolchain is relocated and installed from =
sstate, then you try and compile
> +preprocessed source (.i or .ii files), the compiler will try and =
access the builtin sysroot location
> +rather than the --sysroot option specified on the commandline. If =
access to that directory is
> +permission denied (unreadable), gcc will error.
> +
> +This happens when ccache is in use due to the fact it uses =
preprocessed source files.
> +
> +The fix below adds %I to the cpp-output spec macro so the default =
substitutions for -iprefix,
> +-isystem, -isysroot happen and the correct sysroot is used.
> +
> +[YOCTO #2074]
> +
> +RP 2012/04/13
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Upstream-Status: Pending
> +---
> + gcc/cp/lang-specs.h |    2 +-
> + gcc/gcc.c           |    2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/gcc/cp/lang-specs.h b/gcc/cp/lang-specs.h
> +index a001c3e..1aae1e4 100644
> +--- a/gcc/cp/lang-specs.h
> ++++ b/gcc/cp/lang-specs.h
> +@@ -63,5 +63,5 @@ along with GCC; see the file COPYING3.  If not see
> +   {".ii", "@c++-cpp-output", 0, 0, 0},
> +   {"@c++-cpp-output",
> +    "%{!M:%{!MM:%{!E:\
> +-    cc1plus -fpreprocessed %i %(cc1_options) %2\
> ++    cc1plus -fpreprocessed %i %I %(cc1_options) %2\
> +     %{!fsyntax-only:%(invoke_as)}}}}", 0, 0, 0},
> +diff --git a/gcc/gcc.c b/gcc/gcc.c
> +index 51062aa..cf6b99e 100644
> +--- a/gcc/gcc.c
> ++++ b/gcc/gcc.c
> +@@ -1042,7 +1042,7 @@ static const struct compiler =
default_compilers[] =3D
> +                     %W{o*:--output-pch=3D%*}}%V}}}}}}", 0, 0, 0},
> +   {".i", "@cpp-output", 0, 0, 0},
> +   {"@cpp-output",
> +-   "%{!M:%{!MM:%{!E:cc1 -fpreprocessed %i %(cc1_options) =
%{!fsyntax-only:%(invoke_as)}}}}", 0, 0, 0},
> ++   "%{!M:%{!MM:%{!E:cc1 -fpreprocessed %i %I %(cc1_options) =
%{!fsyntax-only:%(invoke_as)}}}}", 0, 0, 0},
> +   {".s", "@assembler", 0, 0, 0},
> +   {"@assembler",
> +    "%{!M:%{!MM:%{!E:%{!S:as %(asm_debug) %(asm_options) %i %A }}}}", =
0, 0, 0},
> +--=20
> +1.7.10.4
> +
> diff --git =
a/meta/recipes-devtools/gcc/gcc-4.8/0028-MIPS64-Default-to-N64-ABI.patch =
b/meta/recipes-devtools/gcc/gcc-4.8/0028-MIPS64-Default-to-N64-ABI.patch
> new file mode 100644
> index 0000000..26166ce
> --- /dev/null
> +++ =
b/meta/recipes-devtools/gcc/gcc-4.8/0028-MIPS64-Default-to-N64-ABI.patch
> @@ -0,0 +1,31 @@
> +=46rom 301e18d4711db5925e767fad08dffa9cfe0a2f1f Mon Sep 17 00:00:00 =
2001
> +From: Elvis Dowson <elvis.dowson@gmail.com>
> +Date: Fri, 29 Mar 2013 09:23:08 +0400
> +Subject: [PATCH 28/35] MIPS64: Default to N64 ABI
> +
> +MIPS64 defaults to n32 ABI, this patch makes it
> +so that it defaults to N64 ABI
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Upstream-Status: Inappropriate [OE config specific]
> +---
> + gcc/config.gcc |    2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/gcc/config.gcc b/gcc/config.gcc
> +index 1a0be50..989c2fb 100644
> +--- a/gcc/config.gcc
> ++++ b/gcc/config.gcc
> +@@ -1797,7 +1797,7 @@ mips*-mti-linux*)
> + mips64*-*-linux* | mipsisa64*-*-linux*)
> + 	tm_file=3D"dbxelf.h elfos.h gnu-user.h linux.h glibc-stdint.h =
${tm_file} mips/gnu-user.h mips/gnu-user64.h mips/linux64.h =
mips/linux-common.h"
> + 	tmake_file=3D"${tmake_file} mips/t-linux64"
> +-	tm_defines=3D"${tm_defines} MIPS_ABI_DEFAULT=3DABI_N32"
> ++	tm_defines=3D"${tm_defines} MIPS_ABI_DEFAULT=3DABI_64"
> + 	case ${target} in
> + 		mips64el-st-linux-gnu)
> + 			tm_file=3D"${tm_file} mips/st.h"
> +--=20
> +1.7.10.4
> +
> diff --git =
a/meta/recipes-devtools/gcc/gcc-4.8/0029-Define-GLIBC_DYNAMIC_LINKER-and-U=
CLIBC_DYNAMIC_LINKE.patch =
b/meta/recipes-devtools/gcc/gcc-4.8/0029-Define-GLIBC_DYNAMIC_LINKER-and-U=
CLIBC_DYNAMIC_LINKE.patch
> new file mode 100644
> index 0000000..2e757a2
> --- /dev/null
> +++ =
b/meta/recipes-devtools/gcc/gcc-4.8/0029-Define-GLIBC_DYNAMIC_LINKER-and-U=
CLIBC_DYNAMIC_LINKE.patch
> @@ -0,0 +1,190 @@
> +=46rom 29d12344fb682a053de53eb08b95704cf3b67af2 Mon Sep 17 00:00:00 =
2001
> +From: Elvis Dowson <elvis.dowson@gmail.com>
> +Date: Fri, 29 Mar 2013 09:24:50 +0400
> +Subject: [PATCH 29/35] Define GLIBC_DYNAMIC_LINKER and =
UCLIBC_DYNAMIC_LINKER
> + relative to SYSTEMLIBS_DIR
> +
> +This patch defines GLIBC_DYNAMIC_LINKER and UCLIBC_DYNAMIC_LINKER
> +relative to SYSTEMLIBS_DIR which can be set in generated headers
> +This breaks the assumption of hardcoded multilib in gcc
> +Change is only for the supported architectures in OE including
> +SH, sparc, alpha for possible future support (if any)
> +
> +Removes the do_headerfix task in metadata
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Upstream-Status: Inappropriate [OE configuration]
> +---
> + gcc/config/alpha/linux-elf.h |    4 ++--
> + gcc/config/arm/linux-eabi.h  |    4 ++--
> + gcc/config/arm/linux-elf.h   |    2 +-
> + gcc/config/i386/linux.h      |    2 +-
> + gcc/config/i386/linux64.h    |    6 +++---
> + gcc/config/mips/linux.h      |    2 +-
> + gcc/config/mips/linux64.h    |    8 ++++----
> + gcc/config/rs6000/linux64.h  |    8 ++++----
> + gcc/config/sh/linux.h        |    2 +-
> + gcc/config/sparc/linux.h     |    2 +-
> + gcc/config/sparc/linux64.h   |    4 ++--
> + 11 files changed, 22 insertions(+), 22 deletions(-)
> +
> +diff --git a/gcc/config/alpha/linux-elf.h =
b/gcc/config/alpha/linux-elf.h
> +index 84e0596..3a59d71 100644
> +--- a/gcc/config/alpha/linux-elf.h
> ++++ b/gcc/config/alpha/linux-elf.h
> +@@ -23,8 +23,8 @@ along with GCC; see the file COPYING3.  If not see
> + #define EXTRA_SPECS \
> + { "elf_dynamic_linker", ELF_DYNAMIC_LINKER },
> +=20
> +-#define GLIBC_DYNAMIC_LINKER	"/lib/ld-linux.so.2"
> +-#define UCLIBC_DYNAMIC_LINKER "/lib/ld-uClibc.so.0"
> ++#define GLIBC_DYNAMIC_LINKER	SYSTEMLIBS_DIR "ld-linux.so.2"
> ++#define UCLIBC_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-uClibc.so.0"
> + #if DEFAULT_LIBC =3D=3D LIBC_UCLIBC
> + #define CHOOSE_DYNAMIC_LINKER(G, U) "%{mglibc:" G ";:" U "}"
> + #elif DEFAULT_LIBC =3D=3D LIBC_GLIBC
> +diff --git a/gcc/config/arm/linux-eabi.h =
b/gcc/config/arm/linux-eabi.h
> +index 4a425c8..80f454d 100644
> +--- a/gcc/config/arm/linux-eabi.h
> ++++ b/gcc/config/arm/linux-eabi.h
> +@@ -68,8 +68,8 @@
> +    GLIBC_DYNAMIC_LINKER_DEFAULT and TARGET_DEFAULT_FLOAT_ABI.  */
> +=20
> + #undef  GLIBC_DYNAMIC_LINKER
> +-#define GLIBC_DYNAMIC_LINKER_SOFT_FLOAT "/lib/ld-linux.so.3"
> +-#define GLIBC_DYNAMIC_LINKER_HARD_FLOAT "/lib/ld-linux-armhf.so.3"
> ++#define GLIBC_DYNAMIC_LINKER_SOFT_FLOAT SYSTEMLIBS_DIR =
"ld-linux.so.3"
> ++#define GLIBC_DYNAMIC_LINKER_HARD_FLOAT SYSTEMLIBS_DIR =
"ld-linux-armhf.so.3"
> + #define GLIBC_DYNAMIC_LINKER_DEFAULT GLIBC_DYNAMIC_LINKER_SOFT_FLOAT
> +=20
> + #define GLIBC_DYNAMIC_LINKER \
> +diff --git a/gcc/config/arm/linux-elf.h b/gcc/config/arm/linux-elf.h
> +index 753dc3a..d593967 100644
> +--- a/gcc/config/arm/linux-elf.h
> ++++ b/gcc/config/arm/linux-elf.h
> +@@ -57,7 +57,7 @@
> +=20
> + #define LIBGCC_SPEC "%{mfloat-abi=3Dsoft*:-lfloat} -lgcc"
> +=20
> +-#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
> ++#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux.so.2"
> +=20
> + #define LINUX_TARGET_LINK_SPEC  "%{h*} \
> +    %{static:-Bstatic} \
> +diff --git a/gcc/config/i386/linux.h b/gcc/config/i386/linux.h
> +index 3c95ee0..33b8acd 100644
> +--- a/gcc/config/i386/linux.h
> ++++ b/gcc/config/i386/linux.h
> +@@ -20,4 +20,4 @@ along with GCC; see the file COPYING3.  If not see
> + <http://www.gnu.org/licenses/>.  */
> +=20
> + #define GNU_USER_LINK_EMULATION "elf_i386"
> +-#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
> ++#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux.so.2"
> +diff --git a/gcc/config/i386/linux64.h b/gcc/config/i386/linux64.h
> +index b793e08..da788b8 100644
> +--- a/gcc/config/i386/linux64.h
> ++++ b/gcc/config/i386/linux64.h
> +@@ -27,6 +27,6 @@ see the files COPYING3 and COPYING.RUNTIME =
respectively.  If not, see
> + #define GNU_USER_LINK_EMULATION64 "elf_x86_64"
> + #define GNU_USER_LINK_EMULATIONX32 "elf32_x86_64"
> +=20
> +-#define GLIBC_DYNAMIC_LINKER32 "/lib/ld-linux.so.2"
> +-#define GLIBC_DYNAMIC_LINKER64 "/lib64/ld-linux-x86-64.so.2"
> +-#define GLIBC_DYNAMIC_LINKERX32 "/libx32/ld-linux-x32.so.2"
> ++#define GLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-linux.so.2"
> ++#define GLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld-linux-x86-64.so.2"
> ++#define GLIBC_DYNAMIC_LINKERX32 SYSTEMLIBS_DIR "ld-linux-x32.so.2"
> +diff --git a/gcc/config/mips/linux.h b/gcc/config/mips/linux.h
> +index 9b4c68d..7ee5ba8 100644
> +--- a/gcc/config/mips/linux.h
> ++++ b/gcc/config/mips/linux.h
> +@@ -17,4 +17,4 @@ You should have received a copy of the GNU General =
Public License
> + along with GCC; see the file COPYING3.  If not see
> + <http://www.gnu.org/licenses/>.  */
> +=20
> +-#define GLIBC_DYNAMIC_LINKER "/lib/ld.so.1"
> ++#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld.so.1"
> +diff --git a/gcc/config/mips/linux64.h b/gcc/config/mips/linux64.h
> +index dbba47a..c7ed573 100644
> +--- a/gcc/config/mips/linux64.h
> ++++ b/gcc/config/mips/linux64.h
> +@@ -22,10 +22,10 @@ along with GCC; see the file COPYING3.  If not =
see
> + #define GNU_USER_LINK_EMULATION64 "elf64%{EB:b}%{EL:l}tsmip"
> + #define GNU_USER_LINK_EMULATIONN32 "elf32%{EB:b}%{EL:l}tsmipn32"
> +=20
> +-#define GLIBC_DYNAMIC_LINKER32 "/lib/ld.so.1"
> +-#define GLIBC_DYNAMIC_LINKER64 "/lib64/ld.so.1"
> +-#define GLIBC_DYNAMIC_LINKERN32 "/lib32/ld.so.1"
> +-#define UCLIBC_DYNAMIC_LINKERN32 "/lib32/ld-uClibc.so.0"
> ++#define GLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld.so.1"
> ++#define GLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld.so.1"
> ++#define GLIBC_DYNAMIC_LINKERN32 SYSTEMLIBS_DIR "ld.so.1"
> ++#define UCLIBC_DYNAMIC_LINKERN32 SYSTEMLIBS_DIR "ld-uClibc.so.0"
> + #define BIONIC_DYNAMIC_LINKERN32 "/system/bin/linker32"
> + #define GNU_USER_DYNAMIC_LINKERN32 \
> +   CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKERN32, =
UCLIBC_DYNAMIC_LINKERN32, \
> +diff --git a/gcc/config/rs6000/linux64.h =
b/gcc/config/rs6000/linux64.h
> +index dc6f67f..bc60769 100644
> +--- a/gcc/config/rs6000/linux64.h
> ++++ b/gcc/config/rs6000/linux64.h
> +@@ -360,10 +360,10 @@ extern int dot_symbols;
> + #undef	LINK_OS_DEFAULT_SPEC
> + #define LINK_OS_DEFAULT_SPEC "%(link_os_linux)"
> +=20
> +-#define GLIBC_DYNAMIC_LINKER32 "/lib/ld.so.1"
> +-#define GLIBC_DYNAMIC_LINKER64 "/lib64/ld64.so.1"
> +-#define UCLIBC_DYNAMIC_LINKER32 "/lib/ld-uClibc.so.0"
> +-#define UCLIBC_DYNAMIC_LINKER64 "/lib/ld64-uClibc.so.0"
> ++#define GLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld.so.1"
> ++#define GLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld64.so.1"
> ++#define UCLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-uClibc.so.0"
> ++#define UCLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld64-uClibc.so.0"
> + #if DEFAULT_LIBC =3D=3D LIBC_UCLIBC
> + #define CHOOSE_DYNAMIC_LINKER(G, U) "%{mglibc:" G ";:" U "}"
> + #elif DEFAULT_LIBC =3D=3D LIBC_GLIBC
> +diff --git a/gcc/config/sh/linux.h b/gcc/config/sh/linux.h
> +index 9e8f32d..86bf81e 100644
> +--- a/gcc/config/sh/linux.h
> ++++ b/gcc/config/sh/linux.h
> +@@ -43,7 +43,7 @@ along with GCC; see the file COPYING3.  If not see
> +=20
> + #define TARGET_ASM_FILE_END file_end_indicate_exec_stack
> +=20
> +-#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
> ++#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux.so.2"
> +=20
> + #undef SUBTARGET_LINK_EMUL_SUFFIX
> + #define SUBTARGET_LINK_EMUL_SUFFIX "_linux"
> +diff --git a/gcc/config/sparc/linux.h b/gcc/config/sparc/linux.h
> +index 49283d3..6f0b03a 100644
> +--- a/gcc/config/sparc/linux.h
> ++++ b/gcc/config/sparc/linux.h
> +@@ -83,7 +83,7 @@ extern const char *host_detect_local_cpu (int argc, =
const char **argv);
> +    When the -shared link option is used a final link is not being
> +    done.  */
> +=20
> +-#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
> ++#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux.so.2"
> +=20
> + #undef  LINK_SPEC
> + #define LINK_SPEC "-m elf32_sparc %{shared:-shared} \
> +diff --git a/gcc/config/sparc/linux64.h b/gcc/config/sparc/linux64.h
> +index 7d48e96..b01993f 100644
> +--- a/gcc/config/sparc/linux64.h
> ++++ b/gcc/config/sparc/linux64.h
> +@@ -92,8 +92,8 @@ along with GCC; see the file COPYING3.  If not see
> +    When the -shared link option is used a final link is not being
> +    done.  */
> +=20
> +-#define GLIBC_DYNAMIC_LINKER32 "/lib/ld-linux.so.2"
> +-#define GLIBC_DYNAMIC_LINKER64 "/lib64/ld-linux.so.2"
> ++#define GLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-linux.so.2"
> ++#define GLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld-linux.so.2"
> +=20
> + #ifdef SPARC_BI_ARCH
> +=20
> +--=20
> +1.7.10.4
> +
> diff --git =
a/meta/recipes-devtools/gcc/gcc-4.8/0030-gcc-Fix-argument-list-too-long-er=
ror.patch =
b/meta/recipes-devtools/gcc/gcc-4.8/0030-gcc-Fix-argument-list-too-long-er=
ror.patch
> new file mode 100644
> index 0000000..118db00
> --- /dev/null
> +++ =
b/meta/recipes-devtools/gcc/gcc-4.8/0030-gcc-Fix-argument-list-too-long-er=
ror.patch
> @@ -0,0 +1,40 @@
> +=46rom c1816c160156f99c34e6a0a0311bb0219326804e Mon Sep 17 00:00:00 =
2001
> +From: Elvis Dowson <elvis.dowson@gmail.com>
> +Date: Fri, 29 Mar 2013 09:26:37 +0400
> +Subject: [PATCH 30/35] gcc: Fix argument list too long error.
> +
> +There would be an "Argument list too long" error when the
> +build directory is longer than 200, this is caused by:
> +
> +headers=3D`echo $(PLUGIN_HEADERS) | tr ' ' '\012' | sort -u`
> +
> +The PLUGIN_HEADERS is too long before sort, so the "echo" can't =
handle
> +it, use the $(sort list) of GNU make which can handle the too long =
list
> +would fix the problem, the header would be short enough after sorted.
> +The "tr ' ' '\012'" was used for translating the space to "\n", the
> +$(sort list) doesn't need this.
> +
> +Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Upstream-Status: Pending
> +---
> + gcc/Makefile.in |    2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/gcc/Makefile.in b/gcc/Makefile.in
> +index 2320497..8562a62 100644
> +--- a/gcc/Makefile.in
> ++++ b/gcc/Makefile.in
> +@@ -4627,7 +4627,7 @@ install-plugin: installdirs lang.install-plugin =
s-header-vars install-gengtype
> + # We keep the directory structure for files in config or c-family =
and .def
> + # files. All other files are flattened to a single directory.
> + 	$(mkinstalldirs) $(DESTDIR)$(plugin_includedir)
> +-	headers=3D`echo $(PLUGIN_HEADERS) | tr ' ' '\012' | sort -u`; \
> ++	headers=3D"$(sort $(PLUGIN_HEADERS))"; \
> + 	srcdirstrip=3D`echo "$(srcdir)" | sed 's/[].[^$$\\*|]/\\\\&/g'`; =
\
> + 	for file in $$headers; do \
> + 	  if [ -f $$file ] ; then \
> +--=20
> +1.7.10.4
> +
> diff --git a/meta/recipes-devtools/gcc/gcc-4.8/0031-Disable-sdt.patch =
b/meta/recipes-devtools/gcc/gcc-4.8/0031-Disable-sdt.patch
> new file mode 100644
> index 0000000..f259a60
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-4.8/0031-Disable-sdt.patch
> @@ -0,0 +1,45 @@
> +=46rom eb70cb2785af7171897f363298bbfcd83de5ec57 Mon Sep 17 00:00:00 =
2001
> +From: Elvis Dowson <elvis.dowson@gmail.com>
> +Date: Fri, 29 Mar 2013 09:28:10 +0400
> +Subject: [PATCH 31/35] Disable sdt.
> +
> +We don't list dtrace in DEPENDS so we shouldn't be depending on this =
header.
> +It may or may not exist from preivous builds though. To be =
determinstic, disable
> +sdt.h usage always. This avoids build failures if the header is =
removed after configure
> +but before libgcc is compiled for example.
> +
> +RP 2012/8/7
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Upstream-Status: Inappropriate [hack]
> +---
> + gcc/configure |   12 ++++++------
> + 1 file changed, 6 insertions(+), 6 deletions(-)
> +
> +diff --git a/gcc/configure b/gcc/configure
> +index d587993..8bc0c98 100755
> +--- a/gcc/configure
> ++++ b/gcc/configure
> +@@ -26792,12 +26792,12 @@ fi
> + { $as_echo "$as_me:${as_lineno-$LINENO}: checking sys/sdt.h in the =
target C library" >&5
> + $as_echo_n "checking sys/sdt.h in the target C library... " >&6; }
> + have_sys_sdt_h=3Dno
> +-if test -f $target_header_dir/sys/sdt.h; then
> +-  have_sys_sdt_h=3Dyes
> +-
> +-$as_echo "#define HAVE_SYS_SDT_H 1" >>confdefs.h
> +-
> +-fi
> ++#if test -f $target_header_dir/sys/sdt.h; then
> ++#  have_sys_sdt_h=3Dyes
> ++#
> ++#$as_echo "#define HAVE_SYS_SDT_H 1" >>confdefs.h
> ++#
> ++#fi
> + { $as_echo "$as_me:${as_lineno-$LINENO}: result: $have_sys_sdt_h" =
>&5
> + $as_echo "$have_sys_sdt_h" >&6; }
> +=20
> +--=20
> +1.7.10.4
> +
> diff --git a/meta/recipes-devtools/gcc/gcc-4.8/0032-libtool.patch =
b/meta/recipes-devtools/gcc/gcc-4.8/0032-libtool.patch
> new file mode 100644
> index 0000000..54bb29b
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-4.8/0032-libtool.patch
> @@ -0,0 +1,42 @@
> +=46rom 6c715fcfa262adadca81c68a1f3f69aa3187a501 Mon Sep 17 00:00:00 =
2001
> +From: Elvis Dowson <elvis.dowson@gmail.com>
> +Date: Fri, 29 Mar 2013 09:29:11 +0400
> +Subject: [PATCH 32/35] libtool
> +
> +libstdc++ from gcc-runtime gets created with -rpath=3D/usr/lib/../lib =
for qemux86-64
> +when running on am x86_64 build host.
> +
> +This patch stops this speading to libdir in the libstdc++.la file =
within libtool.
> +Arguably, it shouldn't be passing this into libtool in the first =
place but
> +for now this resolves the nastiest problems this causes.
> +
> +func_normal_abspath would resolve an empty path to `pwd` so we need
> +to filter the zero case.
> +
> +RP 2012/8/24
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Upstream-Status: Pending
> +---
> + ltmain.sh |    4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/ltmain.sh b/ltmain.sh
> +index a03433f..46f47c2 100644
> +--- a/ltmain.sh
> ++++ b/ltmain.sh
> +@@ -6359,6 +6359,10 @@ func_mode_link ()
> + 	func_warning "ignoring multiple \`-rpath's for a libtool =
library"
> +=20
> +       install_libdir=3D"$1"
> ++      if test -n "$install_libdir"; then
> ++	func_normal_abspath "$install_libdir"
> ++	install_libdir=3D$func_normal_abspath_result
> ++      fi
> +=20
> +       oldlibs=3D
> +       if test -z "$rpath"; then
> +--=20
> +1.7.10.4
> +
> diff --git =
a/meta/recipes-devtools/gcc/gcc-4.8/0033-gcc-armv4-pass-fix-v4bx-to-linker=
-to-support-EABI.patch =
b/meta/recipes-devtools/gcc/gcc-4.8/0033-gcc-armv4-pass-fix-v4bx-to-linker=
-to-support-EABI.patch
> new file mode 100644
> index 0000000..7c2c19a
> --- /dev/null
> +++ =
b/meta/recipes-devtools/gcc/gcc-4.8/0033-gcc-armv4-pass-fix-v4bx-to-linker=
-to-support-EABI.patch
> @@ -0,0 +1,43 @@
> +=46rom 97e4591c20310425e7aca0e6712a8d9480e7744c Mon Sep 17 00:00:00 =
2001
> +From: Elvis Dowson <elvis.dowson@gmail.com>
> +Date: Fri, 29 Mar 2013 09:30:32 +0400
> +Subject: [PATCH 33/35] gcc: armv4: pass fix-v4bx to linker to support =
EABI.
> +
> +The LINK_SPEC for linux gets overwritten by linux-eabi.h which
> +means the value of TARGET_FIX_V4BX_SPEC gets lost and as a result
> +the option is not passed to linker when chosing march=3Darmv4
> +This patch redefines this in linux-eabi.h and reinserts it
> +for eabi defaulting toolchains.
> +
> +We might want to send it upstream.
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Upstream-Status: Pending
> +---
> + gcc/config/arm/linux-eabi.h |    6 +++++-
> + 1 file changed, 5 insertions(+), 1 deletion(-)
> +
> +diff --git a/gcc/config/arm/linux-eabi.h =
b/gcc/config/arm/linux-eabi.h
> +index 80f454d..4db3eb9 100644
> +--- a/gcc/config/arm/linux-eabi.h
> ++++ b/gcc/config/arm/linux-eabi.h
> +@@ -77,10 +77,14 @@
> +     %{mfloat-abi=3Dsoft*:" GLIBC_DYNAMIC_LINKER_SOFT_FLOAT "} \
> +     %{!mfloat-abi=3D*:" GLIBC_DYNAMIC_LINKER_DEFAULT "}"
> +=20
> ++/* For armv4 we pass --fix-v4bx to linker to support EABI */
> ++#undef TARGET_FIX_V4BX_SPEC
> ++#define TARGET_FIX_V4BX_SPEC =
"%{mcpu=3Darm8|mcpu=3Darm810|mcpu=3Dstrongarm*|march=3Darmv4: =
--fix-v4bx}"
> ++
> + /* At this point, bpabi.h will have clobbered LINK_SPEC.  We want to
> +    use the GNU/Linux version, not the generic BPABI version.  */
> + #undef  LINK_SPEC
> +-#define LINK_SPEC BE8_LINK_SPEC						=
\
> ++#define LINK_SPEC BE8_LINK_SPEC TARGET_FIX_V4BX_SPEC			=
\
> +   LINUX_OR_ANDROID_LD (LINUX_TARGET_LINK_SPEC,				=
\
> + 		       LINUX_TARGET_LINK_SPEC " " ANDROID_LINK_SPEC)
> +=20
> +--=20
> +1.7.10.4
> +
> diff --git =
a/meta/recipes-devtools/gcc/gcc-4.8/0034-Use-the-multilib-config-files-fro=
m-B-instead-of-usin.patch =
b/meta/recipes-devtools/gcc/gcc-4.8/0034-Use-the-multilib-config-files-fro=
m-B-instead-of-usin.patch
> new file mode 100644
> index 0000000..c531d36
> --- /dev/null
> +++ =
b/meta/recipes-devtools/gcc/gcc-4.8/0034-Use-the-multilib-config-files-fro=
m-B-instead-of-usin.patch
> @@ -0,0 +1,102 @@
> +=46rom fc5e4beaea856a2b486c770ad3addc0f5bb3100e Mon Sep 17 00:00:00 =
2001
> +From: Elvis Dowson <elvis.dowson@gmail.com>
> +Date: Fri, 29 Mar 2013 09:33:04 +0400
> +Subject: [PATCH 34/35] Use the multilib config files from ${B} =
instead of
> + using the ones from ${S}
> +
> +Use the multilib config files from ${B} instead of using the ones =
from ${S}
> +so that the source can be shared between gcc-cross-initial,
> +gcc-cross-intermediate, gcc-cross, gcc-runtime, and also the sdk =
build.
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> +
> +Upstream-Status: Inappropriate [configuration]
> +---
> + gcc/configure    |   22 ++++++++++++++++++----
> + gcc/configure.ac |   22 ++++++++++++++++++----
> + 2 files changed, 36 insertions(+), 8 deletions(-)
> +
> +diff --git a/gcc/configure b/gcc/configure
> +index 8bc0c98..3cd0817 100755
> +--- a/gcc/configure
> ++++ b/gcc/configure
> +@@ -11519,10 +11519,20 @@ done
> + tmake_file_=3D
> + for f in ${tmake_file}
> + do
> +-	if test -f ${srcdir}/config/$f
> +-	then
> +-		tmake_file_=3D"${tmake_file_} \$(srcdir)/config/$f"
> +-	fi
> ++  case $f in
> ++    */t-linux64 )
> ++       if test -f ./config/$f
> ++       then
> ++         tmake_file_=3D"${tmake_file_} ./config/$f"
> ++       fi
> ++       ;;
> ++    * )
> ++       if test -f ${srcdir}/config/$f
> ++       then
> ++         tmake_file_=3D"${tmake_file_} \$(srcdir)/config/$f"
> ++       fi
> ++       ;;
> ++  esac
> + done
> + tmake_file=3D"${tmake_file_}"
> +=20
> +@@ -11533,6 +11543,10 @@ tm_file_list=3D"options.h"
> + tm_include_list=3D"options.h insn-constants.h"
> + for f in $tm_file; do
> +   case $f in
> ++    */linux64.h )
> ++       tm_file_list=3D"${tm_file_list} ./config/$f"
> ++       tm_include_list=3D"${tm_include_list} ./config/$f"
> ++       ;;
> +     ./* )
> +        f=3D`echo $f | sed 's/^..//'`
> +        tm_file_list=3D"${tm_file_list} $f"
> +diff --git a/gcc/configure.ac b/gcc/configure.ac
> +index 5e5e84f..415a6df 100644
> +--- a/gcc/configure.ac
> ++++ b/gcc/configure.ac
> +@@ -1700,10 +1700,20 @@ done
> + tmake_file_=3D
> + for f in ${tmake_file}
> + do
> +-	if test -f ${srcdir}/config/$f
> +-	then
> +-		tmake_file_=3D"${tmake_file_} \$(srcdir)/config/$f"
> +-	fi
> ++  case $f in
> ++    */t-linux64 )
> ++       if test -f ./config/$f
> ++       then
> ++         tmake_file_=3D"${tmake_file_} ./config/$f"
> ++       fi
> ++       ;;
> ++    * )
> ++       if test -f ${srcdir}/config/$f
> ++       then
> ++         tmake_file_=3D"${tmake_file_} \$(srcdir)/config/$f"
> ++       fi
> ++       ;;
> ++  esac
> + done
> + tmake_file=3D"${tmake_file_}"
> +=20
> +@@ -1714,6 +1724,10 @@ tm_file_list=3D"options.h"
> + tm_include_list=3D"options.h insn-constants.h"
> + for f in $tm_file; do
> +   case $f in
> ++    */linux64.h )
> ++       tm_file_list=3D"${tm_file_list} ./config/$f"
> ++       tm_include_list=3D"${tm_include_list} ./config/$f"
> ++       ;;
> +     ./* )
> +        f=3D`echo $f | sed 's/^..//'`
> +        tm_file_list=3D"${tm_file_list} $f"
> +--=20
> +1.7.10.4
> +
> diff --git =
a/meta/recipes-devtools/gcc/gcc-4.8/0035-wcast-qual-PR-55383.patch =
b/meta/recipes-devtools/gcc/gcc-4.8/0035-wcast-qual-PR-55383.patch
> new file mode 100644
> index 0000000..94e285d
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-4.8/0035-wcast-qual-PR-55383.patch
> @@ -0,0 +1,55 @@
> +=46rom deffdb0b2497a106061d3ea2c6a3fef4fba3445e Mon Sep 17 00:00:00 =
2001
> +From: Elvis Dowson <elvis.dowson@gmail.com>
> +Date: Fri, 29 Mar 2013 09:39:51 +0400
> +Subject: [PATCH 35/35] wcast-qual PR/55383
> +
> +This is a backport from gcc bugzilla
> +
> +http://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D55383
> +
> +This commit fixes a wrong warning behavior. This bug which has no
> +workaround other than disabling the warning.
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Upstream-Status: Backport
> +---
> + gcc/c/c-typeck.c                          |    2 +-
> + gcc/testsuite/c-c++-common/Wcast-qual-1.c |    6 +++---
> + 2 files changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/gcc/c/c-typeck.c b/gcc/c/c-typeck.c
> +index ddb6d39..c624120 100644
> +--- a/gcc/c/c-typeck.c
> ++++ b/gcc/c/c-typeck.c
> +@@ -4464,7 +4464,7 @@ handle_warn_cast_qual (location_t loc, tree =
type, tree otype)
> +     /* There are qualifiers present in IN_OTYPE that are not present
> +        in IN_TYPE.  */
> +     warning_at (loc, OPT_Wcast_qual,
> +-		"cast discards %q#v qualifier from pointer target type",
> ++		"cast discards %qv qualifier from pointer target type",
> + 		discarded);
> +=20
> +   if (added || discarded)
> +diff --git a/gcc/testsuite/c-c++-common/Wcast-qual-1.c =
b/gcc/testsuite/c-c++-common/Wcast-qual-1.c
> +index 640e4f0..56382c7 100644
> +--- a/gcc/testsuite/c-c++-common/Wcast-qual-1.c
> ++++ b/gcc/testsuite/c-c++-common/Wcast-qual-1.c
> +@@ -85,11 +85,11 @@ f3 (void ***bar)
> + void
> + f4 (void * const **bar)
> + {
> +-  const void ***p9 =3D (const void ***) bar; /* { dg-warning "cast" =
} */
> ++  const void ***p9 =3D (const void ***) bar; /* { dg-warning "cast =
discards .const. qualifier" } */
> +   void * const **p11 =3D (void * const **) bar;
> +-  void ** const *p13 =3D (void ** const *) bar; /* { dg-warning =
"cast" } */
> ++  void ** const *p13 =3D (void ** const *) bar; /* { dg-warning =
"cast discards .const. qualifier" } */
> +   const void * const **p15 =3D (const void * const **) bar; /* { =
dg-warning "cast" } */
> +-  const void ** const *p17 =3D (const void ** const *) bar; /* { =
dg-warning "cast" } */
> ++  const void ** const *p17 =3D (const void ** const *) bar; /* { =
dg-warning "cast discards .const. qualifier" } */
> +   void * const * const * p19 =3D (void * const * const *) bar;
> +   const void * const * const *p21 =3D (const void * const * const *) =
bar;
> + }
> +--=20
> +1.7.10.4
> +
> diff --git a/meta/recipes-devtools/gcc/gcc-4.8/100-uclibc-conf.patch =
b/meta/recipes-devtools/gcc/gcc-4.8/100-uclibc-conf.patch
> deleted file mode 100644
> index b2981e0..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.8/100-uclibc-conf.patch
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -Upstream-Status: Pending
> -
> -Index: gcc-4.6.0/contrib/regression/objs-gcc.sh
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.6.0.orig/contrib/regression/objs-gcc.sh
> -+++ gcc-4.6.0/contrib/regression/objs-gcc.sh
> -@@ -106,6 +106,10 @@ if [ $H_REAL_TARGET =3D $H_REAL_HOST -a $H
> -  then
> -   make all-gdb all-dejagnu all-ld || exit 1
> -   make install-gdb install-dejagnu install-ld || exit 1
> -+elif [ $H_REAL_TARGET =3D $H_REAL_HOST -a $H_REAL_TARGET =3D =
i686-pc-linux-uclibc ]
> -+ then
> -+  make all-gdb all-dejagnu all-ld || exit 1
> -+  make install-gdb install-dejagnu install-ld || exit 1
> - elif [ $H_REAL_TARGET =3D $H_REAL_HOST ] ; then
> -   make bootstrap || exit 1
> -   make install || exit 1
> -Index: gcc-4.6.0/libjava/classpath/ltconfig
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.6.0.orig/libjava/classpath/ltconfig
> -+++ gcc-4.6.0/libjava/classpath/ltconfig
> -@@ -603,7 +603,7 @@ host_os=3D`echo $host | sed 's/^\([^-]*\)-
> -=20
> - # Transform linux* to *-*-linux-gnu*, to support old configure =
scripts.
> - case $host_os in
> --linux-gnu*) ;;
> -+linux-gnu*|linux-uclibc*) ;;
> - linux*) host=3D`echo $host | sed =
's/^\(.*-.*-linux\)\(.*\)$/\1-gnu\2/'`
> - esac
> -=20
> -@@ -1247,7 +1247,7 @@ linux-gnuoldld* | linux-gnuaout* | linux
> -   ;;
> -=20
> - # This must be Linux ELF.
> --linux-gnu*)
> -+linux*)
> -   version_type=3Dlinux
> -   need_lib_prefix=3Dno
> -   need_version=3Dno
> diff --git a/meta/recipes-devtools/gcc/gcc-4.8/200-uclibc-locale.patch =
b/meta/recipes-devtools/gcc/gcc-4.8/200-uclibc-locale.patch
> deleted file mode 100644
> index df22c54..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.8/200-uclibc-locale.patch
> +++ /dev/null
> @@ -1,2810 +0,0 @@
> -Upstream-Status: Pending
> -
> -Index: gcc-4_7-branch/libstdc++-v3/acinclude.m4
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4_7-branch.orig/libstdc++-v3/acinclude.m4	2012-04-10 =
10:19:50.395337128 -0700
> -+++ gcc-4_7-branch/libstdc++-v3/acinclude.m4	2012-04-10 =
10:30:37.327368356 -0700
> -@@ -1924,6 +1924,9 @@
> -   # Default to "generic".
> -   if test $enable_clocale_flag =3D auto; then
> -     case ${target_os} in
> -+      *-uclibc*)
> -+        enable_clocale_flag=3Duclibc
> -+        ;;
> -       linux* | gnu* | kfreebsd*-gnu | knetbsd*-gnu)
> - 	enable_clocale_flag=3Dgnu
> - 	;;
> -@@ -2085,6 +2088,40 @@
> -       CTIME_CC=3Dconfig/locale/generic/time_members.cc
> -       CLOCALE_INTERNAL_H=3Dconfig/locale/generic/c++locale_internal.h
> -       ;;
> -+    uclibc)
> -+      AC_MSG_RESULT(uclibc)
> -+
> -+      # Declare intention to use gettext, and add support for =
specific
> -+      # languages.
> -+      # For some reason, ALL_LINGUAS has to be before AM-GNU-GETTEXT
> -+      ALL_LINGUAS=3D"de fr"
> -+
> -+      # Don't call AM-GNU-GETTEXT here. Instead, assume glibc.
> -+      AC_CHECK_PROG(check_msgfmt, msgfmt, yes, no)
> -+      if test x"$check_msgfmt" =3D x"yes" && test x"$enable_nls" =3D =
x"yes"; then
> -+        USE_NLS=3Dyes
> -+      fi
> -+      # Export the build objects.
> -+      for ling in $ALL_LINGUAS; do \
> -+        glibcxx_MOFILES=3D"$glibcxx_MOFILES $ling.mo"; \
> -+        glibcxx_POFILES=3D"$glibcxx_POFILES $ling.po"; \
> -+      done
> -+      AC_SUBST(glibcxx_MOFILES)
> -+      AC_SUBST(glibcxx_POFILES)
> -+
> -+      CLOCALE_H=3Dconfig/locale/uclibc/c_locale.h
> -+      CLOCALE_CC=3Dconfig/locale/uclibc/c_locale.cc
> -+      CCODECVT_CC=3Dconfig/locale/uclibc/codecvt_members.cc
> -+      CCOLLATE_CC=3Dconfig/locale/uclibc/collate_members.cc
> -+      CCTYPE_CC=3Dconfig/locale/uclibc/ctype_members.cc
> -+      CMESSAGES_H=3Dconfig/locale/uclibc/messages_members.h
> -+      CMESSAGES_CC=3Dconfig/locale/uclibc/messages_members.cc
> -+      CMONEY_CC=3Dconfig/locale/uclibc/monetary_members.cc
> -+      CNUMERIC_CC=3Dconfig/locale/uclibc/numeric_members.cc
> -+      CTIME_H=3Dconfig/locale/uclibc/time_members.h
> -+      CTIME_CC=3Dconfig/locale/uclibc/time_members.cc
> -+      CLOCALE_INTERNAL_H=3Dconfig/locale/uclibc/c++locale_internal.h
> -+      ;;
> -   esac
> -=20
> -   # This is where the testsuite looks for locale catalogs, using the
> -Index: =
gcc-4_7-branch/libstdc++-v3/config/locale/uclibc/c++locale_internal.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- /dev/null	1970-01-01 00:00:00.000000000 +0000
> -+++ =
gcc-4_7-branch/libstdc++-v3/config/locale/uclibc/c++locale_internal.h	=
2012-04-10 10:30:37.327368356 -0700
> -@@ -0,0 +1,63 @@
> -+// Prototypes for GLIBC thread locale __-prefixed functions -*- C++ =
-*-
> -+
> -+// Copyright (C) 2002, 2004, 2005 Free Software Foundation, Inc.
> -+//
> -+// This file is part of the GNU ISO C++ Library.  This library is =
free
> -+// software; you can redistribute it and/or modify it under the
> -+// terms of the GNU General Public License as published by the
> -+// Free Software Foundation; either version 2, or (at your option)
> -+// any later version.
> -+
> -+// This library is distributed in the hope that it will be useful,
> -+// but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -+// GNU General Public License for more details.
> -+
> -+// You should have received a copy of the GNU General Public License =
along
> -+// with this library; see the file COPYING.  If not, write to the =
Free
> -+// Software Foundation, 59 Temple Place - Suite 330, Boston, MA =
02111-1307,
> -+// USA.
> -+
> -+// As a special exception, you may use this file as part of a free =
software
> -+// library without restriction.  Specifically, if other files =
instantiate
> -+// templates or use macros or inline functions from this file, or =
you compile
> -+// this file and link it with other files to produce an executable, =
this
> -+// file does not by itself cause the resulting executable to be =
covered by
> -+// the GNU General Public License.  This exception does not however
> -+// invalidate any other reasons why the executable file might be =
covered by
> -+// the GNU General Public License.
> -+
> -+// Written by Jakub Jelinek <jakub@redhat.com>
> -+
> -+#include <bits/c++config.h>
> -+#include <clocale>
> -+
> -+#ifdef __UCLIBC_MJN3_ONLY__
> -+#warning clean this up
> -+#endif
> -+
> -+#ifdef __UCLIBC_HAS_XLOCALE__
> -+
> -+extern "C" __typeof(nl_langinfo_l) __nl_langinfo_l;
> -+extern "C" __typeof(strcoll_l) __strcoll_l;
> -+extern "C" __typeof(strftime_l) __strftime_l;
> -+extern "C" __typeof(strtod_l) __strtod_l;
> -+extern "C" __typeof(strtof_l) __strtof_l;
> -+extern "C" __typeof(strtold_l) __strtold_l;
> -+extern "C" __typeof(strxfrm_l) __strxfrm_l;
> -+extern "C" __typeof(newlocale) __newlocale;
> -+extern "C" __typeof(freelocale) __freelocale;
> -+extern "C" __typeof(duplocale) __duplocale;
> -+extern "C" __typeof(uselocale) __uselocale;
> -+
> -+#ifdef _GLIBCXX_USE_WCHAR_T
> -+extern "C" __typeof(iswctype_l) __iswctype_l;
> -+extern "C" __typeof(towlower_l) __towlower_l;
> -+extern "C" __typeof(towupper_l) __towupper_l;
> -+extern "C" __typeof(wcscoll_l) __wcscoll_l;
> -+extern "C" __typeof(wcsftime_l) __wcsftime_l;
> -+extern "C" __typeof(wcsxfrm_l) __wcsxfrm_l;
> -+extern "C" __typeof(wctype_l) __wctype_l;
> -+#endif
> -+
> -+#endif // GLIBC 2.3 and later
> -Index: gcc-4_7-branch/libstdc++-v3/config/locale/uclibc/c_locale.cc
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- /dev/null	1970-01-01 00:00:00.000000000 +0000
> -+++ gcc-4_7-branch/libstdc++-v3/config/locale/uclibc/c_locale.cc	=
2012-04-10 10:30:37.327368356 -0700
> -@@ -0,0 +1,160 @@
> -+// Wrapper for underlying C-language localization -*- C++ -*-
> -+
> -+// Copyright (C) 2001, 2002, 2003 Free Software Foundation, Inc.
> -+//
> -+// This file is part of the GNU ISO C++ Library.  This library is =
free
> -+// software; you can redistribute it and/or modify it under the
> -+// terms of the GNU General Public License as published by the
> -+// Free Software Foundation; either version 2, or (at your option)
> -+// any later version.
> -+
> -+// This library is distributed in the hope that it will be useful,
> -+// but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -+// GNU General Public License for more details.
> -+
> -+// You should have received a copy of the GNU General Public License =
along
> -+// with this library; see the file COPYING.  If not, write to the =
Free
> -+// Software Foundation, 59 Temple Place - Suite 330, Boston, MA =
02111-1307,
> -+// USA.
> -+
> -+// As a special exception, you may use this file as part of a free =
software
> -+// library without restriction.  Specifically, if other files =
instantiate
> -+// templates or use macros or inline functions from this file, or =
you compile
> -+// this file and link it with other files to produce an executable, =
this
> -+// file does not by itself cause the resulting executable to be =
covered by
> -+// the GNU General Public License.  This exception does not however
> -+// invalidate any other reasons why the executable file might be =
covered by
> -+// the GNU General Public License.
> -+
> -+//
> -+// ISO C++ 14882: 22.8  Standard locale categories.
> -+//
> -+
> -+// Written by Benjamin Kosnik <bkoz@redhat.com>
> -+
> -+#include <cerrno>  // For errno
> -+#include <locale>
> -+#include <stdexcept>
> -+#include <langinfo.h>
> -+#include <bits/c++locale_internal.h>
> -+
> -+#ifndef __UCLIBC_HAS_XLOCALE__
> -+#define __strtol_l(S, E, B, L)      strtol((S), (E), (B))
> -+#define __strtoul_l(S, E, B, L)     strtoul((S), (E), (B))
> -+#define __strtoll_l(S, E, B, L)     strtoll((S), (E), (B))
> -+#define __strtoull_l(S, E, B, L)    strtoull((S), (E), (B))
> -+#define __strtof_l(S, E, L)         strtof((S), (E))
> -+#define __strtod_l(S, E, L)         strtod((S), (E))
> -+#define __strtold_l(S, E, L)        strtold((S), (E))
> -+#warning should dummy __newlocale check for C|POSIX ?
> -+#define __newlocale(a, b, c)        NULL
> -+#define __freelocale(a)             ((void)0)
> -+#define __duplocale(a)              __c_locale()
> -+#endif
> -+
> -+namespace std
> -+{
> -+  template<>
> -+    void
> -+    __convert_to_v(const char* __s, float& __v, ios_base::iostate& =
__err,
> -+		   const __c_locale& __cloc)
> -+    {
> -+      if (!(__err & ios_base::failbit))
> -+	{
> -+	  char* __sanity;
> -+	  errno =3D 0;
> -+	  float __f =3D __strtof_l(__s, &__sanity, __cloc);
> -+          if (__sanity !=3D __s && errno !=3D ERANGE)
> -+	    __v =3D __f;
> -+	  else
> -+	    __err |=3D ios_base::failbit;
> -+	}
> -+    }
> -+
> -+  template<>
> -+    void
> -+    __convert_to_v(const char* __s, double& __v, ios_base::iostate& =
__err,
> -+		   const __c_locale& __cloc)
> -+    {
> -+      if (!(__err & ios_base::failbit))
> -+	{
> -+	  char* __sanity;
> -+	  errno =3D 0;
> -+	  double __d =3D __strtod_l(__s, &__sanity, __cloc);
> -+          if (__sanity !=3D __s && errno !=3D ERANGE)
> -+	    __v =3D __d;
> -+	  else
> -+	    __err |=3D ios_base::failbit;
> -+	}
> -+    }
> -+
> -+  template<>
> -+    void
> -+    __convert_to_v(const char* __s, long double& __v, =
ios_base::iostate& __err,
> -+		   const __c_locale& __cloc)
> -+    {
> -+      if (!(__err & ios_base::failbit))
> -+	{
> -+	  char* __sanity;
> -+	  errno =3D 0;
> -+	  long double __ld =3D __strtold_l(__s, &__sanity, __cloc);
> -+          if (__sanity !=3D __s && errno !=3D ERANGE)
> -+	    __v =3D __ld;
> -+	  else
> -+	    __err |=3D ios_base::failbit;
> -+	}
> -+    }
> -+
> -+  void
> -+  locale::facet::_S_create_c_locale(__c_locale& __cloc, const char* =
__s,
> -+				    __c_locale __old)
> -+  {
> -+    __cloc =3D __newlocale(1 << LC_ALL, __s, __old);
> -+#ifdef __UCLIBC_HAS_XLOCALE__
> -+    if (!__cloc)
> -+      {
> -+	// This named locale is not supported by the underlying OS.
> -+	__throw_runtime_error(__N("locale::facet::_S_create_c_locale "
> -+			      "name not valid"));
> -+      }
> -+#endif
> -+  }
> -+
> -+  void
> -+  locale::facet::_S_destroy_c_locale(__c_locale& __cloc)
> -+  {
> -+    if (_S_get_c_locale() !=3D __cloc)
> -+      __freelocale(__cloc);
> -+  }
> -+
> -+  __c_locale
> -+  locale::facet::_S_clone_c_locale(__c_locale& __cloc)
> -+  { return __duplocale(__cloc); }
> -+} // namespace std
> -+
> -+namespace __gnu_cxx
> -+{
> -+  const char* const category_names[6 + _GLIBCXX_NUM_CATEGORIES] =3D
> -+    {
> -+      "LC_CTYPE",
> -+      "LC_NUMERIC",
> -+      "LC_TIME",
> -+      "LC_COLLATE",
> -+      "LC_MONETARY",
> -+      "LC_MESSAGES",
> -+#if _GLIBCXX_NUM_CATEGORIES !=3D 0
> -+      "LC_PAPER",
> -+      "LC_NAME",
> -+      "LC_ADDRESS",
> -+      "LC_TELEPHONE",
> -+      "LC_MEASUREMENT",
> -+      "LC_IDENTIFICATION"
> -+#endif
> -+    };
> -+}
> -+
> -+namespace std
> -+{
> -+  const char* const* const locale::_S_categories =3D =
__gnu_cxx::category_names;
> -+}  // namespace std
> -Index: gcc-4_7-branch/libstdc++-v3/config/locale/uclibc/c_locale.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- /dev/null	1970-01-01 00:00:00.000000000 +0000
> -+++ gcc-4_7-branch/libstdc++-v3/config/locale/uclibc/c_locale.h	=
2012-04-10 10:30:37.327368356 -0700
> -@@ -0,0 +1,117 @@
> -+// Wrapper for underlying C-language localization -*- C++ -*-
> -+
> -+// Copyright (C) 2001, 2002, 2003, 2004, 2005 Free Software =
Foundation, Inc.
> -+//
> -+// This file is part of the GNU ISO C++ Library.  This library is =
free
> -+// software; you can redistribute it and/or modify it under the
> -+// terms of the GNU General Public License as published by the
> -+// Free Software Foundation; either version 2, or (at your option)
> -+// any later version.
> -+
> -+// This library is distributed in the hope that it will be useful,
> -+// but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -+// GNU General Public License for more details.
> -+
> -+// You should have received a copy of the GNU General Public License =
along
> -+// with this library; see the file COPYING.  If not, write to the =
Free
> -+// Software Foundation, 59 Temple Place - Suite 330, Boston, MA =
02111-1307,
> -+// USA.
> -+
> -+// As a special exception, you may use this file as part of a free =
software
> -+// library without restriction.  Specifically, if other files =
instantiate
> -+// templates or use macros or inline functions from this file, or =
you compile
> -+// this file and link it with other files to produce an executable, =
this
> -+// file does not by itself cause the resulting executable to be =
covered by
> -+// the GNU General Public License.  This exception does not however
> -+// invalidate any other reasons why the executable file might be =
covered by
> -+// the GNU General Public License.
> -+
> -+//
> -+// ISO C++ 14882: 22.8  Standard locale categories.
> -+//
> -+
> -+// Written by Benjamin Kosnik <bkoz@redhat.com>
> -+
> -+#ifndef _C_LOCALE_H
> -+#define _C_LOCALE_H 1
> -+
> -+#pragma GCC system_header
> -+
> -+#include <cstring>              // get std::strlen
> -+#include <cstdio>               // get std::snprintf or std::sprintf
> -+#include <clocale>
> -+#include <langinfo.h>		// For codecvt
> -+#ifdef __UCLIBC_MJN3_ONLY__
> -+#warning fix this
> -+#endif
> -+#ifdef __UCLIBC_HAS_LOCALE__
> -+#include <iconv.h>		// For codecvt using iconv, iconv_t
> -+#endif
> -+#ifdef __UCLIBC_HAS_GETTEXT_AWARENESS__
> -+#include <libintl.h> 		// For messages
> -+#endif
> -+
> -+#ifdef __UCLIBC_MJN3_ONLY__
> -+#warning what is _GLIBCXX_C_LOCALE_GNU for
> -+#endif
> -+#define _GLIBCXX_C_LOCALE_GNU 1
> -+
> -+#ifdef __UCLIBC_MJN3_ONLY__
> -+#warning fix categories
> -+#endif
> -+// #define _GLIBCXX_NUM_CATEGORIES 6
> -+#define _GLIBCXX_NUM_CATEGORIES 0
> -+
> -+#ifdef __UCLIBC_HAS_XLOCALE__
> -+namespace __gnu_cxx
> -+{
> -+  extern "C" __typeof(uselocale) __uselocale;
> -+}
> -+#endif
> -+
> -+namespace std
> -+{
> -+#ifdef __UCLIBC_HAS_XLOCALE__
> -+  typedef __locale_t		__c_locale;
> -+#else
> -+  typedef int*			__c_locale;
> -+#endif
> -+
> -+  // Convert numeric value of type _Tv to string and return length =
of
> -+  // string.  If snprintf is available use it, otherwise fall back =
to
> -+  // the unsafe sprintf which, in general, can be dangerous and =
should
> -+  // be avoided.
> -+  template<typename _Tv>
> -+    int
> -+    __convert_from_v(char* __out,
> -+		     const int __size __attribute__ ((__unused__)),
> -+		     const char* __fmt,
> -+#ifdef __UCLIBC_HAS_XCLOCALE__
> -+		     _Tv __v, const __c_locale& __cloc, int __prec)
> -+    {
> -+      __c_locale __old =3D __gnu_cxx::__uselocale(__cloc);
> -+#else
> -+		     _Tv __v, const __c_locale&, int __prec)
> -+    {
> -+# ifdef __UCLIBC_HAS_LOCALE__
> -+      char* __old =3D std::setlocale(LC_ALL, NULL);
> -+      char* __sav =3D new char[std::strlen(__old) + 1];
> -+      std::strcpy(__sav, __old);
> -+      std::setlocale(LC_ALL, "C");
> -+# endif
> -+#endif
> -+
> -+      const int __ret =3D std::snprintf(__out, __size, __fmt, =
__prec, __v);
> -+
> -+#ifdef __UCLIBC_HAS_XCLOCALE__
> -+      __gnu_cxx::__uselocale(__old);
> -+#elif defined __UCLIBC_HAS_LOCALE__
> -+      std::setlocale(LC_ALL, __sav);
> -+      delete [] __sav;
> -+#endif
> -+      return __ret;
> -+    }
> -+}
> -+
> -+#endif
> -Index: =
gcc-4_7-branch/libstdc++-v3/config/locale/uclibc/codecvt_members.cc
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- /dev/null	1970-01-01 00:00:00.000000000 +0000
> -+++ =
gcc-4_7-branch/libstdc++-v3/config/locale/uclibc/codecvt_members.cc	=
2012-04-10 10:30:37.327368356 -0700
> -@@ -0,0 +1,308 @@
> -+// std::codecvt implementation details, GNU version -*- C++ -*-
> -+
> -+// Copyright (C) 2002, 2003 Free Software Foundation, Inc.
> -+//
> -+// This file is part of the GNU ISO C++ Library.  This library is =
free
> -+// software; you can redistribute it and/or modify it under the
> -+// terms of the GNU General Public License as published by the
> -+// Free Software Foundation; either version 2, or (at your option)
> -+// any later version.
> -+
> -+// This library is distributed in the hope that it will be useful,
> -+// but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -+// GNU General Public License for more details.
> -+
> -+// You should have received a copy of the GNU General Public License =
along
> -+// with this library; see the file COPYING.  If not, write to the =
Free
> -+// Software Foundation, 59 Temple Place - Suite 330, Boston, MA =
02111-1307,
> -+// USA.
> -+
> -+// As a special exception, you may use this file as part of a free =
software
> -+// library without restriction.  Specifically, if other files =
instantiate
> -+// templates or use macros or inline functions from this file, or =
you compile
> -+// this file and link it with other files to produce an executable, =
this
> -+// file does not by itself cause the resulting executable to be =
covered by
> -+// the GNU General Public License.  This exception does not however
> -+// invalidate any other reasons why the executable file might be =
covered by
> -+// the GNU General Public License.
> -+
> -+//
> -+// ISO C++ 14882: 22.2.1.5 - Template class codecvt
> -+//
> -+
> -+// Written by Benjamin Kosnik <bkoz@redhat.com>
> -+
> -+#include <locale>
> -+#include <cstdlib>  // For MB_CUR_MAX
> -+#include <climits>  // For MB_LEN_MAX
> -+#include <bits/c++locale_internal.h>
> -+
> -+namespace std
> -+{
> -+  // Specializations.
> -+#ifdef _GLIBCXX_USE_WCHAR_T
> -+  codecvt_base::result
> -+  codecvt<wchar_t, char, mbstate_t>::
> -+  do_out(state_type& __state, const intern_type* __from,
> -+	 const intern_type* __from_end, const intern_type*& __from_next,
> -+	 extern_type* __to, extern_type* __to_end,
> -+	 extern_type*& __to_next) const
> -+  {
> -+    result __ret =3D ok;
> -+    state_type __tmp_state(__state);
> -+
> -+#ifdef __UCLIBC_HAS_XLOCALE__
> -+    __c_locale __old =3D __uselocale(_M_c_locale_codecvt);
> -+#endif
> -+
> -+    // wcsnrtombs is *very* fast but stops if encounters NUL =
characters:
> -+    // in case we fall back to wcrtomb and then continue, in a loop.
> -+    // NB: wcsnrtombs is a GNU extension
> -+    for (__from_next =3D __from, __to_next =3D __to;
> -+	 __from_next < __from_end && __to_next < __to_end
> -+	 && __ret =3D=3D ok;)
> -+      {
> -+	const intern_type* __from_chunk_end =3D wmemchr(__from_next, =
L'\0',
> -+						      __from_end - =
__from_next);
> -+	if (!__from_chunk_end)
> -+	  __from_chunk_end =3D __from_end;
> -+
> -+	__from =3D __from_next;
> -+	const size_t __conv =3D wcsnrtombs(__to_next, &__from_next,
> -+					 __from_chunk_end - __from_next,
> -+					 __to_end - __to_next, =
&__state);
> -+	if (__conv =3D=3D static_cast<size_t>(-1))
> -+	  {
> -+	    // In case of error, in order to stop at the exact place we
> -+	    // have to start again from the beginning with a series of
> -+	    // wcrtomb.
> -+	    for (; __from < __from_next; ++__from)
> -+	      __to_next +=3D wcrtomb(__to_next, *__from, &__tmp_state);
> -+	    __state =3D __tmp_state;
> -+	    __ret =3D error;
> -+	  }
> -+	else if (__from_next && __from_next < __from_chunk_end)
> -+	  {
> -+	    __to_next +=3D __conv;
> -+	    __ret =3D partial;
> -+	  }
> -+	else
> -+	  {
> -+	    __from_next =3D __from_chunk_end;
> -+	    __to_next +=3D __conv;
> -+	  }
> -+
> -+	if (__from_next < __from_end && __ret =3D=3D ok)
> -+	  {
> -+	    extern_type __buf[MB_LEN_MAX];
> -+	    __tmp_state =3D __state;
> -+	    const size_t __conv =3D wcrtomb(__buf, *__from_next, =
&__tmp_state);
> -+	    if (__conv > static_cast<size_t>(__to_end - __to_next))
> -+	      __ret =3D partial;
> -+	    else
> -+	      {
> -+		memcpy(__to_next, __buf, __conv);
> -+		__state =3D __tmp_state;
> -+		__to_next +=3D __conv;
> -+		++__from_next;
> -+	      }
> -+	  }
> -+      }
> -+
> -+#ifdef __UCLIBC_HAS_XLOCALE__
> -+    __uselocale(__old);
> -+#endif
> -+
> -+    return __ret;
> -+  }
> -+
> -+  codecvt_base::result
> -+  codecvt<wchar_t, char, mbstate_t>::
> -+  do_in(state_type& __state, const extern_type* __from,
> -+	const extern_type* __from_end, const extern_type*& __from_next,
> -+	intern_type* __to, intern_type* __to_end,
> -+	intern_type*& __to_next) const
> -+  {
> -+    result __ret =3D ok;
> -+    state_type __tmp_state(__state);
> -+
> -+#ifdef __UCLIBC_HAS_XLOCALE__
> -+    __c_locale __old =3D __uselocale(_M_c_locale_codecvt);
> -+#endif
> -+
> -+    // mbsnrtowcs is *very* fast but stops if encounters NUL =
characters:
> -+    // in case we store a L'\0' and then continue, in a loop.
> -+    // NB: mbsnrtowcs is a GNU extension
> -+    for (__from_next =3D __from, __to_next =3D __to;
> -+	 __from_next < __from_end && __to_next < __to_end
> -+	 && __ret =3D=3D ok;)
> -+      {
> -+	const extern_type* __from_chunk_end;
> -+	__from_chunk_end =3D static_cast<const =
extern_type*>(memchr(__from_next, '\0',
> -+								  =
__from_end
> -+								  - =
__from_next));
> -+	if (!__from_chunk_end)
> -+	  __from_chunk_end =3D __from_end;
> -+
> -+	__from =3D __from_next;
> -+	size_t __conv =3D mbsnrtowcs(__to_next, &__from_next,
> -+				   __from_chunk_end - __from_next,
> -+				   __to_end - __to_next, &__state);
> -+	if (__conv =3D=3D static_cast<size_t>(-1))
> -+	  {
> -+	    // In case of error, in order to stop at the exact place we
> -+	    // have to start again from the beginning with a series of
> -+	    // mbrtowc.
> -+	    for (;; ++__to_next, __from +=3D __conv)
> -+	      {
> -+		__conv =3D mbrtowc(__to_next, __from, __from_end - =
__from,
> -+				 &__tmp_state);
> -+		if (__conv =3D=3D static_cast<size_t>(-1)
> -+		    || __conv =3D=3D static_cast<size_t>(-2))
> -+		  break;
> -+	      }
> -+	    __from_next =3D __from;
> -+	    __state =3D __tmp_state;
> -+	    __ret =3D error;
> -+	  }
> -+	else if (__from_next && __from_next < __from_chunk_end)
> -+	  {
> -+	    // It is unclear what to return in this case (see DR 382).
> -+	    __to_next +=3D __conv;
> -+	    __ret =3D partial;
> -+	  }
> -+	else
> -+	  {
> -+	    __from_next =3D __from_chunk_end;
> -+	    __to_next +=3D __conv;
> -+	  }
> -+
> -+	if (__from_next < __from_end && __ret =3D=3D ok)
> -+	  {
> -+	    if (__to_next < __to_end)
> -+	      {
> -+		// XXX Probably wrong for stateful encodings
> -+		__tmp_state =3D __state;
> -+		++__from_next;
> -+		*__to_next++ =3D L'\0';
> -+	      }
> -+	    else
> -+	      __ret =3D partial;
> -+	  }
> -+      }
> -+
> -+#ifdef __UCLIBC_HAS_XLOCALE__
> -+    __uselocale(__old);
> -+#endif
> -+
> -+    return __ret;
> -+  }
> -+
> -+  int
> -+  codecvt<wchar_t, char, mbstate_t>::
> -+  do_encoding() const throw()
> -+  {
> -+    // XXX This implementation assumes that the encoding is
> -+    // stateless and is either single-byte or variable-width.
> -+    int __ret =3D 0;
> -+#ifdef __UCLIBC_HAS_XLOCALE__
> -+    __c_locale __old =3D __uselocale(_M_c_locale_codecvt);
> -+#endif
> -+    if (MB_CUR_MAX =3D=3D 1)
> -+      __ret =3D 1;
> -+#ifdef __UCLIBC_HAS_XLOCALE__
> -+    __uselocale(__old);
> -+#endif
> -+    return __ret;
> -+  }
> -+
> -+  int
> -+  codecvt<wchar_t, char, mbstate_t>::
> -+  do_max_length() const throw()
> -+  {
> -+#ifdef __UCLIBC_HAS_XLOCALE__
> -+    __c_locale __old =3D __uselocale(_M_c_locale_codecvt);
> -+#endif
> -+    // XXX Probably wrong for stateful encodings.
> -+    int __ret =3D MB_CUR_MAX;
> -+#ifdef __UCLIBC_HAS_XLOCALE__
> -+    __uselocale(__old);
> -+#endif
> -+    return __ret;
> -+  }
> -+
> -+  int
> -+  codecvt<wchar_t, char, mbstate_t>::
> -+  do_length(state_type& __state, const extern_type* __from,
> -+	    const extern_type* __end, size_t __max) const
> -+  {
> -+    int __ret =3D 0;
> -+    state_type __tmp_state(__state);
> -+
> -+#ifdef __UCLIBC_HAS_XLOCALE__
> -+    __c_locale __old =3D __uselocale(_M_c_locale_codecvt);
> -+#endif
> -+
> -+    // mbsnrtowcs is *very* fast but stops if encounters NUL =
characters:
> -+    // in case we advance past it and then continue, in a loop.
> -+    // NB: mbsnrtowcs is a GNU extension
> -+
> -+    // A dummy internal buffer is needed in order for mbsnrtocws to =
consider
> -+    // its fourth parameter (it wouldn't with NULL as first =
parameter).
> -+    wchar_t* __to =3D =
static_cast<wchar_t*>(__builtin_alloca(sizeof(wchar_t)
> -+							   * __max));
> -+    while (__from < __end && __max)
> -+      {
> -+	const extern_type* __from_chunk_end;
> -+	__from_chunk_end =3D static_cast<const =
extern_type*>(memchr(__from, '\0',
> -+								  __end
> -+								  - =
__from));
> -+	if (!__from_chunk_end)
> -+	  __from_chunk_end =3D __end;
> -+
> -+	const extern_type* __tmp_from =3D __from;
> -+	size_t __conv =3D mbsnrtowcs(__to, &__from,
> -+				   __from_chunk_end - __from,
> -+				   __max, &__state);
> -+	if (__conv =3D=3D static_cast<size_t>(-1))
> -+	  {
> -+	    // In case of error, in order to stop at the exact place we
> -+	    // have to start again from the beginning with a series of
> -+	    // mbrtowc.
> -+	    for (__from =3D __tmp_from;; __from +=3D __conv)
> -+	      {
> -+		__conv =3D mbrtowc(NULL, __from, __end - __from,
> -+				 &__tmp_state);
> -+		if (__conv =3D=3D static_cast<size_t>(-1)
> -+		    || __conv =3D=3D static_cast<size_t>(-2))
> -+		  break;
> -+	      }
> -+	    __state =3D __tmp_state;
> -+	    __ret +=3D __from - __tmp_from;
> -+	    break;
> -+	  }
> -+	if (!__from)
> -+	  __from =3D __from_chunk_end;
> -+
> -+	__ret +=3D __from - __tmp_from;
> -+	__max -=3D __conv;
> -+
> -+	if (__from < __end && __max)
> -+	  {
> -+	    // XXX Probably wrong for stateful encodings
> -+	    __tmp_state =3D __state;
> -+	    ++__from;
> -+	    ++__ret;
> -+	    --__max;
> -+	  }
> -+      }
> -+
> -+#ifdef __UCLIBC_HAS_XLOCALE__
> -+    __uselocale(__old);
> -+#endif
> -+
> -+    return __ret;
> -+  }
> -+#endif
> -+}
> -Index: =
gcc-4_7-branch/libstdc++-v3/config/locale/uclibc/collate_members.cc
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- /dev/null	1970-01-01 00:00:00.000000000 +0000
> -+++ =
gcc-4_7-branch/libstdc++-v3/config/locale/uclibc/collate_members.cc	=
2012-04-10 10:30:37.327368356 -0700
> -@@ -0,0 +1,80 @@
> -+// std::collate implementation details, GNU version -*- C++ -*-
> -+
> -+// Copyright (C) 2001, 2002 Free Software Foundation, Inc.
> -+//
> -+// This file is part of the GNU ISO C++ Library.  This library is =
free
> -+// software; you can redistribute it and/or modify it under the
> -+// terms of the GNU General Public License as published by the
> -+// Free Software Foundation; either version 2, or (at your option)
> -+// any later version.
> -+
> -+// This library is distributed in the hope that it will be useful,
> -+// but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -+// GNU General Public License for more details.
> -+
> -+// You should have received a copy of the GNU General Public License =
along
> -+// with this library; see the file COPYING.  If not, write to the =
Free
> -+// Software Foundation, 59 Temple Place - Suite 330, Boston, MA =
02111-1307,
> -+// USA.
> -+
> -+// As a special exception, you may use this file as part of a free =
software
> -+// library without restriction.  Specifically, if other files =
instantiate
> -+// templates or use macros or inline functions from this file, or =
you compile
> -+// this file and link it with other files to produce an executable, =
this
> -+// file does not by itself cause the resulting executable to be =
covered by
> -+// the GNU General Public License.  This exception does not however
> -+// invalidate any other reasons why the executable file might be =
covered by
> -+// the GNU General Public License.
> -+
> -+//
> -+// ISO C++ 14882: 22.2.4.1.2  collate virtual functions
> -+//
> -+
> -+// Written by Benjamin Kosnik <bkoz@redhat.com>
> -+
> -+#include <locale>
> -+#include <bits/c++locale_internal.h>
> -+
> -+#ifndef __UCLIBC_HAS_XLOCALE__
> -+#define __strcoll_l(S1, S2, L)      strcoll((S1), (S2))
> -+#define __strxfrm_l(S1, S2, N, L)   strxfrm((S1), (S2), (N))
> -+#define __wcscoll_l(S1, S2, L)      wcscoll((S1), (S2))
> -+#define __wcsxfrm_l(S1, S2, N, L)   wcsxfrm((S1), (S2), (N))
> -+#endif
> -+
> -+namespace std
> -+{
> -+  // These are basically extensions to char_traits, and perhaps =
should
> -+  // be put there instead of here.
> -+  template<>
> -+    int
> -+    collate<char>::_M_compare(const char* __one, const char* __two) =
const
> -+    {
> -+      int __cmp =3D __strcoll_l(__one, __two, _M_c_locale_collate);
> -+      return (__cmp >> (8 * sizeof (int) - 2)) | (__cmp !=3D 0);
> -+    }
> -+
> -+  template<>
> -+    size_t
> -+    collate<char>::_M_transform(char* __to, const char* __from,
> -+				size_t __n) const
> -+    { return __strxfrm_l(__to, __from, __n, _M_c_locale_collate); }
> -+
> -+#ifdef _GLIBCXX_USE_WCHAR_T
> -+  template<>
> -+    int
> -+    collate<wchar_t>::_M_compare(const wchar_t* __one,
> -+				 const wchar_t* __two) const
> -+    {
> -+      int __cmp =3D __wcscoll_l(__one, __two, _M_c_locale_collate);
> -+      return (__cmp >> (8 * sizeof (int) - 2)) | (__cmp !=3D 0);
> -+    }
> -+
> -+  template<>
> -+    size_t
> -+    collate<wchar_t>::_M_transform(wchar_t* __to, const wchar_t* =
__from,
> -+				   size_t __n) const
> -+    { return __wcsxfrm_l(__to, __from, __n, _M_c_locale_collate); }
> -+#endif
> -+}
> -Index: =
gcc-4_7-branch/libstdc++-v3/config/locale/uclibc/ctype_members.cc
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- /dev/null	1970-01-01 00:00:00.000000000 +0000
> -+++ gcc-4_7-branch/libstdc++-v3/config/locale/uclibc/ctype_members.cc	=
2012-04-10 10:30:37.331368420 -0700
> -@@ -0,0 +1,300 @@
> -+// std::ctype implementation details, GNU version -*- C++ -*-
> -+
> -+// Copyright (C) 2001, 2002, 2003, 2004 Free Software Foundation, =
Inc.
> -+//
> -+// This file is part of the GNU ISO C++ Library.  This library is =
free
> -+// software; you can redistribute it and/or modify it under the
> -+// terms of the GNU General Public License as published by the
> -+// Free Software Foundation; either version 2, or (at your option)
> -+// any later version.
> -+
> -+// This library is distributed in the hope that it will be useful,
> -+// but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -+// GNU General Public License for more details.
> -+
> -+// You should have received a copy of the GNU General Public License =
along
> -+// with this library; see the file COPYING.  If not, write to the =
Free
> -+// Software Foundation, 59 Temple Place - Suite 330, Boston, MA =
02111-1307,
> -+// USA.
> -+
> -+// As a special exception, you may use this file as part of a free =
software
> -+// library without restriction.  Specifically, if other files =
instantiate
> -+// templates or use macros or inline functions from this file, or =
you compile
> -+// this file and link it with other files to produce an executable, =
this
> -+// file does not by itself cause the resulting executable to be =
covered by
> -+// the GNU General Public License.  This exception does not however
> -+// invalidate any other reasons why the executable file might be =
covered by
> -+// the GNU General Public License.
> -+
> -+//
> -+// ISO C++ 14882: 22.2.1.1.2  ctype virtual functions.
> -+//
> -+
> -+// Written by Benjamin Kosnik <bkoz@redhat.com>
> -+
> -+#define _LIBC
> -+#include <locale>
> -+#undef _LIBC
> -+#include <bits/c++locale_internal.h>
> -+
> -+#ifndef __UCLIBC_HAS_XLOCALE__
> -+#define __wctype_l(S, L)           wctype((S))
> -+#define __towupper_l(C, L)         towupper((C))
> -+#define __towlower_l(C, L)         towlower((C))
> -+#define __iswctype_l(C, M, L)      iswctype((C), (M))
> -+#endif
> -+
> -+namespace std
> -+{
> -+  // NB: The other ctype<char> specializations are in src/locale.cc =
and
> -+  // various /config/os/* files.
> -+  template<>
> -+    ctype_byname<char>::ctype_byname(const char* __s, size_t __refs)
> -+    : ctype<char>(0, false, __refs)
> -+    {
> -+      if (std::strcmp(__s, "C") !=3D 0 && std::strcmp(__s, "POSIX") =
!=3D 0)
> -+	{
> -+	  this->_S_destroy_c_locale(this->_M_c_locale_ctype);
> -+	  this->_S_create_c_locale(this->_M_c_locale_ctype, __s);
> -+#ifdef __UCLIBC_HAS_XLOCALE__
> -+	  this->_M_toupper =3D this->_M_c_locale_ctype->__ctype_toupper;
> -+	  this->_M_tolower =3D this->_M_c_locale_ctype->__ctype_tolower;
> -+	  this->_M_table =3D this->_M_c_locale_ctype->__ctype_b;
> -+#endif
> -+	}
> -+    }
> -+
> -+#ifdef _GLIBCXX_USE_WCHAR_T
> -+  ctype<wchar_t>::__wmask_type
> -+  ctype<wchar_t>::_M_convert_to_wmask(const mask __m) const
> -+  {
> -+    __wmask_type __ret;
> -+    switch (__m)
> -+      {
> -+      case space:
> -+	__ret =3D __wctype_l("space", _M_c_locale_ctype);
> -+	break;
> -+      case print:
> -+	__ret =3D __wctype_l("print", _M_c_locale_ctype);
> -+	break;
> -+      case cntrl:
> -+	__ret =3D __wctype_l("cntrl", _M_c_locale_ctype);
> -+	break;
> -+      case upper:
> -+	__ret =3D __wctype_l("upper", _M_c_locale_ctype);
> -+	break;
> -+      case lower:
> -+	__ret =3D __wctype_l("lower", _M_c_locale_ctype);
> -+	break;
> -+      case alpha:
> -+	__ret =3D __wctype_l("alpha", _M_c_locale_ctype);
> -+	break;
> -+      case digit:
> -+	__ret =3D __wctype_l("digit", _M_c_locale_ctype);
> -+	break;
> -+      case punct:
> -+	__ret =3D __wctype_l("punct", _M_c_locale_ctype);
> -+	break;
> -+      case xdigit:
> -+	__ret =3D __wctype_l("xdigit", _M_c_locale_ctype);
> -+	break;
> -+      case alnum:
> -+	__ret =3D __wctype_l("alnum", _M_c_locale_ctype);
> -+	break;
> -+      case graph:
> -+	__ret =3D __wctype_l("graph", _M_c_locale_ctype);
> -+	break;
> -+      default:
> -+	__ret =3D __wmask_type();
> -+      }
> -+    return __ret;
> -+  }
> -+
> -+  wchar_t
> -+  ctype<wchar_t>::do_toupper(wchar_t __c) const
> -+  { return __towupper_l(__c, _M_c_locale_ctype); }
> -+
> -+  const wchar_t*
> -+  ctype<wchar_t>::do_toupper(wchar_t* __lo, const wchar_t* __hi) =
const
> -+  {
> -+    while (__lo < __hi)
> -+      {
> -+        *__lo =3D __towupper_l(*__lo, _M_c_locale_ctype);
> -+        ++__lo;
> -+      }
> -+    return __hi;
> -+  }
> -+
> -+  wchar_t
> -+  ctype<wchar_t>::do_tolower(wchar_t __c) const
> -+  { return __towlower_l(__c, _M_c_locale_ctype); }
> -+
> -+  const wchar_t*
> -+  ctype<wchar_t>::do_tolower(wchar_t* __lo, const wchar_t* __hi) =
const
> -+  {
> -+    while (__lo < __hi)
> -+      {
> -+        *__lo =3D __towlower_l(*__lo, _M_c_locale_ctype);
> -+        ++__lo;
> -+      }
> -+    return __hi;
> -+  }
> -+
> -+  bool
> -+  ctype<wchar_t>::
> -+  do_is(mask __m, wchar_t __c) const
> -+  {
> -+    // Highest bitmask in ctype_base =3D=3D 10, but extra in "C"
> -+    // library for blank.
> -+    bool __ret =3D false;
> -+    const size_t __bitmasksize =3D 11;
> -+    for (size_t __bitcur =3D 0; __bitcur <=3D __bitmasksize; =
++__bitcur)
> -+      if (__m & _M_bit[__bitcur]
> -+	  && __iswctype_l(__c, _M_wmask[__bitcur], _M_c_locale_ctype))
> -+	{
> -+	  __ret =3D true;
> -+	  break;
> -+	}
> -+    return __ret;
> -+  }
> -+
> -+  const wchar_t*
> -+  ctype<wchar_t>::
> -+  do_is(const wchar_t* __lo, const wchar_t* __hi, mask* __vec) const
> -+  {
> -+    for (; __lo < __hi; ++__vec, ++__lo)
> -+      {
> -+	// Highest bitmask in ctype_base =3D=3D 10, but extra in "C"
> -+	// library for blank.
> -+	const size_t __bitmasksize =3D 11;
> -+	mask __m =3D 0;
> -+	for (size_t __bitcur =3D 0; __bitcur <=3D __bitmasksize; =
++__bitcur)
> -+	  if (__iswctype_l(*__lo, _M_wmask[__bitcur], =
_M_c_locale_ctype))
> -+	    __m |=3D _M_bit[__bitcur];
> -+	*__vec =3D __m;
> -+      }
> -+    return __hi;
> -+  }
> -+
> -+  const wchar_t*
> -+  ctype<wchar_t>::
> -+  do_scan_is(mask __m, const wchar_t* __lo, const wchar_t* __hi) =
const
> -+  {
> -+    while (__lo < __hi && !this->do_is(__m, *__lo))
> -+      ++__lo;
> -+    return __lo;
> -+  }
> -+
> -+  const wchar_t*
> -+  ctype<wchar_t>::
> -+  do_scan_not(mask __m, const char_type* __lo, const char_type* =
__hi) const
> -+  {
> -+    while (__lo < __hi && this->do_is(__m, *__lo) !=3D 0)
> -+      ++__lo;
> -+    return __lo;
> -+  }
> -+
> -+  wchar_t
> -+  ctype<wchar_t>::
> -+  do_widen(char __c) const
> -+  { return _M_widen[static_cast<unsigned char>(__c)]; }
> -+
> -+  const char*
> -+  ctype<wchar_t>::
> -+  do_widen(const char* __lo, const char* __hi, wchar_t* __dest) =
const
> -+  {
> -+    while (__lo < __hi)
> -+      {
> -+	*__dest =3D _M_widen[static_cast<unsigned char>(*__lo)];
> -+	++__lo;
> -+	++__dest;
> -+      }
> -+    return __hi;
> -+  }
> -+
> -+  char
> -+  ctype<wchar_t>::
> -+  do_narrow(wchar_t __wc, char __dfault) const
> -+  {
> -+    if (__wc >=3D 0 && __wc < 128 && _M_narrow_ok)
> -+      return _M_narrow[__wc];
> -+#ifdef __UCLIBC_HAS_XLOCALE__
> -+    __c_locale __old =3D __uselocale(_M_c_locale_ctype);
> -+#endif
> -+    const int __c =3D wctob(__wc);
> -+#ifdef __UCLIBC_HAS_XLOCALE__
> -+    __uselocale(__old);
> -+#endif
> -+    return (__c =3D=3D EOF ? __dfault : static_cast<char>(__c));
> -+  }
> -+
> -+  const wchar_t*
> -+  ctype<wchar_t>::
> -+  do_narrow(const wchar_t* __lo, const wchar_t* __hi, char __dfault,
> -+	    char* __dest) const
> -+  {
> -+#ifdef __UCLIBC_HAS_XLOCALE__
> -+    __c_locale __old =3D __uselocale(_M_c_locale_ctype);
> -+#endif
> -+    if (_M_narrow_ok)
> -+      while (__lo < __hi)
> -+	{
> -+	  if (*__lo >=3D 0 && *__lo < 128)
> -+	    *__dest =3D _M_narrow[*__lo];
> -+	  else
> -+	    {
> -+	      const int __c =3D wctob(*__lo);
> -+	      *__dest =3D (__c =3D=3D EOF ? __dfault : =
static_cast<char>(__c));
> -+	    }
> -+	  ++__lo;
> -+	  ++__dest;
> -+	}
> -+    else
> -+      while (__lo < __hi)
> -+	{
> -+	  const int __c =3D wctob(*__lo);
> -+	  *__dest =3D (__c =3D=3D EOF ? __dfault : =
static_cast<char>(__c));
> -+	  ++__lo;
> -+	  ++__dest;
> -+	}
> -+#ifdef __UCLIBC_HAS_XLOCALE__
> -+    __uselocale(__old);
> -+#endif
> -+    return __hi;
> -+  }
> -+
> -+  void
> -+  ctype<wchar_t>::_M_initialize_ctype()
> -+  {
> -+#ifdef __UCLIBC_HAS_XLOCALE__
> -+    __c_locale __old =3D __uselocale(_M_c_locale_ctype);
> -+#endif
> -+    wint_t __i;
> -+    for (__i =3D 0; __i < 128; ++__i)
> -+      {
> -+	const int __c =3D wctob(__i);
> -+	if (__c =3D=3D EOF)
> -+	  break;
> -+	else
> -+	  _M_narrow[__i] =3D static_cast<char>(__c);
> -+      }
> -+    if (__i =3D=3D 128)
> -+      _M_narrow_ok =3D true;
> -+    else
> -+      _M_narrow_ok =3D false;
> -+    for (size_t __j =3D 0;
> -+	 __j < sizeof(_M_widen) / sizeof(wint_t); ++__j)
> -+      _M_widen[__j] =3D btowc(__j);
> -+
> -+    for (size_t __k =3D 0; __k <=3D 11; ++__k)
> -+      {
> -+	_M_bit[__k] =3D static_cast<mask>(_ISbit(__k));
> -+	_M_wmask[__k] =3D _M_convert_to_wmask(_M_bit[__k]);
> -+      }
> -+#ifdef __UCLIBC_HAS_XLOCALE__
> -+    __uselocale(__old);
> -+#endif
> -+  }
> -+#endif //  _GLIBCXX_USE_WCHAR_T
> -+}
> -Index: =
gcc-4_7-branch/libstdc++-v3/config/locale/uclibc/messages_members.cc
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- /dev/null	1970-01-01 00:00:00.000000000 +0000
> -+++ =
gcc-4_7-branch/libstdc++-v3/config/locale/uclibc/messages_members.cc	=
2012-04-10 10:30:37.331368420 -0700
> -@@ -0,0 +1,100 @@
> -+// std::messages implementation details, GNU version -*- C++ -*-
> -+
> -+// Copyright (C) 2001, 2002 Free Software Foundation, Inc.
> -+//
> -+// This file is part of the GNU ISO C++ Library.  This library is =
free
> -+// software; you can redistribute it and/or modify it under the
> -+// terms of the GNU General Public License as published by the
> -+// Free Software Foundation; either version 2, or (at your option)
> -+// any later version.
> -+
> -+// This library is distributed in the hope that it will be useful,
> -+// but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -+// GNU General Public License for more details.
> -+
> -+// You should have received a copy of the GNU General Public License =
along
> -+// with this library; see the file COPYING.  If not, write to the =
Free
> -+// Software Foundation, 59 Temple Place - Suite 330, Boston, MA =
02111-1307,
> -+// USA.
> -+
> -+// As a special exception, you may use this file as part of a free =
software
> -+// library without restriction.  Specifically, if other files =
instantiate
> -+// templates or use macros or inline functions from this file, or =
you compile
> -+// this file and link it with other files to produce an executable, =
this
> -+// file does not by itself cause the resulting executable to be =
covered by
> -+// the GNU General Public License.  This exception does not however
> -+// invalidate any other reasons why the executable file might be =
covered by
> -+// the GNU General Public License.
> -+
> -+//
> -+// ISO C++ 14882: 22.2.7.1.2  messages virtual functions
> -+//
> -+
> -+// Written by Benjamin Kosnik <bkoz@redhat.com>
> -+
> -+#include <locale>
> -+#include <bits/c++locale_internal.h>
> -+
> -+#ifdef __UCLIBC_MJN3_ONLY__
> -+#warning fix gettext stuff
> -+#endif
> -+#ifdef __UCLIBC_HAS_GETTEXT_AWARENESS__
> -+extern "C" char *__dcgettext(const char *domainname,
> -+			     const char *msgid, int category);
> -+#undef gettext
> -+#define gettext(msgid) __dcgettext(NULL, msgid, LC_MESSAGES)
> -+#else
> -+#undef gettext
> -+#define gettext(msgid) (msgid)
> -+#endif
> -+
> -+namespace std
> -+{
> -+  // Specializations.
> -+  template<>
> -+    string
> -+    messages<char>::do_get(catalog, int, int, const string& =
__dfault) const
> -+    {
> -+#ifdef __UCLIBC_HAS_XLOCALE__
> -+      __c_locale __old =3D __uselocale(_M_c_locale_messages);
> -+      const char* __msg =3D const_cast<const =
char*>(gettext(__dfault.c_str()));
> -+      __uselocale(__old);
> -+      return string(__msg);
> -+#elif defined __UCLIBC_HAS_LOCALE__
> -+      char* __old =3D strdup(setlocale(LC_ALL, NULL));
> -+      setlocale(LC_ALL, _M_name_messages);
> -+      const char* __msg =3D gettext(__dfault.c_str());
> -+      setlocale(LC_ALL, __old);
> -+      free(__old);
> -+      return string(__msg);
> -+#else
> -+      const char* __msg =3D gettext(__dfault.c_str());
> -+      return string(__msg);
> -+#endif
> -+    }
> -+
> -+#ifdef _GLIBCXX_USE_WCHAR_T
> -+  template<>
> -+    wstring
> -+    messages<wchar_t>::do_get(catalog, int, int, const wstring& =
__dfault) const
> -+    {
> -+# ifdef __UCLIBC_HAS_XLOCALE__
> -+      __c_locale __old =3D __uselocale(_M_c_locale_messages);
> -+      char* __msg =3D gettext(_M_convert_to_char(__dfault));
> -+      __uselocale(__old);
> -+      return _M_convert_from_char(__msg);
> -+# elif defined __UCLIBC_HAS_LOCALE__
> -+      char* __old =3D strdup(setlocale(LC_ALL, NULL));
> -+      setlocale(LC_ALL, _M_name_messages);
> -+      char* __msg =3D gettext(_M_convert_to_char(__dfault));
> -+      setlocale(LC_ALL, __old);
> -+      free(__old);
> -+      return _M_convert_from_char(__msg);
> -+# else
> -+      char* __msg =3D gettext(_M_convert_to_char(__dfault));
> -+      return _M_convert_from_char(__msg);
> -+# endif
> -+    }
> -+#endif
> -+}
> -Index: =
gcc-4_7-branch/libstdc++-v3/config/locale/uclibc/messages_members.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- /dev/null	1970-01-01 00:00:00.000000000 +0000
> -+++ =
gcc-4_7-branch/libstdc++-v3/config/locale/uclibc/messages_members.h	=
2012-04-10 10:30:37.331368420 -0700
> -@@ -0,0 +1,118 @@
> -+// std::messages implementation details, GNU version -*- C++ -*-
> -+
> -+// Copyright (C) 2001, 2002, 2003, 2004 Free Software Foundation, =
Inc.
> -+//
> -+// This file is part of the GNU ISO C++ Library.  This library is =
free
> -+// software; you can redistribute it and/or modify it under the
> -+// terms of the GNU General Public License as published by the
> -+// Free Software Foundation; either version 2, or (at your option)
> -+// any later version.
> -+
> -+// This library is distributed in the hope that it will be useful,
> -+// but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -+// GNU General Public License for more details.
> -+
> -+// You should have received a copy of the GNU General Public License =
along
> -+// with this library; see the file COPYING.  If not, write to the =
Free
> -+// Software Foundation, 59 Temple Place - Suite 330, Boston, MA =
02111-1307,
> -+// USA.
> -+
> -+// As a special exception, you may use this file as part of a free =
software
> -+// library without restriction.  Specifically, if other files =
instantiate
> -+// templates or use macros or inline functions from this file, or =
you compile
> -+// this file and link it with other files to produce an executable, =
this
> -+// file does not by itself cause the resulting executable to be =
covered by
> -+// the GNU General Public License.  This exception does not however
> -+// invalidate any other reasons why the executable file might be =
covered by
> -+// the GNU General Public License.
> -+
> -+//
> -+// ISO C++ 14882: 22.2.7.1.2  messages functions
> -+//
> -+
> -+// Written by Benjamin Kosnik <bkoz@redhat.com>
> -+
> -+#ifdef __UCLIBC_MJN3_ONLY__
> -+#warning fix prototypes for *textdomain funcs
> -+#endif
> -+#ifdef __UCLIBC_HAS_GETTEXT_AWARENESS__
> -+extern "C" char *__textdomain(const char *domainname);
> -+extern "C" char *__bindtextdomain(const char *domainname,
> -+				  const char *dirname);
> -+#else
> -+#undef __textdomain
> -+#undef __bindtextdomain
> -+#define __textdomain(D)           ((void)0)
> -+#define __bindtextdomain(D,P)     ((void)0)
> -+#endif
> -+
> -+  // Non-virtual member functions.
> -+  template<typename _CharT>
> -+     messages<_CharT>::messages(size_t __refs)
> -+     : facet(__refs), _M_c_locale_messages(_S_get_c_locale()),
> -+     _M_name_messages(_S_get_c_name())
> -+     { }
> -+
> -+  template<typename _CharT>
> -+     messages<_CharT>::messages(__c_locale __cloc, const char* __s,
> -+				size_t __refs)
> -+     : facet(__refs), =
_M_c_locale_messages(_S_clone_c_locale(__cloc)),
> -+     _M_name_messages(__s)
> -+     {
> -+       char* __tmp =3D new char[std::strlen(__s) + 1];
> -+       std::strcpy(__tmp, __s);
> -+       _M_name_messages =3D __tmp;
> -+     }
> -+
> -+  template<typename _CharT>
> -+    typename messages<_CharT>::catalog
> -+    messages<_CharT>::open(const basic_string<char>& __s, const =
locale& __loc,
> -+			   const char* __dir) const
> -+    {
> -+      __bindtextdomain(__s.c_str(), __dir);
> -+      return this->do_open(__s, __loc);
> -+    }
> -+
> -+  // Virtual member functions.
> -+  template<typename _CharT>
> -+    messages<_CharT>::~messages()
> -+    {
> -+      if (_M_name_messages !=3D _S_get_c_name())
> -+	delete [] _M_name_messages;
> -+      _S_destroy_c_locale(_M_c_locale_messages);
> -+    }
> -+
> -+  template<typename _CharT>
> -+    typename messages<_CharT>::catalog
> -+    messages<_CharT>::do_open(const basic_string<char>& __s,
> -+			      const locale&) const
> -+    {
> -+      // No error checking is done, assume the catalog exists and =
can
> -+      // be used.
> -+      __textdomain(__s.c_str());
> -+      return 0;
> -+    }
> -+
> -+  template<typename _CharT>
> -+    void
> -+    messages<_CharT>::do_close(catalog) const
> -+    { }
> -+
> -+   // messages_byname
> -+   template<typename _CharT>
> -+     messages_byname<_CharT>::messages_byname(const char* __s, =
size_t __refs)
> -+     : messages<_CharT>(__refs)
> -+     {
> -+       if (this->_M_name_messages !=3D =
locale::facet::_S_get_c_name())
> -+	 delete [] this->_M_name_messages;
> -+       char* __tmp =3D new char[std::strlen(__s) + 1];
> -+       std::strcpy(__tmp, __s);
> -+       this->_M_name_messages =3D __tmp;
> -+
> -+       if (std::strcmp(__s, "C") !=3D 0 && std::strcmp(__s, "POSIX") =
!=3D 0)
> -+	 {
> -+	   this->_S_destroy_c_locale(this->_M_c_locale_messages);
> -+	   this->_S_create_c_locale(this->_M_c_locale_messages, __s);
> -+	 }
> -+     }
> -Index: =
gcc-4_7-branch/libstdc++-v3/config/locale/uclibc/monetary_members.cc
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- /dev/null	1970-01-01 00:00:00.000000000 +0000
> -+++ =
gcc-4_7-branch/libstdc++-v3/config/locale/uclibc/monetary_members.cc	=
2012-04-10 10:30:37.331368420 -0700
> -@@ -0,0 +1,692 @@
> -+// std::moneypunct implementation details, GNU version -*- C++ -*-
> -+
> -+// Copyright (C) 2001, 2002, 2003, 2004 Free Software Foundation, =
Inc.
> -+//
> -+// This file is part of the GNU ISO C++ Library.  This library is =
free
> -+// software; you can redistribute it and/or modify it under the
> -+// terms of the GNU General Public License as published by the
> -+// Free Software Foundation; either version 2, or (at your option)
> -+// any later version.
> -+
> -+// This library is distributed in the hope that it will be useful,
> -+// but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -+// GNU General Public License for more details.
> -+
> -+// You should have received a copy of the GNU General Public License =
along
> -+// with this library; see the file COPYING.  If not, write to the =
Free
> -+// Software Foundation, 59 Temple Place - Suite 330, Boston, MA =
02111-1307,
> -+// USA.
> -+
> -+// As a special exception, you may use this file as part of a free =
software
> -+// library without restriction.  Specifically, if other files =
instantiate
> -+// templates or use macros or inline functions from this file, or =
you compile
> -+// this file and link it with other files to produce an executable, =
this
> -+// file does not by itself cause the resulting executable to be =
covered by
> -+// the GNU General Public License.  This exception does not however
> -+// invalidate any other reasons why the executable file might be =
covered by
> -+// the GNU General Public License.
> -+
> -+//
> -+// ISO C++ 14882: 22.2.6.3.2  moneypunct virtual functions
> -+//
> -+
> -+// Written by Benjamin Kosnik <bkoz@redhat.com>
> -+
> -+#define _LIBC
> -+#include <locale>
> -+#undef _LIBC
> -+#include <bits/c++locale_internal.h>
> -+
> -+#ifdef __UCLIBC_MJN3_ONLY__
> -+#warning optimize this for uclibc
> -+#warning tailor for stub locale support
> -+#endif
> -+
> -+#ifndef __UCLIBC_HAS_XLOCALE__
> -+#define __nl_langinfo_l(N, L)         nl_langinfo((N))
> -+#endif
> -+
> -+namespace std
> -+{
> -+  // Construct and return valid pattern consisting of some =
combination of:
> -+  // space none symbol sign value
> -+  money_base::pattern
> -+  money_base::_S_construct_pattern(char __precedes, char __space, =
char __posn)
> -+  {
> -+    pattern __ret;
> -+
> -+    // This insanely complicated routine attempts to construct a =
valid
> -+    // pattern for use with monyepunct. A couple of invariants:
> -+
> -+    // if (__precedes) symbol -> value
> -+    // else value -> symbol
> -+
> -+    // if (__space) space
> -+    // else none
> -+
> -+    // none =3D=3D never first
> -+    // space never first or last
> -+
> -+    // Any elegant implementations of this are welcome.
> -+    switch (__posn)
> -+      {
> -+      case 0:
> -+      case 1:
> -+	// 1 The sign precedes the value and symbol.
> -+	__ret.field[0] =3D sign;
> -+	if (__space)
> -+	  {
> -+	    // Pattern starts with sign.
> -+	    if (__precedes)
> -+	      {
> -+		__ret.field[1] =3D symbol;
> -+		__ret.field[3] =3D value;
> -+	      }
> -+	    else
> -+	      {
> -+		__ret.field[1] =3D value;
> -+		__ret.field[3] =3D symbol;
> -+	      }
> -+	    __ret.field[2] =3D space;
> -+	  }
> -+	else
> -+	  {
> -+	    // Pattern starts with sign and ends with none.
> -+	    if (__precedes)
> -+	      {
> -+		__ret.field[1] =3D symbol;
> -+		__ret.field[2] =3D value;
> -+	      }
> -+	    else
> -+	      {
> -+		__ret.field[1] =3D value;
> -+		__ret.field[2] =3D symbol;
> -+	      }
> -+	    __ret.field[3] =3D none;
> -+	  }
> -+	break;
> -+      case 2:
> -+	// 2 The sign follows the value and symbol.
> -+	if (__space)
> -+	  {
> -+	    // Pattern either ends with sign.
> -+	    if (__precedes)
> -+	      {
> -+		__ret.field[0] =3D symbol;
> -+		__ret.field[2] =3D value;
> -+	      }
> -+	    else
> -+	      {
> -+		__ret.field[0] =3D value;
> -+		__ret.field[2] =3D symbol;
> -+	      }
> -+	    __ret.field[1] =3D space;
> -+	    __ret.field[3] =3D sign;
> -+	  }
> -+	else
> -+	  {
> -+	    // Pattern ends with sign then none.
> -+	    if (__precedes)
> -+	      {
> -+		__ret.field[0] =3D symbol;
> -+		__ret.field[1] =3D value;
> -+	      }
> -+	    else
> -+	      {
> -+		__ret.field[0] =3D value;
> -+		__ret.field[1] =3D symbol;
> -+	      }
> -+	    __ret.field[2] =3D sign;
> -+	    __ret.field[3] =3D none;
> -+	  }
> -+	break;
> -+      case 3:
> -+	// 3 The sign immediately precedes the symbol.
> -+	if (__precedes)
> -+	  {
> -+	    __ret.field[0] =3D sign;
> -+	    __ret.field[1] =3D symbol;
> -+	    if (__space)
> -+	      {
> -+		__ret.field[2] =3D space;
> -+		__ret.field[3] =3D value;
> -+	      }
> -+	    else
> -+	      {
> -+		__ret.field[2] =3D value;
> -+		__ret.field[3] =3D none;
> -+	      }
> -+	  }
> -+	else
> -+	  {
> -+	    __ret.field[0] =3D value;
> -+	    if (__space)
> -+	      {
> -+		__ret.field[1] =3D space;
> -+		__ret.field[2] =3D sign;
> -+		__ret.field[3] =3D symbol;
> -+	      }
> -+	    else
> -+	      {
> -+		__ret.field[1] =3D sign;
> -+		__ret.field[2] =3D symbol;
> -+		__ret.field[3] =3D none;
> -+	      }
> -+	  }
> -+	break;
> -+      case 4:
> -+	// 4 The sign immediately follows the symbol.
> -+	if (__precedes)
> -+	  {
> -+	    __ret.field[0] =3D symbol;
> -+	    __ret.field[1] =3D sign;
> -+	    if (__space)
> -+	      {
> -+		__ret.field[2] =3D space;
> -+		__ret.field[3] =3D value;
> -+	      }
> -+	    else
> -+	      {
> -+		__ret.field[2] =3D value;
> -+		__ret.field[3] =3D none;
> -+	      }
> -+	  }
> -+	else
> -+	  {
> -+	    __ret.field[0] =3D value;
> -+	    if (__space)
> -+	      {
> -+		__ret.field[1] =3D space;
> -+		__ret.field[2] =3D symbol;
> -+		__ret.field[3] =3D sign;
> -+	      }
> -+	    else
> -+	      {
> -+		__ret.field[1] =3D symbol;
> -+		__ret.field[2] =3D sign;
> -+		__ret.field[3] =3D none;
> -+	      }
> -+	  }
> -+	break;
> -+      default:
> -+	;
> -+      }
> -+    return __ret;
> -+  }
> -+
> -+  template<>
> -+    void
> -+    moneypunct<char, true>::_M_initialize_moneypunct(__c_locale =
__cloc,
> -+						     const char*)
> -+    {
> -+      if (!_M_data)
> -+	_M_data =3D new __moneypunct_cache<char, true>;
> -+
> -+      if (!__cloc)
> -+	{
> -+	  // "C" locale
> -+	  _M_data->_M_decimal_point =3D '.';
> -+	  _M_data->_M_thousands_sep =3D ',';
> -+	  _M_data->_M_grouping =3D "";
> -+	  _M_data->_M_grouping_size =3D 0;
> -+	  _M_data->_M_curr_symbol =3D "";
> -+	  _M_data->_M_curr_symbol_size =3D 0;
> -+	  _M_data->_M_positive_sign =3D "";
> -+	  _M_data->_M_positive_sign_size =3D 0;
> -+	  _M_data->_M_negative_sign =3D "";
> -+	  _M_data->_M_negative_sign_size =3D 0;
> -+	  _M_data->_M_frac_digits =3D 0;
> -+	  _M_data->_M_pos_format =3D money_base::_S_default_pattern;
> -+	  _M_data->_M_neg_format =3D money_base::_S_default_pattern;
> -+
> -+	  for (size_t __i =3D 0; __i < money_base::_S_end; ++__i)
> -+	    _M_data->_M_atoms[__i] =3D money_base::_S_atoms[__i];
> -+	}
> -+      else
> -+	{
> -+	  // Named locale.
> -+	  _M_data->_M_decimal_point =3D =
*(__nl_langinfo_l(__MON_DECIMAL_POINT,
> -+							__cloc));
> -+	  _M_data->_M_thousands_sep =3D =
*(__nl_langinfo_l(__MON_THOUSANDS_SEP,
> -+							__cloc));
> -+	  _M_data->_M_grouping =3D __nl_langinfo_l(__MON_GROUPING, =
__cloc);
> -+	  _M_data->_M_grouping_size =3D strlen(_M_data->_M_grouping);
> -+	  _M_data->_M_positive_sign =3D __nl_langinfo_l(__POSITIVE_SIGN, =
__cloc);
> -+	  _M_data->_M_positive_sign_size =3D =
strlen(_M_data->_M_positive_sign);
> -+
> -+	  char __nposn =3D *(__nl_langinfo_l(__INT_N_SIGN_POSN, =
__cloc));
> -+	  if (!__nposn)
> -+	    _M_data->_M_negative_sign =3D "()";
> -+	  else
> -+	    _M_data->_M_negative_sign =3D =
__nl_langinfo_l(__NEGATIVE_SIGN,
> -+							__cloc);
> -+	  _M_data->_M_negative_sign_size =3D =
strlen(_M_data->_M_negative_sign);
> -+
> -+	  // _Intl =3D=3D true
> -+	  _M_data->_M_curr_symbol =3D __nl_langinfo_l(__INT_CURR_SYMBOL, =
__cloc);
> -+	  _M_data->_M_curr_symbol_size =3D =
strlen(_M_data->_M_curr_symbol);
> -+	  _M_data->_M_frac_digits =3D =
*(__nl_langinfo_l(__INT_FRAC_DIGITS,
> -+						      __cloc));
> -+	  char __pprecedes =3D *(__nl_langinfo_l(__INT_P_CS_PRECEDES, =
__cloc));
> -+	  char __pspace =3D *(__nl_langinfo_l(__INT_P_SEP_BY_SPACE, =
__cloc));
> -+	  char __pposn =3D *(__nl_langinfo_l(__INT_P_SIGN_POSN, =
__cloc));
> -+	  _M_data->_M_pos_format =3D _S_construct_pattern(__pprecedes, =
__pspace,
> -+							__pposn);
> -+	  char __nprecedes =3D *(__nl_langinfo_l(__INT_N_CS_PRECEDES, =
__cloc));
> -+	  char __nspace =3D *(__nl_langinfo_l(__INT_N_SEP_BY_SPACE, =
__cloc));
> -+	  _M_data->_M_neg_format =3D _S_construct_pattern(__nprecedes, =
__nspace,
> -+							__nposn);
> -+	}
> -+    }
> -+
> -+  template<>
> -+    void
> -+    moneypunct<char, false>::_M_initialize_moneypunct(__c_locale =
__cloc,
> -+						      const char*)
> -+    {
> -+      if (!_M_data)
> -+	_M_data =3D new __moneypunct_cache<char, false>;
> -+
> -+      if (!__cloc)
> -+	{
> -+	  // "C" locale
> -+	  _M_data->_M_decimal_point =3D '.';
> -+	  _M_data->_M_thousands_sep =3D ',';
> -+	  _M_data->_M_grouping =3D "";
> -+	  _M_data->_M_grouping_size =3D 0;
> -+	  _M_data->_M_curr_symbol =3D "";
> -+	  _M_data->_M_curr_symbol_size =3D 0;
> -+	  _M_data->_M_positive_sign =3D "";
> -+	  _M_data->_M_positive_sign_size =3D 0;
> -+	  _M_data->_M_negative_sign =3D "";
> -+	  _M_data->_M_negative_sign_size =3D 0;
> -+	  _M_data->_M_frac_digits =3D 0;
> -+	  _M_data->_M_pos_format =3D money_base::_S_default_pattern;
> -+	  _M_data->_M_neg_format =3D money_base::_S_default_pattern;
> -+
> -+	  for (size_t __i =3D 0; __i < money_base::_S_end; ++__i)
> -+	    _M_data->_M_atoms[__i] =3D money_base::_S_atoms[__i];
> -+	}
> -+      else
> -+	{
> -+	  // Named locale.
> -+	  _M_data->_M_decimal_point =3D =
*(__nl_langinfo_l(__MON_DECIMAL_POINT,
> -+							__cloc));
> -+	  _M_data->_M_thousands_sep =3D =
*(__nl_langinfo_l(__MON_THOUSANDS_SEP,
> -+							__cloc));
> -+	  _M_data->_M_grouping =3D __nl_langinfo_l(__MON_GROUPING, =
__cloc);
> -+	  _M_data->_M_grouping_size =3D strlen(_M_data->_M_grouping);
> -+	  _M_data->_M_positive_sign =3D __nl_langinfo_l(__POSITIVE_SIGN, =
__cloc);
> -+	  _M_data->_M_positive_sign_size =3D =
strlen(_M_data->_M_positive_sign);
> -+
> -+	  char __nposn =3D *(__nl_langinfo_l(__N_SIGN_POSN, __cloc));
> -+	  if (!__nposn)
> -+	    _M_data->_M_negative_sign =3D "()";
> -+	  else
> -+	    _M_data->_M_negative_sign =3D =
__nl_langinfo_l(__NEGATIVE_SIGN,
> -+							__cloc);
> -+	  _M_data->_M_negative_sign_size =3D =
strlen(_M_data->_M_negative_sign);
> -+
> -+	  // _Intl =3D=3D false
> -+	  _M_data->_M_curr_symbol =3D __nl_langinfo_l(__CURRENCY_SYMBOL, =
__cloc);
> -+	  _M_data->_M_curr_symbol_size =3D =
strlen(_M_data->_M_curr_symbol);
> -+	  _M_data->_M_frac_digits =3D *(__nl_langinfo_l(__FRAC_DIGITS, =
__cloc));
> -+	  char __pprecedes =3D *(__nl_langinfo_l(__P_CS_PRECEDES, =
__cloc));
> -+	  char __pspace =3D *(__nl_langinfo_l(__P_SEP_BY_SPACE, =
__cloc));
> -+	  char __pposn =3D *(__nl_langinfo_l(__P_SIGN_POSN, __cloc));
> -+	  _M_data->_M_pos_format =3D _S_construct_pattern(__pprecedes, =
__pspace,
> -+							__pposn);
> -+	  char __nprecedes =3D *(__nl_langinfo_l(__N_CS_PRECEDES, =
__cloc));
> -+	  char __nspace =3D *(__nl_langinfo_l(__N_SEP_BY_SPACE, =
__cloc));
> -+	  _M_data->_M_neg_format =3D _S_construct_pattern(__nprecedes, =
__nspace,
> -+							__nposn);
> -+	}
> -+    }
> -+
> -+  template<>
> -+    moneypunct<char, true>::~moneypunct()
> -+    { delete _M_data; }
> -+
> -+  template<>
> -+    moneypunct<char, false>::~moneypunct()
> -+    { delete _M_data; }
> -+
> -+#ifdef _GLIBCXX_USE_WCHAR_T
> -+  template<>
> -+    void
> -+    moneypunct<wchar_t, true>::_M_initialize_moneypunct(__c_locale =
__cloc,
> -+#ifdef __UCLIBC_HAS_XLOCALE__
> -+							const char*)
> -+#else
> -+							const char* =
__name)
> -+#endif
> -+    {
> -+      if (!_M_data)
> -+	_M_data =3D new __moneypunct_cache<wchar_t, true>;
> -+
> -+      if (!__cloc)
> -+	{
> -+	  // "C" locale
> -+	  _M_data->_M_decimal_point =3D L'.';
> -+	  _M_data->_M_thousands_sep =3D L',';
> -+	  _M_data->_M_grouping =3D "";
> -+	  _M_data->_M_grouping_size =3D 0;
> -+	  _M_data->_M_curr_symbol =3D L"";
> -+	  _M_data->_M_curr_symbol_size =3D 0;
> -+	  _M_data->_M_positive_sign =3D L"";
> -+	  _M_data->_M_positive_sign_size =3D 0;
> -+	  _M_data->_M_negative_sign =3D L"";
> -+	  _M_data->_M_negative_sign_size =3D 0;
> -+	  _M_data->_M_frac_digits =3D 0;
> -+	  _M_data->_M_pos_format =3D money_base::_S_default_pattern;
> -+	  _M_data->_M_neg_format =3D money_base::_S_default_pattern;
> -+
> -+	  // Use ctype::widen code without the facet...
> -+	  for (size_t __i =3D 0; __i < money_base::_S_end; ++__i)
> -+	    _M_data->_M_atoms[__i] =3D
> -+	      static_cast<wchar_t>(money_base::_S_atoms[__i]);
> -+	}
> -+      else
> -+	{
> -+	  // Named locale.
> -+#ifdef __UCLIBC_HAS_XLOCALE__
> -+	  __c_locale __old =3D __uselocale(__cloc);
> -+#else
> -+	  // Switch to named locale so that mbsrtowcs will work.
> -+	  char* __old =3D strdup(setlocale(LC_ALL, NULL));
> -+	  setlocale(LC_ALL, __name);
> -+#endif
> -+
> -+#ifdef __UCLIBC_MJN3_ONLY__
> -+#warning fix this... should be monetary
> -+#endif
> -+#ifdef __UCLIBC__
> -+# ifdef __UCLIBC_HAS_XLOCALE__
> -+	  _M_data->_M_decimal_point =3D __cloc->decimal_point_wc;
> -+	  _M_data->_M_thousands_sep =3D __cloc->thousands_sep_wc;
> -+# else
> -+	  _M_data->_M_decimal_point =3D =
__global_locale->decimal_point_wc;
> -+	  _M_data->_M_thousands_sep =3D =
__global_locale->thousands_sep_wc;
> -+# endif
> -+#else
> -+	  union { char *__s; wchar_t __w; } __u;
> -+	  __u.__s =3D __nl_langinfo_l(_NL_MONETARY_DECIMAL_POINT_WC, =
__cloc);
> -+	  _M_data->_M_decimal_point =3D __u.__w;
> -+
> -+	  __u.__s =3D __nl_langinfo_l(_NL_MONETARY_THOUSANDS_SEP_WC, =
__cloc);
> -+	  _M_data->_M_thousands_sep =3D __u.__w;
> -+#endif
> -+	  _M_data->_M_grouping =3D __nl_langinfo_l(__MON_GROUPING, =
__cloc);
> -+	  _M_data->_M_grouping_size =3D strlen(_M_data->_M_grouping);
> -+
> -+	  const char* __cpossign =3D __nl_langinfo_l(__POSITIVE_SIGN, =
__cloc);
> -+	  const char* __cnegsign =3D __nl_langinfo_l(__NEGATIVE_SIGN, =
__cloc);
> -+	  const char* __ccurr =3D __nl_langinfo_l(__INT_CURR_SYMBOL, =
__cloc);
> -+
> -+	  wchar_t* __wcs_ps =3D 0;
> -+	  wchar_t* __wcs_ns =3D 0;
> -+	  const char __nposn =3D *(__nl_langinfo_l(__INT_N_SIGN_POSN, =
__cloc));
> -+	  try
> -+	    {
> -+	      mbstate_t __state;
> -+	      size_t __len =3D strlen(__cpossign);
> -+	      if (__len)
> -+		{
> -+		  ++__len;
> -+		  memset(&__state, 0, sizeof(mbstate_t));
> -+		  __wcs_ps =3D new wchar_t[__len];
> -+		  mbsrtowcs(__wcs_ps, &__cpossign, __len, &__state);
> -+		  _M_data->_M_positive_sign =3D __wcs_ps;
> -+		}
> -+	      else
> -+		_M_data->_M_positive_sign =3D L"";
> -+	      _M_data->_M_positive_sign_size =3D =
wcslen(_M_data->_M_positive_sign);
> -+
> -+	      __len =3D strlen(__cnegsign);
> -+	      if (!__nposn)
> -+		_M_data->_M_negative_sign =3D L"()";
> -+	      else if (__len)
> -+		{
> -+		  ++__len;
> -+		  memset(&__state, 0, sizeof(mbstate_t));
> -+		  __wcs_ns =3D new wchar_t[__len];
> -+		  mbsrtowcs(__wcs_ns, &__cnegsign, __len, &__state);
> -+		  _M_data->_M_negative_sign =3D __wcs_ns;
> -+		}
> -+	      else
> -+		_M_data->_M_negative_sign =3D L"";
> -+	      _M_data->_M_negative_sign_size =3D =
wcslen(_M_data->_M_negative_sign);
> -+
> -+	      // _Intl =3D=3D true.
> -+	      __len =3D strlen(__ccurr);
> -+	      if (__len)
> -+		{
> -+		  ++__len;
> -+		  memset(&__state, 0, sizeof(mbstate_t));
> -+		  wchar_t* __wcs =3D new wchar_t[__len];
> -+		  mbsrtowcs(__wcs, &__ccurr, __len, &__state);
> -+		  _M_data->_M_curr_symbol =3D __wcs;
> -+		}
> -+	      else
> -+		_M_data->_M_curr_symbol =3D L"";
> -+	      _M_data->_M_curr_symbol_size =3D =
wcslen(_M_data->_M_curr_symbol);
> -+	    }
> -+	  catch (...)
> -+	    {
> -+	      delete _M_data;
> -+	      _M_data =3D 0;
> -+	      delete __wcs_ps;
> -+	      delete __wcs_ns;
> -+#ifdef __UCLIBC_HAS_XLOCALE__
> -+	      __uselocale(__old);
> -+#else
> -+	      setlocale(LC_ALL, __old);
> -+	      free(__old);
> -+#endif
> -+	      __throw_exception_again;
> -+	    }
> -+
> -+	  _M_data->_M_frac_digits =3D =
*(__nl_langinfo_l(__INT_FRAC_DIGITS,
> -+						      __cloc));
> -+	  char __pprecedes =3D *(__nl_langinfo_l(__INT_P_CS_PRECEDES, =
__cloc));
> -+	  char __pspace =3D *(__nl_langinfo_l(__INT_P_SEP_BY_SPACE, =
__cloc));
> -+	  char __pposn =3D *(__nl_langinfo_l(__INT_P_SIGN_POSN, =
__cloc));
> -+	  _M_data->_M_pos_format =3D _S_construct_pattern(__pprecedes, =
__pspace,
> -+							__pposn);
> -+	  char __nprecedes =3D *(__nl_langinfo_l(__INT_N_CS_PRECEDES, =
__cloc));
> -+	  char __nspace =3D *(__nl_langinfo_l(__INT_N_SEP_BY_SPACE, =
__cloc));
> -+	  _M_data->_M_neg_format =3D _S_construct_pattern(__nprecedes, =
__nspace,
> -+							__nposn);
> -+
> -+#ifdef __UCLIBC_HAS_XLOCALE__
> -+	  __uselocale(__old);
> -+#else
> -+	  setlocale(LC_ALL, __old);
> -+	  free(__old);
> -+#endif
> -+	}
> -+    }
> -+
> -+  template<>
> -+  void
> -+  moneypunct<wchar_t, false>::_M_initialize_moneypunct(__c_locale =
__cloc,
> -+#ifdef __UCLIBC_HAS_XLOCALE__
> -+						       const char*)
> -+#else
> -+                                                       const char* =
__name)
> -+#endif
> -+  {
> -+    if (!_M_data)
> -+      _M_data =3D new __moneypunct_cache<wchar_t, false>;
> -+
> -+    if (!__cloc)
> -+	{
> -+	  // "C" locale
> -+	  _M_data->_M_decimal_point =3D L'.';
> -+	  _M_data->_M_thousands_sep =3D L',';
> -+	  _M_data->_M_grouping =3D "";
> -+          _M_data->_M_grouping_size =3D 0;
> -+	  _M_data->_M_curr_symbol =3D L"";
> -+	  _M_data->_M_curr_symbol_size =3D 0;
> -+	  _M_data->_M_positive_sign =3D L"";
> -+	  _M_data->_M_positive_sign_size =3D 0;
> -+	  _M_data->_M_negative_sign =3D L"";
> -+	  _M_data->_M_negative_sign_size =3D 0;
> -+	  _M_data->_M_frac_digits =3D 0;
> -+	  _M_data->_M_pos_format =3D money_base::_S_default_pattern;
> -+	  _M_data->_M_neg_format =3D money_base::_S_default_pattern;
> -+
> -+	  // Use ctype::widen code without the facet...
> -+	  for (size_t __i =3D 0; __i < money_base::_S_end; ++__i)
> -+	    _M_data->_M_atoms[__i] =3D
> -+	      static_cast<wchar_t>(money_base::_S_atoms[__i]);
> -+	}
> -+      else
> -+	{
> -+	  // Named locale.
> -+#ifdef __UCLIBC_HAS_XLOCALE__
> -+	  __c_locale __old =3D __uselocale(__cloc);
> -+#else
> -+	  // Switch to named locale so that mbsrtowcs will work.
> -+	  char* __old =3D strdup(setlocale(LC_ALL, NULL));
> -+	  setlocale(LC_ALL, __name);
> -+#endif
> -+
> -+#ifdef __UCLIBC_MJN3_ONLY__
> -+#warning fix this... should be monetary
> -+#endif
> -+#ifdef __UCLIBC__
> -+# ifdef __UCLIBC_HAS_XLOCALE__
> -+	  _M_data->_M_decimal_point =3D __cloc->decimal_point_wc;
> -+	  _M_data->_M_thousands_sep =3D __cloc->thousands_sep_wc;
> -+# else
> -+	  _M_data->_M_decimal_point =3D =
__global_locale->decimal_point_wc;
> -+	  _M_data->_M_thousands_sep =3D =
__global_locale->thousands_sep_wc;
> -+# endif
> -+#else
> -+          union { char *__s; wchar_t __w; } __u;
> -+	  __u.__s =3D __nl_langinfo_l(_NL_MONETARY_DECIMAL_POINT_WC, =
__cloc);
> -+	  _M_data->_M_decimal_point =3D __u.__w;
> -+
> -+	  __u.__s =3D __nl_langinfo_l(_NL_MONETARY_THOUSANDS_SEP_WC, =
__cloc);
> -+	  _M_data->_M_thousands_sep =3D __u.__w;
> -+#endif
> -+	  _M_data->_M_grouping =3D __nl_langinfo_l(__MON_GROUPING, =
__cloc);
> -+          _M_data->_M_grouping_size =3D =
strlen(_M_data->_M_grouping);
> -+
> -+	  const char* __cpossign =3D __nl_langinfo_l(__POSITIVE_SIGN, =
__cloc);
> -+	  const char* __cnegsign =3D __nl_langinfo_l(__NEGATIVE_SIGN, =
__cloc);
> -+	  const char* __ccurr =3D __nl_langinfo_l(__CURRENCY_SYMBOL, =
__cloc);
> -+
> -+	  wchar_t* __wcs_ps =3D 0;
> -+	  wchar_t* __wcs_ns =3D 0;
> -+	  const char __nposn =3D *(__nl_langinfo_l(__N_SIGN_POSN, =
__cloc));
> -+	  try
> -+            {
> -+              mbstate_t __state;
> -+              size_t __len;
> -+              __len =3D strlen(__cpossign);
> -+              if (__len)
> -+                {
> -+		  ++__len;
> -+		  memset(&__state, 0, sizeof(mbstate_t));
> -+		  __wcs_ps =3D new wchar_t[__len];
> -+		  mbsrtowcs(__wcs_ps, &__cpossign, __len, &__state);
> -+		  _M_data->_M_positive_sign =3D __wcs_ps;
> -+		}
> -+	      else
> -+		_M_data->_M_positive_sign =3D L"";
> -+              _M_data->_M_positive_sign_size =3D =
wcslen(_M_data->_M_positive_sign);
> -+
> -+	      __len =3D strlen(__cnegsign);
> -+	      if (!__nposn)
> -+		_M_data->_M_negative_sign =3D L"()";
> -+	      else if (__len)
> -+		{
> -+		  ++__len;
> -+		  memset(&__state, 0, sizeof(mbstate_t));
> -+		  __wcs_ns =3D new wchar_t[__len];
> -+		  mbsrtowcs(__wcs_ns, &__cnegsign, __len, &__state);
> -+		  _M_data->_M_negative_sign =3D __wcs_ns;
> -+		}
> -+	      else
> -+		_M_data->_M_negative_sign =3D L"";
> -+              _M_data->_M_negative_sign_size =3D =
wcslen(_M_data->_M_negative_sign);
> -+
> -+	      // _Intl =3D=3D true.
> -+	      __len =3D strlen(__ccurr);
> -+	      if (__len)
> -+		{
> -+		  ++__len;
> -+		  memset(&__state, 0, sizeof(mbstate_t));
> -+		  wchar_t* __wcs =3D new wchar_t[__len];
> -+		  mbsrtowcs(__wcs, &__ccurr, __len, &__state);
> -+		  _M_data->_M_curr_symbol =3D __wcs;
> -+		}
> -+	      else
> -+		_M_data->_M_curr_symbol =3D L"";
> -+              _M_data->_M_curr_symbol_size =3D =
wcslen(_M_data->_M_curr_symbol);
> -+	    }
> -+          catch (...)
> -+	    {
> -+	      delete _M_data;
> -+              _M_data =3D 0;
> -+	      delete __wcs_ps;
> -+	      delete __wcs_ns;
> -+#ifdef __UCLIBC_HAS_XLOCALE__
> -+	      __uselocale(__old);
> -+#else
> -+	      setlocale(LC_ALL, __old);
> -+	      free(__old);
> -+#endif
> -+              __throw_exception_again;
> -+	    }
> -+
> -+	  _M_data->_M_frac_digits =3D *(__nl_langinfo_l(__FRAC_DIGITS, =
__cloc));
> -+	  char __pprecedes =3D *(__nl_langinfo_l(__P_CS_PRECEDES, =
__cloc));
> -+	  char __pspace =3D *(__nl_langinfo_l(__P_SEP_BY_SPACE, =
__cloc));
> -+	  char __pposn =3D *(__nl_langinfo_l(__P_SIGN_POSN, __cloc));
> -+	  _M_data->_M_pos_format =3D _S_construct_pattern(__pprecedes, =
__pspace,
> -+	                                                __pposn);
> -+	  char __nprecedes =3D *(__nl_langinfo_l(__N_CS_PRECEDES, =
__cloc));
> -+	  char __nspace =3D *(__nl_langinfo_l(__N_SEP_BY_SPACE, =
__cloc));
> -+	  _M_data->_M_neg_format =3D _S_construct_pattern(__nprecedes, =
__nspace,
> -+	                                                __nposn);
> -+
> -+#ifdef __UCLIBC_HAS_XLOCALE__
> -+	  __uselocale(__old);
> -+#else
> -+	  setlocale(LC_ALL, __old);
> -+	  free(__old);
> -+#endif
> -+	}
> -+    }
> -+
> -+  template<>
> -+    moneypunct<wchar_t, true>::~moneypunct()
> -+    {
> -+      if (_M_data->_M_positive_sign_size)
> -+	delete [] _M_data->_M_positive_sign;
> -+      if (_M_data->_M_negative_sign_size
> -+          && wcscmp(_M_data->_M_negative_sign, L"()") !=3D 0)
> -+	delete [] _M_data->_M_negative_sign;
> -+      if (_M_data->_M_curr_symbol_size)
> -+	delete [] _M_data->_M_curr_symbol;
> -+      delete _M_data;
> -+    }
> -+
> -+  template<>
> -+    moneypunct<wchar_t, false>::~moneypunct()
> -+    {
> -+      if (_M_data->_M_positive_sign_size)
> -+	delete [] _M_data->_M_positive_sign;
> -+      if (_M_data->_M_negative_sign_size
> -+          && wcscmp(_M_data->_M_negative_sign, L"()") !=3D 0)
> -+	delete [] _M_data->_M_negative_sign;
> -+      if (_M_data->_M_curr_symbol_size)
> -+	delete [] _M_data->_M_curr_symbol;
> -+      delete _M_data;
> -+    }
> -+#endif
> -+}
> -Index: =
gcc-4_7-branch/libstdc++-v3/config/locale/uclibc/numeric_members.cc
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- /dev/null	1970-01-01 00:00:00.000000000 +0000
> -+++ =
gcc-4_7-branch/libstdc++-v3/config/locale/uclibc/numeric_members.cc	=
2012-04-10 10:30:37.331368420 -0700
> -@@ -0,0 +1,160 @@
> -+// std::numpunct implementation details, GNU version -*- C++ -*-
> -+
> -+// Copyright (C) 2001, 2002, 2003, 2004 Free Software Foundation, =
Inc.
> -+//
> -+// This file is part of the GNU ISO C++ Library.  This library is =
free
> -+// software; you can redistribute it and/or modify it under the
> -+// terms of the GNU General Public License as published by the
> -+// Free Software Foundation; either version 2, or (at your option)
> -+// any later version.
> -+
> -+// This library is distributed in the hope that it will be useful,
> -+// but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -+// GNU General Public License for more details.
> -+
> -+// You should have received a copy of the GNU General Public License =
along
> -+// with this library; see the file COPYING.  If not, write to the =
Free
> -+// Software Foundation, 59 Temple Place - Suite 330, Boston, MA =
02111-1307,
> -+// USA.
> -+
> -+// As a special exception, you may use this file as part of a free =
software
> -+// library without restriction.  Specifically, if other files =
instantiate
> -+// templates or use macros or inline functions from this file, or =
you compile
> -+// this file and link it with other files to produce an executable, =
this
> -+// file does not by itself cause the resulting executable to be =
covered by
> -+// the GNU General Public License.  This exception does not however
> -+// invalidate any other reasons why the executable file might be =
covered by
> -+// the GNU General Public License.
> -+
> -+//
> -+// ISO C++ 14882: 22.2.3.1.2  numpunct virtual functions
> -+//
> -+
> -+// Written by Benjamin Kosnik <bkoz@redhat.com>
> -+
> -+#define _LIBC
> -+#include <locale>
> -+#undef _LIBC
> -+#include <bits/c++locale_internal.h>
> -+
> -+#ifdef __UCLIBC_MJN3_ONLY__
> -+#warning tailor for stub locale support
> -+#endif
> -+#ifndef __UCLIBC_HAS_XLOCALE__
> -+#define __nl_langinfo_l(N, L)         nl_langinfo((N))
> -+#endif
> -+
> -+namespace std
> -+{
> -+  template<>
> -+    void
> -+    numpunct<char>::_M_initialize_numpunct(__c_locale __cloc)
> -+    {
> -+      if (!_M_data)
> -+	_M_data =3D new __numpunct_cache<char>;
> -+
> -+      if (!__cloc)
> -+	{
> -+	  // "C" locale
> -+	  _M_data->_M_grouping =3D "";
> -+	  _M_data->_M_grouping_size =3D 0;
> -+	  _M_data->_M_use_grouping =3D false;
> -+
> -+	  _M_data->_M_decimal_point =3D '.';
> -+	  _M_data->_M_thousands_sep =3D ',';
> -+
> -+	  for (size_t __i =3D 0; __i < __num_base::_S_oend; ++__i)
> -+	    _M_data->_M_atoms_out[__i] =3D =
__num_base::_S_atoms_out[__i];
> -+
> -+	  for (size_t __j =3D 0; __j < __num_base::_S_iend; ++__j)
> -+	    _M_data->_M_atoms_in[__j] =3D __num_base::_S_atoms_in[__j];
> -+	}
> -+      else
> -+	{
> -+	  // Named locale.
> -+	  _M_data->_M_decimal_point =3D *(__nl_langinfo_l(DECIMAL_POINT,
> -+							__cloc));
> -+	  _M_data->_M_thousands_sep =3D *(__nl_langinfo_l(THOUSANDS_SEP,
> -+							__cloc));
> -+
> -+	  // Check for NULL, which implies no grouping.
> -+	  if (_M_data->_M_thousands_sep =3D=3D '\0')
> -+	    _M_data->_M_grouping =3D "";
> -+	  else
> -+	    _M_data->_M_grouping =3D __nl_langinfo_l(GROUPING, __cloc);
> -+	  _M_data->_M_grouping_size =3D strlen(_M_data->_M_grouping);
> -+	}
> -+
> -+      // NB: There is no way to extact this info from posix locales.
> -+      // _M_truename =3D __nl_langinfo_l(YESSTR, __cloc);
> -+      _M_data->_M_truename =3D "true";
> -+      _M_data->_M_truename_size =3D 4;
> -+      // _M_falsename =3D __nl_langinfo_l(NOSTR, __cloc);
> -+      _M_data->_M_falsename =3D "false";
> -+      _M_data->_M_falsename_size =3D 5;
> -+    }
> -+
> -+  template<>
> -+    numpunct<char>::~numpunct()
> -+    { delete _M_data; }
> -+
> -+#ifdef _GLIBCXX_USE_WCHAR_T
> -+  template<>
> -+    void
> -+    numpunct<wchar_t>::_M_initialize_numpunct(__c_locale __cloc)
> -+    {
> -+      if (!_M_data)
> -+	_M_data =3D new __numpunct_cache<wchar_t>;
> -+
> -+      if (!__cloc)
> -+	{
> -+	  // "C" locale
> -+	  _M_data->_M_grouping =3D "";
> -+	  _M_data->_M_grouping_size =3D 0;
> -+	  _M_data->_M_use_grouping =3D false;
> -+
> -+	  _M_data->_M_decimal_point =3D L'.';
> -+	  _M_data->_M_thousands_sep =3D L',';
> -+
> -+	  // Use ctype::widen code without the facet...
> -+	  for (size_t __i =3D 0; __i < __num_base::_S_oend; ++__i)
> -+	    _M_data->_M_atoms_out[__i] =3D
> -+	      static_cast<wchar_t>(__num_base::_S_atoms_out[__i]);
> -+
> -+	  for (size_t __j =3D 0; __j < __num_base::_S_iend; ++__j)
> -+	    _M_data->_M_atoms_in[__j] =3D
> -+	      static_cast<wchar_t>(__num_base::_S_atoms_in[__j]);
> -+	}
> -+      else
> -+	{
> -+	  // Named locale.
> -+	  // NB: In the GNU model wchar_t is always 32 bit wide.
> -+	  union { char *__s; wchar_t __w; } __u;
> -+	  __u.__s =3D __nl_langinfo_l(_NL_NUMERIC_DECIMAL_POINT_WC, =
__cloc);
> -+	  _M_data->_M_decimal_point =3D __u.__w;
> -+
> -+	  __u.__s =3D __nl_langinfo_l(_NL_NUMERIC_THOUSANDS_SEP_WC, =
__cloc);
> -+	  _M_data->_M_thousands_sep =3D __u.__w;
> -+
> -+	  if (_M_data->_M_thousands_sep =3D=3D L'\0')
> -+	    _M_data->_M_grouping =3D "";
> -+	  else
> -+	    _M_data->_M_grouping =3D __nl_langinfo_l(GROUPING, __cloc);
> -+	  _M_data->_M_grouping_size =3D strlen(_M_data->_M_grouping);
> -+	}
> -+
> -+      // NB: There is no way to extact this info from posix locales.
> -+      // _M_truename =3D __nl_langinfo_l(YESSTR, __cloc);
> -+      _M_data->_M_truename =3D L"true";
> -+      _M_data->_M_truename_size =3D 4;
> -+      // _M_falsename =3D __nl_langinfo_l(NOSTR, __cloc);
> -+      _M_data->_M_falsename =3D L"false";
> -+      _M_data->_M_falsename_size =3D 5;
> -+    }
> -+
> -+  template<>
> -+    numpunct<wchar_t>::~numpunct()
> -+    { delete _M_data; }
> -+ #endif
> -+}
> -Index: =
gcc-4_7-branch/libstdc++-v3/config/locale/uclibc/time_members.cc
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- /dev/null	1970-01-01 00:00:00.000000000 +0000
> -+++ gcc-4_7-branch/libstdc++-v3/config/locale/uclibc/time_members.cc	=
2012-04-10 10:30:37.331368420 -0700
> -@@ -0,0 +1,406 @@
> -+// std::time_get, std::time_put implementation, GNU version -*- C++ =
-*-
> -+
> -+// Copyright (C) 2001, 2002, 2003, 2004 Free Software Foundation, =
Inc.
> -+//
> -+// This file is part of the GNU ISO C++ Library.  This library is =
free
> -+// software; you can redistribute it and/or modify it under the
> -+// terms of the GNU General Public License as published by the
> -+// Free Software Foundation; either version 2, or (at your option)
> -+// any later version.
> -+
> -+// This library is distributed in the hope that it will be useful,
> -+// but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -+// GNU General Public License for more details.
> -+
> -+// You should have received a copy of the GNU General Public License =
along
> -+// with this library; see the file COPYING.  If not, write to the =
Free
> -+// Software Foundation, 59 Temple Place - Suite 330, Boston, MA =
02111-1307,
> -+// USA.
> -+
> -+// As a special exception, you may use this file as part of a free =
software
> -+// library without restriction.  Specifically, if other files =
instantiate
> -+// templates or use macros or inline functions from this file, or =
you compile
> -+// this file and link it with other files to produce an executable, =
this
> -+// file does not by itself cause the resulting executable to be =
covered by
> -+// the GNU General Public License.  This exception does not however
> -+// invalidate any other reasons why the executable file might be =
covered by
> -+// the GNU General Public License.
> -+
> -+//
> -+// ISO C++ 14882: 22.2.5.1.2 - time_get virtual functions
> -+// ISO C++ 14882: 22.2.5.3.2 - time_put virtual functions
> -+//
> -+
> -+// Written by Benjamin Kosnik <bkoz@redhat.com>
> -+
> -+#include <locale>
> -+#include <bits/c++locale_internal.h>
> -+
> -+#ifdef __UCLIBC_MJN3_ONLY__
> -+#warning tailor for stub locale support
> -+#endif
> -+#ifndef __UCLIBC_HAS_XLOCALE__
> -+#define __nl_langinfo_l(N, L)         nl_langinfo((N))
> -+#endif
> -+
> -+namespace std
> -+{
> -+  template<>
> -+    void
> -+    __timepunct<char>::
> -+    _M_put(char* __s, size_t __maxlen, const char* __format,
> -+	   const tm* __tm) const
> -+    {
> -+#ifdef __UCLIBC_HAS_XLOCALE__
> -+      const size_t __len =3D __strftime_l(__s, __maxlen, __format, =
__tm,
> -+					_M_c_locale_timepunct);
> -+#else
> -+      char* __old =3D strdup(setlocale(LC_ALL, NULL));
> -+      setlocale(LC_ALL, _M_name_timepunct);
> -+      const size_t __len =3D strftime(__s, __maxlen, __format, =
__tm);
> -+      setlocale(LC_ALL, __old);
> -+      free(__old);
> -+#endif
> -+      // Make sure __s is null terminated.
> -+      if (__len =3D=3D 0)
> -+	__s[0] =3D '\0';
> -+    }
> -+
> -+  template<>
> -+    void
> -+    __timepunct<char>::_M_initialize_timepunct(__c_locale __cloc)
> -+    {
> -+      if (!_M_data)
> -+	_M_data =3D new __timepunct_cache<char>;
> -+
> -+      if (!__cloc)
> -+	{
> -+	  // "C" locale
> -+	  _M_c_locale_timepunct =3D _S_get_c_locale();
> -+
> -+	  _M_data->_M_date_format =3D "%m/%d/%y";
> -+	  _M_data->_M_date_era_format =3D "%m/%d/%y";
> -+	  _M_data->_M_time_format =3D "%H:%M:%S";
> -+	  _M_data->_M_time_era_format =3D "%H:%M:%S";
> -+	  _M_data->_M_date_time_format =3D "";
> -+	  _M_data->_M_date_time_era_format =3D "";
> -+	  _M_data->_M_am =3D "AM";
> -+	  _M_data->_M_pm =3D "PM";
> -+	  _M_data->_M_am_pm_format =3D "";
> -+
> -+	  // Day names, starting with "C"'s Sunday.
> -+	  _M_data->_M_day1 =3D "Sunday";
> -+	  _M_data->_M_day2 =3D "Monday";
> -+	  _M_data->_M_day3 =3D "Tuesday";
> -+	  _M_data->_M_day4 =3D "Wednesday";
> -+	  _M_data->_M_day5 =3D "Thursday";
> -+	  _M_data->_M_day6 =3D "Friday";
> -+	  _M_data->_M_day7 =3D "Saturday";
> -+
> -+	  // Abbreviated day names, starting with "C"'s Sun.
> -+	  _M_data->_M_aday1 =3D "Sun";
> -+	  _M_data->_M_aday2 =3D "Mon";
> -+	  _M_data->_M_aday3 =3D "Tue";
> -+	  _M_data->_M_aday4 =3D "Wed";
> -+	  _M_data->_M_aday5 =3D "Thu";
> -+	  _M_data->_M_aday6 =3D "Fri";
> -+	  _M_data->_M_aday7 =3D "Sat";
> -+
> -+	  // Month names, starting with "C"'s January.
> -+	  _M_data->_M_month01 =3D "January";
> -+	  _M_data->_M_month02 =3D "February";
> -+	  _M_data->_M_month03 =3D "March";
> -+	  _M_data->_M_month04 =3D "April";
> -+	  _M_data->_M_month05 =3D "May";
> -+	  _M_data->_M_month06 =3D "June";
> -+	  _M_data->_M_month07 =3D "July";
> -+	  _M_data->_M_month08 =3D "August";
> -+	  _M_data->_M_month09 =3D "September";
> -+	  _M_data->_M_month10 =3D "October";
> -+	  _M_data->_M_month11 =3D "November";
> -+	  _M_data->_M_month12 =3D "December";
> -+
> -+	  // Abbreviated month names, starting with "C"'s Jan.
> -+	  _M_data->_M_amonth01 =3D "Jan";
> -+	  _M_data->_M_amonth02 =3D "Feb";
> -+	  _M_data->_M_amonth03 =3D "Mar";
> -+	  _M_data->_M_amonth04 =3D "Apr";
> -+	  _M_data->_M_amonth05 =3D "May";
> -+	  _M_data->_M_amonth06 =3D "Jun";
> -+	  _M_data->_M_amonth07 =3D "Jul";
> -+	  _M_data->_M_amonth08 =3D "Aug";
> -+	  _M_data->_M_amonth09 =3D "Sep";
> -+	  _M_data->_M_amonth10 =3D "Oct";
> -+	  _M_data->_M_amonth11 =3D "Nov";
> -+	  _M_data->_M_amonth12 =3D "Dec";
> -+	}
> -+      else
> -+	{
> -+	  _M_c_locale_timepunct =3D _S_clone_c_locale(__cloc);
> -+
> -+	  _M_data->_M_date_format =3D __nl_langinfo_l(D_FMT, __cloc);
> -+	  _M_data->_M_date_era_format =3D __nl_langinfo_l(ERA_D_FMT, =
__cloc);
> -+	  _M_data->_M_time_format =3D __nl_langinfo_l(T_FMT, __cloc);
> -+	  _M_data->_M_time_era_format =3D __nl_langinfo_l(ERA_T_FMT, =
__cloc);
> -+	  _M_data->_M_date_time_format =3D __nl_langinfo_l(D_T_FMT, =
__cloc);
> -+	  _M_data->_M_date_time_era_format =3D =
__nl_langinfo_l(ERA_D_T_FMT,
> -+							     __cloc);
> -+	  _M_data->_M_am =3D __nl_langinfo_l(AM_STR, __cloc);
> -+	  _M_data->_M_pm =3D __nl_langinfo_l(PM_STR, __cloc);
> -+	  _M_data->_M_am_pm_format =3D __nl_langinfo_l(T_FMT_AMPM, =
__cloc);
> -+
> -+	  // Day names, starting with "C"'s Sunday.
> -+	  _M_data->_M_day1 =3D __nl_langinfo_l(DAY_1, __cloc);
> -+	  _M_data->_M_day2 =3D __nl_langinfo_l(DAY_2, __cloc);
> -+	  _M_data->_M_day3 =3D __nl_langinfo_l(DAY_3, __cloc);
> -+	  _M_data->_M_day4 =3D __nl_langinfo_l(DAY_4, __cloc);
> -+	  _M_data->_M_day5 =3D __nl_langinfo_l(DAY_5, __cloc);
> -+	  _M_data->_M_day6 =3D __nl_langinfo_l(DAY_6, __cloc);
> -+	  _M_data->_M_day7 =3D __nl_langinfo_l(DAY_7, __cloc);
> -+
> -+	  // Abbreviated day names, starting with "C"'s Sun.
> -+	  _M_data->_M_aday1 =3D __nl_langinfo_l(ABDAY_1, __cloc);
> -+	  _M_data->_M_aday2 =3D __nl_langinfo_l(ABDAY_2, __cloc);
> -+	  _M_data->_M_aday3 =3D __nl_langinfo_l(ABDAY_3, __cloc);
> -+	  _M_data->_M_aday4 =3D __nl_langinfo_l(ABDAY_4, __cloc);
> -+	  _M_data->_M_aday5 =3D __nl_langinfo_l(ABDAY_5, __cloc);
> -+	  _M_data->_M_aday6 =3D __nl_langinfo_l(ABDAY_6, __cloc);
> -+	  _M_data->_M_aday7 =3D __nl_langinfo_l(ABDAY_7, __cloc);
> -+
> -+	  // Month names, starting with "C"'s January.
> -+	  _M_data->_M_month01 =3D __nl_langinfo_l(MON_1, __cloc);
> -+	  _M_data->_M_month02 =3D __nl_langinfo_l(MON_2, __cloc);
> -+	  _M_data->_M_month03 =3D __nl_langinfo_l(MON_3, __cloc);
> -+	  _M_data->_M_month04 =3D __nl_langinfo_l(MON_4, __cloc);
> -+	  _M_data->_M_month05 =3D __nl_langinfo_l(MON_5, __cloc);
> -+	  _M_data->_M_month06 =3D __nl_langinfo_l(MON_6, __cloc);
> -+	  _M_data->_M_month07 =3D __nl_langinfo_l(MON_7, __cloc);
> -+	  _M_data->_M_month08 =3D __nl_langinfo_l(MON_8, __cloc);
> -+	  _M_data->_M_month09 =3D __nl_langinfo_l(MON_9, __cloc);
> -+	  _M_data->_M_month10 =3D __nl_langinfo_l(MON_10, __cloc);
> -+	  _M_data->_M_month11 =3D __nl_langinfo_l(MON_11, __cloc);
> -+	  _M_data->_M_month12 =3D __nl_langinfo_l(MON_12, __cloc);
> -+
> -+	  // Abbreviated month names, starting with "C"'s Jan.
> -+	  _M_data->_M_amonth01 =3D __nl_langinfo_l(ABMON_1, __cloc);
> -+	  _M_data->_M_amonth02 =3D __nl_langinfo_l(ABMON_2, __cloc);
> -+	  _M_data->_M_amonth03 =3D __nl_langinfo_l(ABMON_3, __cloc);
> -+	  _M_data->_M_amonth04 =3D __nl_langinfo_l(ABMON_4, __cloc);
> -+	  _M_data->_M_amonth05 =3D __nl_langinfo_l(ABMON_5, __cloc);
> -+	  _M_data->_M_amonth06 =3D __nl_langinfo_l(ABMON_6, __cloc);
> -+	  _M_data->_M_amonth07 =3D __nl_langinfo_l(ABMON_7, __cloc);
> -+	  _M_data->_M_amonth08 =3D __nl_langinfo_l(ABMON_8, __cloc);
> -+	  _M_data->_M_amonth09 =3D __nl_langinfo_l(ABMON_9, __cloc);
> -+	  _M_data->_M_amonth10 =3D __nl_langinfo_l(ABMON_10, __cloc);
> -+	  _M_data->_M_amonth11 =3D __nl_langinfo_l(ABMON_11, __cloc);
> -+	  _M_data->_M_amonth12 =3D __nl_langinfo_l(ABMON_12, __cloc);
> -+	}
> -+    }
> -+
> -+#ifdef _GLIBCXX_USE_WCHAR_T
> -+  template<>
> -+    void
> -+    __timepunct<wchar_t>::
> -+    _M_put(wchar_t* __s, size_t __maxlen, const wchar_t* __format,
> -+	   const tm* __tm) const
> -+    {
> -+#ifdef __UCLIBC_HAS_XLOCALE__
> -+      __wcsftime_l(__s, __maxlen, __format, __tm, =
_M_c_locale_timepunct);
> -+      const size_t __len =3D __wcsftime_l(__s, __maxlen, __format, =
__tm,
> -+					_M_c_locale_timepunct);
> -+#else
> -+      char* __old =3D strdup(setlocale(LC_ALL, NULL));
> -+      setlocale(LC_ALL, _M_name_timepunct);
> -+      const size_t __len =3D wcsftime(__s, __maxlen, __format, =
__tm);
> -+      setlocale(LC_ALL, __old);
> -+      free(__old);
> -+#endif
> -+      // Make sure __s is null terminated.
> -+      if (__len =3D=3D 0)
> -+	__s[0] =3D L'\0';
> -+    }
> -+
> -+  template<>
> -+    void
> -+    __timepunct<wchar_t>::_M_initialize_timepunct(__c_locale __cloc)
> -+    {
> -+      if (!_M_data)
> -+	_M_data =3D new __timepunct_cache<wchar_t>;
> -+
> -+#warning wide time stuff
> -+//       if (!__cloc)
> -+	{
> -+	  // "C" locale
> -+	  _M_c_locale_timepunct =3D _S_get_c_locale();
> -+
> -+	  _M_data->_M_date_format =3D L"%m/%d/%y";
> -+	  _M_data->_M_date_era_format =3D L"%m/%d/%y";
> -+	  _M_data->_M_time_format =3D L"%H:%M:%S";
> -+	  _M_data->_M_time_era_format =3D L"%H:%M:%S";
> -+	  _M_data->_M_date_time_format =3D L"";
> -+	  _M_data->_M_date_time_era_format =3D L"";
> -+	  _M_data->_M_am =3D L"AM";
> -+	  _M_data->_M_pm =3D L"PM";
> -+	  _M_data->_M_am_pm_format =3D L"";
> -+
> -+	  // Day names, starting with "C"'s Sunday.
> -+	  _M_data->_M_day1 =3D L"Sunday";
> -+	  _M_data->_M_day2 =3D L"Monday";
> -+	  _M_data->_M_day3 =3D L"Tuesday";
> -+	  _M_data->_M_day4 =3D L"Wednesday";
> -+	  _M_data->_M_day5 =3D L"Thursday";
> -+	  _M_data->_M_day6 =3D L"Friday";
> -+	  _M_data->_M_day7 =3D L"Saturday";
> -+
> -+	  // Abbreviated day names, starting with "C"'s Sun.
> -+	  _M_data->_M_aday1 =3D L"Sun";
> -+	  _M_data->_M_aday2 =3D L"Mon";
> -+	  _M_data->_M_aday3 =3D L"Tue";
> -+	  _M_data->_M_aday4 =3D L"Wed";
> -+	  _M_data->_M_aday5 =3D L"Thu";
> -+	  _M_data->_M_aday6 =3D L"Fri";
> -+	  _M_data->_M_aday7 =3D L"Sat";
> -+
> -+	  // Month names, starting with "C"'s January.
> -+	  _M_data->_M_month01 =3D L"January";
> -+	  _M_data->_M_month02 =3D L"February";
> -+	  _M_data->_M_month03 =3D L"March";
> -+	  _M_data->_M_month04 =3D L"April";
> -+	  _M_data->_M_month05 =3D L"May";
> -+	  _M_data->_M_month06 =3D L"June";
> -+	  _M_data->_M_month07 =3D L"July";
> -+	  _M_data->_M_month08 =3D L"August";
> -+	  _M_data->_M_month09 =3D L"September";
> -+	  _M_data->_M_month10 =3D L"October";
> -+	  _M_data->_M_month11 =3D L"November";
> -+	  _M_data->_M_month12 =3D L"December";
> -+
> -+	  // Abbreviated month names, starting with "C"'s Jan.
> -+	  _M_data->_M_amonth01 =3D L"Jan";
> -+	  _M_data->_M_amonth02 =3D L"Feb";
> -+	  _M_data->_M_amonth03 =3D L"Mar";
> -+	  _M_data->_M_amonth04 =3D L"Apr";
> -+	  _M_data->_M_amonth05 =3D L"May";
> -+	  _M_data->_M_amonth06 =3D L"Jun";
> -+	  _M_data->_M_amonth07 =3D L"Jul";
> -+	  _M_data->_M_amonth08 =3D L"Aug";
> -+	  _M_data->_M_amonth09 =3D L"Sep";
> -+	  _M_data->_M_amonth10 =3D L"Oct";
> -+	  _M_data->_M_amonth11 =3D L"Nov";
> -+	  _M_data->_M_amonth12 =3D L"Dec";
> -+	}
> -+#if 0
> -+      else
> -+	{
> -+	  _M_c_locale_timepunct =3D _S_clone_c_locale(__cloc);
> -+
> -+	  union { char *__s; wchar_t *__w; } __u;
> -+
> -+	  __u.__s =3D __nl_langinfo_l(_NL_WD_FMT, __cloc);
> -+	  _M_data->_M_date_format =3D __u.__w;
> -+	  __u.__s =3D __nl_langinfo_l(_NL_WERA_D_FMT, __cloc);
> -+	  _M_data->_M_date_era_format =3D __u.__w;
> -+	  __u.__s =3D __nl_langinfo_l(_NL_WT_FMT, __cloc);
> -+	  _M_data->_M_time_format =3D __u.__w;
> -+	  __u.__s =3D __nl_langinfo_l(_NL_WERA_T_FMT, __cloc);
> -+	  _M_data->_M_time_era_format =3D __u.__w;
> -+	  __u.__s =3D __nl_langinfo_l(_NL_WD_T_FMT, __cloc);
> -+	  _M_data->_M_date_time_format =3D __u.__w;
> -+	  __u.__s =3D __nl_langinfo_l(_NL_WERA_D_T_FMT, __cloc);
> -+	  _M_data->_M_date_time_era_format =3D __u.__w;
> -+	  __u.__s =3D __nl_langinfo_l(_NL_WAM_STR, __cloc);
> -+	  _M_data->_M_am =3D __u.__w;
> -+	  __u.__s =3D __nl_langinfo_l(_NL_WPM_STR, __cloc);
> -+	  _M_data->_M_pm =3D __u.__w;
> -+	  __u.__s =3D __nl_langinfo_l(_NL_WT_FMT_AMPM, __cloc);
> -+	  _M_data->_M_am_pm_format =3D __u.__w;
> -+
> -+	  // Day names, starting with "C"'s Sunday.
> -+	  __u.__s =3D __nl_langinfo_l(_NL_WDAY_1, __cloc);
> -+	  _M_data->_M_day1 =3D __u.__w;
> -+	  __u.__s =3D __nl_langinfo_l(_NL_WDAY_2, __cloc);
> -+	  _M_data->_M_day2 =3D __u.__w;
> -+	  __u.__s =3D __nl_langinfo_l(_NL_WDAY_3, __cloc);
> -+	  _M_data->_M_day3 =3D __u.__w;
> -+	  __u.__s =3D __nl_langinfo_l(_NL_WDAY_4, __cloc);
> -+	  _M_data->_M_day4 =3D __u.__w;
> -+	  __u.__s =3D __nl_langinfo_l(_NL_WDAY_5, __cloc);
> -+	  _M_data->_M_day5 =3D __u.__w;
> -+	  __u.__s =3D __nl_langinfo_l(_NL_WDAY_6, __cloc);
> -+	  _M_data->_M_day6 =3D __u.__w;
> -+	  __u.__s =3D __nl_langinfo_l(_NL_WDAY_7, __cloc);
> -+	  _M_data->_M_day7 =3D __u.__w;
> -+
> -+	  // Abbreviated day names, starting with "C"'s Sun.
> -+	  __u.__s =3D __nl_langinfo_l(_NL_WABDAY_1, __cloc);
> -+	  _M_data->_M_aday1 =3D __u.__w;
> -+	  __u.__s =3D __nl_langinfo_l(_NL_WABDAY_2, __cloc);
> -+	  _M_data->_M_aday2 =3D __u.__w;
> -+	  __u.__s =3D __nl_langinfo_l(_NL_WABDAY_3, __cloc);
> -+	  _M_data->_M_aday3 =3D __u.__w;
> -+	  __u.__s =3D __nl_langinfo_l(_NL_WABDAY_4, __cloc);
> -+	  _M_data->_M_aday4 =3D __u.__w;
> -+	  __u.__s =3D __nl_langinfo_l(_NL_WABDAY_5, __cloc);
> -+	  _M_data->_M_aday5 =3D __u.__w;
> -+	  __u.__s =3D __nl_langinfo_l(_NL_WABDAY_6, __cloc);
> -+	  _M_data->_M_aday6 =3D __u.__w;
> -+	  __u.__s =3D __nl_langinfo_l(_NL_WABDAY_7, __cloc);
> -+	  _M_data->_M_aday7 =3D __u.__w;
> -+
> -+	  // Month names, starting with "C"'s January.
> -+	  __u.__s =3D __nl_langinfo_l(_NL_WMON_1, __cloc);
> -+	  _M_data->_M_month01 =3D __u.__w;
> -+	  __u.__s =3D __nl_langinfo_l(_NL_WMON_2, __cloc);
> -+	  _M_data->_M_month02 =3D __u.__w;
> -+	  __u.__s =3D __nl_langinfo_l(_NL_WMON_3, __cloc);
> -+	  _M_data->_M_month03 =3D __u.__w;
> -+	  __u.__s =3D __nl_langinfo_l(_NL_WMON_4, __cloc);
> -+	  _M_data->_M_month04 =3D __u.__w;
> -+	  __u.__s =3D __nl_langinfo_l(_NL_WMON_5, __cloc);
> -+	  _M_data->_M_month05 =3D __u.__w;
> -+	  __u.__s =3D __nl_langinfo_l(_NL_WMON_6, __cloc);
> -+	  _M_data->_M_month06 =3D __u.__w;
> -+	  __u.__s =3D __nl_langinfo_l(_NL_WMON_7, __cloc);
> -+	  _M_data->_M_month07 =3D __u.__w;
> -+	  __u.__s =3D __nl_langinfo_l(_NL_WMON_8, __cloc);
> -+	  _M_data->_M_month08 =3D __u.__w;
> -+	  __u.__s =3D __nl_langinfo_l(_NL_WMON_9, __cloc);
> -+	  _M_data->_M_month09 =3D __u.__w;
> -+	  __u.__s =3D __nl_langinfo_l(_NL_WMON_10, __cloc);
> -+	  _M_data->_M_month10 =3D __u.__w;
> -+	  __u.__s =3D __nl_langinfo_l(_NL_WMON_11, __cloc);
> -+	  _M_data->_M_month11 =3D __u.__w;
> -+	  __u.__s =3D __nl_langinfo_l(_NL_WMON_12, __cloc);
> -+	  _M_data->_M_month12 =3D __u.__w;
> -+
> -+	  // Abbreviated month names, starting with "C"'s Jan.
> -+	  __u.__s =3D __nl_langinfo_l(_NL_WABMON_1, __cloc);
> -+	  _M_data->_M_amonth01 =3D __u.__w;
> -+	  __u.__s =3D __nl_langinfo_l(_NL_WABMON_2, __cloc);
> -+	  _M_data->_M_amonth02 =3D __u.__w;
> -+	  __u.__s =3D __nl_langinfo_l(_NL_WABMON_3, __cloc);
> -+	  _M_data->_M_amonth03 =3D __u.__w;
> -+	  __u.__s =3D __nl_langinfo_l(_NL_WABMON_4, __cloc);
> -+	  _M_data->_M_amonth04 =3D __u.__w;
> -+	  __u.__s =3D __nl_langinfo_l(_NL_WABMON_5, __cloc);
> -+	  _M_data->_M_amonth05 =3D __u.__w;
> -+	  __u.__s =3D __nl_langinfo_l(_NL_WABMON_6, __cloc);
> -+	  _M_data->_M_amonth06 =3D __u.__w;
> -+	  __u.__s =3D __nl_langinfo_l(_NL_WABMON_7, __cloc);
> -+	  _M_data->_M_amonth07 =3D __u.__w;
> -+	  __u.__s =3D __nl_langinfo_l(_NL_WABMON_8, __cloc);
> -+	  _M_data->_M_amonth08 =3D __u.__w;
> -+	  __u.__s =3D __nl_langinfo_l(_NL_WABMON_9, __cloc);
> -+	  _M_data->_M_amonth09 =3D __u.__w;
> -+	  __u.__s =3D __nl_langinfo_l(_NL_WABMON_10, __cloc);
> -+	  _M_data->_M_amonth10 =3D __u.__w;
> -+	  __u.__s =3D __nl_langinfo_l(_NL_WABMON_11, __cloc);
> -+	  _M_data->_M_amonth11 =3D __u.__w;
> -+	  __u.__s =3D __nl_langinfo_l(_NL_WABMON_12, __cloc);
> -+	  _M_data->_M_amonth12 =3D __u.__w;
> -+	}
> -+#endif // 0
> -+    }
> -+#endif
> -+}
> -Index: =
gcc-4_7-branch/libstdc++-v3/config/locale/uclibc/time_members.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- /dev/null	1970-01-01 00:00:00.000000000 +0000
> -+++ gcc-4_7-branch/libstdc++-v3/config/locale/uclibc/time_members.h	=
2012-04-10 10:30:37.331368420 -0700
> -@@ -0,0 +1,68 @@
> -+// std::time_get, std::time_put implementation, GNU version -*- C++ =
-*-
> -+
> -+// Copyright (C) 2001, 2002, 2003, 2004 Free Software Foundation, =
Inc.
> -+//
> -+// This file is part of the GNU ISO C++ Library.  This library is =
free
> -+// software; you can redistribute it and/or modify it under the
> -+// terms of the GNU General Public License as published by the
> -+// Free Software Foundation; either version 2, or (at your option)
> -+// any later version.
> -+
> -+// This library is distributed in the hope that it will be useful,
> -+// but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -+// GNU General Public License for more details.
> -+
> -+// You should have received a copy of the GNU General Public License =
along
> -+// with this library; see the file COPYING.  If not, write to the =
Free
> -+// Software Foundation, 59 Temple Place - Suite 330, Boston, MA =
02111-1307,
> -+// USA.
> -+
> -+// As a special exception, you may use this file as part of a free =
software
> -+// library without restriction.  Specifically, if other files =
instantiate
> -+// templates or use macros or inline functions from this file, or =
you compile
> -+// this file and link it with other files to produce an executable, =
this
> -+// file does not by itself cause the resulting executable to be =
covered by
> -+// the GNU General Public License.  This exception does not however
> -+// invalidate any other reasons why the executable file might be =
covered by
> -+// the GNU General Public License.
> -+
> -+//
> -+// ISO C++ 14882: 22.2.5.1.2 - time_get functions
> -+// ISO C++ 14882: 22.2.5.3.2 - time_put functions
> -+//
> -+
> -+// Written by Benjamin Kosnik <bkoz@redhat.com>
> -+
> -+  template<typename _CharT>
> -+    __timepunct<_CharT>::__timepunct(size_t __refs)
> -+    : facet(__refs), _M_data(NULL), _M_c_locale_timepunct(NULL),
> -+    _M_name_timepunct(_S_get_c_name())
> -+    { _M_initialize_timepunct(); }
> -+
> -+  template<typename _CharT>
> -+    __timepunct<_CharT>::__timepunct(__cache_type* __cache, size_t =
__refs)
> -+    : facet(__refs), _M_data(__cache), _M_c_locale_timepunct(NULL),
> -+    _M_name_timepunct(_S_get_c_name())
> -+    { _M_initialize_timepunct(); }
> -+
> -+  template<typename _CharT>
> -+    __timepunct<_CharT>::__timepunct(__c_locale __cloc, const char* =
__s,
> -+				     size_t __refs)
> -+    : facet(__refs), _M_data(NULL), _M_c_locale_timepunct(NULL),
> -+    _M_name_timepunct(__s)
> -+    {
> -+      char* __tmp =3D new char[std::strlen(__s) + 1];
> -+      std::strcpy(__tmp, __s);
> -+      _M_name_timepunct =3D __tmp;
> -+      _M_initialize_timepunct(__cloc);
> -+    }
> -+
> -+  template<typename _CharT>
> -+    __timepunct<_CharT>::~__timepunct()
> -+    {
> -+      if (_M_name_timepunct !=3D _S_get_c_name())
> -+	delete [] _M_name_timepunct;
> -+      delete _M_data;
> -+      _S_destroy_c_locale(_M_c_locale_timepunct);
> -+    }
> -Index: gcc-4_7-branch/libstdc++-v3/configure
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4_7-branch.orig/libstdc++-v3/configure	2012-04-10 =
10:19:50.383337127 -0700
> -+++ gcc-4_7-branch/libstdc++-v3/configure	2012-04-10 =
10:30:37.347368481 -0700
> -@@ -15736,6 +15736,9 @@
> -   # Default to "generic".
> -   if test $enable_clocale_flag =3D auto; then
> -     case ${target_os} in
> -+      *-uclibc*)
> -+        enable_clocale_flag=3Duclibc
> -+        ;;
> -       linux* | gnu* | kfreebsd*-gnu | knetbsd*-gnu)
> - 	enable_clocale_flag=3Dgnu
> - 	;;
> -@@ -15990,6 +15993,78 @@
> -       CTIME_CC=3Dconfig/locale/generic/time_members.cc
> -       CLOCALE_INTERNAL_H=3Dconfig/locale/generic/c++locale_internal.h
> -       ;;
> -+    uclibc)
> -+      { $as_echo "$as_me:${as_lineno-$LINENO}: result: uclibc" >&5
> -+$as_echo "uclibc" >&6; }
> -+
> -+      # Declare intention to use gettext, and add support for =
specific
> -+      # languages.
> -+      # For some reason, ALL_LINGUAS has to be before AM-GNU-GETTEXT
> -+      ALL_LINGUAS=3D"de fr"
> -+
> -+      # Don't call AM-GNU-GETTEXT here. Instead, assume glibc.
> -+      # Extract the first word of "msgfmt", so it can be a program =
name with args.
> -+set dummy msgfmt; ac_word=3D$2
> -+{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
> -+$as_echo_n "checking for $ac_word... " >&6; }
> -+if test "${ac_cv_prog_check_msgfmt+set}" =3D set; then :
> -+  $as_echo_n "(cached) " >&6
> -+else
> -+  if test -n "$check_msgfmt"; then
> -+  ac_cv_prog_check_msgfmt=3D"$check_msgfmt" # Let the user override =
the test.
> -+else
> -+as_save_IFS=3D$IFS; IFS=3D$PATH_SEPARATOR
> -+for as_dir in $PATH
> -+do
> -+  IFS=3D$as_save_IFS
> -+  test -z "$as_dir" && as_dir=3D.
> -+    for ac_exec_ext in '' $ac_executable_extensions; do
> -+  if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x =
"$as_dir/$ac_word$ac_exec_ext"; }; then
> -+    ac_cv_prog_check_msgfmt=3D"yes"
> -+    $as_echo "$as_me:${as_lineno-$LINENO}: found =
$as_dir/$ac_word$ac_exec_ext" >&5
> -+    break 2
> -+  fi
> -+done
> -+  done
> -+IFS=3D$as_save_IFS
> -+
> -+  test -z "$ac_cv_prog_check_msgfmt" && ac_cv_prog_check_msgfmt=3D"no"=

> -+fi
> -+fi
> -+check_msgfmt=3D$ac_cv_prog_check_msgfmt
> -+if test -n "$check_msgfmt"; then
> -+  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $check_msgfmt" =
>&5
> -+$as_echo "$check_msgfmt" >&6; }
> -+else
> -+  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
> -+$as_echo "no" >&6; }
> -+fi
> -+
> -+
> -+      if test x"$check_msgfmt" =3D x"yes" && test x"$enable_nls" =3D =
x"yes"; then
> -+        USE_NLS=3Dyes
> -+      fi
> -+      # Export the build objects.
> -+      for ling in $ALL_LINGUAS; do \
> -+        glibcxx_MOFILES=3D"$glibcxx_MOFILES $ling.mo"; \
> -+        glibcxx_POFILES=3D"$glibcxx_POFILES $ling.po"; \
> -+      done
> -+
> -+
> -+
> -+      CLOCALE_H=3Dconfig/locale/uclibc/c_locale.h
> -+      CLOCALE_CC=3Dconfig/locale/uclibc/c_locale.cc
> -+      CCODECVT_CC=3Dconfig/locale/uclibc/codecvt_members.cc
> -+      CCOLLATE_CC=3Dconfig/locale/uclibc/collate_members.cc
> -+      CCTYPE_CC=3Dconfig/locale/uclibc/ctype_members.cc
> -+      CMESSAGES_H=3Dconfig/locale/uclibc/messages_members.h
> -+      CMESSAGES_CC=3Dconfig/locale/uclibc/messages_members.cc
> -+      CMONEY_CC=3Dconfig/locale/uclibc/monetary_members.cc
> -+      CNUMERIC_CC=3Dconfig/locale/uclibc/numeric_members.cc
> -+      CTIME_H=3Dconfig/locale/uclibc/time_members.h
> -+      CTIME_CC=3Dconfig/locale/uclibc/time_members.cc
> -+      CLOCALE_INTERNAL_H=3Dconfig/locale/uclibc/c++locale_internal.h
> -+      ;;
> -   esac
> -=20
> -   # This is where the testsuite looks for locale catalogs, using the
> -Index: gcc-4_7-branch/libstdc++-v3/include/c_compatibility/wchar.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4_7-branch.orig/libstdc++-v3/include/c_compatibility/wchar.h	=
2012-04-10 10:19:50.303337124 -0700
> -+++ gcc-4_7-branch/libstdc++-v3/include/c_compatibility/wchar.h	=
2012-04-10 10:30:37.347368481 -0700
> -@@ -101,7 +101,9 @@
> - using std::wmemcpy;
> - using std::wmemmove;
> - using std::wmemset;
> -+#if _GLIBCXX_HAVE_WCSFTIME
> - using std::wcsftime;
> -+#endif
> -=20
> - #if _GLIBCXX_USE_C99
> - using std::wcstold;
> -Index: gcc-4_7-branch/libstdc++-v3/include/c_std/cwchar
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4_7-branch.orig/libstdc++-v3/include/c_std/cwchar	=
2012-04-10 10:19:50.295337124 -0700
> -+++ gcc-4_7-branch/libstdc++-v3/include/c_std/cwchar	2012-04-10 =
10:30:37.347368481 -0700
> -@@ -177,7 +177,9 @@
> -   using ::wcscoll;
> -   using ::wcscpy;
> -   using ::wcscspn;
> -+#if _GLIBCXX_HAVE_WCSFTIME
> -   using ::wcsftime;
> -+#endif
> -   using ::wcslen;
> -   using ::wcsncat;
> -   using ::wcsncmp;
> diff --git =
a/meta/recipes-devtools/gcc/gcc-4.8/203-uclibc-locale-no__x.patch =
b/meta/recipes-devtools/gcc/gcc-4.8/203-uclibc-locale-no__x.patch
> deleted file mode 100644
> index c602e91..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.8/203-uclibc-locale-no__x.patch
> +++ /dev/null
> @@ -1,235 +0,0 @@
> -Upstream-Status: Pending
> -
> -Index: =
gcc-4.6.0/libstdc++-v3/config/locale/uclibc/c++locale_internal.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- =
gcc-4.6.0.orig/libstdc++-v3/config/locale/uclibc/c++locale_internal.h
> -+++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/c++locale_internal.h
> -@@ -60,4 +60,49 @@ extern "C" __typeof(wcsxfrm_l) __wcsxfrm
> - extern "C" __typeof(wctype_l) __wctype_l;
> - #endif
> -=20
> -+# define __nl_langinfo_l nl_langinfo_l
> -+# define __strcoll_l strcoll_l
> -+# define __strftime_l strftime_l
> -+# define __strtod_l strtod_l
> -+# define __strtof_l strtof_l
> -+# define __strtold_l strtold_l
> -+# define __strxfrm_l strxfrm_l
> -+# define __newlocale newlocale
> -+# define __freelocale freelocale
> -+# define __duplocale duplocale
> -+# define __uselocale uselocale
> -+
> -+# ifdef _GLIBCXX_USE_WCHAR_T
> -+#  define __iswctype_l iswctype_l
> -+#  define __towlower_l towlower_l
> -+#  define __towupper_l towupper_l
> -+#  define __wcscoll_l wcscoll_l
> -+#  define __wcsftime_l wcsftime_l
> -+#  define __wcsxfrm_l wcsxfrm_l
> -+#  define __wctype_l wctype_l
> -+# endif
> -+
> -+#else
> -+# define __nl_langinfo_l(N, L)       nl_langinfo((N))
> -+# define __strcoll_l(S1, S2, L)      strcoll((S1), (S2))
> -+# define __strtod_l(S, E, L)         strtod((S), (E))
> -+# define __strtof_l(S, E, L)         strtof((S), (E))
> -+# define __strtold_l(S, E, L)        strtold((S), (E))
> -+# define __strxfrm_l(S1, S2, N, L)   strxfrm((S1), (S2), (N))
> -+# warning should dummy __newlocale check for C|POSIX ?
> -+# define __newlocale(a, b, c)        NULL
> -+# define __freelocale(a)             ((void)0)
> -+# define __duplocale(a)              __c_locale()
> -+//# define __uselocale ?
> -+//
> -+# ifdef _GLIBCXX_USE_WCHAR_T
> -+#  define __iswctype_l(C, M, L)       iswctype((C), (M))
> -+#  define __towlower_l(C, L)          towlower((C))
> -+#  define __towupper_l(C, L)          towupper((C))
> -+#  define __wcscoll_l(S1, S2, L)      wcscoll((S1), (S2))
> -+//#  define __wcsftime_l(S, M, F, T, L)  wcsftime((S), (M), (F), =
(T))
> -+#  define __wcsxfrm_l(S1, S2, N, L)   wcsxfrm((S1), (S2), (N))
> -+#  define __wctype_l(S, L)            wctype((S))
> -+# endif
> -+
> - #endif // GLIBC 2.3 and later
> -Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/c_locale.cc
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.6.0.orig/libstdc++-v3/config/locale/uclibc/c_locale.cc
> -+++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/c_locale.cc
> -@@ -39,20 +39,6 @@
> - #include <langinfo.h>
> - #include <bits/c++locale_internal.h>
> -=20
> --#ifndef __UCLIBC_HAS_XLOCALE__
> --#define __strtol_l(S, E, B, L)      strtol((S), (E), (B))
> --#define __strtoul_l(S, E, B, L)     strtoul((S), (E), (B))
> --#define __strtoll_l(S, E, B, L)     strtoll((S), (E), (B))
> --#define __strtoull_l(S, E, B, L)    strtoull((S), (E), (B))
> --#define __strtof_l(S, E, L)         strtof((S), (E))
> --#define __strtod_l(S, E, L)         strtod((S), (E))
> --#define __strtold_l(S, E, L)        strtold((S), (E))
> --#warning should dummy __newlocale check for C|POSIX ?
> --#define __newlocale(a, b, c)        NULL
> --#define __freelocale(a)             ((void)0)
> --#define __duplocale(a)              __c_locale()
> --#endif
> --
> - namespace std
> - {
> -   template<>
> -Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/collate_members.cc
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- =
gcc-4.6.0.orig/libstdc++-v3/config/locale/uclibc/collate_members.cc
> -+++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/collate_members.cc
> -@@ -36,13 +36,6 @@
> - #include <locale>
> - #include <bits/c++locale_internal.h>
> -=20
> --#ifndef __UCLIBC_HAS_XLOCALE__
> --#define __strcoll_l(S1, S2, L)      strcoll((S1), (S2))
> --#define __strxfrm_l(S1, S2, N, L)   strxfrm((S1), (S2), (N))
> --#define __wcscoll_l(S1, S2, L)      wcscoll((S1), (S2))
> --#define __wcsxfrm_l(S1, S2, N, L)   wcsxfrm((S1), (S2), (N))
> --#endif
> --
> - namespace std
> - {
> -   // These are basically extensions to char_traits, and perhaps =
should
> -Index: =
gcc-4.6.0/libstdc++-v3/config/locale/uclibc/monetary_members.cc
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- =
gcc-4.6.0.orig/libstdc++-v3/config/locale/uclibc/monetary_members.cc
> -+++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/monetary_members.cc
> -@@ -43,10 +43,6 @@
> - #warning tailor for stub locale support
> - #endif
> -=20
> --#ifndef __UCLIBC_HAS_XLOCALE__
> --#define __nl_langinfo_l(N, L)         nl_langinfo((N))
> --#endif
> --
> - namespace std
> - {
> -   // Construct and return valid pattern consisting of some =
combination of:
> -Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/numeric_members.cc
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- =
gcc-4.6.0.orig/libstdc++-v3/config/locale/uclibc/numeric_members.cc
> -+++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/numeric_members.cc
> -@@ -41,9 +41,6 @@
> - #ifdef __UCLIBC_MJN3_ONLY__
> - #warning tailor for stub locale support
> - #endif
> --#ifndef __UCLIBC_HAS_XLOCALE__
> --#define __nl_langinfo_l(N, L)         nl_langinfo((N))
> --#endif
> -=20
> - namespace std
> - {
> -Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/time_members.cc
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.6.0.orig/libstdc++-v3/config/locale/uclibc/time_members.cc
> -+++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/time_members.cc
> -@@ -40,9 +40,6 @@
> - #ifdef __UCLIBC_MJN3_ONLY__
> - #warning tailor for stub locale support
> - #endif
> --#ifndef __UCLIBC_HAS_XLOCALE__
> --#define __nl_langinfo_l(N, L)         nl_langinfo((N))
> --#endif
> -=20
> - namespace std
> - {
> -Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/ctype_members.cc
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.6.0.orig/libstdc++-v3/config/locale/uclibc/ctype_members.cc
> -+++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/ctype_members.cc
> -@@ -38,13 +38,6 @@
> - #undef _LIBC
> - #include <bits/c++locale_internal.h>
> -=20
> --#ifndef __UCLIBC_HAS_XLOCALE__
> --#define __wctype_l(S, L)           wctype((S))
> --#define __towupper_l(C, L)         towupper((C))
> --#define __towlower_l(C, L)         towlower((C))
> --#define __iswctype_l(C, M, L)      iswctype((C), (M))
> --#endif
> --
> - namespace std
> - {
> -   // NB: The other ctype<char> specializations are in src/locale.cc =
and
> -Index: =
gcc-4.6.0/libstdc++-v3/config/locale/uclibc/messages_members.cc
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- =
gcc-4.6.0.orig/libstdc++-v3/config/locale/uclibc/messages_members.cc
> -+++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/messages_members.cc
> -@@ -39,13 +39,10 @@
> - #ifdef __UCLIBC_MJN3_ONLY__
> - #warning fix gettext stuff
> - #endif
> --#ifdef __UCLIBC_HAS_GETTEXT_AWARENESS__
> --extern "C" char *__dcgettext(const char *domainname,
> --			     const char *msgid, int category);
> - #undef gettext
> --#define gettext(msgid) __dcgettext(NULL, msgid, LC_MESSAGES)
> -+#ifdef __UCLIBC_HAS_GETTEXT_AWARENESS__
> -+#define gettext(msgid) dcgettext(NULL, msgid, LC_MESSAGES)
> - #else
> --#undef gettext
> - #define gettext(msgid) (msgid)
> - #endif
> -=20
> -Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/messages_members.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- =
gcc-4.6.0.orig/libstdc++-v3/config/locale/uclibc/messages_members.h
> -+++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/messages_members.h
> -@@ -36,15 +36,11 @@
> - #ifdef __UCLIBC_MJN3_ONLY__
> - #warning fix prototypes for *textdomain funcs
> - #endif
> --#ifdef __UCLIBC_HAS_GETTEXT_AWARENESS__
> --extern "C" char *__textdomain(const char *domainname);
> --extern "C" char *__bindtextdomain(const char *domainname,
> --				  const char *dirname);
> --#else
> --#undef __textdomain
> --#undef __bindtextdomain
> --#define __textdomain(D)           ((void)0)
> --#define __bindtextdomain(D,P)     ((void)0)
> -+#ifndef __UCLIBC_HAS_GETTEXT_AWARENESS__
> -+#undef textdomain
> -+#undef bindtextdomain
> -+#define textdomain(D)           ((void)0)
> -+#define bindtextdomain(D,P)     ((void)0)
> - #endif
> -=20
> -   // Non-virtual member functions.
> -@@ -70,7 +66,7 @@ extern "C" char *__bindtextdomain(const
> -     messages<_CharT>::open(const basic_string<char>& __s, const =
locale& __loc,
> - 			   const char* __dir) const
> -     {
> --      __bindtextdomain(__s.c_str(), __dir);
> -+      bindtextdomain(__s.c_str(), __dir);
> -       return this->do_open(__s, __loc);
> -     }
> -=20
> -@@ -90,7 +86,7 @@ extern "C" char *__bindtextdomain(const
> -     {
> -       // No error checking is done, assume the catalog exists and =
can
> -       // be used.
> --      __textdomain(__s.c_str());
> -+      textdomain(__s.c_str());
> -       return 0;
> -     }
> -=20
> -Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/c_locale.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.6.0.orig/libstdc++-v3/config/locale/uclibc/c_locale.h
> -+++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/c_locale.h
> -@@ -68,6 +68,7 @@ namespace __gnu_cxx
> - {
> -   extern "C" __typeof(uselocale) __uselocale;
> - }
> -+#define __uselocale uselocale
> - #endif
> -=20
> - namespace std
> diff --git =
a/meta/recipes-devtools/gcc/gcc-4.8/204-uclibc-locale-wchar_fix.patch =
b/meta/recipes-devtools/gcc/gcc-4.8/204-uclibc-locale-wchar_fix.patch
> deleted file mode 100644
> index 896d2a5..0000000
> --- =
a/meta/recipes-devtools/gcc/gcc-4.8/204-uclibc-locale-wchar_fix.patch
> +++ /dev/null
> @@ -1,54 +0,0 @@
> -Upstream-Status: Pending
> -
> -Index: =
gcc-4.6.0/libstdc++-v3/config/locale/uclibc/monetary_members.cc
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- =
gcc-4.6.0.orig/libstdc++-v3/config/locale/uclibc/monetary_members.cc
> -+++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/monetary_members.cc
> -@@ -401,7 +401,7 @@ namespace std
> - # ifdef __UCLIBC_HAS_XLOCALE__
> - 	  _M_data->_M_decimal_point =3D __cloc->decimal_point_wc;
> - 	  _M_data->_M_thousands_sep =3D __cloc->thousands_sep_wc;
> --# else
> -+# elif defined __UCLIBC_HAS_LOCALE__
> - 	  _M_data->_M_decimal_point =3D =
__global_locale->decimal_point_wc;
> - 	  _M_data->_M_thousands_sep =3D =
__global_locale->thousands_sep_wc;
> - # endif
> -@@ -556,7 +556,7 @@ namespace std
> - # ifdef __UCLIBC_HAS_XLOCALE__
> - 	  _M_data->_M_decimal_point =3D __cloc->decimal_point_wc;
> - 	  _M_data->_M_thousands_sep =3D __cloc->thousands_sep_wc;
> --# else
> -+# elif defined __UCLIBC_HAS_LOCALE__
> - 	  _M_data->_M_decimal_point =3D =
__global_locale->decimal_point_wc;
> - 	  _M_data->_M_thousands_sep =3D =
__global_locale->thousands_sep_wc;
> - # endif
> -Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/numeric_members.cc
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- =
gcc-4.6.0.orig/libstdc++-v3/config/locale/uclibc/numeric_members.cc
> -+++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/numeric_members.cc
> -@@ -127,12 +127,25 @@ namespace std
> - 	{
> - 	  // Named locale.
> - 	  // NB: In the GNU model wchar_t is always 32 bit wide.
> -+#ifdef __UCLIBC_MJN3_ONLY__
> -+#warning fix this... should be numeric
> -+#endif
> -+#ifdef __UCLIBC__
> -+# ifdef __UCLIBC_HAS_XLOCALE__
> -+	  _M_data->_M_decimal_point =3D __cloc->decimal_point_wc;
> -+	  _M_data->_M_thousands_sep =3D __cloc->thousands_sep_wc;
> -+# elif defined __UCLIBC_HAS_LOCALE__
> -+	  _M_data->_M_decimal_point =3D =
__global_locale->decimal_point_wc;
> -+	  _M_data->_M_thousands_sep =3D =
__global_locale->thousands_sep_wc;
> -+# endif
> -+#else
> - 	  union { char *__s; wchar_t __w; } __u;
> - 	  __u.__s =3D __nl_langinfo_l(_NL_NUMERIC_DECIMAL_POINT_WC, =
__cloc);
> - 	  _M_data->_M_decimal_point =3D __u.__w;
> -=20
> - 	  __u.__s =3D __nl_langinfo_l(_NL_NUMERIC_THOUSANDS_SEP_WC, =
__cloc);
> - 	  _M_data->_M_thousands_sep =3D __u.__w;
> -+#endif
> -=20
> - 	  if (_M_data->_M_thousands_sep =3D=3D L'\0')
> - 	    _M_data->_M_grouping =3D "";
> diff --git =
a/meta/recipes-devtools/gcc/gcc-4.8/205-uclibc-locale-update.patch =
b/meta/recipes-devtools/gcc/gcc-4.8/205-uclibc-locale-update.patch
> deleted file mode 100644
> index 743017b..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.8/205-uclibc-locale-update.patch
> +++ /dev/null
> @@ -1,521 +0,0 @@
> -Upstream-Status: Pending
> -
> -Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/c_locale.cc
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.6.0.orig/libstdc++-v3/config/locale/uclibc/c_locale.cc
> -+++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/c_locale.cc
> -@@ -39,23 +39,20 @@
> - #include <langinfo.h>
> - #include <bits/c++locale_internal.h>
> -=20
> --namespace std
> --{
> -+_GLIBCXX_BEGIN_NAMESPACE(std)
> -+
> -   template<>
> -     void
> -     __convert_to_v(const char* __s, float& __v, ios_base::iostate& =
__err,
> - 		   const __c_locale& __cloc)
> -     {
> --      if (!(__err & ios_base::failbit))
> --	{
> --	  char* __sanity;
> --	  errno =3D 0;
> --	  float __f =3D __strtof_l(__s, &__sanity, __cloc);
> --          if (__sanity !=3D __s && errno !=3D ERANGE)
> --	    __v =3D __f;
> --	  else
> --	    __err |=3D ios_base::failbit;
> --	}
> -+      char* __sanity;
> -+      errno =3D 0;
> -+      float __f =3D __strtof_l(__s, &__sanity, __cloc);
> -+      if (__sanity !=3D __s && errno !=3D ERANGE)
> -+	__v =3D __f;
> -+      else
> -+	__err |=3D ios_base::failbit;
> -     }
> -=20
> -   template<>
> -@@ -63,16 +60,13 @@ namespace std
> -     __convert_to_v(const char* __s, double& __v, ios_base::iostate& =
__err,
> - 		   const __c_locale& __cloc)
> -     {
> --      if (!(__err & ios_base::failbit))
> --	{
> --	  char* __sanity;
> --	  errno =3D 0;
> --	  double __d =3D __strtod_l(__s, &__sanity, __cloc);
> --          if (__sanity !=3D __s && errno !=3D ERANGE)
> --	    __v =3D __d;
> --	  else
> --	    __err |=3D ios_base::failbit;
> --	}
> -+      char* __sanity;
> -+      errno =3D 0;
> -+      double __d =3D __strtod_l(__s, &__sanity, __cloc);
> -+      if (__sanity !=3D __s && errno !=3D ERANGE)
> -+	__v =3D __d;
> -+      else
> -+	__err |=3D ios_base::failbit;
> -     }
> -=20
> -   template<>
> -@@ -80,16 +74,13 @@ namespace std
> -     __convert_to_v(const char* __s, long double& __v, =
ios_base::iostate& __err,
> - 		   const __c_locale& __cloc)
> -     {
> --      if (!(__err & ios_base::failbit))
> --	{
> --	  char* __sanity;
> --	  errno =3D 0;
> --	  long double __ld =3D __strtold_l(__s, &__sanity, __cloc);
> --          if (__sanity !=3D __s && errno !=3D ERANGE)
> --	    __v =3D __ld;
> --	  else
> --	    __err |=3D ios_base::failbit;
> --	}
> -+      char* __sanity;
> -+      errno =3D 0;
> -+      long double __ld =3D __strtold_l(__s, &__sanity, __cloc);
> -+      if (__sanity !=3D __s && errno !=3D ERANGE)
> -+	__v =3D __ld;
> -+      else
> -+	__err |=3D ios_base::failbit;
> -     }
> -=20
> -   void
> -@@ -110,17 +101,18 @@ namespace std
> -   void
> -   locale::facet::_S_destroy_c_locale(__c_locale& __cloc)
> -   {
> --    if (_S_get_c_locale() !=3D __cloc)
> -+    if (__cloc && _S_get_c_locale() !=3D __cloc)
> -       __freelocale(__cloc);
> -   }
> -=20
> -   __c_locale
> -   locale::facet::_S_clone_c_locale(__c_locale& __cloc)
> -   { return __duplocale(__cloc); }
> --} // namespace std
> -=20
> --namespace __gnu_cxx
> --{
> -+_GLIBCXX_END_NAMESPACE
> -+
> -+_GLIBCXX_BEGIN_NAMESPACE(__gnu_cxx)
> -+
> -   const char* const category_names[6 + _GLIBCXX_NUM_CATEGORIES] =3D
> -     {
> -       "LC_CTYPE",
> -@@ -138,9 +130,11 @@ namespace __gnu_cxx
> -       "LC_IDENTIFICATION"
> - #endif
> -     };
> --}
> -=20
> --namespace std
> --{
> -+_GLIBCXX_END_NAMESPACE
> -+
> -+_GLIBCXX_BEGIN_NAMESPACE(std)
> -+
> -   const char* const* const locale::_S_categories =3D =
__gnu_cxx::category_names;
> --}  // namespace std
> -+
> -+_GLIBCXX_END_NAMESPACE
> -Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/ctype_members.cc
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.6.0.orig/libstdc++-v3/config/locale/uclibc/ctype_members.cc
> -+++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/ctype_members.cc
> -@@ -33,16 +33,20 @@
> -=20
> - // Written by Benjamin Kosnik <bkoz@redhat.com>
> -=20
> -+#include <features.h>
> -+#ifdef __UCLIBC_HAS_LOCALE__
> - #define _LIBC
> - #include <locale>
> - #undef _LIBC
> -+#else
> -+#include <locale>
> -+#endif
> - #include <bits/c++locale_internal.h>
> -=20
> --namespace std
> --{
> -+_GLIBCXX_BEGIN_NAMESPACE(std)
> -+
> -   // NB: The other ctype<char> specializations are in src/locale.cc =
and
> -   // various /config/os/* files.
> --  template<>
> -     ctype_byname<char>::ctype_byname(const char* __s, size_t __refs)
> -     : ctype<char>(0, false, __refs)
> -     {
> -@@ -57,6 +61,8 @@ namespace std
> - #endif
> - 	}
> -     }
> -+    ctype_byname<char>::~ctype_byname()
> -+    { }
> -=20
> - #ifdef _GLIBCXX_USE_WCHAR_T
> -   ctype<wchar_t>::__wmask_type
> -@@ -138,17 +144,33 @@ namespace std
> -   ctype<wchar_t>::
> -   do_is(mask __m, wchar_t __c) const
> -   {
> --    // Highest bitmask in ctype_base =3D=3D 10, but extra in "C"
> --    // library for blank.
> -+    // The case of __m =3D=3D ctype_base::space is particularly =
important,
> -+    // due to its use in many istream functions.  Therefore we deal =
with
> -+    // it first, exploiting the knowledge that on GNU systems =
_M_bit[5]
> -+    // is the mask corresponding to ctype_base::space.  NB: an =
encoding
> -+    // change would not affect correctness!
> -+
> -     bool __ret =3D false;
> --    const size_t __bitmasksize =3D 11;
> --    for (size_t __bitcur =3D 0; __bitcur <=3D __bitmasksize; =
++__bitcur)
> --      if (__m & _M_bit[__bitcur]
> --	  && __iswctype_l(__c, _M_wmask[__bitcur], _M_c_locale_ctype))
> --	{
> --	  __ret =3D true;
> --	  break;
> --	}
> -+    if (__m =3D=3D _M_bit[5])
> -+      __ret =3D __iswctype_l(__c, _M_wmask[5], _M_c_locale_ctype);
> -+    else
> -+      {
> -+	// Highest bitmask in ctype_base =3D=3D 10, but extra in "C"
> -+	// library for blank.
> -+	const size_t __bitmasksize =3D 11;
> -+	for (size_t __bitcur =3D 0; __bitcur <=3D __bitmasksize; =
++__bitcur)
> -+	  if (__m & _M_bit[__bitcur])
> -+	    {
> -+	      if (__iswctype_l(__c, _M_wmask[__bitcur], =
_M_c_locale_ctype))
> -+		{
> -+		  __ret =3D true;
> -+		  break;
> -+		}
> -+	      else if (__m =3D=3D _M_bit[__bitcur])
> -+		break;
> -+	    }
> -+      }
> -+
> -     return __ret;
> -   }
> -=20
> -@@ -290,4 +312,5 @@ namespace std
> - #endif
> -   }
> - #endif //  _GLIBCXX_USE_WCHAR_T
> --}
> -+
> -+_GLIBCXX_END_NAMESPACE
> -Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/messages_members.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- =
gcc-4.6.0.orig/libstdc++-v3/config/locale/uclibc/messages_members.h
> -+++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/messages_members.h
> -@@ -53,12 +53,16 @@
> -   template<typename _CharT>
> -      messages<_CharT>::messages(__c_locale __cloc, const char* __s,
> - 				size_t __refs)
> --     : facet(__refs), =
_M_c_locale_messages(_S_clone_c_locale(__cloc)),
> --     _M_name_messages(__s)
> -+     : facet(__refs), _M_c_locale_messages(NULL),
> -+     _M_name_messages(NULL)
> -      {
> --       char* __tmp =3D new char[std::strlen(__s) + 1];
> --       std::strcpy(__tmp, __s);
> -+       const size_t __len =3D std::strlen(__s) + 1;
> -+       char* __tmp =3D new char[__len];
> -+       std::memcpy(__tmp, __s, __len);
> -        _M_name_messages =3D __tmp;
> -+
> -+       // Last to avoid leaking memory if new throws.
> -+       _M_c_locale_messages =3D _S_clone_c_locale(__cloc);
> -      }
> -=20
> -   template<typename _CharT>
> -Index: =
gcc-4.6.0/libstdc++-v3/config/locale/uclibc/monetary_members.cc
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- =
gcc-4.6.0.orig/libstdc++-v3/config/locale/uclibc/monetary_members.cc
> -+++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/monetary_members.cc
> -@@ -33,9 +33,14 @@
> -=20
> - // Written by Benjamin Kosnik <bkoz@redhat.com>
> -=20
> -+#include <features.h>
> -+#ifdef __UCLIBC_HAS_LOCALE__
> - #define _LIBC
> - #include <locale>
> - #undef _LIBC
> -+#else
> -+#include <locale>
> -+#endif
> - #include <bits/c++locale_internal.h>
> -=20
> - #ifdef __UCLIBC_MJN3_ONLY__
> -@@ -206,7 +211,7 @@ namespace std
> - 	  }
> - 	break;
> -       default:
> --	;
> -+	__ret =3D pattern();
> -       }
> -     return __ret;
> -   }
> -@@ -390,7 +395,9 @@ namespace std
> - 	  __c_locale __old =3D __uselocale(__cloc);
> - #else
> - 	  // Switch to named locale so that mbsrtowcs will work.
> --	  char* __old =3D strdup(setlocale(LC_ALL, NULL));
> -+  	  char* __old =3D setlocale(LC_ALL, NULL);
> -+          const size_t __llen =3D strlen(__old) + 1;
> -+          char* __sav =3D new char[__llen];
> - 	  setlocale(LC_ALL, __name);
> - #endif
> -=20
> -@@ -477,8 +484,8 @@ namespace std
> - #ifdef __UCLIBC_HAS_XLOCALE__
> - 	      __uselocale(__old);
> - #else
> --	      setlocale(LC_ALL, __old);
> --	      free(__old);
> -+	      setlocale(LC_ALL, __sav);
> -+	      delete [] __sav;
> - #endif
> - 	      __throw_exception_again;
> - 	    }
> -@@ -498,8 +505,8 @@ namespace std
> - #ifdef __UCLIBC_HAS_XLOCALE__
> - 	  __uselocale(__old);
> - #else
> --	  setlocale(LC_ALL, __old);
> --	  free(__old);
> -+	  setlocale(LC_ALL, __sav);
> -+	  delete [] __sav;
> - #endif
> - 	}
> -     }
> -@@ -545,8 +552,11 @@ namespace std
> - 	  __c_locale __old =3D __uselocale(__cloc);
> - #else
> - 	  // Switch to named locale so that mbsrtowcs will work.
> --	  char* __old =3D strdup(setlocale(LC_ALL, NULL));
> --	  setlocale(LC_ALL, __name);
> -+          char* __old =3D setlocale(LC_ALL, NULL);
> -+          const size_t __llen =3D strlen(__old) + 1;
> -+          char* __sav =3D new char[__llen];
> -+          memcpy(__sav, __old, __llen);
> -+          setlocale(LC_ALL, __name);
> - #endif
> -=20
> - #ifdef __UCLIBC_MJN3_ONLY__
> -@@ -633,8 +643,8 @@ namespace std
> - #ifdef __UCLIBC_HAS_XLOCALE__
> - 	      __uselocale(__old);
> - #else
> --	      setlocale(LC_ALL, __old);
> --	      free(__old);
> -+	      setlocale(LC_ALL, __sav);
> -+	      delete [] __sav;
> - #endif
> -               __throw_exception_again;
> - 	    }
> -@@ -653,8 +663,8 @@ namespace std
> - #ifdef __UCLIBC_HAS_XLOCALE__
> - 	  __uselocale(__old);
> - #else
> --	  setlocale(LC_ALL, __old);
> --	  free(__old);
> -+	  setlocale(LC_ALL, __sav);
> -+	  delete [] __sav;
> - #endif
> - 	}
> -     }
> -Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/numeric_members.cc
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- =
gcc-4.6.0.orig/libstdc++-v3/config/locale/uclibc/numeric_members.cc
> -+++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/numeric_members.cc
> -@@ -33,9 +33,14 @@
> -=20
> - // Written by Benjamin Kosnik <bkoz@redhat.com>
> -=20
> -+#include <features.h>
> -+#ifdef __UCLIBC_HAS_LOCALE__
> - #define _LIBC
> - #include <locale>
> - #undef _LIBC
> -+#else
> -+#include <locale>
> -+#endif
> - #include <bits/c++locale_internal.h>
> -=20
> - #ifdef __UCLIBC_MJN3_ONLY__
> -Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/time_members.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.6.0.orig/libstdc++-v3/config/locale/uclibc/time_members.h
> -+++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/time_members.h
> -@@ -50,12 +50,21 @@
> -     __timepunct<_CharT>::__timepunct(__c_locale __cloc, const char* =
__s,
> - 				     size_t __refs)
> -     : facet(__refs), _M_data(NULL), _M_c_locale_timepunct(NULL),
> --    _M_name_timepunct(__s)
> -+    _M_name_timepunct(NULL)
> -     {
> --      char* __tmp =3D new char[std::strlen(__s) + 1];
> --      std::strcpy(__tmp, __s);
> -+      const size_t __len =3D std::strlen(__s) + 1;
> -+      char* __tmp =3D new char[__len];
> -+      std::memcpy(__tmp, __s, __len);
> -       _M_name_timepunct =3D __tmp;
> --      _M_initialize_timepunct(__cloc);
> -+
> -+      try
> -+	{ _M_initialize_timepunct(__cloc); }
> -+      catch(...)
> -+	{
> -+	  delete [] _M_name_timepunct;
> -+	  __throw_exception_again;
> -+	}
> -+
> -     }
> -=20
> -   template<typename _CharT>
> -Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/c_locale.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.6.0.orig/libstdc++-v3/config/locale/uclibc/c_locale.h
> -+++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/c_locale.h
> -@@ -39,21 +39,23 @@
> - #pragma GCC system_header
> -=20
> - #include <cstring>              // get std::strlen
> --#include <cstdio>               // get std::snprintf or std::sprintf
> -+#include <cstdio>               // get std::vsnprintf or =
std::vsprintf
> - #include <clocale>
> - #include <langinfo.h>		// For codecvt
> - #ifdef __UCLIBC_MJN3_ONLY__
> - #warning fix this
> - #endif
> --#ifdef __UCLIBC_HAS_LOCALE__
> -+#ifdef _GLIBCXX_USE_ICONV
> - #include <iconv.h>		// For codecvt using iconv, iconv_t
> - #endif
> --#ifdef __UCLIBC_HAS_GETTEXT_AWARENESS__
> --#include <libintl.h> 		// For messages
> -+#ifdef HAVE_LIBINTL_H
> -+#include <libintl.h>		// For messages
> - #endif
> -+#include <cstdarg>
> -=20
> - #ifdef __UCLIBC_MJN3_ONLY__
> - #warning what is _GLIBCXX_C_LOCALE_GNU for
> -+// psm: used in os/gnu-linux/ctype_noninline.h
> - #endif
> - #define _GLIBCXX_C_LOCALE_GNU 1
> -=20
> -@@ -78,23 +80,25 @@ namespace std
> - #else
> -   typedef int*			__c_locale;
> - #endif
> --
> --  // Convert numeric value of type _Tv to string and return length =
of
> --  // string.  If snprintf is available use it, otherwise fall back =
to
> --  // the unsafe sprintf which, in general, can be dangerous and =
should
> -+  // Convert numeric value of type double to string and return =
length of
> -+  // string.  If vsnprintf is available use it, otherwise fall back =
to
> -+  // the unsafe vsprintf which, in general, can be dangerous and =
should
> -   // be avoided.
> --  template<typename _Tv>
> --    int
> --    __convert_from_v(char* __out,
> --		     const int __size __attribute__ ((__unused__)),
> --		     const char* __fmt,
> --#ifdef __UCLIBC_HAS_XCLOCALE__
> --		     _Tv __v, const __c_locale& __cloc, int __prec)
> -+    inline int
> -+    __convert_from_v(const __c_locale&
> -+#ifndef __UCLIBC_HAS_XCLOCALE__
> -+	__cloc __attribute__ ((__unused__))
> -+#endif
> -+		     ,
> -+		     char* __out,
> -+		     const int __size,
> -+		     const char* __fmt, ...)
> -     {
> -+      va_list __args;
> -+#ifdef __UCLIBC_HAS_XCLOCALE__
> -+
> -       __c_locale __old =3D __gnu_cxx::__uselocale(__cloc);
> - #else
> --		     _Tv __v, const __c_locale&, int __prec)
> --    {
> - # ifdef __UCLIBC_HAS_LOCALE__
> -       char* __old =3D std::setlocale(LC_ALL, NULL);
> -       char* __sav =3D new char[std::strlen(__old) + 1];
> -@@ -103,7 +107,9 @@ namespace std
> - # endif
> - #endif
> -=20
> --      const int __ret =3D std::snprintf(__out, __size, __fmt, =
__prec, __v);
> -+      va_start(__args, __fmt);
> -+      const int __ret =3D std::vsnprintf(__out, __size, __fmt, =
__args);
> -+      va_end(__args);
> -=20
> - #ifdef __UCLIBC_HAS_XCLOCALE__
> -       __gnu_cxx::__uselocale(__old);
> -Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/time_members.cc
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.6.0.orig/libstdc++-v3/config/locale/uclibc/time_members.cc
> -+++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/time_members.cc
> -@@ -53,11 +53,14 @@ namespace std
> -       const size_t __len =3D __strftime_l(__s, __maxlen, __format, =
__tm,
> - 					_M_c_locale_timepunct);
> - #else
> --      char* __old =3D strdup(setlocale(LC_ALL, NULL));
> -+      char* __old =3D setlocale(LC_ALL, NULL);
> -+      const size_t __llen =3D strlen(__old) + 1;
> -+      char* __sav =3D new char[__llen];
> -+      memcpy(__sav, __old, __llen);
> -       setlocale(LC_ALL, _M_name_timepunct);
> -       const size_t __len =3D strftime(__s, __maxlen, __format, =
__tm);
> --      setlocale(LC_ALL, __old);
> --      free(__old);
> -+      setlocale(LC_ALL, __sav);
> -+      delete [] __sav;
> - #endif
> -       // Make sure __s is null terminated.
> -       if (__len =3D=3D 0)
> -@@ -207,11 +210,14 @@ namespace std
> -       const size_t __len =3D __wcsftime_l(__s, __maxlen, __format, =
__tm,
> - 					_M_c_locale_timepunct);
> - #else
> --      char* __old =3D strdup(setlocale(LC_ALL, NULL));
> -+      char* __old =3D setlocale(LC_ALL, NULL);
> -+      const size_t __llen =3D strlen(__old) + 1;
> -+      char* __sav =3D new char[__llen];
> -+      memcpy(__sav, __old, __llen);
> -       setlocale(LC_ALL, _M_name_timepunct);
> -       const size_t __len =3D wcsftime(__s, __maxlen, __format, =
__tm);
> --      setlocale(LC_ALL, __old);
> --      free(__old);
> -+      setlocale(LC_ALL, __sav);
> -+      delete [] __sav;
> - #endif
> -       // Make sure __s is null terminated.
> -       if (__len =3D=3D 0)
> -Index: =
gcc-4.6.0/libstdc++-v3/config/locale/uclibc/c++locale_internal.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- =
gcc-4.6.0.orig/libstdc++-v3/config/locale/uclibc/c++locale_internal.h
> -+++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/c++locale_internal.h
> -@@ -31,6 +31,9 @@
> -=20
> - #include <bits/c++config.h>
> - #include <clocale>
> -+#include <cstdlib>
> -+#include <cstring>
> -+#include <cstddef>
> -=20
> - #ifdef __UCLIBC_MJN3_ONLY__
> - #warning clean this up
> diff --git =
a/meta/recipes-devtools/gcc/gcc-4.8/301-missing-execinfo_h.patch =
b/meta/recipes-devtools/gcc/gcc-4.8/301-missing-execinfo_h.patch
> deleted file mode 100644
> index 9589822..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.8/301-missing-execinfo_h.patch
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -Upstream-Status: Pending
> -
> -Index: gcc-4.6.0/boehm-gc/include/gc.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.6.0.orig/boehm-gc/include/gc.h
> -+++ gcc-4.6.0/boehm-gc/include/gc.h
> -@@ -503,7 +503,7 @@ GC_API GC_PTR GC_malloc_atomic_ignore_of
> - #if defined(__linux__) || defined(__GLIBC__)
> - # include <features.h>
> - # if (__GLIBC__ =3D=3D 2 && __GLIBC_MINOR__ >=3D 1 || __GLIBC__ > 2) =
\
> --     && !defined(__ia64__)
> -+     && !defined(__ia64__) && !defined(__UCLIBC__)
> - #   ifndef GC_HAVE_BUILTIN_BACKTRACE
> - #     define GC_HAVE_BUILTIN_BACKTRACE
> - #   endif
> diff --git a/meta/recipes-devtools/gcc/gcc-4.8/302-c99-snprintf.patch =
b/meta/recipes-devtools/gcc/gcc-4.8/302-c99-snprintf.patch
> deleted file mode 100644
> index 9becc15..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.8/302-c99-snprintf.patch
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -Upstream-Status: Pending
> -
> -Index: gcc-4_7-branch/libstdc++-v3/include/c_std/cstdio
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4_7-branch.orig/libstdc++-v3/include/c_std/cstdio	=
2012-04-10 10:19:49.603337089 -0700
> -+++ gcc-4_7-branch/libstdc++-v3/include/c_std/cstdio	2012-04-10 =
10:30:59.863369565 -0700
> -@@ -140,7 +140,7 @@
> -   using ::vsprintf;
> - } // namespace std
> -=20
> --#if _GLIBCXX_USE_C99
> -+#if _GLIBCXX_USE_C99 || defined(__UCLIBC__)
> -=20
> - #undef snprintf
> - #undef vfscanf
> diff --git =
a/meta/recipes-devtools/gcc/gcc-4.8/303-c99-complex-ugly-hack.patch =
b/meta/recipes-devtools/gcc/gcc-4.8/303-c99-complex-ugly-hack.patch
> deleted file mode 100644
> index d69c546..0000000
> --- =
a/meta/recipes-devtools/gcc/gcc-4.8/303-c99-complex-ugly-hack.patch
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -Upstream-Status: Inappropriate [embedded specific]
> -
> -Index: gcc-4_7-branch/libstdc++-v3/configure
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4_7-branch.orig/libstdc++-v3/configure	2012-04-10 =
10:30:37.347368481 -0700
> -+++ gcc-4_7-branch/libstdc++-v3/configure	2012-04-10 =
10:31:22.787370652 -0700
> -@@ -18767,6 +18767,9 @@
> -     cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> - /* end confdefs.h.  */
> - #include <complex.h>
> -+#ifdef __UCLIBC__
> -+#error ugly hack to make sure configure test fails here for cross =
until uClibc supports the complex funcs
> -+#endif
> - int
> - main ()
> - {
> diff --git a/meta/recipes-devtools/gcc/gcc-4.8/304-index_macro.patch =
b/meta/recipes-devtools/gcc/gcc-4.8/304-index_macro.patch
> deleted file mode 100644
> index f103765..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.8/304-index_macro.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -Upstream-Status: Pending
> -
> -Index: gcc-4.6.0/libstdc++-v3/include/ext/rope
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.6.0.orig/libstdc++-v3/include/ext/rope
> -+++ gcc-4.6.0/libstdc++-v3/include/ext/rope
> -@@ -54,6 +54,9 @@
> - #include <bits/gthr.h>
> - #include <tr1/functional>
> -=20
> -+/* cope w/ index defined as macro, SuSv3 proposal */
> -+#undef index
> -+
> - # ifdef __GC
> - #   define __GC_CONST const
> - # else
> -Index: gcc-4.6.0/libstdc++-v3/include/ext/ropeimpl.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.6.0.orig/libstdc++-v3/include/ext/ropeimpl.h
> -+++ gcc-4.6.0/libstdc++-v3/include/ext/ropeimpl.h
> -@@ -49,6 +49,9 @@
> - #include <ext/memory> // For uninitialized_copy_n
> - #include <ext/numeric> // For power
> -=20
> -+/* cope w/ index defined as macro, SuSv3 proposal */
> -+#undef index
> -+
> - namespace __gnu_cxx _GLIBCXX_VISIBILITY(default)
> - {
> - _GLIBCXX_BEGIN_NAMESPACE_VERSION
> diff --git =
a/meta/recipes-devtools/gcc/gcc-4.8/305-libmudflap-susv3-legacy.patch =
b/meta/recipes-devtools/gcc/gcc-4.8/305-libmudflap-susv3-legacy.patch
> deleted file mode 100644
> index 10d09a7..0000000
> --- =
a/meta/recipes-devtools/gcc/gcc-4.8/305-libmudflap-susv3-legacy.patch
> +++ /dev/null
> @@ -1,51 +0,0 @@
> -Upstream-Status: Inappropriate [embedded specific]
> -
> -Index: gcc-4_7-branch/libmudflap/mf-hooks2.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4_7-branch.orig/libmudflap/mf-hooks2.c	2012-04-10 =
10:19:49.391337079 -0700
> -+++ gcc-4_7-branch/libmudflap/mf-hooks2.c	2012-04-10 =
10:31:53.191372119 -0700
> -@@ -424,7 +424,7 @@
> - {
> -   TRACE ("%s\n", __PRETTY_FUNCTION__);
> -   MF_VALIDATE_EXTENT(s, n, __MF_CHECK_WRITE, "bzero region");
> --  bzero (s, n);
> -+  memset (s, 0, n);
> - }
> -=20
> -=20
> -@@ -434,7 +434,7 @@
> -   TRACE ("%s\n", __PRETTY_FUNCTION__);
> -   MF_VALIDATE_EXTENT(src, n, __MF_CHECK_READ, "bcopy src");
> -   MF_VALIDATE_EXTENT(dest, n, __MF_CHECK_WRITE, "bcopy dest");
> --  bcopy (src, dest, n);
> -+  memmove (dest, src, n);
> - }
> -=20
> -=20
> -@@ -444,7 +444,7 @@
> -   TRACE ("%s\n", __PRETTY_FUNCTION__);
> -   MF_VALIDATE_EXTENT(s1, n, __MF_CHECK_READ, "bcmp 1st arg");
> -   MF_VALIDATE_EXTENT(s2, n, __MF_CHECK_READ, "bcmp 2nd arg");
> --  return bcmp (s1, s2, n);
> -+  return n =3D=3D 0 ? 0 : memcmp (s1, s2, n);
> - }
> -=20
> -=20
> -@@ -453,7 +453,7 @@
> -   size_t n =3D strlen (s);
> -   TRACE ("%s\n", __PRETTY_FUNCTION__);
> -   MF_VALIDATE_EXTENT(s, CLAMPADD(n, 1), __MF_CHECK_READ, "index =
region");
> --  return index (s, c);
> -+  return strchr (s, c);
> - }
> -=20
> -=20
> -@@ -462,7 +462,7 @@
> -   size_t n =3D strlen (s);
> -   TRACE ("%s\n", __PRETTY_FUNCTION__);
> -   MF_VALIDATE_EXTENT(s, CLAMPADD(n, 1), __MF_CHECK_READ, "rindex =
region");
> --  return rindex (s, c);
> -+  return strrchr (s, c);
> - }
> -=20
> - /* XXX:  stpcpy, memccpy */
> diff --git =
a/meta/recipes-devtools/gcc/gcc-4.8/306-libstdc++-namespace.patch =
b/meta/recipes-devtools/gcc/gcc-4.8/306-libstdc++-namespace.patch
> deleted file mode 100644
> index e99bf96..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.8/306-libstdc++-namespace.patch
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -Upstream-Status: Pending
> -
> -Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/messages_members.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- =
gcc-4.6.0.orig/libstdc++-v3/config/locale/uclibc/messages_members.h
> -+++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/messages_members.h
> -@@ -32,7 +32,8 @@
> - //
> -=20
> - // Written by Benjamin Kosnik <bkoz@redhat.com>
> --
> -+namespace std
> -+{
> - #ifdef __UCLIBC_MJN3_ONLY__
> - #warning fix prototypes for *textdomain funcs
> - #endif
> -@@ -116,3 +117,4 @@
> - 	   this->_S_create_c_locale(this->_M_c_locale_messages, __s);
> - 	 }
> -      }
> -+}
> -Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/time_members.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.6.0.orig/libstdc++-v3/config/locale/uclibc/time_members.h
> -+++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/time_members.h
> -@@ -33,7 +33,8 @@
> - //
> -=20
> - // Written by Benjamin Kosnik <bkoz@redhat.com>
> --
> -+namespace std
> -+{
> -   template<typename _CharT>
> -     __timepunct<_CharT>::__timepunct(size_t __refs)
> -     : facet(__refs), _M_data(NULL), _M_c_locale_timepunct(NULL),
> -@@ -75,3 +76,4 @@
> -       delete _M_data;
> -       _S_destroy_c_locale(_M_c_locale_timepunct);
> -     }
> -+}
> diff --git a/meta/recipes-devtools/gcc/gcc-4.8/64bithack.patch =
b/meta/recipes-devtools/gcc/gcc-4.8/64bithack.patch
> deleted file mode 100644
> index f10df4a..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.8/64bithack.patch
> +++ /dev/null
> @@ -1,66 +0,0 @@
> -Upstream-Status: Inappropriate [embedded specific]
> -
> -GCC has internal multilib handling code but it assumes a very =
specific rigid directory
> -layout. The build system implementation of multilib layout is very =
generic and allows
> -complete customisation of the library directories.
> -
> -This patch is a partial solution to allow any custom directories to =
be passed into gcc
> -and handled correctly. It forces gcc to use the base_libdir (which is =
the current=20
> -directory, "."). We need to do this for each multilib that is =
configured as we don't
> -know which compiler options may be being passed into the compiler. =
Since we have a compiler
> -per mulitlib at this point that isn't an issue.
> -
> -The one problem is the target compiler is only going to work for the =
default multlilib at
> -this point. Ideally we'd figure out which multilibs were being =
enabled with which paths
> -and be able to patch these entries with a complete set of correct =
paths but this we
> -don't have such code at this point. This is something the target gcc =
recipe should do=20
> -and override these platform defaults in its build config.
> -
> -RP 15/8/11
> -
> -Index: gcc-4.8.0/gcc/config/i386/t-linux64
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.8.0.orig/gcc/config/i386/t-linux64	2013-01-10 =
12:38:27.000000000 -0800
> -+++ gcc-4.8.0/gcc/config/i386/t-linux64	2013-03-26 =
11:59:28.381766975 -0700
> -@@ -32,7 +32,5 @@
> - #
> - comma=3D,
> - MULTILIB_OPTIONS    =3D $(subst $(comma),/,$(TM_MULTILIB_CONFIG))
> --MULTILIB_DIRNAMES   =3D $(patsubst m%, %, $(subst /, =
,$(MULTILIB_OPTIONS)))
> --MULTILIB_OSDIRNAMES =3D m64=3D../lib64$(call =
if_multiarch,:x86_64-linux-gnu)
> --MULTILIB_OSDIRNAMES+=3D m32=3D$(if $(wildcard $(shell echo =
$(SYSTEM_HEADER_DIR))/../../usr/lib32),../lib32,../lib)$(call =
if_multiarch,:i386-linux-gnu)
> --MULTILIB_OSDIRNAMES+=3D mx32=3D../libx32$(call =
if_multiarch,:x86_64-linux-gnux32)
> -+MULTILIB_DIRNAMES =3D . .
> -+MULTILIB_OSDIRNAMES =3D ../$(shell basename $(base_libdir)) =
../$(shell basename $(base_libdir))
> -Index: gcc-4.8.0/gcc/config/mips/t-linux64
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.8.0.orig/gcc/config/mips/t-linux64	2013-01-10 =
12:38:27.000000000 -0800
> -+++ gcc-4.8.0/gcc/config/mips/t-linux64	2013-03-26 =
12:00:56.973768645 -0700
> -@@ -17,10 +17,6 @@
> - # <http://www.gnu.org/licenses/>.
> -=20
> - MULTILIB_OPTIONS =3D mabi=3Dn32/mabi=3D32/mabi=3D64
> --MULTILIB_DIRNAMES =3D n32 32 64
> --MIPS_EL =3D $(if $(filter %el, $(firstword $(subst -, =
,$(target)))),el)
> --MIPS_SOFT =3D $(if $(strip $(filter MASK_SOFT_FLOAT_ABI, =
$(target_cpu_default)) $(filter soft, $(with_float))),soft)
> --MULTILIB_OSDIRNAMES =3D \
> --	../lib32$(call =
if_multiarch,:mips64$(MIPS_EL)-linux-gnuabin32$(MIPS_SOFT)) \
> --	../lib$(call if_multiarch,:mips$(MIPS_EL)-linux-gnu$(MIPS_SOFT)) =
\
> --	../lib64$(call =
if_multiarch,:mips64$(MIPS_EL)-linux-gnuabi64$(MIPS_SOFT))
> -+MULTILIB_DIRNAMES =3D . . .
> -+MULTILIB_OSDIRNAMES =3D ../$(shell basename $(base_libdir)) =
../$(shell basename $(base_libdir)) ../$(shell basename $(base_libdir))
> -+
> -Index: gcc-4.8.0/gcc/config/rs6000/t-linux64
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.8.0.orig/gcc/config/rs6000/t-linux64	2013-01-10 =
12:38:27.000000000 -0800
> -+++ gcc-4.8.0/gcc/config/rs6000/t-linux64	2013-03-26 =
12:04:10.885772283 -0700
> -@@ -26,7 +26,6 @@
> - # MULTILIB_OSDIRNAMES according to what is found on the target.
> -=20
> - MULTILIB_OPTIONS        =3D m64/m32
> --MULTILIB_DIRNAMES       =3D 64 32
> -+MULTILIB_DIRNAMES       =3D . .
> - MULTILIB_EXTRA_OPTS     =3D fPIC
> --MULTILIB_OSDIRNAMES	=3D ../lib64$(call =
if_multiarch,:powerpc64-linux-gnu)
> --MULTILIB_OSDIRNAMES    +=3D $(if $(wildcard $(shell echo =
$(SYSTEM_HEADER_DIR))/../../usr/lib32),../lib32,../lib)$(call =
if_multiarch,:powerpc-linux-gnu)
> -+MULTILIB_OSDIRNAMES    =3D ../$(shell basename $(base_libdir)) =
../$(shell basename $(base_libdir))
> diff --git a/meta/recipes-devtools/gcc/gcc-4.8/740-sh-pr24836.patch =
b/meta/recipes-devtools/gcc/gcc-4.8/740-sh-pr24836.patch
> deleted file mode 100644
> index 1406f87..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.8/740-sh-pr24836.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -Upstream-Status: Pending
> -
> =
-http://sourceforge.net/mailarchive/forum.php?thread_id=3D8959304&forum_id=
=3D5348
> -http://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D24836
> -
> -Index: gcc-4_7-branch/gcc/configure.ac
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4_7-branch.orig/gcc/configure.ac	2012-04-10 =
10:22:05.787343661 -0700
> -+++ gcc-4_7-branch/gcc/configure.ac	2012-04-10 10:32:18.415373343 =
-0700
> -@@ -3065,7 +3065,7 @@
> - 	tls_first_minor=3D14
> - 	tls_as_opt=3D"-m64 -Aesame --fatal-warnings"
> - 	;;
> --  sh-*-* | sh[34]-*-*)
> -+  sh-*-* | sh[34]*-*-*)
> -     conftest_s=3D'
> - 	.section ".tdata","awT",@progbits
> - foo:	.long	25
> -Index: gcc-4_7-branch/gcc/configure
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4_7-branch.orig/gcc/configure	2012-04-10 =
10:22:05.803343691 -0700
> -+++ gcc-4_7-branch/gcc/configure	2012-04-10 10:32:18.419373328 =
-0700
> -@@ -23481,7 +23481,7 @@
> - 	tls_first_minor=3D14
> - 	tls_as_opt=3D"-m64 -Aesame --fatal-warnings"
> - 	;;
> --  sh-*-* | sh[34]-*-*)
> -+  sh-*-* | sh[34]*-*-*)
> -     conftest_s=3D'
> - 	.section ".tdata","awT",@progbits
> - foo:	.long	25
> diff --git a/meta/recipes-devtools/gcc/gcc-4.8/800-arm-bigendian.patch =
b/meta/recipes-devtools/gcc/gcc-4.8/800-arm-bigendian.patch
> deleted file mode 100644
> index 16b2307..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.8/800-arm-bigendian.patch
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -Upstream-Status: Pending
> -
> -By Lennert Buytenhek <buytenh@wantstofly.org>
> -Adds support for arm*b-linux* big-endian ARM targets
> -
> -See http://gcc.gnu.org/PR16350
> -
> -Index: gcc-4.8.0/gcc/config/arm/linux-elf.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.8.0.orig/gcc/config/arm/linux-elf.h	2013-03-26 =
11:38:59.000000000 -0700
> -+++ gcc-4.8.0/gcc/config/arm/linux-elf.h	2013-03-26 =
11:40:03.277745106 -0700
> -@@ -46,7 +46,7 @@
> -=20
> - #undef  MULTILIB_DEFAULTS
> - #define MULTILIB_DEFAULTS \
> --	{ "marm", "mlittle-endian", "mfloat-abi=3Dhard", =
"mno-thumb-interwork" }
> -+	{ "marm", TARGET_ENDIAN_OPTION, "mfloat-abi=3Dhard", =
"mno-thumb-interwork" }
> -=20
> - /* Now we define the strings used to build the spec file.  */
> - #undef  LIB_SPEC
> diff --git =
a/meta/recipes-devtools/gcc/gcc-4.8/COLLECT_GCC_OPTIONS.patch =
b/meta/recipes-devtools/gcc/gcc-4.8/COLLECT_GCC_OPTIONS.patch
> deleted file mode 100644
> index f598298..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.8/COLLECT_GCC_OPTIONS.patch
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -Upstream-Status: Pending
> -
> -#This patck added --sysroot into COLLECT_GCC_OPTIONS which is used to
> -#invoke collect2.
> -
> -Index: gcc-4_7-branch/gcc/gcc.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4_7-branch.orig/gcc/gcc.c	2012-04-10 10:37:49.487389409 =
-0700
> -+++ gcc-4_7-branch/gcc/gcc.c	2012-04-10 10:38:50.831392259 -0700
> -@@ -3995,6 +3995,15 @@
> - 		sizeof ("COLLECT_GCC_OPTIONS=3D") - 1);
> -=20
> -   first_time =3D TRUE;
> -+#ifdef HAVE_LD_SYSROOT
> -+  if (target_system_root_changed && target_system_root)
> -+    {
> -+      obstack_grow (&collect_obstack, "'--sysroot=3D", =
sizeof("'--sysroot=3D")-1);
> -+      obstack_grow (&collect_obstack, =
target_system_root,strlen(target_system_root));
> -+      obstack_grow (&collect_obstack, "'", 1);
> -+      first_time =3D FALSE;
> -+    }
> -+#endif
> -   for (i =3D 0; (int) i < n_switches; i++)
> -     {
> -       const char *const *args;
> diff --git =
a/meta/recipes-devtools/gcc/gcc-4.8/GLIBC_DYNAMIC_LINKER.patch =
b/meta/recipes-devtools/gcc/gcc-4.8/GLIBC_DYNAMIC_LINKER.patch
> deleted file mode 100644
> index 180b239..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.8/GLIBC_DYNAMIC_LINKER.patch
> +++ /dev/null
> @@ -1,167 +0,0 @@
> -This patch defines GLIBC_DYNAMIC_LINKER and UCLIBC_DYNAMIC_LINKER
> -relative to SYSTEMLIBS_DIR which can be set in generated headers
> -This breaks the assumption of hardcoded multilib in gcc
> -Change is only for the supported architectures in OE including
> -SH, spart, alpha for possible future support (if any)
> -
> -Removes the do_headerfix task in metadata
> -
> -Signed-off-by: Khem Raj
> -Upstream-Status: Inappropriate [OE configuration]
> -
> -Index: gcc-4.8.0/gcc/config/alpha/linux-elf.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.8.0.orig/gcc/config/alpha/linux-elf.h	2013-01-10 =
12:38:27.000000000 -0800
> -+++ gcc-4.8.0/gcc/config/alpha/linux-elf.h	2013-03-26 =
13:55:08.825897207 -0700
> -@@ -23,8 +23,8 @@
> - #define EXTRA_SPECS \
> - { "elf_dynamic_linker", ELF_DYNAMIC_LINKER },
> -=20
> --#define GLIBC_DYNAMIC_LINKER	"/lib/ld-linux.so.2"
> --#define UCLIBC_DYNAMIC_LINKER "/lib/ld-uClibc.so.0"
> -+#define GLIBC_DYNAMIC_LINKER	SYSTEMLIBS_DIR "ld-linux.so.2"
> -+#define UCLIBC_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-uClibc.so.0"
> - #if DEFAULT_LIBC =3D=3D LIBC_UCLIBC
> - #define CHOOSE_DYNAMIC_LINKER(G, U) "%{mglibc:" G ";:" U "}"
> - #elif DEFAULT_LIBC =3D=3D LIBC_GLIBC
> -Index: gcc-4.8.0/gcc/config/arm/linux-eabi.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.8.0.orig/gcc/config/arm/linux-eabi.h	2013-01-10 =
12:38:27.000000000 -0800
> -+++ gcc-4.8.0/gcc/config/arm/linux-eabi.h	2013-03-26 =
13:56:14.901898372 -0700
> -@@ -68,8 +68,8 @@
> -    GLIBC_DYNAMIC_LINKER_DEFAULT and TARGET_DEFAULT_FLOAT_ABI.  */
> -=20
> - #undef  GLIBC_DYNAMIC_LINKER
> --#define GLIBC_DYNAMIC_LINKER_SOFT_FLOAT "/lib/ld-linux.so.3"
> --#define GLIBC_DYNAMIC_LINKER_HARD_FLOAT "/lib/ld-linux-armhf.so.3"
> -+#define GLIBC_DYNAMIC_LINKER_SOFT_FLOAT SYSTEMLIBS_DIR =
"ld-linux.so.3"
> -+#define GLIBC_DYNAMIC_LINKER_HARD_FLOAT SYSTEMLIBS_DIR =
"ld-linux-armhf.so.3"
> - #define GLIBC_DYNAMIC_LINKER_DEFAULT GLIBC_DYNAMIC_LINKER_SOFT_FLOAT
> -=20
> - #define GLIBC_DYNAMIC_LINKER \
> -Index: gcc-4.8.0/gcc/config/arm/linux-elf.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.8.0.orig/gcc/config/arm/linux-elf.h	2013-03-26 =
13:54:13.000000000 -0700
> -+++ gcc-4.8.0/gcc/config/arm/linux-elf.h	2013-03-26 =
13:55:08.825897207 -0700
> -@@ -57,7 +57,7 @@
> -=20
> - #define LIBGCC_SPEC "%{mfloat-abi=3Dsoft*:-lfloat} -lgcc"
> -=20
> --#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
> -+#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux.so.2"
> -=20
> - #define LINUX_TARGET_LINK_SPEC  "%{h*} \
> -    %{static:-Bstatic} \
> -Index: gcc-4.8.0/gcc/config/i386/linux.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.8.0.orig/gcc/config/i386/linux.h	2013-01-10 =
12:38:27.000000000 -0800
> -+++ gcc-4.8.0/gcc/config/i386/linux.h	2013-03-26 =
13:55:08.825897207 -0700
> -@@ -20,4 +20,4 @@
> - <http://www.gnu.org/licenses/>.  */
> -=20
> - #define GNU_USER_LINK_EMULATION "elf_i386"
> --#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
> -+#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux.so.2"
> -Index: gcc-4.8.0/gcc/config/i386/linux64.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.8.0.orig/gcc/config/i386/linux64.h	2013-01-10 =
12:38:27.000000000 -0800
> -+++ gcc-4.8.0/gcc/config/i386/linux64.h	2013-03-26 =
13:55:08.825897207 -0700
> -@@ -27,6 +27,6 @@
> - #define GNU_USER_LINK_EMULATION64 "elf_x86_64"
> - #define GNU_USER_LINK_EMULATIONX32 "elf32_x86_64"
> -=20
> --#define GLIBC_DYNAMIC_LINKER32 "/lib/ld-linux.so.2"
> --#define GLIBC_DYNAMIC_LINKER64 "/lib64/ld-linux-x86-64.so.2"
> --#define GLIBC_DYNAMIC_LINKERX32 "/libx32/ld-linux-x32.so.2"
> -+#define GLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-linux.so.2"
> -+#define GLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld-linux-x86-64.so.2"
> -+#define GLIBC_DYNAMIC_LINKERX32 SYSTEMLIBS_DIR "ld-linux-x32.so.2"
> -Index: gcc-4.8.0/gcc/config/mips/linux.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.8.0.orig/gcc/config/mips/linux.h	2013-01-10 =
12:38:27.000000000 -0800
> -+++ gcc-4.8.0/gcc/config/mips/linux.h	2013-03-26 =
13:55:08.825897207 -0700
> -@@ -17,4 +17,4 @@
> - along with GCC; see the file COPYING3.  If not see
> - <http://www.gnu.org/licenses/>.  */
> -=20
> --#define GLIBC_DYNAMIC_LINKER "/lib/ld.so.1"
> -+#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld.so.1"
> -Index: gcc-4.8.0/gcc/config/mips/linux64.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.8.0.orig/gcc/config/mips/linux64.h	2013-01-10 =
12:38:27.000000000 -0800
> -+++ gcc-4.8.0/gcc/config/mips/linux64.h	2013-03-26 =
13:55:08.825897207 -0700
> -@@ -22,10 +22,10 @@
> - #define GNU_USER_LINK_EMULATION64 "elf64%{EB:b}%{EL:l}tsmip"
> - #define GNU_USER_LINK_EMULATIONN32 "elf32%{EB:b}%{EL:l}tsmipn32"
> -=20
> --#define GLIBC_DYNAMIC_LINKER32 "/lib/ld.so.1"
> --#define GLIBC_DYNAMIC_LINKER64 "/lib64/ld.so.1"
> --#define GLIBC_DYNAMIC_LINKERN32 "/lib32/ld.so.1"
> --#define UCLIBC_DYNAMIC_LINKERN32 "/lib32/ld-uClibc.so.0"
> -+#define GLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld.so.1"
> -+#define GLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld.so.1"
> -+#define GLIBC_DYNAMIC_LINKERN32 SYSTEMLIBS_DIR "ld.so.1"
> -+#define UCLIBC_DYNAMIC_LINKERN32 SYSTEMLIBS_DIR "ld-uClibc.so.0"
> - #define BIONIC_DYNAMIC_LINKERN32 "/system/bin/linker32"
> - #define GNU_USER_DYNAMIC_LINKERN32 \
> -   CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKERN32, =
UCLIBC_DYNAMIC_LINKERN32, \
> -Index: gcc-4.8.0/gcc/config/rs6000/linux64.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.8.0.orig/gcc/config/rs6000/linux64.h	2013-01-10 =
12:38:27.000000000 -0800
> -+++ gcc-4.8.0/gcc/config/rs6000/linux64.h	2013-03-26 =
13:55:08.825897207 -0700
> -@@ -360,10 +360,10 @@
> - #undef	LINK_OS_DEFAULT_SPEC
> - #define LINK_OS_DEFAULT_SPEC "%(link_os_linux)"
> -=20
> --#define GLIBC_DYNAMIC_LINKER32 "/lib/ld.so.1"
> --#define GLIBC_DYNAMIC_LINKER64 "/lib64/ld64.so.1"
> --#define UCLIBC_DYNAMIC_LINKER32 "/lib/ld-uClibc.so.0"
> --#define UCLIBC_DYNAMIC_LINKER64 "/lib/ld64-uClibc.so.0"
> -+#define GLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld.so.1"
> -+#define GLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld64.so.1"
> -+#define UCLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-uClibc.so.0"
> -+#define UCLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld64-uClibc.so.0"
> - #if DEFAULT_LIBC =3D=3D LIBC_UCLIBC
> - #define CHOOSE_DYNAMIC_LINKER(G, U) "%{mglibc:" G ";:" U "}"
> - #elif DEFAULT_LIBC =3D=3D LIBC_GLIBC
> -Index: gcc-4.8.0/gcc/config/sh/linux.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.8.0.orig/gcc/config/sh/linux.h	2013-03-13 =
20:01:53.000000000 -0700
> -+++ gcc-4.8.0/gcc/config/sh/linux.h	2013-03-26 13:55:08.829897236 =
-0700
> -@@ -43,7 +43,7 @@
> -=20
> - #define TARGET_ASM_FILE_END file_end_indicate_exec_stack
> -=20
> --#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
> -+#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux.so.2"
> -=20
> - #undef SUBTARGET_LINK_EMUL_SUFFIX
> - #define SUBTARGET_LINK_EMUL_SUFFIX "_linux"
> -Index: gcc-4.8.0/gcc/config/sparc/linux.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.8.0.orig/gcc/config/sparc/linux.h	2013-01-10 =
12:38:27.000000000 -0800
> -+++ gcc-4.8.0/gcc/config/sparc/linux.h	2013-03-26 =
13:55:08.829897236 -0700
> -@@ -83,7 +83,7 @@
> -    When the -shared link option is used a final link is not being
> -    done.  */
> -=20
> --#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
> -+#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux.so.2"
> -=20
> - #undef  LINK_SPEC
> - #define LINK_SPEC "-m elf32_sparc %{shared:-shared} \
> -Index: gcc-4.8.0/gcc/config/sparc/linux64.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.8.0.orig/gcc/config/sparc/linux64.h	2013-01-10 =
12:38:27.000000000 -0800
> -+++ gcc-4.8.0/gcc/config/sparc/linux64.h	2013-03-26 =
13:55:08.829897236 -0700
> -@@ -92,8 +92,8 @@
> -    When the -shared link option is used a final link is not being
> -    done.  */
> -=20
> --#define GLIBC_DYNAMIC_LINKER32 "/lib/ld-linux.so.2"
> --#define GLIBC_DYNAMIC_LINKER64 "/lib64/ld-linux.so.2"
> -+#define GLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-linux.so.2"
> -+#define GLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld-linux.so.2"
> -=20
> - #ifdef SPARC_BI_ARCH
> -=20
> diff --git a/meta/recipes-devtools/gcc/gcc-4.8/cpp-honor-sysroot.patch =
b/meta/recipes-devtools/gcc/gcc-4.8/cpp-honor-sysroot.patch
> deleted file mode 100644
> index 7310677..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.8/cpp-honor-sysroot.patch
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -Currently, if the gcc toolchain is relocated and installed from =
sstate, then you try and compile
> -preprocessed source (.i or .ii files), the compiler will try and =
access the builtin sysroot location=20
> -rather than the --sysroot option specified on the commandline. If =
access to that directory is=20
> -permission denied (unreadable), gcc will error.
> -
> -This happens when ccache is in use due to the fact it uses =
preprocessed source files.
> -
> -The fix below adds %I to the cpp-output spec macro so the default =
substitutions for -iprefix,=20
> --isystem, -isysroot happen and the correct sysroot is used.
> -
> -[YOCTO #2074]
> -
> -Upstream-Status: Pending
> -
> -RP 2012/04/13
> -
> -Index: gcc-4_6-branch/gcc/gcc.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4_6-branch.orig/gcc/gcc.c	2012-04-13 12:24:37.939671140 =
+0000
> -+++ gcc-4_6-branch/gcc/gcc.c	2012-04-13 12:24:54.439670688 +0000
> -@@ -953,7 +953,7 @@
> -                     %W{o*:--output-pch=3D%*}}%V}}}}}}", 0, 0, 0},
> -   {".i", "@cpp-output", 0, 0, 0},
> -   {"@cpp-output",
> --   "%{!M:%{!MM:%{!E:cc1 -fpreprocessed %i %(cc1_options) =
%{!fsyntax-only:%(invoke_as)}}}}", 0, 0, 0},
> -+   "%{!M:%{!MM:%{!E:cc1 -fpreprocessed %i %I %(cc1_options) =
%{!fsyntax-only:%(invoke_as)}}}}", 0, 0, 0},
> -   {".s", "@assembler", 0, 0, 0},
> -   {"@assembler",
> -    "%{!M:%{!MM:%{!E:%{!S:as %(asm_debug) %(asm_options) %i %A }}}}", =
0, 0, 0},
> -Index: gcc-4_6-branch/gcc/cp/lang-specs.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4_6-branch.orig/gcc/cp/lang-specs.h	2012-04-13 =
12:25:01.019670594 +0000
> -+++ gcc-4_6-branch/gcc/cp/lang-specs.h	2012-04-13 =
12:25:07.567670180 +0000
> -@@ -64,5 +64,5 @@
> -   {".ii", "@c++-cpp-output", 0, 0, 0},
> -   {"@c++-cpp-output",
> -    "%{!M:%{!MM:%{!E:\
> --    cc1plus -fpreprocessed %i %(cc1_options) %2\
> -+    cc1plus -fpreprocessed %i %I %(cc1_options) %2\
> -     %{!fsyntax-only:%(invoke_as)}}}}", 0, 0, 0},
> diff --git =
a/meta/recipes-devtools/gcc/gcc-4.8/disable_relax_pic_calls_flag.patch =
b/meta/recipes-devtools/gcc/gcc-4.8/disable_relax_pic_calls_flag.patch
> deleted file mode 100644
> index bc01cd9..0000000
> --- =
a/meta/recipes-devtools/gcc/gcc-4.8/disable_relax_pic_calls_flag.patch
> +++ /dev/null
> @@ -1,48 +0,0 @@
> -Upstream-Status: Inappropriate [configuration]
> -
> -GCC: disable MASK_RELAX_PIC_CALLS bit
> -
> -The new feature added after 4.3.3
> =
-"http://www.pubbs.net/200909/gcc/94048-patch-add-support-for-rmipsjalr.ht=
ml"
> -will cause cc1plus eat up all the system memory when build =
webkit-gtk.
> -The function mips_get_pic_call_symbol keeps on recursively calling =
itself.
> -Disable this feature to walk aside the bug.
> -
> -Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
> -
> -Index: gcc-4_7-branch/gcc/configure
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4_7-branch.orig/gcc/configure	2012-04-10 =
10:37:09.351387437 -0700
> -+++ gcc-4_7-branch/gcc/configure	2012-04-10 10:37:57.211389779 =
-0700
> -@@ -25837,13 +25837,6 @@
> -         rm -f conftest.*
> -       fi
> -     fi
> --    if test $gcc_cv_as_ld_jalr_reloc =3D yes; then
> --      if test x$target_cpu_default =3D x; then
> --        target_cpu_default=3DMASK_RELAX_PIC_CALLS
> --      else
> --        =
target_cpu_default=3D"($target_cpu_default)|MASK_RELAX_PIC_CALLS"
> --      fi
> --    fi
> -     { $as_echo "$as_me:${as_lineno-$LINENO}: result: =
$gcc_cv_as_ld_jalr_reloc" >&5
> - $as_echo "$gcc_cv_as_ld_jalr_reloc" >&6; }
> -=20
> -Index: gcc-4_7-branch/gcc/configure.ac
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4_7-branch.orig/gcc/configure.ac	2012-04-10 =
10:37:09.339387366 -0700
> -+++ gcc-4_7-branch/gcc/configure.ac	2012-04-10 10:37:57.215389769 =
-0700
> -@@ -4027,13 +4027,6 @@
> -         rm -f conftest.*
> -       fi
> -     fi
> --    if test $gcc_cv_as_ld_jalr_reloc =3D yes; then
> --      if test x$target_cpu_default =3D x; then
> --        target_cpu_default=3DMASK_RELAX_PIC_CALLS
> --      else
> --        =
target_cpu_default=3D"($target_cpu_default)|MASK_RELAX_PIC_CALLS"
> --      fi
> --    fi
> -     AC_MSG_RESULT($gcc_cv_as_ld_jalr_reloc)
> -=20
> -     AC_CACHE_CHECK([linker for .eh_frame personality relaxation],
> diff --git a/meta/recipes-devtools/gcc/gcc-4.8/disablesdt.patch =
b/meta/recipes-devtools/gcc/gcc-4.8/disablesdt.patch
> deleted file mode 100644
> index 8946afc..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.8/disablesdt.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -We don't list dtrace in DEPENDS so we shouldn't be depending on this =
header.=20
> -It may or may not exist from preivous builds though. To be =
determinstic, disable
> -sdt.h usage always. This avoids build failures if the header is =
removed after configure
> -but before libgcc is compiled for example.
> -
> -RP 2012/8/7
> -
> -Upstream-Status: Inappropriate [hack]
> -
> -Index: git/gcc/configure
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- git.orig/gcc/configure	2012-08-07 21:18:42.319247701 +0000
> -+++ git/gcc/configure	2012-08-07 21:19:08.939247082 +0000
> -@@ -26758,12 +26758,12 @@
> - { $as_echo "$as_me:${as_lineno-$LINENO}: checking sys/sdt.h in the =
target C library" >&5
> - $as_echo_n "checking sys/sdt.h in the target C library... " >&6; }
> - have_sys_sdt_h=3Dno
> --if test -f $target_header_dir/sys/sdt.h; then
> --  have_sys_sdt_h=3Dyes
> --
> --$as_echo "#define HAVE_SYS_SDT_H 1" >>confdefs.h
> --
> --fi
> -+#if test -f $target_header_dir/sys/sdt.h; then
> -+#  have_sys_sdt_h=3Dyes
> -+#
> -+#$as_echo "#define HAVE_SYS_SDT_H 1" >>confdefs.h
> -+#
> -+#fi
> - { $as_echo "$as_me:${as_lineno-$LINENO}: result: $have_sys_sdt_h" =
>&5
> - $as_echo "$have_sys_sdt_h" >&6; }
> -=20
> diff --git =
a/meta/recipes-devtools/gcc/gcc-4.8/fortran-cross-compile-hack.patch =
b/meta/recipes-devtools/gcc/gcc-4.8/fortran-cross-compile-hack.patch
> deleted file mode 100644
> index 2773b42..0000000
> --- =
a/meta/recipes-devtools/gcc/gcc-4.8/fortran-cross-compile-hack.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -Upstream-Status: Inappropriate [embedded specific]
> -
> -* Fortran would have searched for arm-angstrom-gnueabi-gfortran but =
would have used
> -  used gfortan. For gcc_4.2.2.bb we want to use the gfortran compiler =
from our cross
> -  directory.
> -
> -Index: gcc-4_7-branch/libgfortran/configure
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4_7-branch.orig/libgfortran/configure	2012-04-10 =
10:17:24.055330044 -0700
> -+++ gcc-4_7-branch/libgfortran/configure	2012-04-10 =
10:42:26.159402591 -0700
> -@@ -12689,7 +12689,7 @@
> -=20
> - # We need gfortran to compile parts of the library
> - #AC_PROG_FC(gfortran)
> --FC=3D"$GFORTRAN"
> -+#FC=3D"$GFORTRAN"
> - ac_ext=3D${ac_fc_srcext-f}
> - ac_compile=3D'$FC -c $FCFLAGS $ac_fcflags_srcext conftest.$ac_ext =
>&5'
> - ac_link=3D'$FC -o conftest$ac_exeext $FCFLAGS $LDFLAGS =
$ac_fcflags_srcext conftest.$ac_ext $LIBS >&5'
> -Index: gcc-4_7-branch/libgfortran/configure.ac
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4_7-branch.orig/libgfortran/configure.ac	2012-04-10 =
10:17:24.063330046 -0700
> -+++ gcc-4_7-branch/libgfortran/configure.ac	2012-04-10 =
10:42:26.159402591 -0700
> -@@ -227,7 +227,7 @@
> -=20
> - # We need gfortran to compile parts of the library
> - #AC_PROG_FC(gfortran)
> --FC=3D"$GFORTRAN"
> -+#FC=3D"$GFORTRAN"
> - AC_PROG_FC(gfortran)
> -=20
> - # extra LD Flags which are required for targets
> diff --git =
a/meta/recipes-devtools/gcc/gcc-4.8/gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch =
b/meta/recipes-devtools/gcc/gcc-4.8/gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
> deleted file mode 100644
> index 964c4bb..0000000
> --- =
a/meta/recipes-devtools/gcc/gcc-4.8/gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -Upstream-Status: Inappropriate [embedded specific]
> -
> ----
> - configure    |    2 +-
> - configure.ac |    2 +-
> - 2 files changed, 2 insertions(+), 2 deletions(-)
> -
> -Index: gcc-4_7-branch/configure.ac
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4_7-branch.orig/configure.ac	2012-04-10 10:19:50.923337154 =
-0700
> -+++ gcc-4_7-branch/configure.ac	2012-04-10 10:19:54.911337344 =
-0700
> -@@ -2825,7 +2825,7 @@
> - # for target_alias and gcc doesn't manage it consistently.
> - target_configargs=3D"--cache-file=3D./config.cache =
${target_configargs}"
> -=20
> --FLAGS_FOR_TARGET=3D
> -+FLAGS_FOR_TARGET=3D"$ARCH_FLAGS_FOR_TARGET"
> - case " $target_configdirs " in
> -  *" newlib "*)
> -   case " $target_configargs " in
> -Index: gcc-4_7-branch/configure
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4_7-branch.orig/configure	2012-04-10 10:19:50.911337153 =
-0700
> -+++ gcc-4_7-branch/configure	2012-04-10 10:19:54.915337349 -0700
> -@@ -7368,7 +7368,7 @@
> - # for target_alias and gcc doesn't manage it consistently.
> - target_configargs=3D"--cache-file=3D./config.cache =
${target_configargs}"
> -=20
> --FLAGS_FOR_TARGET=3D
> -+FLAGS_FOR_TARGET=3D"$ARCH_FLAGS_FOR_TARGET"
> - case " $target_configdirs " in
> -  *" newlib "*)
> -   case " $target_configargs " in
> diff --git =
a/meta/recipes-devtools/gcc/gcc-4.8/gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.pa=
tch =
b/meta/recipes-devtools/gcc/gcc-4.8/gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.pa=
tch
> deleted file mode 100644
> index ff136e1..0000000
> --- =
a/meta/recipes-devtools/gcc/gcc-4.8/gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.pa=
tch
> +++ /dev/null
> @@ -1,116 +0,0 @@
> -Upstream-Status: Pending
> -
> -Before committing, I noticed that PR/32161 was marked as a dup of =
PR/32009, but my previous patch did not fix it.
> -
> -This alternative patch is better because it lets you just use =
CFLAGS_FOR_TARGET to set the compilation flags for libgcc. Since =
bootstrapped target libraries are never compiled with the native =
compiler, it makes little sense to use different flags for stage1 and =
later stages. And it also makes little sense to use a different variable =
than CFLAGS_FOR_TARGET.
> -
> -Other changes I had to do include:
> -
> -- moving the creation of default CFLAGS_FOR_TARGET from Makefile.am =
to configure.ac, because otherwise the BOOT_CFLAGS are substituted into =
CFLAGS_FOR_TARGET (which is "-O2 -g $(CFLAGS)") via $(CFLAGS). It is =
also cleaner this way though.
> -
> -- passing the right CFLAGS to configure scripts as exported =
environment variables
> -
> -I also stopped passing LIBCFLAGS to configure scripts since they are =
unused in the whole src tree. And I updated the documentation as H-P =
reminded me to do.
> -
> -Bootstrapped/regtested i686-pc-linux-gnu, will commit to 4.4 shortly. =
Ok for 4.3?
> -
> -Paolo
> -
> -2008-02-19  Paolo Bonzini  <bonzini@gnu.org>
> -
> -        PR bootstrap/32009
> -        PR bootstrap/32161
> -
> -	* configure.ac (CFLAGS_FOR_TARGET, CXXFLAGS_FOR_TARGET): Compute =
here.
> -	* configure: Regenerate.
> -
> -	* Makefile.def: Define stage_libcflags for all bootstrap stages.
> -	* Makefile.tpl (BOOT_LIBCFLAGS, STAGE2_LIBCFLAGS, =
STAGE3_LIBCFLAGS,
> -	STAGE4_LIBCFLAGS): New.
> -	(CFLAGS_FOR_TARGET, CXXFLAGS_FOR_TARGET): Subst from autoconf, =
without
> -	$(SYSROOT_CFLAGS_FOR_TARGET) and =
$(DEBUG_PREFIX_CFLAGS_FOR_TARGET).
> -	(BASE_TARGET_EXPORTS): Append them here to C{,XX}FLAGS.
> -	(EXTRA_TARGET_FLAGS): Append them here to {LIB,}C{,XX}FLAGS.
> -	(configure-stage[+id+]-[+prefix+][+module+]): Pass =
stage_libcflags
> -	for target modules.  Don't export LIBCFLAGS.
> -	(all-stage[+id+]-[+prefix+][+module+]): Pass stage_libcflags; =
pass
> -	$(BASE_FLAGS_TO_PASS) where [+args+] was passed, and [+args+] =
after
> -	the overridden CFLAGS_FOR_TARGET and CXXFLAGS_FOR_TARGET.
> -	(invocations of `all'): Replace $(TARGET_FLAGS_TO_PASS) with
> -	$(EXTRA_TARGET_FLAGS), $(FLAGS_TO_PASS) with =
$(EXTRA_HOST_FLAGS).
> -	* Makefile.in: Regenerate.
> -
> -config:
> -2008-02-19  Paolo Bonzini  <bonzini@gnu.org>
> -
> -	PR bootstrap/32009
> -	* mh-ppc-darwin (BOOT_CFLAGS): Reenable.
> -
> -gcc:
> -2008-02-19  Paolo Bonzini  <bonzini@gnu.org>
> -
> -	PR bootstrap/32009
> -	* doc/install.texi: Correct references to CFLAGS, replacing them
> -	with BOOT_CFLAGS.  Document flags used during bootstrap for
> -	target libraries.
> -
> -
> ----
> - Makefile.def           |   25=20
> - Makefile.in            | 1845 =
++++++++++++++++++++++++++++++-------------------
> - Makefile.tpl           |   91 +-
> - config/mh-ppc-darwin   |    3=20
> - configure              |   36=20
> - configure.ac           |   32=20
> - gcc/Makefile.in        |    2=20
> - gcc/configure          |    6=20
> - gcc/configure.ac       |    3=20
> - gcc/doc/install.texi   |   56 -
> - libiberty/Makefile.in  |  162 ++--
> - libiberty/configure    |   46 -
> - libiberty/configure.ac |   43 -
> - 13 files changed, 1454 insertions(+), 896 deletions(-)
> -
> -Index: gcc-4_7-branch/configure
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4_7-branch.orig/configure	2012-04-10 10:22:05.807343683 =
-0700
> -+++ gcc-4_7-branch/configure	2012-04-10 10:37:24.243388086 -0700
> -@@ -6695,6 +6695,38 @@
> -=20
> -=20
> -=20
> -+# During gcc bootstrap, if we use some random cc for stage1 then =
CFLAGS
> -+# might be empty or "-g".  We don't require a C++ compiler, so =
CXXFLAGS
> -+# might also be empty (or "-g", if a non-GCC C++ compiler is in the =
path).
> -+# We want to ensure that TARGET libraries (which we know are built =
with
> -+# gcc) are built with "-O2 -g", so include those options when =
setting
> -+# CFLAGS_FOR_TARGET and CXXFLAGS_FOR_TARGET.
> -+if test "x$CFLAGS_FOR_TARGET" =3D x; then
> -+  CFLAGS_FOR_TARGET=3D$CFLAGS
> -+  case " $CFLAGS " in
> -+    *" -O2 "*) ;;
> -+    *) CFLAGS_FOR_TARGET=3D"-O2 $CFLAGS" ;;
> -+  esac
> -+  case " $CFLAGS " in
> -+    *" -g "* | *" -g3 "*) ;;
> -+    *) CFLAGS_FOR_TARGET=3D"-g $CFLAGS" ;;
> -+  esac
> -+fi
> -+
> -+
> -+if test "x$CXXFLAGS_FOR_TARGET" =3D x; then
> -+  CXXFLAGS_FOR_TARGET=3D$CXXFLAGS
> -+  case " $CXXFLAGS " in
> -+    *" -O2 "*) ;;
> -+    *) CXXFLAGS_FOR_TARGET=3D"-O2 $CXXFLAGS" ;;
> -+  esac
> -+  case " $CXXFLAGS " in
> -+    *" -g "* | *" -g3 "*) ;;
> -+    *) CXXFLAGS_FOR_TARGET=3D"-g $CXXFLAGS" ;;
> -+  esac
> -+fi
> -+
> -+
> - # Handle --with-headers=3DXXX.  If the value is not "yes", the =
contents of
> - # the named directory are copied to $(tooldir)/sys-include.
> - if test x"${with_headers}" !=3D x && test x"${with_headers}" !=3D =
xno ; then
> diff --git =
a/meta/recipes-devtools/gcc/gcc-4.8/gcc-argument-list-too-long.patch =
b/meta/recipes-devtools/gcc/gcc-4.8/gcc-argument-list-too-long.patch
> deleted file mode 100644
> index 70d3c53..0000000
> --- =
a/meta/recipes-devtools/gcc/gcc-4.8/gcc-argument-list-too-long.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -There would be an "Argument list too long" error when the
> -build directory is longer than 200, this is caused by:
> -
> -headers=3D`echo $(PLUGIN_HEADERS) | tr ' ' '\012' | sort -u`
> -
> -The PLUGIN_HEADERS is too long before sort, so the "echo" can't =
handle
> -it, use the $(sort list) of GNU make which can handle the too long =
list
> -would fix the problem, the header would be short enough after sorted.
> -The "tr ' ' '\012'" was used for translating the space to "\n", the
> -$(sort list) doesn't need this.
> -
> -Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> -
> -Upstream-Status: Pending
> ----
> - gcc/Makefile.in |    2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/gcc/Makefile.in b/gcc/Makefile.in
> ---- a/gcc/Makefile.in
> -+++ b/gcc/Makefile.in
> -@@ -4553,7 +4553,7 @@ install-plugin: installdirs lang.install-plugin =
s-header-vars install-gengtype
> - # We keep the directory structure for files in config or c-family =
and .def
> - # files. All other files are flattened to a single directory.
> - 	$(mkinstalldirs) $(DESTDIR)$(plugin_includedir)
> --	headers=3D`echo $(PLUGIN_HEADERS) | tr ' ' '\012' | sort -u`; \
> -+	headers=3D"$(sort $(PLUGIN_HEADERS))"; \
> - 	srcdirstrip=3D`echo "$(srcdir)" | sed 's/[].[^$$\\*|]/\\\\&/g'`; =
\
> - 	for file in $$headers; do \
> - 	  if [ -f $$file ] ; then \
> ---=20
> -1.7.10.2
> -
> diff --git =
a/meta/recipes-devtools/gcc/gcc-4.8/gcc-armv4-pass-fix-v4bx-to-ld.patch =
b/meta/recipes-devtools/gcc/gcc-4.8/gcc-armv4-pass-fix-v4bx-to-ld.patch
> deleted file mode 100644
> index 7e03a3a..0000000
> --- =
a/meta/recipes-devtools/gcc/gcc-4.8/gcc-armv4-pass-fix-v4bx-to-ld.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -The LINK_SPEC for linux gets overwritten by linux-eabi.h which
> -means the value of TARGET_FIX_V4BX_SPEC gets lost and as a result
> -the option is not passed to linker when chosing march=3Darmv4
> -This patch redefines this in linux-eabi.h and reinserts it
> -for eabi defaulting toolchains.
> -
> -We might want to send it upstream
> -
> -Upstream-Status: Pending
> -
> --Khem
> -Index: gcc-4_7-branch/gcc/config/arm/linux-eabi.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4_7-branch.orig/gcc/config/arm/linux-eabi.h	2012-08-21 =
22:54:12.448453417 -0700
> -+++ gcc-4_7-branch/gcc/config/arm/linux-eabi.h	2012-08-21 =
23:05:18.008478722 -0700
> -@@ -78,10 +78,14 @@
> -      %{mfloat-abi=3Dsoft*:" GLIBC_DYNAMIC_LINKER_SOFT_FLOAT "} \
> -      %{!mfloat-abi=3D*:" GLIBC_DYNAMIC_LINKER_DEFAULT "}"
> -=20
> -+/* For armv4 we pass --fix-v4bx to linker to support EABI */
> -+#undef TARGET_FIX_V4BX_SPEC
> -+#define TARGET_FIX_V4BX_SPEC =
"%{mcpu=3Darm8|mcpu=3Darm810|mcpu=3Dstrongarm*|march=3Darmv4: =
--fix-v4bx}"
> -+
> - /* At this point, bpabi.h will have clobbered LINK_SPEC.  We want to
> -    use the GNU/Linux version, not the generic BPABI version.  */
> - #undef  LINK_SPEC
> --#define LINK_SPEC BE8_LINK_SPEC						=
\
> -+#define LINK_SPEC BE8_LINK_SPEC TARGET_FIX_V4BX_SPEC			=
\
> -   LINUX_OR_ANDROID_LD (LINUX_TARGET_LINK_SPEC,				=
\
> - 		       LINUX_TARGET_LINK_SPEC " " ANDROID_LINK_SPEC)
> -=20
> diff --git =
a/meta/recipes-devtools/gcc/gcc-4.8/gcc-poison-dir-extend.patch =
b/meta/recipes-devtools/gcc/gcc-4.8/gcc-poison-dir-extend.patch
> deleted file mode 100644
> index 607129a..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.8/gcc-poison-dir-extend.patch
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -Upstream-Status: Pending
> -
> -Add /sw/include and /opt/include based on the original
> -zecke-no-host-includes.patch patch.  The original patch checked for
> -/usr/include, /sw/include and /opt/include and then triggered a =
failure and
> -aborted.
> -
> -Instead, we add the two missing items to the current scan.  If the =
user
> -wants this to be a failure, they can add =
"-Werror=3Dpoison-system-directories".
> -
> -Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> -
> -Index: gcc-4_7-branch/gcc/incpath.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4_7-branch.orig/gcc/incpath.c	2012-04-10 =
10:37:09.343387385 -0700
> -+++ gcc-4_7-branch/gcc/incpath.c	2012-04-10 10:37:18.975387919 =
-0700
> -@@ -371,7 +371,9 @@
> -          {
> -           if ((!strncmp (p->name, "/usr/include", 12))
> -               || (!strncmp (p->name, "/usr/local/include", 18))
> --              || (!strncmp (p->name, "/usr/X11R6/include", 18)))
> -+              || (!strncmp (p->name, "/usr/X11R6/include", 18))
> -+              || (!strncmp (p->name, "/sw/include", 11))
> -+              || (!strncmp (p->name, "/opt/include", 12)))
> -             warning (OPT_Wpoison_system_directories,
> -                      "include location \"%s\" is unsafe for "
> -                      "cross-compilation",
> diff --git =
a/meta/recipes-devtools/gcc/gcc-4.8/gcc-poison-system-directories.patch =
b/meta/recipes-devtools/gcc/gcc-4.8/gcc-poison-system-directories.patch
> deleted file mode 100644
> index afb98d7..0000000
> --- =
a/meta/recipes-devtools/gcc/gcc-4.8/gcc-poison-system-directories.patch
> +++ /dev/null
> @@ -1,231 +0,0 @@
> -Upstream-Status: Inappropriate [distribution: codesourcery]
> -
> -       gcc/
> -       2008-07-02  Joseph Myers  <joseph@codesourcery.com>
> -       * c-incpath.c: Include toplev.h.
> -       (merge_include_chains): Use warning instead of cpp_error for
> -       system directory poisoning diagnostic.
> -       * Makefile.in (c-incpath.o): Depend on toplev.h.
> -       * gcc.c (LINK_COMMAND_SPEC): Pass
> -       --error-poison-system-directories if
> -       -Werror=3Dpoison-system-directories.
> -
> -       2007-06-13  Joseph Myers  <joseph@codesourcery.com>
> -       * common.opt (--Wno-poison-system-directories): New.
> -       * doc/invoke.texi (-Wno-poison-system-directories): Document.
> -       * c-incpath.c: Include flags.h.
> -       (merge_include_chains): Check flag_poison_system_directories.
> -       * gcc.c (LINK_COMMAND_SPEC): Pass =
--no-poison-system-directories
> -       to linker if -Wno-poison-system-directories.
> -       * Makefile.in (c-incpath.o): Depend on $(FLAGS_H).
> -
> -       2007-03-20  Daniel Jacobowitz  <dan@codesourcery.com>
> -                   Joseph Myers  <joseph@codesourcery.com>
> -       * configure.ac (--enable-poison-system-directories): New =
option.
> -       * configure, config.in: Regenerate.
> -       * c-incpath.c (merge_include_chains): If
> -       ENABLE_POISON_SYSTEM_DIRECTORIES defined, warn for use of
> -       /usr/include, /usr/local/include or /usr/X11R6/include.
> -
> -Index: gcc-4.8.0/gcc/common.opt
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.8.0.orig/gcc/common.opt	2013-03-26 14:10:58.485914988 =
-0700
> -+++ gcc-4.8.0/gcc/common.opt	2013-03-26 14:11:01.893915049 -0700
> -@@ -595,6 +595,10 @@
> - Common Var(pedantic) Warning
> - Issue warnings needed for strict compliance to the standard
> -=20
> -+Wpoison-system-directories
> -+Common Var(flag_poison_system_directories) Init(1) Warning
> -+Warn for -I and -L options using system directories if cross =
compiling
> -+
> - Wshadow
> - Common Var(warn_shadow) Warning
> - Warn when one local variable shadows another
> -Index: gcc-4.8.0/gcc/config.in
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.8.0.orig/gcc/config.in	2013-03-26 14:10:58.485914988 =
-0700
> -+++ gcc-4.8.0/gcc/config.in	2013-03-26 14:11:01.893915049 -0700
> -@@ -138,6 +138,12 @@
> - #endif
> -=20
> -=20
> -+/* Define to warn for use of native system header directories */
> -+#ifndef USED_FOR_TARGET
> -+#undef ENABLE_POISON_SYSTEM_DIRECTORIES
> -+#endif
> -+
> -+
> - /* Define if you want all operations on RTL (the basic data =
structure of the
> -    optimizer and back end) to be checked for dynamic type safety at =
runtime.
> -    This is quite expensive. */
> -Index: gcc-4.8.0/gcc/configure.ac
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.8.0.orig/gcc/configure.ac	2013-03-26 14:11:01.553915046 =
-0700
> -+++ gcc-4.8.0/gcc/configure.ac	2013-03-26 14:19:57.317925096 =
-0700
> -@@ -5063,6 +5063,16 @@
> -                 [specify that runtime libraries should be
> -                  installed in a compiler-specific directory])])
> -=20
> -+AC_ARG_ENABLE([poison-system-directories],
> -+             AS_HELP_STRING([--enable-poison-system-directories],
> -+                            [warn for use of native system header =
directories]),,
> -+             [enable_poison_system_directories=3Dno])
> -+if test "x${enable_poison_system_directories}" =3D "xyes"; then
> -+  AC_DEFINE([ENABLE_POISON_SYSTEM_DIRECTORIES],
> -+           [1],
> -+           [Define to warn for use of native system header =
directories])
> -+fi
> -+
> - # Substitute configuration variables
> - AC_SUBST(subdirs)
> - AC_SUBST(srcdir)
> -Index: gcc-4.8.0/gcc/doc/invoke.texi
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.8.0.orig/gcc/doc/invoke.texi	2013-03-26 =
14:10:58.485914988 -0700
> -+++ gcc-4.8.0/gcc/doc/invoke.texi	2013-03-26 14:19:57.437925099 =
-0700
> -@@ -258,6 +258,7 @@
> - -Woverlength-strings  -Wpacked  -Wpacked-bitfield-compat  -Wpadded =
@gol
> - -Wparentheses  -Wpedantic-ms-format -Wno-pedantic-ms-format @gol
> - -Wpointer-arith  -Wno-pointer-to-int-cast @gol
> -+-Wno-poison-system-directories @gol
> - -Wredundant-decls  -Wno-return-local-addr @gol
> - -Wreturn-type  -Wsequence-point  -Wshadow @gol
> - -Wsign-compare  -Wsign-conversion  -Wsizeof-pointer-memaccess @gol
> -@@ -4007,6 +4008,14 @@
> -  for most targets, it is made up of code and thus requires the stack
> -  to be made executable in order for the program to work properly.
> -=20
> -+@item -Wno-poison-system-directories
> -+@opindex Wno-poison-system-directories
> -+Do not warn for @option{-I} or @option{-L} options using system
> -+directories such as @file{/usr/include} when cross compiling.  This
> -+option is intended for use in chroot environments when such
> -+directories contain the correct headers and libraries for the target
> -+system rather than the host.
> -+
> - @item -Wfloat-equal
> - @opindex Wfloat-equal
> - @opindex Wno-float-equal
> -Index: gcc-4.8.0/gcc/gcc.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.8.0.orig/gcc/gcc.c	2013-03-26 14:10:58.485914988 -0700
> -+++ gcc-4.8.0/gcc/gcc.c	2013-03-26 14:19:57.425925095 -0700
> -@@ -740,6 +740,8 @@
> -    "%{fuse-ld=3D*:-fuse-ld=3D%*}\
> -     %X %{o*} %{e*} %{N} %{n} %{r}\
> -     %{s} %{t} %{u*} %{z} %{Z} %{!nostdlib:%{!nostartfiles:%S}}\
> -+    %{Wno-poison-system-directories:--no-poison-system-directories}\
> -+    =
%{Werror=3Dpoison-system-directories:--error-poison-system-directories}\
> -     %{static:} %{L*} %(mfwrap) %(link_libgcc) " SANITIZER_EARLY_SPEC =
" %o\
> -     =
%{fopenmp|ftree-parallelize-loops=3D*:%:include(libgomp.spec)%(link_gomp)}=
\
> -     %{fgnu-tm:%:include(libitm.spec)%(link_itm)}\
> -Index: gcc-4.8.0/gcc/incpath.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.8.0.orig/gcc/incpath.c	2013-03-26 14:10:58.485914988 =
-0700
> -+++ gcc-4.8.0/gcc/incpath.c	2013-03-26 14:43:10.397951230 -0700
> -@@ -28,6 +28,7 @@
> - #include "intl.h"
> - #include "incpath.h"
> - #include "cppdefault.h"
> -+#include "diagnostic-core.h"
> -=20
> - /* Microsoft Windows does not natively support inodes.
> -    VMS has non-numeric inodes.  */
> -@@ -382,6 +383,24 @@
> - 	}
> -       fprintf (stderr, _("End of search list.\n"));
> -     }
> -+
> -+#ifdef ENABLE_POISON_SYSTEM_DIRECTORIES
> -+  if (flag_poison_system_directories)
> -+    {
> -+       struct cpp_dir *p;
> -+
> -+       for (p =3D heads[QUOTE]; p; p =3D p->next)
> -+         {
> -+          if ((!strncmp (p->name, "/usr/include", 12))
> -+              || (!strncmp (p->name, "/usr/local/include", 18))
> -+              || (!strncmp (p->name, "/usr/X11R6/include", 18)))
> -+            warning (OPT_Wpoison_system_directories,
> -+                     "include location \"%s\" is unsafe for "
> -+                     "cross-compilation",
> -+                     p->name);
> -+         }
> -+    }
> -+#endif
> - }
> -=20
> - /* Use given -I paths for #include "..." but not #include <...>, and
> -Index: gcc-4.8.0/gcc/Makefile.in
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.8.0.orig/gcc/Makefile.in	2013-03-26 14:10:58.485914988 =
-0700
> -+++ gcc-4.8.0/gcc/Makefile.in	2013-03-26 14:19:57.165925091 =
-0700
> -@@ -2018,7 +2018,7 @@
> -=20
> - incpath.o: incpath.c incpath.h $(CONFIG_H) $(SYSTEM_H) $(CPPLIB_H) \
> - 		intl.h prefix.h coretypes.h $(TM_H) cppdefault.h =
$(TARGET_H) \
> --		$(MACHMODE_H)
> -+		$(MACHMODE_H) $(FLAGS_H) toplev.h
> -=20
> - CFLAGS-prefix.o +=3D -DPREFIX=3D\"$(prefix)\" -DBASEVER=3D$(BASEVER_s)=

> - prefix.o: prefix.c $(CONFIG_H) $(SYSTEM_H) coretypes.h prefix.h \
> -Index: gcc-4.8.0/gcc/configure
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.8.0.orig/gcc/configure	2013-03-26 14:11:01.561915044 =
-0700
> -+++ gcc-4.8.0/gcc/configure	2013-03-26 14:19:57.301925093 -0700
> -@@ -917,6 +917,7 @@
> - with_system_zlib
> - enable_maintainer_mode
> - enable_version_specific_runtime_libs
> -+enable_poison_system_directories
> - enable_plugin
> - enable_libquadmath_support
> - with_linker_hash_style
> -@@ -1630,6 +1631,8 @@
> -   --enable-version-specific-runtime-libs
> -                           specify that runtime libraries should be =
installed
> -                           in a compiler-specific directory
> -+  --enable-poison-system-directories
> -+                          warn for use of native system header =
directories
> -   --enable-plugin         enable plugin support
> -   --disable-libquadmath-support
> -                           disable libquadmath support for Fortran
> -@@ -17828,7 +17831,7 @@
> -   lt_dlunknown=3D0; lt_dlno_uscore=3D1; lt_dlneed_uscore=3D2
> -   lt_status=3D$lt_dlunknown
> -   cat > conftest.$ac_ext <<_LT_EOF
> --#line 17831 "configure"
> -+#line 17834 "configure"
> - #include "confdefs.h"
> -=20
> - #if HAVE_DLFCN_H
> -@@ -17934,7 +17937,7 @@
> -   lt_dlunknown=3D0; lt_dlno_uscore=3D1; lt_dlneed_uscore=3D2
> -   lt_status=3D$lt_dlunknown
> -   cat > conftest.$ac_ext <<_LT_EOF
> --#line 17937 "configure"
> -+#line 17940 "configure"
> - #include "confdefs.h"
> -=20
> - #if HAVE_DLFCN_H
> -@@ -27103,6 +27106,19 @@
> - fi
> -=20
> -=20
> -+# Check whether --enable-poison-system-directories was given.
> -+if test "${enable_poison_system_directories+set}" =3D set; then :
> -+  enableval=3D$enable_poison_system_directories;
> -+else
> -+  enable_poison_system_directories=3Dno
> -+fi
> -+
> -+if test "x${enable_poison_system_directories}" =3D "xyes"; then
> -+
> -+$as_echo "#define ENABLE_POISON_SYSTEM_DIRECTORIES 1" >>confdefs.h
> -+
> -+fi
> -+
> - # Substitute configuration variables
> -=20
> -=20
> diff --git =
a/meta/recipes-devtools/gcc/gcc-4.8/gcc-uclibc-locale-ctype_touplow_t.patc=
h =
b/meta/recipes-devtools/gcc/gcc-4.8/gcc-uclibc-locale-ctype_touplow_t.patc=
h
> deleted file mode 100644
> index 1648b3b..0000000
> --- =
a/meta/recipes-devtools/gcc/gcc-4.8/gcc-uclibc-locale-ctype_touplow_t.patc=
h
> +++ /dev/null
> @@ -1,72 +0,0 @@
> -Upstream-Status: Pending
> -
> -Index: gcc-4.6.0/libstdc++-v3/config/locale/generic/c_locale.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.6.0.orig/libstdc++-v3/config/locale/generic/c_locale.h
> -+++ gcc-4.6.0/libstdc++-v3/config/locale/generic/c_locale.h
> -@@ -41,13 +41,22 @@
> -=20
> - #include <clocale>
> -=20
> -+#ifdef __UCLIBC__
> -+#include <features.h>
> -+#include <ctype.h>
> -+#endif
> -+
> - #define _GLIBCXX_NUM_CATEGORIES 0
> -=20
> - namespace std _GLIBCXX_VISIBILITY(default)
> - {
> - _GLIBCXX_BEGIN_NAMESPACE_VERSION
> -=20
> -+#ifdef __UCLIBC__
> -+  typedef __ctype_touplow_t*	__c_locale;
> -+#else
> -   typedef int*			__c_locale;
> -+#endif
> -=20
> -   // Convert numeric value of type double and long double to string =
and
> -   // return length of string.  If vsnprintf is available use it, =
otherwise
> -Index: gcc-4.6.0/libstdc++-v3/config/os/gnu-linux/ctype_base.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.6.0.orig/libstdc++-v3/config/os/gnu-linux/ctype_base.h
> -+++ gcc-4.6.0/libstdc++-v3/config/os/gnu-linux/ctype_base.h
> -@@ -34,6 +34,11 @@
> -=20
> - // Information as gleaned from /usr/include/ctype.h
> -=20
> -+#ifdef __UCLIBC__
> -+#include <features.h>
> -+#include <ctype.h>
> -+#endif
> -+
> - namespace std _GLIBCXX_VISIBILITY(default)
> - {
> - _GLIBCXX_BEGIN_NAMESPACE_VERSION
> -@@ -42,7 +47,11 @@ _GLIBCXX_BEGIN_NAMESPACE_VERSION
> -   struct ctype_base
> -   {
> -     // Non-standard typedefs.
> -+#ifdef __UCLIBC__
> -+    typedef const __ctype_touplow_t*	__to_type;
> -+#else
> -     typedef const int* 		__to_type;
> -+#endif
> -=20
> -     // NB: Offsets into ctype<char>::_M_table force a particular =
size
> -     // on the mask type. Because of this, we don't use an enum.
> -Index: gcc-4.6.0/libstdc++-v3/config/locale/generic/c_locale.cc
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.6.0.orig/libstdc++-v3/config/locale/generic/c_locale.cc
> -+++ gcc-4.6.0/libstdc++-v3/config/locale/generic/c_locale.cc
> -@@ -264,5 +264,10 @@ _GLIBCXX_END_NAMESPACE_VERSION
> - #ifdef _GLIBCXX_LONG_DOUBLE_COMPAT
> - #define _GLIBCXX_LDBL_COMPAT(dbl, ldbl) \
> -   extern "C" void ldbl (void) __attribute__ ((alias (#dbl)))
> -+#ifdef __UCLIBC__
> -+// This is because __c_locale is of type __ctype_touplow_t* which is =
short on uclibc. for glibc its int*
> =
-+_GLIBCXX_LDBL_COMPAT(_ZSt14__convert_to_vIdEvPKcRT_RSt12_Ios_IostateRKPs=
, _ZSt14__convert_to_vIeEvPKcRT_RSt12_Ios_IostateRKPs);
> -+#else
> - =
_GLIBCXX_LDBL_COMPAT(_ZSt14__convert_to_vIdEvPKcRT_RSt12_Ios_IostateRKPi, =
_ZSt14__convert_to_vIeEvPKcRT_RSt12_Ios_IostateRKPi);
> -+#endif
> - #endif // _GLIBCXX_LONG_DOUBLE_COMPAT
> diff --git a/meta/recipes-devtools/gcc/gcc-4.8/libgcc-sjlj-check.patch =
b/meta/recipes-devtools/gcc/gcc-4.8/libgcc-sjlj-check.patch
> deleted file mode 100644
> index c2fe792..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.8/libgcc-sjlj-check.patch
> +++ /dev/null
> @@ -1,61 +0,0 @@
> -ac_fn_c_try_compile doesnt seem to keep the intermediate files
> -which are needed for sjlj test to pass since it greps into the
> -generated file. So we run the compiler command using AC_TRY_COMMAND
> -which then generates the needed .s file
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Upstream-Status: Pending
> -Index: trunk/libgcc/configure
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- trunk.orig/libgcc/configure	2012-03-01 22:59:10.112444433 =
-0800
> -+++ trunk/libgcc/configure	2012-03-01 22:59:50.424446325 -0800
> -@@ -4525,17 +4525,19 @@
> - }
> -=20
> - _ACEOF
> --CFLAGS_hold=3D$CFLAGS
> --CFLAGS=3D"--save-temps -fexceptions"
> - libgcc_cv_lib_sjlj_exceptions=3Dunknown
> --if ac_fn_c_try_compile; then :
> -+if { ac_try=3D'${CC-cc} -fexceptions -S conftest.c -o conftest.s =
1>&5'
> -+  { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_try\""; } =
>&5
> -+  (eval $ac_try) 2>&5
> -+  ac_status=3D$?
> -+  $as_echo "$as_me:${as_lineno-$LINENO}: \$? =3D $ac_status" >&5
> -+  test $ac_status =3D 0; }; }; then
> -   if grep _Unwind_SjLj_Resume conftest.s >/dev/null 2>&1; then
> -     libgcc_cv_lib_sjlj_exceptions=3Dyes
> -   elif grep _Unwind_Resume conftest.s >/dev/null 2>&1; then
> -     libgcc_cv_lib_sjlj_exceptions=3Dno
> -   fi
> - fi
> --CFLAGS=3D$CFLAGS_hold
> - rm -f conftest*
> -=20
> - fi
> -Index: trunk/libgcc/configure.ac
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- trunk.orig/libgcc/configure.ac	2012-03-01 22:59:10.128444406 =
-0800
> -+++ trunk/libgcc/configure.ac	2012-03-01 22:59:50.428446373 =
-0800
> -@@ -209,16 +209,14 @@
> -   bar();
> - }
> - ])])
> --CFLAGS_hold=3D$CFLAGS
> --CFLAGS=3D"--save-temps -fexceptions"
> - libgcc_cv_lib_sjlj_exceptions=3Dunknown
> --AS_IF([ac_fn_c_try_compile],
> --  [if grep _Unwind_SjLj_Resume conftest.s >/dev/null 2>&1; then
> -+if AC_TRY_COMMAND(${CC-cc} -fexceptions -S conftest.c -o conftest.s =
1>&AS_MESSAGE_LOG_FD); then
> -+  if grep _Unwind_SjLj_Resume conftest.s >/dev/null 2>&1; then
> -     libgcc_cv_lib_sjlj_exceptions=3Dyes
> -   elif grep _Unwind_Resume conftest.s >/dev/null 2>&1; then
> -     libgcc_cv_lib_sjlj_exceptions=3Dno
> --  fi])
> --CFLAGS=3D$CFLAGS_hold
> -+  fi
> -+fi
> - rm -f conftest*
> - ])
> -=20
> diff --git a/meta/recipes-devtools/gcc/gcc-4.8/libtool.patch =
b/meta/recipes-devtools/gcc/gcc-4.8/libtool.patch
> deleted file mode 100644
> index 9580b23..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.8/libtool.patch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -libstdc++ from gcc-runtime gets created with -rpath=3D/usr/lib/../lib =
for qemux86-64
> -when running on am x86_64 build host.
> -
> -This patch stops this speading to libdir in the libstdc++.la file =
within libtool.
> -Aguably, it shouldn't be passing this into libtool in the first place =
but
> -for now this resolves the nastiest problems this causes.
> -
> -func_normal_abspath would resolve an empty path to `pwd` so we need
> -to filter the zero case.
> -
> -RP 2012/8/24
> -
> -Upstream-Status: Pending
> -
> -Index: git/ltmain.sh
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- git.orig/ltmain.sh	2012-08-24 11:45:58.597087961 +0000
> -+++ git/ltmain.sh	2012-08-24 12:18:37.961042581 +0000
> -@@ -6359,6 +6359,10 @@
> - 	func_warning "ignoring multiple \`-rpath's for a libtool =
library"
> -=20
> -       install_libdir=3D"$1"
> -+      if test -n "$install_libdir"; then
> -+	func_normal_abspath "$install_libdir"
> -+	install_libdir=3D$func_normal_abspath_result
> -+      fi
> -=20
> -       oldlibs=3D
> -       if test -z "$rpath"; then
> diff --git =
a/meta/recipes-devtools/gcc/gcc-4.8/mips64-default-n64.patch =
b/meta/recipes-devtools/gcc/gcc-4.8/mips64-default-n64.patch
> deleted file mode 100644
> index a42569e..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.8/mips64-default-n64.patch
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -MIPS64 defaults to n32 ABI, this patch makes it
> -so that it defaults to N64 ABI
> -
> -Upstream-Status: Inappropriate [OE config specific]
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -Index: gcc-4_7-branch/gcc/config.gcc
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4_7-branch.orig/gcc/config.gcc	2012-04-22 =
19:30:21.000000000 -0700
> -+++ gcc-4_7-branch/gcc/config.gcc	2012-04-22 21:09:57.783403173 =
-0700
> -@@ -1750,7 +1750,7 @@
> - mips64*-*-linux* | mipsisa64*-*-linux*)
> - 	tm_file=3D"dbxelf.h elfos.h gnu-user.h linux.h glibc-stdint.h =
${tm_file} mips/gnu-user.h mips/gnu-user64.h mips/linux64.h"
> - 	tmake_file=3D"${tmake_file} mips/t-linux64"
> --	tm_defines=3D"${tm_defines} MIPS_ABI_DEFAULT=3DABI_N32"
> -+	tm_defines=3D"${tm_defines} MIPS_ABI_DEFAULT=3DABI_64"
> - 	case ${target} in
> - 		mips64el-st-linux-gnu)
> - 			tm_file=3D"${tm_file} mips/st.h"
> diff --git a/meta/recipes-devtools/gcc/gcc-4.8/optional_libstdc.patch =
b/meta/recipes-devtools/gcc/gcc-4.8/optional_libstdc.patch
> deleted file mode 100644
> index 2ea23e8..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.8/optional_libstdc.patch
> +++ /dev/null
> @@ -1,86 +0,0 @@
> -Upstream-Status: Inappropriate [embedded specific]
> -
> -gcc-runtime builds libstdc++ separately from gcc-cross-*. Its =
configure tests using g++=20
> -will not run correctly since by default the linker will try to link =
against libstdc++
> -which shouldn't exist yet. We need an option to disable -lstdc++
> -option whilst leaving -lc, -lgcc and other automatic library =
dependencies added by gcc=20
> -driver. This patch adds such an option which only disables the =
-lstdc++.
> -
> -A "standard" gcc build uses xgcc and hence avoids this. We should ask =
upstream how to=20
> -do this officially, the likely answer is don't build libstdc++ =
separately.
> -
> -RP 29/6/10
> -
> -Index: gcc-4.8.0/gcc/cp/g++spec.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.8.0.orig/gcc/cp/g++spec.c	2013-01-10 12:38:27.000000000 =
-0800
> -+++ gcc-4.8.0/gcc/cp/g++spec.c	2013-03-26 12:06:42.305775104 =
-0700
> -@@ -126,6 +126,7 @@
> -       switch (decoded_options[i].opt_index)
> - 	{
> - 	case OPT_nostdlib:
> -+	case OPT_nostdlib__:
> - 	case OPT_nodefaultlibs:
> - 	  library =3D -1;
> - 	  break;
> -Index: gcc-4.8.0/gcc/doc/invoke.texi
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.8.0.orig/gcc/doc/invoke.texi	2013-03-26 =
12:05:41.000000000 -0700
> -+++ gcc-4.8.0/gcc/doc/invoke.texi	2013-03-26 12:07:56.905776503 =
-0700
> -@@ -190,7 +190,7 @@
> - -frepo  -fno-rtti  -fstats  -ftemplate-backtrace-limit=3D@var{n} =
@gol
> - -ftemplate-depth=3D@var{n} @gol
> - -fno-threadsafe-statics -fuse-cxa-atexit  -fno-weak  -nostdinc++ =
@gol
> ---fno-default-inline  -fvisibility-inlines-hidden @gol
> -+-nostdlib++ -fno-default-inline  -fvisibility-inlines-hidden @gol
> - -fvisibility-ms-compat @gol
> - -fext-numeric-literals @gol
> - -Wabi  -Wconversion-null  -Wctor-dtor-privacy @gol
> -@@ -453,7 +453,7 @@
> - -nostartfiles  -nodefaultlibs  -nostdlib -pie -rdynamic @gol
> - -s  -static -static-libgcc -static-libstdc++ @gol
> - -static-libasan -static-libtsan @gol
> ---shared -shared-libgcc  -symbolic @gol
> -+-shared -shared-libgcc  -symbolic -nostdlib++ @gol
> - -T @var{script}  -Wl,@var{option}  -Xlinker @var{option} @gol
> - -u @var{symbol}}
> -=20
> -@@ -9886,6 +9886,11 @@
> - libc.  These entry points should be supplied through some other
> - mechanism when this option is specified.
> -=20
> -+@item -nostdlib++
> -+@opindex nostdlib++
> -+Do not use the standard system C++ runtime libraries when linking.
> -+Only the libraries you specify will be passed to the linker.
> -+
> - @cindex @option{-lgcc}, use with @option{-nostdlib}
> - @cindex @option{-nostdlib} and unresolved references
> - @cindex unresolved references and @option{-nostdlib}
> -Index: gcc-4.8.0/gcc/c-family/c.opt
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.8.0.orig/gcc/c-family/c.opt	2013-01-18 =
21:25:25.000000000 -0800
> -+++ gcc-4.8.0/gcc/c-family/c.opt	2013-03-26 12:06:42.321775104 =
-0700
> -@@ -1299,6 +1299,10 @@
> - C++ ObjC++
> - Do not search standard system include directories for C++
> -=20
> -+nostdlib++
> -+Driver
> -+Do not link standard C++ runtime library
> -+
> - o
> - C ObjC C++ ObjC++ Joined Separate
> - ; Documented in common.opt
> -Index: gcc-4.8.0/gcc/gcc.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.8.0.orig/gcc/gcc.c	2013-03-26 12:05:41.000000000 -0700
> -+++ gcc-4.8.0/gcc/gcc.c	2013-03-26 12:06:42.325775102 -0700
> -@@ -748,6 +748,7 @@
> -     %(mflib) " STACK_SPLIT_SPEC "\
> -     %{fprofile-arcs|fprofile-generate*|coverage:-lgcov} " =
SANITIZER_SPEC " \
> -     %{!nostdlib:%{!nodefaultlibs:%(link_ssp) =
%(link_gcc_c_sequence)}}\
> -+    %{!nostdlib++:}\
> -     %{!nostdlib:%{!nostartfiles:%E}} %{T*} }}}}}}"
> - #endif
> -=20
> diff --git a/meta/recipes-devtools/gcc/gcc-4.8/pr32219.patch =
b/meta/recipes-devtools/gcc/gcc-4.8/pr32219.patch
> deleted file mode 100644
> index bea2063..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.8/pr32219.patch
> +++ /dev/null
> @@ -1,72 +0,0 @@
> -Upstream-Status:Backport
> -Hi,
> -
> -As suggested by richi.
> -regtested on i686-linux-gnu with all default languages and no =
regressions.
> -Ok for trunk?
> -
> -gcc/ChangeLog
> -2010-03-15  Bernhard Reutner-Fischer  <aldot@gcc.gnu.org>
> -
> -	PR target/32219
> -	* varasm.c (default_binds_local_p_1): Weak data is not local.
> -
> -gcc/testsuite/ChangeLog
> -2010-03-15  Bernhard Reutner-Fischer  <aldot@gcc.gnu.org>
> -
> -	PR target/32219
> -	* gcc.dg/visibility-21.c: New test.
> -
> -Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> ----
> - gcc/testsuite/gcc.dg/visibility-21.c |   14 ++++++++++++++
> - gcc/varasm.c                         |    8 ++++----
> - 2 files changed, 18 insertions(+), 4 deletions(-)
> - create mode 100644 gcc/testsuite/gcc.dg/visibility-21.c
> -
> -Index: gcc-4_7-branch/gcc/testsuite/gcc.dg/visibility-21.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- /dev/null	1970-01-01 00:00:00.000000000 +0000
> -+++ gcc-4_7-branch/gcc/testsuite/gcc.dg/visibility-21.c	=
2012-04-10 10:39:38.083396738 -0700
> -@@ -0,0 +1,14 @@
> -+/* PR target/32219 */
> -+/* { dg-do run } */
> -+/* { dg-require-visibility "" } */
> -+/* { dg-options "-fPIC" { target fpic } } */
> -+
> -+extern void f() __attribute__((weak,visibility("hidden")));
> -+extern int puts( char const* );
> -+int main()
> -+{
> -+	if (f)
> -+		f();
> -+	return 0;
> -+}
> -+
> -Index: gcc-4_7-branch/gcc/varasm.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4_7-branch.orig/gcc/varasm.c	2012-04-10 10:17:24.127330049 =
-0700
> -+++ gcc-4_7-branch/gcc/varasm.c	2012-04-10 10:39:38.087396414 =
-0700
> -@@ -6937,6 +6937,10 @@
> -   /* Static variables are always local.  */
> -   else if (! TREE_PUBLIC (exp))
> -     local_p =3D true;
> -+  /* hidden weak can't be overridden by something non-local, all
> -+     that is possible is that it is not defined at all. */
> -+  else if (DECL_WEAK (exp))
> -+    local_p =3D false;
> -   /* A variable is local if the user has said explicitly that it =
will
> -      be.  */
> -   else if ((DECL_VISIBILITY_SPECIFIED (exp)
> -@@ -6950,11 +6954,6 @@
> -      local.  */
> -   else if (DECL_VISIBILITY (exp) !=3D VISIBILITY_DEFAULT)
> -     local_p =3D true;
> --  /* Default visibility weak data can be overridden by a strong =
symbol
> --     in another module and so are not local.  */
> --  else if (DECL_WEAK (exp)
> --	   && !resolved_locally)
> --    local_p =3D false;
> -   /* If PIC, then assume that any global name can be overridden by
> -      symbols resolved from other modules.  */
> -   else if (shlib)
> diff --git =
a/meta/recipes-devtools/gcc/gcc-4.8/use-defaults.h-and-t-oe-in-B.patch =
b/meta/recipes-devtools/gcc/gcc-4.8/use-defaults.h-and-t-oe-in-B.patch
> deleted file mode 100644
> index 212c263..0000000
> --- =
a/meta/recipes-devtools/gcc/gcc-4.8/use-defaults.h-and-t-oe-in-B.patch
> +++ /dev/null
> @@ -1,77 +0,0 @@
> -Upstream-Status: Pending
> -
> -Use the defaults.h in ${B} instead of ${S}, and t-oe in ${B}, so that
> -the source can be shared between gcc-cross-initial,
> -gcc-cross-intermediate, gcc-cross, gcc-runtime, and also the sdk =
build.
> ----
> - gcc/Makefile.in  |    2 +-
> - gcc/configure    |    4 ++--
> - gcc/configure.ac |    4 ++--
> - gcc/mkconfig.sh  |    4 ++--
> - 4 files changed, 7 insertions(+), 7 deletions(-)
> -
> -Index: gcc-4_7-branch/gcc/Makefile.in
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4_7-branch.orig/gcc/Makefile.in	2012-04-10 =
10:37:09.347387424 -0700
> -+++ gcc-4_7-branch/gcc/Makefile.in	2012-04-10 10:39:24.019393881 =
-0700
> -@@ -481,7 +481,7 @@
> - TARGET_SYSTEM_ROOT =3D @TARGET_SYSTEM_ROOT@
> -=20
> - xmake_file=3D@xmake_file@
> --tmake_file=3D@tmake_file@
> -+tmake_file=3D@tmake_file@ ./t-oe
> - TM_ENDIAN_CONFIG=3D@TM_ENDIAN_CONFIG@
> - TM_MULTILIB_CONFIG=3D@TM_MULTILIB_CONFIG@
> - TM_MULTILIB_EXCEPTIONS_CONFIG=3D@TM_MULTILIB_EXCEPTIONS_CONFIG@
> -Index: gcc-4_7-branch/gcc/configure
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4_7-branch.orig/gcc/configure	2012-04-10 =
10:37:57.211389779 -0700
> -+++ gcc-4_7-branch/gcc/configure	2012-04-10 10:39:24.027393938 =
-0700
> -@@ -11692,8 +11692,8 @@
> -        tm_include_list=3D"${tm_include_list} $f"
> -        ;;
> -     defaults.h )
> --       tm_file_list=3D"${tm_file_list} \$(srcdir)/$f"
> --       tm_include_list=3D"${tm_include_list} $f"
> -+       tm_file_list=3D"${tm_file_list} ./$f"
> -+       tm_include_list=3D"${tm_include_list} ./$f"
> -        ;;
> -     * )
> -        tm_file_list=3D"${tm_file_list} \$(srcdir)/config/$f"
> -Index: gcc-4_7-branch/gcc/configure.ac
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4_7-branch.orig/gcc/configure.ac	2012-04-10 =
10:37:57.215389769 -0700
> -+++ gcc-4_7-branch/gcc/configure.ac	2012-04-10 10:39:24.027393938 =
-0700
> -@@ -1699,8 +1699,8 @@
> -        tm_include_list=3D"${tm_include_list} $f"
> -        ;;
> -     defaults.h )
> --       tm_file_list=3D"${tm_file_list} \$(srcdir)/$f"
> --       tm_include_list=3D"${tm_include_list} $f"
> -+       tm_file_list=3D"${tm_file_list} ./$f"
> -+       tm_include_list=3D"${tm_include_list} ./$f"
> -        ;;
> -     * )
> -        tm_file_list=3D"${tm_file_list} \$(srcdir)/config/$f"
> -Index: gcc-4_7-branch/gcc/mkconfig.sh
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4_7-branch.orig/gcc/mkconfig.sh	2012-04-10 =
10:17:24.383330061 -0700
> -+++ gcc-4_7-branch/gcc/mkconfig.sh	2012-04-10 10:39:24.027393938 =
-0700
> -@@ -78,7 +78,7 @@
> -     if [ $# -ge 1 ]; then
> - 	echo '#ifdef IN_GCC' >> ${output}T
> - 	for file in "$@"; do
> --	    if test x"$file" =3D x"defaults.h"; then
> -+	    if test x"$file" =3D x"./defaults.h"; then
> - 		postpone_defaults_h=3D"yes"
> - 	    else
> - 		echo "# include \"$file\"" >> ${output}T
> -@@ -104,7 +104,7 @@
> -=20
> - # If we postponed including defaults.h, add the #include now.
> - if test x"$postpone_defaults_h" =3D x"yes"; then
> --    echo "# include \"defaults.h\"" >> ${output}T
> -+    echo "# include \"./defaults.h\"" >> ${output}T
> - fi
> -=20
> - # Add multiple inclusion protection guard, part two.
> diff --git =
a/meta/recipes-devtools/gcc/gcc-4.8/use-ml-conf-files-from-B.patch =
b/meta/recipes-devtools/gcc/gcc-4.8/use-ml-conf-files-from-B.patch
> deleted file mode 100644
> index 4d22924..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.8/use-ml-conf-files-from-B.patch
> +++ /dev/null
> @@ -1,87 +0,0 @@
> -Use the multilib config files from ${B} instead of using the ones =
from ${S}
> -so that the source can be shared between gcc-cross-initial,
> -gcc-cross-intermediate, gcc-cross, gcc-runtime, and also the sdk =
build.
> -
> -Upstream-Status: Inappropriate [configuration]
> -Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> -
> -Index: gcc-4.7.2/gcc/configure
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.7.2.orig/gcc/configure
> -+++ gcc-4.7.2/gcc/configure
> -@@ -11717,10 +11717,20 @@ done
> - tmake_file_=3D
> - for f in ${tmake_file}
> - do
> --	if test -f ${srcdir}/config/$f
> --	then
> --		tmake_file_=3D"${tmake_file_} \$(srcdir)/config/$f"
> --	fi
> -+  case $f in
> -+    */t-linux64 )
> -+       if test -f ./config/$f
> -+       then
> -+         tmake_file_=3D"${tmake_file_} ./config/$f"
> -+       fi
> -+       ;;
> -+    * )
> -+       if test -f ${srcdir}/config/$f
> -+       then
> -+         tmake_file_=3D"${tmake_file_} \$(srcdir)/config/$f"
> -+       fi
> -+       ;;
> -+  esac
> - done
> - tmake_file=3D"${tmake_file_}"
> -=20
> -@@ -11731,6 +11741,10 @@ tm_file_list=3D"options.h"
> - tm_include_list=3D"options.h insn-constants.h"
> - for f in $tm_file; do
> -   case $f in
> -+    */linux64.h )
> -+       tm_file_list=3D"${tm_file_list} ./config/$f"
> -+       tm_include_list=3D"${tm_include_list} ./config/$f"
> -+       ;;
> -     ./* )
> -        f=3D`echo $f | sed 's/^..//'`
> -        tm_file_list=3D"${tm_file_list} $f"
> -Index: gcc-4.7.2/gcc/configure.ac
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.7.2.orig/gcc/configure.ac
> -+++ gcc-4.7.2/gcc/configure.ac
> -@@ -1701,10 +1701,20 @@ done
> - tmake_file_=3D
> - for f in ${tmake_file}
> - do
> --	if test -f ${srcdir}/config/$f
> --	then
> --		tmake_file_=3D"${tmake_file_} \$(srcdir)/config/$f"
> --	fi
> -+  case $f in
> -+    */t-linux64 )
> -+       if test -f ./config/$f
> -+       then
> -+         tmake_file_=3D"${tmake_file_} ./config/$f"
> -+       fi
> -+       ;;
> -+    * )
> -+       if test -f ${srcdir}/config/$f
> -+       then
> -+         tmake_file_=3D"${tmake_file_} \$(srcdir)/config/$f"
> -+       fi
> -+       ;;
> -+  esac
> - done
> - tmake_file=3D"${tmake_file_}"
> -=20
> -@@ -1715,6 +1725,10 @@ tm_file_list=3D"options.h"
> - tm_include_list=3D"options.h insn-constants.h"
> - for f in $tm_file; do
> -   case $f in
> -+    */linux64.h )
> -+       tm_file_list=3D"${tm_file_list} ./config/$f"
> -+       tm_include_list=3D"${tm_include_list} ./config/$f"
> -+       ;;
> -     ./* )
> -        f=3D`echo $f | sed 's/^..//'`
> -        tm_file_list=3D"${tm_file_list} $f"
> diff --git =
a/meta/recipes-devtools/gcc/gcc-4.8/wcast-qual-PR55383.patch =
b/meta/recipes-devtools/gcc/gcc-4.8/wcast-qual-PR55383.patch
> deleted file mode 100644
> index 1c22bd8..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.8/wcast-qual-PR55383.patch
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -This is a backport from gcc bugzilla
> -
> -http://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D55383
> -
> -fixes wrong warning behavior which has no workaround
> -other than disabling the warning
> -
> -Upstream-Status: Backport
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Index: gcc-4.8.0/gcc/c/c-typeck.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.8.0.orig/gcc/c/c-typeck.c	2013-01-24 08:59:44.000000000 =
-0800
> -+++ gcc-4.8.0/gcc/c/c-typeck.c	2013-03-26 17:28:30.286137332 =
-0700
> -@@ -4464,7 +4464,7 @@
> -     /* There are qualifiers present in IN_OTYPE that are not present
> -        in IN_TYPE.  */
> -     warning_at (loc, OPT_Wcast_qual,
> --		"cast discards %q#v qualifier from pointer target type",
> -+		"cast discards %qv qualifier from pointer target type",
> - 		discarded);
> -=20
> -   if (added || discarded)
> -Index: gcc-4.8.0/gcc/testsuite/c-c++-common/Wcast-qual-1.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4.8.0.orig/gcc/testsuite/c-c++-common/Wcast-qual-1.c	=
2011-04-07 14:47:38.000000000 -0700
> -+++ gcc-4.8.0/gcc/testsuite/c-c++-common/Wcast-qual-1.c	=
2013-03-26 17:31:56.454141202 -0700
> -@@ -85,11 +85,11 @@
> - void
> - f4 (void * const **bar)
> - {
> --  const void ***p9 =3D (const void ***) bar; /* { dg-warning "cast" =
} */
> -+  const void ***p9 =3D (const void ***) bar; /* { dg-warning "cast =
discards .const. qualifier" } */
> -   void * const **p11 =3D (void * const **) bar;
> --  void ** const *p13 =3D (void ** const *) bar; /* { dg-warning =
"cast" } */
> -+  void ** const *p13 =3D (void ** const *) bar; /* { dg-warning =
"cast discards .const. qualifier" } */
> -   const void * const **p15 =3D (const void * const **) bar; /* { =
dg-warning "cast" } */
> --  const void ** const *p17 =3D (const void ** const *) bar; /* { =
dg-warning "cast" } */
> -+  const void ** const *p17 =3D (const void ** const *) bar; /* { =
dg-warning "cast discards .const. qualifier" } */
> -   void * const * const * p19 =3D (void * const * const *) bar;
> -   const void * const * const *p21 =3D (const void * const * const *) =
bar;
> - }
> --=20
> 1.7.10.4
>=20



