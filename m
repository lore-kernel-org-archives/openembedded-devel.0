Received: from [68.230.241.39] (helo=fed1rmmtao107.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1KNt4E-0000gB-Cn
	for openembedded-devel@openembedded.org; Tue, 29 Jul 2008 19:32:58 +0200
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao107.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20080729173116.DKHC29505.fed1rmmtao107.cox.net@fed1rmimpo03.cox.net>
	for <openembedded-devel@openembedded.org>;
	Tue, 29 Jul 2008 13:31:16 -0400
Received: from localhost ([68.230.56.208]) by fed1rmimpo03.cox.net with bizsmtp
	id vtXH1Z00F4VZ64s04tXHYE; Tue, 29 Jul 2008 13:31:17 -0400
Date: Tue, 29 Jul 2008 10:31:17 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20080729173117.GD2795@smtp.west.cox.net>
References: <1217340989.5482.10.camel@dax.rpnet.com>
	<g6naum$ure$1@ger.gmane.org>
	<87abg0ej9q.fsf@neumann.lab.ossystems.com.br>
	<20080729170055.GC2795@smtp.west.cox.net>
	<87r69cbo8g.fsf@neumann.lab.ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <87r69cbo8g.fsf@neumann.lab.ossystems.com.br>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.13 (2006-08-11)
Subject: Re: Git Migration Status
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Tue, 29 Jul 2008 17:32:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 29, 2008 at 02:21:19PM -0300, Otavio Salvador wrote:
> Tom Rini <trini@kernel.crashing.org> writes:
> 
> > On Tue, Jul 29, 2008 at 01:40:17PM -0300, Otavio Salvador wrote:
> >> Rolf Leggewie <no2spam@nospam.arcornews.de> writes:
> >> 
> >> > Hi Richard,
> >> >
> >> > thank you for the update.
> >> >
> >> > Richard Purdie wrote:
> >> >> There is also the issue of commit ID naming. I'm tempted to propose we
> >> >> use commit IDs with a domain such as userid@developers.openembedded.org.
> >> >
> >> > I think something under openembedded.org is a good idea for several
> >> > reasons.  But how about userid@dev.openembedded.org?
> >> 
> >> I disagree. Using real mail address give a real view of who can be
> >> sponsoring work and using OE.  
> >
> > One of the big problems there is what happens when developer X stops
> > doing stuff for company Y?  Or does something on their own? Submission /
> > Signed-off/Ack'ed by, that's fine.  But for commit work I think it's
> > best that it's always the same and a can made functional email.
> 
> For maintainers, I think we could have a MAINTAINERS file as is
> available on Linux sources. This allows for a cannonical place for
> look at. 

I will say this will have just as many problems as keeping forwards for
userid@dev.oe.org up to date, at least.

> When someone stops to work for company Y the credit should still go to
> the sponsoring of the company since this doesn't changes who paid the
> work.

Right, but why is the sponsorship in the commitid, rather than the
commit log, etc?

> Besides that, forcing all commits to be done from a "cannonical mail
> domain" will enforce a difficult to follow policy and turn problematic
> the merging of ordinary trees with fixes.

I don't follow.  You can tell git "for this tree, use me@whatever".
IIRC, these things can even be rewritten when pulled in, if someone does
a drive-by bugfixing.

-- 
Tom Rini


