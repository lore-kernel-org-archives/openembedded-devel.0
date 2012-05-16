Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1SUdkW-0000ga-3N
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 May 2012 14:54:40 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id EE806F8122D; Wed, 16 May 2012 06:44:39 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 9A27AF811F0;
	Wed, 16 May 2012 06:44:38 -0600 (MDT)
Message-ID: <4FB3A136.8020607@mlbassoc.com>
Date: Wed, 16 May 2012 06:44:38 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1337119302-28549-1-git-send-email-raj.khem@gmail.com>
	<CADZ6=avUxq8fBHF3UMCZ3T6A-W+tm7ZOVR-kCa48L_4_J9+2ZA@mail.gmail.com>
	<4FB388F8.2000802@mlbassoc.com>
	<CADZ6=at=H9cGJcyMvSuwVieMzV0hAPx37TbBcUwGS3yTeTKk6g@mail.gmail.com>
	<4FB391D1.10607@mlbassoc.com>
	<CADZ6=av1G6NsBOZu=sCt47OoK=OPDn2MP7gZTnfD+7NdrwzG2A@mail.gmail.com>
In-Reply-To: <CADZ6=av1G6NsBOZu=sCt47OoK=OPDn2MP7gZTnfD+7NdrwzG2A@mail.gmail.com>
Subject: Re: [toolchain-layer][pull-request] Remove old toolchain recipes
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
X-List-Received-Date: Wed, 16 May 2012 12:54:40 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-05-16 06:41, Thilo Fromm wrote:
> Hello Gary,
>
>>>>>> Khem Raj (3):
>>>>>>       eglibc-2.12: Remove
>>>>>>       binutils-2.20: Remove
>>>>>>       gcc-4.5: Remove
>>>>>
>>>>>
>>>>>
>>>>> Removing gcc-4.5 would kill Texas Instruments DaVinci (dm814x, dm816x)
>>>>> support. You only get a heavily patched 2.6.37 kernel from TI for
>>>>> these (linux-ti81xx-psp_2.6.37). Unfortunately gcc>= 4.6 is unable to
>>>>> build a kernel which boots for these platforms.
>>>>
>>>> I build with GCC 4.6.3 from that tree for the DM8148 all the time and
>>>> it works fine.  Maybe there is some option/selection in your
>>>> configuration
>>>> that's not in mine?  Can you send it&    I'll give it a compare?
>>>
>>> Sure! Our project is on github, and so is our defconfig:
>>>
>>> <https://github.com/DFE/HidaV/blob/master/meta-hidav/recipes-kernel-bootloader/linux/files/defconfig>
>>>
>>> We added aufs (Another Union File system) and the blockrom MTD FTL to
>>> the kernel, so there are additional options in our configuration.
>>>
>>
>> The only real differences (modulo the hardware/peripherals in use)
>> are some of the kernel debugging settings.  Perhaps they are causing
>> some problems with the newer compiler.  The diffs between our configurations
>> are attached.
>
> Thanks, but I don't think I will disable most of the debugging
> features for now. We have e.g. memory leak reports by the kernel
> memchecker in ext4. Given the pitiful state of linux-ti81xx-psp_2.6.37
> in general I'm not willing to give up the little debug info I get.

Fair enough, I was just pointing out a possible source of your pain :-)

BTW, do you know if TI ever plans on updating the kernel?  2.6.37 is so
painfully old...

>
>> As Martin points out, the newer compilers can have problems with unaligned
>> access.  I've also [sometimes] had better success if I disable
>> OPTIMIZE_FOR_SIZE
>>
>> The only other thing I see is the kernel version&  recipe used.  I am using
>> the stock one from meta-ti + some platform patches.  Perhaps there's
>> something
>> else to look at.
>>   meta-ti/recipes-kernel/linux/linux-ti81xx-psp_2.6.37.bb
>
> We're almost using this recipe too. We just appended AUFS integration
> and custom package management installer scripts for the kernel. I'll
> look into -mno-unaligned-access w/ gcc-4.7 as Gary suggested as soon
> as I am finished moving gcc-4.5 into HidaV so we can actually build
> firmware again :)

Good luck

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


