Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77451F013E6
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 08:39:15 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46393.1773650352700204894
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Mar 2026 01:39:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=DItoYWUk;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=753566c020=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G5ExK13148290
	for <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 01:39:12 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=ZAZqoyac5CwnJStm0g5eDo/4gRbJvP3boghExzmfvhI=; b=DItoYWUkXHBS
	INnEf6cPfhFer1qf0XGB96m7sLAy8qwrJJcScYvcWnnbKSroFtNdZvcvQsARLgkm
	UOn/GihP5Lgmc7/3RGWtRvkwyD4+/dIkdbRrE+Yi6B7MKJWEMAUs7fZjGzElzpEf
	bK5wJerGP6AXCYTFqsFBwJG6MO5OZa0OLc13sZksi6BcreTgJLIOWvVv6TLUD2D5
	ut2ds3zhik1ivuhkRjtPnqX3IE3uwxrTl+VKBhVXA+nT/0klSeW3ZsFJ36FI8xU1
	/owTePPpBn6mleSvHyTwXoDcUNHnzXI35Dkk4C+5aNRoJOlfDFFaI9Mqi5wfP9h3
	XzhU8fQgLQ==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013009.outbound.protection.outlook.com [40.107.201.9])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cw76dsec3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 01:39:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FylZTFNJftyLYKtF/AspyONxvbfb1v0iUzq746HHDRNuA/zEclNQKfSh919+AKIsG+S7y5gyK0bluLoXJ86a462QBavSnIg72Fcv/9EixItdVkcigTPE2AdZk7M1bwLWl3KWF+Qf8iisV0wCE2LOJDhCFzlvCzC5efxassRp/vM/XSm6Lst/hyLquCNaSYYwPcu6nx4FPC1zVW/S/iDgB0Z7ydm9C+7a74oJinHkJRUT9841Ep1RCPfRW+2u96id2/vy9T6peHyImJZwPIfRJrSlOcKeAJOFg2ZHzJhjT/z6UTGSztugg2s1mIsoiVg0KZJs5J8i6sk/PbB0Zbg8hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZAZqoyac5CwnJStm0g5eDo/4gRbJvP3boghExzmfvhI=;
 b=azonA17xHU7hil3P3Zs8CQUXdc+zfzshcLRwjluL9yTNEm3c6UqLvG1ft3kUXaiMPuplBw+3BDkuTHnNkpzzxdMPilZQJt67my/rznpJUbAWf/3S3MAnNbrNuhgDhHwQGhb4aaX0PYNAzLxovnr2NAszcP1HJYxClCMzksBXYmkmAH2WoQhX5hptG9QQFZ703NFB/9Jlx0DzodsI1CyuTGRlyi/PIfqqVFFrlrgBgHQuWMuicU1naNDM0xlTvPe8T0apjp3glmImqWRvjPkVhSQy6yBThxa0u/iW+gjHovU0SYZIXu2/Ala3EUANB3vwxuh8s+i7QSTAg2CCPupVSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by MW4PR11MB7149.namprd11.prod.outlook.com (2603:10b6:303:221::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Mon, 16 Mar
 2026 08:39:09 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9723.013; Mon, 16 Mar 2026
 08:39:08 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] glibmm: upgrade 2.66.7 to 2.66.8
Date: Mon, 16 Mar 2026 16:38:24 +0800
Message-Id: <20260316083826.1550599-4-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260316083826.1550599-1-changqing.li@windriver.com>
References: <20260316083826.1550599-1-changqing.li@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0016.apcprd06.prod.outlook.com
 (2603:1096:4:186::22) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|MW4PR11MB7149:EE_
