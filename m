Received: from dgate20.ts.fujitsu.com ([80.70.172.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Rainer.Koenig@ts.fujitsu.com>) id 1RVmVo-0000hj-J0
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Nov 2011 16:55:58 +0100
DomainKey-Signature: s=s1536a; d=ts.fujitsu.com; c=nofws; q=dns;
	h=X-SBRSScore:X-IronPort-AV:Received:X-IronPort-AV:
	Received:Message-ID:Date:From:User-Agent:MIME-Version:To:
	Subject:References:In-Reply-To:Content-Type:
	Content-Transfer-Encoding;
	b=D/zJ8YM8j9ddNUsCgLUs+CEb7K0wItyCIornFjN/eRQFjAT6tDi+j/6Q
	AdyWO+EmIGI+sg2qtr4CUyK71g4g5GbXyzeyymqvzYMOVB+IkJrSBSbpa
	0VWkNTxOhgdtlQZ/vua4nRKzoOiZdPNyke9+TmgVj3JxUScVcW4h+pjFF
	wMNgE1bwWDcBq8dRm2fwBq+MkJEns2nhpmXCVUX3XzvtZdwLAlEt19Qhd
	XEpVWahAYb5a0tEofZQTXYZAJfwL6;
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=ts.fujitsu.com; i=Rainer.Koenig@ts.fujitsu.com;
	q=dns/txt; s=s1536b; t=1322668159; x=1354204159;
	h=message-id:date:from:mime-version:to:subject:references:
	in-reply-to:content-transfer-encoding;
	bh=pqpfxDOAVZn68kA/oRnKcZHjZovdzPCzlNe5TlFPR2M=;
	b=V/5dbm3tauMB0K2NR2HgFdJ0pQzdiUdSnSR0tmMEmIwr4YRUjdZoR25C
	OXinWRo8U4AMnBCPMUX84egi00PHDrK3cy/hz73q79q9tODoi5Aw/+zzO
	ym9pjmlGZy5EViuSZCV0cb1XYwFryFjOWapr00a8MncTp9xiYpSiNs5uw
	6Kg/8ITs0b1gnJqmjv2IlJjVRSLOU2TIluuNq92iT5lAojuo2MO26Eecu
	XqMUE4832SBwEETv7LjfKx3kkYAYT;
X-SBRSScore: None
X-IronPort-AV: E=Sophos;i="4.69,597,1315173600"; d="scan'208";a="80262121"
Received: from abgdgate30u.abg.fsc.net ([172.25.138.66])
	by dgate20u.abg.fsc.net with ESMTP; 30 Nov 2011 16:49:18 +0100
X-IronPort-AV: E=Sophos;i="4.69,597,1315173600"; d="scan'208";a="124096080"
Received: from abgvpn272v.abg.fsc.net (HELO [172.26.149.18]) ([172.26.149.18])
	by abgdgate30u.abg.fsc.net with ESMTP; 30 Nov 2011 16:49:17 +0100
Message-ID: <4ED6507D.4090007@ts.fujitsu.com>
Date: Wed, 30 Nov 2011 16:49:17 +0100
From: Rainer Koenig <Rainer.Koenig@ts.fujitsu.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.24) Gecko/20111120 Icedove/3.1.16
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <CA+M6bX=PYZ+2vb32ZmT3SirqHdKpCtD90QqtHhQiWSp38f1kVA@mail.gmail.com>
In-Reply-To: <CA+M6bX=PYZ+2vb32ZmT3SirqHdKpCtD90QqtHhQiWSp38f1kVA@mail.gmail.com>
Subject: Re: Documentation problems
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
X-List-Received-Date: Wed, 30 Nov 2011 15:55:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Tom,

Am 27.11.2011 03:40, schrieb Tom Rini:
> As things stand today, the wiki is out of date and a number of folks
> refuse to work on it.  Using things like "It's all text!" for firefox
> only go so far and don't solve problems like people just avoiding
> documentation anyhow.

