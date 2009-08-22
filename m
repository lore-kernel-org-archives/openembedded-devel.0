Received: from [81.228.11.98] (helo=pne-smtpout1-sn1.fre.skanova.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1Meuw2-0006FZ-8V
	for openembedded-devel@lists.openembedded.org;
	Sat, 22 Aug 2009 20:03:26 +0200
Received: from [10.175.196.247] (213.66.88.44) by
	pne-smtpout1-sn1.fre.skanova.net (7.3.140.3) (authenticated as
	u82406562)
	id 4A683C78002B7F7F for openembedded-devel@lists.openembedded.org;
	Sat, 22 Aug 2009 19:45:53 +0200
Message-ID: <4A902ECF.3090909@atmel.com>
Date: Sat, 22 Aug 2009 19:45:51 +0200
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
X-List-Received-Date: Sat, 22 Aug 2009 18:03:26 -0000
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
This is the code that will block your progress.
Can you provide the first 8 dwords of the image you ae trying to load?
Maybe you have not initialized all the trap vectors
or you are doing something valid, but unexpected.

Are you loading something else than U-Boot?

As you see, you can disable the check in your configuration file.

#if	defined(CONFIG_APP_CHECK)
/*-----------------------------------------------------------------------=
-------*/
/* \fn    df_is_boot_valid							*/
/* \brief Check that the first bytes of the buffer are valid ARM vectors	=
*/
/*-----------------------------------------------------------------------=
-------*/
static unsigned int df_is_boot_valid(unsigned char *buffer)
{
	int i =3D 3;
 	/* Verify if the 28 first bytes of the sram correspond to ARM vectors
	   The sixth ARM vector contain the size of the code */
    	while(i < 28)
    	{
		if (i !=3D 23)
		{
			if ((buffer[i] !=3D 0xEA) && (buffer[i] !=3D 0xE5) )
				return FAILURE;
		}
		i+=3D4;
    	}
	return SUCCESS;
}
#endif

> Regards,=20

Have now checked the source:

The 2.13 is based on the 1.13 sources.
=09
The 1,14 source code is not available on the Atmel.
I will point that out.

	Differences between the 1 series and the 2 series are:
	1) Kconfig - You can do make <board>_config from OpenEmbedded
		If you want to modify something it is much harder
	2) Init of EBI1 of SAM9263
	3) Bus Matrix Initialization
	4) User reset enabled -but it does not work on the G45!
	5) Not depending on a c library.
		Can be compiled with any gcc compiler,
		not just somehing with newlib.
	etc.

	The 1 series is provided by Atmel in Rousset,
	and I have done the 2 series.
=09


--=20
Best Regards
Ulf Samuelsson



