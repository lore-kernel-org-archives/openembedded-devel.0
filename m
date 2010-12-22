Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PVRfR-0008Ps-O7
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Dec 2010 17:35:57 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1PVRfJ-00006x-Dk from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Dec 2010 08:35:49 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 22 Dec 2010 08:35:48 -0800
Received: from [172.30.80.150] ([172.30.80.150]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 22 Dec 2010 09:35:48 -0700
Message-ID: <4D1228DF.6090004@mentor.com>
Date: Wed, 22 Dec 2010 09:35:43 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1293016481-703-1-git-send-email-koen@openembedded.org>	<AANLkTinhDm2O+71-+ec_LX1DOQ9bO6gpiwNOE3fauswA@mail.gmail.com>	<iesrb1$mue$1@dough.gmane.org>	<AANLkTinurP-H+XiaeLgaUe6Uq6oN5xYd1H0QnqiyhEW_@mail.gmail.com>	<4D121D05.4090806@mentor.com>
	<iet6s1$h1r$1@dough.gmane.org>
In-Reply-To: <iet6s1$h1r$1@dough.gmane.org>
X-OriginalArrivalTime: 22 Dec 2010 16:35:48.0455 (UTC)
	FILETIME=[49EDF770:01CBA1F6]
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCH] sanity: release 2010.12 is out, so bump minimum bitbake to 1.10.0 per TSC decision
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
X-List-Received-Date: Wed, 22 Dec 2010 16:35:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/22/2010 08:52 AM, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 22-12-10 16:45, Tom Rini wrote:
>> On 12/22/2010 05:48 AM, Frans Meulenbroeks wrote:
>>> 2010/12/22 Koen Kooi<k.kooi@student.utwente.nl>:
>>>> -----BEGIN PGP SIGNED MESSAGE-----
>>>> Hash: SHA1
>>>>
>>>> On 22-12-10 12:55, Frans Meulenbroeks wrote:
>>>>> 2010/12/22 Koen Kooi<koen.kooi@gmail.com>:
>>>>>> Signed-off-by: Koen Kooi<koen@openembedded.org>
>>>>>> ---
>>>>>>    conf/sanity.conf |    2 +-
>>>>>>    1 files changed, 1 insertions(+), 1 deletions(-)
>>>>>>
>>>>>> diff --git a/conf/sanity.conf b/conf/sanity.conf
>>>>>> index 0f53cb2..1c83c14 100644
>>>>>> --- a/conf/sanity.conf
>>>>>> +++ b/conf/sanity.conf
>>>>>> @@ -3,7 +3,7 @@
>>>>>>    # See sanity.bbclass
>>>>>>    #
>>>>>>    # Expert users can confirm their sanity with "touch
>>>>>> conf/sanity.conf"
>>>>>> -BB_MIN_VERSION = "1.8.18"
>>>>>> +BB_MIN_VERSION = "1.10.0"
>>>>>>
>>>>>>    SANITY_ABIFILE = "${TMPDIR}/abi_version"
>>>>>>    SANITY_PRFILE = "${TMPDIR}/distro_pr"
>>>>>> --
>>>>>> 1.7.0
>>>>>>
>>>>>
>>>>> As 1.10.1 is already out for quite a while and (if I recall correctly)
>>>>> 1.10.0 had some issues that are resolved in 1.10.1 wouldn't it be
>>>>> better to set 1.10.1 as minimal version?
>>>>> Otherwise no objections.
>>>>
>>>> The head of the 1.10 branch says it's 1.10.0, not 1.10.1 :(
>>>
>>> Indeed :-(
>>> Guess this should be changed then
>>>
>>> There is http://developer.berlios.de/projects/bitbake/ which lists 1.10.1
>>> and the git also has a tag for 1.10.1 and a donwload for it.
>>>
>>> Btw I assume we also need to update the wiki
>>
>> I think what happened was Chris forgot to bump the version number when
>> tagging / etc.  As he plans to do a 1.10.2 soon, maybe we can wait for
>> that?  And maybe we can get that done this week?
>
> I really want the 1.10 in sooner than later, since at OEDEM we agreed to
> do it before the release, but the TSC disagreed for undisclosed reasons.

I agree and would like it done soon too (well, I'd almost rather see 
1.11 be required, yaaay parallel parsing) but since we can't tell 1.10.0 
from .1 and I don't think this week (since that's just a few more days) 
is too bad.  Chris, when can you do a 1.10.2?

-- 
Tom Rini
Mentor Graphics Corporation


