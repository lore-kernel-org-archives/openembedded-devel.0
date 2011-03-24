Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q2gH6-0001Yq-Ib for openembedded-devel@lists.openembedded.org;
	Thu, 24 Mar 2011 09:52:12 +0100
Received: from f053039182.adsl.alicedsl.de ([78.53.39.182]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q2gFB-0004Y4-LX for openembedded-devel@lists.openembedded.org;
	Thu, 24 Mar 2011 08:50:13 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1300908539-2442-1-git-send-email-schnitzeltony@gmx.de>
References: <1300908539-2442-1-git-send-email-schnitzeltony@gmx.de>
Date: Thu, 24 Mar 2011 09:50:12 +0100
Message-ID: <1300956612.3795.4.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH] xfce4-session_4.6.1.bb: fix typo lbwnck->libwnck
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
X-List-Received-Date: Thu, 24 Mar 2011 08:52:12 -0000
X-Groupsio-MsgNum: 30571
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-aRasbINZHICccNkGrVmQ"

--=-aRasbINZHICccNkGrVmQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Mittwoch, den 23.03.2011, 20:28 +0100 schrieb Andreas Mueller:
> Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
> ---
>  recipes/xfce-base/xfce4-session_4.6.1.bb |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/recipes/xfce-base/xfce4-session_4.6.1.bb b/recipes/xfce-base=
/xfce4-session_4.6.1.bb
> index 09e34c5..4385ab8 100644
> --- a/recipes/xfce-base/xfce4-session_4.6.1.bb
> +++ b/recipes/xfce-base/xfce4-session_4.6.1.bb
> @@ -1,8 +1,8 @@
>  DESCRIPTION =3D "xfce4-session is a session manager for Xfce 4 Desktop E=
nvironment"
> -DEPENDS =3D "lbwnck libxfcegui4 libxfce4util dbus xfce-utils"
> +DEPENDS =3D "libwnck libxfcegui4 libxfce4util dbus xfce-utils"
>  SECTION =3D "x11"
> =20
> -PR =3D "r5"
> +PR =3D "r6"
> =20
>  inherit xfce46

Acked-by: Paul Menzel <paulepanter@users.sourceforge.net> and pushed
with edit of commit message in [1].

Please update the state of your patch in our patch queue [2].

	pwclient update -s Accepted -c 591a57e83ffb8b21da077445efc1b4f14f8b17e2 17=
33

I am not allowed to do so. You will have to register at [3].


Thanks,

Paul


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D591a57e=
83ffb8b21da077445efc1b4f14f8b17e2
[2] http://openembedded.org/index.php/Patchwork
[3] http://patches.openembedded.org/

--=-aRasbINZHICccNkGrVmQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2LBb4ACgkQPX1aK2wOHViLhgCbBasqJQNpLYAu/z9FzHKfhNY3
YzoAn1bLex7UQYNPQ4OFlcOCDW7SVNxn
=3wqz
-----END PGP SIGNATURE-----

--=-aRasbINZHICccNkGrVmQ--
