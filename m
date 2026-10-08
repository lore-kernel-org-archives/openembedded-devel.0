Return-Path: <t.schmelzer@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A400DCA6010
	for <webhook@archiver.kernel.org>; Thu,  8 Oct 2026 10:06:56 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.88])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12207.1791454012734014667
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Oct 2026 03:06:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@phytec.de header.s=selector2 header.b=RUE7iOu+;
 spf=pass (domain: phytec.de, ip: 52.101.70.88, mailfrom: t.schmelzer@phytec.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xNC0FnWnZXCG+DqEwdcm/b8GUgImlMOLJfk10XvN/BjoNTGoN7R61Xb3wanWU5/xmE5NB7P+7zUZc5kQ+Tr2BNwfz10adXu9TMnjfav4TK341oY9s5UEeTSHWlUNpHxaNf9U9RF1m8lJWYQXK47sqL4TuA1qVssPJW20TARF7hlkL0NTbmzmKtN9hXi/LhlL8Uyb4gBpdoOCKmtS03n2oCaO48s2nv91/5zv3j2gAvsHU+chfFMnDmkTE9WBYNf5JD0K9i8piLEc+DyQkuEIXpQT/S4IVsnawDKemUGa+E0gPi9Fv4ZVHIaOTN+TRICM/e7KdvKv8uuQ4tKdc+vXpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iqj0HDFuA26M0BBbsfIHW3eHIQeeQSut9yxFHUvo9/I=;
 b=H5G53RdVlj+U+SXyzAjLAt9syS5l79PRb+/O1wRUOPPWDjK7uI4yG6lq7PDByFkcdwRCLm5JudOd7QMmgUQxwjxMYcuURaGgWJO4PEWvCVZkmhysQ2R+Qroebn9z2YgDM6PgKCm+UvlmzgyY3AsudiMNP5wasRocfIjp7rJR8h174A2UjmGTsqQaGqVeCxjR9eiaEys6qFxgNOc/CsNRqeY1VlET+g+N5yKEGIkbdoanjYp6PbN4GHrpA96wxWsCZVUD2VgVQC7gy5CX/VXEucg19sKP6ACx++c13BgO5y5r3dWVEvE5d97ocZtWuwrVXQI8KQDdF01N4postOXVtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=phytec.de; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=phytec.de; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iqj0HDFuA26M0BBbsfIHW3eHIQeeQSut9yxFHUvo9/I=;
 b=RUE7iOu+celU2Wx/aqFPy+KQgicRgoCMq4Tb/xIqm2s05/04cQFXvBPFsCZ+NEwgF78bK3Ez9jKalNYRJHQFpe6V9XG+3qEcTbLtONdSEgHGCNBles6k5749UyaFtcW6BPuX3yoU3JEJQ/VRfeNrfWpD7OGxLaMNvP0GW/1fcZUexfrsycI+tAhnee8e3dTeOBS698lgfeKN9flbOslM7PQbyXSH03gELmcrEudNOEG72LkNvx4CbuNWYD5F3d4m/VIDiB74AVclBMazlHCKmb4IHIDrVLgYpCC+WNzzGa3/PzybO7MBZykWBijnM5QjkDJsGqcxOpPUCtkXf35kGQ==
Received: from DUZPR01CA0334.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::25) by GVX0PF7EEEE6CBE.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:158:401::7d3) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 10:06:44 +0000
Received: from MAD0EPF000008BA.eurprd04.prod.outlook.com
 (2603:10a6:10:4b8:cafe::e) by DUZPR01CA0334.outlook.office365.com
 (2603:10a6:10:4b8::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Thu, 8
 Oct 2026 10:06:44 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 91.26.50.189) smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 MAD0EPF000008BA.mail.protection.outlook.com (10.167.241.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Thu, 8 Oct 2026 10:06:44 +0000
Received: from augenblix2.phytec.de (172.25.0.51) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 8 Oct
 2026 12:06:41 +0200
From: Thorsten Schmelzer <t.schmelzer@phytec.de>
To: <openembedded-devel@lists.openembedded.org>
CC: <upstream@lists.phytec.de>
Subject: [meta-oe][PATCH 3/5] lvgl: lv-conf.inc: add wayland packageconfig
Date: Thu, 8 Oct 2026 12:06:24 +0200
Message-ID: <20261008100626.2259941-4-t.schmelzer@phytec.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008100626.2259941-1-t.schmelzer@phytec.de>
References: <20261008100626.2259941-1-t.schmelzer@phytec.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [172.25.0.51]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008BA:EE_|GVX0PF7EEEE6CBE:EE_
X-MS-Office365-Filtering-Correlation-Id: da948af0-9e50-4330-08d5-08df2523db47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|23010399003|1800799024|42112799006|376014|36860700016|11063799006|10067099003|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	sKnAllKfZevJTdf33MXs7cqpdCPnEvRN+9uE2wy7+Htuuo6pPL87U3ci6c7hfs5VjQXu6NIWWoMJASbviJzs8d5YyXAtYbPKXrh1Rjvxa+G9ZXz1lx29qFZ3oDudWhhka+GB/JLRTXZqR4hTUSjQbSwPJ9guZHSFyQV/JazqFlkzzWU106awEadOaOdrlvqrtQv7ONuWi3AaKBhOPYAQHHCUaFxdG74q2tiTRwTrvmfjWGQTVK9btWpv5ln3RaZQ5Yv+SqtyBE3PMSPKnIYGo+K2kkHRMVvnGmyJZUtoXxREUW5bMlHnhySSxGt0iCklFjM11sz6d9jacYcO0YCXWbBypFdDVaO1qUFnL8svZW6Fl8hUsbrJGRHLjWi4kbxqVmRzLkMjJlhcwCOe7pQD5GDylq+5mt3Oy9nY4GluMn9PtPXFSRVFEpS5/0ZUT+gafj4paWxUxlwJIQ6ADhEjYjoa3bnJa/d5wo/sBo6swmph6+z6T3GfC7aU70duA2CwBsrGma82SId0sTxiJCTDhiNUT4fxuXOPB8A3RNrC2gttPrzabmqcKHFiiEy0UjCthxwz3pVEcl4ccvBGnoQmlFziVtvkAUhnL2V1/Hu45yP1D6ebbAfVT/V4M+tNFaVeozDUiAl98ZrVj12PSfuXpiCdkXjmgkd0G3SVIUCCJgkb4RUF8mpq+pc0tiOfpR3Z/PGFgC99FBBC4tpfkBT5kw==
X-Forefront-Antispam-Report: 
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(1800799024)(42112799006)(376014)(36860700016)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Xde8ZU6eHOMuSGHu2Z3rjNZ3LB9Qp8czBuKAg+ojV9pb/v8UM1wTl8lq6kTDiBDt466lZarXQ3G/kTICzOHuGOqW2qRsrwLghCaOaEKoeG5BrL7DjN7T4oBuOcMpggSphbuxjYmLFe+ygAtbmt/LTQKOJ4+bkYoyFt+TMYGfrSRVR/goF/VIth3OlcnWfXwYxREyRC5RvbMTcKzjbA+lCSFscPYuP2wVO37beJn3kwsYB+aBGFedsiRZrbF6N6YPw/d6KLiaeyVWhr2Ud2cht/TGRW59ysX6Wl6Le+DgaYEtT1AbnOXkW85+UPEWX/WXMIkFnm9TOrWAGeN7lMX6Ru5Np0BSb7lmgUUI3WrGhlHzkeDsEHNfJhOLG/9plks2T9Sn7DbzdHPZ2svXUVupvcSNOaBmnfa3YaCc8BMwkBfq/RxFeThpB+28nJCHVr6n
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 10:06:44.2085
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da948af0-9e50-4330-08d5-08df2523db47
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	MAD0EPF000008BA.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVX0PF7EEEE6CBE
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Oct 2026 10:06:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130667

Add the possibility to use wayland as lvgl backend. Add a config snippet
to enable wayland and add the necessary dependencies. The lvgl cmake
needs SYSROOT to be set to RECIPE_SYSROOT to find the wayland protocols.

Signed-off-by: Thorsten Schmelzer <t.schmelzer@phytec.de>
---
 meta-oe/recipes-graphics/lvgl/files/wayland.cfg | 1 +
 meta-oe/recipes-graphics/lvgl/lv-conf.inc       | 6 ++++++
 2 files changed, 7 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/lvgl/files/wayland.cfg

diff --git a/meta-oe/recipes-graphics/lvgl/files/wayland.cfg b/meta-oe/reci=
pes-graphics/lvgl/files/wayland.cfg
new file mode 100644
index 000000000000..0d18cd9df6eb
--- /dev/null
+++ b/meta-oe/recipes-graphics/lvgl/files/wayland.cfg
@@ -0,0 +1 @@
+CONFIG_LV_USE_WAYLAND=3Dy
diff --git a/meta-oe/recipes-graphics/lvgl/lv-conf.inc b/meta-oe/recipes-gr=
aphics/lvgl/lv-conf.inc
index 84115b68cc51..073da087b45a 100644
--- a/meta-oe/recipes-graphics/lvgl/lv-conf.inc
+++ b/meta-oe/recipes-graphics/lvgl/lv-conf.inc
@@ -12,6 +12,7 @@ SRC_URI +=3D " \
     ${@bb.utils.contains('PACKAGECONFIG', 'gridnav', 'file://gridnav.cfg',=
 '', d)} \
     ${@bb.utils.contains('PACKAGECONFIG', 'sdl', 'file://sdl.cfg', '', d)}=
 \
     ${@bb.utils.contains('PACKAGECONFIG', 'thorvg', 'file://thorvg.cfg', '=
', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'wayland', 'file://wayland.cfg',=
 '', d)} \
 "
=20
 PACKAGECONFIG ??=3D "drm"
@@ -22,11 +23,16 @@ PACKAGECONFIG[freetype] =3D ",,freetype"
 PACKAGECONFIG[gridnav] =3D ",,"
 PACKAGECONFIG[thorvg] =3D ",,"
 PACKAGECONFIG[sdl] =3D ",,virtual/libsdl2 libsdl2-image"
+PACKAGECONFIG[wayland] =3D ",,wayland wayland-protocols wayland-native lib=
xkbcommon"
=20
 inherit cml1 python3native
=20
 EXTRA_OECMAKE +=3D "-DLV_BUILD_USE_KCONFIG=3DON"
=20
+# needed for finding wayland protocols
+export SYSROOT
+SYSROOT =3D "${RECIPE_SYSROOT}"
+
 KCONFIG_CONFIG_ROOTDIR ?=3D "${S}"
 KCONFIG_FILE ?=3D "${KCONFIG_CONFIG_ROOTDIR}/Kconfig"
 export KCONFIG_CONFIG ?=3D "${KCONFIG_CONFIG_ROOTDIR}/.config"

