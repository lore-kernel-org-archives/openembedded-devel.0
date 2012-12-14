Received: from mail.mlbassoc.com ([65.100.170.105] helo=zeus)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gthomas@zeus>) id 1Tjcfo-0000m1-LS
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Dec 2012 22:20:00 +0100
Received: by zeus (Postfix, from userid 996)
	id 45AFF520C4C; Fri, 14 Dec 2012 14:05:50 -0700 (MST)
From: Gary Thomas <gary@mlbassoc.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Dec 2012 14:05:48 -0700
Message-Id: <1355519149-23005-1-git-send-email-gary@mlbassoc.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH] rng-tools: Fixes for latest OE layouts
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
X-List-Received-Date: Fri, 14 Dec 2012 21:20:00 -0000

The current recipe has a few installation errors:
  * The manipulation of configurable paths drops a '/'
  * The init script defaults are placed in the wrong file
  * Finer control over init script start/stop
  * The default device is non-standard

This patch fixes these little nits and makes the package usable again.

Signed-off-by: Gary Thomas <gary@mlbassoc.com>
---
 meta-oe/recipes-support/rng-tools/files/default  |    3 ++-
 meta-oe/recipes-support/rng-tools/rng-tools_2.bb |    5 +++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/rng-tools/files/default b/meta-oe/recipes-support/rng-tools/files/default
index ab7cd93..7aede9b 100644
--- a/meta-oe/recipes-support/rng-tools/files/default
+++ b/meta-oe/recipes-support/rng-tools/files/default
@@ -1,2 +1,3 @@
 # Specify rng device
-RNG_DEVICE=/dev/hwrng
+#RNG_DEVICE=/dev/hwrng
+RNG_DEVICE=/dev/urandom
diff --git a/meta-oe/recipes-support/rng-tools/rng-tools_2.bb b/meta-oe/recipes-support/rng-tools/rng-tools_2.bb
index ef753cf..b94854a 100644
--- a/meta-oe/recipes-support/rng-tools/rng-tools_2.bb
+++ b/meta-oe/recipes-support/rng-tools/rng-tools_2.bb
@@ -15,12 +15,13 @@ inherit autotools update-rc.d
 do_install_append() {
         install -d "${D}${sysconfdir}/init.d"
         install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/rng-tools
-        sed -i -e 's,/etc/,${sysconfdir}/,' -e 's,/usr/sbin/,${sbindir},' \
+        sed -i -e 's,/etc/,${sysconfdir}/,' -e 's,/usr/sbin/,${sbindir}/,' \
             ${D}${sysconfdir}/init.d/rng-tools
 
         install -d "${D}${sysconfdir}/default"
-        install -m 0644 ${WORKDIR}/default ${D}${sysconfdir}/default
+        install -m 0644 ${WORKDIR}/default ${D}${sysconfdir}/rng-tools
 }
 
 INITSCRIPT_NAME = "rng-tools"
 INITSCRIPT_PARAMS = "defaults"
+INITSCRIPT_PARAMS = "start 30 S . stop 30 0 6 1 ."
-- 
1.7.9.5



