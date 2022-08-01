Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5709AC00144
	for <webhook@archiver.kernel.org>; Mon,  1 Aug 2022 07:42:36 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.22191.1659339745934086129
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Aug 2022 00:42:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=k1cpOgsX;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=521241569c=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27179Ul9023683
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 1 Aug 2022 00:42:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=0UBTXURk51aC1nzzcuhgZbktkV6ISXYG7gHiiY1qJ5g=;
 b=k1cpOgsXi2UMTe+NRJTSbGfCUm7FdIw/cl1YkzS97dOUu+uuV3w3XXsEd5iGz8F4YfIE
 nr0PTCDc8E/n+2cwx+yRrH/pmHnHB/tElZ4qnbN/6JnP+HFdn7MqrOMnTXouJsOzi6iL
 9R93lyFGiTNuJB9vcQm5D0MfSQP+RidorCVVznUV1jACLVyk78hCv9axhQ1ZdMHjoBNO
 WA8arCKkHJtrbHyzWJFE4CkoJqEwrAONOZ4BFD43lzFkd5BPzPtp+4J19U9fGgYgoerQ
 ap7CTnIg9YilZYB1NCLj+z+BpWHJKaYnuPZEWajI14bMhaVoLB/3M7vTWXbtrH53xYHp og==
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hn45js21f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Aug 2022 00:42:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IWLJAC0whqvvru2HxFm3bckp7Bbx9/eYe7H8uVogMQhjtgopwL5BcCNmJrBHnCAzfqNMMO11UhXyfGRAaDoTnlFsOow0Kb3OtxAsQ5UlWmuLxO4VrIhBpEOKjrz7TkaCONtDZKLOHmNhcJEM1wume/+Crl/RpeEZfXRSR1caOYo3rmN2gnUsK0McvPPLiJm6qajEeThabPU6ebOwq26mw2ryoZ3/YO6sVlwNDKz/Wq7R2q726KtvoTa2rXRZ6reWq9NaPRz8wKDbVV56LljBjoxUgjxGAWQ/e615WgsQnbyFR2j+FOhrHUNDiYA7zpkqSS19upsMManlGLNMd1Ig0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0UBTXURk51aC1nzzcuhgZbktkV6ISXYG7gHiiY1qJ5g=;
 b=ecfteyjeLpAXfKiLe2l04Y8Es96aEGK1/o+oRbCSv54obKUt/P7yrjwW4FZmLc3UpouaSiWj9ZY9voiE00B8GczlF37mgEJ7FzTlHuLdbK9Kc+w2iYB+NhlfarSen6q15I+AtzGd5Z6qvlX/eAPmTj/BMka8KpaH9VlrAI5QbUKYgeq11XQbR1JtcN0kH85p3q4r9r+2a3cMgGZpWpGspEyvxFhQ1jxdMoA++UKbB42z0qj3idjZsVHNQSJj7zXA2tuUoySxAE5UZ10pgXpovKr4gA8UgPs9kJEXmDosZAYI0OCseQtvUPrWBwuFUsr3AU965sZa5mwwrlzFGOOMbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by BYAPR11MB3031.namprd11.prod.outlook.com (2603:10b6:a03:8d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.13; Mon, 1 Aug
 2022 07:42:23 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::48ea:c4c0:360f:7c16]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::48ea:c4c0:360f:7c16%7]) with mapi id 15.20.5482.016; Mon, 1 Aug 2022
 07:42:23 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] strongswan: upgrade 5.9.6 -> 5.9.7
