Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OqBcf-0003zf-Pn
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Aug 2010 23:10:36 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OqBc8-0001g5-KV from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Aug 2010 14:10:00 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Mon, 30 Aug 2010 14:10:00 -0700
Received: from [172.30.80.207] ([172.30.80.207]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 30 Aug 2010 15:09:59 -0600
Message-ID: <4C7C1E25.30005@mentor.com>
Date: Mon, 30 Aug 2010 14:09:57 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1282896714-3167-1-git-send-email-raj.khem@gmail.com>	<1282896714-3167-3-git-send-email-raj.khem@gmail.com>	<i586bt$t12$1@dough.gmane.org>	<AANLkTikWe-88_U7FmV2mi4=J6XV-A3-nYUqJdjDNzOA9@mail.gmail.com>	<i5aoas$sja$2@dough.gmane.org>	<AANLkTi=stV1ahzagn-7Fzq73pL3xYDDBZpAsfRUbA86v@mail.gmail.com>	<AANLkTinPBor3x6fYemS6h7_R-TR8Tx01exHzG+YhTAz=@mail.gmail.com>
	<4C79B2E7.6070806@mwester.net>
In-Reply-To: <4C79B2E7.6070806@mwester.net>
X-OriginalArrivalTime: 30 Aug 2010 21:09:59.0483 (UTC)
	FILETIME=[B46A20B0:01CB4887]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/2] recipes: Update recipes to get 'bitbake world' parse and calculate runqueue successfully.
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
X-List-Received-Date: Mon, 30 Aug 2010 21:10:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Mike Westerhof wrote:
> Frans Meulenbroeks wrote:
>> Koen brought up this in the thread on the review process. As it
>> (mostly) is about this thread I felt it was more appropriate here.
> [snip]
>> I don't know what others think about it, but I see only a few matches.
> [snip]
>> PS: I think this is also an excellent case why it is a good idea to
>> identify the maintainer within the recipe/
> 
> I think this gets at the heart of why Frans' recent changes make *me*
> uncomfortable -- their scope is broad and the general approach by Frans
> is to make everyone else provide detailed and precise arguments
> defending why the broad change should not apply to specific items.
> 
> I, for one, would like to understand where this "cleanup" effort is
> ultimately going to go.  What distros will ultimately remain in OE?

Maybe we need to put that build box I've heard we have access to up to 
autobuilding a few more DISTRO/MACHINE/<images/whatever> combinations? 
People are trying to go with "nothing is pinning to version ..." but 
yes, not every MACHINE/DISTRO combination is being tested and I'm quite 
sure that therein lies a problem (and some recipes might well need 
COMPATIBLE_MACHINE put in them).

In addition to the posting to the ML part of things, this is just 
another example of why it's good to commit single and self contained 
changes.  Yes, it sucks to have to dig out why / when something got 
broken but it sucks a lot less when the answer is a single and whole commit.

-- 
Tom Rini
Mentor Graphics Corporation


