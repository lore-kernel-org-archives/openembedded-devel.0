Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RvWOw-0006kd-La
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Feb 2012 16:59:14 +0100
Received: by eekd41 with SMTP id d41so526777eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Feb 2012 07:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=kZfB3w7HvobDAe/0kLCHcNSgDr5FottkaoFpMj81l20=;
	b=D38GKFB9xgaoEBebQdtfTvnLHku5tZ12tyFg5lTrk2lfShdL5iCkr/K65nYlKjaAcQ
	uaEtc/V/hGoJKgEBV3XjTxF1ER6CeqYyOWtaX8B2ObG4DTtX6MXe5eJ+xJrqO5hiMRTL
	+ya01HaRn4EDh2pqpbLGelENknuqS0Ws3h+OM=
Received: by 10.14.127.195 with SMTP id d43mr788918eei.102.1328802669906;
	Thu, 09 Feb 2012 07:51:09 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id v51sm10989757eef.2.2012.02.09.07.51.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 09 Feb 2012 07:51:08 -0800 (PST)
Date: Thu, 9 Feb 2012 16:51:06 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120209155106.GB10322@jama.jama.net>
References: <1328705404-24406-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <1328705404-24406-1-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-oe] systemd: split out libraries from ${PN}
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
X-List-Received-Date: Thu, 09 Feb 2012 15:59:14 -0000
X-Groupsio-MsgNum: 37048
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="E39vaYmALEf/7YXx"
Content-Disposition: inline

--E39vaYmALEf/7YXx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 08, 2012 at 01:50:04PM +0100, Koen Kooi wrote:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

> ---
>  meta-oe/recipes-core/systemd/systemd_git.bb |   14 ++++++++++++--
>  1 files changed, 12 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-oe/recipes-core/systemd/systemd_git.bb b/meta-oe/recipe=
s-core/systemd/systemd_git.bb
> index c1a0117..4c458bd 100644
> --- a/meta-oe/recipes-core/systemd/systemd_git.bb
> +++ b/meta-oe/recipes-core/systemd/systemd_git.bb
> @@ -14,7 +14,7 @@ inherit gitpkgv
>  PKGV =3D "v${GITPKGVTAG}"
> =20
>  PV =3D "git"
> -PR =3D "r15"
> +PR =3D "r16"
> =20
>  inherit useradd pkgconfig autotools vala perlnative
> =20
> @@ -59,6 +59,11 @@ do_install() {
>  	ln -s ${base_bindir}/systemd ${D}/init
>  }
> =20
> +python populate_packages_prepend (){
> +	systemdlibdir =3D d.getVar("base_libdir", True)
> +	do_split_packages(d, systemdlibdir, '^lib(.*)\.so\.*', 'lib%s', 'System=
d %s library', extra_depends=3D'', allow_links=3DTrue)
> +}
> +
>  PACKAGES =3D+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-anal=
yze"
> =20
>  USERADD_PACKAGES =3D "${PN}"
> @@ -79,7 +84,7 @@ FILES_${PN}-vconsole-setup =3D "${base_libdir}/systemd/=
systemd-vconsole-setup \
> =20
>  RRECOMMENDS_$PN}-vconsole-setup =3D "kbd kbd-consolefonts"
> =20
> -FILES_${PN} +=3D " ${base_bindir}/* \
> +FILES_${PN} =3D " ${base_bindir}/* \
>                  ${datadir}/dbus-1/services \
>                  ${datadir}/dbus-1/system-services \
>                  ${datadir}/polkit-1 \
> @@ -93,6 +98,11 @@ FILES_${PN} +=3D " ${base_bindir}/* \
>                  ${bindir}/systemd* \
>                  ${libdir}/tmpfiles.d/*.conf \
>                  ${libdir}/systemd \
> +                ${libdir}/binfmt.d \
> +                ${libdir}/modules-load.d \
> +                ${libdir}/sysctl.d \
> +                ${localstatedir} \
> +                ${libexecdir} \
>                 "
> =20
>  FILES_${PN}-dbg +=3D "${base_libdir}/systemd/.debug ${base_libdir}/syste=
md/*/.debug ${base_libdir}/security/.debug/"
> --=20
> 1.7.2.5
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--E39vaYmALEf/7YXx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk8z62oACgkQN1Ujt2V2gBxrtwCfd+F9GuBgfKAFkMkIFyIicZN/
NHEAnRGf/MfFvVsi94lo/soBJmDkuHlu
=eQ7h
-----END PGP SIGNATURE-----

--E39vaYmALEf/7YXx--
