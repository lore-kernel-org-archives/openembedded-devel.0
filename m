Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S0rv5-0006GJ-70
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Feb 2012 10:58:31 +0100
Received: by eekd41 with SMTP id d41so1027389eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2012 01:50:08 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.94.66 as permitted sender) client-ip=10.14.94.66; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.94.66 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.94.66])
	by 10.14.94.66 with SMTP id m42mr990486eef.66.1330077008944 (num_hops =
	1); Fri, 24 Feb 2012 01:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=NVimFwt+//SvPTBPAwETec5CQZEKBqPF3v7hsPnUhr4=;
	b=rvl90T9OkeJEjFLhzZ69LE/H+a/dPXQ6kLgQCOm4rG03MYXtuBg6aPuPosD6mHMExA
	5Jkb6ov2ERgBXiq25OVCs8qgta+Gvrn/gzMKAsFZ2PIBQfJ+bCSx9fu6XDuNqKUZsFAr
	hpw67jZz4obdxOKzNzxkShYAz54lJX0BlzhDQ=
Received: by 10.14.94.66 with SMTP id m42mr752137eef.66.1330077008850;
	Fri, 24 Feb 2012 01:50:08 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id u11sm8990258eeb.1.2012.02.24.01.50.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 24 Feb 2012 01:50:07 -0800 (PST)
Date: Fri, 24 Feb 2012 10:50:05 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120224095005.GG3769@jama.jama.net>
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
X-List-Received-Date: Fri, 24 Feb 2012 09:58:31 -0000
X-Groupsio-MsgNum: 37431
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zgr1mbP1ee4HJQ5m"
Content-Disposition: inline

--zgr1mbP1ee4HJQ5m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 08, 2012 at 01:50:04PM +0100, Koen Kooi wrote:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>

I'm using this for some time in meta-oe-contrib/shr

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

--zgr1mbP1ee4HJQ5m
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9HXU0ACgkQN1Ujt2V2gBxG9gCffcmXKXh73RGok2YQJQESeMVm
hB4AoIBXy/OWS2/vA0sOsmEX1qVHjs7G
=xdXs
-----END PGP SIGNATURE-----

--zgr1mbP1ee4HJQ5m--
