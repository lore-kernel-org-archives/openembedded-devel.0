Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1H3xIg-0007JU-K3
	for openembedded-devel@openembedded.org; Mon, 08 Jan 2007 17:24:42 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l08GN1Lr018200 for <openembedded-devel@openembedded.org>;
	Mon, 8 Jan 2007 17:23:01 +0100
Message-ID: <45A26FE1.9050705@dominion.kabel.utwente.nl>
Date: Mon, 08 Jan 2007 17:22:57 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.9 (Macintosh/20061207)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <200701081618.46665.openembedded@hrw.one.pl>
	<f96d234e0701080819q7a8017d3q922b055670163c54@mail.gmail.com>
In-Reply-To: <f96d234e0701080819q7a8017d3q922b055670163c54@mail.gmail.com>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: Status of ARM machines in OE
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Jan 2007 16:24:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Cliff Brake schreef:
> On 1/8/07, Marcin Juszkiewicz <openembedded@hrw.one.pl> wrote:
> 
>> compulab-pxa270 - use binary driver for flash so only hardfloat
>> distributions
>> can use this machine:
>>
>> arm-angstrom-linux-gnueabi-ld: ERROR: drivers/block/cl_flash/CL_FlashDrv uses FPA instructions, whereas drivers/block/cl_flash/fdrv.o does not
>> arm-angstrom-linux-gnueabi-ld: failed to merge target specific data of file drivers/block/cl_flash/CL_FlashDrv
>>
>> Full log:
>> http://ewi546.ewi.utwente.nl/tinderbox/showlog.pl?machine_id=177&logfile=20070107145519.log
> 
> Hi Marcin,
> 
> Thanks for doing the builds -- very interesting.
> 
> The issue with this drive is it uses the old abi, so non-eabi builds
> should work.  

only (soft)fpa, not (soft)vfp.

> I recently added a note in the kernel bb.  Softfloat is
> working fine.  Is there any easy way in angstrom to specify oabi?

DISTRO="angstrom-2007.1-oabi"

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFFom/hMkyGM64RGpERArsZAJ9QGPn7EUooCbWNXl0bmFzBFQqjzgCeLIjU
97Zxmzl7+Gn2KYOu6Va+N3I=
=hs8w
-----END PGP SIGNATURE-----


