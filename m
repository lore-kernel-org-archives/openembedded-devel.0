Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Nmud9-0000gs-W8
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Mar 2010 20:53:16 +0100
Received: by gyd5 with SMTP id 5so723923gyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Mar 2010 11:50:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=E375HdTuUVnGZT3JnE66fVJZNmyKXjo8YSblSbc8haY=;
	b=PzlW9Rr0hat32GruE/42tTBULOHYheHdPoD/LXoiP1xnedPMNQ6ydcL4adCRN6Zsvx
	cSr5kgVLA43AwI9xNOXeibGPPPcwCWHzNdrfj99iXmcfQbwlBX/Wo4qY5dxJuhnbZhB0
	qNCW0iVjiotwI3AUoj8THp376jwGpd9qxADCI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Ri9QJlFF1aukSuWRYnFxLcKGf3Qmssq8aAzct5GYJPYQeYYeEOQPFfZVZ50kOx62+n
	1O8zZwQk2yR1D0Vqoa7ppSxgTeBuTm6A1TosH9abrEzLcKGfl0rruU1xGvxpjcBKq4aw
	g24DkTMxCzA9gnm+PAqtWgpOmZG+JyrRB9Zfw=
MIME-Version: 1.0
Received: by 10.101.206.1 with SMTP id i1mr3023143anq.80.1267645823769; Wed, 
	03 Mar 2010 11:50:23 -0800 (PST)
In-Reply-To: <b6ebd0a51003031028q1b948bb4y2e40d734252f0fb6@mail.gmail.com>
References: <b6ebd0a51003030909u58f72751u19f5b3caab614450@mail.gmail.com>
	<1267638229.2259.147.camel@rex>
	<b6ebd0a51003031028q1b948bb4y2e40d734252f0fb6@mail.gmail.com>
Date: Wed, 3 Mar 2010 20:50:23 +0100
Message-ID: <ac9c93b11003031150x39cebeb7i92454d98c627f8c0@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] Initial Proposal for Packaged Staging Revamp (was [RFC] Make some big changes right after next stable)
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
X-List-Received-Date: Wed, 03 Mar 2010 19:53:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

Tom: +1 for the initiative

Having had my share of trouble with packaged staging and as a result
from that having fixed a bug or what, I do welcome the idea of
improving it.

Wrt to the ideas & discussion above:
I consider the output from do-install as being the most important.
That is the deliverable of the package. Staging intermediate steps to
me seems less useful.
However if it is decided to do that, please consider making it
optional. I don't think I appreciate having staged packages with all
the intermediate object files.
Also if something changes typically all of the package needs to be
rebuild. E.g. if a provider changes it could be that configure gives a
different result, so there is no point in keeping that.

Wrt the stamps: I think the current stamps are useful when it comes to
deciding what is build and what has to be rebuild (e.g. if do_compile
fails).
For packaged staging it would be nice if one could also put them on a
feed so others could build prebuild packages (if they desire).
(this could also be internal in e.g. a company).
The current time-based stamps are not too handy here as they might
cause problems due to clock skew between systems and people mixing up
local time and GMT etc.

Instead of the current stamps a signature could be better.
A very simplistic proposal would be to use the chain of the child
signatures followed by the PR of the package (only the digit part, not
the r)
Basically in the end this delivers a sequence of all PR values of all
underlying recipes. If an underlying recipe is bumped the signature
generated while parsing does not match any more and dependent packages
need to be rebuild.

Unfortunately things are probably not that simple. We might need to
decide on ordering of packaged (the way they appear in DEPENDS?
Alphabetically by package name?
Also I can imagine that signatures (especially for images become very long).
We might be able to use a hash function to reduce the size of the
signatures and only store the hash.

What I am not sure of is whether it is desirable to build a package
that you do not want to be staged (or not yet).
One of the issues I am facing every once in a while is that I modified
a recipe, bumped PR, but in the end the change turns out not to be
good and I want to revert my work.
Guess it might be nice to be able to inhibit the staging of recipes
that are not yet commited (maybe user configable in e.g. local.conf)

BTW in the past I've been pondering about another scenario: give each
package its own subdir in staging and control which packages are
actually used through -I and -L flags.
That would avoid that one has to unpack a lot of packages.
(I'm assuming that we want to start with an empty staging when a build
starts; and that it is being popluated as needed; otherwise you can
still inadvertedly pick up remains from another package, but I am
fearing the performance penalty; I can imagine that it makes sense to
have some core packages always present (e.g. libc).

Thinking of it, do we also want to apply this for native, or should we
assume that native always contains all native packages (so implictly
making all recipes depend on all -native recipes).
After all native is the build environment.

guess there are plenty of things I overlooked and forgot. I'll add if
new things pop up.

Frans

PS: if desired I am willing to contribute, but note that my pythonese
is marginal.


