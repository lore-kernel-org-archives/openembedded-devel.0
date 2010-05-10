Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@dresearch.de>) id 1OBP98-0004rj-Uh
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 May 2010 11:19:31 +0200
Received: from exchange.intern.dresearch.de (unknown [192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 01C1C491284
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 May 2010 11:15:41 +0200 (CEST)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.4675); Mon, 10 May 2010 11:16:55 +0200
Message-ID: <4BE7CEC0.1090300@dresearch.de>
Date: Mon, 10 May 2010 11:15:44 +0200
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.1.9) Gecko/20100317 Lightning/1.0b1 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4BE13C20.1010902@dresearch.de>	<20100505094242.GF2444@xora-desktop.xora.org.uk>	<4BE141CA.30904@dresearch.de>
	<1273053926.18119.331.camel@mill.internal.reciva.com>
In-Reply-To: <1273053926.18119.331.camel@mill.internal.reciva.com>
X-OriginalArrivalTime: 10 May 2010 09:16:55.0386 (UTC)
	FILETIME=[88D703A0:01CAF021]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@dresearch.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: linux vs. linux-libc-headers?
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
X-List-Received-Date: Mon, 10 May 2010 09:19:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Am 05.05.2010 12:05, Phil Blundell wrote:
>>> I thought glibc was supposed to gracefully fall back on missing syscalls?
>>
>> May be, but not satisfactorily.
>>
>> E.g. we've seen that g_file_monitor (from glib) falls back to
>> polling each second instead of using inotify_init.
> 
> That sounds like it's just a bug in glibc.  I guess you should fix it
> there.

That's all very unsatisfyingly.

I had a small look into the glibc sources. I could find the
declarations for inotfiy_init1 and epoll_create1, but i could not
find any fallback code if they do not exist in the running kernel.

I also could not find something about such fallback code at all.
FAQ 3.21 describes the problem what we have but for very old
kernel versions (2.0 vs. 2.1/2.2) and it says nothing about
glibc internal fallback handling but:

"Your program should check at runtime whether the function works,
and implement a fallback."

So where did this assumption come from?

Do you have examples for such fallbacks inside glibc?

Regards,
Steffen



