Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Pp1oL-0002XB-IR
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Feb 2011 18:02:24 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Pp1n9-0005Mn-Kc from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Feb 2011 09:00:51 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 14 Feb 2011 09:00:51 -0800
Received: from [172.30.80.148] ([172.30.80.148]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 14 Feb 2011 10:00:50 -0700
Message-ID: <4D595FB7.7000802@mentor.com>
Date: Mon, 14 Feb 2011 10:00:39 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D59535A.1010602@mentor.com> <4D595503.20409@eukrea.com>
In-Reply-To: <4D595503.20409@eukrea.com>
X-OriginalArrivalTime: 14 Feb 2011 17:00:50.0610 (UTC)
	FILETIME=[BB972120:01CBCC68]
Subject: Re: testing-release-2011.1 failure: at91sam9263ek
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
X-List-Received-Date: Mon, 14 Feb 2011 17:02:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 02/14/2011 09:14 AM, Eric Bénard wrote:
> Hi Tom,
>
> On 14/02/2011 17:07, Tom Rini wrote:
>> Here are the failures I see building for at91sam9263ek:
>> angstrom-2010.x (all images): http://pastebin.com/7g7wNWQj
>>
>> Perhaps this will be fixed when Ulf pushes updates for a newer version of
>> u-boot? The error itself is easily fixable but there may be run-time
>> problems
>> still.
>>
> there is a patch in 2009.08 which fix this error, maybe it can apply to
> 2009.01 :
> recipes/u-boot/u-boot-2009.08/dont-inline-weak-symbols.patch

I think that, plus one other (or, what I did for the mini2440 a few 
weeks back which had both patches I found for weak symbols combined) 
would make this build, but perhaps not run.

-- 
Tom Rini
Mentor Graphics Corporation


