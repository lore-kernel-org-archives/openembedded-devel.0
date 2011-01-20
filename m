Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PfrY8-0006LR-T9 for openembedded-devel@lists.openembedded.org;
	Thu, 20 Jan 2011 11:15:28 +0100
Received: from f053039178.adsl.alicedsl.de ([78.53.39.178]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PfrXW-0004ts-77 for openembedded-devel@lists.openembedded.org;
	Thu, 20 Jan 2011 10:14:50 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1295392845.32079.37.camel@mattotaupa>
References: <1295220721.13967.13.camel@mattotaupa>
	<1295220990.13967.18.camel@mattotaupa>
	<1295221434.13967.25.camel@mattotaupa>  <ih0tnm$ra$1@dough.gmane.org>
	<1295264704.4844.54.camel@mattotaupa>
	<1295392845.32079.37.camel@mattotaupa>
Date: Thu, 20 Jan 2011 11:14:49 +0100
Message-ID: <1295518489.3692.0.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH] libomxil-bellagio_{0.9.2.1, git}: add patch: remove `-Werror` from `CFLAGS` to fix build with GCC 4.5
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
X-List-Received-Date: Thu, 20 Jan 2011 10:15:29 -0000
X-Groupsio-MsgNum: 28223
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-rUWmGZi4WSthEFjjIpRs"

--=-rUWmGZi4WSthEFjjIpRs
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Mittwoch, den 19.01.2011, 00:20 +0100 schrieb Paul Menzel:
> Date: Mon Jan 17 23:50:33 2011 +0100
>=20
> Am Montag, den 17.01.2011, 12:45 +0100 schrieb Paul Menzel:
> > Build tested with `angstrom-2008.1` for `MACHINE =3D "beagleboard"`. Wi=
th `angstrom-2010.x` it fails with the following error.
> >
> >         arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linu=
x-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=
=3Dsoftfp -mthumb-interwork -mno-thumb -DHAVE_CONFIG_H -I. -I../.. -isystem=
/oe/build-angstrom-next/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi=
/usr/include -I../../include -I../../src -isystem/oe/build-angstrom-next/an=
gstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include -fexpensive-o=
ptimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -Wall -Werr=
or -DCONFIG_DEBUG_LEVEL=3D0 -MT libomxbase_la-omx_base_component.lo -MD -MP=
 -MF .deps/libomxbase_la-omx_base_component.Tpo -c omx_base_component.c  -f=
PIC -DPIC -o .libs/libomxbase_la-omx_base_component.o
> >         cc1: warnings being treated as errors
> >         omx_base_component.c: In function 'omx_base_component_GetParame=
ter':
> >         omx_base_component.c:991:3: error: case value '2130706435' not =
in enumerated type 'OMX_INDEXTYPE'
> >         omx_base_component.c:918:3: error: case value '2130706436' not =
in enumerated type 'OMX_INDEXTYPE'
> >         make[3]: *** [libomxbase_la-omx_base_component.lo] Error 1
> >         make[3]: Leaving directory `/oe/build-angstrom-next/angstrom-de=
v/work/armv7a-angstrom-linux-gnueabi/libomxil-bellagio-0.9.2.1+gitr0+772f0e=
ca88b242ffb5469e8e381c63ce1f7cd3e1-r7.0/git/src/base'
>=20
> Upstream advised to remove `-Werror` and is looking into it [1]. OpenBric=
ks is applying the same patch [2].
>=20
> A similar patch would make 0.9.2 compile, but this one here does not appl=
y there (`CFLAGS=3D"${CFLAGS} -Werror"` instead of `CFLAGS=3D"${CFLAGS} -Wa=
ll -Werror"`).
>=20
> [1] http://sourceforge.net/mailarchive/message.php?msg_id=3D26911808
> [2] http://hg.openbricks.org/openbricks/rev/4f4ed3a596f2
>=20
> Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>

Please commit as I do not have commit access.


Thanks,

Paul

