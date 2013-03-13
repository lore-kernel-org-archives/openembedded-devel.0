Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1UFomW-0007GE-TH
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Mar 2013 17:44:07 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r2DGRGhW027573
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Mar 2013 09:27:16 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.234) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Wed, 13 Mar 2013 09:27:16 -0700
Message-ID: <5140A8E1.6070700@windriver.com>
Date: Wed, 13 Mar 2013 11:27:13 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130307 Thunderbird/17.0.4
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <20130312211938.GA11498@windriver.com>
	<4C920E00-4E5F-47FF-9DB5-FCE7AE02E08B@gmail.com>
	<20130313031343.GA18570@windriver.com>
	<CF5E1B15-C4C2-454C-82E1-A5214320C4CA@gmail.com>
	<20130313135033.GA31648@windriver.com>
In-Reply-To: <20130313135033.GA31648@windriver.com>
Subject: Re: question on App bitsize - need the same as the kernel (multilib situation)
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
X-List-Received-Date: Wed, 13 Mar 2013 16:44:18 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 3/13/13 8:50 AM, Amy Fong wrote:
> On Tue, Mar 12, 2013 at 08:25:55PM -0700, Khem Raj wrote:
>>
>> On Mar 12, 2013, at 8:13 PM, Amy Fong <amy.fong@windriver.com> wrote:
>>
>>> It may be a combination of kernel ppc64 + userspace ppc (32);
>>> or kernel x86-64 + userspace x86-32.
>>
>>
>> I think you to ship ppc64 C runtime at least and same is true for x86_64
>> and by bit size you mean machine word length right ? like sizeof(long)
>
> Uhhhh no, what I mean is,
>
> e.g.
>
> For userspace, if 32bit:
> root@localhost:~# file /bin/bash
> /bin/bash: ELF 32-bit LSB executable, Intel 80386, version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux 2.6.34, stripped
>
> For kernel, if 64bit:
> (in kernel config)
> CONFIG_64BIT=y
> # CONFIG_X86_32 is not set
> CONFIG_X86_64=y
> CONFIG_X86=y
>
> Take for example, I want to run crash to do some kernel debugging, in this case,
> I would want crash to be 64bits.

...and with the userspace defaulting to a 32-bit userspace..  Doing something like:

INSTALL_IMAGE_append = "crash" will result in a executable that doesn't work. 
So the user has to know they have to add "lib64-crash".  (Easy when it's 
INSTALL_IMAGE_append.. not so easy when you have a custom rootfs that simply 
add's "crash"...  How does it know it needs to add a multilib variant?)

Which is why the question comes down to, how do I tell the system that a 
specific package needs to be the same bitsize as the kernel, and then how do I 
get the system to select the "right" version of that package?

 From my experience that are not a lot of things in the system that have this 
requirements.. but kexec and related do.

--Mark

>>> On Tue, Mar 12, 2013 at 03:41:29PM -0700, Khem Raj wrote:
>>>>
>>>> On Mar 12, 2013, at 2:19 PM, Amy Fong <amy.fong@windriver.com> wrote:
>>>>
>>>>> I need to build an application that has the same bitsize as the kernel. But in
>>>>> my multilib configuration, the default usersapce bitsize is not the same as
>>>>> the kernel's bitsize. How do you do this?
>>>>
>>>> which arch is this ?
>>>> since generally we have one in multilib combo that matches kernel bit size
>>>> but you might have left it out.
>>>>
>>>>>
>>>>> Thanks!
>>>>> Amy
>>>>>
>>>>> _______________________________________________
>>>>> Openembedded-devel mailing list
>>>>> Openembedded-devel@lists.openembedded.org
>>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>>>
>>>>
>>>> _______________________________________________
>>>> Openembedded-devel mailing list
>>>> Openembedded-devel@lists.openembedded.org
>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>>
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



