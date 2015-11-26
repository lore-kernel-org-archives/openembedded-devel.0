Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id DA07C60132
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Nov 2015 08:07:08 +0000 (UTC)
Received: by wmec201 with SMTP id c201so11566112wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Nov 2015 00:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=kTw2H0pg8M9np6rcWN2+wV14CMhIdHRgwBqrF2edv6k=;
	b=Z0MxgrIVQ4J3Nge/QFwJeNZHNm9n3GkDSp390DHErhW/QBChCbU2cwCGP/8pvcF7Sh
	FjmuP45dwH0dWcrFvA+mahgnF2XFzamT+PIGMoGe7CYWmJlxsoF1PAguAiBTLTfTspyj
	rEXv+DVs2mj3BVrBcseQ5zVPTDRii3XPyjP0GBc9ldApEr973CAm6ParhcmUlJu2wkh1
	Qwinwab6eqeAyTPE9n+fv5MO0+lDoNScpdIySCB6Dh5YffJ2U5cxeZCwY0BH/DdkfbDD
	CgrNJpgwL5mJxCzGgBhYAc3L8sgjdcUUgH6iAyjHaQH1KhGUDGwP9u0uxI+ithRFSGIL
	Q5IA==
X-Received: by 10.194.186.196 with SMTP id fm4mr53682614wjc.152.1448525228997; 
	Thu, 26 Nov 2015 00:07:08 -0800 (PST)
Received: from localhost.localdomain
	(ip-176-198-253-155.hsi05.unitymediagroup.de. [176.198.253.155])
	by smtp.googlemail.com with ESMTPSA id
	cw3sm26674885wjb.26.2015.11.26.00.07.08
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 26 Nov 2015 00:07:08 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Nov 2015 09:06:37 +0100
Message-Id: <1448525199-27504-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Subject: [PATCH][meta-qt5][master 1/2] qt5-creator: building qmldesigner with gcc5 works so enable it
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
X-List-Received-Date: Thu, 26 Nov 2015 08:07:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qt5-creator_3.5.1.bb | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/recipes-qt/qt5/qt5-creator_3.5.1.bb b/recipes-qt/qt5/qt5-creator_3.5.1.bb
index 4bb0998..2d8cee9 100644
--- a/recipes-qt/qt5/qt5-creator_3.5.1.bb
+++ b/recipes-qt/qt5/qt5-creator_3.5.1.bb
@@ -30,12 +30,6 @@ S = "${WORKDIR}/qt-creator-opensource-src-${PV}"
 
 EXTRA_QMAKEVARS_PRE += "IDE_LIBRARY_BASENAME=${baselib}${QT_DIR_NAME}"
 
-do_configure_prepend() {
-    # causes gcc infinite loop with 4.9.x for arm targets similar to
-    # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=61033
-    export DO_NOT_BUILD_QMLDESIGNER=1
-}
-
 do_configure_append() {
     # Find native tools
     sed -i 's:${STAGING_BINDIR}.*/lrelease:${STAGING_BINDIR_NATIVE}${QT_DIR_NAME}/lrelease:g' ${B}/share/qtcreator/translations/Makefile
@@ -67,6 +61,7 @@ FILES_${PN} += " \
 FILES_${PN}-dbg += " \
     ${libdir}${QT_DIR_NAME}/qtcreator/.debug \
     ${libdir}${QT_DIR_NAME}/qtcreator/plugins/.debug \
+    ${libdir}${QT_DIR_NAME}/qtcreator/plugins/qmldesigner/.debug \
     ${libdir}${QT_DIR_NAME}/qtcreator/plugins/qbs/plugins/.debug \
 "
 
-- 
2.1.0


