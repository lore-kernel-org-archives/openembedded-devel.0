Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A08A3C00140
	for <webhook@archiver.kernel.org>; Fri, 12 Aug 2022 03:43:43 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.6938.1660275818715930062
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Aug 2022 20:43:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=oMxOQ/dp;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=52233f6c88=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27C3elbb029814
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Aug 2022 20:43:38 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=6LP3GQTAKbjzi3WtBdDP/Mnj7oGq3IMLBifeKUzChXE=;
 b=oMxOQ/dp2ZxmoLAJggj+bqfZp+UbR5vPzHxAZcyS1LZMUf3uAoxJDcXwz+p3tMiBCFth
 n5nCf6pp1AORUxFAvEqNEhBpY4rh6IMn8TuFHrWd/HldG1EiK+6KCB4O44gxpTalRW8u
 6uwrlYhdfsOnosxeGoINBHSPhWihVIk81RsWPKc+UkTCoSnU9AUVKUjsgQg3g3NuIGsU
 MTxg/oL2rL/lkcd3z/Mk906VN3yf90MFHobVbOagpbIn+2niT9+UfH77b26TinOK22pu
 2KYan6zGcX6Fcko9hw+mtLD1JrAA2NxSIh+cuPSRWziJHmwXfllE3myTTXz4vZrZjUyu Lw==
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com
 [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hvqf28ygr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Aug 2022 20:43:38 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 11 Aug 2022 20:43:37 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 11 Aug 2022 20:43:36 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] liblockfile: fix buildpaths issue
Date: Fri, 12 Aug 2022 11:43:36 +0800
Message-ID: <20220812034336.571161-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 7AfqQIQxjcVNmJSdQ0CzNe5sA1lmPLG8
X-Proofpoint-ORIG-GUID: 7AfqQIQxjcVNmJSdQ0CzNe5sA1lmPLG8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-12_02,2022-08-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208120009
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Aug 2022 03:43:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98200

From: Mingli Yu <mingli.yu@windriver.com>

Fixes:
  WARNING: liblockfile-1.14-r0 do_package_qa: QA Issue: File /usr/lib/liblockfile.a in package liblockfile-staticdev contains reference to TMPDIR [buildpaths]
  WARNING: liblockfile-1.14-r0 do_package_qa: QA Issue: File /usr/lib/liblockfile.so.1.0 in package liblockfile contains reference to TMPDIR [buildpaths]

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../0001-Makefile.in-redefine-LOCKPROG.patch  | 33 +++++++++++++++++++
 .../liblockfile/liblockfile_1.14.bb           |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.in-redefine-LOCKPROG.patch

diff --git a/meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.in-redefine-LOCKPROG.patch b/meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.in-redefine-LOCKPROG.patch
new file mode 100644
index 000000000..35549ff2d
--- /dev/null
+++ b/meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.in-redefine-LOCKPROG.patch
@@ -0,0 +1,33 @@
+From 9beb650712d448ad9c0899de9d98e9b623f9c249 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Fri, 12 Aug 2022 11:18:15 +0800
+Subject: [PATCH] Makefile.in: redefine LOCKPROG
+
+By default the LOCKPROG will be expanded as below:
+LOCKPROG="/build/tmp-glibc/work/core2-32-wrs-linux/liblockfile/1.14-r0/image/usr/bin/dotlockfile"
+
+And it should be "/usr/bin/dotlockfile" on the target.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index 6e53179..bfa0acb 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -42,7 +42,7 @@ dotlockfile:	dotlockfile.o xlockfile.o
+ 		$(CC) $(LDFLAGS) -o dotlockfile dotlockfile.o xlockfile.o
+ 
+ lockfile.o:	lockfile.c
+-		$(CC) $(CFLAGS) -DLIB -DLOCKPROG=\"$(bindir)/dotlockfile\" \
++		$(CC) $(CFLAGS) -DLIB -DLOCKPROG=\"/usr/bin/dotlockfile\" \
+ 			-c lockfile.c
+ 
+ xlockfile.o:	lockfile.c
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-extended/liblockfile/liblockfile_1.14.bb b/meta-oe/recipes-extended/liblockfile/liblockfile_1.14.bb
index bac3a2c0b..2604e14f0 100644
--- a/meta-oe/recipes-extended/liblockfile/liblockfile_1.14.bb
+++ b/meta-oe/recipes-extended/liblockfile/liblockfile_1.14.bb
@@ -10,6 +10,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/libl/liblockfile/liblockfile_1.14.orig.tar.gz \
     file://0001-Makefile.in-add-DESTDIR.patch \
     file://0001-Makefile.in-install-nfslock-libs.patch \
     file://liblockfile-fix-install-so-to-man-dir.patch \
+    file://0001-Makefile.in-redefine-LOCKPROG.patch \
 "
 
 SRC_URI[md5sum] = "420c056ba0cc4d1477e402f70ba2f5eb"
-- 
2.25.1


