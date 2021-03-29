Received: from outbound-ip23a.ess.barracuda.com (outbound-ip23a.ess.barracuda.com [209.222.82.205])
 by mx.groups.io with SMTP id smtpd.web11.15826.1616981626475141572
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Mar 2021 18:33:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@digi.com header.s=selector1 header.b=w+LYcxSK;
 spf=pass (domain: digi.com, ip: 209.222.82.205, mailfrom: ben.gampe@digi.com)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2109.outbound.protection.outlook.com [104.47.55.109]) by mx-outbound11-146.us-east-2a.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Mon, 29 Mar 2021 01:33:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mm6g4LMshWg8mZT8+ATeysTHzbDMuDV7uLbiO9Xo4O14NXlnmPx6sVfIB/A3G1xCnrCM3jL1yf8r7z4Cr8hhxbRjj9OmasTnQWOE18KpjmpzrllcxpxHs6TvK9qAr0zVxX9AffG8+WBxkMq7bACQ3R/ZnAx2mnUiBYJZKUY+wwen30UbwmNnaejS/YofdcW/OaL4tFQMmmuKCDz9sVXmONTRbdyoRNbR9kzibz3x6+sDAdQUdsjN6ApjCIbXTz++7nUiAF6iqMEm8k8qc6xRJ8r6lDQza1YrewJd+TtUnoqx00b8UGDz+qwBzcrmlCbuBM6sVmz9VWoCZn4i2PTFgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J640HUJHUnnl9i+PUtER4uufr8iXRP2fQgb1Kk/8kP4=;
 b=PuzIKehv0Aizae36dyH1zHxhE+LYcovNEtV7F7oM0y4XlRi90l9wlxROhlgrqe8FsSEZw4RQxSFepd56fFjchbVdSYH7LT/LizEsg5XHzAVK/to/wLhId3kbLNBCK8eHn3B6dArQl8e0iGacPrA2BHS+IurummlUbNAAaudKw0CdXG3K4YieYv0i66Quq2LEa1ktXVacTZSGbFsuWrQ4Q3dRv7+/nAVDJuH/7nRsIBE67O6R1IRrYksCeDgxPZCgy4ZpJTAADvZPLumY5uZPWUyLq5LSyg1XftaQ15eNvEqRLWhLMd6lSNcGu3owsC5yZFswFetoC07fHSKlXySBiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J640HUJHUnnl9i+PUtER4uufr8iXRP2fQgb1Kk/8kP4=;
 b=w+LYcxSKQeAaeBKrDgUWbP99SMyMdIOdDcXksR2JoTx1mlO9xcgaiFkHYXKZRWCvh9e3eZ+kIUq28MJbS++P+9HlXkLhEYkljpto4OaodVyEH0emCGR0rFhGXmQhFdyE/E5hXm8oY0jzhbdlXTKQGirx3sN/yLuPnaIgKb+x6Y0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=digi.com;
