Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAE8AC02188
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 07:50:00 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.32425.1737359391377642770
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Jan 2025 23:49:51 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3115d3f7ac=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50K6PTDd003397
	for <openembedded-devel@lists.openembedded.org>; Sun, 19 Jan 2025 23:49:51 -0800
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 448cpq17hp-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 19 Jan 2025 23:49:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XYWaFyo39tHdejz87xbxZhh90FzFjRQ3L86DzJGG/GWE9A7bIagL8FV1MTNAhDyjCYyaQvxXhAQ9Gt31u4dcCmQSV7OGiinkOskM7f1J6zuqZiDluQNWdbVAuy0CN5fCmfSEgvuZivA9UfEK41dbLktUtmebevSUaTNrmQJlpHO6jrtAls75cD4ywRbGmdFqOM/rCl76Nodu5CxN7ZOrJrPLuOH9wlBfnSXmZkW14xR6cZwP1aJfsXUaOQpr0Xa4F8lBL7+jVSqecV9mLbranmIDO4qTBpxOOubXpEsBMAr8zyQpODXQ3csZg0cNc4JP+3hSdssyjzsrIf+wtj5QSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v3yc4JKem882ETg7fVbE+8hM/raD7KJWluPuqLvcoYE=;
 b=t455umpS9OqSJhQfufIjxD/D01SlqAX1jID/n1zpXjVY1o51IKcDSsZ524CeFQAyYNAIfCYQN+0+w/RG76rg+G/D7v2z55yS5cDNwGBL+Lcb/OuuQkorV7Cqc29wbvvncNXZyG1eb5IT05+D21sCKwIUZabONolHUCysoblbqPaY4d1/93Sz7weOIkSZDPocclIe7MCS4kR9jZuYw65QCvqOOwopocZupBtfl4JoRk3Q4h5frokBs+Gl/fcJV6okyqSOhcEWSZZhTDUL7p9nkOTV1H+PCW5eyTGiCvJzIEp3UEcxjfDmVvJ1QwrbAySywwP7Jn3mQ207q+7ZjZzACw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by DM6PR11MB4642.namprd11.prod.outlook.com (2603:10b6:5:2a2::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Mon, 20 Jan
 2025 07:49:47 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f5f6:a389:b6fc:dbc3]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f5f6:a389:b6fc:dbc3%4]) with mapi id 15.20.8356.014; Mon, 20 Jan 2025
 07:49:47 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] crash: fix crash cannot work with kaslr
