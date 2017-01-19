Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id B286B71A82
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jan 2017 08:58:10 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id r126so10375149wmr.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jan 2017 00:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=+x/2B4he33dMcHqCo5bSrWBIrb2RfAGoxpK9ClgaV+k=;
	b=sQG1kOJhYAXvmy1VxSFw0GanTOzAWUsqK2BGp1G4gY+WkrqOomAqwThaW8YJm1n1To
	tIRgdT5k3C3JRI0Bw9ewU+meFa2P+QlnZnQi349YgKJ5zNwJP1r5A0jj/4cryjN5Z6hh
	ajdp0voJ3pfjcHKZ17ue3ZQ8LIwPW/x9ySTCgPHw9esKHInN2oU14TztKN+quUi7/NYM
	u0XHsmKvVl42c4O90on2a/R8TFayGU3mLzQ9mINrieLjO2ysu4UeyOB3fIogPU/aP3ac
	EbeXqj5Jmt2p3JRx8zyZw4GZbpD6siZH/jg/8NK1I++v+zD7pla6IVvWDO7+XUfqkcXr
	ReKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=+x/2B4he33dMcHqCo5bSrWBIrb2RfAGoxpK9ClgaV+k=;
	b=gV64UUyis9arZ42NubbJXyajF0n6+bUmSbHR4dedbwnWzpnuocjxLg/mY8nzY4d/IJ
	xVXFAGLDudoPxJiGX94SF+TVsiQICEZdkKRP1HnPc7s1j3iWTX9mHpQRFBq09TafLjTY
	Q6gyWfFJ2Eu/iA+KEe0IkEAwj71or8b7qCQN8/ou7C6TKFjdVxotDCX+ISgGQi9kmBsk
	cevaCwozkRTCgaxhY2aGQYvMz7jz9aZCRv04rx0LghAqmNQLxshSlAuvXISTX/+oIviw
	49Mnd17a+ye8Y7DESvUqBtSy7C+Q2HD0O6vrz4lp+YHdIe0lDemKiP1RHB6sFsH9/zbF
	F0Zw==
X-Gm-Message-State: AIkVDXJK+Ul0Y9rf4ecLYCq6kc9ZJXy+gpIJ8ckdc0QvSZpaaJx1q7UOd1dWtVbxZZhMuw==
X-Received: by 10.28.50.135 with SMTP id y129mr5800256wmy.2.1484816290508;
	Thu, 19 Jan 2017 00:58:10 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	v143sm37593684wmv.4.2017.01.19.00.58.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 19 Jan 2017 00:58:09 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 19 Jan 2017 09:58:12 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20170119085812.GC3265@jama>
References: <1484779178-11124-1-git-send-email-jslater@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1484779178-11124-1-git-send-email-jslater@windriver.com>
User-Agent: Mutt/1.7.2 (2016-11-26)
Subject: Re: [meta-oe][PATCH 1/1] libubox: derive PV from SRCPV
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
X-List-Received-Date: Thu, 19 Jan 2017 08:58:10 -0000
X-Groupsio-MsgNum: 64788
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="E13BgyNx05feLLmH"
Content-Disposition: inline

--E13BgyNx05feLLmH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 18, 2017 at 02:39:38PM -0800, Joe Slater wrote:
> Currently, PV is "git" and contains no version information.
>=20
> Signed-off-by: Joe Slater <jslater@windriver.com>
> ---
>  meta-oe/recipes-devtools/libubox/libubox_git.bb |    1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta-oe/recipes-devtools/libubox/libubox_git.bb b/meta-oe/re=
cipes-devtools/libubox/libubox_git.bb
> index 609281a..4d3ffae 100644
> --- a/meta-oe/recipes-devtools/libubox/libubox_git.bb
> +++ b/meta-oe/recipes-devtools/libubox/libubox_git.bb
> @@ -19,6 +19,7 @@ SRC_URI =3D "\
>  "
> =20
>  SRCREV =3D "155bf39896f126b1ba121b816922a88dc34c31e3"
> +PV =3D "git+${SRCPV}"

Also changed to:
PV =3D "1.0.1+git${SRCPV}"

based on the version used in:
meta-oe/recipes-devtools/libubox/libubox/0001-version-libraries.patch
> =20
>  S =3D "${WORKDIR}/git"
> =20
> --=20
> 1.7.9.5
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--E13BgyNx05feLLmH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWIB/pAAKCRA3VSO3ZXaA
HAagAKCJ737+yg8epY8xUCrywo2Kf6B6tQCeN84u+zV5aw2y+eD+FVlOFffATxs=
=Nvab
-----END PGP SIGNATURE-----

--E13BgyNx05feLLmH--
