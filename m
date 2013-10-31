Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 7BDC86A467
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2013 09:34:53 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id e51so1216342eek.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2013 02:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=6t7BtkO5CQKOn4xnZdax2wZwPpaDDotwFb8/Vif8hko=;
	b=h2lMR7JkXQMqVFKQRidkOOasbwrkBCqZRy6KnTYA5Xgk6GhFe34kFSxOJR72B81NOy
	G2p/qJnFIG069INlvPayL2CUdWXeRg1pinvDF9r1o7WDCZs20hF8KfaGLFCFU7k5T1Ht
	KR+KY2cd0Q3+HrlZ9ud5qJRjYXIkH86ucUFbODjgTaNBBtBBmBbtQBUsLykODQa+zt+T
	nsraSHxpiMhwy8UMI3+B+OK4f9O1czWDvYT/kqkx7Qt/OyKNm35QEOCjSZTqZzL6pxd2
	/Il84rxGyImkHg36GBIOkRTNXVAlysU8i3RFGUrmquokxAA+VL7vdQ0Jd6Dxk0POouqR
	jUww==
X-Received: by 10.15.31.9 with SMTP id x9mr2016321eeu.53.1383212094524;
	Thu, 31 Oct 2013 02:34:54 -0700 (PDT)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id h45sm6253566eeg.5.2013.10.31.02.34.53
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 31 Oct 2013 02:34:53 -0700 (PDT)
Date: Thu, 31 Oct 2013 10:34:55 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131031093455.GG32015@jama>
References: <1383061563-7976-1-git-send-email-s.stirtzel@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1383061563-7976-1-git-send-email-s.stirtzel@googlemail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-oe][PATCH] utouch-mtview: Add missing dependency to libx11
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
X-List-Received-Date: Thu, 31 Oct 2013 09:34:54 -0000
X-Groupsio-MsgNum: 46956
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KIzF6Cje4W/osXrF"
Content-Disposition: inline

--KIzF6Cje4W/osXrF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 29, 2013 at 04:46:03PM +0100, Samuel Stirtzel wrote:
> Also added RDEPENDS to virtual/xserver since this program cannot be used =
without X
>=20
> Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
> ---
>  .../recipes-support/utouch/utouch-mtview_git.bb    |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-support/utouch/utouch-mtview_git.bb b/meta-o=
e/recipes-support/utouch/utouch-mtview_git.bb
> index 0f72479..973d509 100644
> --- a/meta-oe/recipes-support/utouch/utouch-mtview_git.bb
> +++ b/meta-oe/recipes-support/utouch/utouch-mtview_git.bb
> @@ -10,7 +10,9 @@ inherit autotools
>  SRC_URI =3D "git://bitmath.org/git/mtview.git;protocol=3Dhttp"
>  SRCREV =3D "ad437c38dc111cf3990a03abf14efe1b5d89604b"
> =20
> -DEPENDS +=3D "mtdev utouch-frame utouch-evemu"
> +DEPENDS +=3D "mtdev utouch-frame utouch-evemu libx11"
> +
> +RDEPENDS +=3D "virtual/xserver"

1) it's RDEPENDS_${PN}
2) you cannot use virtual/foo for runtime dependencies - use
VIRTUAL-RUNTIME_foo (in this case it doesn't work well use XSERVER
variable or packagegroup-core-x11-xserver or just drop it and let
user to do the right thing - I think we have a lot of x11 apps without
this runtime dependency explicitly set).

> =20
>  PV =3D "1.1.7+git${SRCPV}"
> =20
> --=20
> 1.7.9.5
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--KIzF6Cje4W/osXrF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlJyJD8ACgkQN1Ujt2V2gBzOYwCgp4B1uiIh8D70CGme60QQ8ULm
/IAAoLWGTB8xGDO/FUJdEAias7uy671r
=odsh
-----END PGP SIGNATURE-----

--KIzF6Cje4W/osXrF--
