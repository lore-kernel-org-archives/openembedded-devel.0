Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F4A1E6FE49
	for <webhook@archiver.kernel.org>; Sun,  8 Sep 2024 15:34:36 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.100])
 by mx.groups.io with SMTP id smtpd.web11.32164.1725809673142184746
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Sep 2024 08:34:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=gEiNCjLt;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.104.100, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VnIg9Myu5Socbb4+GmDOxvfpPLJoweI75zJ2dbrdNAou21kUwPKtHQYV6HP4wPRt17zpYC+FLpOfoAINuwaFvdYOEBrcQe01UQam0S8yb3yzjYI9iphh92gODWiSpgDT0OPN6Q5bgPJ0m+3kmHDO8RS5C9SZQmQW6W77Di3ALUdKIEHFnNnNEhVNML1PK/AjhxpuHbHquFZZ9ySkxp03tY60p97mhgPV0RklyW221eZ7xI6CiLFGfdUUYrP/tCOYXh7R1L0nugDZUnmpU/6sLwJrzaYZulRMyoHrBO6RSKmGM4ctO+PtNXsVkaB84LmTlAPwczz0E3KjctnKT8TOOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Za5YQ6A1XqwjFwCGBsrdf1N2C99U+uFed7rUcfG1Xw=;
 b=HzAIwZx5ukczWZB3vDsvIE4mqCcF5dGmfQdmt5WtMj4FiV1/+IsqSsBwFV0582MRabqJ/7VApyULPtnYL6361ezBAeB/qoU+NWAhKYcDZwhNkMVM2ooaG8X4PVRSqWnl1DudcczOo6p+HIohITdt5WlbY+Ja+NHfYdOKqPWjDhw7pCCVJPaT19lvWve2htPqcaqEcAXzKElvoYTgQhapzqUNqLmZ2H4wctBxPaa8F7rRqRaSLj/82GdOqoek7w+VB0IOdbT4EkoF6CAvZFgaunO/wEsfuOwBYBlqaQcG1RG/Q8BYL9avZkY7nNeY45xvJjnqwZsdDXTiJAq+06VUNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Za5YQ6A1XqwjFwCGBsrdf1N2C99U+uFed7rUcfG1Xw=;
 b=gEiNCjLtZQOWvZAvkdKD1j0Ia83CYycclWqy//rl0vXWPIYpxg8fZE6iNnMNuBjefxQK1Z9PFyPKeA0kkpSZDivTQpyBkUuAxkOpg0Q5k3YRIVhcbRgKkswX7hQ+1fsyFRagXrWWnKElkFMwbdDLTMh9nmxGTqCVlHrgF6xxmrSNInupJ65txoJiGoiYrzTLpsssoyqB8TGtyS6EuPvoNEiym12WH5qTDE/eVqV2eQp9xT1bJ/pcvSzn4oi7PjfK9o5KkLWZB6UUNJOqlxQUQa7NkmyqP6SOFCmodlwWbd8yKH/3gNdBywmGXDs5PLslvdkqePi2+KdkWSahfQdIAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by DBAPR06MB7095.eurprd06.prod.outlook.com (2603:10a6:10:1a2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.22; Sun, 8 Sep
 2024 15:34:29 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%4]) with mapi id 15.20.7939.022; Sun, 8 Sep 2024
 15:34:29 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: akuster808@gmail.com,
	Niko Mauno <niko.mauno@vaisala.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][scarthgap][PATCHv4 01/19] python3-xlsxwriter: Fix LICENSE
Date: Sun,  8 Sep 2024 15:33:50 +0000
Message-ID: <20240908153408.4114753-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0011.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:b::7)
 To AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|DBAPR06MB7095:EE_
