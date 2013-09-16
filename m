Return-Path: <joe@deserted.net>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 583396041D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Sep 2013 18:39:41 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id hj3so3912440wib.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Sep 2013 11:39:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=AJgPjzIXRikMFtPEo5DCKjgTNIM5EsCW/AUWmcpdbN0=;
	b=h+xZiF3LJ3y7nv27jwy22LIgBZ1Pac9tsbt9VF4gdAbJtqEzyoTybvZxLGPVREY6OL
	/mZoj6YeiabA0VaCq88TRJQ9zDbz5Xuz1C7Un52yN2Kwq+2TWscZ38j3DibLrjfODmH+
	neA1hRhVLFsqjZDKmkeY6gmCdzS/cxBpZPWb1E4tIkYX1LYyIVAx8AYokqyq6QgbzYVg
	+40/m6DK3YMEfDytJxG/p5Aork2FybjlxzFBYSNUH6OjVjtUur7x9n4tcc4lgFqiyir0
	c5pSjGIAEO+dy30PXySVElo6nQpn2wcBDLG0tqk4oVCB1g/GTIG3ksUpZimQxyCtf4sc
	wH0w==
X-Gm-Message-State: ALoCoQmh0wFKU9EUXyepnKwpQZuOihFpUbq0Y9RpSuAvyM6ifxvXdKvkrIS0tpx9EEJ7EY9Qn21V
X-Received: by 10.180.85.65 with SMTP id f1mr14341697wiz.33.1379356782870;
	Mon, 16 Sep 2013 11:39:42 -0700 (PDT)
Received: from deserted.net ([128.224.252.2])
	by mx.google.com with ESMTPSA id i8sm25595013wib.1.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 16 Sep 2013 11:39:41 -0700 (PDT)
Date: Mon, 16 Sep 2013 14:39:37 -0400
From: Joe MacDonald <joe@deserted.net>
To: Philipp Wagner <lists@philipp-wagner.com>
Message-ID: <20130916183935.GB23843@deserted.net>
References: <522BA139.1020500@philipp-wagner.com>
MIME-Version: 1.0
In-Reply-To: <522BA139.1020500@philipp-wagner.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking] ntp: QA errors without systemd
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
X-List-Received-Date: Mon, 16 Sep 2013 18:39:42 -0000
X-Groupsio-MsgNum: 46214
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jho1yZJdad60DJr+"
Content-Disposition: inline

--jho1yZJdad60DJr+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[[meta-networking] ntp: QA errors without systemd] On 13.09.07 (Sat 23:57) =
Philipp Wagner wrote:

> Hi,
>=20
> I'm using ntp with no systemd and get some QA errors.
>=20
> ERROR: QA Issue: ntp: Files/directories were installed but not shipped
>   /lib
>   /usr/lib
>   /usr/lib/systemd
>   /usr/lib/systemd/ntp-units.d
>   /usr/lib/systemd/ntp-units.d/60-ntpd.list
> ERROR: QA run found fatal errors. Please consider fixing them.
> ERROR: Function failed: do_package_qa
> ERROR: Logfile of failure stored in:
> /home/philipp/src/poky/build/tmp/work/armv6-vfp-poky-linux-gnueabi/ntp/4.=
2.6p5-r6.0/temp/log.do_package.1178
> ERROR: Task 257
> (/home/philipp/src/poky/meta-openembedded/meta-networking/recipes-support=
/ntp/ntp_4.2.6p5.bb,
> do_package) failed with exit code '1'
>=20
>=20
> Obviously the ntp recipe installs some unit files etc. even though
> systemd is not used. What's the correct way to solve this? Check for
> systemd? Put those files into another recipe?
>=20
> Philipp

Hey Philipp,

I work almost exclusively from master, are you (still) seeing this in
msater?  I haven't had this crop up since 8dedc082 and 6b4f7e4b were
integrated into oe-core.

--=20
-Joe MacDonald.
:wq

--jho1yZJdad60DJr+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlI3UF0ACgkQwFvcllog0Xzh3ACfb52PQUQrqQcQWAX1tvl52lM/
81QAoJ0ni7tW9c6dnjYUkLGPf/BSSxro
=NiL+
-----END PGP SIGNATURE-----

--jho1yZJdad60DJr+--
