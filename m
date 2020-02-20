Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id 59071606BD
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 20 Feb 2020 14:48:49 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id k11so4899739wrd.9
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 20 Feb 2020 06:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=UPPrEMUgjmv/hrksDTX1Fi0s7VQD/6gnaaV356fcm+E=;
	b=sx/BuYgXDdEB99iz4ySLDty/QN693S2n4StWKVB7VZ5WhJImgecgWclXdQsjeCljw0
	QQ1ulngk5t3JqL880Leu21g8tAqvQBeg1H9pKpdsAyMg338XBqvHUEDOCEO+Bms/uU5a
	vfY/Pm5SofJmlNqTr7I4bGFWcvnDCezW/y/iflsJRa3HY8EmLraC4zdfQFbXSdlkHF4t
	GB2czz6jDiEH1xpN2EAm5tWSESClnR4XdsRmvplaL75UbZgQ4g6tOatF9Go8WDL61G7c
	lnaGvogHb/T9V80dtuJVwRJZ+HQYyTspcsNpvCCcWNzvxSDOZsISugWCUWr80JSpr1os
	ZB4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=UPPrEMUgjmv/hrksDTX1Fi0s7VQD/6gnaaV356fcm+E=;
	b=ExDNmravpSofWF4X4feerC+VMkMZ2Bw+MI/XfTmraBcEK/nWdc9BQZnKTDPf1NyUpU
	pKSXzHW6Y+O1l4ZJf2Cdwc5M5Zw06YzYpY7wMy1OJ+O44q6/JFaC54KBYjAl8PxuuI5X
	XzgchDLcZY5IcGkWDMwl5OlkjgVzyaaWvhFny1PbW1TcQHvds/QNuLavZ7XQrZgU/BmQ
	t1Eiln8aWZc9ylIJGD9tEUR/iMiJrpB7ZBdVc027oaaysx33uNFD/q94Ntv1oeQXA6hf
	Y2mphxJpRcle6n9fm761ddNy7i85AAKutNDCGyn3LTOERiR6rVHMcaYVtZa1vvV5594s
	vucA==
X-Gm-Message-State: APjAAAX50tTIQKrotEFZeGD9OoQiqmLi8Yyg6hmZBH9zcIsrEe9iBIAK
	QSJfIw9tbTsghiQi4eBNcrA=
X-Google-Smtp-Source: APXvYqw8r1HJ+VyP5gAh+TQmM5VNfTy/vrn3TUm9Jw1428PlqsONM/BaOm5FApt6t16JJKV+wPMv7g==
X-Received: by 2002:adf:f182:: with SMTP id h2mr42142194wro.364.1582210129949; 
	Thu, 20 Feb 2020 06:48:49 -0800 (PST)
Received: from localhost ([109.238.218.228]) by smtp.gmail.com with ESMTPSA id
	a22sm5122768wmd.20.2020.02.20.06.48.48
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 20 Feb 2020 06:48:49 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 20 Feb 2020 15:48:48 +0100
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20200220144848.msiyguq2bsmqokxc@jama>
References: <CAMKF1squjefU4rg3Rzn6Xn85mLkRHwWr5jha3YU18Z3rT3J-2g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1squjefU4rg3Rzn6Xn85mLkRHwWr5jha3YU18Z3rT3J-2g@mail.gmail.com>
User-Agent: NeoMutt/20180716
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: S variable for svn fetcher Was: State of OE world - 2020-02-18
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
X-List-Received-Date: Thu, 20 Feb 2020 14:48:49 -0000
X-Groupsio-MsgNum: 82919
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ipeevase5lmk47ps"
Content-Disposition: inline

--ipeevase5lmk47ps
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 19, 2020 at 09:29:58AM -0800, Khem Raj wrote:
> http://www.openembedded.org/wiki/Bitbake_World_Status
>=20
> =3D=3D Failed tasks /media/ra_build_share/buildlogs/oe/world/dunfell/2020=
-02-18 =3D=3D
>=20
> INFO: jenkins-job.sh-1.8.46 Complete log available at
> /media/ra_build_share/buildlogs/oe/world/dunfell//media/ra_build_share/bu=
ildlogs/oe/world/dunfell/log.report.20200219_150007.log
>=20
> =3D=3D=3D common (0) =3D=3D=3D
>=20
> =3D=3D=3D common-x86 (0) =3D=3D=3D
>=20
> =3D=3D=3D qemuarm (0) =3D=3D=3D
>=20
> =3D=3D=3D qemuarm64 (0) =3D=3D=3D
>=20
> =3D=3D=3D qemux86 (0) =3D=3D=3D
>=20
> =3D=3D=3D qemux86_64 (0) =3D=3D=3D

Looks great! Thanks

I was running some world builds recently as well and was surprised that
there are a few failing recipes in meta-oe:
  s3c24xx-gpio
  s3c64xx-gpio
  wmiconfig
  usbpath
which are all using svn fetcher.

Any idea why these aren't shown in our build? I was able to reproduce
this on thud as well as latest master build:

  /OE/build/oe-core/meta-openembedded/meta-oe/recipes-support/usbpath/usbpa=
th_svn.bb:do_patch
  /OE/build/oe-core/meta-openembedded/meta-oe/recipes-support/samsung-soc-u=
tils/s3c64xx-gpio_svn.bb:do_compile
  /OE/build/oe-core/meta-openembedded/meta-oe/recipes-support/samsung-soc-u=
tils/s3c24xx-gpio_svn.bb:do_compile
  /OE/build/oe-core/meta-openembedded/meta-oe/recipes-support/samsung-soc-u=
tils/s3c64xx-gpio_svn.bb:do_populate_lic
  /OE/build/oe-core/meta-openembedded/meta-oe/recipes-support/samsung-soc-u=
tils/s3c24xx-gpio_svn.bb:do_populate_lic
  /OE/build/oe-core/meta-openembedded/meta-oe/recipes-support/wmiconfig/wmi=
config_svn.bb:do_patch

they have all the same root cause and that is that the
S variable points to directory where the sources used to be, but now
they are checked out somewhere else, e.g. s3c24xx-gpio:

LIC_FILES_CHKSUM =3D "file://gpio.c;endline=3D12;md5=3Dcfb91c686857b2e60852=
b4925d90a3e1"

SRC_URI =3D "svn://svn.openmoko.org/trunk/src/target;module=3Dgpio;protocol=
=3Dhttp"

S =3D "${WORKDIR}/gpio"

And now S looks like this:
$ ls /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/s3c24xx-gpio/1.0+sv=
nr4949-r2/gpio/
branches  trunk

While before I believe it was checking out just this directory (as ${WORKDI=
R}/gpio):
$ ls /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/s3c24xx-gpio/1.0+sv=
nr4949-r2/gpio/trunk/src/target/gpio/
gpio.c  gpio-glamo.c  gpio-s3c6410.c  Makefile  README

Anyone still actively using svn fetcher for something?

I'll check with even older bitbake to see when it changed, but it's
still surprising that you wouldn't be seeing it with latest bitbake
in world builds.

Cheers,

--ipeevase5lmk47ps
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXk6cTwAKCRA3VSO3ZXaA
HAyOAJwOlu9efzekrC9yuL7fmHLjCOkmzgCbBbPMm8vBLTTaXcOFAHq9U8+Uy2c=
=N7y/
-----END PGP SIGNATURE-----

--ipeevase5lmk47ps--
