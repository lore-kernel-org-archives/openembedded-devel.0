Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f181.google.com (mail-ea0-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id 0953E6041D;
	Thu,  6 Jun 2013 10:12:40 +0000 (UTC)
Received: by mail-ea0-f181.google.com with SMTP id a15so64548eae.12
	for <multiple recipients>; Thu, 06 Jun 2013 03:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=0xuNC7cfTPF/6GiaS4uHQCFsuBWtB7K9tI/GmVcpNsA=;
	b=c8LEx6oVrsLHyAR1I3B7ujFmL3HuquO/fnk954cK9aYsN/yKD5lXK33UmhegZJYWGG
	MMytDl6IesfvrfZvKWMPRnDoQbINxmlG4ulKntTpguuuwqMBfO6QgDa5GVLtjlSv7AoS
	5DjTJLd0vf2rWDGrTKsdiwzRbL/zqgXRSaDnZTvC9J6C2tTc6q4VHQdzRQxQ2lnxWtwl
	cDkd+px+C7rkpW52wgiP/1gkvM5u8mPubULlMo2BP5FVIrG11MsVV3aa45jCM0i9Uv0c
	LGfdjJHgb3pzOIxC+xpBeOj6asxMEbfwvTEbNtAhbE3hZT0QbEz+ncASL1BbeFFaWm48
	VhOA==
X-Received: by 10.14.150.11 with SMTP id y11mr27626430eej.54.1370513560708;
	Thu, 06 Jun 2013 03:12:40 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	l6sm105205528eef.12.2013.06.06.03.12.39 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 06 Jun 2013 03:12:39 -0700 (PDT)
Date: Thu, 6 Jun 2013 12:12:58 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130606101258.GA22710@jama>
References: <20130524130924.BFD6C50262@opal>
MIME-Version: 1.0
In-Reply-To: <20130524130924.BFD6C50262@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Ross Burton : librsvg: clean up native depends
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
X-List-Received-Date: Thu, 06 Jun 2013 10:12:41 -0000
X-Groupsio-MsgNum: 44977
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="45Z9DzgjV8m4Oswq"
Content-Disposition: inline

--45Z9DzgjV8m4Oswq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 24, 2013 at 01:09:24PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: dc1fbdd925d4dde294c4b63466e67084ce1ace89
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3Ddc1fbdd925d4dde294c4b63466e67084ce1ace89
>=20
> Author: Ross Burton <ross.burton@intel.com>
> Date:   Thu May 16 17:54:08 2013 +0100
>=20
> librsvg: clean up native depends
>=20
> inherit gnome was only used for the SRC_URI, so just inherit gnomebase and
> remove the native-specific DEPENDS which was only required as the gnome c=
lass
> pulls in an impossible hicolor-icon-theme-native dependency.
>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>=20
> ---
>=20
>  meta/recipes-gnome/librsvg/librsvg_2.32.1.bb |    3 +--
>  1 files changed, 1 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb b/meta/recipes-=
gnome/librsvg/librsvg_2.32.1.bb
> index 2bc1624..9c5f722 100644
> --- a/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
> +++ b/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
> @@ -8,12 +8,11 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9b=
a36caa9b7df079bae19f \
> =20
>  SECTION =3D "x11/utils"
>  DEPENDS =3D "cairo glib-2.0 gdk-pixbuf fontconfig freetype libxml2 pango"
> -DEPENDS_class-native =3D "cairo-native pango-native gdk-pixbuf-native"
>  BBCLASSEXTEND =3D "native"
> =20
>  PR =3D "r12"
> =20
> -inherit autotools pkgconfig gnome gtk-doc pixbufcache
> +inherit autotools pkgconfig gnomebase gtk-doc pixbufcache
> =20
>  EXTRA_OECONF =3D "--disable-mozilla-plugin --without-svgz"

Not sure why, but now do_configure is failing with:

| checking for gdk-pixbuf-query-loaders... none
| configure: error: gdk-pixbuf-query-loaders not found in path
| Configure failed. The contents of all config.log files follows to aid deb=
ugging
| /OE/shr-core/tmp-eglibc/work/arm920tt-oe-linux-gnueabi/librsvg/2.32.1-r12=
/librsvg-2.32.1/config.log
| This file contains any messages produced by compilers while
| running configure, to aid debugging if configure makes a mistake.
|
| It was created by RSVG configure 2.32.1, which was
| generated by GNU Autoconf 2.69.  Invocation command line was

configure:13908: checking whether to build the GDK-Pixbuf SVG loader
configure:13917: result: yes
configure:13924: checking for GDK_PIXBUF
configure:13931: $PKG_CONFIG --exists --print-errors "gdk-pixbuf-2.0 >=3D $=
GDK_PIXBUF_REQUIRED"
configure:13934: $? =3D 0
configure:13948: $PKG_CONFIG --exists --print-errors "gdk-pixbuf-2.0 >=3D $=
GDK_PIXBUF_REQUIRED"
configure:13951: $? =3D 0
configure:14009: result: yes
configure:14016: checking for gdk-pixbuf-query-loaders
configure:14047: result: none
configure:14057: error: gdk-pixbuf-query-loaders not found in path

I'll check DEPENDS with bitbake -e when I don't have any build running in t=
hat directory..

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--45Z9DzgjV8m4Oswq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlGwYKoACgkQN1Ujt2V2gBwcwACff/FCHGa9bIG7tvUPyJuURyTe
uiAAmwRWINTJetg8HrOIbxfGaczs8L4t
=yfUy
-----END PGP SIGNATURE-----

--45Z9DzgjV8m4Oswq--
