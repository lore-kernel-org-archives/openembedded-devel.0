Received: from [87.193.137.78] (helo=mail.extern.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1MqM9T-0004Kr-7N
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Sep 2009 09:20:38 +0200
Received: from consult.extern.dresearch.de (consult.extern.DResearch.DE
	[87.193.137.68])
	by mail.extern.dresearch.de (Postfix) with ESMTP id 39B5D16DE78
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Sep 2009 09:19:59 +0200 (CEST)
Received: from hiob.intern.dresearch.de (unknown [87.193.137.50])
	by consult.extern.dresearch.de (Postfix) with ESMTP id EDF132A429F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Sep 2009 09:19:58 +0200 (CEST)
Received: from [127.0.0.1] ([10.32.10.2]) by hiob.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Wed, 23 Sep 2009 09:20:53 +0200
Message-ID: <4AB9CC08.9060108@dresearch.de>
Date: Wed, 23 Sep 2009 09:19:36 +0200
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4AB8CF91.1070907@dresearch.de>
	<f96d234e0909221128v65e7f834wc1687fe5fdf5136b@mail.gmail.com>
In-Reply-To: <f96d234e0909221128v65e7f834wc1687fe5fdf5136b@mail.gmail.com>
X-OriginalArrivalTime: 23 Sep 2009 07:20:53.0625 (UTC)
	FILETIME=[62B5D690:01CA3C1E]
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
X-List-Received-Date: Wed, 23 Sep 2009 07:20:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Cliff Brake schrieb:
>> Since a few days i see this crazy behavior. Sometimes bitbake
>> freezes (everytime at the same stages if it freezes) when building
>> a target (e.g. with "bitbake drapptempl"). top tells me that a
>> "make all" process is running and consuming all resources of one cpu.
> 
> I had an issue recently where opkg was prompting the user to overwrite
> a file in the rootfs phase.  I would ctrl-C bitbake when it appeared
> to be hung, but soon learned there were additional bitbake processes
> still running.  When I ran killall bitbake, the error message showed
> up.  You might find something by running bitbake with -DDDD.

I'm baking a single recipe. The freeze occurs in the do_compile stage.
So this seems to be another problem.

Steffen




