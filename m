Received: from smtp-out29.alice.it ([85.33.2.29])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1OLijp-0000oc-C7
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Jun 2010 22:16:04 +0200
Received: from FBCMMO04.fbc.local ([192.168.184.135]) by smtp-out29.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 7 Jun 2010 22:10:36 +0200
Received: from FBCMCL01B03.fbc.local ([192.168.69.84]) by FBCMMO04.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 7 Jun 2010 22:10:35 +0200
Received: from localhost.localdomain ([95.237.157.170]) by
	FBCMCL01B03.fbc.local with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 7 Jun 2010 22:10:32 +0200
From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  7 Jun 2010 22:10:23 +0200
Message-Id: <1275941424-14837-1-git-send-email-GNUtoo@no-log.org>
X-Mailer: git-send-email 1.7.0.4
X-OriginalArrivalTime: 07 Jun 2010 20:10:32.0306 (UTC)
	FILETIME=[7B831D20:01CB067D]
X-SA-Exim-Connect-IP: 85.33.2.29
X-SA-Exim-Mail-From: GNUtoo@no-log.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] netbase: add support for htcdream
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
X-List-Received-Date: Mon, 07 Jun 2010 20:16:05 -0000

hi,
The default netbase's /etc/network/interfaces lacks 
auto usb0
So usb0 doesn't come up,and we can't ssh into the htcdream

Instead of changing the default netbase's /etc/network/interfaces,
I propose using the override system in order to make it work for 
the htcdream( so we would be using another /etc/network/interfaces 
for the htcdream)
*all the other machine do it like this
*it would have changed the default behaviour(which may not be wanted)

I sent a patch because I consider netbase as core,
nearly all the machines have an ovveride

Denis.



