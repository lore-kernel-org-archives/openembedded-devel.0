Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7A3AC9830E
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 04:16:21 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32028.1790482580395628022
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Sep 2026 21:16:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=iPtgzPca;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 52.101.66.48, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ln9WK/+b1X4IwdCnL7OxT6fEAR6dOs/U4SJf7S5rVaNj8ttT9Xc+RRnd0YCSmfsUGoCTWpDNc2YPH2xJnOPMnuwJ1do43GSoffIvbQqQJJQjyj3TafooU7DEAmI/TLWbpfaR1luTzT7LWxF309jVK0bHZXserS11ucPG4G4X7R2ooBoGSMCZyncNuNBKiTD1E1XK7dsALUB4VJwTDfmkR0x35T1HkdXkVSLAEhQwVN7jPqezZ0fXnY5m/y9gW+mRqG89+w5pRfv8KuQoFWF7BoiC3S22Nysfk1x1EQ72kB/ap74pTXKQ826ugalV739/M37RB0BI+ej8BGlDiHAPZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JPrjGnDEhEuqhS2IBpkh+aGUEKlJw3TWGaBdClOc1JM=;
 b=V6Eg0E7Cjplez0L6nmKxMnVit3JX8Fj/m/edWwrfmtsGtnMombTrtvJxHqNSeDIfoz70eqZR9Ws0UDJIW4l9iD5cPueHu6wh0IOwmSHO9rvRsbXDf7byFiejnQKzmKBaYa31EwRf58P7iaKMgAnhOdB1aF4Xl7LjiIBmFvV3zi90Gfc690VVdHRr7DmydSiN8vikfP0cbUcxy+PtrcXBJAAvfr7J3zsK/678RDXCmuuCJN/1IFamTzWv8y5ZTABNYBVA9teBwlzz9TX0P4uSHyGw/59j7fOCs040E0GcNQ3cm83H+syQbDw/qhQLHodyxqeIy4YugYWWE6STrljjDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JPrjGnDEhEuqhS2IBpkh+aGUEKlJw3TWGaBdClOc1JM=;
 b=iPtgzPcacNU4ZWdwvEL5oa+w+/gET5n7l50RZuaQWQU9EieLWMy25AHBA+c3aHwa77RanxAfzKpbkJHwZJHGELIgHM1Cr+SL7NWhzGIcPF685HZGAshrkjJYpyusejSl9Mbi/pvS7pJOhstq1xLNRT609jn8YAvzo2gKNchA/U4=
