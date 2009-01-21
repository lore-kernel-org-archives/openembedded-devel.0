Received: from [78.47.116.19] (helo=sirius.lasnet.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1LPb58-0002Bl-KI
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Jan 2009 12:17:14 +0100
Received: from c120.apm.etc.tu-bs.de ([134.169.174.120] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1LPayC-0002cP-UA by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Jan 2009 12:10:09 +0100
Received: from stefan by excalibur.local with local (Exim 4.69)
	(envelope-from <stefan@excalibur.local>) id 1LPayG-00075u-Ep
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Jan 2009 12:10:08 +0100
Date: Wed, 21 Jan 2009 12:10:08 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090121111008.GB3726@excalibur.local>
MIME-Version: 1.0
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.18 (2008-05-17)
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.3
Subject: Where to put a check if my tmp is a symlink?
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
X-List-Received-Date: Wed, 21 Jan 2009 11:17:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

I spent at least 2 hours yesterday to understand why lintool-native breaks on a
build from scratch for me now.

Finally I found this bugreport:
http://bugs.openembedded.org/show_bug.cgi?id=4904

And yes I thought symlinking between different tmp dirs would be a neat idea.
Without symlink it works fine again. This leads me to the question if we should
check for this and bail out instead of letting the first 150 tasks go through
and then fail in libtool with "already configured use make distclean"

Anything I missed?

regards
Stefan Schmidt


