Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4540D116EA
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 09:28:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12366.1764322128942219129
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Nov 2025 01:28:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=CHV8NY0j;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3427e3dda8=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS4Vqv62535550
	for <openembedded-devel@lists.openembedded.org>; Fri, 28 Nov 2025 01:28:48 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=H/oXlGtLGoCZh+6SRpa+
	2vyIvAZkjOL4sMgQA3k1n+0=; b=CHV8NY0jh4qZgmaukYLEaBKjf5Z/S7ZjcRmu
	0dQluX8GyKhrrF98nkLTpTSOblKB6rcIXxx7TwxEUONv90sDzwFxynUbSDuWpwLL
	Jcl2sWeXW37KYYmjdEZ6DfKBQ71+XsIJUPGuCKvD+Fft0aT0m8EbIeD2rAGsyUYN
	EIcuYcIXUp3ECEqLAWPfJTEEViusUa1qki0XjViaURlAWI2nLr2hodihLHhmqZdM
	WSTgly2ujCT0mFzr0cl9U31v4iX4NRzZAGeURG9kuy1yXZ8xzMssfNuKEUEMSkex
	LhToG+ek0fHMbQz64rwIOM17EGpDkbNh2F0KrwY9RPGfOZTFGA==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ak9b5eka9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 28 Nov 2025 01:28:48 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Fri, 28 Nov 2025 01:28:47 -0800
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Fri, 28 Nov 2025 01:28:47 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [scarthgap][PATCH] libtracefs: avoid run bison
Date: Fri, 28 Nov 2025 17:28:44 +0800
Message-ID: <20251128092844.3184391-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=fozRpV4f c=1 sm=1 tr=0 ts=69296b50 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=meVymXHHAAAA:8
 a=t7CeM3EgAAAA:8 a=AUd_NHdVAAAA:8 a=YzPBJ3fVbFq6chHA2b4A:9
 a=2JgSa4NbpEOStq-L5dxp:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDA2OSBTYWx0ZWRfX+h4GDcgZz0MD
 vGWqfijmh+PMplMRoc6QhSvwOTib9wRgi4d2dMSHxprQb8irNtIYQIE6FyxBgtkGguK/cvCMZW5
 +BDxIxwQ37M5m7iDhRdxFH5TaWACDvRDhEHdmCSxStH2nEbyRwlyPeHPjPVc9fy24xdHVUDFm7O
 dViLYPMhxVnom4GTgx2bQPY6iGev2/wa/jm021MDL7Hg1nUyLA7F9VlOv5ZntrSPApSNdRcbyWT
 2E0UJ3qV5zKBwijtJYIafju+gGx/LlZ8Sn1ji7tICIU8x8EjitfK0t1MURvQwVi8hS1Eywj5H6P
 30Ws7bJFbocULuwlvoRY/djBynaHoLLl03TQlDDjitA8Nb4vi+gDlhXnhLprRD7hAkaAmaEh2yh
 vL9Mr2FUA/CZ5G3khacTf1yQdvlctw==
X-Proofpoint-GUID: f_LEs5AildzOnlHinCBfMVa9VThMgzfK
X-Proofpoint-ORIG-GUID: f_LEs5AildzOnlHinCBfMVa9VThMgzfK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_03,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 clxscore=1011
 spamscore=0 impostorscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280069
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Nov 2025 09:28:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122120

From: Kai Kang <kai.kang@windriver.com>

There is a rare compile failure

| In file included from sqlhist-parse.h:25,
|                  from tracefs-sqlhist.c:17:
| sqlhist.tab.h:120:8: error: unterminated comment
|   120 | #endif /* !YY_TRACEFS_SQLHIST_TAB_H_INCLUDED  */
|       |        ^

Backport patch to avoid run bison that not re-gerate sqlhist.tab.h.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...ake-sqlhist_remake-to-run-bison-and-.patch | 108 ++++++++++++++++++
 .../libtracefs/libtracefs_1.7.0.bb            |   1 +
 2 files changed, 109 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/libtracefs/libtracefs/0001-libtracefs-Add-make-sqlhist_remake-to-run-bison-and-.patch

