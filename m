Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1O2n2D-00053w-Tc
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Apr 2010 17:00:49 +0200
Received: from p5b037ced.dip.t-dialin.net ([91.3.124.237] helo=excalibur)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1O2myn-0005pv-In by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Apr 2010 16:57:16 +0200
Received: from stefan by excalibur with local (Exim 4.71)
	(envelope-from <stefan@excalibur.local>) id 1O2myn-0004my-6k
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Apr 2010 16:57:13 +0200
Date: Fri, 16 Apr 2010 16:57:13 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100416145713.GD7857@excalibur.local>
References: <alpine.DEB.1.10.1004081018050.3264@vitus.devnet.local>
	<alpine.DEB.1.10.1004081733510.3264@vitus.devnet.local>
	<alpine.LNX.2.00.1004161612220.28729@asterix.crazy-teaparty.dyndns.org>
	<20100416144107.GC7857@excalibur.local>
	<alpine.LNX.2.00.1004161648330.28729@asterix.crazy-teaparty.dyndns.org>
MIME-Version: 1.0
In-Reply-To: <alpine.LNX.2.00.1004161648330.28729@asterix.crazy-teaparty.dyndns.org>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 78.47.116.19
X-SA-Exim-Mail-From: stefan@datenfreihafen.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v3] dfu-programmer: USB Device Firmware Upgrade utility (special atmel-version)
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
X-List-Received-Date: Fri, 16 Apr 2010 15:00:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Fri, 2010-04-16 at 16:50, Vitus Jensen wrote:
> On Fri, 16 Apr 2010, Stefan Schmidt wrote:
> >On Fri, 2010-04-16 at 16:13, Vitus Jensen wrote:
> >>--- /dev/null
> >>+++ b/recipes/dfu-programmer/dfu-programmer_svn.bb
> >>@@ -0,0 +1,16 @@
> >>+DESCRIPTION = "USB Device Firmware Upgrade utility (special atmel-version)"
> >>+SECTION = "devel"
> >>+AUTHOR = "Weston Schmidt <weston_schmidt@alumni.purdue.edu>"
> >>+LICENSE = "GPL"
> >>+
> >>+SRCREV = "93"
> >>+PV = "0.5.2+svnr${SRCPV}"
> >
> >Should be SRCREV and not SRCPV, right? If thats right I can take care of it when
> >testing and applying it.
> 
> From previous post by Martin Jansa in this thread:
> ============
> >+PV = "0.5.2+svnr${SRCREV}"
> 
> In org.openembedded.dev it's always "+svnr${SRCPV}" for svn recipes
> (hopefully soon also unified for git recipes).
> ============
> 
> My patch of today applies and compiles fine in dev and stable (with
> the SRCPV-patch posted before) in the original format.  So I guess
> SRCPV is right.

Hmm, ok. I haven't followed the SRCPV thing closely. Will test your patch here
and push it.

regards
Stefan Schmidt


