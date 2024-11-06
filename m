Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3824FD29FB8
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 07:55:05 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.40843.1730879699253122657
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 23:54:59 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1040bdf8e9=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A65U1Aj024487
	for <openembedded-devel@lists.openembedded.org>; Wed, 6 Nov 2024 07:54:58 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42nb28c46j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 06 Nov 2024 07:54:58 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 5 Nov 2024 23:54:57 -0800
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Tue, 5 Nov 2024 23:54:56 -0800
From: <jiaying.song.cn@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <changqing.li@windriver.com>
Subject: [meta-networking][scarthgap][PATCH] tcpreplay: fix CVE-2023-43279
Date: Wed, 6 Nov 2024 16:52:32 +0800
Message-ID: <20241106085232.2760825-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=CfNa56rl c=1 sm=1 tr=0 ts=672b20d2 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=VlfZXiiP6vEA:10 a=t7CeM3EgAAAA:8 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=ZxhBd3u3P7EdYXRbN_AA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 6vuD6jm2sKQvwWH8jGE6b0nQncVRMG0f
X-Proofpoint-GUID: 6vuD6jm2sKQvwWH8jGE6b0nQncVRMG0f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-06_03,2024-11-05_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=999
 spamscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 phishscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411060063
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Nov 2024 07:55:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113733

From: Jiaying Song <jiaying.song.cn@windriver.com>

Null Pointer Dereference in mask_cidr6 component at cidr.c in Tcpreplay
4.4.4 allows attackers to crash the application via crafted tcprewrite
command.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-43279

Upstream patches:
https://github.com/appneta/tcpreplay/pull/860/commits/963842ceca79e97ac3242448a0de94fb901d3560

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 .../tcpreplay/tcpreplay/CVE-2023-43279.patch  | 39 +++++++++++++++++++
 .../tcpreplay/tcpreplay_4.4.4.bb              |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2023-43279.patch

diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2023-43279.patch b/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2023-43279.patch
new file mode 100644
index 000000000..45581268c
--- /dev/null
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2023-43279.patch
@@ -0,0 +1,39 @@
+From 3164a75f2660a5c3537feff9fd8751346cf5ca57 Mon Sep 17 00:00:00 2001
+From: Gabriel Ganne <gabriel.ganne@gmail.com>
+Date: Sun, 21 Jan 2024 09:16:38 +0100
+Subject: [PATCH] add check for empty cidr
+
+This causes tcprewrite to exit with an error instead of crashing.
+
+Fixes: #824
+
+Upstream-Status: Backport
+CVE: CVE-2023-43279
+
+Reference to upstream patch:
+https://github.com/appneta/tcpreplay/pull/860/commits/963842ceca79e97ac3242448a0de94fb901d3560
+
+Signed-off-by: Gabriel Ganne <gabriel.ganne@gmail.com>
+Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
+---
+ src/common/cidr.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/common/cidr.c b/src/common/cidr.c
+index 687fd04..9afbfec 100644
+--- a/src/common/cidr.c
++++ b/src/common/cidr.c
+@@ -249,6 +249,10 @@ parse_cidr(tcpr_cidr_t **cidrdata, char *cidrin, char *delim)
+     char *network;
+     char *token = NULL;
+ 
++    if (cidrin == NULL) {
++        errx(-1, "%s", "Unable to parse empty CIDR");
++    }
++
+     mask_cidr6(&cidrin, delim);
+ 
+     /* first iteration of input using strtok */
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb
index 16cff2f0e..03a6cfdba 100644
--- a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb
@@ -12,6 +12,7 @@ SRC_URI = "https://github.com/appneta/${BPN}/releases/download/v${PV}/${BP}.tar.
     file://0001-configure.ac-unify-search-dirs-for-pcap-and-add-lib3.patch \
     file://0001-configure.ac-do-not-run-conftest-in-case-of-cross-co.patch \
     file://CVE-2023-4256.patch \
+    file://CVE-2023-43279.patch \
 "
 
 SRC_URI[sha256sum] = "44f18fb6d3470ecaf77a51b901a119dae16da5be4d4140ffbb2785e37ad6d4bf"
-- 
2.25.1


