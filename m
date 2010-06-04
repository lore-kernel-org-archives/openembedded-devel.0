Received: from smtp-4.concepts.nl ([213.197.30.111])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pieterg@gmx.com>) id 1OKSGx-0006NI-5G
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jun 2010 10:29:00 +0200
Received: from c3404277.ftth.concepts.nl ([195.64.66.119]
	helo=mx1.grimmerink.nl) by smtp-4.concepts.nl with esmtp (Exim 4.69)
	(envelope-from <pieterg@gmx.com>) id 1OKSCn-0004S6-Rs
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jun 2010 10:24:41 +0200
Received: from [10.9.0.12] (unknown [10.9.0.12])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.grimmerink.nl (Postfix) with ESMTPSA id 7E8706A11A
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Jun 2010 10:24:37 +0200 (CEST)
From: pieterg <pieterg@gmx.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 4 Jun 2010 10:24:31 +0200
User-Agent: KMail/1.9.9
References: <201006022351.38129.pieterg@gmx.com>
	<1275555319.4657.42.camel@lenovo.internal.reciva.com>
	<1275582929.15559.65.camel@mill.internal.reciva.com>
In-Reply-To: <1275582929.15559.65.camel@mill.internal.reciva.com>
MIME-Version: 1.0
Message-Id: <201006041024.31712.pieterg@gmx.com>
X-Concepts-MailScanner-Information: Please contact abuse@concepts.nl for more
	information
X-Concepts-MailScanner-ID: 1OKSCn-0004S6-Rs
X-Concepts-MailScanner: Found to be clean
X-Concepts-MailScanner-SpamCheck: 
X-Concepts-MailScanner-From: pieterg@gmx.com
X-SA-Exim-Connect-IP: 213.197.30.111
X-SA-Exim-Mail-From: pieterg@gmx.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_FAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: AUTOREV and SRCPV
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
X-List-Received-Date: Fri, 04 Jun 2010 08:29:00 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thursday 03 June 2010 18:35:29 Phil Blundell wrote:
> On Thu, 2010-06-03 at 09:55 +0100, Phil Blundell wrote:
> > On Thu, 2010-06-03 at 10:46 +0200, Martin Jansa wrote:
> > > So will bitbake build again the same recipe (because I've built from
> > > the same one before) with lower PV, just because it _still_ has the
> > > highest DEFAULT_PREFERENCE and it's desired version (but still lower
> > > PV because of hash, then before)?.
> >
> > Yes, I think so.  PV, and hence P, will be different and that's about
> > all that matters to bitbake.  The fact that PF is the same should be
> > irrelevant; I don't think any of its persistent state is keyed on that.
>
> I did a quick test on this and it does indeed seem to work as you would
> expect.  So that seems like the easiest way of solving the problem at
> hand.

I probably don't know enough about the bitbake internals to see how to fix 
my problem with that, could you please point me in the right direction?
I think in case of AUTOREV I would still need some way to automatically 
include a sortable revision count in PKGV, so the actual problem would only 
move from PV to PKGV.
Or do you mean this would allow SRCPV to be removed from those hundreds of 
packages which don't use AUTOREV at the moment, so I can keep using AUTOREV 
for my own packages, without those other packages starting to cause 
problems?

Note that my problem is not 'getting the package upgraded on the target', 
but 'getting automatically incrementing package versions which are 
consistent on several build systems'.

So for me a simple workaround would be allowing BB_LOCALCOUNT_OVERRIDE to be 
defined per package, rather than globally.
Or something similar, which would allow me to use the sortable revision 
count only for those packages for which I really need AUTOREV.

Rgds, Pieter


