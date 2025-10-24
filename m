Return-Path: <Divya.Chellam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B29C1CCD1A5
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 12:27:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.9429.1761308812872051014
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Oct 2025 05:26:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Vv++4kbf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2392d52613=divya.chellam@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59O5wThA2887757
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 12:26:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=As8FJrarDe3LIotdpOP0WYqFtmv71TVmUl/tTjub2/Y=; b=Vv++4kbfs6CO
	L/lr1/94OWZSu3VT0reoSneF4NFPWSHgmBds+35EWFnSAoIY6TQCY23bHi4n/j5X
	kgDhe0rCJesfbCEJNoHExmM1hskOcBUD/dTrmK3XVaJdgiaEV88gwSEkoTsPIqla
	bwr6sDCJ9rfMky1pa2lEvpw16z9RcqYT7I7VD72CSYjT623RQd9uku3eXtKKvuz3
	xVx2VDuVAw25KNWibPHD2/RLYtwpBxnc11q1rAMojeDqlCag2Iu6s4QuODYI21Ei
	zz8NVAzcud9XKs/Dd1yOvA61/KVDeiNpk57zYm1WnwC451rRW/LskvAKrfWeu+Wp
	twz2VIVooA==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49y8athvps-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 12:26:51 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Fri, 24 Oct 2025 05:26:49 -0700
From: dchellam <divya.chellam@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 2/3] jq: fix CVE-2025-9403
Date: Fri, 24 Oct 2025 17:56:23 +0530
Message-ID: <20251024122624.1325594-2-divya.chellam@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20251024122624.1325594-1-divya.chellam@windriver.com>
References: <20251024122624.1325594-1-divya.chellam@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.11.232.110]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) To
 ala-exchng01.corp.ad.wrs.com (10.11.224.121)
X-Authority-Analysis: v=2.4 cv=N9ck1m9B c=1 sm=1 tr=0 ts=68fb708b cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=gmxlzscTznEA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=tX0wWbkNTWi5hoOBzXAA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI0MDExMCBTYWx0ZWRfX4Ksz4nfi7y3B
 BWTGM/A8eeXVtOk5KJhOZimZSfanby6RMLDgS/m0h9U+k6UDgpuRNVCpAaoBCevix+hepWAsJD2
 IA1DxL5EBkzNn78rxFEzN1f1h9yPXIbnEkmbbUvXTZ3RcSK+UvvNfdBMVBcjvGWUvYLHO58uXnf
 Ks0RVLAE7d2kiz2L0fYDF6bYBCUxpo7aERl9BZxsXFNIF76XN3m5YdQ2Yi8Ymm2Ydb3c8ogmH15
 D6iifCaGnof/j+5Umgeu/JuVrcAwotni/G+tiQ0nslHBfH/Q9YFrJDRVQAB1IQ+WIhW7NRlVd+U
 FG9eDriu64WqKKrMOU5nD+hEB6spRUr9Rm0VWQI+EycxEihMDef1s7odCcKwFrjrgIgyJ2pAXVe
 Put/3+dok4Bq38/3KMGu41da3hskDg==
X-Proofpoint-ORIG-GUID: uHuuT9EmNlEqNP3t_5L0M66muyO4HkD8
X-Proofpoint-GUID: uHuuT9EmNlEqNP3t_5L0M66muyO4HkD8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-24_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 adultscore=0
 phishscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510240110
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 12:27:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120956

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
 meta-oe/recipes-devtools/jq/jq_git.bb         |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2025-9403.patch

diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2025-9403.patch b/meta-oe/recipes-devtools/jq/jq/CVE-2025-9403.patch
new file mode 100644
index 0000000000..cb180c13f9
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
+index eed633f..40a1d23 100644
+--- a/src/jq_test.c
++++ b/src/jq_test.c
+@@ -2,6 +2,7 @@
+ #include <stdio.h>
+ #include <string.h>
+ #include <stdlib.h>
++#include <math.h>
+ #include "jv.h"
+ #include "jq.h"
+ 
+@@ -200,11 +201,13 @@ static void run_jq_tests(jv lib_dirs, int verbose, FILE *testdata, int skip, int
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
diff --git a/meta-oe/recipes-devtools/jq/jq_git.bb b/meta-oe/recipes-devtools/jq/jq_git.bb
index d36723cff4..35dc6ec9fa 100644
--- a/meta-oe/recipes-devtools/jq/jq_git.bb
+++ b/meta-oe/recipes-devtools/jq/jq_git.bb
@@ -15,6 +15,7 @@ SRC_URI = " \
     file://CVE-2025-48060.patch \
     file://CVE-2024-53427-01.patch \
     file://CVE-2024-53427-02.patch \
+    file://CVE-2025-9403.patch \
     "
 SRCREV = "a9f97e9e61a910a374a5d768244e8ad63f407d3e"
 S = "${WORKDIR}/git"
-- 
2.40.0


