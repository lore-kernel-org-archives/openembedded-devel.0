Received: from tx2ehsobe005.messaging.microsoft.com ([65.55.88.15]
	helo=tx2outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B28495@freescale.com>) id 1U1EPf-00084i-G7
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Feb 2013 12:04:08 +0100
Received: from mail142-tx2-R.bigfish.com (10.9.14.254) by
	TX2EHSOBE013.bigfish.com (10.9.40.33) with Microsoft SMTP Server id
	14.1.225.23; Fri, 1 Feb 2013 10:03:06 +0000
Received: from mail142-tx2 (localhost [127.0.0.1])	by
	mail142-tx2-R.bigfish.com (Postfix) with ESMTP id F2BC3240074	for
	<openembedded-devel@lists.openembedded.org>;
	Fri,  1 Feb 2013 10:03:06 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1ee6h1de0h1202h1e76h1d1ah1d2ahzz8275bhz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h1155h)
Received: from mail142-tx2 (localhost.localdomain [127.0.0.1]) by mail142-tx2
	(MessageSwitch) id 1359712984784060_20738;
	Fri,  1 Feb 2013 10:03:04 +0000 (UTC)
Received: from TX2EHSMHS027.bigfish.com (unknown [10.9.14.245])	by
	mail142-tx2.bigfish.com (Postfix) with ESMTP id B15FE44004F	for
	<openembedded-devel@lists.openembedded.org>;
	Fri,  1 Feb 2013 10:03:04 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS027.bigfish.com
	(10.9.99.127) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 1 Feb 2013 10:03:04 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-004.039d.mgd.msft.net (10.84.1.14) with Microsoft SMTP
	Server (TLS) id 14.2.318.3; Fri, 1 Feb 2013 10:02:55 +0000
Received: from sbuilder136.ap.freescale.net (sun.ap.freescale.net
	[10.192.208.136])	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP
	id r11A2o9Z030747;	Fri, 1 Feb 2013 03:02:53 -0700
From: <b28495@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 1 Feb 2013 18:02:45 +0800
Message-ID: <1359712968-22554-2-git-send-email-b28495@freescale.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1359712968-22554-1-git-send-email-b28495@freescale.com>
References: <1359712968-22554-1-git-send-email-b28495@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: b29882@freescale.com
Subject: [meta-java][for denzil] 1/4] openjdk: not use update-alternatives class
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
X-List-Received-Date: Fri, 01 Feb 2013 11:04:32 -0000
Content-Type: text/plain

From: Ting Liu <b28495@freescale.com>

Signed-off-by: Ting Liu <b28495@freescale.com>
---
 recipes-core/openjdk/openjdk-6-common.inc |   19 +++++++++++++++++--
 recipes-core/openjdk/openjdk-7-common.inc |   19 +++++++++++++++++--
 recipes-core/openjdk/openjdk-postinst.inc |   11 -----------
 3 files changed, 34 insertions(+), 15 deletions(-)

diff --git a/recipes-core/openjdk/openjdk-6-common.inc b/recipes-core/openjdk/openjdk-6-common.inc
index 99f0aa9..5990de7 100644
--- a/recipes-core/openjdk/openjdk-6-common.inc
+++ b/recipes-core/openjdk/openjdk-6-common.inc
@@ -10,7 +10,7 @@ ICEDTEA = "icedtea6-${ICEDTEA_VERSION}"
 S = "${WORKDIR}/${ICEDTEA}"
 B = "${S}/build"
 
-INC_PR = "r21"
+INC_PR = "r22"
 
 SRC_URI = "\
   ${ICEDTEA_URI} \
@@ -461,4 +461,19 @@ FILES_${JDKPN}-doc = "${JDK_HOME}/man"
 
 require openjdk-postinst.inc
 
-ALTERNATIVE_PRIORITY = "20"
+pkg_postinst_${JDKPN}-jre () {
+    update-alternatives --install ${bindir}/java java ${JDK_HOME}/jre/bin/java 15
+}
+
+pkg_prerm_${JDKPN}-jre () {
+    update-alternatives --remove java ${JDK_HOME}/jre/bin/java
+}
+
+pkg_postinst_${JDKPN}-jdk () {
+    update-alternatives --install ${bindir}/javac javac ${JDK_HOME}/bin/javac 15
+}
+
+pkg_prerm_${JDKPN}-jdk () {
+    update-alternatives --remove javac ${JDK_HOME}/bin/javac
+}
+
diff --git a/recipes-core/openjdk/openjdk-7-common.inc b/recipes-core/openjdk/openjdk-7-common.inc
index 3246814..1dbfc0e 100644
--- a/recipes-core/openjdk/openjdk-7-common.inc
+++ b/recipes-core/openjdk/openjdk-7-common.inc
@@ -10,7 +10,7 @@ ICEDTEA = "NEEDS TO BE SET"
 S = "${WORKDIR}/${ICEDTEA}"
 B = "${S}/build"
 
-INC_PR = "r5"
+INC_PR = "r6"
 
 SRC_URI = " \
   ${ICEDTEA_URI} \
@@ -403,4 +403,19 @@ FILES_${JDKPN}-doc = "${JDK_HOME}/man"
 
 require openjdk-postinst.inc
 
-ALTERNATIVE_PRIORITY = "50"
+pkg_postinst_${JDKPN}-jre () {
+    update-alternatives --install ${bindir}/java java ${JDK_HOME}/jre/bin/java 15
+}
+
+pkg_prerm_${JDKPN}-jre () {
+    update-alternatives --remove java ${JDK_HOME}/jre/bin/java
+}
+
+pkg_postinst_${JDKPN}-jdk () {
+    update-alternatives --install ${bindir}/javac javac ${JDK_HOME}/bin/javac 15
+}
+
+pkg_prerm_${JDKPN}-jdk () {
+    update-alternatives --remove javac ${JDK_HOME}/bin/javac
+}
+
diff --git a/recipes-core/openjdk/openjdk-postinst.inc b/recipes-core/openjdk/openjdk-postinst.inc
index e63a451..3502b7a 100644
--- a/recipes-core/openjdk/openjdk-postinst.inc
+++ b/recipes-core/openjdk/openjdk-postinst.inc
@@ -72,14 +72,3 @@ pkg_prerm_${JDKPN}-vm-zero () {
         fi
 }
 
-inherit update-alternatives
-
-ALTERNATIVE_${JDKPN}-jre = "java"
-ALTERNATIVE_TARGET_${JDKPN}-jre = "${JDK_HOME}/jre/bin/java"
-
-ALTERNATIVE_${JDKPN}-jdk = "javac"
-ALTERNATIVE_TARGET_${JDKPN}-jdk = "${JDK_HOME}/bin/javac"
-
-ALTERNATIVE_LINK_NAME[java] = "${bindir}/java"
-ALTERNATIVE_LINK_NAME[javac] = "${bindir}/javac"
-
-- 
1.7.5.4




