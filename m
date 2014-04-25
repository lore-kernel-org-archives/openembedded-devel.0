Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id D569D65DBE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Apr 2014 12:35:48 +0000 (UTC)
Received: by mail-ee0-f44.google.com with SMTP id e49so2758469eek.31
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Apr 2014 05:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=TkILdPaRxsHTiksAwzYQu5XCiiZs19dOiTWmbxGova8=;
	b=W2ArAyWPDfx/Ya5uhms8nGDH4g/5E3OzgK1BQeZzcGeKgH529ZEfUTCVxGdLB11TJQ
	hn5O4FYVuPMNZ/jezhUdbpHjrBxpLiQoPqLXvOSuSuzSXvaD4KXyLQDuKvKX/Gp5dLVA
	Ct+xqVirYnPC0tg+zDJAbHbL0Dovyf36ydFcAv4fkfFOUmpq1tjO4TNfnjZCnzYYhadZ
	uAMwpPXZkqeVx/uUyVfRJLd8nyTCsdk+lOW26m7N5mSgBwalBugLpl2wrJ5rt8gOuenI
	ouFA7CH9/f87DkzY8nafn8WJYxQkED3RofJtzpue8X3Ob0F679swTDBiN37pPhHlrt+f
	2+gw==
X-Received: by 10.15.60.199 with SMTP id g47mr10438525eex.37.1398429349454;
	Fri, 25 Apr 2014 05:35:49 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	m42sm24527551eex.21.2014.04.25.05.35.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Apr 2014 05:35:47 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 25 Apr 2014 14:35:58 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140425123558.GU2486@jama>
References: <ljcuj9$fuc$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <ljcuj9$fuc$1@ger.gmane.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-qt5]remove -reduce-relocations on arm platform
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 25 Apr 2014 12:35:49 -0000
X-Groupsio-MsgNum: 49493
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8JMtXNYTIIy8Rvxv"
Content-Disposition: inline

--8JMtXNYTIIy8Rvxv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2014 at 08:16:09AM +0200, Neuer User wrote:
> On arm platform the compiler does not implement "-reduce-relocations",
> see here: https://bugreports.qt-project.org/browse/QTBUG-36129
>=20
> The meta-qt5 layer, however, uses this option, so configure will fail
> for qtbase.
>=20
> This patch fixes the problem for me, but it should better test on the
> platform and only apply it, when it is an arm platform:

This doesn't remove it only for arm and it's also missing SOB line.
>=20
> diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
> index 89736be..f23236a 100644
> --- a/recipes-qt/qt5/qtbase.inc
> +++ b/recipes-qt/qt5/qtbase.inc
> @@ -126,7 +126,6 @@ PACKAGECONFIG[nis] =3D "-nis,-no-nis"
>  PACKAGECONFIG[widgets] =3D "-widgets,-no-widgets"
>=20
>  QT_CONFIG_FLAGS +=3D " \
> -    -reduce-relocations \
>      -shared \
>      -silent \
>      -no-pch \
>=20
>=20
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--8JMtXNYTIIy8Rvxv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNaVq4ACgkQN1Ujt2V2gBzQhwCgpXK/yDSbIDgFQim9zq2bW7Df
dHkAn0scblTgf3vQ0HBCggBfV1gjlDEn
=XAG1
-----END PGP SIGNATURE-----

--8JMtXNYTIIy8Rvxv--
