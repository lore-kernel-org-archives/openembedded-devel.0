Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E1BCC5B55A
	for <webhook@archiver.kernel.org>; Sat, 31 May 2025 11:33:05 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.34])
 by mx.groups.io with SMTP id smtpd.web10.4121.1748691180659516902
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 31 May 2025 04:33:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=oARfSnLs;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 52.101.66.34, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PSkoKb90rsewhRi0OC4jFxPYpDHoQucYIBddng511BkSp23OL3LtssUYgp6KOdlysmkLsUlfADqNIckSZJGHs+o5xQs3x9zdIt7iKvEC40ApRlTgDA4T+Eg43OE6L6mBpSpHpJIKTofTbTh+XjmNeu5Wyeo8EGte46A3d8s4Aga6P4whFUrsyuPQHEqpZPLqmR8pSzcdBrS+nwY778L5DnxeipBIWsnifeE2ketXIrbmdpAEhkBt95V95nJtwfWZAobiU00/9EJGAIrNo1Ack4a4tiq73TojiqGmIZbaYkSEmFdhVkq/QpOTjMzxjEeUjk1OfpoghP+5r3iBaGk5uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IPI+ZJ/CRMcDvG/+RAJ10Vl0iKkBfP02I/VGJtMRayw=;
 b=EuYNqWLugKqvDbZX1f4C8vJKD8hBjPgtJniidUj6dFS4HYZmCyBIaAOTTqQ/DKFicnxmKx62McbV6EyTmSp0uNA2ImxiLalAVvSNCcPZ+rdPOqZo1mH2Kv4RTJFhbTaZEHb6Mzh0zB/rMMOkNHVt0EsWXqFYWQNBNXd3FEpBt542rBW+idDgf0sfFCuVxYd+OUhewTywL3JLemulztJDW9LHNBwCyOzJ3xg6uJ6YFPYzXVJuaqMydF0mIs0wpkNfka77IZ3F3ObrhpF+TH6POLLxa++prUj54xH2tFEkCgo4AmxVKYXg7vS8cV08ZQY83b6PeS64hTtXg7LOH+1xYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IPI+ZJ/CRMcDvG/+RAJ10Vl0iKkBfP02I/VGJtMRayw=;
 b=oARfSnLsFf5ymuIhqG2mxJRmxi90E/H2PMJuUZUYNhOtZLXNOhVUx+gRCvz8Vu42pU6S9JBvb6Hw5P26p8TsgrzxDtBqZbqutAVSCPeZyteJ+36mYSEMU1XFd8IaHKbS8Z1pQCsnjBVFkY9F7NZPCVV8xa9NOirzF/zzJcqsySM=
