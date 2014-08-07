Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 6E35A61585
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Aug 2014 10:15:44 +0000 (UTC)
Received: by mail-wg0-f49.google.com with SMTP id k14so3842829wgh.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Aug 2014 03:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=lJk0QgaTMQ0U+Uojj8CkUdpayLQQmOcHqgkfFRMlAhk=;
	b=hk+Kq4pcVfDodzoO8S/mseUHfoAGySbVQdMRbYIdZoCzZrOdO8yTuJapIHKDvpazYv
	xua5iAUToJK2bXGpLvjjtMyJVrsNz+8GCxdwOs5KfG/9NBYPyfZqsgAlmHT4veh114gE
	+fJMz8HXremOa0EvYVQyO+7DB0DnAxTnoJDbdGDqcB+XttzZG1hIprZahyhO1WXGPyeI
	aicc9X/+XN9mlBQK97h8BAzPzo3vLrkhOptrkQdDFgMLeqBP3BcUxoVOlXyMjEpgtCtl
	nnP3J9YpbGOQ9dSTY3ktPMXnkVdxcT658dmSgtgLyP5iDUilF0rI9tnxmy8YrYiuCBKv
	Czng==
X-Received: by 10.194.78.170 with SMTP id c10mr23490583wjx.22.1407406545490;
	Thu, 07 Aug 2014 03:15:45 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	pj6sm8856526wjb.21.2014.08.07.03.15.44 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Aug 2014 03:15:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 7 Aug 2014 12:16:16 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140807101616.GU14848@jama>
References: <1407404618-32573-1-git-send-email-bobadeshrikant@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1407404618-32573-1-git-send-email-bobadeshrikant@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Shrikant Bobade <Shrikant_Bobade@mentor.com>
Subject: Re: [PATCH] gdk-pixbuf-native: add setscene dep on jpeg-native
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
X-List-Received-Date: Thu, 07 Aug 2014 10:15:55 -0000
X-Groupsio-MsgNum: 51480
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="udzYTtuEmHLUHegf"
Content-Disposition: inline

--udzYTtuEmHLUHegf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 07, 2014 at 03:13:38PM +0530, Shrikant Bobade wrote:
> From: Shrikant Bobade <Shrikant_Bobade@mentor.com>
>=20
> Without this, we can get setscene postinst failure due to libjpeg being
> unavailable.

This needs to go to oe-core ML.

>=20
> Signed-off-by: Christopher Larson <kergoth@gmail.com>
> Signed-off-by: Shrikant Bobade <Shrikant_Bobade@mentor.com>
> ---
>  meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb |    1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb b/meta/re=
cipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb
> index 3d08146..1248529 100644
> --- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb
> +++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb
> @@ -74,6 +74,7 @@ RDEPENDS_${PN}-ptest +=3D "gnome-desktop-testing"
> =20
>  PACKAGES_DYNAMIC +=3D "^gdk-pixbuf-loader-.*"
>  PACKAGES_DYNAMIC_class-native =3D ""
> +PIXBUFCACHE_SYSROOT_DEPS_class-native +=3D "jpeg-native:do_populate_sysr=
oot_setscene"
> =20
>  python populate_packages_prepend () {
>      postinst_pixbufloader =3D d.getVar("postinst_pixbufloader", True)
> --=20
> 1.7.9.5
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--udzYTtuEmHLUHegf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPjUfAACgkQN1Ujt2V2gBxYeQCfTuHQxzawWIkcB7Lt1xsbjak4
sSkAn2DxoF36eL5PkP4KnCYUG8CsK5+g
=z0dJ
-----END PGP SIGNATURE-----

--udzYTtuEmHLUHegf--
