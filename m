Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f174.google.com (mail-we0-f174.google.com
	[74.125.82.174])
	by mail.openembedded.org (Postfix) with ESMTP id F2A5772B3F
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Jan 2015 11:14:35 +0000 (UTC)
Received: by mail-we0-f174.google.com with SMTP id k48so1859299wev.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Jan 2015 03:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=c8Jv3ay2SyIA9hrUXwt3RgY+x7RIAiptlEn08fvgrOk=;
	b=TP9VSwC2cxCy2+7Mhhed4oH9biRCxiBjioBiqBpQTX7OVE3Y6BjkvzRgZfoZ8D5qJQ
	w8uF+T8MA74c4NM/q15YhIE6vDBbvo2+V1S8rjltZOrTcl3e+D8XwkMokhVKZ/ZrHK4h
	SjPVDgaS1VVhDQJEzuI+46BZ6O7Hk//LBjxlx8l7y7hjydHAj9GZZwaAqh88iBD3LFa8
	XZkMRtjv+JKGiCpX8puGFd5WUDp2TqAV4Fc+qR7CKhK+GsDskC0Mq3T4CMRWPWRYX+HQ
	yA+ranayPqObPP5dxfyoKNs2MiJXqhJUMdTuCBegqBd4PsVGalFqYBD8PaIDSAney06/
	kBAg==
X-Received: by 10.180.76.201 with SMTP id m9mr58664737wiw.52.1420715670085;
	Thu, 08 Jan 2015 03:14:30 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	wr8sm5727122wjc.10.2015.01.08.03.14.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Jan 2015 03:14:28 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 8 Jan 2015 12:14:33 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150108111433.GC3972@jama>
References: <1420683572-22387-1-git-send-email-joe_macdonald@mentor.com>
	<6C286C8A-1A99-447B-BA72-C91B3F66819B@gmail.com>
MIME-Version: 1.0
In-Reply-To: <6C286C8A-1A99-447B-BA72-C91B3F66819B@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-networking][PATCH] GeoIP: change data fetching strategy
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
X-List-Received-Date: Thu, 08 Jan 2015 11:14:39 -0000
X-Groupsio-MsgNum: 53761
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bKyqfOwhbdpXa4YI"
Content-Disposition: inline

--bKyqfOwhbdpXa4YI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 07, 2015 at 07:41:06PM -0800, Khem Raj wrote:
>=20
> > On Jan 7, 2015, at 6:19 PM, Joe MacDonald <joe_macdonald@mentor.com> wr=
ote:
> >=20
> > Since the GeoIP databases are not versioned and they essentially change
> > without notice, we cannot reasonably expect the checksums to be consist=
ent
>=20
> isn=E2=80=99t this like AUTOREV ?. IMO such packages should be mirrored s=
omewhere
> regularly and used. if you maintain this recipe then please mirror the so=
urces
> somewhere and then update them regularly, but from one build to another i=
s just
> too frequent.

Agreed, we should also make sure that once PREMIRROR is fully populated
we can build without any access to network. This is breaking that
assumption and doesn't even use PREMIRROR to "cache" them.

