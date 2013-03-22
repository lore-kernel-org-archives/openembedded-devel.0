Received: from mail-da0-f48.google.com ([209.85.210.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UIyNc-0007Ai-1M
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Mar 2013 10:35:26 +0100
Received: by mail-da0-f48.google.com with SMTP id p8so2157527dan.35
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2013 02:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=kRUoDE4NjEBFxeul3pPRy/ajdK6elhpxgMyBdk8RO1o=;
	b=rxkkZQKygbyfxelIgp/e2NsbIHymLU3NtCIMBMo3Cg0tZhLC5eNX6KxRv/KILI9saH
	G+iJpkesMG19d+d7FTl/ASwWEPZWfWc31K6VgeGU2Jtc5QtEczsjDjAwnJGYFWTG/72b
	CO5bvncWeoFjZ2LEbms7l2DkuNyky/OPlWdv9Df5LYKjYnwvpJDpvj6Z7wePVKpDlr2q
	OSfF5q/X3YEDi6U8xr247ha51QSc6JUe69u+qsqgR2gAaEqL1IX8GQcK1SwjaF8PYYzN
	bqbCYKkuFdfZtQ/OTOvyp0Ccm75HemwkKd+9kW1DKYQsPQvAwvGqZwLncihuzLJl8oxJ
	l81w==
X-Received: by 10.66.88.105 with SMTP id bf9mr2053664pab.175.1363943905822;
	Fri, 22 Mar 2013 02:18:25 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id t1sm2263407pab.12.2013.03.22.02.18.23
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 22 Mar 2013 02:18:24 -0700 (PDT)
Date: Fri, 22 Mar 2013 10:18:23 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130322091823.GE3219@jama>
References: <1363697060-22628-1-git-send-email-obi@opendreambox.org>
MIME-Version: 1.0
In-Reply-To: <1363697060-22628-1-git-send-email-obi@opendreambox.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-multimedia][PATCH] libmusicbrainz: fix subsequent invocations of do_configure
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
X-List-Received-Date: Fri, 22 Mar 2013 09:35:34 -0000
X-Groupsio-MsgNum: 43646
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HnQK338I3UIa/qiP"
Content-Disposition: inline

--HnQK338I3UIa/qiP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 19, 2013 at 01:44:20PM +0100, Andreas Oberritter wrote:
> Every second invocation of do_configure failed with this error:

Applied, thanks!

>=20
> | CMake Error at src/CMakeLists.txt:19 (INCLUDE):
> |   include could not find load file:
> |
> |     [...]/git/build-native/ImportExecutables.cmake
>=20
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
>  .../recipes-multimedia/musicbrainz/libmusicbrainz_git.bb        |    7 +=
+++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrain=
z_git.bb b/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_gi=
t.bb
> index 051db7b..f6a8f53 100644
> --- a/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
> +++ b/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING.txt;md5=3Dfbc0939018=
57fcd118f065f900982c24"
>  DEPENDS =3D "expat neon"
> =20
>  PV =3D "5.0.1+git${SRCPV}"
> -PR =3D "r0"
> +PR =3D "r1"
> =20
>  SRCREV =3D "0749dd0a35b4a54316da064475863a4ac6e28e7e"
>  SRC_URI =3D "git://github.com/metabrainz/libmusicbrainz.git \
> @@ -21,8 +21,9 @@ inherit cmake pkgconfig
> =20
>  do_configure_prepend() {
>      # The native build really doesn't like being rebuilt, so delete
> -    # it if it's already present.
> -    rm -rf build-native
> +    # it if it's already present. Also delete all other files not
> +    # known to Git to fix subsequent invocations of do_configure.
> +    git clean -dfx -e /.pc/ -e /patches/ .
>      mkdir build-native
>      cd build-native
>      cmake -DCMAKE_C_FLAGS=3D${BUILD_CFLAGS} \
> --=20
> 1.7.10.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--HnQK338I3UIa/qiP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFMId8ACgkQN1Ujt2V2gBy/dACfXQ5tQH3Au94Gng8Uxij9gOWi
LE8AoKvqXIFeAtcxEdm8gOvxlyyRCCC6
=galb
-----END PGP SIGNATURE-----

--HnQK338I3UIa/qiP--
