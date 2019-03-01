Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id AEEAF7C77E
	for <Openembedded-devel@lists.openembedded.org>;
	Fri,  1 Mar 2019 12:16:32 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id q187so12361089wme.5
	for <Openembedded-devel@lists.openembedded.org>;
	Fri, 01 Mar 2019 04:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=KLkkwong2Pmq5gDafLy514rOKQ2r/GszlVRJldWZH7E=;
	b=souTF90LvAhavifGbmsumZDxhmjqfiMNgOonK1npyMhmg3WC7fPEeXwfijCn4wDXHg
	sslUgOrbfaGLdE1KBu75K2lTVncVa6s4vPw9DctTLC349eurdf8YtGSab4062uLv5vur
	xaQKjTWDGMCmRVZ9o1g5temxyuY2J1tRPIpSOl/iklMb5RsFVxxCa8OFJcka7oGywbdM
	AlwrX+OCYDTHgpa44Lp4PaUcHRJ1As7d8ST9fz2apMO/o8zgvlmQHXVHgV8FszeIiaKX
	r2VAkQdBYIm5ZWIhrjYnbb76sb7YAEn8j2cMKP8YtFAL6URJ2LY4hj/C7Uj7Vortx2E8
	HkDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=KLkkwong2Pmq5gDafLy514rOKQ2r/GszlVRJldWZH7E=;
	b=nSmEVJ7+o31USEFtd0IrvHiaxlszUSB03/QHmQFxxLwj18OLCBvOA2aefsmzr0KhHR
	EBaxe40XDzg3lKC08wMTghDkuYexITRu+EJX6WjcAyg70IBU51TPq603R/Z5yZnGfniD
	20EmHruCuWmskKZuprSHFisFBpYBIxOtdzYI2zCy9rnH6xcVXg/E1yw5L/Jj8DxUHCg2
	WDlMpV3yFLfmPxKvfsved7lNxHKowogRjytKBLYGkQvA1WY6qq6xddV7XxxABSaFmjeJ
	7QPdp70Uav67OJ9U2wxnz32VGvIWjAq+Ru8UmMhy8yTECBgFTNCLcq2+SBeHnsvj6SUh
	LLQA==
X-Gm-Message-State: APjAAAWWLIRNtVv7oQrzrrtwOtf7Zw38cI4yjvmxfiyd+uojll8XJYV8
	GXbf4flm30vxjYwY0eX64To=
X-Google-Smtp-Source: AHgI3IZSNbXkIW+uxki1u4RnG+XnbQN+EnKTSt3R/nRJXgZ+e83KjD4waPF1qsQrZGjloBfzhoG0mg==
X-Received: by 2002:a7b:c0d5:: with SMTP id s21mr3243112wmh.153.1551442593331; 
	Fri, 01 Mar 2019 04:16:33 -0800 (PST)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id x6sm13136337wmg.0.2019.03.01.04.16.32
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 01 Mar 2019 04:16:32 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 1 Mar 2019 13:16:34 +0100
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190301121633.GD1503@jama>
References: <CAMKF1spw7Jg63EZzJU6v8rE+sNDCbQsy_-2DEZrU0nSXTgmMpA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1spw7Jg63EZzJU6v8rE+sNDCbQsy_-2DEZrU0nSXTgmMpA@mail.gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Re: State of the world, 2019-02-28
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
X-List-Received-Date: Fri, 01 Mar 2019 12:16:33 -0000
X-Groupsio-MsgNum: 76559
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="W5WqUoFLvi1M7tJE"
Content-Disposition: inline

--W5WqUoFLvi1M7tJE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 28, 2019 at 08:52:52PM -0800, Khem Raj wrote:
> =3D=3D Failed tasks 2019-02-28 =3D=3D
>=20
> INFO: jenkins-job.sh-1.8.45 Complete log available at
> http://logs.nslu2-linux.org/buildlogs/oe/world/warrior/log.report.2019022=
8_201635.log
>=20
> =3D=3D=3D common (1) =3D=3D=3D
>     * sources/meta-openembedded/meta-oe/recipes-extended/sysdig/sysdig_gi=
t.bb:do_compile
>=20
> =3D=3D=3D common-x86 (0) =3D=3D=3D
>=20
> =3D=3D=3D qemuarm (9) =3D=3D=3D
>     * sources/meta-openembedded/meta-networking/recipes-connectivity/fire=
walld/firewalld_0.6.3.bb:do_configure
>     * sources/meta-openembedded/meta-oe/recipes-devtools/android-tools/an=
droid-tools_5.1.1.r37.bb:do_compile
>     * sources/meta-openembedded/meta-oe/recipes-kernel/bpftool/bpftool.bb=
:do_compile
>     * sources/meta-openembedded/meta-oe/recipes-support/espeak/espeak_1.4=
8.04.bb:do_compile
>     * sources/meta-openembedded/meta-oe/recipes-support/lvm2/lvm2_2.03.02=
=2Ebb:do_package

>     * sources/meta-qt5/recipes-qt/qt5/qtscript_git.bb:do_compile

this one was introduced by gcc upgrade to 8.3.0, I've added fix to
meta-qt5/master-next

--W5WqUoFLvi1M7tJE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXHkioQAKCRA3VSO3ZXaA
HBjaAJ9rzEgKaBl6oPFmwSCZZCjxuxQ8IACdGUJKV0TufIpRbbt/i30boZwlT0w=
=A4CK
-----END PGP SIGNATURE-----

--W5WqUoFLvi1M7tJE--
