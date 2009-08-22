Received: from [81.228.11.98] (helo=pne-smtpout1-sn1.fre.skanova.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1MelVO-00056X-E2
	for openembedded-devel@lists.openembedded.org;
	Sat, 22 Aug 2009 09:59:18 +0200
Received: from [10.175.196.247] (213.66.88.44) by
	pne-smtpout1-sn1.fre.skanova.net (7.3.140.3) (authenticated as
	u82406562)
	id 4A683C78002AFA4C for openembedded-devel@lists.openembedded.org;
	Sat, 22 Aug 2009 09:41:48 +0200
Message-ID: <4A8FA13A.8050006@atmel.com>
Date: Sat, 22 Aug 2009 09:41:46 +0200
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Organization: Atmel Nordic AB
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4A81BE84.6010607@atmel.com>	<200908121433.31479.marcin@juszkiewicz.com.pl>	<4A82C482.6060008@atmel.com>
	<200908211353.59344.marcin@juszkiewicz.com.pl>
In-Reply-To: <200908211353.59344.marcin@juszkiewicz.com.pl>
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
X-List-Received-Date: Sat, 22 Aug 2009 07:59:18 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: Quoted-Printable

Marcin Juszkiewicz skrev:
> Dnia =C5=9Broda, 12 sierpnia 2009 o 15:32:50 Ulf Samuelsson napisa=C5=82=
(a):
>>> I had to add patch to 2.12 to get rid of -fno-dwarf2-cfi-asm parametr
>>> passed to GCC. Did not tested with 2.13-rc1 as at91.com is not
>>> reachable.
>> Yes, fixed in 2.13-rc1
>> Will send you the source file.
>=20
> 2.13-rc1 gaves me non-booting board:
>=20
> RomBOOT                                                                =
                                                                         =
                   =20
>> *** AT91Bootstrap-2.13-rc1                                            =
                                                                         =
                  =20
>> AT45DB642D detected                                                   =
                                                                         =
                  =20
>> invalidboot                                                           =
                                                                         =
                  =20
>> AT45DB642D detected                                                   =
                                                                         =
                  =20
>> invalidboot                                                           =
                                                                         =
                  =20
>> AT45DB642D detected                                                   =
                                                                         =
                  =20
>> invalidboot                                                           =
                                                                         =
                  =20
>=20
> Any ideas? I have same problem when 2.12 is used. 1.14 works still.
>=20
> Regards,=20

What is the file name of your at9bootstrap?

Where are you loading your u-boot?

Which board are you building?


I test with "at91sam9263dfc" and it works.
NAND boot does not work, but no time to really investigate,

Busy with SAM9G45.
Want to use dataflash there as well, because SAMBA wants
to erase the complete NAND flash, and SAMBA does not
work on my linux machine, so I want to program using U-Boot.

I have updated to -rc3, and will update to -rc4 today.
Key feature in rc4 is to enable the user reset input.
This means that you do not have to unplug the power to reboot.


--=20
Best Regards
Ulf Samuelsson