> ---
>  ...01-configure.ac-remove-Werror-from-CFLAGS.patch |   32 ++++++++++++++=
++++++
>  recipes/openmax/libomxil-bellagio_0.9.2.1.bb       |    4 ++
>  recipes/openmax/libomxil-bellagio_git.bb           |    3 ++
>  3 files changed, 39 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/openmax/libomxil-bellagio/0001-configure.ac-r=
emove-Werror-from-CFLAGS.patch
>=20
> diff --git a/recipes/openmax/libomxil-bellagio/0001-configure.ac-remove-W=
error-from-CFLAGS.patch b/recipes/openmax/libomxil-bellagio/0001-configure.=
ac-remove-Werror-from-CFLAGS.patch
> new file mode 100644
> index 0000000..1df2b26
> --- /dev/null
> +++ b/recipes/openmax/libomxil-bellagio/0001-configure.ac-remove-Werror-f=
rom-CFLAGS.patch
> @@ -0,0 +1,32 @@
> +From 85a2b9666ba2b65920f4ad0e2216405dc14340d4 Mon Sep 17 00:00:00 2001
> +From: Paul Menzel <paulepanter@users.sourceforge.net>
> +Date: Mon, 17 Jan 2011 23:35:18 +0100
> +Subject: [PATCH] configure.ac: remove `-Werror` from `CFLAGS`
> +
> +These options should be set when compiling the program and passed by an =
environment variable. Or there should be an option to turn these restrictiv=
e options off.
> +
> +Currently the build fails at least with GCC 4.5. It is known to work wit=
h GCC 4.3.3 [1].
> +
> +[1] http://sourceforge.net/mailarchive/message.php?msg_id=3D26911808
> +
> +Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
> +---
> + configure.ac |    2 +-
> + 1 files changed, 1 insertions(+), 1 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index d6e0bc9..fb5c8c8 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -5,7 +5,7 @@ AM_INIT_AUTOMAKE()
> + AC_PREREQ([2.59])
> +=20
> + AC_CONFIG_HEADERS([config.h])
> +-CFLAGS=3D"${CFLAGS} -Wall -Werror"
> ++CFLAGS=3D"${CFLAGS} -Wall"
> +=20
> + #######################################################################=
#########
> + # Set the shared versioning info, according to section 6.3 of the libto=
ol info #
> +--=20
> +1.7.2.3
> +
> diff --git a/recipes/openmax/libomxil-bellagio_0.9.2.1.bb b/recipes/openm=
ax/libomxil-bellagio_0.9.2.1.bb
> index f21c731..89f521a 100644
> --- a/recipes/openmax/libomxil-bellagio_0.9.2.1.bb
> +++ b/recipes/openmax/libomxil-bellagio_0.9.2.1.bb
> @@ -2,5 +2,9 @@ require ${PN}.inc
> =20
>  PR =3D "${INC_PR}.0"
> =20
> +SRC_URI +=3D " \
> +	file://0001-configure.ac-remove-Werror-from-CFLAGS.patch \
> +"
> +
>  SRC_URI[md5sum] =3D "323049db668ab260870fd7ecd2ec4156"
>  SRC_URI[sha256sum] =3D "75cf8d3b5cac2764420ae2cc7846b9bb12a47d2ca04c96e5=
821309b0124ddc72"
> diff --git a/recipes/openmax/libomxil-bellagio_git.bb b/recipes/openmax/l=
ibomxil-bellagio_git.bb
> index 4e28251..f58adf4 100644
> --- a/recipes/openmax/libomxil-bellagio_git.bb
> +++ b/recipes/openmax/libomxil-bellagio_git.bb
> @@ -4,6 +4,9 @@ PR =3D "${INC_PR}.0"
> =20
>  SRCREV =3D "772f0eca88b242ffb5469e8e381c63ce1f7cd3e1"
>  SRC_URI =3D "git://omxil.git.sourceforge.net/gitroot/omxil/omxil;protoco=
l=3Dgit"
> +SRC_URI +=3D " \
> +	file://0001-configure.ac-remove-Werror-from-CFLAGS.patch \
> +"
>  PV =3D "0.9.2.1"
>  PR =3D "${INC_PR}.0"
>  PR_append =3D "+gitr${SRCPV}"
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


--=-rUWmGZi4WSthEFjjIpRs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk04CxQACgkQPX1aK2wOHVifgQCgiemDYpcKH3PyvxpmlXdOftj9
NG4An1rV6TIaPq2Z+9/Zp8OPw0HBb4/i
=dxWd
-----END PGP SIGNATURE-----

--=-rUWmGZi4WSthEFjjIpRs--
