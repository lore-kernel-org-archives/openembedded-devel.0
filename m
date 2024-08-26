Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBACAC54739
	for <webhook@archiver.kernel.org>; Mon, 26 Aug 2024 09:41:10 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.132])
 by mx.groups.io with SMTP id smtpd.web10.49386.1724665264443298756
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Aug 2024 02:41:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=dsk9WW5Q;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.104.132, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bKzYrzpnjQUSTN5WoQJMqSJNy0w1DN3+glrZvdD97yJF3kjMnxb9DV7F7WO77QUnIA8jwSsMbLtNSzSE0T7c6l6AETRrBxsGYWRYmP8gWla4bxTtA1CRfGaNm9sF7p7byW2bm1czHRilG4ia4TcwqGHJfuvnIs1SetSHp48Px0IDYv/6+9WGxUT3FeHHdkych5734wbfIxqoPN/aJMYkrtgsgXXsJCSCY/exqAOyuSDQ+rtsBKKXCerj4cxczCMeWrlYl4DWlGurXUpLo9tOf6L+G9L2cF8lf2NGom1ZFZFPOgxAXWl21MwrWZMrX9R6/G6aVcOkkhSfrmNwjXv5cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WLDRxayH0m+09aH74EsJliLEBgQx0g9DwIYxw1IX1f8=;
 b=uIAU+gceMztzMcH1kckIV4ntlA3m4mYmkUA1x14PF1Yeze+pKnqnAjluePtYMp9m7HpFt6y70UZOAeVQ0Q0isQaS2J0AXPbaQl+3cjEI75IrN55qRhYEsMZ0dbk9pCERfvA/jsypp2Q3T71I8jGLUktA+uuQ9bwmFYX99KiTWiiTiPiO6WsKmGsUcCnnP+CbvyILF4V8ZnBTeynICh1pvMvKkVLmgMaK/cS6pftFnzXcDO/pBZCSfmG2gtaDU7wnCq9geq5phi3xMPs6SnyWgrKq17Vm66SK0M7gIY0Edfqtn+9RtdMlsvN6ZoPsVjCpJz3diRwDYDirDYWifjmVlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WLDRxayH0m+09aH74EsJliLEBgQx0g9DwIYxw1IX1f8=;
 b=dsk9WW5QPsb9qz24mRp26lbvhtIyz71Cfs+/qsI6YxonIMQZ3uDPpuiIYqBiOYtBuAgQ0CIIstzk/NC6xWpowBaARm8yK4F/ZAV+QivNdCla1Tvy80GNI8KhrI5IIPfyi97etY8Oy0EnnWbxfa8rbO2ebmo/MVKAwhOCV8BWN+TAiHGRCupzS0mSKlMQKKWqOI8IEevIcPVBSJ2zw2I+LrrnlzeVZl6NctBBIkaJU5FYN+aPK4QkHZbeUsMjYpwiSP7Y5ptAkdptaZHiAbPjOVV2aRiZx08ZJtD73Osd5kSpTbsAolNr431M1ljlQN0/5P6edzkH0txGvZuft2CRTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PA1PR06MB9577.eurprd06.prod.outlook.com (2603:10a6:102:44e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 26 Aug
 2024 09:41:02 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 09:41:02 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-python][PATCH 10/21] python3-parse-type: Cosmetic fixes
