Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1N2RO5-000238-67
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Oct 2009 16:21:40 +0100
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 3586514171A0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Oct 2009 16:17:05 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lSrOJ8R7YHQA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Oct 2009 16:17:05 +0100 (CET)
Received: from [10.20.1.86] (nat.scz.novell.com [213.151.88.252])
	by ns.penguin.cz (Postfix) with ESMTP id D17211417193
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Oct 2009 16:17:00 +0100 (CET)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1256566659-32412-1-git-send-email-sledz@dresearch.de>
References: <1256566659-32412-1-git-send-email-sledz@dresearch.de>
Date: Mon, 26 Oct 2009 16:20:28 +0100
Message-Id: <1256570428.9503.235.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.0 
X-SA-Exim-Connect-IP: 84.21.108.25
X-SA-Exim-Mail-From: utx@penguin.cz
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
X-List-Received-Date: Mon, 26 Oct 2009 15:21:40 -0000
Content-Type: text/plain; charset="ISO-8859-2"
Content-Transfer-Encoding: 7bit

Steffen Sledz wrote:
> Parallel make for glibc_2.9.bb fails on different multi-cpu build hosts
> (e.g. AMD Phenom(tm) 9150e Quad-Core Processor running openSUSE 11.1)
> with various errors. :(

It would make bootstrap longer on multi-CPU machines. :-(

I never seen such failure with PARALLEL_MAKE = "-j 8" and
BB_NUMBER_THREADS = "8", 8x Xeon, at least with glibc-2.9-r35.2 and not
before 4249269b.

Does it happen in the same directory every time? Is there any common
error or missing library?

-- 
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



