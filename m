Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.63)
	(envelope-from <Patrick.Ohly@gmx.de>) id 1H4N3j-0002uo-Pm
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Jan 2007 20:54:59 +0100
Received: (qmail invoked by alias); 09 Jan 2007 19:53:08 -0000
Received: from c-134-225-158.d.dsl.de.ignite.net (EHLO ip6-localhost)
	[62.134.225.158]
	by mail.gmx.net (mp046) with SMTP; 09 Jan 2007 20:53:08 +0100
X-Authenticated: #489940
Received: from patrick by ip6-localhost with local (Exim 3.36 #1 (Debian))
	id 1H4MoP-0001bY-00; Tue, 09 Jan 2007 20:39:09 +0100
From: Patrick Ohly <Patrick.Ohly@gmx.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <eo039k$pe7$1@sea.gmane.org>
References: <20061230051641.GA30225@hezmatt.org>
	<1167506369.5626.46.camel@localhost.localdomain>
	<20061230214326.GE15188@hezmatt.org>
	<4596E33D.306@dominion.kabel.utwente.nl>
	<20061230235938.GC16490@hezmatt.org>
	<1167523571.5626.59.camel@localhost.localdomain>
	<459786C7.70000@dominion.kabel.utwente.nl>
	<1168200264.15021.54.camel@ip6-localhost>
	<1662139633.20070107231632@gmail.com>	<20070107220333.GC6625@hezmatt.org>
	<ens65m$i2b$1@sea.gmane.org> <1168279741.4526.12.camel@ip6-localhost>
	<eo039k$pe7$1@sea.gmane.org>
Date: Tue, 09 Jan 2007 20:39:09 +0100
Message-Id: <1168371549.4166.17.camel@ip6-localhost>
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
X-List-Received-Date: Tue, 09 Jan 2007 19:54:59 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2007-01-09 at 13:54 +0100, Rolf Leggewie wrote:
> Patrick Ohly wrote:
> >       * you have to keep track of which patches have been applied, and
> >         you cannot let tools do it for you
> 
> Did you mean you wanted to know which of your patches have been applied 
> in OE?

That's indeed what I meant. Just like quilt, patcher also keeps track of
which patches are currently applied locally.

>   That one is also easy.  They are the ones that quilt cannot 
> apply anymore when doing "quilt push -a" ;-)

Not necessarily. The patch might also fail to apply because unrelated
changes were made upstream, so the external contributor always has to
check these conflicts manually.

On Tue, 2007-01-09 at 13:51 +0100, Rolf Leggewie wrote: 
> >       * you cannot easily(*) find out how your patch was modified after
> >         you submitted it; this implies that learning how to write better
> >         patches requires extra effort and thus becomes harder (more
> >         unlikely?) and that mistakes made by the core developer when
> >         merging the patch might not be detected by the external
> >         developer (hey, it might happen, so for the sake of the argument
> >         bear we me when I mention it ;-)
> 
> This one is a little bit more work but still doable.

Of course, and if there is no better solution I don't mind doing it. But
that doesn't mean that one shouldn't at least search for a better
solution. Too bad there doesn't seem to be any :-/

-- 
Bye, Patrick Ohly
--  
Patrick.Ohly@gmx.de
http://www.estamos.de/


