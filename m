Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id D1D3660034
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Mar 2015 13:35:16 +0000 (UTC)
Received: from svr-orw-fem-04.mgc.mentorg.com ([147.34.97.41])
	by relay1.mentorg.com with esmtp 
	id 1YYE7x-0001UB-3s from Joe_MacDonald@mentor.com ;
	Wed, 18 Mar 2015 06:35:17 -0700
Received: from burninator (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 18 Mar 2015 06:35:16 -0700
Received: by burninator (Postfix, from userid 1000)	id 78C4E581815; Wed, 18
	Mar 2015 09:35:26 -0400 (EDT)
Date: Wed, 18 Mar 2015 09:35:26 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20150318133526.GC4756@mentor.com>
References: <20150107190635.8482C5028F@opal.openembedded.org>
	<20150318115652.GB4738@jama>
MIME-Version: 1.0
In-Reply-To: <20150318115652.GB4738@jama>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] Joe MacDonald : GeoIP: update checksums
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
X-List-Received-Date: Wed, 18 Mar 2015 13:35:22 -0000
X-Groupsio-MsgNum: 54821
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1SQmhf2mF2YjsYvc"
Content-Disposition: inline

--1SQmhf2mF2YjsYvc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe-commits] Joe MacDonald : GeoIP: update checksums] On 15.03.18 (Wed=
 12:56) Martin Jansa wrote:

> On Wed, Jan 07, 2015 at 07:06:35PM +0000, git@git.openembedded.org wrote:
> > Module: meta-openembedded.git
> > Branch: master
> > Commit: b5afd31f7637f8a206b720f332d115c5a395cafc
> > URL:    http://git.openembedded.org/?p=3Dmeta-openembedded.git&a=3Dcomm=
it;h=3Db5afd31f7637f8a206b720f332d115c5a395cafc
> >=20
> > Author: Joe MacDonald <joe_macdonald@mentor.com>
> > Date:   Wed Jan  7 12:20:07 2015 -0500
> >=20
> > GeoIP: update checksums
> >=20
> > The raw IP databases have been updated, so for the time being just upda=
te
> > the checksums.
> >=20
> > Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
>=20
> GeoIP.dat.gz was update again

Hmm.  So I sunk a bit more time in trying to clean this up as we
discussed in January, but I can't see any path that lets me co-opt
AUTOREV into working here, as it appears intended to be used solely with
SCM-managed downloads (which makes sense, what's being done with these
tarballs is a crime, if you ask me).

So for now I've committed the updated checksums as a band-aid and I'll
revisit one of the more complicated options before they update the
tarballs again, I hope.

-J.

>=20
> ERROR: Fetcher failure for URL: 'http://geolite.maxmind.com/download/geoi=
p/database/GeoLiteCountry/GeoIP.dat.gz;apply=3Dno;name=3DGeoIP-dat'. Checks=
um mismatch!
> File: '/home/jenkins/oe/world/shr-core/downloads/GeoIP.dat.gz' has md5 ch=
ecksum 37c84ead332dda0362a5ac7b049b72d4 when 4bc1e8280fe2db0adc3fe48663b892=
6e was expected
> File: '/home/jenkins/oe/world/shr-core/downloads/GeoIP.dat.gz' has sha256=
 checksum 79ff1099e96c2dc1c2539c9a18aaa13a9afd085cae477df60d95f1644d42bc07 =
