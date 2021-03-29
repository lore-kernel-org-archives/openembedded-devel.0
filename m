Received: from outbound-ip24b.ess.barracuda.com (outbound-ip24b.ess.barracuda.com [209.222.82.221])
 by mx.groups.io with SMTP id smtpd.web08.15745.1616980952737084485
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Mar 2021 18:22:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@digi.com header.s=selector1 header.b=FLZxCf/z;
 spf=pass (domain: digi.com, ip: 209.222.82.221, mailfrom: ben.gampe@digi.com)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104]) by mx-outbound42-231.us-east-2c.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Mon, 29 Mar 2021 01:22:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K4QhgzMMrmA7/SRqJIUd+6iOpKLAa4+7nAxOtpywI4LqaoXhx7AiloEP62nVUP5x6d3dBuIHh15bdHsoCgZlnX7h2I1GldkQvIJrintTv+kCh8xV3wupnwRJfstW0gNUkQvV409gNo6XKJyNTZPuX85XfG2QF2Y0O8ooSouweA7C34DlELV1oRyAK7/ARi6Pme0YQWqbISoWOgzTAfbcF6MLGqHS/iesw8CnqliqUTe6DH0wsuUwTkKPuKYqa+QFtSF/nLqogssSTvMbHaQg5rUiSUA5zBkxzAZpbargyi79uDm/KzqzOSHn802SWhFubFa5lWnZ68vt8s3sF3z7Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+bQi3asXKqcwB2Hav3DuQsw9QmuwrQFwiz16FVpXT6c=;
 b=Emr2BfvMOuzEWNxNxOL+eElS06+KrAVItarsWZJxtLeM//PzctBlZuXvyIRdBIsrgsR0eB/hiHdSKKAZVn5CmnYeDeGXVL8z9wji3Tn3Zke6hB/iHwC9XI8g9sJWJOBTMAT6PWRzZelPuPf4qR7yG68i5gzGVUkZVa9m4ux8FTAcLZ7/ptNXYk6xuIBf6u/ZLWI6fL23kSGhmLMUvdPYTWiYc4UOw11o4t/WcGYKbakM8Q0FFGCPcxOdz2a1fpBx1IE+gMWO43ofX5LA+bIr2Pjo7DagZR33rnD8+MCcAyvH6Umjvi28UAcL3o2HWLxmBuwp4K9iliAcgDFnkvQVTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+bQi3asXKqcwB2Hav3DuQsw9QmuwrQFwiz16FVpXT6c=;
 b=FLZxCf/zl53ykDEBaPJul5zYJBn7gVkk2K49n2QrXVDi1aA72vQFxRX+9vJ9gf9HUZheRzmXT5tqUpvTFZ3RdTR4VCNRhsd3x1WrIJT3j8HPtiLAM4AYxcX28FiZxCqTl5T77WU5SSt9VSRs62pLwJWYu1csk05Rqhkk0H5IFH0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=digi.com;
