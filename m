Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id A2D127275B
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Jan 2015 11:18:50 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="55460998"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 02 Jan 2015 19:15:22 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t02BIFkY012347
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 2 Jan 2015 19:18:15 +0800
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD01.g08.fujitsu.local ([10.167.33.80]) with mapi id
	14.03.0181.006; Fri, 2 Jan 2015 19:18:46 +0800
From: "Lei, Maohui" <leimaohui@cn.fujitsu.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-networking][PATCH 1/2] GeoIP: add recipe
Thread-Index: AQHQINSSYjcPCuRTskCFiG8LzAyaEZynTSeAgAVsWwA=
Date: Fri, 2 Jan 2015 11:18:46 +0000
Message-ID: <1B56A49860EB2D45ADE3731B15C959FDAE1B47@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1419575006-51771-1-git-send-email-leimaohui@cn.fujitsu.com>
	<1419575006-51771-2-git-send-email-leimaohui@cn.fujitsu.com>
	<20141230082735.GB2469@jama>
In-Reply-To: <20141230082735.GB2469@jama>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.48]
MIME-Version: 1.0
Subject: Re: [meta-networking][PATCH 1/2] GeoIP: add recipe
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
X-List-Received-Date: Fri, 02 Jan 2015 11:18:56 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

Hi Martin and Joe

Thank you for reply, I will modify my patches ,and then re submit them late=
r.

Cheers

Lei Maohui



> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Martin Jansa
> Sent: Tuesday, December 30, 2014 4:28 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-networking][PATCH 1/2] GeoIP: add recipe
>=20
> On Fri, Dec 26, 2014 at 02:23:25PM +0800, leimaohui wrote:
> > From: leimh <leimaohui@cn.fujitsu.com>
> >
> > GeoIP app allow you to look up information about a given IP address.
>=20
> Please use lowercase recipe/package names, this causes many warnings:
>=20
> GeoIP-1.6.0: GeoIP-database doesn't match the [a-z0-9.+-]+ regex [pkgname=
]
> GeoIP-1.6.0: GeoIP-dbg doesn't match the [a-z0-9.+-]+ regex [pkgname]
> GeoIP-1.6.0: GeoIP-staticdev doesn't match the [a-z0-9.+-]+ regex [pkgnam=
e]
> GeoIP-1.6.0: GeoIP-dev doesn't match the [a-z0-9.+-]+ regex [pkgname]
> GeoIP-1.6.0: GeoIP-doc doesn't match the [a-z0-9.+-]+ regex [pkgname]
> GeoIP-1.6.0: GeoIP-locale doesn't match the [a-z0-9.+-]+ regex [pkgname]
> GeoIP-1.6.0: GeoIP doesn't match the [a-z0-9.+-]+ regex [pkgname]
>=20
> >
> > Signed-off-by: leimh <leimaohui@cn.fujitsu.com>
> > ---
> >  meta-networking/recipes-support/GeoIP/GeoIP.inc    | 10 ++++
> >  .../recipes-support/GeoIP/GeoIP_1.6.0.bb           | 54
> ++++++++++++++++++++++
> >  2 files changed, 64 insertions(+)
> >  create mode 100644 meta-networking/recipes-support/GeoIP/GeoIP.inc
> >  create mode 100644
> > meta-networking/recipes-support/GeoIP/GeoIP_1.6.0.bb
> >
> > diff --git a/meta-networking/recipes-support/GeoIP/GeoIP.inc
> > b/meta-networking/recipes-support/GeoIP/GeoIP.inc
> > new file mode 100644
> > index 0000000..d52f1f2
> > --- /dev/null
> > +++ b/meta-networking/recipes-support/GeoIP/GeoIP.inc
> > @@ -0,0 +1,10 @@
> > +SUMMARY =3D "C library for country/city/organization to IP address or =
hostname
> mapping"
> > +DESCRIPTION =3D "GeoIP is a C library that enables the user to find th=
e
> > +country that any IP\ address or hostname originates from. It uses a
> > +file based database that is\ accurate as of March 2003. This database
> > +simply contains IP blocks as keys, and\ countries as values. This
> > +database should be more complete and accurate than\ using reverse DNS
> lookups."
> > +
> > +HOMEPAGE =3D "http://www.maxmind.com/app/c"
> > +SECTION =3D "Development/Libraries"
> > +
> > diff --git a/meta-networking/recipes-support/GeoIP/GeoIP_1.6.0.bb
> > b/meta-networking/recipes-support/GeoIP/GeoIP_1.6.0.bb
> > new file mode 100644
> > index 0000000..ec00d76
> > --- /dev/null
> > +++ b/meta-networking/recipes-support/GeoIP/GeoIP_1.6.0.bb
> > @@ -0,0 +1,54 @@
> > +require GeoIP.inc
> > +
> > +SRC_URI =3D
> "http://www.maxmind.com/download/geoip/api/c/GeoIP-1.6.0.tar.gz;name=3Dta=
rba
> ll \
> > +
> http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.d=
a
> t.gz;apply=3Dno;name=3DGeoIP-dat \
> > +
> http://geolite.maxmind.com/download/geoip/database/GeoIPv6.dat.gz;apply=
=3Dno
> ;name=3DGeoIPv6-dat \
> > +
> http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz;app=
l
> y=3Dno;name=3DGeoLiteCity-dat \
> > +
> http://geolite.maxmind.com/download/geoip/database/GeoLiteCityv6-beta/Geo=
L
> iteCityv6.dat.gz;apply=3Dno;name=3DGeoLiteCityv6-dat \
> > +          "
> > +
> > +SRC_URI[tarball.md5sum] =3D "89f4cdfdab43f1d67364cd7c85bbe8ca"
> > +SRC_URI[tarball.sha256sum] =3D
> "075a0c2815cd099e9ec35c9569db716a3fefcdbb6a10dbfa1ce7c6cd48d4a635"
> > +
> > +SRC_URI[GeoIP-dat.md5sum] =3D "53416cd33e556a8048ac522fc9a98e05"
> > +SRC_URI[GeoIP-dat.sha256sum] =3D
> "a423a0c87bf9a78ef8d68153b424987c6bbddec85b5f784ca747706f4df10361"
> > +
> > +SRC_URI[GeoIPv6-dat.md5sum] =3D "f1a4abf4015c0300267f4717c9d7ead2"
> > +SRC_URI[GeoIPv6-dat.sha256sum] =3D
> "1a8e61732e39ac9d9acc20d648b2530d7bd0ff1c250f51fd18148931fbfe2830"
> > +
> > +SRC_URI[GeoLiteCity-dat.md5sum] =3D "48af3b8a204d7c5f8e42a4f5f4dd1874"
> > +SRC_URI[GeoLiteCity-dat.sha256sum] =3D
> "2f3f62f171c333cdd4e68534585e51978cb3a12dc7b269786f50daf10071d7d6"
> > +
> > +SRC_URI[GeoLiteCityv6-dat.md5sum] =3D "a42504adfd8030c3a10f749191598b4=
a"
> > +SRC_URI[GeoLiteCityv6-dat.sha256sum] =3D
> "4a5eeaa4a9107e6ccdbe94ad1c7c987dc70cd250cd40624ada1e3a03836bbbdb"
> > +
> > +
> > +LICENSE =3D "LGPL-2.1"
> > +
> > +LIC_FILES_CHKSUM =3D "\
> > +file://COPYING;md5=3Dd5d53d6b948c064f4070183180a4fa89 \
> > +file://LICENSE;md5=3Df04db71812ba70aaba8b38da91984cd2 \ "
> > +
> > +S =3D "${WORKDIR}/${PN}-1.6.0"
> > +
> > +inherit autotools
> > +
> > +EXTRA_OECONF =3D "\
> > +        --disable-static               \
> > +        --disable-dependency-tracking  \ "
> > +
> > +do_install() {
> > +    make DESTDIR=3D${D} install
> > +    install -d ${D}/${datadir}/GeoIP
> > +    install ${WORKDIR}/GeoIP.dat ${D}/${datadir}/GeoIP/
> > +    install ${WORKDIR}/GeoIPv6.dat ${D}/${datadir}/GeoIP/
> > +    install ${WORKDIR}/GeoLiteCity.dat ${D}/${datadir}/GeoIP/
> > +    install ${WORKDIR}/GeoLiteCityv6.dat ${D}/${datadir}/GeoIP/ }
> > +
> > +PACKAGES =3D+ "${PN}-database"
> > +FILES_${PN}-database =3D ""
> > +FILES_${PN}-database +=3D "${datadir}/GeoIP/*"
> > +
> > --
> > 1.9.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

