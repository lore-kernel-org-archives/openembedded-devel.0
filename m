Return-Path: <Divya.Chellam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96674C02198
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 12:25:57 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.114762.1738671955526845603
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Feb 2025 04:25:55 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=413012606e=divya.chellam@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 514BktwH001915
	for <openembedded-devel@lists.openembedded.org>; Tue, 4 Feb 2025 12:25:54 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44h8u12wmv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 04 Feb 2025 12:25:54 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 4 Feb 2025 04:25:52 -0800
From: dchellam <divya.chellam@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 2/2] redis: fix CVE-2024-51741
Date: Tue, 4 Feb 2025 12:25:28 +0000
Message-ID: <20250204122528.2195148-2-divya.chellam@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250204122528.2195148-1-divya.chellam@windriver.com>
References: <20250204122528.2195148-1-divya.chellam@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: VvO2xLhpbNXT_0_a6QTtBGsGH5jLjZKW
X-Authority-Analysis: v=2.4 cv=HuqMG1TS c=1 sm=1 tr=0 ts=67a20752 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=T2h4t0Lz3GQA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=7UKGVgRVAAAA:8 a=t7CeM3EgAAAA:8 a=JYdYmieVAAAA:8
 a=HxdTy0N_nDoWxyj1GMkA:9 a=8Ox4Rr8FuIIqx5qz5MW0:22 a=FdTzh2GWekK77mhwV6Dw:22 a=NVBS5RDmlnYdNWefw12X:22
X-Proofpoint-GUID: VvO2xLhpbNXT_0_a6QTtBGsGH5jLjZKW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_06,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015
 impostorscore=0 spamscore=0 lowpriorityscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502040099
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Feb 2025 12:25:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115271

From: Divya Chellam <divya.chellam@windriver.com>

Redis is an open source, in-memory database that persists on disk.
An authenticated with sufficient privileges may create a malformed
ACL selector which, when accessed, triggers a server panic and
subsequent denial of service. The problem is fixed in Redis 7.2.7
and 7.4.2.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2024-51741

Upstream-patch:
https://github.com/redis/redis/commit/15e212bf69de28d2b4585aa79cc2a40f49e4a94d

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
---
 .../redis/redis-7.0.13/CVE-2024-51741.patch   | 89 +++++++++++++++++++
 .../recipes-extended/redis/redis_7.0.13.bb    |  1 +
 2 files changed, 90 insertions(+)
 create mode 100644 meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2024-51741.patch

diff --git a/meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2024-51741.patch b/meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2024-51741.patch
new file mode 100644
index 0000000000..e3a43fe896
--- /dev/null
+++ b/meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2024-51741.patch
@@ -0,0 +1,89 @@
+From 15e212bf69de28d2b4585aa79cc2a40f49e4a94d Mon Sep 17 00:00:00 2001
+From: YaacovHazan <yaacov.hazan@redis.com>
+Date: Sun, 15 Dec 2024 11:27:48 +0200
+Subject: [PATCH] Fix Read/Write key pattern selector (CVE-2024-51741)
+
+The '%' rule must contain one or both of R/W
+
+CVE: CVE-2024-51741
+
+Upstream-Status: Backport [https://github.com/redis/redis/commit/15e212bf69de28d2b4585aa79cc2a40f49e4a94d]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ src/acl.c             | 11 ++++++++---
+ tests/unit/acl-v2.tcl | 26 ++++++++++++++++++++++++++
+ 2 files changed, 34 insertions(+), 3 deletions(-)
+
+diff --git a/src/acl.c b/src/acl.c
+index 6b53d90..ed6dc97 100644
+--- a/src/acl.c
++++ b/src/acl.c
+@@ -1031,19 +1031,24 @@ int ACLSetSelector(aclSelector *selector, const char* op, size_t oplen) {
+         int flags = 0;
+         size_t offset = 1;
+         if (op[0] == '%') {
++            int perm_ok = 1;
+             for (; offset < oplen; offset++) {
+                 if (toupper(op[offset]) == 'R' && !(flags & ACL_READ_PERMISSION)) {
+                     flags |= ACL_READ_PERMISSION;
+                 } else if (toupper(op[offset]) == 'W' && !(flags & ACL_WRITE_PERMISSION)) {
+                     flags |= ACL_WRITE_PERMISSION;
+-                } else if (op[offset] == '~' && flags) {
++                } else if (op[offset] == '~') {
+                     offset++;
+                     break;
+                 } else {
+-                    errno = EINVAL;
+-                    return C_ERR;
++                    perm_ok = 0;
++                    break;
+                 }
+             }
++            if (!flags || !perm_ok) {
++                errno = EINVAL;
++                return C_ERR;
++            }
+         } else {
+             flags = ACL_ALL_PERMISSION;
+         }
+diff --git a/tests/unit/acl-v2.tcl b/tests/unit/acl-v2.tcl
+index d836f9c..0b83b89 100644
+--- a/tests/unit/acl-v2.tcl
++++ b/tests/unit/acl-v2.tcl
+@@ -107,6 +107,32 @@ start_server {tags {"acl external:skip"}} {
+         assert_match "*NOPERM*keys*" $err
+     }
+ 
++    test {Validate read and write permissions format - empty permission} {
++        catch {r ACL SETUSER key-permission-RW %~} err
++        set err
++    } {ERR Error in ACL SETUSER modifier '%~': Syntax error}
++
++    test {Validate read and write permissions format - empty selector} {
++        catch {r ACL SETUSER key-permission-RW %} err
++        set err
++    } {ERR Error in ACL SETUSER modifier '%': Syntax error}
++
++    test {Validate read and write permissions format - empty pattern} {
++        # Empty pattern results with R/W access to no key
++        r ACL SETUSER key-permission-RW on nopass %RW~ +@all
++        $r2 auth key-permission-RW password
++        catch {$r2 SET x 5} err
++        set err
++    } {NOPERM No permissions to access a key}
++
++    test {Validate read and write permissions format - no pattern} {
++        # No pattern results with R/W access to no key (currently we accept this syntax error)
++        r ACL SETUSER key-permission-RW on nopass %RW +@all
++        $r2 auth key-permission-RW password
++        catch {$r2 SET x 5} err
++        set err
++    } {NOPERM No permissions to access a key}
++
+     test {Test separate read and write permissions on different selectors are not additive} {
+         r ACL SETUSER key-permission-RW-selector on nopass "(%R~read* +@all)" "(%W~write* +@all)"
+         $r2 auth key-permission-RW-selector password
+-- 
+2.40.0
+
diff --git a/meta-oe/recipes-extended/redis/redis_7.0.13.bb b/meta-oe/recipes-extended/redis/redis_7.0.13.bb
index 3535da9664..e7bff9b4ec 100644
--- a/meta-oe/recipes-extended/redis/redis_7.0.13.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.0.13.bb
@@ -22,6 +22,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://CVE-2024-31228.patch \
            file://CVE-2024-31449.patch \
            file://CVE-2024-46981.patch \
+           file://CVE-2024-51741.patch \
            "
 SRC_URI[sha256sum] = "97065774d5fb8388eb0d8913458decfcb167d356e40d31dd01cd30c1cc391673"
 
-- 
2.40.0


