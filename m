Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C744E7718E
	for <webhook@archiver.kernel.org>; Mon, 23 Dec 2024 15:41:55 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.15641.1734968513432787095
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Dec 2024 07:41:53 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=208786e404=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BNBt2S3030729
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Dec 2024 15:41:52 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43nmn89wa7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Dec 2024 15:41:52 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O1MqIA7aN7JOKcnaXRb0rSR5EHqD2z6gsSni9JGCxus1dLYMGt7er8E+p1WMHM9QInWQAUFEHwKosbvjq9uIV6ygr0na97BxhHC95UfhhovMdgfLF+F+JcJW3lR659RXknFzRmrP/gGLh9T54z8VKFPtvaaVXOb4kicyGT5WFqSZPhPuXF0hTWQVFTH71+V8bgT9hdBgHghBAW6Ppl1nHtGmYV6ofFJkfmYfs5pHHxPJSS66vC24ukQB0ThFz/CIC0iLZ7fncBtsmYb8z1OSOPve5XHzYSnfGe06hYL17T6UvDbBEXL18xGtUp+w92GO39iyTJ1VIOzlkWGyyrc4gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7YAXEl6a6+5kaMAFpQGCLjfQ/Vlp1Y/LOf7iVFf4DVU=;
 b=nXBTZHCph17HOHxi802rEYClMmdddMpNxKLLqm15/qHduKtd+OO2bfyyBpgZPgPiHPhyzoM1LcdeY8q8EjUsShuMW/I40dBOhmHsZHMsqsBUOPAZaMv5B1o7B+UONqUB7jxXrMkPb2KLg96bRx5anSRR3uvsNBC/tmLTUlgPV8Etalw4ezwXS0K4enDveeea3yUi23iOxxD1hSQNdWtfYj4Uw/ccnJsLic+jfV61n3mQMaxxH6yLILNBNG4zMMC3JkKRv4uNJug4UG74HFt0MdxnW4fku4w6BleEV7i3/ZxdpqB6lI80TMiiXrVllFvw6tkF4QNqNoh9M5tqvnlukg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DM4PR11MB8203.namprd11.prod.outlook.com (2603:10b6:8:187::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8272.13; Mon, 23 Dec 2024 15:41:50 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%7]) with mapi id 15.20.8272.013; Mon, 23 Dec 2024
 15:41:50 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 1/2] python3-kivy: cleanup dependencies
Date: Mon, 23 Dec 2024 23:41:32 +0800
Message-Id: <20241223154133.2955396-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0059.apcprd02.prod.outlook.com
 (2603:1096:4:54::23) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DM4PR11MB8203:EE_
