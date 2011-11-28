Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RUweW-0001NU-E6
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Nov 2011 09:33:28 +0100
Received: by lahe6 with SMTP id e6so495763lah.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Nov 2011 00:26:50 -0800 (PST)
Received: by 10.152.162.10 with SMTP id xw10mr27355994lab.12.1322468810798;
	Mon, 28 Nov 2011 00:26:50 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id px20sm11758775lab.2.2011.11.28.00.26.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 28 Nov 2011 00:26:50 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAMKF1sreJB3qkFnDZPxpxBv7bZBkfE6aJ0Jwbv55HvQepitj6g@mail.gmail.com>
Date: Mon, 28 Nov 2011 09:26:46 +0100
Message-Id: <652FFCE9-01FD-4E13-8ABA-4B7100803BE0@dominion.thruhere.net>
References: <1322395493-30396-1-git-send-email-koen@dominion.thruhere.net>
	<CAMKF1sreJB3qkFnDZPxpxBv7bZBkfE6aJ0Jwbv55HvQepitj6g@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Mailer: Apple Mail (2.1251.1)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe] digitemp: fix QA issues:
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Nov 2011 08:33:28 -0000
X-Groupsio-MsgNum: 35668
Content-Type: multipart/signed;
	boundary="Apple-Mail=_30094CC1-851E-4E43-A507-E7D95B57A81C";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_30094CC1-851E-4E43-A507-E7D95B57A81C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 28 nov. 2011, om 03:17 heeft Khem Raj het volgende geschreven:

> On Sun, Nov 27, 2011 at 4:04 AM, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
>> -EXTRA_OEMAKE =3D "ds9097 ds9097u"
>> +EXTRA_OEMAKE =3D "ds9097 ds9097u \
>> +                SYSTYPE=3D'Linux' \
>> +               "
>> +# Fix GNU_HASH QA errors
>> +TARGET_CC_ARCH +=3D "${CFLAGS} ${LDFLAGS}"
>>=20
>>=20
>=20
> why CFLAGS ? I thought only LDFLAGS would have been sufficient

For GNU_HASH yes, but the buildsystem was ignoring both CFLAGS and =
LDFLAGS.

regards,

Koen


--Apple-Mail=_30094CC1-851E-4E43-A507-E7D95B57A81C
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7TRcgACgkQMkyGM64RGpGywgCgjzrNXHq8p6U9B0SxwnA185VM
cFoAn2GqpleZxYeGQkSsr7oy/0lfrJn5
=Nbq+
-----END PGP SIGNATURE-----

--Apple-Mail=_30094CC1-851E-4E43-A507-E7D95B57A81C--
