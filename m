Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C3A1E7718F
	for <webhook@archiver.kernel.org>; Wed,  1 Jan 2025 23:35:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.24876.1735774530268775164
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Jan 2025 15:35:30 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=30963dfe0d=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 501NVCHS020192
	for <openembedded-devel@lists.openembedded.org>; Wed, 1 Jan 2025 23:35:29 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43t8a83kvc-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 01 Jan 2025 23:35:29 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fa6ArYK+5ydXcikKjpmfUPc2A4hCxAfD9EGHO1xc7NUxT0iXK1WXc8CVqSV13yuEsYg0UQjqVFqb/B1/J2KKcM1gW6tpX/exi/Cqx9qATrtLOgoT67ek9eHtZDnq2ZocuFiZg+vGE4Eje4j+5WJvVQEjESFRiBPDKKnO4AWgiGEdrV14ToI6xh0qTQOofZZqVDE6EIL3nBm+pFH1JbyDf6wjhayiRpurYNmEptdWNDACYmPQXeTtmCQEANTS8+cHAXZOsoB5SuNUKHAM2khxChdr57ra623u0V1G+e1KF6867oaBT3tAfgCVVDPV27tfGoBC1v0B6p3GRj3QKfCa2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jh2Pa3sqQbz5aqf5HQoG4Oyacpj1T+j/NBuWCKqHemA=;
 b=f3N6M4WUHqPCFZrzH3z+wvqttLAPydBHLsZSvvoDvig0A+vtr0kvTuAhyJMU7igwnnf66mfEpc7N1jT5iYdmc2Mc0TpAyC9LJkaO1ZIeKxyET21Yh0ksGhNusRmwQY2kRYW6uOTIJpNQtvgsVrJyOwKHuBDbSHv4vr1yO0CoED3C8olK88kMnykTBf7lPXY7ep0NySKwchBQUPQPeMu86TBNlnsMvlYSSoBo1pJZCWBIkJRJKLAf4B2pH26Hz0dI+2wXr57C9y4I+ZJmJVM1sPg3elhpexCe2V49eP4BDUgfp3LcJpbuFNEYv7B/OASw3gBPYgLgkgPlVK8jH12LTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 CY8PR11MB7899.namprd11.prod.outlook.com (2603:10b6:930:7e::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8314.13; Wed, 1 Jan 2025 23:35:22 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%7]) with mapi id 15.20.8314.011; Wed, 1 Jan 2025
 23:35:22 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] libbpf: upgrade 1.4.6 -> 1.4.7
Date: Thu,  2 Jan 2025 07:35:06 +0800
Message-Id: <20250101233506.2222120-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250101233506.2222120-1-yi.zhao@windriver.com>
References: <20250101233506.2222120-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0099.jpnprd01.prod.outlook.com
 (2603:1096:405:4::15) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|CY8PR11MB7899:EE_
