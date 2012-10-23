Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TQfHV-00015X-D7
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Oct 2012 16:16:33 +0200
Received: by mail-wi0-f171.google.com with SMTP id hj13so3222188wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Oct 2012 07:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=rlCerVXhX4IE+6UDROaEwumQlqu6xCnfNu8dV+jdlC4=;
	b=VyLYjuDjRzrutKtGGLIc7L+t8KPcawLBNM1nmaParGlSjgXV/6lSBKpThha0qjL+Sp
	3OsnE7ppHsPWsX4ve3BHH48vIY0AXfBLpmD98KY/kfa7E/rgcaT0Re7BwjUY8TIWdYsU
	ta1BUbN+oXmVRJr7fxcYWaf/Z+sbFf1hksqMPfRGYUPw0sXsDW99U5KVjs7o6HdcbnBT
	lAOn6P/H/ErushLbQ3VT51/KvRYb63ffbwIBE07Ky0qtmEdaQJwjYwWv/7SkltGYbqcn
	tlpVdfZTy3aYFVLLU9p0oCbVQj1NialVyVROv1OFNClxmIEjI0HNAi79bZfnoE+rzog7
	o1iA==
Received: by 10.180.80.33 with SMTP id o1mr29492778wix.14.1351000987497;
	Tue, 23 Oct 2012 07:03:07 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ay10sm28086477wib.2.2012.10.23.07.03.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 23 Oct 2012 07:03:06 -0700 (PDT)
Date: Tue, 23 Oct 2012 16:03:23 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121023140323.GP3269@jama.jama.net>
References: <1351000651-16335-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1351000651-16335-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe, meta-systemd][PATCH] systemd: inherit pythonnative
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
X-List-Received-Date: Tue, 23 Oct 2012 14:16:33 -0000
X-Groupsio-MsgNum: 41233
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="U+NfgObvpQT1Q9Yq"
Content-Disposition: inline

--U+NfgObvpQT1Q9Yq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 23, 2012 at 03:57:31PM +0200, Martin Jansa wrote:
> * otherwise configure uses python-config from host and passes wrong CFLAGS
>   see http://lists.linuxtogo.org/pipermail/openembedded-devel/2012-Octobe=
r/042058.html
>   for details
>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-systemd/recipes-core/systemd/systemd_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-systemd/recipes-core/systemd/systemd_git.bb b/meta-syst=
emd/recipes-core/systemd/systemd_git.bb
> index efc2d95..b89bd76 100644
> --- a/meta-systemd/recipes-core/systemd/systemd_git.bb
> +++ b/meta-systemd/recipes-core/systemd/systemd_git.bb
> @@ -19,9 +19,9 @@ inherit gitpkgv
>  PKGV =3D "v${GITPKGVTAG}"
> =20
>  PV =3D "git"
> -PR =3D "r8"
> +PR =3D "r9"
> =20
> -inherit useradd pkgconfig autotools perlnative
> +inherit useradd pkgconfig autotools perlnative pythonnative

Ah, ignore this one.. python-config from native is not right one to use
too. It fails a bit later when looking for Python.h..=20

Anyone against disabling python in systemd?
AC_ARG_WITH([python],
        [AS_HELP_STRING([--without-python], [Disable building the man
page index and systemd-python (default: test)])])

Cheers,

> =20
>  SRCREV =3D "4d92e078e9d7e9a9d346065ea5e4afbafbdadb48"
>  SRC_URI =3D "git://anongit.freedesktop.org/systemd/systemd;protocol=3Dgi=
t \
> --=20
> 1.7.12.4
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--U+NfgObvpQT1Q9Yq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCGo6sACgkQN1Ujt2V2gBxwSQCfZzo6eDKvWW49cllO3lt1iAVn
Q8wAn2RGwawO6H7KDsR4xebclMYjk9fR
=4hxC
-----END PGP SIGNATURE-----

--U+NfgObvpQT1Q9Yq--