X-MS-Office365-Filtering-Correlation-Id: 3274b4e0-8c72-4b5e-4e1d-08dcd01bba9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?TU3963oQxGrDK8gg201RmMfzTFONTleOnu+75t4H8kB3v8iWJt+enMgqpW+C?=
 =?us-ascii?Q?hZnk0GrhBjVezeMUqXxi7sLiKa4iMT0QYxKH+pDlyrbmIlsEpOZQ4zj/x3jc?=
 =?us-ascii?Q?YOS6UvfSBxEWmQA0A9n6dvvq5wv/zIKU66slrrRSwaevMWQPqqYUGgdaUFc/?=
 =?us-ascii?Q?egfHPg8qW+Uk32CY0nWaxruItFkvNk817hMOG1wqThECT6dTb7Cvf9A4jXEH?=
 =?us-ascii?Q?r8+7d0rvCU7qlOe2CC1sGB4Wj3J6fZL/l+CfzIGtRXTPLnCaU9rMM9Iho5Ck?=
 =?us-ascii?Q?71zJ0R0sgg+HCBYPsYLv5oeJxlRAvc59UlRtr9gXMF/IOJdBJCJpXMLnxHv+?=
 =?us-ascii?Q?nc+s1VtoCZwLdGm7aftWfo3dbDAEUVuw/uCm15kzfNjVaIqs4JvHwBVUoS0a?=
 =?us-ascii?Q?R+UJ/KVsLyn9NLl8SynGw7WfGubVKxSVxoqa/7E/KvVHNIuouLrawvIBDh53?=
 =?us-ascii?Q?SjHBczlusRkoWdbXd6TaGunoY4z9afl6LHCB1SIo3pH9bGBOL81UQwr/u2EM?=
 =?us-ascii?Q?r79aetjLkyCmAotnGKBRiTQscnq8ZkW2Y8LZoQpTL2eHcqBpGdrGvlu7zH3f?=
 =?us-ascii?Q?UnIIv8ZXeAQ+jfvvYGJ9/d8Fn/WZ4h7ImwTg+nZ8qmUyjDbyh/JNM6gfvWQo?=
 =?us-ascii?Q?qQcTn8sc/UyMmhhqzjQ6c4rlZvElb8kBhno4ydwdAPXZXBJmiBzeGbHx7vMv?=
 =?us-ascii?Q?pfvrpkvFz30KKKEke7NVoiYTPKgeNyq5q1AcIuhcj7HUM4XYeyvg7v1N4Hba?=
 =?us-ascii?Q?/oOtTNABSOAP3wxiwgmeHZgryo3X8Bvvt9AEhRehLHcbCLFzor1/tEtAqKGE?=
 =?us-ascii?Q?uCq1XJ3OcIt2uLeKk7q9BXSJ6P1Ebk9JVCfITbvZkcqaiyF+xFEVjDtvLX1K?=
 =?us-ascii?Q?+6iIpLs8myESxRBN1qE3jnOYbfPrh1z6t6tABYPI4PebFIGvBi44NGDvmRyA?=
 =?us-ascii?Q?8zqDOZnewpQA5RZOBqtP1sXKyezM0glmvBHsnuxBbFkgKeSUD8ACvTty2hiW?=
 =?us-ascii?Q?2vaCZSVjZNf841CvHZKnp33EooKh+rEY3sCm5zBLHiiDgAvEGMVsA2PGmsGK?=
 =?us-ascii?Q?4TQSe3SQJOx5BSxW6sgXvR4Tg9TbFW/soJwRIm+nHjl+byL4EE2YqWDN7H/r?=
 =?us-ascii?Q?o8C71590BR5lyTVdiocP0/Ad5ezpvDHPPUUxAEjaVqxyyMK1GiuHxg4Jcd26?=
 =?us-ascii?Q?gP2lzk+mYOC7172QdN5qcHJ3njHpjy2jMdAurgBNZUjz1luHtdWW1B8I6hYQ?=
 =?us-ascii?Q?bhhFX0B8FXoy8/TTyeHP4LOH1p/1f3CTVPtjWXjOuCLgKlVStiFU59CuMaks?=
 =?us-ascii?Q?SSJWPMmLbgRhIBlWWGbdTLWcWhcvc421/JuA8Mc9iQesNg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?S1g1gjfg1QsXIXV/HugLiBbGvoZD2EAowcu3NBRj27PVpnBRLYRIg7aqjctA?=
 =?us-ascii?Q?py75FtwwVzVsr/maCN9nVWFYCqF7GaUvnMCNiZ0ceBS14PewI7dNhZXPT+ay?=
 =?us-ascii?Q?TvGg4hZJcnCsv7CFlYSBpx5a2UsRbvENquDclYzXPGvP/MJPGVIrqk6o9AeF?=
 =?us-ascii?Q?xsiFZs7nEiBrb9k81WwZlJZRsJRtxHXSt6OnBvYEjg05lox/wVs6FicMAcuv?=
 =?us-ascii?Q?xUfJW5sLE1t3o+hHMRXRvw2gad4guJgnrcFG61av2SEkn0/h1qdKJBfLGIVh?=
 =?us-ascii?Q?NLN49ITQCJxZu6q887pmjrky/XmPzMvu/kq0wCkyp2IKRXdnbrIQ6b77itY4?=
 =?us-ascii?Q?MCamIexeJDfnlCCz1wokVV+Iy3Tjlab+jsPP0JhDMUqXvVxN68/7UUgZvVIZ?=
 =?us-ascii?Q?lJT6YGxJy9dpiUwMmXphgk+MKNIRfQNfY1YIQHOVNEEdQZLDMj9FC6UpfloI?=
 =?us-ascii?Q?u++ZF+rbyqwYb30sgW2u3tVfpfVoquXNucR7MzBXRHKYvLnb8nkNydzn8DQU?=
 =?us-ascii?Q?WzryhVTLeiqqQCaXw1UYSPTFOGWy+ZMFIHA72ycWjXhOKAwPfQMJonois6vZ?=
 =?us-ascii?Q?/hyOM2kdFCdflwtQPNwvlE2V6ES7SafQo8ePjs+9kWYPYpymgo0K0dez1fgP?=
 =?us-ascii?Q?XaFWQ/nSMR2d+fLQfEdRud64M5n31OnRbwgUUC3bT2YaeoO8UJmRu+c5eTrj?=
 =?us-ascii?Q?hOydaK7G6HrWAZW2PbGoqpZQFsTYlkjdt9TfrGcV91gc0lItZ2vp7j+r+uoN?=
 =?us-ascii?Q?+bIr2PRNzuvommMKpsgsR8BeRjLi9rE5nhtvKV0yTvLgAH95Y87qtK3Xf5uo?=
 =?us-ascii?Q?m4xtxV2zo+M4j0Uscd2BxyLnii4Q/ANI0yriQEaxTWSIwKyuXUT4lV+Dcx8v?=
 =?us-ascii?Q?GVU4ls4r1ahnr1ll1EGpIulL1jMnqbf/a/1sAyafSuCFw5IL0Wo+3Ymy3POG?=
 =?us-ascii?Q?dyujQXeMdF+zsQQqYiN9hhrwi0cG2PZLr8XGsVVeJQ+Or1kciol86PUTIg6v?=
 =?us-ascii?Q?PMg6qyaG59g0GMC1OozPQB0yzr6hlWl813zkywZXiKo52xmmissTD/3KUVzA?=
 =?us-ascii?Q?Zyb+1HtN6uNZKr6L9ZxzHXnOrs35/w/KXL5X6ZXLbI33+HG4YhoEqyek/97C?=
 =?us-ascii?Q?Wqj5ZtrCiGLV5AtoUQYV60qydynt6hJCjLYEF432q65YfEGVR2k2V4ULdAJZ?=
 =?us-ascii?Q?+xFj9PfPbJhpEdMfZ5H0Y/q3tx0SVO20+d41oMNaMDlMiOZiaXhdUtpoGppm?=
 =?us-ascii?Q?EFy316eaaIMnNlFcov26deZttsErA8+H5Cma7rkc0LkVCjTsGwKnoq/AxTlR?=
 =?us-ascii?Q?VxGJAQbsa+H58Bsh+Mo0TmOc0aSw4PpLpqln5ewDgHSwk7PSaBjWHo3nSh8c?=
 =?us-ascii?Q?JT8r3H/76erZxg0wH9hYOerQ/SYBtaJUs87hN6e/OKyA+iE6YaFNHH5/xRFx?=
 =?us-ascii?Q?wz9Gk7OM5+uGTDeH6cMcXGfTch4opyBJTX2Rgjs65F7wv5xIgsO3xLSht7eB?=
 =?us-ascii?Q?djPZfDOYq7Js0oiV1uwsWc/S+nxTj2eGFC5AUAKuA2gBSdS8sWzOJ8jvj3Pi?=
 =?us-ascii?Q?K0K/mDP+eTsxMSLjmlmOnxnEElb8estSvUla/1hPiujbFcD6qskl0nojamZ8?=
 =?us-ascii?Q?QQ=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3274b4e0-8c72-4b5e-4e1d-08dcd01bba9b
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2024 15:34:29.4638
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9cavNiaxLXpzJfBEO35OTqDrnPQg82Y1j69sEwz1kcQ8lzi5mJG31WuqdaqglLtppHDURKv3R6gIU5AkeL24lQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR06MB7095
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Sep 2024 15:34:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112141

According to homepage https://xlsxwriter.readthedocs.io/license.html
and pypi page https://pypi.org/project/XlsxWriter/ as well as
https://github.com/jmcnamara/XlsxWriter/blob/RELEASE_3.1.9/LICENSE.txt
the module is licensed under BSD-2-Clause.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-xlsxwriter_3.1.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-xlsxwriter_3.1.9.b=
b b/meta-python/recipes-devtools/python/python3-xlsxwriter_3.1.9.bb
index ee7dab35c..4e23feebb 100644
--- a/meta-python/recipes-devtools/python/python3-xlsxwriter_3.1.9.bb
+++ b/meta-python/recipes-devtools/python/python3-xlsxwriter_3.1.9.bb
@@ -1,7 +1,7 @@
 SUMMARY =3D "Python 2 and 3 compatibility library"
 HOMEPAGE =3D "https://xlsxwriter.readthedocs.io"
 SECTION =3D "devel/python"
-LICENSE =3D "MIT"
+LICENSE =3D "BSD-2-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D12d9fac1f0049be71ab5aa4a78d=
a02b0"
=20
 inherit pypi setuptools3
--=20
2.39.2


