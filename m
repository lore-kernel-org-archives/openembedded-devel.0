Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.ott.cti.com>) id 1MDPMt-0005rb-FA
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Jun 2009 22:53:27 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 2D1274D4398;
	Sun,  7 Jun 2009 16:44:03 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 16670-01; Sun,  7 Jun 2009 16:44:03 -0400 (EDT)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id 005614D427D; Sun,  7 Jun 2009 16:44:02 -0400 (EDT)
X-Spam-Score: 
X-Spam-Checker-Version: SpamAssassin 3.1.8 (2007-02-13) on sid.cbnco.com
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=7.0 tests=ALL_TRUSTED,AWL,BAYES_00,
	UPPERCASE_25_50 autolearn=ham version=3.1.8
Received: from sles10-64.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id AA30C4D0A26;
	Sun,  7 Jun 2009 16:43:59 -0400 (EDT)
Received: by sles10-64.ott.cti.com (Postfix, from userid 1000)
	id A16164147E; Sun,  7 Jun 2009 16:43:59 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  7 Jun 2009 16:43:26 -0400
Message-Id: <1244407406-23717-2-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.6.3
In-Reply-To: <1244407406-23717-1-git-send-email-msmith@cbnco.com>
References: <Pine.LNX.4.64.0906071637260.27204@juice.ott.cti.com>
	<1244407406-23717-1-git-send-email-msmith@cbnco.com>
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: [PATCH] busybox: fix udhcpc default script location when prefix is not "/usr"
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
X-List-Received-Date: Sun, 07 Jun 2009 20:53:27 -0000

Signed-off-by: Michael Smith <msmith@cbnco.com>
---
 recipes/busybox/busybox-1.13.2/defconfig |    2 +-
 recipes/busybox/busybox.inc              |    8 +++++++-
 recipes/busybox/busybox_1.11.3.bb        |    5 -----
 recipes/busybox/busybox_1.13.2.bb        |    6 ++----
 4 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/recipes/busybox/busybox-1.13.2/defconfig b/recipes/busybox/busybox-1.13.2/defconfig
index 0db650f..ddbaa08 100644
--- a/recipes/busybox/busybox-1.13.2/defconfig
+++ b/recipes/busybox/busybox-1.13.2/defconfig
@@ -720,7 +720,7 @@ CONFIG_FEATURE_UDHCPC_ARPING=y
 # CONFIG_FEATURE_UDHCP_PORT is not set
 # CONFIG_UDHCP_DEBUG is not set
 # CONFIG_FEATURE_UDHCP_RFC3397 is not set
-CONFIG_UDHCPC_DEFAULT_SCRIPT="/usr/share/udhcpc/default.script"
+CONFIG_UDHCPC_DEFAULT_SCRIPT="@DATADIR@/udhcpc/default.script"
 CONFIG_UDHCPC_SLACK_FOR_BUGGY_SERVERS=80
 # CONFIG_VCONFIG is not set
 CONFIG_WGET=y
diff --git a/recipes/busybox/busybox.inc b/recipes/busybox/busybox.inc
index 19e49fa..7b9b929 100644
--- a/recipes/busybox/busybox.inc
+++ b/recipes/busybox/busybox.inc
@@ -11,7 +11,7 @@ LICENSE = "GPL"
 SECTION = "base"
 PRIORITY = "required"
 
-INC_PR = "r20"
+INC_PR = "r21"
 
 SRC_URI = "\
   http://www.busybox.net/downloads/busybox-${PV}.tar.gz \
@@ -70,6 +70,12 @@ LD = "${CC} -nostdlib"
 
 inherit cml1 update-rc.d
 
+do_configure () {
+	sed -e 's#@DATADIR@#${datadir}#g' \
+		< ${WORKDIR}/defconfig > ${S}/.config
+	cml1_do_configure
+}
+
 do_compile() {
 	unset CFLAGS CPPFLAGS CXXFLAGS
 	base_do_compile
diff --git a/recipes/busybox/busybox_1.11.3.bb b/recipes/busybox/busybox_1.11.3.bb
index 673fe15..5518264 100644
--- a/recipes/busybox/busybox_1.11.3.bb
+++ b/recipes/busybox/busybox_1.11.3.bb
@@ -25,11 +25,6 @@ SRC_URI = "\
 
 EXTRA_OEMAKE += "V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX}"
 
-do_configure () {
-	install -m 0644 ${WORKDIR}/defconfig ${S}/.config
-	cml1_do_configure
-}
-
 do_install_append() {
     install -m 0644 ${WORKDIR}/mdev.conf ${D}${sysconfdir}/
     install -d ${D}${sysconfdir}/init.d/
diff --git a/recipes/busybox/busybox_1.13.2.bb b/recipes/busybox/busybox_1.13.2.bb
index c1cc51b..03a7208 100644
--- a/recipes/busybox/busybox_1.13.2.bb
+++ b/recipes/busybox/busybox_1.13.2.bb
@@ -39,12 +39,10 @@ SRC_URI = "\
 
 EXTRA_OEMAKE += "V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX}"
 
-do_configure () {
-	install -m 0644 ${WORKDIR}/defconfig ${S}/.config
+do_configure_prepend () {
 	if [ "${TARGET_ARCH}" = "avr32" ] ; then
-		sed -i s:CONFIG_FEATURE_OSF_LABEL=y:CONFIG_FEATURE_OSF_LABEL=n: ${S}/.config
+		sed -i s:CONFIG_FEATURE_OSF_LABEL=y:CONFIG_FEATURE_OSF_LABEL=n: ${WORKDIR}/defconfig
 	fi
-	cml1_do_configure
 }
 
 do_install_append() {
-- 
1.6.3



