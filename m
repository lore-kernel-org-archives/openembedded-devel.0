Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QiWss-0004tU-LT for openembedded-devel@lists.openembedded.org;
	Sun, 17 Jul 2011 21:20:10 +0200
Received: from f053041089.adsl.alicedsl.de ([78.53.41.89]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QiWph-0003oc-5I for openembedded-devel@lists.openembedded.org;
	Sun, 17 Jul 2011 19:16:53 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <09D9BE2AC4AA764DABAA8C91E48D819E0157569594@DEMCHP99E35MSX.ww902.siemens.net>
References: <09D9BE2AC4AA764DABAA8C91E48D819E0157569594@DEMCHP99E35MSX.ww902.siemens.net>
Date: Sun, 17 Jul 2011 21:16:08 +0200
Message-ID: <1310930168.4288.47.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH] packaged-staging: fixed fetching from PSTAGE_MIRROR with file:// uri
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
X-List-Received-Date: Sun, 17 Jul 2011 19:20:10 -0000
X-Groupsio-MsgNum: 33194
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-rw0vXTHlWzjYA8vTBEPw"

--=-rw0vXTHlWzjYA8vTBEPw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Fabrice,


thank you for your patch.

Am Sonntag, den 17.07.2011, 20:50 +0200 schrieb Aeschbacher, Fabrice:
> Packaged-staging:
>=20
> * This patch fixes fetching pre-built staging packages from PSTAGE_MIRROR=
 having file:// uri
>   (thanks to Tom Rini for helping me fixing this)

A link to the discussion in the archive would be great in my opinion.

http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-July/033938.ht=
ml

Since your Signed-off-by line and From line differ slightly, you should
add

	From: Fabrice Aeschbacher <fabrice.aeschbacher@siemens.com>

to the beginning of your patches, i. e. first line of your message.

> Signed-off-by: Fabrice Aeschbacher <fabrice.aeschbacher@siemens.com>
> ---
>  classes/packaged-staging.bbclass |    9 ++++++---
>  1 files changed, 6 insertions(+), 3 deletions(-)
>=20
> diff --git a/classes/packaged-staging.bbclass b/classes/packaged-staging.=
bbclass
> index 29a3238..c60e271 100644
> --- a/classes/packaged-staging.bbclass
> +++ b/classes/packaged-staging.bbclass
> @@ -200,10 +200,13 @@ def staging_fetch(stagepkg, d):
>          try:
>              bb.fetch.init([srcuri], pd)
>              bb.fetch.go(pd, [srcuri])
> +            stagepkg =3D bb.fetch.localpath(srcuri, pd)
>          except Exception, ex:
> -	    bb.debug(1, "Failed to fetch staging package %s: %s" % (bn, ex))
> +            bb.debug(1, "Failed to fetch staging package %s: %s" % (bn, =
ex))
>          else:
> -	    bb.debug(1, "Fetched staging package %s" % bn)
> +            bb.debug(1, "Fetched staging package %s" % bn)

White space changes always make reviews harder for me.

> +
> +        return stagepkg
> =20
>  PSTAGE_TASKS_COVERED =3D "fetch unpack munge patch configure qa_configur=
e rig_locales compile sizecheck install deploy package populate_sysroot pac=
kage_write_deb package_write_ipk package_write package_stage qa_staging"
> =20
> @@ -222,7 +225,7 @@ python packagestage_scenefunc () {
> =20
>      stagepkg =3D bb.data.expand("${PSTAGE_PKG}", d)
>      if not os.path.exists(stagepkg):
> -        staging_fetch(stagepkg, d)
> +        stagepkg =3D staging_fetch(stagepkg, d)
> =20
>      if os.path.exists(stagepkg):
>          pstage_set_pkgmanager(d)

Reviewed-by: Paul Menzel <paulepanter@users.sourceforge.net>


Thanks,

Paul

--=-rw0vXTHlWzjYA8vTBEPw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk4jNPgACgkQPX1aK2wOHVhKiACbBk7fKl+zc7IMh1sIfQtipRTJ
s2QAnRJ7td+Eir+GJczP0nYiB7w6SCWc
=XZaR
-----END PGP SIGNATURE-----

--=-rw0vXTHlWzjYA8vTBEPw--
