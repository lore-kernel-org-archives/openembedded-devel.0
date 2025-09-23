Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B62FCAC5A7
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 06:14:49 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.10382.1758608087753355245
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Sep 2025 23:14:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=XI/cSmf+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1361603e9f=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58N3e2b82509940
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Sep 2025 23:14:47 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=zSgWQrau7/JT4JidTcP4
	ihqzHruaRC2qcBqV3LxwwQY=; b=XI/cSmf+802e9HvF61bLSyo1gnmAf6i25fkD
	fK+LpSzzt41EPec0NVWiwZO+3dQTnl+hmYq15iBuIAYtXR6LZK2ahXTwy5gIyk2l
	SVDK1+mFpIhBoLDyuEOHFk5d2DiVohsxvc78DtsnBudphj9MkPEozRZ0RxZdXx7q
	C8SpnsRH/6eRRlAdpScg1BCqwJVJTEM+7AlI9+AIvHIxcL+FoePstjtgwrgpd2ZG
	rLrvHEp/WUdE5bawbgxs3dltK92eUJR1ULarMdc96czVhjGfaUuDPOZI79JzL8bm
	wmMztIN+wL9SK0NRL8Fq3wt/GGF5oc0OhQyVMqyc4ak5nije2w==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 499qj2tk6k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Sep 2025 23:14:46 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Mon, 22 Sep 2025 23:14:46 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Mon, 22 Sep 2025 23:14:45 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-python][scarthgap][PATCH 1/1] python3-twisted: Fix CVE-2024-41810
Date: Tue, 23 Sep 2025 11:44:26 +0530
Message-ID: <20250923061426.3997604-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDA1NiBTYWx0ZWRfXzAj+YLQSWei8
 t0EzIQs4yNLplFJVowKjfzld9F5rWfpRG1uczzvYtfTSBLbjFbjARypba/UkdgKYdRyw4ARNjmd
 sc+KYfVXMDsMtIHTqM+kRm6jUQ7WxiFRhueCNzT8J9C1/4bwmXmNDwIN15umwEVmouoYkPD7Jep
 RCPV3EUUO+dMmGPu9uie6y0hA6HDAHb7sXUsEyU6XHAs72OnaPg5tSM0B+8hHerupQUxCtVotX1
 TsC02nGhh2G4MXTXaAP85bchNVkmh6JP096ra1+WL8O+HjeeP/KONKRkS4iEz0UDWIyWLgFHgiZ
 1fayD9ttBEFwrFI3MwoRvl8kTvnfmHEJzIWxwn0uNuyjT6vKeuFll4pi8CVqig=
X-Authority-Analysis: v=2.4 cv=btpMBFai c=1 sm=1 tr=0 ts=68d23ad7 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=q7AoBUq9l0gA:10 a=yJojWOMRYYMA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=Xk6knvOzKn4ZROvoSXoA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 5sSC1cQRm_rYf5DxYWGkcoO-XFfM0xNP
X-Proofpoint-ORIG-GUID: 5sSC1cQRm_rYf5DxYWGkcoO-XFfM0xNP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_01,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 phishscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 06:14:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119648

From: Soumya Sambu <soumya.sambu@windriver.com>

Twisted is an event-based framework for internet applications, supporting Python 3.6+.
The `twisted.web.util.redirectTo` function contains an HTML injection vulnerability.
If application code allows an attacker to control the redirect URL this vulnerability
may result in Reflected Cross-Site Scripting (XSS) in the redirect response HTML body.
This vulnerability is fixed in 24.7.0rc1.

Split fix for CVE-2024-41810 from CVE-2024-41671-0001.patch to improve CVE
traceability.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2024-41810

Upstream patch:
https://github.com/twisted/twisted/commit/046a164f89a0f08d3239ecebd750360f8914df33

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../{CVE-2024-41671-0002.patch => CVE-2024-41671.patch}       | 0
 .../{CVE-2024-41671-0001.patch => CVE-2024-41810.patch}       | 2 +-
 meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb | 4 ++--
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/python3-twisted/{CVE-2024-41671-0002.patch => CVE-2024-41671.patch} (100%)
 rename meta-python/recipes-devtools/python/python3-twisted/{CVE-2024-41671-0001.patch => CVE-2024-41810.patch} (99%)

diff --git a/meta-python/recipes-devtools/python/python3-twisted/CVE-2024-41671-0002.patch b/meta-python/recipes-devtools/python/python3-twisted/CVE-2024-41671.patch
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-twisted/CVE-2024-41671-0002.patch
rename to meta-python/recipes-devtools/python/python3-twisted/CVE-2024-41671.patch
diff --git a/meta-python/recipes-devtools/python/python3-twisted/CVE-2024-41671-0001.patch b/meta-python/recipes-devtools/python/python3-twisted/CVE-2024-41810.patch
similarity index 99%
rename from meta-python/recipes-devtools/python/python3-twisted/CVE-2024-41671-0001.patch
rename to meta-python/recipes-devtools/python/python3-twisted/CVE-2024-41810.patch
index 1f6bf6bbfc..023ebc3640 100644
--- a/meta-python/recipes-devtools/python/python3-twisted/CVE-2024-41671-0001.patch
+++ b/meta-python/recipes-devtools/python/python3-twisted/CVE-2024-41810.patch
@@ -5,7 +5,7 @@ Subject: [PATCH] Merge commit from fork
 
 Added HTML output encoding the "URL" parameter of the "redirectTo" function
 
-CVE: CVE-2024-41671
+CVE: CVE-2024-41810
 
 Upstream-Status: Backport [https://github.com/twisted/twisted/commit/046a164f89a0f08d3239ecebd750360f8914df33]
 
diff --git a/meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb b/meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb
index 272aecb8b0..deb7fd6321 100644
--- a/meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb
@@ -7,8 +7,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c1c5d2c2493b848f83864bdedd67bbf5"
 
 SRC_URI += " \
-    file://CVE-2024-41671-0001.patch \
-    file://CVE-2024-41671-0002.patch \
+    file://CVE-2024-41810.patch \
+    file://CVE-2024-41671.patch \
 "
 
 SRC_URI[sha256sum] = "6b38b6ece7296b5e122c9eb17da2eeab3d98a198f50ca9efd00fb03e5b4fd4ae"
-- 
2.40.0


