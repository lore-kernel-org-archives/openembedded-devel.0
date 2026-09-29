Return-Path: <mark.jonas@de.bosch.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36268CA5FA1
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 13:14:47 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7552.1790687685084326251
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Sep 2026 06:14:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@de.bosch.com header.s=selector2 header.b=qxzyh84c;
 spf=pass (domain: de.bosch.com, ip: 52.101.83.4, mailfrom: mark.jonas@de.bosch.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BBv+GMT04iceYg6O2yFNl2gKPC0m3MEb4HpRlMyNWKZb7kMAswXpIlktMEPfM8SrAF2xtv3TFBZRt6j+1oE8yx1KZZv4XaEmFzFNsvR79HK7EkcekV9hZJdb30MbA0IHjB9DCShOFlKVejqHMzu/8QfJd9KGVsa6L4QtUm5/hl03c11naIuGvv3/1jHGnVFWknm+Un/oazR2N4hsewFtP16GUZgvNelp/7Co5M/cET8mo08vynY4AU22+NbzFrnBaVkJ849u99sc80pShw4TMZwR6lZG8E1lkTfCvJ+eF3x9gH1G6t2aaaO4HfeblDC0W0oAUlUveVOGkTkHZUw+AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zYFvEyNcV+Y8Lt/LdzlhovDyg+gZRjwTV0BcpUYkIpM=;
 b=tLNPtQpNw2uAd57dyVecD8ntzOEhhBCtlyf36p3B2A0NE7icVncZ/BAkFx0+UVGiXFuYKMpEo4qh048KqvhpPfwizmriCeLGu545PfKiJ7Bc1DpgsD4F/D+q76557hIvfcFbBZq2iEj882bOEFtDRn1oRye/G/IH94d5UB8WQqRLiDfMHkNg3xXjVQEpm5c0XM8YNgvQMHZu6RmUBA5sC5pdyDO9woOYQjrRWh7ulEidIkwNTEQmRlA3bGcZRxPOS9kGBkae3mBk2vsqe9gvoiicLZ8Teqby/QNbVQVv5/6aMZTBaGXLL3f2mm/yJBPVWWDYPH/sLesZF/9MRlfCcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=de.bosch.com; dmarc=pass (p=reject sp=none pct=100) action=none
 header.from=de.bosch.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zYFvEyNcV+Y8Lt/LdzlhovDyg+gZRjwTV0BcpUYkIpM=;
 b=qxzyh84cSSJ9gL+mK/kcdiHgzuUtj5bAKuIXaghgN9Q3AdDd6KCSsZlZYNHaqIjcusrrlOMMMkVn13Ttt6Un6P8D2UCs/elRtkA2q9AG3kZFcfiP/CY7uhPyWl08Fhg5gQA0GK8AKhy0cM7+ZrnkfxOi7nh/931mOD7DCKMWqCUaczbBdpyBKLY63CcYWzhm2woAQBHJaj0Q7JvZLxbKV8NG3l69E91jH5CLxfTJq9VosUJRwGLGS7I9v6QasIzbQaialHCIzChbQaXOwo4mwGcvEHuArMYkVjo5t5JYGmvbFYT8A1z3ml8m12+77XY3TO14Hs/t9PguUVhMfi1rgQ==
Received: from OS6P279CA0075.NORP279.PROD.OUTLOOK.COM (2603:10a6:e10:3f::12)
 by PR3PR10MB3884.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:28::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 13:14:41 +0000
Received: from CPH1EPF00000530.eurprd05.prod.outlook.com
 (2603:10a6:e10:3f:cafe::8e) by OS6P279CA0075.outlook.office365.com
 (2603:10a6:e10:3f::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14 via Frontend Transport; Tue,
 29 Sep 2026 13:14:41 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 139.15.153.205) smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.205 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 CPH1EPF00000530.mail.protection.outlook.com (10.167.241.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Tue, 29 Sep 2026 13:14:41 +0000
Received: from RNGMBX3002.de.bosch.com (10.124.11.207) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 29 Sep
 2026 15:14:38 +0200
Received: from GRB-C-0009M.ot.de.bosch.com (10.141.135.27) by
 smtp.app.bosch.com (10.124.11.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 29 Sep 2026 15:14:38 +0200
From: <mark.jonas@de.bosch.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <bartosz.golaszewski@oss.qualcomm.com>, <khem.raj@oss.qualcomm.com>, "Khem
 Raj" <raj.khem@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, "Ricardo
 Simoes" <ricardo.simoes@pt.bosch.com>, Mark Jonas <mark.jonas@de.bosch.com>
Subject: [meta-oe][PATCH v4 2/2] libgpiod: set per-package license assignments
Date: Tue, 29 Sep 2026 15:13:46 +0200
Message-ID: <20260929131346.1894-3-mark.jonas@de.bosch.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260929131346.1894-1-mark.jonas@de.bosch.com>
References: <20260929131346.1894-1-mark.jonas@de.bosch.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.141.135.27]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CPH1EPF00000530:EE_|PR3PR10MB3884:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e60a55d-3e17-4a65-d80d-08df1e2b9f1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|23010399003|36860700016|82310400026|22082099003|18002099003|6133799003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: 
	0o54w8IfAj96iCVEK6c0MMIH4w3WN6haZKMIfillrG8TAGgGBmA2NIN44ROKg4eKfPpHs1fWOgxV+u/vH/jdh8aTaaOTI9ZudLu+kuRMC66h1pNcjGf06x2zO6xsqm5BvG0MZwOWo9Hmk617+fEi/wmVLvQOTp2SjAqgMVmWh5JdlwaEwGlIQMRxb4sAaI7d3Oz2VcvBC+HwfD1XzDEFbTottvtNRtBH6TtixbCLSdy85KcP+HOJQXb3dG2V2VfU3VkA/ASM90b6KnURqwJA7YKkjPmgVQa1G9luVg5H91JYWdEf5vwSICpYzJk5Z9/9Q+7y4Dx2y/6ZtO+3pxBIWX62zjN2BnI3Az1Tk4wy/ahRJCTM45ulWl7k5/Mtsdrc1IbWoXgrFwqd8sWRLxqLOZ/+buH6pGqM35/tCcw06lQU6jK7YHZP0Ok9/ctyxIWPhSzYoTXAalsxSR+3dddcNB5kCHCP1AdutCrZ2zd+ALHjIJ9mqYGyEfpWeaKVqW1cTAdS5m3KJyb+bGoNHXagekA0RpcviSGi9oTvHrePelCtRAowiUGZyWC0/KjWcDz27cXbF5z2aha9hRarw1vzt3FT3Vtl0Y4xQjrYBvdbWuaMUBzx8WGyYnsQxala9gbjgWOCKRRlI5Cc7+az1K4t6TIKdd18WVIiL8er1x517Ptcmeqa855ESCJCXAyZFAZmoX22P3nA8hdeb13EAad8hg==
X-Forefront-Antispam-Report: 
	CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(36860700016)(82310400026)(22082099003)(18002099003)(6133799003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	SGCvNyXz8Idi3lib1tS5eUXMIz+y1z6kXiZE5UuTL+K+g2co+Fab8vBIvAb3GF+nOjUVK52G5CkHSmBAErpKZ+Snwi6hueFzBAGhT2Q2XK8YVCdJXUlioxtfQh849R46eFISjBNPnilBHACKvBd1Zx4+hRsGCi5pThc0tSAp+nzukKwDz7vnss3tEbSzYR8+J9WyRmPYHPxyGg2S8XueaxqSBFiXdJFLAtvnNyCLuZ5p7NSYce++iLrRTHVzuLdiC2JpRXy71Xdze3Axi8g+MONudXNgl0WaujGsLSuV06FSznpyxp30C6pkwufGbjeZUZa+DWf/YXUn47v/Y/JdeOwwyTEPgSX5tulMGItwFg2XyCANQy9RGdC/CbLmJ+nwdq6xjwVnyAXU8t2fL69lh5+iUa1Z3izjdaSxMLWMe8OEiU7vWQ+qKIbf9DaKTo4/
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 13:14:41.0863
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e60a55d-3e17-4a65-d80d-08df1e2b9f1b
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CPH1EPF00000530.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR10MB3884
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 13:14:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130478

From: Ricardo Simoes <ricardo.simoes@pt.bosch.com>

libgpiod 2.x has more complex licensing than its 1.x counterpart, with
multiple licenses applying to different parts of the project. Because
the recipe has no per-package LICENSE statement, a user installing just
the library (LGPL-2.1-or-later) might be led to believe it is also
subject to GPL-2.0-or-later and the other aggregate licenses, which do
not apply to that package.

Thus, to make it clear which licenses apply to which parts of the
project, split the recipe-wide LICENSE into per-package values so that
each generated package reports its actual license instead of the
aggregate expression.

Additionally, the CC0-1.0 license has been added to the recipe to cover
the 90-gpio.rules file

Signed-off-by: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
---
 meta-oe/recipes-support/libgpiod/libgpiod_2.3.1.bb | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.3.1.bb b/meta-oe/r=
ecipes-support/libgpiod/libgpiod_2.3.1.bb
index fc8431c99c..49327591b7 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_2.3.1.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.3.1.bb
@@ -2,11 +2,23 @@ require libgpiod.inc
=20
 inherit meson systemd update-rc.d useradd gobject-introspection
=20
-LICENSE =3D "CC-BY-SA-4.0 AND GPL-2.0-or-later AND LGPL-2.1-or-later"
+LICENSE =3D "CC-BY-SA-4.0 AND CC0-1.0 AND GPL-2.0-or-later AND LGPL-2.1-or=
-later"
+LICENSE:${PN} =3D "LGPL-2.1-or-later"
+LICENSE:${PN}-cli =3D "GPL-2.0-or-later"
+LICENSE:${PN}-gpiosim =3D "LGPL-2.1-or-later"
+LICENSE:${PN}-glib =3D "LGPL-2.1-or-later"
+LICENSE:${PN}-manager =3D "GPL-2.0-or-later"
+LICENSE:${PN}-manager-cfg =3D "CC-BY-SA-4.0 AND CC0-1.0"
+LICENSE:${PN}-tools =3D "GPL-2.0-or-later"
+LICENSE:libgpiodbus =3D "LGPL-2.1-or-later"
+LICENSE:libgpiodcxx =3D "LGPL-2.1-or-later"
+LICENSE:libgpiotools =3D "LGPL-2.1-or-later"
+
 LIC_FILES_CHKSUM =3D " \
     file://LICENSES/GPL-2.0-or-later.txt;md5=3Db234ee4d69f5fce4486a80fdaf4=
a4263 \
     file://LICENSES/LGPL-2.1-or-later.txt;md5=3D4b54a1fd55a448865a0b32d415=
98759d \
     file://LICENSES/CC-BY-SA-4.0.txt;md5=3Dfba3b94d88bfb9b81369b869a1e9a20=
f \
+    file://LICENSES/CC0-1.0.txt;md5=3D65d3616852dbf7b1a6d4b53b00626032 \
 "
=20
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${BPN}-2.x:"
--=20
2.43.0


