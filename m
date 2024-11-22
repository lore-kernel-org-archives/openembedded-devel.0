Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27C26E65D3F
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 09:39:35 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.20900.1732268364939897501
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Nov 2024 01:39:24 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=105629bf38=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AM7BFdp014924
	for <openembedded-devel@lists.openembedded.org>; Fri, 22 Nov 2024 01:39:24 -0800
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42xusq6fmu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 22 Nov 2024 01:39:24 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 22 Nov 2024 01:39:23 -0800
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Fri, 22 Nov 2024 01:39:23 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-filesystems][kirkstone][PATCH] ntfs-3g-ntfsprogs: fix CVE-2023-52890
Date: Fri, 22 Nov 2024 17:39:22 +0800
Message-ID: <20241122093922.1679720-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: d38eso5vtpbqi1hCG_f2rhzSLmI2gAUX
X-Proofpoint-ORIG-GUID: d38eso5vtpbqi1hCG_f2rhzSLmI2gAUX
X-Authority-Analysis: v=2.4 cv=d9mnygjE c=1 sm=1 tr=0 ts=6740514c cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=Wsehx78zoTQA:10 a=VlfZXiiP6vEA:10 a=NEAV23lmAAAA:8 a=3DfWnJiXAAAA:8 a=t7CeM3EgAAAA:8 a=AG2HToKGovS5UrDgRsIA:9
 a=fbZbCd7XTi_oNd1tYRxB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-22_04,2024-11-21_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 impostorscore=0
 phishscore=0 clxscore=1015 malwarescore=0 mlxlogscore=999 spamscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411220081
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Nov 2024 09:39:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113994

Backport fix from upstream

  https://github.com/tuxera/ntfs-3g/commit/75dcdc2cf37478fad6c0e3427403d198b554951d

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...use-after-free-in-ntfs_uppercase_mbs.patch | 42 +++++++++++++++++++
 .../ntfs-3g-ntfsprogs_2022.10.3.bb            |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/0001-unistr.c-Fix-use-after-free-in-ntfs_uppercase_mbs.patch

diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/0001-unistr.c-Fix-use-after-free-in-ntfs_uppercase_mbs.patch b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/0001-unistr.c-Fix-use-after-free-in-ntfs_uppercase_mbs.patch
new file mode 100644
index 0000000000..3160f56880
--- /dev/null
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/0001-unistr.c-Fix-use-after-free-in-ntfs_uppercase_mbs.patch
@@ -0,0 +1,42 @@
+From 7b6210c5be46e5120b42c09f910e8f104bf3edf1 Mon Sep 17 00:00:00 2001
+From: Erik Larsson <erik@tuxera.com>
+Date: Tue, 13 Jun 2023 17:47:15 +0300
+Subject: [PATCH] unistr.c: Fix use-after-free in 'ntfs_uppercase_mbs'.
+
+If 'utf8_to_unicode' throws an error due to an invalid UTF-8 sequence,
+then 'n' will be less than 0 and the loop will terminate without storing
+anything in '*t'. After the loop the uppercase string's allocation is
+freed, however after it is freed it is unconditionally accessed through
+'*t', which points into the freed allocation, for the purpose of NULL-
+terminating the string. This leads to a use-after-free.
+Fixed by only NULL-terminating the string when no error has been thrown.
+
+Thanks for Jeffrey Bencteux for reporting this issue:
+https://github.com/tuxera/ntfs-3g/issues/84
+
+Upstream-Status: Backport [https://github.com/tuxera/ntfs-3g/commit/75dcdc2cf37478fad6c0e3427403d198b554951d]
+CVE: CVE-2023-52890
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
+---
+ libntfs-3g/unistr.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/libntfs-3g/unistr.c b/libntfs-3g/unistr.c
+index 5854b3b..db8ddf4 100644
+--- a/libntfs-3g/unistr.c
++++ b/libntfs-3g/unistr.c
+@@ -1189,8 +1189,9 @@ char *ntfs_uppercase_mbs(const char *low,
+ 			free(upp);
+ 			upp = (char*)NULL;
+ 			errno = EILSEQ;
++		} else {
++			*t = 0;
+ 		}
+-		*t = 0;
+ 	}
+ 	return (upp);
+ }
+-- 
+2.34.1
+
diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
index 37a8106bb0..be2a5245ce 100644
--- a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 
 SRC_URI = "http://tuxera.com/opensource/ntfs-3g_ntfsprogs-${PV}.tgz \
            file://0001-libntfs-3g-Makefile.am-fix-install-failed-while-host.patch \
+           file://0001-unistr.c-Fix-use-after-free-in-ntfs_uppercase_mbs.patch \
 "
 S = "${WORKDIR}/ntfs-3g_ntfsprogs-${PV}"
 SRC_URI[sha256sum] = "f20e36ee68074b845e3629e6bced4706ad053804cbaf062fbae60738f854170c"
-- 
2.34.1


