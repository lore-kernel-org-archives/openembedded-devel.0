Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4D441613B9
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 20 Feb 2020 16:23:13 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id p17so2725367wma.1
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 20 Feb 2020 08:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=RRJRBpp/INQZzKV6k7fvUVwj7yTJUrLrzrQOypowjIg=;
	b=WChPlNyMWRQObA4uiYY0QHJPnwaQu7LXimYI9wrX1MpgxlM1BHv9EJaG8PrLQstAj3
	HQ/GvBvEF0xsD+dprY9MWkag52Llu5q/kggZvYVgMBT9ob4t2qqCIkwoWabLkGM80Afg
	8P8s6mp2nZ07/CZcXfzmqlH0S/96Y52g02QtBKxrwr1wedyo2K44DkzMozO4a1eluva3
	41BypVhnGws8G3wlSYCwyLsnxhkNasmhIBpEEeGK5OfX9QeLi3VNvMo8EmKo2h/baPEQ
	nuTKDUyboYnBq/2KNHHj/7FFgCKIuuMWFEGvtmBkEKVyySvRpHFVHz+HNhjyDW1pmrCC
	vvKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=RRJRBpp/INQZzKV6k7fvUVwj7yTJUrLrzrQOypowjIg=;
	b=jazd5y5Jwr4hWAxT6Bt6uT8QD+8Kk3wojTAb/WmyVtzqUz/NtDmg5ZFuopyzLVtEap
	xvd4Zf61GzrO3KsFDbKDhARkkK9BDdG0amHUXjo0sPSXVMHssKG0lW/N2wst8wLKZlLF
	uusf4N2Ov0CUnbNAv4GMx9K4Kxz2HmV+MB4km3ngl0q3qlu9nc2m27WPevUMc4gf/BtO
	WfOs0Wlszh0WBkPxMbhieVjdbQ6+GJfACbV2JW5Yd2zS2X2d9tqDeWgOp4wLAT8EXkFV
	MH4i5fYbRQLkCDwKlH0tJjhV9N/HmMVGEXba5VW+Gk7bEJCjr5n5Sc4P2AYqQf35KdXR
	6h6w==
X-Gm-Message-State: APjAAAU2zUiN525LI/duKGdteBXP3QO5HFkmMWwpFvSX0Uj+R0mAI/E5
	n6F/WjqgcItvOjh/ftWSXGI=
X-Google-Smtp-Source: APXvYqxxcaGZYm1uPDmIKhOLrhe51ZQoksvD3d7aXlX12vHpkYTJXst3t7Qt+CcWa+r7haLCV6+Rkw==
X-Received: by 2002:a1c:c209:: with SMTP id s9mr5236618wmf.156.1582215794194; 
	Thu, 20 Feb 2020 08:23:14 -0800 (PST)
Received: from localhost ([109.238.218.228])
	by smtp.gmail.com with ESMTPSA id j15sm89421wrp.9.2020.02.20.08.23.13
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 20 Feb 2020 08:23:13 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 20 Feb 2020 17:23:12 +0100
To: Adrian Bunk <bunk@stusta.de>
Message-ID: <20200220162312.cqh5bwvdwxjp362g@jama>
References: <CAMKF1squjefU4rg3Rzn6Xn85mLkRHwWr5jha3YU18Z3rT3J-2g@mail.gmail.com>
	<20200220144848.msiyguq2bsmqokxc@jama>
	<20200220151620.GA30034@localhost>
	<20200220153758.o25tn46hhewgmasd@jama>
	<20200220161159.GB30034@localhost>
MIME-Version: 1.0
In-Reply-To: <20200220161159.GB30034@localhost>
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
X-List-Received-Date: Thu, 20 Feb 2020 16:23:14 -0000
X-Groupsio-MsgNum: 82932
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pty2kiyfvalecl22"
Content-Disposition: inline

--pty2kiyfvalecl22
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 20, 2020 at 06:11:59PM +0200, Adrian Bunk wrote:
> On Thu, Feb 20, 2020 at 04:37:58PM +0100, Martin Jansa wrote:
> > On Thu, Feb 20, 2020 at 05:16:20PM +0200, Adrian Bunk wrote:
> > > On Thu, Feb 20, 2020 at 03:48:48PM +0100, Martin Jansa wrote:
> > > >...
> > > > Any idea why these aren't shown in our build?
> > > >...
> > >=20
> > > What is your mirror configuration?
> > >=20
> > > Default configuration downloads the tarball from [1].
> >=20
> > Maybe I'm missing your point, but these aren't fetch issues.
> >...
>=20
> MIRRORS =3D "" (and deleting the downloaded tar) is what I needed for=20
> getting a build failure.

OK, I see now, sorry.

That explains why it's not shown in khem's builds and might be broken
well before thud already, the tarball created here today:

$ tar xvf ../downloads/gpio_svn.openmoko.org_.trunk.src.target_4949_.tar.gz
gpio/
gpio/trunk/
gpio/trunk/doc/
gpio/trunk/doc/hardware/
gpio/trunk/doc/hardware/GTA01Bv3/
gpio/trunk/doc/hardware/GTA01Bv3/gpio.txt
gpio/trunk/doc/hardware/GTA01Bv3/pmu-voltage.txt
=2E..

while the corresponding tarball on mirror:
http://sources.openembedded.org/gpio_svn.openmoko.org_.trunk.src.target_494=
9_.tar.gz
$ tar xvf gpio_svn.openmoko.org_.trunk.src.target_4949_.tar.gz
gpio/
gpio/gpio-s3c6410.c
gpio/Makefile
gpio/gpio.c
gpio/gpio-glamo.c
gpio/README

Will check when it got broken before thud.

--pty2kiyfvalecl22
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXk6ybwAKCRA3VSO3ZXaA
HD5kAJ9fhdlSBAVlx4Ui1b2982MXj+0AOgCeIAYS01TgloWWg5h+I7pF1IGhApk=
=9Hoz
-----END PGP SIGNATURE-----

--pty2kiyfvalecl22--
