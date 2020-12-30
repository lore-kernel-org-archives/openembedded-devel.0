Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.68])
 by mx.groups.io with SMTP id smtpd.web08.1283.1609292535264777496
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Dec 2020 17:42:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=cU2xp5HL;
 spf=pass (domain: windriver.com, ip: 40.107.223.68, mailfrom: changqing.li@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LtHoIgpHXBch98YOUQOxFw4ewF9kt4lXiQFsCFTXbsK0+ntX8q/Edr2DzcMdB7T3et6T2SriBmae4k2Ezx0j1x1NPnYb+RIrML7RJqps9rhsDTIlfCNh2tn1PXmL3EpwAp1BCsX3JV3O6KHBbsti9tDiy3Ai0nspzPDpS1x/a6nOzJ500l58Jeix0nLuOBZyQEu1t2+JxgWXXH6QGQVRnXzgX4b2NT1GQcmnYyGh2XwcFdgi/KlBB71eHSwLzzovMc+wqF0EirkOQo0yDXf6ygG08apokZkbBGdchgT2jqPNBakBTqIdfcw8ery+58QCGMVvXEeEGfrMn//ycwGoJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vPnw87D07Kh/E7XJMWk0S5uTWuijBPbqj7+en1FyxxU=;
 b=BdpL67u3XyrE9JfKeE9OiNY0OW6b2QqApT1AiGGJ7hAes+2iGzDcgVrnBWBeYShhpizpaCHstQ4DFJC19DQ0S4jlpC7VdVn+Hhg25JIz6d7UFNNa6LvUuFQeTdHLLht92ph8sGVvdRKLuut+CxWcQ28idEwW+veLyTXW63ZJ8Kwy4p8/l1cUI9qdDFacDE7pDbDCHTRhmFxV8c2fliY3YO06ImIqkqbuPq99+E2oCcx3wQorTBOsnuJlao0PiKpb+s5ngU9QlPxfw89w3OpqZuUVDKeFy5KoGpeZXt5owK2SGIQkvXGPP99HUJioMVGk+c2cQ2MqI07MVrqd9mg0mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vPnw87D07Kh/E7XJMWk0S5uTWuijBPbqj7+en1FyxxU=;
 b=cU2xp5HLSQIqZndvmwG6nrzFEe+Wt8xe35Uq9DxG6DJGsLpa4Y/Kxe0hNEwMQ4Ah2uxpQFj9hOyi87uPH0JHTNAMecy5xuv27Olk5KrvM//sqC3EmeewzM0drPWekDWJXBIyTND5Xa3Y0L7ubUsX0FPEYq+OD5zM34P0auKHST4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN7PR11MB2548.namprd11.prod.outlook.com (2603:10b6:406:b3::19)
 by BN6PR11MB4131.namprd11.prod.outlook.com (2603:10b6:405:80::39) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.19; Wed, 30 Dec
 2020 01:42:11 +0000
Received: from BN7PR11MB2548.namprd11.prod.outlook.com
 ([fe80::2cab:3fc4:7f35:c8d1]) by BN7PR11MB2548.namprd11.prod.outlook.com
 ([fe80::2cab:3fc4:7f35:c8d1%6]) with mapi id 15.20.3700.031; Wed, 30 Dec 2020
 01:42:11 +0000
From: "Changqing Li" <changqing.li@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] postgresql: upgrade 12.4 -> 13.1
Date: Wed, 30 Dec 2020 09:41:53 +0800
Message-Id: <20201230014153.14715-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK0PR01CA0069.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::33) To BN7PR11MB2548.namprd11.prod.outlook.com
 (2603:10b6:406:b3::19)
