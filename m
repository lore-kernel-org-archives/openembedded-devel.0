Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.32])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8511.1794237770689239835
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Nov 2026 07:22:51 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=VUpJRj7B;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 52.101.83.32, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fnMXuw4vs2rbsjs3mHCJfUcG5Vcl7sbWgFSCea7vDVqeOelwi37rrRU+xt4iXYsZIe3xcqAOOlNTHl3oA4NZsRnkUwKFu2UU2Rxd703jBf3B15sTEBbNO/ki2vco3J0gNbBKMJfdh9nndcdElFbEDiZ2+ocGc6pTyv4EViN6501VrkcoaoWJrihOQLRkHGNZsEjStTTdlZ1LoQzs4DkXPvAjp8Ixb/q8Z3Y7z2w7vP/WZHU9SeltVMGt8zJCwYON7hGGzW+7YG2iZM3Mgm7Vo6PvRB2ZPlM1IxncPtSXJJ3qxwbIzMucV3EtrK2YBeCdNI2ztziPVXhluYy1PB0MUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zurftn28YjqM+kMDj6ut3OojMEoYyxongLoRKQ3Yod8=;
 b=JapZt7MPzaVfqxcX7PXYcI6Kp8tPj2ctdKmwlZKbowLqnk77bYxVeFwRqXyJC1nj9nzPriEHnUfMsJy0grNPHjN4OpLQkjLsbwiln/3eHfm4sySZ3EGj4twhqaa0F5wWYO7ARTxdzdGWPEoA/n+0+a0YF+FVVncThF/CddrekL60FooeO41KovaGvvOL4HTZ8z9X74bbS5ijuYkiOSJQCTPik12b4ro3vDEOuz38BPL28FFxalqVBWot0uMInjC8mqAOzM77rrkHXUNIIpRMbzCecoYcDP2lKLW9IdI2sXmVOVq1F0i77g7MVsFo1/T2lTxDaa5GSwZNOQLkWtdbSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zurftn28YjqM+kMDj6ut3OojMEoYyxongLoRKQ3Yod8=;
 b=VUpJRj7BddakWAff86/ldQHN+uEp8bSdySOnBcM8ggbcEiKzoZ6rjID2B1WLUm87etJUCTALFDzTURAJJSGWLhAajQbRts7eQ4LlfAuT6csO58uWKsy/xan2rKdgSQunoS2xTiiZcwX6hZdScaZ8bzeF2T50WQCtxlMH5F3X4ww=
