Received: from [80.246.246.162] (helo=office.altell.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1Lu3OO-00021N-D6
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Apr 2009 13:35:21 +0200
Received: from localhost.localdomain (unknown [192.168.1.115])
	by mail.altell.local (Postfix) with ESMTP id 0FF64683CA;
	Wed, 15 Apr 2009 15:31:03 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Apr 2009 15:31:02 +0400
Message-Id: <1239795062-31939-1-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.2.1
MIME-Version: 1.0
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: khimov@altell.ru
X-SA-Exim-Connect-IP: 80.246.246.162
X-SA-Exim-Mail-From: khimov@altell.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=AWL,BAYES_50,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] clamav: add 0.94.2 version recipe
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
X-List-Received-Date: Wed, 15 Apr 2009 11:35:27 -0000

---
 conf/checksums.ini              |    4 ++++
 recipes/clamav/clamav.inc       |    4 ++--
 recipes/clamav/clamav_0.90.2.bb |    2 ++
 recipes/clamav/clamav_0.90.3.bb |    2 ++
 recipes/clamav/clamav_0.91.1.bb |    2 ++
 recipes/clamav/clamav_0.94.2.bb |    3 +++
 6 files changed, 15 insertions(+), 2 deletions(-)
 create mode 100644 recipes/clamav/clamav_0.94.2.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 909a0e0..9f11943 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -3538,6 +3538,10 @@ sha256=f98edecae40473c142fe49a0e02f5ff7fb28d778c4bd510dad747d208d20cb00
 md5=60152bf1e24b3fbdf0473794199e5215
 sha256=f98edecae40473c142fe49a0e02f5ff7fb28d778c4bd510dad747d208d20cb00
 
+[http://downloads.sourceforge.net/clamav/clamav-0.94.2.tar.gz]
+md5=1181e6d62341b84708f126cc353f7ebf
+sha256=1aec7fecff375958d067aceeb9782d3ff0be7c13bed0eecf6240fb089f8d268c
+
 [http://memberwebs.com/nielsen/software/clamsmtp/clamsmtp-1.8.tar.gz]
 md5=04da6aab94934641fcf9e7a7598346fb
 sha256=c09b24c82f858845e235df4c8b2639240a7b786de66b595e351be86ab60663a5
diff --git a/recipes/clamav/clamav.inc b/recipes/clamav/clamav.inc
index 49b8023..5b2069e 100644
--- a/recipes/clamav/clamav.inc
+++ b/recipes/clamav/clamav.inc
@@ -19,7 +19,6 @@ RRECOMMENDS_${PN}-daemon = "${PN}-freshclam"
 RPROVIDES_${PN}-freshclam = "${PN}-data"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/clamav/clamav-${PV}.tar.gz \
-          file://cross-compile-fix.patch;patch=1 \
           file://clamav-daemon.init \
           file://clamav-freshclam.init \
           file://clamd.conf \
@@ -67,10 +66,11 @@ do_stage () {
 PACKAGES += "${PN}-freshclam ${PN}-daemon ${PN}-conf ${PN}-data ${PN}-lib \
              ${PN}-clamconf"
 
+LEAD_SONAME = "libclamav.so.*"
 FILES_${PN} = "${bindir}/clamscan \
                ${bindir}/sigtool \
                ${bindir}/clamdscan"
-FILES_${PN}-lib = "${libdir}/libclamav.so.*"
+FILES_${PN}-lib = "${libdir}/libclamav.so.* ${libdir}/libclamunrar.so* ${libdir}/libclamunrar_iface.so*"
 FILES_${PN}-conf = "${sysconfdir}/clamd.conf"
 FILES_${PN}-clamconf = "${bindir}/clamconf"
 FILES_${PN}-freshclam = "${bindir}/freshclam \
diff --git a/recipes/clamav/clamav_0.90.2.bb b/recipes/clamav/clamav_0.90.2.bb
index 9592adf..740c02a 100644
--- a/recipes/clamav/clamav_0.90.2.bb
+++ b/recipes/clamav/clamav_0.90.2.bb
@@ -1,3 +1,5 @@
 require clamav.inc
 
+SRC_URI += "file://cross-compile-fix.patch;patch=1"
+
 PR = "r2"
diff --git a/recipes/clamav/clamav_0.90.3.bb b/recipes/clamav/clamav_0.90.3.bb
index e721558..2227f01 100644
--- a/recipes/clamav/clamav_0.90.3.bb
+++ b/recipes/clamav/clamav_0.90.3.bb
@@ -1,3 +1,5 @@
 require clamav.inc
 
+SRC_URI += "file://cross-compile-fix.patch;patch=1"
+
 PR = "r1"
diff --git a/recipes/clamav/clamav_0.91.1.bb b/recipes/clamav/clamav_0.91.1.bb
index e721558..2227f01 100644
--- a/recipes/clamav/clamav_0.91.1.bb
+++ b/recipes/clamav/clamav_0.91.1.bb
@@ -1,3 +1,5 @@
 require clamav.inc
 
+SRC_URI += "file://cross-compile-fix.patch;patch=1"
+
 PR = "r1"
diff --git a/recipes/clamav/clamav_0.94.2.bb b/recipes/clamav/clamav_0.94.2.bb
new file mode 100644
index 0000000..12fad7a
--- /dev/null
+++ b/recipes/clamav/clamav_0.94.2.bb
@@ -0,0 +1,3 @@
+require clamav.inc
+
+EXTRA_OECONF += "--program-transform-name=''"
-- 
1.6.2.1


-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.



