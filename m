Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Ph8tZ-0007dw-JN
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Jan 2011 23:58:54 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Ph8sh-0000NB-1H from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Jan 2011 14:57:59 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Sun, 23 Jan 2011 14:57:57 -0800
Received: from [172.30.80.40] ([172.30.80.40]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sun, 23 Jan 2011 15:57:57 -0700
Message-ID: <4D3CB26F.7060905@mentor.com>
Date: Sun, 23 Jan 2011 15:57:51 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1295598581-12927-1-git-send-email-raj.khem@gmail.com>	<4D394AC0.90300@eukrea.com>	<AANLkTi=Jdmsr8sYYpOMTOqdpoi9iHiyFBcAAqnfoaMAN@mail.gmail.com>	<4D3A31FF.2010907@mwester.net>
	<AANLkTin=77JheFmKVs2Z7wKH6kWD+uKgHSDVRQ__cwF7@mail.gmail.com>
In-Reply-To: <AANLkTin=77JheFmKVs2Z7wKH6kWD+uKgHSDVRQ__cwF7@mail.gmail.com>
X-OriginalArrivalTime: 23 Jan 2011 22:57:57.0832 (UTC)
	FILETIME=[FA1F3C80:01CBBB50]
Subject: Re: [PATCH 3/3] busybox_1.18.2.bb: slugos needs a modified version of usb.sh script
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
X-List-Received-Date: Sun, 23 Jan 2011 22:58:54 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/23/2011 11:27 AM, Khem Raj wrote:
> On Fri, Jan 21, 2011 at 5:25 PM, Mike Westerhof<mike@mwester.net>  wrote:
>> Isn't this kernel-specific, though?  I don't have any other OE-based
>> devices handy just now to check, but what's difference, specifically,
>> and should we change something to bring SlugOS into line with the rest
>> of the world?
>>
>> -Mike (mwester)
>>
>
> yes seems like slugos kernel enables.
> CONFIG_SYSFS_DEPRECATED=y
> CONFIG_SYSFS_DEPRECATED_V2=y
>
> which enabled these. I havent tested the kernel by disabling them
> as I havent figured out how to boot a kernel from network on slug
> but if you can try that and see what /sys/class looks like that
> would help or if I find some time to make slug suck the kernel
> from a tftp then I can do it too.

Note that these kernel options also place an upper bound on what udev 
can be used and it's very much worth checking if they can be turned off.

-- 
Tom Rini
Mentor Graphics Corporation


