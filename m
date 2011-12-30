Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Rgc6A-00077w-Hh
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Dec 2011 14:02:14 +0100
Received: by eeit10 with SMTP id t10so8666138eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Dec 2011 04:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=dvLcLdOUI7rfH9uPhksSlV3hTrxMTkPfRE8SVB7aHKg=;
	b=LmJf3DHLOPLqVLVT9ycDybei68pT96GRrfCfpBlVCBXbCqCE41GEeuOS3xJ0j+VzQa
	906EaCDYu7BIpg0aPtHn+2kgXAWq7muiHQgMa0qs+acktYTDykP+b1z/zcpWlKHfmsGa
	Hva3bHNc2cKsiXzjaEklZ0U/TjKxiKpwsbwE8=
Received: by 10.213.19.137 with SMTP id a9mr8148530ebb.51.1325249699136;
	Fri, 30 Dec 2011 04:54:59 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b49sm116338121eec.9.2011.12.30.04.54.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Dec 2011 04:54:58 -0800 (PST)
Date: Fri, 30 Dec 2011 13:54:46 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111230125446.GG16885@jama.jama.net>
References: <cover.1325248824.git.otavio@ossystems.com.br>
	<2eaa23a3419bfd9b5aea6c1f059242a38eb03608.1325248824.git.otavio@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <2eaa23a3419bfd9b5aea6c1f059242a38eb03608.1325248824.git.otavio@ossystems.com.br>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH 1/3] xserver-nodm-init: move systemd service to xserver-nodm-init-systemd
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
X-List-Received-Date: Fri, 30 Dec 2011 13:02:14 -0000
X-Groupsio-MsgNum: 36313
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mYYhpFXgKVw71fwr"
Content-Disposition: inline

--mYYhpFXgKVw71fwr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 30, 2011 at 12:40:54PM +0000, Otavio Salvador wrote:
> Move systemd service to xserver-nodm-init-systemd to be consistent
> with other packages.
>=20
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  .../xserver-nodm-init/xserver-nodm-init_2.0.bb     |   30 +++++++++-----=
-----
>  1 files changed, 14 insertions(+), 16 deletions(-)
>=20
> diff --git a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init=
_2.0.bb b/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.=
bb
> index 496b342..4d4ae4c 100644
> --- a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb
> +++ b/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb
> @@ -3,7 +3,7 @@ LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882=
bbe"
>  SECTION =3D "x11"
> =20
> -PR =3D "r11"
> +PR =3D "r12"
> =20
>  SRC_URI =3D "file://xserver-nodm \
>             file://xserver-nodm.service \
> @@ -13,6 +13,15 @@ S =3D ${WORKDIR}
> =20
>  inherit allarch
> =20
> +inherit update-rc.d systemd
> +
> +INITSCRIPT_NAME =3D "xserver-nodm"
> +INITSCRIPT_PARAMS =3D "start 01 5 2 . stop 01 0 1 6 ."
> +INITSCRIPT_PARAMS_shr =3D "start 90 5 2 . stop 90 0 1 6 ."
> +
> +SYSTEMD_PACKAGES =3D "${PN}-systemd"
> +SYSTEMD_SERVICE_${PN}-systemd =3D "xserver-nodm.service"
> +
>  do_install() {
>  	install -d ${D}${sysconfdir}/init.d
>  	install xserver-nodm ${D}${sysconfdir}/init.d
> @@ -21,20 +30,9 @@ do_install() {
>  	install -m 0644 xserver-nodm.service ${D}${base_libdir}/systemd/system/
>  }
> =20
> -RDEPENDS_${PN} =3D "xserver-common (>=3D 1.30) xinit"
> -FILES_${PN} +=3D "${base_libdir}/systemd/system/"
> -
> -inherit update-rc.d
> +PACKAGES +=3D "${PN}-systemd"
> =20
> -INITSCRIPT_NAME =3D "xserver-nodm"
> -INITSCRIPT_PARAMS =3D "start 01 5 2 . stop 01 0 1 6 ."
> -INITSCRIPT_PARAMS_shr =3D "start 90 5 2 . stop 90 0 1 6 ."
> -
> -pkg_postinst_${PN}_append () {
> -    if [ -e ${base_bindir}/systemctl ] ; then
> -        # can't do this offline
> -        [ "x$D" !=3D "x" ] && exit 1
> +RDEPENDS_${PN} =3D "xserver-common (>=3D 1.30) xinit"
> =20
> -        systemctl enable xserver-nodm.service
> -    fi
> -}
> +FILES_${PN}-systemd +=3D "${base_libdir}/systemd/system/"
> +RDEPENDS_${PN}-systemd =3D "xserver-common (>=3D 1.30) xinit"

I haven't tried but isn't this ^ overwritting systemd runtime dependency
set by systemd.bbclass? +=3D would be probably bette if it's the case.

Regards,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--mYYhpFXgKVw71fwr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk79tJYACgkQN1Ujt2V2gByQtgCfeTSw3DaPLEYwtIHq7E2f5V50
LbgAoJimKD7FMlG+LHXjlC0PFS/fDtQW
=XNDt
-----END PGP SIGNATURE-----

--mYYhpFXgKVw71fwr--
