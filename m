Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6879CD13D3
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 13:44:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13712.1762955094203068947
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 05:44:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Axqrag2a;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3411d85ce0=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC3a6EC2219128
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 13:44:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=g89ZrbivGM6Bspo3X0+0FFJwZFx/LcW42xGG2jY+yYk=; b=Axqrag2a8Ke0
	68XUyl1FqyV7u3/6LK8dXyh9v/lVb7f6WqMv6G1vUNUQoNISvk3FFY/5tTOeRKSo
	vnjH18N2hovvamxdHIgkTFBvfjVilU0nwJQwfichlWHzjSIadIndQm8Q1NSgapkE
	5kRyqPvyF/gd8elTpTKk4GQuJZhBFl/++bp3NocrxEWs/hdioxbvoGSRK1QtJOVP
	aEvQe4790w28UQ4pyoFua6Nw/ePfkhisUpnj/LpFyPSRyapFaSSThCXMt0mWTLyC
	XqTRVogrjQ4MYX2OodiWYACX3yv8V5Ys5AneALNlYzx22BuDhNVJkaZ3s4d8A57r
	BLvEmkyDpw==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011041.outbound.protection.outlook.com [40.107.208.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a9vu958yk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 13:44:53 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lC68s+qSrpzzhfFuVVdtvD1An/1+eSePmpFhTgxgztMGBsidrsZCe9xQ9J3Tbhh67CJ7V0mk27aC9jCb5UvsIyFCDhVV7iGhmuasYMOK6pCVLD/x04TT6hIJ3tT70mxHi92BytQMPjmHPjAeYWlvY8h+tIpwvjmRIJDQf4HJ4dqemEnFdhsY4DPewiGQA0y2Z/4Gva9gEK9Llx9BkRisZVOhFyjmPxVEu0vp4RaBME0rG/yympP7d92EXA+iCh8T9zwf+G2uDHYuoPwL13PG/FcCS2dH3081f7ILC/2C2IqraWp/7wRLFo9qshrbw/GOKJoGUudCUYIxw409C7YiDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g89ZrbivGM6Bspo3X0+0FFJwZFx/LcW42xGG2jY+yYk=;
 b=tKzkRIRjk6kErpCVrMoX+7fTQUm8F8mz1qRyGgeQXf8eCj2I9gEoWnxAJuFbHFgbNntJSkhz/SaVV4qdp9zlyV5TBQgh4Hd2Q9EK+z5vq6i2I561NppXkMygu9b9WquJn+I5tFDpbgkXQ7yBvgWDHgaEkbdZigG/LmRbQDroVHaEVqPQsyS9JTas9E6QQjOQ5Hpv4M1VtzUGAR0TggC31nVeowCUVQTs5ogbLigS11GMtdJh+b9a0HOgqca6mbt2NvJWjsgJwJWCXld8gFwEHPVKQgy2L98R5fP8S7q+TKz79H+0wjfrwizVj62KqydVXRabwbfurcpeNppgouT/Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 CY8PR11MB7241.namprd11.prod.outlook.com (2603:10b6:930:94::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.16; Wed, 12 Nov 2025 13:44:50 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 13:44:49 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 18/19] syslog-ng: add UPSTREAM_CHECK_REGEX
Date: Wed, 12 Nov 2025 21:44:04 +0800
Message-Id: <20251112134405.3706508-18-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251112134405.3706508-1-yi.zhao@windriver.com>
References: <20251112134405.3706508-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0125.apcprd03.prod.outlook.com
 (2603:1096:4:91::29) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|CY8PR11MB7241:EE_
X-MS-Office365-Filtering-Correlation-Id: ed5db1e1-c51d-415e-d989-08de21f1a5f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?E8yV0s9vygu8jSzCqEcEojv07oDtpibtpv1Bt/Q0cSR5m+tZeoeP/a7efvzm?=
 =?us-ascii?Q?TG4DDyoTvTnjfa/yHmtLmTVbfno/JnXpNq9YuOLymdqDLklAXJnOUoS/dSxn?=
 =?us-ascii?Q?wt2jKe4TWjSn06mzyGqRw3+Gz0WFIZcM5PP50WetRZdcmKK285phZRckqT1h?=
 =?us-ascii?Q?of1eIH8vicaNS4JYOkqC5jYd8wE/0/xXok5xcD60cr/NmlJBzTQNNt43TV6D?=
 =?us-ascii?Q?zJH9XUdtu5kHNJiJSVgQR+g6hzCbseEwAo453+2Yh7zY2FE41FQhh2zm1Z3u?=
 =?us-ascii?Q?x9ehTnsxW609n4j8JLvPxX6/1BALlFWYdRbARlk98AbAfiM4djGqIWd+hKx7?=
 =?us-ascii?Q?qWxNZEUuWYG6MLtGxmA68NbcUug+A6EkDJqGuhRouV5Sc8+fyl/6BSd1LY/+?=
 =?us-ascii?Q?CDuaYnoQCLR1xSJ3r6jrfNWPNHy233Eiak1h1QuPUhmOwo1HTadyCZy2l6GG?=
 =?us-ascii?Q?1TQDJBDvtXJjFUj7HSCn1EOgsj5EACNKUKDypjAgNV6ISXTPijomdTqNrfzW?=
 =?us-ascii?Q?uaBuXzH+wsMRnoCB7lI+VPb2Ue3G/jWtnrbnUJb3FsrdGLdbeWmRqcZ/jrTU?=
 =?us-ascii?Q?qVMWp/vf7A7rY/e6nwKYqj0qXxN2zxa31EurAHX0wiamGggpnoYtsw2W4mDR?=
 =?us-ascii?Q?AK5p/vpHHEhHJUs+BBJ9SzKNTqBXscFvkrl3hD0GcF3vaUFIlON/zB9wd3iQ?=
 =?us-ascii?Q?5UCm9K/KPLhNnqL3Cb+0NYDLzr5rlMdG6Xsbdrx3uCZQjJ/svw9b/U8q0Fyb?=
 =?us-ascii?Q?TeVXpKt0ZFsZkQCzMB7nGP/qgXgiVywuRjF0kwTfYeE8MVifELl3Y7llk7u7?=
 =?us-ascii?Q?8BdGWy02zkFL15ragJIs+Myhaq70/OnrRIMGVbTr3E+m6FxwkFa7yUxn4epF?=
 =?us-ascii?Q?sMngBt8XeSBOhIe7xRM1BVZ5YtM11XjcefHjvKCVFwaPHrNUDR0zEVFC1KiU?=
 =?us-ascii?Q?xbLbzxQgKeTJOEB5vZlYe4NRoTmj/A02PulXeDmunW/J3l2cpKKubY6kZcQk?=
 =?us-ascii?Q?gjToN+MUkRRxGCG2RVngrkSJ+wJDagPVBjd7MoJ6Pk/MyMYr5v8WmxZXTx1k?=
 =?us-ascii?Q?+si4+atPPodzAG3ZainLG2f+oF9iNV2pA8mmWCJljz0iXUhw0CU3+95eT78h?=
 =?us-ascii?Q?BWQrDgKtzZ4h7LODC5q9mYPd1CSj21z2Y3zizjdXaCCSdldBylZWkiVHSghB?=
 =?us-ascii?Q?XaGwTW6NUOUVKXcYWzCQpbHXgRwjO865saL/NJoertfypXMAHTSj9JiQmTws?=
 =?us-ascii?Q?I0P+VZW3N+b5Jmk1Sg3yUXV6Fk4gRuyI+nyoWUmCfSysDgauCsnxGUcHfFSu?=
 =?us-ascii?Q?JtSf9MXlDHcNq3l+9qGxTFFKPiGtEwCEJohQTcQ97kP98uUoOoZqDczfXsSR?=
 =?us-ascii?Q?sxJPH2lDjw3P+A2VhrFxvL8TbesFujV9k205BtYCXO1ufTsqEU0e5uGiooJ0?=
 =?us-ascii?Q?HaUW4goLNCdRYFtMYXLqk3HBQkb8VcRS56AtMgmV6osfPJMmzhl1BFpAP+xN?=
 =?us-ascii?Q?SF9uFWIWfgsWBAnXN2zp9TqEV4n15hd9eXJu?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?elwarBSXsmR1PYodl9CZaO5o8zuNA+1LgHM6zQHC4fknd/kd5K7vOacl9dnb?=
 =?us-ascii?Q?EkO3PH46VZ+XNBU9QrlhldIbiBy91jjldu+ArWlkFApmWfWW4iX96nG8QAPr?=
 =?us-ascii?Q?/Yk8zlCvnO2S2gse3UA5Fe7wJ5FI/z6u8e0SYTQK9o07lxWX6VTEU+QQ44Sg?=
 =?us-ascii?Q?oI1m/6HASob8UkJtqKSSSGhSGaNTlEs15TiUQLxls3h6YnY8WkeO5MHpuh4e?=
 =?us-ascii?Q?Re34/1pC7AcB64JVd5MtZfLjNXY7TyS4O4AbjC7gYiG+LP7pGh36JZypGOnW?=
 =?us-ascii?Q?KeHRjaa/IFo4RHV5uY9Hq/Z9VrhKcukdNy3I6PRaX/zEAbSHFbtjOeamviQ+?=
 =?us-ascii?Q?mCoDnG2NYhsM8xei5TlWgG8TkgJ7FVVt+7GmO8npRkSFSan1DZ2dXhf/imaV?=
 =?us-ascii?Q?fyaHo+s0iDDBpgzpzJpeYwt3gKHxw5TEpgRJ53QaQ9/mjZ/1+XO2meSImAFR?=
 =?us-ascii?Q?G3UM1xknMF8ygckTFsM6CbbHU+odXosAu+Gq+FuEU+Oim8s5Lod3TkKmVxWd?=
 =?us-ascii?Q?wD+VUKfOl2tU1UJJfIYFaRd6mLPso3vGJwgjHsAX6bKqtfPYlPzslUbPaLZQ?=
 =?us-ascii?Q?mKfZug29ykobIBBGvAUEljFuop2keYjT30TmQmbI1Hi06UfxEcqnGSaT/rfL?=
 =?us-ascii?Q?lCNVJPQ9+K8DvZOmYy/X7ehltqpBDUjnjE/rEkpiZv+5Y9nth1UnqZdks6X6?=
 =?us-ascii?Q?120+XTKhAAn8HzqzrvWzPonZXrGoXlnNqnSO3BTWhLS8nEnvQoXXn4C/SsrQ?=
 =?us-ascii?Q?FI4Gp5NkhisI0F0X2/emL44YbYz5IpsBPq+zGaWMxKpR/4llNO1O24s34RMH?=
 =?us-ascii?Q?2VkqksqF5Nb5Uc4zcSw1qOMyRnJlo8qFPBZZPyroZsxMsGnmcSsJ2nZW0vBm?=
 =?us-ascii?Q?+aqnErFqtezX9ZZrWTmOb5JyW9eevg5qqPd9EccGxjxBdtKP2TZLEaZp/Nfi?=
 =?us-ascii?Q?4/1g0NsY/84lL1lV2r63K5gRDaPB+WClYhthNgAzfYK4GIvBSGR0gMJNBXs7?=
 =?us-ascii?Q?aS8VKiwEBNnlUeslIade8WKoddJxdDwZT/NKe8Nygtmayrkb3VEzPG1fSV3R?=
 =?us-ascii?Q?tawC9XvPkb5A95Wbf6mpyiKCe6q0QRg0jtXcqiy+Je4qaD04nulml034ae6g?=
 =?us-ascii?Q?CSDUA1sf+JDrwvwr5r5eDSslEg/gSbrhvz3wUMvs4b+sBY4EVd74JX7oP0aJ?=
 =?us-ascii?Q?dbEz4aFNihTxBBiiVeSFHlZv5nevyrZUNGj4iIpBGwz4EWIUgGSB+GAP7rC9?=
 =?us-ascii?Q?CoWng1JwKhE36+ID3daTnamC2F0/JLk4Q2dES0mwJvLI8dIxm6OMEU1U+Vny?=
 =?us-ascii?Q?wPfZ3yn78WcY9MU3gciHIetW/qsobH/YxMAzKMf/sq7JNOaiZV40MPSLycib?=
 =?us-ascii?Q?+Ppi/N5w2NnJXR9jqixpuc0k0Da64uY5pFk+WBSSPdcQegdwD4dKLaCqcVeW?=
 =?us-ascii?Q?d5pry1O2ZOwmOK8XVeWiBP4UOjUNMue5WM0EEHit5lP2kUyGja1Z4YB99BZp?=
 =?us-ascii?Q?2yQcXvEbzj5suUcb7qB4eIZOwisBsawUX8rHWRSwtKZG9i6gooukCuzqpoVJ?=
 =?us-ascii?Q?VAbNAr8Ieqo8/xY0zwovInzBvZLRJMY0zw95tDxa?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed5db1e1-c51d-415e-d989-08de21f1a5f1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 13:44:49.1733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 78lI9GZgpMG6aJpkvfMkkay2N/fN2YfjHRKzWvSZl1cNXBa+iFvXLXPIuKJYdsnAftC46Yop/bymoXQ/k0PTSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7241
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDExMSBTYWx0ZWRfX7Iy5lCH422tw
 0F0iVfmEDYRYNst1O0vuaIuoX77shG3kvhlVh6OvhYmSJjg3z8kkwpcpdSB2RDhDI0xue6xBGZQ
 u8gzUs25F0HMmAiA/SFyLa5PvWpn2mBb2tZhtLs+Mx3YzdI3nyK/mPitBUrVrnQ3htJwJABoTNf
 ZqANt/AxOhxJO4YJ+kHmZPJoU+OE3yuUBo66p7crT8cfrvNBsxWyg8jy7iObDjwjjFIR5FMxine
 KhOzPhK+0uZxlbye9aXrQTGIQvTiosmBkOAebtK6Yr5qCV605LypDOUvCc31YlE9qjxYKaohSmF
 5uNURQVTJ8nKa4Xs05Jqk/xXUjQVNgbW1KLIlh/wbXoLPk3jh8zEjt6wtUW+RrS84VYGyXY8/NJ
 kHgYeODgG5cPgh08mjRyMbvnxydm6w==
X-Proofpoint-GUID: 9LdZ_FFj2cGBp-5d5O6zXLlluuFfT-bx
X-Proofpoint-ORIG-GUID: 9LdZ_FFj2cGBp-5d5O6zXLlluuFfT-bx
X-Authority-Analysis: v=2.4 cv=CMknnBrD c=1 sm=1 tr=0 ts=69148f55 cx=c_pps
 a=+KlkUUL6BOGgxGViHu3/Fg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=8zs2Js0kKOUJzZQY_6sA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_03,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120111
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 13:44:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121547

Add UPSTREAM_CHECK_REGEX to check the correct latest stable verison.

Before the patch:
$ devtool latest-version syslog-ng
INFO: Current version: 4.8.2
INFO: Latest version:

After the patch:
$ devtool latest-version syslog-ng
INFO: Current version: 4.8.2
INFO: Latest version: 4.10.2

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-support/syslog-ng/syslog-ng_4.8.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_4.8.2.bb b/meta-oe/recipes-support/syslog-ng/syslog-ng_4.8.2.bb
index 1b46d66d6c..58c9e375bf 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng_4.8.2.bb
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_4.8.2.bb
@@ -29,6 +29,7 @@ SRC_URI:append:powerpc64le = " file://0001-plugin.c-workaround-powerpc64le-segfa
 SRC_URI[sha256sum] = "7d1ebe70746009dc06bd2fa5c412a1985579a9c887292f766cc775d169d60e68"
 
 UPSTREAM_CHECK_URI = "https://github.com/balabit/syslog-ng/releases"
+UPSTREAM_CHECK_REGEX = "releases/tag/syslog-ng-(?P<pver>\d+(\.\d+)+)"
 
 CVE_STATUS[CVE-2022-38725] = "cpe-incorrect: cve-check wrongly matches cpe:2.3:a:oneidentity:syslog-ng:*:*:*:*:premium:*:*:* < 7.0.32"
 
-- 
2.34.1