when 7fd7e4829aaaae2677a7975eeecd170134195e5b7e6fc7d30bf3caf34db41bcd was e=
xpected
> If this change is expected (e.g. you have upgraded to a new version witho=
ut updating the checksums) then you can use these lines within the recipe:
> SRC_URI[GeoIP-dat.md5sum] =3D "37c84ead332dda0362a5ac7b049b72d4"
> SRC_URI[GeoIP-dat.sha256sum] =3D "79ff1099e96c2dc1c2539c9a18aaa13a9afd085=
cae477df60d95f1644d42bc07"
> Otherwise you should retry the download and/or check with upstream to det=
ermine if the file has become corrupted or otherwise unexpectedly modified.
>=20
> ERROR: Function failed: Fetcher failure for URL: 'http://geolite.maxmind.=
com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz;apply=3Dno;name=3DG=
eoIP-dat'. Unable to fetch URL from any source.
> ERROR: Logfile of failure stored in: /home/jenkins/oe/world/shr-core/tmp-=
glibc/work/i586-oe-linux/geoip/1.6.0-r0/temp/log.do_fetch.11727
> NOTE: recipe geoip-1.6.0-r0: task do_fetch: Failed
> NOTE: recipe asio-1.10.1-r0: task do_patch: Started
> ERROR: Task 485 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-n=
etworking/recipes-support/geoip/geoip_1.6.0.bb, do_fetch) failed with exit =
code '1'
>=20
> >=20
> > ---
> >=20
> >  meta-networking/recipes-support/geoip/geoip_1.6.0.bb | 16 ++++++++----=
----
> >  1 file changed, 8 insertions(+), 8 deletions(-)
> >=20
> > diff --git a/meta-networking/recipes-support/geoip/geoip_1.6.0.bb b/met=
a-networking/recipes-support/geoip/geoip_1.6.0.bb
> > index 782d2e7..65e8362 100644
> > --- a/meta-networking/recipes-support/geoip/geoip_1.6.0.bb
> > +++ b/meta-networking/recipes-support/geoip/geoip_1.6.0.bb
> > @@ -18,17 +18,17 @@ SRC_URI =3D "http://www.maxmind.com/download/geoip/=
api/c/GeoIP-1.6.0.tar.gz;name=3Dt
> >  SRC_URI[tarball.md5sum] =3D "89f4cdfdab43f1d67364cd7c85bbe8ca"
> >  SRC_URI[tarball.sha256sum] =3D "075a0c2815cd099e9ec35c9569db716a3fefcd=
bb6a10dbfa1ce7c6cd48d4a635"
> > =20
> > -SRC_URI[GeoIP-dat.md5sum] =3D "53416cd33e556a8048ac522fc9a98e05"
> > -SRC_URI[GeoIP-dat.sha256sum] =3D "a423a0c87bf9a78ef8d68153b424987c6bbd=
dec85b5f784ca747706f4df10361"
> > +SRC_URI[GeoIP-dat.md5sum] =3D "4bc1e8280fe2db0adc3fe48663b8926e"
> > +SRC_URI[GeoIP-dat.sha256sum] =3D "7fd7e4829aaaae2677a7975eeecd17013419=
5e5b7e6fc7d30bf3caf34db41bcd"
> > =20
> > -SRC_URI[GeoIPv6-dat.md5sum] =3D "f1a4abf4015c0300267f4717c9d7ead2"
> > -SRC_URI[GeoIPv6-dat.sha256sum] =3D "1a8e61732e39ac9d9acc20d648b2530d7b=
d0ff1c250f51fd18148931fbfe2830"
> > +SRC_URI[GeoIPv6-dat.md5sum] =3D "aac7e6e9b141de80934ecee52daf7f56"
> > +SRC_URI[GeoIPv6-dat.sha256sum] =3D "126fd2953eb193e60538e30b4465610530=
383f7a782745cacdca5ba6825f471c"
> > =20
> > -SRC_URI[GeoLiteCity-dat.md5sum] =3D "48af3b8a204d7c5f8e42a4f5f4dd1874"
> > -SRC_URI[GeoLiteCity-dat.sha256sum] =3D "2f3f62f171c333cdd4e68534585e51=
978cb3a12dc7b269786f50daf10071d7d6"
> > +SRC_URI[GeoLiteCity-dat.md5sum] =3D "15a42c684c53d2309e6632a6d6e02531"
> > +SRC_URI[GeoLiteCity-dat.sha256sum] =3D "5ec02a6d39d545c77ec12cc30c6a88=
56883d8f55522fc5cd4f25af80163c6b3c"
> > =20
> > -SRC_URI[GeoLiteCityv6-dat.md5sum] =3D "a42504adfd8030c3a10f749191598b4=
a"
> > -SRC_URI[GeoLiteCityv6-dat.sha256sum] =3D "4a5eeaa4a9107e6ccdbe94ad1c7c=
987dc70cd250cd40624ada1e3a03836bbbdb"
> > +SRC_URI[GeoLiteCityv6-dat.md5sum] =3D "49d6ec946fa0a2575b5112a68d71f93=
3"
> > +SRC_URI[GeoLiteCityv6-dat.sha256sum] =3D "7a345e6cf0e59f8ab589ff150202=
41f0b03342dd04cc584f814c4f4700d49405"
> > =20
> > =20
> >  LICENSE =3D "LGPL-2.1"
> >=20
> > --=20
> > _______________________________________________
> > Openembedded-commits mailing list
> > Openembedded-commits@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>=20
--=20
-Joe MacDonald.
:wq

--1SQmhf2mF2YjsYvc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJVCX8eAAoJEEn8ffcsOfaWVDMIAJFlyLoajIHiWpHAWCSyB5Dv
P6q22AkVt6O8ftym6tGK7UE7uxaLyaCCIUGtP4RZZrFMiQ2U8G8upV0rqSR5lUm7
EIj7z4MyOqgXYYsaPs24i9KAoTOKrFiDSnqkqN4LrlaF9WscRXeroiniW+kK2wwB
U4ckHisMbGlY16Ho2k8n3ITxoTjvZVkoSqSVkETADmsLyE7Bsd82HQVz+CnJHMT+
BWLYxPohTD7517W6/NFrkiDPPxCdmqb+50O955aVEA81OwbpP1SO181fwaGJkJX9
0jZRoHbcKEpDJUxXy1+twkZ/wX4dwTIqqSR/25s9y3OehTpgcC0hTxCnejIcAGs=
=PmFt
-----END PGP SIGNATURE-----

--1SQmhf2mF2YjsYvc--
