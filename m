Return-Path: <cristian.iorga@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id F32EA65E94
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Oct 2014 07:15:23 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 24 Oct 2014 00:15:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,778,1406617200"; d="scan'208";a="610465099"
Received: from irsmsx102.ger.corp.intel.com ([163.33.3.155])
	by fmsmga001.fm.intel.com with ESMTP; 24 Oct 2014 00:14:45 -0700
Received: from irsmsx106.ger.corp.intel.com (163.33.3.31) by
	IRSMSX102.ger.corp.intel.com (163.33.3.155) with Microsoft SMTP Server
	(TLS) id 14.3.195.1; Fri, 24 Oct 2014 08:14:45 +0100
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.56]) by
	IRSMSX106.ger.corp.intel.com ([169.254.8.179]) with mapi id
	14.03.0195.001; Fri, 24 Oct 2014 08:14:44 +0100
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [PATCH] mpd: upgrade to 0.19.1
Thread-Index: AQHP7uAnD9MPQzS4P0amhl3zZ+u5W5w99GOAgADhZrA=
Date: Fri, 24 Oct 2014 07:14:44 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB2F379BA8@IRSMSX105.ger.corp.intel.com>
References: <1414082432-14111-1-git-send-email-cristian.iorga@intel.com>
	<1414082432-14111-3-git-send-email-cristian.iorga@intel.com>
	<20141023184501.GA2430@jama>
In-Reply-To: <20141023184501.GA2430@jama>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.181]
MIME-Version: 1.0
Cc: Cristian Iorga <ubik3000@gmail.com>
Subject: Re: [PATCH] mpd: upgrade to 0.19.1
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
X-List-Received-Date: Fri, 24 Oct 2014 07:15:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Yeah, it's the same. Somehow I cannot properly control the git/signatures/i=
dentities environment, because some of the work that was submitted it was d=
one in my spare time, not under Intel's time.
But I certify that I tested properly. Please ignore this patch, is included=
 in the other patchset.

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedde=
d-devel-bounces@lists.openembedded.org] On Behalf Of Martin Jansa
Sent: Thursday, October 23, 2014 9:45 PM
To: openembedded-devel@lists.openembedded.org
Cc: Cristian Iorga
Subject: Re: [oe] [PATCH] mpd: upgrade to 0.19.1

On Thu, Oct 23, 2014 at 07:40:30PM +0300, Cristian Iorga wrote:
> From: Cristian Iorga <ubik3000@gmail.com>
>=20
> - Added icu and boost as dependencies;

This one is replaced by the 3 patches, right?

Please mark it as such in patchwork.

> Signed-off-by: Cristian Iorga <ubik3000@gmail.com>
> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> ---
>  .../mpg123/{mpg123_1.19.0.bb =3D> mpg123_1.21.0.bb}                | 4 +=
+--
>  .../recipes-multimedia/musicpd/{mpd_0.18.9.bb =3D> mpd_0.19.1.bb}  | 9=20
> ++++-----
>  2 files changed, 6 insertions(+), 7 deletions(-)  rename=20
> meta-multimedia/recipes-multimedia/mpg123/{mpg123_1.19.0.bb =3D>=20
> mpg123_1.21.0.bb} (94%)  rename=20
> meta-multimedia/recipes-multimedia/musicpd/{mpd_0.18.9.bb =3D>=20
> mpd_0.19.1.bb} (89%)
>=20
> diff --git=20
> a/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.19.0.bb=20
> b/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.21.0.bb
> similarity index 94%
> rename from meta-multimedia/recipes-multimedia/mpg123/mpg123_1.19.0.bb
> rename to meta-multimedia/recipes-multimedia/mpg123/mpg123_1.21.0.bb
> index e669446..4efdeab 100644
> --- a/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.19.0.bb
> +++ b/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.21.0.bb
> @@ -36,8 +36,8 @@ LICENSE_FLAGS =3D "commercial"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1e86753638d3cf2512528b99079bc=
4f3"
> =20
>  SRC_URI =3D "${SOURCEFORGE_MIRROR}/mpg123/mpg123/${PV}/${BP}.tar.bz2"
> -SRC_URI[md5sum] =3D "87731f1437cfd8c50537a606d81130e4"
> -SRC_URI[sha256sum] =3D "869024e01d7cb4dae1aea2f2a10420d4be7e1ac02a9c434d=
06d727599169b01b"
> +SRC_URI[md5sum] =3D "13a9df5d4e7aa110e4ae27cf30128ce9"
> +SRC_URI[sha256sum] =3D "3ad197f77c9ffdf3601e1c3183ae0709ccb3c3de68309527=
ce9375fcfb15dcba"
> =20
>  inherit autotools pkgconfig
> =20
> diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.9.bb=20
> b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.1.bb
> similarity index 89%
> rename from meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.9.bb
> rename to meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.1.bb
> index 997a421..d05deaa 100644
> --- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.9.bb
> +++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.1.bb
> @@ -3,15 +3,14 @@ LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882=
bbe"
>  HOMEPAGE =3D"http://www.musicpd.org"
> =20
> -DEPENDS =3D "alsa-lib libsamplerate0 libsndfile1 libvorbis libogg faad2 =
ffmpeg curl sqlite bzip2 pulseaudio tcp-wrappers openal-soft yajl jack faad=
2 flac libao fluidsynth libcdio wavpack libopus mpg123 libmms libmodplug"
> +DEPENDS =3D "alsa-lib libsamplerate0 libsndfile1 libvorbis libogg faad2 =
ffmpeg curl sqlite bzip2 pulseaudio tcp-wrappers openal-soft yajl jack faad=
2 flac libao fluidsynth libcdio wavpack libopus mpg123 libmms libmodplug bo=
ost icu"
> =20
>  SRC_URI =3D " \
> -    http://www.musicpd.org/download/${BPN}/0.18/${BP}.tar.xz \
> +    http://www.musicpd.org/download/${BPN}/0.19/${BP}.tar.xz \
>      file://mpd.conf.in \
>  "
> -
> -SRC_URI[md5sum] =3D "0e5156a831d4302d2032998bcfd5c36f"
> -SRC_URI[sha256sum] =3D "0d4d3e6977cb607419abbb14c63d1e2b982acb84cd2be534=
6f19de5f699a68de"
> +SRC_URI[md5sum] =3D "d235f6e53e5442b6926c49946a303f8d"
> +SRC_URI[sha256sum] =3D "8b3afcd440181c9bd18b229b5974e529d59648344dd37137=
0d6f7d62ec2847c5"
> =20
>  inherit autotools useradd systemd
> =20
> --
> 1.9.1
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

