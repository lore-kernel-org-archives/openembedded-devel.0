Received: from static.26.116.47.78.clients.your-server.de ([78.47.116.26]
	helo=phalanx.drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1OlHki-0006UZ-59
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Aug 2010 10:42:36 +0200
Received: from [192.168.1.25] (business-092-079-168-007.static.arcor-ip.net
	[92.79.168.7])
	by phalanx.drlauer-research.com (Postfix) with ESMTP id 9F35658411D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Aug 2010 10:45:50 +0200 (CEST)
Mime-Version: 1.0 (Apple Message framework v1081)
From: "Dr. Michael Lauer" <mickey@vanille-media.de>
In-Reply-To: <1282030017.3641.18.camel@mattotaupa>
Date: Tue, 17 Aug 2010 10:42:19 +0200
Message-Id: <93156A86-D257-4A02-B728-9E3D43DEA61B@vanille-media.de>
References: <1281983778-21054-1-git-send-email-khimov@altell.ru>
	<201008162325.59305.roman@khimov.ru>
	<AANLkTik-LOv_7xTmgsEz8ip_smmZ+L4FeG0Cr5rHc1zF@mail.gmail.com>
	<201008171050.16611.roman@khimov.ru>
	<1282030017.3641.18.camel@mattotaupa>
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
Subject: Re: `DEFAULT_PREFERENCE = "-1"` of current (upstream) releases (was: [PATCH] openssl: update 1.0.0 to 1.0.0a)
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
X-List-Received-Date: Tue, 17 Aug 2010 08:42:36 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Am 17.08.2010 um 09:26 schrieb Paul Menzel:

> Am Dienstag, den 17.08.2010, 10:50 +0400 schrieb Roman I Khimov:
>> =D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=
=82 =D0=9F=D0=BE=D0=BD=D0=B5=D0=B4=D0=B5=D0=BB=D1=8C=D0=BD=D0=B8=D0=BA =
16 =D0=B0=D0=B2=D0=B3=D1=83=D1=81=D1=82=D0=B0 2010 23:35:59 =D0=B0=D0=B2=D1=
=82=D0=BE=D1=80 Khem Raj =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
>>> IMO the newest version in a recipe should always be default =
preference
>>> this way we can
>>> stabilize recipe upgrades quicker. This also means a wider testing
>>> before pushing a new recipe
>>> DEFAULT_PREFERENCE =3D "-1" makes it to escape the testing.
>>=20
>> Well, consider Perl, for example. Making 5.10.1 a default preference =
would=20
>> break binary packaged perl modules built for 5.8.8, so technically =
some=20
>> massive PR bump (most probably DISTRO_PR) is needed when updating to =
5.10.1.=20
>> Forcing distro maintainers to do that is not nice, IMO.
>> Although the way it is now Perl 5.10.1 seems to be rarely used, which =
is also=20
>> not nice. Probably, there is no way to solve this problem for =
everyone. With=20
>> D_P it's not used much, removing D_P is asking for "YOU BROKE MY =
BUILD!!!"=20
>> love messages from random corners.
>=20
> What about removing `DEFAULT_PREFERENCE =3D "-1"` and have the
> distributions not wanting it pinning to the old version? This could be
> done after a period of time after the push and an announcement to the
> list asking what distribution prefers what and make that change in one
> commit.

That sounds good to me. We should really try to keep a reasonable
default set of preferences so that certain DISTRO setting are not
mandatory.

Cheers,

:M:



