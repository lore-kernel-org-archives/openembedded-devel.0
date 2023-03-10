Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F7D7C64EC4
	for <webhook@archiver.kernel.org>; Fri, 10 Mar 2023 01:15:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.8578.1678410902005557747
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Mar 2023 17:15:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Ggvx0Y2t;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=24331f10aa=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32A0TsSu025951
	for <openembedded-devel@lists.openembedded.org>; Thu, 9 Mar 2023 17:15:01 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=XpLNLnletZI7l7UQfEm/mPuW+4clqt14aMM9zr7UtU0=;
 b=Ggvx0Y2tT6j9okH5SjFWrRpF0XZIyhnpTJIQ1N/ilZO/HZOG5mV/nBoc6xMkr8mW1ZBT
 ekkLL+/LRrxMf9Nyw4IUYq1kQgDt2T5POt3wp12axrTSeUCmzMlCyb837y4j6liF+YaG
 c32wkBmYsgTyDf7ZzlqnHLkASFqgVPTeOIT/dQ3oTQzmm74zmXAD2D7YMxLe7KtA2jwa
 TTyUX/G4djP/GVrCzmhs+UTXB+wLYkgKuH8LTvuD2Rvp0RkPynahrm9jMwieiUm9M0Ss
 4F64z+ZuK1lZUw0W3D0n+s7ldkL/mWza0fzVBC00vgvLmuZa3JMVYEUhPgH1NZ2ieIaT Dw== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3p6ffd2awv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 09 Mar 2023 17:15:01 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.18; Thu, 9 Mar 2023 17:15:00 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Thu, 9 Mar 2023 17:15:00 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH V2] liblockfile: upgrade 1.14 -> 1.17
Date: Fri, 10 Mar 2023 09:14:59 +0800
Message-ID: <20230310011459.2779071-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: pIj9tuycVtL4uuWKAqZlqnBDNcvMHBy2
X-Proofpoint-ORIG-GUID: pIj9tuycVtL4uuWKAqZlqnBDNcvMHBy2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-09_14,2023-03-09_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0 mlxlogscore=999
 mlxscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303100005
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Mar 2023 01:15:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101470

From: Changqing Li <changqing.li@windriver.com>

Updated patches:
configure.patch
0001-Makefile.in-redefine-LOCKPROG.patch

Rename and update patch:
0001-Makefile.in-Don-t-try-to-run-ldconfig.patch

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../0001-Makefile.in-add-DESTDIR.patch        |  6 +--
 ...nstall-failure-on-host-without-ldco.patch} | 44 ++++++++++++-------
 ...001-Makefile.in-install-nfslock-libs.patch | 10 ++---
 .../0001-Makefile.in-redefine-LOCKPROG.patch  | 34 ++++++++++----
 .../liblockfile/liblockfile/configure.patch   | 22 +++++++---
 ...iblockfile-fix-install-so-to-man-dir.patch |  8 ++--
 ...iblockfile_1.14.bb => liblockfile_1.17.bb} | 15 +++----
 7 files changed, 88 insertions(+), 51 deletions(-)
 rename meta-oe/recipes-extended/liblockfile/liblockfile/{0001-Makefile.in-Don-t-try-to-run-ldconfig.patch => 0001-Makefile.in-fix-install-failure-on-host-without-ldco.patch} (60%)
 rename meta-oe/recipes-extended/liblockfile/{liblockfile_1.14.bb => liblockfile_1.17.bb} (68%)

diff --git a/meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.in-add-DESTDIR.patch b/meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.in-add-DESTDIR.patch
index ea415dd8b..2533b3a00 100644
--- a/meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.in-add-DESTDIR.patch
+++ b/meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.in-add-DESTDIR.patch
@@ -1,4 +1,4 @@
-From 67843dabe1177840697839b916fd899218893ec7 Mon Sep 17 00:00:00 2001
+From 8e370a2f35d0c3472ddc9068fab19d0077434c61 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Thu, 19 Jul 2018 00:25:23 -0700
 Subject: [PATCH] Makefile.in: add DESTDIR
@@ -29,7 +29,7 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  1 file changed, 5 insertions(+), 5 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index 36a6d23..1e4130e 100644
+index 9c74b35..8cbda1d 100644
 --- a/Makefile.in
 +++ b/Makefile.in
 @@ -12,11 +12,11 @@ CC		= @CC@
@@ -50,5 +50,5 @@ index 36a6d23..1e4130e 100644
  MAILGROUP	= @MAILGROUP@
  
 -- 
-2.17.1
+2.25.1
 
