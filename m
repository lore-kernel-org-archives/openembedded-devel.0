Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABFF4D2445F
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 23:36:45 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.58934.1728603400965933779
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Oct 2024 16:36:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=00130c5401=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49ANORgE027358
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Oct 2024 16:36:40 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2042.outbound.protection.outlook.com [104.47.58.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4234ykx2en-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Oct 2024 16:36:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pLcDmhV8inV2VYsnNa4Trirbecggdx7darASRvNVLenkX5rt8LtTWcMYBoXvneKvWpr51IaNTtSM+grp2Ee1jJAFlZHBAmIkPSYEipEIA78Tf9svQhp1iS19BiyNarcwNq+aR1DLTvUp94DRr02oNwN68NXYmlTUcKPpbQxK4GIeGZDDb2OwyowElMxb2V3RKajuQH7d27F30hO38Y4ovuwi1QL0n+pxMMuaJLAhCBpX7S9nOeiSoNY/PH/Lp7U3E18MCOqe88IvxBduHXLyDz+yS+B9gibC2wlE2xLlJWQobs7GW6RmgJyRiDvKv5wV9Pt9wvtHeEWqBRVH073UBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QuX4JAUeo1snTe30yg/QozpQcTW/Nv5quwSNT7nRJZo=;
 b=gFvaeCQeaVOk1Ya/gaq6ricQZ5OrIZIL7NNbVAaLGJiVuB+osGrRNx3/aZGLeFu0q2atuTjZbObWeYIBXCx8IbjNYg9ZXXTK9H60bGcCEJn0VXtLj/Z72TqLQJd+KFI/6/gHFeuiDjWHI/nXNqjDHLjn93ljYP8EZQrBKwZDaDYux3EE76RqX5bviRfrScAFUkzmHCEGJG6K5bz2woFE0IFkUEIrDzGbPB9toBTTj9ZhJ9z0qh6XW/G+sONPqaIopIIyGpKrv97FWdOELKB46GwhJgW0r9G9XziIKYzs6ngWeE09Sn2yrYlQluFJA5oU83/jVVKs5Wxb/CyWS7F1Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SJ1PR11MB6249.namprd11.prod.outlook.com (2603:10b6:a03:45a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Thu, 10 Oct
 2024 23:36:38 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8048.017; Thu, 10 Oct 2024
 23:36:38 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] hwdata: upgrade 0.387 -> 0.388
Date: Fri, 11 Oct 2024 07:36:22 +0800
Message-Id: <20241010233623.1902296-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0048.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::17) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SJ1PR11MB6249:EE_
X-MS-Office365-Filtering-Correlation-Id: a039029a-bb23-45f0-40e4-08dce984629c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?+NQWHQR5+t2icBZUhmAxdV8BYIhqFebJnrhJxWAcihylMOM6Bm8RV2oQm0qa?=
 =?us-ascii?Q?lfE/F9jsgUJKIRNXv8XtX6/gWtvhckax8xE9X+1e6MmaOKfdIH1cwDQmctIf?=
 =?us-ascii?Q?TpOePRzlxx4YzlEHAXJL4Giiay7ZkjZ0NxBTCC/O7U2OHuTOk8Vd/B39qcDX?=
 =?us-ascii?Q?Uh+aYM3csfTNFJgXJkDkLig7Ug43cOiE1fT8YAKoo4g9VVSJiN/S2X7MfIBb?=
 =?us-ascii?Q?AZH4RvEw8lCKGLkGh6Zw5EcKB8XvVz+OcPvcKDq//TYsXIOjLBV6576S46nt?=
 =?us-ascii?Q?Fhi/C+ihFfmpX9llHT5FJ30WAkjc46lzDcrxGn6BR0JE9KjbbUd3oHdxNEOA?=
 =?us-ascii?Q?v+GYXCrt0HrZxNYjgmjZo47C7z6hRzlMebXdAvENrLPj660v7pXwZF/JpnDE?=
 =?us-ascii?Q?d0n/RW/46qHku4wj10bZJ/PK9MkBE6P3L5R/teQn4UKBWrA7OmlGI6oNtzN4?=
 =?us-ascii?Q?MmqiVHZNukHajieURRW5iZYa6vlCPg1a5t8jvzY7GdwMSgVPlX7koL3Is2/5?=
 =?us-ascii?Q?psFJ7NjVkZSh7BgtNgjmGcrJbUJku2/5THTgwJJnyhHFt8v7JGSwEl6hh3Pn?=
 =?us-ascii?Q?YheYm5hPKvt1vF9WoSJhacCs0P2/mcpuftiDvw+dQQ+TW5WYMDUY1aip9D6z?=
 =?us-ascii?Q?kWYXJbZlXgyqgHEUnITX0l5YEcHxmrSnJEO3E6BBrYLfRqG4yRh2FcVVBR/c?=
 =?us-ascii?Q?ucA1ClnFvupuWnE2el8IBKRFAYBmSrZ2nrSi0hVQ370dExeC5TVKraQb6eCu?=
 =?us-ascii?Q?M6O9r4OwHAT/9+Vv+yEPVH1RyYLpOSmoHIVjugz+k4SI7x0m3JX25j8jP/rp?=
 =?us-ascii?Q?ovqnY9ivtXaCnsncRvSrMvdUs2nYHenzZNqkJa8FXd9O5LAg4bkX5GfVT1x9?=
 =?us-ascii?Q?CdOVJtNsMz0gqdWqm7GLi9r49ooihY/H3jrt5i4ZMUjBCAVQ5h/iH/I0BfUw?=
 =?us-ascii?Q?HTE0DO4p84GChqZuh8DXm2qCeO8555qva+wxdU6eWs1LRJFtuKZ7C/56hNdx?=
 =?us-ascii?Q?JdgngpwGT2a8xZgcygK46q1KLvTOG4nIUvFzfCmQFIdAys8XDEW01FFIV+3u?=
 =?us-ascii?Q?zOHe5dHjbG0I15EFquRsmO5xhkHksssyn6h3wotw4T4AeFbK3gf52mJrX/CO?=
 =?us-ascii?Q?ZXRwKzMlHJSuOgq+2yIRpha0gEcdmZluyV6uCyyCnAxNhLKqodGnjJpru+SW?=
 =?us-ascii?Q?tZvudVPeMKFQqT9bQrBqbDgButBkM462YEiD1l5w6B6I6TDlO5xz/+1cAzu3?=
 =?us-ascii?Q?4eJ6WjDCi0h0Pcj3yJtbdJLOfsXzytH/vEuyJD2V0ALAPtYoPigGfhDzXYSt?=
 =?us-ascii?Q?QkzLIfjkmxeCQgKYirwYlt3d/xpUbZH6OE+NoWQxPruM+g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JI31vXtQ7yyXET5HPVGkGFNnFHa9NFJRKqlfo0pqn3UfXpm1RLYFKbxi3m96?=
 =?us-ascii?Q?Mjt2MZgLmxcPo0Bdu1ijjt2AJdBNbU+una9k23MFu+m7+1uWcMwvZIiZPLqq?=
 =?us-ascii?Q?pSuov4Od8tV8oUUootp8flsBaPJ1PUmrmeAfRCksnwoHLvVksyVPfIsbLAtW?=
 =?us-ascii?Q?0S48KKiFYR4SdEenjRtN1EQmdD7zXqEJlHPaFbHk8HqE7uVvUqcpDzGEkVEa?=
 =?us-ascii?Q?6vGwbDuSzCRcPmAPFCoHuwt8lxjcPtq9nnDE8fwQ/+D3dJDxYxdUv9FrU0iG?=
 =?us-ascii?Q?hFdoNWsnLmPWiCPjy9yWHTBG6Kxf5b/0eRo3XXnR6zcUPdnvvvCfEeLb/1MU?=
 =?us-ascii?Q?c0vEdnZHNs99cAjh61VT/BqbhYVwMykQp0iDDGoxRUhn1WAVl7Jb9OFmFsNd?=
 =?us-ascii?Q?gwqVukMwcKR1AHf6iLGNplHBgJyKWaX8uMmfRkMG4XtgD1eBZ1765UPKLrbk?=
 =?us-ascii?Q?6nPs35pEBLLCVWnjjD5j9OK+XwOV96gq63aE7fVH0lVwy1EILsrJVajPM+DY?=
 =?us-ascii?Q?WdVkXx/l5zPkr6pJlci6WEDZXI6JSiojFHT3KHNRnU4luEdbLRedV3D2MaZ4?=
 =?us-ascii?Q?u8+bsMoKsLPmMvR2WVZxugqzb7U4C79CciWQZyuFsrhuXaoJMMF335oQV8gi?=
 =?us-ascii?Q?PvVMsQ2hqZlZ3qD83izXdh5XyCt+miZDb8nAn9hTL7g4XYZ8VOkFcU8MmzzW?=
 =?us-ascii?Q?OexSY+sxqsQZG+MKqMDSjZNW5/S2M4mD1BPTHgrsmbJu3O4oLePkBl05NTXX?=
 =?us-ascii?Q?iSeP3uuqCE5qN5WeYtqpOOcvJVdwz2F83AzvnymrhkVPPQ5fOjjhMz3YFNnu?=
 =?us-ascii?Q?ETo5LHiBQDr1osHgVbES0liitLcCMseljS6Ecv+CWaWzKYUnSbQPmEJBh5/u?=
 =?us-ascii?Q?kQMf2eslXm9BUQf0eJS7ZiJDSZhJjrqp2WCgopLLTQ+QUg3s+B+V8ur15Z2J?=
 =?us-ascii?Q?16Tfs38r7JaaAvURmMdtHs4WDolWYtmSURYWYZjBVqI//F13pEbWFYwWex+1?=
 =?us-ascii?Q?c1ailpvL/zXBhP8FOIVgsvrZpoW88rx9dXcLdSjfIyICqYzleZYPqRHLJOPz?=
 =?us-ascii?Q?FLVetkz5uc8sBJpJ/DN3zsKDP+IqyTmTiQxli9EpkdYmuBjWx22L6va2SZlu?=
 =?us-ascii?Q?T6S2aXv1hhsIzKiIMyZfRqSkKhZYwlvmqcXV/p5vWaUzWn8cAv/5v5Q0lNMX?=
 =?us-ascii?Q?SdSs6MA4X4d7YP/paxZ0fl4gRc50m1Rwhslg33fPOLRHpPjnCVIYg53Oo8zI?=
 =?us-ascii?Q?6jBRSyK8N3fiqWRYxzltstnhNfuPIzygOiVV+CCwsQLgfdO3hPWKRkJkSWXe?=
 =?us-ascii?Q?t//vxUeIn3X7oA0PTLLm7T2hSzBIiKRtvVM2bvlxiZQZcw+17AoZLpBLoMtM?=
 =?us-ascii?Q?rZX/POyaf9TUVQUmmQ14NZIPOe9+qQpGvnx8wVYWLrPDUU/GeLUdrzI1RuHF?=
 =?us-ascii?Q?+ziNKdGz6zD5ZLCCXPMwBnJOGI+czBiF5aSckcZlpdS41nz4xiijjDpdKHgg?=
 =?us-ascii?Q?3L7UiuDOBj0jRrhu+TpANAkLP2qS74lXLpbcAP3GUGB758XAYApNo41e75d8?=
 =?us-ascii?Q?LA8fnE/6P8iAgLm3Nj/Y00qeMCfikD/cWQQ49wOJ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a039029a-bb23-45f0-40e4-08dce984629c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 23:36:38.1613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kr8+BgP2uBPQ9pziaNDFHTDajp4Ln8sbfm6p9NZdXxo/ZQMK4paSmCYFNSpgPmx0XLM2l9wbUknqMoCcj4frwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6249
