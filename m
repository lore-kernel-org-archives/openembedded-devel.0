Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E846C61DA4
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 05:39:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.6845.1678340392145438677
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Mar 2023 21:39:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=24324b5b38=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3295bKsL000341
	for <openembedded-devel@lists.openembedded.org>; Wed, 8 Mar 2023 21:39:51 -0800
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3p6ffd1969-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 08 Mar 2023 21:39:51 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Wed, 8 Mar 2023 21:39:50 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Wed, 8 Mar 2023 21:39:50 -0800
From: <mingli.yu@eng.windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] crash: Upgrade to 8.0.2
Date: Thu, 9 Mar 2023 13:39:49 +0800
Message-ID: <20230309053949.608729-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: hQmIRR4RyOWpHxMuQnhfOmjhJZqPtPyJ
X-Proofpoint-ORIG-GUID: hQmIRR4RyOWpHxMuQnhfOmjhJZqPtPyJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-09_02,2023-03-08_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0 mlxlogscore=999
 mlxscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303090044
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Mar 2023 05:39:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101430

From: Mingli Yu <mingli.yu@windriver.com>

Upgrade crash to 8.0.2 and rebase 4 patches to the new version.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../0001-cross_add_configure_option.patch     | 19 +++++------
 .../crash/crash/7003cross_ranlib.patch        | 19 ++++++++---
 ...donnot-extract-gdb-during-do-compile.patch | 32 +++++++++++++------
 ...uild_jobs_and_not_write_crash_target.patch | 26 +++++++++++----
 .../crash/{crash_8.0.0.bb => crash_8.0.2.bb}  |  2 +-
 5 files changed, 65 insertions(+), 33 deletions(-)
 rename meta-oe/recipes-kernel/crash/{crash_8.0.0.bb => crash_8.0.2.bb} (98%)

diff --git a/meta-oe/recipes-kernel/crash/crash/0001-cross_add_configure_option.patch b/meta-oe/recipes-kernel/crash/crash/0001-cross_add_configure_option.patch
index 26a34e5c1..fc5cc3ddf 100644
--- a/meta-oe/recipes-kernel/crash/crash/0001-cross_add_configure_option.patch
+++ b/meta-oe/recipes-kernel/crash/crash/0001-cross_add_configure_option.patch
@@ -1,27 +1,27 @@
-From 73269df4d8196abe81112acaa2613155b308a8b8 Mon Sep 17 00:00:00 2001
+From e3ba432243d9be4e845daabc78a0ae7c03c680f5 Mon Sep 17 00:00:00 2001
 From: Lei Maohui <leimaohui@cn.fujitsu.com>
 Date: Fri, 9 Jan 2015 11:51:18 +0900
-Subject: [PATCH 1/9] cross_add_configure_option
+Subject: [PATCH] cross_add_configure_option
+
 
-%% original patch: 0001-cross_add_configure_option.patch
 ---
  Makefile | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile b/Makefile
-index a2baec1..f1972c8 100644
+index 7266e305..390fc0ef 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -232,7 +232,7 @@ gdb_merge: force
+@@ -260,7 +260,7 @@ gdb_merge: force
  	@echo "../../${PROGRAM} ../../${PROGRAM}lib.a" > ${GDB}/gdb/mergeobj
  	@rm -f ${PROGRAM}
  	@if [ ! -f ${GDB}/config.status ]; then \
 -	  (cd ${GDB}; ./configure ${GDB_CONF_FLAGS} --with-separate-debug-dir=/usr/lib/debug \
 +	  (cd ${GDB}; ./configure --host=${GDB_TARGET} --build=${GDB_HOST} --with-separate-debug-dir=/usr/lib/debug \
  	    --with-bugurl="" --with-expat=no --with-python=no --disable-sim; \
- 	  make --no-print-directory CRASH_TARGET=${TARGET}; echo ${TARGET} > crash.target) \
- 	else make --no-print-directory rebuild; fi
-@@ -283,7 +283,7 @@ force:
+ 	  $(MAKE) CRASH_TARGET=${TARGET}; echo ${TARGET} > crash.target) \
+ 	else $(MAKE) rebuild; fi
+@@ -306,7 +306,7 @@ force:
  
  make_configure: force
  	@rm -f configure