I've read the postings in this tread and got something between amused 
and angry. Hitting the embedded Linux world in April I'm still a 
newcomer to this and so I can share my impressions with you, telling how 
OpenEmbedded and other projects look to a new user.

I started with OE classic since this is where the main page in the wiki 
leads you to. Then I failed and learned about OE core, found the pages 
and tried again, still failing. I printed out the OE documentation to 
learrn, that many things that would be interesting are still as "ToDo" 
or "Fixit" and that the docs quite outdated.

During my attempts I found out, that certain versions of bitbake are 
showing errros on some recipes while other versions don't do. So I tried 
to read the Changelog of bitbake and saw, that the most recent entry was 
from 2009.

Then I tried to see if problems that I'm encountering are "known issues" 
so that I can find it in bugzilla. And I learned that you gave up 
Bugzilla for tracking bugs on the mailing list. Ouch!!!

Meanwhile someone advised me to look at the Yocto project. The docs 
there looked prettier, even as they are just HTML pages. They also have 
a wiki and bugs are managed inside a Bugzilla.

I'm still reading the docs from both OE and Yocto, together they helped 
me to climb up the very steep learning curve.

The things that make me amused is when I read comments like

----8<-snip------------
And developers are not familiar with
MediaWiki or most of the time hate it to not be able to use their
favorite editor and to use a Web interface.
----8<-snip------------

or

----8<-snip---------
Just having to edit a text file in an editor and
commit this change is easier than working with a Web browser.
----8<-snip---------

Seriously guys, if you are a developer and you are able to understand 
the structure in OE and what bitbake does, then you should be able to 
understand the Wikimedia engine as well. And if you want to avoid a 
web-editor then copy/paste the stuff to your favorite editor and do it 
there. Complaining about the tool you need to use sounds like a lame 
excuse for an software engineer.

Of course, the Wikimedia engine offers advanced methods like categories 
to tag stuff but even that can be learned in short time. So I really 
doubt that the reason for not documenting is the Mediawiki engine.

The other problem that I see when trying to contribute: This morning I 
registered my account "rakoenig". Now, 7 hours later I'm still not able 
to edit anything and I have no idea how the process looks like to get 
write privileges. On the other hand, when I was doing the same in the 
Yocto wiki I was instantly able to write pages there.

Now for the bugtracking thing. Yes, I think, that bugtracking is part of 
a project documentation and I would like to be able to find a bug and 
see a status. When you handle bugs on a mailing list I'm forced to use 
to search the archives for that bug and then I might find a thread that 
then has a lose end like

--8<-snip------
Will look again tomorrow. Go to bed.
--8<-snip------

That was the latest info on a bug when building samba and so far nobody 
knows if this bug is solved or not.

The funny thing is that when I first asked why you changed bug tracking 
to do it with a mailing list I was adivsed do search in the archives for 
that discussion. Searching the archives revealed that a lot of bugs hit 
Bugzilla and nobody took care of them. So, from my external point of 
view the decision was "Bugzilla is actually a mess, so lets try 
something else like the mailing list for bugtracking".

And hey, here we go... this thread is here because the wiki is out of 
date and we need to do...what? Switching to a new tool to confuse even 
more users? Or get the things done that need to be done?

Just look at Yocto. From my point of view it looks much smarter because
they have a bugtracker and post even statistics of their bugs which 
gives me the impression that their concern is improving qualitiy of 
their recipes.

They have a good documentation that seems to get updated frequently, 
makes a good impression.

They seem to have a roadmap for the future and do planned work.

Compared to this OE (core) seems like a bunch of developers working on 
the bleeding edge of embedded Linux and don't document much because 
*they* understand what they are doing. Unfortunately a lot of (new) 
users don't understand it and would urgently need a good documentation.

Sorry for the maybe harsh words, but I really want to show you how OE 
looks to somebody approaching it. And of course I would like to help 
improving the docs, but for that OE needs a clear documentation policy 
and a process how to do and enforce that.

Best regards
Rainer
-- 



