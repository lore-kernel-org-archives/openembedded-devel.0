Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PrhZG-0004Zj-Fj
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Feb 2011 03:01:36 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PrhXy-0006bO-NJ from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Feb 2011 18:00:14 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 21 Feb 2011 18:00:14 -0800
Received: from [172.30.80.151] ([172.30.80.151]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 21 Feb 2011 19:00:13 -0700
Message-ID: <4D6318A4.9050702@mentor.com>
Date: Mon, 21 Feb 2011 19:00:04 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1297429349-5526-1-git-send-email-obi@opendreambox.org>	<ij3cut$mts$1@dough.gmane.org>	<4D5538BE.1080309@opendreambox.org>
	<4D630677.7090507@opendreambox.org>
In-Reply-To: <4D630677.7090507@opendreambox.org>
X-OriginalArrivalTime: 22 Feb 2011 02:00:13.0712 (UTC)
	FILETIME=[3E64D900:01CBD234]
Subject: Re: [PATCH] kernel.bbclass: provide virtual/kernel-${PV}
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
X-List-Received-Date: Tue, 22 Feb 2011 02:01:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/21/2011 05:42 PM, Andreas Oberritter wrote:
> Ping. Is there any reason not to apply this patch? Is there a better way
> to solve the problem?
>
> On 02/11/2011 02:25 PM, Andreas Oberritter wrote:
>> On 02/11/2011 02:18 PM, Koen Kooi wrote:
>>> On 11-02-11 14:02, Andreas Oberritter wrote:
>>>> * Allow precompiled modules to depend on a specific kernel version.
>>>
>>>> Signed-off-by: Andreas Oberritter<obi@opendreambox.org>
>>>> ---
>>>>   classes/kernel.bbclass |    2 +-
>>>>   1 files changed, 1 insertions(+), 1 deletions(-)
>>>
>>>> diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
>>>> index 0d1b4ad..55e3ca0 100644
>>>> --- a/classes/kernel.bbclass
>>>> +++ b/classes/kernel.bbclass
>>>> @@ -1,6 +1,6 @@
>>>>   inherit linux-kernel-base module_strip
>>>
>>>> -PROVIDES += "virtual/kernel"
>>>> +PROVIDES += "virtual/kernel virtual/kernel-${PV}"
>>>>   DEPENDS += "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}depmod-${@get_kernelmajorversion('${PV}')} virtual/${TARGET_PREFIX}gcc${KERNEL_CCSUFFIX} update-modules bluez-dtl1-workaround"
>>>
>>>>   # we include gcc above, we dont need virtual/libc
>>>
>>> How is PV know before the kernel is built? The line below has a
>>> workaround for that, so I guess it also needs one in PROVIDES, no?
>>
>> KERNEL_VERSION is what's unknown until after the build. PV is the
>> version set by the recipe. The line below uses PV to derive 2.4 or 2.6
>> from that.

Does this mean we sometimes create package files with unresolvable / 
incorrect deps?  Or just that it's a bit tricky looking at times?

-- 
Tom Rini
Mentor Graphics Corporation