Received: from BYAPR10MB3320.namprd10.prod.outlook.com (2603:10b6:a03:15b::21)
 by BY5PR10MB4019.namprd10.prod.outlook.com (2603:10b6:a03:1fb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Mon, 29 Mar
 2021 01:33:42 +0000
Received: from BYAPR10MB3320.namprd10.prod.outlook.com
 ([fe80::3cd7:c100:494e:cecc]) by BYAPR10MB3320.namprd10.prod.outlook.com
 ([fe80::3cd7:c100:494e:cecc%7]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 01:33:42 +0000
From: "Ben Gampe" <bgampe@digi.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ben Gampe <bgampe@digi.com>
Subject: [meta-python][PATCH v2 1/3] python3-starlette: new package
Date: Mon, 29 Mar 2021 11:33:08 +1000
Message-Id: <20210329013310.2582815-1-bgampe@digi.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [60.241.24.90]
X-ClientProxiedBy: SY4P282CA0012.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:a0::22) To BYAPR10MB3320.namprd10.prod.outlook.com
 (2603:10b6:a03:15b::21)
Return-Path: bgampe@digi.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from beng-dev-laptop.beng.bne.opengear.com (60.241.24.90) by SY4P282CA0012.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:a0::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25 via Frontend Transport; Mon, 29 Mar 2021 01:33:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bdac4c0c-9a7d-487c-4f68-08d8f252afb7
X-MS-TrafficTypeDiagnostic: BY5PR10MB4019:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BY5PR10MB40198DAB61323B7405AF33E68F7E9@BY5PR10MB4019.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Js6YzDd7cU/Emz7jr3KNmyrtJaGmC/99lDtIf2dOqHjjSQIIK45PkAyS9fOSxAn2NAwJz5aEKtPQNKtnBT3ivCl66Wx9IiFkJrf2Hu8uTHMOyvcE0FqwXHSwUrHrDCXBdTGGuE3NXlzUJ4+m30eEu8H8tvmxRJa6LFcaYyQsWI9+wO0oPm+ENRm/682HqgRITTU2mGObg7JUuJ+qRvRbXfXLSFhP7iI+MP8AVCYIBhnlMVtpzrolZa+RqG0VwoaQ0lYufaY0X/SWD0Uy/dxwIDav5PHaD/lL4W341sl36flIVXXLJhia9jUJ9PbNvsoDPTMZ7F/hHf9SfxuoHWcubTOxrSxl6Bjcqe1x2MybdsAE5z514nnUP/HEJA53sP6jP54klf4gAVNy+B4AVLMvfBkiuXMGs7/E1R4HraIJMfTAWpdDqg0Pu5BmtoMGVUXeK7gfghh3jCKCTy2Vy7rchaqPO/B7Ffpiw9kvlGzg+jauJ1y5J59UakMXKolkJTjIXvel7Str8H/oVQpDQWNkGiwSMXBqGcTmtCIU1Qhda25tNCsMNB1e7MFckIr4k3ZPEjIdwMflDzbuTN+IxuIgSgQrXTmGLMJqeiKz0sAD1VJNK2GgvvVtgu4MiF8gfZPAl3tuXk04KAILbBHiZ/eH3ESoYI1/MpUF/1wm54YOG/yl47n8jTxX9ZtCZdKJ8zyaMklQy2sVJTe0jaByztFSEx2zVIGMGmLomez2rGnPKcI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3320.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(39840400004)(346002)(136003)(396003)(8936002)(478600001)(66556008)(2906002)(66476007)(66946007)(6666004)(6916009)(107886003)(186003)(6512007)(26005)(316002)(8676002)(38100700001)(4326008)(2616005)(6486002)(956004)(1076003)(6506007)(52116002)(5660300002)(36756003)(16526019);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?K90DJ5YvLT/LlrOsdajTRFugdQe1cueO8FyNNQvSJuIqYpxrNqweXlNNZsHS?=
 =?us-ascii?Q?ZFrs0ruXaot8R9hQmE4pobOGT5dopPtazX3rH8nXh7dJsqMdwyeYvpA0/NFF?=
 =?us-ascii?Q?2NtD7JeFA0peMBNkTfOpB2bqRRjo5/oQUzfUfsIsrZzTuEzj1tba+EzMzR0L?=
 =?us-ascii?Q?xtvJpj19W+Gf8bHnU/Zmu7qLXIzisCW7SFRYN/QQj0I/M9+MIlQ+gY23D9In?=
 =?us-ascii?Q?o5lSaOuPTO8tEnZmVC9VNE9vAJho1x8f3wtSiizz1gusgo02PCg49i/KZq+q?=
 =?us-ascii?Q?aPzHo0YE/wKyVZ0C0twwNIFcDt/yYBXMRlP4rC6p12MrZ9R3s+5BQAHdMOB8?=
 =?us-ascii?Q?mRzM3vt5jt2HD/3mkE0MSxgJSfrBc6JVSU1QCk7z/0jskg2ZY8N5+wPWbo3b?=
 =?us-ascii?Q?J0+GpesUy7if8Zis0125eSly7Z6wvbWurbixXXDCH9moT2GTKa5onGHLHdq1?=
 =?us-ascii?Q?QFy7y8aWOE4e5HFMa43/D+NgXhDvmIrpABsVLAKQRowVCOcGDkFiSFuIj+/P?=
 =?us-ascii?Q?mLVmM/Y+kqeQoY7oZ+ib9dWLmLtWTQ+kc4GpSB322tIwUdrp/QKiFpx0NH1k?=
 =?us-ascii?Q?oUUVUsR0vN4im9KHa/tS4p5/ov0/HNCtdALhp5dYxy67YiGWZfwMIRrWWgbV?=
 =?us-ascii?Q?fWQRCgQGDzOIQDGOvXCLtO9T9si6cUzImO8mmp0vdKgo7rjlHVNraIodq/+j?=
 =?us-ascii?Q?nbqLjg4zh18sqG5fCGQ8PbS7v9fpgLmYLWDqQUC0PzRj33BQVBhprsFjaNRM?=
 =?us-ascii?Q?3a+8iR2iFk3SLWCyBGlKSUg/odxXa9BUBoDWmlksYKjHky+AKOCnwBs1io2i?=
 =?us-ascii?Q?LwIubBiOEiFbPBHfD5EWdYpPCRHSqieABaIBfiyM5wKk4f8cDqExwP4ZWEvt?=
 =?us-ascii?Q?OBznlk56iBVDlv6wkcmrZyG39Z6+mPSPblRTVi25KQoOj06k65gs7qS6gAGr?=
 =?us-ascii?Q?rmLxXGSJ1AB0mj9mVkfq4KAB+buQryymZ/0zIN+LNRpupalQl7hBQwUfOwDU?=
 =?us-ascii?Q?nNmJVfcGuFU7mMvvab4qfv73ycS30hJEC/d8dhjC1m/YTTQUKWzDgln/864f?=
 =?us-ascii?Q?uZNxXbfIwVFzP6rF1Jx8nbp4FxEJoc7U6GWdjGQOkY3YVe4kHPbB1jdg8kBB?=
 =?us-ascii?Q?MNtbO50KXnV80pneFuL6FnVBWrkT7rbZw0g+0shCyxQ+U4mOugljJLnhy1m1?=
 =?us-ascii?Q?wmjo5ogJRCPJQzmowjtq/eRGab5ejzGeswbJn/bvQekWGair83visczxo+T+?=
 =?us-ascii?Q?EjwVEBppXi9crhOjDjXRUS4W18ks7G1DWsFoSN2YO3Amkgnd/HKrLoz7Q4x6?=
 =?us-ascii?Q?eum/kCpduA0JbGmAwn0XBzlG?=
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdac4c0c-9a7d-487c-4f68-08d8f252afb7
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3320.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 01:33:42.3410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jFWXYJEo3tGUcJdIUjVMtxzJ6DBWICCiZMf29EGjUJkuycZGiz7kNwWShUnNo03b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4019
X-BESS-ID: 1616981624-102962-5416-25913-1
X-BESS-VER: 2019.1_20210325.2126
X-BESS-Apparent-Source-IP: 104.47.55.109
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

Add recipe for python3-starlette: the little ASGI library that
shines

Signed-off-by: Ben Gampe <bgampe@digi.com>
---
 .../packagegroups/packagegroup-meta-python.bb             | 1 +
 .../recipes-devtools/python/python3-starlette_0.13.6.bb   | 8 ++++++++
 2 files changed, 9 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-starlette_0.13.6.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index e84bf225e..fd78ee0a2 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -391,6 +391,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
     python3-sqlalchemy \
     python3-sqlparse \
     python3-sqlsoup \
+    python3-starlette \
     python3-stevedore \
     python3-strict-rfc3339 \
     python3-supervisor \
diff --git a/meta-python/recipes-devtools/python/python3-starlette_0.13.6.bb b/meta-python/recipes-devtools/python/python3-starlette_0.13.6.bb
new file mode 100644
index 000000000..461f7bfa1
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-starlette_0.13.6.bb
@@ -0,0 +1,8 @@
+SUMMARY = "The little ASGI library that shines"
+HOMEPAGE = "https://www.starlette.io/";
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=11e8c8dbfd5fa373c703de492140ff7a"
+
+inherit pypi setuptools3
+
+SRC_URI[sha256sum] = "ebe8ee08d9be96a3c9f31b2cb2a24dbdf845247b745664bd8a3f9bd0c977fdbc"
-- 
2.25.1

