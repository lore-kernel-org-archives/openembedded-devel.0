Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.57])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5535.1793784730051190633
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Nov 2026 01:32:10 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=tohhUtUc;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 52.101.66.57, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e8ZAgWwp0nOOwGPPDBJ5uwEki70V0P0kYtqxRoi2HNhOtj6x3HG3qOkRLS/uz5Oco4dXPsA/RhUU+7s/ArKBRJbmzgt54UJvluWkZ11EtN5+nDOU4RSfxyt01UsEz/E1s21qn4rrl/dMzk2NKXgzdyXINs7xUd60asgxzb+zyks1wcHoGNvx+0WBbo4PBLtZUJZbLALBX9RkwFQTc0jqFCqyb4xPA7n/4uBiodyT3m0U9ZwCt+Nb72yt4nPyK0lATbz00IHv5f3JpJPcopFfhE3Wy27phKIcEEd0R49mmZllgIX1UdCgXm4+4i8tqB6hDInTpJbK433vpUC+IGkr+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZDWrFl/ZWdW0unm3k+M7LR0BjJ4PbA09PrXzUQHs+aU=;
 b=H/rbmLKbZG5duzit2HfkMoQIzXotA1Yhe1Du7yu9Q90BHpWwNUSAIxChx0nmg7qfpCItB/8OEoH/BWlWK1RsC8jnUeKz0y9NBAmIdZ8U2gEF4W0L4oZPgK79vai3l8JV0XSZYD8rHPSMfc6jLn5sohxQxKtV7NF9nk+svZfugk011JTxJ32pEuKC9tUdjLQ71gqCCEZTushzMnXyWDBneAd2Wj/r7FKRQq8cKu0moKgAUOGnNydnIM3SroNYDyDLehaKYplLBAVR3H8LhhZQvLOh4YHyVIkmnH/PQhBkKct4ZG687EO1vMOkeUBi5ImZ3Q1eclksFowGjXhPNOSnFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZDWrFl/ZWdW0unm3k+M7LR0BjJ4PbA09PrXzUQHs+aU=;
 b=tohhUtUcqT72dRz5ROIZ7dCZM1xp6QMPaewADuDMjJykU3mGcNqXPrmx8p7WanThm5O1SSvIAk4zMARxKKGuKanQrVAHsYuMM/nyDRMm1oQymImprgPfRHRMvfmPslxN0SHv5IC9OvfaR3ijyB3F5ozY8cQ75QBuUPTiD+FNxIA=
