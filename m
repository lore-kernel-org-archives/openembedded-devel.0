Return-Path: <hadkeakash4@live.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E8F8C7EE2A
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 15:19:41 +0000 (UTC)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (APC01-PSA-obe.outbound.protection.outlook.com [40.92.52.95])
 by mx.groups.io with SMTP id smtpd.web10.35111.1685632774126082986
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Jun 2023 08:19:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@live.com header.s=selector1 header.b=YmOwOpVL;
 spf=pass (domain: live.com, ip: 40.92.52.95, mailfrom: hadkeakash4@live.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h42CjlfnYFdlXxvYyArxc/c69BHoVtvT2KkpnZIexjhpk+nB+uUWQE2cy9l1UrdCEUjH9Zj3bzwzOiGrYFeuWRT9EoQ2xqElL0fRqo4WW4VwBEChHDLuYo34Zylxtg51AtoeOi3qc9uoeeIYHPDVycfvQ1qDJCI8F8eU4DWEgWbDNv3GfOj3WJOqTulT6CI6jlHMShoeVj++B0pbB+M+5o/q9hwz4BwyYgIzpPUnDBdUWTHM7d8YdVEUI9l+JqRDYdBWlzXcve8G5gsr8H+dW+0Il6RqiDmpdmH1ghub5P0rvAsu2K/job9pUOKzvBO2UPvpC18eQVZkuxRvR2Lesw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m3FnQ6oO4r08WT1+qxof5FfVYtGlCKwT+KWBGnmlsy0=;
 b=le4HSObX+j8TiI+PwZpfx5BgL2uE9oZQNL4nrdsyIkAwXRiuT9owutyT/r+tyDuA3WdsyCvigD1yWvdRLLXRC/MX5ZMlLDKv6/qOdY/FEhm5dwaf4M3qcpeE6tEbyMJZqRTGQPudMX2zndNp/8Y1+3PpNAy1ufPE0EKeXdn+tz3A2ttpQjAFhQtAPXUv23i1AwS+pHXGPvLVzPLLIWpw2ks2av1UNit/MFI5vDgsVTSXk2lvFJeWzEFs0kj8fYlf8IgJ0ChYuBuUpMQnlXk1hY7rYH2JNAi5FMApfa0gFQ2peQG6Z/CMEU7XEBlCcLHtAE2IdV9kY8GsdoovYJ1wOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m3FnQ6oO4r08WT1+qxof5FfVYtGlCKwT+KWBGnmlsy0=;
 b=YmOwOpVLW295sqGk2sU/4mr8f9lbH6+ZDwebL2eKBhnZMkHoRErZuAOSMOYWHgBFsW69uRHqRFGMK+igvWVwem13ih/xTiNut8kMvl9qtWleVSyMY6xnm5Y+x/DhLXjtvYDKO3CD8SuqIxgxjqSBK643/iD5eg8v8muByaZd+G/wqFr9ucZcyDq8DArzLu6TU+OBmrrngiAW2COlIJMCfxuf/wFb2U3DT9rusqSP/FccVtvenkvqutlTs6BkV9lyKw9KwNvlbKJurzqesHmuYAFJWl3E0IZjKM+VlVuPp3dXkewODeDZ9uxqgBnjXBWEGuySU3ZiSy6/e2aMAR5Ezw==
Received: from TYZPR06MB5026.apcprd06.prod.outlook.com (2603:1096:400:1ca::9)
 by PSAPR06MB4183.apcprd06.prod.outlook.com (2603:1096:301:3d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22; Thu, 1 Jun
 2023 15:19:29 +0000
Received: from TYZPR06MB5026.apcprd06.prod.outlook.com
 ([fe80::acfb:f22e:d0d:fce4]) by TYZPR06MB5026.apcprd06.prod.outlook.com
 ([fe80::acfb:f22e:d0d:fce4%6]) with mapi id 15.20.6433.024; Thu, 1 Jun 2023
 15:19:29 +0000
From: Akash Hadke <hadkeakash4@live.com>
To: openembedded-devel@lists.openembedded.org
Cc: Cameron Miller <cameron.miller@homeaware.com>,
	Akash Hadke <akash.hadke@kpit.com>
Subject: [meta-java][kirkstone][PATCH 1/3] Update rhino download link
Date: Thu,  1 Jun 2023 17:18:41 +0200
Message-ID: 
 <TYZPR06MB5026E80A0256FADF3A3CD80384499@TYZPR06MB5026.apcprd06.prod.outlook.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-TMN: [gbjAzsm4urQUlIfWIgc1aR2wxdec8zj+]
X-ClientProxiedBy: FR3P281CA0023.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::7) To TYZPR06MB5026.apcprd06.prod.outlook.com
 (2603:1096:400:1ca::9)
X-Microsoft-Original-Message-ID: <20230601151843.29599-1-hadkeakash4@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB5026:EE_|PSAPR06MB4183:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e9a06b3-20c0-413f-07d6-08db62b39808
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hqVyhd8KmyHT0m6j/sGerdVMmhzlL78ZRp4N2YX+pT9wnXA/+PwwkgO8JbC1xvEGR27XDDj/H6mpkoQd2M7uOR41Hj4uQ0zpAqZXvq0MZelojnr2xzS7XS762Lna/y4ePCN13bR/uP8RuTSr0J/pBJOQz2Xux56MFRpUlXEe7CNWY7pKmXU3H1DerckDq/SmvVwYPLKDYuPSI2OJ6AZ8t59x7kkP8GmH5dN9n6j5E2zF5+ots7YMjUUP0ph8z1FtqKF85jdGGtYB/c3vh5wrHu1xQmnfYRCY3SFLH3GHUPARbYU45Kv8xIwZTdnBvhpkvtlzBku7C8x8sIl9sGn4h6rw2IY6T0xp1Pe8rnwE07YuxHuwf4q7K/h462hS+/rMdVw8DivBbKqHezG8p6Cl2cF8heAhY2GPewGtQyELPxtEEzWWorz7788XHN5+1HUTk6ng4LujnhoVSyppdfybV4A/I4Es+AHZPRcDfSb4pXAfBxMGX661Q5iFqviv3Za80RuBpARZQTzZcXC/uHoM6oXHwcgKnev+H95HIe169WYEjAZsTFtDo/CrmnNCmZDnXwswZYXCLAqg81uwXv6/xw==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kWquEkfNdmVMWyojR5Bt2R9rxUQAgNLH7zli4z1yVTQZi8EA7vkKxSzFUhoo?=
 =?us-ascii?Q?q3sVuOA3M+6gnf0h64Br0wHCObeFubZh5O2174O7VEvtRjBBkYhQ/ZA+bdJZ?=
 =?us-ascii?Q?pK4uLCXkRNG0Z8pT5bviQDlvDSy7tIqlHKeh9HeUKrp9ErJaBo+/bMX7lOYx?=
 =?us-ascii?Q?v3mZzLkMzeHpaTF3jwDflwxXSKEvD2Bf3wwqMjRND0a89XVYjlc9PkvoPZct?=
 =?us-ascii?Q?1fJV8cIAawyG5r/S1YK4+G8/NIyaIypGEx+RR8sA7pGr4LvEHHgTZ7vgXxNe?=
 =?us-ascii?Q?77OOspQ/2ERhHlIdHXEaM5yR5MW8EYPzJ9hNNV7IHsW7aswjBh7x4NeB9Wwr?=
 =?us-ascii?Q?n2iN4GKn+zESlpsKzvmWUiHofA2O5Dib4tcaG65a30/EKTdeMHkJ4QtX2yei?=
 =?us-ascii?Q?VoO5peN2IXGernLna6GVddplEQLKrOXlnTQ2NwhA7aheibWvH8HRIu3P8ghU?=
 =?us-ascii?Q?RbI2lwLeXNHJ6XfQvQzO80Kz10SgIExklkRGwg6yIHCS/syWyeMbWpvjMos4?=
 =?us-ascii?Q?pG774f3Vhgzw3vYzmVXEhpZXORCV3MkxWkSXCXsoo+xtLmhmC8O0Q09CJKiM?=
 =?us-ascii?Q?ZNjqvy+H556zW3wJePGFOXM+eNeZ0S+aAXi6gfMRX/dk6T2NwZfWWJ1JRCGb?=
 =?us-ascii?Q?16ZPLfyWmL7xzJ3VLU/ZVe33obyrW33l4XmjKe9TbM1uqEdlP3pSB6gaX/jJ?=
 =?us-ascii?Q?DtLs+3PCLYXtGFKhN4Mo3J11hhENjrDaw1Yhhk63OX/WUb4gsAMpGMX0v3K5?=
 =?us-ascii?Q?zDAzvt5eAG1aKMLkVeT51NNxUneh9RGip4vm2qxQYbA9G7IRjceh0VUCCA9+?=
 =?us-ascii?Q?xSFgI3P3lt6uX14mtzW3Y2lQ0YhDyn0XSR2Wp7qsGEJCoqWecW6TutjaMORL?=
 =?us-ascii?Q?6fe8EwevVKMGImIrUCVZS00EGDhU19MjhC0l3+Y8KY8NpYvSCh2+EORg2GSL?=
 =?us-ascii?Q?0zQHogoSwY4Ud8iE4YV3o1h5FWuE+MacMrRYTHvlkWmAqSeBMLz6Gq8NJWQh?=
 =?us-ascii?Q?KefXIEBX1O7kIjQoiql2qkno45Db8OE75wY2Zd8pGLGQhfzY7cRi1MvlofXA?=
 =?us-ascii?Q?2DD9KUL59ha8pJg8Vy09GwRwMxZ1CmSTEx8bVdAc0/FF2wq2odLTF+RGz7gu?=
 =?us-ascii?Q?XWNlR1QluR1vd54hBt/aIaZcE09s/8LdVphyJ3QiAT9NOKL5G8uU7pGrW3tF?=
 =?us-ascii?Q?jR52vA10mfpTgtLYkIg1JLBuZy3MbdBtK9VZTg=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-3208f.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e9a06b3-20c0-413f-07d6-08db62b39808
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5026.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 15:19:29.7516
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103077

From: Cameron Miller <cameron.miller@homeaware.com>

(cherry picked from commit e2e9adb228447f52008b98a80a787cf637d968be)
Signed-off-by: Akash Hadke <akash.hadke@kpit.com>
Signed-off-by: Akash Hadke <hadkeakash4@live.com>
---
 recipes-core/rhino/rhino_1.7r4.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-core/rhino/rhino_1.7r4.bb b/recipes-core/rhino/rhino_1.7r4.bb
index 54329c1..bb172a5 100644
--- a/recipes-core/rhino/rhino_1.7r4.bb
+++ b/recipes-core/rhino/rhino_1.7r4.bb
@@ -11,12 +11,12 @@ PACKAGE_ARCH = "${TUNE_PKGARCH}"
 inherit java-library
 
 SRC_URI = "\
-	https://github.com/downloads/mozilla/rhino/rhino1_7R4.zip \
+	https://github.com/mozilla/rhino/archive/refs/tags/Rhino1_7R4_RELEASE.zip \
 	file://rhino \
 	file://rhino-jsc \
 	"
 
-S = "${WORKDIR}/rhino1_7R4"
+S = "${WORKDIR}/rhino-Rhino1_7R4_RELEASE"
 
 PACKAGES = "${JPN} rhino"
 
@@ -46,5 +46,5 @@ do_install:append() {
 	install -m 0755 ${WORKDIR}/rhino-jsc ${D}${bindir}
 }
 
-SRC_URI[md5sum] = "ad67a3dff135e3a70f0c3528a2d6edf2"
-SRC_URI[sha256sum] = "9eb08f85bbe7c8e0b9eaffb1cf4984b31fb679f3c8a682acc3bb8ac20626c61e"
+SRC_URI[md5sum] = "1f893577269631703d31e4de9d5dc1f4"
+SRC_URI[sha256sum] = "860965fc611764745b3a4fc5bd4baac07356a9fedd2ce6642e7bb0bd7ef58d07"
-- 
2.17.1


