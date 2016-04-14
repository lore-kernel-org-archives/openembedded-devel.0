Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id D5D666FF30
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Apr 2016 15:56:41 +0000 (UTC)
Received: by mail-pa0-f41.google.com with SMTP id er2so17514635pad.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Apr 2016 08:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=ZtZ64uzFBAMZ8oaODe8hHxArUK+Ek9HioT/p7TzYdBE=;
	b=h55h+dUcX2GfozqEq3PLUaBv6wYiDMib9DY8LjjIRFS7x+z2H4zp0zp1d4D3niNqe6
	C3ChQWI+8KZGMUuI0UpLt668gXF/OE7dcyyaTm0i+5xoVhM2Ek2xuCwL2lmJkK1pjTkf
	HRSbIExknHJQXhBwFMlMoTOPdg0CaJ8c5jv28btDsAjzNEJxgqElL3UUHNdMigmepsVM
	1ARvWNWeDLBXSnD/D2pXi1Jp6DhVqlaiB2kTYXbpD2EGlFqIc8WwUgiug7pfqloFT5W6
	evsuA7kcaE9/kvw9ficVvDdaLYpRqptJ3iXYzvdUZ8MDiXKVICfkOR+wYeTSUNVYPQpb
	+Ijw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=ZtZ64uzFBAMZ8oaODe8hHxArUK+Ek9HioT/p7TzYdBE=;
	b=QPQxgdYoqB6PZRdDFzoV5i35TopHZi2F2nl7CZAr29XeAQdt43B55r74EYDnsEmM8e
	kLljAjhvlpZRhJvdv0MvQBsa5pJ2dKS2By7u+GqVhGKPONqy+NlfrlDbJVv3mxQSzZAR
	xaHVqRNmk3MCKcCaRPGqRntuEsYzGUG3pB5p5osRuQ0Nue1ghNqwKAkPqX7F0zR337uV
	9sL3b1S18uV202J1m4JO4/k7GSrGByXtP2/AcDkec87rB/Ef7joW9x3g68n9sPUQ+t4p
	4S6Wv3MYniDuAoV5uh7miBvfHDZ6kdBUqC8K65XVp95vwBb/MBR3btAtNVcdVhgXu1ZQ
	VU3A==
X-Gm-Message-State: AOPr4FXS11j532HDGMJhQHp/dagrSA2RPlBM/wYqEe+p3Kc08f6TVJVMN7lgicR8/e5N4A==
X-Received: by 10.66.218.196 with SMTP id pi4mr22137850pac.147.1460649401950; 
	Thu, 14 Apr 2016 08:56:41 -0700 (PDT)
Received: from ?IPv6:2601:646:8800:5a9a:3548:274:68e3:527f?
	([2601:646:8800:5a9a:3548:274:68e3:527f])
	by smtp.gmail.com with ESMTPSA id
	z13sm58881775pfi.5.2016.04.14.08.56.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 14 Apr 2016 08:56:40 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1460644716-29000-1-git-send-email-fathi.boudra@linaro.org>
Date: Thu, 14 Apr 2016 08:56:35 -0700
Message-Id: <CFF55821-7BF7-476E-BF17-398E9FD336DD@gmail.com>
References: <1460644716-29000-1-git-send-email-fathi.boudra@linaro.org>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3124)
Cc: Brendan Le Foll <brendan.le.foll@intel.com>,
	Kevron Rees <kevron.m.rees@intel.com>
Subject: Re: [PATCH][meta-intel-iot-middleware] upm: update to 0.6.1 release
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
X-List-Received-Date: Thu, 14 Apr 2016 15:56:44 -0000
X-Groupsio-MsgNum: 61003
Content-Type: multipart/signed;
	boundary="Apple-Mail=_DDAD7502-0979-40FA-8A88-F848A4DEF0DC";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_DDAD7502-0979-40FA-8A88-F848A4DEF0DC
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Apr 14, 2016, at 7:38 AM, Fathi Boudra <fathi.boudra@linaro.org> =
wrote:
>=20
> PACKAGECONFIG ??=3D "python nodejs"
> -PACKAGECONFIG[python] =3D "-DBUILDSWIGPYTHON=3DOFF, =
-DBUILDSWIGPYTHON=3DOFF, swig-native python"
> -PACKAGECONFIG[nodejs] =3D "-DBUILDSWIGNODE=3DOFF, =
-DBUILDSWIGNODE=3DOFF, swig-native nodejs"
> +PACKAGECONFIG[python] =3D "-DBUILDSWIGPYTHON=3DON, =
-DBUILDSWIGPYTHON=3DOFF, swig-native python"
> +PACKAGECONFIG[nodejs] =3D "-DBUILDSWIGNODE=3DON, -DBUILDSWIGNODE=3DOFF,=
 swig-native nodejs"

Is nodejs a runtime dependency as well. ?

--Apple-Mail=_DDAD7502-0979-40FA-8A88-F848A4DEF0DC
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlcPvbcACgkQuwUzVZGdMxQqJgCeIHR4Mufk6QGmzhCVKvcir0s1
0s8An1Dbb6H39McSP8f39RDJPq+mDQsp
=v8lV
-----END PGP SIGNATURE-----

--Apple-Mail=_DDAD7502-0979-40FA-8A88-F848A4DEF0DC--
