Return-Path: <Divya.Chellam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37BD8C02192
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 12:51:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.18531.1738327895193426605
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Jan 2025 04:51:35 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4126352c6f=divya.chellam@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50V9W53O018820
	for <openembedded-devel@lists.openembedded.org>; Fri, 31 Jan 2025 12:51:34 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44gf7d0q1w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 31 Jan 2025 12:51:34 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 31 Jan 2025 04:51:31 -0800
From: dchellam <divya.chellam@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 5/5] redis: fix CVE-2024-31449
Date: Fri, 31 Jan 2025 12:51:00 +0000
Message-ID: <20250131125100.3348102-5-divya.chellam@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250131125100.3348102-1-divya.chellam@windriver.com>
References: <20250131125100.3348102-1-divya.chellam@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Authority-Analysis: v=2.4 cv=TfBstQQh c=1 sm=1 tr=0 ts=679cc756 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=VdSt8ZQiCzkA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=7UKGVgRVAAAA:8 a=t7CeM3EgAAAA:8 a=hR66z_WBAAAA:8
 a=mM1_2qmSOAGBbh9chYAA:9 a=8Ox4Rr8FuIIqx5qz5MW0:22 a=FdTzh2GWekK77mhwV6Dw:22 a=rIFd7wX85fjrbk78xK_P:22
X-Proofpoint-GUID: yTKg2YPUg4dhIUp0F9S5ZyT9zNN7VI8u
X-Proofpoint-ORIG-GUID: yTKg2YPUg4dhIUp0F9S5ZyT9zNN7VI8u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_04,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 mlxscore=0 suspectscore=0 spamscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2501310098
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Jan 2025 12:51:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115195

From: Divya Chellam <divya.chellam@windriver.com>

Redis is an open source, in-memory database that persists on disk.
An authenticated user may use a specially crafted Lua script to
trigger a stack buffer overflow in the bit library, which may
potentially lead to remote code execution. The problem exists in
all versions of Redis with Lua scripting. This problem has been
fixed in Redis versions 6.2.16, 7.2.6, and 7.4.1. Users are advised
to upgrade. There are no known workarounds for this vulnerability.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2024-31449

Upstream-patches:
https://github.com/redis/redis/commit/1f7c148be2cbacf7d50aa461c58b871e87cc5ed9
https://github.com/redis/redis/commit/fe8de4313f85e0f8af2eff1f78b52cfe56fb4c71

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
---
 .../redis/redis-7.0.13/CVE-2024-31449.patch   | 49 +++++++++++++++++++
 .../redis/redis/CVE-2024-31449.patch          | 49 +++++++++++++++++++
 .../recipes-extended/redis/redis_6.2.12.bb    |  1 +
 .../recipes-extended/redis/redis_7.0.13.bb    |  1 +
 4 files changed, 100 insertions(+)
 create mode 100644 meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2024-31449.patch
 create mode 100644 meta-oe/recipes-extended/redis/redis/CVE-2024-31449.patch

