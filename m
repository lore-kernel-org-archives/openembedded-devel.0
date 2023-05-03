Return-Path: <j.zink@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C91CC77B75
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 14:23:10 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web11.20748.1683123783239407953
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 May 2023 07:23:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: jzi@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <jzi@pengutronix.de>)
	id 1puDNk-00063i-ID; Wed, 03 May 2023 16:23:00 +0200
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <jzi@pengutronix.de>)
	id 1puDNj-000qo0-Bz; Wed, 03 May 2023 16:22:59 +0200
Received: from jzi by dude03.red.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <jzi@pengutronix.de>)
	id 1puDNi-0073VX-5v; Wed, 03 May 2023 16:22:58 +0200
From: Johannes Zink <j.zink@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: yocto@pengutronix.de,
	patchwork-jzi@pengutronix.de,
	Johannes Zink <j.zink@pengutronix.de>
Subject: [meta-oe][PATCH v2] xl4-gptp: add new recipe for version 1.2.3
Date: Wed,  3 May 2023 16:22:56 +0200
Message-Id: <20230503142256.1681654-1-j.zink@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: jzi@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 May 2023 14:23:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102287

The xl4-gptp stack is a 802.1AS (including 802.1AS-REV) gPTP Stack for
bridge and endpoint mode, supporting single and multiple domains.

Also add the recipes for the required dependencies xl4-combase and
xl4-unibase.

Signed-off-by: Johannes Zink <j.zink@pengutronix.de>
---
Changelog:

v1->v2: also fixed autotools build error for xl4-gptp recipe

...ls-avoid-errors-due-to-missing-files.patch | 32 +++++++++++++++++++
 .../xl4-gptp/xl4-combase_1.1.3.bb             | 23 +++++++++++++
 ...totools-avoid-errors-due-to-missing-.patch | 32 +++++++++++++++++++
 .../xl4-gptp/xl4-gptp_1.2.3.bb                | 19 +++++++++++
 ...ls-avoid-errors-due-to-missing-files.patch | 32 +++++++++++++++++++
 .../xl4-gptp/xl4-unibase_1.4.4.bb             | 23 +++++++++++++
 6 files changed, 161 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/xl4-gptp/xl4-combase/0001-autotools-avoid-errors-due-to-missing-files.patch
 create mode 100644 meta-oe/recipes-connectivity/xl4-gptp/xl4-combase_1.1.3.bb
 create mode 100644 meta-oe/recipes-connectivity/xl4-gptp/xl4-gptp/0001-Subject-PATCH-autotools-avoid-errors-due-to-missing-.patch
 create mode 100644 meta-oe/recipes-connectivity/xl4-gptp/xl4-gptp_1.2.3.bb
 create mode 100644 meta-oe/recipes-connectivity/xl4-gptp/xl4-unibase/0001-autotools-avoid-errors-due-to-missing-files.patch
 create mode 100644 meta-oe/recipes-connectivity/xl4-gptp/xl4-unibase_1.4.4.bb

