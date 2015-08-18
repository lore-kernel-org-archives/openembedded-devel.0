Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 3CBCC60043
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2015 10:28:45 +0000 (UTC)
Received: by wijp15 with SMTP id p15so96501826wij.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2015 03:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=mzG5wsYbClWaTu8uWiRTTR2p+Ego92utbX9eooVEgQo=;
	b=c06XTgFpthahpzOQMkIxf+QwXIycMTgMfsolfjFPewZeXaXbF0iLOQyS8t/n+yJL+s
	36j1tJhr9D1tvePQF7gJOu23/iOYgb7nNQblPxnIOZbOSeIt+YdNSo5eDv8jjtuvJJO9
	bmLApeiy9HZJncN3dn1Mh10ZvAWjBdFBOombaCiWd9vjiMc2DJ4qYNkxpEcqWjY1Ht/V
	EH96jBbcEVPpMTvVVVhBEGgk7AxoQqZ3ziuj9SFryNUP3Q2F+M6tYxTPSPlH+9N3NnHa
	KxW11uBYc8/SUUjjH8+IbQY8tfX9NsWPybLN1p4yKasKg3B55EEf93qZWS1e8UMuPj/T
	8Zsg==
X-Received: by 10.194.133.73 with SMTP id pa9mr12072358wjb.148.1439893725721; 
	Tue, 18 Aug 2015 03:28:45 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	i1sm25842189wjq.42.2015.08.18.03.28.44
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Aug 2015 03:28:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 18 Aug 2015 12:28:48 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150818102848.GJ2458@jama>
References: <1439879362-27029-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1439879362-27029-1-git-send-email-rongqing.li@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH][meta-oe] cryptsetup: upgrade 1.6.6 -> 1.6.7
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
X-List-Received-Date: Tue, 18 Aug 2015 10:28:47 -0000
X-Groupsio-MsgNum: 56765
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BEa57a89OpeoUzGD"
Content-Disposition: inline

--BEa57a89OpeoUzGD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2015 at 02:29:22PM +0800, rongqing.li@windriver.com wrote:
> From: Roy Li <rongqing.li@windriver.com>
>=20
> 1.6.7 is a bugfix release.

Duplicates:
commit 4233630de77d52718adc2d624288a4d3b3d7dede
Author: leimaohui <leimaohui@cn.fujitsu.com>
Date:   Fri Jul 31 11:44:14 2015 +0800

    cryptsetup: upgrade 1.6.6->1.6.7


>=20
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  .../cryptsetup/{cryptsetup_1.6.6.bb =3D> cryptsetup_1.6.7.bb}           =
| 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-support/cryptsetup/{cryptsetup_1.6.6.bb =3D> cryp=
tsetup_1.6.7.bb} (89%)
>=20
> diff --git a/meta-oe/recipes-support/cryptsetup/cryptsetup_1.6.6.bb b/met=
a-oe/recipes-support/cryptsetup/cryptsetup_1.6.7.bb
> similarity index 89%
> rename from meta-oe/recipes-support/cryptsetup/cryptsetup_1.6.6.bb
> rename to meta-oe/recipes-support/cryptsetup/cryptsetup_1.6.7.bb
> index d84ad2f..939ee35 100644
> --- a/meta-oe/recipes-support/cryptsetup/cryptsetup_1.6.6.bb
> +++ b/meta-oe/recipes-support/cryptsetup/cryptsetup_1.6.7.bb
> @@ -12,8 +12,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D32107dd283b1=
dfeb66c9b3e6be312326"
>  DEPENDS =3D "util-linux lvm2 popt libgcrypt"
> =20
>  SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/${BPN}/v1.6/${BP}.tar.xz"
> -SRC_URI[md5sum] =3D "179c0781de59838a4e39f61b2df5ea48"
> -SRC_URI[sha256sum] =3D "2d2ce28e4e1137dd599d87884b62ef6dbf14fd7848b2a2bf=
7d61cf125fbd8e6f"
> +SRC_URI[md5sum] =3D "918406eb5d2e2f5a7348c432ea9b1473"
> +SRC_URI[sha256sum] =3D "c23c24c8d662032da8650c1c84985221be8bbedf4737c154=
0bba7e4517dfe820"
> =20
>  inherit autotools gettext pkgconfig
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

--BEa57a89OpeoUzGD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXTCOAACgkQN1Ujt2V2gBxe2QCgr90QhVQQlb5kQcfi0e5gBOYD
cnUAoLYpxqK8NNcko8Av5yvnfpaM683g
=Dn/1
-----END PGP SIGNATURE-----

--BEa57a89OpeoUzGD--
