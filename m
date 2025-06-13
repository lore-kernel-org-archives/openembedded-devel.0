Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DF9FC71155
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 06:54:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.3978.1749797690620395398
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Jun 2025 23:54:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8259073970=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D6RjwL023482
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Jun 2025 23:54:50 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474gq46fp6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Jun 2025 23:54:50 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 12 Jun 2025 23:54:49 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Thu, 12 Jun 2025 23:54:48 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [master][meta-oe][PATCH 06/18] libsoup-2.4: fix CVE-2025-46420
Date: Fri, 13 Jun 2025 14:54:29 +0800
Message-ID: <20250613065441.3121844-7-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613065441.3121844-1-changqing.li@windriver.com>
References: <20250613065441.3121844-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=Qrde3Uyd c=1 sm=1 tr=0 ts=684bcb3a cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=6IFa9wvqVegA:10 a=GHR8O2WEAAAA:20 a=t7CeM3EgAAAA:8 a=_enOPnqeAAAA:8 a=V2sgnzSHAAAA:8 a=Ka6kQXwktFwtOCzPnTYA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=XAbD3I9PDrnSMThV5XoS:22 a=Z31ocT7rh6aUJxSkT1EX:22
X-Proofpoint-GUID: QCNc7uqX-GOT5osIiZar5Z_a8tukr9Pb
X-Proofpoint-ORIG-GUID: QCNc7uqX-GOT5osIiZar5Z_a8tukr9Pb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDA1MCBTYWx0ZWRfX4v0WvZ+72p92 ZpLHb6yhXuL5Yc7BUrwU122KW10WoKu5PCp8MdLT9u+CePaYnXEzvTWBhJl8hgvIRlthC3E0VeT VIBdxPRw7Nf6y2xe92qzHhTW6A/2FahDkGIA+L/oAj5aXTikrzZufPsrW5Jcys531kZt6ZQWTVM
 7kuujH+ZlrOyx302P81YRR2IKlDUgDajhK8RyxWNmWKf0lUaEiaEMp8arz0d1Q48r8BDP8zLjBe 6TTn7kGB6w66Tq39kr4NCiFFwk3pMEQTZNROZe4VXCJihKQfjW7nT87sjBz0IMZjhXfG353ElMJ SzS3Nqhcu4QotAj+hZRkI1/67J9165XdlB0t0vlHxBTyua0RwR6bk1zoALKFC3Hv1SqOb+B/AH1
 HxLW73xkPlJIAG3mh3mkWtpu4jwL1kpQdaYBLo/QyUg803G+Ca80znm92G8O6Az0BDModEBi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_10,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999
 spamscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506130050
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Jun 2025 06:54:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117896

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/438

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/libsoup-2.4/CVE-2025-46420.patch  | 61 +++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-46420.patch

diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-46420.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-46420.patch
new file mode 100644
index 0000000000..c970661694
--- /dev/null
+++ b/meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-46420.patch
@@ -0,0 +1,61 @@
+From 81e03c538d6a102406114567f4f1c468033ce2e4 Mon Sep 17 00:00:00 2001
+From: Patrick Griffis <pgriffis@igalia.com>
+Date: Thu, 26 Dec 2024 18:31:42 -0600
+Subject: [PATCH] soup_header_parse_quality_list: Fix leak
+
+When iterating over the parsed list we now steal the allocated strings that we want and then free_full the list which may contain remaining strings.
+
+CVE: CVE-2025-46420
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/421/diffs?commit_id=c9083869ec2a3037e6df4bd86b45c419ba295f8e]
+
+ Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-headers.c | 11 +++++------
+ 1 file changed, 5 insertions(+), 6 deletions(-)
+
+diff --git a/libsoup/soup-headers.c b/libsoup/soup-headers.c
+index 87bb3dc..9707ca0 100644
+--- a/libsoup/soup-headers.c
++++ b/libsoup/soup-headers.c
+@@ -528,7 +528,7 @@ soup_header_parse_quality_list (const char *header, GSList **unacceptable)
+ 	GSList *unsorted;
+ 	QualityItem *array;
+ 	GSList *sorted, *iter;
+-	char *item, *semi;
++	char *semi;
+ 	const char *param, *equal, *value;
+ 	double qval;
+ 	int n;
+@@ -541,9 +541,8 @@ soup_header_parse_quality_list (const char *header, GSList **unacceptable)
+ 	unsorted = soup_header_parse_list (header);
+ 	array = g_new0 (QualityItem, g_slist_length (unsorted));
+ 	for (iter = unsorted, n = 0; iter; iter = iter->next) {
+-		item = iter->data;
+ 		qval = 1.0;
+-		for (semi = strchr (item, ';'); semi; semi = strchr (semi + 1, ';')) {
++		for (semi = strchr (iter->data, ';'); semi; semi = strchr (semi + 1, ';')) {
+ 			param = skip_lws (semi + 1);
+ 			if (*param != 'q')
+ 				continue;
+@@ -575,15 +574,15 @@ soup_header_parse_quality_list (const char *header, GSList **unacceptable)
+ 		if (qval == 0.0) {
+ 			if (unacceptable) {
+ 				*unacceptable = g_slist_prepend (*unacceptable,
+-								 item);
++								 g_steal_pointer (&iter->data));
+ 			}
+ 		} else {
+-			array[n].item = item;
++			array[n].item = g_steal_pointer (&iter->data);
+ 			array[n].qval = qval;
+ 			n++;
+ 		}
+ 	}
+-	g_slist_free (unsorted);
++	g_slist_free_full (unsorted, g_free);
+ 
+ 	qsort (array, n, sizeof (QualityItem), sort_by_qval);
+ 	sorted = NULL;
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta-oe/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index cda6a3b00f..7d9cc222f5 100644
--- a/meta-oe/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta-oe/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -24,6 +24,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2024-52530.patch \
            file://CVE-2025-32906.patch \
            file://CVE-2025-32914.patch \
+           file://CVE-2025-46420.patch \
 "
 SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
 
-- 
2.34.1


