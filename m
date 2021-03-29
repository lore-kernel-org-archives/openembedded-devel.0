Received: from outbound-ip24a.ess.barracuda.com (outbound-ip24a.ess.barracuda.com [209.222.82.206])
 by mx.groups.io with SMTP id smtpd.web09.16975.1616990797804722624
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Mar 2021 21:06:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@digi.com header.s=selector1 header.b=zvA2Sniy;
 spf=pass (domain: digi.com, ip: 209.222.82.206, mailfrom: ben.gampe@digi.com)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2109.outbound.protection.outlook.com [104.47.70.109]) by mx-outbound8-202.us-east-2a.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Mon, 29 Mar 2021 04:06:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TPOW1c/8uZAYK+TDO1vZqVObarKRT1VhEUhYPUzLAAzqY3euxwnZh9lscNQds9mbRPUEXO8/qMHUvh7glsHSX2nAKO0/u1ON3ZKt6iM0fWSet4TLa7zQStzrb++ElBfDhdUJuvc6GHwvsiTBPA77DjPOSGA/0qBe106t2sE26gWDeheMcIWHrj81gG3YOg5lbiHOe9TosjfS+PMeIYeePRuufnXwlbVCyx2lLSmJg7ao2An5JlizmZUOtbBnVFzWDH1lsFd4Riyi7gfeeFo73l7bYAgHrhFe6bTfUjJ6OI8ioeXpH6Oo7vBWg/rYtAj+k7CEsIWrBkFqyqhkE9rqlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2tRbXGjjXgc6GcegUAlmnbQjf/BiS0caeCEiDh2dq3A=;
 b=AVCdOZmRN9cHii0qNSqlGW2lobsahpPc/OvqB8p28ie6XM19b2hB6Va6ooRhzxmCCIfiP+l1AFnoAwydcFnpemhYPqhRxQM2uCw2bd8bjMqSAMx2B8cKfNb59apCXyBMeZ9nFAMyFr5gKPnY7+Gus0K6EdDyS8SFzP4MUg2ncJCHOKB0+0I65cKiw7TsZM2pIRj3E5c4NUb5x4sd5ij1QC1x+yij8467gJveQRtB+Iq1OPY7BI+B4IUv+yJG7ohlRXMaSYbwe8LNyxrnRmDPk8lmqW7bGsaZfDRAobmcMBQ92NW3RrC10vl/iE1Ej/JCg2MctCQnhZABlfkjIv2tGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2tRbXGjjXgc6GcegUAlmnbQjf/BiS0caeCEiDh2dq3A=;
 b=zvA2Sniy+sS61gkGcvS7JzbTU131AKpUch0j63FlV6R+4vNsdwZyJpafYOp82urv2VJ8sK1ZZboDDOwAcdAUJmKvHB7oeGliS4LkVy+sr97WnMuJVGpIUtj7yWlAPeBK6nIfwZ7XYHk9ht9wVY0bJkMcIGTDyBDr44/gAqTR2J4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=digi.com;
