Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1609C021B8
	for <webhook@archiver.kernel.org>; Wed, 26 Feb 2025 15:34:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.8796.1740584070262584302
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Feb 2025 07:34:30 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4152f675bd=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51QBDX5I020053
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 07:34:30 -0800
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2049.outbound.protection.outlook.com [104.47.74.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 451ptmgw9u-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 07:34:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qe3C4PKBoGm2jcpvP5Npo16yOZ3COv3Zl6tKnMQ6D6F7oay4NdjjFnekNBcMiJ7RDIde2mawwQ55V3fJruU4OyDTAM7VIV0lJtaJYiH/QzikDWoZMHX+FhYJrFYcWk3FRnZD/YesE/nkD0AKUZLGNCylPXhnNV/e4c5E1ngMvJ8Ac4nfskLGDsuepgZ1SaIzyCRZDrCZK1/rl9Snxxgi5h5MdC+mpDxXS7sxMxhXX6/JkzXEFq6/I5crOFXSx6Flnv/F/OTHairwcUjp4hAFNFBfZA3C8Sxr5vtYUBKZfLnrmt6JN2wbdEgJdC1z7f3BYosqh4RWMe0Eg3vFaDqu5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oSe4FmWSgW572FVUpa/P+B2lZCTtfv80Zz2kfWG57WE=;
 b=pSjrD0s3qxrpTQB81pPHJCs8aRutb/j2cX8E59z4hx1/LE0Tlnf7SZjtE0pkC8fVVapiSxOpYDgNjGyTBAWymNXTCZQPR6qO0+8kf6d3X3WHaGkKmwNVVJZdMe4TVtFvk6lPJgRlmGJmPcIS+3iVXu6AsyMcv4/GUhJzBj16PxrhkPQ9NoYjORky8TG6gj9Tf50WuNm55nakHwoCZnFXgzT3wO/AsiSd1uLcuXMyTK98HY46yr/Vk8bi7oGcZsfI4lJOFN3rs6MeRicL8UXZc1JE3Y6ohWGcAjrdhE8OL+QSwOIoYLZfBmlHMkmaQeND+vz5R8uu71QTeuMuGtTj0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 PH7PR11MB7720.namprd11.prod.outlook.com (2603:10b6:510:2b3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Wed, 26 Feb
 2025 15:34:28 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8466.016; Wed, 26 Feb 2025
 15:34:28 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] mariadb: specify pkgconfig directory
Date: Wed, 26 Feb 2025 23:34:12 +0800
Message-Id: <20250226153412.1039780-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250226153412.1039780-1-yi.zhao@windriver.com>
References: <20250226153412.1039780-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0045.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::16) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|PH7PR11MB7720:EE_
X-MS-Office365-Filtering-Correlation-Id: a2bc31e2-3ef7-4bd8-8276-08dd567b0e45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?toHyCOlrtLC8uUuyS2GacK0pJ/20K49KJWLwOss61AgBhBPMkadwcn3kGICk?=
 =?us-ascii?Q?j0xzPb8hJQC0qVVS6tS1a9KdC0VPkRXLzquOepVLKJSkd+K+9PxM4PxmCiVW?=
 =?us-ascii?Q?M3qeNPpRMaV4grGptOXCb0Txu/rk03Usyo+TLDtaBsg5sH40JqDs2W7Yz8Fh?=
 =?us-ascii?Q?qMvVX7/D7xMsJh5CkWfarYY0U7Vl4x6Sk8/SNDcZXGhkgCRg57v1FiQCOJDN?=
 =?us-ascii?Q?wFDakK/Hl6k7CYDC9X94DvI/7NdM8pdUvYynJPhOIMXJyWagcsffEo1EAWNX?=
 =?us-ascii?Q?9zQCqdJCMVit70HjgFITIGoL62CsLuaNxoaMrGnrYD9nlt/2W195nsuY972m?=
 =?us-ascii?Q?9eJDlbW37sjsyKYonbNWDthM4tGc50/REB+jr4O84XCJ2yKqmBlY9MtNX9n1?=
 =?us-ascii?Q?xXPnark9GSzRUne64quI447gnO65GHLn9sgXBFtaslNQMwrL8yy2H1dI/bSj?=
 =?us-ascii?Q?X9p9R1YfW+yTuhXTGsXjoA4DSNY661oxCU7ogD7IWD3m2xRel3NzLzf9rh2D?=
 =?us-ascii?Q?dOn/ANnPFAZfxBzEnnAxM2ZmAs2qm/4Ji1CWFMAHeOzINKQknq8/R4N1nt/J?=
 =?us-ascii?Q?WPD+faOFoSaYyVCs4nx08apMr0IXkEmlpu2l24fM9uyPUuhNwX+s3uK5M5XU?=
 =?us-ascii?Q?2ArCK3nKj1plHZLCWlPEZlzV8f/RnWijasfu5Dn4J7k+3DRd21IpLPxB54oJ?=
 =?us-ascii?Q?wmcSOgdPom3awNdejEGk0obel53AOYZBIoek9sryLWELb4zFtdnMXICRrtyp?=
 =?us-ascii?Q?bVfXVxHoelDp6fLHqPRTtL0n3KudcCEtAZOd6Ii43yFALzlnNtZ304K4ta4n?=
 =?us-ascii?Q?b03ckxPrUALa3cW3HZHGN7tBKiNd5HdG1SyvWd+84uvGYi3L80V5BnXHtS1Z?=
 =?us-ascii?Q?cY862pIVoopfpupCl0G+Gq5fbB2mCLwey09b6+MH+P90iBLMzgvyl0aUCwru?=
 =?us-ascii?Q?SKMvgvMrql114oqRi74LCZPmGHVnwBTvzkwwQuSRCGTxNRHYqYCz51XtBmQ+?=
 =?us-ascii?Q?VwmmDxxo8iJikDAdqXuCPGr87f8egYZOFqiwkEUgF1/Bb9QicJt/La5m/CVe?=
 =?us-ascii?Q?d04WO3eXH5g06NxtukAWA5kP0dMEYhkFa44wyKBluEFjf1LuBZGVaLpBSf+V?=
 =?us-ascii?Q?fJvSJiLByMPhK9XMCoIaUM87PnlnxL5j+AaEJh9E2Vd2V9iZ9GxtrLSqWkSh?=
 =?us-ascii?Q?6DilKySut49oFTRjamHFI5B1GsvhTd3x/R1+AnGL5WUrwWtEYZFP9bTJAPSX?=
 =?us-ascii?Q?XY+NWEMuEnPYwjMWOwAhPhDfzSWt8C/a/ME9LMUBeGX/CmNav4T69gtL3BqI?=
 =?us-ascii?Q?ADypqSxkr7F6ltzQG9yDb1shPX53qTiytQStb2wvVsz2zSUj0UCjZOIb0v/k?=
 =?us-ascii?Q?jDXLfWlbcSBbaUijzKHsS/WkSXIgWGsF+WnbDSj+xRHJmuf6niBklHFeI8Mc?=
 =?us-ascii?Q?mmjPxAR01/f+4jUYeuPo3tDqqTfKBVze?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8XqNLLYipyxBeMVAvl/iClrg4PJxDtL2pWL0GlUPMTbrFREMLD99xTfe08Xz?=
 =?us-ascii?Q?Ary4naEqZIkPe3mApHCrm2shn0C3xH22P6E0F7hiBFyfh5jtJHqXcu/jr+t+?=
 =?us-ascii?Q?ENLNb/swe+BgvEG+pA19jJt6d1BaQhCBQXixIkz1vnCseH3I3G1EIhT3eQpV?=
 =?us-ascii?Q?iOjfUqxogmOgNMXtNrqngcPGKsPTJDyOu6ibY6csIx7P3ntSUxnWoithV8vi?=
 =?us-ascii?Q?TuURxwDVFLv+ww4RTV2PXG4e6l0j+velu4wbtD422nwE4YOnJ0AZqv100Bx0?=
 =?us-ascii?Q?vbndHaxdGJL5KN63b7LHk4pNy6Qh3h4Mr1TN5flRZnMFDybs3u6D0PHtCH7U?=
 =?us-ascii?Q?sH9YmuyalCxInl0CAtPAhQyhrEH2VhddcySOF/0VcvqK7/VuRwIap2jD/oW0?=
 =?us-ascii?Q?El47pXHtAXwYG6xYWPopQD2aFzqWroWzgjkC5nh3M/8jGcm6O94jy7Vd2kF9?=
 =?us-ascii?Q?VWuiQxkCcC8yfg2frqGersd0FsDCd1FiFWwwjwHug4eNw9tMMczZeO4vpVHA?=
 =?us-ascii?Q?3s779Ejcs/nRGzeTxCiAoQFtBdD8GxD8uSw/kaUh6DGzkNwWTnC+8r3TLlAT?=
 =?us-ascii?Q?s2ABU6jbbOMoU7sC7xTE3l/7n9A42y0uhpXXg5Ogf20+k4RadNI5zAnHWfcI?=
 =?us-ascii?Q?v8K+KzIg6UrTMCw+Tr7ZKYLeAiXGaf2eYWIaKgKq87tOchxnN22+BUX6WdHd?=
 =?us-ascii?Q?WdnLIEy0cgfKqLdpxO2lC502K8uKTmw7xVx8IUzDWfNRF1V/ZY2qnvBKE+QB?=
 =?us-ascii?Q?mOnD5jdPNhCwBxKxVQvYxQSzI/sArZ2tZpJ/cqPU/IUX1nfDopfmuk4POTpg?=
 =?us-ascii?Q?jQnTp33xUwdeKHN45I8zUeDSEMHHSTOIy3EC2hlvsnBqZf76tnNaH7tMuscO?=
 =?us-ascii?Q?1acV9EhX4e2x7FfP34VbSVeunoBLpRPny1xu++PspvShKBAZKxc4ZgEcVK1h?=
 =?us-ascii?Q?+eEiS4bbmvQ3XltEEHVzksDQoDd5M0GtJct/gaprctPQT74OHOj5KLpsQOkl?=
 =?us-ascii?Q?GduPYJPC/CeyWJBOIxfyNJn9u39hxh181rlItXWYaVwiYJegbj1mqspYf2/3?=
 =?us-ascii?Q?j2Z6JviGamL/o2K5/wCVkNw/Vz6x8IueUAv/qsQrz8yo0XAoUScVqKiUfxpx?=
 =?us-ascii?Q?ZiH80Lg3KZbv2v5bOY8KwSmDpm2TnEl1gbdN7Ijtj1WklUGqCZ6xjVZwRTTq?=
 =?us-ascii?Q?+aiuRDprmnPche7y6iqKph/MpKe8zlQ2ZVL3x4p97CT5aKt5xHwTuLP0BFSs?=
 =?us-ascii?Q?dOV4bhbqGlVLynX5LRKu9lal/wm0Ukoc3FDEWghveP+EkiuaNSo0mj2OiO9p?=
 =?us-ascii?Q?PRlVairTHhuyj0x51BcH1F29LfSVcSdelIOWFsiTEHv2mECp90PIhf6p2G/v?=
 =?us-ascii?Q?cjNmvkoiZZEb7Pst0I10SnKvZ4CE9aOw8PIXFg5jf6+XuE7Nq/KY/R3R9ERv?=
 =?us-ascii?Q?dXHZVIGr6afcCxB1g8ONCRCxxpOqVpE0/3gweZYefKqJqUuKBWqMqoOpcFPb?=
 =?us-ascii?Q?qFI942eNfi/qrIrnr53f7oK268Ef7qdLhkVw1wKP3h5Lf7EdCluzIYwlCXd9?=
 =?us-ascii?Q?toRwUlAIxIGLTgMTHwC6gsPybRKlYsN2nNTTiy4b?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2bc31e2-3ef7-4bd8-8276-08dd567b0e45
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 15:34:28.1266
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hjjUB6ofvITDcuPBDMiCP8pLBB3iRjMsconWQedTg68plUzEvy8DIhHk5S/DoQM/lu3Gm+VQTvHPY6T83ppqQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7720
X-Proofpoint-GUID: f0LH9EGOZSuCe6S8gocIZq443ekDYURR
X-Authority-Analysis: v=2.4 cv=TuEchCXh c=1 sm=1 tr=0 ts=67bf3485 cx=c_pps a=VLWBoSTBoww685Dj7+Q0uQ==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10 a=t7CeM3EgAAAA:8 a=dp2Iv0uqFCIYT6wkoVcA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: f0LH9EGOZSuCe6S8gocIZq443ekDYURR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-26_04,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 adultscore=0 phishscore=0 spamscore=0 mlxlogscore=927 priorityscore=1501
 clxscore=1015 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502260123
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 15:34:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115652

Set correct pkgconfig directory via INSTALL_PCDIR, otherwise on 64-bit
targets, the .pc file will be installed to /usr/lib64/pkgconfig by
default.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 5524305952..66b46d2afd 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -87,6 +87,7 @@ EXTRA_OECMAKE = "-DWITH_EMBEDDED_SERVER=ON \
                  -DINSTALL_DOCDIR:PATH=${datadir}/doc/${BPN} \
                  -DINSTALL_LIBDIR:PATH=${baselib} \
                  -DINSTALL_PLUGINDIR:PATH=${baselib}/plugin \
+                 -DINSTALL_PCDIR:PATH=${baselib}/pkgconfig \
                  -DINSTALL_SYSCONFDIR:PATH=${sysconfdir} \
                  -DMYSQL_DATADIR:PATH=/var/mysql \
                  -DCAT_EXECUTABLE=`which cat` \
-- 
2.25.1


