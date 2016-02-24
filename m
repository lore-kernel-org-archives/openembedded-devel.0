Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 21A077728A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Feb 2016 12:54:24 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id g62so270068869wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Feb 2016 04:54:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=3aaK8kcvAFnLmx/nPaiXIsL0OTScU2mvGbhfoKig5y8=;
	b=zMKRQLaoIrofvCoJMhLWQk2itZJsAB/gYplxMmzLUV5Po2fw45cgF4eXpiisfKqVs1
	Eh0Vpr5LlWHHeo88Br7OBuQ9kZM1vqTPJRO4wy4Xbsr/gJUk8oLCX/jPQO+JylY6oDaQ
	DYI8g9cYIe5dQH/0wNKO3jvGrqpk5z8QlZoV9MQ2G0OHgclSybQFAV6loZAV3nY+ZOwb
	CoFl9waQ4yIGGyNngZb/YxpG5eHTWpIb9oyJho2Og28U2eshjB9uEIkPuylpPwBw77E3
	Baa+HeP1KOVRvlsZxldPB9vLrZIeMLSs3PTV70M0XCc1FJqUHCdGrIj5trt7/VAcZkWM
	yXdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=3aaK8kcvAFnLmx/nPaiXIsL0OTScU2mvGbhfoKig5y8=;
	b=WkdGv0RGwAUgmejVJI8w07le69I4hrE/WiOALowcjhumbXVIE0WZI1HTrSqegWaZOU
	Vchuj8Pg4kvpRmmDStTo3kKChyZXge4YMIUfsyYoKVnfJzU+O+5hQD+br6pY7jwQvFcU
	ISgGPyCslwP3q3ThU+RAq2jHMWzJ+vSkeS23bP60JgMvRGwGS8Vk2QQKHfj7mO1hbXRF
	5S4QUwURkrSGJwQlaJjmh9IMn/fJ7YRbwba2Jx4VjN9ZaJAGkILVNNtGdsoYf4BHFePc
	+3Vci5fpxgfyvwMjRMV4S36WQAJZg8Wb0MDmuTa0QEUFOSO6Qn77ZF/wxW90SrsA7BGC
	8u2Q==
X-Gm-Message-State: AG10YOR8UMA5Vi8NcVY1rbKbEiLmf0NCEBqj4r9bERjPR7kDwpLWSqD7T6PGu9bGhy7zOA==
X-Received: by 10.194.47.237 with SMTP id g13mr39410330wjn.142.1456318465104; 
	Wed, 24 Feb 2016 04:54:25 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	l132sm31115038wmf.7.2016.02.24.04.54.23
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Feb 2016 04:54:23 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 24 Feb 2016 13:55:30 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160224125530.GB7560@jama>
References: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
	<9f47a352914ff9da04efab89b7eae0765ba916db.1456236552.git.alexander.kanavin@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <9f47a352914ff9da04efab89b7eae0765ba916db.1456236552.git.alexander.kanavin@linux.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH 30/34] poppler-data: fix do_install()
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
X-List-Received-Date: Wed, 24 Feb 2016 12:54:25 -0000
X-Groupsio-MsgNum: 60176
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mxv5cy4qt+RJ9ypb"
Content-Disposition: inline

--mxv5cy4qt+RJ9ypb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 23, 2016 at 04:20:09PM +0200, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta-oe/recipes-support/poppler/poppler-data_0.4.7.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-support/poppler/poppler-data_0.4.7.bb b/meta=
-oe/recipes-support/poppler/poppler-data_0.4.7.bb
> index 27c4110..5a7f72c 100644
> --- a/meta-oe/recipes-support/poppler/poppler-data_0.4.7.bb
> +++ b/meta-oe/recipes-support/poppler/poppler-data_0.4.7.bb
> @@ -28,7 +28,7 @@ do_compile() {
>  }
> =20
>  do_install() {
> -    oe_runmake install DESTDIR=3D${D}
> +    oe_runmake install prefix=3D/usr DESTDIR=3D${D}

NAK

There is better fix from RP which doesn't hardcode /usr:

oe_runmake install DESTDIR=3D${D} prefix=3D${prefix} datadir=3D${datadir}


>      install -d ${D}${datadir}/poppler/cMap
>      install -m644 ${WORKDIR}/Identity-* ${D}${datadir}/poppler/cMap/
>  }
> --=20
> 2.7.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--mxv5cy4qt+RJ9ypb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbNqEEACgkQN1Ujt2V2gBxoWQCglVhA0sRsNY8AXUx9T6evRl45
hI4AnRcf7etdXrBO/5pWJmMoLxfFz0g6
=VSYU
-----END PGP SIGNATURE-----

--mxv5cy4qt+RJ9ypb--
