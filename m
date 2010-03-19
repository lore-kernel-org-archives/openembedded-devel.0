Received: from office.altell.ru ([80.246.246.162])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1Nsc6Y-0001OE-25
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Mar 2010 14:19:15 +0100
Received: from localhost.localdomain (build2.altell.local [192.168.1.26])
	by mail.altell.local (Postfix) with ESMTP id 9189168757;
	Fri, 19 Mar 2010 16:06:44 +0300 (MSK)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 Mar 2010 16:11:15 +0300
Message-Id: <1269004282-10732-1-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.5.6.5
X-Altell-MailScanner-ID: 9189168757.AC807
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: khimov@altell.ru
X-SA-Exim-Connect-IP: 80.246.246.162
X-SA-Exim-Mail-From: khimov@altell.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] squid: move potentially reusable in other versions parts to .inc files
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
X-List-Received-Date: Fri, 19 Mar 2010 13:19:15 -0000

Signed-off-by: Roman I Khimov <khimov@altell.ru>
---
 recipes/squid/squid-native.inc             |    9 ++++++
 recipes/squid/squid-native_2.6.STABLE14.bb |   12 +------
 recipes/squid/squid.inc                    |   41 ++++++++++++++++++++++++++
 recipes/squid/squid_2.6.STABLE14.bb        |   43 ++--------------------------
 4 files changed, 55 insertions(+), 50 deletions(-)
 create mode 100644 recipes/squid/squid-native.inc
 create mode 100644 recipes/squid/squid.inc

diff --git a/recipes/squid/squid-native.inc b/recipes/squid/squid-native.inc
new file mode 100644
index 0000000..0f48805
--- /dev/null
+++ b/recipes/squid/squid-native.inc
@@ -0,0 +1,9 @@
+inherit native autotools
+
+SRC_URI = "http://www.squid-cache.org/Versions/v2/${SQUID_MAJOR}/squid-${PV}.tar.bz2"
+S = "${WORKDIR}/squid-${PV}"
+
+do_stage() {
+        install -d ${STAGING_BINDIR_NATIVE}   
+        install -m 0755 src/cf_gen ${STAGING_BINDIR_NATIVE}/cf_gen
+}
diff --git a/recipes/squid/squid-native_2.6.STABLE14.bb b/recipes/squid/squid-native_2.6.STABLE14.bb
index c8c4258..aede5dc 100644
--- a/recipes/squid/squid-native_2.6.STABLE14.bb
+++ b/recipes/squid/squid-native_2.6.STABLE14.bb
@@ -1,11 +1,3 @@
-inherit native autotools
+SQUID_MAJOR = "2.6"
 
-SRC_URI = "http://www.squid-cache.org/Versions/v2/2.6/squid-${PV}.tar.bz2"
-S = "${WORKDIR}/squid-${PV}"
-
-inherit native autotools
-
-do_stage() {
-        install -d ${STAGING_BINDIR_NATIVE}   
-        install -m 0755 src/cf_gen ${STAGING_BINDIR_NATIVE}/cf_gen
-}
+include squid-native.inc
diff --git a/recipes/squid/squid.inc b/recipes/squid/squid.inc
new file mode 100644
index 0000000..7fb3543
--- /dev/null
+++ b/recipes/squid/squid.inc
@@ -0,0 +1,41 @@
+DESCRIPTION = "Squid is a caching proxy for the Web supporting HTTP, HTTPS, FTP, and more"
+LICENSE = "GPLv2"
+INC_PR = "r1"
+DEPENDS = "squid-native-${PV}"
+
+SRC_URI = "http://www.squid-cache.org/Versions/v2/${SQUID_MAJOR}/squid-${PV}.tar.bz2 \
+           file://fix_epoll_check.patch;patch=1 \
+           file://squid.init"
+
+inherit autotools update-rc.d
+
+EXTRA_OECONF = "--disable-epoll --disable-nls"
+
+logdir = ${localstatedir}/log/squid
+EXTRA_OEMAKE = "\
+  DEFAULT_CACHE_LOG=${logdir}/cache.log \
+  DEFAULT_ACCESS_LOG=${logdir}/access.log \
+  DEFAULT_STORE_LOG=${logdir}/store.log \
+  DEFAULT_PID_FILE=${localstatedir}/run/squid.pid \
+  DEFAULT_SWAP_DIR=${localstatedir}/spool/squid \
+  "
+
+INITSCRIPT_NAME = "squid"
+
+do_configure_append() {
+   sed -i -e 's|./cf_gen |${STAGING_BINDIR_NATIVE}/cf_gen |g' src/Makefile
+}
+
+do_install_append() {
+	install -d ${D}${sysconfdir}/init.d
+	install -m 755 ${WORKDIR}/squid.init ${D}${sysconfdir}/init.d/squid
+}
+
+# this packages the languages better and saves some space, installs
+# English as errors default and the others in locale package
+
+FILES_${PN} += " ${datadir}/errors/English/* \
+                 ${datadir}/icons/* \
+                 ${datadir}/mib.txt"
+
+FILES_${PN}-locale += " ${datadir}/errors/* " 
diff --git a/recipes/squid/squid_2.6.STABLE14.bb b/recipes/squid/squid_2.6.STABLE14.bb
index 10c20c5..125ac23 100644
--- a/recipes/squid/squid_2.6.STABLE14.bb
+++ b/recipes/squid/squid_2.6.STABLE14.bb
@@ -1,41 +1,4 @@
-DESCRIPTION = "Squid is a caching proxy for the Web supporting HTTP, HTTPS, FTP, and more"
-LICENSE = "GPLv2"
-PR = "r1"
-DEPENDS = "squid-native-${PV}"
+PR = "${INC_PR}.0"
+SQUID_MAJOR = "2.6"
 
-SRC_URI = "http://www.squid-cache.org/Versions/v2/2.6/squid-${PV}.tar.bz2 \
-           file://fix_epoll_check.patch;patch=1 \
-           file://squid.init"
-
-inherit autotools update-rc.d
-
-EXTRA_OECONF = "--disable-epoll --disable-nls"
-
-logdir = ${localstatedir}/log/squid
-EXTRA_OEMAKE = "\
-  DEFAULT_CACHE_LOG=${logdir}/cache.log \
-  DEFAULT_ACCESS_LOG=${logdir}/access.log \
-  DEFAULT_STORE_LOG=${logdir}/store.log \
-  DEFAULT_PID_FILE=${localstatedir}/run/squid.pid \
-  DEFAULT_SWAP_DIR=${localstatedir}/spool/squid \
-  "
-
-INITSCRIPT_NAME = "squid"
-
-do_configure_append() {
-   sed -i -e 's|./cf_gen |${STAGING_BINDIR_NATIVE}/cf_gen |g' src/Makefile
-}
-
-do_install_append() {
-	install -d ${D}${sysconfdir}/init.d
-	install -m 755 ${WORKDIR}/squid.init ${D}${sysconfdir}/init.d/squid
-}
-
-# this packages the languages better and saves some space, installs
-# English as errors default and the others in locale package
-
-FILES_${PN} += " ${datadir}/errors/English/* \
-                 ${datadir}/icons/* \
-                 ${datadir}/mib.txt"
-
-FILES_${PN}-locale += " ${datadir}/errors/* " 
+include squid.inc
\ No newline at end of file
-- 
1.5.6.5



