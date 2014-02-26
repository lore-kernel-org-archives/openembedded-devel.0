Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f44.google.com (mail-pb0-f44.google.com
	[209.85.160.44])
	by mail.openembedded.org (Postfix) with ESMTP id 874AF6BF4E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2014 16:26:38 +0000 (UTC)
Received: by mail-pb0-f44.google.com with SMTP id rp16so1209456pbb.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2014 08:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=s2rzUIz44JkxiiyNzP8kKIPVrrzdaVMySDubaUFsQ4w=;
	b=Rtyn9+CORPoKXY2sYBZewYxZetNrm7Z1e+wQjPL2LrTy16gdt6f1+ShE1jIS8GS0UJ
	55DrZV16U4pLJ4ll7i+i4J9Srf3QPdLwtRUj67boXEwconm0XyWU5iJO3HthT80/usic
	Fo2PNn5ih//0wO/ZZd35eyQ3bCoN6v+uJyJP6PyvNSIe7pSA5EbqSdBh9f7HnRUQVWm1
	Q2DRAExwLywwzZMSCPHXpTz/WeMNUZnApi+6XLn52o/yo0HU6UnJHuNLYprrbgR1F9CS
	i1xHbRnhFH3xH5XbU6UtX8/BDZINyL1Mo5P7vQw/cHOHEB+vNwa07rODI2tgtveLQI84
	GFOw==
X-Received: by 10.68.190.163 with SMTP id gr3mr7669183pbc.103.1393431999331;
	Wed, 26 Feb 2014 08:26:39 -0800 (PST)
Received: from [192.168.0.33] (99-57-140-30.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.30])
	by mx.google.com with ESMTPSA id yz5sm10268364pac.9.2014.02.26.08.26.37
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 26 Feb 2014 08:26:38 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAP9ODKp0UPWJypF9F6f+bL+xL8eaHYHb9H=RYG_sKV8DMyS=SA@mail.gmail.com>
Date: Wed, 26 Feb 2014 08:26:36 -0800
Message-Id: <E5201FDD-3B16-4A7B-8F2D-8884F17DB199@gmail.com>
References: <1393273696-9249-1-git-send-email-otavio@ossystems.com.br>
	<1393273696-9249-3-git-send-email-otavio@ossystems.com.br>
	<CAMKF1sor8AfGAjLODy5W9N91HQsBTTvAhh0+j3S-Obn_Gdv2Nw@mail.gmail.com>
	<CAP9ODKp_b4MmZZ38DSB5JwWevucrOmE3tzFeL2F-DKe9=LyEnA@mail.gmail.com>
	<CAFYUCi7N-M1DVsnnxqcmMy8YJFsocDeYOn5Y3qBt8Ku1GB4_NA@mail.gmail.com>
	<CAP9ODKp0UPWJypF9F6f+bL+xL8eaHYHb9H=RYG_sKV8DMyS=SA@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Mailer: Apple Mail (2.1827)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH 2/3] packagegroup-qt5-qtcreator-debug: Add package group
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
X-List-Received-Date: Wed, 26 Feb 2014 16:26:39 -0000
X-Groupsio-MsgNum: 48366
Content-Type: multipart/signed;
	boundary="Apple-Mail=_DD51D5D5-0DF0-45AB-8519-D5A4646FD137";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_DD51D5D5-0DF0-45AB-8519-D5A4646FD137
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=iso-8859-1


On Feb 26, 2014, at 4:40 AM, Otavio Salvador <otavio@ossystems.com.br> =
wrote:

> Hello Khem,
>=20
> On Wed, Feb 26, 2014 at 9:18 AM, Giulian Vivan =
<giulian@ossystems.com.br> wrote:
>> We tested it and when qtcreator tries to connect to the device with
>> dropbear, it gets "server rejected password". A connection done =
through a
>> terminal is accepted normally.

do you have empty password ?=20

>=20
> Any specific reason to prefer Dropbear?

it smaller than openssh many embedded platforms have it in their images
you will have conflicts if you now try to shove hard dep on openssh

>=20
> --=20
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


--Apple-Mail=_DD51D5D5-0DF0-45AB-8519-D5A4646FD137
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlMOFbwACgkQuwUzVZGdMxQbTACfQKZlK4unqaWiVf2WFJ2y9iA0
tjYAn2SOKtg4+1zKCmmLnWqEuZbgscOh
=nEJE
-----END PGP SIGNATURE-----

--Apple-Mail=_DD51D5D5-0DF0-45AB-8519-D5A4646FD137--
