Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [217.30.184.167])
	by mail.openembedded.org (Postfix) with ESMTP id 2BACC6FFC0
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Dec 2015 09:26:47 +0000 (UTC)
Received: from lakka.kapsi.fi ([2001:1bc8:1004::1] ident=Debian-exim)
	by mail.kapsi.fi with esmtps (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <mcfrisk@kapsi.fi>)
	id 1a6b1J-0001AK-Bd; Wed, 09 Dec 2015 11:26:45 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.80)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1a6b1J-00079a-79; Wed, 09 Dec 2015 11:26:45 +0200
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Dec 2015 11:26:27 +0200
Message-Id: <1449653187-16148-1-git-send-email-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 1.7.10.4
X-SA-Exim-Connect-IP: 2001:1bc8:1004::1
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Subject: [meta-qt5][PATCH v2] cmake_qt5.bbclass: add DEPENDS to qtbase
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 09 Dec 2015 09:26:49 -0000

All packages using this class need it and it is too easy for developers
to miss and leave race conditions into builds.

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 classes/cmake_qt5.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/classes/cmake_qt5.bbclass b/classes/cmake_qt5.bbclass
index 94a60dc..f63be3c 100644
--- a/classes/cmake_qt5.bbclass
+++ b/classes/cmake_qt5.bbclass
@@ -1,6 +1,8 @@
 inherit cmake
 inherit qmake5_paths
 
+DEPENDS_prepend = "qtbase"
+
 EXTRA_OECMAKE += " \
     -DOE_QMAKE_PATH_PREFIX=${OE_QMAKE_PATH_PREFIX} \
     -DOE_QMAKE_PATH_HEADERS=${OE_QMAKE_PATH_HEADERS} \
-- 
2.6.2


