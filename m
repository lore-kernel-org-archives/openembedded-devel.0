Received: from [81.228.8.164] (helo=pne-smtpout2-sn2.hy.skanova.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1MfBZO-0002VW-Bn
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Aug 2009 13:49:10 +0200
Received: from [10.175.196.247] (213.66.88.44) by
	pne-smtpout2-sn2.hy.skanova.net (7.3.140.3) (authenticated as
	u82406562)
	id 4A5BC8BE0036047B for openembedded-devel@lists.openembedded.org;
	Sun, 23 Aug 2009 13:31:32 +0200
Message-ID: <4A912893.7010708@atmel.com>
Date: Sun, 23 Aug 2009 13:31:31 +0200
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Organization: Atmel Nordic AB
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4A81BE84.6010607@atmel.com>	<200908211353.59344.marcin@juszkiewicz.com.pl>	<4A902ECF.3090909@atmel.com>
	<200908231241.51880.marcin@juszkiewicz.com.pl>
In-Reply-To: <200908231241.51880.marcin@juszkiewicz.com.pl>
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
X-List-Received-Date: Sun, 23 Aug 2009 11:49:10 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: Quoted-Printable

Marcin Juszkiewicz skrev:
> Dnia sobota, 22 sierpnia 2009 o 19:45:51 Ulf Samuelsson napisa=C5=82(a)=
:
>> Marcin Juszkiewicz skrev:
>=20
>>> Any ideas? I have same problem when 2.12 is used. 1.14 works still.
>> This is the code that will block your progress.
>> Can you provide the first 8 dwords of the image you ae trying to load?
>=20
> http://marcin.juszkiewicz.com.pl/download/at91/ contains at91bootstrap =
files=20
> which I checked on board. I tried with at91sam9263ek files before and t=
oday=20
> with at91sam9263dfc one.
>=20
> During week I plan to change at91bootstrap recipe to build all variants=
 for=20
> board (so for MACHINE=3Dat91sam9263ek it will build at91sam9263ek,=20
> at91sam9263dfc and at91sam9263nf) as ek/dfc/nf are just variants of one=
 board=20
> which differ only at at91bootstrap (kernel and userspace is the same). =
When=20
> this will work all machine configs other then *ek can be dropped.
>=20

OK, you can run the  MAKEALL script to build everything
and pick from the binaries, I guess, it is quick to build.
Maybe MAKEALL should be

U-boot needs to be built differently as well.
You need to be able to save the environment in:

Long term we need environment in:
nandflash
dataflash_cs0
dataflash_cs1
flash
eeprom
SD-card (maybe this can use EEPROM)



>> Maybe you have not initialized all the trap vectors
>> or you are doing something valid, but unexpected.
>>
>> Are you loading something else than U-Boot?
>=20
> U-Boot 2009.08-rc built from your recipe.
>=20
Funny, I dont see that.

>> Have now checked the source:
>>
>> The 2.13 is based on the 1.13 sources.
>>
>> The 1,14 source code is not available on the Atmel.
>=20
> ftp://www.linux4sam.org/pub/at91bootstrap/AT91Bootstrap1.14.zip
I noticed later, and in fact I have those patches already in 1.13-rc#.
Its been a long summer.

>=20
>=20
> Regards,=20


--=20
Best Regards
Ulf Samuelsson



