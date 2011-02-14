Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Pozwl-0001BI-1P
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Feb 2011 16:02:39 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Pozvd-0005my-70 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Feb 2011 07:01:29 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 14 Feb 2011 07:01:29 -0800
Received: from [172.30.80.148] ([172.30.80.148]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 14 Feb 2011 08:01:28 -0700
Message-ID: <4D5943BD.9040701@mentor.com>
Date: Mon, 14 Feb 2011 08:01:17 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D58D5EF.6000807@dresearch.de>	<AANLkTi=4i_m8J4qFCwntdo-qb4CHn98UH+kuz4O=zcgT@mail.gmail.com>
	<4D59066F.1040805@dresearch.de>
In-Reply-To: <4D59066F.1040805@dresearch.de>
X-OriginalArrivalTime: 14 Feb 2011 15:01:28.0198 (UTC)
	FILETIME=[0E75CA60:01CBCC58]
Subject: Re: bitbake exit codes? (testing-release-2011.03 build results)
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
X-List-Received-Date: Mon, 14 Feb 2011 15:02:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/14/2011 03:39 AM, Steffen Sledz wrote:
> Am 14.02.2011 09:11, schrieb Frans Meulenbroeks:
>> 2011/2/14 Steffen Sledz<sledz@dresearch.de>:
>>> While setting up Jenkins/Hudson jobs for the testing-release-2011.03 branch based on the testscript.sh from the contrib subdir i hit the following problem.
>>>
>>> bitbake (1.10.2) finally reports "NOTE: Task Summary: Attempted 1217 tasks of which 0 didn't need to be rerun and 0 failed.". So it seems that the build was successful. But bitbake did not return 0 but 1. So Jenkins marks the build as failed.
>>>
>>> I guess the exit code 1 is coming from some QA Issues. How do we handle that if if my guess is right?
>>>
>>> Do we mark such a build run as successful in our test matrix?
>>>
>>> Has bitbake a defined set of exit codes that we can evaluate in the testscript.sh?
>>>
>>> Steffen
>>
>> There have been a few threads on this in the past.
>> One of the ways (and maybe the best one) to get around this is to fix
>> the QA errors.
>
> Of course. You are right.
>
> But for the moment the question is: "Do we mark such a builds as successful in our test matrix or not?"

Well, as the code stands today (post tag) the change to make those 
failures kill the build have been merged.

-- 
Tom Rini
Mentor Graphics Corporation


