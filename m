Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1Ok2Ff-0004He-50
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Aug 2010 23:57:23 +0200
Received: from p5b035410.dip.t-dialin.net ([91.3.84.16] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1Ok2FQ-0002q6-Sf by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Aug 2010 23:57:11 +0200
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>) id 1Ok2FQ-0004mV-42
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Aug 2010 23:57:08 +0200
Date: Fri, 13 Aug 2010 23:57:08 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100813215708.GF19855@excalibur.local>
References: <1279651497-20918-1-git-send-email-morphis@gravedo.de>
	<1279651497-20918-2-git-send-email-morphis@gravedo.de>
	<20100726074601.GA27921@excalibur.local>
	<4C4DE8FA.7060707@gravedo.de>
	<20100728134438.GA20716@excalibur.local>
	<4C5066C9.4060902@gravedo.de>
	<20100728180735.GC20716@excalibur.local>
MIME-Version: 1.0
In-Reply-To: <20100728180735.GC20716@excalibur.local>
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
Subject: Re: [PATCH 1/4] lvm2: rebase all recipes on a global lvm2.inc recipe
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
X-List-Received-Date: Fri, 13 Aug 2010 21:57:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Wed, 2010-07-28 at 20:07, Stefan Schmidt wrote:
> On Wed, 2010-07-28 at 19:20, Simon Busch wrote:
> > On 28.07.2010 15:44, Stefan Schmidt wrote:
> > 
> > Staging this binaries let the recompile of the same package fail as it
> > tries to install the binaries + man pages again.
> > Any hints where the bug could be? Within the staging logic?
> 
> Good question. Maybe only a  bug in the clean step that it ignores the files
> during cleaning. Anybody else an idea?
> 
> You could also add a do_install_append which removes the binaries again.

I take this back. If nobody complains I commit this patch with the empty
do_stage function tomorrow.

regards
Stefan Schmidt


