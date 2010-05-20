Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OFD4R-0003WN-Ai
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 May 2010 23:14:24 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OFD0W-0004zd-0l from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 May 2010 14:10:20 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Thu, 20 May 2010 14:10:19 -0700
Received: from [172.30.80.86] ([172.30.80.86]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 20 May 2010 15:10:18 -0600
Message-ID: <4BF5A533.2020908@mentor.com>
Date: Thu, 20 May 2010 14:10:11 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <bug-5437-13@http.bugs.openembedded.org/>	<AANLkTilUYA_uexLXydVxyFGHnKol23h1LYOBfOkU7Wzt@mail.gmail.com>
	<4BF55079.6030905@mentor.com>
In-Reply-To: <4BF55079.6030905@mentor.com>
X-OriginalArrivalTime: 20 May 2010 21:10:18.0678 (UTC)
	FILETIME=[D9B88D60:01CAF860]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] [Bug 5437] New: packaged-staging freezes
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
X-List-Received-Date: Thu, 20 May 2010 21:14:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Tom Rini wrote:
> Andrea Adami wrote:
>> I had same stall on:
>>
>> NOTE: package stagemanager-native-0.0.1-r12: task do_package_write: 
>> Succeeded
>>
>> There is one patch is shr repo removing one lockfile in
>> packaged-staging.bbclass which helped my rebuild.
>>
>> http://gitorious.org/~jama/angstrom/jama-shr-experimental/commit/1ae868c5f4029f1862555e97a1aba37a8935221c 
>>
>>
>> I think RP could say something about this lock.
> 
> iirc, that's mine or Chris'.  We want to have a lock on installing 
> pstaging otherwise gcc-cross{,-initial,-intermediate} and 
> libc{,-initial} can get done in the wrong order.

OK, reproducing the problem locally and digging again, I can say quite 
confidently that when 3440328ac1ccbd5ca6aeea4a4b6084ecafd6fdda put the 
lock in that the above link takes back out, that was a merge error 
between Poky and oe.dev since Poky is/was missing 
394d321684eec271bc55438e3c01f74825d80988 where that lock got moved for 
the reasons I stated above.  You can add:
Acked-by: Tom Rini <tom_rini@mentor.com>
and merge that gitorious commit into mainline, asap please :)

-- 
Tom Rini
Mentor Graphics Corporation



