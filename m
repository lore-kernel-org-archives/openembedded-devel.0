Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1NvUef-0005RV-Vt
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Mar 2010 12:58:19 +0100
Received: from p5b035482.dip.t-dialin.net ([91.3.84.130] helo=excalibur)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1NvUbZ-0004LK-Iq by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Mar 2010 12:55:08 +0100
Received: from stefan by excalibur with local (Exim 4.71)
	(envelope-from <stefan@excalibur.local>) id 1NvUbY-0000B3-E3
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Mar 2010 12:55:04 +0100
Date: Sat, 27 Mar 2010 12:55:04 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100327115504.GC21542@excalibur.local>
References: <1268826851-28042-1-git-send-email-ospite@studenti.unina.it>
	<201003220816.04657.holger+oe@freyther.de>
	<20100326125222.7c5a7e7f.ospite@studenti.unina.it>
	<201003261256.48913.holger+oe@freyther.de>
MIME-Version: 1.0
In-Reply-To: <201003261256.48913.holger+oe@freyther.de>
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
Subject: Re: [PATCH v2] gnutls: fix do_configure by depending on gtk-doc
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
X-List-Received-Date: Sat, 27 Mar 2010 11:58:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Fri, 2010-03-26 at 12:56, Holger Hans Peter Freyther wrote:
> On Friday 26 March 2010 12:52:22 you wrote:
> 
> > > gtk-doc? Where is it installing its .m4 file?
> > 
> > I didn't investigate deeply the details, but with this patch
> > gnutls_2.8.5.bb builds again, without this it doesn't and thus prevents
> > even meta-toolchain to be built; this is reproducible when starting from
> > a fresh setup (wiping out tmp/ I mean). The full log is here:
> > http://tinderbox.openembedded.org/public/logs/task/5429228.txt
> 
> Okay, then
> 
> Acked-by: Holger Hans Peter Freyther <zecke@selfish.org>

I could reproduce the problem and the patch fixed it. Applied and pushed.

regards
Stefan Schmidt


