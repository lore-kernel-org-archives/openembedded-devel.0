Received: from [81.228.11.98] (helo=pne-smtpout1-sn1.fre.skanova.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1MbcPR-0001wj-6G
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Aug 2009 17:40:10 +0200
Received: from [10.175.196.247] (213.66.88.44) by
	pne-smtpout1-sn1.fre.skanova.net (7.3.140.3) (authenticated as
	u82406562)
	id 4A683C78001C4EFF for openembedded-devel@lists.openembedded.org;
	Thu, 13 Aug 2009 17:23:36 +0200
Message-ID: <4A842FF6.70906@atmel.com>
Date: Thu, 13 Aug 2009 17:23:34 +0200
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Organization: Atmel Nordic AB
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4A83BD15.7070006@atmel.com>	<h60je5$992$1@ger.gmane.org>	<4A83E5FC.2020002@atmel.com>	<h60t34$5kl$1@ger.gmane.org>	<4A8402B0.1000308@atmel.com>
	<h611re$jjp$1@ger.gmane.org>
In-Reply-To: <h611re$jjp$1@ger.gmane.org>
Subject: Re: Ideas for scripts, to save work, when building several boards
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
X-List-Received-Date: Thu, 13 Aug 2009 15:40:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Koen Kooi skrev:
> On 13-08-09 14:10, Ulf Samuelsson wrote:
>> Koen Kooi skrev:
>>> On 13-08-09 12:07, Ulf Samuelsson wrote:
>>>> Koen Kooi skrev:
>>>>> On 13-08-09 09:13, Ulf Samuelsson wrote:
>>>>>> Since I will need to test multiple boards,
>>>>>> I decided to write some scripts which I will
>>>>>> check in later today in origin/ulf/linux-2.6.30.2
>>>>>>
>>>>>> I generated a "MAKEALL" script which will
>>>>>> source a file "board_list.sh" with board build commands
>>>>>>
>>>>>> <SOF>
>>>>>> build_board    sam9263dfc    x11-gpe-image
>>>>>> build_board    sam9g45ek    opie-image
>>>>>> build_board    sam9g10df    x11-gpe-image
>>>>>> build_board    sam9g20dfc    console-image
>>>>>> build_board    sam9260dfc    console-image
>>>>>> build_board    sam9261df    x11-image
>>>>>> build_board    sam9xedfc    console-image
>>>>>> <EOF>
>>>>>
>>>>> You do know that you can do that with MACHINE=foo bitbake bar, right?
>>>>>
>>>>
>>>> Didn't try that.
>>>> I assume this means that the cross compiler is not rebuilt,
>>>
>>> Unless you poked at the gcc recipes, no, it won't get rebuilt.
>>>
>>>> Is the root fs assembled from ipks then?
>>>
>>> if you use rootfs_ipk.bbclass, yes.
>>>
>>> Note that the official angstrom buildguide has mentioned that for years:
>>> http://www.angstrom-distribution.org/building-angstrom
>>>
>>
>> Thanks for helping out, but it does not work as expected.
>>
>> I first create a local.conf for the at91sam9261df
>> and bitbake x11-image.
>> Then I do "MACHINE=at91sam9g20dfc bitbake console-image".
>> A console-image is built,but for the at91sam9261df,
>> which is stored in "tmp/deploy/glibc/images/at91sam9261df"
>>
>> The bitbake does not generate u-boot/kernel or at91bootstrap
>> for the at91sam9260dfc
> 
> Then either our uboot/kernel/bootstrap recipes are wrong, or your
> machine configs lack proper IMAGE_DEPENDS, either way that isn't the
> fault of doing MACHINE=foo

I guess something is wrong...
Since I have created my own recipes for u-boot/bootstrap and kernel
I have a primary object for the blame ;-) if that is the case.

At least one more has reported u-boot, not beeing installed
and they are not using my recipes.

The machine description contains:
EXTRA_IMAGEDEPENDS += "u-boot"
EXTRA_IMAGEDEPENDS += "at91bootstrap"
This seems to be the way u-boot is used in other boards, correct?

It certainly makes the packages run until do_compile, but not any
further. What do I need to specify to make a package go through
to the do_deploy phase?

at91bootstrap installs its files as part of do_compile
which might be the wrong thing to do.
- It installs though and U-boot doesn't until you bitbake u-boot.

I might make a workaround to install u-boot in do_compile as well.
Part of my u-boot patches contains an new "make DESTDIR=... install
but if there is a preferred way of doing this, I would be keen to know.
U-boot and bootstrap are a bit special, in that they are not part
of the image, you just want to build them and install them anyway.

===============================================


I noted that some boards + 2 packages sets EXTRA_IMAGEDEPENDS.
conf/bitbake.conf:EXTRA_IMAGEDEPENDS = ""
recipes/kexecboot/initramfs-kexecboot-image.bb:EXTRA_IMAGEDEPENDS = ""

They are not using EXTRA_IMAGEDEPENDS += "..."

I assume the first is an initialization, but the second?
Not digged down deep enough to understand if this recipe is used,
but if it is:
Doesn't that mean that any previous declarations/dependencies are gone?


===============================================
I maintain that if I do "MACHINE=at91sam9260dfc bitbake at91bootstrap"
from the build directory, it is ignored and the MACHINE definition
(MACHINE=at91sam9261df) in local.conf is used.

Result:
NOTE: Tasks Summary: Attempted 448 tasks of which 448 didn't need to be
rerun and 0 failed.

If I stay in the same directory and change local.conf
to have MACHINE="at91sam9260dfc" and then do
"bitbake at91bootstrap" then bootstrap builds for the new machine.

I am running OpenSuSE-x64 and this has done things differently
than Ubuntu multiple times...

If you say it should work, and I can't get it to work,
then I will just have to change the local.conf file
(by symlinking) every time I want to build for a new board
===============================================

> 
>> I believe that most at91 chips can use the same file system,
>> so it makes sense to do it this way anyway.
> 
> The images are built for the machine you specified with MACHINE, I
> suspect you are getting confused somewhere.
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


-- 
Best Regards
Ulf Samuelsson



