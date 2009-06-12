Received: from [209.85.146.180] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MFD0F-0002vF-0R
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Jun 2009 22:05:31 +0200
Received: by wa-out-1112.google.com with SMTP id j4so412817wah.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jun 2009 12:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:user-agent:cc:references:in-reply-to:mime-version:content-type
	:content-transfer-encoding:message-id;
	bh=f1lWERNL41nY2Y1Q4TXh8aWRjrmfr4B+BpVEmOxpeoU=;
	b=bXT/yq4ZC91Chp67IbTrkbTyOYzwkoRZo2HPrTvq8u88DKemMBMVN5MevZyZw0uQdE
	kC4lf79090Nnon7MyUuMQGbw7toxPCa37mN9f/NwK7mSYpTlqbDwus3+86jQoyNr/r+B
	PmG39ftJ8wFyakxe6iWNmgEcEAf5W9DBrfBO0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:user-agent:cc:references:in-reply-to
	:mime-version:content-type:content-transfer-encoding:message-id;
	b=hw/1UIvOmq68dmAZ/rTuoN7etP7xFITZx0g+Pwj2HapNAspLS/EWm6kuCZqqc190sS
	50ESLFtnpG5Et9WblX4QTpLiGqhLejBOrXezOeoWmWst031gWlvzzi6FwGmCMmQW87kb
	+KRc+axCkF0EF30HHqaorL2xo861+oybh+CNc=
Received: by 10.114.190.18 with SMTP id n18mr6411823waf.179.1244836534393;
	Fri, 12 Jun 2009 12:55:34 -0700 (PDT)
Received: from morpheus.localnet (adsl-71-146-3-71.dsl.pltn13.sbcglobal.net
	[71.146.3.71])
	by mx.google.com with ESMTPS id n40sm1505641wag.30.2009.06.12.12.55.32
	(version=SSLv3 cipher=RC4-MD5); Fri, 12 Jun 2009 12:55:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Jun 2009 12:55:27 -0700
