Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>) id 1PkvZd-0001YN-UK
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Feb 2011 10:33:57 +0100
Received: from [2001:638:602:1183:21f:16ff:fe0d:7d41] (helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1PkvYc-0004lR-R1 by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Feb 2011 10:32:58 +0100
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>) id 1PkvYb-0006EW-8o
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Feb 2011 10:32:53 +0100
Date: Thu, 3 Feb 2011 10:32:53 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110203093253.GG4580@excalibur.local>
MIME-Version: 1.0
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,NO_RELAYS
	autolearn=ham version=3.2.5
Subject: libnl vs. libnl2 madness
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
X-List-Received-Date: Thu, 03 Feb 2011 09:33:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

The last hours I was trying to compile wpa_supplicant with nl80211 support. That
needs netlink support through libnl or libnl2.

Enabling the option to use libnl2, not that easy to find, still breaks with
missing header files. Checking the libnl2 source shows that they are provided.
After some head on the table banging I found:

commit 880e00d3b7ccf66d9421a06bc28e553e07842b59
Author: Michael 'Mickey' Lauer <mickey@vanille-media.de>
Date:   Tue Nov 24 16:33:06 2009 +0000

    libnl2: change includedir to not step over libnl1; also convert to new staging

which brings in this:

+includedir = ${prefix}/include/libnl2

Resulting in header files getting staged in to libnl2/netlink/fooo instead of
netlink/foo.

This obviously breaks every application that uses libnl2. Reverting this part
makes wpa_supplicant happy.

Can somebody bring some light into this? Do we have libnl1 only recipes in our
metadata?

If libnl2 overrides header files from libnl with other content this is of course
bad. As is to move away header files from the usual location and breaking apps.

regards
Stefan Schmidt


