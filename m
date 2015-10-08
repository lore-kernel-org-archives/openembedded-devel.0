Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id E7AEA65CBC
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Oct 2015 01:33:00 +0000 (UTC)
Received: by pacex6 with SMTP id ex6so37562069pac.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Oct 2015 18:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=ddHaRK7DiFlkWasrvpKidyobcGQBgoe7CoCY0EeMliM=;
	b=qSG84Mls1W+4KDRmmfYi5Va0bvj/OTekY+J9UATQiBrTZhiAfL0S5wcvtpMEDRF6gn
	QCG2WdLgfCHdT/f00TLE85lBvg245M3prEUUwy3PdS2hoRa4JitRbD80QndI2vQ/5j7W
	SHk6X9wSbdDZ4vLNwN9sbmm9m7D1iSaRR9IO8DpB2Gk51XWJD71/97gX4E3Wtx313S1D
	4/YBROU/UKl1RLQM4fdipulObIyOSfQ86uiN70iMul+HKGmZ7bR3SADfH8ofQAg/s7cE
	7bsR7roCIehjMzx1MgyeJfiOfssupuuz0lancWs0fMIPTkjV03Q+UFIO3j3dExHcTqJr
	5N+A==
X-Received: by 10.66.146.69 with SMTP id ta5mr4871556pab.46.1444267980560;
	Wed, 07 Oct 2015 18:33:00 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:787e:b3a8:cb23:6c63?
	([2601:646:8601:4580:787e:b3a8:cb23:6c63])
	by smtp.gmail.com with ESMTPSA id
	q8sm28615493pap.34.2015.10.07.18.32.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 07 Oct 2015 18:33:00 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.0 \(3095\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <5614C9FA.20703@topic.nl>
Date: Wed, 7 Oct 2015 18:33:00 -0700
Message-Id: <AF04C61C-E12F-43B8-B718-90842E413931@gmail.com>
References: <5614C9FA.20703@topic.nl>
To: Martin Jansa <openembedded-devel@lists.openembedded.org>
X-Mailer: Apple Mail (2.3095)
Subject: Re: meta-openembedded "toolchain-layer" is broken
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
X-List-Received-Date: Thu, 08 Oct 2015 01:33:03 -0000
X-Groupsio-MsgNum: 57706
Content-Type: multipart/signed;
	boundary="Apple-Mail=_0677F5A2-8FD6-48DC-8A5C-F69A11D648F0";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_0677F5A2-8FD6-48DC-8A5C-F69A11D648F0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

At this point, I would accept a patch to remove this layer from =
meta-openembedded
no body maintains it anymore.

> On Oct 7, 2015, at 12:30 AM, Mike Looijmans <mike.looijmans@topic.nl> =
wrote:
>=20
> If you happen to have "toolchain-layer" in your bblayer list, it will =
trigger this:
>=20
> ERROR: ExpansionError during parsing =
.../meta-oe/toolchain-layer/recipes-devtools/gcc/gcc-crosssdk_4.6.bb: =
Failure expanding variable SRCPV, expression was =
${@bb.fetch2.get_srcrev(d)} which triggered exception FetchError: =
Fetcher failure: SRCREV was used yet no valid SCM was found in SRC_URI
>=20
> I just happened to notice. Maybe it's time to take gcc 4.6 to the glue =
factory?
>=20
>=20
> Kind regards,
>=20
> Mike Looijmans
> System Expert
>=20
> TOPIC Embedded Products
> Eindhovenseweg 32-C, NL-5683 KH Best
> Postbus 440, NL-5680 AK Best
> Telefoon: +31 (0) 499 33 69 79
> Telefax: +31 (0) 499 33 69 70
> E-mail: mike.looijmans@topicproducts.com
> Website: www.topicproducts.com
>=20
> Please consider the environment before printing this e-mail
>=20
>=20
>=20
>=20
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_0677F5A2-8FD6-48DC-8A5C-F69A11D648F0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlYVx8wACgkQuwUzVZGdMxS1ZQCbBNXuXWgZ6IyPvqH9U9htJmBG
iocAnRDd6w7yxCDMP363SKoAcI37NX1D
=anNU
-----END PGP SIGNATURE-----

--Apple-Mail=_0677F5A2-8FD6-48DC-8A5C-F69A11D648F0--
