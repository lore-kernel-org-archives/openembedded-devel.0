Received: from [87.193.137.78] (helo=mail.extern.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1N2RWy-0007ch-18
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Oct 2009 16:30:51 +0100
Received: from consult.extern.dresearch.de (consult.extern.DResearch.DE
	[87.193.137.68])
	by mail.extern.dresearch.de (Postfix) with ESMTP id 2C0E316DE86
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Oct 2009 16:29:45 +0100 (CET)
Received: from hiob.intern.dresearch.de (unknown [87.193.137.50])
	by consult.extern.dresearch.de (Postfix) with ESMTP id DFFF62A428B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Oct 2009 16:29:44 +0100 (CET)
Received: from [127.0.0.1] ([10.32.10.2]) by hiob.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Mon, 26 Oct 2009 16:31:51 +0100
Message-ID: <4AE5C03E.2040606@dresearch.de>
Date: Mon, 26 Oct 2009 16:29:02 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1256566659-32412-1-git-send-email-sledz@dresearch.de>
	<1256570428.9503.235.camel@hammer.suse.cz>
In-Reply-To: <1256570428.9503.235.camel@hammer.suse.cz>
X-OriginalArrivalTime: 26 Oct 2009 15:31:51.0578 (UTC)
	FILETIME=[70A67FA0:01CA5651]
X-SA-Exim-Connect-IP: 87.193.137.78
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
X-List-Received-Date: Mon, 26 Oct 2009 15:30:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Stanislav Brabec wrote:
> Steffen Sledz wrote:
>> Parallel make for glibc_2.9.bb fails on different multi-cpu build hosts
>> (e.g. AMD Phenom(tm) 9150e Quad-Core Processor running openSUSE 11.1)
>> with various errors. :(
> 
> It would make bootstrap longer on multi-CPU machines. :-(

Yes, i know. But i found no other solution for it. :(

> I never seen such failure with PARALLEL_MAKE = "-j 8" and
> BB_NUMBER_THREADS = "8", 8x Xeon, at least with glibc-2.9-r35.2 and not
> before 4249269b.
> 
> Does it happen in the same directory every time? Is there any common
> error or missing library?

Sorry, no.

See thread
<http://thread.gmane.org/gmane.comp.handhelds.openembedded/26781>

Steffen




