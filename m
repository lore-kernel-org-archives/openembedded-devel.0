Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@dresearch.de>) id 1OqO3h-0002ZU-OI
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Aug 2010 12:27:20 +0200
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id CB9C9491278
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Aug 2010 12:26:46 +0200 (CEST)
Received: from fsc-480-012-88.intern.dresearch.de ([10.32.10.177]) by
	exchange.intern.dresearch.de with Microsoft SMTPSVC(6.0.3790.4675); 
	Tue, 31 Aug 2010 12:23:47 +0200
Received: by fsc-480-012-88.intern.dresearch.de (Postfix, from userid 10000)
	id D530C7207D; Tue, 31 Aug 2010 12:23:46 +0200 (CEST)
From: Steffen Sledz <sledz@dresearch.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Aug 2010 12:23:39 +0200
Message-Id: <1283250219-28280-1-git-send-email-sledz@dresearch.de>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1282916906-21411-1-git-send-email-sledz@dresearch.de>
References: <1282916906-21411-1-git-send-email-sledz@dresearch.de>
X-OriginalArrivalTime: 31 Aug 2010 10:23:47.0699 (UTC)
	FILETIME=[990B2430:01CB48F6]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@dresearch.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH v2] various syslogs: keep syslog running as long as possible on shutdown
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
X-List-Received-Date: Tue, 31 Aug 2010 10:27:21 -0000

Signed-off-by: Steffen Sledz <sledz@dresearch.de>
---
 recipes/busybox/busybox.inc   |    7 +++++--
 recipes/rsyslog/rsyslog.inc   |    7 +++++--
 recipes/sysklogd/sysklogd.inc |    7 +++++--
 3 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/recipes/busybox/busybox.inc b/recipes/busybox/busybox.inc
index 96d9bb1..1046b2f 100644
--- a/recipes/busybox/busybox.inc
+++ b/recipes/busybox/busybox.inc
@@ -11,7 +11,7 @@ LICENSE = "GPLv2"
 SECTION = "base"
 PRIORITY = "required"
 
-INC_PR = "r33"
+INC_PR = "r34"
 
 SRC_URI = "\
   file://busybox-cron \
@@ -257,7 +257,10 @@ pkg_postinst_${PN}-syslog () {
 	else
 		OPT="-s"
 	fi
-	update-rc.d $OPT syslog defaults
+	# remove all rc.d-links potentially created from alternative
+	# syslog packages before creating new ones
+	update-rc.d $OPT -f syslog remove
+	update-rc.d $OPT syslog start 20 2 3 4 5 . stop 90 0 1 6 .
 }
 
 pkg_prerm_${PN}-syslog () {
diff --git a/recipes/rsyslog/rsyslog.inc b/recipes/rsyslog/rsyslog.inc
index a3bd125..8f67130 100644
--- a/recipes/rsyslog/rsyslog.inc
+++ b/recipes/rsyslog/rsyslog.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Rsyslog is an enhanced multi-threaded syslogd"
 DEPENDS = "zlib"
 HOMEPAGE = "http://www.rsyslog.com/"
 LICENSE = "GPLv3"
-INC_PR = "r1"
+INC_PR = "r2"
 
 SRC_URI = "http://www.rsyslog.com/files/download/rsyslog/${PN}-${PV}.tar.gz \
           file://rsyslog.conf \
@@ -31,7 +31,10 @@ pkg_postinst_${PN} () {
 	else
 		OPT="-s"
 	fi
-	update-rc.d $OPT syslog defaults
+	# remove all rc.d-links potentially created from alternative
+	# syslog packages before creating new ones
+	update-rc.d $OPT -f syslog remove
+	update-rc.d $OPT syslog start 20 2 3 4 5 . stop 90 0 1 6 .
 }
 
 pkg_prerm_${PN} () {
diff --git a/recipes/sysklogd/sysklogd.inc b/recipes/sysklogd/sysklogd.inc
index f25af53..833fe6a 100644
--- a/recipes/sysklogd/sysklogd.inc
+++ b/recipes/sysklogd/sysklogd.inc
@@ -1,7 +1,7 @@
 LICENSE = "GPL"
 SECTION = "base"
 DESCRIPTION = "The sysklogd package implements two system log daemons."
-INC_PR = "r3"
+INC_PR = "r4"
 
 SRC_URI = "http://www.ibiblio.org/pub/Linux/system/daemons/sysklogd-${PV}.tar.gz \
 	       file://nonrootinstall.patch \
@@ -52,7 +52,10 @@ pkg_postinst_${PN} () {
     else
 	OPT="-s"
     fi
-    update-rc.d $OPT syslog defaults
+    # remove all rc.d-links potentially created from alternative
+    # syslog packages before creating new ones
+    update-rc.d $OPT -f syslog remove
+    update-rc.d $OPT syslog start 20 2 3 4 5 . stop 90 0 1 6 .
 }
 
 pkg_prerm_${PN} () {
-- 
1.7.1



