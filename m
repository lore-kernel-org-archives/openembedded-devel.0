Received: from mail-da0-f49.google.com ([209.85.210.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UBDSR-0003j5-Cr
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Mar 2013 01:04:36 +0100
Received: by mail-da0-f49.google.com with SMTP id t11so1091521daj.36
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Feb 2013 15:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=t8mUOJEF2ZL8uKyxauh/sEYKHWa6BFgIZB7HMablVIM=;
	b=Kq0OrnaI2U4vNZlvoNfPYnjs9OiNojpPwKdAWksmsixzrlWJj5mRbj6IwGf9hDCI+8
	v2Kn8MtDMl7baG1igoZEPDHMAM0H9c8l048PDbV0TxalhAhRJrc5869cE2su+MU/WrkC
	2+2ZPFKlVNHfLF/bsX3DVo/Jb6rBapK37QClwUM/oNnpu473S0JhnGdznQ/qTrEZUHaM
	3FDObcorZp2AzJFOAZqI5oQlR6KxX4Nytsv+/5kOaZlFlFWUTnRup6UhCp6GkaTxf4Vl
	TGI9mAYIiJ3mArlcfxfP4HrOvJav2UOjv0liClzRUrlWNIwyBzk3szZnI+TFiWuIfsvL
	ttFA==
X-Received: by 10.68.129.73 with SMTP id nu9mr11695439pbb.57.1362095272011;
	Thu, 28 Feb 2013 15:47:52 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id 1sm9820052pba.32.2013.02.28.15.47.49
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 28 Feb 2013 15:47:50 -0800 (PST)
Date: Fri, 1 Mar 2013 00:47:46 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130228234746.GD3279@jama>
References: <1361995702-28964-1-git-send-email-ftonello@cercacor.com>
	<20130227203926.GE8208@jama.dyndns-home.com>
	<512E8A65.5070904@felipetonello.com>
MIME-Version: 1.0
In-Reply-To: <512E8A65.5070904@felipetonello.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
X-List-Received-Date: Fri, 01 Mar 2013 00:04:41 -0000
X-Groupsio-MsgNum: 43340
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lteA1dqeVaWQ9QQl"
Content-Disposition: inline

--lteA1dqeVaWQ9QQl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 27, 2013 at 02:36:21PM -0800, Felipe Ferreri Tonello wrote:
> Hi Martin,
>=20
> On 02/27/2013 12:39 PM, Martin Jansa wrote:
> > On Wed, Feb 27, 2013 at 12:08:21PM -0800, eu@felipetonello.com wrote:
> >> From: "Felipe F. Tonello" <ftonello@cercacor.com>
> >>
> >> QExtSerialPort is a serial port library for Qt4/5.
> >
> > Is there good reason to redefine all those FILES_*?
> >
> >  From previous mail:
> > It also has a lot of QA warnings, it's better to use +=3D for FILES_, so
> > that default values are preserved where possible.
> >
>=20
> Ok. Got it. But in this case there is no more QA right. I know that I=20
> added the /usr/src/..., which is redundant, but still. If you want to me=
=20
> to remove, I can do it.

QA warnings are still there
qextserialport-1.1+1.2rc: qextserialport: Files/directories were
installed but not shipped
  /usr/src
  /usr/src/debug
  /usr/src/debug/qextserialport
  /usr/src/debug/qextserialport/1.1+1.2rc-r0
  /usr/src/debug/qextserialport/1.1+1.2rc-r0/qextserialport-1.2rc
  /usr/src/debug/qextserialport/1.1+1.2rc-r0/qextserialport-1.2rc/moc_qexts=
erialport.cpp
  /usr/src/debug/qextserialport/1.1+1.2rc-r0/qextserialport-1.2rc/moc_qexts=
erialenumerator.cpp
  /usr/src/debug/qextserialport/1.1+1.2rc-r0/qextserialport-1.2rc/src
  /usr/src/debug/qextserialport/1.1+1.2rc-r0/qextserialport-1.2rc/src/qexts=
erialport_unix.cpp
  /usr/src/debug/qextserialport/1.1+1.2rc-r0/qextserialport-1.2rc/src/qexts=
erialport_p.h
  /usr/src/debug/qextserialport/1.1+1.2rc-r0/qextserialport-1.2rc/src/qexts=
erialport.h
  /usr/src/debug/qextserialport/1.1+1.2rc-r0/qextserialport-1.2rc/src/qexts=
erialport.cpp
  /usr/src/debug/qextserialport/1.1+1.2rc-r0/qextserialport-1.2rc/src/qexts=
erialenumerator_p.h
  /usr/src/debug/qextserialport/1.1+1.2rc-r0/qextserialport-1.2rc/src/qexts=
erialenumerator_linux.cpp
  /usr/src/debug/qextserialport/1.1+1.2rc-r0/qextserialport-1.2rc/src/qexts=
erialenumerator.h
  /usr/src/debug/qextserialport/1.1+1.2rc-r0/qextserialport-1.2rc/src/qexts=
erialenumerator.cpp

You added
/usr/src/debug/qextserialport-${PV}-${PR}/qextserialport-${REAL_PV}
but it's in
/usr/src/debug/qextserialport/${PV}-${PR}/qextserialport-${REAL_PV} \

But really use default FILES_ values and only add to it with +=3D if
needed and only in some exceptions you have to overwrite it completely
(e.g. when foo.so from PN-dev is actually needed in PN).

>=20
> At least, someone that takes this recipe knows exactly what's been=20
> installed. IMO the default FILES_ might be obscure to some new contributo=
rs.
>=20
> Thanks
>=20
> Felipe
>=20
> >>
> >> Signed-off-by: Felipe F. Tonello <ftonello@cercacor.com>
> >> ---
> >>   .../qextserialport/qextserialport_1.2rc.bb         |   56 ++++++++++=
++++++++++
> >>   1 file changed, 56 insertions(+)
> >>   create mode 100644 meta-oe/recipes-qt/qextserialport/qextserialport_=
1.2rc.bb
> >>
> >> diff --git a/meta-oe/recipes-qt/qextserialport/qextserialport_1.2rc.bb=
 b/meta-oe/recipes-qt/qextserialport/qextserialport_1.2rc.bb
> >> new file mode 100644
> >> index 0000000..4cc9d6c
> >> --- /dev/null
> >> +++ b/meta-oe/recipes-qt/qextserialport/qextserialport_1.2rc.bb
> >> @@ -0,0 +1,56 @@
> >> +DESCRIPTION =3D "Qt Ext Serial Port Library"
> >> +HOMEPAGE =3D "http://http://code.google.com/p/qextserialport/"
> >> +LICENSE =3D "MIT"
> >> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db866a28cda707ec714878bd933=
f46251"
> >> +SECTION =3D "qt/libs"
> >> +
> >> +PR =3D "r0"
> >> +
> >> +# 1.2rc as version will sort lower then 1.2 when it's released
> >> +REAL_PV =3D "1.2rc"
> >> +PV =3D "1.1+${REAL_PV}"
> >> +
> >> +inherit qt4x11 pkgconfig
> >> +
> >> +DEPENDS =3D "udev"
> >> +
> >> +SRC_URI =3D " \
> >> +  http://qextserialport.googlecode.com/files/qextserialport-${REAL_PV=
}.zip \
> >> +"
> >> +
> >> +SRC_URI[md5sum] =3D "ffa061edb9f64666468d18402eee6108"
> >> +SRC_URI[sha256sum] =3D "9cbee267aac9830f9944bb1d13872e51fba400aa9afe1=
58e64f0fe265a0176bc"
> >> +
> >> +S =3D "${WORKDIR}/qextserialport-${REAL_PV}"
> >> +
> >> +FILES_${PN} =3D "${libdir}/libqextserialport${SOLIBS}"
> >> +
> >> +FILES_${PN}-dev =3D " \
> >> +  ${libdir}/libqextserialport${SOLIBSDEV} \
> >> +  ${libdir}/libqextserialport.prl \
> >> +  ${includedir}/QtExtSerialPort/*.h \
> >> +  ${datadir}/qt4/mkspecs/features/extserialport.prf \
> >> +"
> >> +
> >> +FILES_${PN}-dbg =3D " \
> >> +  ${libdir}/.debug/libqextserialport.so* \
> >> +  /usr/src/debug/qextserialport-${PV}-${PR}/qextserialport-${REAL_PV}=
 \
> >> +"
> >> +
> >> +do_configure_prepend() {
> >> +  # based on the documentation, this line make sure we use udev in li=
nux
> >> +  cd ${S} && echo "linux*:CONFIG +=3D qesp_linux_udev" > .qmake.cache
> >> +
> >> +  # Hacking hardcoded qmake variables
> >> +  find *.pro -exec sed -i -e 's,$$\[QT_INSTALL_HEADERS\],${includedir=
},g' '{}' ';'
> >> +  find *.pro -exec sed -i -e 's,$$\[QT_INSTALL_LIBS\],${libdir},g' '{=
}' ';'
> >> +  find *.pro -exec sed -i -e 's,$$\[QMAKE_MKSPECS\],${datadir}/qt4/mk=
specs/,g' '{}' ';'
> >> +}
> >> +
> >> +do_install() {
> >> +  export INSTALL_ROOT=3D${D}
> >> +  oe_runmake install
> >> +
> >> +  # This is necessary to make it work with the qt based SDK
> >> +  cd ${D}/${datadir}/qt4/mkspecs/features && sed -i -e "s|${STAGING_I=
NCDIR_NATIVE}/qt4|\$(OE_QMAKE_INCDIR_QT)/..|" ./extserialport.prf
> >> +}
> >> --
> >> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--lteA1dqeVaWQ9QQl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEv7KIACgkQN1Ujt2V2gBzk9wCfXekz28dKLbV1vh/Cc+6l7hiL
PPcAoLSFDZnZRv3608hPCqan+n3H6deB
=xcoZ
-----END PGP SIGNATURE-----

--lteA1dqeVaWQ9QQl--
