Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>) id 1UA05G-0005uD-GI
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Feb 2013 16:35:25 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r1PFIkDK026366
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 25 Feb 2013 07:18:46 -0800 (PST)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Mon, 25 Feb 2013 07:18:46 -0800
Received: from yow-jmacdona-l1 (yow-jmacdona-d2.wrs.com [128.224.146.166])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id ED9237FE2;
	Mon, 25 Feb 2013 10:18:31 -0500 (EST)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id 889BB20D5C; Mon,
	25 Feb 2013 10:18:45 -0500 (EST)
Date: Mon, 25 Feb 2013 10:18:45 -0500
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20130225151845.GF4330@windriver.com>
References: <1361400195-4717-1-git-send-email-ftonello@cercacor.com>
MIME-Version: 1.0
In-Reply-To: <1361400195-4717-1-git-send-email-ftonello@cercacor.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "Felipe F. Tonello" <ftonello@cercacor.com>
Subject: Re: [meta-networking][PATCH] macchanger: added 1.5.0 recipe
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
X-List-Received-Date: Mon, 25 Feb 2013 15:35:30 -0000
X-Groupsio-MsgNum: 43298
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lHGcFxmlz1yfXmOs"
Content-Disposition: inline

--lHGcFxmlz1yfXmOs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.
-J.

[[oe] [meta-networking][PATCH] macchanger: added 1.5.0 recipe] On 13.02.20 =
(Wed 14:43) eu@felipetonello.com wrote:

> From: "Felipe F. Tonello" <ftonello@cercacor.com>
>=20
> This is a useful utility to manipulate the mac address of a device.
>=20
> Signed-off-by: Felipe F. Tonello <ftonello@cercacor.com>
> ---
>  .../recipes-support/macchanger/macchanger_1.5.0.bb |   25 ++++++++++++++=
++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 meta-networking/recipes-support/macchanger/macchanger=
_1.5.0.bb
>=20
> diff --git a/meta-networking/recipes-support/macchanger/macchanger_1.5.0.=
bb b/meta-networking/recipes-support/macchanger/macchanger_1.5.0.bb
> new file mode 100644
> index 0000000..0d78c34
> --- /dev/null
> +++ b/meta-networking/recipes-support/macchanger/macchanger_1.5.0.bb
> @@ -0,0 +1,25 @@
> +SUMMARY =3D "Tool to view/change network interface MAC addresses"
> +DESCRIPTION =3D "A GNU/Linux utility for viewing/manipulating the MAC ad=
dress of network interfaces."
> +HOMEPAGE =3D "http://www.alobbs.com/macchanger"
> +LICENSE  =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
> +
> +PR =3D "r0"
> +
> +SRC_URI  =3D "${GNU_MIRROR}/macchanger/${PN}-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] =3D "79b7cdaeca3d8ebafa764c4b0dd03ab7"
> +SRC_URI[sha256sum] =3D "d44bfa27cb29c5a718627cb3ef3aa42eb5130426545eb203=
1120826cd73fa8fe"
> +
> +FILES_${PN} =3D " \
> +  ${bindir}/${PN} \
> +  ${datadir}/${PN}/wireless.list \
> +  ${datadir}/${PN}/OUI.list \
> +"
> +
> +FILES_${PN}-doc =3D " \
> +  ${datadir}/info \
> +  ${datadir}/man \
> +"
> +
> +inherit autotools
> \ No newline at end of file
--=20
-Joe MacDonald.
:wq

--lHGcFxmlz1yfXmOs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlErgNUACgkQPN8S4W6ZZndS3ACdE3a1gW5QvYFduWiZJvd90S2a
AU4AnRlBWICrqZk/rYKzSB1rji/D4BGI
=izv+
-----END PGP SIGNATURE-----

--lHGcFxmlz1yfXmOs--