X-MS-Office365-Filtering-Correlation-Id: 94968067-715b-422f-9182-08dd2abcf5b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?QYKapkpPWcZDPWV0EREjmCeOvcnyqmDISOTVrt7fD2XJg+9KFhD3oFw+NNTb?=
 =?us-ascii?Q?WM8b9HSoLxJJaTwwk59yAKW5ON001wcKNApCQuKHQNe52/rVYjHL2pGPLvYK?=
 =?us-ascii?Q?pKFXwIy3DfuCd7e0c3l4V/Qwj89q9LQEzbWuTJogv4pqxFGHxElA+g5HeQ9W?=
 =?us-ascii?Q?ShFmTbFc8tDdEYEXNrz1qekR88koCTlxm5R041REdOQ6QNIOfcSXhikT/RGC?=
 =?us-ascii?Q?0eYet722cdgGqoUzIEvZkAbxK1yi2vXJGRBUXMeiTnWy1CHtXgs60peTNXxG?=
 =?us-ascii?Q?sF9oFx3irIeRC+qob2sp4zo5vvAoWVa24LaZD29keEm1Sp6tSMs24k1EdfNG?=
 =?us-ascii?Q?bWWWybNx5Kqoo27j+eU0uSasWEu9JflMDwgmb/lhQia+dROAVqixmFERjcv2?=
 =?us-ascii?Q?iwG0TgCBnsaXQ1qUKJCI/dbtIlttYtp7h8Obk60lPx1iiGQQZ0daBbTlk2xy?=
 =?us-ascii?Q?0d8aDWY9yn8c2nz2B4SXQ8lzxTqdTeoCLqMTka+CiLm2Cz1642FWhfGGee0C?=
 =?us-ascii?Q?rmVeoh7bFMn4Q0dshZN4MplsLIL4Zh7CQDHGoy2ISJhH9Hoss5tQw3JPjDO0?=
 =?us-ascii?Q?TdHT3RSLj5g1hMei7TixDJzwuEqYLJx4sxnWaaEr/GaNpPszKyGrQSx2w5VR?=
 =?us-ascii?Q?v2cImnwVg/wzv56fX+uyqy7L49/SxIjvzkp+Y8IScORNgSu92GLFQBfex3QG?=
 =?us-ascii?Q?3mh1lSZ3U3JPuMNaehmfQZmpk1TceDJHqjXBcl077fDqd8F2g9fFgIoojmz8?=
 =?us-ascii?Q?/QkWoE1QIqXPFlgSVkLPia3fPEf/WUNCPQIdfHtd/GmCYtL7oIuXJIcfIlJB?=
 =?us-ascii?Q?2m4nM7RnMyELhbpVKQtwwNjxHgFTmMf2hLOZ0wueSlMvWtkcuwJ16nHHof46?=
 =?us-ascii?Q?v3BE+YeXqQMmqLo2rVu/pZQK30jqEOINpppN6oyKyXioZv2KgUL8FMX19XGX?=
 =?us-ascii?Q?tjF32uDMC/vnIWg4kFQyT3n9XeS+epFGEVOa/JSawvBAxonQ7+OqY1JCDbSL?=
 =?us-ascii?Q?PlEWogJ1ALQ6UfGhDB0Ya9Y3AOquIucaemBFqJLpdk6oVMpAOeaxChFzdjGd?=
 =?us-ascii?Q?iI/0Vsg11rOdySoI18CciXeGYhy4MFpgxf74vN6qzkG4vK2vMH801S3CL7AL?=
 =?us-ascii?Q?kzqw4917C/kR4sWbUz1XiTUCMScAsh07vOjybO/fTjZ33lCbN38fuviYlnaY?=
 =?us-ascii?Q?K02O+gDlnXriRfSlt+31wtkstYFJKpFZ8pdxROYLx4eTBRa8QUI0Z6AhxEMR?=
 =?us-ascii?Q?OTgWo+MNv0lDgRgS9PrGw04BYJpq5Rsczgt9vy5r0C1WlT9IOy31Ys2KolvO?=
 =?us-ascii?Q?Pvwl9FltUQZ2Idmq2hR/W9+GpWL8rWocX4BvK7oe2cio/cUYs1rYylUJl+JR?=
 =?us-ascii?Q?BhNaQuX+dd3cvlNO4TB26gSmXUW4RpZ0VGJXZ7TFLnUIyUiiJojqXPLoJu/m?=
 =?us-ascii?Q?/Jh0zIl54ttLB7vu6q0+fZisyZ9gjxv2?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5098PNKh+zSpNX5ME/lLhqo65t58sPVYFoSx9D/fhCyvzeCDkHi4LlZ5s4SZ?=
 =?us-ascii?Q?28dyTBVVwiQYEP4vdukc6avYi6MPgAX94wI+ybxrKMxFZ3CowseAI7QTNQBB?=
 =?us-ascii?Q?JPJXxLWqtzu5rI3MNE7DUaaqaZWcldDwblOnuzITOk5V8JEnlxLg6QIAYeWh?=
 =?us-ascii?Q?pVWn72h75VXE3jPTu/GQ3p5Z0Ru0gW4nxezRkk5Yjvtcnq34uQ95qEePRA4y?=
 =?us-ascii?Q?0z7iOjh4NmSFTrzWCt6gPZXkna+WAyuyVCgB/mz61cdb53pBtKbIyIRSTvyt?=
 =?us-ascii?Q?3MElomxT54QYaSP4Jwjd0tejHrw1KebBiqBX+LFkVzhiH4cQkhdWA7VD+3cb?=
 =?us-ascii?Q?ucME6eyJhcrPIxQn5tEVFnG/YIw7wuP1ArhVCmcqgRd9sK7YJZb4WlIUYIoA?=
 =?us-ascii?Q?wtYTbYLYtuneBbtBRnX9kNaNvrqiRrRK3LZ25HHRF1AFfc9v6Cex6gdEb558?=
 =?us-ascii?Q?p8HHCjoP3rV+O++rNpkUacJIl9PxOChTlftau0VRoRJK98RPylCIF8/of9bs?=
 =?us-ascii?Q?A7nh+rwijOUvAEqmuSdkyO/VqAoZn+jW9N/iSxV4c8P3d6fYhEOlGVaE45jR?=
 =?us-ascii?Q?VfM+ol+QVkSYwjdPBqVkMMKBfYBvQpieCSMVhDXpzUm+30gsl74PBdTVF7I4?=
 =?us-ascii?Q?p0JH2iSMDbwFZT7suoGUHHSaJFZjsrZNidodpd/lJ6Ho9EDHT2jrhmXRUi5L?=
 =?us-ascii?Q?TxLqWnCMpOzorQ5raKYTlhhoO8obrSf7UZua5ebcDgUQiYrwPQMvspgTnb1K?=
 =?us-ascii?Q?GGklI+hivYfb5GCoIwGMBepmC5IsHCa2cCAO26R9zChyHNA6WbO/QoODHdok?=
 =?us-ascii?Q?SYiuQEOf6ljRJYfS7ATDPXj9bUfaVsvLq7j5tdt3/wpPA9ai2IjteDFQj7SZ?=
 =?us-ascii?Q?9GJlh7gaFSWiuLNZeVG1oHXD9dLn0lN65yMoy9ZfI5LlM7u4be3Eg4oCkQqr?=
 =?us-ascii?Q?IDA2qcgLueqrk3y7wMBcJaurMwzcfk/nEDeQ9xLaCqgIey5iy+bZydI91OiP?=
 =?us-ascii?Q?43maCpBYoW68QFRz5apQB+bkV8YnynX6RmKYkqIFpU3x7AsPHeCzHMUyd1kH?=
 =?us-ascii?Q?mk1hsXoI8O6i1xCWRSVqALwhDT+9W3YxQTyF5ngfPig4GbdfaniWbWPfmGmy?=
 =?us-ascii?Q?vtb8ydLQ9GuMTJKcEaKne8OY3AFL5z4XuSh1aJE6dLhUlxcPgsmtMTyB2hxh?=
 =?us-ascii?Q?BnlFntJvAAO3jOExUs94Tph23yJNdKK0X3XAOS92yT5YJzm2WdUhS5sfXg0j?=
 =?us-ascii?Q?UtKiRvCfEwr9javR/U8ASLf9az/9GdH/pJa2TeSMoY3ViOF3gp+kujZls9Ql?=
 =?us-ascii?Q?Zgm9YUeydxjQAo2gTksEZlAVyCOIx/ua61EqhzLKmvjc1Q7NNPbWDkGiKhxo?=
 =?us-ascii?Q?sKy5ll9M8rfOM5Je19O1MpcNaTRUSYas4GUCMVSl334ykIvum74wSHgqOaIq?=
 =?us-ascii?Q?xkFXkILFJ2UJPkwvIpnkySiJ305EIoTWvi3Cmz3v+59hs1SMwMmClS0tWHPP?=
 =?us-ascii?Q?dfIieY9gQ/Ermq29BGcrYc7eq8ZMqYQ410TrfbjUJ0LsZqBFByH2Il+0xTXr?=
 =?us-ascii?Q?BGCJCkUKlmxPhdNkAvagvo0fY20B4B04gzTbKMkq?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94968067-715b-422f-9182-08dd2abcf5b8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jan 2025 23:35:22.3752
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cxZU0wt503m0pypW2LvC6UdgzuVH0TsgndNN3IRAmaLhWW3L7zVyGs27nMfvJAHUjUgIbPRCMCq2oFkatoOVJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7899
X-Proofpoint-GUID: yewWqF8Z5asUjPP4YVAVMYx_79oOY_pl
X-Proofpoint-ORIG-GUID: yewWqF8Z5asUjPP4YVAVMYx_79oOY_pl
X-Authority-Analysis: v=2.4 cv=f8qyBPyM c=1 sm=1 tr=0 ts=6775d141 cx=c_pps a=ZuQraZtzrhlqXEa35WAx3g==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=XKdr95i7JqerCAM43OYA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-01_10,2024-12-24_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 mlxlogscore=974 lowpriorityscore=0
 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501010210
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Jan 2025 23:35:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114613

