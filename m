Received: from [85.33.2.12] (helo=smtp-out01.alice.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1Mqo6x-0005dC-NU
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Sep 2009 15:11:54 +0200
Received: from FBCMMO05.fbc.local ([192.168.184.136]) by smtp-out01.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 24 Sep 2009 15:11:11 +0200
Received: from FBCMCL01B07.fbc.local ([192.168.171.45]) by FBCMMO05.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 24 Sep 2009 15:11:08 +0200
Received: from [192.168.1.107] ([79.51.162.213]) by FBCMCL01B07.fbc.local with
	Microsoft SMTPSVC(6.0.3790.3959); Thu, 24 Sep 2009 15:11:07 +0200
From: GNUtoo <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Sep 2009 15:11:05 +0200
Message-Id: <1253797865.5877.110.camel@localhost>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.4 
X-OriginalArrivalTime: 24 Sep 2009 13:11:07.0574 (UTC)
	FILETIME=[7A69BD60:01CA3D18]
X-SA-Exim-Connect-IP: 85.33.2.12
X-SA-Exim-Mail-From: GNUtoo@no-log.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [RFC] remove mdev recipe(already in busybox)
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
X-List-Received-Date: Thu, 24 Sep 2009 13:11:54 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi, Tom Rin said:
"To follow up to myself, the 'mdev' package should just go away really.
This particular bug is because 'mdev' has an empty mdev.conf while
busybox's mdev does not, and it contains console/null/etc entries."
in "Re: [oe] [PATCH] mdev: mdev.sh: permit serial console login and
correct init runlevel" 
( http://article.gmane.org/gmane.comp.handhelds.openembedded/25296 )
So should we remove mdev recipe and use busybox's mdev instead...if so
all the recipe/distro that were using it must be updated.
for intance the micro-base-image use it:
IMAGE_DEV_MANAGER = "mdev"
that should be replaced by:
IMAGE_DEV_MANAGER = "busybox-mdev"
A quick grep for IMAGE_DEV_MANAGER in the dev branch shows that only the
micro-base-image use it...

Does someone have an objection(for the mdev recipe removal)?

By the way i sent that mail because there could have things that I
didn't thought,people that could depend on .dev but use external
recipes(I was thinking of thing like MokoMakefiles),or issues with other
branches,But also because I was told to do so.

Denis.





