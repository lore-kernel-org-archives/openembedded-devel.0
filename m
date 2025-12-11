Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 266A0D41C02
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 08:10:01 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4517.1765440591371188064
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Dec 2025 00:09:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=TxJDqLyv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=444099e962=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BB55miv928255
	for <openembedded-devel@lists.openembedded.org>; Thu, 11 Dec 2025 08:09:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=s7BbU/lVx9KmehFu86g9
	tp/Pmma08PbBcXyTxq33R5k=; b=TxJDqLyv8U1yw1Y7N850g97cqhGkOZ+1PyT7
	lMTAYbOVOty3acFSdnxeCQCxr5bHgXMENrpDMUkD53aOIvgyUOF4dh+cIRlzK6VS
	+MndSnTFeTi6XMi6EciSBUuR36Sn7spSVseEMWfVTiKyF1PaenUwQGg06yjRtKLQ
	R2nNKcS1YUSK+v+kQ8ZMs0Yzx52MpmLUHwJqFaP+Z55zMVKKtsCT2lX8GdR3ZKsP
	GgWLzaVpsSFLr0WNTharQqgA0dc5b+6jbqVMTUDjUjpJJfgxt7iLm9p1dPcx99Nl
	qazdJwLUQiscmyIxBGO3eNoLlr1NI2UEWXnqva9g/BfACMnvLQ==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010052.outbound.protection.outlook.com [52.101.46.52])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ay01nhq9h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 11 Dec 2025 08:09:50 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ouYKeqDMcT/6R0aCvB9fhUtF2NZ0U+UeVVL5OZ3n19bSWX6FUrXrmmW2M7okQxQvIxFUmPkDbWxX0xtfK0cHl7GgKGQ9ipdEP5LH6J+xB5MP+u5Mm5HkWvHJX0GquytJlLPAl8iSOdQv4dtIWutcpFrtP7uJGY5d2+bJ/Ir5EfTvrEs9ARLPEJsms6uxZKpYBtIHCRKsmpIv8A8UfhxXREdz3yMHyKxCtSJMT9A+1pB3oFeu3tRGUd/H4I7bpPP0W+0lWJnFTW27/7AZx3EnROdXzC+9tjqDFqJF/UrHxm36UUiqyRfebVvqmz2lTn0V4TBlc5KsvCJu61Q3lZ9Ukg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s7BbU/lVx9KmehFu86g9tp/Pmma08PbBcXyTxq33R5k=;
 b=rLBQBG0P6wiT2PKam/IjR8bEMQe2Bco6EQbHh1/ikpfP71IYiC+0GoK04ECM+Bgeo/BgNeOQVTWbto7kntoK5OEZJRQQwY9/roOFOga4g/XzCfUD48HIwid4LYGAcC0MEXfLGIp+L4rolTNnFAaD605MIAFVre9oZVVqrk23PuNj1B2zOqZ3m2b0KdTaD694imC4Llg8GAI1W5dv4ZkdBgEgfGVFfdCLT5Gbah1SJRnT1LuMUklLGPfaZ+NkkesqSp5MxRqrzsUz7yu8y1jeEocZ/sP6yGuIY8BW36PPEYkbh29oyGz0lXfnZIGUc+CTN2YoOQEsG/zxRzHz9OgY8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SJ2PR11MB7545.namprd11.prod.outlook.com (2603:10b6:a03:4cc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Thu, 11 Dec
 2025 08:09:47 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 08:09:47 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] conf/version-check.conf: skip version check for glslang
Date: Thu, 11 Dec 2025 16:09:30 +0800
Message-Id: <20251211080930.2296025-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0052.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::21)
 To DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SJ2PR11MB7545:EE_
