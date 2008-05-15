Received: from [68.230.241.43] (helo=fed1rmmtao103.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1JwiNZ-00065R-IP
	for openembedded-devel@openembedded.org; Thu, 15 May 2008 20:43:09 +0200
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao103.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20080515183851.DCIJ45.fed1rmmtao103.cox.net@fed1rmimpo03.cox.net>
	for <openembedded-devel@openembedded.org>;
	Thu, 15 May 2008 14:38:51 -0400
Received: from opus ([68.230.59.19]) by fed1rmimpo03.cox.net with bizsmtp
	id Ruep1Z00d0QtwrG04uepSJ; Thu, 15 May 2008 14:38:51 -0400
Date: Thu, 15 May 2008 11:38:49 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20080515183849.GA8281@smtp.west.cox.net>
References: <c384c5ea0805141436m9f5151dje832c2da95379127@mail.gmail.com>
	<1210869726.7097.93.camel@localhost.localdomain>
MIME-Version: 1.0
In-Reply-To: <1210869726.7097.93.camel@localhost.localdomain>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.13 (2006-08-11)
Subject: Re: [RFC] Stop on multiple providers but none explicitly	specified
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
X-List-Received-Date: Thu, 15 May 2008 18:44:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 15, 2008 at 05:42:06PM +0100, Richard Purdie wrote:
> On Wed, 2008-05-14 at 23:36 +0200, Leon Woestenberg wrote:
> > Hello all,
> > 
> > in trying to explain a new user why his build fails, it was the
> > classic situation of multiple providers available but non specified:
> > 
> > NOTE: multiple providers are available for virtual/libc
> > (external-toolchain, uclibc);
> > NOTE: consider defining PREFERRED_PROVIDER_virtual/libc
> > 
> > Now, as far as I know, this makes the build non-deterministic, because
> > bitbake "just" chooses one.
> > 
> > Why do we want this behaviour? I cannot see any benefit in this situation.
> > 
> > We should at least prefer one over the other, or just bail out in my opinion.
> 
> Bitbake will pick one, the options in brackets are in the order bitbake
> will choose them. We sort them alphabetically iirc since that is more
> deterministic than depending on parsing order which was the previous
> approach.

There's still a problem here.  I've sometimes seen external-toolchain
picked for one thing I've forgotten when setting up for uclibc.  Having
the build just fail here would be nice.

-- 
Tom Rini


