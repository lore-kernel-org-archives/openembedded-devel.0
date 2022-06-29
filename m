Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE8A6C43334
	for <webhook@archiver.kernel.org>; Wed, 29 Jun 2022 06:53:42 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.8423.1656485602470726886
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jun 2022 23:53:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=F4p5qfKA;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=4179813aa1=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 25T6rLdR030192
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jun 2022 06:53:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=S/wT3qp1bdqLtzbDqUCpiS0J+4CNUVtImfK8g6W9Tko=;
 b=F4p5qfKAK5k8l+hfsdEyoBL5AI909mCvz10XDi0rCYsYNR8qxIOMW652u19m5tU9BMWL
 rrkkisPHWA6gFkFj09u+j0tpJ/pDA2AMilJpkzGzhM+QkrxqJmOfQ/suk9O0iOx7+r3D
 v0k2HT8R2ClaD9IsVyp5Dv5u+03GHTwigWr4v5iyyNdnmVsxa2W/otOzaeapPJmX0VuD
 XYcfqa6+gQtUw5VmAKfqRFbJQRw0oA8aiLV+98x6k3BPh+CQNxb74piOgwj1+Nx3b4sc
 HSLjZsCrAyaWWe/tMtMbcoJftP1GxwbC/b8PBYASqjX6pc0Nqqn56Sgfa0LBBGsfLDGT Hw==
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gwsbajyn2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jun 2022 06:53:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UwO6S58QR1hsG2zB+1mUtC/DDRqDhi8sMxX6Kkcdcpde60XJ96Uw7wp6hKnwbdtlvm7BaMgbomANInvNarDpQz42ZX6l2ScNKuSlgWLGctyra/yKb2SLGvXIQjD8OBa/2RKsx2ZU8MXYWj1Fb0DUAtCgaujndK35US4MsBxHw6PC1pBLb4qP+Am22fWtmXnET3q6ArOcXPcLQl2Fix1nZEPCDFpLhfsHrs63Ntq4Hp/Ww9ZG4NunMA3H8HTnZQOfBeR3czDnOO6cv2g0qAJHcnnmhswFcDrXPgSTfmiz3Kv+LLQ/lNB7FVclwZfO0eam5Bt8saFYkiKi93qrgmsEdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S/wT3qp1bdqLtzbDqUCpiS0J+4CNUVtImfK8g6W9Tko=;
 b=b6fAg8OhqFxxhuUuQ1yOMiyDsn40XlLyaw1I8gbsikg8boBouoHwPEZcArvKoNXPSfcnx9OACnk+YLZon/uoP5rf7HkG0G1GnOg1tKDpJKNP9LQuq8tL0QrvnGKQ0cO3+J8GALyMHYN43dd0YER257G5HYh0FNktxpPvJzc//aEvDweXw2GpvLMe+dAUBicCtrfGVFrcnsM5S1nalJVK87SWN6QVRMbuKXPfoGC8Df3ADwA4PaBz5hHB0Oc7kUw/lPOtquVTAsrl+2dpzzL8OBpht9/XiRiYA3R6UMuEHfIwClOBEI3ec5P0RQP31ZZj78A/O/LB6N1GeSpe74+WEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by DM6PR11MB3754.namprd11.prod.outlook.com (2603:10b6:5:146::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Wed, 29 Jun
 2022 06:53:18 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::9858:1451:5696:508b]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::9858:1451:5696:508b%4]) with mapi id 15.20.5395.014; Wed, 29 Jun 2022
 06:53:17 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] strongswan: upgrade 5.9.5 -> 5.9.6
Date: Wed, 29 Jun 2022 14:53:05 +0800
Message-Id: <20220629065305.168724-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0206.apcprd04.prod.outlook.com
 (2603:1096:4:187::21) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8b2c7997-880c-448e-d191-08da599c0bec
