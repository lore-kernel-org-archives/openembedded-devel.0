Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EBACCCFA02
	for <webhook@archiver.kernel.org>; Sun,  2 Nov 2025 08:30:53 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6755.1762072249344749911
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Nov 2025 01:30:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=KkL2jpka;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3401789386=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A27sU4Q559534
	for <openembedded-devel@lists.openembedded.org>; Sun, 2 Nov 2025 08:30:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=s6B37rY/Ie3Qyf5MFMhp
	+7FkBeXaaUUyHo/xhWAcKkM=; b=KkL2jpkaZGkZij0AZSYUpjEcBmyciVWzowlR
	TfKWBqUM2Msno/cb27B20u70krl3tCwvJsNQX/Da3dbtvGnaaeyip6q9sy3arZIC
	XgpcNrRJPdzYdp36yxFm4P/3tGncoqwpsaVJXCHSkmgq0J6G6PHhbgPzpjzNtfJy
	Z1Dz8xrCAYc9C53+qBDxH1UBR6Z439JgPEqAK9NCu3JYbRhURQc8KFdtaCkXKnCR
	aBm7icVD4Xh7e7ja0LzAbKVFfNS5TcgRo1hjxxxVu6AQ7fUzog38qBXdNZy13Zww
	cUtQnof9MJ6GKVl5+3V2L8XHlpL8nTTjNCTtREFb04oCy3UkZA==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011004.outbound.protection.outlook.com [52.101.62.4])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a57dx0tbt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 02 Nov 2025 08:30:47 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hmVcgjdKd6Zoy6lAJ0+5HR6axEcVMxRjd5968KhSy+dOWpwjschGW+aiaFdjm1DSR+h9L5owBuDdyzqQqzL5epWsJy2g49zWH+4jYM+VYWB/o2JC07XjjM7InECKKKl2dBfLmjQHtw07KC+2mPunZe6+o6b6AQGh9uVob+choiIDrp+4855KKqZi13ADcU90dVNxZ2hkDzwij2Avfq1KPntGl3NojJ9HW5xU36BisxTHHb6ypYjTrxbUYMbALqmg8/lU7N597uMIk8eckflE9zpaOH2t6n+IjElO4iLJ1gSwYLjJeN/ax1i7TKZha4fMl1xFu9V1M4+roWbum7qvuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s6B37rY/Ie3Qyf5MFMhp+7FkBeXaaUUyHo/xhWAcKkM=;
 b=JnPpib05zOXUys5qv9rhs49h41HWT1ljB7ygVvj+XDCaNgze2fRltFr3yboRvAsGu10oBkghU2TugITtniuA5CLsnsvQC5KU3Gfw/f/hO3jY/efbKevtZBq3ngQm7evTzmLB6Mydq/Zjk3fa2xOz/p4DX2TaJ7hG97RUhusRjHb4zLDBgt3dUeNQVnk22EHWQX19kgX3YWb8dk2HDwAtCfkFOUNbfnXWv90SVx0z9P43kMU3gxA6qNJ91UHSwstq3A8ESuuVh81JnA+7LXLWEoemJhCMw+NXoppuGtDG1AAr0LhHO0UdGUCHX+IHOHXYRonc+T1DpIQBJjGOK+mApg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SA1PR11MB8811.namprd11.prod.outlook.com (2603:10b6:806:467::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Sun, 2 Nov
 2025 08:30:45 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9275.013; Sun, 2 Nov 2025
 08:30:45 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] strongswan: upgrade 6.0.2 -> 6.0.3