X-MS-Office365-Filtering-Correlation-Id: 34d80a79-490f-4894-04c5-08de388ca67c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?8jVISZJgXJIfmjoTcnXU7Jegfl81W1alouwbjtA8HlgyrIF/uKEt6treYtYX?=
 =?us-ascii?Q?Nim8s/OgpRqY5Ee8Z+2+F2EkZKJ49YZOM7V3d3MYo3bRvaYIXJl5PuonAghU?=
 =?us-ascii?Q?kpjfKNjivxUcK6OgqKFCOO5IEErshnI2oGcVpXMyro5tDPiRQr72pivoZwkD?=
 =?us-ascii?Q?fvHbIkepvFGIxXTU618VyY1OGGwSSNcLMZ0hkZHWd84QdStqAOjnH2Lxyz0W?=
 =?us-ascii?Q?k+Zrd32f4Malva6CeeOaXgt/I8K6v0uZaqU1krvN36INNtC097LPG+inhd9V?=
 =?us-ascii?Q?xmDhahnRLGnBg9RJ1i+bSKGZ35DEJ6zUzEq7637rdHwB6iWOy5Vzkh0VnXX1?=
 =?us-ascii?Q?4OIKBxNn21rOM7BpdGrDgZ79r3AoQiXOPfb6zGwaIpzVx1PnQGKijvwNdqEx?=
 =?us-ascii?Q?02TA7eq0djI8jlFQS1Hefqoba8vgss3ruXfIxnvuwydqWLyLXQVtCb5oEAB6?=
 =?us-ascii?Q?D4tkcKU2GLCKTFlKCWKdTngvuhwvb7V818E663qLUVpMj0vGC7/dGN8jufFS?=
 =?us-ascii?Q?O9qXfXEPgD0OGEqcF+xlSM40Qppsxi/kkUY8FBl2KP8njWctCY7tYvrWWdrW?=
 =?us-ascii?Q?YP/h9Wd9dVnLC2h45yfs4uQq1BENX67iZresgjy2vuQp76kau12jVjVF4xbf?=
 =?us-ascii?Q?Snb4a8rkNrZu4YaAV7KGW9bHYELaOG3cn9MhyO4fS6ULXKfX9jWaVhELc4bq?=
 =?us-ascii?Q?6vX62WmMGX4XAkGUmJKAehfQcqEtHg6SkVe7pc/IbsBZ7sjH4z6Zxjdm9qAF?=
 =?us-ascii?Q?NElqN4V5B6iFdGKW7zXR92kQ08c4IBHE+1sWoixKTMWXdgFXsMc3hlvVm560?=
 =?us-ascii?Q?kswohgP2Z95AGvG/6iKWD4lSAMoIliE35S9Ve/0NvX9GyirA1CpBMq8JmZvl?=
 =?us-ascii?Q?jXB/MkeB6Z0oMRO3AfAMPUsgdVmj4LDHBB3gxaKoFcMWHlATj5XuKL0r/Eot?=
 =?us-ascii?Q?DbRmhbkFC5VAQPXM1VyeNP9qqdup7aTdsUVqf2PqvHckNhHOz32CKBDAv+ne?=
 =?us-ascii?Q?lt0afoCQ6zTgl2wPcLXbbYfyN4pHsCvolbaTH8sFJTeJK/jNgnA3OJHo+c6J?=
 =?us-ascii?Q?EWp/U5S284jipnNWFm6Vdrh1tNVclHo4BZgx2Wyzf89bRJ5c+ubKYOZ3xTnq?=
 =?us-ascii?Q?langgITROmTz/1zl7f1qutdzkkrextLEX8poqX881r3JIHMv9Wayg98QUA/a?=
 =?us-ascii?Q?N+C7Of9GlsvS+Nd4U+oMAhEOFhR2Y7MsoTKwj+8ZN26H5n4kSuIQWiDjx4zZ?=
 =?us-ascii?Q?77gfsdULQhhy65h0YTUxC01A2LujFyT+bI6JrXNl2MDFOQv39mQQgxy1DJj8?=
 =?us-ascii?Q?PK0RTPYx4TGBtXFuTNc+c4oQhPiX+Zf7bBwSDpVdZf964jGQyh+UsIbb4KLO?=
 =?us-ascii?Q?dkPos0gyCCtzQhW/4I7nOCZXW7tfwphZnpV36G0zm4rRwtFT684Emt2uGSKx?=
 =?us-ascii?Q?OzrBFSBqblgzUcyw397eaI6wgSOsrPEvfb501LF4plHrwkHCIAgWLjgdk7eN?=
 =?us-ascii?Q?NRU8F8tkzwW+2wluiQXLnLyDXfqgx82uMO3c?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?s1f/qknXyLLF3m70XXf/28bMWkMesEo0QQ4oM2uMjV/J52C4sKBFKb5L/t5J?=
 =?us-ascii?Q?BYw1Tnf+o8AIiCOFW97xhJ0h0C3PAmuuSXUnxtKzF1q+6HuvLtf78k+NNxaD?=
 =?us-ascii?Q?RfmKwZBBB4SWFDrEaOkLq+JhAmX4y8Rcg3b1ei8Ja5+AfsnvPKptx2xEUtV6?=
 =?us-ascii?Q?DItKn3XWgACk8j9TeCtcDQd7NfWCNvmiBaTSQqszTyu0kNQ9+kMexsi3SVb4?=
 =?us-ascii?Q?WdY18UEWluiAKBOFbmkMjtKfGF3I94tDQXtKTR3I2FA216iuO2HxdgQzHqoA?=
 =?us-ascii?Q?54reU3vnQvlQefJcFyBTLb0ywAAZvogPEyRWe6CzFvVrK+bz3nl10PVutm+f?=
 =?us-ascii?Q?USrBsulPFYJ0vRhGnQ2MszY7pTzyq3cpr9m2BWnDHw1CbE8ra6/vC+D6fWZO?=
 =?us-ascii?Q?M55CqtVvKdK2RpD9C8ZuscFRE2SxM9vjUv/T5UbOny8xZ1RhXtEt4X+s9lY/?=
 =?us-ascii?Q?2zA5LS+E5XF+iOsjJxtjTVK1TooH3SXiB/xERCsZW/VK+22IMMSqHUfeks3e?=
 =?us-ascii?Q?c2pvOdtr2wO5X/V/6tdndWjSaU81yafRAMXz2yUJnKfmLut579Aniyh4tO6Q?=
 =?us-ascii?Q?QpDgBJrzpxeNS/JIssdQOyfxj+J4uElf8spkIEUb/jvx8ON2tQczAB74+S40?=
 =?us-ascii?Q?pz45iC4G3eCwueMydeYkQmTJPzlUPpJyTxdaAKFBhNCAb5HmPxr1ozD1+SpV?=
 =?us-ascii?Q?McHvkOO7JptwdVGp9/nffepgbCHlcm0u3/INav7NPFh50UoREn8+V1j3KDZy?=
 =?us-ascii?Q?td/9jGbcAFDgRavjZZNlKa+ZYEc4nGua7/mb6p2hzhuD5RT/NhYLf1IcmUkf?=
 =?us-ascii?Q?cUqO477du+3G/2Dk0BYBJxGQ6kwjwkq9DtJpf0Z8W/ow2YDZmAowKA8qiBRT?=
 =?us-ascii?Q?CygsGMPMZIasU5WUsKZadpw7KOSkxkI7tJQwYsfxroyabRq49omG5darTsEZ?=
 =?us-ascii?Q?IifS1TheX6rSLbNtFKnhOr4hn6E4TUUIgixiODBn+rXUq2UtUcULU6UUDpob?=
 =?us-ascii?Q?DKDghK2j/RhhoYF/G80+xIgjx3VFziOnh43IARhmMoVPxhJK1H7k5GMvW6Os?=
 =?us-ascii?Q?bkkAoJi7bFlqaX9xedtqV2QAHdC42NtTtiCfRuraTUC3lsMyIXLXEBwbkvYW?=
 =?us-ascii?Q?bOiHiR4yPe8OZ7X0ysrY3oRXulx7Nr1BlK1ugyonFJeNeCPjrz6LPLIrcEvF?=
 =?us-ascii?Q?DrXASgqfxAjQtKeLd5hV2x/IWvhTqKHBhpcj6qvxzGrljrRB81y37uDKAmBO?=
 =?us-ascii?Q?m0WIZKjTnSNYKRODljQYjjUPjoWKhe5UWfuE0BaUFZvQZwOduGc6gWaeMOwa?=
 =?us-ascii?Q?ElzSA5zXmAPpPYGaCUkwoeI6qK7QwXmZ2g2H6YjNgrPLyRhf2AgEVkYPQqBK?=
 =?us-ascii?Q?slvcI328Og6TGo4dnzBwpcLHuHEPORok9In3QIDiI881aO7hWdYouLhgvoNX?=
 =?us-ascii?Q?/2m/smWOsjGjMEKtKFcPz7b+caFYg1X5RPln/pD2Hfz34T2dKF37FPZcL6VL?=
 =?us-ascii?Q?8XYM1/u7ElYrvNmJAucltTN33tb+7jDOH7GPCtL9FTm+UrFNCtygRI9c3IGU?=
 =?us-ascii?Q?YKPHikuwBMfrQuIdOXllkrZZV44dKqSC2+qePX07?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34d80a79-490f-4894-04c5-08de388ca67c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 08:09:47.6609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jFdMvA6+ZSoOOTto9Iwh9sJNx7xqeqQkyMNvQZI4F3CwRO8YlylxU5Py4i0sIUsjbJiMYy1kq5YA4LDoWUJ2ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7545