User-Agent: KMail/1.11.90 (Linux/2.6.28-13-generic; KDE/4.2.90; x86_64; ; )
References: <20090505164137.GJ7973@smtp.west.cox.net>
In-Reply-To: <20090505164137.GJ7973@smtp.west.cox.net>
MIME-Version: 1.0
Message-Id: <200906121255.32105.raj.khem@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@openembedded.org>
Subject: Re: [PATCH] Fix staging of binutils static libraries
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
X-List-Received-Date: Fri, 12 Jun 2009 20:05:31 -0000
X-Groupsio-MsgNum: 11239
Content-Type: multipart/signed; boundary="nextPart2342003.Ru0BsWCP4q";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart2342003.Ru0BsWCP4q
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Tuesday 05 May 2009 09:41:38 am Tom Rini wrote:
> binutils-cross: Stage libbfd/opcodes/iberty correctly, bump PR
>=20
> Changes the staging path for libbfd and libopcodes to ${CROSS_DIR}/lib.
> Disables staging native libiberty.a to ${STAGING_DIR_TARGET} as this does=
n't
> make sense to do.  Cleans up empty directories.
>=20
> Signed-off-by: Nikita Shulga <nshulga@embeddedalley.com>
> Signed-off-by: Tom Rini <trini@embeddedalley.com>
> ---
>  recipes/binutils/binutils-cross.inc           |   28 +++++++++++++++++++=
=2D----
>  recipes/binutils/binutils_2.14.90.0.6.bb      |    2 +-
>  recipes/binutils/binutils_2.14.90.0.7.bb      |    2 +-
>  recipes/binutils/binutils_2.15.94.0.1.bb      |    2 +-
>  recipes/binutils/binutils_2.16.1.bb           |    2 +-
>  recipes/binutils/binutils_2.16.91.0.6.bb      |    2 +-
>  recipes/binutils/binutils_2.16.91.0.7.bb      |    2 +-
>  recipes/binutils/binutils_2.16.bb             |    2 +-
>  recipes/binutils/binutils_2.17.50.0.1.bb      |    2 +-
>  recipes/binutils/binutils_2.17.50.0.12.bb     |    2 +-
>  recipes/binutils/binutils_2.17.50.0.5.bb      |    2 +-
>  recipes/binutils/binutils_2.17.50.0.8.bb      |    2 +-
>  recipes/binutils/binutils_2.17.bb             |    2 +-
>  recipes/binutils/binutils_2.18.50.0.7.bb      |    2 +-
>  recipes/binutils/binutils_2.18.bb             |    2 +-
>  recipes/binutils/binutils_2.19.1.bb           |    2 +-
>  recipes/binutils/binutils_2.19.bb             |    2 +-
>  recipes/binutils/binutils_csl-arm-20050416.bb |    2 +-
>  recipes/binutils/binutils_csl-arm-20050603.bb |    2 +-
>  recipes/binutils/binutils_cvs.bb              |    2 +-
>  20 files changed, 41 insertions(+), 25 deletions(-)
>=20
> diff --git a/recipes/binutils/binutils-cross.inc b/recipes/binutils/binut=
ils-cross.inc
> index 384d18c..872b04a 100644
> --- a/recipes/binutils/binutils-cross.inc
> +++ b/recipes/binutils/binutils-cross.inc
> @@ -23,12 +23,28 @@ do_stage () {
>  	rmdir ${CROSS_DIR}/${libdir}64 || :
>  	rmdir ${CROSS_DIR}/${prefix} || :
> =20
> -	# We want to move this into the target specific location
> -	mkdir -p ${STAGING_DIR_TARGET}/lib
> -	mv -f ${CROSS_DIR}/lib/libiberty.a ${STAGING_DIR_TARGET}/lib || \
> -		mv -f ${CROSS_DIR}/lib64/libiberty.a ${STAGING_DIR_TARGET}/lib
> -	rmdir ${CROSS_DIR}/lib || :
> -	rmdir ${CROSS_DIR}/lib64 || :
> +	LIBBFD_DIR_BASE=3D${CROSS_DIR}/${BUILD_SYS}/${TARGET_SYS}
> +	# We want to move libbfd and libopcodes to  ${CROSS_DIR}/lib
> +	mkdir -p ${CROSS_DIR}/lib
> +	mv -f ${LIBBFD_DIR_BASE}/lib/* ${CROSS_DIR}/lib || \
> +		mv -f ${LIBBFD_DIR_BASE}/lib64/* ${CROSS_DIR}/lib
> +	rmdir ${LIBBFD_DIR_BASE}/lib || :
> +	rmdir ${LIBBFD_DIR_BASE}/lib64 || :
> +=09
> +	# Adjust libbfd.la and libopcodes.la
> +	for i in libbfd.la libopcodes.la; do
> +	sed -i -e "s@${LIBBFD_DIR_BASE}/lib64@${CROSS_DIR}/lib@" ${CROSS_DIR}/l=
ib/$i
> +	sed -i -e "s@${LIBBFD_DIR_BASE}/lib@${CROSS_DIR}/lib@" ${CROSS_DIR}/lib=
/$i
> +	done
> +
> +	# libbfd headers should be moved as well
> +	mkdir -p ${CROSS_DIR}/include
> +	mv -f ${LIBBFD_DIR_BASE}/include/* ${CROSS_DIR}/include
> +	rmdir ${LIBBFD_DIR_BASE}/include=20
> +
> +	# Remove empty directories
> +	rmdir ${CROSS_DIR}/${BUILD_SYS}/${TARGET_SYS} || :
> +	rmdir ${CROSS_DIR}/${BUILD_SYS} || :
>  }
> =20
>  do_install () {
> diff --git a/recipes/binutils/binutils_2.14.90.0.6.bb b/recipes/binutils/=
binutils_2.14.90.0.6.bb
> index eb72082..bdbbcff 100644
> --- a/recipes/binutils/binutils_2.14.90.0.6.bb
> +++ b/recipes/binutils/binutils_2.14.90.0.6.bb
> @@ -1,7 +1,7 @@
>  SECTION =3D "devel"
>  inherit autotools gettext
> =20
> -PR =3D "r5"
> +PR =3D "r6"
> =20
>  DESCRIPTION =3D "A GNU collection of binary utilities"
>  HOMEPAGE =3D "http://www.gnu.org/software/binutils/"
> diff --git a/recipes/binutils/binutils_2.14.90.0.7.bb b/recipes/binutils/=
binutils_2.14.90.0.7.bb
> index f940c87..e58d0cc 100644
> --- a/recipes/binutils/binutils_2.14.90.0.7.bb
> +++ b/recipes/binutils/binutils_2.14.90.0.7.bb
> @@ -4,7 +4,7 @@ inherit autotools gettext
>  DESCRIPTION =3D "A GNU collection of binary utilities"
>  HOMEPAGE =3D "http://www.gnu.org/software/binutils/"
>  LICENSE =3D "GPL"
> -PR =3D "r6"
> +PR =3D "r7"
> =20
>  PACKAGES =3D "${PN} ${PN}-dev ${PN}-doc ${PN}-symlinks"
> =20
> diff --git a/recipes/binutils/binutils_2.15.94.0.1.bb b/recipes/binutils/=
binutils_2.15.94.0.1.bb
> index 74a902b..b73e862 100644
> --- a/recipes/binutils/binutils_2.15.94.0.1.bb
> +++ b/recipes/binutils/binutils_2.15.94.0.1.bb
> @@ -2,7 +2,7 @@ DESCRIPTION =3D "A GNU collection of binary utilities"
>  HOMEPAGE =3D "http://www.gnu.org/software/binutils/"
>  SECTION =3D "devel"
>  LICENSE =3D "GPL"
> -PR =3D "r5"
> +PR =3D "r6"
> =20
>  inherit autotools gettext
> =20
> diff --git a/recipes/binutils/binutils_2.16.1.bb b/recipes/binutils/binut=
ils_2.16.1.bb
> index 8235300..64ae34d 100644
> --- a/recipes/binutils/binutils_2.16.1.bb
> +++ b/recipes/binutils/binutils_2.16.1.bb
> @@ -1,4 +1,4 @@
> -PR =3D "r1"
> +PR =3D "r2"
> =20
>  CROSSTOOL_PATCH_URL =3D "http://www.kegel.com/crosstool/crosstool-0.43/p=
atches/binutils-2.16.1/"
>  SRC_URI =3D \
> diff --git a/recipes/binutils/binutils_2.16.91.0.6.bb b/recipes/binutils/=
binutils_2.16.91.0.6.bb
> index b251149..d2701c2 100644
> --- a/recipes/binutils/binutils_2.16.91.0.6.bb
> +++ b/recipes/binutils/binutils_2.16.91.0.6.bb
> @@ -2,7 +2,7 @@ DESCRIPTION =3D "A GNU collection of binary utilities"
>  HOMEPAGE =3D "http://www.gnu.org/software/binutils/"
>  SECTION =3D "devel"
>  LICENSE =3D "GPL"
> -PR =3D "r3"
> +PR =3D "r4"
> =20
>  # glibc 2.3 has issues with this version
>  # of binutils.
> diff --git a/recipes/binutils/binutils_2.16.91.0.7.bb b/recipes/binutils/=
binutils_2.16.91.0.7.bb
> index 76c1285..7a53dd0 100644
> --- a/recipes/binutils/binutils_2.16.91.0.7.bb
> +++ b/recipes/binutils/binutils_2.16.91.0.7.bb
> @@ -3,7 +3,7 @@ HOMEPAGE =3D "http://www.gnu.org/software/binutils/"
>  SECTION =3D "devel"
>  LICENSE =3D "GPL"
>  DEFAULT_PREFERENCE =3D "-1"
> -PR =3D "r2"
> +PR =3D "r3"
> =20
>  inherit autotools gettext
> =20
> diff --git a/recipes/binutils/binutils_2.16.bb b/recipes/binutils/binutil=
s_2.16.bb
> index 9035b44..c3dd6df 100644
> --- a/recipes/binutils/binutils_2.16.bb
> +++ b/recipes/binutils/binutils_2.16.bb
> @@ -1,4 +1,4 @@
> -PR =3D "r10"
> +PR =3D "r11"
> =20
>  SRC_URI =3D \
>      "${GNU_MIRROR}/binutils/binutils-${PV}.tar.bz2 \
> diff --git a/recipes/binutils/binutils_2.17.50.0.1.bb b/recipes/binutils/=
binutils_2.17.50.0.1.bb
> index 76c1285..7a53dd0 100644
> --- a/recipes/binutils/binutils_2.17.50.0.1.bb
> +++ b/recipes/binutils/binutils_2.17.50.0.1.bb
> @@ -3,7 +3,7 @@ HOMEPAGE =3D "http://www.gnu.org/software/binutils/"
>  SECTION =3D "devel"
>  LICENSE =3D "GPL"
>  DEFAULT_PREFERENCE =3D "-1"
> -PR =3D "r2"
> +PR =3D "r3"
> =20
>  inherit autotools gettext
> =20
> diff --git a/recipes/binutils/binutils_2.17.50.0.12.bb b/recipes/binutils=
/binutils_2.17.50.0.12.bb
> index d24d24e..84f608b 100644
> --- a/recipes/binutils/binutils_2.17.50.0.12.bb
> +++ b/recipes/binutils/binutils_2.17.50.0.12.bb
> @@ -1,5 +1,5 @@
>  require binutils.inc
> -PR =3D "r2"
> +PR =3D "r3"
> =20
>  SRC_URI =3D \
>      "${KERNELORG_MIRROR}/pub/linux/devel/binutils/binutils-${PV}.tar.bz2=
 \
> diff --git a/recipes/binutils/binutils_2.17.50.0.5.bb b/recipes/binutils/=
binutils_2.17.50.0.5.bb
> index 1d1c3fb..041c5d7 100644
> --- a/recipes/binutils/binutils_2.17.50.0.5.bb
> +++ b/recipes/binutils/binutils_2.17.50.0.5.bb
> @@ -1,6 +1,6 @@
>  require binutils.inc
> =20
> -PR =3D "r3"
> +PR =3D "r4"
> =20
>  SRC_URI =3D \
>      "${KERNELORG_MIRROR}/pub/linux/devel/binutils/binutils-${PV}.tar.bz2=
 \
> diff --git a/recipes/binutils/binutils_2.17.50.0.8.bb b/recipes/binutils/=
binutils_2.17.50.0.8.bb
> index f659b3b..1d1c3fb 100644
> --- a/recipes/binutils/binutils_2.17.50.0.8.bb
> +++ b/recipes/binutils/binutils_2.17.50.0.8.bb
> @@ -1,6 +1,6 @@
>  require binutils.inc
> =20
> -PR =3D "r2"
> +PR =3D "r3"
> =20
>  SRC_URI =3D \
>      "${KERNELORG_MIRROR}/pub/linux/devel/binutils/binutils-${PV}.tar.bz2=
 \
> diff --git a/recipes/binutils/binutils_2.17.bb b/recipes/binutils/binutil=
s_2.17.bb
> index 0f0b5d6..fdee8a5 100644
> --- a/recipes/binutils/binutils_2.17.bb
> +++ b/recipes/binutils/binutils_2.17.bb
> @@ -1,7 +1,7 @@
>  require binutils.inc
>  require binutils-avr32.inc
> =20
> -PR =3D "r6"
> +PR =3D "r7"
> =20
>  SRC_URI =3D \
>      "http://ftp.gnu.org/gnu/binutils/binutils-${PV}.tar.bz2 \
> diff --git a/recipes/binutils/binutils_2.18.50.0.7.bb b/recipes/binutils/=
binutils_2.18.50.0.7.bb
> index a89431e..d9a9cec 100644
> --- a/recipes/binutils/binutils_2.18.50.0.7.bb
> +++ b/recipes/binutils/binutils_2.18.50.0.7.bb
> @@ -1,4 +1,4 @@
> -PR =3D "r6"
> +PR =3D "r7"
> =20
>  require binutils.inc
> =20
> diff --git a/recipes/binutils/binutils_2.18.bb b/recipes/binutils/binutil=
s_2.18.bb
> index 9367196..b746f9b 100644
> --- a/recipes/binutils/binutils_2.18.bb
> +++ b/recipes/binutils/binutils_2.18.bb
> @@ -1,4 +1,4 @@
> -PR =3D "r4"
> +PR =3D "r5"
> =20
>  require binutils.inc
> =20
> diff --git a/recipes/binutils/binutils_2.19.1.bb b/recipes/binutils/binut=
ils_2.19.1.bb
> index c399ab8..aee5840 100644
> --- a/recipes/binutils/binutils_2.19.1.bb
> +++ b/recipes/binutils/binutils_2.19.1.bb
> @@ -1,4 +1,4 @@
> -PR =3D "r0"
> +PR =3D "r1"
> =20
>  require binutils.inc
> =20
> diff --git a/recipes/binutils/binutils_2.19.bb b/recipes/binutils/binutil=
s_2.19.bb
> index aee5840..ef07600 100644
> --- a/recipes/binutils/binutils_2.19.bb
> +++ b/recipes/binutils/binutils_2.19.bb
> @@ -1,4 +1,4 @@
> -PR =3D "r1"
> +PR =3D "r2"
> =20
>  require binutils.inc
> =20
> diff --git a/recipes/binutils/binutils_csl-arm-20050416.bb b/recipes/binu=
tils/binutils_csl-arm-20050416.bb
> index 2c7c207..342572d 100644
> --- a/recipes/binutils/binutils_csl-arm-20050416.bb
> +++ b/recipes/binutils/binutils_csl-arm-20050416.bb
> @@ -6,7 +6,7 @@ HOMEPAGE =3D "http://www.gnu.org/software/binutils/"
>  LICENSE =3D "GPL"
>  FILESDIR =3D "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/binutils-c=
vs"
>  PV =3D "2.15.99+csl-arm+cvs20050416"
> -PR =3D "r3"
> +PR =3D "r4"
>  OVERRIDES_append =3D ":${TARGET_ARCH}-${TARGET_OS}"
>  DEFAULT_PREFERENCE =3D "-1"
>  DEFAULT_PREFERENCE_arm-linux =3D "-1"
> diff --git a/recipes/binutils/binutils_csl-arm-20050603.bb b/recipes/binu=
tils/binutils_csl-arm-20050603.bb
> index 13759b4..8a9c0ce 100644
> --- a/recipes/binutils/binutils_csl-arm-20050603.bb
> +++ b/recipes/binutils/binutils_csl-arm-20050603.bb
> @@ -6,7 +6,7 @@ HOMEPAGE =3D "http://www.gnu.org/software/binutils/"
>  LICENSE =3D "GPL"
>  FILESDIR =3D "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/binutils-c=
vs"
>  PV =3D "2.15.99+csl-arm+cvs20050603"
> -PR =3D "r3"
> +PR =3D "r4"
>  OVERRIDES_append =3D ":${TARGET_ARCH}-${TARGET_OS}"
>  DEFAULT_PREFERENCE =3D "-1"
>  #DEFAULT_PREFERENCE_arm-linux =3D "1"
> diff --git a/recipes/binutils/binutils_cvs.bb b/recipes/binutils/binutils=
_cvs.bb
> index 75c8886..0c2064b 100644
> --- a/recipes/binutils/binutils_cvs.bb
> +++ b/recipes/binutils/binutils_cvs.bb
> @@ -1,6 +1,6 @@
>  FILESDIR =3D "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/binutils-c=
vs"
>  PV =3D "0.0+cvs${SRCDATE}"
> -PR =3D "r0"
> +PR =3D "r1"
> =20
>  require binutils.inc
> =20
>=20
seems ok. I hope you have tested it on 64 bit hosts as well.

Acked-by: Khem Raj  <raj.khem@gmail.com>
=2D-=20
Khem Raj

--nextPart2342003.Ru0BsWCP4q
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkoysq8ACgkQHnJKy6V6em59sgCeJGFl3GFO0uRow3r9flLZkZ0M
4EUAn0KBbcIVCrVcyhvlVkDa4p2BYIuU
=KX7L
-----END PGP SIGNATURE-----

--nextPart2342003.Ru0BsWCP4q--
