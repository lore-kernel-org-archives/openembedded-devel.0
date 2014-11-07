Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 0899371F99
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Nov 2014 14:18:35 +0000 (UTC)
Received: by mail-wg0-f50.google.com with SMTP id z12so3828462wgg.37
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Nov 2014 06:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=iLXQSEGNC1Wm1ccXECbPrQuGggDah4SzYyWmWpgSZNM=;
	b=iW1h46xqu1O1omQ75vSDydFAGaChYbuJ4k/wZ+UjaYgGYYMu3Q6eif0qTzdW5CyY9h
	TTvgMJWrp/qDGBpO69TNzMiZxTZVr3PZucqoQRDb6BKTEknLJzr7Zv+2KWoCmW3sfKuT
	oRXDHi/iZPOweJ35zSFgg+Nwgnpo1llB8gNITLBhKUb4PT2xrdifmXg6IzuDFOF9E6cF
	4THFdxeyaNAP8ZKbeh80qPxj/jmF8x8swdFoWNqY9haZvey+Sd4Ik2Jq+dDmE2E8GGlP
	pYAFdCshMKLdZgV48iXR395Y0efX1jCfx1wBrRhTIcVQhdQ+sxYHIrkXBzatRv6uiUY1
	sF0w==
X-Received: by 10.194.23.10 with SMTP id i10mr16394512wjf.11.1415369915824;
	Fri, 07 Nov 2014 06:18:35 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	td9sm2214620wic.15.2014.11.07.06.18.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Nov 2014 06:18:35 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 7 Nov 2014 15:18:40 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141107141840.GB2444@jama>
References: <1415353921-20973-1-git-send-email-qianl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1415353921-20973-1-git-send-email-qianl.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH] xgamma: Add new recipes
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
X-List-Received-Date: Fri, 07 Nov 2014 14:18:45 -0000
X-Groupsio-MsgNum: 52769
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="i0/AhcQY5QxfSsSZ"
Content-Disposition: inline

--i0/AhcQY5QxfSsSZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 07, 2014 at 05:52:01PM +0800, Qian Lei wrote:
> xgamma allows X users to query and alter the gamma correction of a
> monitor via the X video mode extension (XFree86-VidModeExtension).
>=20
> Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
> ---
>  meta-oe/recipes-graphics/xorg-app/xgamma_1.0.3.bb | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/xorg-app/xgamma_1.0.3.bb
>=20
> diff --git a/meta-oe/recipes-graphics/xorg-app/xgamma_1.0.3.bb b/meta-oe/=
recipes-graphics/xorg-app/xgamma_1.0.3.bb
> new file mode 100644
> index 0000000..48240c0
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/xorg-app/xgamma_1.0.3.bb
> @@ -0,0 +1,17 @@
> +require xorg-app-common.inc
> +
> +SUMMARY =3D "X.Org X11 X client utilities"
> +
> +DESCRIPTION =3D "xgamma allows X users to query and alter the gamma \
> +correction of a monitor via the X video mode extension."
> +
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dac9801b8423fd7a7699ccbd45cf13=
4d8"
> +
> +PR =3D "${INC_PR}.0"

I've dropped this PR when cherry-picking to master-next

> +
> +DEPENDS +=3D "libxxf86vm"
> +
> +BBCLASSEXTEND =3D "native"
> +
> +SRC_URI[md5sum] =3D "e8a88bf1a18f35b724619849dca97f4f"
> +SRC_URI[sha256sum] =3D "e5eb2588fbbdc5c2db5571b304204487a9c22eed15ac6cb8=
16f605ec403e6e1a"
> --=20
> 1.8.4.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--i0/AhcQY5QxfSsSZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlRc1MAACgkQN1Ujt2V2gBy3HQCgtI4XOg/hVelh/mcCe3QmtOpr
TPgAoKXIGn/AYX7vr7kzCOt3Z1P+qlXN
=ZOC4
-----END PGP SIGNATURE-----

--i0/AhcQY5QxfSsSZ--
