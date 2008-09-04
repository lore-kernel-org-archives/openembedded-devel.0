Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1KbH4z-0005ji-Sp
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Sep 2008 17:49:05 +0200
Received: from dsl-62-220-14-162.berlikomm.net ([62.220.14.162]
	helo=abughraib.localdomain) by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1KbH2t-0002Od-Lt
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Sep 2008 17:46:55 +0200
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 4 Sep 2008 17:46:44 +0200
User-Agent: KMail/1.9.9
References: <200809031554.52267.zecke@selfish.org>
	<1220528603.10295.236.camel@mill.internal.reciva.com>
In-Reply-To: <1220528603.10295.236.camel@mill.internal.reciva.com>
MIME-Version: 1.0
Message-Id: <200809041746.44987.zecke@selfish.org>
Subject: Re: Hash based SCMs and OpenEmbedded/Bitbake
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
X-List-Received-Date: Thu, 04 Sep 2008 15:49:06 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thursday 04 September 2008 13:43:23 Phil Blundell wrote:
> On Wed, 2008-09-03 at 15:54 +0200, Holger Freyther wrote:
> > we have a couple of issues with hash based SCMs (like git) and how we
> > handle them.
>
> It's kind of tempting to say that you should just lean on your upstream
> to make proper releases and use them, rather than trying to pull some
> random bag of bits out of the SCM repository.  However, I guess this was
> not the sort of advice you were looking for. :-}
>
> Perhaps more constructively, my preference would be to use "git log" or
> some such to extract the datestamp of the revision in question, and then
> glue it into PV to make a version string that was sortable and hence
> upgradeable.  So, if you had git revision
> 5a5346dfbec459c10d9e61e16e125b83975a1ef1 or whatever, you'd end up with
> PV = "1.0.0+git20080904T123500
> +5a5346dfbec459c10d9e61e16e125b83975a1ef1".  Obviously you still have
> the possibility of losing if you want to upgrade from one revision to
> another one committed in the same second, but I imagine this does not
> arise often in practice.

What is happening is you cherry-pick from another branch and then you have an 
older revision (by commit date) on top and would be able to upgrade. Nice 
idea but I think it will not work. There is the author/comitter separation 
but AFAIK no for the commit date.


z.


