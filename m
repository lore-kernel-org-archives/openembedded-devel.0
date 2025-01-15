Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04ADDC02187
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 07:24:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.15861.1736925886102494084
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jan 2025 23:24:46 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3110a90dd8=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50F5fnon004599
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 23:24:45 -0800
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 443s1pkjj0-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 23:24:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lFYfktUVB2oT5kejuFAOmZuLLW7xz0hvnm8nDABLvleTjtrwplq3RJPAqgRvzJxzr0ehWKe+G4a9I0VYvluHvLOJStTum8MJGAxhW4/nSwvcRpcJ3YiqC8YmfHHvdxrqBliLPah0eLBMAwoOj35mCScb1AVHYCGlTBQdnN79bUe/G5aKrtpYOTqxlcHVwpUjy7dY030hJw0Yb23Yc9YaEkIS1gXXTFDy05C9fr+gw8icRvJTpbMlqGRYne+0c/Vb096u33ydVMTZ1fjKcjVJ7DSFcU9fGGJsxRoKanjnBrfk+pQNm3jwGkhSL+PcAxTX66iYUmBP9vCAacwxb0o28w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H6WWbRp9CFG2M7Lk6DEEIfjYvrwQ+k15OkqaJZCYfCc=;
 b=d28Xgz4DkWtUcBBQuu8qArUGynrl//E2qD/LDS2uEhR2pWrnOiKFz2EvyJ/Uf3g/balZjc1lEOaEVsVyJ6l44VuNSU707TDNmj0ITt9ejgGr7B+++OpfYpBUF9Qb1FybOGNIxGHLP2rvAnE5wW1h+pxQQlRrxtfBmQuV/4UUWsT3toO92R0zR0Qr3OFr8oBVWhDDr5NNjVDtTMFF75y1T893U9pAIsPNO6EqI11V5nyonfa1AFcfSR6JTQSqmsdkXjuS9uDaxBUIsekQC/U3RqJVR+jiwNLsskcL1ksvzE5b6v4OQ1KeOtGbtJknnVR3FWeDecedEMlc7ZVbDeUklw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Wed, 15 Jan
 2025 07:24:44 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f%7]) with mapi id 15.20.8356.010; Wed, 15 Jan 2025
 07:24:44 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 4/8] opensc: fix CVE-2024-45616
Date: Wed, 15 Jan 2025 15:24:24 +0800
Message-Id: <20250115072428.3667416-4-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250115072428.3667416-1-peng.zhang1.cn@windriver.com>
References: <20250115072428.3667416-1-peng.zhang1.cn@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0112.apcprd02.prod.outlook.com
 (2603:1096:4:92::28) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|SA3PR11MB8046:EE_
