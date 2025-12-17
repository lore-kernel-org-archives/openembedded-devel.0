Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EF8BD6407C
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 06:45:44 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8841.1765953943690612642
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Dec 2025 22:45:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=KKfhkBbb;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4446ee20f5=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH535RW1076109
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Dec 2025 22:45:43 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=LGnFEE/kBR7menQpsaad
	qvY8tmBFpqKtpVlGFCwkT3M=; b=KKfhkBbbmzitLHdAcN5lq6ODJEK934Ni9ayT
	h4F81BSi0r4SdZV7/q2R4tXCTp4eBOnDBrLwwjNWbf3ELOOww6dq2E1SXr9d903U
	CxvyIJgwVT9jgn2um4Cnpc15vk0FjEuYgFuXhrdjZFrJdT4Gr0h3rp1d9wZ+PVzL
	4pLSytUZNd3fPpyC5bzKJEKBrNRjYBYzHCq4iG8w0aSsu/T8jnDQX6qRZ6Xz3BKG
	lR+omKyIOxp+cyOgQ2Zh9bUsGmcjT74aYPj/OY3AtsLJza1240CnLjuSHyQenCse
	qTx0tCr2w1ptL6WG07YJmijb/F/qzoEyFjFMmamOSL6Iky7NfA==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011053.outbound.protection.outlook.com [52.101.62.53])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b3k6j06wh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Dec 2025 22:45:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EydFZbX6hUCp8UcBHMLlG+xysnKCDm1G6O/y5Hmp/YEf557BOoLtE2IzPHFJv2gqQAipu+DBuaDE29H/e/+dAdkSzZfqLXC7fUKelNVB55Woa4XflZsGxnPlViPeSDrXYyLk3yC0DGlLTnmDjcEBpLjTyk/Cf9wvO8aQ2jLlXhFtkeHNlFjmynM6IpvbBokvXEJemeVIFz1se/HGZaoz3s/1W9hdbCBpRxPe7WjUipfppRU245MPd8K/43suYUfFAlm9TmEkWtWQKbVZrF0b7g3OcR71PL2Up+2hSjCwuwFyKJrqF9bKB8OyTWnyyPPksIuFV4Ahmin2vSAtnNvBUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LGnFEE/kBR7menQpsaadqvY8tmBFpqKtpVlGFCwkT3M=;
 b=D2WqjdHhRmikHlVmTZcPqdw40pXWBZsJxuv6ABftk8iSy0R8YzhmUDPxfIGAq2OQEX/GcpaccQzCMm80bv2ODmnDrbkXPva3KF55N5MXIgnKSdjVJ2gW74inEyerptkM10AFly8LSbxlKWSgahdt0rYgUcZq4KT2D1NzBUuXsXaqf5RP0HwrzNS+r+wXii0eryxLxVzHXeYi5G8PX7UALgl+COuxscu4scaM5FKJw0mP26sNi5j5PyZFzxti08Ixay0t3W0EreLlmwte6lkt5MwxQ3ZykSIJfvSSVXzMb0QOErsqwFbC0sNbLHpDYvGmK+DdtBv0Oog3G9y7v+49Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by CY8PR11MB7169.namprd11.prod.outlook.com (2603:10b6:930:90::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 06:45:40 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4%3]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 06:45:40 +0000
From: haixiao.yan.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][krikstone][PATCH] python3-django: fix CVE-2025-64459
Date: Wed, 17 Dec 2025 14:45:21 +0800
Message-Id: <20251217064521.288044-1-haixiao.yan.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0189.apcprd04.prod.outlook.com
 (2603:1096:4:14::27) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|CY8PR11MB7169:EE_
