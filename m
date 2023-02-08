Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D24FC05027
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 04:21:43 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.1086.1675830100480698393
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Feb 2023 20:21:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=sj4McyXb;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1403b17da0=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 318498rN019930
	for <openembedded-devel@lists.openembedded.org>; Wed, 8 Feb 2023 04:21:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=3BeGF2uNAwlVJLJ3adOv7iL/xM2vHJdFUQ2qBvKQz+k=;
 b=sj4McyXbthWeZOFff0BWmBjvaO4cCzjuuN+Tq47wkmvJb+mN0GuoUkYHKRSHhZDPWctv
 lv2rg8ZQmJ6E9Dnjqx6GqHUDVWhEV4LlVzHfeG0mkpOJ3mhvk8Q/EI4jCXIcyGjEXzGk
 A96mNjMSbfbVlIcXdSKD0Q36Z4ODmjyJLH+Z6xRToHQ9a2qOWp4jJLT/TCPe1t6QPejd
 7NovJPxl0T0kB5jCjUUNDmZXP1HNEKVoQ9s35odCgFa/m8MMUqyQ+Z2ed/49gLC61F+9
 5nDh7Mb808qC75EYxpfjztthy6W2/nqt81rq2kkf0fnrrv9iyMjMuVpSmz1NLAMcdqcy /A== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nhebabn79-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 08 Feb 2023 04:21:39 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Tue, 7 Feb 2023 20:21:38 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Tue, 7 Feb 2023 20:21:37 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] liblockfile: fix do_install failure when ldconfig is not installed
Date: Wed, 8 Feb 2023 12:21:36 +0800
Message-ID: <20230208042136.817775-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: -FTx_HAXGlkc5aPo3N9fzxkW9enxPwwY
X-Proofpoint-GUID: -FTx_HAXGlkc5aPo3N9fzxkW9enxPwwY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-07_15,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 phishscore=0 mlxlogscore=771 adultscore=0
 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302080038
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Feb 2023 04:21:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100966

From: Changqing Li <changqing.li@windriver.com>

liblockfile do_install task will fail when ldconfig is not installed
on the host. Delete the useless line to fix the issue.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...akefile.in-Don-t-try-to-run-ldconfig.patch | 51 +++++++++++++++++++
 .../liblockfile/liblockfile_1.14.bb           |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.in-Don-t-try-to-run-ldconfig.patch

diff --git a/meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.in-Don-t-try-to-run-ldconfig.patch b/meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.in-Don-t-try-to-run-ldconfig.patch
new file mode 100644
index 000000000..5a1d9a995
--- /dev/null
+++ b/meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.in-Don-t-try-to-run-ldconfig.patch
@@ -0,0 +1,51 @@
+From 5876bd17caac96df70ef400bfeebb155c0bd7359 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Wed, 8 Feb 2023 10:34:45 +0800
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
+ Makefile.in | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index bfa0acb..ae5be56 100644
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
+@@ -79,7 +78,6 @@ install_nfslib:	nfslib
+ 		install -m 755 nfslock.so.$(NFSVER) $(nfslockdir)
+ 		ln -sf nfslock.so.$(NFSVER) $(libdir)/nfslock.so
+ 		ln -sf nfslock.so.$(NFSVER) $(libdir)/nfslock.so.0
+-		if test "$(DESTDIR)" = ""; then @LDCONFIG@; fi
+ 
+ clean:
+ 		rm -f *.a *.o *.so *.so.* dotlockfile
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-extended/liblockfile/liblockfile_1.14.bb b/meta-oe/recipes-extended/liblockfile/liblockfile_1.14.bb
index 2604e14f0..e07dab3c7 100644
--- a/meta-oe/recipes-extended/liblockfile/liblockfile_1.14.bb
+++ b/meta-oe/recipes-extended/liblockfile/liblockfile_1.14.bb
@@ -11,6 +11,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/libl/liblockfile/liblockfile_1.14.orig.tar.gz \
     file://0001-Makefile.in-install-nfslock-libs.patch \
     file://liblockfile-fix-install-so-to-man-dir.patch \
     file://0001-Makefile.in-redefine-LOCKPROG.patch \
+    file://0001-Makefile.in-Don-t-try-to-run-ldconfig.patch \
 "
 
 SRC_URI[md5sum] = "420c056ba0cc4d1477e402f70ba2f5eb"
-- 
2.25.1


