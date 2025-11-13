Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9249CCD4F3F
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 02:59:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15351.1763002756425783125
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 18:59:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=oyh8YJSX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3412a946d8=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AD2vgQf114160
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 18:59:16 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=QoxRxssRodPvfgkK35VbHmF4kMgc/cAd1t9HXMVs3Us=; b=oyh8YJSXNmlY
	ocLeBRidkS1Mjxqgcb6Ir2ELGDJ+v/NrfF/z+3qFo4ujtrvYmOuPwplos891RrS+
	QsWltkJCrKxG/Yz2du0hFPzGxwUc5NIQUqps3itXv/MuqgXV1qN4GPvZ0d7CldLR
	KwsoryTa81OSVjUBSUZiLrZSxZs+CP+LfV0OM39fPEsPjBMPWowbmStuPnyWrlQJ
	adbjm14PtP7NzU+uib2mGNiIeinYwhx8QKBKa1alfWWWAOY36dyRO2GF/s9nqpzs
	r020+XEc8veTMBnUClTkpUL2gPAjiBK+wP/FXUHFGk+ozOWo3ldZD09Me/zidnEA
	/fUiiPzYXA==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013009.outbound.protection.outlook.com [40.107.201.9])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aa2136f2n-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 18:59:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mxb0GjZJwndZPP/kD9ddxfBDBmIuD+WbkjabGSE4JkdeHoyOq6WYIsL1K3TyWEVideKWMVsKrlNJo9uhjTOPj44yVFkHnB5V/2A4VQNq4voVzvNfNJd+GFWXXAMMSwM9b3Q7kEWy4EqGUjDJZojcs0+r72IKzTCcORZlk8ZwHZHpL/VJwh1jBNOYWTFUszf6yTLgOICGuBvxgbNdJfqjcbyNTRG8Iz+UrYgUSaTgm9gYrm+CqIg8q8gGQi4S9OZnUSTslwn3+vm8vdAMo+GWlzXTufvWO8sMh0T9/JjcV9Hxa6EOMg/HmIw0NEk9linOk/9NORJZkgqURDSGt7glqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QoxRxssRodPvfgkK35VbHmF4kMgc/cAd1t9HXMVs3Us=;
 b=xtfEID04e9QpXojKC//bmxIzICOGFFXDvr7pq7lSuZ/OPKiMEaj62zxdk1oFouI+pzPrJ65buSc20pdYT6PzjgZeZ+JF9LXg4BNL1hWzt4Otsskx+jBe5UB4CdVxeRAACQfOAn2fiitgza9wO8iWFwVYR/0E50YqaftFEf3jILZCUu57YoSvheE/YbByTBJL8sp44sVQs0Oa0fVqfGddDIY6e1hLMCrbtxmzJ82Rsd+jpv97xFKvcnevJ0EfWpULLT6QWuB9FSW5QfZoW+EMkYg4Fkj2eFvjlFnmIaj0sXkB/qJvesgHIsooWUdPIuGeyoELAMC7YI3gGFCLC6bFyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 PH7PR11MB7570.namprd11.prod.outlook.com (2603:10b6:510:27a::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.16; Thu, 13 Nov 2025 02:59:12 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 02:59:12 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 03/11 v2] python3-lazy-object-proxy: add UPSTREAM_CHECK_PYPI_PACKAGE
