Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.55])
 by mx.groups.io with SMTP id smtpd.web08.4313.1608105821798642509
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Dec 2020 00:03:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=VJdC0gXv;
 spf=pass (domain: windriver.com, ip: 40.107.220.55, mailfrom: hongxu.jia@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xl9PMMKrfcwKOodKZrB+aepqgs0/LiE5D2e30dNr7PfjW3XFdgKydsFKTzcdJ4XD/cswM1rux5j1wkSDf+koIGkgRne2B+f5a55XOUkqivi2Rn/IucBpJMClsGFlKWhP7IoHehar8ASA+ZrV7WBqw802c35dkrkKpfx3YdiH9N9ZUd01lDTdyjZo/9tdj+vg4sQvMC6IlytOrMhd4x146B+KjqUm6Uzins0dq0ZLH6U7qz/stIA5ETaX+HHMC7URLwoEQ6+DaBvn/IvfXfuzQZPxK3cv85Ed+6b6r2SLvvqQcM7ggkCgGURMG7vMoFQAa8ZtdbmkaaN1eyuwKJmNpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YNSmere/0gVr9FIliAVKll5IsNh/ZTfIyRAHPc4+PTI=;
 b=EGQeuo0Msb5A3E35tnz+Wknxb+E1y2iB4OIK0iAM34+rzDtbtY4m448aemEpk13lkZ6BEnHhFqjI2IW+2TDaXhn6AKvch4NRhqVeuU1ecy272h2qsWuaNNuy30fuVNM9ekLn1U/P2X3nlDZrAmX+b+8dh2i+o0RKAEjfvZ1XDpltxx/PxADIa50WGK/adSdzTPgqosTz8LRIiSMUOKU5j1MV/MwVqsj0YCIiehXelvq7lrJGcfWMdgRn+cr/NRfC4tMDhDfeQFXsYxOZ5MC5NuvaP2GnXBKc3+7U9UozdFMVqM+5LT2cZ5e01hMY09GVyB1tTy9N9/k1KeP1ppEdyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YNSmere/0gVr9FIliAVKll5IsNh/ZTfIyRAHPc4+PTI=;
 b=VJdC0gXv3Q3lsV0GcvoFke7FQv9vIQbdKQRVkC9NhqQMMpVBDcvBlT3Qy9tJ9Qw6Cq9lQaJOA2GvCGQ0VdyT3v3Czdq85MJsdN8ZBif3y6eKCf5W4xzxznXnLVWzBKLgiQ8s9BvMobihSx2FzDoYAFy2U9z/QVArv9z/sw86WR8=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from DM6PR11MB4380.namprd11.prod.outlook.com (2603:10b6:5:14e::20)
 by DM5PR1101MB2074.namprd11.prod.outlook.com (2603:10b6:4:50::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.20; Wed, 16 Dec
 2020 08:03:40 +0000
Received: from DM6PR11MB4380.namprd11.prod.outlook.com
 ([fe80::15ab:1cac:c06:c1f8]) by DM6PR11MB4380.namprd11.prod.outlook.com
 ([fe80::15ab:1cac:c06:c1f8%7]) with mapi id 15.20.3654.017; Wed, 16 Dec 2020
 08:03:40 +0000
From: "hongxu" <hongxu.jia@windriver.com>
To: raj.khem@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] flatbuffers: add python3 support
Date: Wed, 16 Dec 2020 16:03:24 +0800
Message-Id: <20201216080324.14442-2-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20201216080324.14442-1-hongxu.jia@windriver.com>
References: <20201216080324.14442-1-hongxu.jia@windriver.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK0PR01CA0069.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::33) To DM6PR11MB4380.namprd11.prod.outlook.com
 (2603:10b6:5:14e::20)
