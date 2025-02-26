Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2474C18E7C
	for <webhook@archiver.kernel.org>; Wed, 26 Feb 2025 15:34:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.8795.1740584069814421574
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Feb 2025 07:34:29 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4152f675bd=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51QBDX5H020053
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 07:34:29 -0800
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2049.outbound.protection.outlook.com [104.47.74.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 451ptmgw9u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 07:34:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iJt9XlRplHGXtn73cFo9zbTfmjYTuItBHuSGM+gQL8AYmUMVuzKG/g3lBSBizVtbOmxpMoAMPXB/fzlnZL11RynJEW1L+4da/jVA/15AjdGO/Le2/9XGyH3AoRpHSTbiRMoBzRohu9h2Zx6hUtrLwft7uXNvqgisjry8YfXjsHl5YFwdMcapy8VNBG48JoCFo9vBNuVAlohs1cMpXISJMXlOG7tCufiEuy5sGUAFZjEL0Bw11i3p7BQ4Zm+KFUXXWta9tHr4TVSK8XP4isZhVVv2g89mue8Q3vHWHCnAteFpEjfHSuK+FIMD+S/C26budGu0rjPk3haImQcuJM54lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KOURopm/Z5QYnPPgHi6k/txniBYFY/g8rXwpkoZiTLg=;
 b=nP6F4z6y4tiMnFPIoQtm4ZcqnTZcCeBLeOP6dF9adDbs4XWGmLdXw8KVkRaTf9wndDI/MwPbIhQdPv8OazCOXUZQXwFgHlvJ43cAS5OAlmL4ZFPASziDHYizJ/Bk0UzYfdV6IQJi53cIBNIHYpceOwTd9OPuCdzz/6Xs71lmXnolVykMTCtFI3cn8xou4xcbRdc30iq2Nuinj+rd55km1peHyTMsiQAMBEuQJ5DxzB7ahjgnsMibyp07YjUCzZSX7Jta75wMCsVDKKuyY++I5Y2v9g36gCBNJf59isZhMp2f6LV1DBF0ru75aotEjZ0Nro8+M1dfvguMR6Y2AiOulA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 PH7PR11MB7720.namprd11.prod.outlook.com (2603:10b6:510:2b3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Wed, 26 Feb
 2025 15:34:26 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8466.016; Wed, 26 Feb 2025
 15:34:26 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] mariadb: set pam module path to ${base_libdir}/security
Date: Wed, 26 Feb 2025 23:34:11 +0800
Message-Id: <20250226153412.1039780-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0045.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::16) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|PH7PR11MB7720:EE_
X-MS-Office365-Filtering-Correlation-Id: a8c2299f-4ea7-4a28-db57-08dd567b0d55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?YGptCwYXkWNzVhF84XoquBGTCohJFvFYvPop7JURR2/GlQ3UQ71ujbu37AvV?=
 =?us-ascii?Q?myp4D0zL3GDa+nP6dTL5mrnvXKwVnXZVakbX8wVsaGVvGVJGfVfdb+dWbjNb?=
 =?us-ascii?Q?yaYvIvtkRwscB24fRl/oc/lsLroxGABTDGUEYfhv8/Nix7KC4FpGmxQ24AuI?=
 =?us-ascii?Q?jMpmrPz2XwgrZolAyThzWJiuzYE95zCIvcfxP2t2scV2ouXl1hQ/0hPk32bh?=
 =?us-ascii?Q?SfrvTUV3ao0f6+uJEeiLKnE1c43Oqj7EUZ9VUW5yVyDkjlbIUZe9GkB8/Alv?=
 =?us-ascii?Q?wMabLEaLseImG/Cpq5Q9YuP5ftO01ZyAONb9Ye765dbnIHHE5tJohzeK6kjK?=
 =?us-ascii?Q?BvkA3732cjjJKHH/69hwcJy+hQDdRL+WTOBQLb59kpCZX2BKx0IHdO0nnkEx?=
 =?us-ascii?Q?70HjbanjhU6ZLBoeQOmyvG1gvUCQOtld5r3lnyarSddk+KQZPRjRsZ97Z8/k?=
 =?us-ascii?Q?q6UJcE27PaV7BiihpQWOgfw5Dvprv9g7/gCkJw8h7T23NnuOGoWoHJF0jn/c?=
 =?us-ascii?Q?tNk9rQ3raCwNInTS37I0HYglN4bXbfWgWIpyQiWmWUwxN8L49nC1Hhz3vqsu?=
 =?us-ascii?Q?m4bbI6XWz3R9c7MEpicfqGzD8LVpSW1zNCSYgcBkBK0xgvVrIRJ5wHuyEiFO?=
 =?us-ascii?Q?oo3AY+dtiWFKcSvhPGx8HbdPccuM6SoQG5g8eUU2hGsai2vOoy7cjkC7ZBV8?=
 =?us-ascii?Q?JLAJDXbTRsQLQ1oIKDWp9dA1ClXduv+BpjU/Ru4NT56ifdLEPZUiV1y5WfsM?=
 =?us-ascii?Q?3DRFGhY1hQIIlQSAYCNbQatA+RGwd0v4A2FRu4fEtrMIAvI6m2LwLnIVyvn4?=
 =?us-ascii?Q?xBA1mXED9BWsTSd5sGmWqtKwoGv1bSMJ0b3aUm6W3vZpIMBIR1l0HPwUZsoo?=
 =?us-ascii?Q?qoz/CUgR1icO7rWhd9ZNohGo5pfpCCijwWP/LdnVubc8SpEFZZopm0XMqtHv?=
 =?us-ascii?Q?4QK50kMM+REXsOTOZDv5pMfyP3B5eaDrsKeGq/EHT7nf2w6H8/sWF/NqG1SX?=
 =?us-ascii?Q?LbbQ99DoLwExRzzq0UH14+5a7bugOEpbr2ph2CjcyjdWUN6HLhlb61RtsYno?=
 =?us-ascii?Q?cPOBTe2Lu43CwFww/zd0XWS+rj3KdGYBEz7MyERHv66OtFL3TD876yPVoFWc?=
 =?us-ascii?Q?nHpSh/Tp6u7vv1ZBs3XTGluGlFfchz+y0icZZJqH/rHeE5QuN9CV/5FesmGd?=
 =?us-ascii?Q?etBNDHwPtDnDMJTWR6jmOqfTeYAiy+ATgUYwnXe+zE0u9Irril57URUCkgN4?=
 =?us-ascii?Q?W3hAEgpB8FRjxlHdGqkzbC2llIohWREn0Hxkrw/BzXx3oY7GCScoiiUKDMRd?=
 =?us-ascii?Q?IL3p/7ua9a7w48uVsQRFuksyFfxefLxJHHkCyXPHMtyvxClAjpQP14aE7i2F?=
 =?us-ascii?Q?dbuG525tmqYqcVR0H0pnQNmi4zL35I4zzQLM80HrdswAWjHX5vuucEOuONX2?=
 =?us-ascii?Q?bC1EgUQmUyYnJsjveMRopnZInlFGdlOb?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HuApDlgjUUF5frBYhczAV9YUxphJAzY5kzj3hb2+6pnMI4Nq5xQZ0Q7x7Egf?=
 =?us-ascii?Q?1ULhfQYFDSNsp8NFZ4J4fv4I7olSdHR+JZImFVgdArNi84YXvGcY5QfqmPLA?=
 =?us-ascii?Q?bxwAwGl8DirtPH05AqOWCDiOIzvIFk5Y+GNycaOXsjfanhXssNksgSYUMRQY?=
 =?us-ascii?Q?RJ4KYP8+ZehZFdQtjn3OLSSc738Bx+v8/eeesF47sh9s33wEcY/Wgu10QwOG?=
 =?us-ascii?Q?+Uu5KHW4Ugo1jg1U/X6R/sr6EUfDsU/WZk7WU0nCGS+rGQcIdjl6r4EhicMq?=
 =?us-ascii?Q?mv0wOnkvOmI74wQxU0AFZT4zTowWpeprWOQWpWdHRImlAZJkI142g0G2mk9+?=
 =?us-ascii?Q?qpyri59LrznEWfl54rCg8j75HI3sFcsVp+OAKfyJ7Glfw5/3NscyrZbgcLsZ?=
 =?us-ascii?Q?JKXvF+TLSnkSK3bihEMmwZj25mv31JQINnGUjEvTvobX8xwZHqwihXYpLZym?=
 =?us-ascii?Q?ud1U86foIuV4zLMlrCg8Kjaozt8Jt0BwEDDKtcrjmk7GqN29xBw+oSLa6wGH?=
 =?us-ascii?Q?5KEHlQfcFRvwlSpyUuPnJBddSnoKlXVVNsz/WUf+jz7UN0BxgAmtDlMrFAIC?=
 =?us-ascii?Q?RS2iWfeFEZWUx/UpqqWyoWlrfiv8g+qVy4y8ttqJvH1wk9jEUfiJ00H0NYlz?=
 =?us-ascii?Q?hVop6tHKrHx1HlfsSFQs5aPr9OAbWo437c8PftP6lCYvEVA2s0XZmD7lftlM?=
 =?us-ascii?Q?Gc/ij+H11zkhooo2s7zFOhOwF542lia5+c/fooYjih/BCUTPM6catOOKyC3U?=
 =?us-ascii?Q?Fo3UTxo2sRoVTGItU5/fUZQXH0EMzXFu+HW+AuhQuLpwJm3jOHLITjscmmEW?=
 =?us-ascii?Q?IHNmXEhJZyqp3R4K/HUran9wcXyu4sFrJhdZ0YJXWJf/9q5jOJX6DIKVF/IN?=
 =?us-ascii?Q?PoqPvilRjgEfPJENE3Ts4SIsS5WMX/mLFdhvs2Reu9tlk4Vrt1oJ4sj/8PuW?=
 =?us-ascii?Q?YFOyKolLnNBuTlfewOooqYkEzo75TWx0Yhd9I0m1I30MaW+fbSMbcF8Mwfkm?=
 =?us-ascii?Q?acQEQ8Am9gPnNMUPxe4FxNkr7lCYDPXKIrmTNCJyDbbAXMOYzRHip6qxewwr?=
 =?us-ascii?Q?VHjXcKttwflHBmXLkebGIRWzT6pNrXdyfkW/rRn0aPaqfK3FPblAnV+CScdX?=
 =?us-ascii?Q?vAuYAVWDwFheJLa6iKSWEIqix2WfjrCnQ7wccSoBLy6eA2PrigXE86nLbaY5?=
 =?us-ascii?Q?SXtAQn3LRW1yvmuKf0G3/wBlZNqAj6aHYE80jlf71t+L6hdGA6eD8SAnInIC?=
 =?us-ascii?Q?5LhwOvlJO5Zsh4Omgrlhw/W6h2coPMP9K8i3XKGHvRCVdC3huwcdk0mxsMYZ?=
 =?us-ascii?Q?DuaV5w7WHNvhXJBHZ3T5m5MyF9Jw/tNIXIgttgegqGtC8Ds+jydPZ3ycwBps?=
 =?us-ascii?Q?25CbP3Jy4TNtgSLcw29TE70lBEIqDa4idiB4flCRIA9qu56VT5XYZWTpTALZ?=
 =?us-ascii?Q?M2DvvWBV87PR03/kfcWw+3Bir6rdC7ExMaU3h5uCifeILbv4y+75iI0YI6k+?=
 =?us-ascii?Q?ci4dtODPBqAHcwRu/4Iu2o9za77Sb4xNi0ncQp9c8r4dPwT538H1jq291I1g?=
 =?us-ascii?Q?ZbBkJafbMMpFmJQWZjtHMU/LUJNX9SUnxcHX4OBD?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8c2299f-4ea7-4a28-db57-08dd567b0d55
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 15:34:26.3784
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wSjfCxmI6W0/pggbWFNtwx5zQKx2rWGv5uen3d1oEd2r9Q+Voiu6zFIf1sP9YMZhzDiQ9tgc9NOtBSSP30wICw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7720
X-Proofpoint-GUID: zimEGBzmLnC6kAPliz6ri-PPDANbuUYW
X-Authority-Analysis: v=2.4 cv=TuEchCXh c=1 sm=1 tr=0 ts=67bf3485 cx=c_pps a=VLWBoSTBoww685Dj7+Q0uQ==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10 a=t7CeM3EgAAAA:8 a=yb2czfMyVGUib30JxBYA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: zimEGBzmLnC6kAPliz6ri-PPDANbuUYW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-26_04,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 adultscore=0 phishscore=0 spamscore=0 mlxlogscore=999 priorityscore=1501
 clxscore=1015 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502260123
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 15:34:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115651

