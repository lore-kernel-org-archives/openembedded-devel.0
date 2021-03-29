Received: from outbound-ip24a.ess.barracuda.com (outbound-ip24a.ess.barracuda.com [209.222.82.206])
 by mx.groups.io with SMTP id smtpd.web10.16775.1616990928127663826
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Mar 2021 21:08:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@digi.com header.s=selector1 header.b=tuSkWKNQ;
 spf=pass (domain: digi.com, ip: 209.222.82.206, mailfrom: ben.gampe@digi.com)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171]) by mx-outbound42-72.us-east-2c.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Mon, 29 Mar 2021 04:08:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yo17Dg/0tjO03WoiFLNkO9jD+2QEkPPCBiliGroN32jZgTYfMgLflkeicnV5dbKA2zYmsXsaZsC7QGU2aDcLqmusaSq5C6GN9hLelT6PMwdjv3kaYVEGKh6WFFwfRzz01QveihUU6LkdMqdiCjj3rcBPQxDZ4Ns4r8RWydZhnUjOrH3vA0wcjfRvx4fWSVGrQfpN7SKjrxzAdZS/fntNEQmwC5t1PO7wL+FL97x2oo9gamq3tcfeluP4XqLF4mnZ2aSIe9ZIH4/vyiN8bFiAJ7rGmfauNGWH1n1FhKAkwY2Za8cqQxfDghpT7GKoYRd/M09+ir1OHzZi07/v2dzWsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wb1RcrbGsXqZeHjrpZgbEZWN06L+EULfXNdwIlZfLp8=;
 b=L22C9YL11Z3/oJqgarG40PViHWbB9fUX65kIPnR7CweFY63f+T0Yo8q1JqZmeOAk3DBfAlnoCoaxUQ+xbaW5lteFvO3T2JOCdkhmxj+Uj2MYG2nifu37wZdgCZuSSpedF1SRachXJ9PPDxgrWaJv6IlZ0LkCVtEd0+FYJiQZTxznwJATa5K/+NmUnv7yai/TUdUorU862WDWK5vnKtJKQYZ/v90xp4tHy0YkMzKz4h5wu0vNOvxz9GsFElfQ4wHnQgM8Yx/tUGSCzKoT9yOyx/SKlIE6nsaYphuUZeIqmqGRrg17AwrftT9zMOM9EYIbD6ho/Jw/lMmfUSLKKnYAeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wb1RcrbGsXqZeHjrpZgbEZWN06L+EULfXNdwIlZfLp8=;
 b=tuSkWKNQ71HAV5GFXwDxT0X9vp1YiZzh2l/Kxn7EcUJ+6ileal0AQ+UuTiW/xi5/OllZioVFUqddNuSQFfLktvg8Hq0VeNTeITwKT42QftBmUn0uYVwLNOPSEpaKu9ZVIiZZtKSDZnkAVGq946TIddrHyXRlMfUza91hle7dAmw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=digi.com;
