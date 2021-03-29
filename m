Received: from outbound-ip24a.ess.barracuda.com (outbound-ip24a.ess.barracuda.com [209.222.82.206])
 by mx.groups.io with SMTP id smtpd.web10.16757.1616990785949152142
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Mar 2021 21:06:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@digi.com header.s=selector1 header.b=oYJJ/CtZ;
 spf=pass (domain: digi.com, ip: 209.222.82.206, mailfrom: ben.gampe@digi.com)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2109.outbound.protection.outlook.com [104.47.70.109]) by mx-outbound8-202.us-east-2a.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Mon, 29 Mar 2021 04:06:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hrjSsHr3ZZdevkK0Bt61ACVZK1pWVedDn1l05ZO2l+2MSDeAqDZkIF2ciobM1CyK/cohLdmrI4+bwVUywXrzx8ZTilazACdDK0o831SjUCQ5CxOXbZuGz1f1cLjekSnqTlqIcFcJPF9dsokbBqnZkaRyCnSZxTkkXkPiMUYUZRbV8h2+/tKkoMukNY7ygFuZ8qzz1V5YWmKxi8Ua9x6F+Todd5/M9jnqnIoGBR13qGS0qzEy9TURT+uBA1g6KcfckTcTpgRmGV5Y4l9IALnqJ6aVmUZie9hGClYaTvu3JkbERbxRlfchbLZt+pQh/UWdarXa1w/DkI8PIhI3mTPixw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rKmhLFIcf1iX167iH2/PYZJVyEH53zG8Jj6hlfoy6QY=;
 b=HSfjXjIR8EDjEd5f5rRRD6P8tPH4hLOvAYAOeYuXAPXYACDEfYP3rquuFK72f9Jb1/92lNZD2oplFWqy+x1Sm4R2U1mx7Z0FAMWcm5lIctCsoMOsfVQhUab0NoMsD/AdrvMtuTJdBMuVrWilIqq8LoDRpFczRTx8q5LQ7jvFWJD5jmFwaldWP/nYJPQgeww/bN8XOq19QuV268jRSO87CZUaCxx8M2x4piUymxVnRiNA0SeGME2d5mkSXuJukJ00t9n17qidyy+sT3svrfikUlDNSN3kYjFs2Ts6scQZVopI8EoNMsYlg3FKGHywNEpzRuCZoAkugLZ1sCrmzWnGhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rKmhLFIcf1iX167iH2/PYZJVyEH53zG8Jj6hlfoy6QY=;
 b=oYJJ/CtZiyLkCj25yc2x8EnMN9k3d6CMHY3f45r4lJkMn/P6sNRqGKnMpRUThAcSgQljw85XHXpRTS9c+SGnIFC9RCl5Pyj8Hd4waVFn9Lu2P1pwTq+2wFfkyQqKWpC/C6fpibiCTkGGcP6jHmE2DERmAF5ulrZA7aN/U+sVcOY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=digi.com;
