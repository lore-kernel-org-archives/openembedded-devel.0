Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 196986F489
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Feb 2014 20:15:10 +0000 (UTC)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 28 Feb 2014 21:15:06 +0100
Message-Id: <1393618507-29414-2-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1393618507-29414-1-git-send-email-obi@opendreambox.org>
References: <1393618507-29414-1-git-send-email-obi@opendreambox.org>
Subject: [meta-qt5][PATCH 2/3] qtdeclarative: drop qtsvg dependency, add packageconfig for qtxmlpatterns
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
X-List-Received-Date: Fri, 28 Feb 2014 20:15:13 -0000

The dependency on qtsvg seems to be a leftover from an old version.
Version 5.2.1 of qtdeclarative doesn't include any reference to it.

Depend on qtbase in case qtxmlpatterns gets disabled.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 recipes-qt/qt5/qtdeclarative.inc | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtdeclarative.inc b/recipes-qt/qt5/qtdeclarative.inc
index 12e650f..bd68955 100644
--- a/recipes-qt/qt5/qtdeclarative.inc
+++ b/recipes-qt/qt5/qtdeclarative.inc
@@ -5,4 +5,15 @@ SRC_URI += " \
     file://0003-Fix-wrong-calculation-of-viewPort-for-transitions.patch \
 "
 
-DEPENDS += "qtsvg qtxmlpatterns"
+DEPENDS += "qtbase"
+
+PACKAGECONFIG ??= "qtxmlpatterns"
+PACKAGECONFIG[qtxmlpatterns] = ",,qtxmlpatterns"
+
+do_configure_prepend() {
+    # disable qtxmlpatterns test if it isn't enabled by PACKAGECONFIG
+    sed -e 's/^\(qtHaveModule(xmlpatterns)\)/OE_QTXMLPATTERNS_ENABLED:\1/' -i ${S}/src/imports/imports.pro
+    sed -e 's/^\(!qtHaveModule(xmlpatterns)\)/!OE_QTXMLPATTERNS_ENABLED|\1/' -i ${S}/tests/auto/quick/quick.pro
+}
+
+EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'qtxmlpatterns', 'CONFIG+=OE_QTXMLPATTERNS_ENABLED', '', d)}"
-- 
1.8.3.2


