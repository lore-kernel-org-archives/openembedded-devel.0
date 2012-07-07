Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SnQrL-0007Qp-M6
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 Jul 2012 10:59:23 +0200
Received: by weyr6 with SMTP id r6so3448577wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Jul 2012 01:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=YTd72RYTK84e1Phu4aIon59uAiSTeJngREXs/hMuVRc=;
	b=WY7Pudsu8xBP8neHIPFWj7UKTwYeP0AD3K3oPWpN0j8Iu0fIRTztxjnyI9I8cGU4DT
	zIXju0vcV9zrovl0tKUS2evY9b7217x75OYzT7eMbyajO7njhkjfy/ZubCXLw4I0WoLh
	tIuHarfZP3r+rPi31ZViSNHzQB03M+4rPKRs8FLIARtNvn1NjIwpCXGl0luBRyfk+XDO
	Nd25f/YBTwyS2X+kXBvgyDmOrCPTq2b8xX0OjfkoJBXV/StVNA1BAdpAdD4F1EdaqPf9
	3PXeW+mPbzaOMYMLDdxyuaWxYwXXk0wKRCgaPnxYXpOahbEHAt4385C5RXBDVdOJePO7
	wfvQ==
Received: by 10.180.14.193 with SMTP id r1mr13812434wic.19.1341650897086;
	Sat, 07 Jul 2012 01:48:17 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id cl8sm10348443wib.10.2012.07.07.01.48.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 07 Jul 2012 01:48:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  7 Jul 2012 10:48:07 +0200
Message-Id: <1341650887-11604-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [meta-efl][PATCH] ecore: backport patch from trunk to fix build with eglibc-2.16
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 07 Jul 2012 08:59:23 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...01-ecore_exe-fix-compilation-on-fedora-18.patch |   45 ++++++++++++++++++++
 meta-efl/recipes-efl/efl/ecore_1.2.1.bb            |    3 +-
 2 files changed, 47 insertions(+), 1 deletions(-)
 create mode 100644 meta-efl/recipes-efl/efl/ecore/0001-ecore_exe-fix-compilation-on-fedora-18.patch

diff --git a/meta-efl/recipes-efl/efl/ecore/0001-ecore_exe-fix-compilation-on-fedora-18.patch b/meta-efl/recipes-efl/efl/ecore/0001-ecore_exe-fix-compilation-on-fedora-18.patch
new file mode 100644
index 0000000..613cf5e
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/ecore/0001-ecore_exe-fix-compilation-on-fedora-18.patch
@@ -0,0 +1,45 @@
+From 2ad957d5da1fc91faf7c2c6562139d19f29f5b9c Mon Sep 17 00:00:00 2001
+From: caro <caro@7cbeb6ba-43b4-40fd-8cce-4c39aea84d33>
+Date: Fri, 22 Jun 2012 05:36:00 +0000
+Subject: [PATCH] ecore_exe: fix compilation on fedora 18.
+
+setpriority needs sys/resource.h. See:
+
+http://linux.die.net/man/2/setpriority
+
+I let sys/time.h, it does not hurt on linux and is anyway needed for BSD systems.
+
+
+git-svn-id: svn+ssh://svn.enlightenment.org/var/svn/e/trunk@72684 7cbeb6ba-43b4-40fd-8cce-4c39aea84d33
+---
+ src/lib/ecore/ecore_exe.c |    7 ++-----
+ 2 files changed, 6 insertions(+), 5 deletions(-)
+
+diff --git a/src/lib/ecore/ecore_exe.c b/src/lib/ecore/ecore_exe.c
+index 7931a96..6db32a9 100644
+--- a/src/lib/ecore/ecore_exe.c
++++ b/src/lib/ecore/ecore_exe.c
+@@ -2,11 +2,6 @@
+ # include <config.h>
+ #endif
+ 
+-#if defined (__FreeBSD__) || defined (__OpenBSD__) || defined (__NetBSD__)
+-# include <sys/time.h>
+-# include <sys/resource.h>
+-#endif
+-
+ #include <stdlib.h>
+ #include <stdio.h>
+ #include <string.h>
+@@ -14,6 +9,8 @@
+ #include <sys/types.h>
+ #include <unistd.h>
+ #include <fcntl.h>
++#include <sys/time.h>
++#include <sys/resource.h>
+ 
+ #ifdef HAVE_SYS_PRCTL_H
+ # include <sys/prctl.h>
+-- 
+1.7.8.6
+
diff --git a/meta-efl/recipes-efl/efl/ecore_1.2.1.bb b/meta-efl/recipes-efl/efl/ecore_1.2.1.bb
index 067042d..bec47a7 100644
--- a/meta-efl/recipes-efl/efl/ecore_1.2.1.bb
+++ b/meta-efl/recipes-efl/efl/ecore_1.2.1.bb
@@ -1,10 +1,11 @@
 require ${BPN}.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 SRC_URI = "\
   ${E_MIRROR}/${SRCNAME}-${PV}.tar.gz \
   file://fix-ecore-fb-initialization.patch \
+  file://0001-ecore_exe-fix-compilation-on-fedora-18.patch \
 "
 
 SRC_URI[md5sum] = "557f8411d323b14ed7bf1be368ab302a"
-- 
1.7.8.6



