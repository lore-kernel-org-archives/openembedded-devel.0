Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1PR6sr-0003Oo-5B
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Dec 2010 18:35:53 +0100
Received: from p5b036cab.dip.t-dialin.net ([91.3.108.171] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1PR6rM-0000jN-Q0 by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Dec 2010 18:34:23 +0100
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>) id 1PR6rL-00034u-Jh
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Dec 2010 18:34:19 +0100
Date: Fri, 10 Dec 2010 18:34:19 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101210173419.GB31742@excalibur.local>
References: <1291732373-17953-1-git-send-email-GNUtoo@no-log.org>
	<1291732373-17953-2-git-send-email-GNUtoo@no-log.org>
	<20101209143141.GB29826@excalibur.local>
	<AANLkTikt0-foWmGMM7dH78Ph9J3YhuN8+g8a-1L2-cop@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTikt0-foWmGMM7dH78Ph9J3YhuN8+g8a-1L2-cop@mail.gmail.com>
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
Subject: Re: [PATCH 1/4] Add initial support for iphone3g(machine config and kernel)
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
X-List-Received-Date: Fri, 10 Dec 2010 17:35:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Thu, 2010-12-09 at 13:03, Chris Spehn wrote:
> The file system is currently emulated. We mount the loopback image
> formatted as ext2 from the iOS partition. I think I misunderstood what
> ext2 actually does in the machine configuration file. Although, in the
> future the iDroid project plans to partition the NAND. When this will
> get done, I have no idea. I could probably remove gps and bluetooth
> from MACHINE_FEATURES as well since I have not implemented those
> features yet.

Thanks for the explanation. Its no big deal to leave them in for now even if the
kernel support is not ready yet. GNUtoo, its up to you if you want to commit the
patch or remove the features before commiting.

regards
Stefan Schmidt


