Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QFBZC-0007WL-0c for openembedded-devel@lists.openembedded.org;
	Wed, 27 Apr 2011 22:42:34 +0200
Received: from f053039000.adsl.alicedsl.de ([78.53.39.0] helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QFBXY-0001Eo-Ff for openembedded-devel@lists.openembedded.org;
	Wed, 27 Apr 2011 20:40:52 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4DB82E7C.9080206@cioinfoindus.fr>
References: <4DB82E7C.9080206@cioinfoindus.fr>
Date: Wed, 27 Apr 2011 22:40:02 +0200
Message-ID: <1303936802.4833.8.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH 1/2] mypaint: new recipe for version 0.9.1
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
X-List-Received-Date: Wed, 27 Apr 2011 20:42:34 -0000
X-Groupsio-MsgNum: 31503
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-2c8i1kR7up3qCHyM2kIX"

--=-2c8i1kR7up3qCHyM2kIX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Christian,


Am Mittwoch, den 27.04.2011, 16:55 +0200 schrieb Christian Charreyre:

> this new recipe will build the painting soft mypaint.

thank you for your patches.

> In order to correctly run on the target, it is necessary to add new
> recipes dependencies in python-numpy recipe.
>=20
> Here are the two patches.
>=20
> Hoping it will be valuable.

Please send each patch separately using `git send-email` or using your
mail program and removing the first From line and past the subject into
the according field of your mailer.

>  From 0cc6d007fecb3ad7f5d09a9d4897d506a5c41d39 Mon Sep 17 00:00:00 2001
> From: C. Charreyre<christian.charreyre@cioinfoindus.fr>

A space is missing. You can set it up correctly using `git config`.

> Date: Thu, 21 Apr 2011 16:40:54 +0200
> Subject: [PATCH] mypaint: new recipe for version 0.9.1
>=20
> Signed-off-by: C. Charreyre<christian.charreyre@cioinfoindus.fr>
> ---
>    recipes/mypaint/files/scons-adapt.patch |   20 +++++++++++++++++
>    recipes/mypaint/mypaint_0.9.1.bb        |   36
> +++++++++++++++++++++++++++++++

Your mail program mangled the patch. Please resend as `[PATCH v2]` and
remember to turn off line wrapping.

>    2 files changed, 56 insertions(+), 0 deletions(-)
>    create mode 100644 recipes/mypaint/files/scons-adapt.patch
>    create mode 100644 recipes/mypaint/mypaint_0.9.1.bb
>=20
> diff --git a/recipes/mypaint/files/scons-adapt.patch
> b/recipes/mypaint/files/scons-adapt.patch
> new file mode 100644
> index 0000000..dcad6db
> --- /dev/null
> +++ b/recipes/mypaint/files/scons-adapt.patch
> @@ -0,0 +1,20 @@
> +Author: Christian Charreyre<christian.charreyre@cioinfoindus.fr>
> +
> +Adapt scons to OE
> +Index: mypaint-0.9.1/lib/SConscript
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- mypaint-0.9.1.orig/lib/SConscript    2011-04-21 11:31:29.000000000
> +0200
> ++++ mypaint-0.9.1/lib/SConscript    2011-04-21 11:35:30.000000000 +0200
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

Did you send this upstream so that they can improve the build system for
cross compilation?

> +
> + # For the record: I know that scons supports swig. But it doesn't scan
> for #include in the generated code.
> + #
> diff --git a/recipes/mypaint/mypaint_0.9.1.bb
> b/recipes/mypaint/mypaint_0.9.1.bb
> new file mode 100644
> index 0000000..a7e5077
> --- /dev/null
> +++ b/recipes/mypaint/mypaint_0.9.1.bb
> @@ -0,0 +1,36 @@
> +DESCRIPTION=3D"fast and easy open-source graphics application for digita=
l
> painters"
> +LICENSE=3D"GPL"
> +SECTION =3D "x11/applications"
> +PRIORITY =3D "optional"
> +HOMEPAGE =3D "http://mypaint.intilinux.com/"
> +
> +RDEPENDS_${PN} =3D "python-numpy python-image python-json"

Can you sort those lexicographically.

> +
> +SRC_URI =3D "http://download.gna.org/mypaint/${PN}-${PV}.tar.bz2 \
> +    file://scons-adapt.patch \
> +"
> +
> +inherit distutils scons
> +
> +do_compile() {
> +    STAGING_INCDIR=3D${STAGING_INCDIR} \
> +    STAGING_LIBDIR=3D${STAGING_LIBDIR} \
> +    BUILD_SYS=3D${BUILD_SYS} \
> +    HOST_SYS=3D${HOST_SYS} \
> +    PATH=3D${PATH} scons_do_compile
> +}

I do not know Scons, but it looks strange that the above is needed and
not done automatically.

> +
> +do_install() {
> +    BUILD_SYS=3D${BUILD_SYS} \
> +    HOST_SYS=3D${HOST_SYS} \
> +    scons_do_install
> +}
> +
> +FILES_${PN} +=3D "${datadir}"
> +
> +SRC_URI[md5sum] =3D "6249a16359a438d6dc658f5765b35515"
> +SRC_URI[sha256sum] =3D
> "407b599f62fb0d6e711fee57d22e64d3aec88825364fb5f7f73b9f0940aa7aed"

Please put it right at the top under `SRC_URI`.

> +
> +INSANE_SKIP_${PN} =3D True

Please note in the commit message or in the recipe as a comment what
error you get/why this is needed.

> +
> +

Please remove the empty lines at the end.


Thanks,

Paul

--=-2c8i1kR7up3qCHyM2kIX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk24fxsACgkQPX1aK2wOHVieOACgiXBOB16koUsO8nKzxAuRDSRf
s8EAni7f8rd7bD8OyDd4nlf2L7D1+ew7
=qB1P
-----END PGP SIGNATURE-----

--=-2c8i1kR7up3qCHyM2kIX--
