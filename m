Return-Path: <net147@gmail.com>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 8D06E73CF2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Aug 2015 13:55:52 +0000 (UTC)
Received: by pdrh1 with SMTP id h1so44047533pdr.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Aug 2015 06:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=v+VFV0ZWNamkhZhxWVzLg3psHGXPYFchBvTuI4iQCsA=;
	b=qq/OXFIXE7g1wPNAIe1FKOTTXq/EEEYeim0cylhFaB7IrTAxpz6uPBXIi258tY72z1
	HE+Ewn5FK+SjB7o2f2dy6nwU2gtRKqxm/lKEeZSf/cg12+S+XqF5syf4H9wnFGyUNM3I
	gvugIkYPEXFxyp3UTTpuxqIEeYjcz3Va53lWfHhw4mptrrkI7S0YaiQ5jYuc/M0cridE
	ygBNWPJrRJlz2KOR539YqABsRo4enb2DJCvVfPKeGVFmNRj12zeT1WEjtvjzkQ1szet5
	FFWlU1Oe94TPkrxnt6W0AOW3yND/CbM1Tlp1B03VO5dTqZCCck+7T6h/Rpiffj1Te5qm
	FjeA==
X-Received: by 10.70.42.133 with SMTP id o5mr3154633pdl.169.1440338152343;
	Sun, 23 Aug 2015 06:55:52 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	tz1sm14045316pbc.50.2015.08.23.06.55.51
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 23 Aug 2015 06:55:51 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Aug 2015 23:55:58 +1000
Message-Id: <1440338158-11936-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.5.0
Subject: [meta-qt5][PATCH] populate_sdk_qt5.bbclass: set paths correctly in qt.conf
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
X-List-Received-Date: Sun, 23 Aug 2015 13:55:55 -0000

Set paths correctly in qt.conf so that $$[QT_SYSROOT] and
$$[QT_INSTALL_PREFIX] can be used from qmake.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 classes/populate_sdk_qt5.bbclass | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/classes/populate_sdk_qt5.bbclass b/classes/populate_sdk_qt5.bbclass
index 79df489..149a448 100644
--- a/classes/populate_sdk_qt5.bbclass
+++ b/classes/populate_sdk_qt5.bbclass
@@ -15,23 +15,24 @@ create_sdk_files_prepend () {
     qtconf=${SDK_OUTPUT}/${SDKPATHNATIVE}${OE_QMAKE_PATH_HOST_BINS}/qt.conf
     touch $qtconf
     echo '[Paths]' >> $qtconf
-    echo 'Prefix = ${SDKTARGETSYSROOT}' >> $qtconf
-    echo 'Headers = ${SDKTARGETSYSROOT}${OE_QMAKE_PATH_QT_HEADERS}' >> $qtconf
-    echo 'Libraries = ${SDKTARGETSYSROOT}${OE_QMAKE_PATH_LIBS}' >> $qtconf
-    echo 'ArchData = ${SDKTARGETSYSROOT}${OE_QMAKE_PATH_QT_ARCHDATA}' >> $qtconf
-    echo 'Data = ${SDKTARGETSYSROOT}${OE_QMAKE_PATH_QT_DATA}' >> $qtconf
-    echo 'Binaries = ${SDKTARGETSYSROOT}${OE_QMAKE_PATH_QT_BINS}' >> $qtconf
-    echo 'LibraryExecutables = ${SDKTARGETSYSROOT}${OE_QMAKE_PATH_LIBEXECS}' >> $qtconf
-    echo 'Plugins = ${SDKTARGETSYSROOT}${OE_QMAKE_PATH_PLUGINS}' >> $qtconf
-    echo 'Imports = ${SDKTARGETSYSROOT}${OE_QMAKE_PATH_IMPORTS}' >> $qtconf
-    echo 'Qml2Imports = ${SDKTARGETSYSROOT}${OE_QMAKE_PATH_QML}' >> $qtconf
-    echo 'Translations = ${SDKTARGETSYSROOT}${OE_QMAKE_PATH_QT_TRANSLATIONS}' >> $qtconf
-    echo 'Documentation = ${SDKTARGETSYSROOT}${OE_QMAKE_PATH_QT_DOCS}' >> $qtconf
-    echo 'Settings = ${SDKTARGETSYSROOT}${OE_QMAKE_PATH_QT_SETTINGS}' >> $qtconf
-    echo 'Examples = ${SDKTARGETSYSROOT}${OE_QMAKE_PATH_QT_EXAMPLES}' >> $qtconf
-    echo 'Tests = ${SDKTARGETSYSROOT}${OE_QMAKE_PATH_QT_TESTS}' >> $qtconf
+    echo 'Prefix = ${OE_QMAKE_PATH_PREFIX}' >> $qtconf
+    echo 'Headers = ${OE_QMAKE_PATH_QT_HEADERS}' >> $qtconf
+    echo 'Libraries = ${OE_QMAKE_PATH_LIBS}' >> $qtconf
+    echo 'ArchData = ${OE_QMAKE_PATH_QT_ARCHDATA}' >> $qtconf
+    echo 'Data = ${OE_QMAKE_PATH_QT_DATA}' >> $qtconf
+    echo 'Binaries = ${OE_QMAKE_PATH_QT_BINS}' >> $qtconf
+    echo 'LibraryExecutables = ${OE_QMAKE_PATH_LIBEXECS}' >> $qtconf
+    echo 'Plugins = ${OE_QMAKE_PATH_PLUGINS}' >> $qtconf
+    echo 'Imports = ${OE_QMAKE_PATH_IMPORTS}' >> $qtconf
+    echo 'Qml2Imports = ${OE_QMAKE_PATH_QML}' >> $qtconf
+    echo 'Translations = ${OE_QMAKE_PATH_QT_TRANSLATIONS}' >> $qtconf
+    echo 'Documentation = ${OE_QMAKE_PATH_QT_DOCS}' >> $qtconf
+    echo 'Settings = ${OE_QMAKE_PATH_QT_SETTINGS}' >> $qtconf
+    echo 'Examples = ${OE_QMAKE_PATH_QT_EXAMPLES}' >> $qtconf
+    echo 'Tests = ${OE_QMAKE_PATH_QT_TESTS}' >> $qtconf
     echo 'HostPrefix = ${SDKPATHNATIVE}' >> $qtconf
     echo 'HostBinaries = ${SDKPATHNATIVE}${OE_QMAKE_PATH_HOST_BINS}' >> $qtconf
+    echo 'Sysroot = ${SDKTARGETSYSROOT}' >> $qtconf
 }
 
 FEATURE_PACKAGES_qtcreator-debug = "packagegroup-qt5-qtcreator-debug"
-- 
2.5.0