Date: Mon,  1 Aug 2022 15:42:12 +0800
Message-Id: <20220801074212.57489-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0020.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::6) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6daa095e-cbba-4813-6382-08da73915f54
X-MS-TrafficTypeDiagnostic: BYAPR11MB3031:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MnVvq5J0Jz9Q3NXfJd7Av6PJyjnsfV0vF/pW29mUtb0P4/H+a3ErVZSlBYL+pN/IBE9z3BD7aXUyBktpxBcUJIu/xgIibDACP+Eurz7z5b2LJUG/bR4jPU6i2r6fgEJd1CuEJGIThyUcD1geENrYpIQgevnZUyU/kwxZ3FZ6Hv9yuQrZHlXmJIKDQQi1gvJvGGtHYjIpuAAgwGEOo57UC0vabubg2HujhPrCoj+ne4K+p/J01uQ5jCIaRquppM/QK7dVewTmbv2vossNuWglsTaLWaASOchhNGSBamC/jOW/hmOWuu676ISp6/oA1EtOKlxtIl2CQOJIOz486ujFZzoTA0WJWJg7f1FPZJPHc/BdDBymhDu2yswFQtKdeK1ury9gtAFdDdw6yoXNDPSE/78w5GH97z00WoUFH7/AeT5D0HKNEgxqtqtu726nsOmlD+ZKTa98t4eAL3FT6R91bLZmE3RRQthVNi6TBwAp59iEj4guasAIiw9lA6NCLyGL4wSsYXM4Q7UWoQ/PFaAxX5Lp1NSiwZ6zYSmn6OnC7PA5+oLXP2fJN9QQistOntv9soMT8FC8WW33QnQ6lAPC5anDxYYmafBzDoSctFL7I1G73XQoJ6xyyZHa58LZBBgrLS/lM7P+ndN3UV3sVlkzWQhNLxVgntDzR4X85GEuQHoD9D+AbexgKpm+k7WBxI+5bvNO0879ZbXf3KzQPNcM+AXAEIWKK/FnLBbSxodBApsiJCEWjBKlMRsvaJ5Ew7sYqfoNCR+aE9JPt0CokOZy68N36SHTaj4SWH7BJvPVvIEKszr8kMXWW/d8TrHzOikUybMqbZa6uvKb3/X+wWoEIVy4+MmCUw6wenkJWpwGoRK3zH7iwmgQqJTgtUkFu0YP
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39840400004)(346002)(136003)(366004)(396003)(376002)(83380400001)(86362001)(8936002)(5660300002)(41300700001)(44832011)(6916009)(38100700002)(478600001)(2906002)(36756003)(26005)(966005)(6486002)(6512007)(2616005)(6666004)(186003)(1076003)(6506007)(52116002)(316002)(66946007)(66476007)(8676002)(38350700002)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?e2Ls5Te6hsxHygDfpRXR3iraNrtOcjchT+qx47Xirfq7qDXV7dOhX0ngisYQ?=
 =?us-ascii?Q?DxX45Q63bLX+Us+Pg84HfS1Nvi+WsfGIWEo2mP7AUvPMaHeXfPeifPjeysGV?=
 =?us-ascii?Q?lr808zOE4ldt3Ryvdac2sVWQ7bbcmnZKQimvIMvjUmeh9d4gXVUTQDIwtYmL?=
 =?us-ascii?Q?Hhg+qry4HE7W3IuZrcfARpIqrvT3enhKffzItXmVHrFNoxP+QCJ/7cWMm4nG?=
 =?us-ascii?Q?pdhWnlCX+DZHcNM5ux5pwIGPM3Fr8mr8MY416K1LFEub4DiEncw8stcjDUTz?=
 =?us-ascii?Q?rXFt6e/hPIXhyKGe6Y/lNHvjzwS1StEWYnvddOs5+Vz1roIZ8mNhaArXBa/S?=
 =?us-ascii?Q?RJvP01aaFpNrY4RBixu3bsdTR1qIFCoSIHT8ido8xPABuqw3saAl3PMWGtl0?=
 =?us-ascii?Q?+tGbPRs6wM4toYXgGMhAWInzAwQ7bZFnkzHPDEGNIITg/DwndFZJejyzlBeO?=
 =?us-ascii?Q?y+ed6LaT5FuhvHjLiMyy44k9S+O5uJatDBPanuGlAFQ0uhfUevNUcfRELcEw?=
 =?us-ascii?Q?QMM5ZXnynGL4oXjBrTHU9Yk55Zu8Cy12Y8H+KR2kkxVCHq25VzjRKkH3KbxH?=
 =?us-ascii?Q?goOPe+wJTSJXymyGmMMIUomYQB0Gwi3UgiN4fsGRhLfZSDC8XekFS5yqLlLz?=
 =?us-ascii?Q?tUhLnl3GbPAhZLPakOFihVAntr+KmhoCpzQuagywK/4j7Ms8RG5RFNyp0t5D?=
 =?us-ascii?Q?mX+a1qmy5v3MWiViFMNnGRaw15sQ82UoVMrslQxmlXsihPo0jY/GXDDwEsmQ?=
 =?us-ascii?Q?3iKsIOo5sk2wggbM07EcjbiQqUh6S7o6j37s7S2slBtE7pR97nWPaskSCuEd?=
 =?us-ascii?Q?biipZ/KLgDevOO0G3id2A1CO0udVm6vjHDAAKZZrMQKx7zqo2mqGsh4dctwy?=
 =?us-ascii?Q?ULck1M8EUdkWDd++i4+exi7DnBNi3Aq7KJMatT9Gb8bj7IShI+Win5bnGQB5?=
 =?us-ascii?Q?Whf7KV2RR9pDCLnCmnE10hEGEzXbyAOJPwBr1FeHzbBAC1HbdkPRYGDfgLRv?=
 =?us-ascii?Q?oS6/ow9ZTsuDqEiW/JmP3MRGCWhqvWmK0TuxoK435tmDflAkYvBFdVCdW/zc?=
 =?us-ascii?Q?5JHU3wOytKfwcnqWqUC6i7PdhC+qRjqnXVR5bWFR975xTCJfSriGHq63CLLv?=
 =?us-ascii?Q?9x2x5lmBLvbAG5yk2+OA36tvZLWCaT+rzJw7CsRNPIm/hwE2f27N5PMRUKnT?=
 =?us-ascii?Q?4LPAtdp3zv/4TiprdpZr+XVCBoVZEj+2dfcmemDeztkN5TveQuriHKf8ndJT?=
 =?us-ascii?Q?2hd+tZWBm6tnvKGO9TblZ+KZRoayqRrhBYr7Xo8vY6yRM1tQVRuq+ePIjMa0?=
 =?us-ascii?Q?uwYW4tki2fGJqycyDtbQqhz/YJP5EC4PoLr3sVzWKCGgm4B7if/+U+TeIsP5?=
 =?us-ascii?Q?d/FUu5JDkptJTHOKKtnHTlnIZF8t4lPUwe+BXLe6IxYvoUFmnodQSWj2DP1A?=
 =?us-ascii?Q?VNTchw83Ph1S7PhhI3XSSuKwu+orQDExRu5oSNWvBK2FAslI23McSIjd9s/b?=
 =?us-ascii?Q?8VhmYcQgDZcPGubqR+/DNZz9GioyXPcICxbX/HpuMXlUbdlRhEnaEhaVQFBH?=
 =?us-ascii?Q?1f4Hp2HdDhNPVOJuhWilZDjlmW0LPYzx2XU92M9n?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6daa095e-cbba-4813-6382-08da73915f54
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2022 07:42:23.5351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 AyXIB517R5n+xxWn3lFircylXViBKNTPBD/MGMX1lpcJ32OTJt3M1MHuYj+PYVMjCtfNUjOE9XITqLyNWd8WCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3031
X-Proofpoint-GUID: c-TnbjZPON3zRNtm9ctQVnkG0S3CmkZU
X-Proofpoint-ORIG-GUID: c-TnbjZPON3zRNtm9ctQVnkG0S3CmkZU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-01_03,2022-07-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1011 mlxlogscore=934
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208010036
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Aug 2022 07:42:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98069

