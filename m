Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E62FC677F1
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 04:39:17 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.10673.1677213547437410130
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Feb 2023 20:39:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=dCueh06t;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=14198b95fd=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31O4d75K031162
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Feb 2023 20:39:07 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=XAY0DEyH1jO70WLVrxGUepqRJZfE3XFc0adjOlkw64Q=;
 b=dCueh06tfm5o/Si9nfU+phZjM8ur8dz5FWrQggCZ1Aetjww75TahuF99zxODAAIWkE1D
 43VzrHz9klYaAaRBXlCfGz4FnrAQOI6OnZWTi8uvZPGmCuqK/5FQJ0qs079dceDe2ATu
 obvSFxo8NrcAfUXtGZYZY8JyfjOQA6vFSEhbT7FlwvGeNuDupw2wfkusbsuGsKUdyeFx
 3zB11wApRt1T/0ay8uiLqlxtxJ6dX32l9pJLoxLSppmmeJSdu7zA+xT73sQ7llzBHjhv
 YAhZgsVJtn8/NEHZy6HFGekT9l14f+xPjKKJR1Fpv9u35nl67Gefs3G4m4HN+Ho9K4lg eQ== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nty2pw7kv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Feb 2023 20:39:06 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Thu, 23 Feb 2023 20:39:06 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Thu, 23 Feb 2023 20:39:05 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [kirkstone][meta-oe][PATCH V2] liblockfile: fix do_install failure when ldconfig is not installed
Date: Fri, 24 Feb 2023 12:39:04 +0800
Message-ID: <20230224043904.3306228-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: PBvLftp_GrCgVj80-JRlGz3nfkHijG4r
X-Proofpoint-GUID: PBvLftp_GrCgVj80-JRlGz3nfkHijG4r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-24_02,2023-02-23_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 lowpriorityscore=0 phishscore=0 adultscore=0 suspectscore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 priorityscore=1501 malwarescore=0 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302240035
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Feb 2023 04:39:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101245

From: Changqing Li <changqing.li@windriver.com>

liblockfile do_install task will fail since syntax error when ldconfig
is not installed on the host.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...install-failure-on-host-without-ldco.patch | 62 +++++++++++++++++++
 .../liblockfile/liblockfile_1.14.bb           |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.in-fix-install-failure-on-host-without-ldco.patch

diff --git a/meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.in-fix-install-failure-on-host-without-ldco.patch b/meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.in-fix-install-failure-on-host-without-ldco.patch
new file mode 100644
index 000000000..5103f910d
--- /dev/null
+++ b/meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.in-fix-install-failure-on-host-without-ldco.patch
@@ -0,0 +1,62 @@
+From 0f78a746fee8553082c73beb2217d08fc5aaaa83 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Fri, 24 Feb 2023 02:57:35 +0000
+Subject: [PATCH] Makefile.in: fix install failure on host without ldconfig
+
+* fix syntax error when ldconfig is not installed on host
+
+when ldconfig is not installed on the build host, install will failed with
+error:
+ln -sf nfslock.so.0.1 /mnt/tmp-glibc/work/core2-64-wrs-linux/liblockfile/1.14-r0/image/usr/lib64/nfslock.so.0
+install -m 644 lockfile.h maillock.h /mnt/tmp-glibc/work/core2-64-wrs-linux/liblockfile/1.14-r0/image/usr/include
+if test "/mnt/tmp-glibc/work/core2-64-wrs-linux/liblockfile/1.14-r0/image" = ""; then ; fi
+if [ "mail" != "" ]; then\
+          install -g mail -m 2755 dotlockfile /mnt/tmp-glibc/work/core2-64-wrs-linux/liblockfile/1.14-r0/image/usr/bin;\
+        else \
+          install -g root -m 755 dotlockfile /mnt/tmp-glibc/work/core2-64-wrs-linux/liblockfile/1.14-r0/image/usr/bin; \
+        fi
+/bin/sh: -c: line 1: syntax error near unexpected token `;'
+/bin/sh: -c: line 1: `if test "/mnt/tmp-glibc/work/core2-64-wrs-linux/liblockfile/1.14-r0/image" = ""; then ; fi'
+
+* only run ldconfig when it exists
+
+Upstream-Status: Submitted [https://github.com/miquels/liblockfile/pull/21]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ Makefile.in | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index bfa0acb..e29763e 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -9,6 +9,7 @@ NFSVER		= 0.1
+ CFLAGS		= @CFLAGS@ -I.
+ LDFLAGS		= @LDFLAGS@
+ CC		= @CC@
++LDCONFIG        = @LDCONFIG@
+ 
+ prefix		= $(DESTDIR)@prefix@
+ exec_prefix	= @exec_prefix@
+@@ -58,7 +59,7 @@ install_shared:	shared install_static install_common
+ 			$(libdir)/liblockfile.so.$(SOVER)
+ 		ln -s liblockfile.so.$(SOVER) $(libdir)/liblockfile.so.$(MAJOR)
+ 		ln -s liblockfile.so.$(SOVER) $(libdir)/liblockfile.so
+-		if test "$(DESTDIR)" = ""; then @LDCONFIG@; fi
++		if test "$(DESTDIR)" = "" -a -n "$(LDCONFIG)"; then $(LDCONFIG); fi
+ 
+ install_common:
+ 		install -d -m 755 -g root -p $(includedir)
+@@ -79,7 +80,7 @@ install_nfslib:	nfslib
+ 		install -m 755 nfslock.so.$(NFSVER) $(nfslockdir)
+ 		ln -sf nfslock.so.$(NFSVER) $(libdir)/nfslock.so
+ 		ln -sf nfslock.so.$(NFSVER) $(libdir)/nfslock.so.0
+-		if test "$(DESTDIR)" = ""; then @LDCONFIG@; fi
++		if test "$(DESTDIR)" = "" -a -n "$(LDCONFIG)"; then $(LDCONFIG); fi
+ 
+ clean:
+ 		rm -f *.a *.o *.so *.so.* dotlockfile
+-- 
+2.32.0
+
diff --git a/meta-oe/recipes-extended/liblockfile/liblockfile_1.14.bb b/meta-oe/recipes-extended/liblockfile/liblockfile_1.14.bb
index bac3a2c0b..eefc25dc4 100644
--- a/meta-oe/recipes-extended/liblockfile/liblockfile_1.14.bb
+++ b/meta-oe/recipes-extended/liblockfile/liblockfile_1.14.bb
@@ -10,6 +10,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/libl/liblockfile/liblockfile_1.14.orig.tar.gz \
     file://0001-Makefile.in-add-DESTDIR.patch \
     file://0001-Makefile.in-install-nfslock-libs.patch \
     file://liblockfile-fix-install-so-to-man-dir.patch \
+    file://0001-Makefile.in-fix-install-failure-on-host-without-ldco.patch \
 "
 
 SRC_URI[md5sum] = "420c056ba0cc4d1477e402f70ba2f5eb"
-- 
2.25.1


