Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76DABC3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 06:00:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.27976.1744264801456138370
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Apr 2025 23:00:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6195bc5e25=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A4SG1M024240
	for <openembedded-devel@lists.openembedded.org>; Wed, 9 Apr 2025 23:00:01 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45u41m605q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 09 Apr 2025 23:00:00 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 9 Apr 2025 23:00:00 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 9 Apr 2025 22:59:59 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [RFC][meta-oe][PATCH] pmtools: remove recipes
Date: Thu, 10 Apr 2025 13:59:58 +0800
Message-ID: <20250410055958.2998865-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: qcQv-4VGHTbP_ul8nusw27hoy0WCEAjc
X-Proofpoint-ORIG-GUID: qcQv-4VGHTbP_ul8nusw27hoy0WCEAjc
X-Authority-Analysis: v=2.4 cv=QOZoRhLL c=1 sm=1 tr=0 ts=67f75e60 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=8VcNbOb3AAAA:8 a=t7CeM3EgAAAA:8 a=Idv7_g-a3qBNtPP9LhAA:9 a=vUE3dsxbq4Gz4ul3qoxY:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 bulkscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 spamscore=0 mlxscore=0
 malwarescore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504100043
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Apr 2025 06:00:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116760

From: Changqing Li <changqing.li@windriver.com>

Remove this not maintained recipe. The latest commit of pmtools is 12
years ago. And it generates 3 binaries: acpidump/acpixtract/madt, but
there is a recipe acpica in oe-core provides acpidump/acpixtract, and
according to README.madt, it is hacked out from Linux kernel, if someone
requests it, mayb user can add one recipe similar like turbostat.

[1] https://github.com/anyc/pmtools/tree/master

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../packagegroups/packagegroup-meta-oe.bb     |  4 +-
 ...o-dynamic-buffer-for-huge-ACPI-table.patch | 82 -------------------
 .../recipes-devtools/pmtools/pmtools_git.bb   | 34 --------
 3 files changed, 2 insertions(+), 118 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/pmtools/pmtools/pmtools-switch-to-dynamic-buffer-for-huge-ACPI-table.patch
 delete mode 100644 meta-oe/recipes-devtools/pmtools/pmtools_git.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index ebb0f0f810..d3d2f05c47 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -294,8 +294,8 @@ RDEPENDS:packagegroup-meta-oe-devtools = "\
     yajl \
     yasm \
 "
-RDEPENDS:packagegroup-meta-oe-devtools:append:x86 = " cpuid msr-tools pahole pmtools"
-RDEPENDS:packagegroup-meta-oe-devtools:append:x86-64 = " cpuid msr-tools pahole pcimem pmtools"
+RDEPENDS:packagegroup-meta-oe-devtools:append:x86 = " cpuid msr-tools pahole"
+RDEPENDS:packagegroup-meta-oe-devtools:append:x86-64 = " cpuid msr-tools pahole pcimem"
 RDEPENDS:packagegroup-meta-oe-devtools:append:riscv64 = " pcimem"
 RDEPENDS:packagegroup-meta-oe-devtools:append:arm = " pcimem"
 RDEPENDS:packagegroup-meta-oe-devtools:append:aarch64 = " pahole pcimem"
