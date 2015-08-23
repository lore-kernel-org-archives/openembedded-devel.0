Return-Path: <net147@gmail.com>
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 4DE2973CF2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Aug 2015 12:16:44 +0000 (UTC)
Received: by pdbmi9 with SMTP id mi9so42756619pdb.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Aug 2015 05:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=s0/yViKBy6KJO9NQN2lpTHx31oWN9ssrU1RLJ/1U5vM=;
	b=iixL4s7PaMuxP4TGuF/RME+KfgpYgsevEsYqWfrNWLHsuo/+RzMuV1XFr+myoEjZSh
	2FqDgqBz2V6LThhCdM93B/5oYp9qFIEol/MCUOKfGN6eekrzMQV0Q13HnaypZLPBd2w2
	V3TFfF1T6NQ3BtdCm8x+p8owTl6d+hh+EMcmmItwoymg04krmZLsDBrOQtiEwLzg9pyp
	xERHG0v5Xr2171JsdNgH/yM7N38ICymt6aiGIB3db87i5CsMSKbKQKqzbMLAwhi1lD9I
	bfRZU6feUkiALfE76LXoE7qisJoqL+ZWijXL/SxdFjQ0Qk+PWZd9Yfsk+2HFesWPA947
	bgsA==
X-Received: by 10.70.38.69 with SMTP id e5mr23250164pdk.31.1440332204783;
	Sun, 23 Aug 2015 05:16:44 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	ip7sm13808641pbc.68.2015.08.23.05.16.43
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 23 Aug 2015 05:16:43 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Aug 2015 22:16:49 +1000
Message-Id: <1440332209-8802-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.5.0
Subject: [meta-qt5][PATCH] qtbase: replace host paths with qmake built-in properties in qconfig.pri
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
X-List-Received-Date: Sun, 23 Aug 2015 12:16:47 -0000

This avoids qconfig.pri in the Qt SDK incorrectly including paths from
the build host that may not exist on the SDK host. As the paths are
now correct, qmake can correctly detect system include paths and use
-isystem instead of -I for Qt's include directories which allows the
suppression of warnings from library headers when building Qt
applications.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 recipes-qt/qt5/qtbase_git.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index ae63150..324a115 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -234,6 +234,11 @@ do_install_append() {
     # Remove macx-ios-clang directory because /usr/lib/qt5/mkspecs/macx-ios-clang/rename_main.sh:#!/bin/bash
     # triggers QA Issue: qtbase-mkspecs requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]
     rm -rf ${D}/${OE_QMAKE_PATH_QT_ARCHDATA}/mkspecs/macx-ios-clang
+
+    # Replace host paths with qmake built-in properties
+    sed -i -e 's| ${STAGING_DIR_NATIVE}| $$[QT_HOST_PREFIX]|g' \
+        -e 's| ${STAGING_DIR_HOST}| $$[QT_INSTALL_PREFIX]|g' \
+        ${D}/${OE_QMAKE_PATH_QT_ARCHDATA}/mkspecs/qconfig.pri
 }
 
 PACKAGES =. " \
-- 
2.5.0


