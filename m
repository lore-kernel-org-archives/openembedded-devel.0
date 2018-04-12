Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 78D0B71B2F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Apr 2018 07:54:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w3C7sMsh008444
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Apr 2018 00:54:23 -0700 (PDT)
Received: from localhost (128.224.163.220) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Thu, 12 Apr 2018 00:54:22 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 12 Apr 2018 15:54:20 +0800
Message-ID: <1523519660-30226-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.163.220]
Subject: [meta-filesystems][PATCH] aufs-util: refresh patches
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
X-List-Received-Date: Thu, 12 Apr 2018 07:54:24 -0000
Content-Type: text/plain

Refresh patches to fix do_patch warning.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../aufs-util/0001-libau-Define-STRIP-weakly.patch      | 10 ++++------
 ...til-add-tool-concept-to-Makefile-for-cross-com.patch | 17 +++++++++--------
 .../aufs-util/aufs-util-don-t-strip-executables.patch   | 14 +++++++-------
 3 files changed, 20 insertions(+), 21 deletions(-)

diff --git a/meta-filesystems/recipes-utils/aufs-util/aufs-util/0001-libau-Define-STRIP-weakly.patch b/meta-filesystems/recipes-utils/aufs-util/aufs-util/0001-libau-Define-STRIP-weakly.patch
index 9efea80..6732dc4 100644
--- a/meta-filesystems/recipes-utils/aufs-util/aufs-util/0001-libau-Define-STRIP-weakly.patch
+++ b/meta-filesystems/recipes-utils/aufs-util/aufs-util/0001-libau-Define-STRIP-weakly.patch
@@ -1,4 +1,4 @@
-From bb8801fb21ac8d73e3b1a11a8555aaf822182a51 Mon Sep 17 00:00:00 2001
+From daf04dc9ca1f2e4c65ec338ab439e0a792e1a8ac Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 5 Sep 2017 10:36:52 -0700
 Subject: [PATCH] libau: Define STRIP weakly
@@ -6,10 +6,11 @@ Subject: [PATCH] libau: Define STRIP weakly
 STRIP can be set on environment to use cross version of strip utility
 hardcoding to strip is not working in cross environment
 
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
 Upstream-Status: Submitted
 
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+---
  libau/Makefile | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
 
@@ -34,6 +35,3 @@ index 81520ac..c25eef2 100644
  #	readelf --syms --use-dynamic libau.so
  
  install_ulib: File = ${LibSo}.${LibSoMajor}.${LibSoMinor}
--- 
-2.14.1
-
diff --git a/meta-filesystems/recipes-utils/aufs-util/aufs-util/aufs-util-add-tool-concept-to-Makefile-for-cross-com.patch b/meta-filesystems/recipes-utils/aufs-util/aufs-util/aufs-util-add-tool-concept-to-Makefile-for-cross-com.patch
index 5c35586..c832696 100644
--- a/meta-filesystems/recipes-utils/aufs-util/aufs-util/aufs-util-add-tool-concept-to-Makefile-for-cross-com.patch
+++ b/meta-filesystems/recipes-utils/aufs-util/aufs-util/aufs-util-add-tool-concept-to-Makefile-for-cross-com.patch
@@ -1,3 +1,6 @@
+From 13a60c631d7cf6c7e1926473d8069795c0def9b6 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Thu, 19 Jun 2014 15:09:56 +0100
 Subject: [PATCH] aufs-util: add tool concept to Makefile for cross compiling
  purpose
 
@@ -7,23 +10,21 @@ Add a tools target to Makefile to allow for this.
 Upstream-Status: Pending
 
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+
 ---
- Makefile |    2 +-
+ Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile b/Makefile
-index 2f905ad..49c3cd5 100644
+index dbbe43d..aff969e 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -85,7 +85,7 @@ aufs.5: aufs.in.5 c2tmac
+@@ -152,7 +152,7 @@ aufs.5: aufs.in.5 c2tmac
  	chmod a-w $@
  
  c2sh c2tmac ver: CC = ${HOSTCC}
 -.INTERMEDIATE: c2sh c2tmac ver
 +tools: c2sh c2tmac ver
  
- Install = install -o root -g root -p
- install_sbin: File = auibusy auplink mount.aufs umount.aufs
--- 
-1.7.9.5
-
+ install_sbin: File = auibusy aumvdown auplink mount.aufs umount.aufs
+ ifeq (${Glibc},no)
diff --git a/meta-filesystems/recipes-utils/aufs-util/aufs-util/aufs-util-don-t-strip-executables.patch b/meta-filesystems/recipes-utils/aufs-util/aufs-util/aufs-util-don-t-strip-executables.patch
index fe2a6a5..b40822c 100644
--- a/meta-filesystems/recipes-utils/aufs-util/aufs-util/aufs-util-don-t-strip-executables.patch
+++ b/meta-filesystems/recipes-utils/aufs-util/aufs-util/aufs-util-don-t-strip-executables.patch
@@ -1,4 +1,4 @@
-From 244863eca77fcaa1187884836c3e28d6b6d1504a Mon Sep 17 00:00:00 2001
+From 9d5e7eff4ae906f1ea6e6527080fded0b595fbd4 Mon Sep 17 00:00:00 2001
 From: Bruce Ashfield <bruce.ashfield@windriver.com>
 Date: Tue, 9 Apr 2013 18:50:34 -0700
 Subject: [PATCH] aufs-util: don't strip executables
@@ -14,16 +14,19 @@ as follows:
 
 To prevent this, we remove -s from LDFLAGS.
 
+Upstream-Status: Inappropriate [oe specific]
+
 Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
+
 ---
- Makefile |    2 +-
+ Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile b/Makefile
-index 2f905ad..e0c6dcd 100644
+index 54f8d97..dbbe43d 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -56,7 +56,7 @@ all: ver_test ${Man} ${Bin} ${Etc}
+@@ -118,7 +118,7 @@ clean:
  ver_test: ver
  	./ver
  
@@ -32,6 +35,3 @@ index 2f905ad..e0c6dcd 100644
  ${Bin}: LDLIBS = -L. -lautil
  ${BinObj}: %.o: %.c ${LibUtilHdr} ${LibUtil}
  
--- 
-1.7.10.4
-
-- 
2.7.4


