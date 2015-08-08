Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id 332F6767BF
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  8 Aug 2015 23:01:43 +0000 (UTC)
Received: by pacrr5 with SMTP id rr5so76658252pac.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 08 Aug 2015 16:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=TQ4MwCa8RmfCTpLibGrEhdYxdo1UvNFbW9lZol11kj4=;
	b=ME3rR9sxR1p36MBFHjgosK3H12nbFYw24zmwETeq1ijt2Pfx27jXIC4axDxoY5aGSb
	Hu303tpqELjdVnU+ffGKrSxCgBp5sreDnsWQJLP3G3SW4aEvffiAhMHX/GOfb1ARCF+8
	xH3lUp1af20iDbslJxXwusojeuuNWJU3ImaMVjHw1Jb2uhE6uwLodKjVhT8b2mmMFN/A
	b+fohfOy/VwQ2H8GPS4aVjrdwjqpsskp077mDwb3WUA1eTuu9e3TfCFbz62HbzC9idPv
	5nM2Ho63omM8V+DEXyoO6r+evVhBRssjhec0Uw1IkpCJAPKr71YZvlvn0FuwZZjCXcZa
	HDAA==
X-Received: by 10.66.101.71 with SMTP id fe7mr29871739pab.89.1439074903691;
	Sat, 08 Aug 2015 16:01:43 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:61b5:b56b:3665:2b08?
	([2601:646:8601:4580:61b5:b56b:3665:2b08])
	by smtp.gmail.com with ESMTPSA id
	l2sm14688073pdd.65.2015.08.08.16.01.42
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 08 Aug 2015 16:01:42 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20150718003812.GA18468@dent.vctlabs.com>
Date: Sat, 8 Aug 2015 16:01:38 -0700
Message-Id: <60400991-1BCD-4AED-93C2-3C5DA77CE88A@gmail.com>
References: <20150718003812.GA18468@dent.vctlabs.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2104)
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
X-List-Received-Date: Sat, 08 Aug 2015 23:01:44 -0000
X-Groupsio-MsgNum: 56612
Content-Type: multipart/signed;
	boundary="Apple-Mail=_9FE7F05B-66C4-479A-985D-2D9CB932230A";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_9FE7F05B-66C4-479A-985D-2D9CB932230A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jul 17, 2015, at 5:38 PM, S. Lockwood-Childs <sjl@vctlabs.com> =
wrote:
>=20
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
>=20

one difference is that now it will depend on --enable-largefile =
secondly, what does AC_SYS_LARGEFILE
check do in the end ? is it a link time check ?

> Signed-off-by: S. Lockwood-Childs <sjl@vctlabs.com>
> ---
> .../files/configure-fix-largefile.patch            |   38 =
++++++++++++++++++++
> .../libimobiledevice/libimobiledevice_1.1.4.bb     |    6 +---
> 2 files changed, 39 insertions(+), 5 deletions(-)
> create mode 100644 =
meta-oe/recipes-connectivity/libimobiledevice/files/configure-fix-largefil=
e.patch
>=20
> diff --git =
a/meta-oe/recipes-connectivity/libimobiledevice/files/configure-fix-largef=
ile.patch =
b/meta-oe/recipes-connectivity/libimobiledevice/files/configure-fix-largef=
ile.patch
> new file mode 100644
> index 0000000..679a8b5
> --- /dev/null
> +++ =
b/meta-oe/recipes-connectivity/libimobiledevice/files/configure-fix-largef=
ile.patch
> @@ -0,0 +1,38 @@
> +Fix configure error in large file checks on 64-bit architectures
> +
> + configure:17888: checking for native large file support
> + configure:17891: error: in =
`/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-oe-l=
inux/libimobiledevice/1.1.4-r0/libimobiledevice-1.1.4':
> + configure:17893: error: cannot run test program while cross =
compiling
> +
> +configure.ac was using AC_SYS_LARGEFILE macro as is typical, but then
> +there was an extra runtime check added beyond that:
> +check if off_t is 8 bytes (64 bits) long.
> +If that runtime check passed, _FILE_OFFSET_BITS was defined as 64.
> +
> +Runtime checks need to go away for cross compiling, and luckily this =
extra
> +check was not serving any useful purpose. Note that off_t was =
*already*
> +64 bits, *without* setting _FILE_OFFSET_BITS, which makes =
_FILE_OFFSET_BITS
> +unneeded for large file support.
> +
> +If AC_SYS_LARGEFILE macro sets ac_cv_sys_file_offset_bits=3Dno,
> +just leave _FILE_OFFSET_BITS undefined!
> +
> +--- libimobiledevice-1.1.4/configure.ac.old	2015-07-15 =
01:38:50.900143927 -0700
> ++++ libimobiledevice-1.1.4/configure.ac	2015-07-15 =
01:39:13.300144430 -0700
> +@@ -174,16 +174,6 @@
> + if test "$enable_largefile" !=3D no; then
> +     if test "$ac_cv_sys_file_offset_bits" !=3D 'no'; then
> + 	LFS_CFLAGS=3D"$LFS_CFLAGS =
-D_FILE_OFFSET_BITS=3D$ac_cv_sys_file_offset_bits"
> +-    else
> +-	AC_MSG_CHECKING(for native large file support)
> +-	AC_RUN_IFELSE([AC_LANG_SOURCE([#include <unistd.h>
> +-	  int main (int argc, char **argv)
> +-	  {
> +-	      exit(!(sizeof(off_t) =3D=3D 8));
> +-	  }])],
> +-	[ac_cv_sys_file_offset_bits=3D64; =
AC_DEFINE(_FILE_OFFSET_BITS,64)
> +-	 AC_MSG_RESULT(yes)],
> +-	[AC_MSG_RESULT(no)])
> +     fi
> +     if test "$ac_cv_sys_large_files" !=3D 'no'; then
> + 	LFS_CFLAGS=3D"$LFS_CFLAGS -D_LARGE_FILES=3D1"
> diff --git =
a/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.4.bb =
b/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.4.bb
> index 5256ce0..06260f7 100644
> --- =
a/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.4.bb
> +++ =
b/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.4.bb
> @@ -5,17 +5,13 @@ LIC_FILES_CHKSUM =3D "\
>     file://COPYING.LESSER;md5=3D6ab17b41640564434dda85c06b7124f7 \
> "
>=20
> -#| configure:17888: checking for native large file support
> -#| configure:17891: error: in =
`/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-oe-l=
inux/libimobiledevice/1.1.4-r0/libimobiledevice-1.1.4':
> -#| configure:17893: error: cannot run test program while cross =
compiling
> -PNBLACKLIST[libimobiledevice] ?=3D "cannot run test program while =
cross compiling"
> -
> HOMEPAGE =3D"http://www.libimobiledevice.org/"
>=20
> DEPENDS =3D "libplist usbmuxd libtasn1 gnutls libgcrypt"
>=20
> SRC_URI =3D " \
>     =
http://www.libimobiledevice.org/downloads/libimobiledevice-${PV}.tar.bz2 =
\
> +    file://configure-fix-largefile.patch \
> "
>=20
> SRC_URI[md5sum] =3D "3f28cbc6a2e30d34685049c0abde5183"
> --
> 1.7.10.4
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_9FE7F05B-66C4-479A-985D-2D9CB932230A
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXGilUACgkQuwUzVZGdMxTrRQCfUkyH/JMird3mpKL4S5BpKnaM
oOcAnA/Fli2VqagyDLZhEa/rkL+JOfHh
=gQct
-----END PGP SIGNATURE-----

--Apple-Mail=_9FE7F05B-66C4-479A-985D-2D9CB932230A--
