Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 6EA54714D7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Nov 2014 15:08:13 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id n3so2185464wiv.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Nov 2014 07:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=rCve8+oTf3P+P2iIpUUdoTIat8240ZC1TO9/AAJpQOA=;
	b=DVoHW9W5vo+0tTytw+S5paqtmdNb9A1I6YEFcEt/oi5R2cT3hUI+lhgBFT3jPuuD7m
	i5gltwJFn7eht9i5MvKpoH/9Q4JBUigajYEdoLk1ntd8FRjX4cyii+3pAYBsKqN/TZXJ
	J0nz05IGyGjLGe7CXbeEUYpESvBwMMckMuV7OAzVHLDqfjtcz7Zoboyv1Qk4jc9+7kWc
	YG7IIuA8e41wv8WIVticbCrMBxb5+rE3xRkYYaarfMljb4kexsIEJqlQq8n/sdk6C1qI
	hgO7W7q+CCSfamzK54YrH4XcW9hBbFpPSskEKjd8zpgDSYTpGVr7CGPsRgMQf+t9uVQs
	bpiw==
X-Received: by 10.181.13.106 with SMTP id ex10mr14225293wid.36.1416409693645; 
	Wed, 19 Nov 2014 07:08:13 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	cu9sm2678094wjb.0.2014.11.19.07.08.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Nov 2014 07:08:12 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 19 Nov 2014 16:08:14 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141119150814.GM3315@jama>
References: <1416279281-22578-1-git-send-email-jian.liu@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1416279281-22578-1-git-send-email-jian.liu@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe] lvm2: files will be over written when updating using rpm
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
X-List-Received-Date: Wed, 19 Nov 2014 15:08:17 -0000
X-Groupsio-MsgNum: 52939
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Tnj+unmjHTqEM5y0"
Content-Disposition: inline

--Tnj+unmjHTqEM5y0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2014 at 10:54:41AM +0800, Jian Liu wrote:
> If there is no %config micro before the file in the spec file,
> this file will be over-written after updating this package
> using rpm.
> This will make our settings lost.

This isn't for meta-oe (missing meta-oe/ directory prefix)

> Signed-off-by: Jian Liu <jian.liu@windriver.com>
> ---
>  recipes-support/lvm2/lvm2.inc | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/recipes-support/lvm2/lvm2.inc b/recipes-support/lvm2/lvm2.inc
> index 1bbb158..42f6e3a 100644
> --- a/recipes-support/lvm2/lvm2.inc
> +++ b/recipes-support/lvm2/lvm2.inc
> @@ -48,3 +48,5 @@ FILES_${PN} +=3D "${libdir}/device-mapper/*.so ${base_l=
ibdir}/udev"
>  FILES_${PN}-dbg +=3D "${libdir}/device-mapper/.debug"
> =20
>  RDEPENDS_${PN} =3D "bash"
> +
> +CONFFILES_${PN} +=3D "${sysconfdir}/lvm/lvm.conf"
> --=20
> 1.8.5.2.233.g932f7e4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Tnj+unmjHTqEM5y0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlRssl4ACgkQN1Ujt2V2gBwHqgCcC/mMunxslG2t26GXZ7RDRozp
ziEAnRR2jqEYYNcgecuQnM9cK5KbCgVX
=URe5
-----END PGP SIGNATURE-----

--Tnj+unmjHTqEM5y0--
