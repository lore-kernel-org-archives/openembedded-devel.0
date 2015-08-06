Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 96EDD734DA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Aug 2015 15:12:27 +0000 (UTC)
Received: from svr-orw-fem-06.mgc.mentorg.com ([147.34.97.120])
	by relay1.mentorg.com with esmtp 
	id 1ZNMqJ-0007F6-V2 from Joe_MacDonald@mentor.com ;
	Thu, 06 Aug 2015 08:12:27 -0700
Received: from burninator (147.34.91.1) by SVR-ORW-FEM-06.mgc.mentorg.com
	(147.34.97.120) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 6 Aug 2015 08:12:27 -0700
Received: by burninator (Postfix, from userid 1000)	id 01553582BA5; Thu,  6
	Aug 2015 11:11:51 -0400 (EDT)
Date: Thu, 6 Aug 2015 11:11:51 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Li xin <lixin.fnst@cn.fujitsu.com>
Message-ID: <20150806151147.GB12457@mentor.com>
References: <1437988719-2641-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1437988719-2641-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH 1/3] netcf: upgrade 0.2.3 -> 0.2.8
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Aug 2015 15:12:30 -0000
X-Groupsio-MsgNum: 56575
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jq0ap7NbKX2Kqbes"
Content-Disposition: inline

--jq0ap7NbKX2Kqbes
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[[oe] [meta-networking][PATCH 1/3] netcf: upgrade 0.2.3 -> 0.2.8] On 15.07.=
27 (Mon 17:18) Li xin wrote:

> Add "--with-sysinit=3Dsystemd" to support for systemd init script.
>=20
> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ---
>  meta-networking/recipes-support/netcf/netcf_git.bb | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta-networking/recipes-support/netcf/netcf_git.bb b/meta-ne=
tworking/recipes-support/netcf/netcf_git.bb
> index 0e88b30..1a571b3 100644
> --- a/meta-networking/recipes-support/netcf/netcf_git.bb
> +++ b/meta-networking/recipes-support/netcf/netcf_git.bb
> @@ -6,8 +6,8 @@ LICENSE =3D "LGPLv2.1"
> =20
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbbb461211a33b134d42ed5ee802b3=
7ff"
> =20
> -SRCREV =3D "b8a19dc860b38c97c42115d8a559b78853452a4b"
> -PV =3D "0.2.3+git${SRCPV}"
> +SRCREV =3D "9158278ad35b46ce9a49b2e887483c6d8c287994"
> +PV =3D "0.2.8+git${SRCPV}"
> =20
>  SRC_URI =3D "git://git.fedorahosted.org/netcf.git;protocol=3Dgit \
>  "
> @@ -18,7 +18,7 @@ S =3D "${WORKDIR}/git"
> =20
>  inherit gettext autotools-brokensep pkgconfig
> =20
> -EXTRA_OECONF_append_class-target =3D " --with-driver=3Dredhat"
> +EXTRA_OECONF_append_class-target =3D " --with-driver=3Dredhat --with-sys=
init=3Dsystemd"

Does this bring in a hard dependency on systemd?

-J.

>  do_configure_prepend() {
>  	cd ${S}
>  	rm -f .gitmodules
> @@ -26,6 +26,9 @@ do_configure_prepend() {
>  }
> =20
>  do_install_append() {
> -     mv ${D}${sysconfdir}/rc.d/init.d/ ${D}${sysconfdir}
> -     rm -rf ${D}${sysconfdir}/rc.d/
> +    install -d ${D}${systemd_unitdir}/system
> +    mv ${D}${libdir}/systemd/system/ ${D}${systemd_unitdir}/system
> +    rm -rf ${D}${libdir}/systemd/
>  }
> +
> +FILES_${PN} +=3D "${systemd_unitdir}"
> --=20
> 1.8.4.2
>=20
--=20
-Joe MacDonald.
:wq

--jq0ap7NbKX2Kqbes
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJVw3kzAAoJEEn8ffcsOfaWRZEH/1J74A1YsH75j8gWIRnFggNZ
hvD1TrpFMFfFoaJbhLEDzfSCic1ZFP56zWAmqU0+uSeSuBLt9pp0Sw9cd1ji5Dri
udyay0DYcZrF3WqY1I/xdGXJKCAb16sJCKQm6wcha7NWwbXImKouITqX6gL4de7B
aJQRmJtFfEwesDK8mP5wOehbmeAxSfreW3mjAJ867GDQswAG9LEhnLoouaZOk3Ec
foUCDyuFnqt/XuDH/QOLmzOqKa/j+X08VI016cfN6n4llaBpzh/dXtCVWKwvFquL
JMmbqMz4uCLo/dH2VMs+7zNcvOfs8F2GAb9Qzr2azVn6ZAw+heEw4MNhFBtjyDE=
=4M21
-----END PGP SIGNATURE-----

--jq0ap7NbKX2Kqbes--
