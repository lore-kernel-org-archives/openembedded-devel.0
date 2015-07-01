Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id AC8DA6AD0D
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Jul 2015 13:13:47 +0000 (UTC)
Received: by wgck11 with SMTP id k11so36587711wgc.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Jul 2015 06:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=VMk6fbgVGfP8jBFyumLru02QtbLNwWwmFoewdFq40Xs=;
	b=HRGCwDC+0eHvxbMEcgpne7jlCvyXZgPYYWiOr5t4Xh2/gc3mIbuIBaGq2UrsvJ/rFH
	oXYEW0ZIjnWzLcFSlEJUkFVNTR3N48T7f/FUn2+YAXgDvqZFkbCnDUarXmzYpeVXU5vI
	r/qRc7VLrgoIYsRf8KwdlWjQbF+BYpHw3lIfSxZIn9b2r7G0Cv5U1ceHYbBdlVkKhirk
	v6tw03g9adAzFbid387ELN8vfkDCvg7kIUT+3XikmZ6yx1pFt56PLekR6wXGunwbIhoW
	v1z1wHug0DveOZFLaHBNF2lrooOkIVTnB59iAVQQzZQ3RNIVphlcXzZi9rjRZKnGp0F8
	3KBQ==
X-Received: by 10.194.2.161 with SMTP id 1mr47495435wjv.143.1435756427289;
	Wed, 01 Jul 2015 06:13:47 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id
	ea2sm13685860wib.22.2015.07.01.06.13.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Jul 2015 06:13:46 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 1 Jul 2015 15:14:09 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150701131409.GD2409@jama>
References: <1435732236-22986-1-git-send-email-net147@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1435732236-22986-1-git-send-email-net147@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] hidapi: new recipe
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
X-List-Received-Date: Wed, 01 Jul 2015 13:13:47 -0000
X-Groupsio-MsgNum: 56107
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="f61P+fpdnY2FZS1u"
Content-Disposition: inline

--f61P+fpdnY2FZS1u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 01, 2015 at 04:30:36PM +1000, Jonathan Liu wrote:
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>  meta-oe/recipes-support/hidapi/hidapi_git.bb | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 meta-oe/recipes-support/hidapi/hidapi_git.bb
>=20
> diff --git a/meta-oe/recipes-support/hidapi/hidapi_git.bb b/meta-oe/recip=
es-support/hidapi/hidapi_git.bb
> new file mode 100644
> index 0000000..1f5e9fd
> --- /dev/null
> +++ b/meta-oe/recipes-support/hidapi/hidapi_git.bb
> @@ -0,0 +1,15 @@
> +SUMMARY =3D "Multi-platform library to interface with USB and Bluetooth =
HID-Class devices"
> +AUTHOR =3D "Alan Ott"
> +HOMEPAGE =3D "http://www.signal11.us/oss/hidapi/"
> +SECTION =3D "libs"
> +LICENSE =3D "BSD-3-Clause | GPLv3"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D7c3949a631240cb6c31c50f3e=
b696077"
> +DEPENDS =3D "libusb udev"
> +PV =3D "0.8.0-rc1+git${SRCPV}"

This PV will sort higher than the final 0.8.0 release, at least with
opkg, please use "0.7.99+0.8.0-rc1+gitr${SRCPV}" trick.

Also I'm not sure about using +git or +gitr, most layers except oe-core
are using "+gitr", oe-core is the only one propagating "+git".

> +
> +SRCREV =3D "d17db57b9d4354752e0af42f5f33007a42ef2906"
> +SRC_URI =3D "git://github.com/signal11/hidapi.git;protocol=3Dgit"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit autotools pkgconfig
> --=20
> 2.4.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--f61P+fpdnY2FZS1u
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlWT56AACgkQN1Ujt2V2gBy4tgCgnwbuXBTHD8pu5xnMF+INB0Uf
Uu4An38qA2TWojjrH2QrCQ8uMsUGJZ/x
=EYfj
-----END PGP SIGNATURE-----

--f61P+fpdnY2FZS1u--