Set pam module path to ${base_libdir}/security via INSTALL_PAMDIR. Then
we can get rid of the workaround in do_install.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 51eaf4a502..5524305952 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -63,7 +63,7 @@ PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} lz4 openssl"
 EXTRA_OEMAKE = "'GEN_LEX_HASH=${STAGING_BINDIR_NATIVE}/gen_lex_hash'"
 
 PACKAGECONFIG:class-native = ""
-PACKAGECONFIG[pam] = "-DPLUGIN_AUTH_PAM=YES,-DPLUGIN_AUTH_PAM=NO,libpam"
+PACKAGECONFIG[pam] = "-DPLUGIN_AUTH_PAM=YES -DINSTALL_PAMDIR=${base_libdir}/security,-DPLUGIN_AUTH_PAM=NO,libpam"
 PACKAGECONFIG[valgrind] = "-DWITH_VALGRIND=TRUE,-DWITH_VALGRIND=FALSE,valgrind"
 PACKAGECONFIG[krb5] = ", ,krb5"
 PACKAGECONFIG[lz4] = ", ,lz4"
@@ -182,14 +182,6 @@ do_install() {
     if [ -f ${D}${datadir}/mariadb/mini-benchmark ]; then
         rm -rf ${D}${datadir}/mariadb/mini-benchmark
     fi
-    if ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'true', 'false', d)}; then
-        pam_so=$(find ${D} -name pam_user_map.so)
-        if [ x"${pam_so}" != x ]; then
-            pam_dir=$(dirname ${pam_so})
-            mv ${pam_dir} ${D}/${base_libdir}
-            rmdir --ignore-fail-on-non-empty ${pam_dir%security}
-        fi
-    fi
 }
 
 PACKAGES = "${PN}-dbg ${PN}-setupdb ${PN} \
-- 
2.25.1


