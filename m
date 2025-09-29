Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FB21CAC5B0
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 04:57:42 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.46696.1759121852311499591
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Sep 2025 21:57:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=BaVp/7uC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=23678fb0cf=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58T3rYhI182106
	for <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 04:57:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=zSgWQrau7/JT4JidTcP4
	ihqzHruaRC2qcBqV3LxwwQY=; b=BaVp/7uC+LH5qOj8DQfUDo/d5lWHh3b6cV77
	qo9QT1bbj/AGfzs8K+lcI1dJlChMF2XaZ8GPr52kjd+zBpFz0xG5+fRi+rezMMA/
	9YpLZdf3GK5yWf9qW1Ub3/JZz9zftifPHbwLE7zwm0+lG6uNMQnp6Tutpt9TKIOw
	OZhYVWp1LcGXiGB1vyvkOwzk/0/19QoyMJOaN/C1AJpSMV+p6YByqowqOIXdhpnS
	KeXsN1gJvMe7M6t4Owoq+/wBRQaqPjkqFBM+aXt9d815yrJdbuA4qh48kCuIYPhg
	wJWJivIqxVd0AqkIwx5XIimqGoT6/wdr0od/WpyOhydLMo/fqQ==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49e54wskk7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 04:57:31 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Sun, 28 Sep 2025 21:57:30 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Sun, 28 Sep 2025 21:57:29 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-networking][scarthgap][PATCH 1/1] python3-twisted: Fix CVE-2024-41810
Date: Mon, 29 Sep 2025 10:27:27 +0530
Message-ID: <20250929045727.2791064-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI5MDA0NSBTYWx0ZWRfX5mhJuYDqzaTa
 Y9Q76b92XZGI2E260ycgvADKBC3/alrec52AdGoglIYAKxcryY/cUyLeZ3P0xwEM+6t8EVBfEv3
 SuGi1CfbUyeaTWQUzdpZG6vNdN2albJ/nU5cDrMKjaTI1PL9a4pPuDS2JdbAaEIEyfJ6riWbNlc
 dPHuDu56FRj+gqhRTJ/7LLQh0wXqopjLadCxDgvo56fLSkCOzt7hel4+rgTy+Z3WAmIKchukEOl
 47E99j1Cis9ezXIGpGLLs6Juwau0n1bnx/uxO0QyrZnKYNdJWpxlfF59NFWHJkl2H4P8VyIvxwS
 rRsvKSGamWqEWDayOPFdG7EZwB8tKmTctF0lxXHk7B5agVck8rqsXDh259Q8ftj4LvRIxX3w9Yb
 XLxYxLaBynyREKD3NGH05IlWKe4IHA==
X-Authority-Analysis: v=2.4 cv=ZNPaWH7b c=1 sm=1 tr=0 ts=68da11bb cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=JBbWWo_dQDwA:10 a=yJojWOMRYYMA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=Xk6knvOzKn4ZROvoSXoA:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=6_D5ljFcL1GZDUJyZucp:22
X-Proofpoint-ORIG-GUID: pg8k1Odqi2xPE3BZGJmMU2PkqMxEHFRD
X-Proofpoint-GUID: pg8k1Odqi2xPE3BZGJmMU2PkqMxEHFRD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2509150000
 definitions=main-2509290045
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 04:57:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120009

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


