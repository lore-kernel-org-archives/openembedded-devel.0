Received: from mail-pa0-f49.google.com ([209.85.220.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TrpSn-0004Wz-SZ
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Jan 2013 13:36:47 +0100
Received: by mail-pa0-f49.google.com with SMTP id bi1so10096449pad.22
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Jan 2013 04:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=JnX3FutIBG9FfQwXX807dkAPqgE9VhtrvPsjNYAMXQk=;
	b=WJ2E/JdMk2/ttIq1Mk0pPMLV8LmRjotx+5faLr/csje5s/cdl84gG766lmCo1dBf2o
	uy2Q1bURIPN+6LZ01fxJAPU7Rl1SbM9K0fsYQEf5gQhAe+GwUMmlDavR2Xa92lWq2yUG
	J5TSB4pThIy+8SrchAY7L6XJIgizQQ47WkAe87UtglW+poUeH2/3i0cXJ8FNwCY1HlKG
	Fz3SWbAi1xVwzOKb6+Yo5Jd7MVtuINlKxYUw3DCk2I/q3pZcanKFjpw5tvwGg4H5p0TO
	/Mj/AYEx3vSBt6e9chhHzj3HVXzrS2PxINTlVScJd2x+JIjRCANjKnPjcwYCgAJJSNwh
	gxmw==
X-Received: by 10.66.75.100 with SMTP id b4mr169520933paw.0.1357474879842;
	Sun, 06 Jan 2013 04:21:19 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id qn3sm33564099pbb.56.2013.01.06.04.21.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 06 Jan 2013 04:21:18 -0800 (PST)
Date: Sun, 6 Jan 2013 13:21:18 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130106122118.GG3272@jama>
References: <1357239255-20959-1-git-send-email-cazfi74@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1357239255-20959-1-git-send-email-cazfi74@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: Prepare recipes for automake-1.13 (batch 1)
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
X-List-Received-Date: Sun, 06 Jan 2013 12:36:48 -0000
X-Groupsio-MsgNum: 42534
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="f5QefDQHtn8hx44O"
Content-Disposition: inline

--f5QefDQHtn8hx44O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 03, 2013 at 08:54:12PM +0200, Marko Lindqvist wrote:
> This batch is just three patches - most likely just drop in the
> ocean of automake-1.13 problems in meta-openembedded. These are
> kind side-products of trying to get things to work in
> openembedded-core side.
>=20
> Below text is about all the work I've done for automake-1.13
> compatibility so far - not all of it is relevant to this batch.

All 3 merged, libmikmod was missing PR bump, but it's not big issue for
this kind of change.

Cheers,

> --------------------------------------------------------------------
>=20
> In practice there is three categories of changes in automake-1.13
> that cause packages to break. From that follows that virtually all
> problems fall to three categories, and all packages suffering from
> problem of the same category get virtually identical fix.
>=20
> * Long deprecated macros completely removed from automake-1.13,
>   which errors out upon seeing them. For these I add patch,
>   always called obsolete_automake_macros.patch, that replaces
>   obsolete macro with proper one. Most of the patches are just
>   AM_CONFIG_HEADER -> AC_CONFIG_HEADERS change.
>=20
> * Trying to run help2man via "missing" when it doesn't exist.
>   Old automake versions allowed "missing" to be used that way,
>   1.13 aborts. I'm just removing the attempt to create manpages
>   that way. Note that it never actually worked anyway -
>   old automake just didn't abort when it failed.
>=20
> * TESTS list cannot have $(srcdir) or $(top_srcdir) as part
>   of the path. When it does, it's usually bug in the package,
>   but unfortunately automake prevents it also when it's not.
>   Solution applied here is to simply remove TESTS.
>=20
> --------------------------------------------------------------------
>=20
> [meta-oe][PATCH 1/3] tslib: replace obsolete automake macros with
> [meta-oe][PATCH 2/3] libmikmod: replace obsolete automake macros
> [meta-oe][PATCH 3/3] libmad: replace obsolete automake macros with
>=20
>=20
>=20
>  - ML
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--f5QefDQHtn8hx44O
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDpbD4ACgkQN1Ujt2V2gBzRDwCcDg+0rdCQmEsoPq4J0dRmuujK
ob8AoJK5/jtUB2298iTQw1edY8tDSNm/
=tvet
-----END PGP SIGNATURE-----

--f5QefDQHtn8hx44O--