X-Authority-Analysis: v=2.4 cv=AKB5nO5v c=1 sm=1 tr=0 ts=67086508 cx=c_pps a=mEL9+5ifO1KfKUNINL6WGg==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=3lG8bWXumfaTTReshOcA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: _HaxDs9wBfGBl0rxvPwxaw74sXoOzXib
X-Proofpoint-ORIG-GUID: _HaxDs9wBfGBl0rxvPwxaw74sXoOzXib
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-10_17,2024-10-10_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 clxscore=1015 spamscore=0
 adultscore=0 priorityscore=1501 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2409260000
 definitions=main-2410100156
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Oct 2024 23:36:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112781

ChangeLog:
https://github.com/vcrhonek/hwdata/releases/tag/v0.388

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-support/hwdata/{hwdata_0.387.bb => hwdata_0.388.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/hwdata/{hwdata_0.387.bb => hwdata_0.388.bb} (91%)

diff --git a/meta-oe/recipes-support/hwdata/hwdata_0.387.bb b/meta-oe/recipes-support/hwdata/hwdata_0.388.bb
similarity index 91%
rename from meta-oe/recipes-support/hwdata/hwdata_0.387.bb
rename to meta-oe/recipes-support/hwdata/hwdata_0.388.bb
index d73bb93aa..63fcfb22b 100644
--- a/meta-oe/recipes-support/hwdata/hwdata_0.387.bb
+++ b/meta-oe/recipes-support/hwdata/hwdata_0.388.bb
@@ -5,7 +5,7 @@ SECTION = "System/Base"
 LICENSE = "GPL-2.0-or-later | XFree86-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
-SRCREV = "f0ba62c0b0401c215aed8abb42cf7dcdb7e6fecc"
+SRCREV = "f25185c1814901bf85383693e0dd73bf1d8fe1a1"
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


