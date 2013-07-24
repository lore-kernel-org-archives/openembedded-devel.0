Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id 5089C6028B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 21:55:31 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id d41so517931eek.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 14:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=cFqOZVFPVLhtFASGknd4izcivktyZHh9ABWxa5fJfNg=;
	b=KO2WcRuu47IPaJqGFiNHkNEbkxe9IKDhw+KLxB1Lch1JQAIoZhV2Mi2flf/oFpQhRn
	KaIYptO++EZ8AjvZQ1IW2KY+LYVHsNwIC8IMW0gcrVq/cIxDdnrTMr4t7ywEp22AjEC1
	CVstPyagODBXKbSdqMGmdHYyXl5Zz+Etdq7ErObzhSiqLrXQaMbaikAdkHXy7nJX/JN3
	S3GB6uLIbxaMzAe2mE2waES4WUiJMUyNX7UlOhMwOk5oBVXXa7Z9BhsQvp3gxQt6g86B
	TH1OMVMF7DbovtTx1o2YCWhLVzJ0yHqWlQPdcClKVUjtBPhvgaeYMQmBz0WV8yvAgcB3
	iRDQ==
X-Received: by 10.15.44.67 with SMTP id y43mr39855154eev.20.1374702931437;
	Wed, 24 Jul 2013 14:55:31 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	r54sm69093582eev.8.2013.07.24.14.55.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 24 Jul 2013 14:55:30 -0700 (PDT)
Date: Wed, 24 Jul 2013 23:55:53 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130724215553.GB17913@jama>
References: <1374701507-26976-1-git-send-email-chgans@gna.org>
MIME-Version: 1.0
In-Reply-To: <1374701507-26976-1-git-send-email-chgans@gna.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-qt5][dylan][PATCH] qtbase.inc: Fix qtbase-tools runtime depencency on perl
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
X-List-Received-Date: Wed, 24 Jul 2013 21:55:31 -0000
X-Groupsio-MsgNum: 45495
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mxv5cy4qt+RJ9ypb"
Content-Disposition: inline

--mxv5cy4qt+RJ9ypb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 25, 2013 at 09:31:47AM +1200, Christian Gagneraud wrote:
> While building a custom rootfs using poky, meta-oe, meta-ti and meta-qt5 =
(all on Dylan branch), I got the following error:
> [...]
> | Computing transaction...error: Can't install qtbase-tools-5.0.2-r2.0@ar=
mv7a_vfp_neon: no package provides /usr/bin/perl
> [...]
>=20
> qtbase-tools seems to depends on perl (at runtime), but this wasn't speci=
fied in any bb file, this patch fixes it.

Have you tried which files require perl?

>=20
> Signed-off-by: Christian Gagneraud <chgans@gna.org>
> ---
>  recipes-qt/qt5/qtbase.inc | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
> index f521a30..a72a3d6 100644
> --- a/recipes-qt/qt5/qtbase.inc
> +++ b/recipes-qt/qt5/qtbase.inc
> @@ -23,6 +23,8 @@ SRC_URI +=3D " \
> =20
>  DEPENDS +=3D "qtbase-native freetype jpeg libpng zlib openssl glib-2.0 $=
{ICU} udev ${XCB_DEPENDS} ${GL_DEPENDS} ${TSLIB_DEPENDS} ${FONTCONFIG_DEPEN=
DS}"
> =20
> +RDEPENDS_${PN}-tools +=3D "perl"
> +
>  # to provide xcb/xcb_icccm.h, xcb/xcb_image.h, xcb/xcb_keysyms.h and dbu=
s/dbus.h
>  # XCB_DEPENDS +=3D "xcb-util-wm xcb-util-image xcb-util-keysyms dbus"
>  # reenable when we switch to "-qt-xcb" and build of=20
> --=20
> 1.8.1.2
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--mxv5cy4qt+RJ9ypb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHwTWkACgkQN1Ujt2V2gByEmwCgoSNoDS69RaFhPxGPL9FQ3/Bs
1a8An1X4TivAwngRZpjfY2YvBZS7XB+X
=gl34
-----END PGP SIGNATURE-----

--mxv5cy4qt+RJ9ypb--
