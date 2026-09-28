Return-Path: <mark.jonas@de.bosch.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9144C9833F
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 13:07:42 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.24])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.57996.1790600852999252366
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Sep 2026 06:07:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@de.bosch.com header.s=selector2 header.b=KpBig1yD;
 spf=pass (domain: de.bosch.com, ip: 52.101.66.24, mailfrom: mark.jonas@de.bosch.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LqcGSUs1stZ70H48BlSqvI5hOanIObcN+ga8cjW09lbfcwqXVoUjVNwW130eMUjFavJceLmED4a+0iw2xLCktv1IopTu6HNMSKXBeetXiotXSD6dj0FTJjDvt22xFATc+4V8AWZ8YoKgoUCaRncCisYdnJdWN0gYLrUniaJF+QOqT1pmoKXw3+ahgPFPC3Exsi3f94YaFWCRWEXd081YHbrdFaH5KW2MTaX1Y0kVKoqBTK4xHpMzsKfZ1XurWvl3l4palXTxUtSKmqoCVURD1h4DccBJsHYUTZhLHBb9Jo86Q1P3QWYqCe0dXk+UWhDDgZCFuZgy/Iqu7TC8oITS3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dsgsIg4thgJchjbt/tNFmm4rtRpx/Quno8F4VT5n/sY=;
 b=Cep8YFpJW/6G/kGdUtLpkJFKjSH9pzTrsM6dkJN3bAQwg28/rK/aSddmiMQg8v97ZJiElxERgDhpi8IR2RUO5E/RTPqwogQ3XE8jOExHLcQFOyEHhUlxzRGQTTr4bbgWg80eqcJ8tGEcrv3LGFZNkvM/8t2n9z2MicPfvna+4TnWemHRvXU51uUv7X98lzkltYTSDJzu379N65ksbMYam96lvVphswXR3pfjI8DQ7ZCLfSK5szN6uMhVLAhk1Cs2Pvcx3Aiu8wIRbqXyh+xwBHZO2DZcFq7Zv5OejHGGVXaErUpkhfndJZBazGqTlEwtysyDIiIMI43Y0y27lAc4Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=de.bosch.com; dmarc=pass (p=reject sp=none pct=100) action=none
 header.from=de.bosch.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dsgsIg4thgJchjbt/tNFmm4rtRpx/Quno8F4VT5n/sY=;
 b=KpBig1yDKL53vmGIp9dH9aezFr8PsmZbkuRRSn2kBrc4srMpwqXWdw+3Advl4umgJxyoy4ydEZEtJtiVkXz1AMTdxQtGCQur/RIO3NBOl/JhNIurE2+1RcsVTLikZQIorf9JGArIt+p7iwhdWh1PbY0UI/ATTxvQg68uJNJhxigkq2ZyAcePK2Mx0MnGAgdEpgPeaj3HWPZi8fUGqoXIIayWPQlcOuQEZde56gxvHh0Pz3KgtqHcYKtNgvAhXxq0SBrlh0XdxhV0z4bYmSYO2+6Ce9cxbmGvkTjapf1ep2EbsaVO3+Y6+5RCjUxgDpwd5YtU2E9+3VLegLZLbjrjBg==
Received: from AS4P190CA0002.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5de::11)
 by FRWPR10MB9322.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:d10:184::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 13:07:28 +0000
Received: from AMS1EPF00000099.eurprd02.prod.outlook.com
 (2603:10a6:20b:5de:cafe::63) by AS4P190CA0002.outlook.office365.com
 (2603:10a6:20b:5de::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 13:07:28 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 139.15.153.205) smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.205 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 AMS1EPF00000099.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 13:07:27 +0000
