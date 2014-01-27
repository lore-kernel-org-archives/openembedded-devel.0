Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f180.google.com (mail-ea0-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id 6A2896C765
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jan 2014 12:27:50 +0000 (UTC)
Received: by mail-ea0-f180.google.com with SMTP id o10so1713714eaj.39
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jan 2014 04:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Ar8ae4QSc8l6DJispQ6MdCjBiIg421nFS9iRudFyezA=;
	b=JSNgTzdMRz1laJKE9MrRiEbu0IWG6MAq+zeL6ixSdP7QKTdSMW/MbqSIi1BvmZOC/n
	AlJGoAzswF1JHG8Mqnl3848Lw+c7Yx4Y3N9rbVUOodGEJouMNkUFI9rCzfezTQ+MejyQ
	sVKP7eOLn8bwRpY/uKB96+eD+/jsVYkq9Qn088NkSDJvbAobOUAXOI0efvLhlMSBHRoj
	bW/WXPWXatJ+AoQ4Ya7QlNj70kZ3nv8PAH0We+38qKdQdbt9iWQaOSdG1Jr40dZCWLJz
	PQeeooWi3f7dc05KryQorsYFoP6Oh7js9+H/wQyhIaKoUETMAWHaWg0QF/IF+gtXztSO
	ZfkQ==
X-Received: by 10.14.88.5 with SMTP id z5mr835694eee.101.1390825671098;
	Mon, 27 Jan 2014 04:27:51 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	j46sm41886718eew.18.2014.01.27.04.27.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Jan 2014 04:27:50 -0800 (PST)
Date: Mon, 27 Jan 2014 13:27:55 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140127122755.GG3718@jama>
References: <1390816082-17372-1-git-send-email-urs@bytesatwork.ch>
MIME-Version: 1.0
In-Reply-To: <1390816082-17372-1-git-send-email-urs@bytesatwork.ch>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-oe][PATCH] v4l-utils: removed dependency to x11, no need for it
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
X-List-Received-Date: Mon, 27 Jan 2014 12:27:50 -0000
X-Groupsio-MsgNum: 47914
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9sSKoi6Rw660DLir"
Content-Disposition: inline

--9sSKoi6Rw660DLir
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 27, 2014 at 10:48:02AM +0100, Urs F=E4ssler wrote:
> ---
>  meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb b/met=
a-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb
> index 6737870..0f6157f 100644
> --- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb
> +++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D48da9957849056=
017dc568bbc43d8975 \
> =20
>  PR =3D "r2"
> =20
> -DEPENDS =3D "jpeg virtual/libx11"
> +DEPENDS =3D "jpeg"

See:
http://git.linuxtv.org/v4l-utils.git/blob/HEAD:/configure.ac#l82

and

commit fa4d5d1fbdd44a7511c7749263a000fd82d831f8
Author: Martin Jansa <Martin.Jansa@gmail.com>
Date:   Sun Aug 25 23:30:44 2013 +0200

    v4l-utils: Add libx11 dependency

    * configure doesn't allow to explicitly disable it

    Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

If you want to disable it, then patch the configure.ac and add PACKAGECONFI=
G here.

Don't forget to add SOB line when sending v2.

>  inherit autotools gettext
> =20
> --=20
> 1.7.10.4
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--9sSKoi6Rw660DLir
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLmUMsACgkQN1Ujt2V2gBxjRwCfXxPtNOLwJat8gHnL+PaueNCW
3goAn2mqGMF0DNuCNoZl9H4mouWhe8P3
=N+yz
-----END PGP SIGNATURE-----

--9sSKoi6Rw660DLir--