X-MS-TrafficTypeDiagnostic: DM6PR11MB3754:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	k09lb7XHlaewks2VxJHJBqgoIAjjJJnjwdDw1N2CVmj7N0nrxUtfS66rIINp5KI7SXCxolcEPeqqxsR/i+Jh0+2fKPP/G3zHSeUPtySchreecRoYKvLvjBoe9xI2s+vvihAILbz+8E+YLcIkArXsiGSwC9JXgjJn33cS3MhCPCK4i7FvdZ5W+pLjiYmsG2u5Vlvsj03FZzC7oGhjo+zQGBv3iJeG/TKwEYBxnR/aZJQMVe3ekx/IQ0UUWwIMszDD39IlHxQY7FD5rM6goSer+AxhfV4fFX7OhL2EeTmOwI3rraR6NyN6ol99rTRgI5kC3cAc3z0JZGLQ2i3JIGEl/fVnApGB0oH9Xs9TVqJSme0HDfF72sHAw80FCIqspo6tjEYiNqwJ4llzp2fC32k/zWaVFm+InZe7iRRzjqULG3hO71hGuN5C4L7ahHZOLnDZJDsUG3IQIgj65V/FwpzCbSFbZbtLk6QlfrLTz0CZw9TZsxeXh9eB/uPMhR/LMn9o9Pg3ZOOf16vGDV5qH8WcbYRsy53+BjGoyaOvnttDxHHNphObZFuL2tikwrTEcqKhBk6uYwsnntLBrU4bxB8uuDOpoZz0Y0Hp4QDesxcIuQvv+pcs5ivgq3ACcJgLPJUk0y99fsYS/2kTWlVIkl+7wNzoSQhe0ZuucsReqIfwrlLFESrMNYx7q458RwS6YTxRXhmEUw4t58u/sxV0MZoiK08oDhnNlsaT2UshNuqRhDbKGrOr94mlqik73kmwCmF9Xa8s4Z25VLNSy2szW2WM57OZwwhvbpghafqc2EqXJG9tvOG5yXkgxui2mdA3qJkNNCwzgFlBHXY7FYuFGkMLbKlMQ8U50k+BwETWfGXkioQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(366004)(376002)(396003)(39850400004)(36756003)(5660300002)(38350700002)(478600001)(8936002)(38100700002)(316002)(6486002)(44832011)(86362001)(2906002)(83380400001)(6506007)(6916009)(6666004)(66946007)(8676002)(52116002)(2616005)(1076003)(41300700001)(186003)(26005)(66476007)(66556008)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HA7YRzNhT58rj/tHK6t3kUYVsjj+KNCDoHf1rnBYSOt86Da9KdalJ+BCURL/?=
 =?us-ascii?Q?jVkp/DUOnUWdbOYI7Xl1RilkDg1OF7U204BuAMynIyjmNIyGXSB5FBrjBl5Z?=
 =?us-ascii?Q?zD3xpAaYzEehFvyhVs1sqMRUqtGWTBpV9WyTLYfBdrbrcj4Nq7YvhCd8cNGS?=
 =?us-ascii?Q?XWhReH5D7oaKB+BWAGHRUYivY+XEf7EDkouUAMp08hvtpDUpUQ1p/puqKJGQ?=
 =?us-ascii?Q?Nh5CfbZMN4mLlRfAL21QSwOG/rigjzdMvG45a51eW7tOgbmLRMtQ6O9SOl2p?=
 =?us-ascii?Q?3FCVvHYhcMjX/VQYHhGme845B7f53CodPPyTrzrHp+KikupKd9boZBDyp56b?=
 =?us-ascii?Q?ynndpshKumdOpiCNKxX4rR8uP/7pD9bL/lurx0dYI/yY0IoZJQY7JYvM6Ow5?=
 =?us-ascii?Q?Xux6m1YhJ6l9KJ4YaoKjDPBrUvQuGwbEzXRnPXIb6SPowZKk7obwc2jdJYSG?=
 =?us-ascii?Q?dkNgBTRUu10NhVCyGa+9Lf+YpGxpHagCQGcNpFPdowb0qvR59jhf5XM369oN?=
 =?us-ascii?Q?GrcVS3HXL3Zt8VWhpnv+eD0QEI/pu0gcDd/MdeFPkej7X25PFG8i4YkqYopZ?=
 =?us-ascii?Q?9Yh0fFwPeUR4O26sCkyjcrGgxdnSewZ+OB6mLa7csR1Y+wK3Y/RCImAFo1nx?=
 =?us-ascii?Q?84BqnVV9FT1oPL6gdAZ5aGb5N1ckC++arY4DQsM1kxGD5gnsrN6C9dei/N+f?=
 =?us-ascii?Q?39dCA1u5846UE6BTseYduBlEs6DeSV9vYOrAXxqZYoq+YOTO59TwJKlN1ACC?=
 =?us-ascii?Q?dIXbvWIwMgq8mgYUzzYNB0DEctnrSNdikAthACzUoTvgwLJ2VO32kuXPtEhl?=
 =?us-ascii?Q?t0mdFpMitrbl6XR4HRRTRZO8val4m/eYodRM03GWmreJIXFbrk13Hpy+6wIt?=
 =?us-ascii?Q?Eavjj7NBODKGhgULmwJxLb6X6yObQQ8r1NnkN0vAvMmtIvSu27qYivUc8AF5?=
 =?us-ascii?Q?qT5G3Dt9QeY2eM8tfIJbEJUtX33lNdoU+PtWF6GbXVYFvka7iT62lxLhScI4?=
 =?us-ascii?Q?iS6vhDJ/eenAorvXS0h8/JiTLoKoMeh7BVvdQCWcqWpkC0oqaio8TcIeCu17?=
 =?us-ascii?Q?520p4EZl0TzurWbwqWwsl46fCL6s3pWjiRexAxVIqvAfCD5eBamSYqLgwhxY?=
 =?us-ascii?Q?NMeErmwgH99ZbGqsgzS/wKCHq/lnc/RY43khMEKVD5bsQj17v8seCtpbFYnn?=
 =?us-ascii?Q?mzNuRuZHaXf7g7A0XWx0yP76OtqKum5fN0iVCDJr2dTjLr/DZdw7+Kp+JySV?=
 =?us-ascii?Q?4QVG3l+sRRQuUm3G1eYxZqViAOl+7UCcwG4Nq+PY/2nmYJq3UReE7McDIFYW?=
 =?us-ascii?Q?GL2Dl0MnSKau0/+j2zBeV/jZM2tEcTqQiCN8iVCXtzXS8NdpkyfX8Yr8RV66?=
 =?us-ascii?Q?0GduZu322p8cHMFUgmefyIoKHyX1CH301wva3vJT49OZYmVgZX4gqDyIU0ei?=
 =?us-ascii?Q?IUVANrrBIosR85+TwETs4890bK3Zd9B2o10OhmnC0GmlxxVPxlmTQX83yP9R?=
 =?us-ascii?Q?AF7ptt1Zo3SPo40IqRmN4TZhm2EWYYPTDBfilYBU8JB7H3+ceimHBHLuzoKn?=
 =?us-ascii?Q?jdKeKPOzBqaoHLwh2Fir9R9TE5EQGYPyI+Oya6KD?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8b2c7997-880c-448e-d191-08da599c0bec
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2022 06:53:17.8529
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 E/buySs3x1vSJMF6Y8c6pRLlkmLYPGcFpleXp8nYXKjAJeaYDIbTPKGEC6bN0LGpGRyjtXc3wYtr12UCkz0sEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3754
X-Proofpoint-ORIG-GUID: A-pqQ0-XwNRkErrSfkOlBNOfN9gwBDD-
X-Proofpoint-GUID: A-pqQ0-XwNRkErrSfkOlBNOfN9gwBDD-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-28_11,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 clxscore=1015 mlxscore=0 mlxlogscore=948 adultscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206290023
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Jun 2022 06:53:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97616

