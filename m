Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1PEGiZ-0007Mp-KF
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Nov 2010 08:28:11 +0100
Received: from [2001:638:602:1183:21f:16ff:fe0d:7d41] (helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1PEGhi-0007W6-S9 by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Nov 2010 08:27:21 +0100
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>) id 1PEGhh-0003ZZ-Tk
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Nov 2010 08:27:17 +0100
Date: Fri, 5 Nov 2010 08:27:17 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101105072717.GC3702@excalibur.local>
References: <AANLkTikEvXr_vz+_uy871SM1B5SS=e6kb62sPyt-4GaD@mail.gmail.com>
	<20101104220649.GE28852@denix.org> <4CD3349D.6060904@eukrea.com>
	<20101104224752.GH28852@denix.org> <20101105065240.GI3440@jama>
MIME-Version: 1.0
In-Reply-To: <20101105065240.GI3440@jama>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 78.47.116.19
X-SA-Exim-Mail-From: stefan@datenfreihafen.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: OpenEmbedded Release 2010.12 --- needs your help!
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
X-List-Received-Date: Fri, 05 Nov 2010 07:28:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello

On Fri, 2010-11-05 at 07:52, Martin Jansa wrote:
> On Thu, Nov 04, 2010 at 06:47:52PM -0400, Denys Dmytriyenko wrote:
> > 
> > I thought Leon kind of mentioned it in the first bullet point above, but 
> > probably not very clear. And yes, we definitely need a 2-3 weeks "feature 
> > freeze" period for stabilization. Thanks for pointing it out.
> 
> what about branching future release those 2-3 weeks ago and keep master
> for active development?
> 
> I know it could lower number of people using this future release branch
> during testing period before release, but still seems better then
> pushing 3 weeks of commits from my local branch as soon as release is
> branched and master open for new recipes again.

I don't think this would be a good idea. Part of the problem that we haven't
been able to do releases in the past was a development style of "dumping"
everything into master all the time. If we are able to adapt a more release
driven workflow with branches for upcoming features and a period of
stabilization in the master branch I feel that we are better prepared to bring
out releases for OE.

A lot of changes that are made like new recipes, depends fixes, packaging fixes,
etc are small enough to slip in every time. The stuff we should avoid in the
last weeks are changes touching classes, toolchain changes and other core
things.

regards
Stefan Schmidt