Date: Sun,  2 Nov 2025 16:30:31 +0800
Message-Id: <20251102083031.2761649-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWPR01CA0022.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::9) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SA1PR11MB8811:EE_
X-MS-Office365-Filtering-Correlation-Id: c042ef03-f370-474a-82f8-08de19ea1ddf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?bADTIuczuLcA+LmRB5WSmvydDzX5zHLIh1aEEmDhDg1lKD+cyu8+ca7CW3K9?=
 =?us-ascii?Q?hZFmN6VhfotFn1nIsChCvPxvBvbLcFyi4n6JFTKMq7qpGtYyNP8R4mI7ajiQ?=
 =?us-ascii?Q?s0UAa9zPENn3Oy9bxKLqfVyKbh3AT5vuUFbua3FzQCFqL16FO36YA2u22ZZe?=
 =?us-ascii?Q?Q3un3mmWM5DvBnjAPu6wdfAS/rgEirWGdz/tf0302j+VzDZLu1L+EcBjYq84?=
 =?us-ascii?Q?yTALGHo4h4OPjIY3cM73fc8fgAV7h2vU+DoMrvFQsUxVI8OsVTpGyhTcCHtB?=
 =?us-ascii?Q?qUMrVO15dtnLK6EVJxgfT5dpiQktkvOEiUC4JUV46S+5MPl39PhEPDm4wwI7?=
 =?us-ascii?Q?IkDC6l3zYRoE6NIb+pE2qERdDuUrWEsN6XamqaTxiQRMgTLMCM2NyZdPRLXx?=
 =?us-ascii?Q?2y0XQfhj7yzzeMZn4/d8pKVdSMX4UIqorFJbl3eLil5uHHk3/o20Hsa8VBBb?=
 =?us-ascii?Q?wzPxzco7Gy7uDRd9NjF8fhDRUFhIj3eEoENhuAQF0+sEAUIWHqixZufh4y2i?=
 =?us-ascii?Q?NE21OvOnJSheliNPfLbCrFltZt8y1xPNbKAIJAs9L4mp6W8iQ4goGem1OVO1?=
 =?us-ascii?Q?8L1KZCsIEFUH/z7etQr6nR5xkv3EbfKjCBQoFI4lF/GpJ2butxJ3ZtVaQevd?=
 =?us-ascii?Q?CXLdG3/VPEUft43QyCKEufcyeZ/uye2mN4Fjg1fWt15HmTIElY/dP24d8L6O?=
 =?us-ascii?Q?oc8wJrpBq5ftIE33dgVZZiKnFSnTunvqWyk0Ob7b5WisH2tZUlmOCVYtxXyl?=
 =?us-ascii?Q?GnjMOH4wQYaCYihpWXog/CmqsFCCX9zJgwoxqfhsg+VC/0hFncnt7repZsW0?=
 =?us-ascii?Q?IzEFvUVh5KhmyteZy3CGaKWeVRd74SYIOM3hsYUvOurkjMnBpSkikGJ1ZHIU?=
 =?us-ascii?Q?lRvChY8Av+P3ruQK3sVQLn+GT7dsugaW8vvdf7OFoIXu+0QDCB+tNl0Wx52E?=
 =?us-ascii?Q?9DEf1oHP0znS9FLfN1G9OTaBznWOkvqsSmYZy+7SFQbt7PQ/6CsUOCrqpC3v?=
 =?us-ascii?Q?Zd6fwG0NcRfLiexc+WIAaly5Yco8xfgNaCh4YYknKE2t81yokczEve2M5twx?=
 =?us-ascii?Q?d009RT0k9bJWE4PzrioLX7wu6Q7mN6x3puUIi97SUjHJhxw9C79lhF8xW39Z?=
 =?us-ascii?Q?bHw78pcF7GsFKsta18OYV1e2msMb2lG9pbtnLqBXi80jrt4JLEGVrm2uNTc+?=
 =?us-ascii?Q?dBvxiYb6VoTTnWDQEQoFg7vV1ZaS8Jl7bUu1H110lxBzA1ucRHZwMRbxjqk6?=
 =?us-ascii?Q?QKLnUg+4Mrp5AmYljCZX9wdT17UWmCs7oZPbXYKjUTRCIsZvW/+MEGbkijdo?=
 =?us-ascii?Q?sE/uLcapy25dC86tgQPbAa5FTzZpk1ad6Ym/4OsBBX+xQsLOylIQ1bTadWIU?=
 =?us-ascii?Q?pcVhkqXHCkejHyT6OkrSZ6N8QQN9mx32HcLAY4toJqTJHkvaIpmgAhQD5tne?=
 =?us-ascii?Q?LBfbKjK3h1YrsBfSin84ssEZ/yPfKA7JoXm5d6vE3Y/8hE1baNpCUA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cpzT177fBpMm5KiHyn+LHiwK6gW0k2NcouEoT3/KRxCdE3CRVwfFvj6wp19Y?=
 =?us-ascii?Q?nNlqeoM9L5qhy+HJDLa5NTNDorAVlAu6soyw9vT0LAwnWvmpS69OicD7Yh4i?=
 =?us-ascii?Q?XkPrvYUOW1g2XuUmhLcqIPbY/FiOWf3fjKg1XGJ8kUB9FALg5ZyckhXabHsA?=
 =?us-ascii?Q?OBNQvGXlrQg1VlahNbkj8z1P2eSViJjkmOEJqsAZ9C3imSb9cGOrt0lIt50U?=
 =?us-ascii?Q?+tMb4XczqM6vD99R9JdVYnUjZr+so2priWyOyrWUy14C4QMfjcaGvBeMePUX?=
 =?us-ascii?Q?eSAhmMKPyT7C6GzXsOHz0O5yveC3YO91mNBeH2clY4ASBUP+cmb3L37a2hpW?=
 =?us-ascii?Q?dtpmEWxHjtmcpo0nDk/3sFUEn+Ib8Rah65Ju/aH/8iBfXVk8p7hCVHYs3/Il?=
 =?us-ascii?Q?akJQvNDq7zk1g5hJTRxl1LIqzoo2nHpT0wS9Iy1/WqIOkVAbkQg4mfgNaYQl?=
 =?us-ascii?Q?PxN5ndQxKpL14bju+2ximl/c9B1jol125sJ3sCXp4d4EcOXflIeCwnsO2m87?=
 =?us-ascii?Q?4q0hdQV69ORKyJpzx09fcB2+K/olApSQSoo4ewU6oJUR6WOYeyoJF2q3F4ff?=
 =?us-ascii?Q?bOeIhSHEXIzYVhdAQXTYnymrVq/o9aLfHfDkINSj/P6fTrUmyo1y/6si8Fhe?=
 =?us-ascii?Q?q/FjyfS8q3TIZIh0kOqlrwDe93fa6l40xbtK4ZXMnFjc3014KbxUjmlSjQd1?=
 =?us-ascii?Q?rZoU6IvtpKQ90dR4PQg+Ul1eieiFTy/V+yn2NdMqdaKS+3/QhQnPGkB/csbx?=
 =?us-ascii?Q?0CBYC1O1HXJZfto7ysb0s7+JqolQ8ZecCgB1J0//hrXbI+4Y04317jtD1IpR?=
 =?us-ascii?Q?aX7k50fS1bpQObNJwnvjwn98qv0Jf2Dq3IGAnKe6O+oFXxF9JPamCYTVDUZt?=
 =?us-ascii?Q?O4OGhAA/XlJPUiHNIC9PL6oS97fDTA1Eid47jfgLaZrFr4NiBLdBvOF/hY0x?=
 =?us-ascii?Q?Kqjqmr5bFLxJKHD+egM5yev+wsS8H7NmplzIMgfe2ZcpnaRFDMQETuOOn1ZJ?=
 =?us-ascii?Q?1FBF3WUlwzL523RzI1D9vIwmLiZApuNo1RJ1RaUHCHsGz8WGvGHqiwwK4W+9?=
 =?us-ascii?Q?DeASwOqA2op6X/3t2NOey5yzaU/FG5qNruJ/MtO0Lv2Gl4TLua1OL+MWo6Wc?=
 =?us-ascii?Q?UrEwiDbTj6yeUgghsvne9SiBVyEmeBA+g0w+MpteNgHtR+ok3rgw0eZlf97F?=
 =?us-ascii?Q?fDHtd2NJ3/JgZ0qAPpoHkMuJR5wFoYY7WzNpQhqk5sXyaG4P3WMVHhsVriZO?=
 =?us-ascii?Q?i3HgH78nWlDJFz7a47Xh2+h20xiXMgGmksBdkyCjFuusn5ARKcOpGV3SESf+?=
 =?us-ascii?Q?2CucZin/fWOgfiZdvpsoEfWoreU/Zdd0x7EhgPrmhs9QpjppHjbA5vSu+czE?=
 =?us-ascii?Q?lZGfRiC8UhCAmz13RElbdxl4K21kj+CB5lRwX7S5a4hLD4cxDY489JB/EJ+/?=
 =?us-ascii?Q?+syHNewGeQXZG3lHAhRHxf+FtiC8monfOLRxK/+ZNn1v2/ht+F3yzNTgGCb9?=
 =?us-ascii?Q?HQr8dJnipaXGjQxyx5eWlcDqRKi8JAjsSjIXef+pmR4b2gU4U8PnyWzZr19y?=
 =?us-ascii?Q?XZPTKFuhARkKiV8R8LE6MBUl7NnPJWyTGilEo0st?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c042ef03-f370-474a-82f8-08de19ea1ddf
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2025 08:30:44.9945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1j3E1Wx5JcDKMHwZiIhrmY1eBET6h9WyWSZ2k14zHaxnoCEMsOKlduGgnMDRL72F8DaEVVKVatfqiqlIzx2PSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8811
X-Proofpoint-ORIG-GUID: sVBgNi1Uuo2JI9zI6LsBSx9lUgCNz6PG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAyMDA3OCBTYWx0ZWRfX4VD82wpTNqT+
 JYRvIlMDUmHtYRYgno506ElDQZXfmDaVhPIO+lqwVwRBgtHO0skmtBKG+PyyfpacqmtzIqIbt+K
 Mc/g6DZtFU2q5pv6xpECvguD7yJII3az/JouEi6caXvvm0Cg5Gd+H9u4O249G/R58Jk+ojsMepi
 TMJ6ULRyIipy95x8QNalY4vBU9XnNidLW594XGMluO1zsa89Ud6+8JnWdGVqz8QCgQOt+QBx4IJ
 M29dY/eL7aGBRiaSTQqedJKLwz97sIsHHbVXGLXzbimer0g/UaWDdngJwX3od5i8Kq+b7yktK0O
 2opmxhjbYJQDdGTcrHcltGCJDshdBR3BN1BdXd/IhzuN/2lkYZzBlWL3mxWyNCzr7/xRmZGSYm+
 nQ1OsYuGJ0uuHBPjKXPmsit0CkR1Vw==
