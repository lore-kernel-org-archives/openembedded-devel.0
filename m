Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 60889726CF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Dec 2014 08:27:36 +0000 (UTC)
Received: by mail-wi0-f170.google.com with SMTP id bs8so25181834wib.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Dec 2014 00:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=B31HwXqOjNH/7CoipjXdmOYyD7yKtJV4O6VeBBCdap8=;
	b=vEIhvtN+WSL0VySOS3hyBWoP9QsXoN39PcVNdz2mgfcLo3E+nOSPLTOCKSkblmKaa7
	zD91b52u2soChqxYddh1E6eyaNLsD5QE1POSyClJXLnCdCZcXigSujGoVYyrzMyRQYM+
	rEYc+UUQe3hfvBr2TIKVrAcIvLVYXe4vOIC9mcXtQ5ITOrJtkbnVRWBLLIVRPsFzR2hR
	k3B9Ks5ydGR1mmzWDKSLjFp84ferFdgBpy8QwszH71MCJJBOgtJjyLDIMEwUnnuEeCt4
	QuyzNvdwoV2tSbdXn8UmrXp6RjUDcWVHNAuXdRk+4YMRzpzWEPWdaO94osKIIMPLGqRs
	B4rA==
X-Received: by 10.180.91.193 with SMTP id cg1mr104357921wib.26.1419928056020; 
	Tue, 30 Dec 2014 00:27:36 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ck7sm52956290wjb.13.2014.12.30.00.27.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Dec 2014 00:27:35 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 30 Dec 2014 09:27:35 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141230082735.GB2469@jama>
References: <1419575006-51771-1-git-send-email-leimaohui@cn.fujitsu.com>
	<1419575006-51771-2-git-send-email-leimaohui@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1419575006-51771-2-git-send-email-leimaohui@cn.fujitsu.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
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
X-List-Received-Date: Tue, 30 Dec 2014 08:27:44 -0000
X-Groupsio-MsgNum: 53525
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="H+4ONPRPur6+Ovig"
Content-Disposition: inline

--H+4ONPRPur6+Ovig
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 26, 2014 at 02:23:25PM +0800, leimaohui wrote:
> From: leimh <leimaohui@cn.fujitsu.com>
>=20
> GeoIP app allow you to look up information about a given IP address.

Please use lowercase recipe/package names, this causes many warnings:

GeoIP-1.6.0: GeoIP-database doesn't match the [a-z0-9.+-]+ regex [pkgname]
GeoIP-1.6.0: GeoIP-dbg doesn't match the [a-z0-9.+-]+ regex [pkgname]
GeoIP-1.6.0: GeoIP-staticdev doesn't match the [a-z0-9.+-]+ regex [pkgname]
GeoIP-1.6.0: GeoIP-dev doesn't match the [a-z0-9.+-]+ regex [pkgname]
GeoIP-1.6.0: GeoIP-doc doesn't match the [a-z0-9.+-]+ regex [pkgname]
GeoIP-1.6.0: GeoIP-locale doesn't match the [a-z0-9.+-]+ regex [pkgname]
GeoIP-1.6.0: GeoIP doesn't match the [a-z0-9.+-]+ regex [pkgname]

