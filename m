Received: from mail-da0-f46.google.com ([209.85.210.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UAo2i-0006sb-VS
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Feb 2013 21:56:01 +0100
Received: by mail-da0-f46.google.com with SMTP id z8so478575dad.19
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Feb 2013 12:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=wLLr3FpGqHJgx3lDpVBqa1xUv4k5NQAmeuaRL0y7yQ0=;
	b=r43Rfbc6pRqTsONrsDZnP67DBJ42T+8m1fxdtlDC4RlAd5VfttUcIdddMJ3k40KGc+
	r84jxSlRvuR8JaIt2pR2G9173HT1CMEDOCoAMi7fQUWF5gGLaD9vS3AjQjHA00Two6fi
	4/FlVa+q3bVNaNPWiZcOlhAzPVgvMivktitnZZ+zBPgLKfJqfj9UIEV6YHZmEyPAjoNm
	pwcDMJVbt0VPDGA9djdWSNQiMFW7VuApvia9YmQHcp66ofEysZ76xYO8jcDJAlyMcZ+8
	iPaxCi9ZStBVo1hNj6Ah6RYzNaWUZco4Gy/e5O/iUlkrxFkmU7JKNhiLOgH3tgVD4lAA
	221Q==
X-Received: by 10.66.82.226 with SMTP id l2mr9513797pay.64.1361997578917;
	Wed, 27 Feb 2013 12:39:38 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id hu2sm5696416pbc.38.2013.02.27.12.39.34
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 27 Feb 2013 12:39:37 -0800 (PST)
Date: Wed, 27 Feb 2013 21:39:26 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130227203926.GE8208@jama.dyndns-home.com>
References: <1361995702-28964-1-git-send-email-ftonello@cercacor.com>
MIME-Version: 1.0
In-Reply-To: <1361995702-28964-1-git-send-email-ftonello@cercacor.com>
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
X-List-Received-Date: Wed, 27 Feb 2013 20:56:03 -0000
X-Groupsio-MsgNum: 43321
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UnaWdueM1EBWVRzC"
Content-Disposition: inline

--UnaWdueM1EBWVRzC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 27, 2013 at 12:08:21PM -0800, eu@felipetonello.com wrote:
> From: "Felipe F. Tonello" <ftonello@cercacor.com>
>=20
> QExtSerialPort is a serial port library for Qt4/5.

Is there good reason to redefine all those FILES_*?

=46rom previous mail:
It also has a lot of QA warnings, it's better to use +=3D for FILES_, so
that default values are preserved where possible.                          =
                                     =20

>=20
> Signed-off-by: Felipe F. Tonello <ftonello@cercacor.com>
> ---
>  .../qextserialport/qextserialport_1.2rc.bb         |   56 ++++++++++++++=
++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 meta-oe/recipes-qt/qextserialport/qextserialport_1.2r=
c.bb
>=20
> diff --git a/meta-oe/recipes-qt/qextserialport/qextserialport_1.2rc.bb b/=
meta-oe/recipes-qt/qextserialport/qextserialport_1.2rc.bb
> new file mode 100644
> index 0000000..4cc9d6c
> --- /dev/null
> +++ b/meta-oe/recipes-qt/qextserialport/qextserialport_1.2rc.bb
> @@ -0,0 +1,56 @@
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
> +FILES_${PN}-dbg =3D " \
> +  ${libdir}/.debug/libqextserialport.so* \
> +  /usr/src/debug/qextserialport-${PV}-${PR}/qextserialport-${REAL_PV} \
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

--UnaWdueM1EBWVRzC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEubv4ACgkQN1Ujt2V2gBxCQACeJlapBv6Wrs2nFyzSJe/V3iXn
nXwAn2B1610voQuDTaaQxZ5Y/oA0cEHV
=MRSl
-----END PGP SIGNATURE-----

--UnaWdueM1EBWVRzC--
