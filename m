Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0746ACCFA18
	for <webhook@archiver.kernel.org>; Sat,  8 Nov 2025 14:12:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6223.1762611167498979524
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Nov 2025 06:12:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ek8p1WXB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3407a683bf=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A8DmOUm798247
	for <openembedded-devel@lists.openembedded.org>; Sat, 8 Nov 2025 06:12:47 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=8kjdNWiY1GE78eTj1ycL
	K3amfsK+4P2jdXXA8pB6owg=; b=ek8p1WXBkxqF+QBH/PMsphQeVNlUqukcxMGt
	BAnTH2BiSdzOUXcH3yJp2dv7CFN8YKYGJJYFJyoiYmymsJR1LTanK28xVHXjSSWV
	FqWEiiwNQsk7ZSikSVERh13ac9sMQXDIYsJ4SbU3VvwRSUwLiFwm6sJk0aXSH3uY
	Gf5RRGA3NPMJx2jjOviirdXkG3Hwg5i3J6xTCK6tZtHGAxZleKZjBfRjUoRmojce
	Q1QmXa+NL+mpYUeYHYRcHTkdzGF4h5uuDXIHhBiZEPjcrPiBy8NjapeB11thWYgy
	BadD+3fy1cRTtGX0JGozsCiUKwxIvNhf80YpXA/enin9wnAy+A==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011020.outbound.protection.outlook.com [40.107.208.20])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aa68jg19a-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 08 Nov 2025 06:12:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=acEWgN+RKGAf0cuJ5+Y28eYev3O8L7cehhEfPed++KmCHYY6zviXIorNQqOmOvkHgr0sTwzCFimltUfI0EcOt03qYy3cbK9uVbKNRQXzWb3vH5QrK8igLnoC+bMDEYFjmbuHKLWrZEo7FT5+SX40k5NPEyWK4eOpZFg7ZSOZSIvnghYXK7DKZVI3YMPJnkbGYwN9BbxXI2SVSR71GjPJ2lu5yyX0ajkmIx4adxcjl9jMYNsreMoMWU4QXHapfnn/Vvtuh1ec9vAfBRViwDt3IMflRdlXdLtIr6puJDKS4jbG4aVpKzau6j9ii6G0+UASosF1bNvvsKnjC23MdHkuJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8kjdNWiY1GE78eTj1ycLK3amfsK+4P2jdXXA8pB6owg=;
 b=rFjz8B55B3BywGEM0YuMQ67UeR63XkTy9feAGaSbMNvxPH7IDmPRG3nMm1twSFuYf2ovps0fT3golOcRYF/BocAycfduzWKlrdcdl5axcfVpYUzhjxcqBxzRN+J8HlbFs5OzLjK3LaG2ggQcktzReIR5DivZvLhF2iLWbYq5StmEMVabUQc41v/7lwU6QOD5ZcPP7YZKAT9RwQVHmH6AoVXpO3sUf5lz911IT9oQ2GDkeJ97h9pIuTOt4dSrtEbzi0+oqGT270v0l4OiVJgGNXgK9GCQ/O+fOGTfADMJ8DB89nJmTP3x+DQaHOz3n6DKSIZNstKzjewHtOczMcu3zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 LV1PR11MB8817.namprd11.prod.outlook.com (2603:10b6:408:2b4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.13; Sat, 8 Nov
 2025 14:12:44 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9298.012; Sat, 8 Nov 2025
 14:12:44 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-perl][PATCH] adduser: add UPSTREAM_CHECK_URI
Date: Sat,  8 Nov 2025 22:12:29 +0800
Message-Id: <20251108141229.4045692-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0024.apcprd02.prod.outlook.com
 (2603:1096:4:195::18) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|LV1PR11MB8817:EE_
