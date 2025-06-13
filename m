Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B82CC61DB2
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 06:54:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.4056.1749797696628695452
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Jun 2025 23:54:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8259073970=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D6WHuR030464
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Jun 2025 23:54:56 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474gq46fp9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Jun 2025 23:54:56 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 12 Jun 2025 23:54:55 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Thu, 12 Jun 2025 23:54:54 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [master][meta-oe][PATCH 12/18] libsoup-2.4: fix CVE-2025-32912
Date: Fri, 13 Jun 2025 14:54:35 +0800
Message-ID: <20250613065441.3121844-13-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613065441.3121844-1-changqing.li@windriver.com>
References: <20250613065441.3121844-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=Qrde3Uyd c=1 sm=1 tr=0 ts=684bcb40 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=6IFa9wvqVegA:10 a=GHR8O2WEAAAA:20 a=t7CeM3EgAAAA:8 a=_enOPnqeAAAA:8 a=eXHZBV4ZpkldoAy6WkEA:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=XAbD3I9PDrnSMThV5XoS:22
X-Proofpoint-GUID: samQXdpCNAXc8_zob4PAOL7Pe5C4eWco
X-Proofpoint-ORIG-GUID: samQXdpCNAXc8_zob4PAOL7Pe5C4eWco
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDA1MCBTYWx0ZWRfXzk39slwWEdWX HX9bTPxLTXzhAc/pU3XGE0aclCBR7mbkKxmtzAfMK2M5O56zKP3PsGchfRP/FmQ7UyQw+fSCraK WrFNo7hPkKm4yefPrU41qeyQTuVVuT2mv5ijGX8HLZf0s7KLlZSFqTl+0TTddn5has4kuB3MlTC
 jpkoMnMNczSiS1SZTKKZdHsD1Pr6XzYiTEy6j7/lKUaEb0VkevuQjCSmr+/6Vsg2x9XnIvwTq64 iS6SRhm01DRiQl98DAx/2EL5zWe2ieuOfjJ0UDIYsgS04wJdMlAZxIHHH0wy8B2TmHe8JfHc/Rt iVTCenDVTgYNO0uqNkJwhfzENUZrPx4f18p6Cwk05PgSeh0lrXBCm1nKqE/TYHvtp2D1HIoE7hl
 I23oqHdgjOdOHt60qb5zDbAkz//OvisSViSCmYOrQDfCmhwgsBCUmNOLgGhTCdt66qi9xNe0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_10,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 bulkscore=0 mlxscore=0 mlxlogscore=657
 spamscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506130050
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Jun 2025 06:54:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117902

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/434

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/libsoup-2.4/CVE-2025-32912.patch  | 32 +++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32912.patch

diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32912.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32912.patch
new file mode 100644
index 0000000000..b3ce9d8bc3
--- /dev/null
+++ b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32912.patch
@@ -0,0 +1,32 @@
+From 0984dddb11daf14fdf5ca24077cd0ebda796439a Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Fri, 16 May 2025 13:25:32 +0800
+Subject: [PATCH] auth-digest: Handle missing nonce
+
+CVE: CVE-2025-32912
+Upstream-Status: Backport
+[https://gitlab.gnome.org/GNOME/libsoup/-/commit/cd077513f267e43ce4b659eb18a1734d8a369992?merge_request_iid=434
+https://gitlab.gnome.org/GNOME/libsoup/-/commit/910ebdcd3dd82386717a201c13c834f3a63eed7f]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-auth-digest.c | 2 +-
+ 1 files changed, 1 insertions(+), 1 deletion(-)
+
+diff --git a/libsoup/soup-auth-digest.c b/libsoup/soup-auth-digest.c
+index 6d965d2..f1621ec 100644
+--- a/libsoup/soup-auth-digest.c
++++ b/libsoup/soup-auth-digest.c
+@@ -156,7 +156,7 @@ soup_auth_digest_update (SoupAuth *auth, SoupMessage *msg,
+ 	guint qop_options;
+ 	gboolean ok = TRUE;
+ 
+-	 if (!soup_auth_get_realm (auth))
++	if (!soup_auth_get_realm (auth) || !g_hash_table_lookup (auth_params, "nonce"))
+ 		return FALSE;
+ 
+ 	g_free (priv->domain);
+
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta-oe/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index 3e4a8e14d4..09881f9062 100644
--- a/meta-oe/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta-oe/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -32,6 +32,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32910-1.patch \
            file://CVE-2025-32910-2.patch \
            file://CVE-2025-32910-3.patch \
+           file://CVE-2025-32912.patch \
 "
 SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
 
-- 
2.34.1


