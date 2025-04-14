Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68119C369B5
	for <webhook@archiver.kernel.org>; Mon, 14 Apr 2025 08:27:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.45139.1744619245903611074
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Apr 2025 01:27:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=61995c6f5e=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E6Hvuf015006
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Apr 2025 08:27:25 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45ydd1htrj-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Apr 2025 08:27:24 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 14 Apr 2025 01:27:24 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Mon, 14 Apr 2025 01:27:23 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH 6/6] turbostat: make turbostat's version align with kernel version
Date: Mon, 14 Apr 2025 16:27:17 +0800
Message-ID: <20250414082717.2827252-6-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250414082717.2827252-1-changqing.li@windriver.com>
References: <20250414082717.2827252-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Vt56vt39an3D1kEM9okerTBIp3XoC6Oa
X-Proofpoint-GUID: Vt56vt39an3D1kEM9okerTBIp3XoC6Oa
X-Authority-Analysis: v=2.4 cv=HecUTjE8 c=1 sm=1 tr=0 ts=67fcc6ed cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=XR8D0OoHHMoA:10 a=t7CeM3EgAAAA:8 a=VwQbUJbxAAAA:8 a=nFQ5QokXK9j3b4tVEI8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_02,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504140060
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Apr 2025 08:27:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116850

From: Changqing Li <changqing.li@windriver.com>

* Current PV 3.4 is the kernel version when the recipe is newly added,
set PKGV to KERNEL_VERSION to make it always align with kernel version
* turbostat has its runtime version, set CHECK_VERSION_PV to this version to mute
the version mismatch warning
[snip of turbostat.c]
void print_version()
{
    fprintf(outf, "turbostat version 2024.07.26 - Len Brown <lenb@kernel.org>\n");
}
[snip]

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-oe/conf/version-check.conf                            | 1 +
 .../turbostat/{turbostat_3.4.bb => turbostat.bb}           | 7 +++++++
 2 files changed, 8 insertions(+)
 rename meta-oe/recipes-kernel/turbostat/{turbostat_3.4.bb => turbostat.bb} (94%)

diff --git a/meta-oe/conf/version-check.conf b/meta-oe/conf/version-check.conf
index ecc8802565..7193ece705 100644
--- a/meta-oe/conf/version-check.conf
+++ b/meta-oe/conf/version-check.conf
@@ -22,3 +22,4 @@ CHECK_VERSION_PV:pn-luajit = "${PV}.%"
 CHECK_VERSION_PV:pn-sg3-utils = "%"
 CHECK_VERSION_PV:pn-netperf = "2.7.%"
 CHECK_VERSION_PV:pn-bridge-utils = "1.7%"
+CHECK_VERSION_PV:pn-turbostat = "2024.07.26"
diff --git a/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb b/meta-oe/recipes-kernel/turbostat/turbostat.bb
similarity index 94%
rename from meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb
rename to meta-oe/recipes-kernel/turbostat/turbostat.bb
index cfe3bb9682..8ac15164d4 100644
--- a/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb
+++ b/meta-oe/recipes-kernel/turbostat/turbostat.bb
@@ -16,6 +16,9 @@ LIC_FILES_CHKSUM = "file://${UNPACKDIR}/COPYING;md5=bbea815ee2795b2f4230826c0c6b
 COMPATIBLE_HOST = '(x86_64.*|i.86.*)-linux'
 COMPATIBLE_HOST:libc-musl = "null"
 
+KERNEL_VERSION = "${@get_kernelversion_file("${STAGING_KERNEL_BUILDDIR}")}"
+inherit linux-kernel-base
+
 SRC_URI += "\
             file://COPYING \
             "
@@ -91,3 +94,7 @@ do_compile() {
 do_install() {
 	oe_runmake DESTDIR="${D}" install
 }
+
+python do_package:prepend() {
+    d.setVar('PKGV', d.getVar("KERNEL_VERSION").split("-")[0])
+}
-- 
2.34.1


