Received: from mail-gh0-f180.google.com ([209.85.160.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UFoxp-0007ym-NN
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Mar 2013 17:55:53 +0100
Received: by mail-gh0-f180.google.com with SMTP id f13so210947ghb.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Mar 2013 09:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=aJeenK9rbHeaYn9zxuOZlTn+3MEkUjytGzpeYS5NQ9g=;
	b=jVLDZFJ5bs9jI0CQ6ZYbPOhAfUwgGwkzzT8aAJZl1EXcsY+O8baSHdoTIeOxNwAns2
	XOPaX7hQ/9b2S3Rb3BGbI0dVBfSoMMDAPjV+ibVm23G+Dqh8LSfHSagVgWjAGKifXQ4D
	AsuJklm74aweOSZk5RapiJJkP/VK/aelDEtYDSsybDp4hfZMcLm194Bw0VQIwDUyZgkH
	46O1RLacEJhhBcPM0MspupKe8ZNQSeydfUFeUW9ZcLSFPTf9WTw9TJ4mduJ1t3i4NHkp
	5dQP+GRhEkhamP0kgxQIxzkLt1C+PdnxwEWKhaJAYYFnSg4xQ9bcVgmTi84e6FsFZou4
	KLMQ==
X-Received: by 10.236.134.163 with SMTP id s23mr15952320yhi.54.1363192738668; 
	Wed, 13 Mar 2013 09:38:58 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id g69sm36315941yhh.17.2013.03.13.09.38.56
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 13 Mar 2013 09:38:57 -0700 (PDT)
Date: Wed, 13 Mar 2013 17:38:50 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130313163850.GW3260@jama>
References: <1362162226-24924-1-git-send-email-ftonello@cercacor.com>
MIME-Version: 1.0
In-Reply-To: <1362162226-24924-1-git-send-email-ftonello@cercacor.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "Felipe F. Tonello" <ftonello@cercacor.com>
Subject: Re: [meta-oe][PATCH] qextserialport: Added 1.2rc recipe
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
X-List-Received-Date: Wed, 13 Mar 2013 16:55:54 -0000
X-Groupsio-MsgNum: 43536
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DMefDzZywwCHZelG"
Content-Disposition: inline

--DMefDzZywwCHZelG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 01, 2013 at 10:23:46AM -0800, eu@felipetonello.com wrote:
> From: "Felipe F. Tonello" <ftonello@cercacor.com>
>=20
> QExtSerialPort is a serial port library for Qt4/5.

Applied, thanks!

>=20
> Signed-off-by: Felipe F. Tonello <ftonello@cercacor.com>
> ---
>  .../qextserialport/qextserialport_1.2rc.bb         |   55 ++++++++++++++=
++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 meta-oe/recipes-qt/qextserialport/qextserialport_1.2r=
c.bb
>=20
> diff --git a/meta-oe/recipes-qt/qextserialport/qextserialport_1.2rc.bb b/=
meta-oe/recipes-qt/qextserialport/qextserialport_1.2rc.bb
> new file mode 100644
> index 0000000..da65215
> --- /dev/null
> +++ b/meta-oe/recipes-qt/qextserialport/qextserialport_1.2rc.bb
> @@ -0,0 +1,55 @@
> +DESCRIPTION =3D "Qt Ext Serial Port Library"
> +HOMEPAGE =3D "http://http://code.google.com/p/qextserialport/"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db866a28cda707ec714878bd933f46=
251"
> +SECTION =3D "qt/libs"
> +
> +PR =3D "r0"
> +
> +# 1.2rc as version will sort lower then 1.2 when it's released
> +REAL_PV =3D "1.2rc"
> +PV =3D "1.1+${REAL_PV}"
> +
> +inherit qt4x11 pkgconfig
> +
> +DEPENDS =3D "udev"
> +
> +SRC_URI =3D " \
> +  http://qextserialport.googlecode.com/files/qextserialport-${REAL_PV}.z=
ip \
> +"
> +
> +SRC_URI[md5sum] =3D "ffa061edb9f64666468d18402eee6108"
> +SRC_URI[sha256sum] =3D "9cbee267aac9830f9944bb1d13872e51fba400aa9afe158e=
64f0fe265a0176bc"
> +
> +S =3D "${WORKDIR}/qextserialport-${REAL_PV}"
> +
> +FILES_${PN} =3D "${libdir}/libqextserialport${SOLIBS}"
> +
> +FILES_${PN}-dev =3D " \
> +  ${libdir}/libqextserialport${SOLIBSDEV} \
> +  ${libdir}/libqextserialport.prl \
> +  ${includedir}/QtExtSerialPort/*.h \
> +  ${datadir}/qt4/mkspecs/features/extserialport.prf \
> +"
> +
> +FILES_${PN}-dbg +=3D " \
> +  ${libdir}/.debug/libqextserialport.so* \
> +"
> +
> +do_configure_prepend() {
> +  # based on the documentation, this line make sure we use udev in linux
> +  cd ${S} && echo "linux*:CONFIG +=3D qesp_linux_udev" > .qmake.cache
> +
> +  # Hacking hardcoded qmake variables
> +  find *.pro -exec sed -i -e 's,$$\[QT_INSTALL_HEADERS\],${includedir},g=
' '{}' ';'
> +  find *.pro -exec sed -i -e 's,$$\[QT_INSTALL_LIBS\],${libdir},g' '{}' =
';'
> +  find *.pro -exec sed -i -e 's,$$\[QMAKE_MKSPECS\],${datadir}/qt4/mkspe=
cs/,g' '{}' ';'
> +}
> +
> +do_install() {
> +  export INSTALL_ROOT=3D${D}
> +  oe_runmake install
> +
> +  # This is necessary to make it work with the qt based SDK
> +  cd ${D}/${datadir}/qt4/mkspecs/features && sed -i -e "s|${STAGING_INCD=
IR_NATIVE}/qt4|\$(OE_QMAKE_INCDIR_QT)/..|" ./extserialport.prf
> +}
> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--DMefDzZywwCHZelG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFAq5oACgkQN1Ujt2V2gBwn6QCeM8aZNR0wPPzkAaW2nd6JiUcR
DOYAoJA7g+hpZViRBVXlt1Jr8Sn2h654
=ArGP
-----END PGP SIGNATURE-----

--DMefDzZywwCHZelG--
