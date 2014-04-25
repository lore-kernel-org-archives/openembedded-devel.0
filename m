Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 5187965E10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Apr 2014 22:51:43 +0000 (UTC)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Apr 2014 00:51:40 +0200
Message-Id: <1398466300-8008-2-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1398466300-8008-1-git-send-email-obi@opendreambox.org>
References: <1398466300-8008-1-git-send-email-obi@opendreambox.org>
Subject: [meta-qt5][PATCH 2/2] qtbase: xinput2 depends on libxi
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
X-List-Received-Date: Fri, 25 Apr 2014 22:51:46 -0000

| ../../../../qtbase-opensource-src-5.2.1/config.tests/x11/xinput2/xinput2.cpp:43:36: fatal error: X11/extensions/XInput2.h: No such file or directory
|  #include <X11/extensions/XInput2.h>
|                                     ^
| compilation terminated.
| make: *** [xinput2.o] Error 1
| XInput2 disabled.
| XInput2 support cannot be enabled due to functionality tests!

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 recipes-qt/qt5/qtbase.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
index 6ba4bd5..b0ef12b 100644
--- a/recipes-qt/qt5/qtbase.inc
+++ b/recipes-qt/qt5/qtbase.inc
@@ -96,7 +96,7 @@ PACKAGECONFIG[sql-sqlite] = "-sql-sqlite,-no-sql-sqlite,sqlite3"
 PACKAGECONFIG[xcursor] = "-xcursor,-no-xcursor,libxcursor"
 PACKAGECONFIG[xinerama] = "-xinerama,-no-xinerama,libxinerama"
 PACKAGECONFIG[xinput] = "-xinput,-no-xinput"
-PACKAGECONFIG[xinput2] = "-xinput2,-no-xinput2"
+PACKAGECONFIG[xinput2] = "-xinput2,-no-xinput2,libxi"
 PACKAGECONFIG[xfixes] = "-xfixes,-no-xfixes,libxfixes"
 PACKAGECONFIG[xrandr] = "-xrandr,-no-xrandr,libxrandr"
 PACKAGECONFIG[xrender] = "-xrender,-no-xrender,libxrender"
-- 
1.8.3.2


