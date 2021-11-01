Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28AE5C433F5
	for <webhook@archiver.kernel.org>; Mon,  1 Nov 2021 09:17:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.41705.1635758229333692994
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Nov 2021 02:17:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=I+ZkBa6u;
 spf=pass (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=6939048548=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1A194uiT015859
	for <openembedded-devel@lists.openembedded.org>; Mon, 1 Nov 2021 09:17:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=n9m3uT4eGjfEhDNO5am9cudhJ3CsY6pIbNaLeWvxVsY=;
 b=I+ZkBa6uQjgVaM3NIqJnlDt7PAj5YRQvUnmlIusiNWHcq7YdFrxQ+miAog671Bwlm+JI
 WVEfSEc32ei96eJPyeqZ15a518maWysSceqkeiuKJy1q+36qgpE2A4XPwxFQLkYg50oh
 j/ASk1gOxIHNSedhDKZ1dD9vJxhS4LNzOr9qawFrpPH0wcHmV6coqDyuSdrPTAttseYG
 r61ThwGXSBYNUdy1K9pPedUr5OxKgUD+KEV11ZVXE7S6v9Jeh4ir/RdkHUTCNLKaoJHb
 e29MIi+eeRUIojoDpoXaxGvbF5xocB/CtlKwB/RicAiLL+gCaJ/asYzDOGcdpdp8hcrV xA==
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2041.outbound.protection.outlook.com [104.47.73.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3c2bms026f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Nov 2021 09:17:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BeWjAr1fYnMeMudtO234rBb3gdg/K/c6DUKUzJuekj06tktjz+IRrxMr1cseKohBFOn97TC4uP8eHTBzZhwZ1zYMKFtjOJs754PPnPZ2JjxUnSBfuk5K7r2qVKwJnn72eKJ3HgUkrOnMkdKOaHe1upK+67TJPB7zwIPPR1eFIiFXYJE9CpuncX5mPM6j7K09M61oG9YE3cE28V+IQMIffIz8doQOQS7zfwncJOxwPIghvcCU8IOxWgsIan/EZnLrfKX3H9+xzlaIlgW2E8RqQnyiZ/3jvUqHgQWknu3xLs0jmw8Y1Q9DpTiVlkCPxswO98ayySglT748/hvxbhYECA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n9m3uT4eGjfEhDNO5am9cudhJ3CsY6pIbNaLeWvxVsY=;
 b=g4NKexpBO6WgqeEAIYKziKCcCO/GPmR7y4HxjdMF6Y54DD+vBCO4RrLwEiGxr/Jxke9bioIxQHnVh25s+bAabb3hapRxs8U4wdxQ+i+mVtFgvd0ORD+7cfAUstpl2AnJ3IjZEbfduJWd/NILhMcBlWio++rpn7pYRoEKF/4SbE8T0iP6g3D3OX74ut9zhVsZVQziS7o7F4+D2F6mq7mcy4n17pjCaB1aPvIdg8Q6f4hI1yrPMd/8teYWp6ptSQSr2VmFgmeSRsFPz0C90m52IUcQCK5sjXCGpjpwYPY0NpvGaO9idZUYXjW39KjgV+oULwFaiFGrib0XMgCxkLP5Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MW3PR11MB4698.namprd11.prod.outlook.com (2603:10b6:303:5a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Mon, 1 Nov
 2021 09:17:06 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::455e:9cfb:d106:4480]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::455e:9cfb:d106:4480%9]) with mapi id 15.20.4649.019; Mon, 1 Nov 2021
 09:17:06 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libssh: use https instead of git in SRC_URI
Date: Mon,  1 Nov 2021 17:16:54 +0800
Message-Id: <20211101091654.149227-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HKAPR04CA0010.apcprd04.prod.outlook.com
 (2603:1096:203:d0::20) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by
 HKAPR04CA0010.apcprd04.prod.outlook.com (2603:1096:203:d0::20) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.17 via Frontend
 Transport; Mon, 1 Nov 2021 09:17:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a74eb6c9-5ada-450d-1b9f-08d99d185fa2
