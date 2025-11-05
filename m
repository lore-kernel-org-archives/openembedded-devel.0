Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE1FCCCFA04
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 08:22:44 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4860.1762330963567703432
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Nov 2025 00:22:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=LhQguOIu;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3404438c32=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A56vjG3941052
	for <openembedded-devel@lists.openembedded.org>; Wed, 5 Nov 2025 00:22:43 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=OamJmfaM8IQwOUVTYoU6
	y42gYf65IaNMx3MUZwHa5T4=; b=LhQguOIu9JCEmBOW7xro+E+3yyFcVTab9xhS
	G06t7+U33Oxvfy80rWoEvEfubdV7PpFi1IMWbptk2xyWJhWpFTA1Lw2gTCP7EHpj
	kia7i3GwH7ROS5Yj/V0YWXUEgySr+i51zOtFHh9LfvlIGiaqZJW5lh+vQlL6+hdQ
	ZisLrnFqFhEaqcQ7tRYtowVVOsnZnLKLs5YYMPh7F+Kva/KAHbJrl+eVDXe0o6b5
	F5Bigot13s42OWjCzko6+J4DVrkK2KcshYedQ/z8LIJS/Rrtkw2b5VmXvXIgBjx4
	Q+DbRdISnwLCtsRcRcXT8YnYPAt/c/nZrj1abVV40WM2Sdk9WQ==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011048.outbound.protection.outlook.com [40.93.194.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a7w8k08hw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 05 Nov 2025 00:22:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VqaUXfrP8A5NfAhhAyAvd0kf5j5qKpDPY1uZOvm+gZPhitC0SPj5F+wFKoqhRpltBNkVby0HDDAh3UDUQMt3wUEemlbXhRNqXzhLsk73KkhKmqn96xuWykwxraf2/BUlbQf/3H8F0zySvZdba6+SFyU1+hb8Tf06O7EOwwhLP6FPpa6NMlwYTiFio77dX3EUuwCVnMoCgLREgNbCGLaTF5tJ5Odog0f8NSEwTbJjAIz9hCpTWpaLm8A8tWnjIu3yiMfoQBmOluoXCU31/+8WNpXW59UTYAAbg68WWkpGCWXFps+tj38OeDIyHDWInntVvc8q4NUCyUNylau6ZNGthQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OamJmfaM8IQwOUVTYoU6y42gYf65IaNMx3MUZwHa5T4=;
 b=ay0c4fvesu4ErSZoKGoryT6nVmgg9e1y++kYGxFWOASeA2A8QG7Oggg+PfIpQ9xi5t7BA5mvebKrZ1PoqqG7DZPrLOTaD5+mRqCwsqDZi7EMdHuMxFVuquo3xHa2jH6G+ro7NuR4vogSvOJaInyf97w3twVD0WmGWIrUvE6p+Ifg1eQsUzdLH2eAR30Osq0mwh0aDzYzkyM1tgB71mNhjDB8SIZdxoJC5xMOZPgkYMrTYnaVFxdZoHQq/635IBKmK8MiATHdVC9g9lVyVs2ALtR+IJG1spv1IaVQqKnGotntS5pbxQ31PHeY7TihFSGGU73xhLlQWgByoo1bEnuxjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by MW4PR11MB7161.namprd11.prod.outlook.com (2603:10b6:303:212::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Wed, 5 Nov
 2025 08:22:39 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4%3]) with mapi id 15.20.9298.007; Wed, 5 Nov 2025
 08:22:39 +0000