Received: from RNGMBX3003.de.bosch.com (10.124.11.208) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 15:07:09 +0200
Received: from GRB-C-0009M.ot.de.bosch.com (10.22.65.242) by
 smtp.app.bosch.com (10.124.11.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 28 Sep 2026 15:07:09 +0200
From: <mark.jonas@de.bosch.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <bartosz.golaszewski@oss.qualcomm.com>, <khem.raj@oss.qualcomm.com>,
	Ricardo Simoes <ricardo.simoes@pt.bosch.com>, Mark Jonas
	<mark.jonas@de.bosch.com>
Subject: [meta-oe][PATCH v3 2/2] libgpiod: set per-package license assignments
Date: Mon, 28 Sep 2026 15:06:31 +0200
Message-ID: <20260928130631.4254-3-mark.jonas@de.bosch.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260928130631.4254-1-mark.jonas@de.bosch.com>
References: <20260928130631.4254-1-mark.jonas@de.bosch.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.22.65.242]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000099:EE_|FRWPR10MB9322:EE_
X-MS-Office365-Filtering-Correlation-Id: 02527451-cabc-400e-6dee-08df1d61728c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|82310400026|36860700016|376014|10067099003|6133799003|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	4X9usk2VJHn6F5kxvgz01yxU+A79U9BWkPuyoysUlIjEdboEFnPuppjfUXuf13r5FibeuLwuTYi7X/RfSYBcAaBHsjumzAZvyI6bTMAN3nmJGSVfClrlXWmwJMuazHRrkvbpyqWn7tV73AE6dlwgk8XbqQVgGRz+TXbKmwu5sn6rCCjrsEFq5ejqnDp58xxIxW/T/tLLyLraEATdZCXzygyM55fOcSa2hEEbeDLk+1hfl0OMHlA6sHyLlPeIkDPhKbQxqOxWViOr4pn5rXTbLBN/+h/3Xjd2BMdzl2ZnrFl3YJjNbbZu+HHqB0znoC5ZmGmlZ51sTBDxsKuLUhIzWwTdXi3in1R0/sh4yU6CIzuysbc/fMZKJ7G6lSrkol9ZNXz+QopXLz9cUUyqiyX4hV3dUa8pF387UQof6SVn7mFbAcOYaL4VR5hLywDY2neu5pOEPTAS7zIzqrzIZfVQ0mTmvWHwb3qIbPOIFf7KvMU5EyHuuaXZXjTS4u44IdmNAjN8QBEVaRY5DsiwPznH96HH6xUbPZuRBA7e1mZ7r/THnPgUIuckt/2i4T+aFMYbYSJPWbrowD9VgCSgFaLWJWIbyp4NJOx4GttVjKhVRq/fwkRn1bUpeDzsCSM2la97qyfKsIDho2ismQ+fJ0aqSsWmotvyGhVTJeRniGtZbFTXYpYvg4jlzrTIrFYyAm73WxGG/b5uMt0FduUfQLZ8Ww==
X-Forefront-Antispam-Report: 
	CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(36860700016)(376014)(10067099003)(6133799003)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	C0iJuarV/xETqnxZjBIPiEX+tldtsETbfTYAGRmA6Zp6Ja1zNhFIxO1WtiDP2gFALqDC3FoTc3lAIVqlutuQsGy6VaZdkzT9ZxuLHXNbSRyrK8mN0Jmn4/ElhnEtyE8yPUKrjztMJJoM4bEwJE6aPBxtWGvfU++GvDPq1ocDh6jPO4qZCiImqETcaS5HI6EnkC+8VNyT4UiJV92DSGUCRSYuWU8WSdlrtzkcaXjkj7CB3DTiuAN2Qy3kO2tfMz2MHmTdzqR7fV5XNg7rI8zqHq+z+3pwqdULUDVaktCcxfCCBEKCMf4VzI9vfIRMoHGvtMLAGJrm2k7snW2CzbZmlXbJXRGK3dxYnh+QLd7+alT+xd8ZqmD/eqQvq76fkMPQMSF1TnJPbIa7aseoGg0rxyeP9RRnIT5ZcnrQGtnmIbAp09KJe/pwfexdGwDV3upc
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 13:07:27.9925
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02527451-cabc-400e-6dee-08df1d61728c
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000099.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR10MB9322
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 13:07:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130437

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
index fc8431c99c..c9cf4c1e1a 100644
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
+    file://LICENSES/CC0-1.0.txt;md5=3D3b83ef96387f14655fc854ddc3c6bd57 \
 "
=20
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${BPN}-2.x:"
--=20
2.34.1


