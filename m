Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id C559360670
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Jan 2016 09:48:45 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id u188so130109999wmu.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jan 2016 01:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=RXvWOfIz45xSghdavEbgKs39PiM587plKhLCVKavygA=;
	b=regV3Q+18aKsXHDp29LzBZDeIBrAyuGR/ls9uKPfRX5D35AhwDF66bAjLvqyzO9/Ls
	qgPj6h1+S4l2kXqczOly/EeL6DIY5kvpbQf5yABoOPKr7uW4piMncogrFlvWz7KFltQA
	1oqBdVtl5Zh6tLje6fWnfAb/axiiLgD9nqnBaAIvRjKS6XePb0DttfQOEJV0nMwN0ceZ
	0rB7uo/QHIWEZgaDfG4TUhHesAjdemNGTdsjI825ahy1j/ADZsWG2Ify0v5IZ5j7jrkw
	SupB7kChgDKG7CqhltZo0lZ4EBOYAsJ7qdIPXCewIWz7vX2hGu9FxsTUOrxbg9vp/XVJ
	T3ZA==
X-Received: by 10.194.9.169 with SMTP id a9mr117520636wjb.60.1452246525695;
	Fri, 08 Jan 2016 01:48:45 -0800 (PST)
Received: from walter.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12])
	by smtp.gmail.com with ESMTPSA id w1sm17683403wmd.2.2016.01.08.01.48.44
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 08 Jan 2016 01:48:45 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <568F67B8.7060001@topic.nl>
Date: Fri, 8 Jan 2016 10:48:44 +0100
Message-Id: <B75422EE-16C0-4C07-8B55-124859899C82@gmail.com>
References: <568F67B8.7060001@topic.nl>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3112)
Subject: Re: Building java
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
X-List-Received-Date: Fri, 08 Jan 2016 09:48:48 -0000
X-Groupsio-MsgNum: 59419
Content-Type: multipart/signed;
	boundary="Apple-Mail=_3367023E-4DEF-4E21-8A0E-8D24CB1EEAAB";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_3367023E-4DEF-4E21-8A0E-8D24CB1EEAAB
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> Am 08.01.2016 um 08:39 schrieb Mike Looijmans =
<mike.looijmans@topic.nl>:
>=20
> Someone in our project decided he wanted Java on the board, so I just =
added "meta-java" to the layers and attempted to follow the README.
>=20
> So without a clue as to what I'm really doing (I haven't touched Java =
in 15 years) I added these to my local.conf:
>=20
> # Headless java
> PREFERRED_PROVIDER_classpath =3D "classpath-minimal"
> # Possible provider: cacao-initial-native and jamvm-initial-native
> PREFERRED_PROVIDER_virtual/java-initial-native =3D =
"cacao-initial-native"
> # Possible provider: cacao-native and jamvm-native
> PREFERRED_PROVIDER_virtual/java-native =3D "jamvm-native"
>=20
> And of course added meta-java to bblayers.conf.
>=20
> I added "openjdk-8" to the image's things to install, and let things =
build.
>=20
> While building "openjdk-8-native", things went south, and I get the =
following error message:
>=20
> ERROR: no configure script found at =
/home/mike/projects/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native=
/72b05-r0/jdk8u-e8bed1496ff2/configure
>=20
>=20
> What did I do wrong?

meta-java is master, so you need poky on master, too - or cherry-pick =
the autotools.bbclass patch

> (Note: the board does not have a display, so I don't need/want x11. I =
tried building openjdk-7 instead, but that fails to parse because it =
requires x11 in the distro)

You could port the remove-x11-patches to openjdk-7, since we currently =
need Java8, I have no "business case" to fix openjdk-7 :/

Cheers
--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_3367023E-4DEF-4E21-8A0E-8D24CB1EEAAB
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJWj4X8AAoJEESZlq7c5Qqd5/sQAKIPXRPgtUr04aOYu4ODRcJE
g83q8ogb34azUoq4wdHb3Rub198awiPbHf09nypXr4e73RlBCs1ckxRipe8K/9tt
1L5NqYzBk3WTdq9s6oWdi5YbzpQFcRB6i45Xo+D/mFFv/JdstLBrXq7lthlRaXp7
jZICUfqbtcusVYKoXr8MzoLM8FP0nktPvWu6BxL8DI0zUMkhqJP+U7Y5e1lEBmOM
6m2VrylEY8xwqljln5mp6De4mQRWAX8GICtXxxT36giv91Qxh3T1fKcbSpUxVeI7
DMcqLroTFGs/DOAsou4SSG/y4VJ6ghR1465+X/CqYHyEE3Hfic6e+Gm6UgXKNDpR
VgovxoXU9Kj8RvhPfmG/3KNe/OytfIJFuBPPyZWscbrZcxj2ufwOfxt6BeUQ8wZ6
c8FAPVTUeEcWjXg7RS9RwDsDehHYw317+7hZXPw/Jxv7Iij7mjqXGuXfmXehtCk/
p0e4lwbAn8hiX/WYDNP0c2KQSmHIBWI/6u7rTrEPSEYFjUqDTWoR5rUaW57z7KcO
tnoD9kyBpkBRCzMbyjHKzxHr4GKqdRFaVfIN25utUMpW/SwDIgfnoToWnJWQZphG
cC4dtK7Mze0WUE0FeR06y71w52dYRpPepZvsyYOZugAyRG2rdRlgZFr4/Fb/S6v4
BBHt8irReyCvn/8w3FXl
=6ocs
-----END PGP SIGNATURE-----

--Apple-Mail=_3367023E-4DEF-4E21-8A0E-8D24CB1EEAAB--
