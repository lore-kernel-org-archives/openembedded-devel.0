Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RkFOH-0007KF-9j
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Jan 2012 14:35:57 +0100
Received: by eaal1 with SMTP id l1so2025602eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Jan 2012 05:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=QcNcZX4Qd5fq7rJArbp5nusp9b2p6VH4xW/ESMp9Bfs=;
	b=Qzy4DBPwNOPjsyWcrTzLopd/bHvUF5w7w9pT9dzy7RRTVaFYEYI2haQSaCeZwBVQtq
	iVsQc9IPmwQvnf3nvZJdos8EfoI0JEdfeZjHWd6vnO5Z8juI6cxEESsRULqCCFZMtDIB
	yNhzYMk1sciIgCkZUD3QTSjE+BU4c3UISuFls=
Received: by 10.213.32.71 with SMTP id b7mr1629214ebd.59.1326115709822;
	Mon, 09 Jan 2012 05:28:29 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a60sm290829227eeb.4.2012.01.09.05.28.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 Jan 2012 05:28:28 -0800 (PST)
Date: Mon, 9 Jan 2012 14:28:16 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120109132816.GB3936@jama.jama.net>
References: <cover.1326114932.git.anders@chargestorm.se>
	<5fec4c565130ce5590d5073421f211898d12dc24.1326114932.git.anders@chargestorm.se>
MIME-Version: 1.0
In-Reply-To: <5fec4c565130ce5590d5073421f211898d12dc24.1326114932.git.anders@chargestorm.se>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 2/2] systemd: split out systemd-analyze
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
X-List-Received-Date: Mon, 09 Jan 2012 13:35:57 -0000
X-Groupsio-MsgNum: 36436
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+QahgC5+KEYLbs62"
Content-Disposition: inline

--+QahgC5+KEYLbs62
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 09, 2012 at 02:18:38PM +0100, Anders Darander wrote:
> Split systemd-analyze to a separate package, to remove the implicit
> dependency on python. (At least the rpm-packaging backend created a
> run-time dependency on python).
>=20
> Signed-off-by: Anders Darander <anders@chargestorm.se>
> ---
>  meta-oe/recipes-core/systemd/systemd_git.bb |    6 ++++--
>  1 files changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-oe/recipes-core/systemd/systemd_git.bb b/meta-oe/recipe=
s-core/systemd/systemd_git.bb
> index bdaaf16..1d71bb6 100644
> --- a/meta-oe/recipes-core/systemd/systemd_git.bb
> +++ b/meta-oe/recipes-core/systemd/systemd_git.bb
> @@ -14,7 +14,7 @@ inherit gitpkgv
>  PKGV =3D "v${GITPKGVTAG}"
> =20
>  PV =3D "git"
> -PR =3D "r7"
> +PR =3D "r8"
> =20
>  inherit useradd pkgconfig autotools vala perlnative
> =20
> @@ -57,11 +57,13 @@ do_install() {
>  	ln -s ${base_bindir}/systemd ${D}/init
>  }
> =20
> -PACKAGES =3D+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs"
> +PACKAGES =3D+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-anal=
yze"
> =20
>  USERADD_PACKAGES =3D "${PN}"
>  GROUPADD_PARAM_${PN} =3D "-r lock"
> =20
> +FILES_${PN}-analyze =3D "${bindir}/systemd-analyze"

according to your commit message, why not add
RDEPENDS_${PN}-analyze =3D "python"
here?

and maybe
RSUGGESTS_${PN} +=3D "${PN}-analyze"

> +
>  FILES_${PN}-initramfs =3D "/init"
>  RDEPENDS_${PN}-initramfs =3D "${PN}"
> =20
> --=20
> 1.7.8.2
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--+QahgC5+KEYLbs62
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk8K63AACgkQN1Ujt2V2gBxZegCgp9Bf+xF0mAFKHaAhejV9BDj+
C2cAnjPS9opTTOo1dSZr4Dr0tiF88Maa
=3QSV
-----END PGP SIGNATURE-----

--+QahgC5+KEYLbs62--