diff --git a/meta-oe/recipes-connectivity/xl4-gptp/xl4-combase/0001-autotools-avoid-errors-due-to-missing-files.patch b/meta-oe/recipes-connectivity/xl4-gptp/xl4-combase/0001-autotools-avoid-errors-due-to-missing-files.patch
new file mode 100644
index 000000000000..8dffec233c79
--- /dev/null
+++ b/meta-oe/recipes-connectivity/xl4-gptp/xl4-combase/0001-autotools-avoid-errors-due-to-missing-files.patch
@@ -0,0 +1,32 @@
+From c4ccf4a32166a96d0f78dc74dac5b9abf40431c1 Mon Sep 17 00:00:00 2001
+From: Johannes Zink <j.zink@pengutronix.de>
+Date: Tue, 25 Apr 2023 10:53:55 +0200
+Subject: [PATCH] autotools: avoid errors due to missing files
+
+without setting foreign in AM_INIT_AUTOMAKE autotools will complain
+if no AUTHORS, Changelog and NEWS file exist. Instead of generating them
+with a custom tool, just use the non-gnu foreign setting.
+
+This facilitates build system integration
+
+Upstream-Status: Submitted
+[https://github.com/xl4-shiro/xl4combase/pull/1]
+
+Signed-off-by: Johannes Zink <j.zink@pengutronix.de>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 9622a26226fa..fde567a3d21e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -5,7 +5,7 @@ AC_PREREQ([2.65])
+ AC_INIT([xl4combase], [1.1.3], [shiro@excelfore.com])
+ AC_SUBST(PACKAGE_DESC,"Excelfore communication base library")
+ 
+-AM_INIT_AUTOMAKE([-Wall -Werror subdir-objects])
++AM_INIT_AUTOMAKE([-Wall -Werror subdir-objects foreign])
+ AM_PROG_AR
+ LT_PREREQ([2.2])
+ LT_INIT([static])
diff --git a/meta-oe/recipes-connectivity/xl4-gptp/xl4-combase_1.1.3.bb b/meta-oe/recipes-connectivity/xl4-gptp/xl4-combase_1.1.3.bb
new file mode 100644
index 000000000000..57fd76392142
--- /dev/null
+++ b/meta-oe/recipes-connectivity/xl4-gptp/xl4-combase_1.1.3.bb
@@ -0,0 +1,23 @@
+DESCRIPTION="Communication Base Library for the Excelfore gPTP Stack"
+HOMEPAGE="https://github.com/xl4-shiro/xl4combase"
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+SRC_URI = "\
+	git://git@github.com/xl4-shiro/xl4combase.git;protocol=ssh;branch=master \
+        file://0001-autotools-avoid-errors-due-to-missing-files.patch \
+"
+
+SRCREV = "08b38bc8fd074d261a604d5e08d5ee91c8edde28"
+
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig
+
+EXTRA_OECONF = "--disable-unittest"
+
+DEPENDS += "xl4-unibase"
+
+do_install:append() {
+	rm -rf ${D}/${libdir}/python3
+}
diff --git a/meta-oe/recipes-connectivity/xl4-gptp/xl4-gptp/0001-Subject-PATCH-autotools-avoid-errors-due-to-missing-.patch b/meta-oe/recipes-connectivity/xl4-gptp/xl4-gptp/0001-Subject-PATCH-autotools-avoid-errors-due-to-missing-.patch
new file mode 100644
index 000000000000..c9bc8213c30d
--- /dev/null
+++ b/meta-oe/recipes-connectivity/xl4-gptp/xl4-gptp/0001-Subject-PATCH-autotools-avoid-errors-due-to-missing-.patch
@@ -0,0 +1,32 @@
+From 7e3eea1839e0a5ac88b698d082317512a0eca237 Mon Sep 17 00:00:00 2001
+From: Johannes Zink <j.zink@pengutronix.de>
+Date: Wed, 3 May 2023 16:10:46 +0200
+Subject: [PATCH] Subject: [PATCH] autotools: avoid errors due to missing files
+
+without setting foreign in AM_INIT_AUTOMAKE autotools will complain
+if no AUTHORS, Changelog and NEWS file exist. Instead of generating them
+with a custom tool, just use the non-gnu foreign setting.
+
+This facilitates build system integration
+
+Upstream-Status: Submitted
+[https://github.com/xl4-shiro/excelfore-gptp/pull/17]
+
+Signed-off-by: Johannes Zink <j.zink@pengutronix.de>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 1f94a1128c01..7a4dce874a60 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -5,7 +5,7 @@ AC_PREREQ([2.65])
+ AC_INIT([xl4gptp], [1.2.3], [shiro@excelfore.com])
+ AC_SUBST(PACKAGE_DESC,"Excelfore gptp daemon and libary")
+ 
+-AM_INIT_AUTOMAKE([-Wall -Werror subdir-objects])
++AM_INIT_AUTOMAKE([-Wall -Werror subdir-objects foreign])
+ AM_PROG_AR
+ LT_PREREQ([2.2])
+ LT_INIT([static])
diff --git a/meta-oe/recipes-connectivity/xl4-gptp/xl4-gptp_1.2.3.bb b/meta-oe/recipes-connectivity/xl4-gptp/xl4-gptp_1.2.3.bb
new file mode 100644
index 000000000000..3300c51875cf
--- /dev/null
+++ b/meta-oe/recipes-connectivity/xl4-gptp/xl4-gptp_1.2.3.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "Excelfore gPTP (IEEE802.1as) Stack"
+HOMEPAGE = "https://github.com/xl4-shiro/excelfore-gptp"
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+SRC_URI = "git://github.com/xl4-shiro/excelfore-gptp.git;protocol=https;branch=master \
+           file://0001-Subject-PATCH-autotools-avoid-errors-due-to-missing-.patch \
+           "
+SRC_URI[sha256sum] = "9c50427a16785f1998186b1d4882e7de5bdf6c3884775d7ff4291efdbbdfbc38"
+SRCREV = "ab6bafe44f367a92fb44c6bce84746d96ddfaa9e"
+
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig
+
+EXTRA_OECONF = "--disable-unittest --disable-understpl"
+EXTRA_OEMAKE = "STAGING_DIR_HOST=${STAGING_DIR_HOST}"
+
+DEPENDS += "xl4-unibase xl4-combase"
diff --git a/meta-oe/recipes-connectivity/xl4-gptp/xl4-unibase/0001-autotools-avoid-errors-due-to-missing-files.patch b/meta-oe/recipes-connectivity/xl4-gptp/xl4-unibase/0001-autotools-avoid-errors-due-to-missing-files.patch
new file mode 100644
index 000000000000..b67142414021
--- /dev/null
+++ b/meta-oe/recipes-connectivity/xl4-gptp/xl4-unibase/0001-autotools-avoid-errors-due-to-missing-files.patch
@@ -0,0 +1,32 @@
+From 5b48693dec6fe688aabdef539e2849458d51a8de Mon Sep 17 00:00:00 2001
+From: Johannes Zink <j.zink@pengutronix.de>
+Date: Tue, 25 Apr 2023 09:48:18 +0200
+Subject: [PATCH] autotools: avoid errors due to missing files
+
+without setting foreign in AM_INIT_AUTOMAKE autotools will complain
+if no AUTHORS, Changelog and NEWS file exist. Instead of generating them
+with a custom tool, just use the non-gnu foreign setting.
+
+This facilitates build system integration
+
+Upstream-Status: Submitted
+[https://github.com/xl4-shiro/xl4unibase/pull/1]
+
+Signed-off-by: Johannes Zink <j.zink@pengutronix.de>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 5992aa8ba7c1..d720605836c5 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -5,7 +5,7 @@ AC_PREREQ([2.65])
+ AC_INIT([xl4unibase], [1.1.4], [shiro@excelfore.com])
+ AC_SUBST(PACKAGE_DESC,"Excelfore universal base library")
+ 
+-AM_INIT_AUTOMAKE([-Wall -Werror subdir-objects])
++AM_INIT_AUTOMAKE([-Wall -Werror subdir-objects foreign])
+ AM_PROG_AR
+ LT_PREREQ([2.2])
+ LT_INIT([static])
diff --git a/meta-oe/recipes-connectivity/xl4-gptp/xl4-unibase_1.4.4.bb b/meta-oe/recipes-connectivity/xl4-gptp/xl4-unibase_1.4.4.bb
new file mode 100644
index 000000000000..3363eb28f13f
--- /dev/null
+++ b/meta-oe/recipes-connectivity/xl4-gptp/xl4-unibase_1.4.4.bb
@@ -0,0 +1,23 @@
+DESCRIPTION="Excelfore Universal Base Library"
+HOMEPAGE="https://github.com/xl4-shiro/xl4unibase"
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+SRC_URI = "\
+	git://git@github.com/xl4-shiro/xl4unibase.git;protocol=ssh;branch=master \
+        file://0001-autotools-avoid-errors-due-to-missing-files.patch \
+"
+
+SRCREV = "44211453ebfa9d1d139ec4860cb51473bba9add0"
+
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig
+
+EXTRA_OECONF = "--disable-unittest"
+
+DEPENDS += "python3"
+
+FILES:${PN}-dev += "\
+	${datadir} \
+"
-- 
2.39.2


