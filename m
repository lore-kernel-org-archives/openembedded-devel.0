Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.71])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22374.1793116817126285957
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 09:00:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=fFrESKwB;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.130.71, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DtU2uNnDZ5RijBuXQhjJ6P9kqy0vPqtInyRrFPi/4E5fIstVM7iO9G8vT/XeVRgUuTdtJ2e7aYgdcCWICKzrSU8C7uuBEQmw2pRCUgl8C/a4316uH03HpcqtOE1o+MTd9KSJjiItZa/8O/pC69J83MKpIj1cxgyv4mflO0RdK/ktSDxtpiVZ6mocffqWNJQfCUNS37TQaoVlhK2fE6/N8afpmVGU7Gq2iVzUy1BrU22hNGXoHqZineUP4Hi9bAoOLlaaiNwHhMsmxDCKECdqBB/8qSmYYRK/GsGJrNAlSFd/Rykt1WeVArmPRR1s+KVeXtdg+ZzCzSRDRPY8dgIwgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tw+mmjrQFH5KIur55H9pxhRoDPa1Lb/UUZe8jjG9Mls=;
 b=iufEwz5tCBQ6F+p29slsT19B8YDJ6sn/4fSHfFrzzbKsUU3w0xX7yhWmW04X53BkmWcKbA0KK60mdDUrZwtWjt4HPot2ajGoyyC7zcqs43M8xGkrGPu0xqTB2KLyuRP12GkGC+pRc6SmCyXla483pqcHlBA0oqD0d6rNPSBowDPBXygSrd38zPaEagpQW24PzK20/VUQYzqr4lEqJA4SUC9AL8tFC5u+CV+Zhcx5dorlm1nxZtl5hed2L3C/YHr8qkHdLNRiv0NhtH6FAlRuu28PMD7YW7bThOMfEMNcAFh7Q8T4QiIrvNALCx24PJ+vuMyrEL7I7FUHQhaRyuKOGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tw+mmjrQFH5KIur55H9pxhRoDPa1Lb/UUZe8jjG9Mls=;
 b=fFrESKwBEbuX7Lk5MsMpipyiqJ62/1aP6AbiCWc4KQbnBjlHooEKK/mXptfzsFR+JkCxsgzWIxtd7MPyRqzfYudvBCxU/Ea4lUKUhONPJhc7ypLIDeH6jQJKfiGQXnoGcdjp3mLtmYcO3tw1ASZio8t/HeBe/TGwXhSNHZAq33c=
