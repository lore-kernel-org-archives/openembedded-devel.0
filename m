Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TMFQg-0002DK-IL
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Oct 2012 11:51:46 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1TMFDy-0002Ss-M9
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Oct 2012 11:38:38 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 11 Oct 2012 10:38:37 +0100
In-Reply-To: <20121011093222.GB3589@jama.jama.net>
References: <20121010104253.EB7AB1034A@opal>
	<20121011090133.GA3589@jama.jama.net> <2029532.l8FLCLtnC1@helios>
	<20121011093222.GB3589@jama.jama.net>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1349948318.3259.82.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [oe-commits] Otavio Salvador : libav: Change the PACKAGES_DYNAMIC expression to be more restrict
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
X-List-Received-Date: Thu, 11 Oct 2012 09:51:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-10-11 at 11:32 +0200, Martin Jansa wrote:
> glob would make libav PACKAGES_DYNAMIC a bit longer (6 glob expressions)
> and would need another bitbake version bump + bump of required version
> in sanity test.

Also, I don't think there's any precedent for globs in the metadata: all
the other variables I can think of (COMPATIBLE_HOST etc) are regexps.
The fact that people have been using it wrongly up to now doesn't seem
like a particularly compelling reason to change bitbake's behaviour.

There aren't all that many PACKAGES_DYNAMICses in oe-core (and
presumably not all that many more in meta-oe either) and it wouldn't be
very hard to just fix them.  I think we should do that.

p.




