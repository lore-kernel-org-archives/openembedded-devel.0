Return-Path: <Divya.Chellam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41CF2C02195
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 12:51:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.18530.1738327893247954391
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Jan 2025 04:51:33 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4126352c6f=divya.chellam@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50V9aNX6012901
	for <openembedded-devel@lists.openembedded.org>; Fri, 31 Jan 2025 12:51:32 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44gf780q3b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 31 Jan 2025 12:51:32 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 31 Jan 2025 04:51:29 -0800
From: dchellam <divya.chellam@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 4/5] redis: fix CVE-2024-31228
Date: Fri, 31 Jan 2025 12:50:59 +0000
Message-ID: <20250131125100.3348102-4-divya.chellam@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250131125100.3348102-1-divya.chellam@windriver.com>
References: <20250131125100.3348102-1-divya.chellam@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Authority-Analysis: v=2.4 cv=JOrBs9Kb c=1 sm=1 tr=0 ts=679cc754 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=VdSt8ZQiCzkA:10 a=xNf9USuDAAAA:8 a=NEAV23lmAAAA:8 a=7UKGVgRVAAAA:8 a=t7CeM3EgAAAA:8 a=hR66z_WBAAAA:8
 a=6VaAEKUzP7h-Snr28NQA:9 a=8Ox4Rr8FuIIqx5qz5MW0:22 a=FdTzh2GWekK77mhwV6Dw:22 a=rIFd7wX85fjrbk78xK_P:22
X-Proofpoint-ORIG-GUID: 47HMxMyDeh6wo6vuz_E6HR2e6nEHlQ2m
X-Proofpoint-GUID: 47HMxMyDeh6wo6vuz_E6HR2e6nEHlQ2m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_04,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 mlxscore=0 adultscore=0 spamscore=0
 clxscore=1015 phishscore=0 impostorscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2501310098
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Jan 2025 12:51:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115194

From: Divya Chellam <divya.chellam@windriver.com>

Redis is an open source, in-memory database that persists on disk.
Authenticated users can trigger a denial-of-service by using specially
crafted, long string match patterns on supported commands such as
`KEYS`, `SCAN`, `PSUBSCRIBE`, `FUNCTION LIST`, `COMMAND LIST` and ACL
definitions. Matching of extremely long patterns may result in
unbounded recursion, leading to stack overflow and process crash.
This problem has been fixed in Redis versions 6.2.16, 7.2.6, and 7.4.1.
Users are advised to upgrade. There are no known workarounds for this
vulnerability.

References:
https://security-tracker.debian.org/tracker/CVE-2024-31228

Upstream-patch:
https://github.com/redis/redis/commit/9317bf64659b33166a943ec03d5d9b954e86afb0

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
---
 .../redis/redis-7.0.13/CVE-2024-31228.patch   | 68 +++++++++++++++++++
 .../redis/redis/CVE-2024-31228.patch          | 68 +++++++++++++++++++
 .../recipes-extended/redis/redis_6.2.12.bb    |  1 +
 .../recipes-extended/redis/redis_7.0.13.bb    |  1 +
 4 files changed, 138 insertions(+)
 create mode 100644 meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2024-31228.patch
 create mode 100644 meta-oe/recipes-extended/redis/redis/CVE-2024-31228.patch