X-MS-TrafficTypeDiagnostic: MW3PR11MB4698:
X-Microsoft-Antispam-PRVS: 
	<MW3PR11MB469805F465FBB9F54D2EA22AF98A9@MW3PR11MB4698.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9L18/9Pc8n8RYhgZYU9c9krhRyjwPs2XBC9K9V3FkSi/ycwr6480rMZc3pQ6xO727L7aCGXUaP0DWdVzEC+BsRdaUnmCCMXuZ43qF3ui4MFbCie52sBfo8RZnPaow+tm+lcK7r5jmhlBbagQj/BzZx2gA8CGCXm/wHNVExsvdkTYqTwiko879s9ugmMcleF8R90uxqrAyeWDyIPk5ZId90lCgqmYuZi7TgzfHb8iyjyESNKjVjQFuzyCG/P6LyzKEMN+0CzTeVIHwE2i7gs8VmZrlZgerSJ9Y3r0/wg+jQINNn+xUdes2zvyLmvRkDXCZvnQz4hfkv0OvdrPCz3XirlKXcL4aaEu/bGHcZq6P7/3a5fxL1KRck8ii2n1nQ1XUNFEeR4OGhq7Zo7IF0y++Ux8nMB9okMGusRwU7M267qLrjpSBwQoHGz5jVhqgKDdpSN/Cq8r8O/gFjT5MlGNlTuzPQqHWYBw/lV73n82eME2+Qc6cxq3jrZxpnhmAAR68aJPKxBNCUETXgGC2gMYiMFLb6u2b1v1bTITHtp6Q7tmLXXIrXz4f7ShSEqLgaEQpgIJbK9Uk+rbkKOfYPYf4bPnHqjO+P/QYUFLjwoqAgEoMk86jgrbqmNbznFGd8nFU4N9b1OoK71p3O3+gq357wnX6OpjHblAaHbTwbeavBbkxe/g3LnRwnQxYL/hSpEqzkNYxnyZORBR83XomOkCVQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(52116002)(86362001)(8676002)(5660300002)(8936002)(2906002)(38350700002)(38100700002)(186003)(2616005)(44832011)(956004)(66946007)(66476007)(66556008)(6506007)(36756003)(6486002)(1076003)(316002)(26005)(83380400001)(6916009)(6512007)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+tgSHMWSqQZsZCsuSflMpWHp4ddmKAUwq/G1S/F49iF06BngeMkYv4UqE+6e?=
 =?us-ascii?Q?pZNBlNrmIyBtj0GVVu2g0n3Luf1xkiCGLRYJgbidqL+E9bMQsUInAs9Pe/hG?=
 =?us-ascii?Q?T0Jug1wJVxVIt2TvN9pMmouN5kCnfvcYwF+SyhCdcds6zTP9J+aibiQcwpr1?=
 =?us-ascii?Q?PBicZjm9Jkh9dR3O+I/lEUjasYv8rmQC8mwbanIrkbvya92k5gF/+QtCqsjS?=
 =?us-ascii?Q?bdhMgOCA9MTgHF8lgRLHylRnN77CqxiOaZD1ks55joUmS4eO3aaPbVoUDaep?=
 =?us-ascii?Q?7bAtBSmOfEQPeXPruOVBkFyHcnxNE+X/QY3q3IQbHGLLgNlTZfW/ZfHYlLPW?=
 =?us-ascii?Q?cEbijUgCM9NmRrkld8XY3hdQbSdnSiFoQE7z5SRUsdC2yroJ4bjRGFOIsdh8?=
 =?us-ascii?Q?zcJnxja8Hy1AMgUa/HkVSwUU2rq6Cqds9QYuOlx2gpEeulbHv+xusI1X//4+?=
 =?us-ascii?Q?r58XanI+6c5aEU4UihQqZj2LxfXR7NDXs0i6En6kP560DktqMt/0J+ICZQQA?=
 =?us-ascii?Q?i1KKU8srUPRXkfFrhaF1LN1AeBdxFqOxIXZgDRPkARJxyR83h6pDVblno+eZ?=
 =?us-ascii?Q?k5Y14e3+jL2Sx63IvF4qtRNU9UQBVPcPCKDxXIti5JoUvbT07ooJ+BJ635W2?=
 =?us-ascii?Q?zc6r9/3jQmwuz9TuRk0V+mO52C9bFVePEfv/WL6q8o0S1uxwFKt3K8TdG6fl?=
 =?us-ascii?Q?yGbbbK5yNea+jhIGCm3hsn7N8nkQG2nLk0VvXfCWv68TlHiyAd4WubOOcpdt?=
 =?us-ascii?Q?XVa15rND+LfkMEnmEIoO0EN0iHBsaT+m5pUUnsPHRnbDQcEMVA2ffPIXEcmH?=
 =?us-ascii?Q?uFTsU52XBAF77WbpJPZCoT6OzbW869YXLNGFDI0B2PrJW10yzNomnyiLRPQF?=
 =?us-ascii?Q?tFydS0BpifNuBw9vLTHOCen0ysLQbILEQASX5coVYoXsc7DiNSzj/XytTkwq?=
 =?us-ascii?Q?Gx+MXEk0Brcb2XdeNO8QYicUZCqxVx1FLBB2hiqxqOjGsITeazJEW7k1PTvs?=
 =?us-ascii?Q?ntYYWHmEnhLQ2HaiVA4bmPZKS01fBwsKSJd2iftyXVZhv+yVBXpJeXYSv3ph?=
 =?us-ascii?Q?gInWddyRfxtT2p4wQ7nHaA6vAoHeES+Dfq1IUiOr91aj7gI+T+kISHan/DER?=
 =?us-ascii?Q?pAkDvOPWLI2YSBnwwYwnZ5Es8xZKiDzKMQRURbOXb2UNBLDrVDcdpWuY/vFS?=
 =?us-ascii?Q?lN+OLJufabdIFWbuEBCt4w5aCwuUNwqFprE5f6liApIdmYkt/DG9acL+iqRm?=
 =?us-ascii?Q?gitFDYVHQAP3A436qzizUe9HDBxQYpfzBvRiGpBn2sAMa5Cpmy5d5iy72y0n?=
 =?us-ascii?Q?xRls07vsG78ybuYR+6utmDA1jT9v6cnckJI+snClS/OfMXZzNXA/w1ER8dBe?=
 =?us-ascii?Q?2SlStkXHSJo89XS0PwlGJRaBY2MdxLp10aX1YdVg5aeg0ewsCuFUiUf9ZZEl?=
 =?us-ascii?Q?JORi2ahaKfBz2EXmY5GwrOqoVKH+mByKNgH/O++5jnS5kR03L7f3KA1C0q0f?=
 =?us-ascii?Q?hSw64ZlGf8p5AayEu4/v+Pf3rv/u4aqQMS9RtxlNk/ai5T+er7rZQXdQ+zja?=
 =?us-ascii?Q?TV699ZgNDo3DDmLn7k1AB9A2KO3pVDo/LJrSqc+/Fww3R1jY7XfvFiDrXmVj?=
 =?us-ascii?Q?ZvwFklMKKTxDOY7FYMKB54w=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a74eb6c9-5ada-450d-1b9f-08d99d185fa2
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2021 09:17:06.1559
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 WywKWSiKwBh2U4j+dmEMTmSdQTtQ23DMnT66UWr3iMxqEMskMrwGgpNsHwkyExGk+I17n6MZLwPVXWcf9OqrrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4698
X-Proofpoint-GUID: QEzP_tIwTnqNUS6sJPwFEudXmhPmQnd2
X-Proofpoint-ORIG-GUID: QEzP_tIwTnqNUS6sJPwFEudXmhPmQnd2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-01_03,2021-10-29_03,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 suspectscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 mlxscore=0 mlxlogscore=646 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111010053
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Nov 2021 09:17:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93694

Set protocol to https as the git protocol doesn't work for this repo:

$ git clone git://git.libssh.org/projects/libssh.git
Cloning into 'libssh'...
fatal: unable to connect to git.libssh.org:
git.libssh.org[0: 78.46.21.5]: errno=Connection timed out
git.libssh.org[1: 2a01:4f8:201:2294::2]: errno=Network is unreachable

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-support/libssh/libssh_0.8.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libssh/libssh_0.8.9.bb b/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
index cbda8b7be..67d3d226f 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=dabb4958b830e5df11d2b0ed8ea255a0"
 
 DEPENDS = "zlib openssl"
 
-SRC_URI = "git://git.libssh.org/projects/libssh.git;branch=stable-0.8"
+SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable-0.8"
 SRCREV = "04685a74df9ce1db1bc116a83a0da78b4f4fa1f8"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


