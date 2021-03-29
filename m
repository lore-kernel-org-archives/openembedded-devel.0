Received: from outbound-ip24b.ess.barracuda.com (outbound-ip24b.ess.barracuda.com [209.222.82.221])
 by mx.groups.io with SMTP id smtpd.web12.15275.1616977319982255940
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Mar 2021 17:22:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@digi.com header.s=selector1 header.b=TyMNYWPO;
 spf=pass (domain: digi.com, ip: 209.222.82.221, mailfrom: ben.gampe@digi.com)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2172.outbound.protection.outlook.com [104.47.58.172]) by mx-outbound42-231.us-east-2c.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Mon, 29 Mar 2021 00:21:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fwqfRL9WUZypnJ7NCHjXf7VtZj0ZvhztnoGw9Td6UU3u8VYGKEEorzEghIHqYMM8bp+sLIOV3tYV7iAprg4e4B1+anwNcDurG1zK432XqYbykkf6u2CD9cmtYcwevYFc73YQhSkqD9SioZ7VuiR0UHpbP6MNq8yGcV4W13thKk6dOIt8Yfuro0WZWktGKMlHZusRFmi/wx11rPetNG0ciJUkVJJJaOrWTKU1zQ7cNaJQFMzcxj4TvVqOuJBS/0UAUD/mW6FZwz1IE1CqOlqoFhcn4OKz99VP4Ym5Q5YigiCDzecA7gXDyFbPH05EydbF1jfczaS73jOGehdjW1G7IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mrSVs11gD1jKreBMa1B33gwlmpB+bmX770D9Dbf4EUQ=;
 b=SwibuYxb99CwlUoYZFgp8t7I7PuF6FscMTN4jU3MZtglVY4PONAYm9gAXRbImbnyipQND//5KFn4GHACu3JW/FOfhcsKrbnfSF5ObWVJyKP480JfeQVOHJ7dQ28DwkiXqEkGM910InGs+hXBI4sT4K13pBn31AQN9NvG81HSbmYVmnibzgFnKcly9B/c9Lh2SsnPbHcPijy1MUap6WO4W5GbotdbrXTTaPDLYGJr0mD7GshKnjAaP1vfccqfZBcVECn0qpevwNcsUltx0uy72KmhZZt7VH+fLJK3kqFxlVsZ/I40SrfQ6CQjn5MQCgGUPvvcdCVGArpet/NLQtAetA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mrSVs11gD1jKreBMa1B33gwlmpB+bmX770D9Dbf4EUQ=;
 b=TyMNYWPOD9Ire33R34XeR3vHs9/qg/j+6SFOdJcJKPTb9awXCehOFqnL61uNHnhdIjL5vn9VM8eZehAcbWtgQUNzg0r2Y6VsG3/lw6BLJEZjfa0lSO8Jzftd9E/MMEfn56fcMzTm9falDBJNX/UkGXR70IKVBfOOLR8+a87Z4R8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=digi.com;
