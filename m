Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f53.google.com (mail-wg0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 6D71E72886
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Dec 2014 17:45:06 +0000 (UTC)
Received: by mail-wg0-f53.google.com with SMTP id l18so15930517wgh.26
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Dec 2014 09:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Q+yDygYgtlPo7neHJOjdBmkfvQ2uoHulHqdBwtRc9zk=;
	b=KwA/O0mUQDmll9VigVVwHzZ2SKxJ+mC8/77g1StOFjqsLMGcmsQfI19mnIThRbb+VS
	ruTyOxlbMZ5mVWA9YHSLYWqWGc4GrJY/LuTrl9Ue2zMI3WAb+QVbm3nO0SzijMdCNABc
	fYSySdjWs5+qGiDIM7XwGWw5UfJ/NxR3BBAImd/75yzS54CodIf/HWJYjDKPCT7ef2Rd
	gy2RtpUzqzuBeGJBrDFIFNPpSFMILbiHKYaNfxmW6/G2KgmEaVLXP8VxM3arBtKsEWgs
	PKyzyOuck/WzQBkaSKR7Ko/wQKKeX2h8lKDXiSyr6lfxHK2EREqwk4quKXvgD5I4vo+j
	lrjA==
X-Received: by 10.180.205.163 with SMTP id lh3mr80477743wic.63.1419702306794; 
	Sat, 27 Dec 2014 09:45:06 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	u9sm42969749wjy.37.2014.12.27.09.45.05
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 27 Dec 2014 09:45:05 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 27 Dec 2014 18:45:13 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141227174513.GH2465@jama>
References: <cover.1419700394.git.akuster808@gmail.com>
	<8769665d9efb22405435d730c01c1a41d7251b29.1419700394.git.akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <8769665d9efb22405435d730c01c1a41d7251b29.1419700394.git.akuster808@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: otavio@ossystems.com.br
Subject: Re: [PATCH 27/27] xf86-video-glamo: fix build with xserver 1.16
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
X-List-Received-Date: Sat, 27 Dec 2014 17:45:09 -0000
X-Groupsio-MsgNum: 53489
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rCb8EA+9TsBVtA92"
Content-Disposition: inline

--rCb8EA+9TsBVtA92
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 27, 2014 at 09:22:14AM -0800, Armin Kuster wrote:
> From: Martin Jansa <Martin.Jansa@gmail.com>

This shoudn't be needed in dizzy which has old enough xserver.

> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  ...-glamo.h-use-const-for-jbt6k74_state_path.patch | 29 ++++++++++++++++=
++++++
>  .../xorg-driver/xf86-video-glamo_git.bb            |  1 +
>  2 files changed, 30 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo=
/0004-glamo.h-use-const-for-jbt6k74_state_path.patch
>=20
> diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo/0004-g=
lamo.h-use-const-for-jbt6k74_state_path.patch b/meta-oe/recipes-graphics/xo=
rg-driver/xf86-video-glamo/0004-glamo.h-use-const-for-jbt6k74_state_path.pa=
tch
> new file mode 100644
> index 0000000..a820371
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo/0004-glamo.h-=
use-const-for-jbt6k74_state_path.patch
> @@ -0,0 +1,29 @@
> +From 180a00634f351a09ceabc5695d8e1acc3e585501 Mon Sep 17 00:00:00 2001
> +From: Martin Jansa <Martin.Jansa@gmail.com>
> +Date: Fri, 12 Dec 2014 12:00:10 +0100
> +Subject: [PATCH] glamo.h: use const for jbt6k74_state_path
> +
> +* fix build issue with xserver 1.16:
> +  glamo-driver.c:501:32: error: assignment discards 'const' qualifier fr=
om pointer target type [-Werror]
> +
> +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> +---
> + src/glamo.h | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/glamo.h b/src/glamo.h
> +index 5fd5c04..5e072be 100644
> +--- a/src/glamo.h
> ++++ b/src/glamo.h
> +@@ -148,7 +148,7 @@ typedef struct {
> + #endif
> +=20
> + #ifdef JBT6K74_SET_STATE
> +-    char *jbt6k74_state_path;
> ++    const char *jbt6k74_state_path;
> +     char saved_jbt6k74_state[14];
> + #endif
> +=20
> +--=20
> +2.1.3
> +
> diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb=
 b/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb
> index 38c12f3..78c6564 100644
> --- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb
> +++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb
> @@ -14,6 +14,7 @@ SRC_URI =3D "git://git.openmoko.org/git/xf86-video-glam=
o.git;branch=3Dmaster \
>             file://0001-fix-build-with-KMS-disabled.patch \
>             file://0003-glamo-driver-adapt-to-xserver-0.13-video-API.patc=
h \
>             file://0001-glamo-driver-remove-references-to-mibstore.patch =
\  =20
> +           file://0004-glamo.h-use-const-for-jbt6k74_state_path.patch \
>  "
> =20
>  S =3D "${WORKDIR}/git"
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--rCb8EA+9TsBVtA92
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSe8CkACgkQN1Ujt2V2gBxE+QCdH+RtMHWthxTJsAWtgHZPE1Oy
D8wAn1AeTxP5st5U8UZHL9h3Ix+riDv/
=bxaL
-----END PGP SIGNATURE-----

--rCb8EA+9TsBVtA92--
