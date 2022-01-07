Return-Path: <trevor.gamblin@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D74CC4332F
	for <webhook@archiver.kernel.org>; Fri,  7 Jan 2022 18:52:35 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.10943.1641581554375369395
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Jan 2022 10:52:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=PbW6pGi9;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=80067cba28=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 207IZ6ws027774
	for <openembedded-devel@lists.openembedded.org>; Fri, 7 Jan 2022 18:52:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=LcVw/rURXTb2k/cMXPcvjYMiSURAX0SZECrAHxGNVn8=;
 b=PbW6pGi9zG+xHPFk7fuWlUokfwScQY7L+QhgIoeWpfr+0IW8RYF3Lp+Ls2TdiRpPVTgB
 Jdqr+kylIFUQdu7+A6t8Beuq50SK/SfZPHANywJRjRRAfnpMGAVakVJ0NnMLfEnsZy8p
 0S2i6pZ555vrW5yAXva3xel0mpdVx1hjM3UNrotfYN3nvRoSzz+ZCZFg+EvJ9G9RWdaU
 rIA5n1CV3UyAP/5f1u8ZTH1VwVYe4a9fxxiOYcgxbaPoG169cImtde3ouwFxJOkhjMvg
 T6ZKs2kpSXtlF+hjzcb9D9OoDT4E8sm3vMDXhkiSFX2TFLggUpDECanSoVSw2FvLElR9 IQ==
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3de4w88tf8-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Jan 2022 18:52:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gpdA8HyR48XiMBniV8DNLpFUktVnFIPwSJRigt01ycHJgG2kNkD4eZTv7VZY/UecRpT9cxH2rt4VkdwXC964vGUm1zCJm0s4mdoCstixLuNb7qXRIC/BypBBUgVISTG2USMhdFD+BFjuHTAudSNdHhTW60Jpz2m/Wmui5qa2eE2FdBLlVvjb1sQzUPNvvOWkCblcpQRKlZPDBYGCqzl0M3pmBzUWUoB+oaYIYwSoG0Pk5JcSOg8jjB3GseTiQq567SRF0XrNiGHcDUkgge2w8NuwpaGYfNO47UZDKFNu5Ckh4M5Q5PjNia8hkzFhrricCMCXqkAYR6DbjJiFAvKGyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LcVw/rURXTb2k/cMXPcvjYMiSURAX0SZECrAHxGNVn8=;
 b=nepeiUzavbPvAbnclfETRV63ouY4i4fi4oWCAdO0Af3IIOuB641GJ+h7DoZ+LwUCcKhlJPSn7OA2Ua3n8LfZM8+ZHLD3kLbGEz5hEyRTKr5jwUU86lLnGjM/B0W9a+S76RZzsSc5vFLC5wvEV7OGmB8EiyhCojrwTSn7r2Cu9CklALKCz7c6d1l86Q6C8KPR7m5BI19HhiIwaiaHaNC6N9Oumh8/GKwkhWS58Chi71T8HDS0vlsHgJig75IExc/IcpKbTA6MlVlVfFX4Fsu9amLSIY34xEuBzzdxUFEJHaEep4rGR/+aVrwx1pFhNi5TqidwcfGWOQx79QgQpSPetw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3029.namprd11.prod.outlook.com (2603:10b6:a03:8e::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Fri, 7 Jan
 2022 18:52:31 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::2c56:bbbb:8def:1f37]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::2c56:bbbb:8def:1f37%5]) with mapi id 15.20.4867.011; Fri, 7 Jan 2022
 18:52:31 +0000
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 3/3] python3-django: Add recipe for 4.0.1
Date: Fri,  7 Jan 2022 13:52:16 -0500
Message-Id: <20220107185216.3375-3-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220107185216.3375-1-trevor.gamblin@windriver.com>
References: <20220107185216.3375-1-trevor.gamblin@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YTOPR0101CA0065.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::42) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f30feb30-8f39-4d4a-39af-08d9d20edbd2
X-MS-TrafficTypeDiagnostic: BYAPR11MB3029:EE_
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3029EE845050EE5AA21989C69F4D9@BYAPR11MB3029.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dkDG28eRPP/hOxXb8UaSF4he4UhnT0j28637jPrGI8WaFxzpIIKB+ESlt5cl7QCwWghrExqU2RwsyvRA7koUg78agS5oBSLpKB6Csx4zD8iBWGtJknxs/55Y4dk7R9i8s3OIHArhsBfL/Fo+WMuEusCw9iJMq8RdmyYCj0RDHEE/PcMV3+HRQd9LqJ2pBhk6kAJ8rXSGxYxj48XJeC1sBLM4Jzzo08rjZMsCts0WiMbLYNRde1eRPrzO39K5XjCvPUZM+gb6Tgd906DVCBIIr7r77RdfxsDKijS3kLAP0cugoc84n3Efh3LOQID74BLZmOLAX52DM8CX4tRcJvvsIPbWF4IPxLdKkY9GHsq0G7gtPVdLeVlPW5pT7qm5AWusFr3jirq6vzJ4KLBlZLO+FlfRkVKuvqez33Nm700X3GiuAHNyXf7iG9JYoJXCo4SPMuCWouomgdF/SkcYkL/3RvX9zH+E13H0e7sRfG6HIysgSZju9Y9l6aZx+HsroSI3GY2h7QTP1B3iU8HAL6VSCgBByL9FpOGFMRml//uxeXV8lrkiFnXhnsoXfwl9cEQ+fFbGueTMVUiNV56w4WjZFUZ92KMOD5ySLbhFbT3BDHK/Ebcr35eqWgSpm4/6jzJNa9n2WJHjw8Hok4kYNnQ31iIevj5FprfjYKQKuJifb9dxvQmzHZ78Q3/uI9yMtrIZn5r+FX+Xm4/iBei6RmT3Cg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(5660300002)(26005)(316002)(186003)(44832011)(38100700002)(66476007)(66556008)(2616005)(86362001)(8676002)(38350700002)(6506007)(6486002)(52116002)(4744005)(508600001)(6512007)(1076003)(2906002)(6666004)(36756003)(6916009)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?j7sx9kISeTSfkIUHLi7lMg1NHWhd3YKtyV/RHwh5VH/leAgMDbfflqC9fnsn?=
 =?us-ascii?Q?KtDSKkU9K8HBR+GQ0HwIKmysbPFyeYa0iTHzgEWTQKTr0eN6hdY2j6/pN9vu?=
 =?us-ascii?Q?y8hhHRnK0s6b6KtxScOfVrwjMLWU4UDUr6in944CJm2ahUtq1WXaRROsz2Wt?=
 =?us-ascii?Q?M3ngZQ1oxTMdJhUMTeLrL8iV4kX0agoWIWqKRAsfM97+7DOA00O4q/ERHnMU?=
 =?us-ascii?Q?p0Nk8CGpd/LOwIeq4g0xHJWKZSaUyTcEhJBxnDA1Sx3phQ3RQX+MAR+pxaXc?=
 =?us-ascii?Q?9nGlrXyPM+iONzM8y4Y4Q65Y0rEPHTVkVvdm//pvrArhoanKPYoGLy51gy9+?=
 =?us-ascii?Q?XMCkKQC76zIpY3sTbxt/+dRJrBXJaii2EEmsKWLRUdIH+LTLvvIvN9kUtaCI?=
 =?us-ascii?Q?5oEcS+tsEznGZOu2M7Qn7dS0394jf1lQoyvHcVIuEtKJEXCZYYcSvyHtOyt9?=
 =?us-ascii?Q?JhPePDeRRyxfF/HaDWLIh7PHw5jlJ8cIVLNAGjPLrQ0w2RsD3JRPBcVlSEMz?=
 =?us-ascii?Q?tFQ7i4ETf6pO3vmzkfKwtMBUecDX3R0KUXOv1bACDQz2LEnwzzDjFcfckjHI?=
 =?us-ascii?Q?Uey/Rm7usUmxhoUdjcvX5cqtdNuTCmQthwf0PZJc64b+CHnBUeGC47q7mFqJ?=
 =?us-ascii?Q?6eNLAebG/l6hpAQvhK7CqUk+HnEo3ECbpOyKVtITy2JGG+jLCO3CflV0bEUW?=
 =?us-ascii?Q?qqqqifSw9fxUtk2kurXJFct8jO2+8DS9vq5BZDGD9mGLreIL73n5mNMrG5qs?=
 =?us-ascii?Q?nw1sSPDhZP229Wi2hpTwt6Z6jz0+inLNaT7Dm74HE1a7+cvwM5ZYfYa64HBb?=
 =?us-ascii?Q?CU+tCTyxDXIj/2cZJ7NsmWeesCfMzM+ly19EibtCF+JmKN/RSH5Zk6ZfXdNS?=
 =?us-ascii?Q?vEe+w6WKDSiIkmFeX22G7QB6AKvnK30WRnanLXYXKNvp33WxSDhrTBL3PynX?=
 =?us-ascii?Q?tpkEaLI7/V3dIFV8POZ4nNqsLk88UH1tC1ofQvnilPMo3fJG5Bv95rPcWeF6?=
 =?us-ascii?Q?6XZr+0Dq9J8VBC17fEUVQBV8AksMZ9yUP/YjjaqMbvoYkx+pu85gOxHoqmEw?=
 =?us-ascii?Q?HfpgDTGYsyh5lbjGnN+nitXwzzdEo7yOJ7xi930niMzzs9UYbMS/co/DrQ3p?=
 =?us-ascii?Q?S71gmdIbdjeweravp7f/kIXyuB4t2QNET+9+Yt3VTSOZE3+Bva3kj53o7PMG?=
 =?us-ascii?Q?hYem+PqyaOwk0yDEtxKJbIvHuGhPzpFhtL/W2dyYfKM2DlAz1xrNJkgL20aF?=
 =?us-ascii?Q?uU9gGoX/pJb8/JTV6gyo/7FwGkC25xrW/qflNm1a7AGa5IVkOtzYoy4xGm4D?=
 =?us-ascii?Q?Vy2W654HoZweWKqYUC9Tx5MdTW+RuUygnyVp5e7MZtkbKgYPxuakIQLlLvJZ?=
 =?us-ascii?Q?ZG43aSp13U6Zhi9y6eENFYGlLFf1kAe0JM75oNFO9lyC/pPZ5DCpwFl89cF+?=
 =?us-ascii?Q?pzj/qizvdfYqckwqnPsMd0UqW/KmaaLV9VMmq7aKIq4OgjL7zgNyO8lb+Oi9?=
 =?us-ascii?Q?FnvWzFwm9wnNwluf8iDiJsuGOJPPl0mFeuy3eOJY9nuUEHah3bDyU6HaTkFk?=
 =?us-ascii?Q?Kpw/3QGFm4kPWHWpPcFauXNFR1yefWko6FplKGLRWZOzqSFqVhP+6gIKkbda?=
 =?us-ascii?Q?TIcVMtXIa+RhaqF2oBSWjVbgzX9n13KMRBLYEszDX0Y5dvlbWVRYboKwpFk3?=
 =?us-ascii?Q?/O5Hcw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f30feb30-8f39-4d4a-39af-08d9d20edbd2
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2022 18:52:31.0873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 k99a6nninWX2HdO2pRnbWg/igtoZEflWrugssndy/dE7/Z1IBn7cpr+Qb4SAE4wo8J8MwCL1MHdB85sv/uDSA0Rd05phvRP0B+4yDEDCkx8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3029
X-Proofpoint-GUID: eIoKx56FYHOTALpfZd05yn7brfOvr_KO
X-Proofpoint-ORIG-GUID: eIoKx56FYHOTALpfZd05yn7brfOvr_KO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-07_08,2022-01-07_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 mlxscore=0 phishscore=0 priorityscore=1501 impostorscore=0 mlxlogscore=999
 malwarescore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201070119
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Jan 2022 18:52:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94701

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../recipes-devtools/python/python3-django_4.0.1.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-django_4.0.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-django_4.0.1.bb b/meta-python/recipes-devtools/python/python3-django_4.0.1.bb
new file mode 100644
index 000000000..6cf8cad8a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django_4.0.1.bb
@@ -0,0 +1,13 @@
+require python-django.inc
+inherit setuptools3
+
+SRC_URI[sha256sum] = "2485eea3cc4c3bae13080dee866ebf90ba9f98d1afe8fda89bfb0eb2e218ef86"
+
+RDEPENDS:${PN} += "\
+    ${PYTHON_PN}-sqlparse \
+"
+
+# Set DEFAULT_PREFERENCE so that the LTS version of django is built by
+# default. To build the 4.x branch, 
+# PREFERRED_VERSION_python3-django = "4.0.2" can be added to local.conf
+DEFAULT_PREFERENCE = "-1"
-- 
2.33.0