Date: Mon, 26 Aug 2024 09:40:10 +0000
Message-ID: <20240826094021.2744296-10-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240826094021.2744296-1-niko.mauno@vaisala.com>
References: <20240826094021.2744296-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3PEPF00003668.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::384) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PA1PR06MB9577:EE_
X-MS-Office365-Filtering-Correlation-Id: 622346e2-a6b2-4aa3-16ea-08dcc5b32fdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?RIKhGF8iv6R6IulhDEjfJOi7vACEsw2BUwLaeFshlF87dixWlISgjFtfe9hN?=
 =?us-ascii?Q?caovgnog5n2r9koXbKdU356zyCUYPULcBbhV8ynie1bmwi4gZXMXSkNvKZMK?=
 =?us-ascii?Q?GA56HJ9oIa9tUYAEjmt++G0c8vMqnb2egL9gdC2xF6CbkwN2emGjxI8T5M1A?=
 =?us-ascii?Q?VzGEypu1PaCXv97CtcCAGde63FbPYBl1kXrHokn4No1ZDWsM71TDiRZkEpUi?=
 =?us-ascii?Q?8nhxDtpZKSsp+wZwiWxCqu46zYuXSnfTPvKS6I9jCTF/VxMNe9Pd/O2Z13I/?=
 =?us-ascii?Q?0BGvs31ofxVBRLeLWTitqHmBakWxutzbp5eKeTSHa8r646nAPGl48jRlkX6J?=
 =?us-ascii?Q?Xsh5NiuU5qZ2Ew6GdrHy98ivr1y6qROHA5Mk/Ils3EhH46wXn3GUZSJn6IrG?=
 =?us-ascii?Q?LEQFOURsRg9+gRqq1LwDUo1tTRFwEhQa6PdzbEdpZTO6ehg0kLSgTFUPuJrw?=
 =?us-ascii?Q?JuFZvOiR7rlPGKc+992nRrYdMjw3bcowDyDPh6130DUE/du0L1ZF3B3TRrhZ?=
 =?us-ascii?Q?oCX7Z4o1xz7wXZfeSbWIOiMr6mEBgF/8ob7UQuAfFz7prIk+Vbxynipkul0z?=
 =?us-ascii?Q?AyiGoqOJNjt4qSVfA2/vzMjgXWmwc8+ecFsXSL3EJVvMw3TZTJBTrZ2KdhOP?=
 =?us-ascii?Q?M+HTWlWx7hfyV7j1dWGo1V/08bPH6+mwY5dkqbB5tkOyMvuhdcc7J4pRTDrv?=
 =?us-ascii?Q?0s8b3VTCmEhIfGh+qtpMG5GooZLDIir0oM6wZsHZ/9ukegJ4g6gCcD1v0qBd?=
 =?us-ascii?Q?uM2fIwBtBGP0CTmZH34rVn9FDsvnMZlpGOXEP6yjtNV7IYDmpWHBrRHjN2JU?=
 =?us-ascii?Q?AcobW5oKdljaLK9aQtLkslIJrL6b7tUUe+71WKED4wZpnyJ9xGsqau2nvS/x?=
 =?us-ascii?Q?ETMtjxko3GTC24ic3sYr7nkbNgx1JawLMjohzK8jV6Dyd6h1aKM5qm8dRutx?=
 =?us-ascii?Q?CvUaMhpBZgw2dgXwDO1ac6CyuOsV4GdwfD5yE4Wl8oysGH70g0B7ClWCOi+9?=
 =?us-ascii?Q?cliK7Y1hNxciq7pCHXMtehMikp7BPIaNP9Mr4zB37aB1DZ6l4pR/0/HLWEH1?=
 =?us-ascii?Q?wbxZ/D7T7MEsRL3bj2EgVhynQG22rrXSghI7k1mE3ceg50U7Wa9M3kGg2ViD?=
 =?us-ascii?Q?+zYIw9HPbwFggxHdzgHNF01ca+BwPxUDTamcQ6CZ0sx8IPjzndQY6CEe5oKL?=
 =?us-ascii?Q?b4FozGc7OkycEVgbJGAeBfus4D03o1hF/bcWfmhCFxfT8UOdMTGhrTu9UW+t?=
 =?us-ascii?Q?FCNydqwPrLao7tfmUU5aQiBFiphwmqHZGpW5uUk5HKWxqKevKAl9bZME8sCT?=
 =?us-ascii?Q?84NB0z4bjzl793TSPRIVHoO5Zdloj7rzhkfK8rFrWEjEhBi23wps9U1Qiqmv?=
 =?us-ascii?Q?gAKSexE16XW4N6jVmt5adijlFzBC/56Grq0D21Dk0SAtPO5WvQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DsC0pWpupelBG1vtwpe2yVXwrr4yCsCUdzj2WxZyUcsH13+we3nsXsWPyRJO?=
 =?us-ascii?Q?0VSVS+EFuE7Px+mEiSPNjNJRy3yEBy3bRQtofDyNbzxM0oyM3ztudHRoSNRd?=
 =?us-ascii?Q?8Hqw3FD7BrWwBLmUCnI2ZLa6Ochdtz7F/HRqhhcNyiOARxZYiQQ+haRfaFIF?=
 =?us-ascii?Q?DKVbRqYaKboJxliw6262ZgA7aHINbRpZ7tON+cuBOllWkQpv9aPaLzeOoVd/?=
 =?us-ascii?Q?Bjx+/W25oTa62EICpN1FzEvFK7g27IlJySwdJMmeObec5i1U+S7r9V8TCNfa?=
 =?us-ascii?Q?LFIFfCQJACEsprs362xT4ZdOTOYAHQFXWPSpmGHoV6h/fAejtJgxS2f3fk/x?=
 =?us-ascii?Q?A/l7KT+enSL9kMghtcvC2seOHRtZg86pWoUs16jw8afH4ssTMbM+sX7sQrbU?=
 =?us-ascii?Q?LeOO2iM/66o103d2km+SBzbOy8bhq6P787XkQSRpE4iFN4Sb4LkcIiorz8Le?=
 =?us-ascii?Q?4oCrvhzep2APNXB9A9JNpzBQiSTvzPQcl4tkLYRaMEUXMriJO1dSnN48ZVqe?=
 =?us-ascii?Q?cH9PTx+xvWY77J9w39cKZZc7I76UjU9c9SCmLbLD3eoVGddK8t3xV7feACLU?=
 =?us-ascii?Q?JIW2PFq6L2I+qX0F9ta5jVlJkmnRTQMLbAzhwaLU2M9GR/kOfuZl+V0taejj?=
 =?us-ascii?Q?IruafSkFX8hOJ0zXC5av4nkOPe0Gig28mgn8cVyeaswrVePY3AQwC7cqXzBT?=
 =?us-ascii?Q?DjJeP1CzupU1GpKOwezY6XTJFMt9B0OdONQxQ/NaWPWPjqCVCUzLCx9IK84b?=
 =?us-ascii?Q?MYJwBHjYTaIMaBNoy1zbX776FZxbBGESWLbMaHGdEWJtEm6HnLs8ffUwTbIA?=
 =?us-ascii?Q?P64b7aLOQONloAnOxDHDhW7gMKoNlrDu2OTqzMP7kqztKkH5mw8E3NC9HhIn?=
 =?us-ascii?Q?LAKYHQIvjMGP+GvfokFdVLSDof7YiSrwn/iS+6Qy0kghSW2jxcKE2KdIlfB+?=
 =?us-ascii?Q?IedMXoxcxrTrulj9YYUy2+ZA4YXTOboikTrEJnxIBzK7B5AtkMF61PTr4cMF?=
 =?us-ascii?Q?e6cHicqdKnVzoo7ftebEc62ssdM9dYvfUWbQqckHprayHTpVhOYOBe96e9YC?=
 =?us-ascii?Q?1sHxnu7siZuPWelV8FWc9VVVHKcTcAVt2r21AviJkoMzVrwa0xZiwPPDn24Y?=
 =?us-ascii?Q?7nwfJ7SJ3sL+jsowCq7kwZ15cUemtafM+rL3N+e3Y38fgPa4MukC5Du8RZwM?=
 =?us-ascii?Q?JcqQf7eBYoJrC+Etp3GEuUxa/5eTBKt7CnZb7mgkLJm0vl3T50WRVVueetdR?=
 =?us-ascii?Q?GHcSEMn80wuz37UvQcEhoK/mVitVpEVdTS5ThgFWJoF5giNI+LEXQykRofGo?=
 =?us-ascii?Q?zvvXei/HClZUr/bDkv0k9Jk4AhGowj41dxuIu775vylFYi6+9oTGZs+nnCUZ?=
 =?us-ascii?Q?qDWCBKA6DeEE6Lof3LfALuaf+Jaz/E1IjSN6jLAaxv/E6GPDUjuGUnDWJWrV?=
 =?us-ascii?Q?YYRa5vC68pUByo7WhbhlqjkwaLF/I6Urj9zfMMHZg7hYjmN+TYP33kFv7ZSV?=
 =?us-ascii?Q?npKosN5+F5Z+VEKc1YqWzbPdk7hI4+X+ATWrHsR2j1A0GaLdHdvQb6IOxCKS?=
 =?us-ascii?Q?RjJReUVwwSUJ5bvx9a/4XX+tiKUQ83SO5Bs8e6e/Eiowi4U6OTnCPZROSz4j?=
 =?us-ascii?Q?2Q=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 622346e2-a6b2-4aa3-16ea-08dcc5b32fdb
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 09:40:57.3111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2lgy6/tcyd567tcJUo5AliGpDjbsVs6+w+Tv8Qmzw79z0GR+HtX46P/jgGsGgr+Q/RPbsQEmnofdZtcMi28vQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR06MB9577
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Aug 2024 09:41:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111948