Date: Thu, 13 Nov 2025 10:58:47 +0800
Message-Id: <20251113025855.1520038-3-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251113025855.1520038-1-yi.zhao@windriver.com>
References: <20251113025855.1520038-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY1PR01CA0197.jpnprd01.prod.outlook.com (2603:1096:403::27)
 To DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|PH7PR11MB7570:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b10d6b6-607b-4a31-3cb7-08de22609f56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?in+77GLjKCLTx3SVHdB9/K6/01eswSan6ZLiOSc1+6zS8ue0d4ECnC4aw/07?=
 =?us-ascii?Q?q73zN5w5OiXgEDcujLL1SIXszsGTtf43ppyuNm4/hAaPO8zl8fTbP0e4rSKk?=
 =?us-ascii?Q?r5HCa6WO/zQa8THTl0Yiqer/0G4wRCUEe4nq0KZDT3aeeXO3ubVeKQuaw7zf?=
 =?us-ascii?Q?6/MmgPrsbHLVCkVs4vABLXCt6LfR3q16yoMUJJ3ee8ulcVj9KaV5ZdRymBXA?=
 =?us-ascii?Q?FsGgj1N/0pvrUPNtqxECy2RKc8aObpFiNhstJaJVeEFe1tIT93GuMG2y6/Ss?=
 =?us-ascii?Q?Oz1k6rRaYsIBP1wslQaL+6bbK7jPZflyfOFlugUJ5M+8KeacKSc4tEnMvdAJ?=
 =?us-ascii?Q?dsYxQtE2awGPXazeOiUdEM4vLUgwtkpYGQszU9jIAzyNbijk1+iGAYht9+H+?=
 =?us-ascii?Q?rJGe0U19zYyQOnorh+supZWKjZat4zuAQ78bCRI2gM/Vkq0vGR5VQtkg9+PM?=
 =?us-ascii?Q?p/bkZ68WRqXEzUd3pXZi7sy4L4dwts6U6K44g4lcqlDLykeH7xhFtuyr12gS?=
 =?us-ascii?Q?du1yJLTl1a0NWk/8QEKuYwJfCVp9imXc3qw2oE/Aw4bKYe+k5O1weZh3fSsG?=
 =?us-ascii?Q?fabgSPRBGVQynPsYTF7f/370sBSoHO7w5LqjNQTt69UpaI+SKH4zKEuv6RNE?=
 =?us-ascii?Q?JBn/h4iolwi01IecGiYk6dY9tXD4gv5Mgn6Z6Si5K+aahKZiBovwqvsKK4JI?=
 =?us-ascii?Q?4+ca5twUYmr82QKF25gJO4+YRizyh3fRPxwR8wvLIFSX7Uj9UC9up3waXO7i?=
 =?us-ascii?Q?28E9KcrnI0fh6hnkqg/QnB6lzAFEuIi0PEpzDcDXGc33eDyS2niTZ2Bnfc4O?=
 =?us-ascii?Q?86hsnjYMJL7qdxQtC0PaILhN97KiaEm6zU8rAVkDiH7TTFg7jBnIYQQPdh0V?=
 =?us-ascii?Q?AZzG3bFlFKxJXLspDTrBhdQbJ1nlcTgiG5hiuvJCExGqWkQ6ZRsrhuaoSQFp?=
 =?us-ascii?Q?9wmrdceyDuDC1oncaKrBoYYczbGSihqUVs8hCzAODRz+zyCb+Yz1zXL4HBoB?=
 =?us-ascii?Q?Yq/vejlwxS3+GrVKuvnZoQT0dN646kExA0LgPRMH9IxMKckjY6MGRrjdJ2Vk?=
 =?us-ascii?Q?3PSzXCGYLwvdTm5WgDcKrx87LERwkeYEP+U6P8F+CWMmO5z7aA5QPxmsOnQ2?=
 =?us-ascii?Q?YTywAN1ZNDm551bJpHFFraESNWPI+AxFFFlREC5R092q59sO+m+v+jyU6MWy?=
 =?us-ascii?Q?NeqKT/G1VPU7iXq8gRPzaQE6CJJ1smsFBvKJFbbqBn14RDAyFzKQi8oPM5ff?=
 =?us-ascii?Q?b6+d3+C6xvDXZj1aUlfMVwpbuFi19S+lf3OOpvIcpgkCfrNMbQFzWQMOrHZ6?=
 =?us-ascii?Q?6zSlkhW5JhGtQP5oyyZay7895FK3DKMxD/kLqeCG4a7kcoSaGIJZu+fWDRdF?=
 =?us-ascii?Q?kKBvScVbvIzLM/D4uUkf8xDRw6oA3OSUeuvCDz7TWqOIHK76yYg8sMoOMMzg?=
 =?us-ascii?Q?rKUkV50laaw6N5NCJRHrDSG1DjlTSinyFenmeUs2y5zytQ2iOSL57kEl08gC?=
 =?us-ascii?Q?yXDr5OrT7vqXuL6aJt/rkKK55zmWhsSF5wnx?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PVKaKh/B/P6FAjQU9LgEZC53nxlz9CWDXZLX/19UDOXs9B8JYzyJBLyPk438?=
 =?us-ascii?Q?pdADOTl19yJhEB+UBmjQxh9iIz9DC6LYns1cu40b4Pak5WSdVb71TvWqSl4G?=
 =?us-ascii?Q?JjiWT1mHdpi4xixqrGYHM+NTmb1lArW6YKTWNu43TpMpQhaJFcs/nRXgb3aj?=
 =?us-ascii?Q?V4Piqudw0BcaYmICZBeDBgeMWygBnM0A+XIM0Kd3ELD2t+vBXjmKbRKXRUcO?=
 =?us-ascii?Q?xTubx0k3txKiSxfJl7xnRFQe1Aia9xxu/M06OjTGTb5p8EWtdY1QLf+W0zmy?=
 =?us-ascii?Q?4ZG9KL0rYg5LwELdLw7My8q1MEqwMG/beoB3lexZRkoazptff0B0YSNtHa2m?=
 =?us-ascii?Q?D8TUJXw7/TzJfMT4nm7u9PTRP7pD+ljcouMIIWDZKyGtF345RvH/b5688aIC?=
 =?us-ascii?Q?XUGKItImt6hdDtnEZhu+fHeU8ozCZHqp1ijum30E2xjtMQtXU5PUpXBCuWic?=
 =?us-ascii?Q?iotxgRUkG+Rwhwje6qVcnu7XwaiqJcXyootSWlMqgc00PfxC0c+oq/3ahWWB?=
 =?us-ascii?Q?rU1MhZWZKy0DOah2sJFBqzSYJxVubT5EkL29bUUsfithvR3hDrooS2j6kSsb?=
 =?us-ascii?Q?y7f1rnEAHuazYhQHvM7DhtjwMC0YvmId6TzyGkqat8R9HMiptO/aiJRKSLkS?=
 =?us-ascii?Q?PR2rIhvQ+HSEHVLzzGNlN5eqHS6ONactWr/YCBFaHE9occ2cyLzFdUyXfteh?=
 =?us-ascii?Q?4fUP0KlkLhpoxEPs/Up2AJ6za3XSB/HKFPICVenKkE7Cou1r7t1qp9kV9pDh?=
 =?us-ascii?Q?8o6zDNnHnPAhQeR2l+ANGF4fv52oTTnvYhCYBb6QHjhefIlSrvFTeBfqnjXV?=
 =?us-ascii?Q?aJh0p35pkTrz+3fkqzXdeYp2ZGY5NTLsSazjAqmk+JRlb0mpVkx4qVBl6Kuc?=
 =?us-ascii?Q?R6FHRUjnL5KnmbB6zE1SWm7Ub+O0M2KrM+hpic/xvzYp7oqmAIcqbZomLJbJ?=
 =?us-ascii?Q?PWzRGqASJVum5kWyjVwIswqtgG2MNxpdqwKQDsm/Q91VVT5qKYwshad3mcUs?=
 =?us-ascii?Q?alBSF4HkeMAXd/4m9Xm+zV3CzBplOvcu4is19IlAjDi1v/kHon5TpGDUOvyj?=
 =?us-ascii?Q?4HagKiyJq+k4razIqi7nSmMrWPfH/zlmmEL48fJwMzzG1z1P6UIoR2LPHguy?=
 =?us-ascii?Q?KTzMQY5gaW5TKCWN11j7DSMyJy1opgf7oS1lU04tZbKkEVROnWlj7kaZjTvJ?=
 =?us-ascii?Q?/HBrn/fzP+kPfYJ4DK+LG+HEONiavmscelpkqfiYAerZaoWQyoVa6YCIycVk?=
 =?us-ascii?Q?8NljLqcGcUi9G01HwBU04XIztNC7bMlPy++yG+esNdbLcaeHAoFz72g7bXoe?=
 =?us-ascii?Q?29b/VfvfjWMlI+ekHkRvrpou5qPWw9SZEODH25IU2xk6bJKRmLZYIceuGTQr?=
 =?us-ascii?Q?a4rYlePaum2Dm5pfHsJ857smFOo9rVN+V9q/02tyLgesVE7x/ixBvfkvuxDj?=
 =?us-ascii?Q?jYkS5nMVO4j/NPkO5BIVF4HgZTAcRTK8y8mwIPymD+eVf9V2YcI60fk1EU7+?=
 =?us-ascii?Q?9saU2ns2JaqgIbk6FN/3jNkvQDsWprAbsMJAmkhwgzm+Xi4xNa/tc/279Nqj?=
 =?us-ascii?Q?I0Z+0+uNl63b5DvrdU++deUJ6kgErEZSqPH+RLHN?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b10d6b6-607b-4a31-3cb7-08de22609f56
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 02:59:12.1158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /QJpla4uRQiP1Mq5BhrMlmEf4jsSopjoLLIlJPPEvdcacOd44bEW7476DqakX4e5BD1F01abHkhmnhlxy7/bqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7570
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDAyMCBTYWx0ZWRfX3JlD7vkHh5Kd
 kwcq2uuTr0skFgOMH1XRhZrnq8uGBhyW8IPs/7PdkoYjFwc9nt7NMXDx3RlRVXQ23C0svtHArN+
 lypEZVAauRyAjGkCdkL3gonyXldr97N/BDl5kDRp8V7gLqt/PNTBfRI40oF1MM8ImTEdcF34+7S
 bzzIx7hnaO031zPggVVpI685s9U8buI3t67OMlWg9Ugv/fjlMAb5U5WaAnnZl8l5CfWrNIxgjMb
 mEHug1xOpod6qVn0nSOkQ7FocBnDuMntnQ/30laYjwwidbUFytoRItfkfyIA7TxFpEX/4Q5ULUE
 6v6mTgN8OPQhcie469ZsuiAHxYxwEI4K7MkZfJ2vKZEBYBSq1p96W4Laf6QaFN0YDJbuie+EW0a
 MzG9oDw0axc+/H2Miwyo5meX6yBBig==
