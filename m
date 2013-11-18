Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id 4680B6D9F9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Nov 2013 22:23:18 +0000 (UTC)
Received: by mail-ee0-f48.google.com with SMTP id e49so2821417eek.21
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Nov 2013 14:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=BvRiM+am0rdRpHj1P0i42mdOUFyEUaTJeG3KrILzg1I=;
	b=OJFXFd1SRIgg+wXuMrkCkbmqM6q4arM6W9nOVP4lOxVBsL3Hz7YSMmLKt6m6pZu2eH
	UAO0QuA7ssiTvuwKu7TwKTU/uYZScirK4c34TIeGs7UcET8IFxBWP5jEu7gRVxEhZMpE
	fCd6bsgwXzAir1mXoxUE90D2c/Tx3HvLCndK3th4dOBw7lEtlw7ZC/0g/NveFovGqRsk
	ciiS5/T06i5JXzTmb0AgM3fVDOpc8pBl0GghlGS9Hq+qcwV7diUZ7QjxqdxotGcIPLp/
	T8mhZge3Pb51CYGQucNp500B5UJ12mrv63R9FFAv5H/2aeCcpV0/RYKM75NXsNUWf31a
	KvfQ==
X-Received: by 10.14.98.195 with SMTP id v43mr7681395eef.44.1384813399172;
	Mon, 18 Nov 2013 14:23:19 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id i1sm42114940eeg.0.2013.11.18.14.23.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Nov 2013 14:23:18 -0800 (PST)
Date: Mon, 18 Nov 2013 23:23:19 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131118222319.GK3727@jama>
References: <1384548309-29331-1-git-send-email-schnitzeltony@googlemail.com>
	<1384548309-29331-2-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1384548309-29331-2-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [PATCH 2/2] mpd: update to 0.18.4 and get sources from musicpd.org
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
X-List-Received-Date: Mon, 18 Nov 2013 22:23:19 -0000
X-Groupsio-MsgNum: 47173
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="64LDleNqNegJ4g97"
Content-Disposition: inline

--64LDleNqNegJ4g97
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 15, 2013 at 09:45:09PM +0100, Andreas M=FCller wrote:
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  .../musicpd/{mpd_0.17.1.bb =3D> mpd_0.18.4.bb}                   | 10 ++=
+++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>  rename meta-multimedia/recipes-multimedia/musicpd/{mpd_0.17.1.bb =3D> mp=
d_0.18.4.bb} (89%)
>=20
> diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1.bb b/m=
eta-multimedia/recipes-multimedia/musicpd/mpd_0.18.4.bb
> similarity index 89%
> rename from meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1.bb
> rename to meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.4.bb
> index 6f2a912..b89eb0e 100644
> --- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1.bb
> +++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.4.bb
> @@ -5,15 +5,15 @@ HOMEPAGE =3D"http://sourceforge.net/projects/musicpd"
> =20
>  DEPENDS =3D "alsa-lib libsamplerate0 libsndfile1 libvorbis libogg faad2 =
ffmpeg curl sqlite bzip2 pulseaudio"
> =20
> -PR =3D "r4"
> -
>  SRC_URI =3D " \
> -    ${SOURCEFORGE_MIRROR}/musicpd/${PN}/${PV}/${PN}-${PV}.tar.bz2 \
> +    http://www.musicpd.org/download/${PN}/stable/${PN}-0.18.tar.xz \
>      file://mpd.conf.in \
>  "
> =20
> -SRC_URI[md5sum] =3D "da3f3d6617a877192db4c6f53504cd38"
> -SRC_URI[sha256sum] =3D "b18cdb1b779ca2ab323e212a0af4a567b7da4881a4e96868=
a8979bdfdbe7c2e8"
> +SRC_URI[md5sum] =3D "0d881fb32f9d31afcdb0bb13cb78b9ab"
> +SRC_URI[sha256sum] =3D "6b171985f192603150c879d105dc4d05d701ac60a2db4163=
0a4dce823e068388"
> +
> +S =3D "${WORKDIR}/${PN}-0.18"
> =20

Can you please review/test

http://patchwork.openembedded.org/patch/56953/

thanks

>  inherit autotools useradd systemd
> =20
> --=20
> 1.8.3.1
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--64LDleNqNegJ4g97
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKKk1cACgkQN1Ujt2V2gByL6wCgrsSS0Ru8YU1CBlkDVDZo3fdd
1FgAn22HGbhFm/6nGCbW1Kz+cdqN+onD
=D4U8
-----END PGP SIGNATURE-----

--64LDleNqNegJ4g97--