ChangeLog:
https://github.com/strongswan/strongswan/releases/tag/5.9.7

Drop backport patch 0001-enum-Fix-compiler-warning.patch.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../0001-enum-Fix-compiler-warning.patch      | 31 -------------------
 ...trongswan_5.9.6.bb => strongswan_5.9.7.bb} |  3 +-
 2 files changed, 1 insertion(+), 33 deletions(-)
 delete mode 100644 meta-networking/recipes-support/strongswan/files/0001-enum-Fix-compiler-warning.patch
 rename meta-networking/recipes-support/strongswan/{strongswan_5.9.6.bb => strongswan_5.9.7.bb} (98%)

diff --git a/meta-networking/recipes-support/strongswan/files/0001-enum-Fix-compiler-warning.patch b/meta-networking/recipes-support/strongswan/files/0001-enum-Fix-compiler-warning.patch
deleted file mode 100644
index e730fe1cd..000000000
--- a/meta-networking/recipes-support/strongswan/files/0001-enum-Fix-compiler-warning.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From d23c0ea81e630af3cfda89aeeb52146c0c84c960 Mon Sep 17 00:00:00 2001
-From: Tobias Brunner <tobias@strongswan.org>
-Date: Mon, 2 May 2022 09:31:49 +0200
-Subject: [PATCH] enum: Fix compiler warning
-
-Closes strongswan/strongswan#1025
-
-Upstream-Status: Backport
-[https://github.com/strongswan/strongswan/commit/d23c0ea81e630af3cfda89aeeb52146c0c84c960]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- src/libstrongswan/utils/enum.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/libstrongswan/utils/enum.c b/src/libstrongswan/utils/enum.c
-index 79da450f0c..1e77489f6f 100644
---- a/src/libstrongswan/utils/enum.c
-+++ b/src/libstrongswan/utils/enum.c
-@@ -97,7 +97,7 @@ char *enum_flags_to_string(enum_name_t *e, u_int val, char *buf, size_t len)
- 		return buf;
- 	}
- 
--	if (snprintf(buf, len, e->names[0]) >= len)
-+	if (snprintf(buf, len, "%s", e->names[0]) >= len)
- 	{
- 		return NULL;
- 	}
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.9.6.bb b/meta-networking/recipes-support/strongswan/strongswan_5.9.7.bb
similarity index 98%
rename from meta-networking/recipes-support/strongswan/strongswan_5.9.6.bb
rename to meta-networking/recipes-support/strongswan/strongswan_5.9.7.bb
index 1b82dceac..349538620 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.9.6.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.9.7.bb
@@ -9,10 +9,9 @@ DEPENDS = "flex-native flex bison-native"
 DEPENDS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'tpm2', '  tpm2-tss', '', d)}"
 
 SRC_URI = "http://download.strongswan.org/strongswan-${PV}.tar.bz2 \
-           file://0001-enum-Fix-compiler-warning.patch \
            "
 
-SRC_URI[sha256sum] = "91d0978ac448912759b85452d8ff0d578aafd4507aaf4f1c1719f9d0c7318ab7"
+SRC_URI[sha256sum] = "9e64a2ba62efeac81abff1d962522404ebc6ed6c0d352a23ab7c0b2c639e3fcf"
 
 UPSTREAM_CHECK_REGEX = "strongswan-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.25.1


