Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QmrlM-0008Kz-Js for openembedded-devel@lists.openembedded.org;
	Fri, 29 Jul 2011 20:26:20 +0200
Received: from f053039036.adsl.alicedsl.de ([78.53.39.36]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QmriO-0003Jq-9I for openembedded-devel@lists.openembedded.org;
	Fri, 29 Jul 2011 18:23:16 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1311960660-7876-1-git-send-email-schnitzeltony@gmx.de>
References: <1311960660-7876-1-git-send-email-schnitzeltony@gmx.de>
Date: Fri, 29 Jul 2011 20:22:04 +0200
Message-ID: <1311963724.3882.85.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [meta-oe] iceauth: Import from oe-dev and minor cleanup
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
X-List-Received-Date: Fri, 29 Jul 2011 18:26:20 -0000
X-Groupsio-MsgNum: 33395
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-y9zKvoopBQHCbIJlYMu6"

--=-y9zKvoopBQHCbIJlYMu6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Andreas,


thank you for your patch.

Am Freitag, den 29.07.2011, 19:31 +0200 schrieb Andreas Mueller:

When importing from somewhere please always reference the used commit id
as requested in the guidelines [1]. Also mentioning the version in the
summary would be nice.

	iceauth: Import 1.0.4 from oe.dev

> Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
> ---
>  meta-oe/recipes-graphics/xorg-app/iceauth_1.0.4.bb |   10 ++++++++++
>  1 files changed, 10 insertions(+), 0 deletions(-)
>  create mode 100644 meta-oe/recipes-graphics/xorg-app/iceauth_1.0.4.bb
>=20
> diff --git a/meta-oe/recipes-graphics/xorg-app/iceauth_1.0.4.bb b/meta-oe=
/recipes-graphics/xorg-app/iceauth_1.0.4.bb
> new file mode 100644
> index 0000000..e98c0cb
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/xorg-app/iceauth_1.0.4.bb
> @@ -0,0 +1,10 @@
> +DESCRIPTION =3D "Tool for manipulating ICE protocol authorization record=
s"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D13f70acf3c27f5f834bbc954df775=
f8e"

What license is it?

> +PR =3D "${INC_PR}.0"
> +
> +DEPENDS +=3D " libice"

This should go in front of PR according to the style guide [2].

> +
> +require xorg-app-common.inc
> +
> +SRC_URI[md5sum] =3D "bb2e4d2611047f7c5a1a82ec956a9de4"
> +SRC_URI[sha256sum] =3D "0ee6fd4554f0131b1ed526ee00b9cf643e7dc97eb70fb514=
48848ef2f349938d"

I will try to make the updates in oe.dev and maybe you can resync
afterward.


Thanks,

Paul


[1] http://wiki.openembedded.org/index.php/Commit_Patch_Message_Guidelines
[2] http://wiki.openembedded.org/index.php/Styleguide

--=-y9zKvoopBQHCbIJlYMu6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk4y+kwACgkQPX1aK2wOHVjR+gCeNQCsurDdjY5CQBVFmIuQjpZI
yvwAn3Fs9ZDInBj6wM32K8agKeJpmvvt
=XFFc
-----END PGP SIGNATURE-----

--=-y9zKvoopBQHCbIJlYMu6--
