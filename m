Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 7311C72A83
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Jan 2015 02:48:54 +0000 (UTC)
Received: from svr-orw-fem-02x.mgc.mentorg.com ([147.34.96.206]
	helo=SVR-ORW-FEM-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1YD2Oc-0004CR-Eq from Joe_MacDonald@mentor.com ;
	Sun, 18 Jan 2015 18:48:54 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.3.224.2;
	Sun, 18 Jan 2015 18:48:54 -0800
Received: by burninator (Postfix, from userid 1000)	id 62E0B580FA4; Sun, 18
	Jan 2015 21:48:51 -0500 (EST)
Date: Sun, 18 Jan 2015 21:48:51 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: "Bian, Naimeng" <biannm@cn.fujitsu.com>
Message-ID: <20150119024850.GF25313@mentor.com>
References: <1420523147-3740-1-git-send-email-biannm@cn.fujitsu.com>
	<20150109162814.GA5581@mentor.com>
	<30DC4EDFD798C94083F3E083754532CC73DE7ECE@G08CNEXMBPEKD02.g08.fujitsu.local>
	<30DC4EDFD798C94083F3E083754532CC73DE926C@G08CNEXMBPEKD02.g08.fujitsu.local>
MIME-Version: 1.0
In-Reply-To: <30DC4EDFD798C94083F3E083754532CC73DE926C@G08CNEXMBPEKD02.g08.fujitsu.local>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH v2] openwsman: add recipe
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
X-List-Received-Date: Mon, 19 Jan 2015 02:48:58 -0000
X-Groupsio-MsgNum: 53872
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Y/WcH0a6A93yCHGr"
Content-Disposition: inline

--Y/WcH0a6A93yCHGr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[RE: [oe] [meta-networking][PATCH v2] openwsman: add recipe] On 15.01.18 (S=
un 05:22) Bian, Naimeng wrote:

> Hi Joe
>=20
> Sorry. I have not reproduced this error on my building host.
> I will try to reproduce it firstly before create the V3 patch later.

I think this might've been the issue I only saw when I did a world
build, so you might try that.  There was at least one that built just
fine for me on any image but failed on a world build.

-J.

