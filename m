Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Qczlr-0000KC-Fd for openembedded-devel@lists.openembedded.org;
	Sat, 02 Jul 2011 14:58:03 +0200
Received: from f053033014.adsl.alicedsl.de ([78.53.33.14]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QcziP-0006M8-A4 for openembedded-devel@lists.openembedded.org;
	Sat, 02 Jul 2011 12:54:29 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1487279e2c46654967623254841a293cb838279b.1309608953.git.michael.lippautz@gmail.com>
References: <cover.1309608953.git.michael.lippautz@gmail.com>
	<1487279e2c46654967623254841a293cb838279b.1309608953.git.michael.lippautz@gmail.com>
Date: Sat, 02 Jul 2011 14:54:18 +0200
Message-ID: <1309611258.4228.21.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [meta-oe][PATCH 4/4] start-stop-daemon: Add initial version
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
X-List-Received-Date: Sat, 02 Jul 2011 12:58:03 -0000
X-Groupsio-MsgNum: 32956
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-+dB5mB1I6wc2hRUBxCHj"

--=-+dB5mB1I6wc2hRUBxCHj
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Samstag, den 02.07.2011, 14:21 +0200 schrieb Michael Lippautz:

	start-stop-daemon: Add version 1.16.0.2 (initial recipe)

> Provides a stand-alone ssd that is extracted from dpkg of the correspondi=
ng
> version.
>=20
> Signed-off-by: Michael Lippautz <michael.lippautz@gmail.com>
> ---
>  .../start-stop-daemon_1.16.0.2.bb                  |   32 ++++++++++++++=
++++++
>  1 files changed, 32 insertions(+), 0 deletions(-)
>  create mode 100644 meta-oe/recipes-support/start-stop-daemon/start-stop-=
daemon_1.16.0.2.bb
>=20
> diff --git a/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_=
1.16.0.2.bb b/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1=
.16.0.2.bb
> new file mode 100644
> index 0000000..5c2b92a
> --- /dev/null
> +++ b/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.16.0.=
2.bb
> @@ -0,0 +1,32 @@
> +DESCRIPTION =3D "Debian's start-stop-daemon utility extracted from the d=
pkg \
> +packge"

package

> +LICENSE =3D "PD"
> +LIC_FILES_CHKSUM =3D "file://utils/start-stop-daemon.c;md5=3Da963623e458=
8f70122865aaa7a370ce4"
> +# start-stop-daemon is usually shipped by dpkg
> +RCONFLICS_${PN} =3D "dpkg"=20
> +PR =3D "r0"
> +
> +SRC_URI =3D "${DEBIAN_MIRROR}/main/d/dpkg/dpkg_${PV}.tar.bz2"

That will always be non-fetchable when the version is upgraded in
Debian, will not it? So another source should be chosen or it should be
ensured that the tarball is available on the OE mirrors.

> +
> +inherit autotools gettext
> +
> +S =3D "${WORKDIR}/dpkg-${PV}"
> +
> +EXTRA_OECONF =3D " \
> +  --with-start-stop-daemon \
> +  --without-bz2 \
> +  --without-deselect \
> +  --without-update-alternatives \
> +  --without-install-info \
> +  --without-selinux \
> +"

Sort alphabetically?

> +
> +do_install_append () {
> +  # remove everything that is not related to start-stop-daemon, since th=
ere
> +  # is no explicit rule for only installing ssd
> +  find ${D} -type f -not -name "*start-stop-daemon*" -exec rm {} \;
> +  find ${D} -depth -type d -empty -exec rmdir {} \;
> +}

File a request upstream for such an option?

> +
> +SRC_URI[md5sum] =3D "d211a84f38987771a49ad1c0f144334a"
> +SRC_URI[sha256sum] =3D "2a3d4ba83c743b3f004533fdd52372cb7b22f5c1da2042d0=
a31bbcc2b54c0ea5"

Please right below the first SRC_URI.


Thanks,

Paul

--=-+dB5mB1I6wc2hRUBxCHj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk4PFPoACgkQPX1aK2wOHVjm2wCeK1J9HXSACD074i7Bu92kPTtT
aDIAoIqcbtwbKTkRelWMF125jdnbVBX7
=Kg15
-----END PGP SIGNATURE-----

--=-+dB5mB1I6wc2hRUBxCHj--
