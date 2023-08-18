Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08318C71157
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 14:38:33 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.13052.1692369509581307050
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Aug 2023 07:38:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=XW9IPzuL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7594f89566=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37IBeLpf023788
	for <openembedded-devel@lists.openembedded.org>; Fri, 18 Aug 2023 14:38:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=isasX
	WivsPRukwrHFfQ8fTzSgDnhSqsQkNRzKYCsrfI=; b=XW9IPzuLgfvlNVOJdJAfN
	oRxOKB0xIpJuEQ3OIpmCYFkvlE1PQN2kfvphSyggw9+OjOFxBYRklNqW4vPJqAF5
	tx+bBL+SEPG7IXEkHX1My6ULoJimM4Mt6Bg7DbVOZrvjJU37oK6AS9rOuYoJ5eBy
	WhAofO44eGVR+uPxk3yZ1nbUbu28viMR4FEvfdbHrXuI4LJse6/PYYgP38G2N1DE
	uiAy9DaziO9vPeXsb3/l04L5axSDph2/jnIwLeeeU2YgPvdQ0kTQ0vt5vy1/ZOsw
	kQvqHqkTH8LWgiA29LyMKlxOkbSgxwqh+p/MtPg3OqWeV6/zRKn8t4PElknnLyWc
	w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3se125x0ph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 18 Aug 2023 14:38:28 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 18 Aug 2023 07:38:22 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][master][kirkstone][mickledore][PATCH 1/1] yasm: fix CVE-2023-37732
Date: Fri, 18 Aug 2023 14:38:04 +0000
Message-ID: <20230818143804.2227980-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: 7gX_8Tn8M_oOuNGwMi3xvCxXDYuLPd8L
X-Proofpoint-ORIG-GUID: 7gX_8Tn8M_oOuNGwMi3xvCxXDYuLPd8L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-18_18,2023-08-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0
 mlxlogscore=891 spamscore=0 clxscore=1011 impostorscore=0
 priorityscore=1501 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2306200000 definitions=main-2308180133
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Aug 2023 14:38:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104491

From: Soumya <soumya.sambu@windriver.com>

Yasm v1.3.0.78 was found prone to NULL Pointer Dereference in /libyasm/intnum.c
and /elf/elf.c, which allows the attacker to cause a denial of service via a
crafted file.

References:
https://github.com/yasm/yasm/issues/233
https://nvd.nist.gov/vuln/detail/CVE-2023-37732

Signed-off-by: Soumya <soumya.sambu@windriver.com>
---
 .../yasm/yasm/CVE-2023-37732.patch            | 41 +++++++++++++++++++
 meta-oe/recipes-devtools/yasm/yasm_git.bb     |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/yasm/yasm/CVE-2023-37732.patch

diff --git a/meta-oe/recipes-devtools/yasm/yasm/CVE-2023-37732.patch b/meta-oe/recipes-devtools/yasm/yasm/CVE-2023-37732.patch
new file mode 100644
index 000000000..1ca33f0a9
--- /dev/null
+++ b/meta-oe/recipes-devtools/yasm/yasm/CVE-2023-37732.patch
@@ -0,0 +1,41 @@
+From 2cd3bb50e256f5ed5f611ac611d25fe673f2cec3 Mon Sep 17 00:00:00 2001
+From: Peter Johnson <johnson.peter@gmail.com>
+Date: Fri, 11 Aug 2023 10:49:51 +0000
+Subject: [PATCH] elf.c: Fix NULL deref on bad xsize expression (#234)
+
+CVE: CVE-2023-37732
+
+Upstream-Status: Backport [https://github.com/yasm/yasm/commit/2cd3bb50e256f5ed5f611ac611d25fe673f2cec3]
+
+Signed-off-by: Soumya <soumya.sambu@windriver.com>
+---
+ modules/objfmts/elf/elf.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/modules/objfmts/elf/elf.c b/modules/objfmts/elf/elf.c
+index 2486bba8..bab4c9ca 100644
+--- a/modules/objfmts/elf/elf.c
++++ b/modules/objfmts/elf/elf.c
+@@ -482,15 +482,15 @@ elf_symtab_write_to_file(FILE *f, elf_symtab_head *symtab,
+
+         /* get size (if specified); expr overrides stored integer */
+         if (entry->xsize) {
+-            size_intn = yasm_intnum_copy(
+-                yasm_expr_get_intnum(&entry->xsize, 1));
+-            if (!size_intn) {
++            yasm_intnum *intn = yasm_expr_get_intnum(&entry->xsize, 1);
++            if (!intn) {
+                 yasm_error_set(YASM_ERROR_VALUE,
+                                N_("size specifier not an integer expression"));
+                 yasm_errwarn_propagate(errwarns, entry->xsize->line);
+-            }
++            } else
++                size_intn = yasm_intnum_copy(intn);
+         }
+-        else
++        if (!size_intn)
+             size_intn = yasm_intnum_create_uint(entry->size);
+
+         /* get EQU value for constants */
+--
+2.40.0
diff --git a/meta-oe/recipes-devtools/yasm/yasm_git.bb b/meta-oe/recipes-devtools/yasm/yasm_git.bb
index 19686ff27..26540b429 100644
--- a/meta-oe/recipes-devtools/yasm/yasm_git.bb
+++ b/meta-oe/recipes-devtools/yasm/yasm_git.bb
@@ -13,6 +13,7 @@ SRCREV = "ba463d3c26c0ece2e797b8d6381b161633b5971a"
 SRC_URI = "git://github.com/yasm/yasm.git;branch=master;protocol=https \
            file://0001-Do-not-use-AC_HEADER_STDC.patch \
            file://CVE-2023-31975.patch \
+           file://CVE-2023-37732.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.40.0