Return-Path: changqing.li@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by HK0PR01CA0069.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20 via Frontend Transport; Wed, 30 Dec 2020 01:42:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 951a0973-f5f4-457a-5d3c-08d8ac64208e
X-MS-TrafficTypeDiagnostic: BN6PR11MB4131:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB4131F31D8EF775E8D958582682D70@BN6PR11MB4131.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PUV/MDSdvpK6XfaqmjzyYuo6BqepV0+S23adjKAKYHxogmDORppA/cL2ngiGJz1YaMdnT7BJU+sOQdTyuF4Yxw1q1kMb4ZKugGR132Ym4yqUOf6yBQ5hOntrk0eZ6CkbbWAKvb6vbnyXtiUZuK9q+zVJN4BCksI1Y5VNeOS/pYQSSfUk1fQ+3T4d7ECYaWypPK3iGLE9hqCrh98EiGL6GHcz0adtPqLvaBL1gna1G+n47ADOMm21b4IMlJnP2/e8ixG+xXgCyBAVi4lMqu77XL20PH697DFoQZeZwTMlFQCu3ztv+cgxUoUvwJ1uR+sO95ZuTbGz/n7nnpB/t+TWq6sWNJmwBF0JBoYseS1zR81tvxdNztfJCMfT07Er26p4RTvpn6Yo0mUUqygaiJNBfA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR11MB2548.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39840400004)(136003)(376002)(366004)(346002)(396003)(2906002)(6916009)(316002)(2616005)(6512007)(8676002)(5660300002)(44832011)(83380400001)(66476007)(8936002)(16526019)(86362001)(52116002)(6666004)(6486002)(36756003)(1076003)(6506007)(186003)(956004)(66946007)(66556008)(478600001)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?FWMze6wuGCIot2uPDi4JaWQNLfyxfGoQr5bYla4MfYMzOQj/3UAODbItm4xz?=
 =?us-ascii?Q?CRmiPgFX12Os6nusjMpvGIDw45Cwhx6Mqdr31FuGDaz5steN/APPfzLN6GDO?=
 =?us-ascii?Q?UbcxhEj4NDAP4FH8mT1kPfkcqEm3a5M++srtEmV059cSEfXHIo2E98N6LsuP?=
 =?us-ascii?Q?kZghsskOkAYtckh4kQMOS2j4F7reAdMkZd6ECAH1izSCM3mP2FPzDlvXVoHq?=
 =?us-ascii?Q?gStIMZrg6fWqb5H2MeTZ8SbKsti12kJ8WKCaWVtvO3v+Li+dqak9BuAVhDFy?=
 =?us-ascii?Q?G1wiiw2fCwnGUmdqg/whdgTPg++QPeaty2zo6UTnBTih6jN7HOF3LfZ8KZYJ?=
 =?us-ascii?Q?w9Q+k6Hw6FUFhbGM42ZQgrd3HMQUcS2hspFOy59J1N1gEUf1Mfr3u/TXy2XN?=
 =?us-ascii?Q?6UgUHCAUjuE56S2OBiWFSnXfIxhQFZgQg+2axA41+6kNtxKBCPr2yonAOgIO?=
 =?us-ascii?Q?Fc6vbEmEqWKWNBA6A4oja44U32OZmnuM+P2qDfNukbsBnacY7ZOJ63c1Gd84?=
 =?us-ascii?Q?ISum5+avA/7uAhkdBmxVPPxstxc2NkWgmQvcSDIbFRwyyCogBQcQlCaLZKq3?=
 =?us-ascii?Q?Z24FBK7fyyPKX3Jn2rezvSAWBxcyFCUVKJSKQAQJL4BNG1JdlVWCO7DJS04g?=
 =?us-ascii?Q?B3YDs41YPJ9BF83q6PKHyReIBCMc5boYolk3vIPaAvjKVpkgBMLonl7ieetK?=
 =?us-ascii?Q?Y1yHMIiQhO0r6DIxSRAcWCN/A6hvqwAG54G81JHs7EJdtPbzLGVPol1PZQx2?=
 =?us-ascii?Q?ibAa7nSY3moAObk6RCBUL/ZgVf9QME8nqBkcq3eWzNaoa8RyeswpxTb1k+vW?=
 =?us-ascii?Q?h/RTEhQ99Uc+MNETXJ7Dhnh0M3dDaQR/gvj4Qd180ZTBkJKL4QsCd4pTL+6d?=
 =?us-ascii?Q?Vuu6FHWYZtfFilqhDla7/cZxIzR+8eog3TWPwSkcKvdeLxdRJyPj1einXa9f?=
 =?us-ascii?Q?8E3eXYzHaxSqPDKF5Ig6VPvbCvbeE8ZoAoo7yJte5xo=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BN7PR11MB2548.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2020 01:42:11.4793
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 951a0973-f5f4-457a-5d3c-08d8ac64208e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JLbAr6JXdyG67N5Hn8Q0C9CRNrU+3wu1Uh4wvIu6LPfuAn15VlVYJhkK0SSgjAZ9uHD2N17Go1q0aSWfZLhEILSw08yvqeUx9PCB8+nuNCU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4131
Content-Type: text/plain

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../files/0001-Improve-reproducibility.patch  | 20 ++++++++++---------
 ...{postgresql_12.4.bb => postgresql_13.1.bb} |  2 +-
 2 files changed, 12 insertions(+), 10 deletions(-)
 rename meta-oe/recipes-dbs/postgresql/{postgresql_12.4.bb => postgresql_13.1.bb} (73%)

diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-Improve-reproducibility.patch b/meta-oe/recipes-dbs/postgresql/files/0001-Improve-reproducibility.patch
index 32b7f4284..60b7910c5 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0001-Improve-reproducibility.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0001-Improve-reproducibility.patch
@@ -1,6 +1,6 @@
-From 3c13315447fa175da6c9ebe59a039e611cdb5bd1 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Tue, 4 Jun 2019 13:45:30 +0800
+From 71fbee3888ee889a269eded5585ed7591bcbe9dd Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Mon, 28 Dec 2020 16:38:21 +0800
 Subject: [PATCH] Improve reproducibility,
 
 Remove build patch from binaries which pg_config do
@@ -15,19 +15,21 @@ not recorded
 Upstream-Status: Inappropriate [oe specific]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
+update patch for v13.1
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
- src/common/Makefile | 4 ----
- 1 file changed, 4 deletions(-)
+ src/common/Makefile | 3 ---
+ 1 file changed, 3 deletions(-)
 
 diff --git a/src/common/Makefile b/src/common/Makefile
-index 1fc2c66..5e6c457 100644
+index 16619e4..665eaa1 100644
 --- a/src/common/Makefile
 +++ b/src/common/Makefile
-@@ -27,10 +27,6 @@ include $(top_builddir)/src/Makefile.global
+@@ -31,9 +31,6 @@ include $(top_builddir)/src/Makefile.global
  # don't include subdirectory-path-dependent -I and -L switches
  STD_CPPFLAGS := $(filter-out -I$(top_srcdir)/src/include -I$(top_builddir)/src/include,$(CPPFLAGS))
  STD_LDFLAGS := $(filter-out -L$(top_builddir)/src/common -L$(top_builddir)/src/port,$(LDFLAGS))
--override CPPFLAGS += -DVAL_CONFIGURE="\"$(configure_args)\""
 -override CPPFLAGS += -DVAL_CC="\"$(CC)\""
 -override CPPFLAGS += -DVAL_CPPFLAGS="\"$(STD_CPPFLAGS)\""
 -override CPPFLAGS += -DVAL_CFLAGS="\"$(CFLAGS)\""
@@ -35,5 +37,5 @@ index 1fc2c66..5e6c457 100644
  override CPPFLAGS += -DVAL_LDFLAGS="\"$(STD_LDFLAGS)\""
  override CPPFLAGS += -DVAL_LDFLAGS_EX="\"$(LDFLAGS_EX)\""
 -- 
-2.7.4
+2.17.1
 
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_12.4.bb b/meta-oe/recipes-dbs/postgresql/postgresql_13.1.bb
similarity index 73%
rename from meta-oe/recipes-dbs/postgresql/postgresql_12.4.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_13.1.bb
index 6ea9acc00..aeeddc647 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_12.4.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_13.1.bb
@@ -8,4 +8,4 @@ SRC_URI += "\
    file://0001-Improve-reproducibility.patch \
 "
 
-SRC_URI[sha256sum] = "bee93fbe2c32f59419cb162bcc0145c58da9a8644ee154a30b9a5ce47de606cc"
+SRC_URI[sha256sum] = "12345c83b89aa29808568977f5200d6da00f88a035517f925293355432ffe61f"
-- 
2.17.1

