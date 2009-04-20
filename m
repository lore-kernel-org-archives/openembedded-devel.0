Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1LvvR2-0006h4-LF
	for openembedded-devel@openembedded.org; Mon, 20 Apr 2009 17:29:28 +0200
Received: (qmail 21728 invoked by uid 813007); 20 Apr 2009 15:25:09 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 20 Apr 2009 15:25:09 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Apr 2009 17:25:02 +0200
Message-Id: <1240241104-21935-10-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3.rc0
In-Reply-To: <1240241104-21935-1-git-send-email-marcin@juszkiewicz.com.pl>
References: <1240241104-21935-1-git-send-email-marcin@juszkiewicz.com.pl>
MIME-Version: 1.0
Cc: =?utf-8?q?Jeremy=20Lain=C3=A9?= <jeremy.laine@m4x.org>
Subject: [STABLE][PATCH 1/1] hostap-utils-0.4.7: use LDFLAGS (fixes QA error)
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
X-List-Received-Date: Mon, 20 Apr 2009 15:29:29 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

From: Jeremy Lainé <jeremy.laine@m4x.org>

---
 recipes/hostap/hostap-utils-0.4.7/ldflags.patch |   24 +++++++++++++++++++++++
 recipes/hostap/hostap-utils_0.4.7.bb            |   24 ++++++++++++++++++++++-
 2 files changed, 47 insertions(+), 1 deletions(-)
 create mode 100644 recipes/hostap/hostap-utils-0.4.7/ldflags.patch

diff --git a/recipes/hostap/hostap-utils-0.4.7/ldflags.patch b/recipes/hostap/hostap-utils-0.4.7/ldflags.patch
new file mode 100644
index 0000000..d2ca298
--- /dev/null
+++ b/recipes/hostap/hostap-utils-0.4.7/ldflags.patch
@@ -0,0 +1,24 @@
+diff -urN hostap-utils-0.4.7.orig/Makefile hostap-utils-0.4.7/Makefile
+--- hostap-utils-0.4.7.orig/Makefile	2005-01-01 06:42:51.000000000 +0000
++++ hostap-utils-0.4.7/Makefile	2009-04-08 08:36:46.000000000 +0000
+@@ -14,17 +14,17 @@
+ hostap_crypt_conf: hostap_crypt_conf.c
+ 
+ hostap_diag: hostap_diag.o util.o
+-	$(CC) -o hostap_diag $(CFLAGS) hostap_diag.o util.o
++	$(CC) -o hostap_diag $(CFLAGS) $(LDFLAGS) hostap_diag.o util.o
+ 
+ hostap_diag.o: hostap_diag.c util.h
+ 
+ util.o: util.c util.h
+ 
+ hostap_io_debug: hostap_io_debug.c
+-	$(CC) -o hostap_io_debug $(CFLAGS) hostap_io_debug.c
++	$(CC) -o hostap_io_debug $(CFLAGS) $(LDFLAGS) hostap_io_debug.c
+ 
+ hostap_rid: hostap_rid.o util.o
+-	$(CC) -o hostap_rid $(CFLAGS) hostap_rid.o util.o
++	$(CC) -o hostap_rid $(CFLAGS) $(LDFLAGS) hostap_rid.o util.o
+ 
+ hostap_rid.o: hostap_rid.c util.h
+ 
diff --git a/recipes/hostap/hostap-utils_0.4.7.bb b/recipes/hostap/hostap-utils_0.4.7.bb
index 9fe362b..5635947 100644
--- a/recipes/hostap/hostap-utils_0.4.7.bb
+++ b/recipes/hostap/hostap-utils_0.4.7.bb
@@ -1 +1,23 @@
-require hostap-utils.inc
+DESCRIPTION = "User mode helpers for the hostap driver"
+HOMEPAGE = "http://hostap.epitest.fi"
+SECTION = "kernel/userland"
+PRIORITY = "optional"
+LICENSE = "GPL"
+PR = "r6"
+
+SRC_URI = "http://hostap.epitest.fi/releases/hostap-utils-${PV}.tar.gz \
+	   file://hostap-fw-load.patch;patch=1 \
+	   file://ldflags.patch;patch=1"
+
+S = "${WORKDIR}/hostap-utils-${PV}"
+
+BINARIES = "hostap_crypt_conf hostap_diag hostap_fw_load hostap_io_debug \
+	    hostap_rid prism2_param prism2_srec split_combined_hex"
+
+do_install() {
+	install -d ${D}${sbindir}/
+	for f in ${BINARIES}
+	do
+		install -m 0755 $f ${D}${sbindir}/
+	done
+}
-- 
1.6.2.3





