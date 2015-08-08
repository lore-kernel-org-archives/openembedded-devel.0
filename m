Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id D6C42767F8
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  8 Aug 2015 22:16:38 +0000 (UTC)
Received: by pabyb7 with SMTP id yb7so79326017pab.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 08 Aug 2015 15:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=wpYZ2yPo4QMR67zrJoUb6n/KQFFzC8fGzjmzNk/RLzc=;
	b=h6jmLwSxWpvr5/fTwxDllFl2iNN13L3MEDNjAMzgcEIGlN2sxjeTrXF6vakY8DTdP0
	3vL6Agi5zxM2o4kfh1i/R25v9gLFRyE361BHGAhpfXVPkyfTn2ZFhLv0Kr7asAgsmE7c
	2fedhlQpqPM4j5PcKi0b859WIYvNnkMmIV+5axHXuDC+uq8zGm9eX+B0AsLge81trE1G
	p6I7eN6wPFUcXJC3Ygm7bWPJm1XTz/bYkHAKE9Zl/3wht6B20OL1mjk/6ZQSzF427RsY
	77hV/A4LUwW89RqeaC9luPic9rzlIx2VFuoPVpthJ8twqY4waOchjYVlaxxSQQx1nm6S
	SbWA==
X-Received: by 10.68.168.161 with SMTP id zx1mr29939903pbb.35.1439072198608;
	Sat, 08 Aug 2015 15:16:38 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:4ec:fbce:7a8:43c9?
	([2601:646:8601:4580:4ec:fbce:7a8:43c9])
	by smtp.gmail.com with ESMTPSA id
	bz4sm14607991pbd.6.2015.08.08.15.16.37
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 08 Aug 2015 15:16:38 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1438074961-21773-1-git-send-email-b40527@freescale.com>
Date: Sat, 8 Aug 2015 15:16:36 -0700
Message-Id: <FDBD0606-5635-4E99-B410-BAC9B8FDE32C@gmail.com>
References: <1438074961-21773-1-git-send-email-b40527@freescale.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2104)
Cc: Zongchun Yu <Zongchun.Yu@freescale.com>
Subject: Re: [meta-networking][PATCH] netperf: fix the broken download url
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
X-List-Received-Date: Sat, 08 Aug 2015 22:16:39 -0000
X-Groupsio-MsgNum: 56609
Content-Type: multipart/signed;
	boundary="Apple-Mail=_3482A002-F63A-445B-90B7-91601B669E83";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_3482A002-F63A-445B-90B7-91601B669E83
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jul 28, 2015, at 2:16 AM, b40527@freescale.com wrote:
>=20
> From: Zongchun Yu <Zongchun.Yu@freescale.com>
>=20
> Signed-off-by: Zongchun Yu <Zongchun.Yu@freescale.com>
> ---
> meta-networking/recipes-support/netperf/netperf_2.6.0.bb | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-networking/recipes-support/netperf/netperf_2.6.0.bb =
b/meta-networking/recipes-support/netperf/netperf_2.6.0.bb
> index d634af4..760bab0 100644
> --- a/meta-networking/recipes-support/netperf/netperf_2.6.0.bb
> +++ b/meta-networking/recipes-support/netperf/netperf_2.6.0.bb
> @@ -6,7 +6,7 @@ LICENSE =3D "netperf"
> LICENSE_FLAGS =3D "non-commercial"
>=20
>=20
> -SRC_URI=3D"ftp://ftp.netperf.org/netperf/netperf-${PV}.tar.bz2 \
> +SRC_URI=3D"ftp://ftp.netperf.org/netperf/archive/netperf-${PV}.tar.bz2 =
\

this is moved to archive because 2.7 is out. Why not upgrade to 2.7 =
while you are at it ?

>          file://cpu_set.patch \
>          file://vfork.patch \
>          file://init"
> --
> 1.8.3.2
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_3482A002-F63A-445B-90B7-91601B669E83
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXGf8UACgkQuwUzVZGdMxTfKACbBFBZ+QjEMoDpA68EFfnCqqDx
EGkAn0emlYRx1BqNtxQ4BRwHZiCL0iT6
=Geqe
-----END PGP SIGNATURE-----

--Apple-Mail=_3482A002-F63A-445B-90B7-91601B669E83--
