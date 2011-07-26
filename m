Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1Qlq3f-0000UP-JQ
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Jul 2011 00:25:00 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id BE54C166019C; Tue, 26 Jul 2011 16:20:46 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 841FF166012B;
	Tue, 26 Jul 2011 16:20:45 -0600 (MDT)
Message-ID: <4E2F3DBD.6030303@mlbassoc.com>
Date: Tue, 26 Jul 2011 16:20:45 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc15 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <F7C0AA5DD1508F4789E10B6CC9BB75DB04B1F8B5@nzc-ap-xch-02.ap.trimblecorp.net>	<20110726220305.GA15286@jama.jama.net>
	<F7C0AA5DD1508F4789E10B6CC9BB75DB04B1F8D9@nzc-ap-xch-02.ap.trimblecorp.net>
In-Reply-To: <F7C0AA5DD1508F4789E10B6CC9BB75DB04B1F8D9@nzc-ap-xch-02.ap.trimblecorp.net>
Subject: Re: Kernel load address issue
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
X-List-Received-Date: Tue, 26 Jul 2011 22:25:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2011-07-26 16:14, Bernard Mentink wrote:
> Many thanks for the reply,
>
> By the way where is the machine.conf file, I can't seem to find it
> anywhere ..

It's ${MACHINE}.conf - fill in the name of your machine

> ------------------------------------------------------------------------
> ------------------
> I want to die peacefully in my sleep, like my grandfather, not screaming
> and yelling like the passengers in his car.
>
> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Martin Jansa
> Sent: Wednesday, 27 July 2011 10:03 a.m.
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] Kernel load address issue
>
> On Wed, Jul 27, 2011 at 09:51:28AM +1200, Bernard Mentink wrote:
>>
>> Hi Guys,
>>
>> I am new to OE, but have managed to get u-boot working on my target,
>> got TFTP working so I can transfer a kernel to RAM.
>> I have modified my conf/local.conf file so that when a kernel is built
>
>> a uImage binary is created that u-boot can use. (added line
>> KERNEL_IMAGETYPE = "uImage")
>>
>> However When I try to boot the image in the bootloader, I get this:
>>
>> uboot>  bootm 0x80300000
>> ## Booting kernel from Legacy Image at 80300000 ...
>>     Image Name:   Angstrom/2.6.36/mx31ads
>>     Created:      2011-07-26  19:55:31 UTC
>>     Image Type:   ARM Linux Kernel Image (uncompressed)
>>     Data Size:    1765856 Bytes = 1.7 MiB
>>     Load Address: 20008000
>>     Entry Point:  20008000
>
> machine.conf can define
> UBOOT_ENTRYPOINT = "0x80008000"
> UBOOT_LOADADDRESS = "0x80008000"
>
> both used in kernel.bbclass
> /OE/dev/classes/kernel.bbclass:UBOOT_ENTRYPOINT ?= "20008000"
> /OE/dev/classes/kernel.bbclass:UBOOT_LOADADDRESS ?=
> "${UBOOT_ENTRYPOINT}"
> /OE/dev/classes/kernel.bbclass:            uboot-mkimage -A
> ${UBOOT_ARCH} -O linux -T kernel -C none -a ${UBOOT_LOADADDRESS} -e
> $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin
> arch/${ARCH}/boot/uImage
>
> Cheers,
>
>>     Verifying Checksum ... OK
>>     Loading Kernel Image ...<-- gets stuck here! ...
>>
>> The Load Address is wrong, my ram starts at 0x80000000 ... can someone
>
>> tell me how to change this? I presume mkimage is responsible for this
>> as the kernel is configured as relocatable ..
>>
>> Many Thanks,
>> Bernie
>>
>>
>>
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


