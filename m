Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 0D5A173288
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Mar 2017 16:09:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CBF4120BAF;
	Wed, 15 Mar 2017 16:09:02 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Y4e2N4wwmquh; Wed, 15 Mar 2017 16:09:02 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AA0B220BAC;
	Wed, 15 Mar 2017 16:09:01 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 2D9501623C7;
	Wed, 15 Mar 2017 12:09:01 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Mar 2017 12:09:00 -0400
Message-Id: <1489594140-27466-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [meta-qt5][PATCH] nativesdk-qtbase: pass -no-icu for deterministic builds
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
X-List-Received-Date: Wed, 15 Mar 2017 16:09:02 -0000

From: Denys Dmytriyenko <denys@ti.com>

Similar to qtbase-native. Otherwise it may fail with this error,
if icu is not yet staged:

| .../git/src/corelib/codecs/qicucodec.cpp:53:26: fatal error: unicode/ucnv.h: No such file or directory
|   #include "unicode/ucnv.h"
|                            ^
|  compilation terminated.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-qt/qt5/nativesdk-qtbase_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
index 94ad6b9..f2ff5f7 100644
--- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
+++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
@@ -115,6 +115,7 @@ do_configure() {
         -no-opengl \
         -no-openssl \
         -no-xcb \
+        -no-icu \
         -verbose \
         -release \
         -prefix ${OE_QMAKE_PATH_PREFIX} \
-- 
2.7.4