X-Proofpoint-GUID: sVBgNi1Uuo2JI9zI6LsBSx9lUgCNz6PG
X-Authority-Analysis: v=2.4 cv=BeTVE7t2 c=1 sm=1 tr=0 ts=690716b8 cx=c_pps
 a=7APEvFnVlBjFtWv3F9ubqA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=KiMCiSwjAAAA:8 a=t7CeM3EgAAAA:8 a=dU4K3VQKtA7d1ik7GEsA:9
 a=sPCYT0qwnquSfqsKqTDE:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-02_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511020078
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 02 Nov 2025 08:30:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121257

ChangeLog:
https://github.com/strongswan/strongswan/releases/tag/6.0.3

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../strongswan/{strongswan_6.0.2.bb => strongswan_6.0.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/strongswan/{strongswan_6.0.2.bb => strongswan_6.0.3.bb} (99%)

diff --git a/meta-networking/recipes-support/strongswan/strongswan_6.0.2.bb b/meta-networking/recipes-support/strongswan/strongswan_6.0.3.bb
similarity index 99%
rename from meta-networking/recipes-support/strongswan/strongswan_6.0.2.bb
rename to meta-networking/recipes-support/strongswan/strongswan_6.0.3.bb
index aa4524ab3e..438b5d5331 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_6.0.2.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_6.0.3.bb
@@ -10,7 +10,7 @@ DEPENDS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'tpm2', '  tpm2-tss',
 
 SRC_URI = "https://download.strongswan.org/strongswan-${PV}.tar.bz2"
 
-SRC_URI[sha256sum] = "b8bfc897b84001fd810a281918d6c9ce37503cae0f41b39c43d4aba0201277cf"
+SRC_URI[sha256sum] = "288f2111f5c9f6ec85fc08fa835bf39232f5c4044969bb4de7b4335163b1efa9"
 
 UPSTREAM_CHECK_REGEX = "strongswan-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.34.1


