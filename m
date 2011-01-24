Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PhNnP-0003fJ-By
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Jan 2011 15:53:31 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PhNme-0007d1-O8 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Jan 2011 06:52:44 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 24 Jan 2011 06:52:44 -0800
Received: from [172.30.80.61] ([172.30.80.61]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 24 Jan 2011 07:52:43 -0700
Message-ID: <4D3D9235.109@mentor.com>
Date: Mon, 24 Jan 2011 07:52:37 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1295834629-3974-1-git-send-email-raj.khem@gmail.com>	<ihjf6u$c5u$1@dough.gmane.org>	<AANLkTin6h0bLj=s=ngGQrJMEQx2PBfK3hbm54nsmXari@mail.gmail.com>	<ihjhd3$n1e$1@dough.gmane.org>
	<AANLkTikqMQ8_xZZUjrm3Cu2GVJ5COM0u5PFuGAvyst+2@mail.gmail.com>
In-Reply-To: <AANLkTikqMQ8_xZZUjrm3Cu2GVJ5COM0u5PFuGAvyst+2@mail.gmail.com>
X-OriginalArrivalTime: 24 Jan 2011 14:52:43.0786 (UTC)
	FILETIME=[5B361EA0:01CBBBD6]
Subject: Re: [PATCH] angstrom-2010.x.conf: Prefer binutils 2.21 and	uclibc-git
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
X-List-Received-Date: Mon, 24 Jan 2011 14:53:31 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/24/2011 02:59 AM, Frans Meulenbroeks wrote:
> 2011/1/24 Koen Kooi<k.kooi@student.utwente.nl>:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 24-01-11 10:15, Khem Raj wrote:
>>> On Mon, Jan 24, 2011 at 1:02 AM, Koen Kooi<k.kooi@student.utwente.nl>  wrote:
>>> On 24-01-11 03:03, Khem Raj wrote:
>>>>>> * no need to pin older udev with uclibc/git either
>>>>>>
>>>>>> Signed-off-by: Khem Raj<raj.khem@gmail.com>
>>>
>>> NAK! binutils 2.21 introduces way too many problem at this moment, those
>>> need to get solved before switching to it.
>>>
>>>> hmmm. Too vague a statement. Do you have list of issues somewhere I can look at
>>>> it built the console-image x11-image images I tried and booted
>>>> console-image too.
>>
>> Try building anything that uses linux-omap-psp 2.6.32. You will run into
>> the secure mode problem. That one is relatively easy to solve, but it
>> needs to get solved *before* the switch, not after.
>>
>> But besided that, so a change needs to get RFC'd, tested and signed off
>> by the angstrom maintainers before it gets pushed. It's a toolchain
>> change and we take toolchains seriously.
>>
>> Waking up and seeing it applied without all that is *extremely*
>> insulting. So I reverted it.
>>
>
> Pushing distro changes without review is against the policy:
>
>> From http://www.openembedded.org/index.php/Commit_Policy:
>
>   * Distro config changes should be reviewed by the distro maintainers
>     where known
>
> Reveting changes from others is also against the policy:
>
> http://www.openembedded.org/index.php/Revert_Policy
>
> (and imho equally bad (or insulting if you prefer))
>
>
> Do unto others as you would have them do unto you

Well, no.  I'm pretty sure the "you just broke my distribution" falls 
into the yes, it's OK to push the revert before the other party wakes up 
and says "Oops, sorry!".

-- 
Tom Rini
Mentor Graphics Corporation


