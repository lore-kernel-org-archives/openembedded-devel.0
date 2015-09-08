Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 632DE75E80
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Sep 2015 07:30:04 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t887U4LR005001
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 8 Sep 2015 00:30:04 -0700 (PDT)
Received: from LRQ.corp.ad.wrs.com (128.224.162.158) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Tue, 8 Sep 2015 00:30:04 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 8 Sep 2015 15:30:02 +0800
Message-ID: <1441697402-6805-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH] ypbind-mt: add status command for initscript
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Sep 2015 07:30:05 -0000
Content-Type: text/plain

From: Zhu Yanjun <yanjun.zhu@windriver.com>

Add the "status" command in initscript to check the status of ypbind.
remove ypbind-yocto.init as ypbind.init, which is the initscript, make
its name similar to other recipes

Signed-off-by: Zhu Yanjun <yanjun.zhu@windriver.com>
Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../recipes-support/nis/files/{ypbind-yocto.init => ypbind.init}   | 7 +++++++
 meta-networking/recipes-support/nis/ypbind-mt_1.38.bb              | 4 ++--
 meta-networking/recipes-support/nis/ypbind-mt_2.2.bb               | 4 ++--
 3 files changed, 11 insertions(+), 4 deletions(-)
 rename meta-networking/recipes-support/nis/files/{ypbind-yocto.init => ypbind.init} (96%)

diff --git a/meta-networking/recipes-support/nis/files/ypbind-yocto.init b/meta-networking/recipes-support/nis/files/ypbind.init
similarity index 96%
rename from meta-networking/recipes-support/nis/files/ypbind-yocto.init
rename to meta-networking/recipes-support/nis/files/ypbind.init
index 2c50d12..244dc78 100644
--- a/meta-networking/recipes-support/nis/files/ypbind-yocto.init
+++ b/meta-networking/recipes-support/nis/files/ypbind.init
@@ -21,6 +21,9 @@
 #	the NIS binding information.
 ### END INIT INFO
 
+# Need to use status function
+. /etc/init.d/functions
+
 YPBIND_BIN=/usr/sbin/ypbind
 pidfile=/var/run/ypbind.pid
 
@@ -92,6 +95,10 @@ case "$1" in
 	echo -n "Reload service ypbind"
 	start-stop-daemon --stop --quiet --signal 1 --pidfile $pidfile
 	;;
+    status)
+	echo -n "Checking for ypbind: "
+	status $YPBIND_BIN
+	;;
     *)
 	echo "Usage: $0 {start|stop|status|try-restart|restart|force-reload|reload|probe}"
 	exit 1
diff --git a/meta-networking/recipes-support/nis/ypbind-mt_1.38.bb b/meta-networking/recipes-support/nis/ypbind-mt_1.38.bb
index d25ef5c..5702cd6 100644
--- a/meta-networking/recipes-support/nis/ypbind-mt_1.38.bb
+++ b/meta-networking/recipes-support/nis/ypbind-mt_1.38.bb
@@ -26,7 +26,7 @@ DEPENDS = " \
 PROVIDES += "ypbind"
 
 SRC_URI = "http://www.linux-nis.org/download/ypbind-mt/${BP}.tar.bz2 \
-           file://ypbind-yocto.init \
+           file://ypbind.init \
            file://ypbind.service \
 "
 SRC_URI[md5sum] = "094088c0e282fa7f3b3dd6cc51d0a4e1"
@@ -44,7 +44,7 @@ do_install_append () {
     install -d ${D}${sysconfdir}/init.d
     install -d ${D}${sysconfdir}/rcS.d
 
-    install -m 0755 ${WORKDIR}/ypbind-yocto.init ${D}${sysconfdir}/init.d/ypbind
+    install -m 0755 ${WORKDIR}/ypbind.init ${D}${sysconfdir}/init.d/ypbind
 
     install -d ${D}${systemd_unitdir}/system
     install -m 0644 ${WORKDIR}/ypbind.service ${D}${systemd_unitdir}/system
diff --git a/meta-networking/recipes-support/nis/ypbind-mt_2.2.bb b/meta-networking/recipes-support/nis/ypbind-mt_2.2.bb
index 6a9262a..cee5880 100644
--- a/meta-networking/recipes-support/nis/ypbind-mt_2.2.bb
+++ b/meta-networking/recipes-support/nis/ypbind-mt_2.2.bb
@@ -21,7 +21,7 @@ PROVIDES += "ypbind"
 PNBLACKLIST[ypbind-mt] ?= "BROKEN: Depends on broken yp-tools"
 
 SRC_URI = "http://www.linux-nis.org/download/ypbind-mt/${BP}.tar.bz2 \
-           file://ypbind-yocto.init \
+           file://ypbind.init \
            file://ypbind.service \
 "
 SRC_URI[md5sum] = "54e2040d8266ae7d302d081ca310c8a8"
@@ -41,7 +41,7 @@ do_install_append () {
     install -d ${D}${sysconfdir}/init.d
     install -d ${D}${sysconfdir}/rcS.d
 
-    install -m 0755 ${WORKDIR}/ypbind-yocto.init ${D}${sysconfdir}/init.d/ypbind
+    install -m 0755 ${WORKDIR}/ypbind.init ${D}${sysconfdir}/init.d/ypbind
 
     install -d ${D}${systemd_unitdir}/system
     install -m 0644 ${WORKDIR}/ypbind.service ${D}${systemd_unitdir}/system
-- 
2.1.4


