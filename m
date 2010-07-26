Received: from static.26.116.47.78.clients.your-server.de ([78.47.116.26]
	helo=phalanx.drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1OdMwz-000843-F0
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Jul 2010 14:38:34 +0200
Received: from [192.168.1.9] (business-092-079-168-007.static.arcor-ip.net
	[92.79.168.7])
	by phalanx.drlauer-research.com (Postfix) with ESMTP id 2C93D584109
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jul 2010 14:40:00 +0200 (CEST)
Mime-Version: 1.0 (Apple Message framework v1081)
From: "Dr. Michael Lauer" <mickey@vanille-media.de>
In-Reply-To: <i2julr$fbh$1@dough.gmane.org>
Date: Mon, 26 Jul 2010 14:38:18 +0200
Message-Id: <FABAFD53-F00E-4D6E-811E-4249C9853C8C@vanille-media.de>
References: <4C4D586A.5040202@kernelconcepts.de> <i2jrnl$4j3$2@dough.gmane.org>
	<AANLkTimRxtBib-WUkcm75eNLQvws8Rw-Nf-Z6uQvFetR@mail.gmail.com>
	<i2julr$fbh$1@dough.gmane.org>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1081)
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: native preferences
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
X-List-Received-Date: Mon, 26 Jul 2010 12:38:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Am 26.07.2010 um 14:22 schrieb Koen Kooi:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> On 26-07-10 14:08, Frans Meulenbroeks wrote:
>> 2010/7/26 Koen Kooi <k.kooi@student.utwente.nl>
>>=20
>> On 26-07-10 11:42, Florian Boor wrote:
>>>>> Hi all,
>>>>>=20
>>>>> I tried to build a "minimal" distribution image lately and ran =
into some
>> trouble
>>>>> because the old-style native packages seem to be preferred over =
the new
>> ones
>>>>> using BBCLASSEXTEND.
>>>>> In this case we have glib-2.0-native 2.24.1 provided by the new =
mechanism
>> and
>>>>> 2.22.1 gets build which is the latest old-style native bb.
>>=20
>> That's minimals broken by design behaviour, it refuses to pin any
>> version. So either pin the version or switch to a sane distro like
>> angstrom or shr.
>>=20
>>=20
>>=20
>>> Hm. I would expect that if there is a glib-2.0 recipe 2.24.1 with
>>> BBCLASSEXTEND =3D "native" and  no pinning and no DEFAULT_PREFERENCE =
being in
>>> effect, that 2.24.1 gets build and not 2.22.1 which has a real =
native
>>> recipe. To me recipes with -native and implict ones with =
BBCLASSEXTEND =3D
>>> "native" are equivalent prioritywise, so I'd say this is a bug in =
the class
>>> code.
>=20
> And that bug has been known for months and reported multiple times by
> people attempting to use minimal. And for so far the bug has been =
fixed
> in bitbake 1.10, but minimal still refuses to pin versions, so the
> advice to switch distro still stands.

Of course the preferred way - rather than switching distros - is to fix =
this obvious bug
in the OE metadata.

Cheers,

:M:



