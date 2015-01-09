Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id CA2FE65C85
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Jan 2015 00:58:04 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="55784862"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 09 Jan 2015 08:54:39 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t090vV2P001667
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 9 Jan 2015 08:57:31 +0800
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD03.g08.fujitsu.local ([10.167.33.85]) with mapi id
	14.03.0181.006; Fri, 9 Jan 2015 08:58:09 +0800
From: "Lei, Maohui" <leimaohui@cn.fujitsu.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][V2 PATCH 3/3] dlm: add a new recipe
Thread-Index: AQHQKb4XomH49ba6YU617bhsKvF8Vpy0KKkg//+xPwCAAyDRUA==
Date: Fri, 9 Jan 2015 00:58:03 +0000
Message-ID: <1B56A49860EB2D45ADE3731B15C959FDAE4A43@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1420517556-49274-1-git-send-email-leimaohui@cn.fujitsu.com>
	<1420517556-49274-4-git-send-email-leimaohui@cn.fujitsu.com>
	<20150106143529.GF19402@jama>
	<1B56A49860EB2D45ADE3731B15C959FDAE4143@G08CNEXMBPEKD01.g08.fujitsu.local>
	<20150107091016.GE29986@jama>
In-Reply-To: <20150107091016.GE29986@jama>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.48]
MIME-Version: 1.0
Subject: Re: [meta-oe][V2 PATCH 3/3] dlm: add a new recipe
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
X-List-Received-Date: Fri, 09 Jan 2015 00:58:07 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

Hi Martin

OK,I will add REQUIRED_DISTRO_FEATURES =3D "systemd" and then submit my V3 =
patch later.

Cheers
Lei


> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Martin Jansa
> Sent: Wednesday, January 07, 2015 5:10 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-oe][V2 PATCH 3/3] dlm: add a new recipe
>=20
> On Wed, Jan 07, 2015 at 06:02:48AM +0000, Lei, Maohui wrote:
> > Hi Martin
> >
> > > > +DEPENDS =3D "corosync systemd"
> > >
> > > Does it need explicit systemd dependency?
> > > https://git.fedorahosted.org/cgit/dlm.git/tree/dlm_controld/Makefile
> > > looks like yes with default USE_SD_NOTIFY
> >
> > Yes.
> >
> > >
> > > If yes, then it should be together with REQUIRED_DISTRO_FEATURES =3D
> > > "systemd"
> > > to prevent world error when systemd isn't in DISTRO_FEATURES
> > > ERROR: Nothing PROVIDES 'systemd' (but
> > > meta-oe/meta-oe/recipes-extended/dlm/dlm_4.0.2.bb DEPENDS on or
> > > otherwise requires it)
> > > ERROR: systemd was skipped: 'systemd' not in DISTRO_FEATURES
> >
> > But I think add REQUIRED_DISTRO_FEATURES can't prevent the world error.
> > Even if I add the REQUIRED_DISTRO_FEATURES =3D "systemd",the error stil=
l
> appears.
> > Unless add "system" into DISTRO_FEATURES.
>=20
> It doesn't, because dlm will be skipped just like other recipes incompati=
ble
> with distro-less configuration.
>=20
> > The following comes from
> http://www.yoctoproject.org/docs/1.7/ref-manual/ref-manual.html .
> > ********************************************************
> > REQUIRED_DISTRO_FEATURES
> > When inheriting the distro_features_check class, this variable identifi=
es
> distribution features that must exist in the current configuration in ord=
er
> for the OpenEmbedded build system to build the recipe. In other words, if=
 the
> REQUIRED_DISTRO_FEATURES variable lists a feature that does not appear in
> DISTRO_FEATURES within the current configuration, an error occurs and the=
 build
