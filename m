Received: from mail.reciva.com ([109.169.29.93] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1OK6Gt-0003qe-KD
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Jun 2010 10:59:30 +0200
Received: from jost.swaffham-prior.co.uk ([217.154.114.20]
	helo=[192.168.114.10])
	by crown.reciva.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1OK6Cn-0007Vm-BW
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Jun 2010 09:55:13 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100603084631.GN16035@jama>
References: <201006022351.38129.pieterg@gmx.com>
	<20100603043505.GJ16035@jama> <201006030915.57362.pieterg@gmx.com>
	<20100603073717.GK16035@jama>
	<1275552817.4657.32.camel@lenovo.internal.reciva.com>
	<20100603083011.GM16035@jama>
	<1275554237.4657.40.camel@lenovo.internal.reciva.com>
	<20100603084631.GN16035@jama>
Date: Thu, 03 Jun 2010 09:55:19 +0100
Message-ID: <1275555319.4657.42.camel@lenovo.internal.reciva.com>
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
X-List-Received-Date: Thu, 03 Jun 2010 08:59:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2010-06-03 at 10:46 +0200, Martin Jansa wrote:
> So will bitbake build again the same recipe (because I've built from the
> same one before) with lower PV, just because it _still_ has the highest
> DEFAULT_PREFERENCE and it's desired version (but still lower PV because
> of hash, then before)?.

Yes, I think so.  PV, and hence P, will be different and that's about
all that matters to bitbake.  The fact that PF is the same should be
irrelevant; I don't think any of its persistent state is keyed on that.

p.



