Received: from mail-yh0-f51.google.com ([209.85.213.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UFpID-0001pL-En
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Mar 2013 18:18:18 +0100
Received: by mail-yh0-f51.google.com with SMTP id q1so210603yhf.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Mar 2013 10:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=PuHgY6jU+7qIv1XvdV3iYzc3WeE32/tFEanZe11xI2Q=;
	b=t9HhvCWKuMZo2/oyZTUvGyC/2pL63g5sElT7vhFXUAXHZB6GqkcjXTElBefmLuJEFr
	wHropEYC4MCWy1syZvu+vzi9IjQh384AKPP7hYFi+xCSmhl6AvdtArIwkrZ+ljNb51YK
	PTDeGTpPyrHSZDoYEkyQ+By2NL/6rJke4FVesqS2Ce8s5yLfVQekHuZRB+vysEeyW7iW
	l/u6ItdUkc8j0qcDnNeEqaV9vA1tqXEB9zfoNFkxNBIpCD6gG0HU0+8Jxv3A63yi1lHQ
	ltw1Y5rgEgdDr11/vl/GJJx5yRCTk3qGC4UXsVSgt6MgzN6BlLbsw3+T/ko/H005EuIs
	t9cQ==
X-Received: by 10.236.209.42 with SMTP id r30mr11226840yho.34.1363194004149;
	Wed, 13 Mar 2013 10:00:04 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id s74sm36425483yhh.5.2013.03.13.10.00.02
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 13 Mar 2013 10:00:03 -0700 (PDT)
Date: Wed, 13 Mar 2013 17:59:56 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130313165956.GC3260@jama>
References: <1362906243-13223-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1362906243-13223-1-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] tcsh: Depend on ncurses.
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
X-List-Received-Date: Wed, 13 Mar 2013 17:18:42 -0000
X-List-Received-Date: Wed, 13 Mar 2013 17:18:42 -0000
X-Groupsio-MsgNum: 43540
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Bixl4pq/MaomSJT0"
Content-Disposition: inline

--Bixl4pq/MaomSJT0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 10, 2013 at 01:04:03AM -0800, Khem Raj wrote:
> This fixes the compile errors seen when building
> tcsh from scratch. Its not seen with image builds
> normally since ncurses is already built due to
> other image dependencies

Applied, thanks!

>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-extended/tcsh/tcsh_6.18.01.bb |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-extended/tcsh/tcsh_6.18.01.bb b/meta-oe/reci=
pes-extended/tcsh/tcsh_6.18.01.bb
> index d85fba8..bba89bf 100644
> --- a/meta-oe/recipes-extended/tcsh/tcsh_6.18.01.bb
> +++ b/meta-oe/recipes-extended/tcsh/tcsh_6.18.01.bb
> @@ -7,7 +7,7 @@ HOMEPAGE =3D "http://www.tcsh.org/"
>  LICENSE =3D "BSD"
>  LIC_FILES_CHKSUM =3D "file://Copyright;md5=3D1cf29be62df2be1a3763118b25b=
4c780"
>  SECTION =3D "base"
> -
> +DEPENDS =3D "ncurses"
>  SRC_URI =3D " \
>  	${DEBIAN_MIRROR}/main/t/tcsh/tcsh_${PV}.orig.tar.gz;name=3Dtarball \
>  	${DEBIAN_MIRROR}/main/t/tcsh/tcsh_${PV}-2.diff.gz;name=3Ddiffs \
> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Bixl4pq/MaomSJT0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFAsIwACgkQN1Ujt2V2gBywuQCdFiY4LayV/wioYxOg2IIpl4SH
VL0AmQH2S8XbQpuXJI47vSFJNbzA+Xl9
=JtTW
-----END PGP SIGNATURE-----

--Bixl4pq/MaomSJT0--
