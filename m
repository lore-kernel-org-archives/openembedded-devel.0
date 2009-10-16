Received: from [87.193.137.78] (helo=mail.extern.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1MyoBG-00077y-3z
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Oct 2009 16:53:26 +0200
Received: from consult.extern.dresearch.de (consult.extern.DResearch.DE
	[87.193.137.68])
	by mail.extern.dresearch.de (Postfix) with ESMTP id 82AA816DFDC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Oct 2009 16:52:27 +0200 (CEST)
Received: from hiob.intern.dresearch.de (unknown [87.193.137.50])
	by consult.extern.dresearch.de (Postfix) with ESMTP id 3B1312A4285
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Oct 2009 16:52:27 +0200 (CEST)
Received: from [127.0.0.1] ([10.32.10.2]) by hiob.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Fri, 16 Oct 2009 16:54:12 +0200
Message-ID: <4AD8888E.2080108@dresearch.de>
Date: Fri, 16 Oct 2009 16:51:58 +0200
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4AD59AF2.50003@dresearch.de>
	<4AD8531B.6070208@dresearch.de>	<4AD87CF8.8040706@dresearch.de>
	<1255704318.28050.19.camel@mill.internal.reciva.com>
In-Reply-To: <1255704318.28050.19.camel@mill.internal.reciva.com>
X-OriginalArrivalTime: 16 Oct 2009 14:54:12.0125 (UTC)
	FILETIME=[85C7D4D0:01CA4E70]
X-SA-Exim-Connect-IP: 87.193.137.78
X-SA-Exim-Mail-From: sledz@DResearch.DE
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: glibc_2.9 compile failed for armv5te
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
X-List-Received-Date: Fri, 16 Oct 2009 14:53:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Phil Blundell wrote:
> Putting it in glibc.inc definitely seems like a bad idea unless there is
> evidence to suggest that all versions of glibc have this problem.
> Nobody else has reported it previously, so I am guessing that either it
> is specific to 2.9 or it is in some way unique to your system.

I totally agree.

> Assuming that it is a general problem with 2.9 then a better solution
> would obviously be to find and fix the dependency problem.  Here's a
> rough guide as to how to attack that:
> 
> 1. Find the compile command that corresponds to the failing file
> (setjmp.os or whatever it was).  Modify the command to replace -c with
> -E and remove the "-o ..." option, then run it by hand.  This will
> output the preprocessed source to standard output.
> 
> 2. Inspect the preprocessed source to find out which symbol is not being
> correctly defined.
> 
> 3. Run a build without -j (so that it works) and then use grep to
> establish which header file is meant to define the symbol in question.

As you can see from the mails before the problem does not occur in the
same file each time. I've made some clean(!) builds and have seen at
least five different fails.  :(

Steffen