X-MS-Office365-Filtering-Correlation-Id: 658c65dd-5c27-41e9-02c8-08dd3535aea6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?JG28pJ4rzhRUjF5ZtJVJITueyW5JGyh6RQO89vYnbTsFa0O4GK6T3I61xj6p?=
 =?us-ascii?Q?GwwjANjSZCJbYJqRK0dN5KiCC5Cm1blbMiEKoXMvH9bK8M/A8lgfYOjXHuBJ?=
 =?us-ascii?Q?a+ZIcwYC8p7xnKvaJvTMnLKmqkSVydrvyrtL03sLOs78auURayViluu/Weu/?=
 =?us-ascii?Q?ckUWt/XWKt8tJwUrTZJunC3TOoxtjLjyLICiJ6HRUr+GAB5SUZF5qD98EDuh?=
 =?us-ascii?Q?AGfwuM46AQCC7AguYe3S+Gl1Al+ANT89b1HLPkyo+H1zvsiX0TQ1EjDw6qCQ?=
 =?us-ascii?Q?yXHNWK6FLH2A+yVYxclZkL4tNLqXmvrFoCtog/9nZpAkMX1qrNmEbPQiRUcR?=
 =?us-ascii?Q?3zqBQGF+JN+iw9GHMzrsdHjYEW+SeDhPCjPibm7Wydnh08ydXKkLBWmTUoBt?=
 =?us-ascii?Q?8vypho7W+KPg6lINFwX48pv6X/k5sKOJsTqmsWnGtKRCS6F82cCp+H1C9Xqh?=
 =?us-ascii?Q?oxGGRNJX2sBa8KmSjYohHH/rVQed3OvaA/VhOgfIEQ5nsMSP2Xc8hRe6FdWl?=
 =?us-ascii?Q?A2aIi4mOCfs6yJFMEvT1k3seTQThe7nnilBQ2hz28sl0WdG8MrxGY+NKBkpx?=
 =?us-ascii?Q?t724wAvjgFJqoNJN8j7O5MGWTJ/1AQpmtlNizJCbkXNmLCLkaa247QWTvAxI?=
 =?us-ascii?Q?4U4iwdW98Qy0gcupsF5LMGuneVNtiaZUNBVtbCdbK+95/qcfc8/nfdaD5+Fd?=
 =?us-ascii?Q?l5JWUy9N0R+hNN7NASOVqNWWvdxirXgEO7vqyGpu+BB7wbh2EeFV++CZWaLF?=
 =?us-ascii?Q?IfMd2oSJkKEAi1yNDVgBTIUC9sG6JF6i75etGkLC/YndfKkcUeOd0z0IdH4K?=
 =?us-ascii?Q?eSUtGsRM2CYi4RYL5Zvhd7O6qINTeXMCgchgpJtbZH6cs2qD4wOIXS1N2WS1?=
 =?us-ascii?Q?hLi/f/JM2A5KtEUFXJsCwCRm7iGUAtAdrtzAok6yQNDv4ifoLxCNjzsFt0eA?=
 =?us-ascii?Q?NkIsOkk1XwznP+M9Lj9rn0lyntR3zFiqHRk4Dp5JhDEk79h+fGv97ChZoqEY?=
 =?us-ascii?Q?c5fi/nAJpPyiX5A0s6b06rgBsW5DNjsPk0gQ47ntBEbffPHsyjDoj1Ql1FnB?=
 =?us-ascii?Q?VWeykVKUnKWIqq0X47/nbLz+Z+iAl0sJVWryE9NFROVtUFbX4WxmsBBwbO3C?=
 =?us-ascii?Q?UW7nI823Psf/XYUg+2dV/E3pwvIp5791+Gi0EGqBZroTBPvqeZv6SD1OGyd0?=
 =?us-ascii?Q?ae78Zr/L9lD2PhVAhJT+z0Ax87Hup/fFwGKxqqQ+LBBvZQl7x0ldVwNzomrE?=
 =?us-ascii?Q?ukbPjdxTotgllgBZI2t+zf5L2HcUFXt43i5FL3fHgZkwcN4PA/TLds4JI8fg?=
 =?us-ascii?Q?yRGRaHlrViljOm5HCzIK+xkVe2pwKCjRnV2IKpjv3JYMVQjZHdE6y02DN+ZO?=
 =?us-ascii?Q?ZPP33oyuxCi5ao0alOAA6kDar6W2Pw4C4hAOIrdnSR5AQ0vWYQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?oh8rAfwUBKuBeYfM2TE5EdM4fUF0HbkOoSdpKcVmoNNrXIh++TmZXAurLjUH?=
 =?us-ascii?Q?h2EglWhTJK5ppbD8YwZJuoZOC+MdFcZOdd/Iw7JCtgJaYRUpwUU4H8Vb6r2c?=
 =?us-ascii?Q?L1Alkbl7e600kSj+eNkEspJvLmVnZySBo7bX+YSnN4oQoNU36LtCvVg/Jm+z?=
 =?us-ascii?Q?RNcS8xi2tyUsI7L6HPdGhA83cxO9B8FIYErNkTWihLCjCAy6RdYy4KLxmnql?=
 =?us-ascii?Q?BNJGw7uqfVhsNHvJ2BKM2kI4t1zkePWI4RMUpDRYCAWhEh/XWjMtcL2lopDZ?=
 =?us-ascii?Q?tQ8Qaeha9x0OZpTmwq+0eZXWbW/rE92Y+oUc5T7ClNPs1qTqkWYyUdRJBj6J?=
 =?us-ascii?Q?CIWMkD7dx1vevXblnvw99adwnF8opTn6GpEY0bi0sQljhNsIu8NIAGPU5GVM?=
 =?us-ascii?Q?ZT7Zr3uALBF3miBVEhO6nJjfVHa37x3KdqSnbdJlmr6lhbgj/rMS2LkEZFNs?=
 =?us-ascii?Q?p/uAQAz6sSSqfsJFClXPnh2ZurPAOWwjHRNE7+lCpJ+EzvvAetnku7sttgj4?=
 =?us-ascii?Q?v7Zf1fk7IJcdXbHyb5xYPs/cdYtqkyMqFFxoq7qIoyFd6e60nLX+37VfZ/VM?=
 =?us-ascii?Q?lb7QOmPcCdvQ7bEb8SNKA3gHHGkMIpti3qoNuCs/u7Ii0XzWTkoaWP2sbuhk?=
 =?us-ascii?Q?FALokfFqQIHgHqGQRT53hwFUAmoPjHDXmDk4SEcV8mmZ/8F6jkLnrBjdpjSI?=
 =?us-ascii?Q?TWW4nZK+7/ed8CSfqMgRBRI7IIhJJJkWV8Glp0d+E89ax9PkQ5G51oQnL7r8?=
 =?us-ascii?Q?5WUhpN2OyC8GUqeQTyqPWZjGaD09VL9k7nBaSkEV/GnRFtqd0RNe9DHz0zp1?=
 =?us-ascii?Q?eXA3lU/v6DcI94yBiLEmdBDFebfYMXKMeAlM1ZL26THk/L9kZikiBaIM1hxc?=
 =?us-ascii?Q?Ny08tabmV77dVZ5UwarxRsAyqUQsW0mpJPQptcFuHOX0Eyu1S2gWBlnQ7qxE?=
 =?us-ascii?Q?JZsiLrhEMYPI1I4WOLB8j9qaP1y+Po94TDFUWidBQO4vdaHAoddSm7tvNn/T?=
 =?us-ascii?Q?xuSaTWVSBhNhokMESb3/nFboYVhkXYAH8n3nT9u6ug9FqMFa1Ef1xhJm0q61?=
 =?us-ascii?Q?O5JFZV0825MIC2s1D2L+bp+wqIclnVu97JwSWdzkFwAb2i1/A164ZyNL4++W?=
 =?us-ascii?Q?7dpiBlVzX7Bmfd3/qVIdcu7/0yGJnWyO0OZTJknFjzK1tgeaaxGhhFKgQ8Fp?=
 =?us-ascii?Q?ftfsz9GS3dH72qXwQmYs/tczgDal7G5+PE0zNMmeHk17pVs4M+TGEq5fJ5EH?=
 =?us-ascii?Q?hos4EH/xih63cZvJ2PmoZkg0U3QjrtmRnNN3u7n81xJcwS895YGpMOkN1cu2?=
 =?us-ascii?Q?dAIVQnkFJbD1l7YHL5DldYjMv/rs5ANqkG9GTS33MNTJIng4NsUiRQAR79I6?=
 =?us-ascii?Q?mxZeS8nrbpEiYRR8oXyAJVhxPnuR9UcLUopYKazgFhyS/68w2d4wjOTBQpTg?=
 =?us-ascii?Q?dGJchEq0/1n+lM/XZgesnFfFpdCE1MHy9bRCA7Xw1s0Ky/HeRnyuJ4BMRQJV?=
 =?us-ascii?Q?eDOiMqyB81B9cX4Btpicrm36Mgu/gbUnMWQnjZjWL9QSOVKnagVkPgfPLqjw?=
 =?us-ascii?Q?ATE8iVVa3rzb97BY5uJnBGlVBeXkK0xE8K213+rOPU/i/pbBihpyVdYEEs/g?=
 =?us-ascii?Q?3w=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 658c65dd-5c27-41e9-02c8-08dd3535aea6
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 07:24:43.9798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GT1NcmO9qPKdn9JTlCnypERjJi8f51J7wgDAS5irABHl9sZfrLhgH6CsfO24cajsCD+3VxH1Royj/C1OiHbAW4zs7HojjKYA1Cp7dF9usNI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8046
X-Authority-Analysis: v=2.4 cv=DdLtqutW c=1 sm=1 tr=0 ts=678762bd cx=c_pps a=2bhcDDF4uZIgm5IDeBgkqw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=PYnjg3YJAAAA:8
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=tjrgz2z0AAAA:8 a=qwl3IdLvgAeI-KJpDYgA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=5HwOr4AGAc3wyUkv9GHE:22
X-Proofpoint-GUID: kCSCkCVeG1skyaTzf3LebhrDrhWqQDuZ
X-Proofpoint-ORIG-GUID: kCSCkCVeG1skyaTzf3LebhrDrhWqQDuZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-15_02,2025-01-15_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015
 impostorscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2411120000 definitions=main-2501150054
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jan 2025 07:24:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114888

