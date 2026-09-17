Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E32CC982C1
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 07:59:50 +0000 (UTC)
Received: from PNYPR01CU001.outbound.protection.outlook.com (PNYPR01CU001.outbound.protection.outlook.com [52.101.225.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33900.1789628509234180857
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Sep 2026 00:01:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=Plsj7yfX;
 spf=pass (domain: bmwtechworks.in, ip: 52.101.225.67, mailfrom: upstream_ip-sk@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=shRO/DxH8Y82s/35L2eOVYRsSn4Ub2q0FE+KMi8TvA9CXZcRS6biWjYKB3QryblA9Ss3ZJ8ktslV7rM0xbSzxmvGKs0BpUZySBrGLtPVirgmdmKxXHM1F5VVuKgy8/G4aAhL5xus0wMKF5EdfKoRi34Qxpaq4ldCGZVC5MRGrlUyU5wYDUjorOpI9ZshTLNaU9ieoxtkRxC4FeiPLJbGcrZFAGi4Yl8+CFwCQC0PrqysBp7o8krmrcQ+ee0yv2FaOy+WsEZ7zYFXyrQL5BDlypmdBCtTtzSTlqtlOHVGLyj+SX6TBnxufgj8/EFqUv+EJnKtBAcP/F1zoBjT9xZlHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1VtlL/OxcwTp5oabDs7DbVBMG++QIEamiNV91SDCn3I=;
 b=XSQl2TZM3lT4XRHGXLxSNgIS/N8Y+Vnu01ePYsva10VBw0vwWyK3PEoGnf+OE01Y0b66BIyKJ/wGNdAoNtPWDwEXuZeG7iBY4+NrLoCQHzApvLNH9I7w0jXPozTr3E1hws/7nVDa/YayuHEdCV6g5WuvXCI+P4f0OYIPAkjamvl4kM1cNd1yqZzfzjSIpLtES93KxnCtXI4epMgxRPhDiHPf4m7qPyxY45IsCoPLRoYrZ95t3VVw8EZp8JodP76wNjTnFZblGnnUhOFE8tVlwo4iTG1DTU4o2sKaAg9xUY9HThQTmxNzBehIanvHmhSUn2CsUTwM3Si1Ms3BIDAYHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1VtlL/OxcwTp5oabDs7DbVBMG++QIEamiNV91SDCn3I=;
 b=Plsj7yfXk3pyd8jdziv1UiStnH2tqOHlhAi09Z/kRyt+WgbhhRHlL2Nw+gQfitCUCO4rcZcN/02WGOlDlXjbWsevA62I8oY7RcjLErXei0Ncx2cUbxmJO/W4rax89zD5LjomhAdN51nkD4Cwl7u5xB5WE2cUPPkG5QnrP75de9MD94fF4DCt14PJs11hB7S1+EizZTute0TAlvdl4897t1PTCubQ1Z2911tazKs6odDsjbhp+I7fUX8nEktybKa0fDimJI0/msnrTO3YFgshRzSMnR0+yjON/FKxt/3N2jVIPidhDYba2bLasvSdJar4kQm4LSWDDVVuA+qW0/LXtQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from PN2PPFE40D44641.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::156)
 by PN5P287MB6336.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:33d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.12; Thu, 17 Sep
 2026 06:46:20 +0000
Received: from PN2PPFE40D44641.INDP287.PROD.OUTLOOK.COM
 ([fe80::a44:7591:bce5:fd12]) by PN2PPFE40D44641.INDP287.PROD.OUTLOOK.COM
 ([fe80::a44:7591:bce5:fd12%4]) with mapi id 15.21.0428.011; Thu, 17 Sep 2026
 06:46:20 +0000
From: Sana Kazi <UpStream_IP-SK@bmwtechworks.in>
To: openembedded-devel@lists.openembedded.org
CC: Sana Kazi <Kazi.S@bmwtechworks.in>
Subject: [meta-oe][wrynose][PATCH] avro-c++: Use fmt from oe-core instead of bundling fmt 10.2.1
Date: Thu, 17 Sep 2026 12:16:10 +0530
Message-ID: <20260917064610.1037465-1-UpStream_IP-SK@bmwtechworks.in>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: PN2PEPF000001AC.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c04::12) To PN2PPFE40D44641.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c04:1::156)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN2PPFE40D44641:EE_|PN5P287MB6336:EE_
X-MS-Office365-Filtering-Correlation-Id: b8c9d0a5-35bb-4fee-edff-08df148761e8
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|52116014|6133799003|55112099003|18002099003|3023799007|11063799006|10067099003|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info: 
	x1B3hs0VDqNfNT4tDu0gMdqV6Dq1qJEzhpdcVrBRThFCPSQ7a+WQQuIrqu96XS3gxc8FJ76BS9chpVULMaPcSB34gUHQjJ6RV+8zSp+ITQMhw2amIrZpgZBOPL5vMidcb97CHyWXUnv6OVErlXETd1VWFeVrb/wasEM0qD0/xoY2TZrrN5oDkADahCLZU9BXtkACNW+tGLUkkFRTIvj8O8GphJM2JqYiXIFlI6Z/cGg/uOxbzlvM2f4HAP6EQCNvHV0PxJZL5eR5e0Pj56mG9gQt9Pdsi+ennXwXaE+16NzywvqB/DBpXEzHjlpHtWKJ/dY3+wY/y8Ik3S1oXH5cYL/B27Vj9jYLafl7hzPn9egEY6rMQnJX3hlaGMtYIot0L48q9wDsj/cxoamISpesuhQrSKwae3dnkasw6W2/BqSHHXYNHCAp4qtn1JHSWYzwyuJa70jy5RlCCRQJcgU4T/dDgEm9CHcnUelFUi/6l5dmKgzhZm66mezsQvU/fbcFaOGBn8t37ilPwkA60o1o1SSW1FpHNYlMfiHiZktr/fN/JsAkc7yz+rrQ3q4aldazDrP9xZ6/10qGK847a/UVapHISO5wuaY9o3cq6rhsyRfDQ/iH722HGH4VPQLo3BIRGqsExcFetirLx3Z4dgES9qNWrzEZVtD57WdBxAe5Ysrp1wkBwBsv3V1SW0HWMqFAbflW18TePNRzdm9MGGcN4wcfuVuZm4lxrGleIAKyY9U=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN2PPFE40D44641.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(52116014)(6133799003)(55112099003)(18002099003)(3023799007)(11063799006)(10067099003)(56012099006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ED/ITigQSBog1aWyLktgKOJXlGHMX2EWtMafDeqkpDmbgnsPXvx5bwvh7Ung?=
 =?us-ascii?Q?sLJ4VC5mTmOWVepu9GoOuwjrABlDVDH2stf+il/iOwx/2Zmdg4s3jXQlIQ6H?=
 =?us-ascii?Q?rSm/Oz1PvzTywG0tdULk041cx2zbJZML7R1+elZEj7wE0rPAycgln+AwFqA9?=
 =?us-ascii?Q?TbH4u3rsx7k8G8bvzG+0R2gt+lI/AzaVbf+CnjZgA8lbAyiFssfmgnL2r1ov?=
 =?us-ascii?Q?c14NT8BwJF8IHis0UHa6TaNTV6WWKD5BCLFde1I0ZLBbec77K9Rko6AXrz9j?=
 =?us-ascii?Q?QjEh4Ci80Ofgpp74hcqRAYGorxvTFWaLQ87g5aIpmNvGIlvU0mEYabAshJgj?=
 =?us-ascii?Q?9ICaQbBSAUn0L9u4BNvzM3pfOXJx0EkIQkItqulHXqlSk1Zr002idL4fcA/D?=
 =?us-ascii?Q?JwD2we1uMMqGyt+H0VzSon1PR04GT/8HwNc+czhDfFGkvdPU8OzujGFM/UNO?=
 =?us-ascii?Q?P2mWzHSmzo19j8t9Ag7paUFxa7oHFpXLHdXs9U0YOg/s3OBBRs1kNBY1N94/?=
 =?us-ascii?Q?f/Cwe+cRTnLnl5TkuOV3RZU37CQABCGBa6H408jAU+XEpFJcXE1tP+H0Vil8?=
 =?us-ascii?Q?lXsX5pSYeXCiLyJGllazQpQ+xCH3aC8vmX88bMdyBA9jDBptQQmJ2XwAbIM7?=
 =?us-ascii?Q?0DCXk0xI/Ogb/6EI+YLLF7cQIT5+fTR5uuObvfyX8veJdJj0SvYiRLnbx8k/?=
 =?us-ascii?Q?ejd+vC6dCJOXW6aAmdfCgNdkc130tZMEY6W4qs6FtI9GHmbwdWPx/Sz/sD4P?=
 =?us-ascii?Q?gCEwm+iTFe/hCV6tQJm/8jVISIXsPis/dG9FmaflBoYKywuj5zcG5eAKUf7e?=
 =?us-ascii?Q?6HrA4MpQ+KMBnnOfYrC5hrP3v8p6eVIIlVyQlayNF05PKFWgF75mZZvCKXY0?=
 =?us-ascii?Q?VjeERdE5IcZ+GWvZJzAillzWA0pN9SSj/uRRIgrQZ904NTr0+NGfc/b/MzSn?=
 =?us-ascii?Q?dEYO+vpo45xoX56dGrawfzCvGxNqX3RgymuxCwg4pWYvY7Xujbe4E+4Y5Qy2?=
 =?us-ascii?Q?wRFM/W0kQsXZx7xoiDTpAiKiIycmf6gIasBZA9kR5HKHT5BKqbSo+wrf7bx1?=
 =?us-ascii?Q?qkPvVFxwlSzZQvirs/fwOCAsqIAX9FW22PPrNQg7U6UBFsdALr4D1K9YGwI7?=
 =?us-ascii?Q?VvXf7Qeqc2eGarpjNq6br138vuIx8VJ5Qr7wNgUsjEM7dC0l0vTDAGTkGiQV?=
 =?us-ascii?Q?QB1e47p4aicRWNZuCPLivZm6spDR/oUPKszLkx7G3Jiyu9F5SJdNzGNTwHGz?=
 =?us-ascii?Q?+FSNdIKY8PmdXloAjfUeRJIZ2w0GMji5Xg1wz2hgCB/ry+yArYeXAdZvrVhC?=
 =?us-ascii?Q?Lwh1f546mc/wECGMBxs9TqfhnTwYW/sbx2tSV12oibhERTLyOZ9OhT7kWEG+?=
 =?us-ascii?Q?eBn4A+/TrR9/U20QJPgyAw65XfezkeknbsgR64Xrsr2ptVjZOMLq9g4i7TOu?=
 =?us-ascii?Q?j2ZlesRt5TvXkekLeKUZ6LvAixQSgiKITjoR4ULbeCBhDO8sKXQfgkf0wlmA?=
 =?us-ascii?Q?O3jrXWVIwKKbfN9nfFEPDJXWS7RNvaVbbFJJKBoFn10KQX9PTPH8eIdPLOg6?=
 =?us-ascii?Q?LcU5lzbTTVyzyyobkRcS6YwPD3lQFTDXFuRPVGhCC2+264oax+t/zGir+/RW?=
 =?us-ascii?Q?KPyg7LyIH5qiipEKHVRirEcTztCqUNHq4pGT/C/z5ynzjivBoXPHN4SmKkhp?=
 =?us-ascii?Q?moAR5pFk3KE9TplDgAir2+je81HM2+GhbSUOOMAvegGagqGApK64kPPzD3Rx?=
 =?us-ascii?Q?/qfjQzMgDesRI5K15mx1ggezhQNcCYU=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: b8c9d0a5-35bb-4fee-edff-08df148761e8
X-MS-Exchange-CrossTenant-AuthSource: PN2PPFE40D44641.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 06:46:20.6625
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FU8x0eVlsCMIr5OLUBY6c7UQlOPR2tWSN/RbGKzuFYJSpM87hA+5jQbIZv/ncT4qNMYT47RM5StCWSvSlVAJbvZoNAnsv4fy4Ed2HR5cJJw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN5P287MB6336
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Sep 2026 07:59:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130095

From: Sana Kazi <Kazi.S@bmwtechworks.in>

avro-c++'s CMakeLists.txt calls find_package(fmt) and only falls
back to fetching fmt 10.2.1 via FetchContent if fmt isn't found.
The recipe never added fmt to DEPENDS, so find_package fallback
is always triggered. The recipe then had to stage it into
${B}/_deps/fmt-src.

oe-core already provides fmt_12.1.0), and avro-c++ only
uses a small, stable part of its API (fmt::format_string,
fmt::format, fmt::formatter<T>) that is unchanged between 10.x and
12.x.

