Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PVQsV-0007KI-98
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Dec 2010 16:45:23 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1PVQsM-0004Zx-Ay from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Dec 2010 07:45:14 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 22 Dec 2010 07:45:13 -0800
Received: from [172.30.80.150] ([172.30.80.150]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 22 Dec 2010 08:45:13 -0700
Message-ID: <4D121D05.4090806@mentor.com>
Date: Wed, 22 Dec 2010 08:45:09 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1293016481-703-1-git-send-email-koen@openembedded.org>	<AANLkTinhDm2O+71-+ec_LX1DOQ9bO6gpiwNOE3fauswA@mail.gmail.com>	<iesrb1$mue$1@dough.gmane.org>
	<AANLkTinurP-H+XiaeLgaUe6Uq6oN5xYd1H0QnqiyhEW_@mail.gmail.com>
In-Reply-To: <AANLkTinurP-H+XiaeLgaUe6Uq6oN5xYd1H0QnqiyhEW_@mail.gmail.com>
X-OriginalArrivalTime: 22 Dec 2010 15:45:13.0322 (UTC)
	FILETIME=[38D96CA0:01CBA1EF]
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
X-List-Received-Date: Wed, 22 Dec 2010 15:45:23 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/22/2010 05:48 AM, Frans Meulenbroeks wrote:
> 2010/12/22 Koen Kooi<k.kooi@student.utwente.nl>:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 22-12-10 12:55, Frans Meulenbroeks wrote:
>>> 2010/12/22 Koen Kooi<koen.kooi@gmail.com>:
>>>> Signed-off-by: Koen Kooi<koen@openembedded.org>
>>>> ---
>>>>   conf/sanity.conf |    2 +-
>>>>   1 files changed, 1 insertions(+), 1 deletions(-)
>>>>
>>>> diff --git a/conf/sanity.conf b/conf/sanity.conf
>>>> index 0f53cb2..1c83c14 100644
>>>> --- a/conf/sanity.conf
>>>> +++ b/conf/sanity.conf
>>>> @@ -3,7 +3,7 @@
>>>>   # See sanity.bbclass
>>>>   #
>>>>   # Expert users can confirm their sanity with "touch conf/sanity.conf"
>>>> -BB_MIN_VERSION = "1.8.18"
>>>> +BB_MIN_VERSION = "1.10.0"
>>>>
>>>>   SANITY_ABIFILE = "${TMPDIR}/abi_version"
>>>>   SANITY_PRFILE = "${TMPDIR}/distro_pr"
>>>> --
>>>> 1.7.0
>>>>
>>>
>>> As 1.10.1 is already out for quite a while and (if I recall correctly)
>>> 1.10.0 had some issues that are resolved in 1.10.1 wouldn't it be
>>> better to set 1.10.1 as minimal version?
>>> Otherwise no objections.
>>
>> The head of the 1.10 branch says it's 1.10.0, not 1.10.1 :(
>
> Indeed :-(
> Guess this should be changed then
>
> There is http://developer.berlios.de/projects/bitbake/ which lists 1.10.1
> and the git also has a tag for 1.10.1 and a donwload for it.
>
> Btw I assume we also need to update the wiki

I think what happened was Chris forgot to bump the version number when 
tagging / etc.  As he plans to do a 1.10.2 soon, maybe we can wait for 
that?  And maybe we can get that done this week?

-- 
Tom Rini
Mentor Graphics Corporation


