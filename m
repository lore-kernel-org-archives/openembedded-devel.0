Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f173.google.com (mail-we0-f173.google.com
	[74.125.82.173])
	by mail.openembedded.org (Postfix) with ESMTP id E1B7A6059A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jun 2014 19:38:48 +0000 (UTC)
Received: by mail-we0-f173.google.com with SMTP id t60so1783009wes.18
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jun 2014 12:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=zH/5wSz5DWtP7QaCTC/WdwvqoPJx0yJnmUWJV4Tcr5Q=;
	b=aeY25++3JZBJcLVYa1UmbWmU2q22aw0mi4SJlGTTM7oqtgz0E3Z1wCYnXI2vgeBApM
	lBBklQy3Bww5IH5u8Dyyw7qIFLBsvoqrWblClZbOvbi45zHy5vFFP4zt772UFvUFrRga
	YIDRF8onkbuLjPfh96H1oRgqpgdRb29buK6BPXUZauflyM8q/vFz7nrLdRDQhta/5f5Y
	lxP+nXMW6yTW5o3kcra3gkfP2pfa0zqiRHyxnbO+fsqrETndwgEgGYsg1qhTTlyipcNn
	jGOx9pHfhKwUtWi69RDQF3dKI6dolWuTw+LLm5yCTf2cLd9fuSl2v0HPBoiy9pLoEeEh
	LwWg==
X-Received: by 10.194.71.81 with SMTP id s17mr65632845wju.10.1402601929007;
	Thu, 12 Jun 2014 12:38:49 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	o46sm6654137eef.31.2014.06.12.12.38.47 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Jun 2014 12:38:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Jun 2014 21:39:07 +0200
Message-Id: <1402601947-20352-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
Subject: [meta-qt5][PATCH] qtwayland: respect OE_QMAKE_PATH_QT_HEADERS and use QT_VERSION variable
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
X-List-Received-Date: Thu, 12 Jun 2014 19:38:57 -0000

* QT_VERSION allows to use 5.3.1 e.g. when overriding SRCREV
* ${includedir}/${QT_DIR_NAME} is the default value of OE_QMAKE_PATH_QT_HEADERS, but
  when it's changed by user we should respect it here

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qtwayland_git.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_git.bb
index 239b3ce..28a3760 100644
--- a/recipes-qt/qt5/qtwayland_git.bb
+++ b/recipes-qt/qt5/qtwayland_git.bb
@@ -10,8 +10,10 @@ SRC_URI += " \
     file://0001-examples.pro-include-server-buffer-only-when-buildin.patch \
 "
 
+QT_VERSION ?= "5.3.0"
+
 do_install_append() {
     # do install files created by qtwaylandscanner
-    install ${B}/include/QtCompositor/5.3.0/QtCompositor/private/qwayland-server-*.h ${D}${includedir}/${QT_DIR_NAME}/QtCompositor/5.3.0/QtCompositor/private
-    install ${B}/include/QtCompositor/5.3.0/QtCompositor/private/*protocol*.h ${D}${includedir}/${QT_DIR_NAME}/QtCompositor/5.3.0/QtCompositor/private
+    install ${B}/include/QtCompositor/${QT_VERSION}/QtCompositor/private/qwayland-server-*.h ${D}${OE_QMAKE_PATH_QT_HEADERS}/QtCompositor/${QT_VERSION}/QtCompositor/private
+    install ${B}/include/QtCompositor/${QT_VERSION}/QtCompositor/private/*protocol*.h ${D}${OE_QMAKE_PATH_QT_HEADERS}/QtCompositor/${QT_VERSION}/QtCompositor/private
 }
-- 
2.0.0


