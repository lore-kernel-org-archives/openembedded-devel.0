Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Syf6f-0000Rc-T6
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Aug 2012 10:25:37 +0200
Received: by wibhm11 with SMTP id hm11so2260769wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Aug 2012 01:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=9QR5qJ4DeFIeMKwtsqW3af/GxDvzIJSInfb8FQyPaYM=;
	b=ZEmN0Cl1tFWvHacA1Yg7VKLrLDwvUMbN70Pi2Vit8hTJLaGMWH75bN3PksXBCP0Tiq
	oQ+FO1PexDqv+DX9o7pIpy1REt9M+PzlGR0y/oBKT334D8y+YrDJuR7HgLS3XUnNomaP
	Egh8e0lrMFWj+oxcJw87I8rs4/r0cDOWLmPoCHq+6xAzn10qBKTFXJS2cQNMVfTn/qB0
	UtUeD+661hV/GrrkyePL7smuUcZNscxBHQDKuGTG+D/v6L+XYLqQGfTwYcfGgJKY7Wxh
	VYnM2vYsBggnaAwIFESJUsCbmx26ePCpVdsqtOWzEJTfjOfDT//EG1oliYTnhmPzE8sr
	nl7g==
Received: by 10.180.104.197 with SMTP id gg5mr25367051wib.9.1344327232194;
	Tue, 07 Aug 2012 01:13:52 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w7sm20100313wiz.0.2012.08.07.01.13.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Aug 2012 01:13:50 -0700 (PDT)
Date: Tue, 7 Aug 2012 10:13:47 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120807081347.GP3267@jama.jama.net>
References: <1344325650-21076-1-git-send-email-koen@dominion.thruhere.net>
	<1344325650-21076-2-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <1344325650-21076-2-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-oe][PATCH 2/2] nodejs: update to 0.6.20
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
X-List-Received-Date: Tue, 07 Aug 2012 08:25:38 -0000
X-Groupsio-MsgNum: 40094
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oDto3OTLsk6uOlQH"
Content-Disposition: inline

--oDto3OTLsk6uOlQH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 07, 2012 at 09:47:30AM +0200, Koen Kooi wrote:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  meta-oe/recipes-devtools/nodejs/nodejs_0.6.18.bb |   65 ----------------=
------
>  meta-oe/recipes-devtools/nodejs/nodejs_0.6.20.bb |   64 ++++++++++++++++=
+++++
>  2 files changed, 64 insertions(+), 65 deletions(-)
>  delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs_0.6.18.bb
>  create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs_0.6.20.bb

