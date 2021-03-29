Received: from outbound-ip24b.ess.barracuda.com (outbound-ip24b.ess.barracuda.com [209.222.82.221])
 by mx.groups.io with SMTP id smtpd.web11.15121.1616977316421159438
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Mar 2021 17:21:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@digi.com header.s=selector1 header.b=BmObU8Q1;
 spf=pass (domain: digi.com, ip: 209.222.82.221, mailfrom: ben.gampe@digi.com)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2170.outbound.protection.outlook.com [104.47.58.170]) by mx-outbound42-231.us-east-2c.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Mon, 29 Mar 2021 00:21:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=obR0OXkcy8BoC8IllR5L/IIT1pqdCqc1aK9YsQI0MkdQGuhVLW5L7RuF7fcFcDCyeYZkmkpgCVCggSchf4cdz8qnJAHXpZPe3464iUQ6il7UhP8XkCR8UnCwjVFEmVXrAnlbAKfPdRnXJcJjyIR3AIyykKWwbwRnCtYM7ZfLkNxQYjLAFkLwQKw6gyKGZzhIYRAbnacBuce3UBQXwAawwuhaQoRpdX9EO3/Ku6NoYYBjUx0YtSSVAQ6tsHazZkzcvWOgSMgD/d7ro9krLcyZkWgHep+7Cl9CfLO9dno+d852TnYEy7dBXNHdgazByN9tMr/uOKbH0Bx6JE9BJqLVtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xUc+SIzsz74kF1XVnpXrlUZ6xe8xX2sL4C/De2lK768=;
 b=oepisT5qc+INIsJbTEfMQhxd4OsIlzkhHUSgOJnBs2mWsRMbK2uai5DXjKggWkEZ/yE1MsNq5gc4HnOq6ihhYhRdXhKbAyEsxnIbSDMdj0YvQAW+19SK19w+QYqV3HPARSj4eIy7YonSq5XThL+/3O7zJSodNN/0Q3sQNGDAFa1LEEJnI3HC7o0f1Vo36op+W7JcmzT+8tMhEz2hRCLD8bfY2NZbREeUAw46RPjH1eWCJre8MXX37vANwnKkvShh+IRniKlISROjE3dW3bg+dgtl+VQvhFB4BsOLI0QTd1kbZf6V6iXzrpAFupdk8VcSBN1Oz6+fwX3muOUzseHoVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xUc+SIzsz74kF1XVnpXrlUZ6xe8xX2sL4C/De2lK768=;
 b=BmObU8Q1YUXcJ4iW/++Xj6dbkaa1uHGE8th6sARXr/sd4jk+D3DNbWdqFV8GeVbtIGvemWbDazOIEvakNBqSZgCtaBGPTZR8wEW6Bf0JyXDcYhS6njjF52wKyUMgRQ0+jKbLhFTzDiTYnIsfjw03p5y5BXw1TcnTHOFXz7uE2N8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=digi.com;
