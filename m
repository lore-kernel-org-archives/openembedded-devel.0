Received: from office.altell.ru ([80.246.246.162])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1Nsc6f-0001Oc-Af
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Mar 2010 14:19:22 +0100
Received: from localhost.localdomain (build2.altell.local [192.168.1.26])
	by mail.altell.local (Postfix) with ESMTP id ADDB068772;
	Fri, 19 Mar 2010 16:06:44 +0300 (MSK)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 Mar 2010 16:11:18 +0300
Message-Id: <1269004282-10732-4-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <1269004282-10732-3-git-send-email-khimov@altell.ru>
References: <1269004282-10732-1-git-send-email-khimov@altell.ru>
	<1269004282-10732-2-git-send-email-khimov@altell.ru>
	<1269004282-10732-3-git-send-email-khimov@altell.ru>
X-Altell-MailScanner-ID: ADDB068772.3B3F0
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: khimov@altell.ru
X-SA-Exim-Connect-IP: 80.246.246.162
X-SA-Exim-Mail-From: khimov@altell.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] squid: add volatiles for log directory
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
X-List-Received-Date: Fri, 19 Mar 2010 13:19:22 -0000

Should be owned by the same user squid runs.

Signed-off-by: Roman I Khimov <khimov@altell.ru>
---
 recipes/squid/squid.inc             |    8 ++++++--
 recipes/squid/squid/squid-volatiles |    1 +
 2 files changed, 7 insertions(+), 2 deletions(-)
 create mode 100644 recipes/squid/squid/squid-volatiles

diff --git a/recipes/squid/squid.inc b/recipes/squid/squid.inc
index 7b173b4..ff3789c 100644
--- a/recipes/squid/squid.inc
+++ b/recipes/squid/squid.inc
@@ -1,11 +1,13 @@
 DESCRIPTION = "Squid is a caching proxy for the Web supporting HTTP, HTTPS, FTP, and more"
 LICENSE = "GPLv2"
-INC_PR = "r2"
+INC_PR = "r3"
 DEPENDS = "squid-native-${PV}"
 
 SRC_URI = "http://www.squid-cache.org/Versions/v2/${SQUID_MAJOR}/squid-${PV}.tar.bz2;name=squid-${PV} \
            file://fix_epoll_check.patch;patch=1 \
-           file://squid.init"
+           file://squid.init \
+	   file://squid-volatiles \
+	   "
 
 inherit autotools update-rc.d
 
@@ -35,9 +37,11 @@ do_install_prepend() {
 
 do_install_append() {
 	install -d ${D}${sysconfdir}/init.d
+	install -d ${D}${sysconfdir}/default/volatiles
 	install -m 755 ${WORKDIR}/squid.init ${D}${sysconfdir}/init.d/squid
 	mv ${D}${sysconfdir}/mime.conf.default ${D}${sysconfdir}/squid/
 	mv ${D}${sysconfdir}/squid.conf.default ${D}${sysconfdir}/squid/
+	install -m 0644 ${WORKDIR}/squid-volatiles ${D}${sysconfdir}/default/volatiles/squid
 }
 
 # this packages the languages better and saves some space, installs
diff --git a/recipes/squid/squid/squid-volatiles b/recipes/squid/squid/squid-volatiles
new file mode 100644
index 0000000..b4e1f60
--- /dev/null
+++ b/recipes/squid/squid/squid-volatiles
@@ -0,0 +1 @@
+d nobody nogroup 0775 /var/log/squid none
-- 
1.5.6.5



