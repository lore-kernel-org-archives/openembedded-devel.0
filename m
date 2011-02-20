Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PrAa6-00064I-RB
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Feb 2011 15:48:15 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1PrAYs-0004N7-0v from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Feb 2011 06:46:58 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Sun, 20 Feb 2011 06:46:57 -0800
Received: from [172.30.80.150] ([172.30.80.150]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sun, 20 Feb 2011 07:46:56 -0700
Message-ID: <4D612958.70402@mentor.com>
Date: Sun, 20 Feb 2011 07:46:48 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1298057187-2466-1-git-send-email-tom_rini@mentor.com>	<4D5ED835.7040800@eukrea.com>	<AANLkTimfZ4vp-8RPHxTWPfo5m_0zfTwM611Q+d+jWuK8@mail.gmail.com>	<201102191252.05388.schnitzeltony@gmx.de>	<AANLkTinfrqy3eSJajojfDiAJcPcMM9MbTZo94YVGz+ba@mail.gmail.com>	<4D5FF708.90903@mentor.com>
	<AANLkTim-b=vO2vD5sgTo5bKduF=OYqAczS7f3YYdgPUy@mail.gmail.com>
In-Reply-To: <AANLkTim-b=vO2vD5sgTo5bKduF=OYqAczS7f3YYdgPUy@mail.gmail.com>
X-OriginalArrivalTime: 20 Feb 2011 14:46:56.0915 (UTC)
	FILETIME=[059D0E30:01CBD10D]
Subject: Re: [PATCH] insane.bbclass: Make RPATH a non-fatal error
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
X-List-Received-Date: Sun, 20 Feb 2011 14:48:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/20/2011 05:42 AM, Frans Meulenbroeks wrote:
> 2011/2/19 Tom Rini<tom_rini@mentor.com>:
>> On 02/19/2011 06:26 AM, Otavio Salvador wrote:
>>>
>>> On Sat, Feb 19, 2011 at 11:52, Andreas Mueller<schnitzeltony@gmx.de>
>>>   wrote:
>>>>
>>>> On Saturday 19 February 2011 10:45:38 Frans Meulenbroeks wrote:
>>>>>
>>>>> I am fine with the patch, but perhaps a better solution would be to
>>>>> introduce a var to decide whether it is a fatal or not.
>>>>> That way people distro's that use libtool 2.4 can decide to make it a
>>>>> fatal. (or individual users in their local.conf)
>>>>>
>>>>> Frans
>>>>
>>>> How comes that I sometimes feel handled as spammer ;-) ?
>>>>
>>>> see http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-
>>>> February/029534.html
>>>>
>>>> anyway - treating RPATH errors as fatal has lead to many QA fixes and
>>>> further
>>>> will follow...
>>>>
>>>> my opinion now: keep RPATH errors fatal as developer's  whip :-)
>>>
>>> I agree about keeping it configurable.
>>>
>>> Besides I think that we ought to keep it fatal until quite near of
>>> release since we'll be "forced" to fix most of many of them.
>>
>> I just want to state, again, that most of these just go away with libtool
>> 2.4.  Now, if people are looking for something to work on that won't just go
>> away with an update to libtool 2.4:
>> - iscsi-target needs some love again for various kernel versions as that
>> looks to be killing calamari and neek for nas-server-image
>
> Peeked at iscsi-target for calamari. Some inet fields have changed
> name in 2.6.32 or so, and apparently this is not handled fully.
> Instead of trying to fix it, I moved the calamari recipe to 2.6.34
> (which I'm already using for half a year or so, but apparently never
> pushed).

Thanks.

> I'll also see if I can update the neek version (probably also by
> moving the kernel version forward.
> Tomorrow I'll discuss this with Walter who afaik is the only other neek user.

Note that I also see:
- uclibc total failure, but I assume unsupported and I'll drop
- minimal fails everywhere else with:
ERROR: QA Issue with staging: libsupc++.la failed sanity test (workdir) 
in path 
/var/hudson/workspace/sb_openembedded_autobuilder/BBPKGS/native-sdk-image/DISTRO/minimal/MACHINE/neek/label/sb-u1004/tmp/sysroots/nios2-linux/usr/lib
ERROR: QA Issue with staging: libstdc++.la failed sanity test (workdir) 
in path 
/var/hudson/workspace/sb_openembedded_autobuilder/BBPKGS/native-sdk-image/DISTRO/minimal/MACHINE/neek/label/sb-u1004/tmp/sysroots/nios2-linux/usr/lib
ERROR: QA staging was broken by the package built above

-- 
Tom Rini
Mentor Graphics Corporation


