Received: from smtp-1.concepts.nl ([213.197.30.124])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pieterg@gmx.com>) id 1OKSaQ-0006oC-IR
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jun 2010 10:49:07 +0200
Received: from c3404277.ftth.concepts.nl ([195.64.66.119]
	helo=mx1.grimmerink.nl) by smtp-1.concepts.nl with esmtp (Exim 4.69)
	(envelope-from <pieterg@gmx.com>) id 1OKSWH-0004B8-5U
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jun 2010 10:44:49 +0200
Received: from [10.9.0.12] (unknown [10.9.0.12])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.grimmerink.nl (Postfix) with ESMTPSA id 07D526A11A
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Jun 2010 10:44:45 +0200 (CEST)
From: pieterg <pieterg@gmx.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 4 Jun 2010 10:44:41 +0200
User-Agent: KMail/1.9.9
References: <201006022351.38129.pieterg@gmx.com>
	<201006041024.31712.pieterg@gmx.com>
	<1275640257.4657.84.camel@lenovo.internal.reciva.com>
In-Reply-To: <1275640257.4657.84.camel@lenovo.internal.reciva.com>
MIME-Version: 1.0
Message-Id: <201006041044.42032.pieterg@gmx.com>
X-Concepts-MailScanner-Information: Please contact abuse@concepts.nl for more
	information
X-Concepts-MailScanner-ID: 1OKSWH-0004B8-5U
X-Concepts-MailScanner: Found to be clean
X-Concepts-MailScanner-SpamCheck: 
X-Concepts-MailScanner-From: pieterg@gmx.com
X-SA-Exim-Connect-IP: 213.197.30.124
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
X-List-Received-Date: Fri, 04 Jun 2010 08:49:07 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Friday 04 June 2010 10:30:57 Phil Blundell wrote:
> On Fri, 2010-06-04 at 10:24 +0200, pieterg wrote:
> > I probably don't know enough about the bitbake internals to see how to
> > fix my problem with that, could you please point me in the right
> > direction? I think in case of AUTOREV I would still need some way to
> > automatically include a sortable revision count in PKGV, so the actual
> > problem would only move from PV to PKGV.
>
> That's correct: essentially it is just moving the SRCPV-equivalent thing
> from PV to PKGV.  But, PKGV only needs to be evaluated during the
> do_package step, not at parse time, so you only incur the cost and risk
> of running git rev-list (or whatever) for packages that you are actually
> building rather than for all recipes in your source tree.

I'm starting to see your point. That would really allow a much nicer AUTOREV 
implementation.
But in that case I'm not getting away with a simple workaround I'm afraid...

Rgds, Pieter


