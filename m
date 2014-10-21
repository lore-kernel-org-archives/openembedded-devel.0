Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qa0-f45.google.com (mail-qa0-f45.google.com
	[209.85.216.45])
	by mail.openembedded.org (Postfix) with ESMTP id 8A13A60702
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Oct 2014 01:59:57 +0000 (UTC)
Received: by mail-qa0-f45.google.com with SMTP id cm18so177210qab.32
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Oct 2014 18:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=SmTjMtxAoONJnnJkIp9hTG0y2FpvTs+TdKdQfhVvjfc=;
	b=0SEg9iJ68rX9694+1xwlQaXYconX9dhpSILdr1isyMCA70BzIEzUGk1n4oHreC+kG1
	zIaun5KeShsQoDmYGfDjmIuJcgYHxTGAOarF4oJ/9hsKnEvkya7y1O9bvDd297Jay60c
	m37VG66i5TXpvQyjSlgCGY1sFRtpTwWXZx5oP7QMtzcIsQ3vroVc4dHXrUsYWfx0onXV
	/jG8nU4gb7HO2ZwYkMLlmi0vzo88N/K1vflfgz31abY8niiyIqa2x2UW3bcZuv3DreD8
	mkBfS1BhvpKe2+lt+lkLEPNibbATqgcrfYk10TbhW346ujc9drc7rWCQbpUJmDLfTtvF
	t4YQ==
X-Received: by 10.140.43.244 with SMTP id e107mr39685586qga.10.1413856797967; 
	Mon, 20 Oct 2014 18:59:57 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.194.195.2])
	by mx.google.com with ESMTPSA id p77sm9488793qgp.25.2014.10.20.18.59.56
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Oct 2014 18:59:57 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Mon, 20 Oct 2014 23:59:49 -0200
Message-Id: <1413856790-4757-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 1/2] nativesdk-qtbase: Fix qtconfig.pri
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
X-List-Received-Date: Tue, 21 Oct 2014 02:00:00 -0000

The value used in the new environment subscript tried to use a target
variable which might not be accurate; use qmake to ask for the right
value for OE_QMAKE_QT_CONFIG variable.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes-qt/qt5/nativesdk-qtbase.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/nativesdk-qtbase.inc b/recipes-qt/qt5/nativesdk-qtbase.inc
index 12f5a54..09f3d9a 100644
--- a/recipes-qt/qt5/nativesdk-qtbase.inc
+++ b/recipes-qt/qt5/nativesdk-qtbase.inc
@@ -240,7 +240,7 @@ do_generate_qt_environment_file() {
     echo 'export OE_QMAKE_RCC=${OE_QMAKE_PATH_HOST_BINS}/rcc' >> $script
     echo 'export OE_QMAKE_QDBUSCPP2XML=${OE_QMAKE_PATH_HOST_BINS}/qdbuscpp2xml' >> $script
     echo 'export OE_QMAKE_QDBUSXML2CPP=${OE_QMAKE_PATH_HOST_BINS}/qdbusxml2cpp' >> $script
-    echo 'export OE_QMAKE_QT_CONFIG=${OE_QMAKE_PATH_TARGET_LIBS}/${QT_DIR_NAME}/mkspecs/qconfig.pri' >> $script
+    echo 'export OE_QMAKE_QT_CONFIG=`qmake -query QT_INSTALL_LIBS`/${QT_DIR_NAME}/mkspecs/qconfig.pri' >> $script
     echo 'export QMAKESPEC=`qmake -query QT_INSTALL_LIBS`/mkspecs/linux-oe-g++' >> $script
 
     # Use relocable sysroot
-- 
1.7.10.4


