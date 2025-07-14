Return-Path: <guocai.he.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFC7DC83F17
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 07:26:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.73019.1752478014807076206
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Jul 2025 00:26:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=929001597a=guocai.he.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56E7QrcH972272;
	Mon, 14 Jul 2025 07:26:53 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02on2045.outbound.protection.outlook.com [40.107.96.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47ufb1srt2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Jul 2025 07:26:52 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eml28jXf3GnBVrvGpS0qXqSo3j7axD1WXIBYez/otgvbdozPjukciv4JWl5tDTAVQpaCuKeLcjZOmyB1oBQ0ytadE5Oj8TgMESJVgquqqyIv0HuC2gbn1f+xbK64ryMZIG6wNxJj0sKYPlQRcSVXYT+liQ5VbzoPyaKdFAf+fW3AgHhh++3kdMeLAkrf+eEEksDsxsWAnT3k4KD9vFdvshy77kZLDvZ5bCWnkAEgz0FAvoctvTZiPHP+++eb/03QGfknzrQkBbrBkmPgBm9ldVVVLytU3C43RcS2AXFkxpq/7+9lkXnn6einfHsSoRzOLHKtMK3PSAGgb2BvqlXtOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SNugjMieMrEfGh2oYRHz3RKNMHRgXRztQTZikk0ljsY=;
 b=vu3dTk2Ed7BPm3cST+Jre+wT+YMuLdV2ZGF6WYqXfzMSIH7ZNxp8QVd5ZZGoKBndQFpdRf7MBzT+xhRQq+7otnMAkto3lcdyQv4lIJ95n3idnS1nnwB9pU/s1PSi1IquYh4KkfYQlzC1Zi4efbw8tKbtHYo0JVI++piG37Jb7/X2kxL7m+Gy+AqnmX0xDRO0jpcd8RjQPm8v/pW62ipn4OT9vjx+G+Bl+yyUBsfwlDUPK9Jl+/WaTOMgfrXb/l6NVNxyHbL0V49CA2zPE7wKDvBPvPHa7lQmqFSM4iyMHDFjk1SUiKJYIR1FW0FUALzT//2Zf0YypJlKkfzRKhXE8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5586.namprd11.prod.outlook.com (2603:10b6:5:35d::21)
 by IA4PR11MB9058.namprd11.prod.outlook.com (2603:10b6:208:56e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Mon, 14 Jul
 2025 07:26:48 +0000
Received: from CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::813a:3211:c8fd:1f86]) by CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::813a:3211:c8fd:1f86%5]) with mapi id 15.20.8922.028; Mon, 14 Jul 2025
 07:26:47 +0000