X-MS-Office365-Filtering-Correlation-Id: e3318677-02b6-4fef-b310-08dd23685140
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?raZ8bSK7hjScYgbvVfUgvK5s7krrLMDq2aJrGoUkwo9a9u6sjZ/KAUs00wfy?=
 =?us-ascii?Q?p43TSn6gqayifjihcVbQ5BQ67N8m+QRtttfnMBlt14X418UX6YfC61lzI+xd?=
 =?us-ascii?Q?+JYQXuJQ3dwnOuT8F6vYbgJbddtPTixl82zsmucRs2nYsJlm5VW4sog6P/zG?=
 =?us-ascii?Q?PNNeYnQbDQbCKI+fky57GECfhkzvkLEeopt3Lwo0ddM74P7J299HQfaYF6mX?=
 =?us-ascii?Q?cd4nDxm+bGX5shqHPZQ+KFWIhZGMhe9VpGF57/7PVSrgNsU39kjdUBBxOhqD?=
 =?us-ascii?Q?dp7EGHnA/04sZ70y/aqcDUtz9y6jgaXOwMPkMooTBnmCHIQ3VAO7hiKPjJSk?=
 =?us-ascii?Q?dTGjwdzDQN9LmBsNz/wwcF9rQ1VJvPkJc2qvL3PDHf87qbaMGYO7eoEpeqK7?=
 =?us-ascii?Q?EVEAqc184w8ELluL9UZI5uJZGRxKwMzYE4O+n0RJUjvA4+h6AO0oieM0Zy89?=
 =?us-ascii?Q?R5cO5M1x0yMvKojaZeuAFbBBJZE8YVDm8UwewZA7uHzwFXVEZAjWq57ApdAZ?=
 =?us-ascii?Q?3K39V2QYpeYG5mrqJcEAOGmJsGWE//n6zQGDIWk0LxGZnZXx0GbVQH+lDQwZ?=
 =?us-ascii?Q?cnSotYW1W81IBiCIsyRf0H8zgDgAudRllrRredqYyIWglCsfE9Ji7QHL+yR3?=
 =?us-ascii?Q?JgTEvddAlny0CVieSIrGyAiGppyuT4DhPDNzVjh3yrNFu2TnhogEjGbunaIZ?=
 =?us-ascii?Q?Fio92xZbzmmIV3EyKhGi/ptfJMONHyfvyu5hkwMLpHz6Fa0obMmSxcaKFv8T?=
 =?us-ascii?Q?C94JH938pV5UZRmARFTWPr5YUQVqAnYrsTjjyN11tTTnITBTyAbFl3Mc7Z7G?=
 =?us-ascii?Q?J6qgfZAF1TK/euWyTC9kTzYOWsBXOXWKyhdLk4AHAUGtob6NKpt1WqpQ5LBO?=
 =?us-ascii?Q?JfcrFssHS1ik5puQBoH9Lun53DIHqINMzGVKxxJIjtQVInDnWFJrbQHK9Pcw?=
 =?us-ascii?Q?nD3gxBmiTj8vDFB0dTg577px0X7/0Tc5zA/uv25nhV1WOwJ6qw43f4g9khoI?=
 =?us-ascii?Q?3yqEzWEFJHqJp1kl8gorN9wv+kv200Wt5m+jxPPiZRWZg/NID25Ng2E4+Ao8?=
 =?us-ascii?Q?PvP86oLFcoSEUfhiwx5vlcWoRr9i7lS1gfjzCBan4YAWw3Zf9cM9xQJzGmmB?=
 =?us-ascii?Q?VxHjlwg6/P+ZaO1kvmjUwrcTCwnbtjfJyje5v8+SLX1SNzFJ/iEEEbhx9k2F?=
 =?us-ascii?Q?EiV2/QuF2bAatKwprOY4tFlWop9WGROfz/ivgBrYG/0tYPPxQwO0Hglbelvo?=
 =?us-ascii?Q?wAe3rftEjP5VkfPuoJrH75Ya5ISRPdqjxP0X9nJSaDedL6nuy0epo21RZXrH?=
 =?us-ascii?Q?BL9H/aS43PzmBca16r38uSqkFmugfueIGRGWG6tbs0mDT4lP7Pzy1QKVDKMG?=
 =?us-ascii?Q?vBm/91UbTZ9M+PwFa/nsRNXo0gVQWTbC6cfaIoOdPsrvbh9S3Ydylk0vUkN6?=
 =?us-ascii?Q?CfKiIOH3et4Wm66nyiauHEyPQdeGciIf?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?eBegkUDp12G8OVdiG9WRBB0PxxsHP4k33HjUWqr4upF4iFhoOLH+cFIR84mi?=
 =?us-ascii?Q?XuYIww4V3Th0B1a74l9kHPpTYbwwhun8/8n3rwwZeaSRq51OKfHxu8xmZpWf?=
 =?us-ascii?Q?8ERelRxFtvIdnTzai7fD0JdTmg+jin0y78YIFJwxgyzZQ7PH42O7apLEP/kO?=
 =?us-ascii?Q?rXCTBDwrc1TzVDd1y0rGzrWCMMPdfP7D/CytvSpiZdQ23wi8rULWyUsQO/fg?=
 =?us-ascii?Q?OcgiScIKqGU/xI3WFvkhMFbB8S1hGd2SCAPVngsIpyiEf5XQeCB2czcNdJ5O?=
 =?us-ascii?Q?UT7S52IF5szK5ui5X0tDG2VsNVf39yULdnxBxJyYKpmVrCswky36RyfinJGP?=
 =?us-ascii?Q?rGI8TkC3lNVjgTKJiOCTuA/Hk9p28NIMFpNdJvgZp/Wp0wEqlxXhrIYFQaOg?=
 =?us-ascii?Q?qllJ//I/WYRFAolkenVJ6Us1D8x6rYgK/VCY9bnpgEuzxao7K2EvCFItWiEN?=
 =?us-ascii?Q?cXnmxn64PiE/+iz+1FV4ab5smSHkX+3BZDnLfw1GrBdce9GjPYzFro6Pozqd?=
 =?us-ascii?Q?jnmk6eliVGCp99BirVOQr9Oqwuk6Ygd4VKYZbJkQMlwP4IfqYtnud/RWB2GU?=
 =?us-ascii?Q?z4FEtfO07DxcFAUQwsmIpcm0z46U+lk2YLdIEVDUC13IQxpd1MN0zhoMG8ni?=
 =?us-ascii?Q?oKc6JgFtYw5Hldibi9KabVbAk6nSU5Jy1cE1S9AcAXg3cWVa1sh7KtWM6N/w?=
 =?us-ascii?Q?7uZfCuJGwN8rW9y2eEg7KXfyHbRoKU9Y92pDU/Ulm+auu2A2uIhO5mFYkGYc?=
 =?us-ascii?Q?TpNO0ncn71FvXC8doP1fpaiJw3Hgs+lG76+KDJ3yECH6EZsLqCz6CikIAhwd?=
 =?us-ascii?Q?Zh88zuqzKsdgMQdHWwXRS+IptKM9SMgbSRi1GQwNa04YKhbwITDH2synFXUQ?=
 =?us-ascii?Q?DurwOB2z6a1NA1DmJSFgt3ymhocN+xJUitkFz0A1IPZEzxk05EdPfTxpc/JH?=
 =?us-ascii?Q?Gjw8w60TuHSpHTYwbbq2QQrKIrTzJK8DQvovSfP0jnL/rBNT9hpep/MUNA8f?=
 =?us-ascii?Q?9YoRlS60giG3A/NG8Iwjk60+1SD4ktNL21QB9XlsHbhCoRtkxXF8C+ycpyIs?=
 =?us-ascii?Q?yixB/4V9Qs6OyQwfWYU7fR/QR7A2HjClYnKThd7feUSvhCCWsSA5R2pAi4q0?=
 =?us-ascii?Q?boAaw2pPToDGAVwkHLmLyHr0kzB7GlEdV2ZZeDIcArqpSjxmKnY0HsR1QnWR?=
 =?us-ascii?Q?TbkZYLGKM4esCzBTqMQYFE45QMaQnexw9s9Cx2XnazQBYZXLveLR9Nknjufk?=
 =?us-ascii?Q?SFQUfgDbfyP49dG4+E8PD4gWwFO9qQUKtZS23ai/v42uVpf66C6pstWD1Cl6?=
 =?us-ascii?Q?o83B7sjvpYjQTHSJYS/+5kYkVGZKNwZSv3RPvAuQ2GjHqJpE2Y3V4AUzbd+J?=
 =?us-ascii?Q?Ky2+wzckV9B8aYK4YKwQ70j27sptCOisFbEmMzmthXW3Gwhl3s5U6l/YSKQZ?=
 =?us-ascii?Q?UqmVIWN/F4GtWxyGtPSVgSdD7mVqKqigb+Her28gWqfsrPenv6qRUiLby5/W?=
 =?us-ascii?Q?uvApZaeem3VHWlcUv80caPUj76hxbEDjdcC9HjxcYuPVnCsDzNukKURsKZsd?=
 =?us-ascii?Q?GOfAYsDy5pnNCvqv0gT7ed9tdFKgMQbR9TtRn7F0?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3318677-02b6-4fef-b310-08dd23685140
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2024 15:41:50.6597
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ngg3Au2MFOJfZZaAf1Ejcij6dEBHZAHGiiohe5U/eQxfjy25Cda3E6zyD3131eHRjYCBbo5aqu4AB+I22EemfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8203
X-Proofpoint-GUID: Akt70UXaZdlOTihFu_23YJSFpyV2Jq7Z
X-Proofpoint-ORIG-GUID: Akt70UXaZdlOTihFu_23YJSFpyV2Jq7Z
X-Authority-Analysis: v=2.4 cv=CeHy5Krl c=1 sm=1 tr=0 ts=676984c0 cx=c_pps a=LxkDbUgDkQmSfly3BTNqMw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=RZcAm9yDv7YA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=ie-wI74eA0m4_-X3jHIA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-23_06,2024-12-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=871 spamscore=0 adultscore=0 suspectscore=0
 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412230140
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Dec 2024 15:41:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114469

Drop python3 and python3-cython-native from DEPENDS since we already
inherit setuptools3 and cython bbclasses.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-python/recipes-devtools/python/python3-kivy_2.3.0.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-kivy_2.3.0.bb b/meta-python/recipes-devtools/python/python3-kivy_2.3.0.bb
index 861ca32ad6..4c09e5d9e3 100644
--- a/meta-python/recipes-devtools/python/python3-kivy_2.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-kivy_2.3.0.bb
@@ -51,8 +51,6 @@ DEPENDS += " \
     libsdl2-image \
     libsdl2-mixer \
     pango \
-    python3 \
-    python3-cython-native \
 "
 
 RDEPENDS:${PN} = " \
-- 
2.25.1


