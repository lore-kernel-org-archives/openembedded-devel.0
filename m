Received: from hermes.mlbassoc.com ([76.76.67.137] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gary@mlbassoc.com>) id 1Nwg4D-0000CJ-Oc
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Mar 2010 20:21:35 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id AAFB51660364; Tue, 30 Mar 2010 12:18:19 -0600 (MDT)
Received: from hermes.chez-thomas.org (hermes_local [192.168.1.101])
	by mail.chez-thomas.org (Postfix) with ESMTP id E65A1166032E;
	Tue, 30 Mar 2010 12:18:18 -0600 (MDT)
Message-ID: <4BB2406A.10602@mlbassoc.com>
Date: Tue, 30 Mar 2010 12:18:18 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.8) Gecko/20100301 Fedora/3.0.3-1.fc11 Thunderbird/3.0.3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <a25fc1971003291229o686565d7if29755e2b4bbe482@mail.gmail.com>	<19c1b8a91003301103xfcfefddubdc73a584d8c41cc@mail.gmail.com>
	<a25fc1971003301114k3b1e53bch8d22ea79c26a41a0@mail.gmail.com>
In-Reply-To: <a25fc1971003301114k3b1e53bch8d22ea79c26a41a0@mail.gmail.com>
X-SA-Exim-Connect-IP: 76.76.67.137
X-SA-Exim-Mail-From: gary@mlbassoc.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Porting OE to new hardware
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
X-List-Received-Date: Tue, 30 Mar 2010 18:21:35 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/30/2010 12:14 PM, Bernard Mentink wrote:
> Thanks Khem,
>
> That helps a lot. On the kernel config issue there is one thing I don't
> understand.
>
> I have set up to do an ARM  i.mx31 build, but when I did a "make menuconfig"
> in the /build/tmp/.../kernelxxxxx directory, it only shows x86 options, I
> don't know where all the i.mx31 kernel options are.

You didn't tell it - the default architecture is the one you build on (probably
x86).  Try this instead:
   % make ARCH=arm menuconfig

> On Wed, Mar 31, 2010 at 7:03 AM, Khem Raj<raj.khem@gmail.com>  wrote:
>
>> On Mon, Mar 29, 2010 at 12:29 PM, Bernard Mentink<bmentink@gmail.com>
>> wrote:
>>> Hi All,
>>>
>>> I am jumping across to this email list as the user one has very little
>>> traffic.
>>>
>>> I have just found OE and would like to use it to get Linux up and running
>> on
>>> some custom hardware. The hardware is currently running the logicloader
>>> bootloader from LogicPD and a YAFFS2 filesystem.
>>>
>>> I have found very little info on the steps necessary to port to new
>>> hardware. As far as OE is concerned, I have built an image after altering
>>> the MACHINE and DISTRO to something close to what I need.
>>> I now have a zimage (kernel) and a rootFS.
>>>
>>> However I have a number of questions:
>>>
>>> 1. To boot with zimage with  logicloader, I have to load the image into
>>> memory at an address, and then execute it at the start code which I
>> presume
>>> is an offset the start of the image. Can anyone tell me how I can find
>>> the relevant map file to work out
>>> what offset I need to apply? I did a search for *.map files in the
>> build/tmp
>>> direcory and found nada ..
>>
>> this post tells how to load linux kernel using logicloader. It might help
>> you.
>>
>> http://forums.freescale.com/t5/Other-Microcontrollers/load-zImage-or-vmlinux-using-LogicLoader/td-p/32749;jsessionid=F6F40E5BF81249CFF86028A7AB86DE29
>>
>>>
>>> 2. How do I do a kernel config? Is there an option to pass to bitbake to
>> do
>>> that, or do I have to find the kernel source and do it manually, then
>>> rebuild with bitbake?
>>
>> You can copy the .config you want into
>> recipes/linux/<chosen-kernel-version>/<machine>/defconfig file and it
>> will use
>> it to build the kernel for you machine. You can also edit the .config
>> on fly search the ml on how to do it.
>>
>>>
>>> 3. What src files in the kernel do I need to to maybe alter to get the
>>> serial port and memory map right for my target hardware ..
>>>
>>
>> you can specify serial port in kernel commandline too unless your board
>> needs
>> a special handling of serial port.
>>
>>> 4. Once I get the kernel booting, I need it to load the rootfs, initially
>> I
>>> can boot that from NFS, but I would like to eventually load it from my
>> YAFFS
>>> NAND partition, how do I do that?
>>
>> you can do that thru kernel commandline.
>>
>>>
>>>
>>> Hope someone can give me some pointers in the right direction ... I would
>>> love to kick off WinCE from this hardware ;-)
>>>
>>> Cheers,
>>> Bernie
>>>
>>> --
>>> You always have believers and scepticts.. A True inventor is always a
>>> believer..
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
>
>

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


