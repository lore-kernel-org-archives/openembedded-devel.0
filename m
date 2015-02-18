Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id B6D7565C85
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Feb 2015 16:09:18 +0000 (UTC)
Received: by mail-wg0-f44.google.com with SMTP id k14so2101268wgh.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Feb 2015 08:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=MleS7lwGbRcon8BfwFnZ4ehaG/uxYxjIDEJbWLEYYLI=;
	b=CZ+Xsw3/nU/bHKcGIX8qyS4IhMKQKzfeVawppndnh7jOfLYVDUTxkgACusols0iocw
	62hxpTZMuqNVMYzSm46Oy1blD2YUxIfjChf3dMnzKrBH9GgVyu+X2Mj9mPGZPqbggBAr
	dq48SWByvZe9bP9eofL76DJDBABjp15jTJ4STxDv2gmG7x3Yv/J31uBGo8ofsQJV1jY3
	BFgilyqVwU7EzDeQAyW0Aank5hFgWQTa+ZtuUjT26GUFT3D5lGWkGQMzHD/Ipe8/cW5/
	DmqqXp7ZEW07bn7UturvvzyfeAL6+e/0H3j66WFzYLEyMhEQFDqM7Ux7JVraz0v/FP0W
	Id/w==
X-Received: by 10.180.21.210 with SMTP id x18mr6177126wie.78.1424275757399;
	Wed, 18 Feb 2015 08:09:17 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	di11sm30095458wid.8.2015.02.18.08.09.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 Feb 2015 08:09:16 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 18 Feb 2015 17:09:19 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150218160919.GB2276@jama>
References: <1422338033-18521-1-git-send-email-schnitzeltony@googlemail.com>
	<1422338033-18521-2-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1422338033-18521-2-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-qt5][PATCH 1/5] qtbase: remove patches required for native(-sdk) only
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
X-List-Received-Date: Wed, 18 Feb 2015 16:09:21 -0000
X-Groupsio-MsgNum: 54380
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2B/JsCI69OhZNC5r"
Content-Disposition: inline

--2B/JsCI69OhZNC5r
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 27, 2015 at 06:53:49AM +0100, Andreas M=FCller wrote:
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>

Are you sure these are useful only for native(sdk) only?

FYI: I'm updating your patches for latest revision in 5.4 branch, I'll
update them together with 5.4.1 recipes (when 5.4.1 is released).

Regards,

> ---
>  recipes-qt/qt5/qtbase.inc    | 2 --
>  recipes-qt/qt5/qtbase_git.bb | 2 --
>  2 files changed, 4 deletions(-)
>=20
> diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
> index 5b2c08c..a8748ef 100644
> --- a/recipes-qt/qt5/qtbase.inc
> +++ b/recipes-qt/qt5/qtbase.inc
> @@ -5,8 +5,6 @@ SRC_URI +=3D "\
>      file://0001-Add-linux-oe-g-platform.patch \
>      file://0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.pat=
ch \
>      file://0003-Add-external-hostbindir-option.patch \
> -    file://0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.pat=
ch \
> -    file://0005-qt_module-Fix-pkgconfig-and-libtool-replacements.patch \
>      file://0006-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch=
 \
>      file://0007-qeglplatformintegration-Undefine-CursorShape-from-X..pat=
ch \
>      file://0008-configure-bump-path-length-from-256-to-512-character.pat=
ch \
> diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
> index f67ea16..611e19a 100644
> --- a/recipes-qt/qt5/qtbase_git.bb
> +++ b/recipes-qt/qt5/qtbase_git.bb
> @@ -10,8 +10,6 @@ SRC_URI +=3D "\
>      file://0001-Add-linux-oe-g-platform.patch \
>      file://0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.pat=
ch \
>      file://0003-Add-external-hostbindir-option.patch \
> -    file://0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.pat=
ch \
> -    file://0005-qt_module-Fix-pkgconfig-and-libtool-replacements.patch \
>      file://0006-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch=
 \
>      file://0007-qeglplatformintegration-Undefine-CursorShape-from-X..pat=
ch \
>      file://0008-configure-bump-path-length-from-256-to-512-character.pat=
ch \
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

--2B/JsCI69OhZNC5r
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlTkuS8ACgkQN1Ujt2V2gBy24gCfTj0b5r6neTGGBP8sMm7tK2WB
qegAnRm2HOp1FedOTJFF4UuMij/yyJvh
=3mAu
-----END PGP SIGNATURE-----

--2B/JsCI69OhZNC5r--