>=20
> Signed-off-by: leimh <leimaohui@cn.fujitsu.com>
> ---
>  meta-networking/recipes-support/GeoIP/GeoIP.inc    | 10 ++++
>  .../recipes-support/GeoIP/GeoIP_1.6.0.bb           | 54 ++++++++++++++++=
++++++
>  2 files changed, 64 insertions(+)
>  create mode 100644 meta-networking/recipes-support/GeoIP/GeoIP.inc
>  create mode 100644 meta-networking/recipes-support/GeoIP/GeoIP_1.6.0.bb
>=20
> diff --git a/meta-networking/recipes-support/GeoIP/GeoIP.inc b/meta-netwo=
rking/recipes-support/GeoIP/GeoIP.inc
> new file mode 100644
> index 0000000..d52f1f2
> --- /dev/null
> +++ b/meta-networking/recipes-support/GeoIP/GeoIP.inc
> @@ -0,0 +1,10 @@
> +SUMMARY =3D "C library for country/city/organization to IP address or ho=
stname mapping"
> +DESCRIPTION =3D "GeoIP is a C library that enables the user to find the =
country that any IP\
> +address or hostname originates from. It uses a file based database that =
is\
> +accurate as of March 2003. This database simply contains IP blocks as ke=
ys, and\
> +countries as values. This database should be more complete and accurate =
than\
> +using reverse DNS lookups."
> +
> +HOMEPAGE =3D "http://www.maxmind.com/app/c"
> +SECTION =3D "Development/Libraries"
> +
> diff --git a/meta-networking/recipes-support/GeoIP/GeoIP_1.6.0.bb b/meta-=
networking/recipes-support/GeoIP/GeoIP_1.6.0.bb
> new file mode 100644
> index 0000000..ec00d76
> --- /dev/null
> +++ b/meta-networking/recipes-support/GeoIP/GeoIP_1.6.0.bb
> @@ -0,0 +1,54 @@
> +require GeoIP.inc
> +
> +SRC_URI =3D "http://www.maxmind.com/download/geoip/api/c/GeoIP-1.6.0.tar=
=2Egz;name=3Dtarball \
> +           http://geolite.maxmind.com/download/geoip/database/GeoLiteCou=
ntry/GeoIP.dat.gz;apply=3Dno;name=3DGeoIP-dat \
> +           http://geolite.maxmind.com/download/geoip/database/GeoIPv6.da=
t.gz;apply=3Dno;name=3DGeoIPv6-dat \
> +           http://geolite.maxmind.com/download/geoip/database/GeoLiteCit=
y.dat.gz;apply=3Dno;name=3DGeoLiteCity-dat \
> +           http://geolite.maxmind.com/download/geoip/database/GeoLiteCit=
yv6-beta/GeoLiteCityv6.dat.gz;apply=3Dno;name=3DGeoLiteCityv6-dat \
> +          "
> +
> +SRC_URI[tarball.md5sum] =3D "89f4cdfdab43f1d67364cd7c85bbe8ca"
> +SRC_URI[tarball.sha256sum] =3D "075a0c2815cd099e9ec35c9569db716a3fefcdbb=
6a10dbfa1ce7c6cd48d4a635"
> +
> +SRC_URI[GeoIP-dat.md5sum] =3D "53416cd33e556a8048ac522fc9a98e05"
> +SRC_URI[GeoIP-dat.sha256sum] =3D "a423a0c87bf9a78ef8d68153b424987c6bbdde=
c85b5f784ca747706f4df10361"
> +
> +SRC_URI[GeoIPv6-dat.md5sum] =3D "f1a4abf4015c0300267f4717c9d7ead2"
> +SRC_URI[GeoIPv6-dat.sha256sum] =3D "1a8e61732e39ac9d9acc20d648b2530d7bd0=
ff1c250f51fd18148931fbfe2830"
> +
> +SRC_URI[GeoLiteCity-dat.md5sum] =3D "48af3b8a204d7c5f8e42a4f5f4dd1874"
> +SRC_URI[GeoLiteCity-dat.sha256sum] =3D "2f3f62f171c333cdd4e68534585e5197=
8cb3a12dc7b269786f50daf10071d7d6"
> +
> +SRC_URI[GeoLiteCityv6-dat.md5sum] =3D "a42504adfd8030c3a10f749191598b4a"
> +SRC_URI[GeoLiteCityv6-dat.sha256sum] =3D "4a5eeaa4a9107e6ccdbe94ad1c7c98=
7dc70cd250cd40624ada1e3a03836bbbdb"
> +
> +
> +LICENSE =3D "LGPL-2.1"
> +
> +LIC_FILES_CHKSUM =3D "\
> +file://COPYING;md5=3Dd5d53d6b948c064f4070183180a4fa89 \
> +file://LICENSE;md5=3Df04db71812ba70aaba8b38da91984cd2 \
> +"
> +
> +S =3D "${WORKDIR}/${PN}-1.6.0"
> +
> +inherit autotools
> +
> +EXTRA_OECONF =3D "\
> +        --disable-static               \
> +        --disable-dependency-tracking  \
> +"
> +
> +do_install() {
> +    make DESTDIR=3D${D} install
> +    install -d ${D}/${datadir}/GeoIP
> +    install ${WORKDIR}/GeoIP.dat ${D}/${datadir}/GeoIP/
> +    install ${WORKDIR}/GeoIPv6.dat ${D}/${datadir}/GeoIP/
> +    install ${WORKDIR}/GeoLiteCity.dat ${D}/${datadir}/GeoIP/
> +    install ${WORKDIR}/GeoLiteCityv6.dat ${D}/${datadir}/GeoIP/
> +}
> +
> +PACKAGES =3D+ "${PN}-database"
> +FILES_${PN}-database =3D ""
> +FILES_${PN}-database +=3D "${datadir}/GeoIP/*"
> +
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--H+4ONPRPur6+Ovig
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSiYfcACgkQN1Ujt2V2gBzKwACfYKyg5Zx7wj+/pktXy+u2s7dU
+REAn1HqSvlzrwF8aRWu8lCO9TRMZ52e
=Gjv7
-----END PGP SIGNATURE-----

--H+4ONPRPur6+Ovig--
