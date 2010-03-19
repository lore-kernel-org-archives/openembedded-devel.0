Received: from office.altell.ru ([80.246.246.162])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1Nsc6Y-0001OA-6v
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Mar 2010 14:19:19 +0100
Received: from localhost.localdomain (build2.altell.local [192.168.1.26])
	by mail.altell.local (Postfix) with ESMTP id 9F2906876E;
	Fri, 19 Mar 2010 16:06:44 +0300 (MSK)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 Mar 2010 16:11:17 +0300
Message-Id: <1269004282-10732-3-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <1269004282-10732-2-git-send-email-khimov@altell.ru>
References: <1269004282-10732-1-git-send-email-khimov@altell.ru>
	<1269004282-10732-2-git-send-email-khimov@altell.ru>
X-Altell-MailScanner-ID: 9F2906876E.E63CE
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
Subject: [PATCH] squid: introduce version 2.7.STABLE8
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
X-List-Received-Date: Fri, 19 Mar 2010 13:19:19 -0000

Enable epoll for this version, it's available on all 2.6 kernels, so
disabling it is a bit strange for 2010.

Signed-off-by: Roman I Khimov <khimov@altell.ru>
---
 recipes/squid/squid-native.inc            |    2 +-
 recipes/squid/squid-native_2.7.STABLE8.bb |    6 ++++++
 recipes/squid/squid.inc                   |    2 +-
 recipes/squid/squid_2.7.STABLE8.bb        |   16 ++++++++++++++++
 4 files changed, 24 insertions(+), 2 deletions(-)
 create mode 100644 recipes/squid/squid-native_2.7.STABLE8.bb
 create mode 100644 recipes/squid/squid_2.7.STABLE8.bb

diff --git a/recipes/squid/squid-native.inc b/recipes/squid/squid-native.inc
index 0f48805..1077b98 100644
--- a/recipes/squid/squid-native.inc
+++ b/recipes/squid/squid-native.inc
@@ -1,6 +1,6 @@
 inherit native autotools
 
-SRC_URI = "http://www.squid-cache.org/Versions/v2/${SQUID_MAJOR}/squid-${PV}.tar.bz2"
+SRC_URI = "http://www.squid-cache.org/Versions/v2/${SQUID_MAJOR}/squid-${PV}.tar.bz2;name=squid-${PV}"
 S = "${WORKDIR}/squid-${PV}"
 
 do_stage() {
diff --git a/recipes/squid/squid-native_2.7.STABLE8.bb b/recipes/squid/squid-native_2.7.STABLE8.bb
new file mode 100644
index 0000000..3c9fa2a
--- /dev/null
+++ b/recipes/squid/squid-native_2.7.STABLE8.bb
@@ -0,0 +1,6 @@
+SQUID_MAJOR = "2.7"
+
+include squid-native.inc
+
+SRC_URI[squid-2.7.STABLE8.md5sum] = "c061ba1c9ae39d0aaa8eca137f7dd18b"
+SRC_URI[squid-2.7.STABLE8.sha256sum] = "9409b02fc53518e334395df803a1ae30f4ed385b0f041fb310b4c75e2a49138c"
\ No newline at end of file
diff --git a/recipes/squid/squid.inc b/recipes/squid/squid.inc
index b5878c3..7b173b4 100644
--- a/recipes/squid/squid.inc
+++ b/recipes/squid/squid.inc
@@ -3,7 +3,7 @@ LICENSE = "GPLv2"
 INC_PR = "r2"
 DEPENDS = "squid-native-${PV}"
 
-SRC_URI = "http://www.squid-cache.org/Versions/v2/${SQUID_MAJOR}/squid-${PV}.tar.bz2 \
+SRC_URI = "http://www.squid-cache.org/Versions/v2/${SQUID_MAJOR}/squid-${PV}.tar.bz2;name=squid-${PV} \
            file://fix_epoll_check.patch;patch=1 \
            file://squid.init"
 
diff --git a/recipes/squid/squid_2.7.STABLE8.bb b/recipes/squid/squid_2.7.STABLE8.bb
new file mode 100644
index 0000000..b237fe3
--- /dev/null
+++ b/recipes/squid/squid_2.7.STABLE8.bb
@@ -0,0 +1,16 @@
+PR = "${INC_PR}.0"
+SQUID_MAJOR = "2.7"
+
+include squid.inc
+
+# GPLv2+ since 2.6.STABLE18
+LICENSE = "GPL"
+
+EXTRA_OECONF += "--enable-epoll"
+
+SRC_URI[squid-2.7.STABLE8.md5sum] = "c061ba1c9ae39d0aaa8eca137f7dd18b"
+SRC_URI[squid-2.7.STABLE8.sha256sum] = "9409b02fc53518e334395df803a1ae30f4ed385b0f041fb310b4c75e2a49138c"
+
+do_configure_prepend() {
+	export ac_cv_epoll_ctl=yes
+}
\ No newline at end of file
-- 
1.5.6.5



