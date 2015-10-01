Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 6B0EC76F56
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Oct 2015 15:05:46 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so33022507wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Oct 2015 08:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=tlfSwhEt05jYyJixYLRqicIotGA/jaehO5cZZexxSuA=;
	b=ad4RKRf30qG5hc7RQ6M+E7Ek1Six6Asa3OEvrQESInElcjExGPEkxAHZsovQEWmYC9
	i2g6BF6qxNazOlkAjzn06KosVgJPur95t+ReIIzWPvYmxsbnSg9ZLX/WEToxFMRV3/Y0
	s9HDtLIipMH282JGNRGuW3APp7o0STYy3EQjsrFm024FgKVTVMQmHxMmtLS7BZoOIFdZ
	VFdm7TubyFD27zlZ/qJTHrN4MamQJ/lywb7oSwgdOUq+nWFx7g6Gcz60Q/igYsMxzJ1B
	Uf8HKhhhKAispZIu1F2JmTvsRRMBStDJeH/xZFlC8qpMQ7GjP+/q5+U7uU7XEAlQUZvs
	7uHA==
X-Received: by 10.194.62.137 with SMTP id y9mr10856662wjr.136.1443711946737;
	Thu, 01 Oct 2015 08:05:46 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id t7sm3632837wia.9.2015.10.01.08.05.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Oct 2015 08:05:45 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 1 Oct 2015 17:06:45 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151001150645.GC2403@jama>
References: <20150718003812.GA18468@dent.vctlabs.com>
MIME-Version: 1.0
In-Reply-To: <20150718003812.GA18468@dent.vctlabs.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-oe][meta-filesystems][PATCH 1/2] libimobiledevice: remove runtime configure check
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Oct 2015 15:05:47 -0000
X-Groupsio-MsgNum: 57626
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7qSK/uQB79J36Y4o"
Content-Disposition: inline

--7qSK/uQB79J36Y4o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 17, 2015 at 05:38:12PM -0700, S. Lockwood-Childs wrote:
> configure.ac had a runtime check for large file support that got run
> on 64-bit architectures, and all runtime checks must go away to be
> cross-compile safe.
>=20
> Luckily that runtime check was extraneous, so just remove it;
> standard AC_SYS_LARGEFILE macro should be sufficient for figuring out
> proper settings to get large file support.
>=20
> Also un-blacklist libimobiledevice, since this problem was the
> reason for the blacklist.

There is another issue, probably triggered by switch to gcc-5, are you
willing to fix it?

| /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/l=
ibimobiledevice/1.1.4-r0/libimobiledevice-1.1.4/src/afc.c:258: error: undef=
ined reference to 'debug_buffer'
| /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/l=
ibimobiledevice/1.1.4-r0/libimobiledevice-1.1.4/src/afc.c:273: error: undef=
ined reference to 'debug_buffer'
| /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/l=
ibimobiledevice/1.1.4-r0/libimobiledevice-1.1.4/src/afc.c:247: error: undef=
ined reference to 'debug_buffer'
| /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/l=
ibimobiledevice/1.1.4-r0/libimobiledevice-1.1.4/src/afc.c:258: error: undef=
ined reference to 'debug_buffer'
| collect2: error: ld returned 1 exit status
| make[2]: *** [libimobiledevice.la] Error 1
| make[2]: Leaving directory `/home/jenkins/oe/world/shr-core/tmp-glibc/wor=
k/armv5te-oe-linux-gnueabi/libimobiledevice/1.1.4-r0/build/src'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory `/home/jenkins/oe/world/shr-core/tmp-glibc/wor=
k/armv5te-oe-linux-gnueabi/libimobiledevice/1.1.4-r0/build'
| make: *** [all] Error 2

otherwise I'll blacklist it again in few days (it was reported in couple wo=
rld builds already).