Received: from BYAPR10MB3320.namprd10.prod.outlook.com (2603:10b6:a03:15b::21)
 by BYAPR10MB3365.namprd10.prod.outlook.com (2603:10b6:a03:15a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Mon, 29 Mar
 2021 00:21:53 +0000
Received: from BYAPR10MB3320.namprd10.prod.outlook.com
 ([fe80::3cd7:c100:494e:cecc]) by BYAPR10MB3320.namprd10.prod.outlook.com
 ([fe80::3cd7:c100:494e:cecc%7]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 00:21:52 +0000
From: "Ben Gampe" <bgampe@digi.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ben Gampe <bgampe@digi.com>
Subject: [meta-python][PATCH 1/3] python3-starlette: new package
Date: Mon, 29 Mar 2021 10:21:06 +1000
Message-Id: <20210329002108.2571300-1-bgampe@digi.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [60.241.24.90]
X-ClientProxiedBy: SYBPR01CA0177.ausprd01.prod.outlook.com
 (2603:10c6:10:52::21) To BYAPR10MB3320.namprd10.prod.outlook.com
 (2603:10b6:a03:15b::21)
Return-Path: bgampe@digi.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from beng-dev-laptop.beng.bne.opengear.com (60.241.24.90) by SYBPR01CA0177.ausprd01.prod.outlook.com (2603:10c6:10:52::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24 via Frontend Transport; Mon, 29 Mar 2021 00:21:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 08b73373-f5e9-4a26-7313-08d8f248a6eb
X-MS-TrafficTypeDiagnostic: BYAPR10MB3365:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BYAPR10MB336514EE9A8B8D11AB84C9D28F7E9@BYAPR10MB3365.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1186;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SMifY4zWuk0tbeW35BBr1fZHw49BDyvxpm3jQOwgN4sg8/3/FdZHPKYrW08Wh0Xfck5OKKs8k2bKdWwRrMABOp4oYG2k3By31x79wcf8mXkBkv7an46emxHmR7xYGsRZCWYXMevISdFz7eh6tKiWcjt4i0MZc/OqcTkNpVsoyPaHbGaou05gcURzGy2R1alHt9UtiiLYZ7cSbjSHK58t/r2S8juNZRt7J27PO9GTfu7iD7MpVA73Ua1K8i5X9hZUSN7VYLwTYbpovhlvNln3sWqFJBiRAlMXHUqN5Hvnk0qzLSzLOx7pO3Z2uCFtX5BrdLSlvgAHqp5nI+tOPm8SrtGMl446JOCJiSRWauLkro6F6VC0c22p2/yeryj28zUzZYfjENPOQH6OvCTOcPSPmx5D5xraIzNrHhdlVovWVOZwbWCEpjhyNnkbOpVAQnuqETvYpygkttD7EK+ooU7WpsuSrmNqaTVWgKP2m7Qv8Byk06XR4t/YbOxxmI5JUlQ3XWUxinTphHFlmqePZlhsv0WO1RdifNHhtsyOIuzUbqIesFTUBrLwPmb+NgD8MLsAU57hTwpxbnFIvi5dGO3ZCch4DkIndqt0x0hxtfciedGwjGq8qDMci8jX4umib+LLBp6CSsppPFu9x2FO5Uc1DjxrA1qh3WoyfyLqit/XBYrZAo6If7qfGd0C42pBRrP9s6ATq5dIMGojLBEdYdSaJUXeu2+6bDAcoZNyh9gAfsI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3320.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(39840400004)(366004)(376002)(6506007)(36756003)(8936002)(66946007)(956004)(5660300002)(66476007)(66556008)(4744005)(1076003)(6916009)(478600001)(16526019)(316002)(186003)(6666004)(4326008)(6512007)(26005)(38100700001)(8676002)(2906002)(107886003)(52116002)(6486002)(2616005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?YANTTYMqHUzTLpnxBClsyCNrjV+W23m2lvYcvPbqQ78BVL/4HIBvA4xw/tRl?=
 =?us-ascii?Q?RA5lqMrtMZA7ua+npOuhuNMCRE2nfF+cQ6Rx5alsbhnn8F5ZnaOfg1O2SeXQ?=
 =?us-ascii?Q?bR81hQsAamOj8ItvhG5gDBnnYdgRCC9DOElG9p1lzWuGCn3FJahBpfp2Ag90?=
 =?us-ascii?Q?MMYyNQWdiQMviH69cCF5OesqOacZgEvWGw3cEFa15tBY/Ani4p+9KolK5Y4k?=
 =?us-ascii?Q?SJUClQ0KSBYXiC9VJ5GTaOQsQnj5iIFY7YjcVoO0CtEARgSRi8+n19LgELm/?=
 =?us-ascii?Q?4b//utkHr12wQobX3gtd00cAdTkzdXrjdszc1rw+rr8afTQw2TTxehM2cqXd?=
 =?us-ascii?Q?vtJh/d2YrRG5S/iIyzJEe8k9xBdXkrI05TX8KIOPPw7Ocmly6BiWd+LagtA3?=
 =?us-ascii?Q?ZcmxysTO8pYzlq+6jfs9/eMzKw+14KICy6tL141G3ce1ReSgyei6ZiWJfoZw?=
 =?us-ascii?Q?BO0MMHEvhAA1P8TLDDIU4pPvf0/DSPW8wJXfZpohNGB5PkYuHkphbZQGJCsA?=
 =?us-ascii?Q?ll/O1Ixmp1A5aL6ZTPOz0iNazgvbMtG4cwty8li9UayOmclzAfZKhpbX64bA?=
 =?us-ascii?Q?a4LJiTygj3DQGvK+isqFlXXPYHSbusxFTSXXmWulYl0d2LtOqOaeWxuMvV4E?=
 =?us-ascii?Q?1noQi0vscwb2Vm7hmrlt6JdwU4c90cVsL3FxIcE8VkqR9l1b+5yQTUbDa/GT?=
 =?us-ascii?Q?LC2c2MMoSRKB0pHl8kIb/q2LH5EJZupY67WM/SgR/3WitrfEVdStv2ZhhDGC?=
 =?us-ascii?Q?wD7i7363jqh8dsfPy/9wQuiOkmYVkJL7d/omYYN7QjTCSkMdvsL4zy+Z5SM1?=
 =?us-ascii?Q?AtmCN8nvc1MGneZ+JxawiBHVPhKEncIXUc8+12PprL5y3Nt4ymWkk1ochjjx?=
 =?us-ascii?Q?BvGu4O9RKySHirShj6NoJPfiU7FT80B+f4vtkNIJExTzdERSqabkPQu751VD?=
 =?us-ascii?Q?a4fcR2KvL6XzhwjhqQOgTqGsRmcHtHuUEgZAXZYLb3zCqTf4cEj/Ue45lpoi?=
 =?us-ascii?Q?qlbk1fMcWzaEmcVDVDCzpUAK4goNs+lsOpklyqnoIX/A2KQCsA3ilRulVGPz?=
 =?us-ascii?Q?cKyvK38BN4hWpjDAgDehfiN79/voBCE4DeMt8e0hEoia69wN9JDP/uqG2SDc?=
 =?us-ascii?Q?tEecH9YWvAAZmOUrxqvGcbYMQAIUzaVGaUI0fhsmLhvmbPhlYLwO5U0jc3aC?=
 =?us-ascii?Q?sZ07muJce4gs/tq5CsqZsgF2N+LjmJxMGUsROjwk5G3GdBqJZ8j12pUc9zwA?=
 =?us-ascii?Q?1DV8W/kTRjkQ2ZbM4h6RCVpWpJs5wlr9XEMJgvgoZa3LxYchj/QK36iwrrkH?=
 =?us-ascii?Q?odPg7f35vK5qW2wQb2yEy4sk?=
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08b73373-f5e9-4a26-7313-08d8f248a6eb
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3320.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 00:21:52.8228
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RPs1RslU89bgcGKKPKwrABGv1rbj7roPGkKFdB2rpN047yBCPBUA82Sk5rRig9/7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3365
X-BESS-ID: 1616977314-110983-5607-12470-1
X-BESS-VER: 2019.1_20210325.2126
X-BESS-Apparent-Source-IP: 104.47.58.170
X-BESS-Outbound-Spam-Score: 0.50
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.231163 [from 
	cloudscan21-159.us-east-2b.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 MSGID_FROM_MTA_HEADER  META: Message-Id was added by a relay 
	0.50 BSF_RULE7568M          META: Custom Rule 7568M 
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.50 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=MSGID_FROM_MTA_HEADER, BSF_RULE7568M, BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add recipe for python3-starlette: the little ASGI library that
shines
---
 .../recipes-devtools/python/python3-starlette_0.13.6.bb   | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-starlette_0.13.6.bb

diff --git a/meta-python/recipes-devtools/python/python3-starlette_0.13.6.bb b/meta-python/recipes-devtools/python/python3-starlette_0.13.6.bb
new file mode 100644
index 000000000..2e4b01b74
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-starlette_0.13.6.bb
@@ -0,0 +1,8 @@
+SUMMARY = "The little ASGI library that shines"
+HOMEPAGE = "https://www.starlette.io/"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=11e8c8dbfd5fa373c703de492140ff7a"
+
+inherit pypi setuptools3
+
+SRC_URI[sha256sum] = "ebe8ee08d9be96a3c9f31b2cb2a24dbdf845247b745664bd8a3f9bd0c977fdbc"
-- 
2.25.1