X-MS-Office365-Filtering-Correlation-Id: a6e71c74-e12c-4ce9-09dc-08de83377d7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|56012099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	4+K6LzxJP030V38dNZ/uqu0fdcUQw15z/LGfa/eBoZVrKrnqhe9Nv0RF01hfm6oM3IQUDf6H/KHJgJSgfjt20++Jn4aYoxCEvZGp5CVp/fZR+0At/Ln5ivjCx4qro0qcghcM+UV3ldtu5pgh7BDR3DXOh9bSzuEve8AX+JZpuK76PMDiLFqo8oV5xcYKDP9BWgdrKHuvhoNNOH5g/nPBf7YYX2rDSgh2qYfqnwpd45MW4BFkWWkz00a6yXaB7nm0hQj58rsFYSOhb2RtNSj+0XvycpQLpEcGziQibaZ8JGKl9v5AlCp05lEKIQYXId3B7VhOL9kGmlZG80SiWmFT/b1O2Evf9Gu0ezJW5fZGsQqEnrM7iYb6ACMVlrtZnsfQ8vgCPc24+0IOYckXFF0TgPh5N+D4sVn6uFhb//Yu164dw1m1Nhf+nSyl5FXvMgEDycKVo4Er18zFy+Chc8akEBQlD6QtvVx7YYTizizI9jviqXCJPADNon8WvM2NSnt1/ufgsOvsv8oddETOmfo7xrdBQqebOewWbZChwaHj482FEcXCsu7s5sl1BAEIfKFIuEIFdVXO07szGX6hMgguTQzGSlZcDR0OwXIZoosTJs474gGVTzD8OogctG7J2lxNejmY1l0ZuLxlXVPNZ8zktZFvwoRV/r8RsO8J8wSGTH7PsrBcD4IURTuCP/V+ABsuvjKM5JdjAPr/HgI9DOtPOSdLp8qkGcBZtXCXN4+8ETyzNLtyMSEnQh+ylZdBm2ero4qgZ25Y4ttmTs/S70orSILoFFMzWWn/cEcbMNpEZOg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(56012099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HrewxpEIZKkSxOh+4C5c6RBVZRvYDMd+XB12LVI9OiDLm1LSgzgc/JfA2BEh?=
 =?us-ascii?Q?OnRPJADPKwvQFiyrq9kdRglWRNLkxgPRZCXMpSxRd9YV1X4qlYoamr3LyJEU?=
 =?us-ascii?Q?2Z6srMBGQcFZgavuVba/SfUaBunQ2xH0rhuVY+X+aaX1DE6PcI3kKNlhR/xW?=
 =?us-ascii?Q?ldHtWTuDTavqTs1x3tr1Cpqb1J/2PSB1rgTG35PWkv/e7wJiywKXbcBHojlV?=
 =?us-ascii?Q?3vkfg+/j6/QJtn+S/wGcZ1hlGVBezNRks7W6Ud+7WRX01nRKR2Hvu1cqBkQu?=
 =?us-ascii?Q?XTdxm3WfDAPD5w9quIhg6k8O8V2YMj2lWgfTqir7Clq8UUWM+JJLGXvnWFS3?=
 =?us-ascii?Q?kwXaO9ZUTRW9oN21YRf3cBAy6CnpXgLrt33uFHhRd8/6FOd5EsgaesVZR8/s?=
 =?us-ascii?Q?ql71iI507SzXIftI10rKAggTorGvssu0vUwY3EPRLiYh7UJdxOMMqO9wy6iM?=
 =?us-ascii?Q?lImhUmfuvYBG4xeKZo1bGaHa6CE0q/nBCx4be+qSEHGrPDub/Y8r14yTzQSv?=
 =?us-ascii?Q?dnGgoy/F+UHl/OkfTCruLgrqJd0u7aVHjvyTjmesy53Ip4I4xfqyQJpsJvil?=
 =?us-ascii?Q?Y67Osr0kyBCmQibP3147w1vdr8qUV3OJ6ZrLLnF4xqJZJT5NLQGhYyWghh7O?=
 =?us-ascii?Q?RI5kRx9ZjGAT++XYqnAbFr5r3MMwwQ2pqVAPAq7u67AOniwWFh8wAaIJq7uV?=
 =?us-ascii?Q?tb8TClzBuRMwp5FfsGSmhMUgeSUZCNzH4OUME1oIaBT6xf4G9QGfDgWAF5bF?=
 =?us-ascii?Q?EP/xV12ntEFKog32Uz2vE+06gAAQRerMan+xGwQmOc9uSv6MedLBk0mKBi4s?=
 =?us-ascii?Q?FCU7u6dwGbpxY/4gqynbQzXLs+GVGy4tI4PnmocFncKnmKuWAn13VmyEJR7F?=
 =?us-ascii?Q?6DK/XtiyXvlmO52HJLKClBIPslz3x2psVN5OSaIzGPVVYbTyJ3XIFavYzjCL?=
 =?us-ascii?Q?U7n0ArR0S/be8Kqrnk6/thZaU3g5D2LLwwdToAP80RMAX4Kex5wrvbtqfJoH?=
 =?us-ascii?Q?Lkpvyns5ftZprPlZ8jcLDT4TodmkHVTpVJkYaiQSzwzcVm6Jqs9OETocqfqM?=
 =?us-ascii?Q?Ig6/7xYGc1LJJBQW3uhYhfi4GOvhvUuX6+S/Ykyr8A7Xpo8gdiusQqMzsKQA?=
 =?us-ascii?Q?pey2r2X2Q4TaN0c+F4cSPvUHnvW+qZyEQw5z9FiQB7FvEapcqNSxN5P7tkI5?=
 =?us-ascii?Q?r8L1QqiAmjl0Y+9+b4YEFMC+GFnMrZcIISoNk7pzwI/u8e6vjfHur/cZ+nHS?=
 =?us-ascii?Q?/N806Magqvkr209pY6sKS4+inm3W0oWDI0rPd3R+Q1C8ledQmsBsTZ4iXWrj?=
 =?us-ascii?Q?iyLqeTQsf36Sz6fl5qhlgUibR26QsNHIYKHViQC8Gn0FIFeb7G0pZsSx/v10?=
 =?us-ascii?Q?b8lAkUSL4rfXGXKlHSdLE/z9LSsF8RQFyFLwpWiiImA/2IM9LuQuUyrdFnvI?=
 =?us-ascii?Q?XMkARSjSPkj0xvotzuGjooYjScRZx9xxyBTKG/wXyKuPZCmsIcYu8OwRRyCk?=
 =?us-ascii?Q?MR2ARfS0GC6bf1U8Rb8rudJtC6qfmor95qy6qwO7D2xrtZ5MKQY2DpJGE53z?=
 =?us-ascii?Q?PXWNtbVO20gHdV+9I0l3wKy7V2qHptSEtAsnP//EhR/Od/OROmNKkawCoB/B?=
 =?us-ascii?Q?Yo+A/K9PDFMEhKCNG9cDGq1CLTCNFF55q7pahwyFg/hSHaMy2ZLmJwWjNxLt?=
 =?us-ascii?Q?WoFQOFsJX8HyCKgokfyFxCORkA/+rS/l68EHsiIH3SvwppNkjcYVVwNod2a7?=
 =?us-ascii?Q?34X1JgQqrWHZ98ORvzmRwON8GA93Vpc=3D?=
