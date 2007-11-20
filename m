Received: from [209.242.20.84] (helo=green.dls.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mwester@dls.net>) id 1IuV7m-0002Oy-2B
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Nov 2007 16:34:54 +0100
Received: from twilight (gw.mwester.net [209.242.5.110])
	by green.dls.net (Postfix) with ESMTP id C95B341285A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Nov 2007 09:32:46 -0600 (CST)
Message-ID: <008f01c82b8a$89c8ab50$6e01a8c0@twilight>
From: "Mike \(mwester\)" <mwester@dls.net>
To: <openembedded-devel@lists.openembedded.org>
References: <20071119120819.GA17788@lenovo><C7148B94-6A92-42DE-BF35-75B409DAA8E7@selfish.org><4741FB41.7080602@trolltech.com>
	<1195551213.6337.9.camel@localhost.localdomain>
Date: Tue, 20 Nov 2007 09:32:18 -0600
MIME-Version: 1.0
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2800.1914
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2800.1914
Subject: Re: Getting Started -Makefile
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
X-List-Received-Date: Tue, 20 Nov 2007 15:34:54 -0000
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit


> From: "Richard Purdie" <rpurdie@rpsys.net>
>
> I think Holger's point and the general feeling of other OE devs, me
> included is that the current wave of makefiles hide too much. I had to
> solve this problem with Poky and I did it with a script you source which
> sets up a magic environment. I don't expect users to know/care about
> what the script does. I do want users to end up typing "bitbake xyz"
> though. Why?
>
> Users end up realising that everything is either an SCM command ("svn
> up" for Poky) or a bitbake one. Neither are complicated programs to
> learn. Yes monotone is more complex than svn but all you really need to
> know is "mtn pull;mtn up" and even then, understanding why there are two
> commands actually teaches you something important about the SCM. Hiding
> them from the user just creates a  phobia of using the real tools.
>
> Cheers,
>
> Richard

I know bitbake.  I use bitbake.  I debug bitbake (more often than I want to,
actually).

Yet I also type "make all" to build things.

Why?

Not because I have a "phobia of using the real tools."  Not because I'm
stupid.  Not because I'm philisophically opposed to bitbake.  It might
perhaps be because I'm so old that I have moss growing on me, and that I've
been typing "make <target>" since rocks were young and dirt was just
invented.  It's true that my brain thinks "bitbake <thing>" and my fingers
type "make <thing>".

I ask the OE team why are they are philosophically opposed to driving
bitbake with make?  Make has driven software development since near the dawn
of time.  Make has been used to set up environment variables, adjust for
unusual or tricky build environments, and generally to ease the life of a
developer for eons.  It works very well for its purpose.  So why would
anyone encourage a development approach that throws out such a useful tools
and forces a user to manually set environment variables, and remember an
obscure command to invoke a build?  Of course a serious developer should
know generally what goes on underneath, but that doesn't mean that they
should do all the steps manually!

Unless it is the intent to create a barrier to entry?

Mike (mwester)



