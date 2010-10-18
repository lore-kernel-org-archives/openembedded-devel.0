Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <morphis@gravedo.de>) id 1P7uoV-0004VT-QY
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Oct 2010 20:52:06 +0200
Received: by gravedo.de (Postfix, from userid 5001)
	id 50FAD275CE82; Mon, 18 Oct 2010 20:51:30 +0200 (CEST)
Received: from localhost (p5489BE68.dip.t-dialin.net [84.137.190.104])
	by gravedo.de (Postfix) with ESMTPSA id 0D173275CD26;
	Mon, 18 Oct 2010 20:51:28 +0200 (CEST)
From: Simon Busch <morphis@gravedo.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Oct 2010 20:51:10 +0200
Message-Id: <1287427884-1517-2-git-send-email-morphis@gravedo.de>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1287427884-1517-1-git-send-email-morphis@gravedo.de>
References: <1287427884-1517-1-git-send-email-morphis@gravedo.de>
X-SA-Exim-Connect-IP: 85.214.79.159
X-SA-Exim-Mail-From: morphis@gravedo.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 01/15] tslib: adjust various recipe settings for the palmpre machine
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
X-List-Received-Date: Mon, 18 Oct 2010 18:52:06 -0000

* set PACKAGE_ARCH = "${MACHINE_ARCH}" for palmpre machine
* provide special EXTRA_CONF setting to build plugin for the cy8mrln touchscreen

Signed-off-by: Simon Busch <morphis@gravedo.de>
---
 recipes/tslib/tslib.inc    |    2 ++
 recipes/tslib/tslib_git.bb |   15 +++++++++++++++
 2 files changed, 17 insertions(+), 0 deletions(-)

diff --git a/recipes/tslib/tslib.inc b/recipes/tslib/tslib.inc
index a8b8e45..4c4cda1 100644
--- a/recipes/tslib/tslib.inc
+++ b/recipes/tslib/tslib.inc
@@ -46,6 +46,8 @@ RPROVIDES_tslib-conf = "libts-0.0-conf"
 
 # Machines with machine specific patches
 PACKAGE_ARCH_mnci = "${MACHINE_ARCH}"
+PACKAGE_ARCH_palmpre = "${MACHINE_ARCH}"
+
 # Machines with machine specific config files (tslib.sh)
 PACKAGE_ARCH_tslib-conf_a780 = "${MACHINE_ARCH}"
 PACKAGE_ARCH_tslib-conf_collie = "${MACHINE_ARCH}"
diff --git a/recipes/tslib/tslib_git.bb b/recipes/tslib/tslib_git.bb
index 1d79061..63e6645 100644
--- a/recipes/tslib/tslib_git.bb
+++ b/recipes/tslib/tslib_git.bb
@@ -6,4 +6,19 @@ PR = "${INC_PR}.1"
 
 DEFAULT_PREFERENCE = "-1"
 
+# move this to tslib.inc when upstream releases a new version which includes support for
+# the palmpre machine
+EXTRA_OECONF_palmpre = " \
+   --enable-shared \
+   --enable-cy8mrln-palmpre \
+   --enable-input \
+   --disable-h3600 \
+   --disable-corgi \
+   --disable-collie \
+   --disable-mk712 \
+   --disable-artic2 \
+   --disable-ucb1x00 \
+   --disable-tatung \
+"
+
 include tslib.inc
-- 
1.7.1



