Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1P0K6u-00061h-He
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Sep 2010 22:15:43 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1P0K6Z-0006Pw-JX from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Sep 2010 13:15:19 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Mon, 27 Sep 2010 13:15:19 -0700
Received: from [172.30.80.16] ([172.30.80.16]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 27 Sep 2010 14:15:18 -0600
Message-ID: <4CA0FB52.4090000@mentor.com>
Date: Mon, 27 Sep 2010 13:15:14 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1285230784-16893-1-git-send-email-sledz@dresearch.de>	<4CA04557.5070207@dresearch.de>	<AANLkTimNJWJz5cbMSWd+ChNxTtB9OZw_vAeoHVqNbeBq@mail.gmail.com>
	<4CA059F2.5090509@dresearch.de>
In-Reply-To: <4CA059F2.5090509@dresearch.de>
X-OriginalArrivalTime: 27 Sep 2010 20:15:18.0578 (UTC)
	FILETIME=[B468C120:01CB5E80]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] linux-2.6.24: avoid kernel error if ubifs superblock read fails
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
X-List-Received-Date: Mon, 27 Sep 2010 20:15:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Steffen Sledz wrote:
> Am 27.09.2010 09:40, schrieb Frans Meulenbroeks:
>>>> * .get_sb is called on mounts with automatic fs detection too, so this
>>>>   function should not print an error if it cannot read the superblock
>>>>   (new behaviour conforms the other fs types)
>>>> ...
>> Hm, I have some concerns:
>>
>> the first concern is that mainline 2.6.34 still has the code you have deleted.
>> I'd expect that others would have bumped into this too and that it
>> would have been fixed this upstream.
>> Since it isn't, chances are that upstream might have fixed the autofs
>> detection in a different way.  If they do this differently maybe we
>> should backport that solution.
> 
> I've suggested the same patch at the LKML and informed the UBIFS authors. But i do believe because of it's "low prio" it will need some time to go into the mainline.

So it is queued somewhere then?

-- 
Tom Rini
Mentor Graphics Corporation