Apply some changes to recipe content ordering and indentation style
from oe-stylize.py.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 .../python/python3-parse-type_0.6.2.bb        | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-parse-type_0.6.2.b=
b b/meta-python/recipes-devtools/python/python3-parse-type_0.6.2.bb
index b5d9b2057..4c5efa185 100644
--- a/meta-python/recipes-devtools/python/python3-parse-type_0.6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-parse-type_0.6.2.bb
@@ -4,22 +4,21 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2e469278ace89c246d52505acc39c3d=
a"
=20
 SRC_URI[sha256sum] =3D "79b1f2497060d0928bc46016793f1fca1057c4aacdf15ef876=
aa48d75a73a355"
+SRC_URI +=3D " \
+    file://run-ptest \
+"
=20
 PYPI_PACKAGE =3D "parse_type"
-inherit pypi ptest python_setuptools_build_meta
=20
-RDEPENDS:${PN} +=3D "python3-parse"
+inherit pypi ptest python_setuptools_build_meta
=20
-SRC_URI +=3D " \
-	file://run-ptest \
-"
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
=20
+RDEPENDS:${PN} +=3D "python3-parse"
 RDEPENDS:${PN}-ptest +=3D " \
     python3-pytest \
     python3-unittest-automake-output \
 "
-
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/tests
-	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
--=20
2.39.2


