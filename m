Received: from [78.47.116.19] (helo=sirius.lasnet.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1Kyuwd-0001R0-Rm
	for openembedded-devel@lists.openembedded.org;
	Sat, 08 Nov 2008 22:02:12 +0100
Received: from p5b034852.dip.t-dialin.net ([91.3.72.82]
	helo=dodger.lab.datenfreihafen.org) by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1Kyuuu-0002gc-MZ by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 08 Nov 2008 22:00:30 +0100
Received: from stefan by dodger.lab.datenfreihafen.org with local (Exim 4.69)
	(envelope-from <stefan@dodger.lab.datenfreihafen.org>)
	id 1Kyuw7-0003Zr-AX for openembedded-devel@lists.openembedded.org;
	Sat, 08 Nov 2008 22:01:39 +0100
Date: Sat, 8 Nov 2008 22:01:38 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20081108210138.GA7205@dodger.lab.datenfreihafen.org>
References: <20081105202153.GB5836@dodger.lab.datenfreihafen.org>
MIME-Version: 1.0
In-Reply-To: <20081105202153.GB5836@dodger.lab.datenfreihafen.org>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.18 (2008-05-17)
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00,
	NORMAL_HTTP_TO_IP autolearn=ham version=3.2.3
Subject: Re: Broken update-mime-database due to recent changes
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
X-List-Received-Date: Sat, 08 Nov 2008 21:02:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

Seems not to be a topic much people are interested in. :)

On Wed, 2008-11-05 at 21:21, Stefan Schmidt wrote:
> 
> The option to fix this how I see it (personal priority ordered):
> 
> 1) Put the known working pkg_postinst() back into the 0.20 and 0.22 recipes

I put the postint back into the recipes. Not the inc file as 0.51 does not need
it. Tested and worked fine for me again.

> 2) Make the old versions also work with the build-on-host method

No plan from my side.

> 3) Remove all but 0.51 and teach distros to use the new one.

For this one shared-mime-info-native_0.51.bb is needed. Sadly this one fails for
me on one machine:

| /usr/bin/ld: cannot find -lgio-2.0

http://134.169.172.106/~sschmidt/log.do_compile.28587.txt

Therefor I did not bump it for OM yet. People like to investigate are welcome.

regards
Stefan Schmidt


