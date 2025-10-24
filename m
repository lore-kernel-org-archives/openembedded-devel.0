Return-Path: <Divya.Chellam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 387A4CCF9E3
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 13:51:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.11489.1761313902121603055
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Oct 2025 06:51:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ENDsxWmf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2392d52613=divya.chellam@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59O5vTEw2886273
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 13:51:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=pMa75fbcXaj9v9mM86Jl
	oLGj61V/aAx8/7ABd65vBsM=; b=ENDsxWmfGj+VunWnXMGxSfCwvHyNvNfruuWz
	lWBlERQJ8AWFNRPorBuk8v/2js5czGfNZuOuhFcJbPPm+pv3af7unbpvqHnvXZwg
	0yUVRT/aflRwEuCevBTQOTwDNMEp2uIpBEe7Zeiq3X4sWIPv1x6kmpxDF5bclNXm
	+mtWFjnB0JXFhHNnkYdhtR9OqHfiFKrq0pSvm6vRcKO+5xyvOONne2WLCCFRo/WH
	8JBTGEN0BkormaAxc7qg69wfRsBXDRpPGCYVim0TKAlLlpYacKBwD8jM7kUszoJf
	5Wtv/rPNRJYs3xieliARwWGoA8vd1f5hc3IMfoFUqRqfW579RQ==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49y8athypa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 13:51:41 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Fri, 24 Oct 2025 06:51:38 -0700
From: dchellam <divya.chellam@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][scarthgap][PATCH 2/2] jq: fix CVE-2025-9403
Date: Fri, 24 Oct 2025 19:21:08 +0530
Message-ID: <20251024135108.1327995-1-divya.chellam@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.11.232.110]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) To
 ala-exchng01.corp.ad.wrs.com (10.11.224.121)
X-Authority-Analysis: v=2.4 cv=N9ck1m9B c=1 sm=1 tr=0 ts=68fb846d cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=gmxlzscTznEA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=tX0wWbkNTWi5hoOBzXAA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI0MDEyMyBTYWx0ZWRfX37uFLlxrr+tN
 0MHR0PJgx6xp9MJ6RzYpIvTbM4G/pkJTR6qBpUat6OfDdnofkR2KepHc40/DUuz8Om6VsG7aEOd
 hjvo4goeJXLHo1ViQdgHaBED3keP+fPkekw1NP5d1ylczJwxpL9+N0KZoRJyb+oYkOAzxZdV+9k
 byVAi6ynSp7Apkqpbm9liGivz8/TEciKqFSy8K0zRzGriNQ2W9oe6Z4cM4BdtZI+VPJAK5ZmHNH
 kDWg3BTocTDqwHJwFSMyoLQk5rBiniFuI3vB0/NaWFDj8/vfq7V2R2cAWXR8RuklxtGbwqDuWZT
 xjCl8DvP1vnIg7+d28gPSzzFh5PydfGnVPFKaZyuFFBe5s5VxaMumw6dZ/EsFxEAoKTTDjGWUBw
 6PY9BqE6VbKwG/Xvuvdsg6QkvbjvcQ==
X-Proofpoint-ORIG-GUID: vi28OT0PAQMUU6iaAphrgLOqiUPiUp6k
X-Proofpoint-GUID: vi28OT0PAQMUU6iaAphrgLOqiUPiUp6k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-24_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 adultscore=0
 phishscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510240123
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 13:51:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120958

From: Divya Chellam <divya.chellam@windriver.com>

A vulnerability was determined in jqlang jq up to 1.6. Impacted is the
function run_jq_tests of the file jq_test.c of the component JSON Parser.
Executing manipulation can lead to reachable assertion. The attack
requires local access. The exploit has been publicly disclosed and may be
utilized. Other versions might be affected as well.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-9403

Upstream-patch:
https://github.com/jqlang/jq/commit/a4d9d540103ff9a262e304329c277ec89b27e5f9

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
---
 .../jq/jq/CVE-2025-9403.patch                 | 49 +++++++++++++++++++
 meta-oe/recipes-devtools/jq/jq_1.7.1.bb       |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2025-9403.patch

diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2025-9403.patch b/meta-oe/recipes-devtools/jq/jq/CVE-2025-9403.patch
new file mode 100644
index 0000000000..19d769a6f5
--- /dev/null
+++ b/meta-oe/recipes-devtools/jq/jq/CVE-2025-9403.patch
@@ -0,0 +1,49 @@
+From a4d9d540103ff9a262e304329c277ec89b27e5f9 Mon Sep 17 00:00:00 2001
+From: itchyny <itchyny@cybozu.co.jp>
+Date: Mon, 15 Sep 2025 07:47:51 +0900
+Subject: [PATCH] Fix expected value assertion for NaN value (fix #3393)
+ (#3408)
+
+CVE: CVE-2025-9403
+
+Upstream-Status: Backport [https://github.com/jqlang/jq/commit/a4d9d540103ff9a262e304329c277ec89b27e5f9]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ src/jq_test.c | 13 ++++++++-----
+ 1 file changed, 8 insertions(+), 5 deletions(-)
+
+diff --git a/src/jq_test.c b/src/jq_test.c
+index 3945686..f42b05c 100644
+--- a/src/jq_test.c
++++ b/src/jq_test.c
+@@ -2,6 +2,7 @@
+ #include <stdio.h>
+ #include <string.h>
+ #include <stdlib.h>
++#include <math.h>
+ #ifdef HAVE_PTHREAD
+ #include <pthread.h>
+ #endif
+@@ -208,11 +209,13 @@ static void run_jq_tests(jv lib_dirs, int verbose, FILE *testdata, int skip, int
+         printf(" for test at line number %u: %s\n", lineno, prog);
+         pass = 0;
+       }
+-      jv as_string = jv_dump_string(jv_copy(expected), rand() & ~(JV_PRINT_COLOR|JV_PRINT_REFCOUNT));
+-      jv reparsed = jv_parse_sized(jv_string_value(as_string), jv_string_length_bytes(jv_copy(as_string)));
+-      assert(jv_equal(jv_copy(expected), jv_copy(reparsed)));
+-      jv_free(as_string);
+-      jv_free(reparsed);
++      if (!(jv_get_kind(expected) == JV_KIND_NUMBER && isnan(jv_number_value(expected)))) {
++        jv as_string = jv_dump_string(jv_copy(expected), rand() & ~(JV_PRINT_COLOR|JV_PRINT_REFCOUNT));
++        jv reparsed = jv_parse_sized(jv_string_value(as_string), jv_string_length_bytes(jv_copy(as_string)));
++        assert(jv_equal(jv_copy(expected), jv_copy(reparsed)));
++        jv_free(as_string);
++        jv_free(reparsed);
++      }
+       jv_free(expected);
+       jv_free(actual);
+     }
+-- 
+2.40.0
+
diff --git a/meta-oe/recipes-devtools/jq/jq_1.7.1.bb b/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
index 9238474319..dfc8dda7ee 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
@@ -14,6 +14,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${BPN}-${PV}/${BPN}-${PV}.tar.gz \
     file://CVE-2024-23337.patch \
     file://CVE-2024-53427.patch \
     file://CVE-2025-48060.patch \
+    file://CVE-2025-9403.patch \
     "
 SRC_URI[sha256sum] = "478c9ca129fd2e3443fe27314b455e211e0d8c60bc8ff7df703873deeee580c2"
 
-- 
2.40.0


