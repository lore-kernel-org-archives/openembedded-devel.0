Received: from mail.reciva.com ([109.169.29.93] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1OK5cY-0002JN-QI
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Jun 2010 10:18:15 +0200
Received: from jost.swaffham-prior.co.uk ([217.154.114.20]
	helo=[192.168.114.10])
	by crown.reciva.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1OK5YS-00075y-Ht
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Jun 2010 09:13:32 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100603073717.GK16035@jama>
References: <201006022351.38129.pieterg@gmx.com>
	<20100603043505.GJ16035@jama> <201006030915.57362.pieterg@gmx.com>
	<20100603073717.GK16035@jama>
Date: Thu, 03 Jun 2010 09:13:37 +0100
Message-ID: <1275552817.4657.32.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 109.169.29.93
X-SA-Exim-Mail-From: philb@gnu.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
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
X-List-Received-Date: Thu, 03 Jun 2010 08:18:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2010-06-03 at 09:37 +0200, Martin Jansa wrote:
> The other is when you change SRCREV in recipe without updating PV. Then
> SRCPV will give you newer PV which will upgrade resulting package on
> target.

If it's just a question of getting the package upgraded on the target
then you can do that with PKGV; there's no need to fiddle with PV at
all.  The only case where PV is important is where you need bitbake to
realise that the package needs to be rebuilt in the first (since the
SRCREVs aren't going to be sortable), but I think that's already fixable
with strategic use of PREFERRED_VERSION and/or DEFAULT_PREFERENCE.

p.