From: haixiao.yan.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][krikstone][PATCH v3] mbedtls: upgrade 2.28.9 -> 2.28.10
Date: Wed,  5 Nov 2025 16:22:23 +0800
Message-Id: <20251105082223.3288297-1-haixiao.yan.cn@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0002.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::16) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|MW4PR11MB7161:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d0c1e99-9f85-4afc-e5b2-08de1c447bc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?VqQhw83o2joi7KovQ113UVSs9nzGPgwuo+cCjfpt912pVSMNSX0Os1Kph41q?=
 =?us-ascii?Q?i70FyTgtkpy6KmqPSC68ObRKmiL3luiTB93yd93i0v25X6vUYy7oIPmCpKah?=
 =?us-ascii?Q?SQawtr4xFQFtzEeGD+QyxzmGGMPD6Hu0SaBYVGpzHGQXWJ0Ysb91Q5iTeOhr?=
 =?us-ascii?Q?WdBmOPLNxSwAS/od/MS0jYD4eaX/ssrI5e0Q/1U6hKsipVJZLftixrUVNDaZ?=
 =?us-ascii?Q?M5ktWI7n7heAzMqdNcoNlKOHPn4pFgTVDqZ5CYCQT4CpSFUxS3i5gxnd+TPd?=
 =?us-ascii?Q?R6c6zGoY+EmCO6shKzfb/b7RiWYQK7NJWPp417CnrPZXGCPA1aUHr2aw8+Gu?=
 =?us-ascii?Q?Gm20kGFY+N3iT3YST31r1Nok29FOHNFkIT9Cc5SmBXkB0se8sgiiLrp578vv?=
 =?us-ascii?Q?x+Pf+SwMbWFYZlOdolkgTt7Pky93S5X9vOjviDrA6+M6KI/LL9k+dbCzIh1q?=
 =?us-ascii?Q?3F4XTRXP3zFXz/g0Ebqz/cBbvzecTZalAlAnJv1qt2lB6i+STfXQYV18iL4+?=
 =?us-ascii?Q?PlxMwHOYzjasKs/C6dpJxZcyGtjxo7vrCxsVIH3ypSbUnqMwrIvJ40DNhorR?=
 =?us-ascii?Q?Wzl8uajsJYzL8bv88srxddEaszQNng5lIgwBZJnzgtHNuxuoYFeUXPe89SFq?=
 =?us-ascii?Q?JMb1KwoS5emaMnhDFOewwFR0DgBgPwKbWP/0IoessgAgcBvvqLfNYBID0pVk?=
 =?us-ascii?Q?7RUpJDJ/ebqclIFwiS1g8zOGcb5+4ZDSL1xbQHdaMgzdpheG90k3/17Dhfac?=
 =?us-ascii?Q?NZTNRoPU/brmhyObBUiinJnVc9e1b0fka87QnClE/HdcBaPN0lrVl4ZqZGc+?=
 =?us-ascii?Q?0bDLo8HxV6hQXlW2rC+1RKXUuptE1egUleaL6iWJKxW9/CvzqDPlbPD+XjmE?=
 =?us-ascii?Q?O3homou61KRKLXkej90uIXDzFaMroos7rIndfhMO1LY5MGbAYrQP9eaNoRZ0?=
 =?us-ascii?Q?TeX1LtOw3Q3SQzyU+m9mzGm1e9InONoyZIfDDAyN7QvQe+H6SraMbIPcXMbe?=
 =?us-ascii?Q?+0yGjkbz0Qtv64bFqmnB8KXVzZUJ3FPu+2OQVNqGjMdNqnNzcdTfMKCxHdG7?=
 =?us-ascii?Q?gx5X4Z6+d8QEdKMnrwEjNMgvM1Rps/OcWU+gJDFlcpCYUzQz0ga8V3B9AM5C?=
 =?us-ascii?Q?atf9XUb+qK2UFB6ByNZk9uj9p5F0qDz9Z+EVr7IZa0jwP/wIfdI5rCqW8jsE?=
 =?us-ascii?Q?uNV9uSQLALY1msWKjYs7Y+unnaCyAyRidMpmBk5Tcp7NJiAro6be1blYoDkZ?=
 =?us-ascii?Q?9rjCIj1cd74e9HRIC6Clx+xTkhRlCRx9mwEOPVFBz13Y36Fd5HtfnW/WP3Jn?=
 =?us-ascii?Q?Ef2ryEqehkKAC2+/N2kqBW06MlaWmcqXtEKVltMMedpI6xVgRTV1iQKFBCNE?=
 =?us-ascii?Q?3Vm1LdYNYYDqPvZGeoYo9gc+lcZyCJy3RE4bmF7uCgqydTDmqw+nLBswCLgy?=
 =?us-ascii?Q?JyuIdZ+MdStHfZWzxUE5aiUmn+zdIU5AdnmhWbKApLwlleksJ0FesoNIsOkV?=
 =?us-ascii?Q?vPQQ1vGuTcLNeC5FXmUhcWeV/RmzH2qtl8/m?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UX9N5ZyEPZ4Q/umOM4GZMYACDLPeZWzpGLjKfOeeXGl5kk9GP2OmfBXK51Ak?=
 =?us-ascii?Q?M6fvZXV8/AO/pzY9CjiNS5nPFZqeOytGypcDoNzLWE5wyCV+8rUfML1oQ2NK?=
 =?us-ascii?Q?mpBaQs+ySQ6frVQyDTOefryRYxWyiD/QYQPKtA4oOyKqQu+m0w6aAQJ69F/H?=
 =?us-ascii?Q?jVQkNkF0fIvl5N0UAGu6C4jbbngXvt7rLuNeEYRU4Av9l6S5MUkDOupgepcD?=
 =?us-ascii?Q?x37dSFh/rb/lX+niavhiI0Nn3U3m/H/ytco4C8s/eyjs0LVl4ZAjXiD/tdyI?=
 =?us-ascii?Q?HF1T4Gx78b6i5ouhTA1v2IH4o4gH4H8WXmHfFxKhZQA1CufZoJIJ/hWluq3T?=
 =?us-ascii?Q?1g4PUVirn59pmqEW/MuoxFLbQIJQqbIhu8inFpXuon92yp4cI+irSItQIGZC?=
 =?us-ascii?Q?SRS3hMo1xeuTDnztKOBeqLSDrigf8J/E//OCJRu3ErUTMNEI5dBI5sDaCp8m?=
 =?us-ascii?Q?rOreJLftJ1jS+vzA8iVKAo45YhYA3T1ThBsKkia/y4EZhpVNuPQMt98r/OOe?=
 =?us-ascii?Q?hMw3VaABGMF1b9KxBf9kSDKqZyGkKs2lpIeG3OHMFBwAh2Kh7IT9zyykMH/S?=
 =?us-ascii?Q?RYyuWpp01Ofxc4H1SNTGoWZj6BrW6JJiHIb//ZJdDh+VgbU47hReD2zNsIwg?=
 =?us-ascii?Q?51hDO3GsWJTY3NRjHvYTdHGyRkqy3MplwHBDZoIQ6z9CcZrZIrw/nESG3xy9?=
 =?us-ascii?Q?j/+JfYKbxxriqWIprXtu7+K55285A4X0ZI8HTPLGtNe1A72rnyUCJHpN6O+5?=
 =?us-ascii?Q?rlypHlhcMyfxPyEjgzlqI704ipc3aLLIYqgMDufDovPVVkzd01alPTscz0Q0?=
 =?us-ascii?Q?hjO7IqLg3WwjPgZNCLN+EAh3BmQatJq3uqVEdZWxzoT+fwFfF5OvI8k1mfhC?=
 =?us-ascii?Q?thkOVE4sM3g+BmB85wmF7YJZIWaSKtewMeRaEVgbNwl7bINqOawHOTbrLNaM?=
 =?us-ascii?Q?/dVZN8kZkeTsANsd38ICjjcQgEUMXgv6MZ4UsE9h2ZCXyNt7kmYvx3pkDkUT?=
 =?us-ascii?Q?8ZvwumjqNIhWxuTxhOv00AKRKmrfJqUI7iMDFSCoFKEPrCMWr4hi6x2Azv+K?=
 =?us-ascii?Q?wbsljEHqqA/G9jKT0jYUbPWbhx1aC5RwQVrKClb0tHmvSokmdUZyHZitADn0?=
 =?us-ascii?Q?hZ5JRKNmsFKXUcCx6Z59/pqg/a0kFs6+kfAnzHcBw1AfL6KpS6VCp51mELJu?=
 =?us-ascii?Q?h0WRaB4QeloLrdX8wtZp8u3OammV1mKAp26tsyYVyMfztRJkWGLeBwKRWhqa?=
 =?us-ascii?Q?n144ef99PSQwjqmmcqao5nrLdETLeRjkdJ1J4Rg8ngElX0edPx20+9G1xLc+?=
 =?us-ascii?Q?tw30Kyb4GLOWPr4jxRamwIyITaQWfxOCWDwVItEINL65ptEocygubBA4PZq5?=
 =?us-ascii?Q?4R9OWY7DI4rkVzRBovqaCHiHFE5e+JD/oFPXI/UmgJRxTVAMxh1lLnEyYNl3?=
 =?us-ascii?Q?tvbwa7aXBi4P5GYu/e+8XntdnPH+xBACLS+NmfKi3yf+ciFS9m+eKQGk1v4A?=
 =?us-ascii?Q?53NHs0PtXSYuT+K1YW0fL8kRT+3OQSib9/H54PUHksvO++NJdZCZmQ3JJ3dN?=
 =?us-ascii?Q?o8/td+BWRFlccg2eoTBI+yoHSlhF9784ZDtEu/7OXkBlWSt4qLYERh8iEc7p?=
 =?us-ascii?Q?ZQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d0c1e99-9f85-4afc-e5b2-08de1c447bc6
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 08:22:39.5239
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3H+B9gEuiHTvqsXxHQSZX0aLUAB9tYW9unAP2iCUgK+2PuijasNzRR2jeEPaVV7SJdrhdY0qKSMS8wuS3W1+TuXD7W6AiyMtlmxl/9tMiTI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7161
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDA2MSBTYWx0ZWRfX2jZk1MN2R4nO
 DL0DxSZY0RLgtioYyWPrQVfxqmeH/yOIi460FTCWJu07F/sWyhOCkI6s3DNQ/wOd8+YSukCgh82
 xlGUc4R4sNxBhT9DOPrl3WnAUIOaY5/dv5gmLt2CI+d/vmF65MNfMvrdAt6gmsndOwNG7IABHg3
 aEF43+tc3f3Y/8Y0bnD/kHOMeEqgNSU0vsxY80P6bt5t2SFpX6Nu5YX8mb1rtMg4WNM5mzykBxy
 mzqld7j3Nic7SYaD1mQnzBT4IrWqMe3bKSl1iu3mnCjaTN6C4ttZWXGECM4TuRlF81CqYjuZjIT
 F6e8S1Zjd4w/dtEH3Hz3Vnu0t9K8wYue3hFOPbE1HkyD9RU72Q2XK/xjPq8eG/63/R2UM1OGke6
 DoeQJXk03DYJTQk4JeHDtmXMv4fiAg==
