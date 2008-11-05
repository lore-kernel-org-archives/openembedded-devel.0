Received: from [78.47.116.19] (helo=sirius.lasnet.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1KxpXI-0006KS-Bb
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Nov 2008 22:03:32 +0100
Received: from p5b035f60.dip.t-dialin.net ([91.3.95.96]
	helo=dodger.lab.datenfreihafen.org) by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1Kxort-0005WA-Ia by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Nov 2008 21:20:48 +0100
Received: from stefan by dodger.lab.datenfreihafen.org with local (Exim 4.69)
	(envelope-from <stefan@dodger.lab.datenfreihafen.org>)
	id 1Kxot0-0005Q1-DU for openembedded-devel@lists.openembedded.org;
	Wed, 05 Nov 2008 21:21:54 +0100
Date: Wed, 5 Nov 2008 21:21:53 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20081105202153.GB5836@dodger.lab.datenfreihafen.org>
MIME-Version: 1.0
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.18 (2008-05-17)
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.3
Subject: Broken update-mime-database due to recent changes
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
X-List-Received-Date: Wed, 05 Nov 2008 21:03:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

After having some fun digging around in laucher code I got a hint today why
there where misisng icons in my launcher. Raster and Thomas found out that

update-mime-database /usr/share/mime

wasn't run. Doing that by hand and restarting the xserver gave me back all
missing icons.

The breakage came with the new shared-mime-info stuff from poky.
http://git.openembedded.net/?p=openembedded.git;a=commitdiff;h=8ea71e53c9823cda874f03c3705596f996a5ee1c

Removing the postint hook from .inc and just adding it back to 0.51 broke 0.20
and 0.22.

The option to fix this how I see it (personal priority ordered):

1) Put the known working pkg_postinst() back into the 0.20 and 0.22 recipes
2) Make the old versions also work with the build-on-host method
3) Remove all but 0.51 and teach distros to use the new one.

Thoughts?

regards
Stefan Schmidt


