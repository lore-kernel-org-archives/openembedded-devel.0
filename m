Received: from outbound-ip24b.ess.barracuda.com (outbound-ip24b.ess.barracuda.com [209.222.82.221])
 by mx.groups.io with SMTP id smtpd.web08.15155.1616977326911770434
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Mar 2021 17:22:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@digi.com header.s=selector1 header.b=FB707Nri;
 spf=pass (domain: digi.com, ip: 209.222.82.221, mailfrom: ben.gampe@digi.com)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2177.outbound.protection.outlook.com [104.47.58.177]) by mx-outbound42-231.us-east-2c.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Mon, 29 Mar 2021 00:22:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gThSa9S6jc58WCeFIHVpxrSNN/dixuvlx94YBeCW87NRPOlpihFK3J0Hm0FstC/mOT4h0exVjHOzjZUYlSpEswGjSX189ioVgNeZVrlyL2STNd+1/wpqXjnYSDenJ9EuTpbRK5m7luzV+iIwrP/rZNOebPgFKkMIgNmVOJW6+ApYFJf14tJOAX/XL1qZKwbWOXdzC4Zpm51D2scVtAl9gEgQWFyJ/YlPX+THD4XLH559R2YjRI3AFsk6qMFLLvvkYEjf/WgLQFt3tDw/vfi5bYUeZt6zzi/OI/fuEFquWO9fSFr3rRw1irjAWe2ci5fjd1dMXAOLKRWObhWt8wPl5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UEqMnfPrgYgH91FKga7olJAjp4hSZJxhnDz2hzHfPBo=;
 b=ORBbXqsleaEGgtPxZyTJs4UyUJtBDaE+64M+6ZP4i+91kLZnYBsbRQfTrqLCJpduRqZQ17ibvZdjOhUg5HAhBqxN6mxmGnQAKjawIOhKEXKvfo8efdiUwqnVTtrQl0clrxXfVlQvgaZbjglT1yAHEXXZtOx2+G3TwdingxK6u5ttoTIqNDbz/YIhan/OLeIes4h4WMwXqa5mje6bC4Qu/7jFibzH90LPIQkjzDB/zG2JLl9xUCFKQHDGFGtEPia2kOCOa1m1YBV5txrEXjqGB7fgV2rc3XwRlEBJ1m4CcP5u4e2k2K/xiYjD31xsv7hm9zk+IrQ0us1qhILRZ97egw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UEqMnfPrgYgH91FKga7olJAjp4hSZJxhnDz2hzHfPBo=;
 b=FB707Nriio2j0JDrRCQ9Qok8LxE7i158e4QwDrNG/t3qA5K8AM8wp+qaAGGIO2q3PFdPzINPXs/KBJJLj/p6Fnz7D1ir357LFHbl7i5ZzHBGAoi5u7uE2VUUE2j9jULKzMTCDHDZg76w0uA8jn2tZogJWHEGEXHbvD54yaucMFI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=digi.com;