diff --git a/meta-oe/recipes-kernel/libtracefs/libtracefs/0001-libtracefs-Add-make-sqlhist_remake-to-run-bison-and-.patch b/meta-oe/recipes-kernel/libtracefs/libtracefs/0001-libtracefs-Add-make-sqlhist_remake-to-run-bison-and-.patch
new file mode 100644
index 0000000000..c876afe2ca
--- /dev/null
+++ b/meta-oe/recipes-kernel/libtracefs/libtracefs/0001-libtracefs-Add-make-sqlhist_remake-to-run-bison-and-.patch
@@ -0,0 +1,108 @@
+From 15145304ea3f2abff2418adc220c1459190246eb Mon Sep 17 00:00:00 2001
+From: "Steven Rostedt (Google)" <rostedt@goodmis.org>
+Date: Fri, 4 Apr 2025 12:12:10 -0400
+Subject: [PATCH] libtracefs: Add make sqlhist_remake to run bison and flex
+
+Because git tends to not maintain timestamps of files, the sqlhist.y and
+sqlhist.l can end up having an later timestamp than the files they
+produce. This triggers bison and flex to be run and recreate the files
+sqlhist.tab.h, sqlhist.tab.c and sqlhist-lex.c.
+
+At best, this causes git to see the differences, at worse, the system may
+not even have bison or flex and the build fails.
+
+Add a new make target: make sqlhist_remake
+
+This new target will run the bison and flex portions of the build.
+It only needs to be run if the files sqlhist.y or sqlhist.l are modified.
+
+Cc: Oleh Matiusha <omatiush@cisco.com>
+Link: https://lore.kernel.org/20250404161504.1671790-2-rostedt@goodmis.org
+Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git/commit/?id=1514530]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ Makefile      |  3 +++
+ src/Makefile  | 14 ++++++++------
+ src/sqlhist.l |  2 ++
+ src/sqlhist.y |  1 +
+ 4 files changed, 14 insertions(+), 6 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 9f377e9..0fe252b 100644
+--- a/Makefile
++++ b/Makefile
+@@ -393,6 +393,9 @@ sqlhist: samples/sqlhist
+ samples: libtracefs.a force
+ 	$(Q)$(call descend,$(src)/samples,all)
+ 
++sqlhist_remake:
++	$(Q)$(call descend,$(src)/src,sqlhist_remake)
++
+ clean:
+ 	$(Q)$(call descend_clean,utest)
+ 	$(Q)$(call descend_clean,src)
+diff --git a/src/Makefile b/src/Makefile
+index 90bd88d..eb5a2e7 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -44,18 +44,20 @@ $(LIBTRACEFS_SHARED_SO): $(LIBTRACEFS_SHARED_VERSION)
+ libtracefs.so: $(LIBTRACEFS_SHARED_SO)
+ 
+ # bison will create both sqlhist.tab.c and sqlhist.tab.h
+-sqlhist.tab.h:
+-sqlhist.tab.c: sqlhist.y sqlhist.tab.h
+-	bison --debug -v --report-file=bison.report -d -o $@ $<
++sqlhist.tab_gen.h:
++sqlhist.tab_gen.c: sqlhist.y sqlhist.tab.h
++	bison --debug -v --report-file=bison.report -d -o $(subst _gen,,$@) $<
+ 
+-sqlhist-lex.c: sqlhist.l sqlhist.tab.c
+-	flex -o $@ $<
++sqlhist-lex_gen.c: sqlhist.l sqlhist.tab.c
++	flex -o $(subst _gen,,$@) $<
+ 
+ $(bdir)/%.o: %.c
+ 	$(Q)$(call do_fpic_compile)
+ 
+ tracefs-sqlhist.o: sqlhist.tab.h
+ 
++sqlhist_remake: sqlhist.tab_gen.c sqlhist-lex_gen.c
++
+ $(OBJS): | $(bdir)
+ 
+ clean:
+@@ -65,4 +67,4 @@ clean:
+ 
+ $(bdir)/tracefs-sqlhist.o tracefs-sqlhist.o: sqlhist.tab.h
+ 
+-.PHONY: $(LIBTRACEFS_SHARED_SO) $(LIBTRACEFS_STATIC)
++.PHONY: $(LIBTRACEFS_SHARED_SO) $(LIBTRACEFS_STATIC) sqlhist.tab_gen.c sqlhist-lex_gen.c
+diff --git a/src/sqlhist.l b/src/sqlhist.l
+index 4df475a..2a3ca61 100644
+--- a/src/sqlhist.l
++++ b/src/sqlhist.l
+@@ -1,6 +1,8 @@
+ %{
+ /* code here */
+ 
++/* If you change this file, run: make sqlhist_remake */
++
+ #include <stdarg.h>
+ #include "sqlhist-parse.h"
+ 
+diff --git a/src/sqlhist.y b/src/sqlhist.y
+index fade9a4..90039a7 100644
+--- a/src/sqlhist.y
++++ b/src/sqlhist.y
+@@ -1,4 +1,5 @@
+ %{
++/* If you change this file, run: make sqlhist_remake */
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-kernel/libtracefs/libtracefs_1.7.0.bb b/meta-oe/recipes-kernel/libtracefs/libtracefs_1.7.0.bb
index 9a408ba13c..d50352f81e 100644
--- a/meta-oe/recipes-kernel/libtracefs/libtracefs_1.7.0.bb
+++ b/meta-oe/recipes-kernel/libtracefs/libtracefs_1.7.0.bb
@@ -13,6 +13,7 @@ SRCREV = "aebab37379d0fbadc702d64aca0fe5cf18676404"
 SRC_URI = "git://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git;branch=${BPN};protocol=https \
            file://0001-makefile-Do-not-preserve-ownership-in-cp-command.patch \
            file://0001-tracefs-perf-Add-missing-headers-for-syscall-and-SYS.patch \
+           file://0001-libtracefs-Add-make-sqlhist_remake-to-run-bison-and-.patch \
            "
 S = "${WORKDIR}/git"
 
-- 
2.34.1


