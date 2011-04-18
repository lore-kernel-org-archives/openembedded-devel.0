Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QBwFC-0002wd-Uw
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Apr 2011 23:44:31 +0200
Received: by fxm19 with SMTP id 19so3413026fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Apr 2011 14:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=NN/5Z4dyLczkpK9u8DT9gCLaXt4BN9eYPcwjAvBrWg4=;
	b=K24RMpv1hgW5IWTbeN2bxKsbH+STY0SC71SS8ooMLMvTIkMa8LsAtvd/wOx2vueg/F
	GSgwuCfO8Irh62Jx4qzdlAI2LCstDX9VhpmEJ+xhjzsaRfjZoXcduxDYIXNEJeuRIfJD
	hTB0I5dKmaBHxNeeRoUgMtxFpd9YNyQ/uoHtI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=pDaownAn6ZKAkLTm8bSbWPEk0WAmDWEbNYKyYiMN0gDGMmOYeawCd7FWomwK3sO3Au
	BClx+0yDoBtt+BYfxkP4ezwbZEqmdY/ZEp9R5IX3JiNKelz6Ca53Q3hyuojjGywAqQfl
	14YlZc6+IDa1ISnAzJv3W/H464b7TAuIffd/U=
Received: by 10.223.14.22 with SMTP id e22mr15445faa.64.1303162929510;
	Mon, 18 Apr 2011 14:42:09 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id n9sm1704286fax.27.2011.04.18.14.42.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Apr 2011 14:42:08 -0700 (PDT)
Date: Mon, 18 Apr 2011 23:42:02 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110418214202.GI24192@jama.jama.net>
References: <E1QBw2Q-0002Mz-6J@melo.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <E1QBw2Q-0002Mz-6J@melo.openembedded.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@openembedded.org
Subject: Re: [oe-commits] Kumar Gala : kexec-tools: Add a git recipe
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
X-List-Received-Date: Mon, 18 Apr 2011 21:44:31 -0000
X-Groupsio-MsgNum: 31298
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="L+ofChggJdETEG3Y"
Content-Disposition: inline

--L+ofChggJdETEG3Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 18, 2011 at 09:31:18PM +0000, git version control wrote:
> Module: openembedded.git
> Branch: master
> Commit: ace025266169c8fbeac35fc6eb4ac67768f13df3
> URL:    http://gitweb.openembedded.net/?p=3Dopenembedded.git&a=3Dcommit;h=
=3Dace025266169c8fbeac35fc6eb4ac67768f13df3
>=20
> Author: Kumar Gala <kumar.gala@freescale.com>
> Date:   Mon Apr 18 12:48:34 2011 -0500
>=20
> kexec-tools: Add a git recipe
>=20
> (Initially from Kumar, further updated by Tom)
> Add a recipe to build kexec-tools from git.  While we're at it, make a
> new kexec-tools.inc for the very common bits and use that all around as
> well as switch to INC_PR.
>=20
> Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
> Signed-off-by: Tom Rini <tom_rini@mentor.com>
>=20
> ---
>=20
>  recipes/kexec-tools/kexec-tools-dietlibc_2.0.2.bb |    2 +-
>  recipes/kexec-tools/kexec-tools-klibc_2.0.2.bb    |    2 +-
>  recipes/kexec-tools/kexec-tools.inc               |    9 +++++++++
>  recipes/kexec-tools/kexec-tools_2.0.2.bb          |    2 +-
>  recipes/kexec-tools/kexec-tools_2.0.2.inc         |    9 +--------
>  recipes/kexec-tools/kexec-tools_git.bb            |   11 +++++++++++
>  recipes/kexec-tools/kexec-tools_git.inc           |   10 ++++++++++
>  7 files changed, 34 insertions(+), 11 deletions(-)
>=20
> diff --git a/recipes/kexec-tools/kexec-tools-dietlibc_2.0.2.bb b/recipes/=
kexec-tools/kexec-tools-dietlibc_2.0.2.bb
> index 8a599c7..171ccdf 100644
> --- a/recipes/kexec-tools/kexec-tools-dietlibc_2.0.2.bb
> +++ b/recipes/kexec-tools/kexec-tools-dietlibc_2.0.2.bb
> @@ -1,7 +1,7 @@
>  # the binaries are statically linked against dietlibc
>  require kexec-tools_${PV}.inc
> =20
> -PR =3D "r0"
> +PR =3D "${INC_PR}.0"
>  inherit dietlibc
> =20
>  FILESPATHPKG =3D. "kexec-tools-${PV}:"
> diff --git a/recipes/kexec-tools/kexec-tools-klibc_2.0.2.bb b/recipes/kex=
ec-tools/kexec-tools-klibc_2.0.2.bb
> index e799309..f14f0e6 100644
> --- a/recipes/kexec-tools/kexec-tools-klibc_2.0.2.bb
> +++ b/recipes/kexec-tools/kexec-tools-klibc_2.0.2.bb
> @@ -1,7 +1,7 @@
>  # the binaries are statically linked against klibc
>  require kexec-tools_${PV}.inc
> =20
> -PR =3D "r3"
> +PR =3D "${INC_PR}.0"
>  inherit klibc
> =20
>  FILESPATHPKG =3D. "kexec-tools-${PV}:"
> diff --git a/recipes/kexec-tools/kexec-tools.inc b/recipes/kexec-tools/ke=
xec-tools.inc
> new file mode 100644
> index 0000000..e7c51bc
> --- /dev/null
> +++ b/recipes/kexec-tools/kexec-tools.inc
> @@ -0,0 +1,9 @@
> +DESCRIPTION =3D "Kexec is a fast reboot feature that lets you reboot to =
a new Linux kernel"
> +AUTHOR =3D "Eric Biederman"
> +HOMEPAGE =3D "http://www.xmission.com/~ebiederm/files/kexec/"
> +SECTION =3D "kernel/userland"
> +LICENSE =3D "GPL"
> +DEPENDS =3D "virtual/kernel zlib"
> +PR =3D "r4"

