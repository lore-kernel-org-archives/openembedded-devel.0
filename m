Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1R7Mht-0005Dd-Ll for openembedded-devel@lists.openembedded.org;
	Sat, 24 Sep 2011 09:31:29 +0200
Received: from g225080067.adsl.alicedsl.de ([92.225.80.67]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1R7Mcv-0004Xy-Li for openembedded-devel@lists.openembedded.org;
	Sat, 24 Sep 2011 07:26:21 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 24 Sep 2011 09:25:44 +0200
In-Reply-To: <1316848094-30368-1-git-send-email-jdk@ti.com>
References: <1316848094-30368-1-git-send-email-jdk@ti.com>
X-Mailer: Evolution 3.0.3- 
Message-ID: <1316849170.4893.6.camel@mattotaupa>
Mime-Version: 1.0
Subject: Re: [meta-oe] WIP: cloud9: created
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
X-List-Received-Date: Sat, 24 Sep 2011 07:31:29 -0000
X-Groupsio-MsgNum: 34470
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-2v2RntruLnk1wQhxl46u"

--=-2v2RntruLnk1wQhxl46u
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Jason,


Am Samstag, den 24.09.2011, 03:08 -0400 schrieb Jason Kridner:
> Cloud9 is a web-browser based IDE.  This application should support
> multiple architectures as long as they have node.js and a build of
> node-o3-xml that is dropped into this system.  Ideally, that library
> would be added separately as a system-dependent portion, because
> everything else should be ISA independent.
>=20
> Advice on cleaning up this recipe is welcome.

what problems to do you see?

> I will continue to improve it as I understand how.  It is rather
> useful as-is.
> ---
>  meta-oe/recipes-devtools/cloud9/cloud9_0.5.1.bb |   28 +++++++++++++++++=
++++++
>  1 files changed, 28 insertions(+), 0 deletions(-)
>  create mode 100644 meta-oe/recipes-devtools/cloud9/cloud9_0.5.1.bb
>=20
> diff --git a/meta-oe/recipes-devtools/cloud9/cloud9_0.5.1.bb b/meta-oe/re=
cipes-devtools/cloud9/cloud9_0.5.1.bb
> new file mode 100644
> index 0000000..626332f
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/cloud9/cloud9_0.5.1.bb
> @@ -0,0 +1,28 @@
> +DESCRIPTION =3D "Meet Cloud9, development-as-a-service for Javascripters=
 and other developers"
> +HOMEPAGE =3D "http://c9.io"
> +RDEPENDS =3D "nodejs"

This belongs further down too.

> +
> +SRC_URI =3D "git://github.com/jadonk/cloud9.git;protocol=3Dgit \
> +"

Please put that below the license stuff [1].

> +
> +LICENSE =3D "GPLv3"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4784c3bcff601fd8f9515f52a11e7=
018"
> +
> +SRCREV =3D "08bae1d1cc2ba9f7f883a25afd07f0339a82fa8b"
> +S =3D "${WORKDIR}/git"
> +
> +do_configure_prepend () {
> + git submodule update --init --recursive
> +}
> +
> +do_compile () {
> +}

Maybe add comments why the above overrides are needed.

> +
> +do_install () {
> + install -m 0755 -d ${D}/usr/share/cloud9 ${D}${bindir}
> + rsync -r --exclude=3D".*" ${S}/* ${D}/usr/share/cloud9

Should `rsync` be put in `DEPENDS`?

> + touch ${D}${bindir}/cloud9
> + echo "#!/bin/sh" > ${D}${bindir}/cloud9
> + echo "node /usr/share/cloud9/bin/cloud9.js -l 0.0.0.0 -w /home/root -p =
3000" >> ${D}${bindir}/cloud9
> + chmod 0755 ${D}${bindir}/cloud9
> +}


Thanks,

Paul


[1] http://openembedded.org/index.php?title=3DStyleguide

--=-2v2RntruLnk1wQhxl46u
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk59hfgACgkQPX1aK2wOHViAQwCdGfebX1UKXBN7j0vaBVDZu8MD
MQkAnAzA8yPrLCvxExjbbvTTFKoLAgCK
=fEMW
-----END PGP SIGNATURE-----

--=-2v2RntruLnk1wQhxl46u--
