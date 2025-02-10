Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41319C02198
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 13:10:40 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.50119.1739193039092431861
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 05:10:39 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4136a4b416=yogita.urade@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A5pqqZ014255
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 13:10:38 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44nx88swms-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 13:10:37 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 10 Feb 2025 05:10:34 -0800
From: yurade <yogita.urade@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 1/1] mbedtls: fix CVE-2024-28755 and CVE-2024-28836
Date: Mon, 10 Feb 2025 13:10:15 +0000
Message-ID: <20250210131015.3296727-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: V4ZBuIfI7zu3oO7L3-1-jPpeDAXa58ZW
X-Authority-Analysis: v=2.4 cv=VZANPEp9 c=1 sm=1 tr=0 ts=67a9face cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=T2h4t0Lz3GQA:10 a=xNf9USuDAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=7CQSdrXTAAAA:8
 a=jI1CY6Bas43v8jQcPBUA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: V4ZBuIfI7zu3oO7L3-1-jPpeDAXa58ZW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_07,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 mlxlogscore=917 spamscore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502100110
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 13:10:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115402

From: Yogita Urade <yogita.urade@windriver.com>

An issue was discovered in Mbed TLS 3.5.x before 3.6.0. When
an SSL context was reset with the mbedtls_ssl_session_reset()
API, the maximum TLS version to be negotiated was not restored
to the configured one. An attacker was able to prevent an Mbed
TLS server from establishing any TLS 1.3 connection, potentially
resulting in a Denial of Service or forced version downgrade from
TLS 1.3 to TLS 1.2.

fix indent issue in mbedtls_3.5.2.bb file.

Reference:
https://security-tracker.debian.org/tracker/CVE-2024-28755
https://security-tracker.debian.org/tracker/CVE-2024-28836

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../CVE-2024-28755-and-CVE-2024-28836.patch   | 67 +++++++++++++++++++
 .../mbedtls/mbedtls_3.5.2.bb                  |  6 +-
 2 files changed, 71 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/mbedtls/mbedtls/CVE-2024-28755-and-CVE-2024-28836.patch

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls/CVE-2024-28755-and-CVE-2024-28836.patch b/meta-networking/recipes-connectivity/mbedtls/mbedtls/CVE-2024-28755-and-CVE-2024-28836.patch
new file mode 100644
index 0000000000..8a2d38c23f
--- /dev/null
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls/CVE-2024-28755-and-CVE-2024-28836.patch
@@ -0,0 +1,67 @@
+From ad736991bb59211118a29fe115367c24495300c2 Mon Sep 17 00:00:00 2001
+From: Janos Follath <janos.follath@arm.com>
+Date: Fri, 9 Feb 2024 16:04:59 +0000
+Subject: [PATCH] Merge pull request #1177 from
+ ronald-cron-arm/tls-max-version-reset
+
+Reset properly the TLS maximum negotiable version
+
+CVE: CVE-2024-28755
+CVE: CVE-2024-28836
+Upstream-Status: Backport [https://github.com/Mbed-TLS/mbedtls/commit/ad736991bb59211118a29fe115367c24495300c2]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ library/ssl_tls.c |  1 +
+ tests/ssl-opt.sh  | 24 ++++++++++++++++++++++++
+ 2 files changed, 25 insertions(+)
+
+diff --git a/library/ssl_tls.c b/library/ssl_tls.c
+index cfb2798182..f3c701818b 100644
+--- a/library/ssl_tls.c
++++ b/library/ssl_tls.c
+@@ -1539,6 +1539,7 @@ int mbedtls_ssl_session_reset_int(mbedtls_ssl_context *ssl, int partial)
+     int ret = MBEDTLS_ERR_ERROR_CORRUPTION_DETECTED;
+
+     ssl->state = MBEDTLS_SSL_HELLO_REQUEST;
++    ssl->tls_version = ssl->conf->max_tls_version;
+
+     mbedtls_ssl_session_reset_msg_layer(ssl, partial);
+
+diff --git a/tests/ssl-opt.sh b/tests/ssl-opt.sh
+index 48b3c0cb26..448bd3825f 100755
+--- a/tests/ssl-opt.sh
++++ b/tests/ssl-opt.sh
+@@ -11307,6 +11307,30 @@ run_test    "TLS 1.3: Default" \
+             -s "ECDH/FFDH group: " \
+             -s "selected signature algorithm ecdsa_secp256r1_sha256"
+
++requires_config_enabled MBEDTLS_SSL_PROTO_TLS1_2
++requires_config_enabled MBEDTLS_SSL_PROTO_TLS1_3
++requires_config_enabled MBEDTLS_SSL_TLS1_3_KEY_EXCHANGE_MODE_EPHEMERAL_ENABLED
++requires_any_configs_enabled $TLS1_2_KEY_EXCHANGES_WITH_CERT
++run_test    "Establish TLS 1.2 then TLS 1.3 session" \
++            "$P_SRV" \
++            "( $P_CLI force_version=tls12; \
++               $P_CLI force_version=tls13 )" \
++            0 \
++            -s "Protocol is TLSv1.2" \
++            -s "Protocol is TLSv1.3" \
++
++requires_config_enabled MBEDTLS_SSL_PROTO_TLS1_2
++requires_config_enabled MBEDTLS_SSL_PROTO_TLS1_3
++requires_config_enabled MBEDTLS_SSL_TLS1_3_KEY_EXCHANGE_MODE_EPHEMERAL_ENABLED
++requires_any_configs_enabled $TLS1_2_KEY_EXCHANGES_WITH_CERT
++run_test    "Establish TLS 1.3 then TLS 1.2 session" \
++            "$P_SRV" \
++            "( $P_CLI force_version=tls13; \
++               $P_CLI force_version=tls12 )" \
++            0 \
++            -s "Protocol is TLSv1.3" \
++            -s "Protocol is TLSv1.2" \
++
+ requires_openssl_tls1_3_with_compatible_ephemeral
+ requires_config_enabled MBEDTLS_DEBUG_C
+ requires_config_enabled MBEDTLS_SSL_CLI_C
+--
+2.40.0
diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.5.2.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.5.2.bb
index 2fedac48cf..829d54307a 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.5.2.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.5.2.bb
@@ -25,8 +25,10 @@ SECTION = "libs"
 S = "${WORKDIR}/git"
 SRCREV = "daca7a3979c22da155ec9dce49ab1abf3b65d3a9"
 SRC_URI = "git://github.com/ARMmbed/mbedtls.git;protocol=https;branch=master \
-	file://0001-AES-NI-use-target-attributes-for-x86-32-bit-intrinsi.patch \
-	file://run-ptest"
+           file://0001-AES-NI-use-target-attributes-for-x86-32-bit-intrinsi.patch \
+           file://run-ptest \
+           file://CVE-2024-28755-and-CVE-2024-28836.patch \
+          "
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 inherit cmake update-alternatives ptest
-- 
2.40.0


