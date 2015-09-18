Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 7767E77011
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Sep 2015 12:45:26 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so29505902wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Sep 2015 05:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=XbT2Kh42ppN/IFug0JfrIF5GLZtU22UgeUtYV0ViRw0=;
	b=MP37Ch07fJOchkB5Tm1fjzBZ9tx5wKHViXVUeRwOB0cTR2wNuPgGR7gn92bT7bVwn+
	cbB6Pls5zPoky1DcvUcpWGW9o7DPYe4stGv4+A5YSfgexcBZj1FrljFNZOh9vETspIvU
	Al6ThzFMC0Yb0+HfRCQ95As16gR5B2uR1HaaZpmojlSCFTQ2iwUvBGvEDnMDUqx0unhu
	nd1G4lBnBRe4RHSyY9Q9dq1HrFSZxR0sIfZnzY0lFZI+taHFQ4FpJTf/j86Bpflj31p3
	qdYqEZ0Q63VTML70eYG5q46+iVmG5kYD/hp/NIIzn+EbM+sGcv7E1c8G+7OaK9wCtCTG
	ORrQ==
X-Received: by 10.194.63.43 with SMTP id d11mr7781117wjs.40.1442580326912;
	Fri, 18 Sep 2015 05:45:26 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	l17sm8736654wjr.18.2015.09.18.05.45.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Sep 2015 05:45:26 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 18 Sep 2015 14:45:47 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150918124547.GC11095@jama>
References: <1441726980-32656-1-git-send-email-schnitzeltony@googlemail.com>
	<1441726980-32656-5-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1441726980-32656-5-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH 4/9] evolution-data-server: fix locale installation path
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
X-List-Received-Date: Fri, 18 Sep 2015 12:45:28 -0000
X-Groupsio-MsgNum: 57458
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mvpLiMfbWzRoNl4x"
Content-Disposition: inline

--mvpLiMfbWzRoNl4x
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 08, 2015 at 05:42:55PM +0200, Andreas M=FCller wrote:
> fixes:
>=20
> WARNING: QA Issue: evolution-data-server: Files/directories were installe=
d but not shipped in any package:
>   /usr/locale
>   /usr/locale/xh
>   /usr/locale/hu
>   /usr/locale/nn
>   /usr/locale/fi
> ...

Can you check the same issue in gnome-themes-2.32.1 ? It would make my
qa.log a lot shorter :).

>=20
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  ...6-configure.ac-do-not-overwrite-localedir.patch | 34 ++++++++++++++++=
++++++
>  .../recipes-gnome/eds/evolution-data-server_git.bb |  1 +
>  2 files changed, 35 insertions(+)
>  create mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/00=
06-configure.ac-do-not-overwrite-localedir.patch
>=20
> diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server/0006-conf=
igure.ac-do-not-overwrite-localedir.patch b/meta-gnome/recipes-gnome/eds/ev=
olution-data-server/0006-configure.ac-do-not-overwrite-localedir.patch
> new file mode 100644
> index 0000000..741e5e9
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/eds/evolution-data-server/0006-configure.a=
c-do-not-overwrite-localedir.patch
> @@ -0,0 +1,34 @@
> +From 3feaea8e84b3ad8dc2d551e42224f3b4a9413e7d Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googlem=
ail.com>
> +Date: Thu, 3 Sep 2015 11:14:24 +0200
> +Subject: [PATCH] configure.ac: do not overwrite localedir
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Upstream-Status: Backport [1]
> +
> +[1] https://git.gnome.org/browse/evolution-data-server/tree/configure.ac=
#n298
> +
> +Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> +---
> + configure.ac | 3 ---
> + 1 file changed, 3 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index f1d4ce8..cee847f 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -257,9 +257,6 @@ GETTEXT_PACKAGE=3Devolution-data-server-$BASE_VERSION
> + AC_SUBST(GETTEXT_PACKAGE)
> + AC_DEFINE_UNQUOTED(GETTEXT_PACKAGE, "$GETTEXT_PACKAGE", [Package name f=
or gettext])
> +=20
> +-localedir=3D'$(prefix)/$(DATADIRNAME)/locale'
> +-AC_SUBST(localedir)
> +-
> + dnl ******************************
> + dnl Initialize libtool
> + dnl ******************************
> +--=20
> +2.1.0
> +
> diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb b/=
meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb
> index 7c935a3..426076f 100644
> --- a/meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb
> +++ b/meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb
> @@ -22,6 +22,7 @@ SRC_URI =3D " \
>      file://0003-Disable-Werror-for-automake.patch \
>      file://0004-configure-Fix-libical-pkg-config-trying-to-use-host-.pat=
ch \
>      file://0005-soup-adapt-to-new-libxml2-API-from-2.9.0.patch \
> +    file://0006-configure.ac-do-not-overwrite-localedir.patch \
>      file://iconv-detect.h \
>  "
> =20
> --=20
> 2.1.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--mvpLiMfbWzRoNl4x
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlX8B3kACgkQN1Ujt2V2gByjKwCfY2m8nukbx/UI2RfvZQXQ4R17
YX4AnjdGb4A29VTjO5uEU1jeWWImVbYf
=kzm/
-----END PGP SIGNATURE-----

--mvpLiMfbWzRoNl4x--
