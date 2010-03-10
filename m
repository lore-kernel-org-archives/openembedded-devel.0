Received: from exprod5og101.obsmtp.com ([64.18.0.141])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martyn.welch@ge.com>) id 1NpOF8-0007Wb-0F
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Mar 2010 16:54:46 +0100
Received: from source ([12.71.149.1]) (using TLSv1) by
	exprod5ob101.postini.com ([64.18.4.12]) with SMTP
	ID DSNKS5fAEKBQ5omdctq1yuMIFy4r5rExSSoS@postini.com;
	Wed, 10 Mar 2010 07:51:46 PST
Received: from unknown (HELO cinmlip01.e2k.ad.ge.com) ([3.159.213.48])
	by Cinmlip08.e2k.ad.ge.com with ESMTP; 10 Mar 2010 10:51:44 -0500
Received: from es-j7s4d2j.amer.consind.ge.com (HELO [3.138.54.92])
	([3.138.54.92])
	by cinmlip01.e2k.ad.ge.com with ESMTP; 10 Mar 2010 10:51:23 -0500
Message-ID: <4B97C0BB.2060104@ge.com>
Date: Wed, 10 Mar 2010 15:54:35 +0000
From: Martyn Welch <martyn.welch@ge.com>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20100310135425.31263.61632.stgit@ES-J7S4D2J.amer.consind.ge.com>
	<1268234994.16526.170.camel@trini-m4400>
In-Reply-To: <1268234994.16526.170.camel@trini-m4400>
X-SA-Exim-Connect-IP: 64.18.0.141
X-SA-Exim-Mail-From: martyn.welch@ge.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Add Freescale P2020DS Demo Board
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
X-List-Received-Date: Wed, 10 Mar 2010 15:54:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Tom Rini wrote:
> On Wed, 2010-03-10 at 13:54 +0000, Martyn Welch wrote:
>   
>> This patch adds the Freescale P2020DS demo board, which is based on the
>> p2020 SOC.
>>
>> Signed-off-by: Martyn Welch <martyn.welch@gefanuc.com>
>> ---
>>
>>  conf/machine/p2020ds.conf     |   23 +++++++++++++++++++++++
>>  recipes/linux/linux.inc       |    1 +
>>  recipes/linux/linux_2.6.33.bb |    5 +++++
>>  recipes/u-boot/u-boot_git.bb  |    1 +
>>  4 files changed, 30 insertions(+), 0 deletions(-)
>>
>> diff --git a/conf/machine/p2020ds.conf b/conf/machine/p2020ds.conf
>> new file mode 100644
>> index 0000000..48ab353
>> --- /dev/null
>> +++ b/conf/machine/p2020ds.conf
>> @@ -0,0 +1,23 @@
>> +#@TYPE: Machine
>> +#@Name: P2020ds
>> +#@DESCRIPTION: Machine configuration for the freescale p2020ds development board
>> +
>> +TARGET_ARCH = "powerpc"
>> +
>> +PREFERRED_PROVIDER_virtual/kernel ?= "linux"
>> +
>> +MACHINE_FEATURES = "kernel26 usbhost pci pcmcia ext2 vfat nfs uboot"
>>     
>
> Do you really want pcmcia in there?
>
>   

We have some expansion cards for our boards which provide it, but I
guess it is actually very unlikely we will plug these into this machine.

>> +
>> +KERNEL_IMAGETYPE = "uImage"
>> +UBOOT_ENTRYPOINT = "0"
>> +
>> +UBOOT_MACHINE = "P2020DS_config"
>> +
>> +# Need to create jffs2 images with the correct endianess
>> +EXTRA_IMAGECMD_jffs2 = " --big-endian -e 0x40000"
>>     
>
> A guess, --no-cleanmarkers as well?
>   
Huh, didn't know about them, so I guess so.

Martyn

-- 
Martyn Welch (Principal Software Engineer)   |   Registered in England and
GE Intelligent Platforms                     |   Wales (3828642) at 100
T +44(0)127322748                            |   Barbirolli Square, Manchester,
E martyn.welch@ge.com                        |   M2 3AB  VAT:GB 927559189



