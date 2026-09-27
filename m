Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39386C98324
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 04:16:02 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31324.1790482558547292449
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Sep 2026 21:15:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=pd+wzUGB;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 52.101.66.54, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vsv2gSkCmx/OzXNti1BaW7Qrj+Ht5Bph7I2A+1/aI6+08pdQpWXjxLgBPaRvkPZDKUq2ViiwXMuShzRICfD0ZgccM71EN5Nl7vXvmS6m92P5UyyB8kJC8YLTEupqjXKeP2Ahhk9x9W/XLLri5QjERFg55qfZq8vyZVYoxKRAxxSVT1l0m2vm0QQ+QqQzz4faWTKHbtSGW1Hvv/KOEsoKJLRKQfBBD+sPOPdi9Uw6HAWmZrfegDSFj6D6Gp8FjSlyRYDSOTgh5+2Tp90jDLNMdx7C855/h4ci0VwS4pwzpqkzCCy8/nznyfp9ijrf/EmUeMHgXMY2FbR9gURzj08pUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YJmZs1oeLC+GMwgSWPHfWTjaQfypKSY4Tsl7ROyhwvg=;
 b=iikghvTmQ1xaEpe7+Q0DOd9q4uhHNc5rg9wQZkPHlSBux/IlS4vKeIxWhRGf9Xh5DrjKbiTXzQttiVzH5MxnwypWeq+K66mKQre0j6v9Ms7Ln3Lmk8cy4WwEOS2rGfPLaeWLT0bTP/0f5FnqF5uTikxbg7ICZiDVGfJvdTFtMikSmj3q7NY+yl5Z89cXaxdSV5s/4e7TKBsclVS5U7TZkPUwkctQcjPqNbUBmQP1sh40lgKFoucPd18iYtQu+z1iaSytsqfX5/1R+KMwfZkl5McVXvbniDlQXjuY3DP8mweK4MUrHFX5Tf92ch4WtFLXIqisM463zX92R5Ivvp345A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YJmZs1oeLC+GMwgSWPHfWTjaQfypKSY4Tsl7ROyhwvg=;
 b=pd+wzUGBiEPLb65fiGTaHpTE84IiXxFWJ2ckoMA0O4e0o3PwVbp2sQzwNz0EiUT3m1GohiDcFCNToRMBMA1CcMsJS2m9iD5dmzUUChnaLFaRacbZMRGt2Gj/GXXJ6bTE+BDJ9nU7LBr7xQ/geaSfsEFdB5/dxEZsoGBpIcP0ixI=
