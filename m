Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7AD3C36014
	for <webhook@archiver.kernel.org>; Sun, 30 Mar 2025 09:21:02 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.27613.1743326456816841727
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Mar 2025 02:20:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=61843d4d18=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52U9KXvp005865
	for <openembedded-devel@lists.openembedded.org>; Sun, 30 Mar 2025 09:20:56 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2048.outbound.protection.outlook.com [104.47.74.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45p63111r8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 30 Mar 2025 09:20:55 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T1WYvtm22bAtVELvjdXMhp1EXmc5wd1MOyWlgdT/QZoDQkc+lUM6plQ7j0Q3kEJcucBqIPsIvhgpo1P19OdKXkKWjR8RhLwWBE34fVTnOp01Gjzk+qD4N/baLob8tNFtq9Y36hr5LK6Wu5ZFry22XJV9Pew2GcGLSPaRUHxC/6hZ2RB1O+Cfh3kR6PKloqMoG4rhhPFpmfHNV7il0NeAZpLGqAqwU6TTboJr90UX8HYDWNHIK+x/8Pn6aecsAno2g0+12tz4xlGIzO3gzKGmKVOmS8jT/OuDY1vNsuYML2jbSUxl2rDkHSNepEVjzUTPtslAQA6Q2t/3jJZbrpeSpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h+e0GaFIvWqjKI8Z5LPPOxTlJSRAQKeMHK64sn1f0fM=;
 b=MrNKwE2Hk21GLy+kAMKdA1dcA0usSK98azsufTBu/fvRT6EpsrBPbtZ50Wd5p9xCEdJO7F3PtgPalHkELyEtQf1q45CacnOlUXNr2y+RU5jOO/SQPtj6JkhcNRV0BO0IjPqofIKNkMUEdoYIxKopjjNNfWo2q3APvdaJz0NqO3vSG/+2XEDL0bzUONzm/QnfqYyQCRSfdZgfqETUWDmGodbb8bsh4d7+rWRjez733CEdVcvBY5hfWtXTwZ/RudkktqfkPbYnxLHOqZuO6v3Y4urpm4MbeP8JuTeSlNyRrDXqAnE3cP71yWSaKOwCHiwBXSEW10EQIHx+kvOihMuUJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SN7PR11MB7420.namprd11.prod.outlook.com (2603:10b6:806:328::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Sun, 30 Mar
 2025 09:20:54 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8534.043; Sun, 30 Mar 2025
 09:20:54 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 3/3] mbedtls: 3.6.2 -> 3.6.3
Date: Sun, 30 Mar 2025 17:20:40 +0800
Message-Id: <20250330092040.1267913-3-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250330092040.1267913-1-yi.zhao@windriver.com>
References: <20250330092040.1267913-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0196.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::7) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SN7PR11MB7420:EE_
X-MS-Office365-Filtering-Correlation-Id: d98ba7c9-b65f-451c-95c0-08dd6f6c2bda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ciNMB50TNbv1oqNB774Rs5wPnEiiE/2EbiMV8OCq6bQPncV/g2qkA4jJ1LG3?=
 =?us-ascii?Q?XgJelPhxLu4JFpLCvbB8DfMf7SG/DUIesFTfoOWXkAJkYNJ9qK+JstfV9TZ8?=
 =?us-ascii?Q?I4TM6SDp2YGN8ZPpEYIhDnAV7sRmI6sWKUmLCexP1mnP5T7hoZcfvePX9ROJ?=
 =?us-ascii?Q?khptqLvmB1HX64H+q7R8Zimo4NhYDFt6Vh1nupUkhIlESIIVEbrScsLrAyas?=
 =?us-ascii?Q?aSUVPcVBpRwt2J8vziE3Inv1fA+06E3W1pffK2VDkxBm11ovlJz5nlVBizjW?=
 =?us-ascii?Q?E9BCYQiSvQjv6+4kvg10Bm3xGjJTVb4yx1FqZXOIeX361kAVr3cpDivi+rJv?=
 =?us-ascii?Q?7KatbyxfY5sprmJD6XQIfZyQEN+OCz4eI7Wq5vXY7prDHjGXPmy79hoQqJYR?=
 =?us-ascii?Q?5iIek6SWwLfJ6hfzzZJGNuBpiJebhZhkohxMTxcX/R0RfsAsnH2SG9RC2RyI?=
 =?us-ascii?Q?E9YHeOIb3sU5udB0J1TNC4vkacV5KZKvtlC+43fdtSdorbbHAKYf+4HtI5ZB?=
 =?us-ascii?Q?W6+xSOPOa6qi0BtqIH0iYSmsIkdEpkGzc7u7TFLZRARvLfXQ37DTchbniakI?=
 =?us-ascii?Q?cAYN4Q0ZbVTpne1kUv5hnw5UbYNREH3wiJEVfjT+UXk0x8UMvovzJZzDDXsY?=
 =?us-ascii?Q?yAVjNKRuiRV6NTQ0nLRHtDareVmTkSKgdVXAwPnrHcuRnGr6DOht3rglJnuU?=
 =?us-ascii?Q?g0QGlGaGsvhHwZQssmGGG7O/hCPkhnT5N5n63vpUXwvNtpmmu9dXLkgBfT0O?=
 =?us-ascii?Q?0jgVwPrk96Rur2vZtetYhlAnBlRtMfCeT3J7h2eHKQGRfZR26AD1eXKwTNtz?=
 =?us-ascii?Q?WaG0fvi60WJORlT94sLhdd2Rlx16m06PdH9i9Gjx+16rYfdOxLBl9EZdkv6y?=
 =?us-ascii?Q?SgbmOWiOHPdPW8JTycjagKaDc0UPPcWjgxxjneuVlBbbtQmNZvqyvGlauTQs?=
 =?us-ascii?Q?AdKZUAJ8boDd5N5E22zdcdQPjjynC++lQvGQNslmAY3GzL3I8DCfqBKEs0q4?=
 =?us-ascii?Q?kL2/0xIkCxa9PGPP1lj4BSgXru+iSbN45z2dicUidQ/IRnxOg+QKOxNzNt8y?=
 =?us-ascii?Q?Z4wuW7CGCS7IJYmDnsGXf01EwlLNu+43Ge+UA7b3EH1a6+OMsF8Vvb8vl+ct?=
 =?us-ascii?Q?1fGjmjjK3YDmbNNHaOgqxNny/jFb2fz0gAIrGBMxfL8C8mcPZiGny2I4MNoN?=
 =?us-ascii?Q?yeVwlPB7OrLRCiHyA7R6QhwV/bqVXhccy42ALurM0IJcoRGq/R/FpDGf53al?=
 =?us-ascii?Q?rl0Hq+nQiOssErONvt8QbE0rUzNqWjlKfcNE0HZjfeIxmk2BMsCE6gH2V9Op?=
 =?us-ascii?Q?XQQwCmB6x52tKm3p1Jel5k1j60CZUX8PSCvMSpb4+UTN0/1ZvYx9GkM4ABQj?=
 =?us-ascii?Q?cSGx1UifD6IWJrzpoa63HsjjhXDfH491kD7ffBSmIrszHQupqRiou/ERXIDi?=
 =?us-ascii?Q?1Pj1rYu6rXI4HJf7QCC/uLLqtjDz6flbMSkqjed5DBPJ8+KiV3P3lg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?p3qu+R5+2qWScpN1YxpWOmO8leKzIEzuwteik8EggHHp3eitIBbude3lc+NQ?=
 =?us-ascii?Q?eRDjRT7Sn40NeERS3IjYmLGH2gsHstoFtfKzQ5gzrpQIqsJvxfn8K+Ri92zL?=
 =?us-ascii?Q?SZWG9IC4r5E5Tsr3g12iOXwE3cdXoVWEToKK4f1aIimc1HKLcWIjS6JO+Gua?=
 =?us-ascii?Q?MtQUjv65Ap2zeqX19lipRCC8wpekb+f7SkI3CrO84ZyMbqMy7aTJKzqW2GiD?=
 =?us-ascii?Q?cfS8PCdsiAatyZgqctSv6QEyQqEMZ/0eT2XtsEA+/F8Kig9PwLpPaA+2QSq+?=
 =?us-ascii?Q?x7DTZNMgGXtRUIbUNHA/uAWIk0QiXGppyxmMBPXubBJ4na6+MxX06roA2na3?=
 =?us-ascii?Q?LUMnDIA28I5GuRAf55Ofc5Q0fRK60A3r94dSCtpaeTHR9omEW9s6UjMU3tWs?=
 =?us-ascii?Q?aOGcn1sNd71E2J7UdPkcm/zFTPsE0aAxHt++eJvFTTTH/3LOj9v8bw5oxPjv?=
 =?us-ascii?Q?iRSRB3WyXppbC99OxDvamP1NObyUE07iJUyzGFTOoTIRcKxvRuvTaZbmBK++?=
 =?us-ascii?Q?xZjev3UPC1/tZOobvfWrvIrFhhViK1xL8k15m0/y1B9v0U13/vo7ZLd1N/PC?=
 =?us-ascii?Q?qBC81WGnsL4K3jzcuiRirZffiE1YZ4yyGOaUA3mWGeXEK/GRaWkOzaU3zmpK?=
 =?us-ascii?Q?WWPpNt2rmRI5GJLyHsVfLY3vc5jMqrzcr6sgc5CvyDf7bXrkd+vdu41x83tj?=
 =?us-ascii?Q?qENnZzGJKoQJkSfNfLnwlpOFmaOkmJDQHeLA34xNS+iQmAM2O96aFHXE3owR?=
 =?us-ascii?Q?HoJLq33lRhwa5xqCpxf2LCvM3orqjNFMF1NfGoftvTBs4rxApZLRdyqNPJAu?=
 =?us-ascii?Q?SAWlZfortYr/yZpZDDpiZDzTaiQrp8h8WZ2G+45Mq2yOKvlLnhwW4DonG0md?=
 =?us-ascii?Q?Q6HYgG+E6zavqZYM7vhRyPW28IX2mfpOSFtJjtkRBkNRZrBbMQUCI5aZXFbP?=
 =?us-ascii?Q?TCR+2ewpTeU6/FVw37He0dbRTe+v8A2XTivejDuuL7fjcBRtSObW0xquGYM8?=
 =?us-ascii?Q?DHvxFB1OZyUS7KE3hIt6ZLSEuzY8sarSgDad5/S8QBXqETk3bWvEoHI2CvHa?=
 =?us-ascii?Q?UR3Mv7iL3hHSgWoKSnjBiOtkLYlBc4eqEcNoiYzpyFFVNqZ2zXBw0CXaFVub?=
 =?us-ascii?Q?WAS0vO/WnLjNPs+9it8hMeEScmd/xe2KO9rGNVtWv1kz37LXEzSBibc9XZyR?=
 =?us-ascii?Q?/p8eYbjjX3BFqGVbzg1exTFH6Q4gfPGpKJwiv/tlRCjNHrTnCRAfcnKhMZqc?=
 =?us-ascii?Q?TSCdWw7vQQV5yTFuEhwqLKaWA1TpAkmswxJ+/6oRZtBwgcL3yLnW8WrtG2K8?=
 =?us-ascii?Q?j7clneDxL9uJlEQDUf7DrqBPeoKz2nb9y96MjIOS0Zkk64FxfwcS99/V7Iyh?=
 =?us-ascii?Q?IUv8hizBh91uR9mnNooAl3JdE34z6aaok3dH8kz5zYJJnJGKe1gd40svif76?=
 =?us-ascii?Q?T0emfBpYlOvP5DSDuJj+Iar6mPRpEnOS9qU0xY8L6z6cAn2FKbMYI4CHRBoy?=
 =?us-ascii?Q?//74N+AwQSsX3+9Pa7qJaPk3xPXGNYFMqaYSKvvqFHG4Gc4vo+6HMHiyPEup?=
 =?us-ascii?Q?d+RnpKYb+UV14tQ5RonfdMBpQqkPgzJHDFx8AMzK?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d98ba7c9-b65f-451c-95c0-08dd6f6c2bda
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2025 09:20:54.1188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: crw7LaGQnYaNFcaD/kymBhehYI4N8vYohsWmU+WuFbCjBv6QbLRbir6gdgeahQM6+6ZNsd9d06Owp20CgKVNVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7420
X-Authority-Analysis: v=2.4 cv=C+npyRP+ c=1 sm=1 tr=0 ts=67e90cf7 cx=c_pps a=r2a4NctkKoQReJT0uaIV7w==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=H5OGdu5hBBwA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=TBqNoLu6pQ733rAlwCcA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: REfbtn9rXg3aj6ywUhWFxMC4VEWaq72G
X-Proofpoint-GUID: REfbtn9rXg3aj6ywUhWFxMC4VEWaq72G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_04,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 phishscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503300064
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Mar 2025 09:21:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116378