Where is INC_PR defined? I guess this should be INC_PR not PR..

> +
> +inherit autotools
> diff --git a/recipes/kexec-tools/kexec-tools_2.0.2.bb b/recipes/kexec-too=
ls/kexec-tools_2.0.2.bb
> index 28ab240..710ee93 100644
> --- a/recipes/kexec-tools/kexec-tools_2.0.2.bb
> +++ b/recipes/kexec-tools/kexec-tools_2.0.2.bb
> @@ -1,6 +1,6 @@
>  require kexec-tools_${PV}.inc
> =20
> -PR =3D "r1"
> +PR =3D "${INC_PR}.0"
> =20
>  EXTRA_OECONF =3D " --with-zlib=3Dyes"
>  export LDFLAGS =3D "-L${STAGING_LIBDIR}"
> diff --git a/recipes/kexec-tools/kexec-tools_2.0.2.inc b/recipes/kexec-to=
ols/kexec-tools_2.0.2.inc
> index 81fbe9b..0ba22e8 100644
> --- a/recipes/kexec-tools/kexec-tools_2.0.2.inc
> +++ b/recipes/kexec-tools/kexec-tools_2.0.2.inc
> @@ -1,11 +1,4 @@
> -DESCRIPTION =3D "Kexec is a fast reboot feature that lets you reboot to =
a new Linux kernel"
> -AUTHOR =3D "Eric Biederman"
> -HOMEPAGE =3D "http://www.xmission.com/~ebiederm/files/kexec/"
> -SECTION =3D "kernel/userland"
> -LICENSE =3D "GPL"
> -DEPENDS =3D "virtual/kernel zlib"
> -
> -inherit autotools
> +require kexec-tools.inc
> =20
>  SRC_URI =3D "http://kernel.org/pub/linux/utils/kernel/kexec/kexec-tools-=
${PV}.tar.gz"
> =20
> diff --git a/recipes/kexec-tools/kexec-tools_git.bb b/recipes/kexec-tools=
/kexec-tools_git.bb
> new file mode 100644
> index 0000000..69625ac
> --- /dev/null
> +++ b/recipes/kexec-tools/kexec-tools_git.bb
> @@ -0,0 +1,11 @@
> +require kexec-tools_git.inc
> +
> +PR =3D "${INC_PR}.0"
> +
> +EXTRA_OECONF =3D " --with-zlib=3Dyes"
> +export LDFLAGS =3D "-L${STAGING_LIBDIR}"
> +
> +PACKAGES =3D+ "kexec kdump"
> +
> +FILES_kexec =3D "${sbindir}/kexec"
> +FILES_kdump =3D "${sbindir}/kdump"
> diff --git a/recipes/kexec-tools/kexec-tools_git.inc b/recipes/kexec-tool=
s/kexec-tools_git.inc
> new file mode 100644
> index 0000000..511008c
> --- /dev/null
> +++ b/recipes/kexec-tools/kexec-tools_git.inc
> @@ -0,0 +1,10 @@
> +require kexec-tools.inc
> +
> +SRC_URI =3D "git://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools=
=2Egit"
> +SRCREV =3D "e3bb6ccd50e483d06bfeaca24c9107c31f1cf5d7"
> +
> +PV =3D "2.0.2+${PR}+gitr${SRCREV}"
> +
> +DEFAULT_PREFERENCE =3D "-1"
> +
> +S =3D "${WORKDIR}/git"
>=20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--L+ofChggJdETEG3Y
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk2ssCoACgkQN1Ujt2V2gBz2nwCffPWaj0xcNdtBL0CmAlLUu430
hxMAn0NnR2jM9Q9i8zfXGqQCa3TER79r
=LLvp
-----END PGP SIGNATURE-----

--L+ofChggJdETEG3Y--