X-Authority-Analysis: v=2.4 cv=d5/4CBjE c=1 sm=1 tr=0 ts=693a7c4e cx=c_pps
 a=5/iD8UG2uIJM/AKiuvK9Ew==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=bh72pKv4iXp1tBXAHN4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: oB1EL4kFuYq8EN4ZMTeUH_hqaI9XvyMH
X-Proofpoint-ORIG-GUID: oB1EL4kFuYq8EN4ZMTeUH_hqaI9XvyMH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDA1OSBTYWx0ZWRfX6vyXOE+hWoPd
 7V6wBIi15ZwTHl6MQHFDAlCsKdOHvWHggCb6rUqoWxewFsuJ5qLumyavOSFXlfwnEF8ZYQ4Turw
 mCgeQu6FD9cL1qaxqHiL44YDHJH/8uhnFFQXQW7kbd8z1qUas3qqpsdnB6oomPRcU/liknwWwsX
 85bi7dyeBkYmws/abZ5nF+IvvVeLJ0Ei3KecrUXI1Wfhq26rQJdyD4rKfbvbxL/Wh7BEVl4qgJZ
 V6rcf5fIOlMrbDtz1GtpGKzp2lv4PCukz2djQcmTMSyRtsKIfAM/d+aUehNvrqzOSWGUlC2xdHI
 zJEJy6+4IZyrOfq59AGNXOoGLffkfbhJOPbobC+EaysgQnWUNZleUEDESJs0IoSbNoLC00MwPlk
 +gpKGdyscP5uibb/O4Cqip8xQNK5Fw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512110059
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Dec 2025 08:10:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122583

There are two different types of tags in glslang git repo. One is the
release tag of the project itself: 15.2.0, 14.3.0, etc. The other tag is
for Vulkan SDK: vulkan-sdk-1.4.309, vulkan-sdk-1.4.304.1, etc.

The vulkan sdk tag is used for glslang in openembedded-core because it
needs to update in locksetup with vulkan, which leads to a mismatch
between the runtime version and the build version. Set CHECK_VERSION_PV
for it to skip the version check.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/conf/version-check.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/conf/version-check.conf b/meta-oe/conf/version-check.conf
index 3ff0bccfd6..5ff4e80285 100644
--- a/meta-oe/conf/version-check.conf
+++ b/meta-oe/conf/version-check.conf
@@ -20,6 +20,7 @@ CHECK_VERSION_PV:pn-gnu-config = "%"
 CHECK_VERSION_PV:pn-sysvinit-inittab = "%"
 CHECK_VERSION_PV:pn-opkg-utils = "%"
 CHECK_VERSION_PV:pn-libedit = "${@d.getVar('PV').split('-')[1]}"
+CHECK_VERSION_PV:pn-glslang = "%"
 
 # meta-oe
 CHECK_VERSION_PV:pn-iozone3 = "3.${PV}"
-- 
2.34.1


