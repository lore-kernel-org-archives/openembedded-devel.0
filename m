Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id A393575894
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Jan 2016 11:06:09 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id f206so130700601wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jan 2016 03:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=s81sQkQyRTkbcTCbLQyKNNighTax0XsbMz35wZDFt0s=;
	b=dE/XbM06T4tgQHa6/Z63bsKe/TEPjSNXAK2h6JG/jOOJ3fMAh4YxRNlQUI0e2GV0Ah
	tbutf4yLn856EE8/jxUgNqSYgVcYKxs8QAdYTU0Kw1/acpSzj13Pa9D30U2KGsgIGEqI
	i7igiqY96ZBmcrBxvGrojpaGjjUg/mcLTL4X9wW2RgONJlIHZvdcKHBoW/Zt9fBuAti7
	RjZbKv0zIG0Pu7kCMCYGAAz9qgxjDdfc2kG0fd8bSio262VwCreRxMC93PvUPL5VAq1F
	BeGn6lIFHrwnnZIj1c283h9h9d08MiktxUQ5zCioGutDD+jzBM/N7QcnGnu1F+YUROCK
	E4YQ==
X-Received: by 10.28.55.76 with SMTP id e73mr23354308wma.53.1452251169778;
	Fri, 08 Jan 2016 03:06:09 -0800 (PST)
Received: from walter.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12]) by smtp.gmail.com with ESMTPSA id
	s8sm53964067wje.35.2016.01.08.03.06.08
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 08 Jan 2016 03:06:09 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <568F8DB4.2070301@topic.nl>
Date: Fri, 8 Jan 2016 12:06:07 +0100
Message-Id: <8F28B104-AFFF-4225-9BAD-9AABAC4BF610@gmail.com>
References: <568F67B8.7060001@topic.nl>
	<B75422EE-16C0-4C07-8B55-124859899C82@gmail.com>
	<568F8DB4.2070301@topic.nl>
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
X-List-Received-Date: Fri, 08 Jan 2016 11:06:11 -0000
X-Groupsio-MsgNum: 59424
Content-Type: multipart/signed;
	boundary="Apple-Mail=_A301226A-4E86-4E12-B861-2332E8735A93";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_A301226A-4E86-4E12-B861-2332E8735A93
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> Am 08.01.2016 um 11:21 schrieb Mike Looijmans =
<mike.looijmans@topic.nl>:
>=20
> On 08-01-16 10:48, Jens Rehsack wrote:
> ...
>>> What did I do wrong?
>>=20
>> meta-java is master, so you need poky on master, too - or cherry-pick =
the autotools.bbclass patch
>>=20
>=20
> Current master is borked, it won't parse because about a dozen recipes =
need QT4 things that have been removed.

cherry-pick fe506edd from poky/master

Cheers
--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_A301226A-4E86-4E12-B861-2332E8735A93
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJWj5ggAAoJEESZlq7c5QqdTDMP/RTCaGEkzoCKv66svxDnorEQ
6hyL5S0M5FKGTkn4NknlajxaCYTgi/NAIDnhYz/3LeAB0ByBb5wFfK0KbPJImgXy
avbigbPgFiBi68PH1nwJ6cnlsVKkl8pkkM54UDn390xG4I2hCuMhZXHnzKAYc1l8
1sFdC5rLTVmehHwJXVBAPy9gV094o1QlIA00U3qli0BlCGeJYPRg5BdYLyZC/diQ
CPuFZhnXpoDzeBNKMAaPddxlJYU/dY4zCcOKpkNUuoDCVPyv2+k9zEu6rNs6T2BJ
A2dASaomCbkWj5iaHv8AdC0pwF9va7KZP5mKpDKTxNWqzqGKNnbefCtTN8t4/Q6Y
v2B8R90fveGIaPOoAPjgOnLW/9GfXJ02WLTixsqWNRwEEz/DdrJTztVlC+N4yZHU
xWygRLl9h0ZsSlB1KaR6BBRgbwzicPuNzPM/nAfM52dvFj9223akNSDnMmxEdn2+
wjnYqjyTlXb9TxurbcrQb9ClEZEYeAVcU/Ln3sfW58pDzP8fVEKXQUhr1pX1bsQh
NdldeDUwEvWg7kpAE1Vq+WfH+pN1DXTVkJjgLcPh1/NiplHh4nr6y9ZFh95+/Bc1
j9MvJd/LSUA4BXBIGBCjvKCoXFthtwp8eGCRBQLJvIANVqUR09n8mG5CP6oLa+fG
XVYAxMEifbsGYMucA4hA
=ud6c
-----END PGP SIGNATURE-----

--Apple-Mail=_A301226A-4E86-4E12-B861-2332E8735A93--