Return-Path: hongxu.jia@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpggp1.wrs.com (60.247.85.82) by HK0PR01CA0069.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend Transport; Wed, 16 Dec 2020 08:03:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 88c6a6ef-771a-410e-53f4-08d8a19919c7
X-MS-TrafficTypeDiagnostic: DM5PR1101MB2074:
X-Microsoft-Antispam-PRVS: 
	<DM5PR1101MB20745412C8C8D0551D18CDC794C50@DM5PR1101MB2074.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:361;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BmVJnrXqHbriw14kkndRyVRH6Hx+gr73e6z4Y/Ig6iSDbOeTVQu93eKGVmlcdoTF5qN3R46JjjhK/482W4bB8cc3tO+V3Uvu5I1K6t8YEmfterdt6NbiCLjEAGsdQTYZvI4GhPITzg/zY1XeiluQxMRK00M8THXLVQsyu9O5JTMnLXXZrmbzKgiW2r8Nhh2Jpif6k6iuFeOMQwMWQzm57ljkOY1WJHNUYeQZ9sw6RQLP/rCs33xOsIrc/xukRlJ8yrQwckJpRmi4kuBqFsLOlJ//K6eOzZcRjmebjg8VSlAIyvVuImlNl1jYqt7utgcSeU3Z6p7BR7KvOpQdCKSuR7E6PZgt7PTGYWegz8AI2ryL9C3fJOFZO05TgznGNIGlQPe68eh2QEdmIiCrXQw2pA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4380.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39850400004)(366004)(346002)(396003)(376002)(6486002)(2616005)(316002)(1076003)(86362001)(2906002)(478600001)(44832011)(186003)(6666004)(6512007)(956004)(52116002)(66556008)(16526019)(8936002)(6506007)(8676002)(5660300002)(83380400001)(26005)(36756003)(66946007)(66476007)(6916009)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?d9Vgmhnf/AyX7MpoOj/y43Zw62sIVNDzU7CvRow9SOngplKEjAVL9AP2aYGa?=
 =?us-ascii?Q?8uRAHcxp1+7rqP0af2lf3wrLv5ktExYf5gLYn1y7Fzk6a50Db2J1oZkBQP7p?=
 =?us-ascii?Q?yvstZ5j4sHULy4q78ja4HGN/CoH9AzN5E67px2moZM+GALS0bDqwEI0DOzfP?=
 =?us-ascii?Q?Dxn/idS+Uez8GKu6Nc+zEvuD62Yka/V6APKZ9jYc3YrA5sdnsP2xbgZsNVoK?=
 =?us-ascii?Q?XUwbqa1KqvcteqLP3I+GI6m1ZU+gFXnpMFXwPfUDO1Wn9Pij3w7OyJCUUwCT?=
 =?us-ascii?Q?0Ax7LdxUtf7Wu2cLolrJ4Vc4zgURldiNCF4a0xkyOM/a8JON2p5HK2EjdEtf?=
 =?us-ascii?Q?ZluhxP2hxExDzMgKiFxfGHi08UtceBrzF5DyHV9L9XjnMxScANAqsVfjvRqj?=
 =?us-ascii?Q?/9nbz0pNe3dH6cIna/+RKpSdkgpmPPIahAF+M9wtQbUiSp2tz4heIwkQxcOr?=
 =?us-ascii?Q?81IaDnTngN3bIgDfb/1Ib3qEp7E4TTjGkfBwnkRhVguCHOLOzteuGXpAHiPL?=
 =?us-ascii?Q?elY9RduUemIi1NgmGMdDpULkcAVF0NnRs7rSI7kw7YSJj5eA4PpaPYXG1LG0?=
 =?us-ascii?Q?XRuA/z+Kcspsmh+JOC/XpZIt006f8AP8zNVtO6ttRm08EkvpXSI4C9mKk3RD?=
 =?us-ascii?Q?N2nfErYJgxv1l1PM+MaYn/ZJMLxSCOF9+wxWPD746x3WCL9Ao8pAtFSLRPOi?=
 =?us-ascii?Q?/4C40Hgfvw+hzzcStcCDMyLq1iANOGqTcdLlQQOC6iB6grZjyTOlu4OyarWI?=
 =?us-ascii?Q?1Xh7XrRq/dj0S87bMKYg3pjb8WbLP6zj3N+r3UbV3VzJFYQFpwWspXpyhlZ5?=
 =?us-ascii?Q?84H1CL0B7+oZlSdL988GmQDcTcnEEsgM6piERnjc7LS+nOgMlCNsAnTWrFzZ?=
 =?us-ascii?Q?QvJso/PLb9vbp5i3gE8VuxuU8zKZZgnv9WDg2/GfNy8G3wQ24qVUlSOvAxHU?=
 =?us-ascii?Q?d5Zlv3FAC+TtcXyKDf5FiPfUUOhCVsU8SrKd2Mj4eZ3b0uwIDQ/UBW2Z/w3J?=
 =?us-ascii?Q?WIbs?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4380.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2020 08:03:40.6727
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 88c6a6ef-771a-410e-53f4-08d8a19919c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jb98dgf9htz9ovwOoMGuHHZZd5zFPoqBRWiO7w0/u4gT17V4UX12h04L69zarMayFDXgUYaZWYTdQ8baDq6SBUOLczmcH4aCrV5gVoO95X4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2074
Content-Type: text/plain

Add package flatbuffers-python3 to install python3 scripts

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../flatbuffers/flatbuffers_1.12.0.bb                | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.12.0.bb b/meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.12.0.bb
index 1abfc8819..fb4be0f16 100644
--- a/meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.12.0.bb
+++ b/meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.12.0.bb
@@ -3,9 +3,12 @@ HOMEPAGE = "https://github.com/google/flatbuffers"
 SECTION = "console/tools"
 LICENSE = "Apache-2.0"
 
-PACKAGE_BEFORE_PN = "${PN}-compiler"
+inherit python3-dir
+
+PACKAGE_BEFORE_PN = "${PN}-compiler ${PN}-${PYTHON_PN}"
 
 RDEPENDS_${PN}-compiler = "${PN}"
+RDEPENDS_${PN}-${PYTHON_PN} = "${PN}"
 RDEPENDS_${PN}-dev += "${PN}-compiler"
 
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
@@ -28,6 +31,13 @@ inherit cmake
 
 S = "${WORKDIR}/git"
 
+do_install_append() {
+    install -d ${D}${PYTHON_SITEPACKAGES_DIR}
+    cp -rf ${S}/python/flatbuffers ${D}${PYTHON_SITEPACKAGES_DIR}
+}
+
 FILES_${PN}-compiler = "${bindir}"
 
+FILES_${PN}-${PYTHON_PN} = "${PYTHON_SITEPACKAGES_DIR}"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.18.2