diff --git a/meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.in-Don-t-try-to-run-ldconfig.patch b/meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.in-fix-install-failure-on-host-without-ldco.patch
similarity index 60%
rename from meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.in-Don-t-try-to-run-ldconfig.patch
rename to meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.in-fix-install-failure-on-host-without-ldco.patch
index 5a1d9a995..1fd5c827b 100644
--- a/meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.in-Don-t-try-to-run-ldconfig.patch
+++ b/meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.in-fix-install-failure-on-host-without-ldco.patch
@@ -1,10 +1,12 @@
-From 5876bd17caac96df70ef400bfeebb155c0bd7359 Mon Sep 17 00:00:00 2001
+From 8b3a5916fff4004b5b2f1e8a1d3a051346ba3901 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
-Date: Wed, 8 Feb 2023 10:34:45 +0800
-Subject: [PATCH] Makefile.in: Don't try to run ldconfig
+Date: Fri, 10 Mar 2023 08:59:39 +0800
+Subject: [PATCH] Makefile.in: fix install failure on host without ldconfig
 
-when ldconfig is not installed on the build host, do_install
-will failed with error:
+fix syntax error when ldconfig is not installed on host
+
+when ldconfig is not installed on the build host, install will failed with
+error:
 ln -sf nfslock.so.0.1 /mnt/tmp-glibc/work/core2-64-wrs-linux/liblockfile/1.14-r0/image/usr/lib64/nfslock.so.0
 install -m 644 lockfile.h maillock.h /mnt/tmp-glibc/work/core2-64-wrs-linux/liblockfile/1.14-r0/image/usr/include
 if test "/mnt/tmp-glibc/work/core2-64-wrs-linux/liblockfile/1.14-r0/image" = ""; then ; fi
@@ -16,36 +18,46 @@ if [ "mail" != "" ]; then\
 /bin/sh: -c: line 1: syntax error near unexpected token `;'
 /bin/sh: -c: line 1: `if test "/mnt/tmp-glibc/work/core2-64-wrs-linux/liblockfile/1.14-r0/image" = ""; then ; fi'
 
