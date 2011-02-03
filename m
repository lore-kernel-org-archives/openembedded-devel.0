Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>) id 1PkzsG-0002L0-Ne
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Feb 2011 15:09:28 +0100
Received: from [2001:638:602:1183:21f:16ff:fe0d:7d41] (helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1Pkzr8-0008NI-A2 by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Feb 2011 15:08:34 +0100
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>) id 1Pkzr6-00028M-BS
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Feb 2011 15:08:16 +0100
Date: Thu, 3 Feb 2011 15:08:16 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110203140816.GM4580@excalibur.local>
References: <20110203093253.GG4580@excalibur.local>
	<201102031054.08764.ml@vdm-design.de> <20110203101242.GF3265@jama>
	<20110203124244.GJ4580@excalibur.local>
MIME-Version: 1.0
In-Reply-To: <20110203124244.GJ4580@excalibur.local>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,NO_RELAYS
	autolearn=ham version=3.2.5
Subject: Re: libnl vs. libnl2 madness
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
X-List-Received-Date: Thu, 03 Feb 2011 14:09:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Thu, 2011-02-03 at 13:42, Stefan Schmidt wrote:
> 
> On Thu, 2011-02-03 at 11:12, Martin Jansa wrote:
> > and:
> > http://gitorious.org/~jama/angstrom/jama-shr-experimental/commit/70b13d30b335b8fd67116d3bc0834382a77bc319
> > 81      ANGSTROM_BLACKLIST_pn-bmon = "bmon depends on libnl we want libnl2"
> > 82	ANGSTROM_BLACKLIST_pn-crda = "crda depends on libnl we want libnl2"
> 
> No idea about these two.

crda should be able to work with libnl2 but have issues during do_install()

> 
> > 85	ANGSTROM_BLACKLIST_pn-iw = "iw depends on libnl we want libnl2"
> 
> Need to check latest version for libnl2 support. Should not be to hard to change
> it.

Koen spotted that it should be workig with libnl2 and a build test was positive.

> > I didn't check if those can be built with libnl2 or if they work properly with libnl2.
> 
> As you can see I would be willing to work on some of these. Personally I would
> aim for getting the recipes over to libnl2 and the kill libnl1 for good in OE.

I have an patch removing it but this may have just to many sideeffects on our
metadata. Koens pointed out that we maybe should switch the inc dir from libnl
to a "wrong" place and leave libnl2 header at the correct place. Obviously we
need to fix most of our recipes for libnl2 before such a step.

regards
Stefan Schmidt


