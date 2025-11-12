Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEF7ACD13DA
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 13:44:36 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13697.1762955070053449005
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 05:44:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=VGa9yh1M;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3411d85ce0=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC4G270914377
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 05:44:29 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=UaipYonDVHTfdMUxD0moDm1WsQBF+xVXhMgaYEH2D40=; b=VGa9yh1MtU7g
	gPP6BsZds2/N0HSXqoFNWC5GntEI06pC1sW4ZfSDWgc72eOAocaZfv9lqyJV9oGP
	m7DUDHVDxy3s049UdIksugEtOUSzobrtszDahEfryOjkfc7BxhDFdO9Hsr0C7tEK
	GLYBt4epTRNxZcigo4bAcUoGbSgFQZdRpZWyTLmxxAXFN8eolNqNtYu75kzHDtMc
	d+fbTlaqpRy8c7bO+4PjkwOYdNpFMWhkzZus+Q7U9rNRNqedgfV7FAzqV4YUOQDs
	5uzkBld/mvRCWiAed0Q3WwSpAo7PDrTOKbeBYG7/Ad/qJxPTBGdAUiQ5/l/Vawby
	EOWCHepENQ==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011009.outbound.protection.outlook.com [40.107.208.9])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aa68jmxfs-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 05:44:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TgnthgoODjjFF15BgT4igVEAEwp1kKv/vF7bXLOBH0sUvvPKCanW2Jw7GtQ7s8MricNluzQsPwMC9K6jDNiamm6dvzWCTL8i58THu9o0UEJhNaVsP57kscPHn+SvdiLmim0cNZ0ycOafd8QeNUhs6cWMIReFHa69a52MNSf4b6vCXnMpAbvyKtAAkOlKBNMwEjQT4OHJ2Y/KIv9ziGLon4fjzct6RQCd8u6++OYV/9UEFi9C/Z8tINAXdikkLTvAgc8kxXKtd+ux2eTeD0+T4V3RZabPg+JhZv3qWUgYglJ3wiZSJToLa49LsWOGezGxTKHTt5TPFBaA7zccelQDOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UaipYonDVHTfdMUxD0moDm1WsQBF+xVXhMgaYEH2D40=;
 b=XEsyQ9wf2PLJmf+A2npTcGewerjdIhWkHTh0fW7TLTtSqztMfnzMJ4WlJePc0WT+xIzxRs3V2RE0Z7posukE7TUklqJ6lz218y/CvQdwW1487jz2wRMgJxRUNKiKMF2sqRlmY6nLVcWyWNz167eQPNi8wCtYcyR8LqN/Z4Xjfct0nTSLNxJK9bZmBMQZtKRR4815aTFrro3a853loIpYK/zHm2bDBMtfGhVnS477sguZFlttDIs/Pg7ej/Lol+hqOeyYiahXi3/hGclpK8rF1I/DTJcOdeRkGpypGNgwtB99YrCs+EmPuLG0VOQOo04QDfTZ+GgPxj9gMxKjuxhtFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DS4PPFABF58482A.namprd11.prod.outlook.com (2603:10b6:f:fc02::45) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 13:44:28 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 13:44:28 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 05/19] cunit: inherit sourceforge-releases class
