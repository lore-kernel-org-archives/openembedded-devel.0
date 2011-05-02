Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QGn7p-0005w4-2G for openembedded-devel@lists.openembedded.org;
	Mon, 02 May 2011 09:00:57 +0200
Received: from f053036031.adsl.alicedsl.de ([78.53.36.31]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QGn6H-0004mp-52 for openembedded-devel@lists.openembedded.org;
	Mon, 02 May 2011 06:59:21 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1304282399-2932-1-git-send-email-schnitzeltony@gmx.de>
References: <1304282399-2932-1-git-send-email-schnitzeltony@gmx.de>
Date: Mon, 02 May 2011 08:58:21 +0200
Message-ID: <1304319501.3949.4.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH v2] libgpsbt: add dbus-glib to DEPENDS
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
X-List-Received-Date: Mon, 02 May 2011 07:00:57 -0000
X-Groupsio-MsgNum: 31544
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-mBUOgyJSxxY+Pknr7L63"

--=-mBUOgyJSxxY+Pknr7L63
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Sonntag, den 01.05.2011, 22:39 +0200 schrieb Andreas Mueller:
> Error message during configure was
> | checking for GLIB... yes
> | checking for DBUS... configure: error: Package requirements ( dbus-glib=
-1 >=3D 0.23 ) were not met:
> |
> | No package 'dbus-glib-1' found
> |
> | Consider adjusting the PKG_CONFIG_PATH environment variable if you
> | installed software in a non-standard prefix.
> |
> | Alternatively, you may set the environment variables DBUS_CFLAGS
> | and DBUS_LIBS to avoid the need to call pkg-config.
> | See the pkg-config man page for more details.
> |
> NOTE: package libgpsbt-0.1-r2: task do_configure: Failed
>=20
> Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
> ---
>  recipes/maemo4/libgpsbt_0.1.bb |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/recipes/maemo4/libgpsbt_0.1.bb b/recipes/maemo4/libgpsbt_0.1=
.bb
> index c6c6ea6..a41501e 100644
> --- a/recipes/maemo4/libgpsbt_0.1.bb
> +++ b/recipes/maemo4/libgpsbt_0.1.bb
> @@ -2,7 +2,7 @@ LICENSE =3D "nokia"
> =20
>  PR =3D "r2"
> =20
> -DEPENDS =3D "libgpsmgr dbus"
> +DEPENDS =3D "libgpsmgr dbus dbus-glib"
> =20
>  # This is proprietary software in Chinook, so we have to stay with the l=
ast released
>  # free version.

Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>

I pushed your patch in 54c90c53 [1]. Please remember to update the state
in the patch queue [2].

Just for the future. How do you want to spell your last name? Mueller or
M=C3=BCller? There are commits with both spellings.


Thanks,

Paul


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D54c90c5=
3bd4f0b02869de057407f0f5610ece260
[2] http://openembedded.org/index.php/Patchwork

--=-mBUOgyJSxxY+Pknr7L63
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2+VgcACgkQPX1aK2wOHVjQBQCfTJpSqZD77wZc6E3H+R2MHG1Z
2wMAnjNGPT3hKBENjF38l8gjOFlE+LT6
=YGHp
-----END PGP SIGNATURE-----

--=-mBUOgyJSxxY+Pknr7L63--
