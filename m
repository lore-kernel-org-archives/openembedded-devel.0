Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 2AA89767BF
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  8 Aug 2015 23:28:51 +0000 (UTC)
Received: by pacgr6 with SMTP id gr6so265276pac.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 08 Aug 2015 16:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=Wvlh8LSocQ6McEYFUYE+Ua2hS4bnz8tv4XHpYqpZfGI=;
	b=jq5qxpoVFosjKFBuGl/tDQ/tG5uIjeve+/ayK2y/Omrd0cx8bI/MbVpub8VBPwUWMN
	QJvrFbGrHjmXyEcmxk5ORaAI5c86BNgMLlaQsp08dy9FBIOoCH+qo4FxCGxoCYXf5yxz
	VmEPxMauS7+HH0JPoGv+N4Hld/C7Vkf/FRO/CAQMrxEXe3IttbEM49myftzXlxvK/Hfo
	VIrxJCDCpqFGhT6DO450a9626kdpGFcsMIPmYcOxroQFBjKScp9z3qTMRkVu4jfKGS18
	5UrOTf5i/KDKVxy387KYiNRZJ3k4Sfeo+VE6BTzF/WSw7kPDy60Pfy9AI0wRyXnvUf8X
	G9OA==
X-Received: by 10.68.218.234 with SMTP id pj10mr29590947pbc.120.1439076531672; 
	Sat, 08 Aug 2015 16:28:51 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:4ec:fbce:7a8:43c9?
	([2601:646:8601:4580:4ec:fbce:7a8:43c9])
	by smtp.gmail.com with ESMTPSA id
	fp3sm14747824pdb.24.2015.08.08.16.28.50
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 08 Aug 2015 16:28:51 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1434572301.2944.16.camel@Saturn.local.all>
Date: Sat, 8 Aug 2015 16:28:46 -0700
Message-Id: <278829B9-2B2E-46BF-BD03-F2257224CB2B@gmail.com>
References: <CALbNGRSo5g0ndeQTmrKYppX6g6-KTB2CrnDjJCs=d84PxnpQPQ@mail.gmail.com>
	<55818938.3090405@mlbassoc.com>
	<1434572301.2944.16.camel@Saturn.local.all>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2104)
Cc: Gary Thomas <gary@mlbassoc.com>
Subject: Re: [meta-browser] firefox not working for me (only)
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
X-List-Received-Date: Sat, 08 Aug 2015 23:28:53 -0000
X-Groupsio-MsgNum: 56614
Content-Type: multipart/signed;
	boundary="Apple-Mail=_0C95BC90-064C-482A-9836-36CC9B3C1F3F";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_0C95BC90-064C-482A-9836-36CC9B3C1F3F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jun 17, 2015, at 1:18 PM, Max Krummenacher <max.oss.09@gmail.com> =
wrote:
>=20
>>> * firefox fails with illeagal ARM instruction
>=20
> That sounds familiar, I thought then that it was specific to our setup
> with the binary Tegra X driver and the armv7a without neon setup, =
that's
> why I did not upstream my patches.
>=20
>>> On Wed, Jun 17, 2015 at 3:32 PM, Gary Thomas <gary@mlbassoc.com> =
wrote:
>>>>> Hmm - I was wondering why nobody took care.
>>>>>=20
>>>>> All my plattforms fail:
>>>>> * i.MX6 base
>>>>> * gumstix
>>>>> * raspberry Pi2
>>>>>=20
>>>>> I'll put this browser issue on my TODO currently I have no further
>>>>> time to take care.
>>>>=20
>>>>=20
>>>> BTW, I just tested both chromium and firefox on the i.MX6Q and RPi2
>>>> and they worked just fine.  Built from meta-browser:0cc0419a
>>>>=20
>>> Thanks for information. Let's focus on firefox's illegal ARM
>>> instruction crasher:
>>>=20
>>> * Last time I felt the only one facing a specific error it was =
caused
>>> by angstrom enabling thumb(2) for ARM (long story @meta-fsl-arm).
>>> Gary: I assume, you don't have thumb enabled - right?
>>> * firefox doesn't crash with "--safe-mode"
>>=20
>> I am not using thumb - off the shelf configurations for RaspberryPi2 =
and
>> BoundaryDevices nitrogen6x built with $DISTRO=3Dpoky are the ones =
I've tested.
>>=20
> Actually I use Angstrom with the instruction set defaulting to ARM.
>=20
>>>=20
>>> Looking into meta-browser I saw that firefox pins =
ARM_INSTRUCTION_SET
>>> =3D "arm" but firefox-l10n does not. When having some time left over
>>> (=3Dnever) I will test with thumb disabled for firefox-l10n and
>>> chromium.
>>>=20
>>> Andreas
>=20
> Have a look at
> =
http://git.toradex.com/cgit/meta-toradex.git/tree/recipes-mozilla/firefox?=
h=3DV2.4-next
>=20
> alignment.patch,
> =
Prevent-SIGILL-crashes-on-ARMv6-builds-built-with-the-NDK_10.0esr.patch =
.
>=20
> If usefull I could send a patch for meta-browser.

Please do so.

--Apple-Mail=_0C95BC90-064C-482A-9836-36CC9B3C1F3F
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXGkLEACgkQuwUzVZGdMxSP1QCfSwr66Hn7P3MYsVckiC36QEAb
2rAAn2YyzMlcw2cTa3SPOu6qcsyE0Z9V
=AU5f
-----END PGP SIGNATURE-----

--Apple-Mail=_0C95BC90-064C-482A-9836-36CC9B3C1F3F--
