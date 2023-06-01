Return-Path: <hadkeakash4@live.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62D71C77B7E
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 15:19:41 +0000 (UTC)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (APC01-PSA-obe.outbound.protection.outlook.com [40.92.52.95])
 by mx.groups.io with SMTP id smtpd.web10.35111.1685632774126082986
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Jun 2023 08:19:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@live.com header.s=selector1 header.b=A9338YOE;
 spf=pass (domain: live.com, ip: 40.92.52.95, mailfrom: hadkeakash4@live.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mot6QVWXcYeRptLkuBkkdKQEAi4zXgf/tC4D6U3XHDPH+86HFjFp8nIbgit9XrdzEySYckhlTLcYpzSG9qO/mwpNIqcW4d3YpgtXYdFgMJsQKlVdyjgugUxXiO7iGDEZoCKZiOv75xOYLXGsz3/Rp2M9RsTfOwvKvsVvMclx3qkbgh/5p/E+3+jDENfrFXcYCo09KsMX+Our6NTgrGJSo+6nCkUfIEUdPvYYJSIKv+lmy9Wbij6I25samTXaFNjyRM4ikOxkEjd6PHiW3K9KH70a7WRwxynXa8k6V5f+BzAAjX5WO8v8I3R+gfhOahvGkOhv8+2AmjHaNj0mEcu6bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R2paZxpDTgXlBNjo2QuSNE8tyxwvj1zcwaoCX/FPViA=;
 b=EfMjzJnausj7q5uhs6kRnpVF/sbbHQ64UZjGrTDrZUHlVqvKDu2BGOFRjOGuiJwkvIhQzTUwy6rpLGUH4MWTqeOZHAk2WfA3mpT1IWbl9YzRHzhDZzwI0kkJiRoIC41/kCufNgg01LPE8VozpaqMOOI4gTSR4DvKuMCllm6sTu5OnSOr7dsnw2hU84GnsVG2/byita6g8MPWkSEApM3lIvi/IcGUO0iyzxXO4Mh97HRM2Vkf8h4G3e7bjBl6DgVag5P/LzYMLJ30pzD3omuCU74WFXAImqpsh1CYi+vocGi8US/Jzq3i4J22+fIiJcub7BO6CjkBjquS1bDBXRgxYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R2paZxpDTgXlBNjo2QuSNE8tyxwvj1zcwaoCX/FPViA=;
 b=A9338YOEUaAhFwPXt6x6ilsELOkiFqjZ5lceFHvZ0neSJp9SU0UV8c4+wrfScGcUGmrQ0xL2kaVIgPiBnutNzXG0CckEFaUSakmGoGlWcZY62myaMGu0ahh1E4lHGGDCi8/6LHJZXVzFUpvv+OffS7GnV5muumfTnLsjDY3AusEUB4PxrwsXe2cd8Uj3m3e9kLGnfIdy+v/j0E1MK43FQ2oS7is/UZamMy3WHUozbjY0w5OczXiBxDIV0/1I6Jtm2ArURvG9BC5ja5vcf+SBhsFJ2p2oTq9b41UUtIqJQi031iRTnrPnEwOW2JNECfQEudoAUxxgzIjoZPlYutXcJw==
Received: from TYZPR06MB5026.apcprd06.prod.outlook.com (2603:1096:400:1ca::9)
 by PSAPR06MB4183.apcprd06.prod.outlook.com (2603:1096:301:3d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22; Thu, 1 Jun
 2023 15:19:31 +0000
Received: from TYZPR06MB5026.apcprd06.prod.outlook.com
 ([fe80::acfb:f22e:d0d:fce4]) by TYZPR06MB5026.apcprd06.prod.outlook.com
 ([fe80::acfb:f22e:d0d:fce4%6]) with mapi id 15.20.6433.024; Thu, 1 Jun 2023
 15:19:31 +0000
From: Akash Hadke <hadkeakash4@live.com>
To: openembedded-devel@lists.openembedded.org
Cc: Cameron Miller <cameron.miller@homeaware.com>,
	Akash Hadke <akash.hadke@kpit.com>
Subject: [meta-java][kirkstone][PATCH 2/3] Switch to use git SRCREV
Date: Thu,  1 Jun 2023 17:18:42 +0200
Message-ID: 
 <TYZPR06MB502635F16D1EC81A60ED88D784499@TYZPR06MB5026.apcprd06.prod.outlook.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230601151843.29599-1-hadkeakash4@live.com>
References: <20230601151843.29599-1-hadkeakash4@live.com>
Content-Type: text/plain
X-TMN: [YQK/PFhXWFlUIzxytHlfcPibU2PL0Udn]
X-ClientProxiedBy: FR3P281CA0023.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::7) To TYZPR06MB5026.apcprd06.prod.outlook.com
 (2603:1096:400:1ca::9)
X-Microsoft-Original-Message-ID: <20230601151843.29599-2-hadkeakash4@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB5026:EE_|PSAPR06MB4183:EE_
X-MS-Office365-Filtering-Correlation-Id: 6057732c-0c9c-40ac-6164-08db62b39934
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2bZ1MtgXuL1ip8XAaVXYWeEqTijXmomZ36T9EiFCoVmgZnbjOmV7pMjqTPbNEICG/QA0LdX/zRHMZS0mOaMhRPm2oVj83xypM7qZQ/t6WUHVqyo/SMAx2XeJ7kd68/zlVMm4M7/xeWRxjlaOGYRrHJjY0h/e50mRoVt3dM6yUzcQHS70tLZT+W0N+pDF4t+zAdn08yO3Ax4ODvyY3NKyFe+5sovNGPItV2Cl0HtxBhHwFkoICvIrnrsW5/pHknULqQFyWDxFnwIT55MZZ+RxJKb4VIg5239Q6K8LRj9J5DK7/xsmvCysqv6HGpnrvlNnoAja8PjeL1CQHB5k09BMQwjQfGmAegs5TyKUPq+Aalbqnrg1DF7NJB4Mi4zws3oSP3d20PXg7ekvk9tRVsEMg+tQlqAmJO9h1boTC5yyfTycQPXDerqrQ79jhlTXoELpOxZyGNt/qhkyULr4KlYOeNyRKuLVt9PpRpUgxNAUB0P0jL0vd/Ig8fFwhKgCUqYpeHDQxwn9eaVusLhc4tHeJYaVEErS63MAtxDRbReM4OY=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/BCpOu0x/OvJw27XCfJmojKonAwo8UzSOCfA0Sp/ZJmoRF8TMOp0Hyk+I3Qz?=
 =?us-ascii?Q?Ei9NkIHlkPDi29CFJJiomIDi6H4pYiGIQZkhbps70NEY+/PLVd63pz+GBcWm?=
 =?us-ascii?Q?iTzl/20usaen4A+pnQmMI8ncCU94cj/38MSdqXyGruPSVBn/rZJZZP6tot0H?=
 =?us-ascii?Q?f7QlpCSEzD6bfA/b5LWFb0+GI6VzxRmiyATkP1nLZ3POMMrAHNO5/sEFHzd4?=
 =?us-ascii?Q?d9D57Vgfd/urj/dA37wxcL8B7PMv4K63cYNselwzGBhHbyXiHcq8lfRj7xd5?=
 =?us-ascii?Q?GMlA+Ydd+zMpUTkIu9UmREQjkhju7tFZa7OKsKx05ljgRG4WCfxS0K7IWvgK?=
 =?us-ascii?Q?t3i1fSa4PogxavJiIhmhStK5BApdtbvRry6cVQJMCYel3mI/Ir7t90d9LCQw?=
 =?us-ascii?Q?xSCuau5++ruLWCsVAppGiThT1GPME2DNkMbAJ3fSGqAAsdPAuYYMzdh0Ofas?=
 =?us-ascii?Q?DF+/YAqpS2rbki7EddPOikB4AlmRkvf+P4GF7q6rQ8juJHVwRkMS4dLtIEIP?=
 =?us-ascii?Q?Z23EqmZTty2F28QQl0kIhb32mUaa9nf5/TYsn/JDl2EMi7ilp+ge5EPajUdN?=
 =?us-ascii?Q?TYMeM+149k/OWl0/IlEmx5aN1jPinRnTfJJOsYhRCjGz//lHt3exScmeMbJP?=
 =?us-ascii?Q?N9vxR2wlK34jcVepHS540tafMWSKQNmfxlqTdnSRBKBrRiM0SeD/XMvVIdNv?=
 =?us-ascii?Q?QIdMSlOBbAH21GQlMhYC6i0usFTz8+4qCB0mcdC1Ca3sx/XMdgUzvbCh4YiQ?=
 =?us-ascii?Q?4s1N1CtxTOUvF9J0q5pkll94S1wonAZDCg3xjdSsbaYClobadmx4JIw6rz4o?=
 =?us-ascii?Q?s6Lmowtc7wCkCvRUJ0QjwfGQbx94mKY1odgCyjtVvfZyGK6cSWzr74eKlzWa?=
 =?us-ascii?Q?FajjFZPRWQdOweqMiGrUuq4Yi1pa58EXZgTVTCnu82Ud8jVfBziIK95TEv7x?=
 =?us-ascii?Q?czxtnVpWrUG8PWtzebGCv77ttaIpSjtoQte4KmSqf3qXnpl+foXIZStdwD/w?=
 =?us-ascii?Q?iH2Aghswyc+1DPhwOhkFuSVGiZ0NJtVXm26S05IuO6BgJbfPgeUvi1UpMIt9?=
 =?us-ascii?Q?AswtOe0qVmPt3lHpN9pO2PSrGoWQUKfaJsPGOz6GIraMNULwkTTtzW0Yjd61?=
 =?us-ascii?Q?N331fHaEbQq30cuIq2H7GrKiOxZXP1ow5SnU8nj1Awnh0LIAsUVxFxLxc4mH?=
 =?us-ascii?Q?87bTvgMJ0a8fRqb3Dq5hbWEHZjwUS0Y9lGAwpQ=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-3208f.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 6057732c-0c9c-40ac-6164-08db62b39934
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5026.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 15:19:31.7718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR06MB4183
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Jun 2023 15:19:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103078

From: Cameron Miller <cameron.miller@homeaware.com>

(cherry picked from commit 7fcb6fdace27e25551f84ef4fe730b712a4a5fd0)
Signed-off-by: Akash Hadke <akash.hadke@kpit.com>
Signed-off-by: Akash Hadke <hadkeakash4@live.com>
---
 recipes-core/rhino/rhino_1.7r4.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/recipes-core/rhino/rhino_1.7r4.bb b/recipes-core/rhino/rhino_1.7r4.bb
index bb172a5..9a580d5 100644
--- a/recipes-core/rhino/rhino_1.7r4.bb
+++ b/recipes-core/rhino/rhino_1.7r4.bb
@@ -10,13 +10,14 @@ PACKAGE_ARCH = "${TUNE_PKGARCH}"
 
 inherit java-library
 
+SRCREV = "82ffb8f3e09e77e3b1f5782c35b621e7ca742b58"
 SRC_URI = "\
-	https://github.com/mozilla/rhino/archive/refs/tags/Rhino1_7R4_RELEASE.zip \
+	git://github.com/mozilla/rhino;protocol=https;branch=master \
 	file://rhino \
 	file://rhino-jsc \
 	"
 
-S = "${WORKDIR}/rhino-Rhino1_7R4_RELEASE"
+S = "${WORKDIR}/git"
 
 PACKAGES = "${JPN} rhino"
 
-- 
2.17.1


