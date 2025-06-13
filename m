Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7136BC71150
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 06:54:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.4053.1749797689802746127
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Jun 2025 23:54:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8259073970=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D4p0ah007524
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Jun 2025 06:54:49 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474an2pjqv-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Jun 2025 06:54:48 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 12 Jun 2025 23:54:48 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Thu, 12 Jun 2025 23:54:47 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [master][meta-oe][PATCH 05/18] libsoup-2.4: fix CVE-2025-32914
Date: Fri, 13 Jun 2025 14:54:28 +0800
Message-ID: <20250613065441.3121844-6-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613065441.3121844-1-changqing.li@windriver.com>
References: <20250613065441.3121844-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDA1MCBTYWx0ZWRfXxjI1SDp06D7V 45j1B/fkjX65dp3Ez+yvkfXzos6tAexyeeHePBJpSy4CvclFsLOqpvzRybzC4mT65sJ9OvVDZPG txcGf0qycJOf59ErNSmuFwhj5ojebEn//bYiDvgenr7uHCPVUK6uPp2mWH9pYwmFFT9ZYbEzdP/
 PYm0QFGno2RGDouMbhVfvzQwwhOdZnIH2JWDEBCwrQglAPlei9bW+W4a2ThcNjb3fgfkDvz94fd C3jfLtcpsdgZFE4EbXlpZAW3IYaGo+6IUvtSx1mr/mkzAmAV9UJwsjGoHxXa1Myq6kZHOreEqf/ VVeB4pF8kVq4xgbjzJ2ARMLASPcOaBkW8cBY3PmHAEQb3zECDNlqVZfD+cfqNIGZp73Z0yax9N/
 TdhXoZT2v5C/CURmIlKUmbJ3Fiba4aVqodvM4+Ef/79U4YS7/9nD01y8rnMV0Z7sqrpvB7Tg
X-Proofpoint-GUID: rsrr_2TiRG8dU0FCZNFrRA1cKKeu_v46
X-Authority-Analysis: v=2.4 cv=fdSty1QF c=1 sm=1 tr=0 ts=684bcb38 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=6IFa9wvqVegA:10 a=GHR8O2WEAAAA:20 a=t7CeM3EgAAAA:8 a=_enOPnqeAAAA:8 a=eXHZBV4ZpkldoAy6WkEA:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=XAbD3I9PDrnSMThV5XoS:22
X-Proofpoint-ORIG-GUID: rsrr_2TiRG8dU0FCZNFrRA1cKKeu_v46
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_10,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=757
 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 mlxscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506130050
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Jun 2025 06:54:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117895

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/450

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/libsoup-2.4/CVE-2025-32914.patch  | 35 +++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32914.patch

diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32914.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32914.patch
new file mode 100644
index 0000000000..9f3bb21a25
--- /dev/null
+++ b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32914.patch
@@ -0,0 +1,35 @@
+From ac844b9fc7945c38ea21fb7cf1a49a5c226d7c9c Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Mon, 12 May 2025 16:17:20 +0800
+Subject: [PATCH] Resolve "(CVE-2025-32914) (#YWH-PGM9867-23) OOB Read on
+ libsoup through function "soup_multipart_new_from_message" in
+ soup-multipart.c leads to crash or exit of process"
+
+CVE: CVE-2025-32914
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/450/diffs?commit_id=5bfcf8157597f2d327050114fb37ff600004dbcf]
+
+Test code are not added since some functions not aligned with version
+2.74.3
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-multipart.c |  2 +-
+ 1 files changed, 1 insertions(+), 1 deletion(-)
+
+diff --git a/libsoup/soup-multipart.c b/libsoup/soup-multipart.c
+index a7e550f..dd93973 100644
+--- a/libsoup/soup-multipart.c
++++ b/libsoup/soup-multipart.c
+@@ -181,7 +181,7 @@ soup_multipart_new_from_message (SoupMessageHeaders *headers,
+ 			return NULL;
+ 		}
+ 
+-		split = strstr (start, "\r\n\r\n");
++		split = g_strstr_len (start, body_end - start, "\r\n\r\n");
+ 		if (!split || split > end) {
+ 			soup_multipart_free (multipart);
+ 			soup_buffer_free (flattened);
+ 
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta-oe/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index ff37783716..cda6a3b00f 100644
--- a/meta-oe/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta-oe/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -23,6 +23,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-2784.patch \
            file://CVE-2024-52530.patch \
            file://CVE-2025-32906.patch \
+           file://CVE-2025-32914.patch \
 "
 SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
 
-- 
2.34.1


