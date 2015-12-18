Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 60E0060616
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Dec 2015 11:27:07 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id l126so60929379wml.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Dec 2015 03:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=+FcS3HDujU9Y2Bszbp6KJdfamKRD9hOL9zlprdicaDI=;
	b=kibcdVXjEpw3jJ9ZAEoN38kYL2pzwFlVHJF+ib+UnyvooKqBM24UkM1MQNjZMr/pqj
	uw0BBqTViB//qHdPA0ZM2VYNkaSVpLmK7sfZdbgUidSC/d7Apegvd8G+UlmGGTfYA6Zx
	WCmafmpZMWArjS6KgRRcG+KuNU993qqmyPGPKRswU0Jtb3cwHe49dNKN3CRT7BnkCFpn
	Kf8S5iYtjKgg2ZHuJqe1p9Vt0maiQuf1nsHVeR2oj5Qq1318a0owk6bcE4fEBROIHXgp
	j+BZF5LQH20FVg8g53H9Cz4/bQRFxQqm7E6Q2O5pQhDxRqXeY4sQkfFJTpOGs3m4J9kg
	qmmg==
X-Received: by 10.194.175.194 with SMTP id cc2mr3436544wjc.121.1450438028127; 
	Fri, 18 Dec 2015 03:27:08 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	m16sm6309113wmb.13.2015.12.18.03.27.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Dec 2015 03:27:06 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 18 Dec 2015 12:29:39 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151218112939.GC2563@jama>
References: <564DC01B.4000103@videolan.org>
	<1447938897-26171-1-git-send-email-funman@videolan.org>
	<1447938897-26171-6-git-send-email-funman@videolan.org>
MIME-Version: 1.0
In-Reply-To: <1447938897-26171-6-git-send-email-funman@videolan.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-multimedia][PATCH 6/6] VLC: do not use --with-contrib
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
X-List-Received-Date: Fri, 18 Dec 2015 11:27:08 -0000
X-Groupsio-MsgNum: 59091
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5G06lTa6Jq83wMTw"
Content-Disposition: inline

--5G06lTa6Jq83wMTw
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2015 at 02:14:57PM +0100, Rafa=EBl Carr=E9 wrote:
> ---

I'll finally merge this patchset today, but can you please fix:

vlc-2.2.1: vlc rdepends on libvncserver, but it isn't a build dependency? [=
build-deps]

in follow-up change?

>  meta-multimedia/recipes-multimedia/vlc/vlc.inc | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multim=
edia/recipes-multimedia/vlc/vlc.inc
> index 99a6c66..ce3601d 100644
> --- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
> +++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
> @@ -22,7 +22,6 @@ REQUIRED_DISTRO_FEATURES =3D "x11"
>  ARM_INSTRUCTION_SET =3D "arm"
> =20
>  EXTRA_OECONF =3D "\
> -    --with-contrib \
>      --enable-run-as-root \
>      --enable-xvideo \=20
>      --disable-screen --disable-caca \
> --=20
> 2.5.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--5G06lTa6Jq83wMTw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZz7iIACgkQN1Ujt2V2gBzqKgCfX1Zn9dP5jLGuoW4dyL1ULqki
g0UAnRkSYIscFLKgstlXkbhO974QgotP
=DAqd
-----END PGP SIGNATURE-----

--5G06lTa6Jq83wMTw--
