Return-Path: <Divya.Chellam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2023C282EC
	for <webhook@archiver.kernel.org>; Fri, 14 Mar 2025 12:17:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.12777.1741954642110447118
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Mar 2025 05:17:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=516884013e=divya.chellam@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52E6suXI021786
	for <openembedded-devel@lists.openembedded.org>; Fri, 14 Mar 2025 05:17:21 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45bgat28s9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 14 Mar 2025 05:17:21 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 14 Mar 2025 05:17:19 -0700
From: dchellam <divya.chellam@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 1/1] krb5: fix CVE-2025-24528
Date: Fri, 14 Mar 2025 12:16:56 +0000
Message-ID: <20250314121656.1265268-1-divya.chellam@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Authority-Analysis: v=2.4 cv=VYX3PEp9 c=1 sm=1 tr=0 ts=67d41e51 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=Vs1iUdzkB0EA:10 a=xNf9USuDAAAA:8 a=NEAV23lmAAAA:8 a=Gz7s5_CCAAAA:8 a=t7CeM3EgAAAA:8 a=l_cwOu8aAAAA:8
 a=f8KddNS2xC7RpK7WnAoA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: OzXVMKBBpR27xc0f27fdRs_iHLa8tsSw
X-Proofpoint-GUID: OzXVMKBBpR27xc0f27fdRs_iHLa8tsSw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_05,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=999 clxscore=1015
 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0 adultscore=0
 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503140097
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Mar 2025 12:17:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115984

From: Divya Chellam <divya.chellam@windriver.com>

Issue: LIN1023-10400

In MIT krb5 release 1.7 and later with incremental propagation
enabled, an authenticated attacker can cause kadmind to write beyond
the end of the mapped region for the iprop log file, likely causing a
process crash.

Reference:
https://security-tracker.debian.org/tracker/CVE-2025-24528

Upstream-patch:
https://github.com/krb5/krb5/commit/78ceba024b64d49612375be4a12d1c066b0bfbd0

(LOCAL REV: NOT UPSTREAM) -- Not applicable, upstream out of maintenance

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
---
 .../krb5/krb5/CVE-2025-24528.patch            | 68 +++++++++++++++++++
 .../recipes-connectivity/krb5/krb5_1.20.1.bb  |  1 +
 2 files changed, 69 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/CVE-2025-24528.patch

diff --git a/meta-oe/recipes-connectivity/krb5/krb5/CVE-2025-24528.patch b/meta-oe/recipes-connectivity/krb5/krb5/CVE-2025-24528.patch
new file mode 100644
index 0000000000..ac6039edf1
--- /dev/null
+++ b/meta-oe/recipes-connectivity/krb5/krb5/CVE-2025-24528.patch
@@ -0,0 +1,68 @@
+From 78ceba024b64d49612375be4a12d1c066b0bfbd0 Mon Sep 17 00:00:00 2001
+From: Zoltan Borbely <Zoltan.Borbely@morganstanley.com>
+Date: Tue, 28 Jan 2025 16:39:25 -0500
+Subject: [PATCH] Prevent overflow when calculating ulog block size
+
+In kdb_log.c:resize(), log an error and fail if the update size is
+larger than the largest possible block size (2^16-1).
+
+CVE-2025-24528:
+
+In MIT krb5 release 1.7 and later with incremental propagation
+enabled, an authenticated attacker can cause kadmind to write beyond
+the end of the mapped region for the iprop log file, likely causing a
+process crash.
+
+[ghudson@mit.edu: edited commit message and added CVE description]
+
+ticket: 9159 (new)
+tags: pullup
+target_version: 1.21-next
+
+CVE: CVE-2025-24528
+
+Upstream-Status: Backport [https://github.com/krb5/krb5/commit/78ceba024b64d49612375be4a12d1c066b0bfbd0]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ src/lib/kdb/kdb_log.c | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/src/lib/kdb/kdb_log.c b/src/lib/kdb/kdb_log.c
+index 2659a25..68fae91 100644
+--- a/src/lib/kdb/kdb_log.c
++++ b/src/lib/kdb/kdb_log.c
+@@ -183,7 +183,7 @@ extend_file_to(int fd, unsigned int new_size)
+  */
+ static krb5_error_code
+ resize(kdb_hlog_t *ulog, uint32_t ulogentries, int ulogfd,
+-       unsigned int recsize)
++       unsigned int recsize, const kdb_incr_update_t *upd)
+ {
+     unsigned int new_block, new_size;
+ 
+@@ -195,6 +195,12 @@ resize(kdb_hlog_t *ulog, uint32_t ulogentries, int ulogfd,
+     new_block *= ULOG_BLOCK;
+     new_size += ulogentries * new_block;
+ 
++    if (new_block > UINT16_MAX) {
++        syslog(LOG_ERR, _("ulog overflow caused by principal %.*s"),
++               upd->kdb_princ_name.utf8str_t_len,
++               upd->kdb_princ_name.utf8str_t_val);
++        return KRB5_LOG_ERROR;
++    }
+     if (new_size > MAXLOGLEN)
+         return KRB5_LOG_ERROR;
+ 
+@@ -291,7 +297,7 @@ store_update(kdb_log_context *log_ctx, kdb_incr_update_t *upd)
+     recsize = sizeof(kdb_ent_header_t) + upd_size;
+ 
+     if (recsize > ulog->kdb_block) {
+-        retval = resize(ulog, ulogentries, log_ctx->ulogfd, recsize);
++        retval = resize(ulog, ulogentries, log_ctx->ulogfd, recsize, upd);
+         if (retval)
+             return retval;
+     }
+-- 
+2.40.0
+
diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.20.1.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.20.1.bb
index 8e2542fb51..5a006c5354 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.20.1.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.20.1.bb
@@ -34,6 +34,7 @@ SRC_URI = "http://web.mit.edu/kerberos/dist/${BPN}/${SHRT_VER}/${BP}.tar.gz \
            file://CVE-2024-26462.patch;striplevel=2 \
            file://CVE-2024-37371-0001.patch;striplevel=2 \
            file://CVE-2024-37371-0002.patch;striplevel=2 \
+           file://CVE-2025-24528.patch;striplevel=2 \
 "
 SRC_URI[md5sum] = "73f5780e7b587ccd8b8cfc10c965a686"
 SRC_URI[sha256sum] = "704aed49b19eb5a7178b34b2873620ec299db08752d6a8574f95d41879ab8851"
-- 
2.40.0