From: guocai.he.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-openembedded][scarthgap][PATCH 1/1] thrift: correct the SRC_URI
Date: Mon, 14 Jul 2025 15:26:31 +0800
Message-Id: <20250714072631.1833088-1-guocai.he.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0221.apcprd06.prod.outlook.com
 (2603:1096:4:68::29) To CO6PR11MB5586.namprd11.prod.outlook.com
 (2603:10b6:5:35d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5586:EE_|IA4PR11MB9058:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b71c189-7bde-4de4-fa59-08ddc2a7ca9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?lWcG2AgEq6Y9YrLh6trBdunOveC+C99p03uLSjnY57B3qC0QeO3hk9TRNxS4?=
 =?us-ascii?Q?WFr8F+dEHHvyHGV5Imd12cD74IIg5Ww9tzm5RArywY4vSfuV3w2bojacyHBR?=
 =?us-ascii?Q?uzG2c9yULT5Q+P4QHWpK7skkLqPI+luP6sQmNMCTZNoShPAzG9NTe/EeyFNS?=
 =?us-ascii?Q?xPiKSxUOEtjcIxxCU1bq8xEjrHd6gcLEJTAR4e54MTBMQSLp4ZhfKeznZxFm?=
 =?us-ascii?Q?Umc8OxQokjrPOkgoWwWogFtvGa5yHhb7LMcRQHA9lCgTpbgbgaMIUbHJ/6LT?=
 =?us-ascii?Q?o1hl6YS2mOx8mey9nt1gDqWNVta1u7LTgnBczfEkAWSu4B8E/jZBJ8q/LCcW?=
 =?us-ascii?Q?EK9KipunPbjgamh2C1/sG76UcoJfhwPNd1bcGQSHFxzlxUt4M4Zj0qT5Y+h4?=
 =?us-ascii?Q?EdBTa4L8X3t+d9Fa1RS935juUxqNrykolCCeoesfNPy8rU1bp49wqP5M6lAV?=
 =?us-ascii?Q?XzGrh+zrNbx0pbpF7nWGvjWmkrrLP6r7PsKFn9XaUnTgwZg+qmL5kN4TufwL?=
 =?us-ascii?Q?uGQGMXPiJC21p3d6htFtCyUf3J5Vg9NcnvJz1sRoTIj2CY1rFosYrZfkKPRL?=
 =?us-ascii?Q?dQ/SN48L0xSe74/qzPa3B7evQC+Hz84cmr4wNvvWJdjcIeVumVZXD/NgeS0g?=
 =?us-ascii?Q?RnEzNHHbwIlxk7i3MQJG4OEkP5FeQ0JYEH1hLGHxtFqMpMbtk8PaYlG551b2?=
 =?us-ascii?Q?ee8iFwNYGDdvfevTVF7MJ7kf8s4KCFCnWCPYT3crvSUgsUkuxcW297rQmiFH?=
 =?us-ascii?Q?b+EkaFrfOxqFZM8LEgt8OYrzKMwg3qnP31np5koxo0uaOiFPpZG98GsnwuHp?=
 =?us-ascii?Q?26cwPN8luyj4O17HayAHDHmB6t85LZTV2kTJahQHhOMP46Ar0Vj094roYDP5?=
 =?us-ascii?Q?49DCnphT70mXWpYuY9oiUu5AqllCQSqQi4Ma6Wv7KJ9acBFJlATfPyDGfszm?=
 =?us-ascii?Q?StnPOgRzV3ma5mJocNX1kZ0JxbyV4PqOh74jvo4Qwl0py0jFYXi4sQ21MFyv?=
 =?us-ascii?Q?j9MajbSoiadzDyCThq3pyQrSmAvmoE8C88wDc7Qrmk2Kpeo37QNOWJgj1BLK?=
 =?us-ascii?Q?SeNZKkpdxcdG33lSI+yOcCotHZWvPEGlKXRY/U/2Vv6SG+pUymolMhxLqAcS?=
 =?us-ascii?Q?Iza7EadFtYdocafjZoDhONFS9QcKOnpYeUBDTuyEX7mc43ac8ZTWL4a3Ws7u?=
 =?us-ascii?Q?xRO+GcjS9LQDwzLty/LmUs+wMXvuiJD7k2jsL8xkyRyu9uWlrX9K04SLBT56?=
 =?us-ascii?Q?CyVVY0ygv28YBiPXxu0VFEjjp3/NgPYoB2P+sAIrVhsivPHmZIw1aKmJa7wz?=
 =?us-ascii?Q?T/rH2w5ius7TZwBcKTn38vTwP/EPomW0+qMaSk2cs7khYTheaxiErFDG2xU/?=
 =?us-ascii?Q?WyWWu2Oik5EbrXnJWzYKjehD0eJmai5vcWqVms2RVHNVKcMeXwOSD7FDGbmR?=
 =?us-ascii?Q?Zp7wUYkhbix2TNA2gPasm5kWeInJtcqP?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jVyL+fEuTJsoytnm5kE4A5J7m5N2KOH9J/w4pGZeY42PVtUqjkkw/SsD+Z1j?=
 =?us-ascii?Q?nXjOkEgTvXC+y37DFsPkZBviDr2MC4zNdk6QRpmEQmohC0BBrB4i/gK/P/Wt?=
 =?us-ascii?Q?HcXnYjpLE1qmN3W46B05hxIjcpcGvM+1NjfBK+HZcEaunP5tiP5yuhGqVr2h?=
 =?us-ascii?Q?mArQn327XFnjMtGEvIIKn9WOjHkCrF6ZyTd5mqfRdiDbCIenN2mxQCIgibe/?=
 =?us-ascii?Q?d+JUdlQ3sHYcW9rZdN0/eV2g2DgROS/AQ1osYDDQAguMqY6XlkDs8uumdvh+?=
 =?us-ascii?Q?F/PMPbbvfoscYTQXnFWRjwemlh25sxn7yzmR7FipknQEt47DLnQBmkWK8/Cb?=
 =?us-ascii?Q?Qndqi4lIjki0ppB3biT3E/R6DFNI/0a0ifSzrULRwG4HUs7rQVrpdfn9o9Kd?=
 =?us-ascii?Q?V8U1DOF+lF6emJZWE9Jf2JJgjIJA7SXJzIa3flkJsqhYTX1CgJYfW60DlGhh?=
 =?us-ascii?Q?8tF+N9d6mpx6DFfvQk1woJSWCSLWHOJhDBzf4cWZR9FygCVrZHLIcpfKrgKq?=
 =?us-ascii?Q?0WHH7iC8Tw15JAMzKl2nNzLpHQ2m7xU89kgC4a7NvOIeJ2P6ZTf/nrvEDxrt?=
 =?us-ascii?Q?DrNCObT+DanRFapmv9PZVVnstc43op/of6xzP5bo+jng+8F8tSo4vcUVLp6G?=
 =?us-ascii?Q?8q9XB2JqWPnHYtAYstNDAn0cZlHWZuzdMtwDPLZVaG7NNRv7X3o2rz4psF4l?=
 =?us-ascii?Q?HGOhvKHWlGRleA+Bp8GFxZk5CznFrn9bWc9Zs06Ct/bFxwEr1rxp7K0b3rMI?=
 =?us-ascii?Q?m8YXecyJGWfS0084y7Kj0aOriCQ7MTbIHPZwREr24S6CykStEZvR2xdCF+wS?=
 =?us-ascii?Q?S32+eP+uv1wclClm8N40ZfvsqgkJ9Enu5WZGfT8xSGVDBsIF2TZxU2qcLQvn?=
 =?us-ascii?Q?B2ZHMg8BkspW+esVnyrFm2cQan2fTdcRkqCNwkT5Vsnr2Wzf5/fX8qzbsYbS?=
 =?us-ascii?Q?iONuWfVbybnz16uLlM+W2hUb5XejfIi8wQkTKx4IonEPqWZQhdnU311ASEzg?=
 =?us-ascii?Q?euBavPnqdSkqWXMO60T/3KeEajT3rQ+wKVR4AERsShAAryTDfGXydOO9omHZ?=
 =?us-ascii?Q?jbVLMBH3GDTDLjJG1sDzWL4ODU6SZGvqjt2R5cA3TYy4s6udtwMWfnD6zgzQ?=
 =?us-ascii?Q?ekT84uplLO3L18DQqHCdk5Fg8AZmqH256avFKRSB3xrI5YCesW4pmt4QKRDW?=
 =?us-ascii?Q?EH6ODefEKRv/3Jpy681J3ZUjscS2rRR7Nw3HwQNTAN2Y8SKrMg6UTaHqAbwZ?=
 =?us-ascii?Q?MkLCpXMw5MvC0cVrnUB/4t1errJuuhDikMG9TKnL99uf3TxfkjfhYEZ9wmDg?=
 =?us-ascii?Q?Xh7SwET17HryXNNU0rpgtS3JB3bO92sd/N/1TyPQ3X9mjZh54rgC0p5y3msx?=
 =?us-ascii?Q?qJtuFhZc3k/G1+GsWi8xrvMJNlpLd9QBrZpJZ9r+6swJedh05S6NJN8JXjdO?=
 =?us-ascii?Q?BtQYkZR/iFilfeUaO43A76uckH6Rp67SI4c+Bo0cGVmrvksD9tzzgDQ4rBdx?=
 =?us-ascii?Q?LoZ9FPYyQPXQoEE7gmNTHIwAM9dxJQ3DdprCQdVwbuO7QJZ5bNDFwKSOvlPE?=
 =?us-ascii?Q?kWq1y7/bXs+GtxTTetGjl9QUnZ90ppxO6O4FCz7esIOPaSeH6OIZvPEfbqES?=
 =?us-ascii?Q?Zw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b71c189-7bde-4de4-fa59-08ddc2a7ca9e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 07:26:47.4316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HHUv8ggUoyPWarMJENfRxQVf/rdiVEnmpNAKbJ2/DaLvpDIPbECu+cy9WeyytygtHb+i6V6DrVngROAmSTrvr3cOA6w9pECHJuBg+U36bHI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9058
X-Proofpoint-GUID: 9E2gpoXAa_B_tFqhWwxJljnPYW5rpbQI
X-Proofpoint-ORIG-GUID: 9E2gpoXAa_B_tFqhWwxJljnPYW5rpbQI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEyMDAyMSBTYWx0ZWRfX7CNTa6stq+FG
 izijn8CPHaf8B3tK16rLL9CkVIFIoo9Z1Qc4W3ono1nzrRYsH8ajT3IqqSPfNDCQhnzN/DfZBxa
 w/Di1UTqsSpWmQPCaSKqUmKPEHklFnSH96oPq0x7HlImE3zcYms1e5Bp7feMFOceVS7/7CxeXae
 RQMj7nuSGlnINyyb30bd+k3+Qq+NX7zCzEKkKUrXuLCurdRA+I1zOm/Q5jPWn+C7PVT44u6muOK
 o9CBxs5W56nQ+fjP5Ym6331dSVVs0d80TW5iR8ix8PTnyjxAczyfrnbtV1gaIY11jmd1O86+p/c
 hWFi0MnxxvvnPoWbnt3NaZWycxDXyJHS3MdzQaZtJr1fsjBgwR8pB7oEovu01dMk8AaqVJ3sKqC
 qXAMm+XU
X-Authority-Analysis: v=2.4 cv=bOMWIO+Z c=1 sm=1 tr=0 ts=6874b13c cx=c_pps
 a=cBPPFWgCIfQ995+N+vmBRg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=2gxSeYEUM00A:10
 a=Wb1JkmetP80A:10 a=mV9VRH-2AAAA:8 a=t7CeM3EgAAAA:8 a=WfeKMaGTvXcfO1SLQ6AA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506270000 definitions=main-2507120021
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Jul 2025 07:26:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118516

From: Guocai He <guocai.he.cn@windriver.com>

The tarball of version 0.20.0 can not be found on old SRC_URI.

Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
---
 meta-oe/recipes-connectivity/thrift/thrift_0.20.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/thrift/thrift_0.20.0.bb b/meta-oe/recipes-connectivity/thrift/thrift_0.20.0.bb
index c908eab7b3..14b98e6717 100644
--- a/meta-oe/recipes-connectivity/thrift/thrift_0.20.0.bb
+++ b/meta-oe/recipes-connectivity/thrift/thrift_0.20.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c40a383cb3f747e0c7abbf1482f194f0 \
 
 DEPENDS = "thrift-native boost flex-native bison-native openssl zlib"
 
-SRC_URI = "https://downloads.apache.org/${BPN}/${PV}/${BP}.tar.gz \
+SRC_URI = "https://archive.apache.org/dist/${BPN}/${PV}/${BP}.tar.gz \
            file://0001-DefineInstallationPaths.cmake-Define-libdir-in-terms.patch \
            file://0001-thrift-pr2755.patch \
 "
-- 
2.34.1


