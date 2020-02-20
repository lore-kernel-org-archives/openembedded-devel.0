Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id C5AFB60B85
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 20 Feb 2020 17:34:22 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id m16so5540882wrx.11
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 20 Feb 2020 09:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=IEwHU1zZavV+xsW4dCNB3sSQmL5y9mujcnQzfHXX9XE=;
	b=PIjUFsB70S9cynUk4Dq9esOCop28fFTM8L7+xjAwH4HpmxcEJG+05Mehyb0G11HgUr
	Cm+EwWxzbIr+QCmsnmmFCLF6LJktRgN4QK3x+YAT+lAClzyofZsPlS52yuRgmODClC7A
	8+sLPNLYK/LxSajIdtUpuU7myQVN9RFYw00YovqBdoD6Tfizgtz2dy9kIokgI2UU6Klt
	7AHganhRYbDt8KT+l8xqmLGKd6LRlGAb9p6emgl8KpHY1+rGKOJfj7KW0rZ3OadHJI3g
	0e0vSlaMr4LKhdSdHWDbq1pBtQPGl1XbKzEo3syVB7WKGca/OQLPTduZfn0oQLtPjIp9
	eCDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=IEwHU1zZavV+xsW4dCNB3sSQmL5y9mujcnQzfHXX9XE=;
	b=MLVyba+KD4hkROhIXuAWAb6ftuAk1Nz24bZTCkoBEi/7omSPdeCqvKa7r7eqp7jxR1
	Ug+fuWuhRWDCuH2NqFGNIPYG2cUSR2FatN7wCncitPrr8uRyRUcZqB4mBltnHcLfV7Xe
	OTk/xxlOJljt+jEg3Bm/CpKWWbPY9SoJ6rQ++2hgqbbo4xycskcGqTa8k7SRXoZD4BuW
	j8CuG7IBHuLP1rkInZmOsDXdlG03v+wE/rHJ+w+O0HrjGvyoTLBvL2X+RzOVf/lpCKfA
	X6ah/VvEqHXw0KDyr/BtVImcLqVXx+O9qH6GbdF1XiTR2QuIiSJ28BmgQeyFC289Cyf5
	uQlw==
X-Gm-Message-State: APjAAAWQRE3TJYPXig7/BvwsLVvWlfjxTSiW1lbNxKLKvlKT39XNPy9d
	z/mjNTvQ5jnTcatKofmLnLU=
X-Google-Smtp-Source: APXvYqzQsMKpqbSLGxmXCWPbnnomzfZAeIKiegyU/pZD17GJo+ykfxKwo1RxWC2uSGkYAA7yxBnkJA==
X-Received: by 2002:adf:ecc2:: with SMTP id s2mr44302716wro.263.1582220063366; 
	Thu, 20 Feb 2020 09:34:23 -0800 (PST)
Received: from localhost ([109.238.218.228])
	by smtp.gmail.com with ESMTPSA id f127sm24989wma.4.2020.02.20.09.34.22
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 20 Feb 2020 09:34:22 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 20 Feb 2020 18:34:21 +0100
To: Adrian Bunk <bunk@stusta.de>
Message-ID: <20200220173421.egafqfq25kbtr4a4@jama>
References: <CAMKF1squjefU4rg3Rzn6Xn85mLkRHwWr5jha3YU18Z3rT3J-2g@mail.gmail.com>
	<20200220144848.msiyguq2bsmqokxc@jama>
	<20200220151620.GA30034@localhost>
	<20200220153758.o25tn46hhewgmasd@jama>
	<20200220161159.GB30034@localhost>
	<20200220162312.cqh5bwvdwxjp362g@jama>
MIME-Version: 1.0
In-Reply-To: <20200220162312.cqh5bwvdwxjp362g@jama>
User-Agent: NeoMutt/20180716
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Re: S variable for svn fetcher Was: State of OE world - 2020-02-18
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
X-List-Received-Date: Thu, 20 Feb 2020 17:34:23 -0000
X-Groupsio-MsgNum: 82935
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yawp3xyqgu4zp26k"
Content-Disposition: inline

