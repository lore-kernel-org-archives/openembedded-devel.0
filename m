Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1PF3OU-0000lL-Gv
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Nov 2010 12:26:43 +0100
Received: from p5b036781.dip.t-dialin.net ([91.3.103.129] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1PF3Nb-00056R-BP by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Nov 2010 12:25:49 +0100
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>) id 1PF3Na-0001YP-Fq
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Nov 2010 12:25:46 +0100
Date: Sun, 7 Nov 2010 12:25:46 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101107112546.GO6691@excalibur.local>
References: <4C78D1E1.9080101@mlbassoc.com> <4CB081A4.9010908@mlbassoc.com>
	<20101106141118.GG6691@excalibur.local>
	<ib5q4g$847$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <ib5q4g$847$1@dough.gmane.org>
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
Subject: Re: [PATCH v2] TI tools - make EULA unpack work when /opt is writeable
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
X-List-Received-Date: Sun, 07 Nov 2010 11:26:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Sun, 2010-11-07 at 10:05, Koen Kooi wrote:
> 
> On 06-11-10 15:11, Stefan Schmidt wrote:
> > Hello.
> > 
> > On Sat, 2010-10-09 at 08:52, Gary Thomas wrote:
> >> On 08/28/2010 03:07 AM, Gary Thomas wrote:
> >>> This patch addresses the problem where the TI tools that need
> >>> the EULA unpack into the wrong place if the user has write
> >>> permission in /opt. The current behaviour of expecting the
> >>> unpacker to fall back to the $HOME environment variable should
> >>> not be relied on. The patch changes the unpack step to use
> >>> the --prefix= option which will always work.
> >>>
> >>> Version 2:
> >>> * Update patch to be against org.openembedded.dev branch
> >>> * Incorporate full description into patch
> >>
> >> What about this patch?  It's been nearly 6 weeks and no discussion
> >> or anything.
> >>
> >> The problem persists in today's tree.
> > 
> > Can we have a comment form the TI devs here?
> 
> I'm against automatic application of patches.

Interesting side note, but I was looking for a comment for the original issue.
Writeable /opt and the problem the TI recipes have with this.

regards
Stefan Schmidt


