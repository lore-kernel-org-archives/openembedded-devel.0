Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 869CEE77173
	for <webhook@archiver.kernel.org>; Sun,  8 Dec 2024 13:25:45 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.78175.1733663430640694161
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Dec 2024 05:10:30 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2072e18c9a=ruiqiang.hao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B8ChV6L028204
	for <openembedded-devel@lists.openembedded.org>; Sun, 8 Dec 2024 13:10:30 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2044.outbound.protection.outlook.com [104.47.70.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43cwy3gf76-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 08 Dec 2024 13:10:29 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P3pJ+4QhkrchQyOtI7f9tM9ssh6L4IPIrIArAt2iwPeuLaEmLCyj3Mds1Xg9ylLfrOo9IVp0v89LnKYcNds8hjSuEbC655l+7m6AXJqcLybxboF9aryMBeX5eEKWZ8Y+WjVGMxaS2yzciwKUGVBVT7UZXn6IeBQNw8yp3e05CtXn+44tsxL7IRVdwHTCljf31yFcaBAxKnDdxd0VTbPp+psKDl/WzomtOQxrnfABPVajoN2yuyiZOrQJOcgGjua74a8otZDsXFTvlT3l20tQEcD9EyFdYSrwnUgjg+mAKI+VzIZZWayVsnz5NGkeIgHsaFdGF/vaLJbfwptMWHs/HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x3QoMFH++yqPFi1vLtBK7FqNA4/CWUJtV6cgwdjsP0Y=;
 b=ekN0iopS9igBg6t76iZ+x3sxcl1WVuHPYeWESkKmD7J+SYcer5X5bPbo7J7i9j3HF9yGrdWim0ERnMNmf1fn2idE14uJU/ot+kwo+UJmGIVAZUpsMy9/i7wrVyptmCmHKPGWvEaJrruwxfk2jsHNcFSDAoOYUPslE+qkcE69nBbp2Q7V1dc/4fRjLzrUSfr1XW1VPZfrKkiQHPaJvN+4zTWLRf4TJt4Zym96i1/9k1TeyNDz9EgghJT9nHtgCrs2tkhuxFMzIf9ecy/Ig5xX2cRQHNWgNJr/FtR9d7vzdXqEsIO22laFgAEDpRvdfo63K5CPHljBFOjF2jw92ghMfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB8025.namprd11.prod.outlook.com (2603:10b6:806:2dc::19)
 by BN9PR11MB5307.namprd11.prod.outlook.com (2603:10b6:408:118::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Sun, 8 Dec
 2024 13:10:26 +0000
Received: from SN7PR11MB8025.namprd11.prod.outlook.com
 ([fe80::a5fe:8f1a:b4b:d00a]) by SN7PR11MB8025.namprd11.prod.outlook.com
 ([fe80::a5fe:8f1a:b4b:d00a%4]) with mapi id 15.20.8230.010; Sun, 8 Dec 2024
 13:10:25 +0000
From: "Ruiqiang Hao" <Ruiqiang.Hao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] mariadb: Ensure compatibility with ARMv9 by updating .arch directive
Date: Sun,  8 Dec 2024 21:10:15 +0800
Message-ID: <20241208131015.2274963-1-ruiqiang.hao@windriver.com>
X-Mailer: git-send-email 2.46.2
X-ClientProxiedBy: SI2PR02CA0018.apcprd02.prod.outlook.com
 (2603:1096:4:194::18) To SN7PR11MB8025.namprd11.prod.outlook.com
 (2603:10b6:806:2dc::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8025:EE_|BN9PR11MB5307:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b8d547b-869c-42bb-5c96-08dd1789ae20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Onw/EnK1paCwVpHtfguciOsi5uoU80/V5TwJ6Qj+JkDtISmsgnp8qHKmyU95?=
 =?us-ascii?Q?aJLa5MdSaZooR0f4mpYE/J84C3TM8DQJbrOx50KDBJZFpqLLQqy7/g2Z6s73?=
 =?us-ascii?Q?xz2uiZJBnWxPIo8k4h5Eu/Sh5w2gz1PAQ/MnJkhQok46fii7JjP39IqxilIE?=
 =?us-ascii?Q?k+EEzI6gHRKiHPDL7LYsagT2C/CgiRWAUGCRbpZ2KtYzgSVYIshVkMueoaXb?=
 =?us-ascii?Q?Yn3zIxUgpFhFjU7UQ40rzOUY4wrqzyc7n6ev/IoKul6vbB1DcctzMk4BxZkm?=
 =?us-ascii?Q?rnc9p1UjUckYdPtcGKglkg1SvHgFoQwC93n+0YfstazYcKUNdA1ilPEXJdbp?=
 =?us-ascii?Q?ITxdgeetuHBGAr7D78yiElk9tr8RhAGByPIKky5OyiphX8QuMohzSC3PmSvv?=
 =?us-ascii?Q?YznRlWXZ+FJbddaZc//qsRBFsuaoGIqxPeyXmrIel8/IWEOhAITTzklAcXOn?=
 =?us-ascii?Q?pYYP7mI9Go+DvZjbYNH1KeBFS2F/ypY6pgE3b3ZLgNFA4VHiV3KVyyf5Zv61?=
 =?us-ascii?Q?AyvI4KB00zPWOSdqwsz9qJ+ognjuheN+8Dm+9WYeihC/E1w9MAgO+0LrLzdA?=
 =?us-ascii?Q?6j9bzDiNHuEtBqyLV/sSUN3Py5hkiX8kN4ZVIk/IrhnM3heNzJRa7Xtx67v8?=
 =?us-ascii?Q?2mNcwNMc9Ri9o1g4H8rQPt8ng/EsdMhE0eqAanyG52I+g8XoJQ6coUZFZ+rr?=
 =?us-ascii?Q?luDsRaLGKtRGMaM1sy8Ckg9JfkO4b1UZPlAEoHJlB4NAT7p41MREGKNAE0ZH?=
 =?us-ascii?Q?wFZSKagWDwgVs1RUKYVylMhSPXCdWsT/zzx+OnNi4NKsAv97Aa5nvOgLvwIX?=
 =?us-ascii?Q?18YLgQMT3Vj/bCPjhdVKYKQ75I13yAWGVCU76bl7Q+fIVF+G8WlUacSwQ3t0?=
 =?us-ascii?Q?e3A92H2fds35/zZRIR80tVafushBWie0trxKzFnBvn4Yu6yywQnxe+AhyTMd?=
 =?us-ascii?Q?nrNbBycNLzanF+SqdkgxsxPOi9y19J1YnmgSsVyj9UmkPwXiL0PwxxHrBpb9?=
 =?us-ascii?Q?ry9idHzctpYfMBS9K+EQUgsyaOqaCYTIGl+eJhDq6AvEXDiEwmkXt0EYA8k3?=
 =?us-ascii?Q?ejrJzQ73kWI29DC4FAQjHjjYFUIK5y3WiewHlsZfFLWI+x4aUhvlssHnLhu4?=
 =?us-ascii?Q?kkgcFJI+cWTuUSSJnVOwU5LWmlvz9b3VoZvGYIpgjyHuMeiT5V02OB9+jvr/?=
 =?us-ascii?Q?9qI21RBW3IIHWvM3AP0OfSQ6BGpTgLKO1Q6ZMoYItm1umS+WhVitTUzJ6BJM?=
 =?us-ascii?Q?rgFxpBftplVPxz605O9hbNgLpiBS6hib3dHLCxzMZWmdkQ28Vgg73iBXo4nD?=
 =?us-ascii?Q?iq+E5SWZJ1KdUe5t3Ia8bQn9MBvtQp/6t+FyXSkidVOovQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8025.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?uZWvVS1JZWykbQuEv1eqiFzq5E2yBkbhfUn2hCKCLTTNvn+F4bJkp/j2psCN?=
 =?us-ascii?Q?47ZtnfEJ/pNzykZyyY7fCgV7nHM4c6us4Ie9/31VNasrulPDFqISm2cpg4JY?=
 =?us-ascii?Q?IviBaCQiejxfP48N1YBdl0pnjJrUCtzXNb7tN9E5U8bUkJlfYtX+MMfjsAUD?=
 =?us-ascii?Q?eCusk64Bq6mj2CNHZAzupKlaCZ3NCo+9VbFrpe6sIzKVjGF57GL+S/5S8gKQ?=
 =?us-ascii?Q?ihuyAvnVZDc/YojXjJFliy8JkLYoq2ZoW5ATy18a7IzQBPqzhcy8iMeio0tP?=
 =?us-ascii?Q?xEuk8d48B7nhddtGcwNYg2PTuduPuw6eMsz8GXHndU2FXqdWKLTuNTh0U0Gf?=
 =?us-ascii?Q?znteUXOrSiZK1CFdOQ4Bcz8WlWesOVKtaqWXH3iLJkdSsNsnkTiYUkQ+1SnN?=
 =?us-ascii?Q?mnLYOgtJYEPff7EV/c+Zh1URSHyCKU8p+f9s9M1BZeU6wAcBsfaDIEJlbYQQ?=
 =?us-ascii?Q?g78FQ/LMxWyXkpTbaB8IQ6HthnEISMcegsbnGyciq6yBEi0+xZ0MuMPayRyj?=
 =?us-ascii?Q?3Avr3Ak3wKmCnJ5ZNx5XS7Z9WYhVb76470a0rO542Av9bTUybAkEXNVuUrIM?=
 =?us-ascii?Q?va+6SUvNeiSs8RLWPCpVrloPPwoNAeLMfg3zSGxS+tCf9yuE3BkvZCTTGLRk?=
 =?us-ascii?Q?EWH0Ejr8NrKkYGEyPn2RcwOzceNicfdtRK+e+jcOkrOHAi9sidxEjFBnAGul?=
 =?us-ascii?Q?N0n/cf2QrUc4380YkpkUFPJPC2qNSG3PMH8jQTCCo386Tz0VLbOEBVJdxpdJ?=
 =?us-ascii?Q?fYvSrc6dpHfGly/tXz8PgQVrI1ysutlz3GQopfkMfUF4AgTM6Ss2QfsuTi9D?=
 =?us-ascii?Q?YW0kv1EKxqO5menNGTPxaUVS8mU74dyjakmtRuIEfH6CSZkhbk6Syn3wWag1?=
 =?us-ascii?Q?2uqrr0jriQk3Qjk+5fc5VsJ0jUBHPBDb7MuMGM7efLZBu8lh+Jw9Pem+EEfo?=
 =?us-ascii?Q?xwnJpK453mOJUvapcv8Rdf/d2YvmVoKzNuXm+emy2hNwo5ITSFEkbnLN3n9o?=
 =?us-ascii?Q?4Vou2QUrHudwEHotIllNCehr2PiRUeESApmRpfVV4FC1NBjgwNncSdnfnXWU?=
 =?us-ascii?Q?7s4EayvX1M1XihxRM+DT086f1fOTpiKbwg6aj06exU8ZZpfKkY9dFkKaUWBs?=
 =?us-ascii?Q?IyzAPeApLL5GOyuuULFP/wA78E2T9GOV8b4SYIDR7LR//O7UdxcYOeYNu1ml?=
 =?us-ascii?Q?uE2bMvtlcrSOM6h3/WXgJCxkcjJG2Wizj04pePf3rkajv/8EDeVnK6c4f4Bt?=
 =?us-ascii?Q?N37CM5qiUezj6SlBw80tjU/T6yxv2S8+x1zDjVWZbM6TB0Gfj+lf/yFQFswB?=
 =?us-ascii?Q?Z8jaNgkdxK53luq30BOpR/oc4oPfA7xzCn/oIFLem1HAL6QLW9NvOchTyl1s?=
 =?us-ascii?Q?3LCKFoCOmYWIJytdls470aKjLhhiZR0Euy6Hc/CLzo1r4vwf1gCrIHGyQQIH?=
 =?us-ascii?Q?8A9uT23IAi+wDYVSNPgxRc4NgkgG4OjLzkAK2ZliOtbgkAPEBuvKU9S6MH+x?=
 =?us-ascii?Q?BumwWlmaCLq45xlsDe3vs8ebYwPVa8I5wTQoJfFJlVHVzloalIYY+Np5ETsp?=
 =?us-ascii?Q?/X/swje3MQvd3dsWWno4ACXdUJ/A0ulN63ZAew15WdflJiDDyAhSPGjrybmt?=
 =?us-ascii?Q?BQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b8d547b-869c-42bb-5c96-08dd1789ae20
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8025.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2024 13:10:25.7753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RI+BDEBLh90X/UC6gFr7j0x4vrZEo2H5zcNE2JZr9b8fXUCDSv4C5AfJmN8aUzDnHjtX99Y1G+lIl45FRf8d1DM+W80Zd7Geuq29pJGxciA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5307
X-Proofpoint-GUID: 1cJVp3yzKlT9NAlWY5lckrSFOv0_vqdo
X-Proofpoint-ORIG-GUID: 1cJVp3yzKlT9NAlWY5lckrSFOv0_vqdo
X-Authority-Analysis: v=2.4 cv=D7O9KuRj c=1 sm=1 tr=0 ts=67559ac5 cx=c_pps a=zz2QubYGG/9FVtTd3zWqHQ==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=RZcAm9yDv7YA:10 a=bRTqI5nwn0kA:10 a=hkEv4HZQAAAA:8
 a=t7CeM3EgAAAA:8 a=0Zp1yqKfI_gDoSq-tG0A:9 a=NA03pvyaApPJG5valX87:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-08_04,2024-12-06_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 mlxscore=0 impostorscore=0 phishscore=0
 clxscore=1011 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412080110
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Dec 2024 13:25:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114227

From: Ruiqiang Hao <Ruiqiang.Hao@windriver.com>

The pmem_cvap() function currently uses the '.arch armv8.2-a' directive
for the 'dc cvap' instruction. This will cause build errors below when
compiling for ARMv9 systems. Update the '.arch' directive to 'armv9.4-a'
to ensure compatibility with ARMv9 architectures.

{standard input}: Assembler messages:
{standard input}:169: Error: selected processor does not support `retaa'
{standard input}:286: Error: selected processor does not support `retaa'
make[2]: *** [storage/innobase/CMakeFiles/innobase_embedded.dir/build.make:
1644: storage/innobase/CMakeFiles/innobase_embedded.dir/sync/cache.cc.o]
Error 1

Signed-off-by: Ruiqiang Hao <Ruiqiang.Hao@windriver.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc         |  1 +
 ...lity-with-ARMv9-by-updating-.arch-di.patch | 44 +++++++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-Ensure-compatibility-with-ARMv9-by-updating-.arch-di.patch

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index abcf0b3cda..32a21147ba 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -23,6 +23,7 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
            file://0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch \
            file://lfs64.patch \
            file://0001-Add-missing-includes-cstdint-and-cstdio.patch \
+           file://0001-Ensure-compatibility-with-ARMv9-by-updating-.arch-di.patch \
           "
 SRC_URI:append:libc-musl = " file://ppc-remove-glibc-dep.patch"
 SRC_URI[sha256sum] = "0a00180864cd016187c986faab8010de23a117b9a75f91d6456421f894e48d20"
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-Ensure-compatibility-with-ARMv9-by-updating-.arch-di.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-Ensure-compatibility-with-ARMv9-by-updating-.arch-di.patch
new file mode 100644
index 0000000000..33ec4465e3
--- /dev/null
+++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-Ensure-compatibility-with-ARMv9-by-updating-.arch-di.patch
@@ -0,0 +1,44 @@
+From 1b0c05b53ede7decb3f4dfe6187f9573cab5e0ab Mon Sep 17 00:00:00 2001
+From: Ruiqiang Hao <Ruiqiang.Hao@windriver.com>
+Date: Mon, 2 Dec 2024 02:18:46 +0000
+Subject: [PATCH] Ensure compatibility with ARMv9 by updating .arch directive
+
+The pmem_cvap() function currently uses the '.arch armv8.2-a' directive
+for the 'dc cvap' instruction. This will cause build errors below when
+compiling for ARMv9 systems. Update the '.arch' directive to 'armv9.4-a'
+to ensure compatibility with ARMv9 architectures.
+
+{standard input}: Assembler messages:
+{standard input}:169: Error: selected processor does not support `retaa'
+{standard input}:286: Error: selected processor does not support `retaa'
+make[2]: *** [storage/innobase/CMakeFiles/innobase_embedded.dir/build.make:
+1644: storage/innobase/CMakeFiles/innobase_embedded.dir/sync/cache.cc.o]
+Error 1
+
+Upstream-Status: Submitted
+
+Signed-off-by: Ruiqiang Hao <Ruiqiang.Hao@windriver.com>
+---
+ storage/innobase/sync/cache.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/storage/innobase/sync/cache.cc b/storage/innobase/sync/cache.cc
+index 43d642d05b5..af2d1f3d221 100644
+--- a/storage/innobase/sync/cache.cc
++++ b/storage/innobase/sync/cache.cc
+@@ -82,7 +82,12 @@ static void pmem_cvap(const void* buf, size_t size)
+   for (uintptr_t u= uintptr_t(buf) & ~(CPU_LEVEL1_DCACHE_LINESIZE),
+          end= uintptr_t(buf) + size;
+        u < end; u+= CPU_LEVEL1_DCACHE_LINESIZE)
++#if defined __ARM_ARCH && __ARM_ARCH == 9
++    __asm__ __volatile__(".arch armv9.4-a\n dc cvap, %0" :: "r"(u) : "memory");
++#else
+     __asm__ __volatile__(".arch armv8.2-a\n dc cvap, %0" :: "r"(u) : "memory");
++#endif
++
+   __asm__ __volatile__("dmb ishst" ::: "memory");
+ }
+
+-- 
+2.43.0
+
-- 
2.46.2


