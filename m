Received: from outbound-ip23a.ess.barracuda.com (outbound-ip23a.ess.barracuda.com [209.222.82.205])
 by mx.groups.io with SMTP id smtpd.web08.15846.1616981629269520521
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Mar 2021 18:33:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@digi.com header.s=selector1 header.b=AEv1tSy5;
 spf=pass (domain: digi.com, ip: 209.222.82.205, mailfrom: ben.gampe@digi.com)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102]) by mx-outbound11-146.us-east-2a.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Mon, 29 Mar 2021 01:33:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mEKXE9K4trqrqWhxh6C8kUPJ9FBIo5W6TwYEp2U+D77NJxdKxjsYB8fr1tEG+QkxXdtlepPkaepyoldZwDs9W0Eugzv8hEOe84Xp8R2fdfTPbGQn4JFn8UkiI3oUWuGSdxvNKdaEMdxL/0kQSN50jHzx1XA+aqovHJj8TGCmB3cqM8mjhdmgMem8US3MuTrBMVBZwD4VagANxwhvPhJEsIiQy1tm8dD4LB5zdB5jpWuily6YIYPXPwzNnEWfvh+e1CX7UxwTbW6mUhmlg1pTNBZCM6OEWJZNceVe4S4m4o65rex9OKp87aaR5cuCU+AUkL5cVh61ezv8pbIgPYFViA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GAK4YGY5GlSSvz82Gc5yjT3OFP+rAS0qey2EswHIqVA=;
 b=XG75vPp4TmtUtHWqIgH449rDranGVBxmOn7jvEOh4f47mdzgJaxZ3Lkyij7CHcTPUchK5qhggoqpdKJq/4xkEWrGVAHG7mLqg9f2Comj6Yy+JlKTWIkn7sbqWt7MYiz39ZJL/c70hORtJMuV3wwPFeeZ4dG9z5IYhiqzOCkRvrJwG+BPwSQBDY0A31+GI5T6he1GY53/gN5GC6Q3FMJ8CwgK9sOkA2Qo+riEafllwEMhpts9jpgVkJQAP4fc5339JP0abI/JInmcpWKEYzifsympsjvBYR1Kn893R0vBg1ciAiqzdJ2HI6fhF4NczVUyqeEFfRVviGA95qq6L2DT+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GAK4YGY5GlSSvz82Gc5yjT3OFP+rAS0qey2EswHIqVA=;
 b=AEv1tSy5PtnhZcEcXkqJgUIHCluxS6FVoPTvivchs/DiJoL3/VmQaOhZFwEsRcCl7XzZ/Mf1dvvpgRzIm4qonOvJBmFpjEDdEZfFDQ7iAxGp4XKAMgWJCpQvGG6tMSsuCdGFAEynWuDC5o8KP/qx7ETvkCEnE9ixNbgAvtL/4Mg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=digi.com;
