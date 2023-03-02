Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73BAEC678D4
	for <webhook@archiver.kernel.org>; Thu,  2 Mar 2023 05:01:07 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.8050.1677733262645831968
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Mar 2023 21:01:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=SC56iEDe;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2425b97132=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32250lio025763
	for <openembedded-devel@lists.openembedded.org>; Thu, 2 Mar 2023 05:01:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=M8T9MmJobafACr0Cxdqb0hvJ/NIzGOSsRDvJlxhuoUk=;
 b=SC56iEDeVBYeVeSE/vz7qCEN84Z9DT5FoVy1r2TKli5dGFMcwiDPq34nr9G6gK6oiMdf
 aCfZEBNb8mjS7Xti6CDCugzH+QCSmio4kRLz1OZPpuST7YyeA2AWozNZGw5pg8CbEQ8n
 Zq4U8kmW7+6PWmefqcjJKTxON/gxXXnhD1IiGIynJUpQs45lRU0vYeuNdGbzDqnci5Nf
 4v3LXPl4nMI/Y5v0oc5BUeH1VXkmRXUKikoQY2a59Jk2st5TGUX7twKbzeZwhsyd3+oa
 9JbzSnMt2Tf8FzE8K+ZdocaVHacKHmzKZYCEkplPkGtGUS2lSoCawsEVnUW8Wj9ADbd8 bg== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nybmkd2qw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 02 Mar 2023 05:01:01 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Wed, 1 Mar 2023 21:01:00 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Wed, 1 Mar 2023 21:00:59 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [kirkstone][meta-oe][PATCH V3] liblockfile: fix do_install failure when ldconfig is not installed
Date: Thu, 2 Mar 2023 13:00:59 +0800
Message-ID: <20230302050059.1545118-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: ryoRbukO8q_ezU0b9BH9LXH0SArmw8TO
X-Proofpoint-ORIG-GUID: ryoRbukO8q_ezU0b9BH9LXH0SArmw8TO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-02_01,2023-03-01_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 suspectscore=0 phishscore=0 mlxscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303020035
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Mar 2023 05:01:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101324

From: Changqing Li <changqing.li@windriver.com>

liblockfile do_install task will fail since syntax error when ldconfig
is not installed on the host.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...install-failure-on-host-without-ldco.patch | 63 +++++++++++++++++++
 .../liblockfile/liblockfile_1.14.bb           |  1 +
 2 files changed, 64 insertions(+)
 create mode 100644 meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.in-fix-install-failure-on-host-without-ldco.patch

diff --git a/meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.in-fix-install-failure-on-host-without-ldco.patch b/meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.in-fix-install-failure-on-host-without-ldco.patch
new file mode 100644
index 000000000..8ac61aa55
--- /dev/null
+++ b/meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.in-fix-install-failure-on-host-without-ldco.patch
@@ -0,0 +1,63 @@
+From db9b4be854bb9a84319b81ce0afecd98f4f84ff7 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Mon, 27 Feb 2023 08:28:21 +0000
+Subject: [PATCH] Makefile.in: fix install failure on host without ldconfig
+
+fix syntax error when ldconfig is not installed on host
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
+Upstream-Status: Submitted [https://github.com/miquels/liblockfile/pull/21]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ Makefile.in | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index 6e53179..d003899 100644
+--- a/Makefile.in
++++ b/Makefile.in
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
+@@ -58,7 +62,7 @@ install_shared:	shared install_static install_common
+ 			$(libdir)/liblockfile.so.$(SOVER)
+ 		ln -s liblockfile.so.$(SOVER) $(libdir)/liblockfile.so.$(MAJOR)
+ 		ln -s liblockfile.so.$(SOVER) $(libdir)/liblockfile.so
+-		if test "$(DESTDIR)" = ""; then @LDCONFIG@; fi
++		if test "$(DESTDIR)" = ""; then $(LDCONFIG); fi
+ 
+ install_common:
+ 		install -d -m 755 -g root -p $(includedir)
+@@ -79,7 +83,7 @@ install_nfslib:	nfslib
+ 		install -m 755 nfslock.so.$(NFSVER) $(nfslockdir)
+ 		ln -sf nfslock.so.$(NFSVER) $(libdir)/nfslock.so
+ 		ln -sf nfslock.so.$(NFSVER) $(libdir)/nfslock.so.0
+-		if test "$(DESTDIR)" = ""; then @LDCONFIG@; fi
++		if test "$(DESTDIR)" = ""; then $(LDCONFIG); fi
+ 
+ clean:
+ 		rm -f *.a *.o *.so *.so.* dotlockfile
+-- 
+2.25.1
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


