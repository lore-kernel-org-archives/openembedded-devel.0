Received: from smtp202.alice.it ([82.57.200.98])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1OW1LL-0007Nx-LK
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Jul 2010 08:09:23 +0200
Received: from localhost.localdomain (95.244.160.23) by smtp202.alice.it
	(8.5.124.08) (authenticated as editempo@alice.it)
	id 4C1A2A7C003988EB for openembedded-devel@lists.openembedded.org;
	Tue, 6 Jul 2010 08:01:45 +0200
From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Jul 2010 08:01:40 +0200
Message-Id: <1278396101-30522-1-git-send-email-GNUtoo@no-log.org>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 82.57.200.98
X-SA-Exim-Mail-From: GNUtoo@no-log.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] htcdream: use xf86-video-fbdev and xf86-input-tslib
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
X-List-Received-Date: Tue, 06 Jul 2010 06:09:23 -0000


hi,
Just changing the machine config doesn't make it ship xf86-video-fbdev 
  and xf86-video-tslib when bitbaking shr-image ,because task-x11
  isn't rebuilt and so it ship the previous task-x11 which contained
  xf86-video-msm and xf86-input-evtouch.

Since task-x11 is core or will become core, I sent a patch instead
  of pushing.

Denis.



