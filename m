Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id D82C860670
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Jan 2015 15:04:00 +0000 (UTC)
Received: from svr-orw-fem-06.mgc.mentorg.com ([147.34.97.120])
	by relay1.mentorg.com with esmtp 
	id 1YEJIe-0002vc-LM from Joe_MacDonald@mentor.com ;
	Thu, 22 Jan 2015 07:04:00 -0800
Received: from burninator (147.34.91.1) by SVR-ORW-FEM-06.mgc.mentorg.com
	(147.34.97.120) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 22 Jan 2015 07:03:59 -0800
Received: by burninator (Postfix, from userid 1000)	id 96C8E580A1B; Thu, 22
	Jan 2015 10:03:56 -0500 (EST)
Date: Thu, 22 Jan 2015 10:03:56 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: "Bian, Naimeng" <biannm@cn.fujitsu.com>
Message-ID: <20150122150356.GA4470@mentor.com>
References: <1420523147-3740-1-git-send-email-biannm@cn.fujitsu.com>
	<20150109162814.GA5581@mentor.com>
	<30DC4EDFD798C94083F3E083754532CC73DE7ECE@G08CNEXMBPEKD02.g08.fujitsu.local>
	<30DC4EDFD798C94083F3E083754532CC73DE926C@G08CNEXMBPEKD02.g08.fujitsu.local>
	<20150119024850.GF25313@mentor.com>
	<30DC4EDFD798C94083F3E083754532CC73DE9F55@G08CNEXMBPEKD02.g08.fujitsu.local>
MIME-Version: 1.0
In-Reply-To: <30DC4EDFD798C94083F3E083754532CC73DE9F55@G08CNEXMBPEKD02.g08.fujitsu.local>
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
X-List-Received-Date: Thu, 22 Jan 2015 15:04:07 -0000
X-Groupsio-MsgNum: 53926
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="n8g4imXOkfNTN/H1"
Content-Disposition: inline

--n8g4imXOkfNTN/H1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[RE: [oe] [meta-networking][PATCH v2] openwsman: add recipe] On 15.01.22 (T=
hu 07:01) Bian, Naimeng wrote:

> > Cc: openembedded-devel@lists.openembedded.org
> > Subject: Re: [oe] [meta-networking][PATCH v2] openwsman: add recipe
> >=20
> > [RE: [oe] [meta-networking][PATCH v2] openwsman: add recipe] On 15.01.1=
8 (Sun
> > 05:22) Bian, Naimeng wrote:
> >=20
> > > Hi Joe
> > >
> > > Sorry. I have not reproduced this error on my building host.
> > > I will try to reproduce it firstly before create the V3 patch later.
> >=20
> > I think this might've been the issue I only saw when I did a world buil=
d, so
> > you might try that.  There was at least one that built just fine for me=
 on any
> > image but failed on a world build.
> >=20
>=20
> Sorry, would you mind tell what's the world build.

It's essentially "build everything in all available layers".

   % bitbake world

or, probably more usefully:

   % bitbake -k world

Which keeps going through the world build as much as it can instead of
screeching to a halt on the first failure it finds.

-J.