ChangLog:
https://github.com/libbpf/libbpf/releases/tag/v1.4.7

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../libbpf/{libbpf_1.4.6.bb => libbpf_1.4.7.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-kernel/libbpf/{libbpf_1.4.6.bb => libbpf_1.4.7.bb} (92%)

diff --git a/meta-oe/recipes-kernel/libbpf/libbpf_1.4.6.bb b/meta-oe/recipes-kernel/libbpf/libbpf_1.4.7.bb
similarity index 92%
rename from meta-oe/recipes-kernel/libbpf/libbpf_1.4.6.bb
rename to meta-oe/recipes-kernel/libbpf/libbpf_1.4.7.bb
index 914ac9f087..8df1c639ed 100644
--- a/meta-oe/recipes-kernel/libbpf/libbpf_1.4.6.bb
+++ b/meta-oe/recipes-kernel/libbpf/libbpf_1.4.7.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://../LICENSE.LGPL-2.1;md5=b370887980db5dd40659b50909238
 
 DEPENDS = "zlib elfutils"
 
-SRC_URI = "git://github.com/libbpf/libbpf.git;protocol=https;branch=libbpf-1.4.6"
-SRCREV = "fdf402b384cc42ce29bb9e27011633be3cbafe1e"
+SRC_URI = "git://github.com/libbpf/libbpf.git;protocol=https;branch=libbpf-1.4.7"
+SRCREV = "ca72d0731f8c693bd98caba70d951fc0bfe20788"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 COMPATIBLE_HOST = "(x86_64|i.86|arm|aarch64|riscv64|powerpc|powerpc64|mips64).*-linux"
-- 
2.25.1


