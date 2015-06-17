Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 251DC73CF5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jun 2015 08:29:54 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.13,625,1427731200"; d="scan'208";a="97192360"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Jun 2015 16:34:05 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t5H8SJ5T020579
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jun 2015 16:28:20 +0800
Received: from localhost.localdomain (10.167.226.85) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 17 Jun 2015 16:30:04 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 17 Jun 2015 16:29:46 +0800
Message-ID: <1434529786-2056-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.85]
Subject: [meta-oe][PATCH] syslog-ng_3.5.4.1: modify to fix the error
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
X-List-Received-Date: Wed, 17 Jun 2015 08:29:58 -0000
Content-Type: text/plain

1) modified "--localstatedir" from /var/run to /var/lib
2) delete "Type=notify" from syslog-ng.service.
   Otherwise syslog-ng.service can't be start successfully.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../syslog-ng.service-the-syslog-ng-service.patch  | 31 ++++++++++++++++++++++
 meta-oe/recipes-support/syslog-ng/syslog-ng.inc    |  4 +--
 .../recipes-support/syslog-ng/syslog-ng_3.5.4.1.bb |  1 +
 3 files changed, 34 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/syslog-ng.service-the-syslog-ng-service.patch

diff --git a/meta-oe/recipes-support/syslog-ng/files/syslog-ng.service-the-syslog-ng-service.patch b/meta-oe/recipes-support/syslog-ng/files/syslog-ng.service-the-syslog-ng-service.patch
new file mode 100644
index 0000000..90d3ef2
--- /dev/null
+++ b/meta-oe/recipes-support/syslog-ng/files/syslog-ng.service-the-syslog-ng-service.patch
@@ -0,0 +1,31 @@
+From 0be9c08dd3f825e92fa02d4a08d8aff743109e61 Mon Sep 17 00:00:00 2001
+From: Li xin <lixin.fnst@cn.fujitsu.com>
+Date: Wed, 17 Jun 2015 14:46:30 +0900
+Subject: [PATCH] syslog-ng.service: the syslog-ng service can not start
+ successfully,so modify it.
+
+Upstream-Status: pending
+
+Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
+---
+ contrib/systemd/syslog-ng.service | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/contrib/systemd/syslog-ng.service b/contrib/systemd/syslog-ng.service
+index fc16f8d..8e09deb 100644
+--- a/contrib/systemd/syslog-ng.service
++++ b/contrib/systemd/syslog-ng.service
+@@ -3,9 +3,8 @@ Description=System Logger Daemon
+ Documentation=man:syslog-ng(8)
+ 
+ [Service]
+-Type=notify
+ Sockets=syslog.socket
+-ExecStart=/usr/sbin/syslog-ng -F
++ExecStart=/usr/sbin/syslog-ng -F -p /var/run/syslogd.pid
+ ExecReload=/bin/kill -HUP $MAINPID
+ StandardOutput=null
+ Restart=on-failure
+-- 
+1.8.4.2
+
diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
index b9ca880..a990bf8 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
@@ -28,7 +28,7 @@ EXTRA_OECONF = " \
     --enable-dynamic-linking \
     --disable-sub-streams \
     --disable-pacct \
-    --localstatedir=${localstatedir}/run/${BPN} \
+    --localstatedir=${localstatedir}/lib/${BPN} \
     --sysconfdir=${sysconfdir}/${BPN} \
     --with-module-dir=${libdir}/${BPN} \
     --with-sysroot=${STAGING_DIR_HOST} \
@@ -67,7 +67,7 @@ do_install_append() {
     install -m 755 ${WORKDIR}/initscript ${D}/${sysconfdir}/init.d/syslog.${BPN}
     install -d ${D}/${sysconfdir}/default/volatiles/
     install -m 755 ${WORKDIR}/volatiles.03_syslog-ng ${D}/${sysconfdir}/default/volatiles/03_syslog-ng
-
+    install -d ${D}/${localstatedir}/lib/${BPN}
     # Remove /var/run as it is created on startup
     rm -rf ${D}${localstatedir}/run
 }
diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.5.4.1.bb b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.5.4.1.bb
index b548420..e8940c0 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.5.4.1.bb
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.5.4.1.bb
@@ -15,6 +15,7 @@ SRC_URI += " \
     file://dbifix.patch \
     file://rewrite-expr-grammar.ym-Free-up-token.patch \
     file://logwriter-dont-allocate-a-new-buffer.patch \
+    file://syslog-ng.service-the-syslog-ng-service.patch \
 "
 
 SRC_URI[md5sum] = "ff3bf223ebafbaa92b69a2d5b729f368"
-- 
1.8.4.2


