Received: from [78.47.116.19] (helo=sirius.lasnet.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1LCUrg-0003tZ-Du
	for openembedded-devel@openembedded.org; Tue, 16 Dec 2008 09:01:12 +0100
Received: from w1536.wlan.rz.tu-bs.de ([134.169.206.12] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1LCUnL-0002wL-DG by authid <stefan@sostec.de> with cram_md5;
	Tue, 16 Dec 2008 08:56:46 +0100
Received: from stefan by excalibur.local with local (Exim 4.69)
	(envelope-from <stefan@excalibur.local>)
	id 1LCUnE-00033u-LW; Tue, 16 Dec 2008 08:56:36 +0100
Date: Tue, 16 Dec 2008 08:56:36 +0100
From: Stefan Schmidt <stefan@openmoko.org>
To: John Lee <john_lee@openmoko.org>
Message-ID: <20081216075636.GA16231@excalibur.local>
References: <20081215111711.GC11095@excalibur.local>
	<20081216042140.GK3299@buddha.tw.openmoko.com>
MIME-Version: 1.0
In-Reply-To: <20081216042140.GK3299@buddha.tw.openmoko.com>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.18 (2008-05-17)
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.3
Cc: openembedded-devel@openembedded.org, Marek Lindner <marek@openmoko.com>
Subject: Re: How to handle deps on different connman versions?
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
X-List-Received-Date: Tue, 16 Dec 2008 08:01:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Tue, 2008-12-16 at 12:21, John Lee wrote:
> On Mon, Dec 15, 2008 at 12:17:11PM +0100, Stefan Schmidt wrote:
> > 
> > I just pushed a connman-0.2 recipe into the tree. That makes three of it, as we
> > also have git and 0.1.
> > 
> > I'm thinking about how to handle this lately. At the moment 0.1 and 0.2 have
> > both default to -1. The git recipe has a fixed SCREV that points to a rev which
> > matches the API used by om-settings. Since then the API changed a lot and at
> > least this will break when we update the SRREV or go with the releases. Do we
> > have others sonsumers of the connman API in OE yet?
> > 
> > John, can you give us some infos from the OM perspective here? Does something
> > like this not matter as you build from your own stable branch? Is om-settings
> > still relevant?
> 
> there's no wifi function in om-settings now, therefore there should
> not be any dependency.

Thanks for the confirmation. That means I can upgrade it in OE.dev now without
risk of breaking stuff.

regards
Stefan Schmidt


