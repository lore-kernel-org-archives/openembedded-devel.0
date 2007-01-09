Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.63)
	(envelope-from <Patrick.Ohly@gmx.de>) id 1H4N3k-0002ut-FI
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Jan 2007 20:55:00 +0100
Received: (qmail invoked by alias); 09 Jan 2007 19:53:14 -0000
Received: from c-134-225-158.d.dsl.de.ignite.net (EHLO ip6-localhost)
	[62.134.225.158]
	by mail.gmx.net (mp053) with SMTP; 09 Jan 2007 20:53:14 +0100
X-Authenticated: #489940
Received: from patrick by ip6-localhost with local (Exim 3.36 #1 (Debian))
	id 1H4N0O-0001cm-00; Tue, 09 Jan 2007 20:51:32 +0100
From: Patrick Ohly <Patrick.Ohly@gmx.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1168335725.6634.2.camel@localhost.localdomain>
References: <20061230051641.GA30225@hezmatt.org>
	<459786C7.70000@dominion.kabel.utwente.nl>
	<1168200264.15021.54.camel@ip6-localhost>
	<1662139633.20070107231632@gmail.com>
	<20070107220333.GC6625@hezmatt.org>
	<432beae0701071446p377665c8x810644467cf7f234@mail.gmail.com>
	<1168280937.4526.32.camel@ip6-localhost>
	<432beae0701081111n490d67e2oebcaf44f4fe45e04@mail.gmail.com>
	<1168290172.4526.66.camel@ip6-localhost>
	<45A2B3EA.2070502@dominion.kabel.utwente.nl>
	<432beae0701081353t4de8b66fh7d7d9b46971cb3b@mail.gmail.com>
	<1168335725.6634.2.camel@localhost.localdomain>
Date: Tue, 09 Jan 2007 20:51:32 +0100
Message-Id: <1168372292.4166.30.camel@ip6-localhost>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.3 
Sender: Patrick Ohly <patrick@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: A question of workflow
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Jan 2007 19:55:00 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2007-01-09 at 09:42 +0000, Richard Purdie wrote:
> On Mon, 2007-01-08 at 13:53 -0800, Justin Patrin wrote:
> > On 1/8/07, Koen Kooi <koen@dominion.kabel.utwente.nl> wrote:
> > > So after every first commmit the tree is in a broken state, where-as if a developers
> > > applied a fixed patch in one go it wouldn't be. Sounds like your concept is badly broken.
> > 
> > Apply, commit (note brokenness if needed in commit message), then fix
> > it, commit, and push. Don't push before fixing.
> 
> The argument against this in other projects like the kernel is that you
> just broke the git-bisect method of debugging...

That's a valid point, although I am not sure whether the same argument
applies to monotone: an OE developer choosing the next pivot version
manually could be smarter than "git bisect" and always pick the version
which includes the fixes for the immediately preceeding patch
submission.

Anyway, it seems like there are contradicting criteria for what is
desirable when pushing patches, and the ones of the core OE developers
absolutely trump the ones from external contributors. It would have been
nice if there had been a solution which worked for both, but that seems
unlikely.

> I'm not a fan of broken patches being committed...

One last word: perhaps there is a middle ground where functionally
correct patches are applied as they are and then cosmetic changes like
fixing the formating or exchanging lines is applied on top of that.
Obviously, its entirely up to the OE developer importing the patch
whether he wants to do that.

-- 
Bye, Patrick Ohly
--  
Patrick.Ohly@gmx.de
http://www.estamos.de/


