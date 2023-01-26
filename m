Return-Path: <stefan.ghinea@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE75FC54EAA
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 21:07:55 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.86529.1674767268502790829
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Jan 2023 13:07:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=gGCEzv1r;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0390362910=stefan.ghinea@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30QFqBBc006802
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Jan 2023 13:07:48 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-type : mime-version; s=PPS06212021;
 bh=prPbL+VcvICNPVFAmjs1Fl/2dLdU0FuHawB03G6uIZw=;
 b=gGCEzv1rzLOhDbXc9YK7eHxllyHoJb82tqCsiXX1C7acOJnr2VT2Z4H/NolxUokhwRbp
 cDFhNM70aD6E7E+6hntrFmnP7sTye2EW7iVEwA1N/WJyAzDLy9sQva1o0rjVj9Pvn03p
 Nu2I9naWRki9OJLFKWKBXQJEbh0MjCd8TxHw7SZjz+2s1qVQNjBBSaIwjXSeFr087fmO
 27jarepsrL3205dfqy2KIWXkGPKkEEPamwbQaCtXRQMiet2rMQd+1Qlw2Ln7XxedUy/8
 I4TMowBHd/rm2gWgEfjAOL6c0XtVQqRKsBS/Qc+yX3P4NXZcwZGI9ZSaDxz0WrVDMS73 kA== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2175.outbound.protection.outlook.com [104.47.57.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3n8geqwukj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Jan 2023 13:07:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TmLB6BNVOJfKp2W3xGFnWEtc5Q0f3RtJnRXWfakZe7B/QZAqTTOuk5LgGaCbODXIkZJ6qb9p1eQ7X2n/bvILUkqv/CNkH9IDS0Nkc3Cc9lLqEvhPbDfYnazvqLitGlAB+70yRgQR6tyBVKKGNIBAgroslNwmUSx9zqi0mqSDT265liFMIZ46x1bfRCKTW4Rz31MoRe1KxmLUAYF7RKhdEV4LnrJcgyaWrUZnFGrC0AL82p3KgZzQqejAKFqoAMrbaXMZlOLDC3b8gr1wHEBRcNTkfAe/CL/c9gkh0AHbrt0etAqLILzymug//QBSmQ35mKuKbhvpEWSH35dpYxMUgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=prPbL+VcvICNPVFAmjs1Fl/2dLdU0FuHawB03G6uIZw=;
 b=IVIbQCptPWmURv+ta+NZ4pgIrwDbK6qo/X9FKsX9psFnRj1IYUO6478+81XGRmR/7cTt2cxYpzX6f33jUDnQEbAMOCKUxzsHYJ+5ggJhHP4xonf5KK4TgE7o4X85mMwg6zn8qe7/Dz5301FAZWvOJoD4TlD9yKL/lOKOndQpZHo/CFe2nQFzrydAYKAJiB9lQa5TEEjGFyWp8iqIQSzkInOWE42yaKK5FS/IatMisF1xUUkcwBCHVqj33p/i3P1T2i/tI8jXcyYX5mIcgUNXL/EFKh1INWio2KT32lS3iKAWQJsq55DNECoRox0D6dEA/h6KUYsliuVb/K9G3BBUBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB4989.namprd11.prod.outlook.com (2603:10b6:a03:2d9::22)
 by CO1PR11MB4865.namprd11.prod.outlook.com (2603:10b6:303:9c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Thu, 26 Jan
 2023 21:07:45 +0000
Received: from SJ0PR11MB4989.namprd11.prod.outlook.com
 ([fe80::d36b:15a5:419a:9692]) by SJ0PR11MB4989.namprd11.prod.outlook.com
 ([fe80::d36b:15a5:419a:9692%9]) with mapi id 15.20.6043.022; Thu, 26 Jan 2023
 21:07:45 +0000
From: Stefan Ghinea <stefan.ghinea@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe] [meta-networking] [PATCH] mbedtls: upgrade to 2.28.2 to fix CVE-2022-46392, CVE-2022-46393
Date: Thu, 26 Jan 2023 23:07:40 +0200
Message-Id: <20230126210740.21835-1-stefan.ghinea@windriver.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: BYAPR01CA0014.prod.exchangelabs.com (2603:10b6:a02:80::27)
 To SJ0PR11MB4989.namprd11.prod.outlook.com (2603:10b6:a03:2d9::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4989:EE_|CO1PR11MB4865:EE_
X-MS-Office365-Filtering-Correlation-Id: a5c313f7-481a-44f0-fd4d-08daffe15e96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vlorz69kLOHlciLfZLcGOA9cKp0Xevudn+PXgOgEYm9yVZWGYLI+GPWVYH05eGAFtilII9UnBrBDiuOJrpwZTmSB8eq/ZzLd1wSSD+2sxnY7j6uGeZU1m5Y3Es5w2Gm02ysDejC6E7ZfB9paMT6eC71t0tjfs507+z3ZNe+lOyktl7cSZGtAYicmXNWoiL7SUgTmuOWZwDEhA5+1c2fKek3rrWOjt61bagGlJ1NndQC0FD5dfGdvIS/fi7M+lY1rhcQenUPI8OM777HsAcFAQKpaGEqOCGho5ENvCQMIQ8vtzj+KdZXl5b5hbYIAMAaStKq9qFZ+Xte0Dd5zRx9ea+lIQ31j7i7IEDe3bjY5ADj+a3Y3+Hh79U09fgMVDWoUeJE1yp/Yy/SaR7i6XP0ydLqi1ufE/hzL9OT3hKFMUux9EJbY5+LNMyHxJHZ+CQNTJqEMBc9Pn/4hbFIjsgk/vhCRKYC8hbfK+aWR0ZotYqNpLN2qY7pqxh/EWRHa796jeQQL/7qV5uM3xANh/lhagqu0BhXa+RTc9/8vTTtwrd/rwVeaNw/OwbFjHTF3NCA3/oPJKwh3/e9+GMg0gLtVyrKkJsTN7gHmnYsx3ppomKhhdDj0zm2n90H1rEZLx4Pqn2AyNt084PAFNUGNxH7IJtkngsgDaTL1jo5Qu1fXA8tjVEmWnOzlMtf8Gf226s7QchzisRvvAiYkkxJBEpHy0uUFazJ98+uC+CTIrU6+8xOcp35XdfpBb/CvNT++BIyD6SoUE1CzGt5ZfHta1mo3sA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4989.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(39850400004)(346002)(376002)(366004)(451199018)(52116002)(508600001)(6486002)(186003)(26005)(6512007)(966005)(2616005)(83380400001)(6666004)(316002)(41300700001)(8676002)(38100700002)(38350700002)(6506007)(1076003)(86362001)(36756003)(5660300002)(8936002)(44832011)(66946007)(6916009)(66556008)(66476007)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BAQoZe+3VtirfTUZKmfVgA7NIl+QUSCdReowhWdWGMF6bUVjnTydELeawksj?=
 =?us-ascii?Q?cqee3Wle6hW+UBNAorusMK2FNV64CK41ljo8vWXrqe3qfDAA7FrskJ3bqYdZ?=
 =?us-ascii?Q?5kwVJFNJ2H0Ol933/hRk5vT+UkUdBeiSYIdscvBvPZics99ZKcz+VqvVynIc?=
 =?us-ascii?Q?i3IKYU7M6wD01hOKyax87Q6FW/NOeA5r8Hmz1gn6RGFE9P/sBA/zdLye5H0p?=
 =?us-ascii?Q?ub1r4Axp/jCNyR4euKKwC9g6eiUOuTm2lzb1eS9Yijz36tjxANDczl2XZA5X?=
 =?us-ascii?Q?MDIJYmPcEx/tLwsT3WOOOqnCQW3FpvLzRFfdVH3tLU06IQDgWGpu2zomk/9d?=
 =?us-ascii?Q?sapO2fZukQmc4BGEfUtj/UfFqA7g1Vm2eWDjzz6wHQb9k0TUEWAfpoMiYGPS?=
 =?us-ascii?Q?fQqxAh0aQ4VQNAlIoFnZY/2+yepHTQfYnPnGsoQByPJuQH8v8Xu5P8N4+xQY?=
 =?us-ascii?Q?xH2xTYupGVMN5TLaUT54zqks21DJYW/xHIrTzdmTzcCQRoepCqYNuqR02dGP?=
 =?us-ascii?Q?U6IOr27wlzqWEsnZA0xWgF8a4XOw/cD1f79u5GdPXlqMkhEvNrRH8pXvjdir?=
 =?us-ascii?Q?eBC8/F3fxytscid+UcI/pgKIPkM47lgCxN9aCuzfErdZxOxX/HuI0RlGJxut?=
 =?us-ascii?Q?dXudNSnTRh/bUx0pUPbJLojdfD25tL+eKhhkY3jkpcXHuPSEnjFfPC6U93H+?=
 =?us-ascii?Q?qZk9pqFCwDux2MhmO7KfQ0mULToGzUmIPACoqqW3uKySTfDEiT4tLYhwpWlF?=
 =?us-ascii?Q?Rx4FR2EOxrCtYF/At6FunIeN9xD51AfICcPqk0NBZwiYWuASnil2GrQiGQh6?=
 =?us-ascii?Q?MD+U7nnEGkSu3g1ksJ7nkQeKhdbyUBNUyw1s0wOvvrk90WAGnqWttt134ZqZ?=
 =?us-ascii?Q?KPqkBpBUpRLrQXgOdt8MlD0tTiNodoN5z2U2d/Rrn62KRVkwJWMZz/AkMQh0?=
 =?us-ascii?Q?VsklS58sux2i4L7SzwnUqjFLJh9mLUwbqaAbMRMfNL2IWSt+g9UEwD8Ej8Zh?=
 =?us-ascii?Q?ZEzyZN5ppw7P3CqqwSRUFqVy2oMxyUlb6GJg+D9fgutssfsaDMXObNiVKb99?=
 =?us-ascii?Q?GmWy8QWgdXPv0hVzxgWCx57dUK0lqG6sJBOZB6R+l5uk/nyhuBC4n6j6l0TC?=
 =?us-ascii?Q?MZTDOoWD8Ixsjno9TxUo2EUgcT5UCBvaX1BFHFSsG6uPeeYoYlMQSAom1d+j?=
 =?us-ascii?Q?f3TdDiz92lrmLXf9jG3AusMMnMztpy5sQ9eOHa1lvsbbCwBolxLc9utE+X4z?=
 =?us-ascii?Q?LIivc4EYsFVXZ4AmMgjk4UJug51FV4qVGsyRskhHPaMvTF/3dQ1yVQC1ibz8?=
 =?us-ascii?Q?5qY1nOzVVDNvMxr373GNW3BL2yHNwjBQTtuPQttMKaXgk/BPxC/eeVtYWv9v?=
 =?us-ascii?Q?02DGgxr2z6ATFNhGMdNtAWG8tOtkBdwJlyzh5+AUZ1GvqwLL6YhsKAzK5nXQ?=
 =?us-ascii?Q?Cu92dGrHTIQBlZWxN/telBxyySoPA530sm0JSyNmOpsGQIyZkVR92EjbcpZm?=
 =?us-ascii?Q?QyzIfIXoPQKhXERSzOo2j1djFL1ObwpqzcM019/c8XLepYALVr1gMvEnAriI?=
 =?us-ascii?Q?Z+iHu8cCMOb3x3q4SPO3vGxsTLBtVBXbD0ee4a9rhR+a5/IxAFSbAu6He5Ov?=
 =?us-ascii?Q?Yw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5c313f7-481a-44f0-fd4d-08daffe15e96
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4989.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 21:07:44.9671
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oxyZhAK0XpURfF9+DZjeGWw+nDUSg7SB8V6+f9IPkU5vFtExYzQ/gEN5BTy16yul/0lXa5T2achgT72LG9YMdsIDl/6qoCU+7TN6KzCU6rM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4865
X-Proofpoint-ORIG-GUID: Y5e2Y4fUEMTgkFvy_b4sN8cndg-xJzU7
X-Proofpoint-GUID: Y5e2Y4fUEMTgkFvy_b4sN8cndg-xJzU7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-26_09,2023-01-26_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 mlxscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 mlxlogscore=999 phishscore=0 impostorscore=0
 clxscore=1011 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301260199
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Jan 2023 21:07:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100804

An issue was discovered in Mbed TLS before 2.28.2 and 3.x before 3.3.0.
An adversary with access to precise enough information about memory
accesses (typically, an untrusted operating system attacking a secure
enclave) can recover an RSA private key after observing the victim
performing a single private-key operation, if the window size
(MBEDTLS_MPI_WINDOW_SIZE) used for the exponentiation is 3 or smaller.

An issue was discovered in Mbed TLS before 2.28.2 and 3.x before 3.3.0.
There is a potential heap-based buffer overflow and heap-based buffer
over-read in DTLS if MBEDTLS_SSL_DTLS_CONNECTION_ID is enabled and
MBEDTLS_SSL_CID_IN_LEN_MAX > 2 * MBEDTLS_SSL_CID_OUT_LEN_MAX.

References:
https://nvd.nist.gov/vuln/detail/CVE-2022-46392
https://nvd.nist.gov/vuln/detail/CVE-2022-46393

Upstream patches:
https://github.com/Mbed-TLS/mbedtls/releases/tag/v2.28.2

Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
---
 .../mbedtls/{mbedtls_2.28.1.bb => mbedtls_2.28.2.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_2.28.1.bb => mbedtls_2.28.2.bb} (97%)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.1.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.2.bb
similarity index 97%
rename from meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.1.bb
rename to meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.2.bb
index b178f5785..3c52fe13b 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.1.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.2.bb
@@ -23,7 +23,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SECTION = "libs"
 
 S = "${WORKDIR}/git"
-SRCREV = "dd79db10014d85b26d11fe57218431f2e5ede6f2"
+SRCREV = "89f040a5c938985c5f30728baed21e49d0846a53"
 SRC_URI = "git://github.com/ARMmbed/mbedtls.git;protocol=https;branch=mbedtls-2.28"
 
 inherit cmake
-- 
2.39.1