Received: from BYAPR10MB3320.namprd10.prod.outlook.com (2603:10b6:a03:15b::21)
 by BYAPR10MB3365.namprd10.prod.outlook.com (2603:10b6:a03:15a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Mon, 29 Mar
 2021 00:21:58 +0000
Received: from BYAPR10MB3320.namprd10.prod.outlook.com
 ([fe80::3cd7:c100:494e:cecc]) by BYAPR10MB3320.namprd10.prod.outlook.com
 ([fe80::3cd7:c100:494e:cecc%7]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 00:21:58 +0000
From: "Ben Gampe" <bgampe@digi.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ben Gampe <bgampe@digi.com>
Subject: [meta-python][PATCH 2/3] python3-pydantic: new package
Date: Mon, 29 Mar 2021 10:21:07 +1000
Message-Id: <20210329002108.2571300-2-bgampe@digi.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210329002108.2571300-1-bgampe@digi.com>
References: <20210329002108.2571300-1-bgampe@digi.com>
X-Originating-IP: [60.241.24.90]
X-ClientProxiedBy: SYBPR01CA0177.ausprd01.prod.outlook.com
 (2603:10c6:10:52::21) To BYAPR10MB3320.namprd10.prod.outlook.com
 (2603:10b6:a03:15b::21)
Return-Path: bgampe@digi.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from beng-dev-laptop.beng.bne.opengear.com (60.241.24.90) by SYBPR01CA0177.ausprd01.prod.outlook.com (2603:10c6:10:52::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24 via Frontend Transport; Mon, 29 Mar 2021 00:21:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d96c8351-ef61-4753-a663-08d8f248aa19
X-MS-TrafficTypeDiagnostic: BYAPR10MB3365:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BYAPR10MB3365008755729970548B3DD68F7E9@BYAPR10MB3365.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aHrEL8vlr5Q4aFfA6xzqI4MQ3BZjtoVCFC/KhbrI2ot6KLTOaEx5fuSKttyqta+ZjcQ0bBBMPgaXN5r1LocCjb1+Rw0p01eRalvGENN7vebY/QPR6pLN5csMT9hofICdH1vh4RpVUJ9lhlmY5LUuXykD3mzaGVSOhd1AuXBbX96FwG5v+cF5+wvhcH7ghDU4SioZbZvr7Dh1FEFs6JD8tk6SU77I6oYXz0fBlx5S4ZHr6PsyclntrYW+atBuvOIN+VcwUSaAU37i9w4A290wY6ooBk0LvKXBQpy7bnRhlTeouL7cqWmUTuhyG1ZHRquSz5akzV+E/84dbeW6bqac2Fy1IX9fuUGkhI9UqUxQx/iNiOVMYOWeeCDo498NY8jriS5vQ4XvU5w2bS4PVEOFLlLndf/hpV+QNGXINQ7sb27fsAvOJxNBEZkqaWh2EPCV2sCqF1IbowKlokicHm7h6Lhp8cvb/1JAwPTCmhjnNj2eZelNLoQJkJhVdJUBbqZ2mB4QnXlJ4QgPbeRCgLH+g9O8gZpPk5TL6q8ugpiinTuHe6RpSC8mqlxtU/2pgCP/P7kZ+DWw2Qt7mihHZrfi1B6L8/mZQKsh/tWGnOQSDhJBHlhKwM7uU6R1f7SXpfXEYcVaeth9nxeT/n4yemRQThdXr1T2CC4BUpWZvOuG69kDoCPLK0Sx3Hz2Ei2PggtDKftQEySUXxE2L4BmVVzKhkbSCLZu/dUarsMMZYVRnSA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3320.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(39840400004)(366004)(376002)(6506007)(36756003)(8936002)(66946007)(956004)(5660300002)(66476007)(66556008)(4744005)(1076003)(6916009)(478600001)(16526019)(316002)(186003)(6666004)(4326008)(6512007)(26005)(38100700001)(8676002)(2906002)(107886003)(52116002)(6486002)(2616005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?/uFr9lBKDEDkD9GpeWote4IG5PqhUC7TnGBy7ZL/wwyeqUMox2XopKXlIsTx?=
 =?us-ascii?Q?KGOCt343iqkjOVio6MlxRvjtsVXPmKbQ3JDFA/s88kKTn6meMQU6qGRpj5T/?=
 =?us-ascii?Q?He7FK1LSDetOEaX1XYCpmTmSNnG3OAhAvEEaSFVJ8teiLlo12rRIPzN2rsUh?=
 =?us-ascii?Q?90HzaCmbCRc/+ZkIGwem3Y8mt7yQN6UAlyrDveOChABb0Lh8PYysqxU3A8yM?=
 =?us-ascii?Q?6Cp3Zc4JCLUla0ymBu10S2hRBwH7YVAA3neHRU1hBCtKc8ENaZ67sqlx/2yM?=
 =?us-ascii?Q?94Dv03+KCT94t4oBdD+IAzFenTCdxYxHGhI6j7TmgqjrIxVNOdbwa0+pKUAz?=
 =?us-ascii?Q?nkQ3tKAvq8JiQKbTZGVmfPMIp9RmEx4qaa/fZIXD3Xub6DqHxFvS6iIEqmv/?=
 =?us-ascii?Q?HOtekCWFg9vVJzp8d70PWhhqexYdBYkjC1dPrUiPS08p0fj+RFZTnBjSxXJ3?=
 =?us-ascii?Q?NQbZoVc0CG/omFvjSiX8sAJ/RcPUpX3sHGsDVnybzXuG+hjngQvhjzxJGDVn?=
 =?us-ascii?Q?lEcoVy0PaGL6y+s7gUog82r8fUsBDvjUhoQ0II8uNjoY2pt/bC45nUguIySS?=
 =?us-ascii?Q?xsCPZ+VrcNGFx8UaSv2JtKDIG5k4g44G7nt+mDnkTEVUtofTFAiO7gukAeIF?=
 =?us-ascii?Q?5MeOO+CJxsJd9x3cHMzaGbhlq7syqoWHWJ0p/0G5oibFfehIcqQ7HBnIFEf9?=
 =?us-ascii?Q?1S1rihlhD3F/xfRFhwwnHjzX20OhvQaDiTeHvXHaDIA8KZNh5xmwXDvk2+VP?=
 =?us-ascii?Q?UkBHbz94k9t+YWT9b9SVdOZ1oJmtpu4Jlk0mgnVJVl8WmR+5TNV1HhOE1ZCE?=
 =?us-ascii?Q?SSrn6NmbHosBdJw7mv1qnu2NoRIwLEmHw43J423qAIHtSLJFEBpmaDx5ALif?=
 =?us-ascii?Q?j6xF4VV0XX52FIJZmCks/vnt/KgFOEfezujVZ0azkMrD9M2JcPivet5gHkYP?=
 =?us-ascii?Q?twflMVCjO3Sbf2ZcJAjB+zhL/knZXSYeHJQM+2/ZqDmoHSCDPg0TOn5fn8py?=
 =?us-ascii?Q?dNWqi7nXKl8/eHeM7gzq0ak2XcxEBQKIl7ZmH/ftcqLhcl5v2+zNKUMEPmEm?=
 =?us-ascii?Q?YdN4NQDB2Vab5errO+QPrDPijtsrBRIRH9wLsCDv+fqX0AV7CLdL5z6iKiWe?=
 =?us-ascii?Q?T6yq4SPr5JvVz9uTCpvvY6t0Py8wBPZUw6tIhiAN5+3UHvP6qUZLSzVAuSLP?=
 =?us-ascii?Q?fSKKN2F9g4GIukwkSu95aXcuk870ylXk8U1dIc1ByY0ENzeGOCtYjbhbe7Li?=
 =?us-ascii?Q?rWVVvCE+3EvTsherfKZzFEsOXoPJ9jP/lcoIlY/yawAZ4iPFS+3NnIYSUsZc?=
 =?us-ascii?Q?JrftJj+mtLSIdISpgNicYSAy?=
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d96c8351-ef61-4753-a663-08d8f248aa19
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3320.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 00:21:58.1228
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MidnhN8r3o3YX5wuHAsO8ggGZ9bh1D0pOhjOKxW30HaAVVVh4QV0o1XX1WykR4TK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3365
X-BESS-ID: 1616977318-110983-5614-12484-1
X-BESS-VER: 2019.1_20210325.2126
X-BESS-Apparent-Source-IP: 104.47.58.172
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.231163 [from 
	cloudscan21-159.us-east-2b.ess.aws.cudaops.com]
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
---
 .../python/python3-pydantic_1.7.3.bb                | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pydantic_1.7.3.bb

diff --git a/meta-python/recipes-devtools/python/python3-pydantic_1.7.3.bb b/meta-python/recipes-devtools/python/python3-pydantic_1.7.3.bb
new file mode 100644
index 000000000..637561c8e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pydantic_1.7.3.bb
@@ -0,0 +1,13 @@
+SUMMARY = "Data validation and settings management using python 3.6 type hinting"
+HOMEPAGE = "https://github.com/samuelcolvin/pydantic"
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

