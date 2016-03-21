Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0EEBB6012C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Mar 2016 14:46:36 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id x188so22333382wmg.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Mar 2016 07:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=KnbevDcpsVvyJcoqhr+iG8wM5v13ndCjrZ3B2c7epkw=;
	b=FSZHmTqfA7kg1sbfU3HAJZPkI4ihVUJLaQRFJaqdKzPcfJB/5tVEh/pWe7hp4CBitW
	PbM2Bhn5atz0BcTdbezkBJCzB2m6M+97BGvgcqNjOjDC+KuLs/iVW8CJs/H3VLvo8TtL
	CiwhkXu32Yac0SuYD88QpkIPPOIWVz+JQs1aOY+Jvg+zM+k2m+7iuXnVSevGCCYY/HX+
	qBakfOUe+/D0IRKU21MWwUDt7cXeIDoURYa8XHLpEpdqqfLfN2d8+RevZEMIZayJsE2T
	AzaegV2F1ZBEn8rAkFZ+tbI8N9ErOwMtTHqgj1sgmi/fdiXc8lSrRUEisN2iK47SN7QZ
	nLuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=KnbevDcpsVvyJcoqhr+iG8wM5v13ndCjrZ3B2c7epkw=;
	b=Lsy9HRDXUrCT9dwwPhyA2o1fkAZJOzFQRan1yB1D7LMvTXPRDoDnYyH6DHlowQp6FB
	VN3Vg8pXCW4DBXfN88r5YuF4SwaOqZvACoXem9MpqxjaF1H8+s8dNXCDpKo4ym3hwX5X
	xOYopgOTCiq27Qwo4MvmZ8bA71bZJ2LRQozeJjCyXrwUYPhj9PQcn2qfvFcWxkhdP3qe
	CFcrQer+PKJ6vI2HZqYU2CY869EdFKS3h5msD4iA2KwRlR6hAd2XcPjuNwlEKfZWdXQE
	93q1UBhX1b4EJpclK0M22u1RdN+ocaH8IPsXgwsZMuxjBH2lUK/AUYJPKWe7gMn10L81
	3sKQ==
X-Gm-Message-State: AD7BkJJQSI5SfRBLaMnrNpXnks3Q9D+O7dphAz8p6qfOQs0LJUvP8bi+BxLHLoxBjlX3iQ==
X-Received: by 10.28.54.156 with SMTP id y28mr14936464wmh.63.1458571597166;
	Mon, 21 Mar 2016 07:46:37 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id h7sm12773794wmf.9.2016.03.21.07.46.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Mar 2016 07:46:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 21 Mar 2016 15:50:53 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160321145053.GD2562@jama>
References: <1458568492-29611-1-git-send-email-alexander.kanavin@linux.intel.com>
	<1458568492-29611-2-git-send-email-alexander.kanavin@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <1458568492-29611-2-git-send-email-alexander.kanavin@linux.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH 2/2] gnome-bluetooth: replace systemd dependency with udev
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Mar 2016 14:46:39 -0000
X-Groupsio-MsgNum: 60601
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zS7rBR6csb6tI2e1"
Content-Disposition: inline

--zS7rBR6csb6tI2e1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 21, 2016 at 03:54:52PM +0200, Alexander Kanavin wrote:
> Now we have an up to date standalone libudev (via eudev),
> so systemd is no longer required.
>=20
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.18.2.bb | 5 +=
----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>=20
> diff --git a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.1=
8.2.bb b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.18.2.bb
> index b3058e8..984dad5 100644
> --- a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.18.2.bb
> +++ b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.18.2.bb
> @@ -6,13 +6,10 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Deb723b61539f=
eef013de476e68b5c50a \
> =20
>  SECTION =3D "x11/gnome"
> =20
> -# systemd is needed because it has a necessary version of libudev
> -# Effectively this means that systemd must be in DISTRO_FEATURES
> -DEPENDS =3D "systemd gtk+3 libnotify libcanberra"
> +DEPENDS =3D "udev gtk+3 libnotify libcanberra"
>  DEPENDS +=3D "${@bb.utils.contains('DISTRO_FEATURES','bluez5','bluez5','=
bluez4',d)}"
> =20
>  inherit gnomebase gtk-icon-cache distro_features_check gobject-introspec=
tion

So you can remove distro_features_check inherit as well, right?

> -REQUIRED_DISTRO_FEATURES =3D "systemd"
> =20
>  SRC_URI[archive.md5sum] =3D "75d09c924468ec0c687f9ab3acf7f113"
>  SRC_URI[archive.sha256sum] =3D "d8df073c331df0f97261869fb77ffcdbf4e3e4ea=
f460d3c3ed2b16e03d9c5398"
> --=20
> 2.7.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--zS7rBR6csb6tI2e1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbwCkwACgkQN1Ujt2V2gBxpcgCgqn0VQOtgXaw9vJV7WzBuoCW6
zacAn0BJgT14lWAU5R4Yds5ti/7DKr/1
=6qeG
-----END PGP SIGNATURE-----

--zS7rBR6csb6tI2e1--