>=20
> Thanks
>  Bian
>=20
> > -J.
> >=20
> > >
> > > Thanks
> > >  Bian
> > >
> > >
> > > > -----Original Message-----
> > > > From: openembedded-devel-bounces@lists.openembedded.org
> > > > [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf
> > > > Of Bian, Naimeng
> > > > Sent: Monday, January 12, 2015 9:07 AM
> > > > To: Joe MacDonald
> > > > Cc: openembedded-devel@lists.openembedded.org
> > > > Subject: Re: [oe] [meta-networking][PATCH v2] openwsman: add recipe
> > > >
> > > > Hi Joe,
> > > >
> > > > Thanks for your remind. I will create the V3 tomorrow.
> > > >
> > > > Thanks,
> > > >  Bian
> > > >
> > > > > -----Original Message-----
> > > > > From: Joe MacDonald [mailto:Joe_MacDonald@mentor.com]
> > > > > Subject: Re: [oe] [meta-networking][PATCH v2] openwsman: add
> > > > > recipe
> > > > >
> > > > > Bian,
> > > > >
> > > > > I just wanted to be sure you had noticed the discussion on the
> > > > > list regarding this submission, it has what looks like a -lm issue
> > > > > in the compile stage and consequently we'll need a v3, please.
> > > > > You can see an example of the failure
> > > > > here:
> > > > >
> > > > > http://errors.yoctoproject.org/Errors/Search/Details/7107/1/10/393
> > > > > 9
> > > > >
> > > > > Thanks,
> > > > > -J.
> > > > >
> > > > > [[oe] [meta-networking][PATCH v2] openwsman: add recipe] On
> > > > > 15.01.06 (Tue
> > > > > 13:45) Bian Naimeng wrote:
> > > > >
> > > > > > Opensource Implementation of WS-Management
> > > > > >
> > > > > > Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
> > > > > > ---
> > > > > >  .../libssl-is-required-if-eventint-supported.patch | 17 +++++++
> > > > > >  .../openwsman/openwsman/openwsmand.service         | 12 +++++
> > > > > >  .../openwsman/openwsman_2.4.12.bb                  | 59
> > > > > ++++++++++++++++++++++
> > > > > >  3 files changed, 88 insertions(+)  create mode 100644
> > > > > > meta-networking/recipes-protocols/openwsman/openwsman/libssl-is-
> > > > > > requ ir ed-if-eventint-supported.patch  create mode 100644
> > > > > > meta-networking/recipes-protocols/openwsman/openwsman/openwsmand
> > > > > > .ser
> > > > > > vi
> > > > > > ce  create mode 100644
> > > > > > meta-networking/recipes-protocols/openwsman/openwsman_2.4.12.bb
> > > > > >
> > > > > > diff --git
> > > > > > a/meta-networking/recipes-protocols/openwsman/openwsman/libssl-i
> > > > > > s-re
> > > > > > qu
> > > > > > ired-if-eventint-supported.patch
> > > > > > b/meta-networking/recipes-protocols/openwsman/openwsman/libssl-i
> > > > > > s-re
> > > > > > qu
> > > > > > ired-if-eventint-supported.patch new file mode 100644 index
> > > > > > 0000000..bd540e3
> > > > > > --- /dev/null
> > > > > > +++ b/meta-networking/recipes-protocols/openwsman/openwsman/libs
> > > > > > +++ sl-i
> > > > > > +++ s- required-if-eventint-supported.patch
> > > > > > @@ -0,0 +1,17 @@
> > > > > > +libssl is required by wsman_client_transport if
> > > > > > +ENABLE_EVENTING_SUPPORT
> > > > > enabled.
> > > > > > +
> > > > > > +Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
> > > > > > +
> > > > > > +diff -Nurp openwsman-2.4.12.orig/src/lib/CMakeLists.txt
> > > > > openwsman-2.4.12/src/lib/CMakeLists.txt
> > > > > > +--- openwsman-2.4.12.orig/src/lib/CMakeLists.txt	2014-10-28
> > > > > 23:04:47.000000000 +0800
> > > > > > ++++ openwsman-2.4.12/src/lib/CMakeLists.txt	2014-12-31
> > > > > 11:09:20.340428523 +0800
> > > > > > +@@ -56,6 +56,9 @@ TARGET_LINK_LIBRARIES( ${WSMAN_CLIENT_TR
> > > > > > +SET_TARGET_PROPERTIES( ${WSMAN_CLIENT_TRANSPORT_PKG} PROPERTIES
> > > > > > +VERSION 1.0.0 SOVERSION 1)  INSTALL(TARGETS
> > > > > > +${WSMAN_CLIENT_TRANSPORT_PKG} DESTINATION ${LIB_INSTALL_DIR})
> > > > > > +
> > > > > > ++IF( ENABLE_EVENTING_SUPPORT )
> > > > > > ++TARGET_LINK_LIBRARIES( ${WSMAN_CLIENT_TRANSPORT_PKG}
> > > > > > ++${OPENSSL_LIBRARIES} ) ENDIF( ENABLE_EVENTING_SUPPORT )
> > > > > > +
> > > > > > + ############### wsman_client ###############
> > > > > > +
> > > > > > diff --git
> > > > > > a/meta-networking/recipes-protocols/openwsman/openwsman/openwsma
> > > > > > nd.s
> > > > > > er
> > > > > > vice
> > > > > > b/meta-networking/recipes-protocols/openwsman/openwsman/openwsma
> > > > > > nd.s
> > > > > > er
> > > > > > vice
> > > > > > new file mode 100644
> > > > > > index 0000000..154f3cd
> > > > > > --- /dev/null
> > > > > > +++ b/meta-networking/recipes-protocols/openwsman/openwsman/open
> > > > > > +++ wsma
> > > > > > +++ nd
> > > > > > +++ .service
> > > > > > @@ -0,0 +1,12 @@
> > > > > > +[Unit]
> > > > > > +Description=3DOpenwsman WS-Management Service After=3Dsyslog.t=
arget
> > > > > > +
> > > > > > +[Service]
> > > > > > +Type=3Dforking
> > > > > > +ExecStart=3D@SBINDIR@/openwsmand
> > > > > > +ExecStartPre=3D@SYSCONFDIR@/openwsman/owsmangencert.sh
> > > > > > +PIDFile=3D@LOCALSTATEDIR@/run/wsmand.pid
> > > > > > +
> > > > > > +[Install]
> > > > > > +WantedBy=3Dmulti-user.target
> > > > > > diff --git
> > > > > > a/meta-networking/recipes-protocols/openwsman/openwsman_2.4.12.b
> > > > > > b
> > > > > > b/meta-networking/recipes-protocols/openwsman/openwsman_2.4.12.b
> > > > > > b
> > > > > > new file mode 100644
> > > > > > index 0000000..f188b1d
> > > > > > --- /dev/null
> > > > > > +++ b/meta-networking/recipes-protocols/openwsman/openwsman_2.4.
> > > > > > +++ 12.b
> > > > > > +++ b
> > > > > > @@ -0,0 +1,59 @@
> > > > > > +SUMMARY =3D "Opensource Implementation of WS-Management"
> > > > > > +DESCRIPTION =3D "Openwsman is a project intended to provide an
> > > > > > +open-source \ implementation of the Web Services Management
> > > > > > +specipication \
> > > > > > +(WS-Management) and to expose system management information on
> > > > > > +the \ Linux operating system using the WS-Management protocol.
> > > > > > +WS-Management \ is based on a suite of web services
> > > > > > +specifications and usage \ requirements that exposes a set of
> > > > > > +operations focused on and covers \ all system management
> > > > > > +aspects. \ Openwsman Server and service libraries"
> > > > > > +HOMEPAGE =3D "http://www.openwsman.org/"
> > > > > > +SECTION =3D "Applications/System"
> > > > > > +
> > > > > > +DEPENDS =3D "curl libxml2 openssl libpam"
> > > > > > +
> > > > > > +SRC_URI =3D
> > > > > > +"https://github.com/Openwsman/openwsman/archive/v2.4.12.tar.gz
> > > > > \
> > > > > > +           file://libssl-is-required-if-eventint-supported.pat=
ch \
> > > > > > +           file://openwsmand.service"
> > > > > > +
> > > > > > +SRC_URI[md5sum] =3D "4893a41c6fd89b33095c315c79638a75"
> > > > > > +SRC_URI[sha256sum] =3D
> > > > > "6a4b75dfff1a51c7bc09fd1d44abbde55ae74906f3828797ce391883358120f4"
> > > > > > +
> > > > > > +LICENSE =3D "BSD"
> > > > > > +LIC_FILES_CHKSUM =3D
> > > > "file://COPYING;md5=3Dd4f53d4c6cf73b9d43186ce3be6dd0ba"
> > > > > > +
> > > > > > +inherit systemd cmake pkgconfig pythonnative perlnative
> > > > > > +
> > > > > > +SYSTEMD_SERVICE_${PN} =3D "openwsmand.service"
> > > > > > +SYSTEMD_AUTO_ENABLE =3D "disable"
> > > > > > +
> > > > > > +EXTRA_OECMAKE =3D "-DBUILD_BINDINGS=3DNO -DBUILD_LIBCIM=3DNO
> > > > > > +-DBUILD_PERL=3DYES
> > > > \
> > > > > > +                 -DCMAKE_INSTALL_PREFIX=3D${prefix} -DLIB=3Dli=
b"
> > > > > > +
> > > > > > +do_configure_prepend() {
> > > > > > +    export HOST_SYS=3D${HOST_SYS}
> > > > > > +    export BUILD_SYS=3D${BUILD_SYS}
> > > > > > +    export STAGING_INCDIR=3D${STAGING_INCDIR}
> > > > > > +    export STAGING_LIBDIR=3D${STAGING_LIBDIR} }
> > > > > > +
> > > > > > +do_install_append() {
> > > > > > +    install -d ${D}/${sysconfdir}/init.d
> > > > > > +    install -m 755 ${B}/etc/init/openwsmand.sh
> > > > > ${D}/${sysconfdir}/init.d/openwsmand
> > > > > > +    ln -sf ${sysconfdir}/init.d/openwsmand
> > > > > > +${D}/${sbindir}/rcopenwsmand
> > > > > > +
> > > > > > +    if
> > > > > > + ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)
> > > > > > + };
> > > > > then
> > > > > > +        install -d ${D}/${systemd_unitdir}/system
> > > > > > +        install -m 644 ${WORKDIR}/openwsmand.service
> > > > > > + ${D}/${systemd_unitdir}/system
> > > > > > +
> > > > > > +        sed -i -e 's,@SBINDIR@,${sbindir},g'
> > > > > ${D}${systemd_unitdir}/system/openwsmand.service
> > > > > > +        sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g'
> > > > > ${D}${systemd_unitdir}/system/openwsmand.service
> > > > > > +        sed -i -e 's,@LOCALSTATEDIR@,${localstatedir},g'
> > > > > ${D}${systemd_unitdir}/system/openwsmand.service
> > > > > > +    fi
> > > > > > +}
> > > > > > +
> > > > > > +FILES_${PN}-dbg +=3D "${libdir}/openwsman/plugins/.debug/ \
> > > > > > +                    ${libdir}/openwsman/authenticators/.debug/=
 \
> > > > > > +                   "
> > > > > > +
> > > > > > +INSANE_SKIP_${PN} =3D "dev-so"
> > > > > > --
> > > > > > 1.9.1
> > > > > >
> > > > > --
> > > > > -Joe MacDonald.
> > > > > :wq
> > > > --
> > > > _______________________________________________
> > > > Openembedded-devel mailing list
> > > > Openembedded-devel@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >=20
> > --
> > -Joe MacDonald.
> > :wq

--=20
-Joe MacDonald.
:wq

--n8g4imXOkfNTN/H1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJUwRFYAAoJEEn8ffcsOfaW1RwH/0YWV0Y7z9f3YY8HBpTKzK8L
Vzecs7AH8AOi1Z2HjlpOXj8cLYmGs8ZvaidtLCCJNkBqd75ZtYzHqCTXqLw8sgK3
szoCWNa2sJ4mhb5Iv16sHvf60UUSg9nOhw9CZOGAC0qfbaZ38RTz55o7MI3Vhqi3
L7xJDotaxmcLtkZdfXSWu3O/mT6XVvbH/wIFLR6zWgedNNQmSs9rPvZcSkGVqD82
QK1z6CBZOldyAdI77LFi1+jW1lcGroxVoSCHqSQlQ5dmY7YGLf70RGRAx/DvGaqZ
A9eHrSdlkLS4RYi052gc2RMppKbF5B1/6BjZ+9jdPFry3T7Hlv1sfv2X/1JwWBI=
=4Aex
-----END PGP SIGNATURE-----

--n8g4imXOkfNTN/H1--
