Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1RDdgf-0008N5-He; Tue, 11 Oct 2011 16:52:09 +0200
Received: by bke11 with SMTP id 11so9978239bke.6
	for <multiple recipients>; Tue, 11 Oct 2011 07:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ZDpUtHyOaliiD0ifOrLaYHbD9aUNdDvyCaL2Y/u3E04=;
	b=dNmL69Bc/JN9VE1w1hkZAqJJBBLEw6kznn4zTh8j6z9BhBn79yAOtBkTcX5RiLLWt3
	ICLYUZRT6YcRHDKsDZkhdFcKnc4AkLxSlGUZRj/ECBsAmmrZQue8hBtzQTJMAteBQBUN
	2qXkmCAtnvzXDZLPf4At85ldQpxQlUVnbhnNc=
Received: by 10.204.129.6 with SMTP id m6mr10019158bks.0.1318344375966;
	Tue, 11 Oct 2011 07:46:15 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a27sm2197318bku.9.2011.10.11.07.46.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Oct 2011 07:46:14 -0700 (PDT)
Date: Tue, 11 Oct 2011 16:46:07 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111011144607.GF27073@jama.jama.net>
References: <E1RDdYN-0006Pm-Qd@garnet.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <E1RDdYN-0006Pm-Qd@garnet.openembedded.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Koen Kooi : guile: fix licensing and gettext inherit
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
X-List-Received-Date: Tue, 11 Oct 2011 14:52:10 -0000
X-Groupsio-MsgNum: 34636
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+ts6NCQ4mrNQIV8p"
Content-Disposition: inline

--+ts6NCQ4mrNQIV8p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 11, 2011 at 02:43:35PM +0000, git version control wrote:
> Module: meta-openembedded.git
> Branch: master
> Commit: 8fcf92fed89557683a08f67667acc77a8f73dc0a
> URL:    http://git.openembedded.org/?p=3Dmeta-openembedded.git&a=3Dcommit=
;h=3D8fcf92fed89557683a08f67667acc77a8f73dc0a
>=20
> Author: Koen Kooi <koen@dominion.thruhere.net>
> Date:   Tue Oct 11 16:40:25 2011 +0200
>=20
> guile: fix licensing and gettext inherit
>=20
> Reported by Philip Balister
>=20
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>=20
> ---
>=20
>  meta-oe/recipes-support/guile/guile-native.inc     |    1 -
>  .../recipes-support/guile/guile-native_1.8.7.bb    |    2 ++
>  meta-oe/recipes-support/guile/guile.inc            |    5 ++---
>  meta-oe/recipes-support/guile/guile_1.8.7.bb       |    2 ++
>  4 files changed, 6 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta-oe/recipes-support/guile/guile-native.inc b/meta-oe/rec=
ipes-support/guile/guile-native.inc
> index 20ff541..dfa126a 100644
> --- a/meta-oe/recipes-support/guile/guile-native.inc
> +++ b/meta-oe/recipes-support/guile/guile-native.inc
> @@ -2,7 +2,6 @@ SECTION =3D "unknown"
>  DEPENDS =3D "gettext-native gmp-native"
> =20
>  LICENSE =3D "LGPLv2.1"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc9ba0d76ca3ef2a1d15a2ac839ef0=
1fa"
> =20
>  inherit autotools native
> =20
> diff --git a/meta-oe/recipes-support/guile/guile-native_1.8.7.bb b/meta-o=
e/recipes-support/guile/guile-native_1.8.7.bb
> index f8fd4c7..2b2707a 100644
> --- a/meta-oe/recipes-support/guile/guile-native_1.8.7.bb
> +++ b/meta-oe/recipes-support/guile/guile-native_1.8.7.bb
> @@ -1,5 +1,7 @@
>  require guile-native.inc
> =20
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc9ba0d76ca3ef2a1d15a2ac839ef0=
1fa"
> +
>  PR =3D "r1"
>  SRC_URI =3D "http://ftp.gnu.org/pub/gnu/guile/guile-${PV}.tar.gz \
>             file://configure-fix.patch \
> diff --git a/meta-oe/recipes-support/guile/guile.inc b/meta-oe/recipes-su=
pport/guile/guile.inc
> index 918ce33..842e8d7 100644
> --- a/meta-oe/recipes-support/guile/guile.inc
> +++ b/meta-oe/recipes-support/guile/guile.inc
> @@ -7,10 +7,9 @@ PACKAGES =3D+ "${PN}-el"
>  FILES_${PN}-el =3D "${datadir}/emacs"
>  DESCRIPTION_${PN}-el =3D "Emacs lisp files for Guile"
> =20
> -LICENSE =3D "LGPLv2.1"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc9ba0d76ca3ef2a1d15a2ac839ef0=
1fa"
> +LICENSE =3D "LGPLv2.1+"
> =20
> -inherit autotools
> +inherit autotools gettext
> =20
>  acpaths =3D "-I ${S}/guile-config"
> =20
> diff --git a/meta-oe/recipes-support/guile/guile_1.8.7.bb b/meta-oe/recip=
es-support/guile/guile_1.8.7.bb
> index 8b3a80d..d02fe42 100644
> --- a/meta-oe/recipes-support/guile/guile_1.8.7.bb
> +++ b/meta-oe/recipes-support/guile/guile_1.8.7.bb
> @@ -1,5 +1,7 @@
>  require guile.inc
> =20
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5711ae313ffd140741e741b88d9d4=
007"
> +
>  PR =3D "r1"
> =20
>  SRC_URI =3D "http://ftp.gnu.org/pub/gnu/guile/guile-${PV}.tar.gz \

Is there some special reason why
guile-1.8.7/18.diff is applied only in target recipe? I've noticed only
because different LIC_FILES_CHKSUM look strange..

Regards,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--+ts6NCQ4mrNQIV8p
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6UVq8ACgkQN1Ujt2V2gBwN9QCfft7NqSyK5OiqueqHcX4bS3VU
TzIAn12alqfiHvTHbf/GP15nEB1cTz2O
=fYwx
-----END PGP SIGNATURE-----

--+ts6NCQ4mrNQIV8p--
