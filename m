Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id B39A8601F5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Oct 2014 18:27:09 +0000 (UTC)
Received: from svr-orw-fem-02x.mgc.mentorg.com ([147.34.96.206]
	helo=SVR-ORW-FEM-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1Xge9G-0001tX-F2 from Joe_MacDonald@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Oct 2014 11:27:10 -0700
Received: from burninator (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.3.181.6;
	Tue, 21 Oct 2014 11:27:08 -0700
Received: by burninator (Postfix, from userid 1000)	id 55F1C58103D; Tue, 21
	Oct 2014 14:27:08 -0400 (EDT)
Date: Tue, 21 Oct 2014 14:27:08 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20141021182708.GB18243@mentor.com>
References: <1413441073-2727-1-git-send-email-Chong.Lu@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1413441073-2727-1-git-send-email-Chong.Lu@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking][PATCH] quagga: remove watchquagga when start with systemd
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
X-List-Received-Date: Tue, 21 Oct 2014 18:27:14 -0000
X-Groupsio-MsgNum: 52581
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Bn2rw/3z4jIqBvZU"
Content-Disposition: inline

--Bn2rw/3z4jIqBvZU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.
-J.

[[oe] [meta-networking][PATCH] quagga: remove watchquagga when start with s=
ystemd] On 14.10.16 (Thu 14:31) Chong Lu wrote:

> When we start with sysvinit, watchquagga uses quagga init script to
> monitor zebra daemon. But we need not do this in systemd environment.
>=20
> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> ---
>  .../recipes-protocols/quagga/quagga.inc            |    5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-networking/recipes-protocols/quagga/quagga.inc b/meta-n=
etworking/recipes-protocols/quagga/quagga.inc
> index 9bdd4d5..2c0817b 100644
> --- a/meta-networking/recipes-protocols/quagga/quagga.inc
> +++ b/meta-networking/recipes-protocols/quagga/quagga.inc
> @@ -62,7 +62,7 @@ EXTRA_OECONF =3D "--sysconfdir=3D${sysconfdir}/quagga \
>                  --enable-exampledir=3D${docdir}/quagga/examples/ \
>                  --enable-vtysh \
>                  --enable-isisd \
> -                --enable-watchquagga \
> +                ${@base_contains('DISTRO_FEATURES', 'sysvinit', '--enabl=
e-watchquagga', '--disable-watchquagga', d)} \
>                  --enable-ospf-te \
>                  --enable-opaque-lsa \
>                  --enable-ipv6 \
> @@ -135,6 +135,7 @@ do_install () {
>      # Remove sysinit script if sysvinit is not in DISTRO_FEATURES
>      if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'false', 'tru=
e', d)}; then
>          rm -rf ${D}${sysconfdir}/init.d/
> +        rm -f ${D}${sysconfdir}/default/watchquagga
>      fi
> =20
>      install -d ${D}${systemd_unitdir}/system
> @@ -160,7 +161,7 @@ pkg_postinst_${PN} () {
>  # Split into a main package and separate per-protocol packages
>  PACKAGE_BEFORE_PN =3D "${PN}-ospfd ${PN}-ospf6d ${PN}-babeld ${PN}-bgpd \
>                       ${PN}-ripd ${PN}-ripngd ${PN}-isisd \
> -                     ${PN}-ospfclient ${PN}-watchquagga"
> +                     ${PN}-ospfclient ${@base_contains('DISTRO_FEATURES'=
, 'sysvinit', '${PN}-watchquagga', '', d)}"
> =20
>  RDEPENDS_${PN} +=3D "${PN}-babeld ${PN}-bgpd ${PN}-isisd ${PN}-ospf6d ${=
PN}-ospfd ${PN}-ripd ${PN}-ripngd"
> =20
> --=20
> 1.7.9.5
>=20
--=20
-Joe MacDonald.
:wq

--Bn2rw/3z4jIqBvZU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJURqV8AAoJEEn8ffcsOfaW+NAH/itvOFh+Pwo7DOoCJZ5JlGy8
wjSyP93zHgdmMQXetDrfdK/cbNSSrEgNZY4ywAhUiSdVRlrmoA5dR4h5t2940Z+d
aRiw8GuISKd96Bk2gxX/O/3+Qjr2nfaK1yYShs5h/wykRSTjeDhkO72DZQoka+73
1Y0hJrvNBY5iwqu2WgMAYGJ7mDbxF+c+gZcJwKz5jcoL7Dr7ZcVn0maHdJvnzfTg
FCXFZPWdx58RzZZBpCi6Iq7ElKmWIbgV8kk7JrBkDpeEcDmu5PiOF2mbVh73Zp1r
+rxlqVYpGm1qUzGNjqA2f8j1cA/eZNgEd5l41SJwNbIcn7w+PkYb0vL1YPLuqAw=
=lv95
-----END PGP SIGNATURE-----

--Bn2rw/3z4jIqBvZU--
