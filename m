Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SQDdk-0005sO-QJ
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 May 2012 10:13:24 +0200
Received: by bkcjm2 with SMTP id jm2so2164246bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 May 2012 01:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=R2NBGvbwfk6Yd9hYcUf7pyq471/YxsTdhBcgofaK4oY=;
	b=uQ+tCKLWI0pbJEYvJAZYGFxWkbw6d5Jgowif/Gb4qoTe2ZWtdG1f9iHW7P/9XIkZT+
	BD274esD5aSR20ZCzNpEa2xUnsHQy3nyjmmws/dEkgj0vyD9IxLsA+NYW4tAaB1hru5t
	aid3RxK2bfspKuNN05D4r+bLtQ4WTUM+/3DhuNkMmQDJnwwOj/2AxQajZ4iDONy1Yq8M
	1AemvjcrYMd3l+Dglmaet5Hpkx7PdfaiOIwa86AnP7LlJyPbo9zPWH+qjYIV+kQhQ7rp
	9E3Jcgc0WS64dAtDZEktwkczpf9oUaJg+k7/7QtGwa/ioN9EBzuViZRPrfpX5/QYNy7P
	Vv2A==
Received: by 10.204.150.92 with SMTP id x28mr1786006bkv.61.1336118618394;
	Fri, 04 May 2012 01:03:38 -0700 (PDT)
Received: from localhost ([94.230.152.246]) by mx.google.com with ESMTPS id
	zx16sm15096829bkb.13.2012.05.04.01.03.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 May 2012 01:03:37 -0700 (PDT)
Date: Fri, 4 May 2012 10:03:40 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120504080307.GE3163@jama.jama.net>
References: <1336117775-20242-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <1336117775-20242-1-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] xinput-calibrator 0.7.5: add xterm to RDEPENDS, the menu item doesn't work without it
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
X-List-Received-Date: Fri, 04 May 2012 08:13:24 -0000
X-Groupsio-MsgNum: 38572
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="U3BNvdZEnlJXqmh+"
Content-Disposition: inline

--U3BNvdZEnlJXqmh+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 04, 2012 at 09:49:35AM +0200, Koen Kooi wrote:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

> ---
>  .../recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bb  |    =
4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator=
_0.7.5.bb b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_0.=
7.5.bb
> index a50a0cf..765dcf2 100644
> --- a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.=
bb
> +++ b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.=
bb
> @@ -4,7 +4,7 @@ LICENSE =3D "MIT-X"
>  LIC_FILES_CHKSUM =3D "file://src/calibrator.cpp;endline=3D22;md5=3D998e2=
38a7638a7446eaeb02398f691fc"
>  DEPENDS =3D "virtual/libx11 libxi"
> =20
> -PR =3D "r5"
> +PR =3D "r6"
> =20
>  inherit autotools systemd
> =20
> @@ -33,5 +33,5 @@ SYSTEMD_PACKAGES =3D "${PN}-systemd"
>  SYSTEMD_SERVICE =3D "${PN}.service"
> =20
>  FILES_${PN} +=3D "${sysconfdir}/xdg/autostart"
> -RDEPENDS_${PN} =3D "xinput"
> +RDEPENDS_${PN} =3D "xinput xterm"
>  RRECOMMENDS_${PN} =3D "pointercal-xinput"
> --=20
> 1.7.10
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--U3BNvdZEnlJXqmh+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+jjVwACgkQN1Ujt2V2gBzOuACeOFvacWmRate1Cb9t+846GIP9
dMkAnR+Tb+3rwIhIpk9Gia7cssMSLDAK
=pGqE
-----END PGP SIGNATURE-----

--U3BNvdZEnlJXqmh+--
