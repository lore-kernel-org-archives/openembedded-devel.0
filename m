Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 21EC1605FE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Feb 2016 21:56:30 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id a4so48126415wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Feb 2016 13:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=72YV/mdc1eEn0duf7oYNn1pWDhtbhTNLuTLKGkTokpY=;
	b=gWjfWjPHPRpkvGvQDSTlsswifEQDdQZ+EoZ2h4hn2OAFzBW2IA35iq2V7+djtVf1zK
	IZvlbdvNbdAAuB/2NnbYmfZ7b4T5M1QZd0DvEZD5W4Sf++Hc0+C9rBR/uoC/UqT+qyWh
	Q2LqTkNjoA+WjVL4SQfqVaBPQ6Q22AOkY1UYMP/O4c9y3v8J6djwIIwA+YHJLVe2ZArE
	JxNRP4ht54Er7M79QAUvDgxSAJ8l3TKDxkh45PGYKOvoGHjd5AMzlpIb0nFC2QVZ9SWv
	zCiOHDflmJY0mP7+VMsVXHCr/AUHkqqbRVW65zSOeG3u/qSBKKf39n5lFUz8xKIg91Zq
	LIgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=72YV/mdc1eEn0duf7oYNn1pWDhtbhTNLuTLKGkTokpY=;
	b=H9SpntDi/laWEl/NYBaNckDihjk0A6RoABGiiDa0exI4eK5khVttEm/LBJq3j3LWfS
	DXp3YZYv4g7Dw2/M+hNh9zMCnsTTN0ovZVjYL3SHJ/1B401QqOv8iYEOMNsj8BGoRsqO
	+NvQ6HJlNizzJ9poMWvcv6191w4utTQOatvDq4x0vYjNFwIeqCIXAnqZTo4FcW7mzfJx
	CRS56+DFnBGdu9iQFQ+sE9CQujBhNm5DvCvJ+q08MTfNWb6E1iTOZ/3z/DOL12VEOkgi
	y0DALebyAqH+5SfYptBdhk3wq2ih8XNPWv2HaIoBqtHlMhAO/nlW8Uwk9mK0sPPSUCLa
	pU+w==
X-Gm-Message-State: AG10YOTLKMEiTi++NT5+SfccQaj4ZmGrq7Ky7owvMiPK1e+iDn+/Jw4FHOIw7IdFuvpUeA==
X-Received: by 10.194.77.167 with SMTP id t7mr4036155wjw.90.1455746190587;
	Wed, 17 Feb 2016 13:56:30 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	t12sm27369712wmt.20.2016.02.17.13.56.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Feb 2016 13:56:29 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Feb 2016 22:56:41 +0100
Message-Id: <1455746205-31727-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.1
Subject: [PATCH][meta-qt5 1/5] qmake5_base: delete *.la files
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
X-List-Received-Date: Wed, 17 Feb 2016 21:56:31 -0000

* they reference workdir and trip sanity check:
  ERROR: QA Issue: libQt5Sql.la failed sanity test (workdir) in path qtbase/5.5.99+5.6.0-alpha1+gitAUTOINC+f7f4dde80e-r0/sysroot-destdir//usr/lib [la]
* I'm intentionally not using remove-libtool.bbclass recently
  added to oe-core, because many people combine newer meta-qt5
  with older oe-core and can be missing this bbclass, I've
  pending patch to migrate this to remove-libtool.bbclass, will
  probably merge it after 2.1 or 2.2 release.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 classes/qmake5_base.bbclass            | 7 +++++--
 recipes-qt/qt5/nativesdk-qtbase_git.bb | 2 +-
 recipes-qt/qt5/qtbase-native_git.bb    | 2 +-
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/classes/qmake5_base.bbclass b/classes/qmake5_base.bbclass
index a766cc6..5b2633b 100644
--- a/classes/qmake5_base.bbclass
+++ b/classes/qmake5_base.bbclass
@@ -160,20 +160,23 @@ qmake5_base_do_configure () {
 
 qmake5_base_native_do_install() {
     oe_runmake install INSTALL_ROOT=${D}
+    find "${D}" -ignore_readdir_race -name "*.la" -delete
 }
 
 qmake5_base_nativesdk_do_install() {
     # Fix install paths for all
-    find -name "Makefile*" | xargs -r sed -i "s,(INSTALL_ROOT)${STAGING_DIR_HOST},(INSTALL_ROOT),g"
+    find . -name "Makefile*" | xargs -r sed -i "s,(INSTALL_ROOT)${STAGING_DIR_HOST},(INSTALL_ROOT),g"
 
     oe_runmake install INSTALL_ROOT=${D}
+    find "${D}" -ignore_readdir_race -name "*.la" -delete
 }
 
 qmake5_base_do_install() {
     # Fix install paths for all
-    find -name "Makefile*" | xargs -r sed -i "s,(INSTALL_ROOT)${STAGING_DIR_TARGET},(INSTALL_ROOT),g"
+    find . -name "Makefile*" | xargs -r sed -i "s,(INSTALL_ROOT)${STAGING_DIR_TARGET},(INSTALL_ROOT),g"
 
     oe_runmake install INSTALL_ROOT=${D}
+    find "${D}" -ignore_readdir_race -name "*.la" -delete
 
     # everything except HostData and HostBinaries is prefixed with sysroot value,
     # but we cannot remove sysroot override, because that's useful for pkg-config etc
diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
index 4ac80be..ccb0922 100644
--- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
+++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
@@ -204,7 +204,7 @@ do_configure() {
 
 do_install() {
     # Fix install paths for all
-    find -name "Makefile*" | xargs sed -i "s,(INSTALL_ROOT)${STAGING_DIR_NATIVE}${STAGING_DIR_NATIVE},(INSTALL_ROOT)${STAGING_DIR_NATIVE},g"
+    find . -name "Makefile*" | xargs sed -i "s,(INSTALL_ROOT)${STAGING_DIR_NATIVE}${STAGING_DIR_NATIVE},(INSTALL_ROOT)${STAGING_DIR_NATIVE},g"
 
     oe_runmake install INSTALL_ROOT=${D}
 
diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
index 14e8516..0683708 100644
--- a/recipes-qt/qt5/qtbase-native_git.bb
+++ b/recipes-qt/qt5/qtbase-native_git.bb
@@ -96,7 +96,7 @@ do_configure_prepend() {
 
 do_install() {
     # Fix install paths for all
-    find -name "Makefile*" | xargs sed -i "s,(INSTALL_ROOT)${STAGING_DIR_NATIVE}${STAGING_DIR_NATIVE},(INSTALL_ROOT)${STAGING_DIR_NATIVE},g"
+    find . -name "Makefile*" | xargs sed -i "s,(INSTALL_ROOT)${STAGING_DIR_NATIVE}${STAGING_DIR_NATIVE},(INSTALL_ROOT)${STAGING_DIR_NATIVE},g"
 
     oe_runmake install INSTALL_ROOT=${D}
 
-- 
2.7.1


