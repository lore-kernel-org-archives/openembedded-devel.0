Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>) id 1Q2Kpj-00078k-3V
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Mar 2011 10:58:31 +0100
Received: from [2001:638:602:1183:21f:16ff:fe0d:7d41] (helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1Q2Knw-0005cx-LE by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Mar 2011 10:56:42 +0100
Received: from stefan by excalibur.local with local (Exim 4.74)
	(envelope-from <stefan@excalibur.local>) id 1Q2Knu-0006Sh-9V
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Mar 2011 10:56:38 +0100
Date: Wed, 23 Mar 2011 10:56:37 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110323095637.GF21392@excalibur.local>
References: <1300819478-6906-1-git-send-email-GNUtoo@no-log.org>
	<1300819478-6906-2-git-send-email-GNUtoo@no-log.org>
MIME-Version: 1.0
In-Reply-To: <1300819478-6906-2-git-send-email-GNUtoo@no-log.org>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,NO_RELAYS
	autolearn=ham version=3.2.5
Subject: Re: [PATCH 2/3] linux-omap-hah-2.6.31: switch to the last srcrev, and use local defconfig
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
X-List-Received-Date: Wed, 23 Mar 2011 09:58:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Tue, 2011-03-22 at 19:44, Denis 'GNUtoo' Carikli wrote:
> With this patch:
>  * The last srcrev of the linux-omap-hah is used, which brings some fixes
>  * The defconfig can now be overriden in openembedded

I know that John suggested this, but I don't like the aproach to have
the defconfig in OE whcih needs syncing with the upstream config
instead of using that one.

I had choosen the approach to use the upstream config as I trust our
kernel devs and copy it into OE as defconfig to allow for further
changes needed for OE.

The config change in the third patch is fine, but I would prefer to
get this directly into the upstream config and just bump SRCREV here.

Will talk about this to John.

regards
Stefan Schmidt


