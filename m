Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 0468A6E668
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Jan 2016 10:56:10 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id f206so92255253wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Jan 2016 02:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=DywXvzwO+QeGYKD1DozXO3L0OWlnI/Gm8w/JiJxWzWs=;
	b=VqraF4S1zzGACutH16/Vdh2sYyH2bVzGDthPv1iXtOf9kFzCthPcAkIP2IHCWjlslq
	AimH2214fYSRYTGeNBS95LHz0SI/YqxlZ5mp88t5gx3zZafIJNPt+BVPpeGuOmxWh5e8
	JTiZzD1QtoB12ODtsT6mEKDDvmLdQDOlHQdqy32mvtnGcOPbgvhug68RL52VjsWrh5XW
	xiuSQ251xUtjtQ+eUzsbpV+MC1KASYtfHIrE3JXjuy/8S7aDm2+0n+MiQTSJScJYnvNJ
	/O6BwhyBUnVbLYa36vCAsfGRKGPDxH+0/99gh+iU8HvhqlOUrGJvchlTrKN+AtE8gBff
	E60w==
X-Received: by 10.28.88.210 with SMTP id m201mr16488646wmb.76.1452164170794;
	Thu, 07 Jan 2016 02:56:10 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	w17sm12993376wmw.15.2016.01.07.02.56.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Jan 2016 02:56:09 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 7 Jan 2016 11:56:34 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160107105634.GA2512@jama>
References: <20160106115955.GA11478@jama>
	<1452130263-20943-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1452130263-20943-1-git-send-email-lixin.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-oe][PATCH v2] xterm: 308 -> 320
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
X-List-Received-Date: Thu, 07 Jan 2016 10:56:13 -0000
X-Groupsio-MsgNum: 59395
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EVF5PPMfhYS0aIcm"
Content-Disposition: inline

--EVF5PPMfhYS0aIcm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 06, 2016 at 05:31:03PM -0800, Li Xin wrote:
> Upgrade xterm from 308 to 320.
>=20
> 1) Modify LIC_FILES_CHKSUM,since the date in it has been changed, But the=
 LICENSE has not been changed.
> 2) Fix WARNING: QA Issue: xterm rdepends on libxinerama, but it isn't a b=
uild dependency? [build-deps]
> =20
> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ---
>  meta-oe/recipes-graphics/xorg-app/{xterm_308.bb =3D> xterm_320.bb} | 8 +=
+++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>  rename meta-oe/recipes-graphics/xorg-app/{xterm_308.bb =3D> xterm_320.bb=
} (75%)
>=20
> diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_308.bb b/meta-oe/rec=
ipes-graphics/xorg-app/xterm_320.bb
> similarity index 75%
> rename from meta-oe/recipes-graphics/xorg-app/xterm_308.bb
> rename to meta-oe/recipes-graphics/xorg-app/xterm_320.bb
> index 9198ca2..ae9aa76 100644
> --- a/meta-oe/recipes-graphics/xorg-app/xterm_308.bb
> +++ b/meta-oe/recipes-graphics/xorg-app/xterm_320.bb
> @@ -2,12 +2,12 @@ require recipes-graphics/xorg-app/xorg-app-common.inc
>  SUMMARY =3D "xterm is the standard terminal emulator for the X Window Sy=
stem"
>  DEPENDS =3D "libxaw xproto xextproto libxext libxau libxpm ncurses"
> =20
> -LIC_FILES_CHKSUM =3D "file://xterm.h;beginline=3D3;endline=3D31;md5=3D54=
0cf18ccc16bc3c5fea40d2ab5d8d51"
> +LIC_FILES_CHKSUM =3D "file://xterm.h;beginline=3D3;endline=3D31;md5=3Dee=
6435019d00b884cde8d7ba2b318ff0"
> =20
>  SRC_URI =3D "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz"
> =20
> -SRC_URI[md5sum] =3D "1ec76c1a79a70de4f82c24c527ef4626"
> -SRC_URI[sha256sum] =3D "c5bf7377a5bf35e34b7e3a4ab6c848fbc89e8901dd98f8b2=
37662a72bdbfe372"
> +SRC_URI[md5sum] =3D "0d7f0e6390d132ae59876b3870e5783d"
> +SRC_URI[sha256sum] =3D "a60dbb574334c081425fa30f011cd9f571e3be7a91e2a84e=
252461798bce24a7"
> =20
>  EXTRA_OECONF =3D " --x-includes=3D${STAGING_INCDIR} \
>                   --x-libraries=3D${STAGING_LIBDIR} \
> @@ -25,6 +25,6 @@ do_configure() {
>  }
> =20
>  FILES_${PN} +=3D " /usr/lib/X11"
> -
> +RDEPENDS_${PN} +=3D "libxinerama"

This isn't the right fix, see QA talks about build time dependency.

>  PACKAGECONFIG ?=3D ""
>  PACKAGECONFIG[xft] =3D "--enable-freetype,--disable-freetype,libxft font=
config"
> --=20
> 1.9.1
>=20
>=20
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--EVF5PPMfhYS0aIcm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlaORGEACgkQN1Ujt2V2gBxnlACgn1CwbUCSODGNIcoc3ZuB/XhD
7zcAn2jN8EUSUh57EgKemxStRx+vJ1L5
=0zST
-----END PGP SIGNATURE-----

--EVF5PPMfhYS0aIcm--
