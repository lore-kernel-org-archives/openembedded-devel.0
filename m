Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 43076714D7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Nov 2014 14:30:34 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id ex7so5525473wid.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Nov 2014 06:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=gDOiAi9zQyaDzjsavTRzNlpVpjoxWUXTW8U7xHEQ29k=;
	b=0BCoxkp7ipKcWqPOCafVrolPOzROLUmPRMCbsV+Ad2gHJds7C+8my0iB2JS0/19Kig
	eTfEOB2pbqTeGPEaYSPXjA+b7d3YrdZY98eUvtvgNRmtggr8DE+r3Ay/6ED8RZnQLhnV
	2fagnPUtQlkUrGKKN8EMbKCbDJeIx1G5bbGGANDnabHEWrLjfp33jTMW/UW0sks801b3
	BOZbqQMWc+BT2B98X1nZwjehjewSRrYr+2lcyLxXmkB0Xtr1Lnf3zNLL5M+GD1rqHbTT
	i6jAIOb8DHiNoxixeLxADny0At4T4G3tdpQP1SSh59bNnw70/0FzJ97CEsu/upFrzTdB
	crTQ==
X-Received: by 10.180.90.197 with SMTP id by5mr6334062wib.50.1416407434208;
	Wed, 19 Nov 2014 06:30:34 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	t7sm2516382wjy.24.2014.11.19.06.30.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Nov 2014 06:30:33 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 19 Nov 2014 15:30:34 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141119143034.GE3315@jama>
References: <1415699805-2199-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1415699805-2199-1-git-send-email-lixin.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH] iceauth:upgrade to 1.0.6
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
X-List-Received-Date: Wed, 19 Nov 2014 14:30:37 -0000
X-Groupsio-MsgNum: 52930
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+SfteS7bOf3dGlBC"
Content-Disposition: inline

--+SfteS7bOf3dGlBC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 11, 2014 at 05:56:45PM +0800, Li xin wrote:
> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ---
>  meta-oe/recipes-graphics/xorg-app/iceauth_1.0.4.bb |  8 --------
>  meta-oe/recipes-graphics/xorg-app/iceauth_1.0.6.bb | 17 +++++++++++++++++
>  2 files changed, 17 insertions(+), 8 deletions(-)
>  delete mode 100644 meta-oe/recipes-graphics/xorg-app/iceauth_1.0.4.bb
>  create mode 100644 meta-oe/recipes-graphics/xorg-app/iceauth_1.0.6.bb
>=20
> diff --git a/meta-oe/recipes-graphics/xorg-app/iceauth_1.0.4.bb b/meta-oe=
/recipes-graphics/xorg-app/iceauth_1.0.4.bb
> deleted file mode 100644
> index 9d4d1c7..0000000
> --- a/meta-oe/recipes-graphics/xorg-app/iceauth_1.0.4.bb
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -require recipes-graphics/xorg-app/xorg-app-common.inc
> -SUMMARY =3D "Tool for manipulating ICE protocol authorization records"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D13f70acf3c27f5f834bbc954df775=
f8e"
> -DEPENDS +=3D "libice"
> -PR =3D "r6"
> -
> -SRC_URI[md5sum] =3D "bb2e4d2611047f7c5a1a82ec956a9de4"
> -SRC_URI[sha256sum] =3D "0ee6fd4554f0131b1ed526ee00b9cf643e7dc97eb70fb514=
48848ef2f349938d"
> diff --git a/meta-oe/recipes-graphics/xorg-app/iceauth_1.0.6.bb b/meta-oe=
/recipes-graphics/xorg-app/iceauth_1.0.6.bb
> new file mode 100644
> index 0000000..1fd1789
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/xorg-app/iceauth_1.0.6.bb
> @@ -0,0 +1,17 @@
> +require recipes-graphics/xorg-app/xorg-app-common.inc
> +
> +SUMMARY =3D "X.Org X11 X client utilities"
> +
> +DESCRIPTION =3D "A collection of utilities used to tweak and query the r=
untime configuration\
> +of the X server."
> +
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D13f70acf3c27f5f834bbc954df775=
f8e"
> +
> +PR =3D "${INC_PR}.0"

I've dropped PR when cherry-picking into master-next.

> +
> +BBCLASSEXTEND =3D "native"
> +
> +DEPENDS +=3D "libice"
> +
> +SRC_URI[md5sum] =3D "2527344acc60741a709f4858564c5ae6"
> +SRC_URI[sha256sum] =3D "bd990837353b439e6f45d478a87b8dbfa3f67d72d903e7a9=
ed4eb8de52f2e2f4"
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

--+SfteS7bOf3dGlBC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlRsqYoACgkQN1Ujt2V2gBw47ACgtDFr+cNEK1sYsuKa6/lcLVoa
M3sAn0P9dwk2ML/Ukfi9Sbcfvq4DoMxP
=3RW6
-----END PGP SIGNATURE-----

--+SfteS7bOf3dGlBC--