-Deleted line is not needed for OE, as it is cross-compile. And
-it can also fix above error
-
-Upstream-Status: Inappropriate [oe specific]
+Upstream-Status: Submitted [https://github.com/miquels/liblockfile/pull/20]
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
- Makefile.in | 2 --
- 1 file changed, 2 deletions(-)
+ Makefile.in | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index bfa0acb..ae5be56 100644
+index e02d75e..5fc5b5a 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -58,7 +58,6 @@ install_shared:	shared install_static install_common
+@@ -9,6 +9,10 @@ NFSVER		= 0.1
+ CFLAGS		= @CFLAGS@ -I.
+ LDFLAGS		= @LDFLAGS@
+ CC		= @CC@
++LDCONFIG       = @LDCONFIG@
++ifeq ($(LDCONFIG),)
++    LDCONFIG = ":"
++endif
+ 
+ prefix		= $(DESTDIR)@prefix@
+ exec_prefix	= @exec_prefix@
+@@ -69,7 +73,7 @@ install_shared:	shared install_static install_common
  			$(libdir)/liblockfile.so.$(SOVER)
  		ln -s liblockfile.so.$(SOVER) $(libdir)/liblockfile.so.$(MAJOR)
  		ln -s liblockfile.so.$(SOVER) $(libdir)/liblockfile.so
 -		if test "$(DESTDIR)" = ""; then @LDCONFIG@; fi
++		if test "$(DESTDIR)" = ""; then $(LDCONFIG); fi
  
  install_common:
  		install -d -m 755 -g root -p $(includedir)
-@@ -79,7 +78,6 @@ install_nfslib:	nfslib
+@@ -90,7 +94,7 @@ install_nfslib:	nfslib
  		install -m 755 nfslock.so.$(NFSVER) $(nfslockdir)
  		ln -sf nfslock.so.$(NFSVER) $(libdir)/nfslock.so
  		ln -sf nfslock.so.$(NFSVER) $(libdir)/nfslock.so.0
 -		if test "$(DESTDIR)" = ""; then @LDCONFIG@; fi
++		if test "$(DESTDIR)" = ""; then $(LDCONFIG); fi
  
- clean:
- 		rm -f *.a *.o *.so *.so.* dotlockfile
+ test:		test-stamp
+ 		@:
 -- 
 2.25.1
 
diff --git a/meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.in-install-nfslock-libs.patch b/meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.in-install-nfslock-libs.patch
index a6b297b59..f99ac2bf7 100644
--- a/meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.in-install-nfslock-libs.patch
+++ b/meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.in-install-nfslock-libs.patch
@@ -1,4 +1,4 @@
-From 631d46efff2a6d8970e202ba5422ebedd17a8d2f Mon Sep 17 00:00:00 2001
+From 0f34d1d91d641c3d5c5bb2eb11bd6eec7cfaf738 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Thu, 19 Jul 2018 01:00:10 -0700
 Subject: [PATCH] Makefile.in: install nfslock.so and nfslock.so.0
@@ -14,10 +14,10 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/Makefile.in b/Makefile.in
-index 1e4130e..0f1b506 100644
+index 8cbda1d..3a74811 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -77,6 +77,8 @@ install_common:
+@@ -88,6 +88,8 @@ install_common:
  install_nfslib:	nfslib
  		install -d -m 755 -g root -p $(nfslockdir)
  		install -m 755 nfslock.so.$(NFSVER) $(nfslockdir)
@@ -25,7 +25,7 @@ index 1e4130e..0f1b506 100644
 +		ln -sf nfslock.so.$(NFSVER) $(libdir)/nfslock.so.0
  		if test "$(DESTDIR)" = ""; then @LDCONFIG@; fi
  
- clean:
+ test:		test-stamp
 -- 
-2.17.1
+2.25.1
 
diff --git a/meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.in-redefine-LOCKPROG.patch b/meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.in-redefine-LOCKPROG.patch
index 35549ff2d..c387db123 100644
--- a/meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.in-redefine-LOCKPROG.patch
+++ b/meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.in-redefine-LOCKPROG.patch
@@ -1,4 +1,4 @@
-From 9beb650712d448ad9c0899de9d98e9b623f9c249 Mon Sep 17 00:00:00 2001
+From 05227e74b732f13ed5a2a98232676f98bba028e6 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Fri, 12 Aug 2022 11:18:15 +0800
 Subject: [PATCH] Makefile.in: redefine LOCKPROG
@@ -11,23 +11,41 @@ And it should be "/usr/bin/dotlockfile" on the target.
 Upstream-Status: Inappropriate [oe specific]
 
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+
+Update patch for 1.17, also redefine LOCKPROG in other lines
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
- Makefile.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ Makefile.in | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index 6e53179..bfa0acb 100644
+index e447cb2..e02d75e 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -42,7 +42,7 @@ dotlockfile:	dotlockfile.o xlockfile.o
- 		$(CC) $(LDFLAGS) -o dotlockfile dotlockfile.o xlockfile.o
+@@ -44,19 +44,19 @@ dotlockfile:	dotlockfile.o dlockfile.o
+ 		$(CC) $(LDFLAGS) -o dotlockfile dotlockfile.o dlockfile.o
+ 
+ dotlockfile.o:	dotlockfile.c
+-		$(CC) $(CFLAGS) -DLOCKPROG=\"$(bindir)/dotlockfile\" \
++		$(CC) $(CFLAGS) -DLOCKPROG=\"/usr/bin/dotlockfile\" \
+ 			-c dotlockfile.c
  
  lockfile.o:	lockfile.c
 -		$(CC) $(CFLAGS) -DLIB -DLOCKPROG=\"$(bindir)/dotlockfile\" \
 +		$(CC) $(CFLAGS) -DLIB -DLOCKPROG=\"/usr/bin/dotlockfile\" \
- 			-c lockfile.c
+ 			-DSTATIC -c lockfile.c
+ 
+ solockfile.o:	lockfile.c
+-		$(CC) $(CFLAGS) -DLIB -DLOCKPROG=\"$(bindir)/dotlockfile\" \
++		$(CC) $(CFLAGS) -DLIB -DLOCKPROG=\"/usr/bin/dotlockfile\" \
+ 			-c lockfile.c -o solockfile.o
+ 
+ dlockfile.o:	lockfile.c
+-		$(CC) $(CFLAGS) -DLOCKPROG=\"$(bindir)/dotlockfile\" \
++		$(CC) $(CFLAGS) -DLOCKPROG=\"/usr/bin/dotlockfile\" \
+ 			-c lockfile.c -o dlockfile.o
  
- xlockfile.o:	lockfile.c
+ install_static:	static install_common
 -- 
 2.25.1
 
diff --git a/meta-oe/recipes-extended/liblockfile/liblockfile/configure.patch b/meta-oe/recipes-extended/liblockfile/liblockfile/configure.patch
index ea13e11d2..56f2d05eb 100644
--- a/meta-oe/recipes-extended/liblockfile/liblockfile/configure.patch
+++ b/meta-oe/recipes-extended/liblockfile/liblockfile/configure.patch
@@ -1,10 +1,17 @@
+From fd3fce8c1a3d0c70a0ffd461fbbe7e2ef71dd3a7 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Tue, 7 Mar 2023 11:05:45 +0800
+Subject: [PATCH] Update patch for 1.17
 
-#
-# Patch managed by http://www.mn-logistik.de/unsupported/pxa250/patcher
-#
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ configure.ac | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
 
---- liblockfile-1.05/./configure.in~configure
-+++ liblockfile-1.05/./configure.in
+diff --git a/configure.ac b/configure.ac
+index df26cee..76e9165 100644
+--- a/configure.ac
++++ b/configure.ac
 @@ -1,4 +1,5 @@
 -AC_INIT(lockfile.c)
 +AC_INIT
@@ -12,7 +19,7 @@
  AC_CONFIG_HEADER(autoconf.h)
  AC_REVISION($Revision: 1.0 $)dnl
  
-@@ -111,7 +112,8 @@
+@@ -111,7 +112,8 @@ AC_SUBST(TARGETS)
  AC_SUBST(INSTALL_TARGETS)
  AC_SUBST(nfslockdir)
  
@@ -23,3 +30,6 @@
 -)
 +])
 +AC_OUTPUT
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-extended/liblockfile/liblockfile/liblockfile-fix-install-so-to-man-dir.patch b/meta-oe/recipes-extended/liblockfile/liblockfile/liblockfile-fix-install-so-to-man-dir.patch
index da2503339..046cd8e69 100644
--- a/meta-oe/recipes-extended/liblockfile/liblockfile/liblockfile-fix-install-so-to-man-dir.patch
+++ b/meta-oe/recipes-extended/liblockfile/liblockfile/liblockfile-fix-install-so-to-man-dir.patch
@@ -1,4 +1,4 @@
-From 363eb1aaeca914c7d36a2cdaf1417e4f87af4c22 Mon Sep 17 00:00:00 2001
+From 079d04c187800e22f18723c74e41c4e46eef67f8 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Thu, 19 Jul 2018 01:12:47 -0700
 Subject: [PATCH] Makefile.in: define dotlockfile.1 installed to man
