Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 847097404A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jun 2015 14:48:06 +0000 (UTC)
Received: by wiwl6 with SMTP id l6so20377782wiw.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jun 2015 07:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=jNV+0l3jq4q2n6T/yQBX1JLcG1tVhrUhd+viGmB/e6M=;
	b=M1v/QGzuF/W1N06X984v3iHgmgLTFNyg21fsJJQqbjLOVgXe4WvRDSRb8p7V5/+4oh
	buF9vDux+9MWUMIm9SUjD4WC9rdo4DKqVPE2JsDnVtlYo5/sg6xMMi1jutv85UVGgWpo
	VmhEapCHpUHb2v3xVRRDV8TP/iB5wOUd3UJfVuRVzikgjBYR8CXV79m0tnIq0bnYrN6/
	yNUS8FwAyd2NSJl7cGH57t+y7OP1+KAy04UEWav+TrnztT3LQtzmdLAqTW8MaCVzTltl
	DI9XeUAny/YXEwaSwpv90FjMpDHqmybhNRaeEE1baPZ2zeoT9DhQgyZoiG+fWn9g2YKu
	l3Vw==
X-Received: by 10.180.94.39 with SMTP id cz7mr6308804wib.66.1435243687975;
	Thu, 25 Jun 2015 07:48:07 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id fb3sm7986491wib.21.2015.06.25.07.48.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Jun 2015 07:48:07 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 25 Jun 2015 16:48:27 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150625144827.GD2394@jama>
References: <1435075324-12895-1-git-send-email-hugo.saldanha@aker.com.br>
MIME-Version: 1.0
In-Reply-To: <1435075324-12895-1-git-send-email-hugo.saldanha@aker.com.br>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][master/fido/dizzy][PATCH] libssh2: upgrade to v1.6.0
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
X-List-Received-Date: Thu, 25 Jun 2015 14:48:08 -0000
X-Groupsio-MsgNum: 56032
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ylS2wUBXLOxYXZFQ"
Content-Disposition: inline

--ylS2wUBXLOxYXZFQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 23, 2015 at 01:02:04PM -0300, Hugo Vasconcelos Saldanha wrote:
> Besides new features and improvements, this fixes CVE-2015-1782.

Release branches aren't getting new features, new versions unless there
is very good reason to do so.

I'll include this in master-next, but for release branches you should
just add patch for CVE-2015-1782 without the upgrade. (release
maintainers call)

> License's md5 changed because of a modified copyright.
>=20
> Signed-off-by: Hugo Vasconcelos Saldanha <hugo.saldanha@aker.com.br>
> ---
>  .../recipes-support/libssh2/{libssh2_1.4.3.bb =3D> libssh2_1.6.0.bb}  | =
6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-oe/recipes-support/libssh2/{libssh2_1.4.3.bb =3D> libssh2_1.=
6.0.bb} (60%)
>=20
> diff --git a/meta-oe/recipes-support/libssh2/libssh2_1.4.3.bb b/meta-oe/r=
ecipes-support/libssh2/libssh2_1.6.0.bb
> similarity index 60%
> rename from meta-oe/recipes-support/libssh2/libssh2_1.4.3.bb
> rename to meta-oe/recipes-support/libssh2/libssh2_1.6.0.bb
> index b537663..022482c 100644
> --- a/meta-oe/recipes-support/libssh2/libssh2_1.4.3.bb
> +++ b/meta-oe/recipes-support/libssh2/libssh2_1.6.0.bb
> @@ -5,11 +5,11 @@ SECTION =3D "libs"
>  DEPENDS =3D "zlib openssl"
> =20
>  LICENSE =3D "BSD"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd00afe44f336a79a2ca7e1681ce14=
509"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc5cf34fc0acb44b082ef50ef5e435=
4ca"
> =20
>  SRC_URI =3D "http://www.libssh2.org/download/${BP}.tar.gz"
> -SRC_URI[md5sum] =3D "071004c60c5d6f90354ad1b701013a0b"
> -SRC_URI[sha256sum] =3D "eac6f85f9df9db2e6386906a6227eb2cd7b3245739561cad=
7d6dc1d5d021b96d"
> +SRC_URI[md5sum] =3D "00aabd6e714a5f42a4fb82ace20db1dd"
> +SRC_URI[sha256sum] =3D "5a202943a34a1d82a1c31f74094f2453c207bf9936093867=
f41414968c8e8215"
> =20
>  inherit autotools pkgconfig
> =20
> --=20
> 2.4.4
>=20
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ylS2wUBXLOxYXZFQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlWMFLoACgkQN1Ujt2V2gBz1/wCfc/9vCWxQ0d2E4WCW+TMEmVew
qE0An33dkE4TEKJbTW3elCK3xWqnIIgl
=CtcQ
-----END PGP SIGNATURE-----

--ylS2wUBXLOxYXZFQ--
