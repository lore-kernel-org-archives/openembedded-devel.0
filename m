Return-Path: <Divya.Chellam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 958A0C02197
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 12:25:57 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.115237.1738671954667137318
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Feb 2025 04:25:54 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=413012606e=divya.chellam@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 514BGN9I030607
	for <openembedded-devel@lists.openembedded.org>; Tue, 4 Feb 2025 12:25:53 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44hak8auw2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 04 Feb 2025 12:25:52 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 4 Feb 2025 04:25:50 -0800
From: dchellam <divya.chellam@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 1/2] redis: fix CVE-2024-46981
Date: Tue, 4 Feb 2025 12:25:27 +0000
Message-ID: <20250204122528.2195148-1-divya.chellam@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Authority-Analysis: v=2.4 cv=ecXHf6EH c=1 sm=1 tr=0 ts=67a20750 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=T2h4t0Lz3GQA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=7UKGVgRVAAAA:8 a=t7CeM3EgAAAA:8 a=JYdYmieVAAAA:8
 a=RIx4fjjTQRzjdESwaqkA:9 a=8Ox4Rr8FuIIqx5qz5MW0:22 a=FdTzh2GWekK77mhwV6Dw:22 a=NVBS5RDmlnYdNWefw12X:22
X-Proofpoint-ORIG-GUID: 5jLkfI02l0U1n6Yf568MTv93XQbghn6a
X-Proofpoint-GUID: 5jLkfI02l0U1n6Yf568MTv93XQbghn6a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_06,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 adultscore=0 malwarescore=0 mlxlogscore=999 priorityscore=1501
 impostorscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 bulkscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502040099
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Feb 2025 12:25:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115270

From: Divya Chellam <divya.chellam@windriver.com>

Redis is an open source, in-memory database that persists on disk.
An authenticated user may use a specially crafted Lua script to
manipulate the garbage collector and potentially lead to remote
code execution. The problem is fixed in 7.4.2, 7.2.7, and 6.2.17.
An additional workaround to mitigate the problem without patching
the redis-server executable is to prevent users from executing Lua
scripts. This can be done using ACL to restrict EVAL and EVALSHA
commands.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2024-46981

Upstream-patch:
https://github.com/redis/redis/commit/e344b2b5879aa52870e6838212dfb78b7968fcbf

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
---
 .../redis/redis-7.0.13/CVE-2024-46981.patch   | 32 +++++++++++++++
 .../redis/redis/CVE-2024-46981.patch          | 39 +++++++++++++++++++
 .../recipes-extended/redis/redis_6.2.12.bb    |  1 +
 .../recipes-extended/redis/redis_7.0.13.bb    |  1 +
 4 files changed, 73 insertions(+)
 create mode 100644 meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2024-46981.patch
 create mode 100644 meta-oe/recipes-extended/redis/redis/CVE-2024-46981.patch

diff --git a/meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2024-46981.patch b/meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2024-46981.patch
new file mode 100644
index 0000000000..870ef71f52
--- /dev/null
+++ b/meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2024-46981.patch
@@ -0,0 +1,32 @@
+From e344b2b5879aa52870e6838212dfb78b7968fcbf Mon Sep 17 00:00:00 2001
+From: YaacovHazan <yaacov.hazan@redis.com>
+Date: Sun, 15 Dec 2024 21:33:11 +0200
+Subject: [PATCH] Fix LUA garbage collector (CVE-2024-46981) 
+
+Reset GC state before closing the lua VM to prevent user data 
+to be wrongly freed while still might be used on destructor callbacks.
+
+CVE: CVE-2024-46981
+
+Upstream-Status: Backport [https://github.com/redis/redis/commit/e344b2b5879aa52870e6838212dfb78b7968fcbf]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ src/eval.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/eval.c b/src/eval.c
+index 8190856..a562335 100644
+--- a/src/eval.c
++++ b/src/eval.c
+@@ -273,6 +273,7 @@ void scriptingRelease(int async) {
+     else
+         dictRelease(lctx.lua_scripts);
+     lctx.lua_scripts_mem = 0;
++    lua_gc(lctx.lua, LUA_GCCOLLECT, 0);
+     lua_close(lctx.lua);
+ }
+ 
+-- 
+2.40.0
+
diff --git a/meta-oe/recipes-extended/redis/redis/CVE-2024-46981.patch b/meta-oe/recipes-extended/redis/redis/CVE-2024-46981.patch
new file mode 100644
index 0000000000..c02dd21271
--- /dev/null
+++ b/meta-oe/recipes-extended/redis/redis/CVE-2024-46981.patch
@@ -0,0 +1,39 @@
+From e344b2b5879aa52870e6838212dfb78b7968fcbf Mon Sep 17 00:00:00 2001
+From: YaacovHazan <yaacov.hazan@redis.com>
+Date: Sun, 15 Dec 2024 21:33:11 +0200
+Subject: [PATCH] Fix LUA garbage collector (CVE-2024-46981)
+
+Reset GC state before closing the lua VM to prevent user data
+to be wrongly freed while still might be used on destructor callbacks.
+
+Conflicts:
+Since luaCtx lctx structure  introduced in later versions [1]
+used already existed redisServer server structure.
+
+Reference:
+[1] https://github.com/redis/redis/commit/e0cd580aefe13e49df802fec5135e4f22d46e758
+
+CVE: CVE-2024-46981
+
+Upstream-Status: Backport [https://github.com/redis/redis/commit/e344b2b5879aa52870e6838212dfb78b7968fcbf]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ src/scripting.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/scripting.c b/src/scripting.c
+index 9b926e8..656d4dd 100644
+--- a/src/scripting.c
++++ b/src/scripting.c
+@@ -1467,6 +1467,7 @@ void scriptingRelease(int async) {
+     else
+         dictRelease(server.lua_scripts);
+     server.lua_scripts_mem = 0;
++    lua_gc(server.lua, LUA_GCCOLLECT, 0);
+     lua_close(server.lua);
+ }
+ 
+-- 
+2.40.0
+
diff --git a/meta-oe/recipes-extended/redis/redis_6.2.12.bb b/meta-oe/recipes-extended/redis/redis_6.2.12.bb
index a13dfdbe45..0fdd3da327 100644
--- a/meta-oe/recipes-extended/redis/redis_6.2.12.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.2.12.bb
@@ -19,6 +19,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://CVE-2023-45145.patch \
            file://CVE-2024-31228.patch \
            file://CVE-2024-31449.patch \
+           file://CVE-2024-46981.patch \
            "
 SRC_URI[sha256sum] = "75352eef41e97e84bfa94292cbac79e5add5345fc79787df5cbdff703353fb1b"
 
diff --git a/meta-oe/recipes-extended/redis/redis_7.0.13.bb b/meta-oe/recipes-extended/redis/redis_7.0.13.bb
index fa1716a192..3535da9664 100644
--- a/meta-oe/recipes-extended/redis/redis_7.0.13.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.0.13.bb
@@ -21,6 +21,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://CVE-2024-31227.patch \
            file://CVE-2024-31228.patch \
            file://CVE-2024-31449.patch \
+           file://CVE-2024-46981.patch \
            "
 SRC_URI[sha256sum] = "97065774d5fb8388eb0d8913458decfcb167d356e40d31dd01cd30c1cc391673"
 
-- 
2.40.0


