Return-Path: <Alex.Gonzalez@digi.com>
Received: from mail1.bemta12.messagelabs.com (mail1.bemta12.messagelabs.com
	[216.82.251.4])
	by mail.openembedded.org (Postfix) with ESMTP id BD80C727C7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Dec 2014 17:43:44 +0000 (UTC)
Received: from [216.82.249.147] by server-4.bemta-12.messagelabs.com id
	D3/C8-03139-CAC9D945; Fri, 26 Dec 2014 17:36:44 +0000
X-Env-Sender: Alex.Gonzalez@digi.com
X-Msg-Ref: server-10.tower-29.messagelabs.com!1419615403!34102722!1
X-Originating-IP: [66.77.174.14]
X-StarScan-Received: 
X-StarScan-Version: 6.12.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5976 invoked from network); 26 Dec 2014 17:36:43 -0000
Received: from mail.mx2.digi.com (HELO mcl-sms-ns2.DIGI.COM) (66.77.174.14)
	by server-10.tower-29.messagelabs.com with RC4-SHA encrypted SMTP;
	26 Dec 2014 17:36:43 -0000
Received: from MTK-SMS-XCH03.digi.com (10.10.8.197) by mail.mx2.digi.com
	(172.16.1.14) with Microsoft SMTP Server (TLS) id 8.3.389.2;
	Fri, 26 Dec 2014 11:36:26 -0600
Received: from DOR-SMS-XCH01.digi.com (10.49.8.99) by MTK-SMS-XCH03.digi.com
	(10.10.8.197) with Microsoft SMTP Server (TLS) id 14.3.210.2;
	Fri, 26 Dec 2014 11:36:42 -0600
Received: from log-linux-hp-agonzal.digi.com (10.101.2.169) by
	dor-sms-xch01.digi.com (10.49.8.99) with Microsoft SMTP Server (TLS) id
	14.3.210.2; Fri, 26 Dec 2014 18:36:40 +0100
From: Alex Gonzalez <alex.gonzalez@digi.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 26 Dec 2014 18:36:26 +0100
Message-ID: <1419615386-27100-2-git-send-email-alex.gonzalez@digi.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1419615386-27100-1-git-send-email-alex.gonzalez@digi.com>
References: <1419615386-27100-1-git-send-email-alex.gonzalez@digi.com>
MIME-Version: 1.0
X-Originating-IP: [10.101.2.169]
X-KSE-AntiSpam-Interceptor-Info: protection disabled
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean
Subject: [openembedded-devel][meta-java][PATCH] openjdk: fix do_install for out of source builds
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
X-List-Received-Date: Fri, 26 Dec 2014 17:43:46 -0000
Content-Type: text/plain

From: Max Krummenacher <max.oss.09@gmail.com>

use ${B} to specify the build directory, thus keep working for
daisy and older versions as well as for dizzy and newer.
---
 recipes-core/openjdk/openjdk-6-common.inc | 2 +-
 recipes-core/openjdk/openjdk-7-common.inc | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-core/openjdk/openjdk-6-common.inc b/recipes-core/openjdk/openjdk-6-common.inc
index 5aa435dc16a1..4254c9f3e13e 100644
--- a/recipes-core/openjdk/openjdk-6-common.inc
+++ b/recipes-core/openjdk/openjdk-6-common.inc
@@ -234,7 +234,7 @@ do_compile() {
 
 do_install() {
 	install -d ${D}${libdir_jvm}
-	cp -R ${WORKDIR}/build/${BUILD_DIR}/j2sdk-image ${D}${JDK_HOME}
+	cp -R ${B}/${BUILD_DIR}/j2sdk-image ${D}${JDK_HOME}
 
 	chmod u+rw -R ${D}${JDK_HOME}
 
diff --git a/recipes-core/openjdk/openjdk-7-common.inc b/recipes-core/openjdk/openjdk-7-common.inc
index 32fab1612465..e14603c2daba 100644
--- a/recipes-core/openjdk/openjdk-7-common.inc
+++ b/recipes-core/openjdk/openjdk-7-common.inc
@@ -172,7 +172,7 @@ do_compile() {
 
 do_install() {
 	install -d ${D}${libdir_jvm}
-	cp -R ${WORKDIR}/build/${BUILD_DIR}/j2sdk-image ${D}${JDK_HOME}
+	cp -R ${B}/${BUILD_DIR}/j2sdk-image ${D}${JDK_HOME}
 
 	chmod u+rw -R ${D}${JDK_HOME}
 

