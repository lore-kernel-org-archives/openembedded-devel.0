Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id D8A287260D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Dec 2014 21:10:36 +0000 (UTC)
Received: from svr-orw-fem-02x.mgc.mentorg.com ([147.34.96.206]
	helo=SVR-ORW-FEM-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1Y0zO9-0006AD-6Z from Joe_MacDonald@mentor.com ;
	Tue, 16 Dec 2014 13:10:37 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.3.181.6;
	Tue, 16 Dec 2014 13:10:36 -0800
Received: by burninator (Postfix, from userid 1000)	id 1165A581DE4; Tue, 16
	Dec 2014 16:10:36 -0500 (EST)
Date: Tue, 16 Dec 2014 16:10:36 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Li xin <lixin.fnst@cn.fujitsu.com>
Message-ID: <20141216211035.GO6113@mentor.com>
References: <20141202210216.GG12784@mentor.com>
	<1417586849-4678-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1417586849-4678-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH v2] ncftp : add new recipe
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
X-List-Received-Date: Tue, 16 Dec 2014 21:10:40 -0000
X-Groupsio-MsgNum: 53346
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CbqR2XcyIs6OSP+I"
Content-Disposition: inline

--CbqR2XcyIs6OSP+I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[[oe] [meta-networking][PATCH v2] ncftp : add new recipe] On 14.12.03 (Wed =
14:07) Li xin wrote:

> ncftp is a sophisticated console ftp client.
>=20
> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>

I merged this by cherry-picking Martin's version in master-next then
removed PRIORITY, fixed the spacing and made the variable ordering more
consistent with other recipes, FYI.

-J.

> ---
>  .../recipes-daemons/ncftp/ncftp_3.2.5.bb           | 24 ++++++++++++++++=
++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 meta-networking/recipes-daemons/ncftp/ncftp_3.2.5.bb
>=20
> diff --git a/meta-networking/recipes-daemons/ncftp/ncftp_3.2.5.bb b/meta-=
networking/recipes-daemons/ncftp/ncftp_3.2.5.bb
> new file mode 100644
> index 0000000..fb9eb94
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/ncftp/ncftp_3.2.5.bb
> @@ -0,0 +1,24 @@
> +DESCRIPTION =3D "A sophisticated console ftp client"
> +HOMEPAGE =3D "http://ncftp.com/"
> +SECTION =3D "console/network"
> +PRIORITY =3D "optional"
> +LICENSE =3D "ClArtistic"
> +LIC_FILES_CHKSUM =3D "file://ncftp/cmds.c;beginline=3D3;endline=3D4;md5=
=3D9de76faeaedc4f908082e3f8142715f4"
> +
> +SRC_URI =3D "${DEBIAN_MIRROR}/main/n/${PN}/${PN}_${PV}.orig.tar.gz"
> +SRC_URI[md5sum] =3D "685e45f60ac11c89442c572c28af4228"
> +SRC_URI[sha256sum] =3D "ac111b71112382853b2835c42ebe7bd59acb7f85dd00d44b=
2c19fbd074a436c4"
> +
> +inherit autotools-brokensep pkgconfig
> +
> +DEPENDS =3D "ncurses"
> +
> +do_configure() {
> +   oe_runconf
> +}
> +do_install () {
> +    install -d ${D}${bindir} ${D}${sysconfdir} ${D}${mandir}
> +    oe_runmake 'prefix=3D${D}${prefix}' 'BINDIR=3D${D}${bindir}' \
> +        'SYSCONFDIR=3D${D}${sysconfdir}' 'mandir=3D${D}${mandir}' \
> +        install
> +}
> --=20
> 1.8.4.2
>=20
--=20
-Joe MacDonald.
:wq

--CbqR2XcyIs6OSP+I
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJUkJ/LAAoJEEn8ffcsOfaWhEIH/1qzMZUfffMvSwOCeY3W78hI
yK64s0H9ph+1OPmleHm4HxjU2pthX4eyktoZnOqfH0Ssx+wlHyF6a1vtYtnzF/YU
cfvTqPy4I4Z9B8bzRjqdMx4/wpswb76ApeRrjo9frtwrtwZBcwZd0XTqlvDgoslp
6h+Wvs3U9YaZjBdZHv/U8LWFHTfhf8alFF7pmhPL8tGJJ38DTHjz381qo4KbAJSd
qpKSbr476YDie/LFAHHorH/a8w9cW0N4+A9yZ2jAE7bHxQNNx0cxESyeF727m18I
Jx3Qi2cU9Zsm3gLrdIV+g65xSvZrz5n0rgUH1yk1xT1SocMSzti6YxBhpWGwpGo=
=5t9m
-----END PGP SIGNATURE-----

--CbqR2XcyIs6OSP+I--