diff --git a/meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2024-31449.patch b/meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2024-31449.patch
new file mode 100644
index 0000000000..1e8ef7be2e
--- /dev/null
+++ b/meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2024-31449.patch
@@ -0,0 +1,49 @@
+From fe8de4313f85e0f8af2eff1f78b52cfe56fb4c71 Mon Sep 17 00:00:00 2001
+From: Oran Agra <oran@redislabs.com>
+Date: Wed, 2 Oct 2024 19:54:06 +0300
+Subject: [PATCH] Fix lua bit.tohex (CVE-2024-31449)
+
+INT_MIN value must be explicitly checked, and cannot be negated.
+
+CVE: CVE-2024-31449
+
+Upstream-Status: Backport [https://github.com/redis/redis/commit/fe8de4313f85e0f8af2eff1f78b52cfe56fb4c71]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ deps/lua/src/lua_bit.c   | 1 +
+ tests/unit/scripting.tcl | 6 ++++++
+ 2 files changed, 7 insertions(+)
+
+diff --git a/deps/lua/src/lua_bit.c b/deps/lua/src/lua_bit.c
+index 9f83b85..7e43fae 100644
+--- a/deps/lua/src/lua_bit.c
++++ b/deps/lua/src/lua_bit.c
+@@ -132,6 +132,7 @@ static int bit_tohex(lua_State *L)
+   const char *hexdigits = "0123456789abcdef";
+   char buf[8];
+   int i;
++  if (n == INT32_MIN) n = INT32_MIN+1;
+   if (n < 0) { n = -n; hexdigits = "0123456789ABCDEF"; }
+   if (n > 8) n = 8;
+   for (i = (int)n; --i >= 0; ) { buf[i] = hexdigits[b & 15]; b >>= 4; }
+diff --git a/tests/unit/scripting.tcl b/tests/unit/scripting.tcl
+index 4b65131..cdc6dc4 100644
+--- a/tests/unit/scripting.tcl
++++ b/tests/unit/scripting.tcl
+@@ -590,6 +590,12 @@ start_server {tags {"scripting"}} {
+         set e
+     } {ERR *Attempt to modify a readonly table*}
+ 
++    test {lua bit.tohex bug} {
++        set res [run_script {return bit.tohex(65535, -2147483648)} 0]
++        r ping
++        set res
++    } {0000FFFF}
++
+     test {Test an example script DECR_IF_GT} {
+         set decr_if_gt {
+             local current
+-- 
+2.40.0
+
diff --git a/meta-oe/recipes-extended/redis/redis/CVE-2024-31449.patch b/meta-oe/recipes-extended/redis/redis/CVE-2024-31449.patch
new file mode 100644
index 0000000000..5004cd5ab6
--- /dev/null
+++ b/meta-oe/recipes-extended/redis/redis/CVE-2024-31449.patch
@@ -0,0 +1,49 @@
+From 1f7c148be2cbacf7d50aa461c58b871e87cc5ed9 Mon Sep 17 00:00:00 2001
+From: Oran Agra <oran@redislabs.com>
+Date: Wed, 2 Oct 2024 19:54:06 +0300
+Subject: [PATCH] Fix lua bit.tohex (CVE-2024-31449)
+
+INT_MIN value must be explicitly checked, and cannot be negated.
+
+CVE: CVE-2024-31449
+
+Upstream-Status: Backport [https://github.com/redis/redis/commit/1f7c148be2cbacf7d50aa461c58b871e87cc5ed9]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ deps/lua/src/lua_bit.c   | 1 +
+ tests/unit/scripting.tcl | 6 ++++++
+ 2 files changed, 7 insertions(+)
+
+diff --git a/deps/lua/src/lua_bit.c b/deps/lua/src/lua_bit.c
+index 690df7d..a459ca9 100644
+--- a/deps/lua/src/lua_bit.c
++++ b/deps/lua/src/lua_bit.c
+@@ -131,6 +131,7 @@ static int bit_tohex(lua_State *L)
+   const char *hexdigits = "0123456789abcdef";
+   char buf[8];
+   int i;
++  if (n == INT32_MIN) n = INT32_MIN+1;
+   if (n < 0) { n = -n; hexdigits = "0123456789ABCDEF"; }
+   if (n > 8) n = 8;
+   for (i = (int)n; --i >= 0; ) { buf[i] = hexdigits[b & 15]; b >>= 4; }
+diff --git a/tests/unit/scripting.tcl b/tests/unit/scripting.tcl
+index 9f5ee77..5e2a7f8 100644
+--- a/tests/unit/scripting.tcl
++++ b/tests/unit/scripting.tcl
+@@ -406,6 +406,12 @@ start_server {tags {"scripting"}} {
+         set e
+     } {ERR*Attempt to modify a readonly table*}
+ 
++    test {lua bit.tohex bug} {
++        set res [r eval {return bit.tohex(65535, -2147483648)} 0]
++        r ping
++        set res
++    } {0000FFFF}
++
+     test {Test an example script DECR_IF_GT} {
+         set decr_if_gt {
+             local current
+-- 
+2.40.0
+
diff --git a/meta-oe/recipes-extended/redis/redis_6.2.12.bb b/meta-oe/recipes-extended/redis/redis_6.2.12.bb
index bea98100a7..a13dfdbe45 100644
--- a/meta-oe/recipes-extended/redis/redis_6.2.12.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.2.12.bb
@@ -18,6 +18,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
            file://CVE-2023-45145.patch \
            file://CVE-2024-31228.patch \
+           file://CVE-2024-31449.patch \
            "
 SRC_URI[sha256sum] = "75352eef41e97e84bfa94292cbac79e5add5345fc79787df5cbdff703353fb1b"
 
diff --git a/meta-oe/recipes-extended/redis/redis_7.0.13.bb b/meta-oe/recipes-extended/redis/redis_7.0.13.bb
index 249f002a1b..fa1716a192 100644
--- a/meta-oe/recipes-extended/redis/redis_7.0.13.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.0.13.bb
@@ -20,6 +20,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://CVE-2023-45145.patch \
            file://CVE-2024-31227.patch \
            file://CVE-2024-31228.patch \
+           file://CVE-2024-31449.patch \
            "
 SRC_URI[sha256sum] = "97065774d5fb8388eb0d8913458decfcb167d356e40d31dd01cd30c1cc391673"
 
-- 
2.40.0


