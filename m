Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1PDNmM-0004s4-U0
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Nov 2010 21:48:27 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1PDNlT-0004A3-Br from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Nov 2010 13:47:31 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Tue, 2 Nov 2010 13:47:31 -0700
Received: from [172.30.80.166] ([172.30.80.166]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 2 Nov 2010 14:47:30 -0600
Message-ID: <4CD078DD.8020504@mentor.com>
Date: Tue, 02 Nov 2010 13:47:25 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1288646991-15775-1-git-send-email-eric@eukrea.com>	<AANLkTi=0EsyQ38D1dyBRffGBWEoVo==6=H9+wrtcENyR@mail.gmail.com>	<4CD02461.3020106@eukrea.com>	<4CD026D8.2030101@mentor.com>
	<4CD03FCC.6030002@eukrea.com>
In-Reply-To: <4CD03FCC.6030002@eukrea.com>
X-OriginalArrivalTime: 02 Nov 2010 20:47:30.0698 (UTC)
	FILETIME=[2AE9DEA0:01CB7ACF]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] gdb-cross-sdk: don't reconfigure after making changes in gdb/Makefile
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
X-List-Received-Date: Tue, 02 Nov 2010 20:48:27 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Eric Bénard wrote:
> Le 02/11/2010 15:57, Tom Rini a écrit :
>> Can we look at NOT doing the dance we're doing here and instead try 
>> the normal
>> autotools stuff? The "we need to not do ..." stuff looks to be an ancient
>> artifact.
>>
> following the recent changes in this file we have a regression : some 
> libs are no more statically linked in gdb and this patch fix this 
> regression.
> Can we apply it and then we can think on a better way to rewrite these 
> recipes. After a few tries, switching to autotools doesn't work out of 
> the box because gdb is waiting for autoconf 2.64 when we have 2.65.

OK, yes, since you've found it to be non-trivial, it can be done a 
little bit later.  Thanks!

-- 
Tom Rini
Mentor Graphics Corporation


