Received: from p3plsmtpa01-07.prod.phx3.secureserver.net ([72.167.82.87])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <mike@mwester.net>) id 1PjgYN-00012k-UP
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Jan 2011 00:19:32 +0100
Received: (qmail 15974 invoked from network); 30 Jan 2011 23:18:37 -0000
Received: from unknown (209.242.7.132)
	by p3plsmtpa01-07.prod.phx3.secureserver.net (72.167.82.87) with ESMTP;
	30 Jan 2011 23:18:37 -0000
Message-ID: <4D45F1C9.1020802@mwester.net>
Date: Sun, 30 Jan 2011 17:18:33 -0600
From: Mike Westerhof <mike@mwester.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.24) Gecko/20100228 Thunderbird/2.0.0.24 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1295598581-12927-1-git-send-email-raj.khem@gmail.com>	<4D394AC0.90300@eukrea.com>	<AANLkTi=Jdmsr8sYYpOMTOqdpoi9iHiyFBcAAqnfoaMAN@mail.gmail.com>	<4D3A31FF.2010907@mwester.net>	<AANLkTin=77JheFmKVs2Z7wKH6kWD+uKgHSDVRQ__cwF7@mail.gmail.com>
	<4D3CB26F.7060905@mentor.com>
In-Reply-To: <4D3CB26F.7060905@mentor.com>
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
X-List-Received-Date: Sun, 30 Jan 2011 23:19:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 1/23/2011 4:57 PM, Tom Rini wrote:
> On 01/23/2011 11:27 AM, Khem Raj wrote:
>> On Fri, Jan 21, 2011 at 5:25 PM, Mike Westerhof<mike@mwester.net>  wrote:
>>> Isn't this kernel-specific, though?  I don't have any other OE-based
>>> devices handy just now to check, but what's difference, specifically,
>>> and should we change something to bring SlugOS into line with the rest
>>> of the world?
>>>
>>> -Mike (mwester)
>>>
>>
>> yes seems like slugos kernel enables.
>> CONFIG_SYSFS_DEPRECATED=y
>> CONFIG_SYSFS_DEPRECATED_V2=y
>>
>> which enabled these. I havent tested the kernel by disabling them
>> as I havent figured out how to boot a kernel from network on slug
>> but if you can try that and see what /sys/class looks like that
>> would help or if I find some time to make slug suck the kernel
>> from a tftp then I can do it too.
> 
> Note that these kernel options also place an upper bound on what udev
> can be used and it's very much worth checking if they can be turned off.

SlugOS has bumped up to a 2.6.29 kernel with the above CONFIG items
disabled.  (This is still a relatively old kernel, but I know that it
basically works with SlugOS, so it's a good place to test mdev and, if
anyone wants to, newer udevs.)

-Mike (mwester)




