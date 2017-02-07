Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id DE1DC71997
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Feb 2017 12:00:34 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id o16so5448041wra.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Feb 2017 04:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=5JAUxYAuCyMG1hWEpFJXxVuIYNBCmwxlbWdZ1CEvrhs=;
	b=rjh1lSVelifH8SPiIcEN+2aS2GBcz5IJ4a6R4NK8j5fxmqSj5Mu/fHkJvzbGhVIrnx
	gQWnFSeEit9x6/YGYP/PqC7hWy1XV9MMgjoaO9w93yo32DzCK2yjLABikavuMVzsZyi2
	JT36aVGe/dEJND2vyKXScrM25XnrQBTWkMRg0OOa1CoS+Wvwnr3fKXESD90MKbA28Ohv
	UgIhRF/U5/FHy3yHZUO7fJarH3lzB5iwhY5lsUK7RKY8YVqFl6I5/G1dXyKrjXSupfJj
	1MkIw0dS4LVSD5K5gGyQkly1AJe98eAQcyahnSsdjLSCYH/s7H8BjaK8dhKkg+CUBRf+
	4E2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=5JAUxYAuCyMG1hWEpFJXxVuIYNBCmwxlbWdZ1CEvrhs=;
	b=CM/cRzYnTSn/N5/cvmtoisUfaUV/AjR9o4cTxhIEgJaBbWZ2VzVcEvTTbwLZfZIyHB
	kv14CCs03t3MS08Wjpu0XTcHzgT7kR0p+ozflau/Dz0LIK8wLSCYTI86DKaxbwI0YsSm
	DhzwQe8yq6uhwxaVG5H+4qEPgZOqdmo2Xkk+B2OnwvyKSbHvV/hSP9IHJAgOPNJWYyuY
	UYsrX4xGlLidEgsuB6gf0UgjUwYidrDU0artyQqOTpu+gRqAxgiAInTfkwpIIoD+3PoJ
	rA7gU2RAD2u6py50bVaNzEXv7Yru/Fo5ZrwPfzIgEx622AvOfTlquFyz2ATaZq8cIBTr
	rVPA==
X-Gm-Message-State: AIkVDXIF5Ive/3zyXM24sVo7iH/jIo16HyFmZG1R4xrzPkCM1SlFZibHZLtIALOUL1eBtg==
X-Received: by 10.223.174.199 with SMTP id y65mr16825662wrc.19.1486468834594; 
	Tue, 07 Feb 2017 04:00:34 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id h3sm7014467wrb.31.2017.02.07.04.00.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 07 Feb 2017 04:00:33 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 7 Feb 2017 13:00:34 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20170207120034.GC3276@jama>
References: <1485557640-10259-1-git-send-email-tom.hochstein@nxp.com>
MIME-Version: 1.0
In-Reply-To: <1485557640-10259-1-git-send-email-tom.hochstein@nxp.com>
User-Agent: Mutt/1.7.2 (2016-11-26)
Subject: Re: [meta-qt5][PATCH v2] qt3d: Add assimp dependency
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
X-List-Received-Date: Tue, 07 Feb 2017 12:00:35 -0000
X-Groupsio-MsgNum: 65019
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="adJ1OR3c6QgCpb/j"
Content-Disposition: inline

--adJ1OR3c6QgCpb/j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 27, 2017 at 04:54:00PM -0600, Tom Hochstein wrote:
> Fix build error:
>=20
> fatal error: assimp/Importer.hpp: No such file or directory

I'm was able to build qt3d without this dependency, is there something
in your config which enabled it? Or is it autodetected from sysroot
which wont be an issue anymore with master and RSS, but your change
doesn't fix the autodetection for older branches.

> Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
> ---
>  recipes-qt/qt5/qt3d_git.bb | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/recipes-qt/qt5/qt3d_git.bb b/recipes-qt/qt5/qt3d_git.bb
> index 2276c36..7c31213 100644
> --- a/recipes-qt/qt5/qt3d_git.bb
> +++ b/recipes-qt/qt5/qt3d_git.bb
> @@ -19,6 +19,7 @@ PACKAGECONFIG ??=3D ""
>  PACKAGECONFIG_class-native ??=3D "tools-only"
>  PACKAGECONFIG_class-nativesdk ??=3D "tools-only"
>  PACKAGECONFIG[tools-only] =3D "CONFIG+=3Dtools-only"
> +PACKAGECONFIG[assimp] =3D ",,assimp"
> =20
>  EXTRA_QMAKEVARS_PRE +=3D "${PACKAGECONFIG_CONFARGS}"
> =20
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

--adJ1OR3c6QgCpb/j
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWJm24gAKCRA3VSO3ZXaA
HOicAKC7FBSQc8XRbjq+yKfuKQ2jnJUhywCeM0G5dUoS9FXjVUcZ32jsUMmQtHY=
=uYCV
-----END PGP SIGNATURE-----

--adJ1OR3c6QgCpb/j--
