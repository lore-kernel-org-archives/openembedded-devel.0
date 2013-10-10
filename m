Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f169.google.com (mail-ea0-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id 7B40D6CCB0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Oct 2013 10:44:43 +0000 (UTC)
Received: by mail-ea0-f169.google.com with SMTP id k11so1060370eaj.28
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Oct 2013 03:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=gWywvnS3QiOhjWFqtqlxoEk9kAxsazGNTumG7QhwAVk=;
	b=mIg8iL2lCb5OErNQGo+O/DzQPbphwEOpvUdsSEJnfYQvI5yAXrtu8wHimIYF0zpvgO
	LQzOx5P6VSlFNWMRDJObBJcPwgXmJ93IBxGGjjnrVlAo+geZ3ons2MVstmtQAZXYjNuz
	5lYA8VQaZMG9WlnFygGJnRZvEwbvW8c6KzjjjmNdQ9EtUW+tyMYuYEuU7kVq4GxAeEXZ
	nPDUyKp2Qvqif4MFML4U2MTXT/KPVlFezYgvdHtsctGE91JA7v8iSYAjKDy/6332fXAV
	mkLYyfJun3Z2tBAzBvyDw9HYNS6mXYzwmLDXpK/aGYMTO9vXb73bDrt/TeNU0EWVlV7B
	9Fhg==
X-Received: by 10.15.45.8 with SMTP id a8mr19643188eew.1.1381401884923;
	Thu, 10 Oct 2013 03:44:44 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	f49sm99998671eec.7.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 10 Oct 2013 03:44:44 -0700 (PDT)
Date: Thu, 10 Oct 2013 12:44:56 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131010104456.GI2872@jama>
References: <1381221981-1585-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
In-Reply-To: <1381221981-1585-1-git-send-email-eric@eukrea.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 01/21] cinematicexperience: add example
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
X-List-Received-Date: Thu, 10 Oct 2013 10:44:44 -0000
X-Groupsio-MsgNum: 46600
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kH8JNVvasRCCW1Oz"
Content-Disposition: inline

--kH8JNVvasRCCW1Oz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 08, 2013 at 10:46:01AM +0200, Eric B=E9nard wrote:
> for more informations on this demo :
> http://kgronholm.blogspot.fr/2012/08/qt5-cinematic-experience.html
> http://quitcoding.com/?page=3Dwork#cinex

All merged in master as well as dora, thanks!

>=20
> Signed-off-by: Eric B=E9nard <eric@eukrea.com>
> ---
>  recipes-qt/examples/cinematicexperience_1.0.bb | 40 ++++++++++++++++++++=
++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 recipes-qt/examples/cinematicexperience_1.0.bb
>=20
> diff --git a/recipes-qt/examples/cinematicexperience_1.0.bb b/recipes-qt/=
examples/cinematicexperience_1.0.bb
> new file mode 100644
> index 0000000..3fa6f06
> --- /dev/null
> +++ b/recipes-qt/examples/cinematicexperience_1.0.bb
> @@ -0,0 +1,40 @@
> +SUMMARY =3D "Qt5 technology demo"
> +DESCRIPTION =3D "Cinematic Experience collects many of the new Qt5 QtQui=
ck 2.0 features into the same UX demo application. It uses particles, sprit=
es, path animation, custom shaders etc. features which Qt5 introduces for Q=
ML UIs."
> +HOMEPAGE =3D "http://quitcoding.com/?page=3Dwork#cinex"
> +LICENSE =3D "CC-BY-3.0"
> +LIC_FILES_CHKSUM =3D "file://README;beginline=3D38;endline=3D50;md5=3D51=
babd597624b70752069953876aaa18"
> +
> +SRC_URI =3D "http://quitcoding.com/download/Qt5_CinematicExperience_rpi_=
1.0.tgz"
> +
> +SRC_URI[md5sum] =3D "935a5db0a6b2a72c67236e72f52be7d1"
> +SRC_URI[sha256sum] =3D "0dd602983ced5f7c0cfd5ad0fbfe2b0b7e3c9ff715e4ef23=
eef818ccc2b6c60b"
> +
> +S =3D "${WORKDIR}/Qt5_CinematicExperience_rpi_${PV}/"
> +
> +# other version available for small screens
> +#SRC_URI =3D "http://quitcoding.com/download/Qt5_CinematicExperience_1.0=
=2Etgz"
> +#SRC_URI[md5sum] =3D "1c4f9bf5411c985fc5d3dbfc5d826a29"
> +#SRC_URI[sha256sum] =3D "0e547e0259667915a24e84ade5efdcd0c553f8178673445=
2c2c8dbce19a19f44"
> +#S =3D "${WORKDIR}/Qt5_CinematicExperience_${PV}/"
> +
> +DEPENDS =3D "qtdeclarative qtgraphicaleffects"
> +RDEPENDS_${PN} =3D "qtdeclarative-qmlplugins qtgraphicaleffects-qmlplugi=
ns"
> +
> +require recipes-qt/qt5/qt5.inc
> +
> +do_install() {
> +    install -d ${D}${datadir}/${P}
> +    install -m 0755 ${B}/Qt5_CinematicExperience ${D}${datadir}/${P}
> +    cp -a ${S}/content ${D}${datadir}/${P}
> +    install -m 0644 ${S}/Qt5_CinematicExperience.qml ${D}${datadir}/${P}
> +
> +    install -d ${D}${bindir}
> +    echo "#!/bin/sh" > ${D}${bindir}/Qt5_CinematicExperience
> +    echo "export QML_IMPORT_PATH=3D${datadir}/${P}" >> ${D}${bindir}/Qt5=
_CinematicExperience
> +    echo "export QML2_IMPORT_PATH=3D${datadir}/${P}" >> ${D}${bindir}/Qt=
5_CinematicExperience
> +    echo "${datadir}/${P}/Qt5_CinematicExperiencea \$* " >> ${D}${bindir=
}/Qt5_CinematicExperience
> +    chmod +x ${D}${bindir}/Qt5_CinematicExperience
> +}
> +
> +FILES_${PN}-dbg +=3D "${datadir}/${P}/.debug"
> +FILES_${PN} +=3D "${datadir}"
> --=20
> 1.8.4.rc3
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--kH8JNVvasRCCW1Oz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlJWhSgACgkQN1Ujt2V2gBw5hACgl2e5M7btPPTvt3KGzpv9Nuje
E9UAoITKKRKI86yJ7hvXQ/uP2TAcoXx7
=MDxs
-----END PGP SIGNATURE-----

--kH8JNVvasRCCW1Oz--
