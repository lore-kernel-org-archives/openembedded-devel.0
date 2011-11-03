Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RLwLA-0008M2-Ly
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Nov 2011 13:24:17 +0100
Received: by eyd9 with SMTP id 9so997650eyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Nov 2011 05:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=12EOdgcUPIVYxS+a/sswvaOQ/Hn3/C7RkMYgpdghXCs=;
	b=bWVMakXsPRNT/mR2wyr6IlkBxr3EPm0JtXWsqNms9vn2nPa2od0OdvB35ISuh/l9x9
	QLZ/U9otvJt1qkJx38BGpZgqCDgh62N5Kxg1MYsSYCwCZdzZ8m3HCRDa4k8SKTJkf9GF
	61B8KNeYU8t8rziH2Qj/p6A+MolhW0vPb56es=
Received: by 10.14.6.72 with SMTP id 48mr72314eem.111.1320322685123;
	Thu, 03 Nov 2011 05:18:05 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 49sm15303368eec.1.2011.11.03.05.18.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Nov 2011 05:18:04 -0700 (PDT)
Date: Thu, 3 Nov 2011 13:17:52 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111103121752.GL9949@jama.jama.net>
References: <1320322383-19870-1-git-send-email-jdk@ti.com>
MIME-Version: 1.0
In-Reply-To: <1320322383-19870-1-git-send-email-jdk@ti.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] rt-test: moved to github repo
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
X-List-Received-Date: Thu, 03 Nov 2011 12:24:17 -0000
X-Groupsio-MsgNum: 35200
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FxavXfDenm+F7xE/"
Content-Disposition: inline

--FxavXfDenm+F7xE/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 03, 2011 at 08:13:03AM -0400, Jason Kridner wrote:
> PR not bumped since previous builds would be identical.

This belongs to oe-core ML and there is already patch from Koen
http://patches.openembedded.org/patch/14239/

> ---
>  meta/recipes-rt/rt-tests/rt-tests_0.73.bb |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/recipes-rt/rt-tests/rt-tests_0.73.bb b/meta/recipes-rt/=
rt-tests/rt-tests_0.73.bb
> index a2cf6be..e816fa2 100644
> --- a/meta/recipes-rt/rt-tests/rt-tests_0.73.bb
> +++ b/meta/recipes-rt/rt-tests/rt-tests_0.73.bb
> @@ -11,7 +11,7 @@ SRCREV =3D "81da016fb0f6ab0511fbec81fc8ba1a50398a20d"
>  PV =3D "git${SRCPV}"
>  PR =3D "r0"
> =20
> -SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/clrkwllms/rt-=
tests.git;protocol=3Dgit"
> +SRC_URI =3D "git://github.com/clrkwllms/rt-tests.git;protocol=3Dgit"
> =20
>  S =3D "${WORKDIR}/git"
> =20
> --=20
> 1.7.4.1
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--FxavXfDenm+F7xE/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6yhnAACgkQN1Ujt2V2gByGWACfa6XpJQ2SrAojh8V+3CBN7S/x
BdAAn2CfESxNB1YJMV91a4BQnj7j74GG
=Jq3H
-----END PGP SIGNATURE-----

--FxavXfDenm+F7xE/--
