Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 2FE6765CF4
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jan 2015 10:07:11 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="55544307"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Jan 2015 18:03:47 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t05A6dTw016913
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 5 Jan 2015 18:06:39 +0800
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD03.g08.fujitsu.local ([10.167.33.85]) with mapi id
	14.03.0181.006; Mon, 5 Jan 2015 18:07:12 +0800
From: "Lei, Maohui" <leimaohui@cn.fujitsu.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH 3/3] dlm: add a new recipe
Thread-Index: AQHQKLgdzjRnU3XuvUmfTHVrERJBjZywtTQAgACTRfA=
Date: Mon, 5 Jan 2015 10:07:14 +0000
Message-ID: <1B56A49860EB2D45ADE3731B15C959FDAE36F1@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1420442394-39127-1-git-send-email-leimaohui@cn.fujitsu.com>
	<1420442394-39127-4-git-send-email-leimaohui@cn.fujitsu.com>
	<20150105090248.GD2484@jama>
In-Reply-To: <20150105090248.GD2484@jama>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.48]
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH 3/3] dlm: add a new recipe
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
X-List-Received-Date: Mon, 05 Jan 2015 10:07:18 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

Hi Martin

> > +SRC_URI =3D
> "https://git.fedorahosted.org/cgit/dlm.git/snapshot/dlm-${PV}.tar.xz"
>=20
> dlm-${PV} -> ${BP} but more importantly is dlm.git/snapshots "stable"?
> Doesn't it re-generated sometimes ?

The download URL comes from https://git.fedorahosted.org/cgit/dlm.git/.
Besides the latest version, the old versions are also provided by "dlm.git/=
snapshots".
Viewed the generated time of the old versions, I think it is "stable" enoug=
h.
And you know, dlm comes from fedora, I can't find a better download URL.


Cheers

Lei



> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Martin Jansa
> Sent: Monday, January 05, 2015 5:03 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-oe][PATCH 3/3] dlm: add a new recipe
>=20
> On Mon, Jan 05, 2015 at 03:19:54PM +0800, leimaohui wrote:
> > From: leimh <leimaohui@cn.fujitsu.com>
> >
> > The kernel dlm requires a user daemon to control membership.
> >
> > Signed-off-by: leimh <leimaohui@cn.fujitsu.com>
> > ---
> >  meta-oe/recipes-extended/dlm/dlm_4.0.2.bb | 47
> > +++++++++++++++++++++++++++++++
> >  1 file changed, 47 insertions(+)
> >  create mode 100644 meta-oe/recipes-extended/dlm/dlm_4.0.2.bb
> >
> > diff --git a/meta-oe/recipes-extended/dlm/dlm_4.0.2.bb
> > b/meta-oe/recipes-extended/dlm/dlm_4.0.2.bb
> > new file mode 100644
> > index 0000000..b46c357
> > --- /dev/null
> > +++ b/meta-oe/recipes-extended/dlm/dlm_4.0.2.bb
> > @@ -0,0 +1,47 @@
> > +DESCRIPTION =3D "dlm control daemon and tool"
> > +
> > +SECTION =3D "utils"
> > +HOMEPAGE =3D "https://fedorahosted.org/cluster/wiki/HomePage"
> > +
> > +SRC_URI =3D
> "https://git.fedorahosted.org/cgit/dlm.git/snapshot/dlm-${PV}.tar.xz"
>=20
> dlm-${PV} -> ${BP} but more importantly is dlm.git/snapshots "stable"?
> Doesn't it re-generated sometimes ?
> > +
> > +SRC_URI[md5sum] =3D "efc2ee6093aa6aa0a88aaad83e998a3f"
> > +SRC_URI[sha256sum] =3D
> "b89bc557aaffbab0ac005398025f247718a5589cff6574d902eaffe2b20e683e"
> > +
> > +LICENSE =3D "LGPLv2+&GPLv2&GPLv2+"
>=20
> Add spaces around &
>=20
> > +LIC_FILES_CHKSUM =3D
> "file://README.license;md5=3D8f0bbcdd678df1bce9863492b6c8832d"
> > +
> > +DEPENDS =3D "corosync systemd"
> > +
> > +inherit pkgconfig systemd
> > +
> > +SYSTEMD_SERVICE_${PN} =3D "dlm.service"
> > +SYSTEMD_AUTO_ENABLE =3D "enable"
> > +
> > +export EXTRA_OEMAKE =3D ""
> > +
> > +do_compile_prepend() {
> > +    sed -i "s/libsystemd-daemon/libsystemd/g"
> > +${S}/dlm_controld/Makefile }
> > +
> > +do_compile () {
> > +    oe_runmake 'CC=3D${CC}'
> > +}
> > +
> > +do_install_append (){
> > +	install -d ${D}${sysconfdir}/sysconfig/
> > +	install -d ${D}${sysconfdir}/init.d/
> > +	install -m 0644 ${S}/init/dlm.sysconfig
> ${D}${sysconfdir}/sysconfig/dlm
> > +	install -m 0644 ${S}/init/dlm.init ${D}${sysconfdir}/init.d/dlm
> > +
> > +	# install systemd unit files
> > +	if
> ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
> > +		install -d ${D}${systemd_unitdir}/system
> > +		install -m 0644 ${S}/init/dlm.service
> ${D}${systemd_unitdir}/system
> > +	fi
> > +}
>=20
> Use 4 spaces for indentation
>=20
> > +
> > +do_install() {
> > +    oe_runmake install DESTDIR=3D${D} LIBDIR=3D${libdir} }
> > +
> > --
> > 1.8.4.2
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