X-MS-Office365-Filtering-Correlation-Id: 0def70d3-7b3d-4623-d120-08de3d37e473
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?4UHqfCCsYIj+M2mesxLgr1aCYXi4D4MbNagZdJXutS9cvZ7FePydsmOPuY/L?=
 =?us-ascii?Q?NFsZZ2+1tSnpKIhICUCbtvpHvwqQcSGNF7bmcGZ1Qn3fjE9nsn7qPs+P7oh4?=
 =?us-ascii?Q?nnMM9u+yAUHuoVqZQzxXonSd1TQSb4GDKZcwe92CCx9vY/LZJogbapIcXcYi?=
 =?us-ascii?Q?EE3MEBAc+rEH/mxsaywdE0IT23+zROh+QetmM/RjlyeaofxAU+jgsgAi7VZi?=
 =?us-ascii?Q?RszbR2fS1yvbcx2qlRySZuJSLRjYTkfNF3a8SZLhmzhYyUIavbiR29U0Tgls?=
 =?us-ascii?Q?LjHLvU4xseitKgc7GVPzGzww+YSlgArY4zeiMtt6qZRxM/1mQfPKRFVub2J/?=
 =?us-ascii?Q?Wag+V4hfmGVRTDabuOtif+x8Rhc1gIufyz8glcTEIX30S490zin9SCiu4/FL?=
 =?us-ascii?Q?dg359OZAMrpYL30OQ2ZfXXdUF/MwYB/qqSv1VOMq0grtPlwsHejZ4cEvOMrQ?=
 =?us-ascii?Q?H4nOtzAaVGSG8Ler1zElRju8OtiSZsMCr+etVaoRiVSmpGT9f6NAM0qsoTZf?=
 =?us-ascii?Q?WPOLSx81B9Tst914I25TkkSZdN+ytnhknoiDWJ2yZ5VGRKzTW6Y3Vyr9GB3R?=
 =?us-ascii?Q?abcAnfh2dH+SSIpPMl3G+RLHF6M5ATdMDiJ6zH85ZHtgrbxeHx3dgQA7Ii6S?=
 =?us-ascii?Q?hr/mIrCaB57Oi/yLAfR7KaY1BRxWiYfyRWGGDqU+9Tyi9VFQIVL0mwmu05kc?=
 =?us-ascii?Q?l6cqmeN3wQfxR8wOPbr4KWymnXMJfgDGRjNsA+vaNEr8EWThvhvABunITDtF?=
 =?us-ascii?Q?ZZYEn9WqTrCktkNdxzbh0rSb+aQm998rRiESNBiHV0yobXTP+9SLbLhbRMx3?=
 =?us-ascii?Q?GGH4SCv6ML1IDWFlFF5GPF4Aj1rFThcFsvaVMyFjQgD+8/voTRgidypGnxIf?=
 =?us-ascii?Q?EDnwOPQyqye0UsMA3ukofydZpXkLQWEPX1Ty1s1Br7msE5TX/4kXOBqN+zHe?=
 =?us-ascii?Q?0THs8r/MvzaxO2c2wKwUWdBTGtYgLuoupckJeeAlMKnQFLpQNMPCWnCRAt8w?=
 =?us-ascii?Q?B7j6srMkarYgGpAVJvEtYVBnlNRRmgsIj4XQ/Jm7dRhwYfMLOBnbmPRwcdJl?=
 =?us-ascii?Q?7raqYW+MqYM5DH7X/6UyhmTm+Dm/omypIychlQ+9VQTknXT3FR7s2IiaZPFS?=
 =?us-ascii?Q?RG2/GpB9LW5DSFP78kcXFR2ihJRG6KMRkJadu6E6tKw2+UMMUvdZdInM7wsn?=
 =?us-ascii?Q?Z7qRUI2cYxvg6GrFo1t1RKQQfhDS0/b9dKX1wQgfmKVJ9KXJf2kSgYkkiQGE?=
 =?us-ascii?Q?Y0X73fynZqYTi74iKQEMmdWYMtwcG5TyI/u3X8kM24ndV5w3/D1LyxFhgXOd?=
 =?us-ascii?Q?T7EBIPT4aHRNlgqsA5XLtf5C/DDtf3Zpzsugsjm56Q2PYDv13D8GaBR3UwyS?=
 =?us-ascii?Q?bT2OHiw6MMABUz2HquJW7iwpw6v8ys1hBJQsTySXneHu9Zs6vOjmo7IALyCs?=
 =?us-ascii?Q?Z6UbIh1j2c2zMAC83hIxLX9nRetGqk2cqfeKuBdo9sjFyoZl04bFaJDokuJY?=
 =?us-ascii?Q?wQlwpk3DDh00iBWfaQwwIelKgCmyzH+qcWfdjivHU3r48hjNxDoDRkVhHw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kwVJRPXlCQNg9WABZoZD/eU/0iJMIDlT301k45mxGBSA3WIfX8Tixf5MJLuJ?=
 =?us-ascii?Q?lwYZar3WnuKd/9iqAsGDiKSwLP6Nwz3SiiK9JlQ968rbIlSWX+9r15c78e/O?=
 =?us-ascii?Q?EaEsg3KV2FcXV3gmXL1cuqmvFbJOg47PUWNz4WfCE9JtVeF1Shg8mC00638z?=
 =?us-ascii?Q?ygadSolVUAvgUNhu03o+7rKbe5cGU7fVeoXHrHTF8Qlnh6f5h0f6wqgn9Qoj?=
 =?us-ascii?Q?99yeM1ZkBI3ksVhEhqX/wBGB2JISWCMRfR3cUBxpseEBFViuOg11eBNVz8gK?=
 =?us-ascii?Q?2I67FG2kfAuFnvL6uY6cCmY73ohYnPw6khei8iBLsWyxQ1uKWJ7rseXJl/fs?=
 =?us-ascii?Q?dpmwIBv7PKVqvvcmdVkZ93G+k5VBmrN0DibsABhf8FqJ+lNb6Q581TZf5cL4?=
 =?us-ascii?Q?z1zUXTbHmRI9rcIwDgI7MdxAO8BJssXBo7e4d1cV5vlmM0TizjLvmzko1kUt?=
 =?us-ascii?Q?TQrQicKP3fMnGDDioSz4QrWUjEijNFqpJ1aItFfM8ejvTws/6RoEeowJYDME?=
 =?us-ascii?Q?UuMpKLtZYNcLOQnhdacaQ9JcX6Md3Y1Qa3AuuEVwPUSWUmbmlEpNqd/7j1op?=
 =?us-ascii?Q?RnvJ8gvdf0Phxw0DMfvVfTXTc6PSj8ihpyTr4ipzwK/HHavVlfVL1v3TfnOA?=
 =?us-ascii?Q?uDyuy/a3SThDckI/B7jPVIeFAFEoy78sjBWwTWtDFRx2Thtwyx6L7OLZBRIQ?=
 =?us-ascii?Q?EXNwt9R4ty3Ds7aT//I4944RIzWsl3kEdn4ZzJUbbJQHypR8Ncb0n7aCt826?=
 =?us-ascii?Q?LSPhq3YDArmHOB2OZVQAizOeoakkjYSubj7bg6CafPI3sgJ4aa2hS3j7cpLm?=
 =?us-ascii?Q?0T8die63SDsjoc67R9J0pdS/QUB+syRw+duj/PoueOLepDE9LkFYaoz5sQ6c?=
 =?us-ascii?Q?M46VRzwOaFgSg2BmwKvbZ0MDa0pZMx6Dwdk5bR8RcYeQOmn+m3QMZ2h/4hua?=
 =?us-ascii?Q?DsMfTnmwNlZaZhzppS7d08I6VEIX74D23iQTw880CdRzcXsvpR/mW6hO2Fb2?=
 =?us-ascii?Q?DmChNFnUkIP06kVly3lJjND40kVzNBBuQtzJw+KR0oGrkKj6oMyDXucGfMkF?=
 =?us-ascii?Q?PTyWg4geBJpXE7boZyXKxzanyFc7lxKfF73NInWZeOxkp/lYwnV/SV+Dyq9Q?=
 =?us-ascii?Q?aPj14bO53QMXDFdU+qm49V0tqJJwUbdGkB3lN0MJAb5HRcEuZHe4gwjmqrwY?=
 =?us-ascii?Q?E2c82YSOLjJiqBSlL+3kiOcxqsBnkiHyK7YBPC/SoPRM2u8Cg7NLMb6Ev4pQ?=
 =?us-ascii?Q?sSYygkg4r4GZG9dSyrj+cLz50UERLkz/s2emgP82wjlkbn7n9tneAHeiiAyq?=
 =?us-ascii?Q?2MxhU3m7/R9bgRzybELF/LKWLaaQ5WFM2LzKvfbtMEaFehb/6c6Zdv3/xkJR?=
 =?us-ascii?Q?6ymGKbxNSyhndslhCySBD106Gre2YRy9/Nm1/mEyzWL3PfJqenp1nFcK9w7Q?=
 =?us-ascii?Q?8mKAxsmSoWwh7JJ1JU1mbj11hu6OfTEGFY0AF7ytOXBUm14PnnA/+y+qJfY/?=
 =?us-ascii?Q?CI1xbEvCT5ndIvSLtdK1Gm9JOAcGChCMlkaW+7Pm/DDynd23Ra0LSGMq6L9b?=
 =?us-ascii?Q?LGqgFoy/Ec1VR2+CaPiI7YNCXwjayOPME04+vJ9LEHpPhm6LA23zKo233e7X?=
 =?us-ascii?Q?0w=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0def70d3-7b3d-4623-d120-08de3d37e473
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 06:45:40.1022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ynhnqHH1i9YZW1zrg1DsX5tb1rsIGzKFn93Qhob/N1ww2EnKUvfyRQuFffqqRUVLy7mBhFJIoZWOC7tH+kvkDQXHM23EwTUAvOgGp4PjyYY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7169
X-Authority-Analysis: v=2.4 cv=ErvfbCcA c=1 sm=1 tr=0 ts=69425197 cx=c_pps
 a=9V9/KAGQR/RGwytZTnC4xw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=PYnjg3YJAAAA:8 a=is1M7v0WAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=pGLkceISAAAA:8 a=wo4LKyR-JYUo9BPPOlwA:9 a=2cHV6Nbp_IEA:10
 a=43mYI5ShwYkO3IWxqTDg:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: wuUduRomLre1J_cz2hAiv9T1KcZrj0MX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA1MiBTYWx0ZWRfX+JlK2zXLSJXf
 2G1eSxJJOxYW7sW5GFXHp/SxLCwwDumPSilbNcYCAGbueRY7poGHWcCCLMwK2ToIYj7Pkkeb4oJ
 pLzgQPlPvak4CPPaJvqHFqGV2hHU1zTL5kNdg8RBwdEGmpQ5Lly1htqoaaOdep5yxXPrrYeE7cR
 6UQfgEUKQ6sUcy+BLkPpV6QXUoIJoaYCMf2BR+FaBGptJjz0X63EKxNHTMfXagSYTHNjEJ4v/nO
 OOrsU4jLI+1+21GH+bDl3bwAx3bUURNvFnPSo8qBUs6HrV7nU9lie23hDXuFrJ0bSxiVuzsBRvT
 k1VpEKfYbAsNG5ZcpTHUATZ//hqLuvxZe8TwYSv/vzen96HcxzOJyox2OFCrZqPdeYI3IRJ0Baj
 qUIKZGegQj/pXRGjnN6MV3ioV5DbPA==
