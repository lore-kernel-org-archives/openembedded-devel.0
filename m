Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1NfwuH-00045r-6I
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Feb 2010 15:54:12 +0100
Received: (qmail 479 invoked by uid 813007); 12 Feb 2010 14:51:35 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 12 Feb 2010 14:51:35 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Feb 2010 15:51:21 +0100
Message-Id: <1265986283-28972-1-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.6.1
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Patches to solve libblkid/libuuid version problems
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
X-List-Received-Date: Fri, 12 Feb 2010 14:54:12 -0000

There are two recipes which provides libblkid, libuuid and fsck:
e2fsprogs (older 1.x) and util-linux-ng (newer 2.x).

More and more applications/libraries require 2.x versions but in OE it
depends on build order if both are built.

And as I got hit by problem I decided to clean it a bit. Resulting
patches are result. They are not perfect but should help. I did not
tested on any device yet - only did Angstrom build.

Review, comment etc.





