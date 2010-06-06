Received: from mail.reciva.com ([109.169.29.93] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1OLN1O-0008O9-Al
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Jun 2010 23:04:43 +0200
Received: from jost.swaffham-prior.co.uk ([217.154.114.20]
	helo=[192.168.114.10])
	by crown.reciva.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1OLMxD-0000YS-Rf
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Jun 2010 22:00:23 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <201006051236.07938.pieterg@gmx.com>
References: <201006022351.38129.pieterg@gmx.com>
	<201006041044.42032.pieterg@gmx.com>
	<1275649408.23726.5.camel@mill.internal.reciva.com>
	<201006051236.07938.pieterg@gmx.com>
Date: Sun, 06 Jun 2010 22:00:29 +0100
Message-ID: <1275858029.19175.21.camel@lenovo.internal.reciva.com>
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
X-List-Received-Date: Sun, 06 Jun 2010 21:04:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2010-06-05 at 12:36 +0200, pieterg wrote:
> Now I get a nice
> 1.0+git7348+5276f059461b6e9015e46a01b1cabfc42dfa600f
> PKGV, which is the same in both stable/unstable situations, assuming 
> the 'stable' rev is the latest rev.
> And it is of course the same on all buildservers, and doesn't depend on 
> what's in the cache.
> 
> And best of all, no more need for BB_LOCALCOUNT_OVERRIDE nor 
> BB_GIT_CLONE_FOR_SRCREV, so no more lengthy bb parse sessions.

Yup, that looks good.

In the longer term I guess it would be nice to make this less
git-specific.  But, as you observe, that would mean either copying a lot
of code from bitbake or waiting for a new bitbake release which exposes
the necessary functionality.  And, in any case, the majority of projects
use only a single SCM which doesn't change very often, so I guess there
will not be too much of an issue in practice.

Thanks for your work, anyway.  I'll go ahead and check this in unless
somebody has an objection.

p.




