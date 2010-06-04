Received: from mail.reciva.com ([109.169.29.93] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1OKSMt-0007ec-5s
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jun 2010 10:36:22 +0200
Received: from jost.swaffham-prior.co.uk ([217.154.114.20]
	helo=[192.168.114.10])
	by crown.reciva.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1OKSIm-0006Zh-0A
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jun 2010 09:30:52 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <201006041024.31712.pieterg@gmx.com>
References: <201006022351.38129.pieterg@gmx.com>
	<1275555319.4657.42.camel@lenovo.internal.reciva.com>
	<1275582929.15559.65.camel@mill.internal.reciva.com>
	<201006041024.31712.pieterg@gmx.com>
Date: Fri, 04 Jun 2010 09:30:57 +0100
Message-ID: <1275640257.4657.84.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 109.169.29.93
X-SA-Exim-Mail-From: philb@gnu.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
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
X-List-Received-Date: Fri, 04 Jun 2010 08:36:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2010-06-04 at 10:24 +0200, pieterg wrote:
> I probably don't know enough about the bitbake internals to see how to fix 
> my problem with that, could you please point me in the right direction?
> I think in case of AUTOREV I would still need some way to automatically 
> include a sortable revision count in PKGV, so the actual problem would only 
> move from PV to PKGV.

That's correct: essentially it is just moving the SRCPV-equivalent thing
from PV to PKGV.  But, PKGV only needs to be evaluated during the
do_package step, not at parse time, so you only incur the cost and risk
of running git rev-list (or whatever) for packages that you are actually
building rather than for all recipes in your source tree.

p.




