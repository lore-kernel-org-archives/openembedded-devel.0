Received: from [68.230.241.41] (helo=fed1rmmtao105.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LZs2Y-0008Et-BW
	for openembedded-devel@openembedded.org; Wed, 18 Feb 2009 20:25:03 +0100
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao105.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090218192248.SYCI15318.fed1rmmtao105.cox.net@fed1rmimpo03.cox.net>
	for <openembedded-devel@openembedded.org>;
	Wed, 18 Feb 2009 14:22:48 -0500
Received: from localhost ([68.230.61.57]) by fed1rmimpo03.cox.net with bizsmtp
	id HXNm1b0051E665w04XNmQ2; Wed, 18 Feb 2009 14:22:48 -0500
X-Authority-Analysis: v=1.0 c=1 a=VmMwIalPbQoA:10 a=7GgQa5d7hcEA:10
	a=FIGeSGyTgWjwMhEOy9oA:9 a=a8yUEux71zKwk9WT8CAA:7
	a=iahph9RQCrkzIGKrIv9EHmz1RAsA:4 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Wed, 18 Feb 2009 12:22:46 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090218192246.GM11815@smtp.west.cox.net>
References: <gneadq$s6g$1@ger.gmane.org>
	<20090217163526.GF11815@smtp.west.cox.net>
	<gnhksv$49n$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <gnhksv$49n$1@ger.gmane.org>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [RFC] removing DISTRO_* vars from task-boot
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
X-List-Received-Date: Wed, 18 Feb 2009 19:25:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 18, 2009 at 07:43:42PM +0100, Koen Kooi wrote:
> On 17-02-09 17:35, Tom Rini wrote:
>> On Tue, Feb 17, 2009 at 01:26:34PM +0100, Koen Kooi wrote:
>>
>>> Hi,
>>>
>>> Lately I have been wondering how to change the /dev manager on a per
>>> image base, since I want udev for most images and busybox-mdev for
>>> special-purpose stuff. The catch is that I want to keep using task-boot
>>> for both.
>>>
>>> Currently we have:
>>>
>>> DISTRO_DEV_MANAGER ?= "${@base_contains("MACHINE_FEATURES", "kernel26",
>>> "udev","",d)}"
>>> DISTRO_INIT_MANAGER ?= "sysvinit sysvinit-pidof"
>>> DISTRO_INITSCRIPTS ?= "initscripts"
>>> DISTRO_LOGIN_MANAGER ?= "tinylogin"
>>>
>>> in task-boot.bb
>>>
>>> There are various ways we could attack this:
>>>
>>> 1) The image.bbclass way:
>>>
>>>    Put the following in image.bbclass:
>>>
>>>    IMAGE_DEV_MANAGER ?= "${@base_contains("MACHINE_FEATURES", "kernel26",
>>> "udev","",d)}"
>>>    IMAGE_INIT_MANAGER ?= "sysvinit sysvinit-pidof"
>>>    IMAGE_INITSCRIPTS ?= "initscripts"
>>>    IMAGE_LOGIN_MANAGER ?= "tinylogin"
>>>
>>>    Pros:
>>>    * Takes immediate effect
>>>    * Can have distro defaults, overridable per image
>>>
>>>    Cons:
>>>    * marks them as 'user installed'
>>>    * you can't 'debootstrap' from tasks anymore, you need to encode
>>> knowledge about the above vars into the debootstrap script
>>
>> I really like this one as for our uses there's times where I'd rather
>> let busybox handle INIT_MANAGER and LOGIN_MANAGER too.
>
> Philip C. agrees with you. Should be move everything over or start with  
> IMAGE_DEV_MANAGER?

I say do it all now.  Flexibility is good, lets get it done.

-- 
Tom Rini


