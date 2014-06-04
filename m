Return-Path: <martin.jansa@gmail.com>
Received: from mail-pd0-f170.google.com (mail-pd0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id E7D6460438
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Jun 2014 20:54:19 +0000 (UTC)
Received: by mail-pd0-f170.google.com with SMTP id g10so46622pdj.29
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Jun 2014 13:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=edxIoJOlRLTkf4yq4LGQC9O2O6slm+om2SG16gdxry0=;
	b=Rx9JS86ti+ATiG3TGsWEN7vOqStOV2U79F+f4GrClY6qJuXDsGHSVmnR02Ql7VWw/r
	SYZNT/j9F+ZD9B6ZQme6+P+PSV4P8Spw8PQkCEDwR1KGvp130eNXmE8HfPyHQgQio4D/
	tVc67ahHJvfy4BBUWSn9eNlf0U2bcB/uq8frhAj4dILN+zUbnfT3FlPDSAMBiu8j4ahO
	EUFSqPvZA6goJajx/oDH+Z4IFrjpZrSP4RQeR/5yxEXT8frXOcRt90Cqa6GnhTxSnFTY
	EI28n4Hq0GZCZttXAMFVUtcJ1+9w/LnmePHBTsGWzPIfO0Wkwtz6MMpXBh1/oH0Iobx1
	WS/w==
X-Received: by 10.69.26.103 with SMTP id ix7mr66574787pbd.41.1401915260544;
	Wed, 04 Jun 2014 13:54:20 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ix7sm13836563pbd.36.2014.06.04.13.54.17
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Jun 2014 13:54:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 4 Jun 2014 22:54:31 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140604205431.GU2426@jama>
References: <1401907231-5559-1-git-send-email-blloyd@familyhonor.net>
	<1401907231-5559-2-git-send-email-blloyd@familyhonor.net>
MIME-Version: 1.0
In-Reply-To: <1401907231-5559-2-git-send-email-blloyd@familyhonor.net>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] Upgrade geode video driver to 2.11.15
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
X-List-Received-Date: Wed, 04 Jun 2014 20:54:20 -0000
X-Groupsio-MsgNum: 50186
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0p3EEgCnBt7M6rub"
Content-Disposition: inline

--0p3EEgCnBt7M6rub
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 04, 2014 at 01:40:31PM -0500, blloyd wrote:
> Signed-off-by: blloyd <blloyd@familyhonor.net>

Can you please use whole name?

> ---
>  .../xorg-driver/xf86-video-geode/xf86SetModeDefaultName.patch | 11 +++++=
++++++
>  ...f86-video-geode_2.11.14.bb =3D> xf86-video-geode_2.11.15.bb} |  6 +++=
+--
>  2 files changed, 15 insertions(+), 2 deletions(-)
>  create mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-video-geode=
/xf86SetModeDefaultName.patch
>  rename meta-oe/recipes-graphics/xorg-driver/{nonworking/xf86-video-geode=
_2.11.14.bb =3D> xf86-video-geode_2.11.15.bb} (60%)
>=20
> diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode/xf86Se=
tModeDefaultName.patch b/meta-oe/recipes-graphics/xorg-driver/xf86-video-ge=
ode/xf86SetModeDefaultName.patch
> new file mode 100644
> index 0000000..97d9d49
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode/xf86SetModeDe=
faultName.patch
> @@ -0,0 +1,11 @@
> +diff -up xf86-video-geode-2.11.14/src/geode_dcon.c.jx xf86-video-geode-2=
=2E11.14/src/geode_dcon.c
> +--- xf86-video-geode-2.11.14/src/geode_dcon.c.jx	2012-11-24 05:01:15.000=
000000 -0500
> ++++ xf86-video-geode-2.11.14/src/geode_dcon.c	2013-10-25 16:19:35.950234=
174 -0400
> +@@ -29,6 +29,7 @@
> +=20
> + /* Includes that are used by all drivers */
> + #include <xf86.h>
> ++#include <xf86Modes.h>
> + #include <xf86_OSproc.h>
> + #include <compiler.h>
> +=20
> diff --git a/meta-oe/recipes-graphics/xorg-driver/nonworking/xf86-video-g=
eode_2.11.14.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.1=
1.15.bb
> similarity index 60%
> rename from meta-oe/recipes-graphics/xorg-driver/nonworking/xf86-video-ge=
ode_2.11.14.bb
> rename to meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.15.bb
> index 2fdb210..07d2d9b 100644
> --- a/meta-oe/recipes-graphics/xorg-driver/nonworking/xf86-video-geode_2.=
11.14.bb
> +++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.15.bb
> @@ -4,8 +4,10 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De7f3e39474aee=
a5af381a8e103dafc36"
>  SUMMARY =3D "X.org server -- Geode GX2/LX display driver"
>  PR =3D "${INC_PR}.0"
> =20
> -SRC_URI[md5sum] =3D "c9a4e1c5438240e5bdce332f92df9163"
> -SRC_URI[sha256sum] =3D "4c750b46c932934faa008919922f5ac8a572afcfe265ac8d=
7c203b8167a0cfcc"
> +SRC_URI[md5sum] =3D "7dafd19e274c771539b6d4d459423ccf"
> +SRC_URI[sha256sum] =3D "00db3bd697b32286eb0e42f5dbd7fcc8d7255dd11c299b1e=
e16a06a244868ff0"
> +
> +SRC_URI +=3D "file://xf86SetModeDefaultName.patch"
> =20
>  COMPATIBLE_HOST =3D "i.86.*-linux"
> =20
> --=20
> 1.9.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--0p3EEgCnBt7M6rub
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlOPh4cACgkQN1Ujt2V2gBxfSgCdEtVccsT91Bg7/pvW/Ivg4dKf
bF8AnAjllYMbrUVlv0cgnEX2WZg3W1oC
=dcuT
-----END PGP SIGNATURE-----

--0p3EEgCnBt7M6rub--
