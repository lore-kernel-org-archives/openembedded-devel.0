Received: from [87.193.137.100] (helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1N3460-00051x-1Z
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Oct 2009 09:41:35 +0100
Received: from hiob.intern.dresearch.de (unknown [10.32.0.138])
	by mail.dresearch.de (Postfix) with ESMTP id 7EF5D491264
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Oct 2009 09:40:25 +0100 (CET)
Received: from [127.0.0.1] ([10.32.10.2]) by hiob.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Wed, 28 Oct 2009 09:42:35 +0100
Message-ID: <4AE80352.7030802@dresearch.de>
Date: Wed, 28 Oct 2009 09:39:46 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1256566659-32412-1-git-send-email-sledz@dresearch.de>	<4AE6AE15.4080206@dresearch.de>
	<19c1b8a90910271258kb65e4b3wf62fb79c09413eef@mail.gmail.com>
In-Reply-To: <19c1b8a90910271258kb65e4b3wf62fb79c09413eef@mail.gmail.com>
X-OriginalArrivalTime: 28 Oct 2009 08:42:35.0859 (UTC)
	FILETIME=[9920A230:01CA57AA]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@DResearch.DE
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] glibc_2.9: disable parallel make
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
X-List-Received-Date: Wed, 28 Oct 2009 08:41:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Khem Raj wrote:
>>> Parallel make for glibc_2.9.bb fails on different multi-cpu build hosts
>>> (e.g. AMD Phenom(tm) 9150e Quad-Core Processor running openSUSE 11.1)
>>> with various errors. :(
> 
> I would suggest to refrain from applying this patch as it affects
> people who do not suffer from this problem
> and compile time for glibc is quite huge that everyone will feel the
> pinch. I would still urge to
> debug the real problem and fix it. May be there is something wrong
> with the OS on the box or even in the
> parallel build mechanism of glibc.  Or if there is a way to say 'only
> disable parallel build when build machine is
> "AMD Phenom(tm) 9150e Quad-Core Processor running openSUSE 11.1" would
> be ok too.

I agree. As long as nobody else has this problem i'll not push this patch.

>> BTW: It is the first time i proposed a patch this way and i expected
>> to see it in the patchwork queue but it doesn't. :(

Any idea why this ptach suggestion is not visible in the patchwork queue?

Steffen




