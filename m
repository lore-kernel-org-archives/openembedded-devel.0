Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 403FD6AC1E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Jun 2015 16:44:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t5JGihFv018694
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Jun 2015 09:44:44 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Fri, 19 Jun 2015 09:44:43 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 19 Jun 2015 09:44:42 -0700
Message-ID: <1434732282-25354-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/1] drbd ufw linux-atm: correct certain packaging error
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
X-List-Received-Date: Fri, 19 Jun 2015 16:44:45 -0000
Content-Type: text/plain

The named packages explicitly install some items under /lib,
but the recipes assume they are in base_libdir.  We change
the recipes.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 .../recipes-connectivity/ufw/ufw_0.33.bb           |    4 +++-
 meta-networking/recipes-support/drbd/drbd_8.4.4.bb |    6 ++++--
 .../recipes-support/linux-atm/linux-atm_2.5.2.bb   |    5 ++++-
 3 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/meta-networking/recipes-connectivity/ufw/ufw_0.33.bb b/meta-networking/recipes-connectivity/ufw/ufw_0.33.bb
index 2721f8f..66e917e 100644
--- a/meta-networking/recipes-connectivity/ufw/ufw_0.33.bb
+++ b/meta-networking/recipes-connectivity/ufw/ufw_0.33.bb
@@ -32,10 +32,12 @@ RRECOMMENDS_${PN} = " \
                      kernel-module-ipv6 \
 "
 
+# Certain items are explicitly put under /lib, not base_libdir when installed.
+#
 FILES_${PN} += " \
                 ${sbindir}/* \
                 ${datadir}/ufw/* \
-                ${base_libdir}/ufw/* \
+                /lib/ufw/* \
                 ${sysconfdir}/ufw/* \
                 ${sysconfdir}/default/ufw \
 "
diff --git a/meta-networking/recipes-support/drbd/drbd_8.4.4.bb b/meta-networking/recipes-support/drbd/drbd_8.4.4.bb
index 5baffc6..7458707 100644
--- a/meta-networking/recipes-support/drbd/drbd_8.4.4.bb
+++ b/meta-networking/recipes-support/drbd/drbd_8.4.4.bb
@@ -46,6 +46,8 @@ do_install_append() {
 
 RDEPENDS_${PN} += "bash perl"
 
+# The drbd items are explicitly put under /lib when installed.
+#
 FILES_${PN} += "/run"
-FILES_${PN} += "${base_libdir}/drbd"
-FILES_${PN}-dbg += "${base_libdir}/drbd/.debug"
+FILES_${PN} += "/lib/drbd"
+FILES_${PN}-dbg += "/lib/drbd/.debug"
diff --git a/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb b/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
index 0a9bd8c..d0c0cec 100644
--- a/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
+++ b/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
@@ -19,4 +19,7 @@ file://COPYING.LGPL;md5=6e29c688d912da12b66b73e32b03d812"
 
 inherit autotools pkgconfig
 
-FILES_${PN} += "${base_libdir}/firmware"
+# The firmware is explicitly put under /lib when installed.
+#
+
+FILES_${PN} += "/lib/firmware"
-- 
1.7.9.5


