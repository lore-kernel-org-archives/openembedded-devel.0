Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f180.google.com (mail-we0-f180.google.com
	[74.125.82.180])
	by mail.openembedded.org (Postfix) with ESMTP id 71D1170612
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jul 2014 12:07:29 +0000 (UTC)
Received: by mail-we0-f180.google.com with SMTP id w61so1084571wes.25
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jul 2014 05:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=98w7ML+Vptk+6EL+Qk5qKtReQQk6UD4lRXdnr0/xPbo=;
	b=PKHzYEJjWP7C8aQTFXG5U6dmMi7ZgfZu2YVul5qIK8/Vy86OEzr3V2UpCvHh62MKZJ
	FEj8UXcB5/vUeUPmxknyNdrMOWzXVzqa4rHFZ0Z1MwS6nKnDFmoA9q1Q7riO1lBEBPlq
	i+zVevVHWvZku/Qm/1IEdFF4i95Bt8pZo7mhVFC3bVhSBxYy0YHyZpHnXCqTE+GUu04v
	XlFLyj8qjuIg0nUEtFB7PngIt3OGc5BDnW08w8qo4jNdp6RjrXJvLDpyx+lxtKG6kGGJ
	K2ym94nT0XX8ZJlVb71ZDwAe542S86A2oEg1zuFbkf1qv43iXaxp7akL/PbqghbDI+mG
	IiRg==
X-Received: by 10.180.91.6 with SMTP id ca6mr2364055wib.77.1406117250636;
	Wed, 23 Jul 2014 05:07:30 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ch5sm5733769wjb.18.2014.07.23.05.07.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Jul 2014 05:07:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 23 Jul 2014 14:07:46 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140723120746.GC22875@jama>
References: <CAHURY+0mB2G3oGHNSBGAn+_jZ78uB4VLBS=817gdhL-WBjOMuw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHURY+0mB2G3oGHNSBGAn+_jZ78uB4VLBS=817gdhL-WBjOMuw@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: Building Qt5 using yocto on Wandboard-Error
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
X-List-Received-Date: Wed, 23 Jul 2014 12:07:37 -0000
X-Groupsio-MsgNum: 51206
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0EIE/3F9PxFGTcfe"
Content-Disposition: inline

--0EIE/3F9PxFGTcfe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 23, 2014 at 05:07:03PM +0530, Nilesh Kokane wrote:
> Hello ,
>=20
>=20
>=20
> I've created a yocto image using the following URL
>=20
> http://wiki.wandboard.org/index.php/Getting_started_with_Yocto_on_Wandboa=
rd
>=20
>=20
> And  trying to bring in Qt on wandboard using the following link
>=20
> http://wiki.wandboard.org/index.php/Building_Qt5_using_yocto_on_Wandboard
>=20
>=20
> Every thing goes fine until i give the following command
>=20
>  bitbake core-image-minimal
>=20
> It pops out with following errors.
>=20
>=20
> WARNING: Failed to fetch URL
> http://download.qt-project.org/official_releases/qt/5.1/5.1.1/submodules/=
qtgraphicaleffects-opensource-src-5.1.1.tar.xz,
> attempting MIRRORS if available
>=20
> ERROR: Fetcher failure: Fetch command failed with exit code 4, no output
> ERROR: Function failed: Fetcher failure for URL: '
> http://download.qt-project.org/official_releases/qt/5.1/5.1.1/submodules/=
qtgraphicaleffects-opensource-src-5.1.1.tar.xz'.
> Unable to fetch URL from any source.
> ERROR: Logfile of failure stored in:
> /home/minda/bin/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky=
-linux-gnueabi/qtgraphicaleffects/5.1.1-r0/temp/log.do_fetch.29384
> ERROR: Task 1283
> (/home/minda/bin/fsl-community-bsp/sources/meta-qt5/recipes-qt/qt5/
> qtgraphicaleffects_5.1.1.bb, do_fetch) failed with exit code '1'
> WARNING: Failed to fetch URL
> http://download.qt-project.org/official_releases/qt/5.1/5.1.1/submodules/=
qtdeclarative-opensource-src-5.1.1.tar.xz,
> attempting MIRRORS if available
>=20
> ERROR: Fetcher failure: Fetch command failed with exit code 4, no output
> ERROR: Function failed: Fetcher failure for URL: '
> http://download.qt-project.org/official_releases/qt/5.1/5.1.1/submodules/=
qtdeclarative-opensource-src-5.1.1.tar.xz'.
> Unable to fetch URL from any source.
> ERROR: Logfile of failure stored in:
> /home/minda/bin/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky=
-linux-gnueabi/qtdeclarative/5.1.1-r0/temp/log.do_fetch.29383
> ERROR: Task 1270
> (/home/minda/bin/fsl-community-bsp/sources/meta-qt5/recipes-qt/qt5/
> qtdeclarative_5.1.1.bb, do_fetch) failed with exit code '1'
>=20
>=20
> Please can anybody suggest.

Can you download it manually?

The URL seems correct, so maybe something wrong with your network setup.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--0EIE/3F9PxFGTcfe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPPpZIACgkQN1Ujt2V2gBzkuQCeP4Nasfa3Ql3/VGg1KU6z+Yyv
LtoAn2lnZ7wiX6FZl3Pkwt0pRF3NeBRB
=uhdn
-----END PGP SIGNATURE-----

--0EIE/3F9PxFGTcfe--
