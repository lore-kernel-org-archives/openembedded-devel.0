Received: from static.26.116.47.78.clients.your-server.de ([78.47.116.26]
	helo=phalanx.drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1OqwSX-0004Pn-0r
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Sep 2010 01:11:15 +0200
Received: from [192.168.1.2] (e180147196.adsl.alicedsl.de [85.180.147.196])
	by phalanx.drlauer-research.com (Postfix) with ESMTP id E1E39584122
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Sep 2010 01:15:28 +0200 (CEST)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTimNWTc1-qGCcZoOfSX96RZvy0OUKk4bTOU_c4pe@mail.gmail.com>
References: <AANLkTikp1c5AcYFDU74kn4oiioqW4L+ZQaofB7rp0iE7@mail.gmail.com>
	<AANLkTimNWTc1-qGCcZoOfSX96RZvy0OUKk4bTOU_c4pe@mail.gmail.com>
Organization: Vanille-Media
Date: Thu, 02 Sep 2010 01:09:20 +0200
Message-ID: <1283382560.2012.24.camel@saphir>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: SOC_FAMILY broken
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
X-List-Received-Date: Wed, 01 Sep 2010 23:11:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Am Mittwoch, den 01.09.2010, 23:22 +0200 schrieb Leon Woestenberg:
> On Wed, Sep 1, 2010 at 11:14 PM, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com> wrote:
> > Root cause: if SOC_FAMILY is not set (awhich is the case for most
> > MACHINEs  and all distro's except angstrom) the test in base.bbclass
> >
> 
> Good point, but I never understood SOC_FAMILY. From an old email:
> 
> "SOC_FAMILY is defining a family of processors and the features that processor
> has.  Whereas MACHINE_CLASS is defining a type of device and its features which
> can use different processors."
> 
> I think the first sentence is contradicting itself.
> 
> A "family of processors" vs. "features that processor had". This can
> be fully orthogonal (worst case),
> so the definition of the variable is crap. I wonder, has it proven
> more useful than cumbersome?

I still don't know why we need both SOC_FAMILY and MACHINE_CLASS in the
first place. MACHINE_CLASS has been around for much longer and if you
look how it's being used or intended to use, you see that there are
hardly any processor differences in the members of those classes (e.g.
openezx, qualcomm msm7, om-gta01/02, clamshell zaurus models, ...).

I'm still unconvinced that we need both variables.

Cheers,
-- 
:M:



