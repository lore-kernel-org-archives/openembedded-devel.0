Received: from [67.134.254.86] (helo=ltrxmail.lantronix.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Lars.Holowko@lantronix.com>) id 1MOYSL-0004r3-RK
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Jul 2009 16:49:10 +0200
X-MessageTextProcessor: DisclaimIt (2.00.201) on draw.int.lantronix.com
Received: from 3putt.int.lantronix.com ([172.16.1.16]) by
	ltrxmail.lantronix.com with Microsoft SMTPSVC(6.0.3790.1830);
	Wed, 8 Jul 2009 07:36:27 -0700
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.3790.2992
MIME-Version: 1.0
Date: Wed, 8 Jul 2009 07:36:27 -0700
Message-ID: <022254FBC8645942BBF88A022862CDD33C60BB@3putt.int.lantronix.com>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] How does OE determine the kernel version that gets build?
thread-index: Acn/YPtfFX15gfk3SSWg5V/nExwEswAd4NxQ
References: <022254FBC8645942BBF88A022862CDD33C60BA@3putt.int.lantronix.com>
	<200907071713.50012.raj.khem@gmail.com>
From: "Lars Holowko" <Lars.Holowko@lantronix.com>
Importance: normal
Priority: normal
To: <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 08 Jul 2009 14:36:27.0677 (UTC)
	FILETIME=[7A02F4D0:01C9FFD9]
Subject: Re: How does OE determine the kernel version that gets build?
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
X-List-Received-Date: Wed, 08 Jul 2009 14:49:10 -0000
Content-Class: urn:content-classes:message
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable

Thanks Khem,

I'd swear that that line was not in conf/machine/at91sam9g20ek.conf but
that would make me look even siller, wouldn't it? ;-)
You saved me from going crazy...

Everything works fine.

Lars

-----Original Message-----
From: Khem Raj [mailto:raj.khem@gmail.com]=20
Sent: Tuesday, July 07, 2009 5:14 PM
To: openembedded-devel@lists.openembedded.org
Cc: Lars Holowko
Subject: Re: [oe] How does OE determine the kernel version that gets
build?

On Tuesday 07 July 2009 03:13:56 pm Lars Holowko wrote:
> Hi everybody,
>=20
> I am working with an Atmel AT91SAM9G20-EK evaluation board. I was able

> to successfully build the console-image and the default 2.6.28 kernel=20
> for it.
>=20
> Now I want to switch to a 2.6.30 kernel (for better wireless support)=20
> but bitbake linux or bitbake console-image always builds 2.6.28
instead.
> I copied a defconfig to recipies/linux/linux-2.6.30/at91sam9g20ek,
> copied the AT91 patches for 2.6.30 in its place and added a=20
> DEFAULT_PREFERENCE_at91sam9g20ek =3D "30" line to=20
> recipies/linux/linux_2.6.30.bb hoping to make the 2.6.30 kernel
active.
>=20
> I can build a running kernel 2.6.30 with bitbake -b=20
> recipies/linux/linux_2.6.30.bb.
>=20
> Funnily there is no DEFAULT_PREFERENCE_at91sam9g20ek line in=20
> recipies/linux/linux_2.6.28.bb and its DEFAULT_PREFERENCE =3D "-1" so =
I=20
> do not even understand why that kernel gets chosen at all.


because in conf/machine/at91sam9g20ek.conf it says it wants 2.6.28

PREFERRED_VERSION_linux =3D "2.6.28"

change that and it should pick whatever you chose instead of 2.6.28

Khem
=20
**********************************************************************
This e-mail is the property of Lantronix. It is intended only for the =
person or entity to which it is addressed and may contain information =
that is privileged, confidential, or otherwise protected from =
disclosure. Distribution or copying of this e-mail, or the information =
contained herein, to anyone other than the intended recipient is =
prohibited.


