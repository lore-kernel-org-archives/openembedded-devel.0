Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1RikCj-0003da-G6 for openembedded-devel@lists.openembedded.org;
	Thu, 05 Jan 2012 11:05:49 +0100
Received: from f053035030.adsl.alicedsl.de ([78.53.35.30]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Rik5k-0006JE-5E for openembedded-devel@lists.openembedded.org;
	Thu, 05 Jan 2012 09:58:36 +0000
Message-ID: <1325757506.3742.128.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 05 Jan 2012 10:58:26 +0100
In-Reply-To: <1325756829-6511-1-git-send-email-eyalr@ti.com>
References: <1325756829-6511-1-git-send-email-eyalr@ti.com>
X-Mailer: Evolution 3.2.2-1 
Mime-Version: 1.0
Subject: Re: [PATCH] iw: use a newer commit in the public git
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
X-List-Received-Date: Thu, 05 Jan 2012 10:05:49 -0000
X-Groupsio-MsgNum: 36373
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-eal5Kgebvvn7I2RWW2vD"

--=-eal5Kgebvvn7I2RWW2vD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Ayal,


Am Donnerstag, den 05.01.2012, 11:47 +0200 schrieb Eyal Reizer:
> switch to use a newer commit in the public git

That line is redundant to the commit summary. Why not use the following
as the summary?

        iw_git: Update to commit 8b2b1c6a (version 3.2)

Additionally please add if this just introduces new features or if it
fixes any problems for you.

And lastly please add how you have tested the new version.

> Signed-off-by: Eyal Reizer <eyalr@ti.com>
> ---
>  recipes/iw/iw_git.bb |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/recipes/iw/iw_git.bb b/recipes/iw/iw_git.bb
> index c98e1bc..f0dc7ff 100644
> --- a/recipes/iw/iw_git.bb
> +++ b/recipes/iw/iw_git.bb
> @@ -4,9 +4,9 @@ SECTION =3D "base"
>  PRIORITY =3D "optional"
>  LICENSE =3D "BSD"
> =20
> -SRCREV =3D "0a236ef5f8e4ba7218aac7d0cdacf45673d5b35c"
> -PR =3D "r0"
> -PV =3D "0.9.22"
> +SRCREV =3D "8b2b1c6a77ee17e4128b22845cb8c5901de296c9"
> +PR =3D "r1"
> +PV =3D "3.2"
>  PR_append =3D "+gitr${SRCPV}"

I always forget, if a `PR` bump for a version update is needed if we
have `PR_append${SRCPV}`. Could you check that again, please.
=20
>  DEPENDS =3D "libnl pkgconfig"


Thanks,

Paul

--=-eal5Kgebvvn7I2RWW2vD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk8FdEMACgkQPX1aK2wOHVjADACfUtByz5n2A26Z8D3laDbpLJ/8
Cx8AmwWtJI+uUooX0T0QypNkCsJukgFD
=5sbI
-----END PGP SIGNATURE-----

--=-eal5Kgebvvn7I2RWW2vD--
