Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 5D9DD6087D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Jul 2014 16:17:14 +0000 (UTC)
Received: by mail-wi0-f181.google.com with SMTP id n3so8116311wiv.14
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Jul 2014 09:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=nD3B8wlVLCkiFdYjXJPdxHDf5Ba46aMiF/HylBS5FGw=;
	b=amFYDqViga0sJJN9LiRqPkLzCwSlLjSLoNRhCw9XKJknlkeuSv8iwrKsqxcgTp86/x
	sxWT8cGZp6zJSRdTl9DJVQ92Aj52n1yEk5u2aRBWz3eYu1H4M0Gc3EXBulrzKY+4lPjK
	R4wAJzZDQfGqW33bZbMzyVgaxB9cuFMb96hC795++94STZeF4VgQhfg1eGk7mjOkU3Pt
	aK2ooB677JhNTilqrccPW2LBYGYE66hZZ1ppoxXqowLaEk9PAvB8g2CNauVktf1X+FqJ
	iHpLOMuh78UfI5yy2v83QvibZ408YHHiRQ+KHKRvsR2Dp8VHu6lWv0kc6MOl2xjiduOq
	d+VQ==
X-Received: by 10.180.12.137 with SMTP id y9mr37160589wib.46.1404231435958;
	Tue, 01 Jul 2014 09:17:15 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	i4sm44820390wib.21.2014.07.01.09.17.14
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Jul 2014 09:17:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 1 Jul 2014 18:17:24 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140701161724.GJ2437@jama>
References: <1404158675-20358-1-git-send-email-neena.busireddy@freescale.com>
	<1404158675-20358-3-git-send-email-neena.busireddy@freescale.com>
MIME-Version: 1.0
In-Reply-To: <1404158675-20358-3-git-send-email-neena.busireddy@freescale.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH 2/8] qtsmarthome: Create recipe to demonstrate qt5 example.
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
X-List-Received-Date: Tue, 01 Jul 2014 16:17:15 -0000
X-Groupsio-MsgNum: 50649
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6AFz5yWxU/FsGPwt"
Content-Disposition: inline

--6AFz5yWxU/FsGPwt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2014 at 03:04:29PM -0500, Neena Busireddy wrote:
> This is the Smarthome QML demo application showing interface
> to control an automated house.
>=20
> This recipe originated from the wandboard wiki page
> http://wiki.wandboard.org/index.php/Integrate_Qt5_into_yocto_sato_image_o=
n_Wandboard
>=20
> Signed-off-by: Neena Busireddy <neena.busireddy@freescale.com>
> ---
>  recipes-qt/examples/qtsmarthome_1.0.bb |   29 ++++++++++++++++++++++++++=
+++
>  1 file changed, 29 insertions(+)
>  create mode 100644 recipes-qt/examples/qtsmarthome_1.0.bb
>=20
> diff --git a/recipes-qt/examples/qtsmarthome_1.0.bb b/recipes-qt/examples=
/qtsmarthome_1.0.bb
> new file mode 100644
> index 0000000..f213f03
> --- /dev/null
> +++ b/recipes-qt/examples/qtsmarthome_1.0.bb
> @@ -0,0 +1,29 @@
> +SUMMARY =3D "Qt5 smarthome QML demo application"
> +DESCRIPTION =3D "This is the Smarthome QML demo application. It shows so=
me user interfaces=20
> +for controlling an automated house"

Also incorrectly wrapped (I'll fix it before cherry-picking to
master-next - no need to send v2).

> +HOMEPAGE =3D "http://www.basyskom.com/news/143-demos-qt5-port.html"
> +LICENSE =3D "LGPLv2.1+ & GFDL-1.2"
> +LIC_FILES_CHKSUM =3D "file://COPYING.DOC;md5=3Dad1419ecc56e060eccf8184a8=
7c4285f \
> +                    file://COPYING.LIB;md5=3D2d5025d4aa3495befef8f17206a=
5b0a1"
> +
> +DEPENDS =3D "qtdeclarative qtgraphicaleffects"
> +
> +SRC_URI =3D "http://share.basyskom.com/demos/smarthome_src.tar.gz"
> +SRC_URI[md5sum] =3D "883b0376239baec20ebec072e938a995"
> +SRC_URI[sha256sum] =3D "fceaa813c33e462bad6c0383eaef81a6f6e586c15d1fa738=
98173b517fc1cda6"
> +
> +S =3D "${WORKDIR}/smarthome_src"
> +
> +require recipes-qt/qt5/qt5.inc
> +
> +do_install() {
> +    install -d ${D}${datadir}/${P}
> +    install -m 0755 ${B}/smarthome ${D}${datadir}/${P}  =20
> +    cp -a ${S}/qml ${D}${datadir}/${P} =20
> +    cp -a ${S}/components ${D}${datadir}/${P} =20
> +}
> +
> +FILES_${PN}-dbg +=3D "${datadir}/${P}/.debug"
> +FILES_${PN} +=3D "${datadir}"
> +
> +RDEPENDS_${PN} =3D "qtdeclarative-qmlplugins qtgraphicaleffects-qmlplugi=
ns"
> --=20
> 1.7.9.5
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--6AFz5yWxU/FsGPwt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlOy3xQACgkQN1Ujt2V2gBwkOwCfTLBjc0aNLlZLeyD6e0z1Fh4B
kMkAn1nQebUnSMkNkmvabG1lI8lnJFrG
=AWno
-----END PGP SIGNATURE-----

--6AFz5yWxU/FsGPwt--