> > from one build to the next.  Therefore, don't download them using the
> > usual wget fetcher, but do it manually at the end of the do_fetch stage
> > and place the uncompressed data files where the remainder of the build
> > expects they would've been placed.
> >=20
> > Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> > ---
> >=20
> > I considered trying to use the wget fetcher and having it skip over the
> > checksum operation and, honestly, I'd still prefer to do it that way, b=
ut
> > looking around and at the fetch2 code, it doesn't appear to be able to =
support
> > that outside of a BB_STRICT_CHECKSUM=3D"" setting, which we definitely =
don't want
> > to do here.
> >=20
> > -J.
> >=20
> > .../recipes-support/geoip/geoip_1.6.0.bb           | 36 +++++++++------=
-------
> > 1 file changed, 14 insertions(+), 22 deletions(-)
> >=20
> > diff --git a/meta-networking/recipes-support/geoip/geoip_1.6.0.bb b/met=
a-networking/recipes-support/geoip/geoip_1.6.0.bb
> > index 65e8362..71fda3b 100644
> > --- a/meta-networking/recipes-support/geoip/geoip_1.6.0.bb
> > +++ b/meta-networking/recipes-support/geoip/geoip_1.6.0.bb
> > @@ -8,28 +8,9 @@ using reverse DNS lookups."
> > HOMEPAGE =3D "http://dev.maxmind.com/geoip/"
> > SECTION =3D "Development/Libraries"
> >=20
> > -SRC_URI =3D "http://www.maxmind.com/download/geoip/api/c/GeoIP-1.6.0.t=
ar.gz;name=3Dtarball \
> > -           http://geolite.maxmind.com/download/geoip/database/GeoLiteC=
ountry/GeoIP.dat.gz;apply=3Dno;name=3DGeoIP-dat \
> > -           http://geolite.maxmind.com/download/geoip/database/GeoIPv6.=
dat.gz;apply=3Dno;name=3DGeoIPv6-dat \
> > -           http://geolite.maxmind.com/download/geoip/database/GeoLiteC=
ity.dat.gz;apply=3Dno;name=3DGeoLiteCity-dat \
> > -           http://geolite.maxmind.com/download/geoip/database/GeoLiteC=
ityv6-beta/GeoLiteCityv6.dat.gz;apply=3Dno;name=3DGeoLiteCityv6-dat \
> > -"
> > -
> > -SRC_URI[tarball.md5sum] =3D "89f4cdfdab43f1d67364cd7c85bbe8ca"
> > -SRC_URI[tarball.sha256sum] =3D "075a0c2815cd099e9ec35c9569db716a3fefcd=
bb6a10dbfa1ce7c6cd48d4a635"
> > -
> > -SRC_URI[GeoIP-dat.md5sum] =3D "4bc1e8280fe2db0adc3fe48663b8926e"
> > -SRC_URI[GeoIP-dat.sha256sum] =3D "7fd7e4829aaaae2677a7975eeecd17013419=
5e5b7e6fc7d30bf3caf34db41bcd"
> > -
> > -SRC_URI[GeoIPv6-dat.md5sum] =3D "aac7e6e9b141de80934ecee52daf7f56"
> > -SRC_URI[GeoIPv6-dat.sha256sum] =3D "126fd2953eb193e60538e30b4465610530=
383f7a782745cacdca5ba6825f471c"
> > -
> > -SRC_URI[GeoLiteCity-dat.md5sum] =3D "15a42c684c53d2309e6632a6d6e02531"
> > -SRC_URI[GeoLiteCity-dat.sha256sum] =3D "5ec02a6d39d545c77ec12cc30c6a88=
56883d8f55522fc5cd4f25af80163c6b3c"
> > -
> > -SRC_URI[GeoLiteCityv6-dat.md5sum] =3D "49d6ec946fa0a2575b5112a68d71f93=
3"
> > -SRC_URI[GeoLiteCityv6-dat.sha256sum] =3D "7a345e6cf0e59f8ab589ff150202=
41f0b03342dd04cc584f814c4f4700d49405"
> > -
> > +SRC_URI =3D "http://www.maxmind.com/download/geoip/api/c/GeoIP-1.6.0.t=
ar.gz"
> > +SRC_URI[md5sum] =3D "89f4cdfdab43f1d67364cd7c85bbe8ca"
> > +SRC_URI[sha256sum] =3D "075a0c2815cd099e9ec35c9569db716a3fefcdbb6a10db=
fa1ce7c6cd48d4a635"
> >=20
> > LICENSE =3D "LGPL-2.1"
> >=20
> > @@ -43,6 +24,17 @@ inherit autotools
> > EXTRA_OECONF =3D "--disable-static               \
> >                 --disable-dependency-tracking  "
> >=20
> > +do_fetch_append() {
> > +    os.system("${FETCHCMD_wget} http://geolite.maxmind.com/download/ge=
oip/database/GeoLiteCountry/GeoIP.dat.gz");
> > +    os.system("gunzip -c ${DL_DIR}/GeoIP.dat.gz > ${WORKDIR}/GeoIP.dat=
");
> > +    os.system("${FETCHCMD_wget} http://geolite.maxmind.com/download/ge=
oip/database/GeoIPv6.dat.gz");
> > +    os.system("gunzip -c ${DL_DIR}/GeoIPv6.dat.gz > ${WORKDIR}/GeoIPv6=
=2Edat");
> > +    os.system("${FETCHCMD_wget} http://geolite.maxmind.com/download/ge=
oip/database/GeoLiteCity.dat.gz");
> > +    os.system("gunzip -c ${DL_DIR}/GeoLiteCity.dat.gz > ${WORKDIR}/Geo=
LiteCity.dat");
> > +    os.system("${FETCHCMD_wget} http://geolite.maxmind.com/download/ge=
oip/database/GeoLiteCityv6.dat.gz");
> > +    os.system("gunzip -c ${DL_DIR}/GeoLiteCityv6.dat.gz > ${WORKDIR}/G=
eoLiteCityv6.dat");
> > +}
> > +
> > do_install() {
> >     make DESTDIR=3D${D} install
> >     install -d ${D}/${datadir}/GeoIP
> > --=20
> > 1.9.1
> >=20
> > --=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--bKyqfOwhbdpXa4YI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSuZpkACgkQN1Ujt2V2gBxwAQCeI6RuRMisvl8VKeucBHRAQiPd
XjkAnjyGoFnoCQmTYUmPfjPDhgfM/s/m
=zhmM
-----END PGP SIGNATURE-----

--bKyqfOwhbdpXa4YI--
