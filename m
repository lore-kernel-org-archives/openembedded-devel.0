Received: from [64.22.125.45] (helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koansoftware@gmail.com>) id 1M3y0b-0008Id-MC
	for Openembedded-devel@lists.openembedded.org;
	Tue, 12 May 2009 21:51:25 +0200
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id 4FBB32C7FE
	for <Openembedded-devel@lists.openembedded.org>;
	Tue, 12 May 2009 19:44:18 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lv8G5qyJ1Ugf
	for <Openembedded-devel@lists.openembedded.org>;
	Tue, 12 May 2009 19:44:17 +0000 (UTC)
Received: from [10.1.10.2] (host61-87-static.14-79-b.business.telecomitalia.it
	[79.14.87.61]) by wiki.koala.it (Postfix) with ESMTP id B145C2C7F9
	for <Openembedded-devel@lists.openembedded.org>;
	Tue, 12 May 2009 19:44:16 +0000 (UTC)
Message-ID: <4A09D17C.8000204@gmail.com>
Date: Tue, 12 May 2009 21:43:56 +0200
From: Marco Cavallini <koansoftware@gmail.com>
Organization: KOAN sas - Bergamo - Italia
User-Agent: Thunderbird 2.0.0.21 (X11/20090318)
MIME-Version: 1.0
To: Openembedded-devel@lists.openembedded.org
Subject: [PATCH][STABLE] Modified conf/distro/kaeilos.conf
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
X-List-Received-Date: Tue, 12 May 2009 19:51:25 -0000
Content-Type: multipart/mixed; boundary="------------090601060907010703070207"

--------------090601060907010703070207
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit


--
/marco

--------------090601060907010703070207
Content-Type: text/x-diff;
 name="0001-Modified-conf-distro-kaeilos.conf.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="0001-Modified-conf-distro-kaeilos.conf.patch"

From ca950aa478533aa7ba5ba452a1d6e602cc881d4b Mon Sep 17 00:00:00 2001
From: Marco Cavallini <m.cavallini@koansoftware.com>
Date: Tue, 12 May 2009 21:24:56 +0200
Subject: [PATCH][STABLE] Modified conf/distro/kaeilos.conf
 * added IPKG_VARIANT so postinst script can run
 * added Prefer bluez4


Signed-off-by: Marco Cavallini <m.cavallini@koansoftware.com>
---
 conf/distro/kaeilos.conf |   14 +++++++++++++-
 1 files changed, 13 insertions(+), 1 deletions(-)

diff --git a/conf/distro/kaeilos.conf b/conf/distro/kaeilos.conf
index a65bbff..36cdc0f 100644
--- a/conf/distro/kaeilos.conf
+++ b/conf/distro/kaeilos.conf
@@ -7,7 +7,7 @@
 
 #DISTRO_VERSION = "2008.1"
 DISTRO_VERSION = "2008.1-test-${DATE}"
-DISTRO_REVISION = "1"
+DISTRO_REVISION = "2"
 DISTRO_PR = ".1"
 
 #build staging from packages
@@ -162,8 +162,20 @@ PREFERRED_PROVIDER_task-bootstrap = "task-bootstrap"
 
 require conf/distro/include/kaeilos.inc
 
+# If we're using an .ipk based rootfs, we want to have opkg-nogpg installed so postinst script can run
+# We also take this opportunity to inject angstrom-version and the feed configs into the rootfs
+IPKG_VARIANT = "opkg-nogpg angstrom-version ${ANGSTROM_FEED_CONFIGS}"
+
 # do some task-base stuff here
 
+# Prefer bluez4, it's needed for things like connman. Bluez4 is also largely backward compatible with
+# bluez 3.x
+DISTRO_BLUETOOTH_MANAGER = "\
+	blueprobe \
+	bluez4 \
+   "
+
+
 # We want to ship extra debug utils in the rootfs when doing a debug build 
 DEBUG_APPS ?= ""
 DEBUG_APPS += '${@base_conditional("DISTRO_TYPE", "release", "", "strace procps",d)}'
-- 
1.5.6.5


--------------090601060907010703070207--
