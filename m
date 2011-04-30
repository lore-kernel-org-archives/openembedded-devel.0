Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1QG9NC-0006pO-3y
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 Apr 2011 14:34:10 +0200
Received: (qmail invoked by alias); 30 Apr 2011 12:31:35 -0000
Received: from p57963A68.dip.t-dialin.net (EHLO localhost.localdomain)
	[87.150.58.104]
	by mail.gmx.net (mp066) with SMTP; 30 Apr 2011 14:31:35 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/UYQ1JcpzUvfnbA7bT31/HAma9HMO4HivFw0I9RJ
	weWxbu0bbvV4b/
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 30 Apr 2011 14:32:08 +0200
Message-Id: <1304166728-3002-1-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
X-Y-GMX-Trusted: 0
Subject: [PATCH] libgpsbt: add dbus-glib to DEPENDS
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
X-List-Received-Date: Sat, 30 Apr 2011 12:34:10 -0000

During performance tests with BB_NUMBER_THREADS > 10
libgpsbt failed with

| /home/Superandy/tmp/sysroots/x86_64-linux/usr/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.5.3/../../../../arm-angstrom-linux-gnueabi/bin/ld: cannot find -ldbus-glib-1
| collect2: ld returned 1 exit status
| make[1]: *** [libgpsbt.la] Error 1
| make[1]: Leaving directory `/home/Superandy/tmp/work/armv7a-angstrom-linux-gnueabi/libgpsbt-0.1-r2/libgpsbt-0.1'
| make: *** [all] Error 2
| + die 'oe_runmake failed'
| + oefatal 'oe_runmake failed'
| + echo FATAL: 'oe_runmake failed'
| FATAL: oe_runmake failed
| + exit 1
...
ERROR: '/home/Superandy/data/OpenEmbedded/gumstix-oe/recipes/maemo4/libgpsbt_0.1.bb' failed

Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
---
 recipes/maemo4/libgpsbt_0.1.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/maemo4/libgpsbt_0.1.bb b/recipes/maemo4/libgpsbt_0.1.bb
index c6c6ea6..d199379 100644
--- a/recipes/maemo4/libgpsbt_0.1.bb
+++ b/recipes/maemo4/libgpsbt_0.1.bb
@@ -1,8 +1,8 @@
 LICENSE = "nokia"
 
-PR = "r2"
+PR = "r3"
 
-DEPENDS = "libgpsmgr dbus"
+DEPENDS = "libgpsmgr dbus dbus-glib"
 
 # This is proprietary software in Chinook, so we have to stay with the last released
 # free version.
-- 
1.7.4.4



