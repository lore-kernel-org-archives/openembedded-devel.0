Received: from [81.228.8.83] (helo=pne-smtpout1-sn2.hy.skanova.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1MbMGj-0002Hr-0p
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Aug 2009 00:26:05 +0200
Received: from [10.175.196.247] (213.66.88.44) by
	pne-smtpout1-sn2.hy.skanova.net (7.3.140.3) (authenticated as
	u82406562)
	id 4A7285AE00122AFF for openembedded-devel@lists.openembedded.org;
	Thu, 13 Aug 2009 00:09:36 +0200
Message-ID: <4A833D9F.1090608@atmel.com>
Date: Thu, 13 Aug 2009 00:09:35 +0200
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Organization: Atmel Nordic AB
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4A81BE84.6010607@atmel.com>	<200908121433.31479.marcin@juszkiewicz.com.pl>
	<1250092579.12282.73.camel@mill.internal.reciva.com>
In-Reply-To: <1250092579.12282.73.camel@mill.internal.reciva.com>
Subject: Re: Contents of the "origin/ulf/linux-2.6.30.2" branch. Help with testing wanted.
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
X-List-Received-Date: Wed, 12 Aug 2009 22:26:05 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: Quoted-Printable

Phil Blundell skrev:
> On Wed, 2009-08-12 at 14:33 +0200, Marcin Juszkiewicz wrote:
>> Dnia wtorek, 11 sierpnia 2009 o 20:55:00 Ulf Samuelsson napisa=C5=82(a=
):
>>> I introduced the possibility to build linux using
>>> make <board>_defconfig, instead of using a
>>> defconfig in a board directory under linux.
>>> LINUX26_DEFCONFIG needs to be defined.
>> Interesting, will check. I see a problem anyway because linux_*.bb=20
>> recipes by default use defconfig as part of SRC_URI. But we can use=20
>> empty file to satisfy it.
>=20
> We've tried this kind of thing before on various platforms and it
> generally seems to be a losing proposition.  Even if your kernel source=
s
> are targetting just a single MACHINE, the kernel isn't quite modular
> enough yet that you can truly have a "one size fits all" configuration
> to suit all DISTROs.
>=20
> Also, if you are relying on the defconfig from upstream, any
> configuration change at all requires that you either patch it, or
> re-issue the upstream tarball.  Neither of those are as convenient as
> just editing the defconfig locally in OE.
>=20
> So, in general, I think you're probably better off sticking with the
> "defconfig in FILESDIR" paradigm.  That's not to say I'm completely
> opposed to adding the option to use the one from upstream, but I think
> you would need to be a bit careful about where you use it.
>=20
> p.

Initially, this is to allow easy test of a new board where a config
exists in the kernel.
When there is a configured/tested board, then there will be a defconfig.
Long term plan would make sure that the board defconfig is optimized for
openembedded.


I really don't like calling the stuff "defconfig" though.
Much rather call it "linux-2.6.30.2-at91sam9263nf.config"
or similar so I can tell what it is all about...

Also, why are we copying defconfig to the toplevel.
Why not copy to arch/<ARCH>/config/<BOARD>_defconfig
do the make <BOARD>_defconfig and then SED the contents?

>=20
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


--=20
Best Regards
Ulf Samuelsson



