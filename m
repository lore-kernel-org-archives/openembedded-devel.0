Return-Path: <raj.khem@gmail.com>
Received: from mail-qc0-f175.google.com (mail-qc0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id 152D372916
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Jan 2015 03:41:09 +0000 (UTC)
Received: by mail-qc0-f175.google.com with SMTP id p6so275642qcv.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Jan 2015 19:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to;
	bh=QcjBeQ3uce6vOUzTCKzMJN8LA8XiSIH67nVNLXvNqjY=;
	b=FeZyKg8dp3rIDSCiuNFSjzirDlUw8pYPbw/syRVspYvWKZ2YeSaOKuD5d7nqAMabHa
	aInDaEhji7gy2XHNuK4qn6e64GX5tTKlKN05tTAzP3R84Lohd0bm3kq/jZvRCWkmrR/d
	mqtOZC/ErGePzj0ZHqVbiPtkjbjSuVd90McotXW+1z4DH7B61ykfkC8CFrwSRG1OrxQt
	x7A763HPdLra1Y0uci+nZE5CtMOKaKZtxoJwr0wdAjlyV7uBFiyQvaS0N2aJTBwOdPkO
	Y267260DBHMdT/qVQkGt9lGJQ11HSEczqH+qOOOq+7ewngvem3b0BNqFFfyGkg5qg/Ms
	Bb8A==
X-Received: by 10.140.91.201 with SMTP id z67mr10670585qgd.27.1420688469649;
	Wed, 07 Jan 2015 19:41:09 -0800 (PST)
Received: from ?IPv6:2601:9:3580:84c:10d:1c10:bb0:ae2b?
	([2601:9:3580:84c:10d:1c10:bb0:ae2b])
	by mx.google.com with ESMTPSA id g60sm2977714qgg.39.2015.01.07.19.41.08
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 07 Jan 2015 19:41:08 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.1 \(1993\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1420683572-22387-1-git-send-email-joe_macdonald@mentor.com>
Date: Wed, 7 Jan 2015 19:41:06 -0800
Message-Id: <6C286C8A-1A99-447B-BA72-C91B3F66819B@gmail.com>
References: <1420683572-22387-1-git-send-email-joe_macdonald@mentor.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1993)
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
X-List-Received-Date: Thu, 08 Jan 2015 03:41:12 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On Jan 7, 2015, at 6:19 PM, Joe MacDonald <joe_macdonald@mentor.com> =
wrote:
>=20
> Since the GeoIP databases are not versioned and they essentially =
change
> without notice, we cannot reasonably expect the checksums to be =
consistent

isn=E2=80=99t this like AUTOREV ?. IMO such packages should be mirrored =
somewhere
regularly and used. if you maintain this recipe then please mirror the =
sources
somewhere and then update them regularly, but from one build to another =
is just
too frequent.

> from one build to the next.  Therefore, don't download them using the
> usual wget fetcher, but do it manually at the end of the do_fetch =
stage
> and place the uncompressed data files where the remainder of the build
> expects they would've been placed.
>=20
> Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> ---
>=20
> I considered trying to use the wget fetcher and having it skip over =
the
> checksum operation and, honestly, I'd still prefer to do it that way, =
but
> looking around and at the fetch2 code, it doesn't appear to be able to =
support
> that outside of a BB_STRICT_CHECKSUM=3D"" setting, which we definitely =
don't want
> to do here.
>=20
> -J.
>=20
> .../recipes-support/geoip/geoip_1.6.0.bb           | 36 =
+++++++++-------------
> 1 file changed, 14 insertions(+), 22 deletions(-)
>=20
> diff --git a/meta-networking/recipes-support/geoip/geoip_1.6.0.bb =
b/meta-networking/recipes-support/geoip/geoip_1.6.0.bb
> index 65e8362..71fda3b 100644
> --- a/meta-networking/recipes-support/geoip/geoip_1.6.0.bb
> +++ b/meta-networking/recipes-support/geoip/geoip_1.6.0.bb
> @@ -8,28 +8,9 @@ using reverse DNS lookups."
> HOMEPAGE =3D "http://dev.maxmind.com/geoip/"
> SECTION =3D "Development/Libraries"
>=20
> -SRC_URI =3D =
"http://www.maxmind.com/download/geoip/api/c/GeoIP-1.6.0.tar.gz;name=3Dtar=
ball \
> -           =
http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.da=
t.gz;apply=3Dno;name=3DGeoIP-dat \
> -           =
http://geolite.maxmind.com/download/geoip/database/GeoIPv6.dat.gz;apply=3D=
no;name=3DGeoIPv6-dat \
> -           =
http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz;appl=
y=3Dno;name=3DGeoLiteCity-dat \
> -           =
http://geolite.maxmind.com/download/geoip/database/GeoLiteCityv6-beta/GeoL=
iteCityv6.dat.gz;apply=3Dno;name=3DGeoLiteCityv6-dat \
> -"
> -
> -SRC_URI[tarball.md5sum] =3D "89f4cdfdab43f1d67364cd7c85bbe8ca"
> -SRC_URI[tarball.sha256sum] =3D =
"075a0c2815cd099e9ec35c9569db716a3fefcdbb6a10dbfa1ce7c6cd48d4a635"
> -
> -SRC_URI[GeoIP-dat.md5sum] =3D "4bc1e8280fe2db0adc3fe48663b8926e"
> -SRC_URI[GeoIP-dat.sha256sum] =3D =
"7fd7e4829aaaae2677a7975eeecd170134195e5b7e6fc7d30bf3caf34db41bcd"
> -
> -SRC_URI[GeoIPv6-dat.md5sum] =3D "aac7e6e9b141de80934ecee52daf7f56"
> -SRC_URI[GeoIPv6-dat.sha256sum] =3D =
"126fd2953eb193e60538e30b4465610530383f7a782745cacdca5ba6825f471c"
> -
> -SRC_URI[GeoLiteCity-dat.md5sum] =3D =
"15a42c684c53d2309e6632a6d6e02531"
> -SRC_URI[GeoLiteCity-dat.sha256sum] =3D =
"5ec02a6d39d545c77ec12cc30c6a8856883d8f55522fc5cd4f25af80163c6b3c"
> -
> -SRC_URI[GeoLiteCityv6-dat.md5sum] =3D =
"49d6ec946fa0a2575b5112a68d71f933"
> -SRC_URI[GeoLiteCityv6-dat.sha256sum] =3D =
"7a345e6cf0e59f8ab589ff15020241f0b03342dd04cc584f814c4f4700d49405"
> -
> +SRC_URI =3D =
"http://www.maxmind.com/download/geoip/api/c/GeoIP-1.6.0.tar.gz"
> +SRC_URI[md5sum] =3D "89f4cdfdab43f1d67364cd7c85bbe8ca"
> +SRC_URI[sha256sum] =3D =
"075a0c2815cd099e9ec35c9569db716a3fefcdbb6a10dbfa1ce7c6cd48d4a635"
>=20
> LICENSE =3D "LGPL-2.1"
>=20
> @@ -43,6 +24,17 @@ inherit autotools
> EXTRA_OECONF =3D "--disable-static               \
>                 --disable-dependency-tracking  "
>=20
> +do_fetch_append() {
> +    os.system("${FETCHCMD_wget} =
http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.da=
t.gz");
> +    os.system("gunzip -c ${DL_DIR}/GeoIP.dat.gz > =
${WORKDIR}/GeoIP.dat");
> +    os.system("${FETCHCMD_wget} =
http://geolite.maxmind.com/download/geoip/database/GeoIPv6.dat.gz");
> +    os.system("gunzip -c ${DL_DIR}/GeoIPv6.dat.gz > =
${WORKDIR}/GeoIPv6.dat");
> +    os.system("${FETCHCMD_wget} =
http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz");
> +    os.system("gunzip -c ${DL_DIR}/GeoLiteCity.dat.gz > =
${WORKDIR}/GeoLiteCity.dat");
> +    os.system("${FETCHCMD_wget} =
http://geolite.maxmind.com/download/geoip/database/GeoLiteCityv6.dat.gz");=

> +    os.system("gunzip -c ${DL_DIR}/GeoLiteCityv6.dat.gz > =
${WORKDIR}/GeoLiteCityv6.dat");
> +}
> +
> do_install() {
>     make DESTDIR=3D${D} install
>     install -d ${D}/${datadir}/GeoIP
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


