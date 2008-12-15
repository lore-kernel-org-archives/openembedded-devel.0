Received: from [78.47.116.19] (helo=sirius.lasnet.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1LCBWB-00068R-Bx
	for openembedded-devel@openembedded.org; Mon, 15 Dec 2008 12:21:43 +0100
Received: from c120.apm.etc.tu-bs.de ([134.169.174.120] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1LCBRu-00077z-UL by authid <stefan@sostec.de> with cram_md5;
	Mon, 15 Dec 2008 12:17:21 +0100
Received: from stefan by excalibur.local with local (Exim 4.69)
	(envelope-from <stefan@excalibur.local>)
	id 1LCBRn-0003nF-Ur; Mon, 15 Dec 2008 12:17:11 +0100
Date: Mon, 15 Dec 2008 12:17:11 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@openembedded.org
Message-ID: <20081215111711.GC11095@excalibur.local>
MIME-Version: 1.0
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.18 (2008-05-17)
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.3
Subject: How to handle deps on different connman versions?
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
X-List-Received-Date: Mon, 15 Dec 2008 11:21:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

I just pushed a connman-0.2 recipe into the tree. That makes three of it, as we
also have git and 0.1.

I'm thinking about how to handle this lately. At the moment 0.1 and 0.2 have
both default to -1. The git recipe has a fixed SCREV that points to a rev which
matches the API used by om-settings. Since then the API changed a lot and at
least this will break when we update the SRREV or go with the releases. Do we
have others sonsumers of the connman API in OE yet?

John, can you give us some infos from the OM perspective here? Does something
like this not matter as you build from your own stable branch? Is om-settings
still relevant?

From my way to write you see that I would prefer to remove the default -1 from
the releases based recipes. In the end the work I'm doing right now will be used
as replacement for the wifi part in om-settinngs anyway when moving to the
framework. I juts aks beacuse the transition may cause trouble.

regards
Stefan Schmidt