Received: from BYAPR10MB3320.namprd10.prod.outlook.com (2603:10b6:a03:15b::21)
 by BY5PR10MB4019.namprd10.prod.outlook.com (2603:10b6:a03:1fb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Mon, 29 Mar
 2021 01:33:47 +0000
Received: from BYAPR10MB3320.namprd10.prod.outlook.com
 ([fe80::3cd7:c100:494e:cecc]) by BYAPR10MB3320.namprd10.prod.outlook.com
 ([fe80::3cd7:c100:494e:cecc%7]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 01:33:47 +0000
From: "Ben Gampe" <bgampe@digi.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ben Gampe <bgampe@digi.com>
Subject: [meta-python][PATCH v2 2/3] python3-pydantic: new package
Date: Mon, 29 Mar 2021 11:33:09 +1000
Message-Id: <20210329013310.2582815-2-bgampe@digi.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210329013310.2582815-1-bgampe@digi.com>
References: <20210329013310.2582815-1-bgampe@digi.com>
X-Originating-IP: [60.241.24.90]
X-ClientProxiedBy: SY4P282CA0012.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:a0::22) To BYAPR10MB3320.namprd10.prod.outlook.com
 (2603:10b6:a03:15b::21)
Return-Path: bgampe@digi.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from beng-dev-laptop.beng.bne.opengear.com (60.241.24.90) by SY4P282CA0012.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:a0::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25 via Frontend Transport; Mon, 29 Mar 2021 01:33:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4df94f30-d7c1-4650-33d6-08d8f252b274
X-MS-TrafficTypeDiagnostic: BY5PR10MB4019:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BY5PR10MB4019EDF1FD8CFEFA4C7FE7618F7E9@BY5PR10MB4019.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vJ7LKvb7gHGUbLpD1i2UYHFl3sX2S8ovHOV1ZDGf48ssONJArOCXDCV36xN6aeFoJeXLIxOr0M9lhwpmpvc45CcxxInaNzZ6x1h5aH714QwJd1IswYli+MbSNORgA7x6u+asvcZXNGLwlchUsDKbAe/Qux6msFxqO6Bb//kGPCz1IPpkHNEu+lMGkag5HLY6KSjfrBGTmuJGEKw39IXz+1PzXq683pObWRQUxpdpThU/k+xxYM+3qpNq06m6rdbXevlJWZ+CPS1+C7Rk9/SvrjD2iHtlogS1fIs2EGWLFRidW40o/Drq5auT1knJQHF16D3tvMNlgVtYyGyqr1jQ0txbxWppR48PBPuhAHDUa/Xas5UvPpA7QDpGPhogwABPa7PMr3P+GS0G5/xBdqFoy+EJghJZG0xYZdkzKDqfqMJJmkugFxrDDsfNkXGZeyCxuAuVIg1Vvaxo5C6WgcZMeI1vjvs84Ba2/XBmsDTxf1Iy6JZoLU/dyWQctcOOflX1+ODZxG2VOLyrq5t4KGWhbc3TnJCLCAzpFIFqczBjYRqNkm48mjz8k/1GeOh0Q7Efe9UsT4IVT29goW2WQosbg9LnlXzxQTbozp/bpLLYX8f6x68Kp5xNUyvKRuCba9VIFz/yO+JCsM9jZMtSd6tmJikmsZ8pyqQ/pLNTD/T1BXtKiGDHhTxwBJt6NDYD9O+3NraWFithrNObxIUYejSTLu0oL1abErz72zRJjZ/CeZQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3320.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(39840400004)(346002)(136003)(396003)(8936002)(478600001)(66556008)(2906002)(66476007)(66946007)(6666004)(6916009)(107886003)(186003)(6512007)(26005)(316002)(8676002)(38100700001)(4326008)(2616005)(6486002)(956004)(1076003)(6506007)(52116002)(5660300002)(36756003)(16526019);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?iWDqZK52YDc3hsplOUScMPj62V9iMZNnnwX5gmPLiO+J/cBsz9P9SOtto/eC?=
 =?us-ascii?Q?kx50cC+H5fjkuUJOdmnc1bZayguqjmCmKj9UpLAZOo1nXtNt3P6n1Fc9slhE?=
 =?us-ascii?Q?UciqnTUmBvwixWYit3cr3Rp+GTb1IvSyMHO+hsYKeSv3pOSONFNfRSexqKMM?=
 =?us-ascii?Q?Y0El0QsaSZALv3jALxcKyOu/Tkex1bdGUnBg+sPWa3oZ67ZckL1yTDNRQzMj?=
 =?us-ascii?Q?RTOzZSO1kwCM3n2QkFm/hIQgmqN3hbTfzeXa6fZOohgGLRqAZ6CrGhy+Mo7A?=
 =?us-ascii?Q?l/CO2/6PYcEIIM5ZfQvpr8mVi90D+D7/29J7pUmHn9ycOrbEGA0MLelZ/Psg?=
 =?us-ascii?Q?HCQn6E3NcpoGmx/T9uLGMo5n/ybuCQO/cIfBE3z0VUvjr/yl1OMQ41wwmKTF?=
 =?us-ascii?Q?jfx8MMFqiuC5jyct0H/7AcLT7yKxLWz01GUb0XFBVuV3txKn0NXG25avxedo?=
 =?us-ascii?Q?0iXZ8zBC3dFEuW/OFkfx58joXh+kEleUO9yEXyUI921M8qZ7ScY8LSS2CoSI?=
 =?us-ascii?Q?EWXLwvd/po3ppJ4M2jHZOcYCmcUKT13+Pm93V0fJe0u0oT7dDfAtAV6/htDT?=
 =?us-ascii?Q?ZgLYIvN+QjwU8Xc7kxOHgGxYq0ztax8JFOAFDX3B+h+N/TNHPjy0Kwpu7z9M?=
 =?us-ascii?Q?rDdR9p9r7q8vKF2de2UkizdM4OVAVgMY+CTKAdiu6Rbwb1R3QASUqEbtRYB+?=
 =?us-ascii?Q?BTQP8wYwogDxsHM5dOk9mBmZnjm5SjVaoYzB19jL8QLcfdwCrg9KvmLKkyv8?=
 =?us-ascii?Q?CDJfMOxwOjCJv5ryUQYefjrOVixmzxV5l8luOyjW58MXJOLHI2ze2cEGUNH4?=
 =?us-ascii?Q?l8CdaUQAm4sJ5FMdZlJ/t6rdIkt9DlywgmteGFcNq07swXTlbCkjjyj3rE+e?=
 =?us-ascii?Q?K2fBXUi1Vs+pTeAadJl4UgXHwIzFiHq3nkOM8Sr0L7Rd+eSEp5htR2Fn03WN?=
 =?us-ascii?Q?KSoAJ9X/uGfjSBL18bSFTU/zSHMAST830tbrjgjVKec1yi7/qWjeGexG0sf5?=
 =?us-ascii?Q?josNFjdfd1NM1VpXbALS3TFbpggqwQwAhXtmhlXSDB6b0WMFf1YBAM+X4mqC?=
 =?us-ascii?Q?s1zwFT3UQxnXa0aP13mUF+bWP06DeqndVb7VC1VL33H8+TEFBMTCYMuGcfj9?=
 =?us-ascii?Q?xL/rGMz0jbwMglirnp0b2J7UblT8C1EfcNSO/WKbWSPWBa0/iyP/ye1E4W01?=
 =?us-ascii?Q?jaJLXma9BzyxIwzu5bY38ev6UYNtukRR/9xRPTsC+tYZX7S9nJMRG4kG2Lcw?=
 =?us-ascii?Q?ZxN+RihyfBY72wYRolBRpmnHsU8qYrJSjeNbeiLj1fnPqHlP3KkD+5r6ua3y?=
 =?us-ascii?Q?tRMvmjrtoB/1iwQMiEBHAZG7?=
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4df94f30-d7c1-4650-33d6-08d8f252b274
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3320.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 01:33:46.9254
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VKYKNBw3jFu+Vs6QzGHYPp48JCXYNVUVirqGWyb6La/BoRREz4nOZqNo61ZREuvR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4019
X-BESS-ID: 1616981627-102962-5413-25923-1
X-BESS-VER: 2019.1_20210325.2126
X-BESS-Apparent-Source-IP: 104.47.55.102
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.231164 [from 
	cloudscan22-232.us-east-2b.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 MSGID_FROM_MTA_HEADER  META: Message-Id was added by a relay 
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=MSGID_FROM_MTA_HEADER, BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add recipe for python3-pydantic: data validation and settings
management using python 3.6 type hinting

Signed-off-by: Ben Gampe <bgampe@digi.com>
---
 .../packagegroups/packagegroup-meta-python.bb       |  1 +
 .../python/python3-pydantic_1.7.3.bb                | 13 +++++++++++++
 2 files changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pydantic_1.7.3.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index fd78ee0a2..c0132abaa 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -498,6 +498,7 @@ RDEPENDS_packagegroup-meta-python3-ptest = "\
     python3-prettytable-ptest \
     python3-ptyprocess-ptest \
     python3-pyasn1-modules-ptest \
+    python3-pydantic \
     python3-pyroute2-ptest \
     python3-pyserial-ptest \
     python3-pytoml-ptest \
diff --git a/meta-python/recipes-devtools/python/python3-pydantic_1.7.3.bb b/meta-python/recipes-devtools/python/python3-pydantic_1.7.3.bb
new file mode 100644
index 000000000..87795ce09
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pydantic_1.7.3.bb
@@ -0,0 +1,13 @@
+SUMMARY = "Data validation and settings management using python 3.6 type hinting"
+HOMEPAGE = "https://github.com/samuelcolvin/pydantic";
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=215ca7f54cdc98f95ee96c7511d64158"
+
+RDEPENDS_${PN} += "\
+    python3-image \
+    python3-typing \
+"
+
+inherit pypi setuptools3
+
+SRC_URI[sha256sum] = "213125b7e9e64713d16d988d10997dabc6a1f73f3991e1ff8e35ebb1409c7dc9"
-- 
2.25.1

