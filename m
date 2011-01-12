Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <michael@sles10-64.jrz.cbn>) id 1Pd6rr-0003hO-My
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Jan 2011 21:00:28 +0100
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id AB1FA75ADFC
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jan 2011 14:52:46 -0500 (EST)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 19486-06 for <openembedded-devel@lists.openembedded.org>; 
	Wed, 12 Jan 2011 14:52:46 -0500 (EST)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id 541F3758180; Wed, 12 Jan 2011 14:52:46 -0500 (EST)
X-Spam-Score: 
X-Spam-Checker-Version: SpamAssassin 3.1.8 (2007-02-13) on sid.cbnco.com
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=7.0 tests=ALL_TRUSTED,AWL,BAYES_00,
	SUBJ_HAS_UNIQ_ID autolearn=ham version=3.1.8
Received: from sles10-64.jrz.cbn (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id 722B9650780
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jan 2011 14:52:36 -0500 (EST)
Received: by sles10-64.jrz.cbn (Postfix, from userid 1001)
	id 321EE1C000CB; Wed, 12 Jan 2011 14:52:36 -0500 (EST)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Jan 2011 14:52:36 -0500
Message-Id: <1294861956-29285-1-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.6.3.2
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: [PATCH] fconfig 20080329: upgrade from 20060419
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
X-List-Received-Date: Wed, 12 Jan 2011 20:00:28 -0000

Signed-off-by: Michael Smith <msmith@cbnco.com>
---
 recipes/redboot-utils/fconfig_20060419.bb |   17 -----------------
 recipes/redboot-utils/fconfig_20080329.bb |   17 +++++++++++++++++
 2 files changed, 17 insertions(+), 17 deletions(-)
 delete mode 100644 recipes/redboot-utils/fconfig_20060419.bb
 create mode 100644 recipes/redboot-utils/fconfig_20080329.bb

diff --git a/recipes/redboot-utils/fconfig_20060419.bb b/recipes/redboot-utils/fconfig_20060419.bb
deleted file mode 100644
index d8f5ea3..0000000
--- a/recipes/redboot-utils/fconfig_20060419.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-DESCRIPTION = "Tool to edit the Redboot config from userspace"
-PR = "r1"
-
-SRC_URI = "http://andrzejekiert.ovh.org/software/fconfig/fconfig-20060419.tar.gz"
-
-S = ${WORKDIR}/fconfig
-do_compile() {
-	${MAKE}
-}
-
-do_install() {
-	install -d ${D}/${sbindir}
-	install -m 755 ${S}/fconfig ${D}/${sbindir}
-}
-
-SRC_URI[md5sum] = "abc1aca11ee9c9d9b65057c3cf1ca88c"
-SRC_URI[sha256sum] = "d109960dd5e306d4a8ab73e99bfd519ef1c7c674b33b9cfd8fdd61cbd43dac60"
diff --git a/recipes/redboot-utils/fconfig_20080329.bb b/recipes/redboot-utils/fconfig_20080329.bb
new file mode 100644
index 0000000..9bc48d1
--- /dev/null
+++ b/recipes/redboot-utils/fconfig_20080329.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "Application to manipulate RedBoot configuration from userspace"
+HOMEPAGE = "http://andrzejekiert.ovh.org/software.html.en"
+SECTION = "base"
+LICENSE = "GPLv2+"
+PR = "r0"
+
+SRC_URI = "http://andrzejekiert.ovh.org/software/${PN}/${PN}-${PV}.tar.gz"
+
+S = "${WORKDIR}/${PN}"
+
+do_install() {
+	install -d ${D}/${sbindir}
+	install -m 755 ${S}/fconfig ${D}/${sbindir}
+}
+
+SRC_URI[md5sum] = "dac355e9f2a0f48c414c52e2034b6346"
+SRC_URI[sha256sum] = "4ff0e8f07e35e46b705c0dbe9d9544ede01ea092a69e3f7db03e55a3f2bb8eb7"
-- 
1.6.3.2