--yawp3xyqgu4zp26k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 20, 2020 at 05:23:12PM +0100, Martin Jansa wrote:
> On Thu, Feb 20, 2020 at 06:11:59PM +0200, Adrian Bunk wrote:
> > On Thu, Feb 20, 2020 at 04:37:58PM +0100, Martin Jansa wrote:
> > > On Thu, Feb 20, 2020 at 05:16:20PM +0200, Adrian Bunk wrote:
> > > > On Thu, Feb 20, 2020 at 03:48:48PM +0100, Martin Jansa wrote:
> > > > >...
> > > > > Any idea why these aren't shown in our build?
> > > > >...
> > > >=20
> > > > What is your mirror configuration?
> > > >=20
> > > > Default configuration downloads the tarball from [1].
> > >=20
> > > Maybe I'm missing your point, but these aren't fetch issues.
> > >...
> >=20
> > MIRRORS =3D "" (and deleting the downloaded tar) is what I needed for=
=20
> > getting a build failure.
>=20
> OK, I see now, sorry.
>=20
> That explains why it's not shown in khem's builds and might be broken
> well before thud already, the tarball created here today:
>=20
> $ tar xvf ../downloads/gpio_svn.openmoko.org_.trunk.src.target_4949_.tar.=
gz
> gpio/
> gpio/trunk/
> gpio/trunk/doc/
> gpio/trunk/doc/hardware/
> gpio/trunk/doc/hardware/GTA01Bv3/
> gpio/trunk/doc/hardware/GTA01Bv3/gpio.txt
> gpio/trunk/doc/hardware/GTA01Bv3/pmu-voltage.txt
> ...
>=20
> while the corresponding tarball on mirror:
> http://sources.openembedded.org/gpio_svn.openmoko.org_.trunk.src.target_4=
949_.tar.gz
> $ tar xvf gpio_svn.openmoko.org_.trunk.src.target_4949_.tar.gz
> gpio/
> gpio/gpio-s3c6410.c
> gpio/Makefile
> gpio/gpio.c
> gpio/gpio-glamo.c
> gpio/README
>=20
> Will check when it got broken before thud.

It's still reproducible in pyro, so probably not caused by changes in OE.

There is one more recipe using svn in meta-multimedia which works fine:
meta-multimedia/recipes-dvb/oscam/oscam_svn.bb:SRC_URI =3D "svn://www.strea=
mboard.tv/svn/oscam;module=3Dtrunk;protocol=3Dhttp \

The rest are all from svn.openmoko.org:
meta-oe/recipes-support/samsung-soc-utils/s3c24xx-gpio_svn.bb:SRC_URI =3D "=
svn://svn.openmoko.org/trunk/src/target;module=3Dgpio;protocol=3Dhttp"
meta-oe/recipes-support/samsung-soc-utils/s3c64xx-gpio_svn.bb:SRC_URI =3D "=
svn://svn.openmoko.org/trunk/src/target;module=3Dgpio;protocol=3Dhttp"
meta-oe/recipes-support/samsung-soc-utils/sjf2410-linux-native_svn.bb:SRC_U=
RI =3D "svn://svn.openmoko.org/trunk/src/host/;module=3Dsjf2410-linux;proto=
col=3Dhttp \
meta-oe/recipes-support/usbpath/usbpath_svn.bb:SRC_URI =3D "svn://svn.openm=
oko.org/trunk/src/host;module=3Dusbpath;protocol=3Dhttp \
meta-oe/recipes-support/wmiconfig/wmiconfig_svn.bb:SRC_URI =3D "svn://svn.o=
penmoko.org/trunk/src/target;module=3DAR6kSDK.build_sw.18;protocol=3Dhttp \

And now this leads to do_fetch running:
svn --non-interactive --trust-server-cert co --no-auth-cache --ignore-exter=
nals -r 4949 http://svn.openmoko.org/trunk/src/target/gpio@4949 gpio
as before, but now it redirects to github:

Redirecting to URL 'https://github.com/openmoko/openmoko-svn':
A    gpio/branches
A    gpio/branches/oe
A    gpio/branches/oe/pre-20070305
A    gpio/branches/oe/pre-20070305/README
A    gpio/branches/oe/pre-20070305/classes
A    gpio/branches/oe/pre-20070305/classes/autotools.bbclass
A    gpio/branches/oe/pre-20070305/classes/base.bbclass
A    gpio/branches/oe/pre-20070305/classes/openmoko-base.bbclass
A    gpio/branches/oe/pre-20070305/classes/openmoko-panel-plugin.bbclass
=2E.

and the svn bridge to github probably doesn't work exactly the same as the
native svn repo used to work, but I don't see it explicitly mentioned in:
https://help.github.com/en/github/importing-your-projects-to-github/support=
-for-subversion-clients

So to resolve this quickly I'm going to send SRC_URI updates for
these recipes to just use git fetcher from:
https://github.com/openmoko/openmoko-svn
directly. I don't think anyone is using these nowadays, so it's
also fine with me to just delete them all, which I'll do in
separate follow-up commit in case someone tries to resurrect them
later in own layer.

--yawp3xyqgu4zp26k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXk7DHQAKCRA3VSO3ZXaA
HOp7AJ96gtk9mq/jaKRUT8m/dZnCVconKQCfXmykdudKV8D/nEYtknbyZkak9f4=
=/InW
-----END PGP SIGNATURE-----

--yawp3xyqgu4zp26k--