Received: from AS4PR09CA0006.eurprd09.prod.outlook.com (2603:10a6:20b:5e0::16)
 by VI1PR06MB6463.eurprd06.prod.outlook.com (2603:10a6:800:11d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 16:00:10 +0000
Received: from AM2PEPF00070CF2.eurprd02.prod.outlook.com
 (2603:10a6:20b:5e0:cafe::a7) by AS4PR09CA0006.outlook.office365.com
 (2603:10a6:20b:5e0::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Tue,
 27 Oct 2026 16:00:09 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 193.8.40.99) smtp.mailfrom=leica-geosystems.com; dkim=none (message not
 signed) header.d=none;dmarc=pass action=none
 header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 AM2PEPF00070CF2.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Tue, 27 Oct 2026 16:00:09 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Tue, 27 Oct 2026 17:00:09 +0100
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-devel@lists.openembedded.org
CC: Khem Raj <raj.khem@gmail.com>,
	Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [meta-oe][PATCH v1] neatvnc: add nettle PACKAGECONFIG, disabled by default
Date: Tue, 27 Oct 2026 16:00:09 +0000
Message-ID: <20261027160009.2436431-1-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-Path: johannes.schneider@leica-geosystems.com
X-OriginalArrivalTime: 27 Oct 2026 16:00:09.0138 (UTC) FILETIME=[3DBD1920:01DD662C]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF00070CF2:EE_|VI1PR06MB6463:EE_
X-MS-Office365-Filtering-Correlation-Id: 7de64d57-8cee-4211-4c3e-08df34436052
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|36860700016|23010399003|82310400026|261026140227099003|261021121427099003|56012099006|261022105027099003|261009223027099003|11063799006|10067099003|261026121527099003|18002099003;
X-Microsoft-Antispam-Message-Info: 1GodiGqNgqGKxOe0hiQXdxSMwXMi9uvZMt+PBgaCj3CEXWJVyXlQDWws6TO/7q6J/c3aH+mSZlCBZZm5fEyo5ZlGeViE5QefW0BEnoKg6On+syObybMD1DUCKp4c34rDEqCAmJtwQPmQFxROnrMNR3IuqonMB9gM1gPFEkgOX5D99GIkHsB3PufBN7A+m883V49m4reom3oidDwhi8xFPrGNLTtUBcKwS5uT8I021hgAUdA0NqcJA1nnuUdv0FGJWpZU22oTlTNOyXJs/4d3OoP0ufhvI5B/r/59SuFV6HnuEK+COHQUbuAR2slr3MBB6ehDV7Pgh5Vjozhb7K23aXYc0Seo/MwnhuQ+yyfqGwTtBTCITP6V9wtT3vVusRoUylCclegnbiUMCdvFkkcJyT4yQ9mQhOcAbKdDhKRkW0kkcKNxYz6dnUE+6AG25wjLa83i09l4RPXNUzhUMvP3p4wfZEPBs11QgKBPi6y/hO7UXSYABmOsk4WZIAbWuPKFs+8a1ArlJTtA0YZFiQ8HABKjGCzUQmbphHWdFWn4ultNLk0a/3K3KNdgGW5khjBJZb52KSZe5WrtKVooj3W94YCcKB2D9KWZDKPwfjNtw8u81GYhkLVDCl7QvFWLIRNVkdH9DR6wpVCodvZKs49cdgqUvTS9KtU8jqfO6Vgx0SEjcpp1TyN/hXIu/z0L/paMUx59dl9YMnTNRITRKWnrYQ==
X-Forefront-Antispam-Report: CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(23010399003)(82310400026)(261026140227099003)(261021121427099003)(56012099006)(261022105027099003)(261009223027099003)(11063799006)(10067099003)(261026121527099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: zPgzMkpACny+LOL+kzQUXeaRo1kq4TgREVM3e8VdjRUAhX/+gmEDNkW9S8nFXPa3wyKtNkT+jVjYGxk6/if1318eMZE3iu6i8SFuZV3sD/ev4P7Ba3hykXUgADVBNsfX0oSpqEuv+uOXj90KrkGpy9six0OkJ9BZU98MQ/um1xd2A3Cke4vLn4dkM30NIEUrc8fo6Jil7wOGZYBC4d9XbgBavc9L++koI+GTwtVPdaLryby997dCiekUy9Tm4q6W/NK5IikYc+zl1uiaYoJ5N1NBWBkY2jXffWxdidRfz5OzquH/Hv1WJug7b1hKY7K3ETrJU92GD98Gm26NA9u7Jd5HIXB8Px+Ky8cRg32Fqkdp7lkl69aufDB9HZOUOCSlC13ZsqXx6XSunvqkUPnOuqADgft4BexEuREbYCKQvloymW/qDk5wQYrwk7Dx99DA
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 16:00:09.2995
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7de64d57-8cee-4211-4c3e-08df34436052
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF00070CF2.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB6463
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 16:00:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131540
Content-Type: text/plain; charset="utf-8"

The nettle crypto backend (RSA-AES security type) has no PACKAGECONFIG, so
meson auto-detects it from the sysroot: non-deterministic, nettle missing
from DEPENDS, and broken against nettle 4.0 (split sha.h, changed EAX
arity) which neatvnc 1.0.1 has not adopted.

Add the toggle with its nettle/hogweed/gmp deps and default it off, so the
build is deterministic and green on nettle 4.0; gnutls TLS is unaffected.
The real fix is a nettle-4.0 port of src/crypto/nettle in neatvnc upstream;
this only keeps the recipe building meanwhile.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>
---
 meta-oe/recipes-graphics/neatvnc/neatvnc_1.0.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-graphics/neatvnc/neatvnc_1.0.1.bb b/meta-oe/re=
cipes-graphics/neatvnc/neatvnc_1.0.1.bb
index 5946994b53..ab462bcf08 100644
--- a/meta-oe/recipes-graphics/neatvnc/neatvnc_1.0.1.bb
+++ b/meta-oe/recipes-graphics/neatvnc/neatvnc_1.0.1.bb
@@ -13,6 +13,7 @@ DEPENDS =3D "libdrm pixman aml zlib"
=20
 PACKAGECONFIG ??=3D ""
 PACKAGECONFIG[tls] =3D "-Dtls=3Denabled,-Dtls=3Ddisabled,gnutls"
+PACKAGECONFIG[nettle] =3D "-Dnettle=3Denabled,-Dnettle=3Ddisabled,nettle h=
ogweed gmp"
 PACKAGECONFIG[jpeg] =3D "-Djpeg=3Denabled,-Djpeg=3Ddisabled,libjpeg-turbo"
 PACKAGECONFIG[examples] =3D "-Dexamples=3Dtrue,-Dexamples=3Dfalse,libpng"
 PACKAGECONFIG[benchmarks] =3D "-Dbenchmarks=3Dtrue,-Dbenchmarks=3Dfalse,li=
bpng"
--=20
2.43.0