Received: from BYAPR10MB3320.namprd10.prod.outlook.com (2603:10b6:a03:15b::21)
 by BYAPR10MB3365.namprd10.prod.outlook.com (2603:10b6:a03:15a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Mon, 29 Mar
 2021 00:22:04 +0000
Received: from BYAPR10MB3320.namprd10.prod.outlook.com
 ([fe80::3cd7:c100:494e:cecc]) by BYAPR10MB3320.namprd10.prod.outlook.com
 ([fe80::3cd7:c100:494e:cecc%7]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 00:22:04 +0000
From: "Ben Gampe" <bgampe@digi.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ben Gampe <bgampe@digi.com>
Subject: [meta-python][PATCH 3/3] python3-fastapi: new package
Date: Mon, 29 Mar 2021 10:21:08 +1000
Message-Id: <20210329002108.2571300-3-bgampe@digi.com>
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
Received: from beng-dev-laptop.beng.bne.opengear.com (60.241.24.90) by SYBPR01CA0177.ausprd01.prod.outlook.com (2603:10c6:10:52::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24 via Frontend Transport; Mon, 29 Mar 2021 00:22:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f8c8d741-cb7d-46e8-0400-08d8f248ad95
X-MS-TrafficTypeDiagnostic: BYAPR10MB3365:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BYAPR10MB336510A2B7615164FAE781CF8F7E9@BYAPR10MB3365.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Z4aThU6yxTuq8A2CpxDupogQCudpyJ6z1+rzO42km26uWfX3nAQFxXtKGafLN+axS51qfwKu+8dj87berMeTnAhER7GLUfNy1uSnBj3gVluqYwtHVOHcSAjIBWBnNteHx1asBTCLDkE6Y9u221AXpWU78GJyo1yLIqV8kDMzVZZkZUvY/u1ViIBs+pqUVKefwD+fIaVoFC78dY3F6bbRX2lg1B7qLO0ZeuQaI1xDLOgCIAxjeWSCKam5K+hMVNMixxu6gjkB+/mDj/IewfMT8/HFzKR1MPCIflTWvjcoTAS0Ud0Ihu/XfxiAfrx3HnK2PDYauREV+v2kQOPQXUng3W2hqohOhVYh4guZ3R/yacEHutit1soI/OrlS6fPoPvcnQTKzdOYJoZeAWcezjHT9V4BAnZwULGyQgZMC++i88ytyJZCCAbQimTeGGxpoINtPddC+sK/FZfDnUXzXcb6Eo0f1gnWkrUqqVMLVVdCLQLeiMh1XbqU/PH/pDwgugSaVaq1jbRqhNwTbUvTSLLTLLqu1XrWFzC7W56t9jwauboV0fA5/8O4JN4H5VtaaD3ZF/nEAeArxuFEWCbJQC9NGOAGrjUqOGv+phGv1RP32c1jPCE4V+0aYDa5cpY7YD4tks3A+aW0SiqAFMYfA4JV9WC2iTP6TfLx95Jqcwt2yhFmEiosf0Y79ANCknAEkTdXzN+ChS8byzzsncpPMtloXG5fEXa+u/aiARw26+KrJ9U=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3320.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(39840400004)(366004)(376002)(6506007)(36756003)(8936002)(66946007)(956004)(5660300002)(66476007)(66556008)(4744005)(1076003)(6916009)(478600001)(16526019)(316002)(186003)(4326008)(6512007)(26005)(38100700001)(8676002)(2906002)(107886003)(52116002)(6486002)(2616005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?ZgNRU1U4ZA1e/DxD/DoxfU5qDHhesiG8SVX7iIGq/gu3HQKaG+TYnV/ZXfwT?=
 =?us-ascii?Q?4jwAVjfs1RONE5vVI3DSNW4SEdaB1yDbVJLhdPn6Eo2mczCv/eyVtTv+YdiD?=
 =?us-ascii?Q?oUL+43jlyaD9LFwIB+IAcq8n32gyrCrCF4cleSq7hvDI6zOJ0wOiIZMCHKNb?=
 =?us-ascii?Q?166JATc8U/Iqg5AtTxa0oDdu8UUd/TMs8pUGZoLeVSpdnhmn6aKXBIifv4ab?=
 =?us-ascii?Q?RCJ6nh/2Wkkw0LWS/IBBZOFsaeTbf7fItbF4z+JtR+mhYQrfGK2rXi0V2FZC?=
 =?us-ascii?Q?Zg7XjzLQ/ueuzH8xd5RM/RchkA+pSqDA8cL5wvxcbuOYhhGhdZK9uD+MJDiM?=
 =?us-ascii?Q?VGO+88hZoubNvuh5BcxdZKnHNPtZoHyXQn9TneMUCkdIFyCj6ubJR54XASBZ?=
 =?us-ascii?Q?8sXuBp8X09FotoNOCQlT4G9kVN4CFR3H/yV0udWrlOtOSTFCQlypqUgvrYW4?=
 =?us-ascii?Q?UaS2nYEEDQ80tMa31jIH+5xqh9ENTDBcRRP4/NrhocJxqdDmYHF8p0pYPwpn?=
 =?us-ascii?Q?qpaLguy4BkfvpMAtcGsDBWDNhmryMawbHkydHHgpjgccHgmoXaGjZ3RTNSh5?=
 =?us-ascii?Q?F9ZyudrZkoxunN/qrL1bRImua1s3kkzz9l6vPneh1JyTAq7zlMfVFq1L6nMm?=
 =?us-ascii?Q?eXilwgZqd2kUxfa19q2D9+jjrJ380qSWSEalf1d4bmaMOIJ//Bf8qbdWvuUQ?=
 =?us-ascii?Q?YuQul35Dnyp2bENr8ugVfBBrayZFe/s7LG+iGyMItCR7x5QDjJ4TAtGTSBIo?=
 =?us-ascii?Q?wL8jlQhfWwh/hHccIuHcm/ZnqvWZ1tw2TJCc3myM15w/wN6u6F41SIrJK2v3?=
 =?us-ascii?Q?n5H+nmGSj8blBHCM8QrvYybqltdj36Rx1ch2duJYP8gtkmbi4DTCWxoXFRiQ?=
 =?us-ascii?Q?d4sYfL9mfbSOZiX1flTE4HXFGJcNCe38YankSuITzzb46wKXKDMHz7BAXfFN?=
 =?us-ascii?Q?LHia9lDtUgIgvUF+qGp7hAZ98ACRndvRp6R9rfovCMkFutJlAxdWBPABMimJ?=
 =?us-ascii?Q?7eF0E+j8o/6+sIfprfel3CO770PjhAp9fo27neXbXL3ycyojnH0stX9fY0tV?=
 =?us-ascii?Q?dkOsW+pTfcz6EoMo9MnJYVAN55SavCHwvfrjrdrgocO9/rjDVnkS6XINTDUQ?=
 =?us-ascii?Q?sfPvGf8udqQn4TZ2q/ncfh2yHBRy3rBDLCDVMptdHm/D7Jaj4CYo+IKInSj1?=
 =?us-ascii?Q?y8EzWkebrao56RUTwbQ47B2PbyuoCvHF6E2cXzCs7wONJrwh8+Tx+qleHO3z?=
 =?us-ascii?Q?+2odr+m020df2a0lkLJt3EzKLm3dnoZgqwM9M5FUZc1x1cKdYqMvhESFJndE?=
 =?us-ascii?Q?P+crOgIwE9goEtxh8GFmD11k?=
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8c8d741-cb7d-46e8-0400-08d8f248ad95
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3320.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 00:22:03.9864
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rgC3Fk69WVUsaYLkJQ5h3/1INJ5JJmOtPPkxTBf05n2pUvMThmm3lgoC6XJ5Grhb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3365
X-BESS-ID: 1616977324-110983-5605-12500-1
X-BESS-VER: 2019.1_20210325.2126
X-BESS-Apparent-Source-IP: 104.47.58.177
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.231163 [from 
	cloudscan18-80.us-east-2b.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 MSGID_FROM_MTA_HEADER  META: Message-Id was added by a relay 
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=MSGID_FROM_MTA_HEADER, BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add recipe for python3-fastapi: high performance, easy to learn,
fast to code, ready for production
---
 .../python/python3-fastapi_0.63.0.bb                | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-fastapi_0.63.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-fastapi_0.63.0.bb b/meta-python/recipes-devtools/python/python3-fastapi_0.63.0.bb
new file mode 100644
index 000000000..9644b2741
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-fastapi_0.63.0.bb
@@ -0,0 +1,13 @@
+SUMMARY = "FastAPI framework, high performance, easy to learn, fast to code, ready for production"
+HOMEPAGE = "https://fastapi.tiangolo.com/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=95792ff3fe8e11aa49ceb247e66e4810"
+
+RDEPENDS_${PN} += "\
+    python3-pydantic \
+    python3-starlette \
+"
+
+inherit pypi setuptools3
+
+SRC_URI[sha256sum] = "63c4592f5ef3edf30afa9a44fa7c6b7ccb20e0d3f68cd9eba07b44d552058dcb"
-- 
2.25.1

