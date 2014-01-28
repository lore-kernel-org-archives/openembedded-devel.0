Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id BBD476E87E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jan 2014 15:34:46 +0000 (UTC)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Jan 2014 16:34:43 +0100
Message-Id: <1390923283-17138-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <20140128143329.GK3718@jama>
References: <20140128143329.GK3718@jama>
Subject: [meta-oe][PATCH] libconnman-qt: fix linking and packaging with Qt4/Embedded
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
X-List-Received-Date: Tue, 28 Jan 2014 15:34:48 -0000

* Don't overwrite EXTRA_QMAKEVARS_PRE, because qt4e.bbclass uses
  it to pass on QT_LIBINFX.
* Generalize QT_IMPORTS_DIR to make it valid for qte.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta-oe/recipes-qt/libconnman-qt/libconnman-qt.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-qt/libconnman-qt/libconnman-qt.inc b/meta-oe/recipes-qt/libconnman-qt/libconnman-qt.inc
index e4f68db..77e70e8 100644
--- a/meta-oe/recipes-qt/libconnman-qt/libconnman-qt.inc
+++ b/meta-oe/recipes-qt/libconnman-qt/libconnman-qt.inc
@@ -12,7 +12,7 @@ S = "${WORKDIR}/git"
 
 inherit pkgconfig
 
-EXTRA_QMAKEVARS_PRE = "CONFIG+=notests"
+EXTRA_QMAKEVARS_PRE += "CONFIG+=notests"
 
 do_configure_prepend() {
     # Hack *.pro variables
@@ -48,6 +48,6 @@ FILES_${PN}-plugin-dbg = " \
     ${PLUGINS_TARGET}/.debug/* \
 "
 
-QT_IMPORTS_DIR = "${libdir}/qt4/imports"
+QT_IMPORTS_DIR = "${libdir}/${QT_DIR_NAME}/imports"
 # the plugin target needs to be the same as 'target.path' and 'qmldir.path' in ${S}/plugin/plugin.pro
 PLUGINS_TARGET = "${QT_IMPORTS_DIR}/MeeGo/Connman"
-- 
1.8.3.2


