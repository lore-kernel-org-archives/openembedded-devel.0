Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F37A8C77B60
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 09:10:33 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.65629.1680513029039071695
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Apr 2023 02:10:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=X2S0+TwV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3457c3350c=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3338gLWY026568
	for <openembedded-devel@lists.openembedded.org>; Mon, 3 Apr 2023 09:10:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=ZUFqOkP1yajqWmF74aRYMllQZ2KcwpzFJCCHP6qLVSg=;
 b=X2S0+TwVHZdHMt41tGivuV5jSYWMpx8pH+ZShT50B/Sl3BLri8j0QTZuN0misLIMSF7k
 WO6yXNDb1viyP03xqb5pQHLMpWCMrn5XIS0SphQxQr0NOm/vBc80oAxWSuuY6lqhL59Q
 py2fWtoyL62s+4VDhGmJWWNrASjZbTaxI/eC1LBMpBJklkL032sjiSRuAjNUss7WhC6K
 zcCsGINSvO7kU2nNnSDnfJ+Q+88EIk+VbcueeUA6XTYb1fjQXmLnY3kA860x0WeBRrwA
 pbtx7wOnG0TFig5/seZFQ18HN5SVeTnmSZHI8T1PwmegFEP7DB6pM9s9Nw9LcgIhVbev hA== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ppbkbhs2n-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 03 Apr 2023 09:10:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cnpkj2Fh/LrzEJPFN8TxGaCqSlEuvc304IZPLuPtHUsJ4nnDJKKJcMtCt+CG9Fnh5jdMWRerSC4fYr8NFin8qp+YDVPidyKEFVX1XSKBeePBxQG2sgnNcsrQiYaMV3tgGnwHwIWEaaqxL8kKFyHfgR3Zz3KiRKgeI+U4OzYR0U0W0lkJjCU+ccxoJy2T/u1Jc9AqeqTxB8FdtHqgH/JzDrvMsV2QfF5UwyRzAwl9x/jPHzftDj3qsrsDnSfy16x8NxUHemlKRlSg95ZqAlPC2QQsIXePJGzcKmTQPKcvY0J9GLOD8rF52yFoxvb90aO4kY5vIfyjrNGsAkoQaO70OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZUFqOkP1yajqWmF74aRYMllQZ2KcwpzFJCCHP6qLVSg=;
 b=FcaGtQ13zPwdQ4YcbpqlofG6UB9A6s3rmEJzf335iRt6OLU8aGHUYfSvOwtpnYu4JtVVjJnrXf06dwH4qe+k8ksRJCeIUeZIuMdnhz3u7HvoolD6sIrshfyP7kI9Gi3Q05XW5Muh46TDPfioTY1r2sgIpHo8yG+dZ8wyhvEQOW7cwWkjgq3N8VTcwrRudu6RAqWnXyna1OH4awkGrzAQbej0ojac4KNf8z6qDVOI+GWN9OYnNi7ek7U1DlIP+Adwh6srOGedi3RX5gjf0om1CblRFZAUL/RzjArD7gKZtwCE6l2SJEjlG0dY58/f6LIz8/XEMTpaVp4MXXYq4AS+YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by PH0PR11MB7493.namprd11.prod.outlook.com (2603:10b6:510:284::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Mon, 3 Apr
 2023 09:10:26 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::cfb0:1a8d:38fc:7ef8]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::cfb0:1a8d:38fc:7ef8%8]) with mapi id 15.20.6254.033; Mon, 3 Apr 2023
 09:10:26 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 2/2] samba: upgrade 4.18.0 -> 4.18.1
Date: Mon,  3 Apr 2023 17:10:11 +0800
Message-Id: <20230403091011.530326-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230403091011.530326-1-yi.zhao@windriver.com>
References: <20230403091011.530326-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0047.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::16)
 To CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|PH0PR11MB7493:EE_
