Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1R49TJ-0001Lb-39 for openembedded-devel@lists.openembedded.org;
	Thu, 15 Sep 2011 12:47:10 +0200
Received: from f053044184.adsl.alicedsl.de ([78.53.44.184]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1R49OR-0003iE-3v for openembedded-devel@lists.openembedded.org;
	Thu, 15 Sep 2011 10:42:07 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Sep 2011 12:41:58 +0200
In-Reply-To: <1316079756-3038-1-git-send-email-denis@eukrea.com>
References: <1316079756-3038-1-git-send-email-denis@eukrea.com>
X-Mailer: Evolution 3.0.3- 
Message-ID: <1316083319.4523.74.camel@mattotaupa>
Mime-Version: 1.0
Subject: Re: [PATCH] qwt: import from openembedded.dev
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
X-List-Received-Date: Thu, 15 Sep 2011 10:47:10 -0000
X-Groupsio-MsgNum: 34261
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-bFyEV4xHa/Onplzno+xO"

--=-bFyEV4xHa/Onplzno+xO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Denis,


thank you for the patch. Please remember to tag patches for meta-oe with
[meta-oe].

Am Donnerstag, den 15.09.2011, 11:42 +0200 schrieb Denis Carikli:
> The only change between openembedded.dev and meta-openembedded was
>   the addition of LIC_FILES_CHKSUM
>=20
> Signed-off-by: Denis Carikli <denis@eukrea.com>

I would prefer if you format such import commits as follows.

        qwt: Add version 5.2.1 (initial recipe)
       =20
        =E2=80=A2 Import recipe from OE-classic [1].
        =E2=80=A2 Add `LIC_FILES_CHKSUM`.
        =E2=80=A2 Build and run tested with =E2=80=A6.

        [1] http://git.openembedded.org/cgit.cgi/openembedded/tree/recipes/=
qwt/?id=3D750e869586413347cc73de1615979288af750c97

What URL or commit ID to use is up to you.

> ---
>  meta-oe/recipes-qt/qwt/qwt-e_5.2.1.bb |    8 ++++++++
>  meta-oe/recipes-qt/qwt/qwt.inc        |   33 +++++++++++++++++++++++++++=
++++++
>  meta-oe/recipes-qt/qwt/qwt_5.2.1.bb   |    8 ++++++++
>  3 files changed, 49 insertions(+), 0 deletions(-)
>  create mode 100644 meta-oe/recipes-qt/qwt/qwt-e_5.2.1.bb
>  create mode 100644 meta-oe/recipes-qt/qwt/qwt.inc
>  create mode 100644 meta-oe/recipes-qt/qwt/qwt_5.2.1.bb
>=20
> diff --git a/meta-oe/recipes-qt/qwt/qwt-e_5.2.1.bb b/meta-oe/recipes-qt/q=
wt/qwt-e_5.2.1.bb
> new file mode 100644
> index 0000000..2f55061
> --- /dev/null
> +++ b/meta-oe/recipes-qt/qwt/qwt-e_5.2.1.bb
> @@ -0,0 +1,8 @@
> +inherit qt4e
> +
> +require qwt.inc
> +
> +SRC_URI[qwt.md5sum] =3D "4a595b8db0ec3856b117836c1d60cb27"
> +SRC_URI[qwt.sha256sum] =3D "e2b8bb755404cb3dc99e61f3e2d7262152193488f5fb=
e88524eb698e11ac569f"
> +
> +RPROVIDES_${PN}-dev =3D "libqwt-dev"
> \ No newline at end of file

Should these new lines be added?

> diff --git a/meta-oe/recipes-qt/qwt/qwt.inc b/meta-oe/recipes-qt/qwt/qwt.=
inc
> new file mode 100644
> index 0000000..da1ed11
> --- /dev/null
> +++ b/meta-oe/recipes-qt/qwt/qwt.inc
> @@ -0,0 +1,33 @@
> +DESCRIPTION =3D "Qt Widget Extension for Technical Applications"
> +SECTION =3D "libs"
> +PRIORITY =3D "optional"
> +
> +# LGPLv2.1 + some exceptions
> +LICENSE =3D "QWTv1.0"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Ddac2743472b0462ff3cfb4af42051=
c88"
> +
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/qwt/qwt-${PV}.tar.bz2;name=3Dqwt"
> +
> +S =3D "${WORKDIR}/qwt-${PV}"

Is this the default? If yes please remove it?

> +
> +do_configure_prepend() {
> +	sed -i -e 's:RELEASE_SUFFIX      =3D :RELEASE_SUFFIX      =3D ${QT_LIBI=
NFIX}:' *.pri
> +	sed -i -e s:lqwt:lqwt${QT_LIBINFIX}:g -e s:/usr/local/qwt-$\${QwtVersio=
n}:${prefix}:g *.prf
> +	sed -e 's/#CONFIG     +=3D QwtExamples/CONFIG     +=3D QwtExamples/g' -=
i qwtconfig.pri
> +	sed -i -e s:/usr/local/qwt-${PV}:${D}${prefix}:g ${S}/*.pri
> +}
> +
> +do_install() {
> +	oe_runmake -e install
> +	install -d ${D}${datadir}/doc/${PN}
> +	mv ${D}${prefix}/doc/* ${D}${datadir}/doc/${PN}/
> +	cd ${S}/examples
> +	install -d ${D}/${bindir}
> +	cd bin${QT_LIBINFIX}/
> +	for i in * ; do
> +		cp -pPR ${i} ${D}/${bindir}/${i}${QT_LIBINFIX}
> +	done
> +}
> +
> +PACKAGES_prepend =3D "${PN}-examples "
> +FILES_${PN}-examples =3D "${bindir}/*"
> diff --git a/meta-oe/recipes-qt/qwt/qwt_5.2.1.bb b/meta-oe/recipes-qt/qwt=
/qwt_5.2.1.bb
> new file mode 100644
> index 0000000..238a4fb
> --- /dev/null
> +++ b/meta-oe/recipes-qt/qwt/qwt_5.2.1.bb
> @@ -0,0 +1,8 @@
> +inherit qt4x11
> +
> +require qwt.inc
> +
> +SRC_URI[qwt.md5sum] =3D "4a595b8db0ec3856b117836c1d60cb27"
> +SRC_URI[qwt.sha256sum] =3D "e2b8bb755404cb3dc99e61f3e2d7262152193488f5fb=
e88524eb698e11ac569f"
> +
> +RPROVIDES_${PN}-dev =3D "libqwt-dev"
> \ No newline at end of file


Thanks,

Paul

--=-bFyEV4xHa/Onplzno+xO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEUEABECAAYFAk5x1nYACgkQPX1aK2wOHVjNKACXWMtH5F6SL7T7YcJmqu9I3hVX
ZQCfakLtulOfvXex/F7U5qWd1E/E0Ws=
=kHa5
-----END PGP SIGNATURE-----

--=-bFyEV4xHa/Onplzno+xO--
