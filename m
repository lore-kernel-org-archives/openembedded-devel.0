Return-Path: <tugrul.kukul@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D43B6C54F51
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 07:31:35 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.69])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6131.1785310290903318446
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jul 2026 00:31:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=iHiIt0uF;
 spf=pass (domain: est.tech, ip: 40.107.162.69, mailfrom: tugrul.kukul@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YLddedh3Hhh1baFoVP2FKeOHBjm4ct/8BCpE92oWvS2LyMBqoosx9jvdRjSHfC8+wqEE1hHqfAUAVPCf5ECsAxHDfscI9+dfBumxKGO+eaogFGTbNO7+53WI+Oln3hyiXR/WrUdtv/RF1QtZcsfQDMwVJh2LkPljvptvGIaV8Gr+0Vyw3okWMX7ibxtANY3BRDCkvsP86woTy28cANYM0TVpXJ2+0n3/jB20848KqxvG+JPD0VJY5kKIB8s8IY+PvZumYSeG8LHVFQnUsopj3gMe75hHx5pUW4ZjSCfmVBf+eXFBkdAfESlJwz8s54rowksIyXXMZ9P+I6ppZNQ/qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5xcQrrwLodBBtNzOoy3zGdHKXvWTD6MmcYjhf1ANaPs=;
 b=DI4je8dq75sXqx945iozG05WGq/qzFoGLjukHTxxNknTUQ8rvBgo/DKuTcJII89x7hyFljwVhIjSMypO42kYedJvlQ3rFgE9hRF8fWArrs69ldPW6JuXgXsTY7sV76W3+4mYbL5Tof2Y+Dcipmqw9KSjZbLPRYfiTzYmPVLKD0Ot9Ji2OOX1BKHcW3DcWGknUMt1TKmQf6vIPtReSJKm1dNRa2coYCC9I1W6iTNvY+OGRSJUICAOawbQEDlgq4WoFnku6UAj0+NaIGXLRCtlT/u7qHcdEVud26b6HXL+SEHZ5PB/VImF9uJY7vU0Drai34ShRsgskVLYNIa2HcM/vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5xcQrrwLodBBtNzOoy3zGdHKXvWTD6MmcYjhf1ANaPs=;
 b=iHiIt0uF0AwN3LFv+Fa/ZbDqb+4MQt0s+3Axu1noStrZxPqKCG6VVjpfMI2ESxOLv57s6tmBLkBEHahbdPMnrnf/FmW+bDfkQlF4dxH9VmoKVCvr1QbxXoBcqLVc2MQ+fPC9BF5pGcqTTMhmHEyKYyot2Ln6Dz7r12BHl62OKeCvs754GaDMGgwmT1ZcH/fdwHAyBDI6SzXUHEt1NQFUsLiWJ9oZAelUpj/0a9GZvO39W7SYizMFFHIiq79/5NzYuTuOU1tA6F4hjIL2+2eCKnXWvz2n/9mKo8KEc7tPCluf+D2CAlu1qw69Uk8GVfLHNPmyW5XG8+LGHpi71ZJQ1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DB8P189MB0966.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:16b::8) by
 FRWP189MB3228.EURP189.PROD.OUTLOOK.COM (2603:10a6:d10:182::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.7; Wed, 29 Jul 2026 07:31:26 +0000
Received: from DB8P189MB0966.EURP189.PROD.OUTLOOK.COM
 ([fe80::48c:33b2:d870:d0ca]) by DB8P189MB0966.EURP189.PROD.OUTLOOK.COM
 ([fe80::48c:33b2:d870:d0ca%6]) with mapi id 15.21.0292.005; Wed, 29 Jul 2026
 07:31:25 +0000
From: tugrul.kukul@est.tech
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH] jq: fix CVE-2026-39956
Date: Wed, 29 Jul 2026 09:31:23 +0200
Message-ID: <20260729073123.25188-1-tugrul.kukul@est.tech>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU6P191CA0050.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:53e::13) To DB8P189MB0966.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:16b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8P189MB0966:EE_|FRWP189MB3228:EE_
X-MS-Office365-Filtering-Correlation-Id: c509babf-c12d-442e-1331-08deed4365b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|13003099007|6133799003|56012099006|11063799006|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	TS+8FFuRvgvSixiwBZoF4tcdJZjU6vAduoZEJaydo/y+927p93IiGB9bGP5ACWSlWZKKu+3gL2OjoOADrgbp4DR0azu/zvI3oH27qXsueWgzvLLedSlyzKUq2osfvILIlMqHTX/9dg8tgRQrvVeJ2PYwfFHvbxha4cbqmID589+3n7F0a4c8NNLB+QNlYdlt46DLzgEnd/6tZcEq7TY6m3q7rbPpJe2xwZRTARB2CJAxcdAmFQ+SkF66KF3NsFyr2Wtr3v935Kgt4v/L6dKBpttmnP5PgL2vVbK5AWlY6+AeNkl37syCvbXquCkA4O/o5N3TM7/6odp8Uf+6q8sTwrXkqh7H0zBv7JwzdoEbsvy+aruKcmN6ptV4xHc5Obbz6elKy/2UycaXKf0S3fVWAXBWMJ+2N2OcWvZVGieUn/Vf3D/4GvDskHxtAbN+Kf2BjTV1XBslwSnyvOnRO4C4cnGPaXkAAAe+6R8ViG4BfZ8e72QTuWn9+MDYDbX+EfGrNB6NnDAfFSbqb1ZnRlgPbIXoOwO4PGr1za32ATn/YvY/1ibUcJBoIUXXRC9Dks23Uau4QQJscgzrfYQ50pYED/0J8tITwXIJOMRxE4LwaJfAO0Puybm4OjxHhMV5GmjN
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8P189MB0966.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(13003099007)(6133799003)(56012099006)(11063799006)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+S9PxXbDaMPc8CNcUlCNxtv/oR9NFgRGTMWXEmZLlV7adH4bCu8jBVBYJcnK?=
 =?us-ascii?Q?XxCTEzre5Q0R2lfVXPg7XR0Al92Q1G8QhCb9nVxVrNCoBgVG7jjtPWwXjNaE?=
 =?us-ascii?Q?XkQYBQFairYXLwpdImKhp/fBh8iTKPLycmK7T8XkfyKSwKxVpy1YKtwFHYpc?=
 =?us-ascii?Q?w+rgT9GWntBxmETqqenGiYK7plck2B7eIfLfZiI4EJ2q+Qqebv7oGEhgl3M8?=
 =?us-ascii?Q?saNO7hbC+DEt09cUMdH3hb5TAlVMIQmNuu/ZhjGBN/CE4uOszRM6xaZThm7g?=
 =?us-ascii?Q?LHlrSkwysQ9tiqwQqRh5xAFiSJ3+wMaUfD42CynLLApJla+3FysoQ+g4uQY6?=
 =?us-ascii?Q?yTJwjcH2SIdcE5VGwMYRXZ4nOlL7CJDs3s03PdjPOF7b6NNHBb/CXXSwaJzO?=
 =?us-ascii?Q?owQ92Pu0p/oDeg0aOmzkfVJdCZlmR2f22kDH4VKQOS3JPVK0W7DI11RRSYGx?=
 =?us-ascii?Q?3dKBSMhYP2ct8HCg/lvd7rsWFyPL2wGF/jsFwKsJrANphE9DrmynlWpsPB7e?=
 =?us-ascii?Q?zLxO5vEduMV6LpFvRS0JPFUubaAwfxHe2s3vcm2i8mT0ktaNJsoo8ZVo4kXs?=
 =?us-ascii?Q?Fqva/hYb7cCXAuJhAmQk9mSq0SFKAqF8opADAiylw1wAzeg1z3L/T32J2u1q?=
 =?us-ascii?Q?pJiPLK+AdxasJt1Fp0rFL9WxjtB2NkNZ6ZFB5F+JJDYlAeQhYublvpTGSQGQ?=
 =?us-ascii?Q?Z6Gywh+KdJtwyqfGnuXcpvaq56pHDJMXx0APXAlyzmdgSUkyscZ79ZHi+sna?=
 =?us-ascii?Q?F+c1qiSRFlKrhOOYIDskO+nrogdxZMs1fHR8s5Fn6kI+xtVjBo5ogRwan4Br?=
 =?us-ascii?Q?+u0i1M78zvro8e/cGXYEt3ZonTxGxftYy1NNwy7NscJgdgEwTk3RZ4hzU+zf?=
 =?us-ascii?Q?voQfVmxLc9Ye0w8960EHSy7EKhfIlet6YTk9k1urZxbBH7fLCiJoI4fA8MQu?=
 =?us-ascii?Q?Q9xbUpOJB5IM9wRDSC329JU3BzxG/6jzvlraCJGL8QXPLRqIBlZ+E7Ccskpy?=
 =?us-ascii?Q?8vuxUD4WyxvlcMDC+4QnrrYqxtSWpNcO2VWWIpsP98V9Xww2BuHzkmhMtEKW?=
 =?us-ascii?Q?XQWQBGhd5e+k9XLo12GV+w17KS04F3zSBvczRJ8oO3+ApU+ypntYP+FikdHw?=
 =?us-ascii?Q?p7NgvYeBI7my59PPbhzmudB3Uv59bDPJQUbxi//vVD6eHNUHNV8EItob+tWb?=
 =?us-ascii?Q?rlDflS4/+8nXPO12y9Nhhxy08spXbFQTSJHwufbr6VQl/HujSkPvCwKrBkPK?=
 =?us-ascii?Q?Xs/iVC7t2paqJ++50b4OUJclDS1TbhXfMcJQWObVTM2jpwd//EIngOYAI0rx?=
 =?us-ascii?Q?5m12GGmthPK5O3L4TL1OD1ty4+slcqlomS20wzlUyoGTjraXrdIGmftypCjj?=
 =?us-ascii?Q?d0ZEm7T8dqxTRxYfrICNNXlwvFJ3LrA4EElcI1ya2daDC37pdSzE54HyIK0Q?=
 =?us-ascii?Q?fE7+ls7B5BFvooRepa1PpfLoJ7pIPeHZ7vYwLVyiC8eA8tZ2iMZfeI5TGXhe?=
 =?us-ascii?Q?WMOMB5mut2iAmFRrTzuqvfKoHBtA33nkahjw2pbrIIH5jaV41ImPi15IQ6jg?=
 =?us-ascii?Q?15DZeaGKTV8pAz5ZlQe2WDK7AYs1OHLk4nHRzSdZyYnI7OiBXMe7E48lKROn?=
 =?us-ascii?Q?keb+f69unSk8PahG5n749e20NZd0PGUt+ioP3Vpx90chLDundA6l9XG9+RJJ?=
 =?us-ascii?Q?ymO7OCKerQxwFBJOiP15r6IOAxP5HEhbOM+vzkYD7ArpwEltAaSTAVmAKmyM?=
 =?us-ascii?Q?9jWdCXdoeA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: c509babf-c12d-442e-1331-08deed4365b3