Date: Mon, 20 Jan 2025 15:49:37 +0800
Message-Id: <20250120074938.2262388-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYBP286CA0033.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:10a::21) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|DM6PR11MB4642:EE_
X-MS-Office365-Filtering-Correlation-Id: 4917e649-d862-4673-51c7-08dd392702c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?1SLjh5K3qwWz2plNj7HbRFXR9hj0vrs3Fw2HJ8GwLlOGqM04OKfYMFnh6mqL?=
 =?us-ascii?Q?6HdGV86qmgkzlRnxTVWCYLMlAl3j1T2CR3uwMRQxtmeHM4uTpMVYKy6Oksa1?=
 =?us-ascii?Q?2Ej8Gx28anFbMr+JMmzMZqaJoPcEZyva3a7CFCWrUIKgvpgA6RSHFIXaX6Ni?=
 =?us-ascii?Q?LWpfJGHshrTaS1LRgcuoC6TF0BwJvuJ5b+JYwwuoe8r/G26PYnDmfkVeo5qm?=
 =?us-ascii?Q?3ZfYehsLXnLxRXIJfmUHbYd1iyuCkev82JDScvfqVD2Fw8DwNLq2BdBF9aO6?=
 =?us-ascii?Q?0EeGX3ztRi1NBSuKTogE7oA2gmNept4Xd2fZvuMuUEem5IJ69TmurpdH/JHP?=
 =?us-ascii?Q?A7DL0EW7YrkcmzHBqYZwyC2wmapQH8nCcDJ9cAp9Sxt/NYsftXpwooOaxcIj?=
 =?us-ascii?Q?FJ1+nxmnIrtIjYs+enEpXXSfMpoA/cxQHFKombMyPipYECPC3J5Pl2HKijEj?=
 =?us-ascii?Q?4F67A6h+ouHzkcXPH/BmwpBpZaMmdEL9qS0/YV8lZ/e0muPxAWfe9HXcxXdJ?=
 =?us-ascii?Q?eUFmEIztSF5AU+WyFeE1T0AaABIUTGS/B0nU0OndqLGij/0vHtPxcpleEqvW?=
 =?us-ascii?Q?fr9GvZ5frkXsAb/XOphsEcJOv0nnP7jTFmB2mzF5A76Q0rJpdM6ykbYdOx6/?=
 =?us-ascii?Q?W5Shfv2yVuO+7WShCzNdB/U/3P/vd5Cf0Es/KRSwJOilodfY31LNMeujUoco?=
 =?us-ascii?Q?5liVemWjDOccZ7SjbdPZ3f2pQIVceHCiBcO9vVocAAgFT/PU4/4rYAoRYpYO?=
 =?us-ascii?Q?e2AdWXDXXIUNFhG0GV8cwQ8/8CzsQCLUmTYHtoFfvKX/ksi/Rm/35WZ5v7JL?=
 =?us-ascii?Q?5HF0u91YZNwhVYbG6SOVe8bw4OganXdBwHQoSq99O3mAh7h/SljStq/mR7p+?=
 =?us-ascii?Q?piF9CScWbCIdI/0gWJHM6bdK14s3zIOMwJenJEtqbHDfEE7lkC/BaAEJOZeK?=
 =?us-ascii?Q?PEpoRBSQHphFytK1DXcXullH1eAR40s3D0cqyUd8TUgc9hrPJe/pbYP2EL5l?=
 =?us-ascii?Q?xPplrwUdl1uPJgkehBulMPlYjR0bxwv6y/GYUH+Xoy7QLkKlw3Nx2koeiJW5?=
 =?us-ascii?Q?hD6FrZj839rXGBe8iq/YbOlQK6LTNOBsurJy36e6cTfKZFUz4ga2p0G8FY2G?=
 =?us-ascii?Q?limQ1rrKXXp0qn9Zjk8avZeQy2qd48YO0qmjT4s32LAcqCTqVvG/zGgYeLUy?=
 =?us-ascii?Q?H+Tzv8Nhrn8OhzGhC0RP36v4YRjSw7HgvkiS/BeIP/9sJoVjUJA7D+TXQuXR?=
 =?us-ascii?Q?LybCggPT99WiN4+sxrsbkiyNe2Fq0SXD2FiyOhOHMNy5D2B2f/7y5ej6KNsv?=
 =?us-ascii?Q?ZtovK9GDdEetAsiJEx4oZhwLib3plIJASy7M0jIdwtFM7Bwrq2wmkxIKm3kU?=
 =?us-ascii?Q?sVaSe8tB9QlvPZJNvnaLG+YwKsfV5Jcusy2PgWQvZp+m69XtMw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ohaQG0vX4Eujgu0ktnYWr2XF9AwZi2tNGl2eonRK40ugucWt5S3t6jPpd+nE?=
 =?us-ascii?Q?PsJ1Mhc744bFIxNnFYBN1+iQgCyQqLurBBZbwavEOkTxGOLVdNLg+xRmtago?=
 =?us-ascii?Q?tC/OiJmSbis1Hk4Hk6IH6Yvi+qBdT24d+QXjvhTd/v6hWJM2oJTugiQPHTDL?=
 =?us-ascii?Q?4IRNO5QqPGOpJXxcA00/a3rNCuFBPxQTvlRtkDr9/zMtG8g+0f7/YGGPRqZV?=
 =?us-ascii?Q?T2pmDBF6kOowddu/5QNkO77aiS6sH0BAwnGYKhtIz5dJ+bqevxeRFWSzhTHh?=
 =?us-ascii?Q?URxzW8dgzO+GxmHK+how1UR7uO/eGV2MfkvzjHVwzKW9jzuPkqSFi8xVFhoc?=
 =?us-ascii?Q?gh1xECPbMqqvRW+AqSS3Jl1V25QKtEXpc1O3MFj+5J2WYuKG2KA0AlaxF6Na?=
 =?us-ascii?Q?2AjKe39LUH2jEiBpr7gtbRjq1fRchleGnnGaPMINIezcQO01PXtEhvcGxMEd?=
 =?us-ascii?Q?LUDDxQn0OFb4bWLngMERM3EkDZ8YHtY7I88zdiXrYSrjQWuHQx91PLm41C8A?=
 =?us-ascii?Q?Tc35WSE5IM/b2mGQUhk6JrYZa/L9rz6Zj//h3RqKsScuFY2FaLavk8qxoG4w?=
 =?us-ascii?Q?xza78BnkH9YBBX0uHhsGxjUT77sJoQL+KVuiqQWzP/a6+r0a80XIemxyLK9G?=
 =?us-ascii?Q?zwIo5/ghRVl8vEcYj2/8kQ2JriJUvxf0Jdbch+4hvzV6YJ3emAJ+oZeRlagW?=
 =?us-ascii?Q?1coNUfmt/ND456FPbkshTrdWRTBzONwdKY+WoEr2grV3KChHzhsOMohtIUum?=
 =?us-ascii?Q?Z6jlFYlKmg6r6Nmwk9D0ecFvTtq+q/SanCn3FnxuSnf4dha4Y8evnnYJWY5/?=
 =?us-ascii?Q?od0pK4lQhIrtYGTobmXJvS4TafEVOJmkk9ak4OouzjJegFdmxLUrthnu0bsk?=
 =?us-ascii?Q?+YgFQIPvs3T/7pjW/rLVCQ1NZh4Fh6E6URy16oOMB1zfdZXjXtBmVIVnF3tj?=
 =?us-ascii?Q?GJHhc2fmMt33glJ7oxLXLIfHwADJ3aH6ovLUbL71dluH54xWXvS5UCOiOsCI?=
 =?us-ascii?Q?imQHXuHEPcN9ak4IEg1ASlxSw5dsqWUfN51ZQVgT1N2MpvIZyQ/5TkQV3feh?=
 =?us-ascii?Q?JhB3xFvwT8laUkFNwqfMceZtZV9QGYGaeX06mC+UKvcKKe4QAWfqMEktKA3U?=
 =?us-ascii?Q?QM7MAai+vTYA5fb1EiEZokn1jBHAmKOG1r8Rl0Mjt0SIHqd9mbGQNaxpxARq?=
 =?us-ascii?Q?ydK85d4PPkDU+iw951RGaldBc9SsDadPOVafzF2ffFUG0t2XHX+jqd+QE6a4?=
 =?us-ascii?Q?nbqmmlKQrbTHnh0vH7vw5SMcl1AXX0aVeyM+SMfEIjWOifQt6dwFmsZvFTLS?=
 =?us-ascii?Q?8cSgyOBNmFcQkUiit4cR3yLWl03u2qMPKDTlMIvFQaxX+n5mKh97DH6WWUg2?=
 =?us-ascii?Q?Dk+d3FtLWslFG9sEkJrHROtAnX+iaM/Vc6YZZV65inckoxs2TJ1a+lrrVTO4?=
 =?us-ascii?Q?OLHeNd4i07aE1sU11yfJqZ/LS2cYmAmYVKe25+p0Ke4+iFWyB9pP+pPOo7iT?=
 =?us-ascii?Q?Kw7/GrEWgpAJpyX3BP7pVgU6TxLarlZZlm4sWrG9q21Ag9t3fdIWqt5qq9qI?=
 =?us-ascii?Q?Zao0OvS2c8anyNM0T7peruCLJ0cEMhh1fg0GaOF8yd8Ap/xz9oDnvBQcysR+?=
 =?us-ascii?Q?FA=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4917e649-d862-4673-51c7-08dd392702c7
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 07:49:47.1328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2nEiH/bHqiNbaicAwr/zsRgTK8IA/c3+fdVLhdhk1u1j86rUZUaq5OMQ7rBYgaob3L8tW2CnOcKW4H5YmFvdTqx+TtySJcZeyn4aLgmTatk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4642
X-Proofpoint-ORIG-GUID: l_Dinwvztudg1CkU9WAzVhPrhchq_Sp9
X-Proofpoint-GUID: l_Dinwvztudg1CkU9WAzVhPrhchq_Sp9
X-Authority-Analysis: v=2.4 cv=TdtstQQh c=1 sm=1 tr=0 ts=678e001e cx=c_pps a=clyc6YhGvfCRRXf4btgSWw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=_Eqp4RXO4fwA:10 a=b7JCq0Q3AAAA:8
 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=20KFwNOVAAAA:8 a=bAUgQ3DjsJl9ahxi_C4A:9 a=OeAogzt4mPoSVrmxIpBN:22 a=FdTzh2GWekK77mhwV6Dw:22 a=Omh45SbU8xzqK50xPoZQ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-20_01,2025-01-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 clxscore=1011 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 adultscore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501200064
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 07:50:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114962

