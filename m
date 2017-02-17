Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 72FB47199B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Feb 2017 20:10:31 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id i10so6358881wrb.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Feb 2017 12:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=SUO+CtIRYoGQT27Tmap3oRn+WTDrmZjiP221bQYwq1Y=;
	b=WAuLd6XzNovVDBHzkIe6iTsTMJ2SX4+37/CVxMJcLAgA8eUytxwLWgf3/3MQT546YN
	HZpBfef4Qa/3hgWCWLeRcaBR2EBF6JVZ61iWBdSipoAJiT7ZXiWkJR1ateg3ag+HSKWv
	J7yz8PaveqzLF8JN2PPkaZxeHZM6htcDPbGO4O037WfcEs3xl+jYzheXjy6TAvtxF9/Q
	vp6yNlV0gqzEVz/lObb6baaFA0ypJ5KQPBLiVZsNsL3yLhaIwPfzi7sPvC/KUjoz1+ec
	YmQkW9YJLcyy98Jl1l0ZOzjrAEn3p8d+fj2eXekEB27eF2EgovNpvifYlS0FgiHMWElA
	HHag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=SUO+CtIRYoGQT27Tmap3oRn+WTDrmZjiP221bQYwq1Y=;
	b=htG9kERdpQB4PxciX2OIXC3YnNnDSITWRHyyxQni1QmWfLsmbO/wRq8wi9ag7i2k9/
	n9EMfc54IMUglNx9UUb3sG6Txa9MKM8UW29jncVNo4Vs2D5k4Ip9lUu6YrsAB1cKXP01
	oXn35El/5TBxRu61d8OL+Gg/W39eaLe7XZTpfuqG9ZwmWTNBLx8Q/JSrgwPASf5bpn/b
	J9vnOhHC97jdUEERkzWvMBAm03kechiAHlWwTqJXfml+r9zUT0QSBkBKZDwzubyGjoaK
	gNgF9+WmVh31srJV4gUrI2lLpnvthT6/sQC4ZCr8szG0Y8HP6ovtmvjP/P6rIo3LlQK3
	wDdQ==
X-Gm-Message-State: AMke39k3DXR2nsf/I4TLSUy59L3D5N5se2ftzVTsGhHz1j4UOZo+yQlqmfLO7a6LA8tsDg==
X-Received: by 10.223.164.66 with SMTP id e2mr7498951wra.47.1487362231268;
	Fri, 17 Feb 2017 12:10:31 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	191sm2909094wmo.21.2017.02.17.12.10.29
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 17 Feb 2017 12:10:30 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 17 Feb 2017 21:10:30 +0100
To: Frieder Schrempf <frieder.schrempf@exceet.de>
Message-ID: <20170217201030.GB3276@jama>
References: <CA+chaQd_O8+rQ10gRJqgXZt9zYdR7CowTKXD3trYPn-hXNZEhg@mail.gmail.com>
	<1487257558-3384-1-git-send-email-frieder.schrempf@exceet.de>
MIME-Version: 1.0
In-Reply-To: <1487257558-3384-1-git-send-email-frieder.schrempf@exceet.de>
User-Agent: Mutt/1.7.2 (2016-11-26)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5][PATCH] qtbase-native: nativesdk-qtbase: remove patch that breaks mkspec setting for SDK
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
X-List-Received-Date: Fri, 17 Feb 2017 20:10:31 -0000
X-Groupsio-MsgNum: 65293
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PmA2V3Z32TCmWXqI"
Content-Disposition: inline

--PmA2V3Z32TCmWXqI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 16, 2017 at 04:05:58PM +0100, Frieder Schrempf wrote:
> The patch 0008-configure-paths-for-target-qmake-properly.patch seems
> to be intended for the target, not for native/nativesdk, as it breaks
> the mkspec setting (sets linux-g++ instead of linux-oe-g++) by default.
>=20
> This issue is also described here:
> https://github.com/graugans/meta-udoo/issues/20#issuecomment-261241783

On which branch was this tested?

It doesn't apply for master:

OE @ ~/meta-qt5 $ pwam 137257
2017-02-17 21:07:37 URL:https://patchwork.openembedded.org/patch/137257/mbo=
x/ [2388] -> "pw-am-137257.patch" [1]
Applying: qtbase-native: nativesdk-qtbase: remove patch that breaks mkspec =
setting for SDK
error: patch failed: recipes-qt/qt5/nativesdk-qtbase_git.bb:33
error: recipes-qt/qt5/nativesdk-qtbase_git.bb: patch does not apply
error: patch failed: recipes-qt/qt5/qtbase-native_git.bb:28
error: recipes-qt/qt5/qtbase-native_git.bb: patch does not apply
Patch failed at 0001 qtbase-native: nativesdk-qtbase: remove patch that bre=
aks mkspec setting for SDK
The copy of the patch that failed is found in: .git/rebase-apply/patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

I've applied it manually for master, but next time please send patches reba=
sed and tested on recent master.

> Signed-off-by: Frieder Schrempf <frieder.schrempf@exceet.de>
> ---
>  recipes-qt/qt5/nativesdk-qtbase_git.bb | 1 -
>  recipes-qt/qt5/qtbase-native_git.bb    | 1 -
>  2 files changed, 2 deletions(-)
>=20
> diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nati=
vesdk-qtbase_git.bb
> index 47e204b..e64c30e 100644
> --- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
> +++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
> @@ -33,7 +33,6 @@ SRC_URI +=3D "\
>      file://0005-configure-bump-path-length-from-256-to-512-character.pat=
ch \
>      file://0006-QOpenGLPaintDevice-sub-area-support.patch \
>      file://0007-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.pat=
ch \
> -    file://0008-configure-paths-for-target-qmake-properly.patch \
>      file://0009-Reorder-EGL-libraries-from-pkgconfig-and-defaults.patch \
>      file://0010-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.pat=
ch \
>  "
> diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-=
native_git.bb
> index ec4a9b6..c6a847a 100644
> --- a/recipes-qt/qt5/qtbase-native_git.bb
> +++ b/recipes-qt/qt5/qtbase-native_git.bb
> @@ -28,7 +28,6 @@ SRC_URI +=3D "\
>      file://0005-configure-bump-path-length-from-256-to-512-character.pat=
ch \
>      file://0006-QOpenGLPaintDevice-sub-area-support.patch \
>      file://0007-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.pat=
ch \
> -    file://0008-configure-paths-for-target-qmake-properly.patch \
>      file://0009-Reorder-EGL-libraries-from-pkgconfig-and-defaults.patch \
>      file://0010-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.pat=
ch \
>  "
> --=20
> 2.7.4
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--PmA2V3Z32TCmWXqI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWKdYtQAKCRA3VSO3ZXaA
HCh8AJ4sRxkxGmbPTmcQvBlm9tmcGGIGUgCfco+EMvRiw0CdCMmQO/VuIZN8Uf0=
=zL66
-----END PGP SIGNATURE-----

--PmA2V3Z32TCmWXqI--
