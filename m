Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6AA6C61DA3
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 02:02:13 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.32996.1676944928253556421
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Feb 2023 18:02:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=FIYIRCYH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1416ced4d7=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31L1s6CH002427
	for <openembedded-devel@lists.openembedded.org>; Tue, 21 Feb 2023 02:02:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=AzIyNp4x60ysWSDbW8GHc9G2Q8CKYx3uAQBxjqgPMuI=;
 b=FIYIRCYHc0abclhQ2ttaiKSkoMp0jEzlwY0TGeOr2pCzeD6OB3R4N/PQZvvEAT2Npfsi
 eIaVX/FxuBBRPSENi1CmdH03JZhJvtM5FTVkroWSjOeJ5e8l+qRWQBomqqKA9sjGMicK
 V+do3NC5DW8mcIa4k9GK1FjzjewgzMNN8nqzGd0Zs6BjfX9npFryHxkxxCE8eFebsJEA
 l0uuTCEx496hJI83y8Y3R+FpeFPqSbcNzPL15DpTmiiRxOy3C3BkNpDbf1UwantZ7ICF
 70MS5pK/foWRL4TmbeOsaKTjsE6b2nUaGtYLWUmxG2ctXO5HbZ/a/64Wxmvp5mU+sLTG FA== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ntpd3t7ma-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 21 Feb 2023 02:02:07 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.18; Mon, 20 Feb 2023 18:02:06 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Mon, 20 Feb 2023 18:02:05 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [kirkstone][meta-oe][PATCH] liblockfile: fix do_install failure when ldconfig is not installed
Date: Tue, 21 Feb 2023 10:02:04 +0800
Message-ID: <20230221020204.2711537-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 5u0mAzMtB1bYPBGR-mNUGF8Yd82ALYo9
X-Proofpoint-ORIG-GUID: 5u0mAzMtB1bYPBGR-mNUGF8Yd82ALYo9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-20_19,2023-02-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0 malwarescore=0
 mlxlogscore=801 clxscore=1015 lowpriorityscore=0 phishscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302210017
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Feb 2023 02:02:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101182

From: Changqing Li <changqing.li@windriver.com>

liblockfile do_install task will fail when ldconfig is not installed
on the host. Delete the useless line to fix the issue.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...akefile.in-Don-t-try-to-run-ldconfig.patch | 43 +++++++++++++++++++
 .../liblockfile/liblockfile_1.14.bb           |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.in-Don-t-try-to-run-ldconfig.patch

diff --git a/meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.in-Don-t-try-to-run-ldconfig.patch b/meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.in-Don-t-try-to-run-ldconfig.patch
new file mode 100644
index 000000000..4fc95879f
--- /dev/null
+++ b/meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.in-Don-t-try-to-run-ldconfig.patch
@@ -0,0 +1,43 @@
+From 6053a060ea6425e8a1ae628a0357e175e36a2886 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Tue, 21 Feb 2023 09:56:01 +0800
+Subject: [PATCH] Makefile.in: Don't try to run ldconfig
+
+when ldconfig is not installed on the build host, do_install
+will failed with error:
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
+Deleted line is not needed for OE, as it is cross-compile. And
+it can also fix above error
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ Makefile.in | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index 6e53179..e33f7d4 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -58,7 +58,6 @@ install_shared:	shared install_static install_common
+ 			$(libdir)/liblockfile.so.$(SOVER)
+ 		ln -s liblockfile.so.$(SOVER) $(libdir)/liblockfile.so.$(MAJOR)
+ 		ln -s liblockfile.so.$(SOVER) $(libdir)/liblockfile.so
+-		if test "$(DESTDIR)" = ""; then @LDCONFIG@; fi
+ 
+ install_common:
+ 		install -d -m 755 -g root -p $(includedir)
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-extended/liblockfile/liblockfile_1.14.bb b/meta-oe/recipes-extended/liblockfile/liblockfile_1.14.bb
index bac3a2c0b..51db47cd5 100644
--- a/meta-oe/recipes-extended/liblockfile/liblockfile_1.14.bb
+++ b/meta-oe/recipes-extended/liblockfile/liblockfile_1.14.bb
@@ -10,6 +10,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/libl/liblockfile/liblockfile_1.14.orig.tar.gz \
     file://0001-Makefile.in-add-DESTDIR.patch \
     file://0001-Makefile.in-install-nfslock-libs.patch \
     file://liblockfile-fix-install-so-to-man-dir.patch \
+    file://0001-Makefile.in-Don-t-try-to-run-ldconfig.patch \
 "
 
 SRC_URI[md5sum] = "420c056ba0cc4d1477e402f70ba2f5eb"
-- 
2.25.1


