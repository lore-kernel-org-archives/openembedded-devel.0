Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1PriMj-0005AM-TP
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Feb 2011 03:52:41 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 738E3314DEDF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Feb 2011 03:51:26 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 4aOwu6iQUm9L
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Feb 2011 03:51:21 +0100 (CET)
Received: from [172.22.22.61] (ip-94-79-168-47.unitymediagroup.de
	[94.79.168.47])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id 89B4D314DEDC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Feb 2011 03:51:21 +0100 (CET)
Message-ID: <4D6324A7.5060102@opendreambox.org>
Date: Tue, 22 Feb 2011 03:51:19 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.14) Gecko/20110208 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1297429349-5526-1-git-send-email-obi@opendreambox.org>	<ij3cut$mts$1@dough.gmane.org>	<4D5538BE.1080309@opendreambox.org>	<4D630677.7090507@opendreambox.org>
	<4D6318A4.9050702@mentor.com>
In-Reply-To: <4D6318A4.9050702@mentor.com>
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
X-List-Received-Date: Tue, 22 Feb 2011 02:52:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 02/22/2011 03:00 AM, Tom Rini wrote:
> On 02/21/2011 05:42 PM, Andreas Oberritter wrote:
>> Ping. Is there any reason not to apply this patch? Is there a better way
>> to solve the problem?
>>
>> On 02/11/2011 02:25 PM, Andreas Oberritter wrote:
>>> On 02/11/2011 02:18 PM, Koen Kooi wrote:
>>>> On 11-02-11 14:02, Andreas Oberritter wrote:
>>>>> * Allow precompiled modules to depend on a specific kernel version.
>>>>
>>>>> Signed-off-by: Andreas Oberritter<obi@opendreambox.org>
>>>>> ---
>>>>>   classes/kernel.bbclass |    2 +-
>>>>>   1 files changed, 1 insertions(+), 1 deletions(-)
>>>>
>>>>> diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
>>>>> index 0d1b4ad..55e3ca0 100644
>>>>> --- a/classes/kernel.bbclass
>>>>> +++ b/classes/kernel.bbclass
>>>>> @@ -1,6 +1,6 @@
>>>>>   inherit linux-kernel-base module_strip
>>>>
>>>>> -PROVIDES += "virtual/kernel"
>>>>> +PROVIDES += "virtual/kernel virtual/kernel-${PV}"
>>>>>   DEPENDS += "virtual/${TARGET_PREFIX}gcc
>>>>> virtual/${TARGET_PREFIX}depmod-${@get_kernelmajorversion('${PV}')}
>>>>> virtual/${TARGET_PREFIX}gcc${KERNEL_CCSUFFIX} update-modules
>>>>> bluez-dtl1-workaround"
>>>>
>>>>>   # we include gcc above, we dont need virtual/libc
>>>>
>>>> How is PV know before the kernel is built? The line below has a
>>>> workaround for that, so I guess it also needs one in PROVIDES, no?
>>>
>>> KERNEL_VERSION is what's unknown until after the build. PV is the
>>> version set by the recipe. The line below uses PV to derive 2.4 or 2.6
>>> from that.
> 
> Does this mean we sometimes create package files with unresolvable /
> incorrect deps?  Or just that it's a bit tricky looking at times?

I'd like to package the same set of modules precompiled for different
kernel versions. In order to do that, a module's recipe needs a way to
depend on a kernel version, e.g. by using the kernel's PN. Otherwise,
the recipe of the module of the newest kernel will always get selected,
even for older kernel versions.

In the module's recipe, you can then derive kernel source and binary
versions from the recipe's PN. I'm using the following for
dreambox-dvb-modules_2.6.18-7.4-dm8000-20101215.bb and
dreambox-dvb-modules_2.6.38-2.3-dm8000-20110203.bb.

DEPENDS += "virtual/kernel-${DM_KERNEL_VERSION}"
RDEPENDS_${PN} += "kernel-${DM_LOCALVERSION}"

DM_LOCALVERSION = "${@'-'.join('${PV}'.split('-')[:-1])}"
DM_KERNEL_VERSION = "${@'${PV}'.split('-')[0]}"

Regards,
Andreas



