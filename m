Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 73FBA6ACEC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jul 2014 12:06:54 +0000 (UTC)
Received: by mail-wi0-f179.google.com with SMTP id cc10so4370775wib.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jul 2014 05:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=+JWeTZjEHuFXb+fBjny2+VkQGiuuyGlnVuYB6111KmM=;
	b=eMry+B/gGRcYRRn4p7fQgPLotdQLgH+AjkeFbzYxXsPvWDqiMhVbCqkMkrKUdCI9mG
	TUTjYRUAOHzoBI9X6Bb750GMmHSj4RfjNWZvl36BlKEfK2msn4zImovx4lJdthD733k5
	3odJ4SsmyAYTbmKr+3Z/IWRLi071LECgSVd+TmOEuSc+WGhUpa5cO/Eefu06klTZCgRj
	S/S8ZsFUm1QkeSngfjfOt9qQhqOu0iGO+XklAP9n7JMDK69yEJe3izXOSfLW8inTSwcY
	ozWhxSDyqfXFPwNZ2mRKd3l6+INhReHOBmHWkk0FKbiYSOWKoVPbnS9aSVLcil8Xo6++
	Yiuw==
X-Received: by 10.180.79.201 with SMTP id l9mr18820194wix.60.1404994015740;
	Thu, 10 Jul 2014 05:06:55 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	10sm72963365wjr.22.2014.07.10.05.06.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Jul 2014 05:06:54 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 10 Jul 2014 14:06:59 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140710120659.GA2433@jama>
References: <1404990575-2064-1-git-send-email-jukka.rissanen@linux.intel.com>
	<1404990575-2064-2-git-send-email-jukka.rissanen@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <1404990575-2064-2-git-send-email-jukka.rissanen@linux.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH v2 2/2] usb-modeswitch: Upgrade to latest version
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
X-List-Received-Date: Thu, 10 Jul 2014 12:06:59 -0000
X-Groupsio-MsgNum: 50814
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OgqxwSJOaUobr8KG"
Content-Disposition: inline

--OgqxwSJOaUobr8KG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 10, 2014 at 02:09:35PM +0300, Jukka Rissanen wrote:
> Use the latest version of usb-modeswitch (2.2.0) and
> usb-modeswitch-data (20140529). The data package depends
> on new usb-modeswitch version so upgrade both of them at
> the same time.
>=20
> Signed-off-by: Jukka Rissanen <jukka.rissanen@linux.intel.com>
> ---
>  ...odeswitch-data_20130807.bb =3D> usb-modeswitch-data_20140529.bb} | 8 =
++++----
>  .../{usb-modeswitch_2.0.1.bb =3D> usb-modeswitch_2.2.0.bb}          | 6 =
+++---
>  2 files changed, 7 insertions(+), 7 deletions(-)
>  rename meta-oe/recipes-support/usb-modeswitch/{usb-modeswitch-data_20130=
807.bb =3D> usb-modeswitch-data_20140529.bb} (52%)
>  rename meta-oe/recipes-support/usb-modeswitch/{usb-modeswitch_2.0.1.bb =
=3D> usb-modeswitch_2.2.0.bb} (68%)
>=20
> diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_2=
0130807.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_201=
40529.bb
> similarity index 52%
> rename from meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20=
130807.bb
> rename to meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_2014=
0529.bb
> index e33f296..a265411 100644
> --- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20130807=
=2Ebb
> +++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20140529=
=2Ebb
> @@ -4,14 +4,14 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9b=
a36caa9b7df079bae19f"
> =20
>  inherit allarch
> =20
> -SRC_URI =3D "http://www.draisberghof.de/usb_modeswitch/usb-modeswitch-da=
ta-${PV}.tar.bz2"
> -SRC_URI[md5sum] =3D "91feff51deba6e48e78506b8f4db2274"
> -SRC_URI[sha256sum] =3D "a3114e2c1f38eed3ad0067df30e53a96313908a9539a8ea5=
d94a4d35651699eb"
> +SRC_URI =3D "http://www.draisberghof.de/usb_modeswitch/${BP}.tar.bz2"
> +SRC_URI[md5sum] =3D "dff94177781298aaf0b3c2a3c3dea6b2"
> +SRC_URI[sha256sum] =3D "53889157937109e04dafe897c098ec94f3f44f9c0c83fc6e=
c8417aa9a587e536"
> =20
>  do_install() {
>      oe_runmake install DESTDIR=3D${D}
>  }
> =20
> -RDEPENDS_${PN} =3D "usb-modeswitch"
> +RDEPENDS_${PN} =3D "usb-modeswitch (>=3D 2.2.0)"

Do we really need the version here?

If yes then add comment explaining why.

>  FILES_${PN} +=3D "${base_libdir}/udev/rules.d/ \
>                  ${datadir}/usb_modeswitch"
> diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.0.1.=
bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.2.0.bb
> similarity index 68%
> rename from meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.0.1.bb
> rename to meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.2.0.bb
> index 61caa84..5e95bb9 100644
> --- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.0.1.bb
> +++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.2.0.bb
> @@ -4,9 +4,9 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba3=
6caa9b7df079bae19f"
> =20
>  DEPENDS =3D "libusb1"
> =20
> -SRC_URI =3D "http://www.draisberghof.de/usb_modeswitch/usb-modeswitch-${=
PV}.tar.bz2"
> -SRC_URI[md5sum] =3D "e48d4419d0574d342bb183f7465556d0"
> -SRC_URI[sha256sum] =3D "4706c9cfe825263e189f55730ea3d1d8634aeb15645a1098=
532e946e770f7f95"
> +SRC_URI =3D "http://www.draisberghof.de/usb_modeswitch/${BP}.tar.bz2"
> +SRC_URI[md5sum] =3D "f323fe700edd6ea404c40934ddf32b22"
> +SRC_URI[sha256sum] =3D "2752103de171ed5f6c8d6a6e3e73e16c9ee3e8e394dd39c5=
991f7680eb908a3a"
> =20
>  EXTRA_OEMAKE =3D "TCL=3D${bindir}/tclsh"
> =20
> --=20
> 1.8.3.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--OgqxwSJOaUobr8KG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlO+geMACgkQN1Ujt2V2gBzvqgCePXESOx/1EkEmOFOUjflNw3NR
sPYAn2EjvBVpGGLjmfVfp6n6F8VoWbmr
=c/cm
-----END PGP SIGNATURE-----

--OgqxwSJOaUobr8KG--