* Drop backport patch 0001-openssl-Don-t-unload-providers.patch

* Backport a patch to fix the build error:
src/libstrongswan/utils/enum.c: In function 'enum_flags_to_string':
src/libstrongswan/utils/enum.c:100:9: error: format not a string literal and no format arguments [-Werror=format-security]
  100 |         if (snprintf(buf, len, e->names[0]) >= len)
      |         ^~

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../0001-enum-Fix-compiler-warning.patch      | 31 +++++++
 .../0001-openssl-Don-t-unload-providers.patch | 92 -------------------
 ...trongswan_5.9.5.bb => strongswan_5.9.6.bb} |  4 +-
 3 files changed, 33 insertions(+), 94 deletions(-)
 create mode 100644 meta-networking/recipes-support/strongswan/files/0001-enum-Fix-compiler-warning.patch
 delete mode 100644 meta-networking/recipes-support/strongswan/files/0001-openssl-Don-t-unload-providers.patch
 rename meta-networking/recipes-support/strongswan/{strongswan_5.9.5.bb => strongswan_5.9.6.bb} (98%)

diff --git a/meta-networking/recipes-support/strongswan/files/0001-enum-Fix-compiler-warning.patch b/meta-networking/recipes-support/strongswan/files/0001-enum-Fix-compiler-warning.patch
new file mode 100644
index 000000000..e730fe1cd
--- /dev/null
+++ b/meta-networking/recipes-support/strongswan/files/0001-enum-Fix-compiler-warning.patch
@@ -0,0 +1,31 @@
+From d23c0ea81e630af3cfda89aeeb52146c0c84c960 Mon Sep 17 00:00:00 2001
+From: Tobias Brunner <tobias@strongswan.org>
+Date: Mon, 2 May 2022 09:31:49 +0200
+Subject: [PATCH] enum: Fix compiler warning
+
+Closes strongswan/strongswan#1025
+
+Upstream-Status: Backport
+[https://github.com/strongswan/strongswan/commit/d23c0ea81e630af3cfda89aeeb52146c0c84c960]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ src/libstrongswan/utils/enum.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/libstrongswan/utils/enum.c b/src/libstrongswan/utils/enum.c
+index 79da450f0c..1e77489f6f 100644
+--- a/src/libstrongswan/utils/enum.c
++++ b/src/libstrongswan/utils/enum.c
+@@ -97,7 +97,7 @@ char *enum_flags_to_string(enum_name_t *e, u_int val, char *buf, size_t len)
+ 		return buf;
+ 	}
+ 
+-	if (snprintf(buf, len, e->names[0]) >= len)
++	if (snprintf(buf, len, "%s", e->names[0]) >= len)
+ 	{
+ 		return NULL;
+ 	}
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-support/strongswan/files/0001-openssl-Don-t-unload-providers.patch b/meta-networking/recipes-support/strongswan/files/0001-openssl-Don-t-unload-providers.patch
deleted file mode 100644
index 7da48cd2c..000000000
--- a/meta-networking/recipes-support/strongswan/files/0001-openssl-Don-t-unload-providers.patch
+++ /dev/null
@@ -1,92 +0,0 @@
-From 3eecd40cec6415fc033f8d9141ab652047e71524 Mon Sep 17 00:00:00 2001
-From: Tobias Brunner <tobias@strongswan.org>
-Date: Wed, 23 Feb 2022 17:29:02 +0100
-Subject: [PATCH] openssl: Don't unload providers
-
-There is a conflict between atexit() handlers registered by OpenSSL and
-some executables (e.g. swanctl or pki) to deinitialize libstrongswan.
-Because plugins are usually loaded after atexit() has been called, the
-handler registered by OpenSSL will run before our handler.  So when the
-latter destroys the plugins it's a bad idea to try to access any OpenSSL
-objects as they might already be invalid.
-
-Fixes: f556fce16b60 ("openssl: Load "legacy" provider in OpenSSL 3 for algorithms like MD4, DES etc.")
-Closes strongswan/strongswan#921
-
-Upstream-Status: Backport
-[https://github.com/strongswan/strongswan/commit/3eecd40cec6415fc033f8d9141ab652047e71524]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- .../plugins/openssl/openssl_plugin.c          | 27 +++----------------
- 1 file changed, 3 insertions(+), 24 deletions(-)
-
-diff --git a/src/libstrongswan/plugins/openssl/openssl_plugin.c b/src/libstrongswan/plugins/openssl/openssl_plugin.c
-index 6b4923649..1491d5cf8 100644
---- a/src/libstrongswan/plugins/openssl/openssl_plugin.c
-+++ b/src/libstrongswan/plugins/openssl/openssl_plugin.c
-@@ -16,7 +16,6 @@
- 
- #include <library.h>
- #include <utils/debug.h>
--#include <collections/array.h>
- #include <threading/thread.h>
- #include <threading/mutex.h>
- #include <threading/thread_value.h>
-@@ -74,13 +73,6 @@ struct private_openssl_plugin_t {
- 	 * public functions
- 	 */
- 	openssl_plugin_t public;
--
--#if OPENSSL_VERSION_NUMBER >= 0x30000000L
--	/**
--	 * Loaded providers
--	 */
--	array_t *providers;
--#endif
- };
- 
- /**
-@@ -887,15 +879,6 @@ METHOD(plugin_t, get_features, int,
- METHOD(plugin_t, destroy, void,
- 	private_openssl_plugin_t *this)
- {
--#if OPENSSL_VERSION_NUMBER >= 0x30000000L
--	OSSL_PROVIDER *provider;
--	while (array_remove(this->providers, ARRAY_TAIL, &provider))
--	{
--		OSSL_PROVIDER_unload(provider);
--	}
--	array_destroy(this->providers);
--#endif /* OPENSSL_VERSION_NUMBER */
--
- /* OpenSSL 1.1.0 cleans up itself at exit and while OPENSSL_cleanup() exists we
-  * can't call it as we couldn't re-initialize the library (as required by the
-  * unit tests and the Android app) */
-@@ -1009,20 +992,16 @@ plugin_t *openssl_plugin_create()
- 			DBG1(DBG_LIB, "unable to load OpenSSL FIPS provider");
- 			return NULL;
- 		}
--		array_insert_create(&this->providers, ARRAY_TAIL, fips);
- 		/* explicitly load the base provider containing encoding functions */
--		array_insert_create(&this->providers, ARRAY_TAIL,
--							OSSL_PROVIDER_load(NULL, "base"));
-+		OSSL_PROVIDER_load(NULL, "base");
- 	}
- 	else if (lib->settings->get_bool(lib->settings, "%s.plugins.openssl.load_legacy",
- 									 TRUE, lib->ns))
- 	{
- 		/* load the legacy provider for algorithms like MD4, DES, BF etc. */
--		array_insert_create(&this->providers, ARRAY_TAIL,
--							OSSL_PROVIDER_load(NULL, "legacy"));
-+		OSSL_PROVIDER_load(NULL, "legacy");
- 		/* explicitly load the default provider, as mentioned by crypto(7) */
--		array_insert_create(&this->providers, ARRAY_TAIL,
--							OSSL_PROVIDER_load(NULL, "default"));
-+		OSSL_PROVIDER_load(NULL, "default");
- 	}
- 	ossl_provider_names_t data = {};
- 	OSSL_PROVIDER_do_all(NULL, concat_ossl_providers, &data);
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.9.5.bb b/meta-networking/recipes-support/strongswan/strongswan_5.9.6.bb
similarity index 98%
rename from meta-networking/recipes-support/strongswan/strongswan_5.9.5.bb
rename to meta-networking/recipes-support/strongswan/strongswan_5.9.6.bb
index cfb7b41fa..1b82dceac 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.9.5.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.9.6.bb
@@ -9,10 +9,10 @@ DEPENDS = "flex-native flex bison-native"
 DEPENDS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'tpm2', '  tpm2-tss', '', d)}"
 
 SRC_URI = "http://download.strongswan.org/strongswan-${PV}.tar.bz2 \
-           file://0001-openssl-Don-t-unload-providers.patch \
+           file://0001-enum-Fix-compiler-warning.patch \
            "
 
-SRC_URI[sha256sum] = "983e4ef4a4c6c9d69f5fe6707c7fe0b2b9a9291943bbf4e008faab6bf91c0bdd"
+SRC_URI[sha256sum] = "91d0978ac448912759b85452d8ff0d578aafd4507aaf4f1c1719f9d0c7318ab7"
 
 UPSTREAM_CHECK_REGEX = "strongswan-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.25.1