X-Proofpoint-ORIG-GUID: vcDVyIkFOt7V9LO-3vD29U8UfgTCLY9J
X-Authority-Analysis: v=2.4 cv=XPA9iAhE c=1 sm=1 tr=0 ts=69154984 cx=c_pps
 a=xBk5Uq5DOFf1FlsSGvIvFQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=THcU9WZ3qZ8zq5HyVMUA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: vcDVyIkFOt7V9LO-3vD29U8UfgTCLY9J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_06,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0 bulkscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130020
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 02:59:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121587

Add UPSTREAM_CHECK_PYPI_PACKAGE to check the correct latest stable
verison.

Before the patch:
$ devtool latest-version python3-lazy-object-proxy
INFO: Current version: 1.12.0
INFO: Latest version: 1.10.0

After the patch:
$ devtool latest-version python3-lazy-object-proxy
INFO: Current version: 1.12.0
INFO: Latest version: 1.12.0

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-devtools/python/python3-lazy-object-proxy_1.12.0.bb  | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.12.0.bb b/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.12.0.bb
index acd84efd21..9ba6ef8b15 100644
--- a/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.12.0.bb
+++ b/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.12.0.bb
@@ -9,6 +9,7 @@ DEPENDS += "python3-setuptools-scm-native"
 SRC_URI[sha256sum] = "1f5a462d92fd0cfb82f1fab28b51bfb209fabbe6aabf7f0d51472c0c124c0c61"
 
 PYPI_PACKAGE = "lazy_object_proxy"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