>=20
> Thanks
>  Bian
>=20
>=20
> > -----Original Message-----
> > From: openembedded-devel-bounces@lists.openembedded.org
> > [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of=
 Bian,
> > Naimeng
> > Sent: Monday, January 12, 2015 9:07 AM
> > To: Joe MacDonald
> > Cc: openembedded-devel@lists.openembedded.org
> > Subject: Re: [oe] [meta-networking][PATCH v2] openwsman: add recipe
> >=20
> > Hi Joe,
> >=20
> > Thanks for your remind. I will create the V3 tomorrow.
> >=20
> > Thanks,
> >  Bian
> >=20
> > > -----Original Message-----
> > > From: Joe MacDonald [mailto:Joe_MacDonald@mentor.com]
> > > Subject: Re: [oe] [meta-networking][PATCH v2] openwsman: add recipe
> > >
> > > Bian,
> > >
> > > I just wanted to be sure you had noticed the discussion on the list
> > > regarding this submission, it has what looks like a -lm issue in the
> > > compile stage and consequently we'll need a v3, please.  You can see
> > > an example of the failure
> > > here:
> > >
> > > http://errors.yoctoproject.org/Errors/Search/Details/7107/1/10/3939
> > >
> > > Thanks,
> > > -J.
> > >
> > > [[oe] [meta-networking][PATCH v2] openwsman: add recipe] On 15.01.06
> > > (Tue
> > > 13:45) Bian Naimeng wrote:
> > >
> > > > Opensource Implementation of WS-Management
> > > >
> > > > Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
> > > > ---
> > > >  .../libssl-is-required-if-eventint-supported.patch | 17 +++++++
> > > >  .../openwsman/openwsman/openwsmand.service         | 12 +++++
> > > >  .../openwsman/openwsman_2.4.12.bb                  | 59
> > > ++++++++++++++++++++++
> > > >  3 files changed, 88 insertions(+)
> > > >  create mode 100644
> > > > meta-networking/recipes-protocols/openwsman/openwsman/libssl-is-requ
> > > > ir ed-if-eventint-supported.patch  create mode 100644
> > > > meta-networking/recipes-protocols/openwsman/openwsman/openwsmand.ser
> > > > vi
> > > > ce  create mode 100644
> > > > meta-networking/recipes-protocols/openwsman/openwsman_2.4.12.bb
> > > >
> > > > diff --git
> > > > a/meta-networking/recipes-protocols/openwsman/openwsman/libssl-is-re
> > > > qu
> > > > ired-if-eventint-supported.patch
> > > > b/meta-networking/recipes-protocols/openwsman/openwsman/libssl-is-re
> > > > qu
> > > > ired-if-eventint-supported.patch
> > > > new file mode 100644
> > > > index 0000000..bd540e3
> > > > --- /dev/null
> > > > +++ b/meta-networking/recipes-protocols/openwsman/openwsman/libssl-i
> > > > +++ s- required-if-eventint-supported.patch
> > > > @@ -0,0 +1,17 @@
> > > > +libssl is required by wsman_client_transport if
> > > > +ENABLE_EVENTING_SUPPORT
> > > enabled.
> > > > +
> > > > +Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
> > > > +
> > > > +diff -Nurp openwsman-2.4.12.orig/src/lib/CMakeLists.txt
> > > openwsman-2.4.12/src/lib/CMakeLists.txt
> > > > +--- openwsman-2.4.12.orig/src/lib/CMakeLists.txt	2014-10-28
> > > 23:04:47.000000000 +0800
> > > > ++++ openwsman-2.4.12/src/lib/CMakeLists.txt	2014-12-31
> > > 11:09:20.340428523 +0800
> > > > +@@ -56,6 +56,9 @@ TARGET_LINK_LIBRARIES( ${WSMAN_CLIENT_TR
> > > > +SET_TARGET_PROPERTIES( ${WSMAN_CLIENT_TRANSPORT_PKG} PROPERTIES
> > > > +VERSION 1.0.0 SOVERSION 1)  INSTALL(TARGETS
> > > > +${WSMAN_CLIENT_TRANSPORT_PKG} DESTINATION ${LIB_INSTALL_DIR})
> > > > +
> > > > ++IF( ENABLE_EVENTING_SUPPORT )
> > > > ++TARGET_LINK_LIBRARIES( ${WSMAN_CLIENT_TRANSPORT_PKG}
> > > > ++${OPENSSL_LIBRARIES} ) ENDIF( ENABLE_EVENTING_SUPPORT )
> > > > +
> > > > + ############### wsman_client ###############
> > > > +
> > > > diff --git
> > > > a/meta-networking/recipes-protocols/openwsman/openwsman/openwsmand.s
> > > > er
> > > > vice
> > > > b/meta-networking/recipes-protocols/openwsman/openwsman/openwsmand.s
> > > > er
> > > > vice
> > > > new file mode 100644
> > > > index 0000000..154f3cd
> > > > --- /dev/null
> > > > +++ b/meta-networking/recipes-protocols/openwsman/openwsman/openwsma
> > > > +++ nd
> > > > +++ .service
> > > > @@ -0,0 +1,12 @@
> > > > +[Unit]
> > > > +Description=3DOpenwsman WS-Management Service After=3Dsyslog.target
> > > > +
> > > > +[Service]
> > > > +Type=3Dforking
> > > > +ExecStart=3D@SBINDIR@/openwsmand
> > > > +ExecStartPre=3D@SYSCONFDIR@/openwsman/owsmangencert.sh
> > > > +PIDFile=3D@LOCALSTATEDIR@/run/wsmand.pid
> > > > +
> > > > +[Install]
> > > > +WantedBy=3Dmulti-user.target
> > > > diff --git
> > > > a/meta-networking/recipes-protocols/openwsman/openwsman_2.4.12.bb
> > > > b/meta-networking/recipes-protocols/openwsman/openwsman_2.4.12.bb
> > > > new file mode 100644
> > > > index 0000000..f188b1d
> > > > --- /dev/null
> > > > +++ b/meta-networking/recipes-protocols/openwsman/openwsman_2.4.12.b
> > > > +++ b
> > > > @@ -0,0 +1,59 @@
> > > > +SUMMARY =3D "Opensource Implementation of WS-Management"
> > > > +DESCRIPTION =3D "Openwsman is a project intended to provide an
> > > > +open-source =A5 implementation of the Web Services Management
> > > > +specipication =A5
> > > > +(WS-Management) and to expose system management information on the
> > > > +=A5 Linux operating system using the WS-Management protocol.
> > > > +WS-Management =A5 is based on a suite of web services specificatio=
ns
> > > > +and usage =A5 requirements that exposes a set of operations focused
> > > > +on and covers =A5 all system management aspects. =A5 Openwsman Ser=
ver
> > > > +and service libraries"
> > > > +HOMEPAGE =3D "http://www.openwsman.org/"
> > > > +SECTION =3D "Applications/System"
> > > > +
> > > > +DEPENDS =3D "curl libxml2 openssl libpam"
> > > > +
> > > > +SRC_URI =3D
> > > > +"https://github.com/Openwsman/openwsman/archive/v2.4.12.tar.gz
> > > =A5
> > > > +           file://libssl-is-required-if-eventint-supported.patch =
=A5
> > > > +           file://openwsmand.service"
> > > > +
> > > > +SRC_URI[md5sum] =3D "4893a41c6fd89b33095c315c79638a75"
> > > > +SRC_URI[sha256sum] =3D
> > > "6a4b75dfff1a51c7bc09fd1d44abbde55ae74906f3828797ce391883358120f4"
> > > > +
> > > > +LICENSE =3D "BSD"
> > > > +LIC_FILES_CHKSUM =3D
> > "file://COPYING;md5=3Dd4f53d4c6cf73b9d43186ce3be6dd0ba"
> > > > +
> > > > +inherit systemd cmake pkgconfig pythonnative perlnative
> > > > +
> > > > +SYSTEMD_SERVICE_${PN} =3D "openwsmand.service"
> > > > +SYSTEMD_AUTO_ENABLE =3D "disable"
> > > > +
> > > > +EXTRA_OECMAKE =3D "-DBUILD_BINDINGS=3DNO -DBUILD_LIBCIM=3DNO -DBUI=
LD_PERL=3DYES
> > =A5
> > > > +                 -DCMAKE_INSTALL_PREFIX=3D${prefix} -DLIB=3Dlib"
> > > > +
> > > > +do_configure_prepend() {
> > > > +    export HOST_SYS=3D${HOST_SYS}
> > > > +    export BUILD_SYS=3D${BUILD_SYS}
> > > > +    export STAGING_INCDIR=3D${STAGING_INCDIR}
> > > > +    export STAGING_LIBDIR=3D${STAGING_LIBDIR} }
> > > > +
> > > > +do_install_append() {
> > > > +    install -d ${D}/${sysconfdir}/init.d
> > > > +    install -m 755 ${B}/etc/init/openwsmand.sh
> > > ${D}/${sysconfdir}/init.d/openwsmand
> > > > +    ln -sf ${sysconfdir}/init.d/openwsmand
> > > > +${D}/${sbindir}/rcopenwsmand
> > > > +
> > > > +    if
> > > > + ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)};
> > > then
> > > > +        install -d ${D}/${systemd_unitdir}/system
> > > > +        install -m 644 ${WORKDIR}/openwsmand.service
> > > > + ${D}/${systemd_unitdir}/system
> > > > +
> > > > +        sed -i -e 's,@SBINDIR@,${sbindir},g'
> > > ${D}${systemd_unitdir}/system/openwsmand.service
> > > > +        sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g'
> > > ${D}${systemd_unitdir}/system/openwsmand.service
> > > > +        sed -i -e 's,@LOCALSTATEDIR@,${localstatedir},g'
> > > ${D}${systemd_unitdir}/system/openwsmand.service
> > > > +    fi
> > > > +}
> > > > +
> > > > +FILES_${PN}-dbg +=3D "${libdir}/openwsman/plugins/.debug/ =A5
> > > > +                    ${libdir}/openwsman/authenticators/.debug/ =A5
> > > > +                   "
> > > > +
> > > > +INSANE_SKIP_${PN} =3D "dev-so"
> > > > --
> > > > 1.9.1
> > > >
> > > --
> > > -Joe MacDonald.
> > > :wq
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
-Joe MacDonald.
:wq

--Y/WcH0a6A93yCHGr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJUvHCSAAoJEEn8ffcsOfaWWQgH/0eIxboK+nOk57JJVGNfyRpz
JXZu62/MZdwYap3WDj90JgSZ5+dRnuXp19TWBaKxjMaCrRUF6749qRksFAB+qvZu
aMOABGhoLvOGNlsyj4a3Dyz7J7Lnd28DfGxOhR9WqIJu21CR8iqkv8ti83z4/YpW
WOyMleg4MzXX8jaRsxz8DK+rMKs6HT7i/A9bvbip+rKndxffz5RT71EO4jkYxdY4
d9qbo9D7BhicDoIww7M9IkzxWp3AXd3SO8JH8/Icr51F+nPa+/i4+pvYmY21fvDE
GA63fJ50HcETOUaNp+BCOBDBP1+NVI6K2F496oTipb0IBOdoLNH95vZ4dvkAm2A=
=C3dv
-----END PGP SIGNATURE-----

--Y/WcH0a6A93yCHGr--
