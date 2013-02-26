Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UAUKZ-00070N-7U
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Feb 2013 00:53:08 +0100
Received: by mail-pb0-f47.google.com with SMTP id rp2so2682148pbb.20
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Feb 2013 15:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=95KU0PTbpQN3fEKunh4Aedw+2kWaNKY4BVlQNlguSRw=;
	b=EHqwBW2gzhJiSmHJIN7kjb4kRNiQlzrJPCJUHDDGLBgvytl2Siwa9E17XkRiRk9h3o
	6qqXOfkBTIyVOc7tOo7h6y1+pNJttKyG1bmS9Pf6JOODwFgZNivj4ZqMgArqGGJt/S1f
	faMH2vz9LDz1tR9qdKPG9Q4gNzCYAJIF+Eo5mEB050i71CFRYc2FRQ+7xbRSCxicZHrF
	5qO+wCjp7Y6EGLr5AK9IH4TD+aJqJo7Kerjz93jQnSiiTtyIg5LAJpahBWLGKCUUFCdZ
	uMEzigxietb68Tsir01rvz/f1l6+qqddpNj+PxoSAFDjdlcamxMPkMZ6yjcEwnHIegN0
	WQPg==
X-Received: by 10.66.79.231 with SMTP id m7mr4336023pax.76.1361921806758;
	Tue, 26 Feb 2013 15:36:46 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id y9sm3007899paw.1.2013.02.26.15.36.43
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 26 Feb 2013 15:36:45 -0800 (PST)
Date: Wed, 27 Feb 2013 00:36:33 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130226233633.GA2975@jama.dyndns-home.com>
References: <1361389201-30878-1-git-send-email-ftonello@cercacor.com>
MIME-Version: 1.0
In-Reply-To: <1361389201-30878-1-git-send-email-ftonello@cercacor.com>
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
X-List-Received-Date: Tue, 26 Feb 2013 23:53:16 -0000
X-Groupsio-MsgNum: 43310
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/04w6evG8XlLl3ft"
Content-Disposition: inline

--/04w6evG8XlLl3ft
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 20, 2013 at 11:40:01AM -0800, eu@felipetonello.com wrote:
> From: "Felipe F. Tonello" <ftonello@cercacor.com>
>=20
> QExtSerialPort is a serial port library for Qt4/5.

1.2rc as version will sort lower then 1.2 when it's released, use something=
 like:
REAL_PV=3D"1.2rc"
PV =3D "1.1+${REAL_PV}"
to provide upgrade path when 1.2 is released and recipe is updated to use i=
t.

It also has a lot of QA warnings, it's better to use +=3D for FILES_, so th=
at
default values are preserved where possible.

qextserialport-1.2rc: qextserialport: Files/directories were installed but =
not shipped
  /usr/src
  /usr/src/debug
  /usr/src/debug/qextserialport
  /usr/src/debug/qextserialport/1.2rc-r0
  /usr/src/debug/qextserialport/1.2rc-r0/qextserialport-1.2rc
  /usr/src/debug/qextserialport/1.2rc-r0/qextserialport-1.2rc/moc_qextseria=
lport.cpp
  /usr/src/debug/qextserialport/1.2rc-r0/qextserialport-1.2rc/moc_qextseria=
lenumerator.cpp
  /usr/src/debug/qextserialport/1.2rc-r0/qextserialport-1.2rc/src
  /usr/src/debug/qextserialport/1.2rc-r0/qextserialport-1.2rc/src/qextseria=
lport_unix.cpp
  /usr/src/debug/qextserialport/1.2rc-r0/qextserialport-1.2rc/src/qextseria=
lport_p.h
  /usr/src/debug/qextserialport/1.2rc-r0/qextserialport-1.2rc/src/qextseria=
lport.h
  /usr/src/debug/qextserialport/1.2rc-r0/qextserialport-1.2rc/src/qextseria=
lport.cpp
  /usr/src/debug/qextserialport/1.2rc-r0/qextserialport-1.2rc/src/qextseria=
lenumerator_p.h
  /usr/src/debug/qextserialport/1.2rc-r0/qextserialport-1.2rc/src/qextseria=
lenumerator_linux.cpp
  /usr/src/debug/qextserialport/1.2rc-r0/qextserialport-1.2rc/src/qextseria=
lenumerator.h
  /usr/src/debug/qextserialport/1.2rc-r0/qextserialport-1.2rc/src/qextseria=
lenumerator.cpp

>=20
> Signed-off-by: Felipe F. Tonello <ftonello@cercacor.com>
> ---
>  .../qextserialport/qextserialport_1.2rc.bb         |   53 ++++++++++++++=
++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 meta-oe/recipes-qt/qextserialport/qextserialport_1.2r=
c.bb
>=20
> diff --git a/meta-oe/recipes-qt/qextserialport/qextserialport_1.2rc.bb b/=
meta-oe/recipes-qt/qextserialport/qextserialport_1.2rc.bb
> new file mode 100644
> index 0000000..da83404
> --- /dev/null
> +++ b/meta-oe/recipes-qt/qextserialport/qextserialport_1.2rc.bb
> @@ -0,0 +1,53 @@
> +DESCRIPTION =3D "Qt Ext Serial Port Library"
> +HOMEPAGE =3D "http://http://code.google.com/p/qextserialport/"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db866a28cda707ec714878bd933f46=
251"
> +SECTION =3D "qt/libs"
> +
> +PR =3D "r0"
> +
> +inherit qt4x11 pkgconfig
> +
> +DEPENDS =3D "udev"
> +
> +SRC_URI =3D " \
> +  http://qextserialport.googlecode.com/files/qextserialport-${PV}.zip \
> +"
> +
> +SRC_URI[md5sum] =3D "ffa061edb9f64666468d18402eee6108"
> +SRC_URI[sha256sum] =3D "9cbee267aac9830f9944bb1d13872e51fba400aa9afe158e=
64f0fe265a0176bc"
> +
> +
> +S =3D "${WORKDIR}/qextserialport-${PV}"
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
> +FILES_${PN}-dbg =3D " \
> +  ${libdir}/.debug/libqextserialport.so* \
> +  /usr/src/debug/qextserialport-${PV}-${PR}/qextserialport-${PV}/* \
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

--/04w6evG8XlLl3ft
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEtRwEACgkQN1Ujt2V2gBxoJwCgluaMmqtFBjhPK/2d+EN1PUyO
y7UAoLRij0FcTTl0UU5dsuOJ4cpilCJa
=RGFO
-----END PGP SIGNATURE-----

--/04w6evG8XlLl3ft--
