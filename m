Return-Path: <sgh@sgh.dk>
Received: from mx-aarh-2.stofanet.dk (mx-aarh-2.stofanet.dk [212.10.10.12])
	by mail.openembedded.org (Postfix) with ESMTP id 051BA6EEF5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Mar 2014 13:44:49 +0000 (UTC)
Received: from 5634f347.rev.stofanet.dk ([86.52.243.71] helo=asrock)
	by mx-aarh-2.stofanet.dk (envelope-from <sgh@sgh.dk>)
	with esmtp id 1WQGna-0001pk-1i
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Mar 2014 14:44:50 +0100
Received: from koontz.lgs-net.com (localhost [127.0.0.1])
	by asrock (Postfix) with ESMTP id 3CB1B7F197;
	Wed, 19 Mar 2014 14:44:50 +0100 (CET)
From: =?UTF-8?q?S=C3=B8ren=20Holm?= <sgh@sgh.dk>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Mar 2014 14:44:37 +0100
Message-Id: <1395236677-28379-1-git-send-email-sgh@sgh.dk>
X-Mailer: git-send-email 1.9.0
Cc: =?UTF-8?q?S=C3=B8ren=20Holm?= <sgh@sgh.dk>
Subject: [meta-qt5][PATCH] qtbase: Add libxi to depends.
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
X-List-Received-Date: Wed, 19 Mar 2014 13:44:52 -0000

Not having so gives errors like this when configuring qtbase

XInput2 auto-detection... ()
compiling /home/teamcitybuildagent/work/33644ecacd0fdba5/build/tmp/work/i586-poky-linux/qtbase/5.1.1-r0/qtbase-opensource-src-5.1.1/config.tests/x11/xinput2/xinput2.cpp
/home/teamcitybuildagent/work/33644ecacd0fdba5/build/tmp/work/i586-poky-linux/qtbase/5.1.1-r0/qtbase-opensource-src-5.1.1/config.tests/x11/xinput2/xinput2.cpp:43:36: fatal error: X11/extensions/XInput2.h: No such file or directory
                                   ^
compilation terminated.
make: *** [xinput2.o] Error 1
XInput2 disabled.
XInput2 support cannot be enabled due to functionality tests!
Turn on verbose messaging (-v) to /home/teamcitybuildagent/work/33644ecacd0fdba5/build/tmp/work/i586-poky-linux/qtbase/5.1.1-r0/qtbase-opensource-src-5.1.1/configure to see the final report.
If you believe this message is in error you may use the continue
switch (-continue) to /home/teamcitybuildagent/work/33644ecacd0fdba5/build/tmp/work/i586-poky-linux/qtbase/5.1.1-r0/qtbase-opensource-src-5.1.1/configure to continue.
---
 recipes-qt/qt5/qtbase.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
index eb22e40..3888a0a 100644
--- a/recipes-qt/qt5/qtbase.inc
+++ b/recipes-qt/qt5/qtbase.inc
@@ -24,7 +24,7 @@ SRC_URI += " \
     file://0024-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-to-determine-pa.patch \
 "
 
-DEPENDS += "qtbase-native"
+DEPENDS += "qtbase-native libxi"
 
 # for syncqt
 RDEPENDS_${PN}-tools += "perl"
-- 
1.9.0