Received: from DB8PR06CA0040.eurprd06.prod.outlook.com (2603:10a6:10:120::14)
 by AM7PR06MB6769.eurprd06.prod.outlook.com (2603:10a6:20b:1ae::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 15:22:43 +0000
Received: from DB1PEPF000509E6.eurprd03.prod.outlook.com
 (2603:10a6:10:120:cafe::6) by DB8PR06CA0040.outlook.office365.com
 (2603:10a6:10:120::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.12 via Frontend Transport; Mon, 9
 Nov 2026 15:22:43 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 193.8.40.99) smtp.mailfrom=leica-geosystems.com; dkim=none (message not
 signed) header.d=none;dmarc=pass action=none
 header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 DB1PEPF000509E6.mail.protection.outlook.com (10.167.242.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 9 Nov 2026 15:22:43 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Mon, 9 Nov 2026 16:22:43 +0100
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-devel@lists.openembedded.org
CC: Khem Raj <raj.khem@gmail.com>,
	Johannes Schneider <johannes.schneider@leica-geosystems.com>,
	Roman Nazarenko <roman.nazarenko@leica-geosystems.com>
Subject: [meta-oe][PATCH 1/2] discoverable-disk-image: drop do_unpack deptask
Date: Mon,  9 Nov 2026 15:22:41 +0000
Message-ID: <20261109152242.1135919-1-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-Path: johannes.schneider@leica-geosystems.com
X-OriginalArrivalTime: 09 Nov 2026 15:22:43.0046 (UTC) FILETIME=[2A556860:01DD705E]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E6:EE_|AM7PR06MB6769:EE_
X-MS-Office365-Filtering-Correlation-Id: aa1f6fca-f02f-4877-71d8-08df3e754cf5
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|1800799024|18002099003|6133799003|10067099003|11063799006|261102123227099003|261022115727099003|261022075727099003|56012099006|261021121427099003|261021123027099003|261026121527099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: R0yVDMDeoDtDwcUN7nXtB+nZOHwh3TC/Nz+yraWybxXK8ssD/qfiL4S9hMn40UN0c39h7FYbI2x05ox1QfAcyg66Y4yppdFwGNrZJnJRST7/FHa9DY/ramxmWw/H9JZjOvuaZc61M+JNrcsIW183ZbhACP8gfTQrgsPoszpPprZqa5Gb03D0aRCDi1tASmP1T6MJKpRUlh9dIxvTUFQHhuVN4bVgrKmq9bjHRLpx1hRTMRfR9P1Xg7BAoIrMno1w44FHy1TfsCTWUoiaNOxMxJrI2ojtdl5VlqAUL62GyFbnZPtWEmIY+2sCU8rRUUTD8fz2ody+fhmC9dK3N5+0eOT5soYsu/tfxbc709KjCresDTKlazhd/yhgqgv8lhsE947CScwe5KGFB136NAS4KbVN5YOzdSwZ/Bcx8L8JKyI1hXeRnW9u4cNwanXwGdKZL6fwjMPkNftGAU85dhg7u1XLEbD/FyOedTdrT3whBRLA2sz4hG9FDj/XTasvq5rGB+XTm2yLV6DKm7mUc5Trb5vpVgHaKlrOTrNwJgByhNCu+fULyttL+h0+nM4Eo044NILZoeVh9UhzjAWM15iuBp7acH1FSLNJqvVlyNp1zLYO5lBVZg/iFJZOn3X7ivhQAHM+E9RoLsHxHE/++JLrQWH7eAFNd1LTHM38kOqj2fcZHozTehc9DFCypTKH2zyZMytYonbVMXfsUfCmWHDsjQ==
X-Forefront-Antispam-Report: CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(1800799024)(18002099003)(6133799003)(10067099003)(11063799006)(261102123227099003)(261022115727099003)(261022075727099003)(56012099006)(261021121427099003)(261021123027099003)(261026121527099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: eQ6SWtGF0Kkqa9EWVBspD/+U8Eh9DJXfT36RdxKwPTrKGC/XKRTzy9xzAY06rNUDSTlXsEGwV0xVBmnvhjTc4OciSiIKZd3FHFcCh5bPznbDJrOOqbrZ5yet4Aq3fjHXpURYIktAPAzoZJ4Y+WckfKASKaGRJNoRiOGaerTsy10FLB61PA/edvrYQqG47QPXy/GuxDcxS21JjSPvlvyWq+kkXj7cHzApv9aJ51AmDxSfGfT408wk6LQeRk49qAdIjELBf+FiQQ0NEjPB+ScGspZzOhGDyibw3PxzT5YwZyaqTTWoX1UkpwLDCK4N63fJAR7ikeXXsSpCB6g0RC1LRxBF3MH0BoVnSwHMvL0f3eSRIX6iRKgA+yNwDIUPs1I18dc//0QnVLcfRuKXTc5EnCNNBQg0rSVZjy2qm6S2GkHSwM2qR2NAVfC9FRQt/yHG
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 15:22:43.2506
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa1f6fca-f02f-4877-71d8-08df3e754cf5
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509E6.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR06MB6769
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 09 Nov 2026 15:22:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132062
Content-Type: text/plain; charset="utf-8"

do_image_ddi depends on do_unpack of every recipe in DEPENDS. do_unpack
has no setscene task, so whenever do_image_ddi runs, do_fetch and
do_unpack are executed for all of them, even if everything else comes
from sstate.

The sources are not used: the DDI is built from IMAGE_ROOTFS, and
systemd-repart, erofs-utils and openssl come from the native sysroot,
which do_prepare_recipe_sysroot already populates through DEPENDS.

Suggested-by: Roman Nazarenko <roman.nazarenko@leica-geosystems.com>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>
---

Build-tested on scarthgap with this class (meta-oe master's version,
both patches of the series applied): "bitbake -g" shows do_image_ddi
depending only on do_image instead of do_unpack of 11 recipes, and two
signed lzma sysext DDIs build.

 meta-oe/classes/discoverable-disk-image.bbclass | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/classes/discoverable-disk-image.bbclass b/meta-oe/clas=
ses/discoverable-disk-image.bbclass
index 1f3a7b08e1..02ad900d0f 100644
--- a/meta-oe/classes/discoverable-disk-image.bbclass
+++ b/meta-oe/classes/discoverable-disk-image.bbclass
@@ -134,4 +134,3 @@ oe_image_systemd_repart_make_ddi() {
 }
=20
 IMAGE_CMD:ddi =3D "oe_image_systemd_repart_make_ddi"
-do_image_ddi[deptask] +=3D "do_unpack"
--=20
2.53.0

