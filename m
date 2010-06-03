Received: from mail.reciva.com ([109.169.29.93] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1OKDSK-0003Aj-JE
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Jun 2010 18:39:47 +0200
Received: from [62.7.80.98] (helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1OKDOE-0001Ye-1w
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Jun 2010 17:35:30 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1OKDOD-0004cr-NV
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Jun 2010 17:35:29 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1275555319.4657.42.camel@lenovo.internal.reciva.com>
References: <201006022351.38129.pieterg@gmx.com>
	<20100603043505.GJ16035@jama> <201006030915.57362.pieterg@gmx.com>
	<20100603073717.GK16035@jama>
	<1275552817.4657.32.camel@lenovo.internal.reciva.com>
	<20100603083011.GM16035@jama>
	<1275554237.4657.40.camel@lenovo.internal.reciva.com>
	<20100603084631.GN16035@jama>
	<1275555319.4657.42.camel@lenovo.internal.reciva.com>
Date: Thu, 03 Jun 2010 17:35:29 +0100
Message-ID: <1275582929.15559.65.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-Broken-Reverse-DNS: no host name found for IP address 62.7.80.98
X-SA-Exim-Connect-IP: 109.169.29.93
X-SA-Exim-Mail-From: philb@gnu.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,SPF_SOFTFAIL
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
X-List-Received-Date: Thu, 03 Jun 2010 16:40:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2010-06-03 at 09:55 +0100, Phil Blundell wrote:
> On Thu, 2010-06-03 at 10:46 +0200, Martin Jansa wrote:
> > So will bitbake build again the same recipe (because I've built from the
> > same one before) with lower PV, just because it _still_ has the highest
> > DEFAULT_PREFERENCE and it's desired version (but still lower PV because
> > of hash, then before)?.
> 
> Yes, I think so.  PV, and hence P, will be different and that's about
> all that matters to bitbake.  The fact that PF is the same should be
> irrelevant; I don't think any of its persistent state is keyed on that.

I did a quick test on this and it does indeed seem to work as you would
expect.  So that seems like the easiest way of solving the problem at
hand.

p.