Add fmt to DEPENDS so find_package(fmt) succeeds and avro-c++ links
oe-core's fmt instead, and drop the fmt SRC_URI, SRCREV_fmt and
do_configure:prepend().

Signed-off-by: Sana Kazi <Kazi.S@bmwtechworks.in>
---
 meta-oe/recipes-support/avro/avro-c++_1.12.1.bb | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/meta-oe/recipes-support/avro/avro-c++_1.12.1.bb b/meta-oe/reci=
pes-support/avro/avro-c++_1.12.1.bb
index 729763d133..f194b2f490 100644
--- a/meta-oe/recipes-support/avro/avro-c++_1.12.1.bb
+++ b/meta-oe/recipes-support/avro/avro-c++_1.12.1.bb
@@ -5,26 +5,18 @@ SECTION =3D "libs"
 LICENSE =3D "Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D34cb96edab958a981837bf6f44bf654=
d"
=20
-DEPENDS =3D "boost"
+DEPENDS =3D "boost fmt"
=20
 SRC_URI =3D "git://github.com/apache/avro.git;branch=3Dbranch-1.12;protoco=
l=3Dhttps;name=3Davro-c++;tag=3Drelease-${PV} \
-           git://github.com/fmtlib/fmt.git;branch=3D10.x;protocol=3Dhttps;=
name=3Dfmt;destsuffix=3D_deps/fmt-src \
            "
=20
-SRCREV_FORMAT =3D "avro-c++_fmt"
 SRCREV_avro-c++ =3D "9110c693767c1dde2665b2b57939333478b12036"
-# Tag 10.2.1
-SRCREV_fmt =3D "e69e5f977d458f2650bb346dadf2ad30c5320281"
=20
 S =3D "${UNPACKDIR}/${BP}/lang/c++"
=20
 inherit cmake pkgconfig
=20
 EXTRA_OECMAKE +=3D "-DAVRO_BUILD_TESTS=3DOFF"
-do_configure:prepend() {
-        install -d ${B}/_deps
-        cp -r ${UNPACKDIR}/_deps/fmt-src ${B}/_deps/
-}
=20
 # Workaround for 32-bit build failures due to -Werror:
 # 'useless-cast' in Symbol.cc and 'conversion' in FileStream.cc
--=20
2.43.0


