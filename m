Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07D97C3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 04:24:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.26854.1744259081852748158
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Apr 2025 21:24:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6195bc5e25=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A4JV3O010549
	for <openembedded-devel@lists.openembedded.org>; Wed, 9 Apr 2025 21:24:41 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45u41m5wm7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 09 Apr 2025 21:24:41 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 9 Apr 2025 21:24:40 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 9 Apr 2025 21:24:39 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] libbpf: fix a segmentation fault error
Date: Thu, 10 Apr 2025 12:24:38 +0800
Message-ID: <20250410042438.2515750-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: cWZQKPJniMjA5c7BIOojeYMH4c-WWuyo
X-Proofpoint-ORIG-GUID: cWZQKPJniMjA5c7BIOojeYMH4c-WWuyo
X-Authority-Analysis: v=2.4 cv=QOZoRhLL c=1 sm=1 tr=0 ts=67f74809 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=eOtLe3MN7_UNAaeMa0wA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 bulkscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 spamscore=0 mlxscore=0
 malwarescore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504100031
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Apr 2025 04:24:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116752

From: Changqing Li <changqing.li@windriver.com>

A valid ELF file may contain a SHT_NOBITS .BTF section. This case is not
handled correctly in btf_parse_elf, which leads to a segfault.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...-empty-BTF-data-section-in-btf_parse.patch | 43 +++++++++++++++++++
 meta-oe/recipes-kernel/libbpf/libbpf_1.5.0.bb |  4 +-
 2 files changed, 46 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-kernel/libbpf/files/0001-libbpf-check-for-empty-BTF-data-section-in-btf_parse.patch

diff --git a/meta-oe/recipes-kernel/libbpf/files/0001-libbpf-check-for-empty-BTF-data-section-in-btf_parse.patch b/meta-oe/recipes-kernel/libbpf/files/0001-libbpf-check-for-empty-BTF-data-section-in-btf_parse.patch
new file mode 100644
index 0000000000..873995b644
--- /dev/null
+++ b/meta-oe/recipes-kernel/libbpf/files/0001-libbpf-check-for-empty-BTF-data-section-in-btf_parse.patch
@@ -0,0 +1,43 @@
+From ff2eb6e134ebfc225b97b46182af3cc58ed481f6 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 10 Apr 2025 11:50:04 +0800
+Subject: [PATCH] libbpf: check for empty BTF data section in btf_parse_elf
+
+A valid ELF file may contain a SHT_NOBITS .BTF section. This case is
+not handled correctly in btf_parse_elf, which leads to a segfault.
+
+Add a null check for a buffer returned by elf_getdata() before
+proceeding with its processing.
+
+Bug report: https://github.com/libbpf/libbpf/issues/894
+
+Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
+Acked-by: Mykyta Yatsenko <mykyta.yatsenko5@gmail.com>
+
+Upstream-Status: Backport [https://github.com/kernel-patches/bpf-rc/commit/b02b669fd9398d246c8c9ae901c0d8f5bb36a588]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ btf.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/btf.c b/btf.c
+index e9673c0e..21d38dcf 100644
+--- a/btf.c
++++ b/btf.c
+@@ -1199,6 +1199,12 @@ static struct btf *btf_parse_elf(const char *path, struct btf *base_btf,
+ 		goto done;
+ 	}
+ 
++	if (!secs.btf_data->d_buf) {
++		pr_warn("BTF data is empty in %s\n", path);
++		err = -ENODATA;
++		goto done;
++	}
++
+ 	if (secs.btf_base_data) {
+ 		dist_base_btf = btf_new(secs.btf_base_data->d_buf, secs.btf_base_data->d_size,
+ 					NULL);
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-kernel/libbpf/libbpf_1.5.0.bb b/meta-oe/recipes-kernel/libbpf/libbpf_1.5.0.bb
index 5f92939274..58bb7bca09 100644
--- a/meta-oe/recipes-kernel/libbpf/libbpf_1.5.0.bb
+++ b/meta-oe/recipes-kernel/libbpf/libbpf_1.5.0.bb
@@ -8,7 +8,9 @@ LIC_FILES_CHKSUM = "file://../LICENSE.LGPL-2.1;md5=b370887980db5dd40659b50909238
 
 DEPENDS = "zlib elfutils"
 
-SRC_URI = "git://github.com/libbpf/libbpf.git;protocol=https;branch=master"
+SRC_URI = "git://github.com/libbpf/libbpf.git;protocol=https;branch=master \
+           file://0001-libbpf-check-for-empty-BTF-data-section-in-btf_parse.patch \
+"
 SRCREV = "09b9e83102eb8ab9e540d36b4559c55f3bcdb95d"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
2.34.1


