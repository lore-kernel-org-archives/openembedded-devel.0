Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id F31BB65CAF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Oct 2014 18:45:02 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id bs8so2802893wib.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Oct 2014 11:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=bWZ9C7u+jDSuTCWg5vc6S4DfyqJxNouhLz3xvQ9fVmc=;
	b=hQEdSCUV1UEHyqov+Vykgr4dGT+IrvraYbQ7oq+gMrqQLeT337qdttK6KGNyqUDkBG
	GuqD4JkzLJr1+wtjApRuPpng+uAJKmHsaXJAzXY7aLRqyfApDMmB8XcAXQ9iBtafWrmk
	+ykmKRjLukG/oR5cjwAEWxIz7Ya2XJyQr3cMarfb1GWwvtWdFNNTHZzjbcTON7NNVMOw
	7Z6AqV5MDur4uki4HeOyW4e2X2UXHtI5Qo7Q6wOBl5+/1et9EVRvd6LCBfhcTeSVD0nv
	1bIQPwsD/qi2oePMX2II8LEfeOihA8gZh1VG5Moimp7Pa2hSOBPNPGJ0S29UeoODzIH5
	vnhw==
X-Received: by 10.180.221.129 with SMTP id qe1mr14958327wic.21.1414089902145; 
	Thu, 23 Oct 2014 11:45:02 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ee3sm3515118wic.4.2014.10.23.11.45.01 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Oct 2014 11:45:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 23 Oct 2014 20:45:01 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141023184501.GA2430@jama>
References: <1414082432-14111-1-git-send-email-cristian.iorga@intel.com>
	<1414082432-14111-3-git-send-email-cristian.iorga@intel.com>
MIME-Version: 1.0
In-Reply-To: <1414082432-14111-3-git-send-email-cristian.iorga@intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
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
X-List-Received-Date: Thu, 23 Oct 2014 18:45:10 -0000
X-Groupsio-MsgNum: 52617
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="k1lZvvs/B4yU6o8G"
Content-Disposition: inline

--k1lZvvs/B4yU6o8G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

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
>  .../recipes-multimedia/musicpd/{mpd_0.18.9.bb =3D> mpd_0.19.1.bb}  | 9 +=
+++-----
>  2 files changed, 6 insertions(+), 7 deletions(-)
>  rename meta-multimedia/recipes-multimedia/mpg123/{mpg123_1.19.0.bb =3D> =
mpg123_1.21.0.bb} (94%)
>  rename meta-multimedia/recipes-multimedia/musicpd/{mpd_0.18.9.bb =3D> mp=
d_0.19.1.bb} (89%)
>=20
> diff --git a/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.19.0.bb b=
/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.21.0.bb
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
> diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.9.bb b/m=
eta-multimedia/recipes-multimedia/musicpd/mpd_0.19.1.bb
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

--k1lZvvs/B4yU6o8G
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlRJTK0ACgkQN1Ujt2V2gBxuVgCfY+ffyoJetkZsbGw/YcvHbLDm
yBoAmgMBLmoBIHkGnqqjGEPVSjaV1W8F
=AksQ
-----END PGP SIGNATURE-----

--k1lZvvs/B4yU6o8G--
