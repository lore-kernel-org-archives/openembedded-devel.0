Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id CCFAE605B3
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Dec 2015 09:17:28 +0000 (UTC)
Received: by wmec201 with SMTP id c201so249746972wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Dec 2015 01:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=0f7wclidyVBoXywXyjuILBl3wOMuHfzFdPsJdv7A65k=;
	b=aRJxWa98By1vUAoXqS+usPRiV/p3uWg63HhF0VBnDhRJLuK+uX5T3OFxfe542PmSW+
	2DKOmMhRVJ/bC+sa47bR4vEGjPNbsL3ejPoKPGi7pGbA9RvdVrrNQO+3uhBDhFf7QiiM
	96B+W6d9CDprMTJDSqcXOJTJDy3T08qzwfFUTU3v4OKdp8bH5INKBlbGoI2pUR5PPQF3
	niP64dtMZwOxPLkzhvD/YEK2yEKTLo5qyUoAUdW678YsoeoUz8kZcYRnCRJmgLbnSM0Q
	I8tBmpolnx51pcv0dNGvS4W9L4rxEKMTIlrI0JHaSvMxQjPCVtspLZqivkhdEMy/wIVN
	V6kQ==
X-Received: by 10.28.1.8 with SMTP id 8mr9639706wmb.40.1449652648613;
	Wed, 09 Dec 2015 01:17:28 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	wh10sm6621739wjb.45.2015.12.09.01.17.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 Dec 2015 01:17:26 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 9 Dec 2015 10:19:09 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151209091909.GC2246@jama>
References: <1449651204-16080-1-git-send-email-mikko.rapeli@bmw.de>
MIME-Version: 1.0
In-Reply-To: <1449651204-16080-1-git-send-email-mikko.rapeli@bmw.de>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-qt5][PATCH] cmake_qt5.bbclass: add DEPENDS to qtbase
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
X-List-Received-Date: Wed, 09 Dec 2015 09:17:29 -0000
X-Groupsio-MsgNum: 58946
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XvKFcGCOAo53UbWW"
Content-Disposition: inline

--XvKFcGCOAo53UbWW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 09, 2015 at 10:53:24AM +0200, Mikko Rapeli wrote:
> All packages using this class need it and it is too easy for developers
> to miss and leave race conditions into builds.
>=20
> Change-Id: I713ffdf26e821b8ab12c2d53f9a1e6679d26a4b1

You don't need Change-Id.

> Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
> ---
>  classes/cmake_qt5.bbclass | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/classes/cmake_qt5.bbclass b/classes/cmake_qt5.bbclass
> index 94a60dc..10b0312 100644
> --- a/classes/cmake_qt5.bbclass
> +++ b/classes/cmake_qt5.bbclass
> @@ -1,6 +1,8 @@
>  inherit cmake
>  inherit qmake5_paths
> =20
> +DEPENDS_prepend =3D " qtbase "

You don't need leading space in prepend, only the trailing one.

> +
>  EXTRA_OECMAKE +=3D " \
>      -DOE_QMAKE_PATH_PREFIX=3D${OE_QMAKE_PATH_PREFIX} \
>      -DOE_QMAKE_PATH_HEADERS=3D${OE_QMAKE_PATH_HEADERS} \
> --=20
> 2.6.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--XvKFcGCOAo53UbWW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZn8g0ACgkQN1Ujt2V2gBxe6QCgktGvgzkg/r1Nl054Sa+Hjm/3
YxAAnj+3WzdFh03fPtGZl4HhZEf8Kscb
=9ED5
-----END PGP SIGNATURE-----

--XvKFcGCOAo53UbWW--
