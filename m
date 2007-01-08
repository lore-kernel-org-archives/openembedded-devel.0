Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.63)
	(envelope-from <Patrick.Ohly@gmx.de>) id 1H3zAr-00047o-1V
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Jan 2007 19:24:45 +0100
Received: (qmail invoked by alias); 08 Jan 2007 18:23:05 -0000
Received: from c-134-230-227.f.dsl.de.ignite.net (EHLO ip6-localhost)
	[62.134.230.227]
	by mail.gmx.net (mp001) with SMTP; 08 Jan 2007 19:23:05 +0100
X-Authenticated: #489940
Received: from patrick by ip6-localhost with local (Exim 3.36 #1 (Debian))
	id 1H3yve-0001Ro-00; Mon, 08 Jan 2007 19:09:02 +0100
From: Patrick Ohly <Patrick.Ohly@gmx.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <ens65m$i2b$1@sea.gmane.org>
References: <20061230051641.GA30225@hezmatt.org>
	<1167506369.5626.46.camel@localhost.localdomain>
	<20061230214326.GE15188@hezmatt.org>
	<4596E33D.306@dominion.kabel.utwente.nl>
	<20061230235938.GC16490@hezmatt.org>
	<1167523571.5626.59.camel@localhost.localdomain>
	<459786C7.70000@dominion.kabel.utwente.nl>
	<1168200264.15021.54.camel@ip6-localhost>
	<1662139633.20070107231632@gmail.com>
	<20070107220333.GC6625@hezmatt.org> <ens65m$i2b$1@sea.gmane.org>
Date: Mon, 08 Jan 2007 19:09:01 +0100
Message-Id: <1168279741.4526.12.camel@ip6-localhost>
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
X-List-Received-Date: Mon, 08 Jan 2007 18:24:45 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2007-01-08 at 02:18 +0100, Rolf Leggewie wrote:
> The way I handled this before having rw access was to use quilt and it 
> worked nicely for me.  Actually, I still use this for stuff I cannot be 
> sure to fix in one setting to commit right after.
> 
> Workflow (optimistically assuming no loops and pauses here)
> 
>   quilt new some.patch
>   quilt edit packages/somepackage/some.bb
>   quilt refresh
> 
> and then send the patch to the bug tracker.  Before updating monotone, I 
> back out all quilt patches (cron does this for me daily)
> 
>   quilt pop -a && mtn pull && mtn update && quilt push -a
> 
> Maybe this is workable for others as well?

I have done the same before, the only difference was that I used Holger
Schurig's "patcher". The method has some drawbacks:
      * you have to keep track of which patches have been applied, and
        you cannot let tools do it for you
      * you cannot easily(*) find out how your patch was modified after
        you submitted it; this implies that learning how to write better
        patches requires extra effort and thus becomes harder (more
        unlikely?) and that mistakes made by the core developer when
        merging the patch might not be detected by the external
        developer (hey, it might happen, so for the sake of the argument
        bear we me when I mention it ;-)

(*) Instead of one working copy of the sources you would need two, the
upstream version and the last version which you patched yourself. It's
just not the same as having that information in the revision control
system.

-- 
Bye, Patrick Ohly
--  
Patrick.Ohly@gmx.de
http://www.estamos.de/


