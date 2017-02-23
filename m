Return-Path: <daniel@zonque.org>
Received: from mail.zonque.de (svenfoo.org [82.94.215.22])
	by mail.openembedded.org (Postfix) with ESMTP id 1A3987305E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2017 18:41:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.zonque.de (Postfix) with ESMTP id F3FA6C0029;
	Thu, 23 Feb 2017 19:41:59 +0100 (CET)
Received: from mail.zonque.de ([127.0.0.1])
	by localhost (rambrand.bugwerft.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id NsKumlnjYF6W; Thu, 23 Feb 2017 19:41:59 +0100 (CET)
Received: from localhost.localdomain (pd95c9a6f.dip0.t-ipconnect.de
	[217.92.154.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.zonque.de (Postfix) with ESMTPSA id A9C97C0026;
	Thu, 23 Feb 2017 19:41:59 +0100 (CET)
From: Daniel Mack <daniel@zonque.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Feb 2017 19:41:44 +0100
Message-Id: <20170223184144.12842-1-daniel@zonque.org>
X-Mailer: git-send-email 2.9.3
Subject: [meta-qt5][PATCH] qtbase: remove absolute binary paths from mkspec files
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
X-List-Received-Date: Thu, 23 Feb 2017 18:41:59 -0000

When running 'bitbake -c populate_sdk' on an image that has qt5webkit
enabled, the uikit feature is enabled in qtbase, which then fails to install
with

  error: qtbase-mkspecs-5.8.0+git0+49dc9aa409-r0 conflicts with /usr/bin/perl

The culprit for this is /usr/lib/qt5/mkspecs/features/uikit/devices.pl,
which has #!/usr/bin/perl hardcoded. Fix this in a similar way other recipes
do it as well and strip out these bits at install time.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 recipes-qt/qt5/qtbase_git.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 4e1ab72..803c3f6 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -178,6 +178,10 @@ do_install_append() {
     sed -i -e 's|${STAGING_DIR_NATIVE}${prefix_native}|$$[QT_HOST_PREFIX/get]|g' \
         -e 's|${STAGING_DIR_HOST}|$$[QT_SYSROOT]|g' \
         ${D}/${OE_QMAKE_PATH_QT_ARCHDATA}/mkspecs/*.pri
+
+    # Fix up absolute paths in scripts
+    grep -lr /usr/bin/perl ${D}${OE_QMAKE_PATH_QT_ARCHDATA}/ | \
+        xargs -r sed -i -e '1s,#!.*perl,#! ${USRBINPATH}/env perl,'
 }
 
 # mkspecs have mac specific scripts that depend on perl and bash
-- 
2.9.3