Received: from PR2PR09CA0018.eurprd09.prod.outlook.com (2603:10a6:101:16::30)
 by AM7PR06MB6424.eurprd06.prod.outlook.com (2603:10a6:20b:118::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Sat, 31 May
 2025 11:32:54 +0000
Received: from AMS0EPF000001B5.eurprd05.prod.outlook.com
 (2603:10a6:101:16:cafe::18) by PR2PR09CA0018.outlook.office365.com
 (2603:10a6:101:16::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.27 via Frontend Transport; Sat,
 31 May 2025 11:32:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 AMS0EPF000001B5.mail.protection.outlook.com (10.167.16.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8792.29 via Frontend Transport; Sat, 31 May 2025 11:32:54 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Sat, 31 May 2025 13:32:53 +0200
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com,
	jlu@pengutronix.de
CC: bsp-development.geo@leica-geosystems.com,
	customers.leicageo@pengutronix.de,
	Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [meta-oe][PATCH v2 1/6] signing.bbclass: refactor signing_import_cert_from_*
Date: Sat, 31 May 2025 13:32:47 +0200
Message-ID: <20250531113252.3889951-2-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250531113252.3889951-1-johannes.schneider@leica-geosystems.com>
References: <20250531113252.3889951-1-johannes.schneider@leica-geosystems.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 31 May 2025 11:32:53.0825 (UTC) FILETIME=[BF9F0310:01DBD21F]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001B5:EE_|AM7PR06MB6424:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7f23b3df-460a-440c-62dc-08dda036e2aa
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?jUGcVjdkJZecU7LI1Ow379spebRGckLEJkirru+rQeR/BXC0QA1Ih4aKPhVH?=
 =?us-ascii?Q?eW4RsHJJt2YuxeCmF007EoQFYS1DfN5XiMw0cRtzcA8XkAeuKIi0vdoX9PEZ?=
 =?us-ascii?Q?KfBhvf2WKaFsAywgk0mEi//1u3FmXgoUKsWG8iWJNtSkjtnVnuGDbPCKz5MA?=
 =?us-ascii?Q?pZ1EVszDXU/ZgE3RSjWjfG6jOXmeQBYLDYodty2Dw4qfijsAR1UOBlq1YCs5?=
 =?us-ascii?Q?wLEPfQwleGvePfrk6KcYrZDwT/tPYY7xHUARV26oChW8Kpi+c/8oqir5fIg1?=
 =?us-ascii?Q?7Nkt7OONtR1BlK62Se15EVRm45hAn01CjIvrQ3rc6m+Tz6Zqfv47EwyPQXTF?=
 =?us-ascii?Q?EmHKE3z6WpvYfuw8IdZr/cPmOXd3nZHpXzGvE69SnYYXbwTPTQJwM4Qj7dTD?=
 =?us-ascii?Q?IfUYbX8efHIG+gu/tkFhPCO+xW9daCE4+VNoOQzHy95LGP5JAoeebEIpI64X?=
 =?us-ascii?Q?HvGUMBgF5ZT7VFjkZcIRL6KfDC9aXI4CzOPXBSsFCgLaWkdSduqYtablx/lx?=
 =?us-ascii?Q?OhNwA8PPGIuMsWU1RaxvxYZ6fWJ8ozpH3yI83tQO7sIQ1d5xuEpSV4BRY7Gk?=
 =?us-ascii?Q?a71etHBYLTWdwS5malmWppB/FeoKa09hgbRP9qk9/J63diIY59EwKonKpNFV?=
 =?us-ascii?Q?1DTzOI0fC0hrXr/bATXmavM4704XWzQ3xNSqgeZDHjKZ6BAukvC54dEWgejG?=
 =?us-ascii?Q?SHzXEZEoglztN1w//erP6TPgoyFJJ/1+U7aUx9F30kBdymUyGaonV4dIbaa/?=
 =?us-ascii?Q?15fDC2F3qwJcgdCY5hKBFGlCvyO3bZGvhbROh4d47qad4UP3FM3ouUxeweR5?=
 =?us-ascii?Q?SIv0nRjTBMAYQ2p72MCmCcFHlqtSszhcweWKz8566uZZGlSuseJHs/D+0la5?=
 =?us-ascii?Q?jSR2OkWbLfxNOidQqArNLOq+mdm0PHfQvXzvbYx9q9LBl+qy+281cSowvSgO?=
 =?us-ascii?Q?daqcUtroPnEpDWiOm5KmhxoJWr68WCUD1++rjvaCGk1MGoAM2igDPeqwe/uv?=
 =?us-ascii?Q?cvLcOY44iYpEDGrckVvEYbIaktTuoCwts9+9mGkFP03lGl9P2nvxQnl8ZL9v?=
 =?us-ascii?Q?y/6tEhagsmjGrC8DKNPk4SkPLuvv+OG+57dsJQVU+7hYQujRtoB3HZgXqWTk?=
 =?us-ascii?Q?+wI8S6OvLdpfi1ggvnge3wP+deMHdKAa4SHt4ocNw3LRt/XVRjoMTKu/mmet?=
 =?us-ascii?Q?yx9pGTdxrI2d1lefVuPsReVyMaeMO6J9XpFnsrGmgMkorS8Gz11rnH9Yc1uJ?=
 =?us-ascii?Q?56+s0JtGVdbwwKsePzmOmN26IQoK+HN8Ca4cXXN2CVEg0fVyAjQ5/jaZVBKX?=
 =?us-ascii?Q?eip2f6DIJmYTWGfU0BINxXGvula5WUpU+gyLALuYd1w8Y6p5W4IHIOLQIjH7?=
 =?us-ascii?Q?ZLCFWf/Q9SHZHSX3wzFHQTkXgb1gbpBTwo0D8W3gIyiguRVpacIabCIUAy7Y?=
 =?us-ascii?Q?rvl7ryRBSnWnlYmykbNRBiPkJhi1JEsMK8BZTV9XDlbtPi58dE8v19I3o7x/?=
 =?us-ascii?Q?0EJbLXNTOUKJ/USxNfj0Rfk0Hf1a15Xbjiiv?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2025 11:32:54.7573
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f23b3df-460a-440c-62dc-08dda036e2aa
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001B5.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR06MB6424
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 31 May 2025 11:33:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117687

Refactor the two methods to import certificates from PEM/DER to be
usable independently from keymaterial that is linked to a role.

By having the import_cert_from methods create a storage location (aka
role) in the softhsm dynamically.  This way certificates can - but
don't have to - be linked to a key, or can stand on their own if chain
of certificates from a PKI has to be managed.

Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>
---
 meta-oe/classes/signing.bbclass | 42 +++++++++++++++++++++++++--------
 1 file changed, 32 insertions(+), 10 deletions(-)

diff --git a/meta-oe/classes/signing.bbclass b/meta-oe/classes/signing.bbcl=
ass
index 8af7bbf8e0..c768371151 100644
--- a/meta-oe/classes/signing.bbclass
+++ b/meta-oe/classes/signing.bbclass
@@ -123,15 +123,26 @@ signing_import_define_role() {
     echo "_SIGNING_PKCS11_MODULE_${role}_=3D\"softhsm\"" >> $_SIGNING_ENV_=
FILE_
 }
=20
-# signing_import_cert_from_der <role> <der>
+# signing_import_cert_from_der <cert_name> <der>
 #
-# Import a certificate from DER file to a role. To be used
-# with SoftHSM.
+# Import a certificate from DER file to a cert_name.
+# Where the <cert_name> can either be a previously setup
+# signing_import_define_role linking the certificate to a signing key,
+# or a new identifier when dealing with a standalone certificate.
+#
+# To be used with SoftHSM.
 signing_import_cert_from_der() {
-    local role=3D"${1}"
+    local cert_name=3D"${1}"
     local der=3D"${2}"
=20
-    signing_pkcs11_tool --type cert --write-object "${der}" --label "${rol=
e}"
+    # check wether the cert_name/role needs to be defined first,
+    # or do so otherwise
+    local uri=3D$(siging_get_uri $cert_name)
+    if [ -z "$uri" ]; then
+        signing_import_define_role "$cert_name"
+    fi
+
+    signing_pkcs11_tool --type cert --write-object "${der}" --label "${cer=
t_name}"
 }
=20
 # signing_import_cert_chain_from_pem <role> <pem>
@@ -164,17 +175,28 @@ signing_import_cert_chain_from_pem() {
         done
 }
=20
-# signing_import_cert_from_pem <role> <pem>
+# signing_import_cert_from_pem <cert_name> <pem>
 #
-# Import a certificate from PEM file to a role. To be used
-# with SoftHSM.
+# Import a certificate from PEM file to a cert_name.
+# Where the <cert_name> can either be a previously setup
+# signing_import_define_role linking the certificate to a signing key,
+# or a new identifier when dealing with a standalone certificate.
+#
+# To be used with SoftHSM.
 signing_import_cert_from_pem() {
-    local role=3D"${1}"
+    local cert_name=3D"${1}"
     local pem=3D"${2}"
=20
+    # check wether the cert_name/role needs to be defined first,
+    # or do so otherwise
+    local uri=3D$(siging_get_uri $cert_name)
+    if [ -z "$uri" ]; then
+        signing_import_define_role "$cert_name"
+    fi
+
     openssl x509 \
         -in "${pem}" -inform pem -outform der |
-    signing_pkcs11_tool --type cert --write-object /proc/self/fd/0 --label=
 "${role}"
+    signing_pkcs11_tool --type cert --write-object /proc/self/fd/0 --label=
 "${cert_name}"
 }
=20
 # signing_import_pubkey_from_der <role> <der>
--=20
2.34.1


