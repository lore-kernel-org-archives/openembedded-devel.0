Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Qo9RM-00042Q-2F for openembedded-devel@lists.openembedded.org;
	Tue, 02 Aug 2011 09:31:00 +0200
Received: from f053037105.adsl.alicedsl.de ([78.53.37.105]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Qo9NC-0003yd-Vh for openembedded-devel@lists.openembedded.org;
	Tue, 02 Aug 2011 07:26:43 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1312268948-5879-2-git-send-email-schnitzeltony@gmx.de>
References: <1312268948-5879-1-git-send-email-schnitzeltony@gmx.de>
	<1312268948-5879-2-git-send-email-schnitzeltony@gmx.de>
Date: Tue, 02 Aug 2011 09:26:39 +0200
Message-ID: <1312269999.3658.5.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [meta-oe v2 1/1] iceauth: Import 1.0.4 from oe.dev
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
X-List-Received-Date: Tue, 02 Aug 2011 07:31:00 -0000
X-Groupsio-MsgNum: 33472
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-4ZBmVVG8SQ5rGV1BTy8x"

--=-4ZBmVVG8SQ5rGV1BTy8x
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Dienstag, den 02.08.2011, 09:09 +0200 schrieb Andreas Mueller:
> The patch was imported from the OpenEmbedded git server
> (git://github.com/openembedded/openembedded.git) as of commit id
> 033af22d565adabc05303f88e76e31e7d239756c.
>=20
> Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
> ---
>  meta-oe/recipes-graphics/xorg-app/iceauth_1.0.4.bb |    8 ++++++++
>  1 files changed, 8 insertions(+), 0 deletions(-)
>  create mode 100644 meta-oe/recipes-graphics/xorg-app/iceauth_1.0.4.bb
>=20
> diff --git a/meta-oe/recipes-graphics/xorg-app/iceauth_1.0.4.bb b/meta-oe=
/recipes-graphics/xorg-app/iceauth_1.0.4.bb
> new file mode 100644
> index 0000000..168afc2
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/xorg-app/iceauth_1.0.4.bb
> @@ -0,0 +1,8 @@
> +require xorg-app-common.inc
> +DESCRIPTION =3D "Tool for manipulating ICE protocol authorization record=
s"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D13f70acf3c27f5f834bbc954df775=
f8e"
> +DEPENDS +=3D "libice"
> +PR =3D "${INC_PR}.1"

Please start at `"${INC_PR}.0"`. If it is not too much effort it is
easier to send a `v3` so that Koen can apply those patches without
having to do any editing.

> +
> +SRC_URI[md5sum] =3D "bb2e4d2611047f7c5a1a82ec956a9de4"
> +SRC_URI[sha256sum] =3D "0ee6fd4554f0131b1ed526ee00b9cf643e7dc97eb70fb514=
48848ef2f349938d"

You can add to v3.

Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>

Also somehow the `[PATCH]` tag was omitted in the subject line of this
message and of your Xfce series. The patch queue picked them up
nevertheless though.


Thank you for incorporating my comments,

Paul


[1] http://patches.openembedded.org/patch/9043/

--=-4ZBmVVG8SQ5rGV1BTy8x
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk43pqkACgkQPX1aK2wOHViBEACeKSWOaRjQz03LIorUnvvvTtLw
diEAoItDEN2JAKpNOm6SKhf9xOzdNYlZ
=qFNM
-----END PGP SIGNATURE-----

--=-4ZBmVVG8SQ5rGV1BTy8x--