>=20
> Signed-off-by: S. Lockwood-Childs <sjl@vctlabs.com>
> ---
>  .../files/configure-fix-largefile.patch            |   38 ++++++++++++++=
++++++
>  .../libimobiledevice/libimobiledevice_1.1.4.bb     |    6 +---
>  2 files changed, 39 insertions(+), 5 deletions(-)
>  create mode 100644 meta-oe/recipes-connectivity/libimobiledevice/files/c=
onfigure-fix-largefile.patch
>=20
> diff --git a/meta-oe/recipes-connectivity/libimobiledevice/files/configur=
e-fix-largefile.patch b/meta-oe/recipes-connectivity/libimobiledevice/files=
/configure-fix-largefile.patch
> new file mode 100644
> index 0000000..679a8b5
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/libimobiledevice/files/configure-fix-l=
argefile.patch
> @@ -0,0 +1,38 @@
> +Fix configure error in large file checks on 64-bit architectures
> +
> + configure:17888: checking for native large file support
> + configure:17891: error: in `/home/jenkins/oe/shr-core-branches/shr-core=
/tmp-eglibc/work/core2-64-oe-linux/libimobiledevice/1.1.4-r0/libimobiledevi=
ce-1.1.4':
> + configure:17893: error: cannot run test program while cross compiling
> +
> +configure.ac was using AC_SYS_LARGEFILE macro as is typical, but then
> +there was an extra runtime check added beyond that:
> +check if off_t is 8 bytes (64 bits) long.
> +If that runtime check passed, _FILE_OFFSET_BITS was defined as 64.
> +
> +Runtime checks need to go away for cross compiling, and luckily this ext=
ra
> +check was not serving any useful purpose. Note that off_t was *already*
> +64 bits, *without* setting _FILE_OFFSET_BITS, which makes _FILE_OFFSET_B=
ITS
> +unneeded for large file support.=20
> +
> +If AC_SYS_LARGEFILE macro sets ac_cv_sys_file_offset_bits=3Dno,
> +just leave _FILE_OFFSET_BITS undefined!
> +
> +--- libimobiledevice-1.1.4/configure.ac.old	2015-07-15 01:38:50.90014392=
7 -0700
> ++++ libimobiledevice-1.1.4/configure.ac	2015-07-15 01:39:13.300144430 -0=
700
> +@@ -174,16 +174,6 @@
> + if test "$enable_largefile" !=3D no; then
> +     if test "$ac_cv_sys_file_offset_bits" !=3D 'no'; then
> + 	LFS_CFLAGS=3D"$LFS_CFLAGS -D_FILE_OFFSET_BITS=3D$ac_cv_sys_file_offset=
_bits"
> +-    else
> +-	AC_MSG_CHECKING(for native large file support)
> +-	AC_RUN_IFELSE([AC_LANG_SOURCE([#include <unistd.h>
> +-	  int main (int argc, char **argv)
> +-	  {
> +-	      exit(!(sizeof(off_t) =3D=3D 8));
> +-	  }])],
> +-	[ac_cv_sys_file_offset_bits=3D64; AC_DEFINE(_FILE_OFFSET_BITS,64)
> +-	 AC_MSG_RESULT(yes)],
> +-	[AC_MSG_RESULT(no)])
> +     fi
> +     if test "$ac_cv_sys_large_files" !=3D 'no'; then
> + 	LFS_CFLAGS=3D"$LFS_CFLAGS -D_LARGE_FILES=3D1"
> diff --git a/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevi=
ce_1.1.4.bb b/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevic=
e_1.1.4.bb
> index 5256ce0..06260f7 100644
> --- a/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.=
4.bb
> +++ b/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.=
4.bb
> @@ -5,17 +5,13 @@ LIC_FILES_CHKSUM =3D "\
>      file://COPYING.LESSER;md5=3D6ab17b41640564434dda85c06b7124f7 \
>  "
> =20
> -#| configure:17888: checking for native large file support
> -#| configure:17891: error: in `/home/jenkins/oe/shr-core-branches/shr-co=
re/tmp-eglibc/work/core2-64-oe-linux/libimobiledevice/1.1.4-r0/libimobilede=
vice-1.1.4':
> -#| configure:17893: error: cannot run test program while cross compiling
> -PNBLACKLIST[libimobiledevice] ?=3D "cannot run test program while cross =
compiling"
> -
>  HOMEPAGE =3D"http://www.libimobiledevice.org/"
> =20
>  DEPENDS =3D "libplist usbmuxd libtasn1 gnutls libgcrypt"
> =20
>  SRC_URI =3D " \
>      http://www.libimobiledevice.org/downloads/libimobiledevice-${PV}.tar=
=2Ebz2 \
> +    file://configure-fix-largefile.patch \
>  "
> =20
>  SRC_URI[md5sum] =3D "3f28cbc6a2e30d34685049c0abde5183"
> --=20
> 1.7.10.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--7qSK/uQB79J36Y4o
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYNTAQACgkQN1Ujt2V2gBwDUQCghxCiAp5R2HkmQBC8tpn/EREN
SfoAnRLvsz8SuMb9VbF1MJ/M5JCMWXi5
=GBPk
-----END PGP SIGNATURE-----

--7qSK/uQB79J36Y4o--