X-MS-Office365-Filtering-Correlation-Id: c5412edb-c386-4fcc-0f40-08db34234362
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HyQSQxLQec6mtcoYR/445MYNyI0OKda2Qh20zn8MLUzNOFJfcBlQVRayQnKcwG7qv7RjFQVcA3E57Hvq3Y3EjdOCaIZE/KTkDP4ajYj8a9Cw89QPbbtW3dGz/BrF5BdkjzdSWZZzCNPoXwtf4JGu8mTGGw+pAWPTSQ9QQDdfaQr6yTZV/RukJDmvPwIixc7xL0H2ig1D0yHXJ+BtQwb53aE2B5nL0SDdk9qT50r4meCyAU/EFQ/8AsiRIu7U5a/uP+FhNI5lAk2a9evEiceJ/9dsE2TGHzCWxtoKdNfXf8b74CZ1TuF2tvIItpxYSx8spqtxjhI45vO8rHdSdwxH8Yf+OApg6c17GpG6bCi6BYwaExCams0/UTX/r/LGdSUIR66WzbdbuEew7Z0BntrWxvTlAN9UerQDold7hluWiP5dw6z5y1vYnYGwNeFroGFyu7vWJkDsAy2lnUa2so7iLlVy3AhOyGr0bMu/F9yNSyzMoEGap6ygfUg3Wej1ocu7LrneGLi4A6WUOYDOYJKPcgU/czqCp9cCRF5W0/8VxZFzUKFv8csCS0uFPpsS3z5Fn0e9ylb0X3Yq0jUJKVsfXA5jqJ6DHRA9MRp3f7vJKII=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(366004)(39840400004)(396003)(376002)(451199021)(6916009)(8676002)(66946007)(66556008)(66476007)(478600001)(316002)(8936002)(5660300002)(41300700001)(38100700002)(38350700002)(44832011)(186003)(83380400001)(2616005)(52116002)(6486002)(966005)(6666004)(6512007)(6506007)(1076003)(26005)(86362001)(36756003)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GlfdELv2Lo9AHuf0L9POH5oH0sc/oT8uSa72EMFA3d9DLfnTt3Qk97S1Kc2W?=
 =?us-ascii?Q?+PTq8X5lp9XYgAaFCGpKZSesJP10nAkMOyqEM6khkWPt2TtuoZUgKvpvPEMQ?=
 =?us-ascii?Q?midB0BqfUXUNeIOERANI0+sISyyU1kgD23z6I0X27+rYW1VzcfQBErgB/FZI?=
 =?us-ascii?Q?56i1Ak4+Ub/7dykPyr/pXqkxKsI4efZQQdMKXwzQQ/HVyrS4I8L51kHGF3Cy?=
 =?us-ascii?Q?xxJHseQVM5geaNFQiEwL8cV4HxdP3XwJ1yncecKBVDFqXR9S2lena3Dr3YYQ?=
 =?us-ascii?Q?CqHn/yeimtr9m8rGgZra4YFU9pHguhyUEaw5JfF/KGn/fnuVBpboxGvLi+/r?=
 =?us-ascii?Q?R+O8uCaLoO+2Iu+iDti1MtDeyIrYbR3icc+cqH+w09uET/F4dXINikYmOHIl?=
 =?us-ascii?Q?Q1I9I3aYsC2itErz4RCl9N6K8M5dVhi+RVun+rCTGQAak3G7HuxBoZWxZ25B?=
 =?us-ascii?Q?SqgUtRefeKwzsZ8laCOlzlxtJWLDzyntghPLB/HGQFRhgrcYuIx/pg3KWlaL?=
 =?us-ascii?Q?pKXIXnYs9YT3fYF2dI32+EVCgdn7qhP94OSUWgkLChFQhv88m06buFnsN/q/?=
 =?us-ascii?Q?T5Wkwkgfz7kELLGhS8QjnQ9thH6L25VGbZPqblGn2exsI+EzcYv6s0QOXnTI?=
 =?us-ascii?Q?r/gCcaZSrM48c6Pv/PL/UrbU4hmfb0XMZYl8ASzJKxJ+Y6anXo83q7rXHvLJ?=
 =?us-ascii?Q?xONoBKw5a/6HLX8dIFXuTvYY8+miaOmQJZlDdGDiISA5EGcGxDz0u4MeNSQv?=
 =?us-ascii?Q?CRZ3TGfvwbW/XZ/DklkghXF9Cm+ArdJa6t521ctJWhjxhok2hJ2uWjzDj1kT?=
 =?us-ascii?Q?tPqm4onsM6bjl2AsKICaxhHujqObyUp50gDD2qWYUYS/uUbTAYpbtqh7ssLR?=
 =?us-ascii?Q?qXQEUwH4Qy11g/NwHceOcRm6QQCzbf+pURNGE3lYbjQkc9WvOcKu73aLFmFp?=
 =?us-ascii?Q?+oyL5n3ybCkjnGDCD9eFJ7W/7/cMX1H/4N2o3RP2uBo+piw7yoSAM4QglVnz?=
 =?us-ascii?Q?2MK6KccQ7um6+hCH+sOQZfkIFMMzDMUShnQUWh4sXQkCIy72cnWudPNptZUw?=
 =?us-ascii?Q?jNNjoEdyZDwX2hCDg7ZShxB0YZTktK8wuENI0bBVCAq+lYvPixMMzLRusa90?=
 =?us-ascii?Q?MXRR9szHchLWo+QaQfF+JPA0z9PE9XrWNeQheWr9DPVPffz/qcW3F/xK9D9O?=
 =?us-ascii?Q?4l9Uxho0Ohgtd0493HnSwlAt35wf4B69qG9IUIJzoup7chfRDgGSmvDAZMfN?=
 =?us-ascii?Q?o0I2wnVHjpg97GExvjPE/0HuUxovrmyNsshNqsdfuqgWjf6Z+TvYbixkATd4?=
 =?us-ascii?Q?JDtTc7ord2O/UP4DCxjbRs9XIsiurNiLFk2ZzSmupsGVz/fEHikYhKyZL5Qp?=
 =?us-ascii?Q?rCCYec1jInAt8JiJ0cY6BhhwtwS9yzr7b+bMvk+96t7U/DxfxfVy0DjaUoFA?=
 =?us-ascii?Q?4uHxJHFzZpUt6obkvMaSv62CebHOl0+CxNheMZMvHW1st8JSw/I8yUmz7Dgj?=
 =?us-ascii?Q?wyIwqerq6yvQE4T+O0PrDHJtlQoYOQdFaW1j0ukwW0NLn9XGNwTLYIKYKWIH?=
 =?us-ascii?Q?45haEAujLtmjbWIeP1iZSEMKJtpu+NiFIdD8TklH?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5412edb-c386-4fcc-0f40-08db34234362
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 09:10:26.5300
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yUysAeaQv7sJquPM5U3/AYo9Ud0Dnqo/Y1XFAkykR9SFl0LQSdVbLIiSo6/L6yMnyMqhG/0ULOVF6od2MQYPmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7493
X-Proofpoint-GUID: gCwwS4PsdxG6RHJxsNL8L7v23IGamayN
X-Proofpoint-ORIG-GUID: gCwwS4PsdxG6RHJxsNL8L7v23IGamayN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-03_06,2023-03-31_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=825 phishscore=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1011 mlxscore=0
 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304030070
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Apr 2023 09:10:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101908

Release Notes:
https://www.samba.org/samba/history/samba-4.18.1.html

This is a security release in order to address the following defects:
CVE-2023-0225
CVE-2023-0922
CVE-2023-0614

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../samba/{samba_4.18.0.bb => samba_4.18.1.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/samba/{samba_4.18.0.bb => samba_4.18.1.bb} (99%)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.18.0.bb b/meta-networking/recipes-connectivity/samba/samba_4.18.1.bb
similarity index 99%
rename from meta-networking/recipes-connectivity/samba/samba_4.18.0.bb
rename to meta-networking/recipes-connectivity/samba/samba_4.18.1.bb
index d29c1959e..7992fa968 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.18.0.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.18.1.bb
@@ -32,7 +32,7 @@ SRC_URI:append:libc-musl = " \
            file://cmocka-uintptr_t.patch \
            "
 
-SRC_URI[sha256sum] = "70348656ef807be9c8be4465ca157cef4d99818e234253d2c684cc18b8408149"
+SRC_URI[sha256sum] = "cedeaa2f244a0862c4f73b7b9f2ff92d181fd3ba7df80284a2f25f7713b9cc0e"
 
 UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.18(\.\d+)+).tar.gz"
 
-- 
2.25.1


