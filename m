Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1OGdV1-00080F-4e
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 May 2010 21:39:43 +0200
Received: from p5b034c45.dip.t-dialin.net ([91.3.76.69] helo=excalibur)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1OGdR2-0004ju-EX by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 May 2010 21:35:39 +0200
Received: from stefan by excalibur with local (Exim 4.71)
	(envelope-from <stefan@excalibur.local>) id 1OGdR0-0005mG-EX
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 May 2010 21:35:34 +0200
Date: Mon, 24 May 2010 21:35:34 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100524193533.GC9685@excalibur.local>
References: <1273758399-23601-1-git-send-email-aalonso00@gmail.com>
	<1273758399-23601-2-git-send-email-aalonso00@gmail.com>
	<1273758399-23601-3-git-send-email-aalonso00@gmail.com>
	<20100514122113.GH3507@excalibur.local>
	<AANLkTikMtgHDODuAzt-efsFrMyEOUsv6mnrK-14x5LxA@mail.gmail.com>
	<20100524135551.GB9685@excalibur.local>
	<AANLkTilbqiPIctx3KU5gTOBpuIXciedGpObKOCQFeDDe@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTilbqiPIctx3KU5gTOBpuIXciedGpObKOCQFeDDe@mail.gmail.com>
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
Subject: Re: [PATCH 3/5 v2] linux-xilinx-ml507: update kernel version
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
X-List-Received-Date: Mon, 24 May 2010 19:39:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Mon, 2010-05-24 at 11:24, Adrian Alonso wrote:
> 
> On Mon, May 24, 2010 at 8:55 AM, Stefan Schmidt
> <stefan@datenfreihafen.org>wrote:
> >
> > I'm build testing this combination right now. One question that is still
> > open is
> > about the USE_VT in your first patch. Why did you comment it out? Something
> > like
> > this should be mentioned in the changelog.
> >
> > Yep I forgot to comment why i disable this option, it disables virtual
> terminal, i think in
> kernel options (not sure); disabling USE_VT I can have xserver running
> otherwise fails
> config files for machines that have by default graphical support don't
> include this option
> and i saw that only machines that doesn't have graphical support use this
> option to
> explicitly disable it.
> 
> Since we are in a dynamic architecture where display support can be included
> or not
> in the hardware model, i think that leaving the option in the config file is
> a good idea
> and just add some comments mentioning when this option is useful.

I added a note about this into the commit message. I also changed a bit in the
other messages. Please keep in mind to make them in a proper way. When I do a
review it is always the first part I read and try to understand, afterwards I'm
checking if the message matches the change itself and then I'm going to review
the change.

Every problem you can avoid before sending the patches off is time that is safed
in review cycles and in the end until it is pushed into the repo.

I found no problems during some build tests and pushed them into the repo.
Thanks.

regards
Stefan Schmidt


