Return-Path: <max.oss.09@gmail.com>
Received: from mail-we0-f177.google.com (mail-we0-f177.google.com
	[74.125.82.177])
	by mail.openembedded.org (Postfix) with ESMTP id 851907356D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Feb 2015 21:55:53 +0000 (UTC)
Received: by mail-we0-f177.google.com with SMTP id m14so25739662wev.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Feb 2015 13:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=yk6oe8uUQG2rBYPIYz0/BP4ZTRjZ9jzjXlbcMXMNTRE=;
	b=hVPyWX2j4zMXWAEhfMh242jMozL7rFHlXMzKoAJ9RtcmBBaR3sN12JN1kcivX0vryW
	DXJKkk2if+bhAslVeh1JQPTlzi2HYysPvFnZnO4TfY4ocBTER9WLLbKw0tuUA/FO3NWe
	/+V9aBNMHRukTqkePsLPuum8DyT0MkBWD04rYzgHApqR/dIb1hA0OMGzDDoecVMghEa1
	mySnhwjoW3DHf/O2nj+Hd02Yl3SaRb9gcHhtqURhdvQ/YVQ/rscaB300slcjb2irxHQP
	+PvNV+fRvIv0p/XgMiCvR93v4WNlU5sG4JmB6uJg84EaCDVBid7kzlqVnba9Gl6d/vQZ
	TYGg==
X-Received: by 10.180.206.98 with SMTP id ln2mr40305742wic.94.1424123754337;
	Mon, 16 Feb 2015 13:55:54 -0800 (PST)
Received: from linuxdev.toradex.int ([46.140.72.82])
	by mx.google.com with ESMTPSA id p1sm365956wib.23.2015.02.16.13.55.52
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Feb 2015 13:55:53 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Feb 2015 22:55:32 +0100
Message-Id: <1424123733-16696-6-git-send-email-max.oss.09@gmail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1424123733-16696-1-git-send-email-max.oss.09@gmail.com>
References: <1424123733-16696-1-git-send-email-max.oss.09@gmail.com>
Subject: [meta-java][PATCH 5/7] antlr: fix override for native build
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
X-List-Received-Date: Mon, 16 Feb 2015 21:55:55 -0000

The override virtclass_native has been deprecated and removed from the
buildsystem, use class-native instead.

While at it fix whitespace issues.

Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
---
 recipes-core/antlr/antlr_2.7.7.bb | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/recipes-core/antlr/antlr_2.7.7.bb b/recipes-core/antlr/antlr_2.7.7.bb
index 2c7ab8e..9d9d2d4 100644
--- a/recipes-core/antlr/antlr_2.7.7.bb
+++ b/recipes-core/antlr/antlr_2.7.7.bb
@@ -5,25 +5,25 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=361934e706423915b4d9f413ad37fb65"
 
 SRC_URI = "http://www.antlr2.org/download/${BP}.tar.gz"
-SRC_URI_virtclass_native += "file://runantlr"
+SRC_URI_append_class-native = " file://runantlr"
 
 inherit java-library
 
-do_configure_virtclass_native() {
-        sed -i -e"s|@JAR_FILE@|${STAGING_DATADIR_JAVA_NATIVE}/antlr.jar|" ${WORKDIR}/runantlr
+do_configure_class-native() {
+    sed -i -e"s|@JAR_FILE@|${STAGING_DATADIR_JAVA_NATIVE}/antlr.jar|" ${WORKDIR}/runantlr
 }
 
 do_compile() {
-  mkdir -p build
+    mkdir -p build
 
-  javac -sourcepath . -d build `find antlr -name "*.java"`
+    javac -sourcepath . -d build `find antlr -name "*.java"`
 
-  fastjar cf ${JARFILENAME} -C build .
+    fastjar cf ${JARFILENAME} -C build .
 }
 
-do_install_virtclass_native() {
-        install ${D}${bindir}
-        install -m 0755 ${WORKDIR}/runantlr {D}${bindir}/
+do_install_class-native() {
+    install -d ${D}${bindir}
+    install -m 0755 ${WORKDIR}/runantlr ${D}${bindir}/
 }
 
 SRC_URI[md5sum] = "01cc9a2a454dd33dcd8c856ec89af090"
-- 
1.9.3


