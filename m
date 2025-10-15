Return-Path: <praveen.kumar@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFC12CCD193
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 11:59:52 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.14429.1760529588574221394
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Oct 2025 04:59:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=qxazfn1W;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=23839a5c94=praveen.kumar@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59F59N03201700
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Oct 2025 04:59:48 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=F0hjUNeznEgNvzFUuwB0
	vUU8c5wSCTO4h0ePALt9bqI=; b=qxazfn1WilKDV7JQT2fZedeWdjV1uEBak/Cn
	cvU1KXQ5j66bGyMW207QHPe3Y1QfUcDdO76B/GiMB9S0w0Ka+yTb9NnwJi09LqAZ
	YsVSuYYl4J0ibhdgS4Nop30N4a8MMciqR6LPhdmAYu7/odcQ4I4sMWJcPtnVzvHh
	sJ8jh5V7nUly3a6FvjFJggq0CEpzCcaS2aNp8J/E6ypXv0oFJ1x3aQrexJ31Lh8D
	XM9uBvbDEa3P/C2oheMXKwsEoa/2Mx51XwJaqXXz+H77+5GrJuV3W8z1S9wla6bz
	/uorTAt/uZ2mFN/E5Vs7cd2SKoUUvVDC0ji0oxbOFLT7NFFvCA==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49qprdvhpq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Oct 2025 04:59:48 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Wed, 15 Oct 2025 04:59:47 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Wed, 15 Oct 2025 04:59:46 -0700
From: <praveen.kumar@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][scarthgap][PATCH 1/1] yasm: fix CVE-2024-22653
Date: Wed, 15 Oct 2025 17:29:42 +0530
Message-ID: <20251015115942.2061723-1-praveen.kumar@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE1MDA5MyBTYWx0ZWRfXzvmClPk2PC+I
 sY1RAfaCH25yK5eG3sxpmH7opwf+JMMHkM88jN+7P1E3WohB1RQlDa9LOxo1bj2vCA938ulJibK
 jG11UG8IJ0o4EYIwCGSl8onEY2648icdkr9qgZWxBtonn/GFgl0d0SbKyggC3J7rFt9XpOMpLz/
 VPZwMk+jMX0FNMHempOO8EHT1sVeFVcQK3ytpsi1fzPICSNmPZRW1KQt5+pmbQo5WEdsIEvMYUD
 +9FzOpOvMsSkB52duxTqPAYpzPEEBddu1fs09AY22rwaMKMtX6okSpVwxRFpYDJXJjBMTwiNXLM
 KN3N/mT9myLNl2ZAuoFZthMAzwD5eJQVTFMVXxX1rrse3LHei5814U9BDYvk/QU+TeuZSyT/qpv
 0X1EjMsvsm+PBtxRlfVJAv3WQZjm6A==
X-Proofpoint-GUID: hszgoIqTzsbdiQQc20-uiqpdKh-JuRH1
X-Authority-Analysis: v=2.4 cv=JaKxbEKV c=1 sm=1 tr=0 ts=68ef8cb4 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=8BzczKt8Np9Ig-cRJ64A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: hszgoIqTzsbdiQQc20-uiqpdKh-JuRH1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510150093
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Oct 2025 11:59:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120708

From: Praveen Kumar <praveen.kumar@windriver.com>

yasm commit 9defefae was discovered to contain a NULL pointer
dereference via the yasm_section_bcs_append function at section.c.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2024-22653

Upstream-patch:
https://github.com/yasm/yasm/commit/121ab150b3577b666c79a79f4a511798d7ad2432

Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
---
 .../yasm/yasm/CVE-2024-22653.patch            | 32 +++++++++++++++++++
 meta-oe/recipes-devtools/yasm/yasm_git.bb     |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/yasm/yasm/CVE-2024-22653.patch

diff --git a/meta-oe/recipes-devtools/yasm/yasm/CVE-2024-22653.patch b/meta-oe/recipes-devtools/yasm/yasm/CVE-2024-22653.patch
new file mode 100644
index 0000000000..dbbd4b94ef
--- /dev/null
+++ b/meta-oe/recipes-devtools/yasm/yasm/CVE-2024-22653.patch
@@ -0,0 +1,32 @@
+From 121ab150b3577b666c79a79f4a511798d7ad2432 Mon Sep 17 00:00:00 2001
+From: haruki3hhh <135201297+haruki3hhh@users.noreply.github.com>
+Date: Mon, 24 Jun 2024 18:08:27 -0500
+Subject: [PATCH] Fix null pointer dereference in yasm_section_bcs_append
+ (#263)
+
+CVE: CVE-2024-22653
+
+Upstream-Status: Backport [https://github.com/yasm/yasm/commit/121ab150b3577b666c79a79f4a511798d7ad2432]
+
+Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
+---
+ libyasm/section.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/libyasm/section.c b/libyasm/section.c
+index ba582bfa..1c1ba710 100644
+--- a/libyasm/section.c
++++ b/libyasm/section.c
+@@ -611,6 +611,10 @@ yasm_bytecode *
+ yasm_section_bcs_append(yasm_section *sect, yasm_bytecode *bc)
+ {
+     if (bc) {
++        if (!sect) {
++            yasm_error_set(YASM_ERROR_VALUE, "Attempt to append bytecode to a NULL section or with a NULL bytecode");
++            return NULL;
++        }
+         if (bc->callback) {
+             bc->section = sect;     /* record parent section */
+             STAILQ_INSERT_TAIL(&sect->bcs, bc, link);
+--
+2.40.0
diff --git a/meta-oe/recipes-devtools/yasm/yasm_git.bb b/meta-oe/recipes-devtools/yasm/yasm_git.bb
index 216b777667..99717d3a32 100644
--- a/meta-oe/recipes-devtools/yasm/yasm_git.bb
+++ b/meta-oe/recipes-devtools/yasm/yasm_git.bb
@@ -16,6 +16,7 @@ SRC_URI = "git://github.com/yasm/yasm.git;branch=master;protocol=https \
            file://CVE-2023-37732.patch \
            file://0001-yasm-Set-build-date-to-SOURCE_DATE_EPOCH.patch \
            file://0002-yasm-Use-BUILD_DATE-for-reproducibility.patch \
+           file://CVE-2024-22653.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.40.0