diff --git a/meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2024-31228.patch b/meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2024-31228.patch
new file mode 100644
index 0000000000..deb9033c60
--- /dev/null
+++ b/meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2024-31228.patch
@@ -0,0 +1,68 @@
+From 9317bf64659b33166a943ec03d5d9b954e86afb0 Mon Sep 17 00:00:00 2001
+From: Oran Agra <oran@redislabs.com>
+Date: Wed, 2 Oct 2024 20:11:01 +0300
+Subject: [PATCH] Prevent pattern matching abuse (CVE-2024-31228)
+
+CVE: CVE-2024-31228
+
+Upstream-Status: Backport[https://github.com/redis/redis/commit/9317bf64659b33166a943ec03d5d9b954e86afb0]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ src/util.c              | 9 ++++++---
+ tests/unit/keyspace.tcl | 6 ++++++
+ 2 files changed, 12 insertions(+), 3 deletions(-)
+
+diff --git a/src/util.c b/src/util.c
+index 8ce2c5f..3a4c9b0 100644
+--- a/src/util.c
++++ b/src/util.c
+@@ -51,8 +51,11 @@
+ 
+ /* Glob-style pattern matching. */
+ static int stringmatchlen_impl(const char *pattern, int patternLen,
+-        const char *string, int stringLen, int nocase, int *skipLongerMatches)
++        const char *string, int stringLen, int nocase, int *skipLongerMatches, int nesting)
+ {
++    /* Protection against abusive patterns. */
++    if (nesting > 1000) return 0;
++
+     while(patternLen && stringLen) {
+         switch(pattern[0]) {
+         case '*':
+@@ -64,7 +67,7 @@ static int stringmatchlen_impl(const char *pattern, int patternLen,
+                 return 1; /* match */
+             while(stringLen) {
+                 if (stringmatchlen_impl(pattern+1, patternLen-1,
+-                            string, stringLen, nocase, skipLongerMatches))
++                            string, stringLen, nocase, skipLongerMatches, nesting+1))
+                     return 1; /* match */
+                 if (*skipLongerMatches)
+                     return 0; /* no match */
+@@ -186,7 +189,7 @@ static int stringmatchlen_impl(const char *pattern, int patternLen,
+ int stringmatchlen(const char *pattern, int patternLen,
+         const char *string, int stringLen, int nocase) {
+     int skipLongerMatches = 0;
+-    return stringmatchlen_impl(pattern,patternLen,string,stringLen,nocase,&skipLongerMatches);
++    return stringmatchlen_impl(pattern,patternLen,string,stringLen,nocase,&skipLongerMatches,0);
+ }
+ 
+ int stringmatch(const char *pattern, const char *string, int nocase) {
+diff --git a/tests/unit/keyspace.tcl b/tests/unit/keyspace.tcl
+index 437f71f..988389f 100644
+--- a/tests/unit/keyspace.tcl
++++ b/tests/unit/keyspace.tcl
+@@ -495,4 +495,10 @@ start_server {tags {"keyspace"}} {
+         r SET aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa 1
+         r KEYS "a*a*a*a*a*a*a*a*a*a*a*a*a*a*a*a*a*a*a*a*b"
+     } {}
++
++    test {Regression for pattern matching very long nested loops} {
++        r flushdb
++        r SET [string repeat "a" 50000] 1
++        r KEYS [string repeat "*?" 50000]
++    } {}
+ }
+-- 
+2.40.0
+
diff --git a/meta-oe/recipes-extended/redis/redis/CVE-2024-31228.patch b/meta-oe/recipes-extended/redis/redis/CVE-2024-31228.patch
new file mode 100644
index 0000000000..d86e6c9e72
--- /dev/null
+++ b/meta-oe/recipes-extended/redis/redis/CVE-2024-31228.patch
@@ -0,0 +1,68 @@
+From 9317bf64659b33166a943ec03d5d9b954e86afb0 Mon Sep 17 00:00:00 2001
+From: Oran Agra <oran@redislabs.com>
+Date: Wed, 2 Oct 2024 20:11:01 +0300
+Subject: [PATCH] Prevent pattern matching abuse (CVE-2024-31228)
+
+CVE: CVE-2024-31228
+
+Upstream-Status: Backport[https://github.com/redis/redis/commit/9317bf64659b33166a943ec03d5d9b954e86afb0]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ src/util.c              | 9 ++++++---
+ tests/unit/keyspace.tcl | 6 ++++++
+ 2 files changed, 12 insertions(+), 3 deletions(-)
+
+diff --git a/src/util.c b/src/util.c
+index e122a26..5763a2b 100644
+--- a/src/util.c
++++ b/src/util.c
+@@ -46,8 +46,11 @@
+ 
+ /* Glob-style pattern matching. */
+ static int stringmatchlen_impl(const char *pattern, int patternLen,
+-        const char *string, int stringLen, int nocase, int *skipLongerMatches)
++        const char *string, int stringLen, int nocase, int *skipLongerMatches, int nesting)
+ {
++    /* Protection against abusive patterns. */
++    if (nesting > 1000) return 0;
++
+     while(patternLen && stringLen) {
+         switch(pattern[0]) {
+         case '*':
+@@ -59,7 +62,7 @@ static int stringmatchlen_impl(const char *pattern, int patternLen,
+                 return 1; /* match */
+             while(stringLen) {
+                 if (stringmatchlen_impl(pattern+1, patternLen-1,
+-                            string, stringLen, nocase, skipLongerMatches))
++                            string, stringLen, nocase, skipLongerMatches, nesting+1))
+                     return 1; /* match */
+                 if (*skipLongerMatches)
+                     return 0; /* no match */
+@@ -181,7 +184,7 @@ static int stringmatchlen_impl(const char *pattern, int patternLen,
+ int stringmatchlen(const char *pattern, int patternLen,
+         const char *string, int stringLen, int nocase) {
+     int skipLongerMatches = 0;
+-    return stringmatchlen_impl(pattern,patternLen,string,stringLen,nocase,&skipLongerMatches);
++    return stringmatchlen_impl(pattern,patternLen,string,stringLen,nocase,&skipLongerMatches,0);
+ }
+ 
+ int stringmatch(const char *pattern, const char *string, int nocase) {
+diff --git a/tests/unit/keyspace.tcl b/tests/unit/keyspace.tcl
+index 92029a7..70bc252 100644
+--- a/tests/unit/keyspace.tcl
++++ b/tests/unit/keyspace.tcl
+@@ -485,4 +485,10 @@ start_server {tags {"keyspace"}} {
+         r SET aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa 1
+         r KEYS "a*a*a*a*a*a*a*a*a*a*a*a*a*a*a*a*a*a*a*a*b"
+     } {}
++
++    test {Regression for pattern matching very long nested loops} {
++        r flushdb
++        r SET [string repeat "a" 50000] 1
++        r KEYS [string repeat "*?" 50000]
++    } {}
+ }
+-- 
+2.40.0
+
diff --git a/meta-oe/recipes-extended/redis/redis_6.2.12.bb b/meta-oe/recipes-extended/redis/redis_6.2.12.bb
index 52dcffedb8..bea98100a7 100644
--- a/meta-oe/recipes-extended/redis/redis_6.2.12.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.2.12.bb
@@ -17,6 +17,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://GNU_SOURCE.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
            file://CVE-2023-45145.patch \
+           file://CVE-2024-31228.patch \
            "
 SRC_URI[sha256sum] = "75352eef41e97e84bfa94292cbac79e5add5345fc79787df5cbdff703353fb1b"
 
diff --git a/meta-oe/recipes-extended/redis/redis_7.0.13.bb b/meta-oe/recipes-extended/redis/redis_7.0.13.bb
index 6a2a7ce966..249f002a1b 100644
--- a/meta-oe/recipes-extended/redis/redis_7.0.13.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.0.13.bb
@@ -19,6 +19,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://CVE-2023-41056.patch \
            file://CVE-2023-45145.patch \
            file://CVE-2024-31227.patch \
+           file://CVE-2024-31228.patch \
            "
 SRC_URI[sha256sum] = "97065774d5fb8388eb0d8913458decfcb167d356e40d31dd01cd30c1cc391673"
 
-- 
2.40.0