Received: from BYAPR10MB3320.namprd10.prod.outlook.com (2603:10b6:a03:15b::21)
 by BYAPR10MB3703.namprd10.prod.outlook.com (2603:10b6:a03:122::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Mon, 29 Mar
 2021 01:22:30 +0000
Received: from BYAPR10MB3320.namprd10.prod.outlook.com
 ([fe80::3cd7:c100:494e:cecc]) by BYAPR10MB3320.namprd10.prod.outlook.com
 ([fe80::3cd7:c100:494e:cecc%7]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 01:22:30 +0000
From: "Ben Gampe" <bgampe@digi.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ben Gampe <bgampe@digi.com>
Subject: [meta-python][PATCH v2 4/5] python3-wsproto: new package
Date: Mon, 29 Mar 2021 11:21:42 +1000
Message-Id: <20210329012143.2580564-4-bgampe@digi.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210329012143.2580564-1-bgampe@digi.com>
References: <20210329012143.2580564-1-bgampe@digi.com>
X-Originating-IP: [60.241.24.90]
X-ClientProxiedBy: SYBPR01CA0170.ausprd01.prod.outlook.com
 (2603:10c6:10:52::14) To BYAPR10MB3320.namprd10.prod.outlook.com
 (2603:10b6:a03:15b::21)
Return-Path: bgampe@digi.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from beng-dev-laptop.beng.bne.opengear.com (60.241.24.90) by SYBPR01CA0170.ausprd01.prod.outlook.com (2603:10c6:10:52::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24 via Frontend Transport; Mon, 29 Mar 2021 01:22:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7090b768-a35b-4ce8-036c-08d8f2511f3f
X-MS-TrafficTypeDiagnostic: BYAPR10MB3703:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BYAPR10MB3703B3EA74DF76DEAF08B0198F7E9@BYAPR10MB3703.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8Me2zXYvEk2o/EnOPEGIrR1UIeXEFbGc39d1hR/yXt/0sj6SsBwyKRyNEw96plsWZpTD3Hv61AlulFL8WXEhbmpQHyuT8KGZeRtbp6nEZzutlE9yNqOw/dib2qUBEfXuqeHXzX5RZml29Zv4Jn0zsXsitvEnFBR1zoQx4WcM7I9w3zDuP54m0oVGG5Jf5I64xjB9cq5KlWZE+7FwHmFtt0FgbMxj8qEZC83zzsRcIOr59kCry5Uj5W0UcuZmQ40iaVxetF/WDwlQygKOs0pcsUYpVrNzBXggAUSLHtlTOHOREmbpFXGW1+1E+O069kjrx8U+i2dTQ2CONEL1hKt2b+CZqu24Qv3GqhBSWeHDb87Jj/uGfizduygvHLNS7kj7V+8rUDYeQ4c5Qt/QTdBjyb8548j35+WjLUaYNvxr/woV8ox1zjCyBBKsxjGv877YWX8XcgxC9AO0cbGYhZw6xAxgNj+cqk8VET0ZugreXMbNcF4Lo4cAcuVgMxvkHFYRacE/dTxK4oAVTnE9GvjgLENy2Jzrm1MqGE9dmWckbjTbDxXQo+qie8m1j7FYant75AC9CLnz5flKISOBvjKDO3Rz95YN7dzMNi7gIq6TPcnfEZob8E4TM/YN0mtOKwBSDkbAB8QJFqWl9/FHxLXfCGlVjFVgLZEhfKvImcaIocxuZ83AJvF3fUgc8QtOSrtOx1hUJR+hZIcy5Jj0H1di+krbHwNQPS6xlyIBw17lO7s=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3320.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(396003)(39840400004)(136003)(6506007)(1076003)(8936002)(956004)(2616005)(38100700001)(5660300002)(6666004)(66556008)(26005)(6512007)(66946007)(316002)(186003)(36756003)(66476007)(2906002)(16526019)(107886003)(52116002)(6916009)(6486002)(8676002)(478600001)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?v/rx3QGJRJ2o4+HIyMK+sfPutYfbaEPDrvv838Z4N7fRRD5v7Ctm+xEWxoTH?=
 =?us-ascii?Q?iUcnwMgjyfEPfLkkKcdfddGhK88CQNNJc9tz7vxwCWAk3BuURZPIsRhhnq8e?=
 =?us-ascii?Q?HWciZEgyHmpfVl2a/t0wIQ1nMhticFa1zwlGdsgjUs8ZNFWvQ7vg/8DVsrGD?=
 =?us-ascii?Q?je/cKcVIEyu0r+j/vctq+k5yFZWBp/+rg1wGi1bdp06nNR0mYp/d+/K87DY+?=
 =?us-ascii?Q?aD8o83XEKry7i7bfPC5GfvepsFHUv1Px+kYDw+Y6IN78TxvPQUf8fo3KZcPm?=
 =?us-ascii?Q?MKHWSfDHjo/TNEERwqVgBe9Ik73WEKqy/xt42q0PXTQjpHRLcwunP51hUqcY?=
 =?us-ascii?Q?NHG656gH6oxiCRi9AiIqpIZrFF8QhXhHMr8R3H86xJEFC67qlmB2mDR5lFV/?=
 =?us-ascii?Q?uz12pcEAaBxPI+Z3qlW7Ur7n55BfrxoK5FSt9tHJ188rXzDLxMHiNh8XxUPz?=
 =?us-ascii?Q?7JQoOx9U4WhSJo3pv87uK/guWKjxYnUCVQ944zw7a31rDGn5/itmgRwmujA3?=
 =?us-ascii?Q?M9kq5XHO+ggcTfxfoIGJ1Wc57kAwvmIkxQ5tCB04W26w0zmTg6jjhPnjOL7c?=
 =?us-ascii?Q?TGE7MQNKSnSKxgY3sz8gUlR5zqI+4bZxE86SFC8tAwDy9o+kHnYLZWkZtsjr?=
 =?us-ascii?Q?oObufmAkGEZQShk+/HH/IFM3lxCmIhsAbFZjbZ57CZxJ8ecY7sN9Szq6VxAm?=
 =?us-ascii?Q?WhVXFK54RCO1p2IWHHV00rVXa6hBXVQjPkWU0hRt6PR89r9QzRITjYBgV5ak?=
 =?us-ascii?Q?YoWKdZ2jxsMwTc5+6eyfFlscxlqh2MUF0UA/EUzF765ffhO3m8KF3tUIEHr+?=
 =?us-ascii?Q?3pRV9QCPzHz5B+BtDkp8fNgsQ6VHFOUXs28I+I59dHPMvJSaR93V+s9dFCAm?=
 =?us-ascii?Q?WShYU6FASxBp2qrAnyYP248vlFIIRDx3ZWZC9sKLo3pep9dO7MaW1D58N42h?=
 =?us-ascii?Q?fJfmg5sKEe7l3c2+h5bgjnu9ECtQlOtwxNe78jXRkR3Fpy+jcPk4rUHW7SrP?=
 =?us-ascii?Q?bpDYjgE1DNSw1m363xAC1Uc3j+otUq5cLnZUndSIqSWexM2bsAJWfG/ClbTH?=
 =?us-ascii?Q?ibVd5vXSJNfN+/5OlSWEyKbVuiGqrk1FV07TLq0P5WxO3SY5T7QUeL4eNG/v?=
 =?us-ascii?Q?tAwrCFm+p0U9ZoZvxsq9yGp/iefP4wkXkd7RsLDYSRiP5kzWXihq3B7RC6Ux?=
 =?us-ascii?Q?j6AWYFvD+G8ixplYtsDuyZxNN27l4hhjXUF80n1G7eoOAvJXifgu4SPOUFpv?=
 =?us-ascii?Q?86/dwB4Ic51fe9+jlb7X8kwHoNMYkjVgfim3cFFb3+hjqUGmnsJTTntVRpGp?=
 =?us-ascii?Q?eSPQjyTEyUjy9KgxjcUfbL7F?=
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7090b768-a35b-4ce8-036c-08d8f2511f3f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3320.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 01:22:30.4600
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PQz0mPxenV25tyyXraRY/iVqVIV7ACJjfB6lRcqkaf5gVvDFuJl8x3temo567FC0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3703
X-BESS-ID: 1616980948-110983-5606-23484-2
X-BESS-VER: 2019.1_20210325.2126
X-BESS-Apparent-Source-IP: 104.47.55.104
X-BESS-Outbound-Spam-Score: 0.50
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.231164 [from 
	cloudscan9-168.us-east-2a.ess.aws.cudaops.com]
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

Add recipe for python3-wsproto: a webSockets state-machine based
protocol implementation

Signed-off-by: Ben Gampe <bgampe@digi.com>
---
 .../packagegroups/packagegroup-meta-python.bb             | 1 +
 .../recipes-devtools/python/python3-wsproto_1.0.0.bb      | 8 ++++++++
 2 files changed, 9 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-wsproto_1.0.0.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 5440bf571..bf270df46 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -442,6 +442,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
     python3-wheel \
     python3-whoosh \
     python3-wrapt \
+    python3-wsproto \
     python3-wtforms \
     python3-xlrd \
     python3-xlsxwriter \
diff --git a/meta-python/recipes-devtools/python/python3-wsproto_1.0.0.bb b/meta-python/recipes-devtools/python/python3-wsproto_1.0.0.bb
new file mode 100644
index 000000000..e29fed416
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-wsproto_1.0.0.bb
@@ -0,0 +1,8 @@
+SUMMARY = "WebSockets state-machine based protocol implementation"
+HOMEPAGE = "https://github.com/python-hyper/wsproto/";
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=69fabf732409f4ac61875827b258caaf"
+
+inherit pypi setuptools3
+
+SRC_URI[sha256sum] = "868776f8456997ad0d9720f7322b746bbe9193751b5b290b7f924659377c8c38"
-- 
2.25.1