X-MS-Office365-Filtering-Correlation-Id: 742fcc7e-ce25-47ce-8b3b-08de1ed0e2f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?G5/OpbL+y+bX/qa+ePN8jAe1aLVRRaaetTc/QGPmI1wc9cRCWBVHjghzmAOx?=
 =?us-ascii?Q?DOE2RAnvXHiPmsWvqJTN0kHDtIMkJlP+SvPt2RLb+ZsLhS93cKnkrsds5Q3B?=
 =?us-ascii?Q?4CW3HfELnNIWK4yybsv9iPvDI6k+gKhKG2lBbIuOpetOOK8GelQ9eB5+drN+?=
 =?us-ascii?Q?zzZqF2nT0d/N2chXknfrNMoqYqByobcMAoV+uuS8FTl0ONul96lABseQ2qP1?=
 =?us-ascii?Q?lqL1jvonozea+d2S0EpCYJRUoWhcQcPm+NWO1cW1QLJVhICWTRur8CjgEODN?=
 =?us-ascii?Q?pvn+WqMaELFqTPg6RL847clzllDqgocyGrmD/0WItU95WEBG6oEglub6nu6W?=
 =?us-ascii?Q?uAi9i0AsuICL6p83s3WTbCFg5dsAWP+HGUVuzc/HJipNki+XZJuTOHgfzv8f?=
 =?us-ascii?Q?xdKll3vXRgHv2HIr++1cMij8ae2ITTp2ZD7dWsbMPjQN9TIxvehwiZbJQu3m?=
 =?us-ascii?Q?3lT9eyuQQPNN4p6aaaFbYxjGxlmRlFKAFStbcJ7cxisSJLl/5jffkxztEBxX?=
 =?us-ascii?Q?dFn2LNE8AydlwwVsQ4KCcYuyLJkKLsnLfGKpaHZgEjPn+p6TX9QqoRK/GrH+?=
 =?us-ascii?Q?9aDf1n1RwUNXi8Mn8gAkah9gMfjcsM4cTb3irAp6CabB8FYRC4ZcdM2dduc+?=
 =?us-ascii?Q?CMvJjj/PQ8fZcKFsu2/xV3mYZdKxI1i5rbAHoITMvILrF0yvQueil/ROb3RS?=
 =?us-ascii?Q?gwMDzCF9D6RgKZJt2KjKSU1SnVst3u2DB0FbhaOGey8X79WcT4OA5twl+ijE?=
 =?us-ascii?Q?INyqeksLMAmTr6KG+cNJ6GXoNC+wrLWmZ521205IIaCg2imPbT3WFLFGIOE2?=
 =?us-ascii?Q?TywTPwmGHMHVdgcrwGBDgff8x/u6xoq/g5cDEUKYUFgXOghRU7VS+UTR99Vf?=
 =?us-ascii?Q?EXxB91BRqW6uFhKQaVG55ExR6idBrQEo5bj7ORAF1DdvO2qmEBSP3b+o18ji?=
 =?us-ascii?Q?YKGq5VxWA89D7vS7Q65geqsM/XDGZp72/IIjsbP41I6nuL5Ipz4XtN63gMsP?=
 =?us-ascii?Q?11yAYtL0f8FBbppE0c/PwPYpge3JyTxbPUNMzsG4ZOeLqp6WeS6daiQbZfLE?=
 =?us-ascii?Q?KWOV4XhHA8UD7jzgv2CBmHSiX0ScFmXOomXcG5q3WSZcKtBjaMZf21X94EKn?=
 =?us-ascii?Q?cG0pZ/pAez702mES2/DBDBwfsXs5mLOMrUqAcw82Eq2rW+42bptOsdy9owr+?=
 =?us-ascii?Q?33VyXvfbyCw0/TxK7IT1N1OI3LxPwRU61I5JZvZeC3cVytAErc/qoMQrDz61?=
 =?us-ascii?Q?hc/egu5NmiCQR2isNXTn0iJdq8rtQWr0FYk/iMhCGMWaat7K/JMUCl69Mdjk?=
 =?us-ascii?Q?mxCkNIS1RTcvqA8+wDb6rS36Vn+sYvEsieGGCwOp+6ZAbgwalpbYCYqJYdRJ?=
 =?us-ascii?Q?tcIDjulYDwBsi34mZNKZv8GSbldbvsVW48Zzly27r9TEnTnUdZEl6vCzGxWO?=
 =?us-ascii?Q?Cl+lsSK2bienhN1GeXzYQv4IHFjsX/9XA7k8LflTWsg9Z3XI66zZ8A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tODAL9LXkAIOkLJIHcIjxw1HYVPLPYmiSJfXlw5Sez2vzTWFVzyhHeleJUiv?=
 =?us-ascii?Q?wP7N/mVSPYrld+0TCD/K9yz8U0Pe2O5ShbFVl08vjGZocoiZOMKFgDagaIMl?=
 =?us-ascii?Q?vW2GXolM5OIhnkzLusazcb4hFrMkNJdnG9wR4/Qhlxny9bfUiWWiSE/Tg+90?=
 =?us-ascii?Q?XMHjM8n3Vv9X3XVYCSXLo82lw9N6LaQW1qJh3Owr4V5CcSFbnPawO+hhd/4+?=
 =?us-ascii?Q?jU2/+dAcUdi4bYjtS2yhUeU/CxvjprhYuVvX723i7hX98mJfQCiSkou6Lgyg?=
 =?us-ascii?Q?QPm6rw3umwpsDAq/2EIQDMIBn9s0dBgY4KF6uYLgqv6vkx09HCCQtxRigi/Y?=
 =?us-ascii?Q?ES5fD5XPaqNqZxnktPTWK/D1ed/56ABcbHtEIsXlXHKX1Bz0fxGR3YuwdYnR?=
 =?us-ascii?Q?FXjZzIBYoj2/qlT5EAg6HDVOtg3qYRREcl1R57ldux6ymU0plJzzHietEUzC?=
 =?us-ascii?Q?jhufIGewMA1+YwNu+6Letz9rpdhAP+6l6h+bRvBWYwjR0F20T5ZeV31q4kSk?=
 =?us-ascii?Q?o8R8QMA7TkbnlR/n0+6ykvV5pzUwqf0IDgkfWrZ9r9yDq6sydwPn5LdZF4G6?=
 =?us-ascii?Q?5eOFzLrZM33Gu57+sWKP5efkMj4uwtLkGYpYImDQENPgkg8sj7G7qd9WX+UW?=
 =?us-ascii?Q?qFSLHC/cMB1IXAvyQAZsv6LoEFDCR9n+TFgsQy0A8jxhmehJ/wKVOw0w9PbT?=
 =?us-ascii?Q?hu/zZYg9Lee+QiCkjhw3YGereNkAA1rHDEW2/iiOKdGHj9Y6FFPq/fsN1mTb?=
 =?us-ascii?Q?TZIJSlgXdYVS/p5/7beQbcu9f8tKosCR+QhGPIWtzzdrHJ8jy34WfP2tCaPQ?=
 =?us-ascii?Q?Xw5n1iQ9dwWxlF2CLeG9iIHVNAMb90wEbmswf6H07RJB2ABv1kbkM6QnJChY?=
 =?us-ascii?Q?TP5ae0t5/qx8pYuycZMu4xO17oO9X7Ub2pvf0zRG+ACJCXSjAzPOl23vY1pa?=
 =?us-ascii?Q?OY4oRvKaGrhCInkPjBnBtU5rXu+H13UymRsRpBc+maR9G+y7F4g9ryVXUqET?=
 =?us-ascii?Q?pSnmfgyQk4R2Hh6QAzL9zu8R17ufitZNekouZ4fyv5Xp3bGcfAHeH2ArR/Yo?=
 =?us-ascii?Q?CEeN9wqhZdO4HUI4lccYu+G1pBFXV4LUxwatdBL/EyIkEIE82CEzGYONNvoY?=
 =?us-ascii?Q?LDWd9+CTUIv/trc/Rsr/xsMGXq1tD3rA7s0sKIQbvHcrCleez7nZaV78GJiy?=
 =?us-ascii?Q?7sLLjTfkFxA0KAGhvrJz+j5JHyBsq20tcEzFa6UCf+OjSo3o+VR4SbSUzs58?=
 =?us-ascii?Q?/1wDKwdQmsN3V3bSqcxz7kf35qrn6iE/pnd69qjVp0HpFtwcFkFPjwuFGBoq?=
 =?us-ascii?Q?aeP64ySlsTZNSCSndOhKAhTvi7qHmklhWPnufVaVCPc3nrblGKdz1gIdGXiF?=
 =?us-ascii?Q?xdk3drJMuKWKMLMQGlXTw9ChZiWjo5rMJtBUrwTJyb6acEaKZHhcq+Ca9aSC?=
 =?us-ascii?Q?DkIA3fP0N/ixnAVFpwsRbr6vYXAwxu+q5vqykcMTVWSClECuKJcSgN1e1yFh?=
 =?us-ascii?Q?o3dtplBq3VUPLqbp1VYPh4hike4HmwnRDp/EXogUeB4sVzwvIbK4JUi55Vj5?=
 =?us-ascii?Q?nZ8bVU07cLGdcB+CBfmE1PWSc7mQN+yjOdlroq4D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 742fcc7e-ce25-47ce-8b3b-08de1ed0e2f2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2025 14:12:44.6154
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JWzxKusn74OxhMGaqY+gMfjdedUtfZmlKZ3WfwuziWTX6vkyUP9YCOhnLeSVc8dLzlnoSFKmRBXcdPTO6ew5tA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8817
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA4MDExMyBTYWx0ZWRfX0u3uK9Qr6vBw
 dSgK8VEFwZAjluWcJ7mWmlW+RjhfPNWCFLBrzJTNuIQHXznjSyx4sj+dCTvIyliI8BEZclAgAcb
 XCh/hCpXWoiaih/VgQ+ayeExKeV8bxyOo2naZjYwzCMwYiLrMHnjdPGsjytzDenit0wa/jnuZf0
 kBcctkT7RgaGe+nE+c3lW4fWpWx4sFIlo01Gqz127TopRCV7Xhy9syN/ZDqnuBbxGyPI8j12XHS
 dgjbETTU50eoMZh6SJzFohvYmdGMMNYga7e7YG2htXho8kfmhrGSOa93EzmfmNWxt5PdQ2INaKA
 yeLX0CIz3yNqmKK9bP3ZgFyffwJ1OKBpOa0UYLtXSD22ub2FnkRKEg8D4mMvqMPKuB2bdOaEsQQ
 eroLY1PlM4rTmuoXNDJoBiw50ckGrQ==