X-Proofpoint-GUID: fdHDV2KRg2GsCTrKS4NVLYLoJyorz8u8
X-Proofpoint-ORIG-GUID: fdHDV2KRg2GsCTrKS4NVLYLoJyorz8u8
X-Authority-Analysis: v=2.4 cv=dovWylg4 c=1 sm=1 tr=0 ts=690b0952 cx=c_pps
 a=56tib/hgGBcemyuyLZC9AQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=tRUJ9U3Uk5dj5NMH2OEA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_03,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050061
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Nov 2025 08:22:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121324

From: Yi Zhao <yi.zhao@windriver.com>

ChangeLog
https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-2.28.10

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit ca08c742230b758f6ebb428901d51169f1e6044a)
Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
---
v3: remove run-ptest
v2: Regenerate the patch based on commit 33eb562e382d0c90fc6574c3de2fff3e79a414cf.
fix fetch failure due to branch name mismatch.
 .../mbedtls/{mbedtls_2.28.9.bb => mbedtls_2.28.10.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_2.28.9.bb => mbedtls_2.28.10.bb} (96%)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.9.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.10.bb
similarity index 96%
rename from meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.9.bb
rename to meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.10.bb
index d935cb233122..6e7c9d23b1f2 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.9.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.10.bb
@@ -23,8 +23,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=379d5819937a6c2f1ef1630d341e026d"
 SECTION = "libs"
 
 S = "${WORKDIR}/git"
-SRCREV = "5e146adef63b326b04282252639bebc2730939c6"
-SRC_URI = "git://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=mbedtls-2.28"
+SRCREV = "2fc8413bfcb51354c8e679141b17b3f1a5942561"
+SRC_URI = "git://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=archive/mbedtls-2.28"
 
 inherit cmake update-alternatives
 
-- 
2.25.1


