Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 5837172041
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Nov 2014 14:28:58 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id n3so2058637wiv.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Nov 2014 06:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=txNs+oRfUtKLwA4nGYn/zScOvJdSzhpsqstgl8QzdrQ=;
	b=Li+dpfkcFyd61GZRSKLlLiqeR1X/WOWIrl6RXVVxV9MKi4QwYzMyJ4UJd/zkMIHlKX
	u4afaqJ4/EFDHiCLro682fSzjBb+5iglIl/TB84+wC72aZzCJDo6BAKwiW8DMAc5bfmd
	G9FDqsXuWPeSnTXs/oM170Bj4KNoQsQSGI0F0PUT7tilvoYgM8Of7iXp9aDASsyCewgQ
	QZQNmLf6FPukJGvLeZkTlgRa4XEuFhHoHkGQ5NTjJ6rc9GJ6Fbo2ZdSAO5+qzmA9VTSQ
	htpOc5dvk8W/BRTGKwL5O0b2unqZkiT7TK3o19IrXMWNLfovEASJLZfpvEyDQk+z7jql
	SZLg==
X-Received: by 10.180.104.234 with SMTP id gh10mr6060499wib.3.1416407337535;
	Wed, 19 Nov 2014 06:28:57 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	fq1sm2438593wib.12.2014.11.19.06.28.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Nov 2014 06:28:56 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 19 Nov 2014 15:28:57 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141119142857.GD3315@jama>
References: <1415699604-2155-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1415699604-2155-1-git-send-email-lixin.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH] setxkbmap: upgrade to 1.3.0
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
X-List-Received-Date: Wed, 19 Nov 2014 14:28:59 -0000
X-Groupsio-MsgNum: 52929
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PHCdUe6m4AxPMzOu"
Content-Disposition: inline

--PHCdUe6m4AxPMzOu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 11, 2014 at 05:53:24PM +0800, Li xin wrote:
> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ---
>  meta-oe/recipes-graphics/xorg-app/setxkbmap_1.2.0.bb |  8 --------
>  meta-oe/recipes-graphics/xorg-app/setxkbmap_1.3.0.bb | 19 ++++++++++++++=
+++++
>  2 files changed, 19 insertions(+), 8 deletions(-)
>  delete mode 100644 meta-oe/recipes-graphics/xorg-app/setxkbmap_1.2.0.bb
>  create mode 100644 meta-oe/recipes-graphics/xorg-app/setxkbmap_1.3.0.bb
>=20
> diff --git a/meta-oe/recipes-graphics/xorg-app/setxkbmap_1.2.0.bb b/meta-=
oe/recipes-graphics/xorg-app/setxkbmap_1.2.0.bb
> deleted file mode 100644
> index 127b0f6..0000000
> --- a/meta-oe/recipes-graphics/xorg-app/setxkbmap_1.2.0.bb
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -require recipes-graphics/xorg-app/xorg-app-common.inc
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5feafdbe6dfe9e2bd32325be0cfc8=
6f8"
> -DEPENDS +=3D " libxkbfile"
> -PE =3D "1"
> -PR =3D "r6"
> -
> -SRC_URI[md5sum] =3D "2f6df89201eb9a2cbfb905d6b82a191e"
> -SRC_URI[sha256sum] =3D "999591bf1ba8ca2a7d480b2c01702396e6c349d499fb583c=
0de136ec00dbae39"
> diff --git a/meta-oe/recipes-graphics/xorg-app/setxkbmap_1.3.0.bb b/meta-=
oe/recipes-graphics/xorg-app/setxkbmap_1.3.0.bb
> new file mode 100644
> index 0000000..2b9a8c4
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/xorg-app/setxkbmap_1.3.0.bb
> @@ -0,0 +1,19 @@
> +require recipes-graphics/xorg-app/xorg-app-common.inc
> +
> +SUMMARY =3D "A program to compile XKB keyboard description"
> +
> +DESCRIPTION =3D "The xkbcomp keymap compiler converts a description of a=
n \
> +XKB keymap into one of several output formats. The most common use for \
> +xkbcomp is to create a compiled keymap file (.xkm extension) which can \
> +be read directly by XKB-capable X servers or utilities."
> +
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5feafdbe6dfe9e2bd32325be0cfc8=
6f8"
> +
> +PR =3D "${INC_PR}.0"

You cannot drop PE, but you should drop PR.

I'll fix when cherry-picking to master-next.

> +
> +DEPENDS +=3D "libxkbfile"
> +
> +BBCLASSEXTEND =3D "native"
> +
> +SRC_URI[md5sum] =3D "1001771344608e120e943a396317c33a"
> +SRC_URI[sha256sum] =3D "3d305c9d1f38224169b2e501ef0665cc3ab52d4dbc2b9a60=
c9dbb047f77ddec6"
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

--PHCdUe6m4AxPMzOu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlRsqSkACgkQN1Ujt2V2gByX6gCfRyhWlVerXTFqiz1qjNj4fWbZ
9IQAnRO7xVr8DdMX83T3K9ft6OpEnwl6
=wAmD
-----END PGP SIGNATURE-----

--PHCdUe6m4AxPMzOu--