X-MS-Exchange-CrossTenant-AuthSource: DB8P189MB0966.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 07:31:25.8954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fpx8vfAmqFZXvBVrPqq280ZdIZrVfG9MRFQ4KfhqI8NqY8OQpHy+RfuDV8s3oiNjQEWERE2lRZXY+1tjWlqEOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWP189MB3228
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2026 07:31:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128549

From: Tugrul Kukul <tugrul.kukul@est.tech>

Backport patch to fix CVE-2026-39956.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-39956
  https://www.cve.org/CVERecord?id=3DCVE-2026-39956
  https://security-tracker.debian.org/tracker/CVE-2026-39956
  https://osv.dev/list?q=3DCVE-2026-39956

Upstream fix:
  https://github.com/jqlang/jq/commit/fdf8ef0f0810e3d365cdd5160de43db46f57e=
d03 [nvd]

Tested with ptest:
Before: PASSED: 7, FAILED: 0, SKIPPED: 0
After: PASSED: 7, FAILED: 0, SKIPPED: 0

Signed-off-by: Tugrul Kukul <tugrul.kukul@est.tech>
---
 .../jq/jq/CVE-2026-39956.patch                | 55 +++++++++++++++++++
 meta-oe/recipes-devtools/jq/jq_1.7.1.bb       |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-39956.patch

diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2026-39956.patch b/meta-oe/=
recipes-devtools/jq/jq/CVE-2026-39956.patch
new file mode 100644
index 0000000000..6a3f61dc37
--- /dev/null
+++ b/meta-oe/recipes-devtools/jq/jq/CVE-2026-39956.patch
@@ -0,0 +1,55 @@
+From 04834a11ffb9f988643fe64480cfb8553ff498af Mon Sep 17 00:00:00 2001
+From: tlsbollei <170938166+tlsbollei@users.noreply.github.com>
+Date: Wed, 8 Apr 2026 21:43:46 +0200
+Subject: [PATCH] Add runtime type checks to f_string_indexes
+
+This fixes CVE-2026-39956.
+
+CVE: CVE-2026-39956
+Upstream-Status: Backport [https://github.com/jqlang/jq/commit/fdf8ef0f081=
0e3d365cdd5160de43db46f57ed03]
+
+Signed-off-by: Tugrul Kukul <tugrul.kukul@est.tech>
+---
+ src/builtin.c | 8 ++++++++
+ tests/jq.test | 9 +++++++++
+ 2 files changed, 17 insertions(+)
+
+diff --git a/src/builtin.c b/src/builtin.c
+index 378be02..08b94ac 100644
+--- a/src/builtin.c
++++ b/src/builtin.c
+@@ -1215,6 +1215,14 @@ static jv f_string_explode(jq_state *jq, jv a) {
+ }
+=20
+ static jv f_string_indexes(jq_state *jq, jv a, jv b) {
++  if (jv_get_kind(a) !=3D JV_KIND_STRING) {
++    jv_free(b);
++    return type_error(a, "cannot be searched, as it is not a string");
++  }
++  if (jv_get_kind(b) !=3D JV_KIND_STRING) {
++    jv_free(a);
++    return type_error(b, "is not a string");
++  }
+   return jv_string_indexes(a, b);
+ }
+=20
+diff --git a/tests/jq.test b/tests/jq.test
+index 6d1518d..f867e25 100644
+--- a/tests/jq.test
++++ b/tests/jq.test
+@@ -1333,6 +1333,15 @@ split("")
+ "xababababax"
+ [1,7,[1,3,5,7]]
+=20
++# _strindices is used by indices/1 but is callable
++try _strindices("abc") catch .
++123
++"number (123) cannot be searched, as it is not a string"
++
++try _strindices(123) catch .
++"abc"
++"number (123) is not a string"
++
+ indices(1)
+ [0,1,1,2,3,4,1,5]
+ [1,2,6]
diff --git a/meta-oe/recipes-devtools/jq/jq_1.7.1.bb b/meta-oe/recipes-devt=
ools/jq/jq_1.7.1.bb
index 2fc47ef92c..42c7a5795a 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
@@ -25,6 +25,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/${BPN}-${PV}/${B=
PN}-${PV}.tar.gz \
     file://CVE-2026-41257.patch \
     file://CVE-2026-43894.patch \
     file://CVE-2026-43896.patch \
+    file://CVE-2026-39956.patch \
     "
 SRC_URI[sha256sum] =3D "478c9ca129fd2e3443fe27314b455e211e0d8c60bc8ff7df70=
3873deeee580c2"
=20

