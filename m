Received: from hermes.mlbassoc.com ([76.76.67.137] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gary@mlbassoc.com>) id 1Na84E-0002Ng-Fv
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Jan 2010 14:36:25 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id 55D0716606F1; Wed, 27 Jan 2010 06:33:59 -0700 (MST)
Received: from hermes.chez-thomas.org (hermes_local [192.168.1.101])
	by mail.chez-thomas.org (Postfix) with ESMTP id 2F24716606E6;
	Wed, 27 Jan 2010 06:33:59 -0700 (MST)
Message-ID: <4B6040C6.2020501@mlbassoc.com>
Date: Wed, 27 Jan 2010 06:33:58 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.3a1pre) Gecko/20100122 Shredder/3.2a1pre
MIME-Version: 1.0
To: Alex <baggerml@gmail.com>
References: <4B60398C.4080605@gmail.com> <4B603A61.9020001@mlbassoc.com>
	<4B603B5F.8080009@gmail.com>
In-Reply-To: <4B603B5F.8080009@gmail.com>
X-SA-Exim-Connect-IP: 76.76.67.137
X-SA-Exim-Mail-From: gary@mlbassoc.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: kernel booting and params
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
X-List-Received-Date: Wed, 27 Jan 2010 13:36:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/27/2010 06:10 AM, Alex wrote:
> Gary Thomas wrote:
>> On 01/27/2010 06:03 AM, Alex wrote:
>>> Hello everyone!
>>>
>>> Trying to find information about kernel booting gave me nothing so I decided to write here.
>>>
>>> The question is: how does linux kernel know where to get its parameters' string? To be more precise, what actions in general should a linux bootloader do to tell the kernel its
>>> params and boot it?
>>>
>>> ...
>>
>> This process is different for every architecture (x86, arm, powerpc, ...)
>>
>> What platform(s) are you trying to understand?
>
> It is an arm cpu. The platform is dm6446.

n.b. replies should be on the mailing list so that all benefit.

The information for ARM is passed in memory at a fixed block with
pointers and tags describing the various data.  The Linux source
file '.../arch/arm/include/asm/setup.h' describes how this works.

Look at U-Boot to see how it handles this linkage.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


