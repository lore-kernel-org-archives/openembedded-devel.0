Return-Path: <Divya.Chellam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABD2DC36008
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 10:46:51 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.62806.1742899601958528748
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Mar 2025 03:46:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=517906a106=divya.chellam@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52P6nBft003011
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 03:46:41 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45hvqkau68-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 03:46:41 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 25 Mar 2025 03:46:39 -0700
From: dchellam <divya.chellam@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][PATCH] krb5: fix CVE-2025-24528
Date: Tue, 25 Mar 2025 10:46:17 +0000
Message-ID: <20250325104617.2912166-1-divya.chellam@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Authority-Analysis: v=2.4 cv=XNkwSRhE c=1 sm=1 tr=0 ts=67e28991 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=Vs1iUdzkB0EA:10 a=xNf9USuDAAAA:8 a=NEAV23lmAAAA:8 a=Gz7s5_CCAAAA:8 a=t7CeM3EgAAAA:8 a=l_cwOu8aAAAA:8
 a=f8KddNS2xC7RpK7WnAoA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 6hugQy0V2pZASfbVAF5jG2kVR8h7es9o
X-Proofpoint-ORIG-GUID: 6hugQy0V2pZASfbVAF5jG2kVR8h7es9o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-25_04,2025-03-25_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 mlxscore=0 impostorscore=0 adultscore=0 spamscore=0 phishscore=0
 mlxlogscore=999 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503250075
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 10:46:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116271

From: Divya Chellam <divya.chellam@windriver.com>

In MIT krb5 release 1.7 and later with incremental propagation
enabled, an authenticated attacker can cause kadmind to write beyond
the end of the mapped region for the iprop log file, likely causing a
process crash.

Reference:
https://security-tracker.debian.org/tracker/CVE-2025-24528

Upstream-patch:
https://github.com/krb5/krb5/commit/78ceba024b64d49612375be4a12d1c066b0bfbd0

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
---
 .../krb5/krb5/CVE-2025-24528.patch            | 68 +++++++++++++++++++
 .../recipes-connectivity/krb5/krb5_1.21.3.bb  |  1 +
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
diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.21.3.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.21.3.bb
index 7489181322..b64bdb4af7 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.21.3.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.21.3.bb
@@ -29,6 +29,7 @@ SRC_URI = "http://web.mit.edu/kerberos/dist/${BPN}/${SHRT_VER}/${BP}.tar.gz \
            file://krb5-kdc.service \
            file://krb5-admin-server.service \
            file://CVE-2024-26458_CVE-2024-26461.patch;striplevel=2 \
+           file://CVE-2025-24528.patch;striplevel=2 \
 "
 
 SRC_URI[sha256sum] = "b7a4cd5ead67fb08b980b21abd150ff7217e85ea320c9ed0c6dadd304840ad35"
-- 
2.40.0


