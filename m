Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QG4Xf-0005ke-6S for openembedded-devel@lists.openembedded.org;
	Sat, 30 Apr 2011 09:24:39 +0200
Received: from f053036151.adsl.alicedsl.de ([78.53.36.151]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QG4W5-0008Cd-Ew for openembedded-devel@lists.openembedded.org;
	Sat, 30 Apr 2011 07:23:01 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1304091838-23333-2-git-send-email-christian.charreyre@cioinfoindus.fr>
References: <1304091838-23333-1-git-send-email-christian.charreyre@cioinfoindus.fr>
	<1304091838-23333-2-git-send-email-christian.charreyre@cioinfoindus.fr>
Date: Sat, 30 Apr 2011 09:22:05 +0200
Message-ID: <1304148125.5773.6.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH v2] mypaint: new recipe for version 0.9.1
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
X-List-Received-Date: Sat, 30 Apr 2011 07:24:39 -0000
X-Groupsio-MsgNum: 31529
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-e+Bqf6MiSrrcVljjFlh0"

--=-e+Bqf6MiSrrcVljjFlh0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Christian,


thank you for your improved patch.

Am Freitag, den 29.04.2011, 17:43 +0200 schrieb C. Charreyre:

What distribution and machine do you use to build this?

I applied your patches. Unfortunately task compile fails with the
following error using `angstrom-2010.x` or `minimal` with `MACHINE =3D
"beagleboard".

        + scons_do_compile
        + '[' '' =3D 1 ']'
        + /oe/build-angstrom-next/angstrom-dev/sysroots/i686-linux/usr/bin/=
scons -j4 'CXX=3Darm-angstrom-linux-gnueabi-g++ -march=3Darmv7-a -mtune=3Dc=
ortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --s=
ysroot=3D/oe/build-angstrom-next/angstrom-dev/sysroots/armv7a-angstrom-linu=
x-gnueabi' PREFIX=3D/usr prefix=3D/usr
        scons: Reading SConscript files ...
        Building for python2.6
        You need to have numpy installed.
       =20
        ImportError: No module named numpy:
          File "/oe/build-angstrom-next/angstrom-dev/work/armv7a-angstrom-l=
inux-gnueabi/mypaint-0.9.1-r0/mypaint-0.9.1/SConstruct", line 15:
            import numpy
        + oefatal 'scons build

> Signed-off-by: C. Charreyre <christian.charreyre@cioinfoindus.fr>

Maybe spell out you first name.

        git config user.name "Christian Charreyre" # maybe even
        `--global`

> ---
>  recipes/mypaint/files/scons-adapt.patch |   20 +++++++++++++++++
>  recipes/mypaint/mypaint_0.9.1.bb        |   36 +++++++++++++++++++++++++=
++++++
>  2 files changed, 56 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/mypaint/files/scons-adapt.patch
>  create mode 100644 recipes/mypaint/mypaint_0.9.1.bb
>=20
> diff --git a/recipes/mypaint/files/scons-adapt.patch b/recipes/mypaint/fi=
les/scons-adapt.patch
> new file mode 100644
> index 0000000..dcad6db
> --- /dev/null
> +++ b/recipes/mypaint/files/scons-adapt.patch
> @@ -0,0 +1,20 @@
> +Author: Christian Charreyre <christian.charreyre@cioinfoindus.fr>
> +
> +Adapt scons to OE
> +Index: mypaint-0.9.1/lib/SConscript
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- mypaint-0.9.1.orig/lib/SConscript	2011-04-21 11:31:29.000000000 +020=
0
> ++++ mypaint-0.9.1/lib/SConscript	2011-04-21 11:35:30.000000000 +0200
> +@@ -1,5 +1,11 @@
> + Import('env')
> +-import sys
> ++import sys, os
> ++env.Replace(SHCXX =3D os.environ['CXX'])
> ++env.Replace(SHLINK =3D os.environ['CXX'])
> ++env.Replace(LDMODULEFLAGS =3D os.environ['TARGET_LDFLAGS'])
> ++env.Append(LDMODULEFLAGS =3D ['-Wl,--hash-style=3Dgnu'])
> ++env.Append(LDMODULEFLAGS =3D ['-shared'])
> ++env.Replace(PATH =3D os.environ['PATH'])
> +=20
> + # For the record: I know that scons supports swig. But it doesn't scan =
for #include in the generated code.
> + #=20
> diff --git a/recipes/mypaint/mypaint_0.9.1.bb b/recipes/mypaint/mypaint_0=
.9.1.bb
> new file mode 100644
> index 0000000..a7e5077
> --- /dev/null
> +++ b/recipes/mypaint/mypaint_0.9.1.bb
> @@ -0,0 +1,31 @@
> +DESCRIPTION=3D"fast and easy open-source graphics application for digita=
l painters"
> +LICENSE=3D"GPL"
> +SECTION =3D "x11/applications"
> +PRIORITY =3D "optional"
> +HOMEPAGE =3D "http://mypaint.intilinux.com/"
> +
> +RDEPENDS_${PN} =3D "python-image python-json python-numpy"
> +
> +SRC_URI =3D "http://download.gna.org/mypaint/${PN}-${PV}.tar.bz2 \
> +	file://scons-adapt.patch \
> +"
> +SRC_URI[md5sum] =3D "6249a16359a438d6dc658f5765b35515"
> +SRC_URI[sha256sum] =3D "407b599f62fb0d6e711fee57d22e64d3aec88825364fb5f7=
f73b9f0940aa7aed"
> +
> +inherit distutils scons
> +
> +do_compile() {
> +	STAGING_INCDIR=3D${STAGING_INCDIR} \
> +       STAGING_LIBDIR=3D${STAGING_LIBDIR} \
> +       BUILD_SYS=3D${BUILD_SYS} \
> +	HOST_SYS=3D${HOST_SYS} \
> +	PATH=3D${PATH} scons_do_compile
> +}
> +
> +do_install() {
> +	BUILD_SYS=3D${BUILD_SYS} \
> +	HOST_SYS=3D${HOST_SYS} \
> +	scons_do_install
> +}
> +
> +FILES_${PN} +=3D "${datadir}"


Thanks,

Paul

--=-e+Bqf6MiSrrcVljjFlh0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk27uJgACgkQPX1aK2wOHVjCFwCfTgA5S4mwm1Cr3m/VDjgDYPtx
faoAnibgd3yNw25D851YrSx92sk3mljS
=xdYu
-----END PGP SIGNATURE-----

--=-e+Bqf6MiSrrcVljjFlh0--
