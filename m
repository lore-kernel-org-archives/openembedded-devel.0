Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QHXvT-0001ll-5E for openembedded-devel@lists.openembedded.org;
	Wed, 04 May 2011 10:59:19 +0200
Received: from f053033156.adsl.alicedsl.de ([78.53.33.156]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QHXty-0006DG-0f for openembedded-devel@lists.openembedded.org;
	Wed, 04 May 2011 08:57:46 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1304358039-20934-1-git-send-email-christian.charreyre@cioinfoindus.fr>
References: <1304358039-20934-1-git-send-email-christian.charreyre@cioinfoindus.fr>
Date: Wed, 04 May 2011 10:56:41 +0200
Message-ID: <1304499401.4127.53.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH v4] mypaint: new recipe for version 0.9.1
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
X-List-Received-Date: Wed, 04 May 2011 08:59:19 -0000
X-Groupsio-MsgNum: 31611
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-i2cX4GWP6mEOJS2SqHcH"

--=-i2cX4GWP6mEOJS2SqHcH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Christian,


we are almost there.


Am Montag, den 02.05.2011, 19:40 +0200 schrieb Christian Charreyre:

Please remember to add what build configuration you used. (You can just
paste it from the BitBake output.)

> Signed-off-by: Christian Charreyre <christian.charreyre@cioinfoindus.fr>
> ---

If you send patch iterations (v2, v3, v4, =E2=80=A6) it is common to put be=
low
=C2=BB---=C2=AB what changed in the iterations to make it easier for review=
ers to
know what changed. Put =C2=BB---=C2=AB behind that, since it is not needed =
for the
actual commit message.

Example:

Commit message.

S-o-b: Joe User <joe@example.org>
---
v2: add foo to DEPENDS
v3: reorder to adhere to styleguide
v4: change install to =E2=80=A6
---
diff

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
> @@ -0,0 +1,50 @@
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
> +Index: mypaint-0.9.1/SConstruct
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- mypaint-0.9.1.orig/SConstruct	2011-03-04 15:44:59.000000000 +0100
> ++++ mypaint-0.9.1/SConstruct	2011-05-02 17:21:17.000000000 +0200
> +@@ -11,13 +11,6 @@
> + if sys.platform =3D=3D "win32":
> +     python =3D 'python' # usually no versioned binaries on Windows
> +=20
> +-try:=20
> +-    import numpy
> +-except ImportError:
> +-    print 'You need to have numpy installed.'
> +-    print
> +-    raise
> +-
> + SConsignFile() # no .scsonsign into $PREFIX please
> +=20
> + if sys.platform =3D=3D "darwin":
> +@@ -40,8 +33,9 @@
> +=20
> + env.Append(CXXFLAGS=3D' -Wall -Wno-sign-compare -Wno-write-strings')
> +=20
> +-# Get the numpy include path (for numpy/arrayobject.h).
> +-numpy_path =3D numpy.get_include()
> ++# Defines the numpy include path (for numpy/arrayobject.h).
> ++# This is specefic to OE, to avoid to build python-numpy-native

spec*i*fic

> ++numpy_path =3D os.environ['STAGING_DIR_TARGET']+os.environ['PYTHON_SITE=
PACKAGES_DIR']+'/numpy/core/include'
> + env.Append(CPPPATH=3Dnumpy_path)
> +=20
> +=20
> diff --git a/recipes/mypaint/mypaint_0.9.1.bb b/recipes/mypaint/mypaint_0=
.9.1.bb
> new file mode 100644
> index 0000000..a7e5077
> --- /dev/null
> +++ b/recipes/mypaint/mypaint_0.9.1.bb
> @@ -0,0 +1,37 @@
> +DESCRIPTION=3D"fast and easy open-source graphics application for digita=
l painters"
> +LICENSE=3D"GPL"
> +SECTION =3D "x11/applications"
> +PRIORITY =3D "optional"
> +HOMEPAGE =3D "http://mypaint.intilinux.com/"
> +
> +DEPENDS =3D "glib-2.0 libpng python-numpy"
> +RDEPENDS_${PN} =3D "python-image python-json"

I am now getting the following build error

        + /oe/build-angstrom-next/angstrom-dev/sysroots/i686-linux/usr/bin/=
scons -j4 'CXX=3Darm-angstrom-linux-gnueabi-g++ -march=3Darmv7-a -mtune=3Dc=
ortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --s=
ysroot=3D/oe/build-angstrom-next/angstrom-dev/sysroots/armv7a-angstrom-linu=
x-gnueabi' PREFIX=3D/usr prefix=3D/usr
        scons: Reading SConscript files ...
        Building for python2.6
        swig -o mypaintlib_wrap.cpp -noproxydel -python -c++ mypaintlib.i
        sh: swig: command not found
        scons: *** Error 127
        + oefatal 'scons build execution failed.'
        + echo FATAL: 'scons build execution failed.'
        FATAL: scons build execution failed.
        + exit 1

which I fixed by building `swig-native` beforehand. Please add
`swig-native` to `DEPENDS`. You probably did not encounter this error
since you have it installed locally.

[=E2=80=A6]


Thank you very much for your patience and improved patches,

Paul

--=-i2cX4GWP6mEOJS2SqHcH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3BFMkACgkQPX1aK2wOHVgkEwCeNZjRG+PWYuW5//x+iKN4zWLb
AeQAnRsihhHCPFmV1YcHJ/K4LSZ99ItT
=5h5r
-----END PGP SIGNATURE-----

--=-i2cX4GWP6mEOJS2SqHcH--
