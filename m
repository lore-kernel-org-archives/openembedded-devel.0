Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 858FD606D0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Mar 2016 10:08:09 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id l68so226516838wml.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Mar 2016 03:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=2CY3caC5lLXa76eWD+c45jIzSfhkZd1V8dksuPFITmc=;
	b=nvDjXeVbF5VYw66YEdYP5zhLJvbd8cPf7Z97q41I/0nfw7+qrIIskIfSfakK35P10y
	K1pn3q0pykrxzkukJ3gVcA6GU5gi9GMtzSd8F0JLOneURE0aOZwLPoyaLV23FoS2C0Ks
	BN+4EDGCpmthFauDtclIXCSegmrnnIbov696WFiwjeSFmT1v+V4vRSOLjDtBjfQYs7Qi
	NzM+Lu4oq5Lj/ieHds1DAamYLriccWPFRVe9G5UgT5U2q/BZfEFNoEiNb831q/Q7rpXx
	2SBw94eJKxtkO+1WGV8z/lAPB8vX+zkMtXkKNw5zI0PVd2fsJ7/6OF2lBlickObb6hXI
	oYhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=2CY3caC5lLXa76eWD+c45jIzSfhkZd1V8dksuPFITmc=;
	b=bJCYbDPGL3cl8JSnk6Y7XLViFFuXBxwAVzuilabpyx2Gtu7idYmsv16HveMMeOgaJN
	KFv8zFRVDU29zVWKjiW1o1RQ/IYbdMO8pprZl7FjsYpGC8qtlvySmSZ61Kft6JLaHOTR
	VMg0XtgyyhQQJGSLN9oKApCFoKlydCT9mLh+0wVs2dBu994FSeg6C7hJ1axtBIFs2YH6
	7p1SNG54M6Df73c3B/CsG0dEfAIcHUy+1i7faStXZKn2jMqw3hXj6md/6pnwxkg0HqlR
	TEf9kcFYGfjVaKpDzkUhDSooPlkS2iYBWXesVpY4Ujd4G+gaFecc8Vpa11XLuUp43jJP
	QroQ==
X-Gm-Message-State: AD7BkJJDf5uSyT91GGX3/w1eaCM631INwDRudKJDzHgblWgXdXPXAXN9a3xLUd7mpPOTqg==
X-Received: by 10.194.189.231 with SMTP id gl7mr2358105wjc.162.1458727689646; 
	Wed, 23 Mar 2016 03:08:09 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	k124sm2134747wmb.11.2016.03.23.03.08.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Mar 2016 03:08:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 23 Mar 2016 11:12:40 +0100
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Message-ID: <20160323101240.GA2565@jama>
References: <1458556296-2809-1-git-send-email-ricardo.ribalda@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1458556296-2809-1-git-send-email-ricardo.ribalda@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] opencv: Add missing dependencies
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
X-List-Received-Date: Wed, 23 Mar 2016 10:08:09 -0000
X-Groupsio-MsgNum: 60620
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zhXaljGHf11kAtnf"
Content-Disposition: inline

--zhXaljGHf11kAtnf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 21, 2016 at 11:31:36AM +0100, Ricardo Ribalda Delgado wrote:
> opencv-3.1+gitAUTOINC+92387b1ef8: libopencv-videoio rdepends on
> libgphotoport, but it isn't a build dependency, missing libgphoto2 in
> DEPENDS or PACKAGECONFIG? [build-deps]
> opencv-3.1+gitAUTOINC+92387b1ef8: libopencv-videoio rdepends on
> libgphoto2, but it isn't a build dependency, missing libgphoto2 in
> DEPENDS or PACKAGECONFIG? [build-deps]
> opencv-3.1+gitAUTOINC+92387b1ef8: libopencv-dnn rdepends on protobuf,
> but it isn't a build dependency, missing protobuf in DEPENDS or
> PACKAGECONFIG? [build-deps]

Still shows:
WARN: opencv: libopencv-dnn rdepends on protobuf, but it isn't a build
dependency?

protobuf support in dnn probably depends on something else which is also au=
todetected.

> Credit-to: Martin Jansa <martin.jansa@gmail.com>
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
>  meta-oe/recipes-support/opencv/opencv_3.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-support/opencv/opencv_3.1.bb b/meta-oe/recip=
es-support/opencv/opencv_3.1.bb
> index 87338cad4a4b..e9e85fe2af0a 100644
> --- a/meta-oe/recipes-support/opencv/opencv_3.1.bb
> +++ b/meta-oe/recipes-support/opencv/opencv_3.1.bb
> @@ -10,7 +10,7 @@ ARM_INSTRUCTION_SET_armv5 =3D "arm"
> =20
>  DEFAULT_PREFERENCE =3D "-1"
> =20
> -DEPENDS =3D "python-numpy libtool swig swig-native python bzip2 zlib gli=
b-2.0 libwebp"
> +DEPENDS =3D "python-numpy libtool swig swig-native python bzip2 zlib gli=
b-2.0 libwebp libgphoto2 protobuf"
> =20
>  SRCREV_opencv =3D "92387b1ef8fad15196dd5f7fb4931444a68bc93a"
>  SRCREV_contrib =3D "5409d5ad560523c85c6796cc5a009347072d883c"
> --=20
> 2.7.0
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--zhXaljGHf11kAtnf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbybBUACgkQN1Ujt2V2gBy+AACdEF/SW8KdM9srjist4Tr9+kG0
yvwAnj166nD49NF6byNs8SxLFF4B3Sxr
=Ho7e
-----END PGP SIGNATURE-----

--zhXaljGHf11kAtnf--