X-Exchange-RoutingPolicyChecked: 
	sQEC0HiGAh9oqCDnX5p1bf3sjNtR4YIzAoL2HYgqlY3M6eiQqPDCPieshlknc2p1zqN61lmboutbVKNpYrFUW6V3l2KjJXGVrpIBjGkqxJ5wxT2nC3OaOdxlanst1QZ1tuD/xPwXxJCAXdoXgB+4p5HIO0OIMQi8nvHMAidK8EucQjcFwyJSQfIcl3BDb1VzOe3Gzc3X1CInkA6bc9ohhghDDbaSmiErExkRszmknsIxyGaAAsEBr97Jnl7gBFkdjqtVMnWMrcBAVB3X7x2cDwBv8qaOh4yknP4vmkpMk69lavBr6w4JdYDfQh/oE30KcGIE7HgCRhV4owuZfh0a3A==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6e71c74-e12c-4ce9-09dc-08de83377d7b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 08:39:08.8077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7XVE+lwIGAGOTfnj+5/zNjqZhEiOoLo/16iwdtH80Ah4swkKspYs6assm1W6yIxBO9amI6LM5MlVBmnaZawtE960IfSIKczRAfjNeeapl7c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7149
X-Authority-Analysis: v=2.4 cv=S9nUAYsP c=1 sm=1 tr=0 ts=69b7c1b0 cx=c_pps
 a=xBk5Uq5DOFf1FlsSGvIvFQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=GHR8O2WEAAAA:20
 a=t7CeM3EgAAAA:8 a=mzt9fpq59fl3mWknDioA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA2NSBTYWx0ZWRfX7sIoF5vvWESE
 E7SDabgxYAUWzbCrt/P8uamp9TIEfTuVG6LTvGEEKQK9alHpzmVQXKAsFUYaXjqtyTQQmBIA7wO
 5MBPkJQlirrp3M0WKrOaxZY3Pjq9kJbPgURw4svaqQdhlpHIWH0SLgEF6Jhz96kSkCue33asToQ
 ZaVvPknIFeqHHfNsKcu8+33QCbTL+PqQ641ywFNmGWc26eP9Vp8v09MjeVqWBkNw3YGfHhRpguU
 2PzVzp/ctFUeEVb+Ypg8x9Uo2JIu7CC6MsJnbPqMWmzLxHDx5qC5Xk+7KgOBh5tZEPQZYDXLCyL
 /bsHlwV01QPtXZnV3/VfMozskk9i7ZZwOzKMQUml8fO2SenFTJdcrcRUbt1fLCxWJ0/7SzFlG9c
 tfq6E9qjJKqbO871d1zkTg2232HCbOgRIdNq4RHOMYgml/q3V8Z8yaaWjeNj9bLWY93q19F2QEE
 dFr8HKqGsrRWlzgxrSw==
