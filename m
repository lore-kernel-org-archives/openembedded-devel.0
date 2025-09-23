Return-Path: <Divya.Chellam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BE01CAC5A7
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 09:27:50 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.12495.1758619660541856453
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 02:27:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=mAifTR0N;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1361ae8dfb=divya.chellam@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58N8svIR3026610
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 02:27:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=hQresRYTO4kBKq632DUA
	ms/U453TfiQJu85n2AEIE4w=; b=mAifTR0NsGbSGLWQytkQd5i1BktfKIMUen7N
	3wHnUZzBt5ZNwmMf3EvbkOXrvh3cVfYRjhBX1ronNnsj2wXfmbQjfUQftrWnB3Vg
	14YF4HYWdoZiRgA2CFlpwZeUP1wwvl002SfncCF8RM70fKmmTqvG+CxJYA68yGAX
	MxYnFW2PX4YgRupoXTM3zfN0Kmpk3fJrOW7tQ4r8W5OcIbDN6ZGFxCLHO9mxwG6S
	4qWJo29ChdFxL23Cck/BUo1Nri4dOOuUCX/486EjPjweDOE5tpIBBOmNbUAmWzBW
	4pgA3rOe4et45fal2IzyoSU6ZduhOx6xYK64wDphR/tkapaQrA==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 499qj2trhf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 02:27:40 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Tue, 23 Sep 2025 02:27:38 -0700
From: dchellam <divya.chellam@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 1/1] krb5: fix CVE-2025-24528
Date: Tue, 23 Sep 2025 14:57:00 +0530
Message-ID: <20250923092700.3290141-1-divya.chellam@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.11.232.110]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) To
 ala-exchng01.corp.ad.wrs.com (10.11.224.121)
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDA4NyBTYWx0ZWRfX2IB8SrGCGSQU
 Vl5tFFbmZd1aLvWb9g3XV6cPY9tkfKhMJUWAT7LiescxAHC1RCG96uRKWkeYE1w2ahyh5wAspJk
 Cm+5W37tuAuvML3VHXoVf1mslY+TrkfWfLus4yiY0iIKYBFig5gIevcRfiXX+GzNfl3Xf3Nvidp
 EIPOGLUamOXXkoZ9f9+lQvRvAsa+LvXu9IOy2r1oWvCZgpl+Yi5iX+erb2Bz7ODUdowfPCgN67Z
 zwmX/Jpffa2LotLLTQtqm+b7EHbSp3S6ZxX8IS1HynFXanCZ0lrdwAjlszO4daE9SOCGL1DN8/0
 EcykMZvsb2whc5RX9/pxu5ZCQ7zCqB5pkI8IXSBpCB1Vk/Jwv8SK1E9d9xXnlo=
X-Authority-Analysis: v=2.4 cv=btpMBFai c=1 sm=1 tr=0 ts=68d2680c cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=gmxlzscTznEA:10 a=yJojWOMRYYMA:10 a=NEAV23lmAAAA:8 a=xNf9USuDAAAA:8
 a=Gz7s5_CCAAAA:8 a=t7CeM3EgAAAA:8 a=l_cwOu8aAAAA:8 a=f8KddNS2xC7RpK7WnAoA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: ieLNMHymgUe-xuGmi_xD_Z4Xau7BPlY0
X-Proofpoint-ORIG-GUID: ieLNMHymgUe-xuGmi_xD_Z4Xau7BPlY0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_02,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 phishscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 09:27:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119656

From: Divya Chellam <divya.chellam@windriver.com>

In MIT krb5 release 1.7 and later with incremental propagation
enabled, an authenticated attacker can cause kadmind to write beyond
the end of the mapped region for the iprop log file, likely causing a
process crash.

https://github.com/krb5/krb5/commit/78ceba024b64d49612375be4a12d1c066b0bfbd0

Reference:
https://security-tracker.debian.org/tracker/CVE-2025-24528

Upstream-patch:
https://github.com/krb5/krb5/commit/78ceba024b64d49612375be4a12d1c066b0bfbd0

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
---
 .../krb5/krb5/CVE-2025-24528.patch            | 68 +++++++++++++++++++
 .../recipes-connectivity/krb5/krb5_1.17.2.bb  |  1 +
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
diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.17.2.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.17.2.bb
index 1810649f64..99ba9eaa9c 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.17.2.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.17.2.bb
@@ -40,6 +40,7 @@ SRC_URI = "http://web.mit.edu/kerberos/dist/${BPN}/${SHRT_VER}/${BP}.tar.gz \
            file://CVE-2025-3576-pre.patch;striplevel=2 \
            file://CVE-2025-3576-01.patch;striplevel=2 \
            file://CVE-2025-3576-02.patch;striplevel=2 \
+           file://CVE-2025-24528.patch;striplevel=2 \
 "
 SRC_URI[md5sum] = "aa4337fffa3b61f22dbd0167f708818f"
 SRC_URI[sha256sum] = "1a4bba94df92f6d39a197a10687653e8bfbc9a2076e129f6eb92766974f86134"
-- 
2.40.0