Received: from BYAPR10MB3320.namprd10.prod.outlook.com (2603:10b6:a03:15b::21)
 by SJ0PR10MB4543.namprd10.prod.outlook.com (2603:10b6:a03:2d9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.33; Mon, 29 Mar
 2021 04:06:00 +0000
Received: from BYAPR10MB3320.namprd10.prod.outlook.com
 ([fe80::3cd7:c100:494e:cecc]) by BYAPR10MB3320.namprd10.prod.outlook.com
 ([fe80::3cd7:c100:494e:cecc%7]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 04:06:00 +0000
From: "Ben Gampe" <bgampe@digi.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ben Gampe <bgampe@digi.com>
Subject: [meta-python][PATCH v3 2/5] python3-httptools: new package
Date: Mon, 29 Mar 2021 14:04:36 +1000
Message-Id: <20210329040439.2600056-2-bgampe@digi.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210329040439.2600056-1-bgampe@digi.com>
References: <20210329040439.2600056-1-bgampe@digi.com>
X-Originating-IP: [49.197.127.171]
X-ClientProxiedBy: SY6PR01CA0005.ausprd01.prod.outlook.com
 (2603:10c6:10:e8::10) To BYAPR10MB3320.namprd10.prod.outlook.com
 (2603:10b6:a03:15b::21)
Return-Path: bgampe@digi.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from beng-dev-laptop.beng.bne.opengear.com (49.197.127.171) by SY6PR01CA0005.ausprd01.prod.outlook.com (2603:10c6:10:e8::10) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29 via Frontend Transport; Mon, 29 Mar 2021 04:05:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 580839cd-a926-41e7-44ae-08d8f267f650
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4543:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<SJ0PR10MB4543D64C316B63F95EA7A2608F7E9@SJ0PR10MB4543.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:494;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sxMYlHENns4Q4Wd+hIR1pATmBDdWM5ryvhBouFry/7QqIRLQwvWQabPJhUnYb/U55SPHVOiK4KNPDODcCSULexs2xvgvCcJhUBKXwDrJXGsqh4INGJDorLSGneC5we9M3PHDVjr8mwd3O4KMCyMG0VxXl46GLhIoyqxHJPtWY9ora5k7O/0IF8Y9LscsUMtW9e6OzWHVDZ2NOY0vrz4DEHimT5if/xzK9PCHD/eYEM4IuPqtrg4uqi1xaFKbJu0yCjRacPkSf9BZnQpG20V2Gv6jc7N6s1ZMsiaxwWEHnAHFUcpr92j0BVFt0ZNVReuE2zgybYkttM0+j9lF+vcpQwt6HH+IaIcL5b+bmOSCT3JnRbnWbjPkJZDxs2Yduft8SBSLWGKr194JLS+shUEQl5PxQCeghRZj3P9p8SNeMwa+2sOLH/pIV1IYTxzkdCyM7pm7vrgmelexbJ+xGiUJRPXFGLRpiOwUCelHbqkxoHVR1OFwxJXl/blvWMpJZwCvR6yrb7aKpVuvErp1BDY1xr5Id36s/EW9ugH4iZ2O43vTG3wSQ22+ONp+xW/jBmMil5z4b6Xd6yb0NoatKj0p33sUs9M0pQuccdEEv6cRA01ZJ4kM2eyIhSnsCXbc4shDeIsBkKr9G6+y4LrTEk2iG9LFI4Kj38h7JW+2XUXrPbFCfyufIR/RFdeN2M2zf7QunMozFY0O5XJAol+wY0C+jt0NJYColCj8whGhO2BN9VU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3320.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(136003)(366004)(39840400004)(66476007)(16526019)(186003)(66946007)(66556008)(4326008)(38100700001)(26005)(1076003)(36756003)(2906002)(8676002)(6666004)(478600001)(5660300002)(8936002)(6916009)(6486002)(52116002)(107886003)(316002)(6506007)(2616005)(956004)(6512007)(9686003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?Mb9FdytUqYvJ3eO4/ssgMTJn5sGYF2XjYgL5luh5mwbCGIUf1ZD+NXTaKDyk?=
 =?us-ascii?Q?aejcZznmU3XS9IMx5oHkIDJMyo/tSH9BYoD228dujLqZM60UVpYtTJQf55J5?=
 =?us-ascii?Q?K6WILxgj02dReaxpgonlAXpQmjDdEAdgAS4ydFXX+mpQ+FxuhkX00H7l9++1?=
 =?us-ascii?Q?SVSaRLwISkDZhw7Nx8cc6V/yGV7qK90NMYOsq/mHcwdwwHtSBzojVvRZZ5W8?=
 =?us-ascii?Q?PG4VOvosVpvMd/qL8waMPk1QBIWK945+4gQSTBc1dQtLtF3M+y0Lj4ajTXek?=
 =?us-ascii?Q?8Ljgc9C93GXLcQl5sdOHLOwbVjz5UEcRa0Guxclddm4x5+r212XGCgh9tQey?=
 =?us-ascii?Q?GgYtrM3zTAgwN4UAyYQT2yT6gmRh2tEg05eeMtgTz891xGh39NTPtRdKkNBL?=
 =?us-ascii?Q?FjxCS06eGXrn8vDatmofgSA6+bx6drKCW0oe+1P5zqfUhNVstQqZO+kqcGbu?=
 =?us-ascii?Q?1thEdHKzpehWXFSyZTzR60ZDBw+UDeb73I2CEDhpUuMsoa8Sk1+7Yl05tfMu?=
 =?us-ascii?Q?hCGBm3aAX4oyDtFVyxeZFBY0ZB55pB1+6k6Hnw5IAC5OEL7R06ddnVBF5C9i?=
 =?us-ascii?Q?Xe1JBZhq61UAI/sGXUrzYeBLnJ563fXefcMypW0LOyn6qR6c6Sbr9c29hiIm?=
 =?us-ascii?Q?CS9ORquVDSxNY8WUxKjuLWvxyBSTAeX7/Esgnzu3pnF0iRNOqqOlLCkQJYYL?=
 =?us-ascii?Q?TarZKONsOfpBKrl0gbe1raNJkMAEk+TRlPPaE1NxMLQJ/m7lRzYkYNHTFHx2?=
 =?us-ascii?Q?Fv7JDY4fNi1otf6TW8UuXs4mZF0qzF8C7Hmyuu1iN04EpjeQEYLxAoZa+fI9?=
 =?us-ascii?Q?VHrvlxfaMZsY2SjRi9WaS2Jj9c+8YtkDegaoqGQ2xUhdZ5MvdBY0+mqUGXOG?=
 =?us-ascii?Q?FXIYOpEeyx2LALXJeMP/g2OeQoJBNmoxVF34bG51PuZ52vUVA22HhkcmAeI3?=
 =?us-ascii?Q?AbLbVZGi6+JHJPk0cpvy1lDQkN6r4EuhUtOOTDCxb+jaHM5Njanfd+YGlo4M?=
 =?us-ascii?Q?0wLQ+o7akYC9G7ZWhe4W13TNpEv9nv7dNGeAvE6M1aPJcRwfVSr1MoNyaQFo?=
 =?us-ascii?Q?0oPDXPS2dQ5uDXUcsNb2GrHDphChGckHAGe1Q/+/CqPSlsjHC+QeKX688rtv?=
 =?us-ascii?Q?dRjCYtbbEv0XGBuDhFPc6CFw4hx/aO9H3drUQgNv21T/Ftrl/HpitlEg/rBo?=
 =?us-ascii?Q?P6c9I7Ctj/PxH2DWDBAONZWorQoYv7HYth2rJk0FOnQYJa084JwF7TkblpM3?=
 =?us-ascii?Q?WUT8f949W+MHSRHQ7BgkoowGTtrq/OsSlEEOhH67ELWOtI40mKfHEh7kQ4+J?=
 =?us-ascii?Q?alN3OrETqlnxOBo2lTBSHgH2?=
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 580839cd-a926-41e7-44ae-08d8f267f650
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3320.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 04:06:00.3402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ArugYMmE+Bwx1c6tOCTtLmEMMeTvyauCuV0ULkKn5BQ2ssSr7DKzSmU+rrjuL6Qz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4543
X-BESS-ID: 1616990750-102250-5772-63330-2
X-BESS-VER: 2019.1_20210325.2126
X-BESS-Apparent-Source-IP: 104.47.70.109
X-BESS-Outbound-Spam-Score: 0.50
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.231167 [from 
	cloudscan9-121.us-east-2a.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 MSGID_FROM_MTA_HEADER  META: Message-Id was added by a relay 
	0.50 BSF_RULE7568M          META: Custom Rule 7568M 
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
	0.00 NO_REAL_NAME           HEADER: From: does not include a real name 
X-BESS-Outbound-Spam-Status: SCORE=0.50 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=MSGID_FROM_MTA_HEADER, BSF_RULE7568M, BSF_BESS_OUTBOUND, NO_REAL_NAME
X-BESS-BRTS-Status: 1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Ben Gampe <bgampe@digi.com>

Add recipe for python3-httptools: a collection of framework
independent HTTP protocol utils

Signed-off-by: Ben Gampe <bgampe@digi.com>
---
 .../packagegroups/packagegroup-meta-python.bb             | 1 +
 .../recipes-devtools/python/python3-httptools_0.1.1.bb    | 8 ++++++++
 2 files changed, 9 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-httptools_0.1.1.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 0418b5930..30e90dcd7 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -162,6 +162,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
     python3-html2text \
     python3-html5lib \
     python3-httplib2 \
+    python3-httptools \
     python3-huey \
     python3-humanfriendly \
     python3-humanize \
diff --git a/meta-python/recipes-devtools/python/python3-httptools_0.1.1.bb b/meta-python/recipes-devtools/python/python3-httptools_0.1.1.bb
new file mode 100644
index 000000000..164a32d64
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-httptools_0.1.1.bb
@@ -0,0 +1,8 @@
+SUMMARY = "A collection of framework independent HTTP protocol utils"
+HOMEPAGE = "https://github.com/MagicStack/httptools"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0a2d82955bf3facdf04cb882655e840e"
+
+inherit pypi setuptools3
+
+SRC_URI[sha256sum] = "41b573cf33f64a8f8f3400d0a7faf48e1888582b6f6e02b82b9bd4f0bf7497ce"
-- 
2.25.1