From: Xiangyu Chen <xiangyu.chen@windriver.com>

According to crash help message, crash can decode the random address with
"--kaslr=auto". But it has a bug that when with "-S" in parameter, crash will
bypass the kaslr option.

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 meta-oe/recipes-kernel/crash/crash.inc        |  1 +
 ...x-S-cannot-work-with-kaslr-detection.patch | 89 +++++++++++++++++++
 2 files changed, 90 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/crash/crash/0001-symbol-fix-S-cannot-work-with-kaslr-detection.patch

diff --git a/meta-oe/recipes-kernel/crash/crash.inc b/meta-oe/recipes-kernel/crash/crash.inc
index 29cff569f7..cab4e178b9 100644
--- a/meta-oe/recipes-kernel/crash/crash.inc
+++ b/meta-oe/recipes-kernel/crash/crash.inc
@@ -22,6 +22,7 @@ SRC_URI = "git://github.com/crash-utility/${BPN}.git;branch=master;protocol=http
            file://0001-cross_add_configure_option.patch \
            file://donnot-extract-gdb-during-do-compile.patch \
            file://gdb_build_jobs_and_not_write_crash_target.patch \
+           file://0001-symbol-fix-S-cannot-work-with-kaslr-detection.patch \
            "
 SRCREV = "ceacceef7d13134d327719a624cfafed99e90f8a"
 
