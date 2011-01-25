Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Phn5t-0003Ln-08
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Jan 2011 18:54:17 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Phn57-0006Sx-Gw from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Jan 2011 09:53:29 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 25 Jan 2011 09:53:29 -0800
Received: from [172.30.80.64] ([172.30.80.64]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 25 Jan 2011 10:53:28 -0700
Message-ID: <4D3F0E15.7050904@mentor.com>
Date: Tue, 25 Jan 2011 10:53:25 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D36F9BE.1010601@xora.org.uk>
	<4D3DAB2A.3070303@balister.org>	<AANLkTi=T++s65-mH91BBwT6OBUfzqcGDiq6J-LVk8+SJ@mail.gmail.com>	<ihmaqm$eho$1@dough.gmane.org>
	<AANLkTi=hWbJ_Y_m6kxMfCMdQti+xvAZZ-snK1UuqKLxY@mail.gmail.com>
In-Reply-To: <AANLkTi=hWbJ_Y_m6kxMfCMdQti+xvAZZ-snK1UuqKLxY@mail.gmail.com>
X-OriginalArrivalTime: 25 Jan 2011 17:53:28.0179 (UTC)
	FILETIME=[C562EC30:01CBBCB8]
Subject: Re: openembedded-core git repository
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
X-List-Received-Date: Tue, 25 Jan 2011 17:54:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/25/2011 07:49 AM, Frans Meulenbroeks wrote:
> 2011/1/25 Koen Kooi<k.kooi@student.utwente.nl>:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 24-01-11 18:48, Khem Raj wrote:
>>> On Mon, Jan 24, 2011 at 8:39 AM, Philip Balister<philip@balister.org>  wrote:
>>>> On 01/19/2011 06:48 AM, Graeme Gregory wrote:
>>>>>
>>>>> Hi, this email is sent as an ordinary member of OE.
>>>>>
>>>>> It seems to be on a technical level we are agreed that we should split
>>>>> parts of OE out into the so called openembedded-core which will have a
>>>>> stricter commit access and higher QA requirements on changes.
>>>>>
>>>>> I therefore think it is time to actually create the repository and let
>>>>> the people who are interested in merging the good stuff from poky with
>>>>> the good stuff from openembedded to create our "core". I don't think
>>>>> there is any need to wait on the political part of the Yocto/OE
>>>>> collaboration as its something we have agreed in principal to do anyway.
>>>>>
>>>>> I would request then that the TSC drive this forward with the server
>>>>> admins and create this repo so work can happen.
>>>>
>>>>
>>>> Has anything happened on this email? Has the TSC had a meeting to discuss? I
>>>> know it has only been a week, but people are starting to do work based on
>>>> these ideas and need some support from the TSC.
>>>>
>>>
>>> Yes I think we should start action on it soon. I would suggest to set
>>> up the repository
>>> as first step. As someone raised question about pull model it could be
>>> TSC who decided
>>> to appoint one gatekeeper based upon availability interest and
>>> capability and it could be
>>> rotated.secondly sane Starting point would be importing yocto and then
>>> apply the OE improvements
>>> on top thirdly breakdown oe into oe-meta repo to glue with the oe-core
>>
>> Ignoring the timeline a bit, since ideally we would do this around a
>> yocto milestone to get them to use this straight after their freeze.
>>
>> The technical roadmap/todo:
>>
>> * setup openembedded-core repo on oe.org
>> * setup oe-core ml on oe.org
>> * add oe-core ml to patchwork
>> * import yocto-core in oe-core
>
> Is this yocto core: http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/
> Or do you mean this:
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-core
>
>> * start an integration branch
>>   o remove bitbake
> Not sure what you mean with that. Which BB do you propose to use?

Chris Larson has been doing a lot of work (and Richard has been 
confirming, testing, etc, etc) to try and keep poky's bitbake changes in 
sync with master when at all possible (the delta has gotten very very 
small, iirc).

-- 
Tom Rini
Mentor Graphics Corporation