@@ -30,6 +30,3 @@ index a2baec1..f1972c8 100644
  
  clean: make_configure
  	@./configure ${CONF_TARGET_FLAG} -q -b
--- 
-2.8.1
-
diff --git a/meta-oe/recipes-kernel/crash/crash/7003cross_ranlib.patch b/meta-oe/recipes-kernel/crash/crash/7003cross_ranlib.patch
index d567fa0a8..a0d87f1b9 100644
--- a/meta-oe/recipes-kernel/crash/crash/7003cross_ranlib.patch
+++ b/meta-oe/recipes-kernel/crash/crash/7003cross_ranlib.patch
@@ -1,8 +1,19 @@
---- crash-5.1.8/Makefile.orig	2011-12-27 11:21:58.220652105 +0900
-+++ crash-5.1.8/Makefile	2011-12-27 11:22:29.563651593 +0900
-@@ -285,6 +285,7 @@
+From 2f200ceed289f935b5e7ec230454a22dd76e42b0 Mon Sep 17 00:00:00 2001
+From: leimaohui <leimaohui@cn.fujitsu.com>
+Date: Mon, 12 Jan 2015 11:52:35 +0800
+Subject: [PATCH] crash: add new recipe
+
+---
+ Makefile | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Makefile b/Makefile
+index 79aef176..7266e305 100644
+--- a/Makefile
++++ b/Makefile
+@@ -295,6 +295,7 @@ gdb_patch:
  
- library: make_build_data ${OBJECT_FILES}
+ library: ${OBJECT_FILES}
  	ar -rs ${PROGRAM}lib.a ${OBJECT_FILES}
 +	${RANLIB} ${PROGRAM}lib.a 
  
diff --git a/meta-oe/recipes-kernel/crash/crash/donnot-extract-gdb-during-do-compile.patch b/meta-oe/recipes-kernel/crash/crash/donnot-extract-gdb-during-do-compile.patch
index 7133cf0aa..16382877d 100644
--- a/meta-oe/recipes-kernel/crash/crash/donnot-extract-gdb-during-do-compile.patch
+++ b/meta-oe/recipes-kernel/crash/crash/donnot-extract-gdb-during-do-compile.patch
@@ -1,33 +1,45 @@
+From 8b882650b730cb6e025d47d65574f43549b7a1a3 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Thu, 9 Mar 2023 10:28:28 +0800
+Subject: [PATCH] Makefile: Put gdb source tarball in SRC_URI
+
 Put gdb source tarball in SRC_URI and don't fetch and extract it during
 do_compile.
 
 Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
 ---
+ Makefile | 8 +-------
+ 1 file changed, 1 insertion(+), 7 deletions(-)
+
 diff --git a/Makefile b/Makefile
-index bb0a34e..5eb7604 100644
+index 79aef17..146da6a 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -228,7 +228,7 @@ all: make_configure
- #	@make --no-print-directory extensions
+@@ -254,7 +254,7 @@ all: make_configure
+ #	@$(MAKE) extensions
  
  gdb_merge: force
 -	@if [ ! -f ${GDB}/README ]; then \
 +	@if [ ! -f ${GDB}/${GDB}.patch ]; then \
- 	  make --no-print-directory gdb_unzip; fi
+ 	  $(MAKE) gdb_unzip; fi
  	@echo "${LDFLAGS} -lz -ldl -rdynamic" > ${GDB}/gdb/mergelibs
  	@echo "../../${PROGRAM} ../../${PROGRAM}lib.a" > ${GDB}/gdb/mergeobj
-@@ -255,12 +255,6 @@ gdb_unzip:
-	@rm -f gdb.files
-	@for FILE in ${GDB_FILES} dummy; do\
-	  echo $$FILE >> gdb.files; done
+@@ -281,12 +281,6 @@ gdb_unzip:
+ 	@rm -f gdb.files
+ 	@for FILE in ${GDB_FILES} dummy; do\
+ 	  echo $$FILE >> gdb.files; done
 -	@if [ ! -f ${GDB}.tar.gz ] && [ ! -f /usr/bin/wget ]; then \
 -	  echo /usr/bin/wget is required to download ${GDB}.tar.gz; echo; exit 1; fi
 -	@if [ ! -f ${GDB}.tar.gz ] && [ -f /usr/bin/wget ]; then \
 -	  [ ! -t 2 ] && WGET_OPTS="--progress=dot:mega"; \
 -	  wget $$WGET_OPTS http://ftp.gnu.org/gnu/gdb/${GDB}.tar.gz; fi
 -	@tar --exclude-from gdb.files -xzmf ${GDB}.tar.gz
