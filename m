Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>) id 1PlHb1-00015A-1p
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Feb 2011 10:04:51 +0100
Received: from [2001:638:602:1183:21f:16ff:fe0d:7d41] (helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1PlHa5-0007A5-Lu by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Feb 2011 10:03:55 +0100
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>) id 1PlHa3-0000jm-1G
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Feb 2011 10:03:51 +0100
Date: Fri, 4 Feb 2011 10:03:48 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110204090348.GR4580@excalibur.local>
References: <201101271038.18945.ml@vdm-design.de>
	<AANLkTimy4Q0Y_3Y-=8=QCifqQUYwWmFx4T0DH+dNXPeZ@mail.gmail.com>
	<4D418914.2030703@mentor.com> <20110203070901.GA11867@denix.org>
	<4D4AE93E.2020509@mentor.com> <20110203222035.GA19477@denix.org>
	<4D4B35A7.4040000@mentor.com>
	<AANLkTinO257Uuh8bTQCb2LPXKFF1LtB+qN0KjM8aXZVN@mail.gmail.com>
	<20110204081659.GQ4580@excalibur.local>
	<AANLkTinrcXmdF=P8KUc8_cWfchPEM=q7UaDbCbQknteF@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTinrcXmdF=P8KUc8_cWfchPEM=q7UaDbCbQknteF@mail.gmail.com>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,NO_RELAYS
	autolearn=ham version=3.2.5
Subject: Re: bitbake does not fail when QA issues encountered
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
X-List-Received-Date: Fri, 04 Feb 2011 09:04:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Fri, 2011-02-04 at 09:37, Frans Meulenbroeks wrote:
> 2011/2/4 Stefan Schmidt <stefan@datenfreihafen.org>:
> >
> > On Fri, 2011-02-04 at 08:54, Frans Meulenbroeks wrote:
> >> 2011/2/4 Tom Rini <tom_rini@mentor.com>:
> >> > On 02/03/2011 03:20 PM, Denys Dmytriyenko wrote:
> >> >>
> >> >> So, do you ack the patch, should I push it in? It will break the build for
> >> >> anyone still using libtool-2.2, specifically in gettext package...
> >> >
> >> > So, that would break angstrom-2008.1 so I don't think that's a great idea
> >> > until we fix it..
> >>
> >> Then again, if we push it there will be some incentive to fix it.
> >
> > So you are going to care care about the not yet ready for libtool 2.4 fallout?
> > Get warm with openjdk-6 then as it still needs libtool 2.2. :)
> >
> > More serious, I think this should at least wait until after the upcoming 2011-03
> > release. We need to find a balance between waiting forever and not breaking
> > existing stuff.
> >
> Ehm, so if there is an RPATH or GNU_HASH QA error the code is *not* broken?
> In that case it should not be a QA error but a QA warning.
> But if it is an error then the existing stuff is already broken.

My comment did target the force of libtool 2.4 to everyone. Reading it again I
think I made this clear. I don't think that RPATH or GNU_HASH errors are
invaldid or should be ignored I'm just pointing out that foricing an update to
libtool 2.4 will break other things. (Which should obviously get fixed as well).

Taking my OE hat off and my BugLabs build guy hat on I can tell what I would do
with such a change going in now. I would skip the next release I wanted to base
a product on and just keep a private branch from a known good rev and release
from there maybe pulling in fixes over time. This is the exact opposite we
should aim for when doing releases. Instead we should get the metadata in good
shape for as much customer as possible, release, allow pooling of resources on
such a release for potential maintenance and get problematic stuff in _early
after the release_. Call it merge window or whatever.

I'm happy to work on getting openjdk work together with libtool 2.4, but not
before a upcoming release. Thats more like throwing stave in between peoples
legs. (Not sure if such a german saying makes much sense translated. :))

> Ignoring the error then is more like ostrich behaviour.

And waht is ignoring my statement about balace such things and wait until after
the release? :)

regards
Stefan Schmidt


