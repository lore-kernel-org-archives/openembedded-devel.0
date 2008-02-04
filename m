Received: from [66.111.4.26] (helo=out2.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rod@whitby.id.au>) id 1JLyVE-0001SI-9L
	for openembedded-devel@openembedded.org; Mon, 04 Feb 2008 11:24:40 +0100
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by out1.messagingengine.com (Postfix) with ESMTP id BE1DF8F17B
	for <openembedded-devel@openembedded.org>;
	Mon,  4 Feb 2008 05:24:50 -0500 (EST)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute1.internal (MEProxy); Mon, 04 Feb 2008 05:24:50 -0500
X-Sasl-enc: JP9Dz8R+NrZEudjho/WKsR4QekiSDMMVcxATzTtdBGze 1202120690
Received: from [192.168.18.11] (CPE-121-209-21-249.sa.bigpond.net.au
	[121.209.21.249])
	by mail.messagingengine.com (Postfix) with ESMTP id E022942AE
	for <openembedded-devel@openembedded.org>;
	Mon,  4 Feb 2008 05:24:49 -0500 (EST)
Message-ID: <47A6E7E3.3030600@whitby.id.au>
Date: Mon, 04 Feb 2008 20:54:35 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.9 (Windows/20071031)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <1201823499.20311.26.camel@localhost.localdomain>	<20080203210353.438dffaf@cimmeria>	<47A6D3C2.10304@kernelconcepts.de>	<47A6D6E6.4030700@whitby.id.au>
	<47A6DF88.7010204@student.utwente.nl>
In-Reply-To: <47A6DF88.7010204@student.utwente.nl>
Subject: Re: Monotone issues
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
X-List-Received-Date: Mon, 04 Feb 2008 10:24:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> Rod Whitby schreef:
> |> Graeme Gregory schrieb:
> |>> Sounds like it is time for our regular re-assessment of the use
> |>> of monotone. Maybe we should start another round of testing other
> |>> SCM systems again.
> |
> | Let's just cut to the chase and discuss why we're not using git ...
> 
> 1) git couldn't import the flat-file OE tree, neither could cogito

I wonder if it can now ...

> 2) git 1.4 just threw away your local changes on what git calls a 'merge'

Different tool, different cheat-sheet to learn.  That's always to be
expected when changing tools.  Monotone merges are so bad that I flatly
refuse to even attempt a manual merge, preferring to blow away my whole
monotone repository and start again rather than try a monotone manual merge.

> 3) it has no sense of 'time' inside commits

Can you expand on this one?

> 4) it is lossy

See below.

> 5) it has no guarantee against man-in-the-middle or filesystem corruption.

That's an interesting one.  My understanding of git was that if you had
the same hash as someone else for the same tagged version, then you were
guaranteed to have the same filesystem contents.

> 6) You can't attach attributes (e.g. QA results) to revisions

Have we ever done that in OE?

> 7) You can't store empty directories in git (ask Holger about the pain)

Some might call that a good feature :-)  Do we use empty directories in OE?

> To expand on 5: Monotone uses rsa to ensure two things:
> 
> 1) the tree is uncorrupted (in the sense of bad disks)
> 2) the tree is trusted
> 
> With git you say 'my tree has 6767e' and I say 'my tree has 9090d' and
> we have no idea of what went wrong or where it went wrong, just that our
> trees don't match.

I would have thought you just compare git logs from the last tag to see
where they diverge.

> To expand on 4:
> 
> Git was designed to cater people that send each other patches over a
> mailinglist that rot for a few weeks till a new 'merge window' opens,
> the current tree is basically thrown away and you have to put your
> patches on top of a new release.

Hmm - on the linux kernel lists you mainly see pull requests these days.

In any case, can you describe why you think the tool is lossy, as
opposed to commenting on a specific linux kernel development workflow
(which doesn't need to be propagated exactly to OE) ?

> That is why we didn't use git in the past, things could be very
> different now.

I tried git a year ago, and had some frustrations.  I tried it again
last week, and had no frustrations.  Either it, or I, have got better at
doing things.

Then again, I have no problems with monotone these days either, cause my
Makefile does things repeatable and correctly for me ;-)  I just type
"make update" and go watch some TV while monotone does it's thing.  Then
I start development ...

-- Rod


