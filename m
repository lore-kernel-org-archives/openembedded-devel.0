Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PcKkV-0008O3-Ah
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Jan 2011 17:37:45 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1PcKk0-0000h1-Sl from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Jan 2011 08:37:08 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 10 Jan 2011 08:37:08 -0800
Received: from [172.30.80.227] ([172.30.80.227]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 10 Jan 2011 09:37:07 -0700
Message-ID: <4D2B35B1.4080401@mentor.com>
Date: Mon, 10 Jan 2011 09:37:05 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTimqbQNtFt6NUi5D03nSnfRMyPxqrLYsN=PB4v+C@mail.gmail.com>
	<4D266CA1.4060306@mentor.com>
In-Reply-To: <4D266CA1.4060306@mentor.com>
X-OriginalArrivalTime: 10 Jan 2011 16:37:07.0801 (UTC)
	FILETIME=[9F127490:01CBB0E4]
Subject: Re: testing branch 2011-01-06
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
X-List-Received-Date: Mon, 10 Jan 2011 16:37:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/06/2011 06:30 PM, Tom Rini wrote:
> On 01/06/2011 04:22 PM, Cliff Brake wrote:
>> master has been merged to testing-next and is ready for clean builds.
>>
>> There are only 7 combinations listed as passing. If anyone has data
>> that is not entered, I'll check back tomorrow morning before I create
>> the tag.
>>
>> For more information on OpenEmbedded testing, see:
>>
>> http://www.openembedded.org/index.php/Testing
>>
>> We have lost some momentum with testing, so it would be nice to pick
>> up this effort again (speaking to myself first). I just ordered a 2TB
>> drive, so hopefully that will give me the capacity to do some more
>> builds.
>
> I see that the testing branch does contain the super long path fixes I
> pushed today so I expect to finally be able to push some real results
> (and failures!) over to the wiki this week. Build has started.

OK, I'm going to update the table sometime today.  Unfortunately I ran 
into some problems:
- The help2man-native change I pushed is needed for native-image-sdk to 
move on
- The xserver switch for qemu* is needed for qemu* + x11-image
- There's a race in libnl2 (http://pastebin.com/e3rwyg9H) that I'm 
trying to fix now (rather than PARALLEL_MAKE="") that broke a lot of 
other images.

-- 
Tom Rini
Mentor Graphics Corporation