Date: Wed, 12 Nov 2025 21:43:51 +0800
Message-Id: <20251112134405.3706508-5-yi.zhao@windriver.com>
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
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DS4PPFABF58482A:EE_
X-MS-Office365-Filtering-Correlation-Id: 53207499-6a58-4c5b-2ba4-08de21f19921
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?D0nFEV3if/NtTnbXXJi+oRC4iFF+G3uWLdsfFhcOB/ig7ygV15dBIXOy0Ya5?=
 =?us-ascii?Q?+TEavBTChe0prqyX1w3nbwjOy9DZBUwelfPct8AoJvGGzDi4SIx6KYwuUdV1?=
 =?us-ascii?Q?h/aE0qtYR2JDAzBYgzL+pfcmZxl0PTx7buckZbpYnP5gtsVqakTioByJj81/?=
 =?us-ascii?Q?myCjtpXP8skVs9XyMZwJMQ868S47F7pLOozFcjppudFIqJtJ8V1uhe8ipRef?=
 =?us-ascii?Q?h5G/JqU42ukMQ6DWNlp1rfVISFgDSqPKMgpr5L5d7r7Hl6hon/NaderY5jgd?=
 =?us-ascii?Q?CYU0dQKyYp1ZNZl6Ha2HmFfG9f0EsQtwUcL4mPgtHu4KYaxKPt1cmTaioaNN?=
 =?us-ascii?Q?g2yu0h1ephMQqzidroSFQR/ExQJySCBm1nj8/0AufX2fiE8J6nnYeOaQs8Sn?=
 =?us-ascii?Q?j/9q834D1mBPiBlMqY07yf3GFr10OLs9U9EmORFGl8VDS5eJa676yTNkRnnI?=
 =?us-ascii?Q?6KEwxij/XyFQhW+O08bOhDNuuCJYEIV7lpJty/n6Rg/vFNQabmNY+3RGJiE9?=
 =?us-ascii?Q?YhtpzVNwWcM9IktEKfLYTPcr584J8QvcBxPm1S+oSjsQ7wa/g/yMoFIQh6vv?=
 =?us-ascii?Q?fdGQQR1iyjEGKJ1Qji8OzTD2Pb7Wp3ztmT22vLuvSAYonOAiVZ3ax0Wn2/+h?=
 =?us-ascii?Q?Y4XLJHBOxx4iFCThIMxBNK5Qskh9ApLEBbHQZRjjUsWABffWaydWlnP3HCFc?=
 =?us-ascii?Q?uPgTbz6EcUC3COMNQNAoOLfkZOD08oHedjdOw8qhZUIGc0JiOgtQOYeZK63W?=
 =?us-ascii?Q?EubZX/6UwaYAEa2VCN3whADJjvPu+AfjpQtjT+4pS1nIvepFnUYtluhviUJe?=
 =?us-ascii?Q?K4yHJ8xx7Sm4EpG7PoGDq1xaHExiP1jKQ/9ftuoupDROngshEjTX8xnLOsoR?=
 =?us-ascii?Q?RpvAyEHCtu2AEXX46ESgIRZTqj4t+h1hmH2lJSpACpk0phrMG8XygPQhGdTZ?=
 =?us-ascii?Q?KKBQySH8SZOh+T27sxE/qXUIMg+xEgMr8DVOWCNVZ+d7sQgDBLRKKGQ0qpIN?=
 =?us-ascii?Q?cFe43OJS62sK74dUOv36X/UI1if2aqeZbcivALCExO2xZ12QYndgYHs/Jbv5?=
 =?us-ascii?Q?5HUzMJ9KTELq+LGmNLb7h1pSTTUdYqvepcAkRr/nb9ffyMjSzlDFrxtdKPTc?=
 =?us-ascii?Q?M/hpxadklTfMr6ZAAANwbpIpDzPM3q+K6Ygi32iSrq+tKNusPcyh7a34UbUd?=
 =?us-ascii?Q?aImcadrD5c4gHutCtlj5VFkZU0Y8EyxtlWIoYh9qx8nEV649F6l5rHN+ryfK?=
 =?us-ascii?Q?vnqXS4k4Z/HdhIN09vjluz8Jg6xxK/91Uyr7oHYM3uS9YA5dJIk5SJY0YBbM?=
 =?us-ascii?Q?suiER2VPkjVsWqMMYt1AU9JeBmvyV1bV/s9indsWTgP4sasWB3Rtip/YXD8I?=
 =?us-ascii?Q?PGz8e0OVK0/qPVWuXoyB7JLvSM8y+JPUT5jYJ9SUYeHqCKAR7DQfZEJ2kVRr?=
 =?us-ascii?Q?KJkGLbScHCFMmKWqgUNIyLonoFsf4rA1Oppwum4/wnMaHvgY+EpqPnoIfYgk?=
 =?us-ascii?Q?3QTMfDBr9u9tvXwZhkC0IWr3auv75cLS/gQc?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?euUW2atGNWo/Ex0/JMfDg+iL4RQboYFzmpR9uLeBIymLi5ARmO4gspYlOSVi?=
 =?us-ascii?Q?VW7JIT3K3rv3UBOS8sn5SkYki3OqL5f8LIrZokDA0tGQIVY56mm0zPV2At9E?=
 =?us-ascii?Q?Q1FfL7nSl9/yzH1LDb6NTaS2LGYxz8VpxOs95BpZyVdf5kekl44ZNpT3YZUx?=
 =?us-ascii?Q?LhxLAQ6zD+mkOXeSIy0DxYfg7x1b5UxiLQ6dQGwaaSZhtF/uFDRRKqTK6qYW?=
 =?us-ascii?Q?9MyJO2/gRmGH+zOJ7ZylyAYp3teju73x/bn3UnZG/4L6j7wRjiT5fszYUt1z?=
 =?us-ascii?Q?cEfLU5rHw4b4VI1DTIspUiuQkcU+0ifrWK3qS+hMKWhKxGVHwe2PcdTugGy1?=
 =?us-ascii?Q?UcaUzuza3aBORSAxVvnlTHrPWZwnBKWkOOBsrZdXxSFzHYFh0U8TtEwK3QRs?=
 =?us-ascii?Q?ykciJKzRClkk1fKOOnO9tohbwdlVGcRRr+s5uViEfxonZkMB5ZixZ0g6FVRh?=
 =?us-ascii?Q?1KyE0YN8wBCyDw3IsGrBOEAGgYwMuiGf4KG/Y2F8WXKsGthZVkBpcZ8YlkB3?=
 =?us-ascii?Q?hiiG0ywXKRfXTBRALl/NGQEOzo/tLw0Te2slS1dmk1qIGgr959Mfb61kh0zd?=
 =?us-ascii?Q?qwUNHxsfu9400S7Kbvt/OBKU5Ya3Ftp3o57fqYX1UBCY8XTkqrfMQClVqi0v?=
 =?us-ascii?Q?Or+Ka/zDdkAcQSdUmgFLTxUQ5eemkdr1PbLndp/5m0IU5e72TsIvaN/l0C6s?=
 =?us-ascii?Q?t/8Xfz0I+n5DV8DE5/x+dgw2zYpMhN59r64DSjOGLeB75sdEgwbIqyuw1wOC?=
 =?us-ascii?Q?vKsoSD0y8K8605Vo3copQdHsnbO4r/lgaPYVBs0ERyIXRY2sVlwSYwlziW4q?=
 =?us-ascii?Q?MEcnFUJg8BlSmWFp9iUYo/B7i4RnRg+e0NyhDHBnhR5gb7aIiRwX1d4f4rch?=
 =?us-ascii?Q?pHDZuP55BAAfey5Pou3e5XbK7Gyz4CNJgBP7wepgJUaM0LMj9yV46sCGus+K?=
 =?us-ascii?Q?D9bQP5H1+oiE548yS0laYb1V9ho7TIR2eln03MzNLt6f1jaedFTx4qXz4/X8?=
 =?us-ascii?Q?PZKLuBFJK2SM5uI34/z5cRBuwIr7WC/MAD+d6C/6GU6o+0X5hBGJifIsxkoz?=
 =?us-ascii?Q?EGgMO75/FwuEkDR1DwB0mv1V/X+pzTg/eweDE6+Ed63l0APkaLyB/Ms0yo+V?=
 =?us-ascii?Q?SBaMlgbll0E2whbt1OwRvvWiySxQ+eTfh/QJDepw9Woi2YQwRQI0Aw8vcZbt?=
 =?us-ascii?Q?ib7fGbu8vpvsGQ9gXLq6gaxt6HQ3w1wd3P2rrG3TxUA34WHgi9fZXf/29Ir6?=
 =?us-ascii?Q?Gb04Q/jr5UHtq4hrfLETRJQiU3IDoIBS2VIDHinR/AZtEMB8mGA1CTtgq7VR?=
 =?us-ascii?Q?5j457dRC5JgdzcXXWnrp5PewOP0vgjxwdPLiGCt7xWYZeF203wJP4XgtEgDU?=
 =?us-ascii?Q?hIF3qCWgGQyGsLPtl67AICuvTzUinJFsXQ29w6Wl4IKyP3kFunshcEzvq+W7?=
 =?us-ascii?Q?vKP//wOhQ4eE5dXGV1Ov9osgzdbAQvUZHCUNSuYAbgJOf4DDE/Y7lyG4c5rQ?=
 =?us-ascii?Q?h7QrYZp/Gqvl6SNF7a2o6B4jmxOBSXfy9HWtmJ5pUyeeSw3L5opNibHvNyed?=
 =?us-ascii?Q?VBUieq+RYOqaqsjzK0fVS0g2m5tZC0Z5kV1e1v6i?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53207499-6a58-4c5b-2ba4-08de21f19921
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 13:44:27.7033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5xpzyjI0nItMGg4bZgcTs68piee1ac3d8pEQ7w/v0JTP0yoiJmPORtVO/a2z5Cbg6510q5o0uFJAHlO7JiTA6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFABF58482A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDExMSBTYWx0ZWRfXzDcTUzMg3Pdl
 t+Y0s6gMZeSldBvnzrHuOF81Ot6qprvIde4sfbPXRdh18GnbEbtiMrBPC467qQSgIXE6gEv5VU6
 gvjx6D5monhvc3PsssqZqVfZkh3LK76Dz2XrfPPvVvsL3eKQqsM0Zim5vmSemgFzc2VRt9uUlKi
 nYpjGUGMQ6VMAGolg9XvDc8GpcLnzLjwWM3h9W4qR5wdBni6YOz7FSQxBF9O7gZ39yh7EZkPHWH
 sz6xCU4T9MR3I1wNnKJPuE2lSFo91XsIr9lEEvyFtO4LSLWnXcpgE1Y4O7e69HWgLsV9cMx35kL
 nwnDHdNpvFw0fPTiTXDnzMM20hz4AnBQCClAQtYzP2qGKhmoCUWin7fa3FUf9zY62zSHvM9U+Wz
 f2YsvFZ6xkYlizW0yqVKi9t+wv3PtQ==
