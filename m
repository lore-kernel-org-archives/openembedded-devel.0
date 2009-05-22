Received: from [216.145.245.199] (helo=mx03.dls.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1M7IYR-0006RW-Va
	for openembedded-devel@openembedded.org; Fri, 22 May 2009 02:24:08 +0200
Received: from [209.242.7.134] (helo=[192.168.231.111])
	by mx03.dls.net with esmtpa (Exim 4.69)
	(envelope-from <mwester@dls.net>)
	id 1M7IR3-0007uh-Dt; Thu, 21 May 2009 19:16:29 -0500
Message-ID: <4A15EED8.7040709@dls.net>
Date: Thu, 21 May 2009 19:16:24 -0500
From: "Mike Westerhof (mwester)" <mwester@dls.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.21) Gecko/20090302 Thunderbird/2.0.0.21 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: Leon Woestenberg <leon.woestenberg@gmail.com>, 
	openembedded-devel <openembedded-devel@openembedded.org>
References: <c384c5ea0905211455i5ba72709jc0b985cf097e9e3f@mail.gmail.com>
In-Reply-To: <c384c5ea0905211455i5ba72709jc0b985cf097e9e3f@mail.gmail.com>
Subject: Re: madwifi: Aggressive revert of my aggresive fix :-)
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
X-List-Received-Date: Fri, 22 May 2009 00:24:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Leon Woestenberg wrote:
> Hello Mike,
> 
> I tried to fix the GNU_HASH issue in madwifi by leaking LDFLAGS into
> the build, and respecting those flags in some Makefiles.
> 
> http://cgit.openembedded.net/cgit.cgi?url=openembedded/commit/&id=f67b2104dafeda09571259ba4c3e6019d8a0888b
> 
> hat apparently broke something for you, so you unset LDFLAGS again:
> 
> http://cgit.openembedded.net/cgit.cgi?url=openembedded/commit/&id=75d4826c3c0f7012ccee3a7116d7350f41539fa3
> 
> 
> The tools for example, need them. Someone just ran into that problem,
> that I (agressively) fixed before:
> 
> [23:16]	<tharvey>	pb_, madwifi includes some userland tools - its
> those that fail the GNU_HASH based on ldflags that I'm trying to fix
> 
> So let's work towards a fix that works for both of us:
> 
> - The right fix is to leak LDFLAGS into the build from the recipe, but
> unset them *only* where needed.
> - Please revert your commit (i.e. unsetting LDFLAGS) and see which
> part of madwifi needs LDFLAGS unset.
> 
> We will probably end up with a fix to one or two of the Makefiles instead.

So, you want _me_ to revert _my_ fix (after it was broken by someone
else), and then spend my time sorting through the maze of Makefile
madness from the madwifi-ng organization to make a patch to the Makefile
-- so that I can get back to the state I was in originally?

Respectfully, the answer is no.

I do not have time right now to do that.

Further, the root cause of this issue is a far earlier change, which is
the one that makes the GNU hash warning a failure -- prior to that
change, this package was working for everyone.

Further, if you examine the commit I made, you'll note that the changes
are made to a single, solitary BB file -- and here's an excerpt from
that BB file:

DEFAULT_PREFERENCE = "-1"
DEFAULT_PREFERENCE_slugos = "1"

So the particular recipe in question is clearly intended for ixp4xx (and
not even all ixp4xx machines, only the one distro to which I had access
to test).

Further, the madwifi-ng driver is not only an out-of-kernel device
driver, but it also contains a number of binary blobs that are
pre-compiled for specific architectures, with specific linker options on
the pre-compiled blobs.  This makes this package unusually
machine-specific, compared to the typical OE package.

So I would suggest that for this package we should take the path of
least resistance and simply have recipes based on the set of machines
committers can test on.  I can only test on SlugOS on ixp4xx.  Since it
was broken by the LDFLAGS commit, I have to assume that others can only
test on their machines.  Hence it's foolish for this package to waste
time trying to patch the moving target that is the madwifi-ng makefiles.

If someone else wants _that_ particular version of the madwifi drivers,
that's fine -- just copy that recipe, as-is, to the next SVN version
number, remove the DEFAULT_PREFERENCE_slugos line from the original one,
and revert my changes to the original one -- I can find time to do that,
if you wish.

On the other hand, if the powers-that-be insist that there can be only a
single recipe that must be good for everyone, well, then I regret that I
do not have time right now to create such a thing.  Nor do I have other
atheros-based machines with which to test.  But rather than revert my
commit, I suggest that we go back to the commit that originally broke it
-- the GNU hash commit.  Or at the very least, the commit that followed
that change, the one that committed the LDFLAGS stuff preceding my
commit.  To point at my final commit in the chain and say that it is the
one at fault, and therefore is the one that should have been done
differently, is simply not correct logic in this situation.

Regards,
Mike (mwester)


