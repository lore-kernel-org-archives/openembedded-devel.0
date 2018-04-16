Return-Path: <christian.thaler@tes-dst.com>
X-Greylist: delayed 511 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 16 Apr 2018 13:52:26 UTC
Received: from mail.tes-dst.com (mail.tes-dst.com [212.6.170.45])
	by mail.openembedded.org (Postfix) with ESMTP id 71DDC72EEE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Apr 2018 13:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.tes-dst.com (Postfix) with ESMTP id 5922B5217BE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Apr 2018 15:43:55 +0200 (CEST)
Received: from mail.tes-dst.com ([127.0.0.1])
	by localhost (mail.tes-dst.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id Q2PTAVpUuwmR; Mon, 16 Apr 2018 15:43:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by mail.tes-dst.com (Postfix) with ESMTP id 5354D5217DE;
	Mon, 16 Apr 2018 15:43:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mail.tes-dst.com
Received: from mail.tes-dst.com ([127.0.0.1])
	by localhost (mail.tes-dst.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id dlYA9tFAL8Uf; Mon, 16 Apr 2018 15:43:54 +0200 (CEST)
Received: from tesvm.hamburg.tes (unknown [172.20.10.164])
	by mail.tes-dst.com (Postfix) with ESMTPSA id 350725217BE;
	Mon, 16 Apr 2018 15:43:54 +0200 (CEST)
From: c-thaler <christian.thaler@tes-dst.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Apr 2018 15:43:52 +0200
Message-Id: <1523886232-12585-1-git-send-email-christian.thaler@tes-dst.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-qt5][PATCH] nativesdk-qtbase: fix environment.d dir permission
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
X-List-Received-Date: Mon, 16 Apr 2018 13:52:26 -0000

Fixed an issue with the nativesdk-cmake package, which sets the permission of
/opt/.../environment.d to rwxr-xr-x.
nativesdk-qtbase set the permission to rwxrwxr-x, leading to a conflict:

Error: Transaction check error:
  file /opt/poky/2.4.2/sysroots/x86_64-pokysdk-linux/environment-setup.d
  conflicts between attempted installs of
  nativesdk-cmake-3.8.2-r0.x86_64_nativesdk and
  nativesdk-qtbase-tools-5.9.4+git0+0d9208cecb-r0.x86_64_nativesdk

Recipe nativesdk-qtbase will now set the permission to rwxr-xr-x.
---
 recipes-qt/qt5/nativesdk-qtbase_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
index 5b20b0a..a678b19 100644
--- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
+++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
@@ -171,7 +171,7 @@ do_install() {
 }
 
 fakeroot do_generate_qt_environment_file() {
-    mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d/
+    install -d -m 755 ${D}${SDKPATHNATIVE}/environment-setup.d/
     script=${D}${SDKPATHNATIVE}/environment-setup.d/qt5.sh
 
     echo 'export PATH=${OE_QMAKE_PATH_HOST_BINS}:$PATH' > $script
-- 
2.7.4


