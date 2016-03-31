Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6BFD86FF73
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2016 12:59:30 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id i204so21721642wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2016 05:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=dFNj383xip6fK2X16i5T7yMF0VgGGL0aEpf6InOx1qY=;
	b=BOxWtt/1Z+FcebQuu7jQE/qXp3LCemqSm5/rL0tZR/8NyFXOQn4M5xqXRYX952HLkX
	CEqKCmotGdKWlMYofz6W+MTYHYtGdvgRMYXy5Qhxbwp7aXTr72ti/TzsTKeg/IGEdltv
	JUrKvM2/BMXBetw/ar+ik9MEJ4GwBGMG/5ZcVPg5O3Sq4tW7YdxbWLKMo3HiGsmi7C2L
	ao+7l0laGdC0SukLqo/685UJIgt5eo9wtgjTHKxnTPXII1QfJy/jIljdmAIqkdN0vEeN
	FiGTlaDGQQiw9FNY5HVJ5buICk91aU4wYfHRXiXvqUrC3AVl4DIwfYVycpw3N9/tBqFK
	siVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=dFNj383xip6fK2X16i5T7yMF0VgGGL0aEpf6InOx1qY=;
	b=CUP3yk+GX07kqokTurNXoFP1+6Zi6ab4zLDre4aRi0dXoHrtHbJrlFb0tPKFkV9M1N
	DXHdoxHmpqD3YwGZWRnVcng7Et6xQJfhrBQMUE2Wfn51f0JO2m1I4bKd+ZfwJ6R7dLAm
	an7Fp3ut4eUK/4vzHSeADiKd780q43qUa4HoVaf2NTw/cYrqYerU1gxPpR0kNQoujNLq
	yO89ycd4BRgNjsct5PprhOMNLDLIJOsAvbWLbygQpjMwHqaDTC2+ukMEg4bUzGOgXXkx
	qx8J/8BkjfpbyF1/ac0Zbe1Z2wGaWgLXGnLhIMNEPI4bb/vtI97h6N5jqOaB3c6VpyVY
	98Aw==
X-Gm-Message-State: AD7BkJLODWZ3rjp2bQiDGO+gyH42A7oGURPZgiwtAPG/V4IWJwTpY6U+gPm4IDZ4NJfmHQ==
X-Received: by 10.194.85.161 with SMTP id i1mr16283164wjz.95.1459429170806;
	Thu, 31 Mar 2016 05:59:30 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id s9sm21263406wmf.0.2016.03.31.05.59.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 31 Mar 2016 05:59:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 31 Mar 2016 14:59:37 +0200
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Message-ID: <20160331125937.GC2540@jama>
References: <1459423593-4123-1-git-send-email-ricardo.ribalda@gmail.com>
	<1459423593-4123-7-git-send-email-ricardo.ribalda@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1459423593-4123-7-git-send-email-ricardo.ribalda@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v4 6/7] opencv: Fix build on x86 platform
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
X-List-Received-Date: Thu, 31 Mar 2016 12:59:31 -0000
X-Groupsio-MsgNum: 60751
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lc9FT7cWel8HagAv"
Content-Disposition: inline

--lc9FT7cWel8HagAv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 31, 2016 at 01:26:32PM +0200, Ricardo Ribalda Delgado wrote:
> OpenCV wrongly assumes that the X86 variable would be set on Intel 32
> bit architectures.
>=20
> This patch adds the missing definition on those cases.
>=20
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
>  meta-oe/recipes-support/opencv/opencv_3.1.bb | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta-oe/recipes-support/opencv/opencv_3.1.bb b/meta-oe/recip=
es-support/opencv/opencv_3.1.bb
> index 84a592799c0a..7f09168784d9 100644
> --- a/meta-oe/recipes-support/opencv/opencv_3.1.bb
> +++ b/meta-oe/recipes-support/opencv/opencv_3.1.bb
> @@ -41,6 +41,7 @@ EXTRA_OECMAKE =3D "-DPYTHON2_NUMPY_INCLUDE_DIRS:PATH=3D=
${STAGING_LIBDIR}/${PYTHON_DI
>                   ${@base_conditional("libdir", "/usr/lib64", "-DLIB_SUFF=
IX=3D64", "", d)} \
>                   ${@base_conditional("libdir", "/usr/lib32", "-DLIB_SUFF=
IX=3D32", "", d)} \
>  "
> +EXTRA_OECMAKE_append_x86 +=3D " -DX86=3DON"

Please don't combine _append and +=3D. _append and leading space in value
(as you already have) is enough.

> =20
>  PACKAGECONFIG ??=3D "eigen jpeg png tiff v4l libv4l gstreamer samples tb=
b \
>                     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gtk",=
 "", d)} \
> --=20
> 2.8.0.rc3
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--lc9FT7cWel8HagAv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlb9HzkACgkQN1Ujt2V2gBx8aQCfZC6jgIhKZKqEFAKjJCLj2HWN
5LEAoJ1mntJZxMC6NSR4+pCDB1R1jFxs
=bFSk
-----END PGP SIGNATURE-----

--lc9FT7cWel8HagAv--
