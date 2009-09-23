Received: from [87.193.137.78] (helo=mail.extern.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1MqMLi-0001lK-Ap
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Sep 2009 09:33:17 +0200
Received: from consult.extern.dresearch.de (consult.extern.DResearch.DE
	[87.193.137.68])
	by mail.extern.dresearch.de (Postfix) with ESMTP id A39BF16DE78
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Sep 2009 09:32:38 +0200 (CEST)
Received: from hiob.intern.dresearch.de (unknown [87.193.137.50])
	by consult.extern.dresearch.de (Postfix) with ESMTP id 61C1A2A429F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Sep 2009 09:32:38 +0200 (CEST)
Received: from [127.0.0.1] ([10.32.10.2]) by hiob.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Wed, 23 Sep 2009 09:33:33 +0200
Message-ID: <4AB9CF00.1070505@dresearch.de>
Date: Wed, 23 Sep 2009 09:32:16 +0200
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4AB8CF91.1070907@dresearch.de>
	<19c1b8a90909221051x775eb576qb0813e26bdca7c09@mail.gmail.com>
In-Reply-To: <19c1b8a90909221051x775eb576qb0813e26bdca7c09@mail.gmail.com>
X-OriginalArrivalTime: 23 Sep 2009 07:33:33.0187 (UTC)
	FILETIME=[2771CD30:01CA3C20]
X-SA-Exim-Connect-IP: 87.193.137.78
X-SA-Exim-Mail-From: sledz@DResearch.DE
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: bitbake freeze :(
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
X-List-Received-Date: Wed, 23 Sep 2009 07:33:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Khem Raj wrote:
> you could try couple of things. Firstly try to isolate if its a
> bitbake problem or not
> likely its not but still make sure. You can go into the workdir and
> run the task script
> run.do_<task> whatever it is stuck at. If it succeeeds then you know
> its a problem with
> bitbake if not then the build mechanism for this particular package
> has problem. You might
> try to disable parallel build i.e. use -j 1 to make sure that its not
> some parallel build
> issue.

I made some tests on this.

First result was that if calling

 > bitbake drapptempl -c clean
 > bitbake drapptempl
 Ctrl-C
 > bitbake drapptempl

the first build request freezes in do_compile stage, the second one 
succeeds (seen in 5 of 5 test runs). Also calling run.do_compile
succeeds everytime if tried after the first freeze.

After that i checked the parallel build options in my local.conf.
The tests above were made with

 PARALLEL_MAKE = "-j 4"
 BB_NUMBER_THREADS = "4"

I tried to set the BB_NUMBER_THREADS to 1 but the problem was still
existing.

After that i tried to set the PARALLEL_MAKE to "-j 1" and no the
recipe was build fine.  :)

So it seems that there is a problem with parallel make. But it only
occurs in a few of our recipes. Therefor i believe that there must be
something special in there makefiles/recipes.

After a detailed inspection i noted that they all depend on a library
which uses glib (incl. some tools like gob2). The library itself does
not have the build problems. But could the problem result from this?

Steffen




