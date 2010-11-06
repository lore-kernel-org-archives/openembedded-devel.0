Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1PEjV9-0007KC-Pz
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Nov 2010 15:12:16 +0100
Received: from p5b036781.dip.t-dialin.net ([91.3.103.129] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1PEjUG-0004rO-Fx by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Nov 2010 15:11:23 +0100
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>) id 1PEjUF-0000Gd-8D
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Nov 2010 15:11:19 +0100
Date: Sat, 6 Nov 2010 15:11:18 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101106141118.GG6691@excalibur.local>
References: <4C78D1E1.9080101@mlbassoc.com>
 <4CB081A4.9010908@mlbassoc.com>
MIME-Version: 1.0
In-Reply-To: <4CB081A4.9010908@mlbassoc.com>
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
X-List-Received-Date: Sat, 06 Nov 2010 14:12:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Sat, 2010-10-09 at 08:52, Gary Thomas wrote:
> On 08/28/2010 03:07 AM, Gary Thomas wrote:
> >This patch addresses the problem where the TI tools that need
> >the EULA unpack into the wrong place if the user has write
> >permission in /opt. The current behaviour of expecting the
> >unpacker to fall back to the $HOME environment variable should
> >not be relied on. The patch changes the unpack step to use
> >the --prefix= option which will always work.
> >
> >Version 2:
> >* Update patch to be against org.openembedded.dev branch
> >* Incorporate full description into patch
> 
> What about this patch?  It's been nearly 6 weeks and no discussion
> or anything.
> 
> The problem persists in today's tree.

Can we have a comment form the TI devs here?

regards
Stefan Schmidt