-	@make --no-print-directory gdb_patch
-
+ 	@$(MAKE) gdb_patch
+ 
  gdb_patch:
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-kernel/crash/crash/gdb_build_jobs_and_not_write_crash_target.patch b/meta-oe/recipes-kernel/crash/crash/gdb_build_jobs_and_not_write_crash_target.patch
index aa5f44dd4..257b4dd2b 100644
--- a/meta-oe/recipes-kernel/crash/crash/gdb_build_jobs_and_not_write_crash_target.patch
+++ b/meta-oe/recipes-kernel/crash/crash/gdb_build_jobs_and_not_write_crash_target.patch
@@ -1,3 +1,8 @@
+From af49d8df559aa18f97d14ab7971f211238a16041 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Thu, 9 Mar 2023 10:50:10 +0800
+Subject: [PATCH] Makefile: Don't write ${TARGET} to crash.target
+
 This enables parallel building (multiple jobs in gdb) by reading the
 value from GDB_MAKE_JOBS.
 
@@ -8,19 +13,26 @@ Upstream-Status: Pending
 Don't write ${TARGET} to crash.target which causes rebuild fails.
 
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
 diff --git a/Makefile b/Makefile
-index 27a1d47..bcf2d2f 100644
+index cd25c7d..d61c4c5 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -232,8 +232,8 @@ gdb_merge: force
+@@ -262,8 +262,8 @@ gdb_merge: force
  	@if [ ! -f ${GDB}/config.status ]; then \
  	  (cd ${GDB}; ./configure --host=${GDB_TARGET} --build=${GDB_HOST} --with-separate-debug-dir=/usr/lib/debug \
  	    --with-bugurl="" --with-expat=no --with-python=no --disable-sim; \
--	  make --no-print-directory CRASH_TARGET=${TARGET}; echo ${TARGET} > crash.target) \
--	else make --no-print-directory rebuild; fi
-+	  make --no-print-directory CRASH_TARGET=${TARGET} ${GDB_MAKE_JOBS}; ) \
-+	else make --no-print-directory ${GDB_MAKE_JOBS} rebuild; fi
+-	  $(MAKE) CRASH_TARGET=${TARGET}; echo ${TARGET} > crash.target) \
+-	else $(MAKE) rebuild; fi
++	  $(MAKE) CRASH_TARGET=${TARGET} ${GDB_MAKE_JOBS}; ) \
++	else $(MAKE) ${GDB_MAKE_JOBS} rebuild; fi
  	@if [ ! -f ${PROGRAM} ]; then \
  	  echo; echo "${PROGRAM} build failed"; \
  	  echo; exit 1; fi
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-kernel/crash/crash_8.0.0.bb b/meta-oe/recipes-kernel/crash/crash_8.0.2.bb
similarity index 98%
rename from meta-oe/recipes-kernel/crash/crash_8.0.0.bb
rename to meta-oe/recipes-kernel/crash/crash_8.0.2.bb
index 55de6a604..f58bb6ef5 100644
--- a/meta-oe/recipes-kernel/crash/crash_8.0.0.bb
+++ b/meta-oe/recipes-kernel/crash/crash_8.0.2.bb
@@ -21,7 +21,7 @@ SRC_URI = "git://github.com/crash-utility/${BPN}.git;branch=master;protocol=http
            file://donnot-extract-gdb-during-do-compile.patch \
            file://gdb_build_jobs_and_not_write_crash_target.patch \
            "
-SRCREV = "ec568e2ea515b66343d3488d5d4b9a625d55b7ae"
+SRCREV = "f1cd581d1c4afa5b8ffdfaa6a3ea9f545fe4ec91"
 
 SRC_URI[gdb.sha256sum] = "b33ad58d687487a821ec8d878daab0f716be60d0936f2e3ac5cf08419ce70350"
 
-- 
2.25.1