X-Proofpoint-GUID: IlLw-yb_JL9xSnPlbzT8yvln7SqmPcYN
X-Proofpoint-ORIG-GUID: IlLw-yb_JL9xSnPlbzT8yvln7SqmPcYN
X-Authority-Analysis: v=2.4 cv=ef0wvrEH c=1 sm=1 tr=0 ts=690f4fdf cx=c_pps
 a=KTjCFeyF3Vp3atYHcTGfzw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=danhDmx_AAAA:8 a=t7CeM3EgAAAA:8 a=yloFkKLnbbWVK1agI7MA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-08_03,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511080113
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 08 Nov 2025 14:12:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121383

Add UPSTREAM_CHECK_URI and UPSTREAM_CHECK_REGEX to check the correct
latest stable verison.

Before the patch:
$ devtool latest-version adduser
INFO: Current version: 3.118
INFO: Latest version:

After the patch:
$ devtool latest-version adduser
INFO: Current version: 3.118
INFO: Latest version: 3.153

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-perl/recipes-perl/adduser/adduser_3.118.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-perl/recipes-perl/adduser/adduser_3.118.bb b/meta-perl/recipes-perl/adduser/adduser_3.118.bb
index 9718a2ce9b..2fc03ecb94 100644
--- a/meta-perl/recipes-perl/adduser/adduser_3.118.bb
+++ b/meta-perl/recipes-perl/adduser/adduser_3.118.bb
@@ -13,6 +13,9 @@ SRC_URI = "https://launchpad.net/debian/+archive/primary/+sourcefiles/adduser/${
 
 SRC_URI[sha256sum] = "3e9eea661c9aac6b2c791bfcc1de3a9c6a422d45c8f3d38ed417737ed3166ffc"
 
+UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/a/adduser"
+UPSTREAM_CHECK_REGEX = "adduser_(?P<pver>\d+(\.\d+)+)"
+
 S = "${UNPACKDIR}/${BPN}"
 
 inherit cpan-base update-alternatives
-- 
2.34.1