From: Zhang Peng <peng.zhang1.cn@windriver.com>

CVE-2024-45616:
A vulnerability was found in OpenSC, OpenSC tools, PKCS#11 module, minidriver, and CTK.
An attacker could use a crafted USB Device or Smart Card, which would present the system
with a specially crafted response to APDUs. The following problems were caused by
insufficient control of the response APDU buffer and its length when communicating
with the card.

Reference:
[https://nvd.nist.gov/vuln/detail/CVE-2024-45616]

Upstream patches:
[https://github.com/OpenSC/OpenSC/commit/1d3b410e06d33cfc4c70e8a25386e456cfbd7bd1]
[https://github.com/OpenSC/OpenSC/commit/265b28344d036a462f38002d957a0636fda57614]
[https://github.com/OpenSC/OpenSC/commit/e7177c7ca00200afea820d155dca67f38b232967]
[https://github.com/OpenSC/OpenSC/commit/ef7b10a18e6a4d4f03f0c47ea81aa8136f3eca60]
[https://github.com/OpenSC/OpenSC/commit/76115e34799906a64202df952a8a9915d30bc89d]
[https://github.com/OpenSC/OpenSC/commit/16ada9dc7cddf1cb99516aea67b6752c251c94a2]
[https://github.com/OpenSC/OpenSC/commit/3562969c90a71b0bcce979f0e6d627546073a7fc]
[https://github.com/OpenSC/OpenSC/commit/cccdfc46b10184d1eea62d07fe2b06240b7fafbc]
[https://github.com/OpenSC/OpenSC/commit/5fa758767e517779fc5398b6b4faedc4e36d3de5]
[https://github.com/OpenSC/OpenSC/commit/aa102cd9abe1b0eaf537d9dd926844a46060d8bc]

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 .../opensc/files/CVE-2024-45616-0001.patch    | 52 +++++++++++++
 .../opensc/files/CVE-2024-45616-0002.patch    | 48 ++++++++++++
 .../opensc/files/CVE-2024-45616-0003.patch    | 42 +++++++++++
 .../opensc/files/CVE-2024-45616-0004.patch    | 43 +++++++++++
 .../opensc/files/CVE-2024-45616-0005.patch    | 34 +++++++++
 .../opensc/files/CVE-2024-45616-0006.patch    | 50 +++++++++++++
 .../opensc/files/CVE-2024-45616-0007.patch    | 56 ++++++++++++++
 .../opensc/files/CVE-2024-45616-0008.patch    | 74 +++++++++++++++++++
 .../opensc/files/CVE-2024-45616-0009.patch    | 68 +++++++++++++++++
 .../opensc/files/CVE-2024-45616-0010.patch    | 33 +++++++++
 .../recipes-support/opensc/opensc_0.22.0.bb   | 10 +++
 11 files changed, 510 insertions(+)
 create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2024-45616-0001.patch
 create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2024-45616-0002.patch
 create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2024-45616-0003.patch
 create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2024-45616-0004.patch
 create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2024-45616-0005.patch
 create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2024-45616-0006.patch
 create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2024-45616-0007.patch
 create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2024-45616-0008.patch
 create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2024-45616-0009.patch
 create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2024-45616-0010.patch

diff --git a/meta-oe/recipes-support/opensc/files/CVE-2024-45616-0001.patch b/meta-oe/recipes-support/opensc/files/CVE-2024-45616-0001.patch
new file mode 100644
index 000000000..f4bebf039
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/files/CVE-2024-45616-0001.patch
@@ -0,0 +1,52 @@
+From 1d3b410e06d33cfc4c70e8a25386e456cfbd7bd1 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Veronika=20Hanul=C3=ADkov=C3=A1?= <vhanulik@redhat.com>
+Date: Thu, 11 Jul 2024 15:27:19 +0200
+Subject: [PATCH] cardos: Fix uninitialized values
+
+Thanks Matteo Marini for report
+https://github.com/OpenSC/OpenSC/security/advisories/GHSA-p3mx-7472-h3j8
+
+fuzz_card/2
+
+CVE: CVE-2024-45616
+Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/commit/1d3b410e06d33cfc4c70e8a25386e456cfbd7bd1]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ src/libopensc/card-cardos.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/libopensc/card-cardos.c b/src/libopensc/card-cardos.c
+index 2e2d524333..a0e2322478 100644
+--- a/src/libopensc/card-cardos.c
++++ b/src/libopensc/card-cardos.c
+@@ -94,14 +94,14 @@ static void fixup_transceive_length(const struct sc_card *card,
+ 
+ static int cardos_match_card(sc_card_t *card)
+ {
+-	unsigned char atr[SC_MAX_ATR_SIZE];
++	unsigned char atr[SC_MAX_ATR_SIZE] = { 0 };
+ 	int i;
+ 
+ 	i = _sc_match_atr(card, cardos_atrs, &card->type);
+ 	if (i < 0)
+ 		return 0;
+ 
+-	memcpy(atr, card->atr.value, sizeof(atr));
++	memcpy(atr, card->atr.value, card->atr.len);
+ 
+ 	/* Do not change card type for CIE! */
+ 	if (card->type == SC_CARD_TYPE_CARDOS_CIE_V1)
+@@ -114,8 +114,8 @@ static int cardos_match_card(sc_card_t *card)
+ 		return 1;
+ 	if (card->type == SC_CARD_TYPE_CARDOS_M4_2) {
+ 		int rv;
+-		sc_apdu_t apdu;
+-		u8 rbuf[SC_MAX_APDU_BUFFER_SIZE];
++		sc_apdu_t apdu = { 0 };
++		u8 rbuf[SC_MAX_APDU_BUFFER_SIZE] = { 0 };
+ 		/* first check some additional ATR bytes */
+ 		if ((atr[4] != 0xff && atr[4] != 0x02) ||
+ 		    (atr[6] != 0x10 && atr[6] != 0x0a) ||
+--
+2.34.1
diff --git a/meta-oe/recipes-support/opensc/files/CVE-2024-45616-0002.patch b/meta-oe/recipes-support/opensc/files/CVE-2024-45616-0002.patch
new file mode 100644
index 000000000..012a9ecdb
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/files/CVE-2024-45616-0002.patch
@@ -0,0 +1,48 @@
+From 265b28344d036a462f38002d957a0636fda57614 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Veronika=20Hanul=C3=ADkov=C3=A1?= <vhanulik@redhat.com>
+Date: Thu, 1 Aug 2024 10:32:40 +0200
+Subject: [PATCH] card-cardos: Check length of APDU response
+
+CVE: CVE-2024-45616
+Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/commit/265b28344d036a462f38002d957a0636fda57614]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ src/libopensc/card-cardos.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/libopensc/card-cardos.c b/src/libopensc/card-cardos.c
+index 124752d78b..595ec099e3 100644
+--- a/src/libopensc/card-cardos.c
++++ b/src/libopensc/card-cardos.c
+@@ -94,7 +94,7 @@ static void fixup_transceive_length(const struct sc_card *card,
+ 
+ static int cardos_match_card(sc_card_t *card)
+ {
+-	unsigned char atr[SC_MAX_ATR_SIZE] = { 0 };
++	unsigned char atr[SC_MAX_ATR_SIZE] = {0};
+ 	int i;
+ 
+ 	i = _sc_match_atr(card, cardos_atrs, &card->type);
+@@ -114,8 +114,8 @@ static int cardos_match_card(sc_card_t *card)
+ 		return 1;
+ 	if (card->type == SC_CARD_TYPE_CARDOS_M4_2) {
+ 		int rv;
+-		sc_apdu_t apdu = { 0 };
+-		u8 rbuf[SC_MAX_APDU_BUFFER_SIZE] = { 0 };
++		sc_apdu_t apdu = {0};
++		u8 rbuf[SC_MAX_APDU_BUFFER_SIZE] = {0};
+ 		/* first check some additional ATR bytes */
+ 		if ((atr[4] != 0xff && atr[4] != 0x02) ||
+ 		    (atr[6] != 0x10 && atr[6] != 0x0a) ||
+@@ -131,7 +131,7 @@ static int cardos_match_card(sc_card_t *card)
+ 		apdu.lc = 0;
+ 		rv = sc_transmit_apdu(card, &apdu);
+ 		LOG_TEST_RET(card->ctx, rv, "APDU transmit failed");
+-		if (apdu.sw1 != 0x90 || apdu.sw2 != 0x00)
++		if (apdu.sw1 != 0x90 || apdu.sw2 != 0x00 || apdu.resplen < 2)
+ 			return 0;
+ 		if (apdu.resp[0] != atr[10] ||
+ 		    apdu.resp[1] != atr[11])
+--
+2.34.1
diff --git a/meta-oe/recipes-support/opensc/files/CVE-2024-45616-0003.patch b/meta-oe/recipes-support/opensc/files/CVE-2024-45616-0003.patch
new file mode 100644
index 000000000..4c0d1ec30
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/files/CVE-2024-45616-0003.patch
@@ -0,0 +1,42 @@
+From e7177c7ca00200afea820d155dca67f38b232967 Mon Sep 17 00:00:00 2001
+From: Jakub Jelen <jjelen@redhat.com>
+Date: Mon, 20 May 2024 22:14:48 +0200
+Subject: [PATCH] cac: Correctly calculate certificate length based on the
+ resplen
+
+Thanks Matteo Marini for report
+
+https://github.com/OpenSC/OpenSC/security/advisories/GHSA-h5f7-rjr5-vx54
+
+Signed-off-by: Jakub Jelen <jjelen@redhat.com>
+
+CVE: CVE-2024-45616
+Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/commit/e7177c7ca00200afea820d155dca67f38b232967]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ src/libopensc/card-cac1.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/libopensc/card-cac1.c b/src/libopensc/card-cac1.c
+index 50c0928f5..bbdbc0a8d 100644
+--- a/src/libopensc/card-cac1.c
++++ b/src/libopensc/card-cac1.c
+@@ -95,12 +95,12 @@ static int cac_cac1_get_certificate(sc_card_t *card, u8 **out_buf, size_t *out_l
+ 		if (apdu.sw1 != 0x63 || apdu.sw2 < 1)  {
+ 			/* we've either finished reading, or hit an error, break */
+ 			r = sc_check_sw(card, apdu.sw1, apdu.sw2);
+-			left -= len;
++			left -= apdu.resplen;
+ 			break;
+ 		}
+ 		/* Adjust the lengths */
+-		left -= len;
+-		out_ptr += len;
++		left -= apdu.resplen;
++		out_ptr += apdu.resplen;
+ 		len = MIN(left, apdu.sw2);
+ 	}
+ 	if (r < 0) {
+--
+2.34.1
diff --git a/meta-oe/recipes-support/opensc/files/CVE-2024-45616-0004.patch b/meta-oe/recipes-support/opensc/files/CVE-2024-45616-0004.patch
new file mode 100644
index 000000000..603556388
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/files/CVE-2024-45616-0004.patch
@@ -0,0 +1,43 @@
+From ef7b10a18e6a4d4f03f0c47ea81aa8136f3eca60 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Veronika=20Hanul=C3=ADkov=C3=A1?= <vhanulik@redhat.com>
+Date: Thu, 18 Jul 2024 15:39:15 +0200
+Subject: [PATCH] card-oberthur: Check length of serial number
+
+Thanks Matteo Marini for report
+https://github.com/OpenSC/OpenSC/security/advisories/GHSA-p3mx-7472-h3j8
+
+fuzz_pkcs11/1, fuzz_pkcs15init/2
+
+CVE: CVE-2024-45616
+Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/commit/ef7b10a18e6a4d4f03f0c47ea81aa8136f3eca60]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ src/libopensc/card-oberthur.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/src/libopensc/card-oberthur.c b/src/libopensc/card-oberthur.c
+index 1fc40f7b3..bd45b6ff5 100644
+--- a/src/libopensc/card-oberthur.c
++++ b/src/libopensc/card-oberthur.c
+@@ -148,7 +148,7 @@ auth_select_aid(struct sc_card *card)
+ {
+ 	struct sc_apdu apdu;
+ 	unsigned char apdu_resp[SC_MAX_APDU_BUFFER_SIZE];
+-	struct auth_private_data *data =  (struct auth_private_data *) card->drv_data;
++	struct auth_private_data *data = (struct auth_private_data *)card->drv_data;
+ 	int rv, ii;
+ 	struct sc_path tmp_path;
+ 
+@@ -165,6 +165,9 @@ auth_select_aid(struct sc_card *card)
+ 
+ 	rv = sc_transmit_apdu(card, &apdu);
+ 	LOG_TEST_RET(card->ctx, rv, "APDU transmit failed");
++	if (apdu.resplen < 20) {
++		LOG_TEST_RET(card->ctx, SC_ERROR_UNKNOWN_DATA_RECEIVED, "Serial number has incorrect length");
++	}
+ 	card->serialnr.len = 4;
+ 	memcpy(card->serialnr.value, apdu.resp+15, 4);
+ 
+--
+2.34.1
diff --git a/meta-oe/recipes-support/opensc/files/CVE-2024-45616-0005.patch b/meta-oe/recipes-support/opensc/files/CVE-2024-45616-0005.patch
new file mode 100644
index 000000000..34e2a83d8
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/files/CVE-2024-45616-0005.patch
@@ -0,0 +1,34 @@
+From 76115e34799906a64202df952a8a9915d30bc89d Mon Sep 17 00:00:00 2001
+From: Jakub Jelen <jjelen@redhat.com>
+Date: Mon, 20 May 2024 21:19:15 +0200
+Subject: [PATCH] gids: Avoid using uninitialized memory
+
+Thanks Matteo Marini for report
+
+https://github.com/OpenSC/OpenSC/security/advisories/GHSA-h5f7-rjr5-vx54
+
+Signed-off-by: Jakub Jelen <jjelen@redhat.com>
+
+CVE: CVE-2024-45616
+Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/commit/76115e34799906a64202df952a8a9915d30bc89d]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ src/libopensc/card-gids.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/libopensc/card-gids.c b/src/libopensc/card-gids.c
+index f25e37de4..10960875d 100644
+--- a/src/libopensc/card-gids.c
++++ b/src/libopensc/card-gids.c
+@@ -251,7 +251,7 @@ static int gids_get_DO(sc_card_t* card, int fileIdentifier, int dataObjectIdenti
+ 	LOG_TEST_RET(card->ctx, r, "gids get data failed");
+ 	LOG_TEST_RET(card->ctx,  sc_check_sw(card, apdu.sw1, apdu.sw2), "invalid return");
+ 
+-	p = sc_asn1_find_tag(card->ctx, buffer, sizeof(buffer), dataObjectIdentifier, &datasize);
++	p = sc_asn1_find_tag(card->ctx, buffer, apdu.resplen, dataObjectIdentifier, &datasize);
+ 	if (!p) {
+ 		LOG_FUNC_RETURN(card->ctx, SC_ERROR_FILE_NOT_FOUND);
+ 	}
+--
+2.34.1
diff --git a/meta-oe/recipes-support/opensc/files/CVE-2024-45616-0006.patch b/meta-oe/recipes-support/opensc/files/CVE-2024-45616-0006.patch
new file mode 100644
index 000000000..58b65b291
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/files/CVE-2024-45616-0006.patch
@@ -0,0 +1,50 @@
+From 16ada9dc7cddf1cb99516aea67b6752c251c94a2 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Veronika=20Hanul=C3=ADkov=C3=A1?= <vhanulik@redhat.com>
+Date: Fri, 12 Jul 2024 15:04:19 +0200
+Subject: [PATCH] card-gids: Use actual length of reponse buffer
+
+Thanks Matteo Marini for report
+https://github.com/OpenSC/OpenSC/security/advisories/GHSA-p3mx-7472-h3j8
+
+fuzz_pkcs11/11
+
+CVE: CVE-2024-45616
+Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/commit/16ada9dc7cddf1cb99516aea67b6752c251c94a2]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ src/libopensc/card-gids.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/src/libopensc/card-gids.c b/src/libopensc/card-gids.c
+index f25e37de4..91e1e0569 100644
+--- a/src/libopensc/card-gids.c
++++ b/src/libopensc/card-gids.c
+@@ -231,6 +231,7 @@ static int gids_get_DO(sc_card_t* card, int fileIdentifier, int dataObjectIdenti
+ 	size_t datasize = 0;
+ 	const u8* p;
+ 	u8 buffer[MAX_GIDS_FILE_SIZE];
++	size_t buffer_len = sizeof(buffer);
+ 
+ 	SC_FUNC_CALLED(card->ctx, SC_LOG_DEBUG_VERBOSE);
+ 	sc_log(card->ctx, 
+@@ -244,14 +245,15 @@ static int gids_get_DO(sc_card_t* card, int fileIdentifier, int dataObjectIdenti
+ 	apdu.data = data;
+ 	apdu.datalen = 04;
+ 	apdu.resp = buffer;
+-	apdu.resplen = sizeof(buffer);
++	apdu.resplen = buffer_len;
+ 	apdu.le = 256;
+ 
+ 	r = sc_transmit_apdu(card, &apdu);
+ 	LOG_TEST_RET(card->ctx, r, "gids get data failed");
+ 	LOG_TEST_RET(card->ctx,  sc_check_sw(card, apdu.sw1, apdu.sw2), "invalid return");
++	buffer_len = apdu.resplen;
+ 
+-	p = sc_asn1_find_tag(card->ctx, buffer, apdu.resplen, dataObjectIdentifier, &datasize);
++	p = sc_asn1_find_tag(card->ctx, buffer, buffer_len, dataObjectIdentifier, &datasize);
+ 	if (!p) {
+ 		LOG_FUNC_RETURN(card->ctx, SC_ERROR_FILE_NOT_FOUND);
+ 	}
+--
+2.34.1
diff --git a/meta-oe/recipes-support/opensc/files/CVE-2024-45616-0007.patch b/meta-oe/recipes-support/opensc/files/CVE-2024-45616-0007.patch
new file mode 100644
index 000000000..d664e2133
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/files/CVE-2024-45616-0007.patch
@@ -0,0 +1,56 @@
+From 3562969c90a71b0bcce979f0e6d627546073a7fc Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Veronika=20Hanul=C3=ADkov=C3=A1?= <vhanulik@redhat.com>
+Date: Fri, 12 Jul 2024 14:16:24 +0200
+Subject: [PATCH] card-mcrd: Check length of response buffer in select
+
+Thanks Matteo Marini for report
+https://github.com/OpenSC/OpenSC/security/advisories/GHSA-p3mx-7472-h3j8
+
+fuzz_pkcs11/5,12 fuzz_pkcs15_crypt/9
+
+CVE: CVE-2024-45616
+Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/commit/3562969c90a71b0bcce979f0e6d627546073a7fc]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ src/libopensc/card-mcrd.c | 11 +++++++----
+ 1 file changed, 7 insertions(+), 4 deletions(-)
+
+diff --git a/src/libopensc/card-mcrd.c b/src/libopensc/card-mcrd.c
+index fb5d02f89..30812e8a6 100644
+--- a/src/libopensc/card-mcrd.c
++++ b/src/libopensc/card-mcrd.c
+@@ -634,11 +634,13 @@ do_select(sc_card_t * card, u8 kind,
+ 		}
+ 	}
+ 
+-	if (p2 == 0x04 && apdu.resp[0] == 0x62) {
++	if (p2 == 0x04 && apdu.resplen > 2 && apdu.resp[0] == 0x62) {
+ 		*file = sc_file_new();
+ 		if (!*file)
+ 			LOG_FUNC_RETURN(card->ctx, SC_ERROR_OUT_OF_MEMORY);
+ 		/* EstEID v3.0 cards are buggy and sometimes return a double 0x62 tag */
++		if (apdu.resp[1] > apdu.resplen - 2)
++			LOG_FUNC_RETURN(card->ctx, SC_ERROR_INVALID_DATA);
+ 		if (card->type == SC_CARD_TYPE_MCRD_ESTEID_V30 && apdu.resp[2] == 0x62)
+ 			process_fcp(card, *file, apdu.resp + 4, apdu.resp[3]);
+ 		else
+@@ -646,12 +648,13 @@ do_select(sc_card_t * card, u8 kind,
+ 		return SC_SUCCESS;
+ 	}
+ 
+-	if (p2 != 0x0C && apdu.resp[0] == 0x6F) {
++	if (p2 != 0x0C && apdu.resplen > 2 && apdu.resp[0] == 0x6F) {
+ 		*file = sc_file_new();
+ 		if (!*file)
+ 			LOG_FUNC_RETURN(card->ctx, SC_ERROR_OUT_OF_MEMORY);
+-		if (apdu.resp[1] <= apdu.resplen)
+-			process_fcp(card, *file, apdu.resp + 2, apdu.resp[1]);
++		if (apdu.resp[1] > apdu.resplen - 2)
++			LOG_FUNC_RETURN(card->ctx, SC_ERROR_INVALID_DATA);
++		process_fcp(card, *file, apdu.resp + 2, apdu.resp[1]);
+ 		return SC_SUCCESS;
+ 	}
+ 	return SC_SUCCESS;
+--
+2.34.1
diff --git a/meta-oe/recipes-support/opensc/files/CVE-2024-45616-0008.patch b/meta-oe/recipes-support/opensc/files/CVE-2024-45616-0008.patch
new file mode 100644
index 000000000..bdd56fb47
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/files/CVE-2024-45616-0008.patch
@@ -0,0 +1,74 @@
+From cccdfc46b10184d1eea62d07fe2b06240b7fafbc Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Veronika=20Hanul=C3=ADkov=C3=A1?= <vhanulik@redhat.com>
+Date: Fri, 12 Jul 2024 13:16:56 +0200
+Subject: [PATCH] card-dnie: Check APDU response length and ASN1 lengths
+
+Thanks Matteo Marini for report
+https://github.com/OpenSC/OpenSC/security/advisories/GHSA-p3mx-7472-h3j8
+
+fuzz_pkcs15_decode/10, fuzz_pkcs15_encode/12
+
+CVE: CVE-2024-45616
+Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/commit/cccdfc46b10184d1eea62d07fe2b06240b7fafbc]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ src/libopensc/asn1.c      | 4 +++-
+ src/libopensc/card-dnie.c | 8 ++++++--
+ 2 files changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/src/libopensc/asn1.c b/src/libopensc/asn1.c
+index 08ef56149c..548263a2da 100644
+--- a/src/libopensc/asn1.c
++++ b/src/libopensc/asn1.c
+@@ -68,7 +68,7 @@ int sc_asn1_read_tag(const u8 ** buf, size_t buflen, unsigned int *cla_out,
+ 
+ 	*buf = NULL;
+ 
+-	if (left == 0 || !p)
++	if (left == 0 || !p || buflen == 0)
+ 		return SC_ERROR_INVALID_ASN1_OBJECT;
+ 	if (*p == 0xff || *p == 0) {
+ 		/* end of data reached */
+@@ -83,6 +83,8 @@ int sc_asn1_read_tag(const u8 ** buf, size_t buflen, unsigned int *cla_out,
+ 	 */
+ 	cla = (*p & SC_ASN1_TAG_CLASS) | (*p & SC_ASN1_TAG_CONSTRUCTED);
+ 	tag = *p & SC_ASN1_TAG_PRIMITIVE;
++	if (left < 1)
++		return SC_ERROR_INVALID_ASN1_OBJECT;
+ 	p++;
+ 	left--;
+ 	if (tag == SC_ASN1_TAG_PRIMITIVE) {
+diff --git a/src/libopensc/card-dnie.c b/src/libopensc/card-dnie.c
+index 2c36ddf5c..25c15b2b7 100644
+--- a/src/libopensc/card-dnie.c
++++ b/src/libopensc/card-dnie.c
+@@ -1185,12 +1185,16 @@ static int dnie_compose_and_send_apdu(sc_card_t *card, const u8 *path, size_t pa
+ 
+ 	if (file_out) {
+ 		/* finally process FCI response */
++		size_t len = apdu.resp[1];
+ 		sc_file_free(*file_out);
+ 		*file_out = sc_file_new();
+ 		if (*file_out == NULL) {
+ 			LOG_FUNC_RETURN(ctx, SC_ERROR_OUT_OF_MEMORY);
+ 		}
+-		res = card->ops->process_fci(card, *file_out, apdu.resp + 2, apdu.resp[1]);
++		if (apdu.resplen - 2 < len || len < 1) {
++			LOG_FUNC_RETURN(ctx, SC_ERROR_UNKNOWN_DATA_RECEIVED);
++		}
++		res = card->ops->process_fci(card, *file_out, apdu.resp + 2, len);
+ 	}
+ 	LOG_FUNC_RETURN(ctx, res);
+ }
+@@ -1948,7 +1952,7 @@ static int dnie_process_fci(struct sc_card *card,
+ 	int *op = df_acl;
+ 	int n = 0;
+ 	sc_context_t *ctx = NULL;
+-	if ((card == NULL) || (card->ctx == NULL) || (file == NULL))
++	if ((card == NULL) || (card->ctx == NULL) || (file == NULL) || buflen == 0)
+ 		return SC_ERROR_INVALID_ARGUMENTS;
+ 	ctx = card->ctx;
+ 	LOG_FUNC_CALLED(ctx);
+--
+2.34.1
diff --git a/meta-oe/recipes-support/opensc/files/CVE-2024-45616-0009.patch b/meta-oe/recipes-support/opensc/files/CVE-2024-45616-0009.patch
new file mode 100644
index 000000000..f4c3e231e
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/files/CVE-2024-45616-0009.patch
@@ -0,0 +1,68 @@
+From 5fa758767e517779fc5398b6b4faedc4e36d3de5 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Veronika=20Hanul=C3=ADkov=C3=A1?= <vhanulik@redhat.com>
+Date: Fri, 12 Jul 2024 14:03:59 +0200
+Subject: [PATCH] muscle: Report invalid SW when reading object
+
+Thanks Matteo Marini for report
+https://github.com/OpenSC/OpenSC/security/advisories/GHSA-p3mx-7472-h3j8
+
+fuzz_pkcs11/20, fuzz_pkcs15init/10
+
+CVE: CVE-2024-45616
+Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/commit/5fa758767e517779fc5398b6b4faedc4e36d3de5]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ src/libopensc/muscle.c | 19 ++++++++++---------
+ 1 file changed, 10 insertions(+), 9 deletions(-)
+
+diff --git a/src/libopensc/muscle.c b/src/libopensc/muscle.c
+index a749657df..b30173ec6 100644
+--- a/src/libopensc/muscle.c
++++ b/src/libopensc/muscle.c
+@@ -92,33 +92,34 @@ int msc_partial_read_object(sc_card_t *card, msc_id objectId, int offset, u8 *da
+ 	apdu.resp = data; 
+ 	r = sc_transmit_apdu(card, &apdu);
+ 	LOG_TEST_RET(card->ctx, r, "APDU transmit failed");
+-	if(apdu.sw1 == 0x90 && apdu.sw2 == 0x00)
++	if (apdu.sw1 == 0x90 && apdu.sw2 == 0x00 && dataLength <= apdu.resplen)
+ 		return dataLength;
+-	if(apdu.sw1 == 0x9C) {
+-		if(apdu.sw2 == 0x07) {
++	if (apdu.sw1 == 0x9C) {
++		if (apdu.sw2 == 0x07) {
+ 			SC_FUNC_RETURN(card->ctx, SC_LOG_DEBUG_VERBOSE, SC_ERROR_FILE_NOT_FOUND);
+-		} else if(apdu.sw2 == 0x06) {
++		} else if (apdu.sw2 == 0x06) {
+ 			SC_FUNC_RETURN(card->ctx, SC_LOG_DEBUG_VERBOSE, SC_ERROR_NOT_ALLOWED);
+-		} else if(apdu.sw2 == 0x0F) {
++		} else if (apdu.sw2 == 0x0F) {
+ 			/* GUESSED */
+ 			SC_FUNC_RETURN(card->ctx, SC_LOG_DEBUG_VERBOSE, SC_ERROR_INVALID_ARGUMENTS);
+ 		}
+ 	}
+ 	sc_log(card->ctx, 
+ 		"got strange SWs: 0x%02X 0x%02X\n", apdu.sw1, apdu.sw2);
+-	return dataLength;
+-	
++	SC_FUNC_RETURN(card->ctx, SC_LOG_DEBUG_VERBOSE, SC_ERROR_UNKNOWN_DATA_RECEIVED);
+ }
+ 
+ int msc_read_object(sc_card_t *card, msc_id objectId, int offset, u8 *data, size_t dataLength)
+ {
+-	int r;
++	int r = 0;
+ 	size_t i;
+ 	size_t max_read_unit = MSC_MAX_READ;
+ 
+-	for(i = 0; i < dataLength; i += max_read_unit) {
++	for(i = 0; i < dataLength; i += r) {
+ 		r = msc_partial_read_object(card, objectId, offset + i, data + i, MIN(dataLength - i, max_read_unit));
+ 		LOG_TEST_RET(card->ctx, r, "Error in partial object read");
++		if (r == 0)
++			break;
+ 	}
+ 	return dataLength;
+ }
+--
+2.34.1
diff --git a/meta-oe/recipes-support/opensc/files/CVE-2024-45616-0010.patch b/meta-oe/recipes-support/opensc/files/CVE-2024-45616-0010.patch
new file mode 100644
index 000000000..4a7752b28
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/files/CVE-2024-45616-0010.patch
@@ -0,0 +1,33 @@
+From aa102cd9abe1b0eaf537d9dd926844a46060d8bc Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Veronika=20Hanul=C3=ADkov=C3=A1?= <vhanulik@redhat.com>
+Date: Tue, 23 Jul 2024 10:48:32 +0200
+Subject: [PATCH] card-entersafe: Check length of serial number
+
+Thanks Matteo Marini for report
+https://github.com/OpenSC/OpenSC/security/advisories/GHSA-p3mx-7472-h3j8
+
+fuzz_pkcs15_reader/5
+
+CVE: CVE-2024-45616
+Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/commit/aa102cd9abe1b0eaf537d9dd926844a46060d8bc]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ src/libopensc/card-entersafe.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/libopensc/card-entersafe.c b/src/libopensc/card-entersafe.c
+index 6372913d0..305323fd5 100644
+--- a/src/libopensc/card-entersafe.c
++++ b/src/libopensc/card-entersafe.c
+@@ -1468,6 +1468,8 @@ static int entersafe_get_serialnr(sc_card_t *card, sc_serial_number_t *serial)
+ 	r=entersafe_transmit_apdu(card, &apdu,0,0,0,0);
+ 	LOG_TEST_RET(card->ctx, r, "APDU transmit failed");
+ 	LOG_TEST_RET(card->ctx, sc_check_sw(card,apdu.sw1,apdu.sw2),"EnterSafe get SN failed");
++	if (apdu.resplen != 8)
++		LOG_TEST_RET(card->ctx, SC_ERROR_UNKNOWN_DATA_RECEIVED, "Invalid length of SN");
+ 
+ 	card->serialnr.len=serial->len=8;
+ 	memcpy(card->serialnr.value,rbuf,8);
+--
+2.34.1
diff --git a/meta-oe/recipes-support/opensc/opensc_0.22.0.bb b/meta-oe/recipes-support/opensc/opensc_0.22.0.bb
index 9446237a0..ec0149670 100644
--- a/meta-oe/recipes-support/opensc/opensc_0.22.0.bb
+++ b/meta-oe/recipes-support/opensc/opensc_0.22.0.bb
@@ -31,6 +31,16 @@ SRC_URI = "git://github.com/OpenSC/OpenSC;branch=master;protocol=https \
            file://CVE-2024-45615-0003.patch \
            file://CVE-2024-45615-0004.patch \
            file://CVE-2024-45615-0005.patch \
+           file://CVE-2024-45616-0001.patch \
+           file://CVE-2024-45616-0002.patch \
+           file://CVE-2024-45616-0003.patch \
+           file://CVE-2024-45616-0004.patch \
+           file://CVE-2024-45616-0005.patch \
+           file://CVE-2024-45616-0006.patch \
+           file://CVE-2024-45616-0007.patch \
+           file://CVE-2024-45616-0008.patch \
+           file://CVE-2024-45616-0009.patch \
+           file://CVE-2024-45616-0010.patch \
           "
 
 # CVE-2021-34193 is a duplicate CVE covering the 5 individual
-- 
2.34.1


