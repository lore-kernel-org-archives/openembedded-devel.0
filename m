Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1Ix14y-00068s-HL
	for openembedded-devel@openembedded.org; Tue, 27 Nov 2007 15:06:31 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id lARE3SDT018716;
	Tue, 27 Nov 2007 14:03:28 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18539-04; Tue, 27 Nov 2007 14:03:24 +0000 (GMT)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id lARE3OWE018706
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Tue, 27 Nov 2007 14:03:24 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: Paul Sokolovsky <pmiscml@gmail.com>
In-Reply-To: <157949636.20071127154357@gmail.com>
References: <474AFA66.30509@gmx.net>
	<1196166155.6780.11.camel@localhost.localdomain>
	<157949636.20071127154357@gmail.com>
Date: Tue, 27 Nov 2007 14:03:23 +0000
Message-Id: <1196172204.6780.37.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-devel@openembedded.org
Subject: Re: python skills and bug 2412
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
X-List-Received-Date: Tue, 27 Nov 2007 14:06:34 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2007-11-27 at 15:43 +0200, Paul Sokolovsky wrote:
> Tuesday, November 27, 2007, 2:22:35 PM, you wrote:
> > On Mon, 2007-11-26 at 17:55 +0100, Robert Schuster wrote:
> > I commented on the bug but I will repeat here for wider exposure.
> 
> > "The real problem here is that virtual/libx11 should not be appearing in
> > the package manager namespace. RPROVIDES = "virtual/libx11" is plain
> > wrong and is the real bug."
> 
>   What exactly is wrong? RPROVIDES or "virtual/" or maybe "/" after
> all?

The whole idea. Using the virtual namespace in a runtime Provides is
meaningless.

This is not to be confused with PROVIDES = "virtual/*" which are
perfectly fine.

> > I've discussed this on the mailing list in the past, virtual/* shouldn't
> > ever be ending up in the runtime namespaces :/.
> 
>   And why is this? Virtual packages aka services aka facilities are
> core feature of flexible package management. IMHO, they are heavily
> underused in the current OE, which disallows creation of flexible,
> adaptable, and at the same time, consistent systems.

It doesn't work in OE as things stand which is why its underused. There
are at least two problems I can think of offhand:

a) When you compile a package against libx11 does it end up with a
Dependencies: libx11 or virtual/libx11? The answer is the former. This
means you can't switch between different providers "on device". This
means that a given distro must use one provider or the other and that
virtual/* in the runtime package management namespace is just plain
dangerous. If a distro doesn't do this, they will end up breaking their
feeds.

b) There is no way for bitbake's choices of providers to be passed to
the package manager. When faced with two virtual/libx11 packages, which
one should the package manager choose? The only possible solution at the
moment is not to get into that position or you end up with randomness in
builds (very bad). Packaged Staging could potentially help with this
FWIW. The same problem also exists in feeds which devices are accessing
so its not just isolated to the bitbake/package manager interface.

Yes, there may be ways OE/bitbake could be enhanced to do clever things
with virtual runtime namespaces but we have no current support for it
and shouldn't pretend otherwise. If someone wants to implement that, I'm
more than happy to look at, discuss and review a proposal but currently
it won't work.

A proper use for RPROVIDES is for something like gtk+-directfb to
RPROVIDE gtk+. If an app linked against one, it should be able to run
against the other (I'm assuming thats the case, if its not there
shouldn't be an RPROVIDES).

Does that help explain things?

Cheers,

Richard




