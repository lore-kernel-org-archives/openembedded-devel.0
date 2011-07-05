Received: from smtp203.alice.it ([82.57.200.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <GNUtoo@no-log.org>) id 1QeFLM-00087d-Db
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Jul 2011 01:47:52 +0200
Received: from gnutoo-laptop (79.50.137.190) by smtp203.alice.it (8.5.124.08)
	(authenticated as editempo@alice.it)
	id 4DEE191D008AE61A; Wed, 6 Jul 2011 01:44:02 +0200
From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Jul 2011 01:44:00 +0200
Message-Id: <1309909440-7860-1-git-send-email-GNUtoo@no-log.org>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH] angstrom-2010-preferred-versions: select udev168 for the bug machine
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
X-List-Received-Date: Tue, 05 Jul 2011 23:47:52 -0000

Angstrom 2010 selects udev 171 by default for all the machines,
but the bug machine has a 2.6.27 kernel, and would need quite a lot
of backport in order to work with udev 171 + its udev 141 compat wrapper

udev 171 + udev 141 compat wrapper doesn't work on the bug machine,
  even with a backported accept4() syscall.

So selecting udev 168 for the bug sounds a good choice.

Note that udev 168 is machine arch for the bug machine,
  so if it was built before building udev 171 it's automatically
  selected

Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
---
 .../include/angstrom-2010-preferred-versions.inc   |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/conf/distro/include/angstrom-2010-preferred-versions.inc b/conf/distro/include/angstrom-2010-preferred-versions.inc
index 8ce3ee7..5f160b8 100644
--- a/conf/distro/include/angstrom-2010-preferred-versions.inc
+++ b/conf/distro/include/angstrom-2010-preferred-versions.inc
@@ -66,6 +66,7 @@ PREFERRED_VERSION_tiff 		= "3.9.4+4.0.0beta6"
 PREFERRED_VERSION_tslib		= "1.0+gitr%"
 
 PREFERRED_VERSION_udev 		= "171"
+PREFERRED_VERSION_udev_bug	= "168"
 
 PREFERRED_VERSION_usbutils = "0.86"
 PREFERRED_VERSION_wpa-supplicant = "0.7.3"
-- 
1.7.1