X-Proofpoint-ORIG-GUID: wuUduRomLre1J_cz2hAiv9T1KcZrj0MX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170052
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Dec 2025 06:45:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122712

From: Haixiao Yan <haixiao.yan.cn@windriver.com>

The methods QuerySet.filter(), QuerySet.exclude(), and QuerySet.get(), and the
class Q() were subject to SQL injection when using a suitably crafted
dictionary, with dictionary expansion, as the _connector argument.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-64459
https://shivasurya.me/security/django/2025/11/07/django-sql-injection-CVE-2025-64459.html

Upstream-patch:
https://github.com/django/django/commit/98e642c69181c942d60a10ca0085d48c6b3068bb

Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
---
 .../python3-django/CVE-2025-64459.patch       | 62 +++++++++++++++++++
 .../python/python3-django_2.2.28.bb           |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-django/CVE-2025-64459.patch

diff --git a/meta-python/recipes-devtools/python/python3-django/CVE-2025-64459.patch b/meta-python/recipes-devtools/python/python3-django/CVE-2025-64459.patch
new file mode 100644
index 000000000000..98b484ab8fb1
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django/CVE-2025-64459.patch
@@ -0,0 +1,62 @@
+From 3e356194ee1f5e144a9e9ec082b4331a8c0bbf7f Mon Sep 17 00:00:00 2001
+From: Jacob Walls <jacobtylerwalls@gmail.com>
+Date: Wed, 24 Sep 2025 15:54:51 -0400
+Subject: [PATCH] Fixed CVE-2025-64459 -- Prevented SQL injections in
+ Q/QuerySet via the _connector kwarg.
+
+Thanks cyberstan for the report, Sarah Boyce, Adam Johnson, Simon
+Charette, and Jake Howard for the reviews.
+
+CVE: CVE-2025-64459
+
+Upstream-Status: Backport [https://github.com/django/django/commit/98e642c]
+
+Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
+---
+ django/db/models/query_utils.py | 11 ++++++++++-
+ tests/queries/test_q.py         |  6 ++++++
+ 2 files changed, 16 insertions(+), 1 deletion(-)
+
+diff --git a/django/db/models/query_utils.py b/django/db/models/query_utils.py
+index f6bc0bd030de..e612ee8b1a44 100644
+--- a/django/db/models/query_utils.py
++++ b/django/db/models/query_utils.py
+@@ -52,11 +52,20 @@ class Q(tree.Node):
+     # Connection types
+     AND = 'AND'
+     OR = 'OR'
++    XOR = 'XOR'
+     default = AND
+     conditional = True
++    connectors = (None, AND, OR, XOR)
+ 
+     def __init__(self, *args, _connector=None, _negated=False, **kwargs):
+-        super().__init__(children=[*args, *sorted(kwargs.items())], connector=_connector, negated=_negated)
++        if _connector not in self.connectors:
++            connector_reprs = ", ".join(f"{conn!r}" for conn in self.connectors[1:])
++            raise ValueError(f"_connector must be one of {connector_reprs}, or None.")
++        super().__init__(
++            children=[*args, *sorted(kwargs.items())],
++            connector=_connector,
++            negated=_negated,
++        )
+ 
+     def _combine(self, other, conn):
+         if not isinstance(other, Q):
+diff --git a/tests/queries/test_q.py b/tests/queries/test_q.py
+index 9adff07ef2f3..0895be8535ba 100644
+--- a/tests/queries/test_q.py
++++ b/tests/queries/test_q.py
+@@ -103,3 +103,9 @@ class QTests(SimpleTestCase):
+         q = q1 & q2
+         path, args, kwargs = q.deconstruct()
+         self.assertEqual(Q(*args, **kwargs), q)
++
++    def test_connector_validation(self):
++        msg = f"_connector must be one of {Q.AND!r}, {Q.OR!r}, {Q.XOR!r}, or None."
++        with self.assertRaisesMessage(ValueError, msg):
++            Q(_connector="evil")
++
+-- 
+2.34.1
+
diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
index 0478fd3883fa..71186203e17a 100644
--- a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
+++ b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
@@ -24,6 +24,7 @@ SRC_URI += "file://CVE-2023-31047.patch \
             file://CVE-2024-45230.patch \
             file://CVE-2024-45231.patch \
             file://CVE-2024-53907.patch \
+            file://CVE-2025-64459.patch \
            "
 
 SRC_URI[sha256sum] = "0200b657afbf1bc08003845ddda053c7641b9b24951e52acd51f6abda33a7413"
-- 
2.34.1


