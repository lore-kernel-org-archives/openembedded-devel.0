Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LTAvy-00064j-AY
	for openembedded-devel@openembedded.org; Sat, 31 Jan 2009 09:10:34 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LTAoQ-0003s1-DW
	for openembedded-devel@openembedded.org; Sat, 31 Jan 2009 08:02:46 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 31 Jan 2009 08:02:46 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sat, 31 Jan 2009 08:02:46 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 31 Jan 2009 09:02:34 +0100
Message-ID: <gm10ir$uuj$1@ger.gmane.org>
References: <cover.1232244759.git.andrea.adami@gmail.com>	<8c1396b3add963b97e1f9f144c1bdd966ebbce02.1232244759.git.andrea.adami@gmail.com>	<4c945c9a1076160cee628241443c8a27d8b5e1ca.1232244759.git.andrea.adami@gmail.com>	<200901310401.11885.jay4mail@gmail.com>
	<4983B3B4.5070201@xora.org.uk>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090123 Shredder/3.0b2pre
In-Reply-To: <4983B3B4.5070201@xora.org.uk>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH 08/14] zaurus-2.6.inc: switch to kexecboot and deploy kernel in /boot
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
X-List-Received-Date: Sat, 31 Jan 2009 08:10:34 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31-01-09 03:13, Graeme Gregory wrote:
> Yuri Bushmelev wrote:
>> Hello!
>>
>>> ---
>>>   conf/machine/include/zaurus-2.6.inc |    4 ++++
>>>   1 files changed, 4 insertions(+), 0 deletions(-)
>>>
>>> diff --git a/conf/machine/include/zaurus-2.6.inc
>>> b/conf/machine/include/zaurus-2.6.inc index eee7631..8adb3d5 100644
>>> --- a/conf/machine/include/zaurus-2.6.inc
>>> +++ b/conf/machine/include/zaurus-2.6.inc
>>> @@ -83,3 +83,7 @@ zaurus_make_installkit () {
>>>   RDEPENDS_kernel-base = ""
>>>
>>>   KERNEL_IMAGETYPE ?= "zImage"
>>> +
>>> +# uncomment this if you want to override the legacy layout
>>> +# and deploy kernel in /boot
>>> +require conf/machine/include/kexecboot.inc
>>>
>> IMHO, we are ready now to switch on kexecboot by default for all supported
>> zauruses (at least) in .dev branch.
>>
> I think we are now as well, kexecboot makes zaurus booting a dream
> compared to what it used to be. Haven't had any problems at all on the tosa.

This all has been RFC'ed to death and noone objected against the idea, 
so let's make kexecboot the default for the zaurus family. If time 
permits I'll do the same for ipaqs.

regards,

Koen



