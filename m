Received: from smtprelay-h22.telenor.se ([195.54.99.197])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1P7qWc-0005Er-JZ
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Oct 2010 16:17:19 +0200
Received: from ipb1.telenor.se (ipb1.telenor.se [195.54.127.164])
	by smtprelay-h22.telenor.se (Postfix) with ESMTP id 7B9F3C096
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Oct 2010 15:46:15 +0200 (CEST)
X-SENDER-IP: [83.227.56.243]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AmYVADrsu0xT4zjzPGdsb2JhbAAHgxeEUos/jggBAQEBNatXkgiBIoMzdASKSg
X-IronPort-AV: E=Sophos;i="4.57,345,1283724000"; d="scan'208";a="142336560"
Received: from c-f338e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.250]) ([83.227.56.243])
	by ipb1.telenor.se with ESMTP; 18 Oct 2010 15:46:13 +0200
Message-ID: <4CBC4FA6.4000000@atmel.com>
Date: Mon, 18 Oct 2010 15:46:14 +0200
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
User-Agent: Thunderbird 2.0.0.24 (Windows/20100228)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1287233406-8778-1-git-send-email-ulf.samuelsson@atmel.com>	<1287233406-8778-4-git-send-email-ulf.samuelsson@atmel.com>	<1287233406-8778-5-git-send-email-ulf.samuelsson@atmel.com>
	<201010181518.49023.marcin@juszkiewicz.com.pl>
In-Reply-To: <201010181518.49023.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.54.99.197
X-SA-Exim-Mail-From: ulf.samuelsson@atmel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 5/5] Add X11 images with more multimedia support (mplayer etc.)
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
X-List-Received-Date: Mon, 18 Oct 2010 14:17:20 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Marcin Juszkiewicz skrev:
> Dnia sobota, 16 pa=C5=BAdziernika 2010 o 14:50:06 ulf.samuelsson@atmel.=
com=20
> napisa=C5=82(a):
>=20
>> +++ b/recipes/images/console-audio-image.bb
>> @@ -0,0 +1,33 @@
>> +# Angstrom bootstrap at91sam9 image
>> +require console-base-image.bb
>> +
>> +export IMAGE_BASENAME =3D "console-at91sam9-image"
>=20
> Please decide - is it audio-image or at91sam9-image... Looks more like =
second=20
> one because I do not see iperf being related to audio.

OK, I'll have a look at this.

>=20
>> +#we dont need the kernel in the image
>> +ROOTFS_POSTPROCESS_COMMAND +=3D "rm -f ${IMAGE_ROOTFS}/boot/*Image*; =
"
>=20
> Who is we? I have some boards which needs it...
>=20

Me an my lice ?
Actually, it is for people that need to create demo on a Windows machine.

The idea is to have an SD-Card with a FAT partition using maybe 128 MB
of the SD-Card, and the rest is empty unpartitioned.

The kernel loads a simple RAMFS and runs a script which will partition
the empty space on the SD-Card, and then extract the file system tarball
from the FAT partition to the new partition.

Since the kernel is needed on the FAT partition, it is not needed
on the Linux file system partition.

Each and every image is made to suit its author.
If there is variation, then this can be easily handled
by editing the file, or by creating a new image.

> Regards,=20

Best Regards
Ulf Samuelsson