Can you resend with -M (if it wasn't already) ?

> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_0.6.18.bb b/meta-oe/r=
ecipes-devtools/nodejs/nodejs_0.6.18.bb
> deleted file mode 100644
> index 7136ffc..0000000
> --- a/meta-oe/recipes-devtools/nodejs/nodejs_0.6.18.bb
> +++ /dev/null
> @@ -1,65 +0,0 @@
> -DESCRIPTION =3D "nodeJS Evented I/O for V8 JavaScript"
> -HOMEPAGE =3D "http://nodejs.org"
> -LICENSE =3D "MIT & BSD"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D914812f2875eef849b5c509cc25dc=
b4f"
> -
> -DEPENDS =3D "openssl"
> -
> -SRC_URI =3D "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz \
> -           file://fix-hardfloat-detection.patch"
> -
> -SRC_URI[md5sum] =3D "4a3d3123ccc7b9b21c1990fe074e3d14"
> -SRC_URI[sha256sum] =3D "6cf4311ecbc1700e88f4382a31b3a7017c1572cd641fd06e=
653fc1692c2cffff"
> -
> -S =3D "${WORKDIR}/node-v${PV}"
> -
> -# v8 errors out if you have set CCACHE
> -CCACHE =3D ""
> -
> -do_configure_virtclass-native () {
> -  sed -i -e s:\'/usr/lib:\'${STAGING_LIBDIR}:g wscript
> -  sed -i -e s:\'/usr/local/lib:\'${STAGING_LIBDIR}:g wscript
> -
> -  ./configure --prefix=3D${prefix} --without-snapshot
> -}
> -
> -# Node is way too cool to use proper autotools, so we install two wrappe=
rs to forcefully inject proper arch cflags to workaround waf+scons
> -do_configure () {
> -  echo '#!/bin/sh' > ${WORKDIR}/gcc
> -  echo '${CC} $@' >> ${WORKDIR}/gcc
> -
> -  echo '#!/bin/sh' > ${WORKDIR}/g++
> -  echo '${CXX} $@'>> ${WORKDIR}/g++
> -
> -  chmod +x ${WORKDIR}/gcc ${WORKDIR}/g++
> -
> -  sed -i -e s:\'/usr/lib:\'${STAGING_LIBDIR}:g wscript
> -  sed -i -e s:\'/usr/local/lib:\'${STAGING_LIBDIR}:g wscript
> -
> -  export PATH=3D${WORKDIR}:${PATH}
> -  export CC=3Dgcc
> -  export CXX=3Dg++
> -
> -  ./configure --prefix=3D${prefix} --without-snapshot
> -}
> -
> -do_compile_virtclass-native () {
> -  make BUILDTYPE=3DRelease
> -}
> -
> -do_compile () {
> -  export PATH=3D${WORKDIR}:${PATH}
> -  export CC=3Dgcc
> -  export CXX=3Dg++
> -  make BUILDTYPE=3DRelease
> -}
> -
> -do_install () {
> -  DESTDIR=3D${D} oe_runmake install
> -}
> -
> -RDEPENDS_${PN} =3D "curl python-shell python-datetime python-subprocess =
python-crypt python-textutils python-netclient "
> -RDEPENDS_${PN}_virtclass-native =3D "curl-native python-native"
> -
> -FILES_${PN} +=3D "${libdir}/node/wafadmin ${libdir}/node_modules"
> -BBCLASSEXTEND =3D "native"
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_0.6.20.bb b/meta-oe/r=
ecipes-devtools/nodejs/nodejs_0.6.20.bb
> new file mode 100644
> index 0000000..77ed388
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_0.6.20.bb
> @@ -0,0 +1,64 @@
> +DESCRIPTION =3D "nodeJS Evented I/O for V8 JavaScript"
> +HOMEPAGE =3D "http://nodejs.org"
> +LICENSE =3D "MIT & BSD"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D914812f2875eef849b5c509cc25dc=
b4f"
> +
> +DEPENDS =3D "openssl"
> +
> +SRC_URI =3D "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz \
> +           file://fix-hardfloat-detection.patch"
> +SRC_URI[md5sum] =3D "fcf8e0f2981f9dd66606a2162a2df55d"
> +SRC_URI[sha256sum] =3D "b7bf4cf143ddf46ba5e975761b98a38dd3d72b176fd5d4bb=
2f9c9e7bbe6c4b15"
> +
> +S =3D "${WORKDIR}/node-v${PV}"
> +
> +# v8 errors out if you have set CCACHE
> +CCACHE =3D ""
> +
> +do_configure_virtclass-native () {
> +  sed -i -e s:\'/usr/lib:\'${STAGING_LIBDIR}:g wscript
> +  sed -i -e s:\'/usr/local/lib:\'${STAGING_LIBDIR}:g wscript
> +
> +  ./configure --prefix=3D${prefix} --without-snapshot
> +}
> +
> +# Node is way too cool to use proper autotools, so we install two wrappe=
rs to forcefully inject proper arch cflags to workaround waf+scons
> +do_configure () {
> +  echo '#!/bin/sh' > ${WORKDIR}/gcc
> +  echo '${CC} $@' >> ${WORKDIR}/gcc
> +
> +  echo '#!/bin/sh' > ${WORKDIR}/g++
> +  echo '${CXX} $@'>> ${WORKDIR}/g++
> +
> +  chmod +x ${WORKDIR}/gcc ${WORKDIR}/g++
> +
> +  sed -i -e s:\'/usr/lib:\'${STAGING_LIBDIR}:g wscript
> +  sed -i -e s:\'/usr/local/lib:\'${STAGING_LIBDIR}:g wscript
> +
> +  export PATH=3D${WORKDIR}:${PATH}
> +  export CC=3Dgcc
> +  export CXX=3Dg++
> +
> +  ./configure --prefix=3D${prefix} --without-snapshot
> +}
> +
> +do_compile_virtclass-native () {
> +  make BUILDTYPE=3DRelease
> +}
> +
> +do_compile () {
> +  export PATH=3D${WORKDIR}:${PATH}
> +  export CC=3Dgcc
> +  export CXX=3Dg++
> +  make BUILDTYPE=3DRelease
> +}
> +
> +do_install () {
> +  DESTDIR=3D${D} oe_runmake install
> +}
> +
> +RDEPENDS_${PN} =3D "curl python-shell python-datetime python-subprocess =
python-crypt python-textutils python-netclient "
> +RDEPENDS_${PN}_virtclass-native =3D "curl-native python-native"
> +
> +FILES_${PN} +=3D "${libdir}/node/wafadmin ${libdir}/node_modules"
> +BBCLASSEXTEND =3D "native"
> --=20
> 1.7.10
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--oDto3OTLsk6uOlQH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAgzjsACgkQN1Ujt2V2gBzLmwCcDHQMrswu7pFIPNm8gV5i+hRx
xlcAoK7reRjtez71CyiaZ2s85bL0zHq7
=YMU2
-----END PGP SIGNATURE-----

--oDto3OTLsk6uOlQH--
