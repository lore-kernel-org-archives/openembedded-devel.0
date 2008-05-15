Received: from [68.230.241.40] (helo=fed1rmmtao106.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1JwjpN-0004F8-4u
	for openembedded-devel@openembedded.org; Thu, 15 May 2008 22:13:25 +0200
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao106.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20080515201138.DLKH28729.fed1rmmtao106.cox.net@fed1rmimpo03.cox.net>
	for <openembedded-devel@openembedded.org>;
	Thu, 15 May 2008 16:11:38 -0400
Received: from opus ([68.230.59.19]) by fed1rmimpo03.cox.net with bizsmtp
	id RwBe1Z00S0QtwrG04wBeri; Thu, 15 May 2008 16:11:38 -0400
Date: Thu, 15 May 2008 13:11:38 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20080515201138.GB8281@smtp.west.cox.net>
References: <c384c5ea0805141436m9f5151dje832c2da95379127@mail.gmail.com>
	<1210869726.7097.93.camel@localhost.localdomain>
	<c384c5ea0805151151v35e28a99i2ccb39157d5d47f6@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <c384c5ea0805151151v35e28a99i2ccb39157d5d47f6@mail.gmail.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.13 (2006-08-11)
Subject: Re: [RFC] Stop on multiple providers but none explicitly specified
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Thu, 15 May 2008 20:13:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 15, 2008 at 08:51:29PM +0200, Leon Woestenberg wrote:

> However, is it intuitive from the *user's* point-of-view to have
> BitBake make this decision?
> I think not; at least in the case of OpenEmbedded, there is at least a
> 50% chance this is not what the user intended.
> 
> 1) Besides fixing this in BitBake (by bailing out, my first proposal),
> 2) an alternative solution is to set the preferred provider for the
> toolchain/libc elements to a built..
> a) ..in each distro file
> b) ..globally where we can build the toolchain/libc elements in
> OpenEmbedded for the target.
> 
> I think 2a)  is not the way OpenEmbedded should work. The distro is
> not the authorative component that decides whether we can build a
> toolchain/libc for each target (like Angstrom does now).
> 
> Shouldn't we do (2b), where the distribution can *optionally* override
> the preferred provider if it knows better?

How do we know what's right?  Since in many cases it's glibc OR uclibc
OR external-toolchain, there is no right default there.  If we just bail
out here..
- Distro maintainers know what's right for their distro and lock things
  down (or know the complex table of their correct answers, and lock
  down).
- End users never see this unless the distro isn't up to date, and ping
  the distro maintainer.
- Custom folks get a build that bails out, with a good reason and they
  pick what they know they need here.

-- 
Tom Rini


