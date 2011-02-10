Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1PnXaX-0004zh-5t
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Feb 2011 15:33:41 +0100
Received: from ALA-MAIL03.corp.ad.wrs.com (ala-mail03 [147.11.57.144])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p1AEWVKn024829;
	Thu, 10 Feb 2011 06:32:32 -0800 (PST)
Received: from ala-mail06.corp.ad.wrs.com ([147.11.57.147]) by
	ALA-MAIL03.corp.ad.wrs.com with Microsoft SMTPSVC(6.0.3790.1830); 
	Thu, 10 Feb 2011 06:32:31 -0800
Received: from Macintosh-5.local ([172.25.36.226]) by
	ala-mail06.corp.ad.wrs.com with Microsoft SMTPSVC(6.0.3790.1830); 
	Thu, 10 Feb 2011 06:32:31 -0800
Message-ID: <4D53F6FE.80604@windriver.com>
Date: Thu, 10 Feb 2011 08:32:30 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.13) Gecko/20101207 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D53C412.9090804@dresearch.de>
	<1297339435.2178.23.camel@phil-desktop>
In-Reply-To: <1297339435.2178.23.camel@phil-desktop>
X-OriginalArrivalTime: 10 Feb 2011 14:32:31.0393 (UTC)
	FILETIME=[59976110:01CBC92F]
Subject: Re: base-files vs. FHS-2.3
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
X-List-Received-Date: Thu, 10 Feb 2011 14:33:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 2/10/11 6:03 AM, Phil Blundell wrote:
> On Thu, 2011-02-10 at 11:55 +0100, Steffen Sledz wrote:
>> While dealing with the /var subdirs i hit some differences between Filesystem Hierarchy Standard (current FHS-2.3) and the base-files package.
>>
>> One point is that /var/tmp is symlinked to volatile/tmp but according to the standard this dir contains "Temporary files *preserved between system reboots* ".
>>
>> Also /var/cache is symlinked to volatile/cache but the standard describes "The data must remain valid between invocations of the application *and rebooting the system.* " what i would read in the way that /var/cache should be persistent too.
>>
>> May be there are other differences.
>>
>> In my opinion the symlinking in base-files is buggy and should be fixed. Or am i wrong here?
> 
> It probably would be good to have a version of base-files which was
> fully FHS conformant.  But there are a significant number of OE target
> systems where it is simply impossible to comply with these requirements
> since there is no persistent read/write storage available: the only
> choice is between flash (persistent but read-only) and ramdisk
> (read-write but volatile).  
> 
> Clearly, placing /var/tmp or /var/cache in a readonly location is
> unlikely to produce any useful results so linking them into volatile/ is
> the least bad option in that situation.  Any change to base-files would
> need to be done with some level of care in order to not break those
> kinds of setups which do work today.  I guess it should be a DISTRO
> decision whether or not to adhere to the FHS in this area.

I echo this.  In my experiences the default filesystem should be FHS compliant,
but there must be a variant that works for specific embedded projects that
simply do not have writable storage.

The ramifications of this are that /var/tmp, /var/cache are both transient over
reboots.  Almost all applications will deal with this gracefully, so it's not
really an issue.  It is something to be aware of though when doing software
integration and validation that the problems must be able to create tmp and
cache files over again if the data is not already on the system.

The important things when following the FHS really are R/O vs R/W support, as
well a boot vs run-time.  (i.e. things required on '/' vs things that should
live in '/usr'...)

--Mark

> p.
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



