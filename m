Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Pp2Dv-00024O-GD
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Feb 2011 18:28:31 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Pp2Co-0001Bs-1Q from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Feb 2011 09:27:22 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 14 Feb 2011 09:27:18 -0800
Received: from [172.30.80.148] ([172.30.80.148]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 14 Feb 2011 10:27:17 -0700
Message-ID: <4D5965EB.1070607@mentor.com>
Date: Mon, 14 Feb 2011 10:27:07 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1285777033-19478-1-git-send-email-t.fromm@dresearch.de>	<AANLkTikWLrAZaejWvnBGf4hn0CdKV2FgYiMxLEkDn+Wi@mail.gmail.com>	<4CA46AD8.2070205@dresearch.de>	<AANLkTimOEDXH3=OrROehD+sVtNdihoO8Q3P6Vy0oJscQ@mail.gmail.com>	<4CA5B348.1000404@dresearch.de>	<AANLkTinw6Tz0fDEGPBDyvv85KRk4w3v+ygeNemSHceh2@mail.gmail.com>	<AANLkTimviE5VqivppJTVZvhspZtsiUNpqVjGD4=p=No+@mail.gmail.com>	<4CA98B66.3060404@dresearch.de>	<AANLkTi=mw3h2vqEav+yz2begWJVR++V6823_QmjdNqAg@mail.gmail.com>
	<4D58E883.8030606@dresearch.de>
In-Reply-To: <4D58E883.8030606@dresearch.de>
X-OriginalArrivalTime: 14 Feb 2011 17:27:17.0737 (UTC)
	FILETIME=[6D977D90:01CBCC6C]
Subject: Re: [PATCH] libunwind: force gcc to be built first
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
X-List-Received-Date: Mon, 14 Feb 2011 17:28:31 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/14/2011 01:32 AM, Steffen Sledz wrote:
> Am 04.10.2010 18:00, schrieb Khem Raj:
>> On Mon, Oct 4, 2010 at 1:08 AM, Thilo Fromm<t.fromm@dresearch.de>  wrote:
>>> Hello Frans,
>>>
>>>>>> I tracked it down - libunwind publishes unwind.h, and gcc uses an
>>>>>> internal
>>>>>> file of the same name while being built.
>>>>>
>>>>> Yes gcc has its own version of libunwind which it used unless
>>>>> configured with --with-system-libunwind
>>>>> IIUC the problem happens with target gcc not with cross-gcc. target
>>>>> gcc is built using cross-gcc and
>>>>> <sysroot>/use/include could be preferred over the location of
>>>>> libunwind.h which is in gcc sources
>>>>> If thats the case then we need to fix gcc build to not look into
>>>>> standard sysroot/usr/include but prefer
>>>>> the local unwind.h when its using internal libunwind. The problem
>>>>> would not show up if the libunwind versions
>>>>> were matching but that may not be the case always and I dont know of
>>>>> hand how we can fix the gcc configury/build
>>>>> to ignore installed unwind.h
>>>>>
>>>>> You workaround would only work if build sequence was followed if some
>>>>> one just cleaned gcc and rebuild it
>>>>> the problem will resurface.
>>>>>
>>>> Thanks for the analysis Khem.
>>>> This is indeed more or less what I had expected.
>>>>
>>>> For me this patch gets a NAK as it does only masks the problvem in
>>>> some cases but not really solves it.
>>>
>>> You're right with this analysis; however, the patch enables Openembedded to
>>> be built *at all*. If you care less about whether you're able to actually
>>> build and if you have the time to wait until someone ventures deep into the
>>> gcc build and fixes the cause, then this is the way to go.
>>>
>>> For us, however, this patch is a valid workaround. It will make Openembedded
>>> work for us until the original issue is fixed.
>>
>> I think we should try to fix it in right way.
>
> Ping!

Can you re-submit so it (a) hits patchwork again and (b) consolidate the 
what's and whys and so forth in the commit message, if needed?  Thanks!

-- 
Tom Rini
Mentor Graphics Corporation


