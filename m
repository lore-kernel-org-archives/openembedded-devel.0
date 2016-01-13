Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f175.google.com (mail-pf0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 89C386E6B1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jan 2016 18:35:46 +0000 (UTC)
Received: by mail-pf0-f175.google.com with SMTP id e65so85548078pfe.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jan 2016 10:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=BwhoQwbpdFlXMazdEAnVb3MVHA36o3dX4ZXhdH/+hBs=;
	b=xyPx8KA1JvhC++8NYkXBpw8gAawzjXarGWP4mKui4V+P2EW6aLMHFmtP53UcJ3O0Ws
	6+kIUCyo4oTjfqPOtnw0ZZcbli6Nj+NxXiMSFmsTWHbb/mraMPqsjRtXBy8bN+0WWrKt
	fySiPngGEtnUt5nXR1S44TM0bCLBSggClq9naFFXJv4yPhpMScEZEKFi7cIUgnttGq7U
	rSRJBe0EnAKg/we/eLI3JLm3syxl22gyzKjaTE1cBV5VAlPwKKLC5PIyXy8UqZrmHG1O
	TBCN81o4u+KKw65m8Neqr8w5UI6DEC+ZqlzFHkR7+xvCkMun1RHd5zw5sKF9R2/ohP4B
	Y/8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:message-id:references:to;
	bh=BwhoQwbpdFlXMazdEAnVb3MVHA36o3dX4ZXhdH/+hBs=;
	b=W0R1/DqgnwXwenT8I2eYXur36zaEEXeq0Xw5jiC4cjBJCGTXo9WyuVY9BCh2JutgJX
	pFYxI7ZAJVnJEB/AImZjIJn0KDdcuWFyYB4o28MtEwK3xErKXOc3WAQ0IO1Ajfey+T1D
	YZxyONnmGE1/i5RBIz9TBwSTYm3atn6YbRw0/7h04x4CsVNBPleEHBRKzw96ZPzLhWx8
	lN4AD83SCSXB3vcX5p5VsxP355sIAAQblsLosLrqrtuOupD9DrH/0CpclzU1AVXIA4MY
	jy65mkOmVrhH4TXRHSOzkQ8GSUWpahYuNnHkkDziL1zTSUyBFAI7AMOWfgCIRuqapKGm
	QnbA==
X-Gm-Message-State: ALoCoQnXnjdVkkrk2z8TEVOItljGce0CkJkPHbIpgKbcH857UOk5hz3bII870X2kigL+SX2Elz8GsNzqPizdrlb5prhYmKU42Q==
X-Received: by 10.98.67.135 with SMTP id l7mr44477024pfi.148.1452710147095;
	Wed, 13 Jan 2016 10:35:47 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:e406:58c9:b337:c1d9?
	([2601:646:8802:5d5c:e406:58c9:b337:c1d9])
	by smtp.gmail.com with ESMTPSA id
	dz12sm4276221pac.2.2016.01.13.10.35.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 13 Jan 2016 10:35:45 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAF3KAoRyD7EXhOBjECXnyZzTWAW8P65=GJScxr1TGtoveH_HTA@mail.gmail.com>
Date: Wed, 13 Jan 2016 10:35:39 -0800
Message-Id: <DC79C3D6-8838-4EEE-B607-84BAAF5B519D@gmail.com>
References: <CAF3KAoQkwWWr=xfifeqP_bK25_ysY_7+B2h7xT6L9P1Pf34KhQ@mail.gmail.com>
	<CAF3KAoS1+0fy16WjorADA3cqTjCPZwSJGOmjex6b1mKcEQw7oA@mail.gmail.com>
	<CAF3KAoTLPCK3NMm-NfVgJq80mvQBzz2WYw92p5jM6t2ySi0fAw@mail.gmail.com>
	<CAF3KAoRyD7EXhOBjECXnyZzTWAW8P65=GJScxr1TGtoveH_HTA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
X-Mailer: Apple Mail (2.3112)
Subject: Re: [meta-oe] OpenLDAP modules
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
X-List-Received-Date: Wed, 13 Jan 2016 18:35:46 -0000
X-Groupsio-MsgNum: 59517
Content-Type: multipart/signed;
	boundary="Apple-Mail=_A544704D-9337-4109-827E-230B50D3CA09";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_A544704D-9337-4109-827E-230B50D3CA09
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Jan 13, 2016, at 8:46 AM, Bruno Vernay <brunovern.a@gmail.com> =
wrote:
>=20
> Adding this to my bbappend did the trick ...
>=20
> TARGET_CC_ARCH +=3D "-lpthread=E2=80=9D

make it -pthread and add it to LDFLAGS

>=20
> I may submit a patch
>=20


--Apple-Mail=_A544704D-9337-4109-827E-230B50D3CA09
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlaWmQAACgkQuwUzVZGdMxTWcACff4d+poQ58xpuunTBMsrnIp6Q
UTwAniXtKi1ihhK75qj4HFxf2gpMZ0Fo
=z3Pd
-----END PGP SIGNATURE-----

--Apple-Mail=_A544704D-9337-4109-827E-230B50D3CA09--