@@ -16,10 +16,10 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index 0f1b506..6e53179 100644
+index 3a74811..e447cb2 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -71,7 +71,7 @@ install_common:
+@@ -82,7 +82,7 @@ install_common:
  		else \
  		  install -g root -m 755 dotlockfile $(bindir); \
  		fi
@@ -29,5 +29,5 @@ index 0f1b506..6e53179 100644
  
  install_nfslib:	nfslib
 -- 
-2.17.1
+2.25.1
 
diff --git a/meta-oe/recipes-extended/liblockfile/liblockfile_1.14.bb b/meta-oe/recipes-extended/liblockfile/liblockfile_1.17.bb
similarity index 68%
rename from meta-oe/recipes-extended/liblockfile/liblockfile_1.14.bb
rename to meta-oe/recipes-extended/liblockfile/liblockfile_1.17.bb
index e07dab3c7..b094337e9 100644
--- a/meta-oe/recipes-extended/liblockfile/liblockfile_1.14.bb
+++ b/meta-oe/recipes-extended/liblockfile/liblockfile_1.17.bb
@@ -4,23 +4,20 @@ SECTION = "libs"
 LICENSE = "LGPL-2.0-or-later & GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=f4ba6ad04fcb05cc30a4cfa5062c55a3"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/libl/liblockfile/liblockfile_1.14.orig.tar.gz \
-    ${DEBIAN_MIRROR}/main/libl/liblockfile/liblockfile_1.14-1.debian.tar.bz2;name=1.14-1 \
+SRC_URI = "${DEBIAN_MIRROR}/main/libl/liblockfile/liblockfile_1.17.orig.tar.gz \
+    ${DEBIAN_MIRROR}/main/libl/liblockfile/liblockfile_1.17-1.debian.tar.bz2;name=1.17-1 \
     file://configure.patch \
     file://0001-Makefile.in-add-DESTDIR.patch \
     file://0001-Makefile.in-install-nfslock-libs.patch \
     file://liblockfile-fix-install-so-to-man-dir.patch \
     file://0001-Makefile.in-redefine-LOCKPROG.patch \
-    file://0001-Makefile.in-Don-t-try-to-run-ldconfig.patch \
+    file://0001-Makefile.in-fix-install-failure-on-host-without-ldco.patch \
 "
 
-SRC_URI[md5sum] = "420c056ba0cc4d1477e402f70ba2f5eb"
-SRC_URI[sha256sum] = "ab40d4a3e8cbc204f7e87fea637a4e4ddf9a1149aaa0a723a4267febd0b1d060"
+SRC_URI[sha256sum] = "6e937f3650afab4aac198f348b89b1ca42edceb17fb6bb0918f642143ccfd15e"
+SRC_URI[1.17-1.sha256sum] = "e3657c0e3facfeccb58900c0b48d56cd68ad5f9f24d1b4c6eaa69c26490fb673"
 
-SRC_URI[1.14-1.md5sum] = "f9a44928c3477d218c56252712ebc479"
-SRC_URI[1.14-1.sha256sum] = "73f9be769e602149391588c28f0f4f5cda131e30fb94c0777dbb23d811ac21ff"
-
-S = "${WORKDIR}/${BPN}"
+S = "${WORKDIR}/${BP}"
 
 inherit autotools-brokensep
 
-- 
2.25.1