Received: from AM9P195CA0005.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::10)
 by DB9PR06MB8091.eurprd06.prod.outlook.com (2603:10a6:10:268::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 09:32:02 +0000
Received: from AMS0EPF0000056B.eurprd02.prod.outlook.com
 (2603:10a6:20b:21f:cafe::8b) by AM9P195CA0005.outlook.office365.com
 (2603:10a6:20b:21f::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.9 via Frontend Transport; Wed, 4
 Nov 2026 09:32:02 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 193.8.40.99) smtp.mailfrom=leica-geosystems.com; dkim=none (message not
 signed) header.d=none;dmarc=pass action=none
 header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 AMS0EPF0000056B.mail.protection.outlook.com (10.167.242.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Wed, 4 Nov 2026 09:32:01 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Wed, 4 Nov 2026 10:32:01 +0100
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-devel@lists.openembedded.org
CC: Jan Luebbe <jlu@pengutronix.de>,
	Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [meta-oe][PATCH v1] signing.bbclass: set all softhsm config keys explicitly
Date: Wed,  4 Nov 2026 09:32:01 +0000
Message-ID: <20261104093201.3491037-1-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-Path: johannes.schneider@leica-geosystems.com
X-OriginalArrivalTime: 04 Nov 2026 09:32:01.0540 (UTC) FILETIME=[588DA440:01DD6C3F]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF0000056B:EE_|DB9PR06MB8091:EE_
X-MS-Office365-Filtering-Correlation-Id: 9212c0ba-5fbb-4a9b-599c-08df3a567b31
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|1800799024|6133799003|10067099003|18002099003|56012099006|11063799006|261022075727099003|261022113327099003|261102123227099003|261026121527099003|261021121427099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: NNcGpAInDF3Q9NHxFpX5NhfAzlDalAdGuEG1VLiXQYX2RU7MJIcJ2ZqSNKIox0j9ME7oc0Osxqtmdu1WtbiAyhcVKgzYUvUKOD3G+3e/efgu8bPZao82h9UPGiRivk8iZ9rb+617PSBp4n0AQZm7Pt+QMrsV0jEdf6y8x86aZ/OAZOxZ3HJxu/PKsJb4dQBi0qNM0u9mvmYjzWyadJjoLD1qQ+41PTtaA500/81hINbzOB5PtF/via5bhCvPfl0bZvt59uzBk7DxU59S2sa3BWHee1pQX+Ea/tuAlG8xygWN248u3bQHyfctCxigkg3GeqL9Vr5/12QiB6U1y8pQxo5CUQjHBI1AIBSqqaxCUHASKTH/Z6Lgn6EL4O3sIA9UP9J+UV3zjjlo6LTM2TU7jRB3+vd3zVZpf7OhifrZ9Vphe2O6/jR8nXakmqcyCACfgIyNzTX3KeVwGudtt637FVHCeDfTah/OK9VQAgG/YOak6JiT8+rCT+gXOjCaXimuWMxiIHI/pdu2zR8+5W+nnT1jAJTSyKdVNdlpMkKniWcZBA5B+QwCTZGCpnjCCCqB2Xz/3m5CqVG1s8Jz9x3vw5TPE8M48juE+s4QVcKpAPzPaDjZVTGGvNUYstco0mbWYx7ARJOsv5FjMavHpZ0ZvCSbGNXEEJcBAyH3P6Xu4knUhuhDjf6xxRZf+AyVdRcreHmFVb5lDLPmafGdnYXqeQ==
X-Forefront-Antispam-Report: CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(1800799024)(6133799003)(10067099003)(18002099003)(56012099006)(11063799006)(261022075727099003)(261022113327099003)(261102123227099003)(261026121527099003)(261021121427099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: LqpYAa2CXmpfmGu87lRluYk6AnRL7wVaipBw2opUToTlcDBg9AexWDhpZuDGzawqVjX+zfrmsBHGzdz7GfFa4DFTvmNMCpX7HlobAPoF7meTG3PJ+54glTo1QKKfQXlZJQ5KMv3s/dDNbjQz9fNrGE4NDulWLi4m+Jf1GdK0rQQ9MEbRb2+PH8v0qYmdvSC1qQSuXWIcUednCTEZvwTm/RD5WOsssOGNcRj1MPKkDQz1gHIHck65sVEzBkwRzqZBhFrJJLyRGxLJViHA0M0n9ygOQhxLqVKtJmpMa/undCsabdaynnTRIwtzpe15w3ENl7R2ehapf3bhESUwEF/sZOlibYnwY5jYF63BTB/cVLoKmj5BD4cRXEOyNOV9swtstaDUqXnzsYWXxYvDSlLuQZTXmwCacGxJbrNkQkkvLDV65JBRWarzk8COfx1pzdbA
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 09:32:01.7896
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9212c0ba-5fbb-4a9b-599c-08df3a567b31
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF0000056B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR06MB8091
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 04 Nov 2026 09:32:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131839
Content-Type: text/plain; charset="utf-8"

The generated softhsm2.conf only sets directories.tokendir and
objectstore.backend. SoftHSM warns about every other key it falls back to
the default for, and it logs through syslog(), so every process loading
the module during a build (rauc, extract-cert, ...) puts three
"Missing ... in configuration" lines into the build host's journal.

Set log.level, slots.removable and slots.mechanisms explicitly. The latter
two keep their defaults; log.level =3D ERROR keeps SoftHSM's INFO/WARNING
chatter out of the host journal while errors are still logged.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>
---
Tested with a downstream copy of this class: a RAUC bundle build signs as
before, and the build host's journal no longer shows the warnings.

 meta-oe/classes/signing.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-oe/classes/signing.bbclass b/meta-oe/classes/signing.bbcl=
ass
index b02825bd00..431ceab8e3 100644
--- a/meta-oe/classes/signing.bbclass
+++ b/meta-oe/classes/signing.bbclass
@@ -112,6 +112,9 @@ signing_import_prepare() {
=20
     echo "directories.tokendir =3D $SOFTHSM2_DIR" > "$SOFTHSM2_CONF"
     echo "objectstore.backend =3D db" >> "$SOFTHSM2_CONF"
+    echo "log.level =3D ERROR" >> "$SOFTHSM2_CONF"
+    echo "slots.removable =3D false" >> "$SOFTHSM2_CONF"
+    echo "slots.mechanisms =3D ALL" >> "$SOFTHSM2_CONF"
     rm -rf "$SOFTHSM2_DIR"
     mkdir -p "$SOFTHSM2_DIR"
=20
@@ -353,6 +356,9 @@ signing_prepare() {
=20
     echo "directories.tokendir =3D $SOFTHSM2_DIR" > "$SOFTHSM2_CONF"
     echo "objectstore.backend =3D db" >> "$SOFTHSM2_CONF"
+    echo "log.level =3D ERROR" >> "$SOFTHSM2_CONF"
+    echo "slots.removable =3D false" >> "$SOFTHSM2_CONF"
+    echo "slots.mechanisms =3D ALL" >> "$SOFTHSM2_CONF"
=20
     cat > "${OPENSSL_CONF}" <<EOF
 openssl_conf =3D openssl_init
--=20
2.53.0

