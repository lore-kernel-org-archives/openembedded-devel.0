Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OqA1P-0001cL-Dg
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Aug 2010 21:28:01 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OqA0s-0005KF-3i from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Aug 2010 12:27:26 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Mon, 30 Aug 2010 12:27:25 -0700
Received: from [172.30.80.207] ([172.30.80.207]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 30 Aug 2010 13:27:24 -0600
Message-ID: <4C7C061A.30302@mentor.com>
Date: Mon, 30 Aug 2010 12:27:22 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTikcbgZQ8EkyCh3a7mby5VbXZ4Hp8bXRORPpZKsY@mail.gmail.com>	<4C7BF64A.6080408@balister.org>	<AANLkTikfDN6d8X+OgR0AYRyPM78GXwN_RqFAxp48e9d0@mail.gmail.com>	<4C7BFB14.2010009@balister.org>
	<AANLkTinsotKZ9dtqgOMx_9T0x=1833GvpjpPzutYq+FS@mail.gmail.com>
In-Reply-To: <AANLkTinsotKZ9dtqgOMx_9T0x=1833GvpjpPzutYq+FS@mail.gmail.com>
X-OriginalArrivalTime: 30 Aug 2010 19:27:24.0993 (UTC)
	FILETIME=[600D7B10:01CB4879]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: linux-omap-psp-2.6.32 breaks iscsi-target
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
X-List-Received-Date: Mon, 30 Aug 2010 19:28:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Frans Meulenbroeks wrote:
> 2010/8/30 Philip Balister <philip@balister.org>:
>> On 08/30/2010 02:35 PM, Frans Meulenbroeks wrote:
>>> 2010/8/30 Philip Balister<philip@balister.org>:
>>>> On 08/30/2010 01:47 PM, Frans Meulenbroeks wrote:
>>>>> The current beagleboard angstrom and minimal distro's (and maybe
>>>>> others) use the linux-omap-psp_2.6.32.bb recipe to build the kernel.
>>>> What is iscsi and why would I need it on the Beagleboard?
>>> http://stgt.sourceforge.net/
>>>
>>> the pacakge is from
>>> http://iscsitarget.sourceforge.net/
>>> It is used by tgt (http://stgt.sourceforge.net/)
>>>
>>> with it you can e.g. mount an iscsi disk.
>>> iscsi is for instance also supported by windows 7 and by various NAS-es.
>>> Its throughput is better than Samba or NFS.
>>>
>>> So for beagle it could act as mechanism to e.g. retrieve content from a
>>> NAS.
>> So the trade off is a kernel that has the best chance of fully supporting
>> the OMAP3 peripherals, or attaching to a NAS that is windows centric.
> 
> If you had taken the time to read the links I gave you would know it
> is absolutely not windows centric. Far from that.
> And I am not saying we should change the kernel. Probably the best
> solution is to have a patch that undoes the effects from the .33 patch
> that crept into the kernel.
> Another option could be to give the kernel a different version number.
> It is not a real .32 kernel, but probably making it .33 rc1 is not a
> good choice either.

In other words we have the very real problem of when you use a -rc 
kernel, internal APIs aren't consistent with the real world and someone 
should strongly re-evaluate what the best kernel revision to use here is 
given that it's not .32 and not .33 but .33-rc1 or so.  Maybe it 
shouldn't be D_P = 1 until it's based on a release kernel version?

-- 
Tom Rini
Mentor Graphics Corporation


