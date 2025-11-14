Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA439CDE026
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 08:08:37 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13379.1763107708147924607
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Nov 2025 00:08:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=o7mBNZNO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=341359508a=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE6lZhO575898
	for <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 08:08:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=meg2TC7Z50INY1sIHnjC
	xJixbpHIWHEYtzer+ZAtczE=; b=o7mBNZNOMY7B/OZmgvLACF84zm9bWfrSaKF+
	83pdLgPy5at29i6SENVkgSERGFUlx2Z0nA/lUvWptcDFc9sn8Fgm7YYRkOPgXcYr
	hhHgN6MIyJ1TxsBJjEKq4MQGL7g/X0nyt5PK4rs+j7oTQZXlk//5Bwj8e86CXU1A
	s5d8gdXB0VEZ0f85uUwJYAat+Dm+fTsM1TgJe8BghZbtx/xfhXxilO6ACsx7ZBSE
	NT1JVR4/VZJ0Nk1ytE8SswAYjYYTigiJF4Cakzha9QLjMho3pNCXFuw5cyOV/gDm
	9N0kNZ9UpEHbooamZQ1fMj0yTvYanQyM7NSE9CrujMaVnF+DUA==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4adtr5g9eu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 08:08:27 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Fri, 14 Nov 2025 00:08:25 -0800
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Fri, 14 Nov 2025 00:08:25 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 1/2] libhugetlbfs: support reproducible builds
Date: Fri, 14 Nov 2025 16:08:23 +0800
Message-ID: <20251114080824.2364576-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=KY/fcAYD c=1 sm=1 tr=0 ts=6916e37b cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=57WQwZ2eggWgDIFVbWoA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: MTwh94qUGfXRyH2MPBDyy8hOSgU7dhOy
X-Proofpoint-ORIG-GUID: MTwh94qUGfXRyH2MPBDyy8hOSgU7dhOy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA2MyBTYWx0ZWRfXyD73d1OlPW7T
 wZkDAEdbvwwji5SzmcuRHnlR12FTlrLds62STcyKjzTrIzym4U33qfUqrmLJ7P+AeArBrbLB+3J
 Nz1eaO8NvRA+7jHOMlEzA1igmm/9VIFIp0PPDHWRbQnfEymm5NnBskvQEMKS7mbnZ9P7KN+09aI
 bgCT/cnR13Z/37Jx21c6GJBhc0kNZHS1ayYfkdnDOlKp1MC9WISBJlu6L7j/PYxxQ+kvSqY51de
 a26/UIA3DdlXpXfvQ7vus7fJQrdrR7Ygisn+kG/uqk2mL4bbikBVTaVtjTXKu9jC8SlJf1c862o
 yUgzt/oab7HQQqWcK6Ou4XfgFO01GGwKXlh37uom0DLKajnmjwVa/OtfF0s42MskutWKFBQA4I2
 BBcb/Ech+OdQQv1G2EeZe5BQ5ED2QA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_01,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140063
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 08:08:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121691

When compressing docs, do not save the original file name and
timestamp by default (gzip -n). Make archives be reproducible
at each build

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/conf/layer.conf                       |  1 -
 .../0015-support-reproducible-builds.patch    | 51 +++++++++++++++++++
 .../libhugetlbfs/libhugetlbfs_2.24.bb         |  1 +
 3 files changed, 52 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/0015-support-reproducible-builds.patch

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index 760edbce3e..23af8d0183 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -189,7 +189,6 @@ OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES += " \
     libdbus-cxx-dev \
     libforms \
     libfsverity0 \
-    libhugetlbfs-doc \
     libiio-src \
     libjcat-dbg \
     libjcat-ptest \
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/0015-support-reproducible-builds.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/0015-support-reproducible-builds.patch
new file mode 100644
index 0000000000..648a5e3c56
--- /dev/null
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/0015-support-reproducible-builds.patch
@@ -0,0 +1,51 @@
+From 437b7b143072b088ca34e10165abed04973280a3 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 5 Nov 2025 15:22:34 +0800
+Subject: [PATCH] support reproducible builds
+
+When compressing, do not save the original file name and
+timestamp by default (gzip -n). Make archives be reproducible
+at each build
+
+Upstream-Status: Submitted [https://github.com/libhugetlbfs/libhugetlbfs/pull/108]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ Makefile.in | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index 25be577..e4037af 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -446,11 +446,11 @@ install-man:
+ 	$(INSTALL) -d $(DESTDIR)$(MANDIR8)
+ 	for x in $(INSTALL_MAN1); do \
+ 		$(INSTALL) -m 444 man/$$x $(DESTDIR)$(MANDIR1); \
+-		gzip -f $(DESTDIR)$(MANDIR1)/$$x; \
++		gzip -fn $(DESTDIR)$(MANDIR1)/$$x; \
+ 	done
+ 	for x in $(INSTALL_MAN3); do \
+ 		$(INSTALL) -m 444 man/$$x $(DESTDIR)$(MANDIR3); \
+-		gzip -f $(DESTDIR)$(MANDIR3)/$$x; \
++		gzip -fn $(DESTDIR)$(MANDIR3)/$$x; \
+ 	done
+ 	rm -f $(DESTDIR)$(MANDIR3)/free_huge_pages.3.gz
+ 	rm -f $(DESTDIR)$(MANDIR3)/free_hugepage_region.3.gz
+@@ -462,11 +462,11 @@ install-man:
+ 	ln -s hugetlbfs_find_path.3.gz $(DESTDIR)$(MANDIR3)/hugetlbfs_find_path_for_size.3.gz
+ 	for x in $(INSTALL_MAN7); do \
+ 		$(INSTALL) -m 444 man/$$x $(DESTDIR)$(MANDIR7); \
+-		gzip -f $(DESTDIR)$(MANDIR7)/$$x; \
++		gzip -fn $(DESTDIR)$(MANDIR7)/$$x; \
+ 	done
+ 	for x in $(INSTALL_MAN8); do \
+ 		$(INSTALL) -m 444 man/$$x $(DESTDIR)$(MANDIR8); \
+-		gzip -f $(DESTDIR)$(MANDIR8)/$$x; \
++		gzip -fn $(DESTDIR)$(MANDIR8)/$$x; \
+ 	done
+ 
+ install-bin:
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb
index 0546d4b0b5..89ce11f6e4 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb
@@ -25,6 +25,7 @@ SRC_URI = " \
     file://0012-huge_page_setup_helper-use-python3-interpreter.patch \
     file://0013-elflink.c-include-libgen.h-for-basename.patch \
     file://0014-tests-Add-ldflags-to-linker-commandline-for-libheaps.patch \
+    file://0015-support-reproducible-builds.patch \
 "
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.34.1


