Received: from smtp-4.concepts.nl ([213.197.30.111])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pieterg@gmx.com>) id 1OK66Z-0004Sy-Fx
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Jun 2010 10:48:49 +0200
Received: from c3404277.ftth.concepts.nl ([195.64.66.119]
	helo=mx1.grimmerink.nl) by smtp-4.concepts.nl with esmtp (Exim 4.69)
	(envelope-from <pieterg@gmx.com>) id 1OK62R-0005pl-SV
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Jun 2010 10:44:31 +0200
Received: from [10.9.0.12] (unknown [10.9.0.12])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.grimmerink.nl (Postfix) with ESMTPSA id 893F86A11A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Jun 2010 10:44:27 +0200 (CEST)
From: pieterg <pieterg@gmx.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 3 Jun 2010 10:44:24 +0200
User-Agent: KMail/1.9.9
References: <201006022351.38129.pieterg@gmx.com>
	<201006031002.31685.pieterg@gmx.com> <20100603082740.GL16035@jama>
In-Reply-To: <20100603082740.GL16035@jama>
MIME-Version: 1.0
Message-Id: <201006031044.24680.pieterg@gmx.com>
X-Concepts-MailScanner-Information: Please contact abuse@concepts.nl for more
	information
X-Concepts-MailScanner-ID: 1OK62R-0005pl-SV
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
X-List-Received-Date: Thu, 03 Jun 2010 08:48:49 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thursday 03 June 2010 10:27:40 Martin Jansa wrote:
> On Thu, Jun 03, 2010 at 10:02:31AM +0200, pieterg wrote:
> > On Thursday 03 June 2010 09:37:17 Martin Jansa wrote:
> > > On Thu, Jun 03, 2010 at 09:15:56AM +0200, pieterg wrote:

<snip>

> > So personally, I would never even want to use SRCPV, unless it's for
> > AUTOREV.
>
> So what you say is that you would also never use AUTOREV without
> BB_GIT_CLONE_FOR_SRCREV, no matter if SRCPV is used.

Right, same reason. I need reproducable versions at all times, on all build 
systems, even when the cache is lost.

> > Would it be an idea to be able to only have BB_GIT_CLONE_FOR_SRCREV for
> > those packages which have SRCREV = ${AUTOREV}?
>
> Well then it will be a bit inconsistent, because those AUTOREV recipes
> will restore their LOCALCOUNT (ie after hdd breakage) but notAUTOREV
> recipes (which usually could be considered more stable) will "downgrade"
> to LOCALCOUNT 0 (if you didn't restore cache).

True, and a bit selfish of course, because I don't care about all those 
SRCPV packages, i cannot even use them because of their inconsistent 
versions.

> A bit better would be to disable LOCALCOUNT_OVERRIDE only for recipes
> you want to be AUTOREV (then git clone will stop for recipes you don't
> care about even with BB_GIT_CLONE_FOR_SRCREV and after removing cache
> those LOCALCOUNT will stay 0 as it was before).

Yes, that would lead to the same workable situation for me.
And seems like an easier fix, because BB_LOCALCOUNT_OVERRIDE is checked for 
each package, where BB_GIT_CLONE_FOR_SRCREV is only checked once, globally.

> Best solution would be to ask git devs to implement "git remote-count
> HASH" as remote-ls works.

Yes, if we could convince them, that would be ideal...

Rgds, Pieter


