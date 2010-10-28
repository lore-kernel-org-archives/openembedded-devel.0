Received: from usps2.crhc.illinois.edu ([130.126.143.231]
	helo=usps.crhc.uiuc.edu) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <johnso87@crhc.illinois.edu>) id 1PBJLN-0005l1-5r
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Oct 2010 05:40:01 +0200
Received: from usps.crhc.uiuc.edu (localhost [127.0.0.1])
	by usps.crhc.uiuc.edu (Postfix) with ESMTP id 4245F340009B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Oct 2010 22:39:19 -0500 (CDT)
Received: from localhost.localdomain (corezilla.crhc.uiuc.edu [130.126.143.45])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested) (Authenticated sender: johnso87)
	by usps.crhc.uiuc.edu (Postfix) with ESMTPSA id 2C0C13400090
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Oct 2010 22:39:19 -0500 (CDT)
From: Matt Johnson <johnso87@crhc.illinois.edu>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Oct 2010 22:39:09 -0500
Message-Id: <1288237150-6284-1-git-send-email-johnso87@crhc.illinois.edu>
X-Mailer: git-send-email 1.6.3.3
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 130.126.143.231
X-SA-Exim-Mail-From: johnso87@crhc.illinois.edu
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Consistent MAC address for Beagleboard xM
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
X-List-Received-Date: Thu, 28 Oct 2010 03:40:01 -0000


Sorry about the previous 2 emails, didn't know how the text file mapped to the email.

Let me know if the code or the patch submission need to be improved.  Two potential
improvements I've thought about are checking for a BeagleBoard xM instead of just
CONFIG_MACH_OMAP_BEAGLE and making the MAC out of a cryptographically-sound hash,
rather than the raw die ID bits, in case those bits give away too much.