Received: from BYAPR10MB3320.namprd10.prod.outlook.com (2603:10b6:a03:15b::21)
 by SJ0PR10MB4543.namprd10.prod.outlook.com (2603:10b6:a03:2d9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.33; Mon, 29 Mar
 2021 04:06:08 +0000
Received: from BYAPR10MB3320.namprd10.prod.outlook.com
 ([fe80::3cd7:c100:494e:cecc]) by BYAPR10MB3320.namprd10.prod.outlook.com
 ([fe80::3cd7:c100:494e:cecc%7]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 04:06:08 +0000
From: "Ben Gampe" <bgampe@digi.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ben Gampe <bgampe@digi.com>
Subject: [meta-python][PATCH v3 4/5] python3-wsproto: new package
Date: Mon, 29 Mar 2021 14:04:38 +1000
Message-Id: <20210329040439.2600056-4-bgampe@digi.com>
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
Received: from beng-dev-laptop.beng.bne.opengear.com (49.197.127.171) by SY6PR01CA0005.ausprd01.prod.outlook.com (2603:10c6:10:e8::10) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29 via Frontend Transport; Mon, 29 Mar 2021 04:06:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 93305623-5996-470d-88f9-08d8f267fb33
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4543:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<SJ0PR10MB45431428C39CC583B37954718F7E9@SJ0PR10MB4543.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	15RtgLoqYbEVjvHor63ZOsrfXxiVvRM/AZwhGuaSafVUEzfSJ8uGuBx9YrxBbILQ5oQc0kHxgKJIOiIFs+sMO87WndBvPNa8ZaNIw4QMuNH3VRX6A3EkoUaogtcO0leQvMDYCxKUbQaZ68GahnXgsIfboZr9gAwp3bXIbUlGzGom0aZHpRG3nWouJODvSaRM1JdBVQmxZHN/e/mkJahbYsybcBawzEPXdUvzvarxHiQfHxKVlDyDabuGlpmOB5LDXlSwSXFwsrj8mAxbEhMO3e5sJgSWAYRFRclCU3QKOtxR3D0P2Dc4TLuz+m1Ifr3KBQmS3L0h8AXX4PKGjxjE4E3O2Ws6EKEGCiwN5VgBQ6KoBj3QsGL4WNowBgFyypC9aAiVQ9+L9TOuWkXePkFNeBVP1AQyjK9Bjr36ajiwByXOkJvF6qATsh11h3DG4Rr8vmn+V6TASRAx/FxkuG8PKIj+lO7KTcWkDdTfJ4IdWz/NG3epus8DiXYsFDNYekk5iay0SEdaMqKBJBghu2I3ml8d5BVWkKDmfjFcrldEPAdux2MFvAyW05JIuWOayXU5GPIqaZQ0O3bRYn5m5y4WoerZKqhlgtkZyQHlANBwncuP96wYUFclLNLeV+CBXFkjLDw9jSr5OpwRL0WvSxXq2bUxsqyQuKM3khn6OCQnNA92o7L+XpY+dgCPuNuPxTaFwHsFemxIR/GdFip26VR4ws72gEylE6Z3KdxbTu4eHEo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3320.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(136003)(366004)(39840400004)(66476007)(16526019)(186003)(66946007)(66556008)(4326008)(38100700001)(26005)(1076003)(36756003)(2906002)(8676002)(6666004)(478600001)(5660300002)(8936002)(6916009)(6486002)(52116002)(107886003)(316002)(6506007)(2616005)(956004)(6512007)(9686003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?reJ4CEpOb6NiQfROU09SADsnRWnZsxZLl1Mxz/EiCzxoV4iKVUir8BB8yLJM?=
 =?us-ascii?Q?d2cN8d+Ul+3EWYiwbqsYc5QmOhobhFelI3oYnGo5TA32xfBjwfpC4kR91Mzy?=
 =?us-ascii?Q?2j97i6FKXtbm53x46ixGWEEvO57ct0CZXdHv1DsC1mU/jBgaGtxIdR/l8bU2?=
 =?us-ascii?Q?wFNehKLdxu2rdT+IPIiimgIYjIZczJzK+7RsbEWbu+bHBa8CW6k7zlvxyyo6?=
 =?us-ascii?Q?QUO4SYp3Fr3JY7R4gEPvXs97tgqOCaueR/NxVQP8Gs/coFsKFQWOIzepW8Ye?=
 =?us-ascii?Q?EtQ+YPOHeJxTw6cJziNaNHg06fWMz0rHkkSogjWLHVQA8Vrb3I6i6WqcXz70?=
 =?us-ascii?Q?fixeU4SIDX0dqmprrgdGQHpP2EFvQTfYfx04QsPvg55Qv98IZR5YQJDgnm0I?=
 =?us-ascii?Q?Ruurcbu5Kk5S35BZKoUDTmCo40Th32/R0RP+VWcbQHPVFpfIGYfYtF7AbWgU?=
 =?us-ascii?Q?KlV+t9rcBVw6pVwPLZq/mkhaEFuBm3IKpiXoZ93Y8jeAv3Ybm/LnlO4fuQpm?=
 =?us-ascii?Q?+4pBM30sd7GEOXd4XurrbOfvVU1YeGYYYq6Io5oBTmGJtRYPPjMWym45/yV+?=
 =?us-ascii?Q?cA5at5xfm+a3hnVoi/KktfX53wN9bpwBL4y2NiX+M95ZmaxBrqwGkSyQsMO6?=
 =?us-ascii?Q?zA8Xfz5kIBsa8rBWPyrrU5vhlDYqfBBjREL0FsqDgf6/EdNR2BaNiKbzuB4g?=
 =?us-ascii?Q?1nD9meEZWNQNV2QtBk7ovZQV0rfniroZ/0jrry9ClP+nrnJLtSlYTHcCn5zN?=
 =?us-ascii?Q?OTAc3waWPB8WFEJCESms0q1Gfu1lR7Wru2UNaEvUoOzpouA5JY+uEPz2zVhA?=
 =?us-ascii?Q?JCR4keW58frkqOIjrOL620JSsGx6vG6akGXAdOLjViL8vcPTUVlJqVC8NU+N?=
 =?us-ascii?Q?rqmRU5NhSM4MBFSJv3tWMKoQXgIsmE095YA5T2PypJImHmLW1MrvQ/3m5w3Q?=
 =?us-ascii?Q?cuLSU7FEETTF0K64zgfdLZRSOmV4igtZ88g4A17F/3BBpjCr7d7kerZ9X+Or?=
 =?us-ascii?Q?UJ867vjX90m91sOmKtPl/J42+ohd+xHwOQu123gYdEi/jHhxwKL2XRbScYc7?=
 =?us-ascii?Q?yd0t/9Y+KuGi28UBpth+gcj2qBACLCC5B+CVylDd7OSL91x+WnhWTpBwFjuz?=
 =?us-ascii?Q?jXOcDgUfyvz/492HLlwSikAo43fttkidiSsk+H9d/ZIp0aRHy1MM82BZOHuD?=
 =?us-ascii?Q?rzB5Y5JjXXUIKqt6hsPtBZvb9H0N1Xei3oSu4YkDMnKNSuqS7xAhH117GPSE?=
 =?us-ascii?Q?Rxbi0i7uiZR2myb3PIJ450pTBgJENjrVzLWC6L0xRWdhzwXwmIzt6xYx1CAK?=
 =?us-ascii?Q?GHmpeSEcJDDuAIoYl1bcv5U8?=
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93305623-5996-470d-88f9-08d8f267fb33
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3320.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 04:06:08.4276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: COJmYYs99tZWbHWVkDYlNfVRqLlKmrxmY0hEoy8Xa9T8UOb5estCgJ85h5qPKT0j
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4543
X-BESS-ID: 1616990750-102250-5772-63330-4
X-BESS-VER: 2019.1_20210325.2126
X-BESS-Apparent-Source-IP: 104.47.70.109
X-BESS-Outbound-Spam-Score: 0.50
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.231167 [from 
	cloudscan10-246.us-east-2a.ess.aws.cudaops.com]
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
index 000000000..5d87b9d69
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-wsproto_1.0.0.bb
@@ -0,0 +1,8 @@
+SUMMARY = "WebSockets state-machine based protocol implementation"
+HOMEPAGE = "https://github.com/python-hyper/wsproto/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=69fabf732409f4ac61875827b258caaf"
+
+inherit pypi setuptools3
+
+SRC_URI[sha256sum] = "868776f8456997ad0d9720f7322b746bbe9193751b5b290b7f924659377c8c38"
-- 
2.25.1