Received: from DU2PR04CA0053.eurprd04.prod.outlook.com (2603:10a6:10:234::28)
 by DU4PR06MB10382.eurprd06.prod.outlook.com (2603:10a6:10:61d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.19; Sun, 27 Sep
 2026 04:15:53 +0000
Received: from MA3PEPF00000406.eurprd04.prod.outlook.com
 (2603:10a6:10:234:cafe::ad) by DU2PR04CA0053.outlook.office365.com
 (2603:10a6:10:234::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Sun,
 27 Sep 2026 04:15:53 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 193.8.40.99) smtp.mailfrom=leica-geosystems.com; dkim=none (message not
 signed) header.d=none;dmarc=pass action=none
 header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 MA3PEPF00000406.mail.protection.outlook.com (10.167.241.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Sun, 27 Sep 2026 04:15:52 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Sun, 27 Sep 2026 06:15:52 +0200
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-devel@lists.openembedded.org,
	f.pflug@pengutronix.de,
	jlu@pengutronix.de
CC: raj.khem@gmail.com,
	Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [meta-oe][PATCH] signing.bbclass: drop dead OpenSSL engine handling
Date: Sun, 27 Sep 2026 04:15:50 +0000
Message-ID: <20260927041550.759003-1-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 27 Sep 2026 04:15:52.0192 (UTC) FILETIME=[E23E5800:01DD4E36]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA3PEPF00000406:EE_|DU4PR06MB10382:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 961ac4ca-60c5-4017-7a4d-08df1c4e04ea
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|82310400026|36860700016|376014|5023799004|11063799006|56012099006|6133799003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	O94k5wKrexxME4pFmzUV73puIATNqsvAL18n4Z2TzNCgGK3qeOkJd+vyDE4Ob4F/kduh713t9ca+T4FB7uXBwMaj5YJE1nj/x2Ko72IJh+onK5nq+Zfe8X9lP+RPK9Hj7jjB8ZYynxbarIvpLirxC+5+c15IUUnjzyAxGuwZhrdYwqq6M+woeDPumsfS4LfgIuOzHKj6UzlmlpOr0J5l/xwXD0XoTXqiSUVUKhbLQhVCxKYbUk9Ri/kCN8htl/hy8Ya72fZR8pxF1ilOt22ZEbG9u2p6ao3eOiw6JZFR5f9dF+l3OX+TuWNC+Jbg5rMYjtSXw3/jPMAZCGrrSM6I4A3BoTchu79smZeHMBp1krNVGU+ssTuDP1Wuxk5RS8MoYiE6sbz4brJDiWoXfYbLrqMCNdNtXP5pwUr35yu3BwyOeyTHionS5ImVS9nVn5hTMWC8oc7L12sveTX8DbTWaP5E7jVowDh6dDNpMJHMFCYF/Vc6vi46IS+eTk8J9iFBVKed6QYDNl/STj3FD/0VZLHLp8a6iu1MYywH1MMOZvXkYlfSwzGGeNTRtgG8P9iV/kI4F+9aygw1hlwltqFHwse2sNBRoBhbIcmoevR5PsAAeQald1XEldOGwVb2BtsOeIpb8zGBSlECUs5CrceOI+tBOQI0JnEvORfyg2kSBIZV1B6vtmTtXZIuHCMWiuqfUZNL2dnJXahLAHpyTwWQ5w==
X-Forefront-Antispam-Report: 
	CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(36860700016)(376014)(5023799004)(11063799006)(56012099006)(6133799003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	BlGdrp6TaNmgiQZBkTVR9jtnaru3SJAOOJS75eyV+gyfd9fz8Zs5Z5+X0KIGwRDb32y8ov7KnysJBucBMMQyEmlN/60JHkCC73xGFYJEDH/eHk/NxJ396cp9Ssn6BsFY4Xhx9bCYKUz7jWDH6VKxKsPePi3rifUjkGVXGxyEPhqjcUGLHkuN2j5ZNYi4Osn/aLcpYzx33/+qm3X4hXJXCInRKZGS8FW2/3HLHKLv+kl/fRugYovq656VV4CLdbOy2yZmoJzKTHN8/DWh8ujzVWE1Xdp8S1IZBZAuUbkDG+41jSrzEhEBAgxBulqOJg4Wt8vrqP+Ca3g7MY+jdBcU761f1Av9rY34VFDAnzAiOn2IgbEBon4OL3JdlN9qWcw6dGfnYZJ/FdsliLIGZrODvje0sbbwBRJPtl5lZsf2xeKvH/KaTZIIYnZkbY6xc1d0
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2026 04:15:52.4804
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 961ac4ca-60c5-4017-7a4d-08df1c4e04ea
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MA3PEPF00000406.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR06MB10382
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 04:16:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130331

signing_prepare() signs via the pkcs11 provider only: it writes a provider
openssl.cnf and uses OSSL_STORE for native provider access. Nothing invokes
the OpenSSL ENGINE API (no -engine), so the OPENSSL_ENGINES export and the
engines-3 directory check are dead code. The check even hard-fails
(return 1) when engines-3 is absent, which OpenSSL 4.0 no longer ships
(ENGINE API removed) - breaking signing outright although the provider path
is fine. Remove the engine export and the check.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>
---
 meta-oe/classes/signing.bbclass | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/meta-oe/classes/signing.bbclass b/meta-oe/classes/signing.bbcl=
ass
index a9f657feb6..3dc8b63b8a 100644
--- a/meta-oe/classes/signing.bbclass
+++ b/meta-oe/classes/signing.bbclass
@@ -337,7 +337,6 @@ signing_import_install() {
=20
 signing_prepare() {
     export OPENSSL_MODULES=3D"${STAGING_LIBDIR_NATIVE}/ossl-modules"
-    export OPENSSL_ENGINES=3D"${STAGING_LIBDIR_NATIVE}/engines-3"
     export OPENSSL_CONF=3D"${STAGING_LIBDIR_NATIVE}/openssl-provider-signi=
ng.cnf"
     export SSL_CERT_DIR=3D"${STAGING_LIBDIR_NATIVE}/ssl-3/certs"
     export SSL_CERT_FILE=3D"${STAGING_LIBDIR_NATIVE}/ssl-3/cert.pem"
@@ -348,12 +347,6 @@ signing_prepare() {
         echo "Missing OpenSSL module directory at '${OPENSSL_MODULES}'"
         return 1
     fi
-    if [ -d ${OPENSSL_ENGINES} ]; then
-        echo "Using '${OPENSSL_ENGINES}' for OpenSSL run-time PKCS#11 modu=
les"
-    else
-        echo "Missing OpenSSL PKCS11 engine directory at '${OPENSSL_ENGINE=
S}'"
-        return 1
-    fi
=20
     export SOFTHSM2_CONF=3D"${WORKDIR}/softhsm2.conf"
     export SOFTHSM2_DIR=3D"${STAGING_DIR_NATIVE}/var/lib/softhsm/tokens"

base-commit: a6b11ea9145515aa7a70596f29059519f2a4e23e
--=20
2.43.0


