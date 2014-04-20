Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id B5B3165D4C
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 09:05:06 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id e53so2863484eek.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 02:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=4WM5GExLAbMui67rQYfZpjIpk2g5GrL9mmJjcOdho4s=;
	b=cTzkl2VFgsnFBvsytoeCQKJLTMDSIpoHvNw2ok0XKinmVaslUMgwgkvvtHFIRQLar/
	oYZWy/hh7xazLh3PLr0BxAG+jW4SzObDD9CmfKd3q3Hkqd4LXIsZicZR3CLFmCSgwFV8
	Ni5sYBa1APZal6+Swnb/kQu/xpXlUESnauMWYRsaqYQgwThk50W1Nnl/rOM87y9MQOcB
	9tRZs1YiAqK4wtvTmbRdPL1fN9NY40eadaOEKpGzVU2Sw0/pUyak6n+xO17036cIpbfH
	tu4BxkSeAvPGuO2xV2FxLdmaZjwfAGBliVA61X4x8OViskHqFxa4OIaZIB/tvUCSGZDC
	NQEw==
X-Received: by 10.14.126.73 with SMTP id a49mr37162363eei.46.1397984707507;
	Sun, 20 Apr 2014 02:05:07 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	x46sm92257919een.17.2014.04.20.02.05.05 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Apr 2014 02:05:06 -0700 (PDT)
Date: Sun, 20 Apr 2014 11:05:11 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140420090511.GQ2486@jama>
References: <1396327671-22282-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1396327671-22282-1-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [meta-oe][PATCH] linuxptp: fix and simplify recipe, drop dependency on kernel
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
X-List-Received-Date: Sun, 20 Apr 2014 09:05:11 -0000
X-Groupsio-MsgNum: 49298
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Vsi50HYs5tPfr+1I"
Content-Disposition: inline

--Vsi50HYs5tPfr+1I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 01, 2014 at 12:47:51AM -0400, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> * Build script tries to locate the correct /usr/include/linux/net_tstamp.=
h just
> to see if it contains definition for HWTSTAMP_TX_ONESTEP_SYNC. But that h=
eader
> file hasn't changed in at least 5 years. The result of the check is to pa=
ss
> additional defines to the build, which can be passed via EXTRA_OEMAKE.
>=20
> * The sed command on makefile wasn't even working, plus there's no AR, pr=
efix
> is not used and better way is to use EXTRA_CFLAGS and EXTRA_LDFLAGS anywa=
y.
>=20
> * Neither autotools nor pkgconfig are use during the build, don't inherit=
 them.
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  meta-oe/recipes-connectivity/linuxptp/linuxptp_1.4.bb | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)

Sorry for delay caused by test-dependencies run, but finally merged,
thanks!


--Vsi50HYs5tPfr+1I
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNTjccACgkQN1Ujt2V2gBzWBQCgpJgm9pW1UJ6GhfuPcTuL1zkb
Y+0AoIL3SlBvFN8i5pcd0yZt14OAoXN7
=D2NP
-----END PGP SIGNATURE-----

--Vsi50HYs5tPfr+1I--
