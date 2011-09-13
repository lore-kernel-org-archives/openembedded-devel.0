Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1R3SrI-0005ks-FY for openembedded-devel@lists.openembedded.org;
	Tue, 13 Sep 2011 15:17:04 +0200
Received: from f053041096.adsl.alicedsl.de ([78.53.41.96]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1R3SmO-0002DY-JN for openembedded-devel@lists.openembedded.org;
	Tue, 13 Sep 2011 13:12:00 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 Sep 2011 15:11:56 +0200
In-Reply-To: <4f19ed0177ac717d462981b37219a062fa46dffd.1315914262.git.Imran_Mehmood@mentor.com>
References: <cover.1315914262.git.Imran_Mehmood@mentor.com>
	<4f19ed0177ac717d462981b37219a062fa46dffd.1315914262.git.Imran_Mehmood@mentor.com>
X-Mailer: Evolution 3.0.3- 
Message-ID: <1315919517.4195.37.camel@mattotaupa>
Mime-Version: 1.0
Subject: Re: [meta-oe][PATCH 1/1] twm: add recipe version 1.0.6 (initial recipe)
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
X-List-Received-Date: Tue, 13 Sep 2011 13:17:04 -0000
X-Groupsio-MsgNum: 34207
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-gZCMzm+2Me6MHVszmE+s"

--=-gZCMzm+2Me6MHVszmE+s
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Imram,


Am Dienstag, den 13.09.2011, 17:49 +0500 schrieb Mehmood, Imran:
> From: Imran Mehmood <Imran_Mehmood@mentor.com>

in the commit summary the word =C2=BBrecipe=C2=AB is useless in my opinion =
since
it is clear when prefixing the line with twm.

>  * Imported from oe.dev commit id d90ee2735e9aa9d1a8dd7d0eb6a5917030a233d=
3

How did you test this recipe?

> Signed-off-by: Imran Mehmood <Imran_Mehmood@mentor.com>
> ---
>  meta-oe/recipes-graphics/xorg-app/twm_1.0.6.bb |   18 ++++++++++++++++++
>  1 files changed, 18 insertions(+), 0 deletions(-)
>  create mode 100644 meta-oe/recipes-graphics/xorg-app/twm_1.0.6.bb
>=20
> diff --git a/meta-oe/recipes-graphics/xorg-app/twm_1.0.6.bb b/meta-oe/rec=
ipes-graphics/xorg-app/twm_1.0.6.bb
> new file mode 100644
> index 0000000..d5105c0
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/xorg-app/twm_1.0.6.bb
> @@ -0,0 +1,18 @@
> +require xorg-app-common.inc
> +DESCRIPTION =3D "tiny window manager"
> +DEPENDS +=3D " libxext libxt libxmu"
> +
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4c6d42ef60e8166aa26606524c0b9=
586"
> +
> +PE =3D "1"

`PE =3D "1"` is not needed anymore when importing the recipe.

> +PR =3D "${INC_PR}.0"
> +
> +SRC_URI[archive.md5sum] =3D "952d06a0c2ec34687b536c7b619fc671"
> +SRC_URI[archive.sha256sum] =3D "e7dccad7879a7570442f0cd9df0b9064e926466b=
5a52b710fca8cfb167f294e9"
> +
> +FILES_${PN} +=3D "${datadir}/X11/twm/system.twmrc"
> +ALTERNATIVE_NAME =3D "x-window-manager"
> +ALTERNATIVE_PATH =3D "${bindir}/twm"
> +ALTERNATIVE_LINK =3D "${bindir}/x-window-manager"
> +ALTERNATIVE_PRIORITY =3D "1"


Thanks,

Paul

--=-gZCMzm+2Me6MHVszmE+s
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk5vVpwACgkQPX1aK2wOHVjOKQCffrS5Iy2a0sqk598dch6B0hwn
MNgAn3MfKl+fozsh1Nbd2NQPv4+bm4lO
=efjl
-----END PGP SIGNATURE-----

--=-gZCMzm+2Me6MHVszmE+s--