X-Proofpoint-ORIG-GUID: 5tkRioKSVrzmrR17wZu9h01KAOE9qFb5
X-Proofpoint-GUID: 5tkRioKSVrzmrR17wZu9h01KAOE9qFb5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160065
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 08:39:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125261

NEWS:
https://gitlab.gnome.org/GNOME/glibmm/-/blob/2.66.8/NEWS

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../glib-2.0/{glibmm_2.66.7.bb => glibmm_2.66.8.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-core/glib-2.0/{glibmm_2.66.7.bb => glibmm_2.66.8.bb} (90%)

diff --git a/meta-oe/recipes-core/glib-2.0/glibmm_2.66.7.bb b/meta-oe/recipes-core/glib-2.0/glibmm_2.66.8.bb
similarity index 90%
rename from meta-oe/recipes-core/glib-2.0/glibmm_2.66.7.bb
rename to meta-oe/recipes-core/glib-2.0/glibmm_2.66.8.bb
index 7c7a3fafb7..e0e52f2032 100644
--- a/meta-oe/recipes-core/glib-2.0/glibmm_2.66.7.bb
+++ b/meta-oe/recipes-core/glib-2.0/glibmm_2.66.8.bb
@@ -12,7 +12,7 @@ inherit gnomebase
 
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
-SRC_URI[archive.sha256sum] = "fe02c1e5f5825940d82b56b6ec31a12c06c05c1583cfe62f934d0763e1e542b3"
+SRC_URI[archive.sha256sum] = "64f11d3b95a24e2a8d4166ecff518730f79ecc27222ef41faf7c7e0340fc9329"
 
 FILES:${PN} = "${libdir}/lib*.so.*"
 FILES:${PN}-dev += "${datadir}/glibmm-* ${libdir}/glibmm-2.4/include/ ${libdir}/glibmm-2.4/proc/ ${libdir}/giomm-2.4/include/"
-- 
2.34.1


