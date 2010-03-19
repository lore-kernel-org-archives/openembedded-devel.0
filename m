Received: from office.altell.ru ([80.246.246.162])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1Nsc6Y-0001OB-3l
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Mar 2010 14:19:14 +0100
Received: from localhost.localdomain (build2.altell.local [192.168.1.26])
	by mail.altell.local (Postfix) with ESMTP id 9B2FF6876D;
	Fri, 19 Mar 2010 16:06:44 +0300 (MSK)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 Mar 2010 16:11:16 +0300
Message-Id: <1269004282-10732-2-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <1269004282-10732-1-git-send-email-khimov@altell.ru>
References: <1269004282-10732-1-git-send-email-khimov@altell.ru>
X-Altell-MailScanner-ID: 9B2FF6876D.3DA55
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: khimov@altell.ru
X-SA-Exim-Connect-IP: 80.246.246.162
X-SA-Exim-Mail-From: khimov@altell.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] squid: move config files to /etc/squid
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
X-List-Received-Date: Fri, 19 Mar 2010 13:19:14 -0000

Squid installs 5 files into /etc so it deserves a separate dir for it.
Similar setup is used by other distros.

Signed-off-by: Roman I Khimov <khimov@altell.ru>
---
 recipes/squid/squid.inc |   11 ++++++++++-
 1 files changed, 10 insertions(+), 1 deletions(-)

diff --git a/recipes/squid/squid.inc b/recipes/squid/squid.inc
index 7fb3543..b5878c3 100644
--- a/recipes/squid/squid.inc
+++ b/recipes/squid/squid.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Squid is a caching proxy for the Web supporting HTTP, HTTPS, FTP, and more"
 LICENSE = "GPLv2"
-INC_PR = "r1"
+INC_PR = "r2"
 DEPENDS = "squid-native-${PV}"
 
 SRC_URI = "http://www.squid-cache.org/Versions/v2/${SQUID_MAJOR}/squid-${PV}.tar.bz2 \
@@ -18,6 +18,9 @@ EXTRA_OEMAKE = "\
   DEFAULT_STORE_LOG=${logdir}/store.log \
   DEFAULT_PID_FILE=${localstatedir}/run/squid.pid \
   DEFAULT_SWAP_DIR=${localstatedir}/spool/squid \
+  DEFAULT_CONFIG_FILE=${sysconfdir}/squid/squid.conf \
+  DEFAULT_MIME_TABLE=${sysconfdir}/squid/mime.conf \
+  DEFAULT_CACHEMGR_CONFIG=${sysconfdir}/squid/cachemgr.conf \
   "
 
 INITSCRIPT_NAME = "squid"
@@ -26,9 +29,15 @@ do_configure_append() {
    sed -i -e 's|./cf_gen |${STAGING_BINDIR_NATIVE}/cf_gen |g' src/Makefile
 }
 
+do_install_prepend() {
+	install -d ${D}${sysconfdir}/squid
+}
+
 do_install_append() {
 	install -d ${D}${sysconfdir}/init.d
 	install -m 755 ${WORKDIR}/squid.init ${D}${sysconfdir}/init.d/squid
+	mv ${D}${sysconfdir}/mime.conf.default ${D}${sysconfdir}/squid/
+	mv ${D}${sysconfdir}/squid.conf.default ${D}${sysconfdir}/squid/
 }
 
 # this packages the languages better and saves some space, installs
-- 
1.5.6.5



