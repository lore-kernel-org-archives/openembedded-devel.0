Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id 49BCC71B57
	for <Openembedded-devel@lists.openembedded.org>;
	Wed,  5 Sep 2018 09:30:25 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id w11-v6so6874852wrc.5
	for <Openembedded-devel@lists.openembedded.org>;
	Wed, 05 Sep 2018 02:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=E+1PH/xMi2KouwUm5goIJGE1TnEjlZeXg7AcgkZo9FE=;
	b=Whbh/ypkTWSCbXPQPfy4fYQLWu4LpKSSLaFZBB19qwDSAl+Ran97fXiwjrJxP666OL
	B02hkOz7Lj4jbkejlpfIsQ/gD16Z3AUOj+5BsPrajYpFnuinAxtVpWT9ngjjIQifNR4q
	86FlK3VUCzWxAsF23p04hGZ1RScyjjoMIirp4gCbor7huBsddkageTjKCLukHYJZWyC5
	8+CN6ZZO3Fu5HHnFtUfXx4VdjYvwAHuWHN/grt8sQF36sxpg9Cp2SV8XAXnAHVGlHA0V
	ASvQ5ZxHhLGdN5zViKogoCywZ/yKQqXfYUuOZoQvxWeAMbxVebxuHB9rKtC1c8RZRwWh
	Bl1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=E+1PH/xMi2KouwUm5goIJGE1TnEjlZeXg7AcgkZo9FE=;
	b=rN+xKWSCv7E3pMy45N49d3+CcQa4cV/8XuqoiYve04Gw3+bCGE+bT8ZlauJmmN01Kg
	mowjwvJpXz9thkUnGY+4LuO4hk3rPbkcorG0vyilsnhZaBw6NEx+M5U8ccJ2RyVuYeUU
	zZFEPl1aDXAYQMfP+5UC4uNgw8DZyA8tR6m8kQyEFX0cBwiAbEPIXqNcGt8IA6o1g+Ng
	C2fOt9jkcw5ZPhyaKExQHNVs0LpH6MjxY8MwzNQdmmgt+/SsDTMtsUmgzMgo9+YrLLe1
	rmWHWj/ZhQlAaZnob9393Gb6XHJ++Bvpq+s6uORBuqY0RbN7lxb65XJ/hAKBs+oJTSsF
	bB+A==
X-Gm-Message-State: APzg51BytaANFM10NE6QuOYs0786sO9JHwp0ltrPan57F4173UXN1YXk
	ycvguMc6vW8FSAtKHV1g3Sk=
X-Google-Smtp-Source: ANB0VdbZSmAYJY1Tx9Vm1odZkxDUjsv5Vp38t+aVVbKLMOcWyC03G3ABaVg5PFVnmGcUwB0Xp4eBNw==
X-Received: by 2002:a5d:68c9:: with SMTP id
	p9-v6mr25297820wrw.108.1536139825990; 
	Wed, 05 Sep 2018 02:30:25 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	w15-v6sm2072746wrs.8.2018.09.05.02.30.24
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 05 Sep 2018 02:30:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 5 Sep 2018 11:30:27 +0200
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20180905093027.GB1795@jama>
References: <CAMKF1spYyj-18urxsniwFac5TV__ve_NY71L_ruyvF+XJ-H3_Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1spYyj-18urxsniwFac5TV__ve_NY71L_ruyvF+XJ-H3_Q@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Re: State of the world, 2018-09-02
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
X-List-Received-Date: Wed, 05 Sep 2018 09:30:25 -0000
X-Groupsio-MsgNum: 74337
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="V0207lvV8h4k8FAm"
Content-Disposition: inline

--V0207lvV8h4k8FAm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 02, 2018 at 10:43:02PM -0700, Khem Raj wrote:
> http://www.openembedded.org/wiki/Bitbake_World_Status
>=20
> =3D=3D Number of issues - stats =3D=3D
> {| class=3D'wikitable'
> !|Date     !!colspan=3D'4'|Failed tasks    !!|Signatures
> !!colspan=3D'15'|QA !!Comment
> |-
> || ||qemuarm ||qemuarm64 ||qemux86 ||qemux86_64 ||all
> ||already-stripped ||libdir ||textrel ||build-deps ||file-rdeps
> ||version-going-backwards ||host-user-contaminated
> ||installed-vs-shipped ||unknown-configure-option ||symlink-to-sysroot
> ||invalid-pkgconfig ||pkgname ||ldflags ||compile-host-path
> ||qa_pseudo ||
> |-
> ||2018-09-02 ||38 ||38 ||46 ||36 ||9 ||0 ||0 ||6 ||2 ||0 ||32 ||0 ||0
> ||1 ||0 ||0 ||0 ||0 ||0 ||0 ||
> |}
>=20

Sadly looks very similar to previous openssl-1.1 upgrade in 2017:
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20170818_09=
0627.log

--V0207lvV8h4k8FAm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCW4+a7QAKCRA3VSO3ZXaA
HHiPAJoCSzjQNbQ5np0NSVNb5DZ7sNJ10wCfQfhYT/871i7rkcLociEtKV0BOWU=
=nNmJ
-----END PGP SIGNATURE-----

--V0207lvV8h4k8FAm--