> stops.
> > ********************************************************
> >
> >
> > Cheers
> > Lei
> >
> >
> > > -----Original Message-----
> > > From: openembedded-devel-bounces@lists.openembedded.org
> > > [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf
> > > Of Martin Jansa
> > > Sent: Tuesday, January 06, 2015 10:35 PM
> > > To: openembedded-devel@lists.openembedded.org
> > > Subject: Re: [oe] [meta-oe][V2 PATCH 3/3] dlm: add a new recipe
> > >
> > > On Tue, Jan 06, 2015 at 12:12:36PM +0800, leimaohui wrote:
> > > > From: leimh <leimaohui@cn.fujitsu.com>
> > > >
> > > > The kernel dlm requires a user daemon to control membership.
> > > >
> > > > Signed-off-by: leimh <leimaohui@cn.fujitsu.com>
> > > > ---
> > > >  meta-oe/recipes-extended/dlm/dlm_4.0.2.bb | 47
> > > > +++++++++++++++++++++++++++++++
> > > >  1 file changed, 47 insertions(+)
> > > >  create mode 100644 meta-oe/recipes-extended/dlm/dlm_4.0.2.bb
> > > >
> > > > diff --git a/meta-oe/recipes-extended/dlm/dlm_4.0.2.bb
> > > > b/meta-oe/recipes-extended/dlm/dlm_4.0.2.bb
> > > > new file mode 100644
> > > > index 0000000..774f136
> > > > --- /dev/null
> > > > +++ b/meta-oe/recipes-extended/dlm/dlm_4.0.2.bb
> > > > @@ -0,0 +1,47 @@
> > > > +DESCRIPTION =3D "dlm control daemon and tool"
> > > > +
> > > > +SECTION =3D "utils"
> > > > +HOMEPAGE =3D "https://fedorahosted.org/cluster/wiki/HomePage"
> > > > +
> > > > +SRC_URI =3D
> > > "https://git.fedorahosted.org/cgit/dlm.git/snapshot/${BP}.tar.xz"
> > > > +
> > > > +SRC_URI[md5sum] =3D "efc2ee6093aa6aa0a88aaad83e998a3f"
> > > > +SRC_URI[sha256sum] =3D
> > > "b89bc557aaffbab0ac005398025f247718a5589cff6574d902eaffe2b20e683e"
> > > > +
> > > > +LICENSE =3D "LGPLv2+ & GPLv2 & GPLv2+"
> > > > +LIC_FILES_CHKSUM =3D
> > > "file://README.license;md5=3D8f0bbcdd678df1bce9863492b6c8832d"
> > > > +
> > > > +DEPENDS =3D "corosync systemd"
> > >
> > > Does it need explicit systemd dependency?
> > > https://git.fedorahosted.org/cgit/dlm.git/tree/dlm_controld/Makefile
> > > looks like yes with default USE_SD_NOTIFY
> > >
> > > If yes, then it should be together with REQUIRED_DISTRO_FEATURES =3D
> > > "systemd"
> > > to prevent world error when systemd isn't in DISTRO_FEATURES
> > > ERROR: Nothing PROVIDES 'systemd' (but
> > > meta-oe/meta-oe/recipes-extended/dlm/dlm_4.0.2.bb DEPENDS on or
> > > otherwise requires it)
> > > ERROR: systemd was skipped: 'systemd' not in DISTRO_FEATURES
> > >
> > > > +
> > > > +inherit pkgconfig systemd
> > > > +
> > > > +SYSTEMD_SERVICE_${PN} =3D "dlm.service"
> > > > +SYSTEMD_AUTO_ENABLE =3D "enable"
> > > > +
> > > > +export EXTRA_OEMAKE =3D ""
> > > > +
> > > > +do_compile_prepend() {
> > > > +    sed -i "s/libsystemd-daemon/libsystemd/g"
> > > > +${S}/dlm_controld/Makefile }
> > > > +
> > > > +do_compile () {
> > > > +    oe_runmake 'CC=3D${CC}'
> > > > +}
> > > > +
> > > > +do_install_append (){
> > > > +    install -d ${D}${sysconfdir}/sysconfig/
> > > > +    install -d ${D}${sysconfdir}/init.d/
> > > > +    install -m 0644 ${S}/init/dlm.sysconfig
> > > ${D}${sysconfdir}/sysconfig/dlm
> > > > +    install -m 0644 ${S}/init/dlm.init
> > > > + ${D}${sysconfdir}/init.d/dlm
> > > > +
> > > > +    # install systemd unit files
> > > > +    if
> > > > + ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)};
> > > then
> > > > +        install -d ${D}${systemd_unitdir}/system
> > > > +        install -m 0644 ${S}/init/dlm.service
> > > ${D}${systemd_unitdir}/system
> > > > +    fi
> > > > +}
> > > > +
> > > > +do_install() {
> > > > +    oe_runmake install DESTDIR=3D${D} LIBDIR=3D${libdir} }
> > > > +
> > > > --
> > > > 1.8.4.2
> > > >
> > > > --
> > > > _______________________________________________
> > > > Openembedded-devel mailing list
> > > > Openembedded-devel@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > >
> > > --
> > > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