Received: from OL1P279CA0062.NORP279.PROD.OUTLOOK.COM (2603:10a6:e10:15::13)
 by VI0PR06MB10261.eurprd06.prod.outlook.com (2603:10a6:800:2ef::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.19; Sun, 27 Sep
 2026 04:16:13 +0000
Received: from CPH1EPF0000052D.eurprd05.prod.outlook.com
 (2603:10a6:e10:15:cafe::18) by OL1P279CA0062.outlook.office365.com
 (2603:10a6:e10:15::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Sun,
 27 Sep 2026 04:16:13 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 193.8.40.99) smtp.mailfrom=leica-geosystems.com; dkim=none (message not
 signed) header.d=none;dmarc=pass action=none
 header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 CPH1EPF0000052D.mail.protection.outlook.com (10.167.241.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Sun, 27 Sep 2026 04:16:12 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Sun, 27 Sep 2026 06:16:12 +0200
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-devel@lists.openembedded.org,
	f.pflug@pengutronix.de,
	jlu@pengutronix.de
CC: raj.khem@gmail.com,
	Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [meta-oe][PATCH] signing.bbclass: extract certs via the PKCS#11 provider
Date: Sun, 27 Sep 2026 04:16:11 +0000
Message-ID: <20260927041611.766986-1-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 27 Sep 2026 04:16:12.0410 (UTC) FILETIME=[EE4B5DA0:01DD4E36]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CPH1EPF0000052D:EE_|VI0PR06MB10261:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ecdd0878-de9b-4edb-b914-08df1c4e10e9
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|1800799024|10067099003|5023799004|11063799006|3023799007|6133799003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	xbSLIcIsvVcIz9rOlKC4qGTUwSE69z1YonUyWkQ+UmgFXrQd7mUpiXpjjWwPvQf0n2F5ZMb23UQyUWe8pPkLcbIIzV1qcirNMPrYLNMsBkwtG3QZjkogrBrFPQgmbhhUCMzrOgO08z1UKW1ZKhqJw4M44S0U+YxyU7h8auJE3zPxjHNZuQ4QnWed8rqJ3x/LQE/6mFKg+04vde5eNQRIxatgGu0jdCV01mle0b0Mx45MbtfT/wdl6q7yjhzDS6M1Uh+2sxjfdZZqDIu1F323eMYdnv1dhoAsM0PK5+ko+7wCsjnUniMib6OdOpWzFF6Sknl9LPuiKTZA5364kGOnh/0E+qjZJnj6nmGeXBeCxfkWoCP+GVaf97AWxON7fYHBwQH/9Ypt8EAUsjnDj2n43jGRuyrgKkjgwqe4bJFbMGnuhloZUSF2a3gMP6J3PYncMv3Cl0F+1v1a3wLObY43zjboCLvqmpq17R2zaW9DbcsvWua2ALH7d7n+pyEBmMb3joHlhAeDOdVY/8ddl1vrkoqd6Niva+De//nWkorGjyKT1pFSbRAEm8ioZ+3/ubq6W+SHsc/VyIkLIvdtdVF5KaOCgZItpBi0uVYagO4o53yl+y3wlEgHv7mKjgmVDho/Cf83YUFB8TFwrIhzkbjlgCAZCTU2MaI6mk9a2F3Txf+tiqsrVfCnZ/3EEcEs84TnLdrd344xQpgVNzNCqQgcGw==
X-Forefront-Antispam-Report: 
	CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(1800799024)(10067099003)(5023799004)(11063799006)(3023799007)(6133799003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	2SGDv6B2ijPKQP56sXfzyWFruLJ4zz/xOpnT2Kxce/l65likEZFLNM4g5BjxLO1bFM1/47mnJW2XmZFOikYZmPKrKRet2vDpq88SY8KF1aVmSOiwQ2+WBDF8o+S24rqJstiOxMy0F4dIAjO675Ln3Axp2ArIChsLHybIliVjN8HUgC7ytoVHCZ2ZsfqhIFgMuLwb/pX4d7UlbFE0FbTRQcqjfRfWo+XH0L+A3A/B9ZifT7PRMjvmG5wsNekifW+NleGo+unJ09AOoipNG9KV5bfSC5oXqIV3zpTaK7SDOu3ZYTvpbV+NCoB+KKp+bWy83GyuURdglk/vNSOqX8EfMfDSWMb2ZaAGznSObvJAYJMPGBduzqG//Y+jWa4hPDZEWhKeloLyPw4Evz+0kLrmJD7p0AGhssS6U8ik9zODBGqfUEI0OU79K0sEzYDQJ8yQ
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2026 04:16:12.6272
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ecdd0878-de9b-4edb-b914-08df1c4e10e9
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CPH1EPF0000052D.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR06MB10261
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 04:16:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130332

signing_extract_cert_der() and signing_extract_cert_pem() read the
certificate off the token with 'extract-cert <pkcs11-uri>'. extract-cert
reaches a pkcs11 token through the OpenSSL ENGINE API, which OpenSSL 4.0
removed; meta-oe's own extract-cert now errors "PKCS#11 URIs require
OpenSSL < 4.0" on such input. Both exporters are therefore broken on
OpenSSL 4.

signing_prepare() already configures the pkcs11 provider (OPENSSL_MODULES
plus a provider openssl.cnf), so read the certificate through it with
'openssl storeutl -certs' instead. The class is provider-based on both
OpenSSL 3 and 4, so this needs no version branching. Make _pem the
primitive (storeutl emits PEM) and derive _der from it.

storeutl -certs writes every certificate the URI matches; a signing role
URI is expected to pin a single object, and _der keeps the first cert
should more than one come back.

The class no longer invokes extract-cert; drop it from DEPENDS.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>
---
 meta-oe/classes/signing.bbclass | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-oe/classes/signing.bbclass b/meta-oe/classes/signing.bbcl=
ass
index a9f657feb6..8ed18569d8 100644
--- a/meta-oe/classes/signing.bbclass
+++ b/meta-oe/classes/signing.bbclass
@@ -54,7 +54,7 @@
 SIGNING_PKCS11_URI ?=3D ""
 SIGNING_PKCS11_MODULE ?=3D ""
=20
-DEPENDS +=3D "softhsm-native pkcs11-provider-native libp11-native opensc-n=
ative openssl-native extract-cert-native"
+DEPENDS +=3D "softhsm-native pkcs11-provider-native libp11-native opensc-n=
ative openssl-native"
=20
 def signing_class_prepare(d):
     import os.path
@@ -447,7 +447,9 @@ signing_extract_cert_der() {
     local role=3D"${1}"
     local output=3D"${2}"
=20
-    extract-cert "$(signing_get_uri $role)" "${output}"
+    signing_extract_cert_pem "${role}" "${output}.tmp-pem"
+    openssl x509 -in "${output}.tmp-pem" -outform der -out "${output}"
+    rm "${output}.tmp-pem"
 }
=20
 # signing_extract_cert_pem <role> <pem>
@@ -458,9 +460,7 @@ signing_extract_cert_pem() {
     local role=3D"${1}"
     local output=3D"${2}"
=20
-    extract-cert "$(signing_get_uri $role)" "${output}.tmp-der"
-    openssl x509 -inform der -in "${output}.tmp-der" -out "${output}"
-    rm "${output}.tmp-der"
+    openssl storeutl -certs -out "${output}" "$(signing_get_uri $role)"
 }
=20
 # signing_create_uri_pem <role> <pem>

base-commit: a6b11ea9145515aa7a70596f29059519f2a4e23e
--=20
2.43.0


