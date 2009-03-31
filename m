Received: from [80.81.242.146] (helo=amethyst.openembedded.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen@amethyst.openembedded.net>) id 1Lokkg-0001HO-Bu
	for openembedded-devel@lists.linuxtogo.org;
	Tue, 31 Mar 2009 22:40:06 +0200
Received: by amethyst.openembedded.net (Postfix, from userid 1002)
	id BA234189477; Tue, 31 Mar 2009 22:40:13 +0200 (CEST)
From: Koen Kooi <k.kooi@student.utwente.nl>
To: openembedded-devel@lists.linuxtogo.org
Date: Tue, 31 Mar 2009 22:40:13 +0200
Message-Id: <1238532013-3080-1-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.5.6.5
Cc: Koen Kooi <koen@openembedded.org>
Subject: [STABLE][PATCH] angstrom 2009.X: switch to bluez4
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
X-List-Received-Date: Tue, 31 Mar 2009 20:40:06 -0000

From: Koen Kooi <koen@openembedded.org>


Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 conf/distro/angstrom-2008.1.conf |    7 +++++++
 recipes/tasks/task-base.bb       |    2 +-
 2 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/conf/distro/angstrom-2008.1.conf b/conf/distro/angstrom-2008.1.conf
index cde01e1..57048d6 100644
--- a/conf/distro/angstrom-2008.1.conf
+++ b/conf/distro/angstrom-2008.1.conf
@@ -188,6 +188,13 @@ IPKG_VARIANT = "opkg-nogpg angstrom-version ${ANGSTROM_FEED_CONFIGS}"
 
 # do some task-base stuff here
 
+# Prefer bluez4, it's needed for things like connman. Bluez4 is also largely backward compatible with
+# bluez 3.x
+DISTRO_BLUETOOTH_MANAGER = "\
+	blueprobe \
+	bluez4 \
+   "
+
 # We want to ship extra debug utils in the rootfs when doing a debug build 
 DEBUG_APPS ?= ""
 DEBUG_APPS += '${@base_conditional("DISTRO_TYPE", "release", "", "strace procps",d)}'
diff --git a/recipes/tasks/task-base.bb b/recipes/tasks/task-base.bb
index c60ae4f..4003359 100644
--- a/recipes/tasks/task-base.bb
+++ b/recipes/tasks/task-base.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Merge machine and distro options to create a basic machine task/package"
-PR = "r79"
+PR = "r80"
 
 inherit task
 
-- 
1.5.6.5