Received: from BYAPR10MB3320.namprd10.prod.outlook.com (2603:10b6:a03:15b::21)
 by BYAPR10MB4102.namprd10.prod.outlook.com (2603:10b6:a03:129::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29; Mon, 29 Mar
 2021 04:08:45 +0000
Received: from BYAPR10MB3320.namprd10.prod.outlook.com
 ([fe80::3cd7:c100:494e:cecc]) by BYAPR10MB3320.namprd10.prod.outlook.com
 ([fe80::3cd7:c100:494e:cecc%7]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 04:08:45 +0000
From: "Ben Gampe" <bgampe@digi.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ben Gampe <bgampe@digi.com>
Subject: [meta-python][PATCH v3 3/3] python3-fastapi: new package
Date: Mon, 29 Mar 2021 14:08:07 +1000
Message-Id: <20210329040807.2600673-3-bgampe@digi.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210329040807.2600673-1-bgampe@digi.com>
References: <20210329040807.2600673-1-bgampe@digi.com>
X-Originating-IP: [49.197.127.171]
X-ClientProxiedBy: SY6PR01CA0088.ausprd01.prod.outlook.com
 (2603:10c6:10:110::21) To BYAPR10MB3320.namprd10.prod.outlook.com
 (2603:10b6:a03:15b::21)
Return-Path: bgampe@digi.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from beng-dev-laptop.beng.bne.opengear.com (49.197.127.171) by SY6PR01CA0088.ausprd01.prod.outlook.com (2603:10c6:10:110::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25 via Frontend Transport; Mon, 29 Mar 2021 04:08:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dae4bb35-dead-464a-762c-08d8f26858e1
X-MS-TrafficTypeDiagnostic: BYAPR10MB4102:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BYAPR10MB4102DB8E4735E149276C80948F7E9@BYAPR10MB4102.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iTitlkDLuD/NCz0S9AsULbdibYXpMH71ITekTjeexSme9lt4CeIRr6T3IBKDO7N7c6aPbBuEQ+B5hIweTr7a/m3BqSk9e+zjbRiywaDYAZ8EVdwbdaUoegSzBCyWVh8ZboEyuIk5sqXakwuNj+JIJdADPDuhBoRtGBMSiaYijmFJlsjIrfInLACO238Qg4xF2wJ5zBfEYohhZMCJtGuR459W9c7dAFNVlqNFJHWTj2XZ5ay9dttgygsZ6qH5L2koLzLaV81E6vBGTt+6cLzWFt4HWkXZKXYwN8QU1p5/fM0U9ebnIqr7fMrPzUT81LPTzYrr3/4/zzyowVyZ/ftjEK61vHJYfc7N04QBA05U7gcGbPHiqO7xHACbINr+GaOgjHNF+RRhSzTTQHOG5sCT/9b24t99Q6YaYhMZcr3sM8c4zOumlSxqgZPtNAgE40G3ApGa/JaMaJWRzgGbCHkeyAjxIQ+Tog/bLJxWs6LaqLud5v+a4cFopyfcH3LKbQs3N29FgRcfXDpODCMSm4R+J0z9OzG9vNAQTX0Vvdbh7mIf+TT/x79vSK3RWb4CG560iafOzfYlyIpMSm/RDw3hDltEdjmuWYsJyr7AOgUnP1yeQ3UmYD9uX/ASNV3JtUBebSXsK/oA1/8Hak9CjqK+iiVqTtCdIQt2qDofNW28ySqhB32GKVXEKkEeI6+dtyETrCxkYIuayTdTuuTJsuT1iZad9q/r1/dxIq0O7U7x4ms=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3320.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39840400004)(136003)(346002)(366004)(396003)(5660300002)(6512007)(6486002)(6916009)(316002)(52116002)(2906002)(6506007)(8936002)(66476007)(38100700001)(66946007)(66556008)(36756003)(4326008)(956004)(186003)(16526019)(107886003)(1076003)(2616005)(9686003)(26005)(8676002)(6666004)(478600001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?kCb/BozPegZie5TBsbRKMcAyyRFMDJbunQAt3SkhnUYDyo3U1VVTzvROTbMU?=
 =?us-ascii?Q?x9kLDCZumJlU/2weM1LL+o+wZ78jab+jcrL+r+JsO3dx9JKAAybi3nAtUQOe?=
 =?us-ascii?Q?NjaIc0l5LWr2/1HVgV/r7bXu/2fxtOCTzhDYkCpTSQPAdPkcTGLHuWQHGbmn?=
 =?us-ascii?Q?HqVRHHFdRDhTjUaeVaHIFBLqUa3J5mRqfEh5tvzrRS9idLegBgdy9SA1Hkeu?=
 =?us-ascii?Q?2ZKdpaMzgSZLxwEzDndzMA1Ub3WBddOOuPuJXDsD2BaWKi876ugv1LMpGO17?=
 =?us-ascii?Q?vRj8FuSAFiQgqwyMvNmWNO/sJXrttmoHUY/7pCKzC3XZO4yzA1Q5NlfJmjzY?=
 =?us-ascii?Q?W6mCH5UFc4b2Eyejm9d5k4kjNLq9V5DmlwU4OifnVUKZmP90OOjuasB//PS+?=
 =?us-ascii?Q?SDUtWexSWDhkA/RGcN0BxPcUGMl/ykeU4vJDvcFGYxF3ROwMC7ixUipc6JMo?=
 =?us-ascii?Q?Nljzbt6hpxjPh18x1clFTvTwBrAzoiOY4gFjDiJ9QR/J6+W86/O22Ay92kFa?=
 =?us-ascii?Q?VPn+YQGoFBS3VjjDB9C3Ek3TBiUku+cOdDGqHw/tZQSpjLPR/2somDGdKKlj?=
 =?us-ascii?Q?2rH2eYbPcC5rkhsEe2yhtPS1suEW8p8JEjAOF0/O1GcLBIR5Y382dFTyJ4OQ?=
 =?us-ascii?Q?vqyVO+0qZKWWIFO2g2XsezNPof4v/usLQ5Yk5q/iyLcjdJb4cjkXXgChYJ1+?=
 =?us-ascii?Q?0cqMu6Wfgow1b4QT4mCkyexzGTcwT8fP59dExZgitHatm2311ykMfuOhXa0h?=
 =?us-ascii?Q?GKBY9FNHCHpyopfqlsCvAj+wBmrnYatXAox8+odDj2h8jJwdClA+KuPsg5dK?=
 =?us-ascii?Q?NTebeYBkDMJNvWqhT+XVaBV2mVy5PTny4APRWBw50ThAVh4JetvMGI7ADFih?=
 =?us-ascii?Q?W9w82/a66bAAfWF0oeiGFLKHop2NxYHvLGiRI4uOpn4Y6NfEd5u6RBXRHI7Z?=
 =?us-ascii?Q?irJn6P7NsFF6uGYvixXr4TrzTvMU5JD9CjFy95JsMPCW/dXFngKg2P2O+2QX?=
 =?us-ascii?Q?u5bqDWaIvdU7PtSITh22AE7X7R+4kPPWUcuZQySE+hY6EM395vpfnkJmF2+g?=
 =?us-ascii?Q?y3unkU0pm7pheDTyRyCBAKGeXsYTuscN8nr29WUpnS2h/BZaqnsqQxd5ZS6Q?=
 =?us-ascii?Q?+WbEJoEibTk60uFdGiK3Nk6NCKxUKHc7uAWnTRgne6hXoU4e+dDTlQnKW7yA?=
 =?us-ascii?Q?T8AsFL+yFofOtX/8rsbJMgGVQWX2Fn1VUiHnUUdETsU1rHe/8MEo9o+hiib2?=
 =?us-ascii?Q?5Xf7+r/OpqDkHdT9j948rC4RuSe9d+bIoUncWk9X+aYx1Y38iuObzMqVk/z5?=
 =?us-ascii?Q?b+R9g0vJrdVMe7oBFnTQYR31?=
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dae4bb35-dead-464a-762c-08d8f26858e1
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3320.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 04:08:45.6605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OSEOffi8E1U2UfBctjizeGBeFyFNq0w1Ud88JSFIDGiiwEIc8kH2BQAM2Zl7di2n
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB4102
X-BESS-ID: 1616990926-110824-5433-61498-1
X-BESS-VER: 2019.1_20210325.2126
X-BESS-Apparent-Source-IP: 104.47.55.171
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.231167 [from 
	cloudscan22-95.us-east-2b.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 MSGID_FROM_MTA_HEADER  META: Message-Id was added by a relay 
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
	0.00 NO_REAL_NAME           HEADER: From: does not include a real name 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=MSGID_FROM_MTA_HEADER, BSF_BESS_OUTBOUND, NO_REAL_NAME
X-BESS-BRTS-Status: 1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Ben Gampe <bgampe@digi.com>

Add recipe for python3-fastapi: high performance, easy to learn,
fast to code, ready for production

Signed-off-by: Ben Gampe <bgampe@digi.com>
---
 .../packagegroups/packagegroup-meta-python.bb       |  1 +
 .../python/python3-fastapi_0.63.0.bb                | 13 +++++++++++++
 2 files changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-fastapi_0.63.0.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index c0132abaa..e9616a4a0 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -114,6 +114,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
     python3-et-xmlfile \
     python3-evdev \
     python3-fann2 \
+    python3-fastapi \
     python3-fasteners \
     python3-fastnumbers \
     python3-feedformatter \
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

