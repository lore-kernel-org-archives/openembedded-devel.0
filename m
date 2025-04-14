Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E404C369A2
	for <webhook@archiver.kernel.org>; Mon, 14 Apr 2025 05:07:10 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.42945.1744607224963109068
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Apr 2025 22:07:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6199c2e9ed=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E4nxWJ013662
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Apr 2025 05:07:04 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45ydd1hp50-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Apr 2025 05:07:03 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Sun, 13 Apr 2025 22:07:02 -0700
Received: from pek-lpg-core5.wrs.com (128.224.153.45) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Sun, 13 Apr 2025 22:07:01 -0700
From: <jiaying.song.cn@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <changqing.li@windriver.com>
Subject: [Kirkstone][meta-networking][PATCH] corosync: fix CVE-2025-30472
Date: Mon, 14 Apr 2025 13:07:00 +0800
Message-ID: <20250414050700.4114456-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: zLPj6PGNrrF3-Qu8ZHULXzauPCe_hkGc
X-Proofpoint-GUID: zLPj6PGNrrF3-Qu8ZHULXzauPCe_hkGc
X-Authority-Analysis: v=2.4 cv=HecUTjE8 c=1 sm=1 tr=0 ts=67fc97f7 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=XR8D0OoHHMoA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=3rZjPcc-6m4Qm2NJ-N0A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504140035
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Apr 2025 05:07:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116841

From: Jiaying Song <jiaying.song.cn@windriver.com>

Corosync through 3.1.9, if encryption is disabled or the attacker knows
the encryption key, has a stack-based buffer overflow in
orf_token_endian_convert in exec/totemsrp.c via a large UDP packet.

References:
https://nvd.nist.gov/vuln/detail/CVE-2025-30472

Upstream patches:
https://github.com/corosync/corosync/commit/7839990f9cdf34e55435ed90109e82709032466a

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 ...totemsrp-Check-size-of-orf_token-msg.patch | 74 +++++++++++++++++++
 .../corosync/corosync_3.0.3.bb                |  1 +
 2 files changed, 75 insertions(+)
 create mode 100644 meta-networking/recipes-extended/corosync/corosync/0001-totemsrp-Check-size-of-orf_token-msg.patch

diff --git a/meta-networking/recipes-extended/corosync/corosync/0001-totemsrp-Check-size-of-orf_token-msg.patch b/meta-networking/recipes-extended/corosync/corosync/0001-totemsrp-Check-size-of-orf_token-msg.patch
new file mode 100644
index 0000000000..fa446624fd
--- /dev/null
+++ b/meta-networking/recipes-extended/corosync/corosync/0001-totemsrp-Check-size-of-orf_token-msg.patch
@@ -0,0 +1,74 @@
+From 8a9e16384720f1837f4676baf62807a441c1e7f1 Mon Sep 17 00:00:00 2001
+From: Jan Friesse <jfriesse@redhat.com>
+Date: Mon, 24 Mar 2025 12:05:08 +0100
+Subject: [PATCH] totemsrp: Check size of orf_token msg
+
+orf_token message is stored into preallocated array on endian convert
+so carefully crafted malicious message can lead to crash of corosync.
+
+Solution is to check message size beforehand.
+
+Upstream-Status: Backport
+[https://github.com/corosync/corosync/commit/7839990f9cdf34e55435ed90109e82709032466a]
+
+CVE: CVE-2025-30472
+
+Signed-off-by: Jan Friesse <jfriesse@redhat.com>
+Reviewed-by: Christine Caulfield <ccaulfie@redhat.com>
+Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
+---
+ exec/totemsrp.c | 18 +++++++++++++++++-
+ 1 file changed, 17 insertions(+), 1 deletion(-)
+
+diff --git a/exec/totemsrp.c b/exec/totemsrp.c
+index d8e960a..1e417e5 100644
+--- a/exec/totemsrp.c
++++ b/exec/totemsrp.c
+@@ -3637,12 +3637,20 @@ static int check_orf_token_sanity(
+ 	const struct totemsrp_instance *instance,
+ 	const void *msg,
+ 	size_t msg_len,
++	size_t max_msg_len,
+ 	int endian_conversion_needed)
+ {
+ 	int rtr_entries;
+ 	const struct orf_token *token = (const struct orf_token *)msg;
+ 	size_t required_len;
+ 
++	if (msg_len > max_msg_len) {
++		log_printf (instance->totemsrp_log_level_security,
++		    "Received orf_token message is too long...  ignoring.");
++
++		return (-1);
++	}
++
+ 	if (msg_len < sizeof(struct orf_token)) {
+ 		log_printf (instance->totemsrp_log_level_security,
+ 		    "Received orf_token message is too short...  ignoring.");
+@@ -3656,6 +3664,13 @@ static int check_orf_token_sanity(
+ 		rtr_entries = token->rtr_list_entries;
+ 	}
+ 
++	if (rtr_entries > RETRANSMIT_ENTRIES_MAX) {
++		log_printf (instance->totemsrp_log_level_security,
++		    "Received orf_token message rtr_entries is corrupted...  ignoring.");
++
++		return (-1);
++	}
++
+ 	required_len = sizeof(struct orf_token) + rtr_entries * sizeof(struct rtr_item);
+ 	if (msg_len < required_len) {
+ 		log_printf (instance->totemsrp_log_level_security,
+@@ -3824,7 +3839,8 @@ static int message_handler_orf_token (
+ 	"Time since last token %0.4f ms", ((float)tv_diff) / 1000000.0);
+ #endif
+ 
+-	if (check_orf_token_sanity(instance, msg, msg_len, endian_conversion_needed) == -1) {
++	if (check_orf_token_sanity(instance, msg, msg_len, sizeof(token_storage),
++	    endian_conversion_needed) == -1) {
+ 		return (0);
+ 	}
+ 
+-- 
+2.34.1
+
diff --git a/meta-networking/recipes-extended/corosync/corosync_3.0.3.bb b/meta-networking/recipes-extended/corosync/corosync_3.0.3.bb
index ec2a785277..7c5e23ca2f 100644
--- a/meta-networking/recipes-extended/corosync/corosync_3.0.3.bb
+++ b/meta-networking/recipes-extended/corosync/corosync_3.0.3.bb
@@ -9,6 +9,7 @@ inherit autotools pkgconfig systemd
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.gz \
            file://corosync.conf \
+           file://0001-totemsrp-Check-size-of-orf_token-msg.patch \
           "
 SRC_URI[sha256sum] = "20eb903eb984f6a728282c199825e442e8bba869acefd22390076ef3a33a4ded"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+\.(?!99)\d+(\.\d+)+)"
-- 
2.34.1


