Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RbBTf-0002my-7g
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Dec 2011 14:36:03 +0100
Received: by eekb15 with SMTP id b15so1783144eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Dec 2011 05:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=grOY7MsuM1kqPobMoAw3TA4gdqke3CAOdKMAe72Krdo=;
	b=ZXhDpWWsdi1lCx3LBUbJD65iqSQRAKzYbS0UC5feoWfWHOA5v/Xq6JWnXh5j+p8ThH
	gMx3hx4ipeMBCMgedROyXysJuY/3LeUBeva/P735xCi0pTMD0n1gQVmozWrDxaCywqyF
	RTtTsKT2eLtx/s61M/Z4fhnSJnl8CqDtQNiQU=
Received: by 10.213.4.208 with SMTP id 16mr1267409ebs.112.1323955744228;
	Thu, 15 Dec 2011 05:29:04 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id s16sm24300347eef.2.2011.12.15.05.29.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Dec 2011 05:29:03 -0800 (PST)
Date: Thu, 15 Dec 2011 14:29:01 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111215132901.GC4419@jama.jama.net>
References: <cover.1323951062.git.Martin.Jansa@gmail.com>
	<4e766bdaa32a21cb016586d133d348e7f641327b.1323951062.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <4e766bdaa32a21cb016586d133d348e7f641327b.1323951062.git.Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH][meta-oe][meta-efl 4/6] mplayer2: drop FULL_OPTIMIZATION_armv7a
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
X-List-Received-Date: Thu, 15 Dec 2011 13:36:03 -0000
X-Groupsio-MsgNum: 36134
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Pk6IbRAofICFmK5e"
Content-Disposition: inline

--Pk6IbRAofICFmK5e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 15, 2011 at 01:15:51PM +0100, Martin Jansa wrote:
> * we had -ftree-vectorize instead of -frename-registers here, but that's
>   causing ICE with latest gcc-4.6 from meta-oe

I'll update this one to pass even -fno-tree-vectorize, because this
patch fixed it for nokia900, but qemux86-64 still fails

> * similar to issue in libvpx
>   http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-November/0=
36001.html
>   and lowering to -O3 is not enough in this case
>   | libmpcodecs/ad_imaadpcm.c: In function 'qt_ima_adpcm_decode_block':
>   | libmpcodecs/ad_imaadpcm.c:177:12: internal compiler error: Segmentati=
on fault
>   | Please submit a full bug report,
>   | with preprocessed source if appropriate.
>   | See <http://gcc.gnu.org/bugs.html> for instructions.
>   | make: *** [libmpcodecs/ad_imaadpcm.o] Error 1
>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb |    3 +--
>  1 files changed, 1 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb b/meta-oe=
/recipes-multimedia/mplayer/mplayer2_git.bb
> index ee64ca8..b892420 100644
> --- a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
> +++ b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
> @@ -21,7 +21,7 @@ SRCREV =3D "e3f5043233336d8b4b0731c6a8b42a8fda5535ac"
>  ARM_INSTRUCTION_SET =3D "ARM"
> =20
>  PV =3D "2.0+gitr${SRCPV}"
> -PR =3D "r3"
> +PR =3D "r4"
> =20
>  PARALLEL_MAKE =3D ""
> =20
> @@ -131,7 +131,6 @@ EXTRA_OECONF_append_armv6 =3D " --enable-armv6"
>  EXTRA_OECONF_append_armv7a =3D " --enable-armv6 --enable-neon"
> =20
>  FULL_OPTIMIZATION =3D "-fexpensive-optimizations -fomit-frame-pointer -f=
rename-registers -O4 -ffast-math"
> -FULL_OPTIMIZATION_armv7a =3D "-fexpensive-optimizations  -ftree-vectoriz=
e -fomit-frame-pointer -O4 -ffast-math"
>  BUILD_OPTIMIZATION =3D "${FULL_OPTIMIZATION}"
> =20
>  CFLAGS_append =3D " -I${S}/libdvdread4 "
> --=20
> 1.7.8
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Pk6IbRAofICFmK5e
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7p9h0ACgkQN1Ujt2V2gBwqSACeN2gYEDNxj6JebDfCMyDAbY6x
58gAnRewlvzuTUwp1zK9VfFTkmAtQep1
=Erjt
-----END PGP SIGNATURE-----

--Pk6IbRAofICFmK5e--
