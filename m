Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Srp52-0002jG-Pt
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Jul 2012 13:39:41 +0200
Received: by wgbds1 with SMTP id ds1so4675958wgb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jul 2012 04:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=P4VW1hoXs7Og95bC4TYf148w5y7tP5IrRXb6H6r5rJU=;
	b=WSiFyuO5SU80HhGEOjU7DSbSgFNFQnyngvZst8NnKyQabYXPRjnD+RhO0IqAwQVjLW
	W/akpSf/ZJe/4EtqGfsjcNH15Fqcl13JBXldHK9gjo9lOf51N/MNDUfR3HMoydE7TGx3
	0fBjEuVusn8FMt+NJJSU84n9I1LL0Y8B0AddzZ64y7Jm8hs1Dc7PSQBO66iEiRQynP8p
	2ayhXZd7XsZ4qLL9qBHGSO5gA9K8rns8CKYwtxdjb8jvRzx3BNXyBayuu4ASSNvzd1zk
	VSWKXXiS1FyB3gh7onCRu8XZEcQ2MM3qDPjsTOnXJOK2ly5s6OM8P8OAuKqKAy1AUkE7
	hbSA==
Received: by 10.180.107.2 with SMTP id gy2mr15446301wib.2.1342697299158;
	Thu, 19 Jul 2012 04:28:19 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fb20sm5425124wid.1.2012.07.19.04.28.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Jul 2012 04:28:18 -0700 (PDT)
Date: Thu, 19 Jul 2012 13:28:29 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120719112829.GJ3331@jama.jama.net>
References: <1342696316-8537-1-git-send-email-Martin.Jansa@gmail.com>
	<1342696316-8537-2-git-send-email-Martin.Jansa@gmail.com>
	<ju8qnl$47e$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <ju8qnl$47e$1@dough.gmane.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][RFC 2/2] e/efl/gpe.bbclass: convert tabs to 4 spaces also in bash tasks
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
X-List-Received-Date: Thu, 19 Jul 2012 11:39:41 -0000
X-Groupsio-MsgNum: 39780
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SBT+cnFS/G3NVgv4"
Content-Disposition: inline

--SBT+cnFS/G3NVgv4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 19, 2012 at 01:23:33PM +0200, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Shell tasks use tabs according to the styleguide

That's why it's RFC, see my request to change yocto styleguide (on
oe-core/bitbake-devel ML)

Cheers,

>=20
> Op 19-07-12 13:11, Martin Jansa schreef:
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com> ---=20
> > meta-efl/classes/e.bbclass   |    4 ++-- meta-efl/classes/efl.bbclass |
> > 8 ++++---- meta-oe/classes/gpe.bbclass  |    4 ++-- 3 files changed, 8
> > insertions(+), 8 deletions(-)
> >=20
> > diff --git a/meta-efl/classes/e.bbclass b/meta-efl/classes/e.bbclass=20
> > index 375f914..4bcc2bc 100644 --- a/meta-efl/classes/e.bbclass +++
> > b/meta-efl/classes/e.bbclass @@ -3,12 +3,12 @@ SECTION =3D "e/apps" inh=
erit
> > e-base autotools pkgconfig binconfig
> >=20
> > do_prepsources () { -	make clean distclean || true +    make clean
> > distclean || true } addtask prepsources after do_patch before
> > do_configure
> >=20
> > do_configure_append() { -	find ${S} -name Makefile | xargs sed -i
> > s:'-I$(includedir)':'-I.':g +    find ${S} -name Makefile | xargs sed -i
> > s:'-I$(includedir)':'-I.':g }
> >=20
> > export CURL_CONFIG =3D "${STAGING_BINDIR_CROSS}/curl-config" diff --git
> > a/meta-efl/classes/efl.bbclass b/meta-efl/classes/efl.bbclass index
> > 792343b..7cf8556 100644 --- a/meta-efl/classes/efl.bbclass +++
> > b/meta-efl/classes/efl.bbclass @@ -10,13 +10,13 @@ inherit e-base
> > autotools # evas-native looks at this var, so keep it
> >=20
> > do_configure_prepend() { -	autopoint || touch config.rpath +    autopoi=
nt
> > || touch config.rpath }
> >=20
> > do_install_prepend () { -	for i in `find ${S}/ -name "*.pc" -type f` ; =
do
> > \ -		sed -i -e 's:-L${STAGING_LIBDIR}:-L\$\{libdir\}:g' -e
> > 's:-I${STAGING_LIBDIR}:-I\$\{libdir\}:g' -e
> > 's:-I${STAGING_INCDIR}:-I\$\{includedir\}:g' $i -	done +    for i in
> > `find ${S}/ -name "*.pc" -type f` ; do \ +        sed -i -e
> > 's:-L${STAGING_LIBDIR}:-L\$\{libdir\}:g' -e
> > 's:-I${STAGING_LIBDIR}:-I\$\{libdir\}:g' -e
> > 's:-I${STAGING_INCDIR}:-I\$\{includedir\}:g' $i +    done }
> >=20
> > PACKAGES =3D+ "${PN}-themes" diff --git a/meta-oe/classes/gpe.bbclass
> > b/meta-oe/classes/gpe.bbclass index 7e042ee..2adbd48 100644 ---
> > a/meta-oe/classes/gpe.bbclass +++ b/meta-oe/classes/gpe.bbclass @@ -7,11
> > +7,11 @@ SECTION ?=3D "gpe" inherit gettext
> >=20
> > gpe_do_compile() { -	oe_runmake PREFIX=3D${prefix} +    oe_runmake
> > PREFIX=3D${prefix} }
> >=20
> > gpe_do_install() { -	oe_runmake PREFIX=3D${prefix} DESTDIR=3D${D} insta=
ll +
> > oe_runmake PREFIX=3D${prefix} DESTDIR=3D${D} install }
> >=20
> > EXPORT_FUNCTIONS do_compile do_install
>=20
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>=20
> iD8DBQFQB+41MkyGM64RGpERAlLUAJ46P5hcIkcHbqacI66sydAr4clhggCeO3Uo
> Fnz5VUBx1366gOr5wCK+gXs=3D
> =3DkFmn
> -----END PGP SIGNATURE-----
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--SBT+cnFS/G3NVgv4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAH710ACgkQN1Ujt2V2gBzErgCfbjGBnseRyOx5plwkgHfsJPMo
WBsAoKSWHB4Mh3wgY6fAL6EMOt9Mw1SZ
=ld2e
-----END PGP SIGNATURE-----

--SBT+cnFS/G3NVgv4--
