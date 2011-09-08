Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <errordeveloper@gmail.com>) id 1R1SBZ-0004v8-1H
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Sep 2011 02:09:41 +0200
Received: by wwe32 with SMTP id 32so168557wwe.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Sep 2011 17:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=TF0eahZPhw1fL95ymHVpFJ4fyYX2CSZSBDeE0ufPZLs=;
	b=orto7UcGFTFJzEceXhAsTN0+diA/gllecR7A0JUSRDK1GjBBRI9k3myHuaMcxPU+y/
	c6dCrsori5/m02EKKeRzZcOnRfltksz477ZnbuqfHe2RjzQk2hCUOFqNXldz9jYVMg5c
	zII8LP/L5luTtUGwEccMSGvyCuYrH+S4hrn98=
Received: by 10.227.3.4 with SMTP id 4mr35537wbl.35.1315440275821;
	Wed, 07 Sep 2011 17:04:35 -0700 (PDT)
Received: from localhost.localdomain
	(host86-185-41-205.range86-185.btcentralplus.com [86.185.41.205])
	by mx.google.com with ESMTPS id ek13sm2296390wbb.23.2011.09.07.17.04.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 07 Sep 2011 17:04:35 -0700 (PDT)
From: Ilya Dmitrichenko <errordeveloper@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  8 Sep 2011 02:04:33 +0100
Message-Id: <1315443873-16271-1-git-send-email-errordeveloper@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH] zeromq: added version 2.1.9 zeromq.inc
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
X-List-Received-Date: Thu, 08 Sep 2011 00:09:41 -0000

Signed-off-by: Ilya Dmitrichenko <errordeveloper@gmail.com>
---
 recipes/zeromq/zeromq.inc      |   22 ++++++++++++++++++++++
 recipes/zeromq/zeromq_2.1.6.bb |   17 ++---------------
 recipes/zeromq/zeromq_2.1.7.bb |    8 ++++++++
 recipes/zeromq/zeromq_2.1.9.bb |    6 ++++++
 4 files changed, 38 insertions(+), 15 deletions(-)
 create mode 100644 recipes/zeromq/zeromq.inc
 create mode 100644 recipes/zeromq/zeromq_2.1.7.bb
 create mode 100644 recipes/zeromq/zeromq_2.1.9.bb

diff --git a/recipes/zeromq/zeromq.inc b/recipes/zeromq/zeromq.inc
new file mode 100644
index 0000000..e23bf76
--- /dev/null
+++ b/recipes/zeromq/zeromq.inc
@@ -0,0 +1,22 @@
+DESCRIPTION = "ZeroMQ looks like an embeddable networking library but acts like a concurrency framework"
+HOMEPAGE = "http://www.zeromq.org"
+LICENSE = "LGPLv3+"
+LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=66ea8704398d7996daeacd2fbd2b9dbd"
+
+INC_PR = "r0"
+
+DEPENDS += "util-linux-ng"
+
+S = "${WORKDIR}/zeromq-${PV}"
+
+## All current releases are kept here:
+SRC_URI = "http://download.zeromq.org/zeromq-${PV}.tar.gz"
+## obsolete release are being move to:
+#SRC_URI = "http://download.zeromq.org/historic/zeromq-${PV}.tar.gz"
+## Perhaps we should use git tags instead.
+
+inherit autotools
+
+do_configure_prepend() {
+	./autogen.sh
+}
diff --git a/recipes/zeromq/zeromq_2.1.6.bb b/recipes/zeromq/zeromq_2.1.6.bb
index ec291f5..8b06571 100644
--- a/recipes/zeromq/zeromq_2.1.6.bb
+++ b/recipes/zeromq/zeromq_2.1.6.bb
@@ -1,21 +1,8 @@
-DESCRIPTION = "ZeroMQ looks like an embeddable networking library but acts like a concurrency framework"
-HOMEPAGE = "http://www.zeromq.org"
-LICENSE = "LGPLv3+"
-LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=66ea8704398d7996daeacd2fbd2b9dbd"
+require zeromq.inc
 
 PR = "r0"
 
-DEPENDS += "util-linux-ng"
-
-S = "${WORKDIR}/zeromq-${PV}"
-
-SRC_URI = "http://download.zeromq.org/zeromq-${PV}.tar.gz"
-
-inherit autotools
-
-do_configure_prepend() {
-	./autogen.sh
-}
+SRC_URI = "http://download.zeromq.org/historic/zeromq-${PV}.tar.gz"
 
 SRC_URI[md5sum] = "77b9ca20e8f2426874022080f41d7b0b"
 SRC_URI[sha256sum] = "a1bbb352a9dbf34b18a3999b22a8db2d51e4a52508d098528d771811533f9fd0"
diff --git a/recipes/zeromq/zeromq_2.1.7.bb b/recipes/zeromq/zeromq_2.1.7.bb
new file mode 100644
index 0000000..1be6002
--- /dev/null
+++ b/recipes/zeromq/zeromq_2.1.7.bb
@@ -0,0 +1,8 @@
+require zeromq.inc
+
+PR = "r0"
+
+SRC_URI = "http://download.zeromq.org/historic/zeromq-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "7d3120f8a8fb913a7e55c57c6eb024f3"
+SRC_URI[sha256sum] = "2a1416d0a3ea55ae17d43417fd9bd193412cc9101e144bc8d3bd19fe36816e0d"
diff --git a/recipes/zeromq/zeromq_2.1.9.bb b/recipes/zeromq/zeromq_2.1.9.bb
new file mode 100644
index 0000000..7028891
--- /dev/null
+++ b/recipes/zeromq/zeromq_2.1.9.bb
@@ -0,0 +1,6 @@
+require zeromq.inc
+
+PR = "r0"
+
+SRC_URI[md5sum] = "94c5e0262a79c5f82bc0b178c1f8a33d"
+SRC_URI[sha256sum] = "f3542f756687e622beef3a75c8e027fe2d95d4654350cbca4c070ffc58d9ace0"
-- 
1.7.3.4



