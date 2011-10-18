Received: from smtprelay-b21.telenor.se ([195.54.99.212])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf_samuelsson@telia.com>) id 1RG389-0004Zl-Fl
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Oct 2011 08:26:30 +0200
Received: from iph3.telenor.se (iph3.telenor.se [195.54.127.134])
	by smtprelay-b21.telenor.se (Postfix) with ESMTP id EBC6AE9E92
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2011 08:03:25 +0200 (CEST)
X-SENDER-IP: [83.227.57.13]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: ApgfAHMWnU5T4zkNPGdsb2JhbAAMN6hzAQEBATeCIAEBAQECAQEBATU2ChELGAkWBAsJAwIBAgEVARsUEwYCAQGHewi2X4gIBJFjghqRVw
X-IronPort-AV: E=Sophos;i="4.69,363,1315173600"; d="scan'208";a="132467648"
Received: from c-0d39e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.249]) ([83.227.57.13])
	by iph3.telenor.se with ESMTP; 18 Oct 2011 08:03:25 +0200
Message-ID: <4E9D16AD.7040403@telia.com>
Date: Tue, 18 Oct 2011 08:03:25 +0200
From: Ulf Samuelsson <ulf_samuelsson@telia.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4E9C93AB.7090705@telia.com> <4E9CA882.7080107@gmail.com>
In-Reply-To: <4E9CA882.7080107@gmail.com>
Subject: Re: Performance measurement: Building openembedded-core with and without overclocking on C-i7 2600K
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
X-List-Received-Date: Tue, 18 Oct 2011 06:26:30 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

2011-10-18 00:13, Khem Raj skrev:
> On 10/17/2011 1:44 PM, Ulf Samuelsson wrote:
>> If anyone is interested...
>>
>
> thanks for numbers. Is there statistics on 64bit host Vs. 32bit build 
> host available too ?

We discussed that a few days ago.

My comparision between 2 similar machines indicate that
32 bit 11.04 with Psyco-Dist is 20% faster than 64 bit with 11.04

The machine running 64 bit 11.04 was tested with 32 bit 11.04
using an external disk (connected through e-SATA) and results
were very close to the numbers for the other 32 bit machine

I didn't save those numbers but I think that is good enough
to draw the conclusion that adding JIT for 64 bit (PyPy?) will reduce build
time significantly.

It would be interesting to know the effect of faster disks.
I run SATA-II disks at the moment, and upgrading to SATA-III
might improve things.

Since you have multiple tasks, it might be worthwhile having several 
disks to
the disk heads spending most of their time moving around.
Have a lot of computer parts including a chassi mounting 6+ disks.
* /
* /home
* <OE_DIR>/source
* <OE_DIR>/build/tmp


Also what happens if it it built on a fast SSD, or even a RAMdisk?

Building the stuff below adds 25 GB + a 2 GB source directory.
With the Z68 chipset, you can get up to 32 GB.
It would be interesting to know how well the linux caching system
performs vs having <OE_DIR>/build/tmp etc. on a ramdisk.

The 8 GB DIMMs are not really available without ECC, but
Corsair is about to release a 32 GB kit which will set you
back $1000 so I wont do that test for the forseeable future.
Maybe someone else which will have such a machine anyway
would be interested enough to do a test.

One issue with this is that even 32 GB may not be enough.
With the current build using 27 GB, there is not much headroom to grow.

If using a ramdisk, proves to be significantly faster,
an alternative would be smaller ramdisk with some background task moving
packages to a real disk after the build of that package
has completed.



>> Same machine in two different configurations.
>>
>> .........................................................#1...........................#2 
>>
>>
>> P8Z68V Pro
>> Core-i7 2600K @ 3.4 GHz..................4.4 GHz
>> 8 GB @ ...........................................1333
>> MHz...............1640 MHz
>> 1TB WD Black 7200 RPM
>> Ubuntu 11-10
>>
>> Almost all source code already in source directory
>>
>> Building meta-toolchain is 13% faster with overclocking.
>>
>>
>> #1
>> build: meta-toolchain
>> START 10:46:23 55:52
>> FINISH 11:42:15
>> build: core-image-minimal
>> START 11:42:15 17:34
>> FINISH 11:59:49
>> build: core-image-sato
>> START 13:40:47 01:19
>> FINISH 13:42:06
>> Build fails, since one package could not be downloaded.
>> build: meta-toolchain-sdk
>> START 13:42:06 00:38
>> FINISH 13:42:44
>> build: adt-installer
>> START 13:42:44 00:03
>> FINISH 13:42:51
>> build: meta-ide-support
>> START 13:42:51 01:13
>> FINISH 13:44:04
>>
>>
>>
>> #2
>> build: meta-toolchain
>> START 20:18:51 49:19 (vs 55:52)
>> FINISH 21:08:10
>> build: core-image-minimal
>> START 21:08:10 16:38 (vs 17:34)
>> FINISH 21:24:48
>> build: core-image-sato
>> START 21:24:48 15:38 (vs 01:19 - I think I have a problem in the first
>> build)
>> FINISH 21:40:26
>> build: meta-toolchain-sdk
>> START 21:40:26 00:59 (vs 00:38)
>> FINISH 21:41:25
>> build: adt-installer
>> START 21:41:25 00:03 (vs 00:03)
>> FINISH 21:41:28
>> build: meta-ide-support
>> START 21:41:28 01:03 (vs 01:13)
>> FINISH 21:42:31
>>
>>
>>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


-- 
Best Regards
Ulf Samuelsson



