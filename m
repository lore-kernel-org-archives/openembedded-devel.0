Received: from vms173017pub.verizon.net ([206.46.173.17])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1O9uio-0006Dy-Mv
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 May 2010 08:38:14 +0200
Received: from gandalf.denix.org ([unknown] [71.251.58.177])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L1Z00F6MJKIYE80@vms173017.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	06 May 2010 01:34:00 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id C4E6414AF5C; Thu,
	06 May 2010 02:33:53 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 06 May 2010 02:33:50 -0400
Message-id: <1273127630-25388-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.6.3.3
X-SA-Exim-Connect-IP: 206.46.173.17
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [RFC, PATCH] qt4-embedded: change the default decoration (window title) styling
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
X-List-Received-Date: Thu, 06 May 2010 06:38:15 -0000

Built all the decoration styles in, otherwsie there is no window title
in QWS applications...

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 recipes/qt4/qt4-embedded.inc |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/recipes/qt4/qt4-embedded.inc b/recipes/qt4/qt4-embedded.inc
index 7e0be6e..3d78c7a 100644
--- a/recipes/qt4/qt4-embedded.inc
+++ b/recipes/qt4/qt4-embedded.inc
@@ -4,7 +4,7 @@ LICENSE = "GPL QPL"
 PRIORITY = "optional"
 HOMEPAGE = "http://www.trolltech.com"
 DEPENDS += "directfb tslib"
-INC_PR = "r18"
+INC_PR = "r19"
 
 QT_BASE_NAME ?= "qt4-embedded"
 QT_BASE_LIB  ?= "libqt-embedded"
@@ -28,7 +28,6 @@ S = "${WORKDIR}/qt-embedded-linux-opensource-src-${PV}"
 
 QT_CONFIG_FLAGS += " \
     -qtlibinfix ${QT_LIBINFIX} \
-    -qt-decoration-styled -plugin-decoration-default -plugin-decoration-windows \
     -plugin-gfx-transformed -plugin-gfx-qvfb -plugin-gfx-vnc -plugin-gfx-directfb \
     -plugin-mouse-tslib -qt-mouse-pc -qt-mouse-qvfb \
     -qt-kbd-tty \
-- 
1.6.3.3