ChangeLog:
https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-3.6.3

Remove mbedtls-framework repository, as the framework is now added
as a flat directory rather than a submodule[1][2].

[1] https://github.com/Mbed-TLS/mbedtls/commit/b41194ce7f2fda63bf5959588631eba73c5c621e
[2] https://github.com/Mbed-TLS/mbedtls/commit/2c824b4fe5dab7e1526560be203bf705857e372a

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../mbedtls/{mbedtls_3.6.2.bb => mbedtls_3.6.3.bb}         | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)
 rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_3.6.2.bb => mbedtls_3.6.3.bb} (91%)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.2.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.3.bb
similarity index 91%
rename from meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.2.bb
rename to meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.3.bb
index 168ee1b5de..b700c27a65 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.2.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.3.bb
@@ -24,12 +24,9 @@ SECTION = "libs"
 
 S = "${WORKDIR}/git"
 SRC_URI = "git://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=mbedtls-3.6 \
-	git://github.com/Mbed-TLS/mbedtls-framework.git;protocol=https;branch=main;destsuffix=git/framework;name=framework \
-	file://run-ptest"
+           file://run-ptest"
 
-SRCREV = "107ea89daaefb9867ea9121002fbbdf926780e98"
-SRCREV_framework = "94599c0e3b5036e086446a51a3f79640f70f22f6"
-SRCREV_FORMAT .= "_framework"
+SRCREV = "22098d41c6620ce07cf8a0134d37302355e1e5ef"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
-- 
2.34.1