diff --git a/meta-oe/recipes-kernel/crash/crash/0001-symbol-fix-S-cannot-work-with-kaslr-detection.patch b/meta-oe/recipes-kernel/crash/crash/0001-symbol-fix-S-cannot-work-with-kaslr-detection.patch
new file mode 100644
index 0000000000..47182f8b6c
--- /dev/null
+++ b/meta-oe/recipes-kernel/crash/crash/0001-symbol-fix-S-cannot-work-with-kaslr-detection.patch
@@ -0,0 +1,89 @@
+From 329bd56da28fc1b5b53a60ca2172643d2090435d Mon Sep 17 00:00:00 2001
+From: Tao Liu <ltao@redhat.com>
+Date: Fri, 13 Dec 2024 08:36:03 +0000
+Subject: [PATCH] symbol: fix -S cannot work with kaslr detection
+
+When kernel enabled the CONFIG_RANDOMIZE_BASE, crash needs to add "kaslr=auto"
+in crash command line to tell crash to decode the random address.
+But when with "-S" in command line, crash would bypass the kaslr option
+that cause symbol from kernel image is mismatch with ram on a live system.
+
+The fix is provided by Tao Liu <ltao@redhat.com> from crash-utility upstream,
+and not merged to crash master yet.
+
+Upstream-Status: Pending
+[https://lists.crash-utility.osci.io/archives/list/devel@lists.crash-utility.osci.io/thread/5OXNYPPU6GLLQKCWH7WBNBJXLNZ4EBZD/]
+
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ symbols.c | 18 ++++++++++--------
+ 1 file changed, 10 insertions(+), 8 deletions(-)
+
+diff --git a/symbols.c b/symbols.c
+index a3cd0f3..6062d21 100644
+--- a/symbols.c
++++ b/symbols.c
+@@ -25,7 +25,7 @@
+ 
+ static void store_symbols(bfd *, int, void *, long, unsigned int);
+ static void store_sysmap_symbols(void);
+-static ulong relocate(ulong, char *, int);
++static ulong relocate(ulong, char *, int *);
+ static int relocate_force(ulong, char *);
+ static void kaslr_init(void);
+ static void strip_module_symbol_end(char *s);
+@@ -230,6 +230,7 @@ symtab_init(void)
+ 				DEBUGINFO_ERROR_MESSAGE1 :
+ 				DEBUGINFO_ERROR_MESSAGE2);
+ 		}
++		kt->flags |= RELOC_FORCE;
+ 		store_sysmap_symbols();
+ 		return;
+ 	} else if (LKCD_KERNTYPES())
+@@ -817,7 +818,7 @@ store_symbols(bfd *abfd, int dynamic, void *minisyms, long symcount,
+ 		    syminfo.type)) {
+ 			if (kt->flags & (RELOC_SET|RELOC_FORCE))
+ 				sp->value = relocate(syminfo.value,
+-					(char *)syminfo.name, !(first++));
++					(char *)syminfo.name, &first);
+ 			else
+ 				sp->value = syminfo.value;
+ 			sp->type = syminfo.type;
+@@ -893,9 +894,9 @@ store_sysmap_symbols(void)
+ 
+                 if (machdep->verify_symbol(name, syment.value, 
+ 		    syment.type)) {
+-			if (kt->flags & RELOC_SET)
++			if (kt->flags & (RELOC_SET|RELOC_FORCE))
+ 				sp->value = relocate(syment.value,
+-					syment.name, !(first++));
++					syment.name, &first);
+ 			else
+ 				sp->value = syment.value;
+                         sp->type = syment.type;
+@@ -924,7 +925,7 @@ store_sysmap_symbols(void)
+  *  are not as loaded into the kernel (not unity-mapped).
+  */
+ static ulong
+-relocate(ulong symval, char *symname, int first_symbol)
++relocate(ulong symval, char *symname, int *first_symbol)
+ {
+ 	if (XEN_HYPER_MODE()) {
+ 		kt->flags &= ~(RELOC_SET|RELOC_FORCE);
+@@ -937,9 +938,10 @@ relocate(ulong symval, char *symname, int first_symbol)
+ 		break;
+ 
+ 	case RELOC_FORCE:
+-		if (first_symbol && !relocate_force(symval, symname))
+-			kt->flags &= ~RELOC_FORCE;
+-		break;
++		if (!(*first_symbol) && relocate_force(symval, symname)) {
++			*first_symbol += 1;
++		}
++		return symval - kt->relocate;
+ 	}
+ 
+ 	if (machine_type("X86_64")) {
+-- 
+2.35.5
+
-- 
2.25.1