X-Proofpoint-GUID: iSiDYvX0XdHHnqbHHecgYeSNDGr3CWJ8
X-Proofpoint-ORIG-GUID: iSiDYvX0XdHHnqbHHecgYeSNDGr3CWJ8
X-Authority-Analysis: v=2.4 cv=ef0wvrEH c=1 sm=1 tr=0 ts=69148f3d cx=c_pps
 a=8LlSNZ/L86USH+wcAhsXzg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=FP58Ms26AAAA:8 a=t7CeM3EgAAAA:8 a=wq4qR94-9ZWHP0GsPycA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_03,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120111
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 13:44:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121534

Inherit sourceforge-releases class to check the correct latest stable
verison.

Before the patch:
$ devtool latest-version cunit
INFO: Current version: 2.1-3
INFO: Latest version:

After the patch:
$ devtool latest-version cunit
INFO: Current version: 2.1-3
INFO: Latest version: 2.1-3

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-test/cunit/cunit_2.1-3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-test/cunit/cunit_2.1-3.bb b/meta-oe/recipes-test/cunit/cunit_2.1-3.bb
index 9aab617487..75ba477757 100644
--- a/meta-oe/recipes-test/cunit/cunit_2.1-3.bb
+++ b/meta-oe/recipes-test/cunit/cunit_2.1-3.bb
@@ -14,7 +14,7 @@ SRC_URI[sha256sum] = "f5b29137f845bb08b77ec60584fdb728b4e58f1023e6f249a464efa49a
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/cunit/files/releases"
 
-inherit autotools-brokensep ptest
+inherit autotools-brokensep ptest sourceforge-releases
 
 EXTRA_OECONF = "--enable-memtrace --enable-automated --enable-basic --enable-console"
 
-- 
2.34.1


