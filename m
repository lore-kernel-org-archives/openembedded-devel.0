Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id 5B52676ABD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2015 06:38:34 +0000 (UTC)
Received: by pacdd16 with SMTP id dd16so115818982pac.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 23:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=54TYSN3wYGqWhp3BjNlIA5qEjbHwVOuPNB2HaXSw3hI=;
	b=CvXfMgB9uoC4BASb5+mnSeZrNfr89LR32DO2ngP8RF0mYFQq1cOWHbHGEDbe9XdDTi
	cfq4d0Yi/+pLUCTYhR/bc2L4hHvTgdeI9iiJH58CWDJzJD2RaI71y2Vz+WtMn2OrzqgD
	XgV/CIvtzDcZlj5t/SuUlrhAexnR6DiaRI/CgxSBAsXxfHhofI1f6nE49w+5ZxgaZJLh
	qoY2lty253T6nFDyzqRky6H5Hm7ZiJs5cuMngxc4bjQb142KWlcdaHZZd1LIO40JleED
	CztObbvONzqp7DWj+44T4EC04rKCZPSRNgxH/ntybePWaw4QLnT/LZlNUP5OuVwPKA89
	HCXw==
X-Received: by 10.66.218.135 with SMTP id pg7mr53303463pac.141.1440484715121; 
	Mon, 24 Aug 2015 23:38:35 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:4ded:b62b:f72d:209d?
	([2601:646:8601:4580:4ded:b62b:f72d:209d])
	by smtp.gmail.com with ESMTPSA id
	ud2sm19741529pab.45.2015.08.24.23.38.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 24 Aug 2015 23:38:34 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.1
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <55D580DA.7080004@skidata.com>
Date: Mon, 24 Aug 2015 23:38:30 -0700
Message-Id: <FA6D4712-DD99-40AC-8393-136CDA3CDDD8@gmail.com>
References: <1439928871-17797-1-git-send-email-mario@ossystems.com.br>
	<CAD0=qkLXGaNYJ6X_sUXk3EEbi0EvoN1z0ufGvwB8V41Bo4ETyQ@mail.gmail.com>
	<55D580DA.7080004@skidata.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2104)
Subject: Re: [meta-java][PATCH 1/3] Don't depend on a hardcoded compiler
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
X-List-Received-Date: Tue, 25 Aug 2015 06:38:35 -0000
X-Groupsio-MsgNum: 56997
Content-Type: multipart/signed;
	boundary="Apple-Mail=_46CCCEB8-1A32-49FC-BF11-6DA57924E347";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_46CCCEB8-1A32-49FC-BF11-6DA57924E347
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Aug 20, 2015, at 12:25 AM, Richard Leitner =
<richard.leitner@skidata.com> wrote:
>=20
> Hi,
>=20
> On 08/19/2015 01:53 PM, Sven Ebenfeld wrote:
>> This patch creates a circular dependency for me:
>>=20
>> ERROR: Unbuildable tasks were found.
>> These are usually caused by circular dependencies and any circular
>> dependency chains found will be printed below. Increase the debug
>> level to see a list of unbuildable tasks.
>>=20
>=20
> Same problem for me!
>=20
> My settings are:
> PREFERRED_PROVIDER_virtual/java-initial-native =3D =
"cacao-initial-native"
> PREFERRED_PROVIDER_virtual/java-native =3D "jamvm-native"
> PREFERRED_PROVIDER_virtual/javac-native =3D "ecj-bootstrap-native=E2=80=9D=


can you change this to

PREFERRED_PROVIDER_virtual/javac-native =3D "ecj-initial-native"

and retry ?


--Apple-Mail=_46CCCEB8-1A32-49FC-BF11-6DA57924E347
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXcDWsACgkQuwUzVZGdMxRQhgCeOzbG8/BR52M9YEBpY1f+DSXJ
6gwAmwbwXDKPxbHmPE8WtKZlxbbcpkAU
=z6MO
-----END PGP SIGNATURE-----

--Apple-Mail=_46CCCEB8-1A32-49FC-BF11-6DA57924E347--