diff --git a/meta-oe/recipes-devtools/pmtools/pmtools/pmtools-switch-to-dynamic-buffer-for-huge-ACPI-table.patch b/meta-oe/recipes-devtools/pmtools/pmtools/pmtools-switch-to-dynamic-buffer-for-huge-ACPI-table.patch
deleted file mode 100644
index 3be18986fc..0000000000
--- a/meta-oe/recipes-devtools/pmtools/pmtools/pmtools-switch-to-dynamic-buffer-for-huge-ACPI-table.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-From 03a886252f6555d6b0af76b654e76459642b89da Mon Sep 17 00:00:00 2001
-From: Yunguo Wei <yunguo.wei@windriver.com>
-Date: Tue, 3 Dec 2013 18:12:50 +0800
-Subject: [PATCH] pmtools: switch to dynamic buffer for huge ACPI tables
-
-For servers like Canoe Pass or Thunder Ridge, there are much more
-entries in ACPI table, so original 1K buffer is insufficient.
-
-We switch to dynamic buffer on this situation.
-
-Signed-off-by: Yunguo Wei <yunguo.wei@windriver.com>
-
-
-Upstream-Status: Pending
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
- madt/madt.c | 18 +++++++++++++++++-
- 1 file changed, 17 insertions(+), 1 deletion(-)
-
---- a/madt/madt.c
-+++ b/madt/madt.c
-@@ -34,14 +34,16 @@ typedef unsigned long long u64;
- //#include <sys/mman.h>
- #include <stdio.h> // fread
- #include <stdlib.h> // malloc
-+#include <string.h> // memset/memcpy
- 
- #include "./tables.c"
- 
- int verbose = 0;
- /*
--/* read standard input
-+ * read standard input
-  * write decoded madt to standard output
-  */
-+size_t
- get_next_entry(acpi_table_entry_header * entry_header)
- {
- 	size_t retval;
-@@ -51,9 +53,11 @@ get_next_entry(acpi_table_entry_header *
- 	return retval;
- }
- 
--u8	buffer[1024];
- 
--main()
-+u8	buf[1024];
-+u8	*buffer = buf;
-+int
-+main(int argc, char *argv[])
- {
- 	size_t retval;
- 	struct acpi_table_madt *madt_header;
-@@ -75,6 +79,17 @@ main()
- 
- 	if (verbose) printf("header.length %d\n", madt_header->header.length);
- 
-+	/* if 1K buffer is insufficient for acpi table, switch to a larger memory buffer */
-+	if(expected_length > sizeof(buf)) {
-+		buffer = malloc(expected_length);
-+		if (!buffer) {
-+			perror("malloc");
-+			exit(1);
-+		}
-+		memset(buffer, 0, expected_length);
-+		memcpy(buffer, buf, sizeof(struct acpi_table_madt));
-+	}
-+
- 	acpi_table_print((void*)&(buffer[bytes_read]), 0);
- 
- 	bytes_read = sizeof(struct acpi_table_madt);
-@@ -118,6 +133,9 @@ done:
- 		printf("Checksum 0x%x != 0; 0x%x in header ERROR\n", csum,
- 			 madt_header->header.checksum);
- 
-+	if(buffer != buf)
-+		free(buffer);
-+
- 	return 0;
- }
- 
diff --git a/meta-oe/recipes-devtools/pmtools/pmtools_git.bb b/meta-oe/recipes-devtools/pmtools/pmtools_git.bb
deleted file mode 100644
index ad149de12c..0000000000
--- a/meta-oe/recipes-devtools/pmtools/pmtools_git.bb
+++ /dev/null
@@ -1,34 +0,0 @@
-DESCRIPTION = "This is a small collection of power management \
-    test and investigation tools"
-HOMEPAGE = "http://lesswatts.org/projects/acpi"
-LICENSE = "GPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
-
-PV = "20130209+git"
-
-SRC_URI = "git://github.com/anyc/pmtools.git;branch=master;protocol=https \
-    file://pmtools-switch-to-dynamic-buffer-for-huge-ACPI-table.patch \
-"
-SRCREV = "3ebe0e54c54061b4c627236cbe35d820de2e1168"
-
-COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
-
-S = "${WORKDIR}/git"
-
-inherit update-alternatives
-
-ALTERNATIVE_PRIORITY = "90"
-ALTERNATIVE:${PN} = "acpixtract acpidump"
-
-do_configure[noexec] = "1"
-do_compile() {
-    oe_runmake
-}
-
-do_install() {
-    install -d ${D}${bindir} ${D}${docdir}
-    install -m 755 ${S}/acpidump/acpidump ${D}${bindir}
-    install -m 755 ${S}/acpixtract/acpixtract ${D}${bindir}
-    install -m 755 ${S}/madt/madt ${D}${bindir}
-    install -m 644 ${S}/README ${D}${docdir}
-}
-- 
2.34.1


