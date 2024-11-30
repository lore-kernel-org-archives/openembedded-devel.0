Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38540D73604
	for <webhook@archiver.kernel.org>; Sat, 30 Nov 2024 12:49:02 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.84])
 by mx.groups.io with SMTP id smtpd.web10.132215.1732970933128172348
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Nov 2024 04:48:53 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=WbFeQI06;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.104.84, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TPIAOxq1EHB+9ebqogBx6fZR5nH4b4V7ehwA1PVZce6Io5BV4ilFipiH94xWX9Mg6iYgXMqkKq+dLZ9Rt343StI1lIf0dYVa5eHz53PFHkVguHAZkr9jLaHF24yWumiePPrB8WirIWJUxk2aNpXztzJodVn0WXmNbgXpzYy7xL89IdUTmwLi+zCduNS1HQ9ZvqhUAp4dpngp41dBbj9EaatpSHdkeTQrsKLNhyfXIle8ML0TFhDOxWDKEGdtOHajmCfmi2sos5BZgtlwzd7wxH1h/y4MymsaltzCbqD9W7PqaYxATabqZ9J/6N4wg9HjIomDYvOjXPF/ti/+dpiqQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2NAYvbllGVqJTywmzK6zOAH6tAAvHs8NLTB7DOygrDE=;
 b=UnyyLtEUYFGhg8kPz5cEcSfdD2l5QhaBkNbPDe+KwOwQYHk/SwZpLoHRiSOV8iG3oYShItltjZ2nWMZdD4h7SVIWw1+WncTDt+vfBUcQWyGB1Je+8XS8/CYQ8R3Q5HYVUosD1ql/nTIIu3NTxUCZrlfepkwTUxhO75ztES0vlWb8WQrKBU67FHT6KhbbxhXp+LmDREx5iCtINVm/muMwTejlo0XyhenajHsb679RT2hS8Q14+7sY+gaYV/eoP43/LbwbWFhRPNOWT0XE9sJ9m6MpODdSsNtp1+hZriuBGYnJ0ZZWz33SRnwrEDnG2BRUIdjh1PB+WkESYvSw6o+VPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2NAYvbllGVqJTywmzK6zOAH6tAAvHs8NLTB7DOygrDE=;
 b=WbFeQI06wVgm3ooedilbIePzAx9rd2KJH83W7uJwgoqaxf7vkM6maDLZAF7Vp7ejpqxtvlelaQBltyItH8j2q7PSBHolXqHxSC0Yv99sBKdaEH7WnZtrXDHB0PtQlQ7EqSCS7L+u2mGIf+Byke/xK4Rckfedh5Mo9qz8wBTC2vA=
Received: from AM7PR02CA0020.eurprd02.prod.outlook.com (2603:10a6:20b:100::30)
 by AM0PR06MB6500.eurprd06.prod.outlook.com (2603:10a6:208:197::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.16; Sat, 30 Nov
 2024 12:48:49 +0000
Received: from AMS0EPF00000194.eurprd05.prod.outlook.com
 (2603:10a6:20b:100:cafe::f1) by AM7PR02CA0020.outlook.office365.com
 (2603:10a6:20b:100::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.15 via Frontend Transport; Sat,
 30 Nov 2024 12:48:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 AMS0EPF00000194.mail.protection.outlook.com (10.167.16.214) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8207.12 via Frontend Transport; Sat, 30 Nov 2024 12:48:48 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Sat, 30 Nov 2024 13:48:48 +0100
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-devel@lists.openembedded.org,
	jlu@pengutronix.de
CC: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [meta-oe][PATCH v1] signing.bbclass: add set|get|has_ca functions
Date: Sat, 30 Nov 2024 13:48:46 +0100
Message-ID: <20241130124846.232284-1-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 30 Nov 2024 12:48:48.0200 (UTC) FILETIME=[330EFC80:01DB4326]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000194:EE_|AM0PR06MB6500:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8963b6ae-3378-44f0-1e7d-08dd113d55b1
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?xVjp/SmX6aGO+T87TYWyOFQrr3FRPy48sPdSYFWv6hjbXwuOaZynrYYZRIih?=
 =?us-ascii?Q?IUJQ9yZXRdJUnn7b83k0HgXH/f3y3zkKlkmOeCY2Au2wUr9eizSGuKLVqW0F?=
 =?us-ascii?Q?nokhQ8c6ZZAoLDv2rqTnMZD0FaBtcKtbkUcAoRZP/euZW06uvsGw6QcfaAGh?=
 =?us-ascii?Q?KA3xkxEjDK7eT2VE4FN40qIQ9N8XtSLKFnuUWw3lj4I6xZ//LaGGzlYopNnq?=
 =?us-ascii?Q?o5rlob6W6wQRKEH3uIPndmg1DLGklK/7aDS+1njbZCOXMH0JND/a0pHXwFtM?=
 =?us-ascii?Q?547dzSgcnn1dLLQJqkDUuoKyYrMB0Cq6k2ZkQfhi1WJqkAjv75gwYm3Ms8VW?=
 =?us-ascii?Q?vm9b3nm8x7kUceCtH0SNd4nFBbeoNwCht4BrRfr1yfVzCZVyWHx1u3923t+Q?=
 =?us-ascii?Q?ZjeoctvVbPO25nFs/wDM4XSxugMk3ehtnTZF8Hp34akNl/wIwHKdydIRXW69?=
 =?us-ascii?Q?CuNvBGcFN38mUSQnWgVTBtgCbIydGqwXpk6xlzO5ma6gW1V+8gSimjjxHd0F?=
 =?us-ascii?Q?yhKNv+l0zWnG8sACwV6T7xumpzFh0TW/QIznaVY5kf5GsOgOwYXGWudfgcyn?=
 =?us-ascii?Q?nu2P0I0mHSMorqE9oeGZId3NueU5hWQHBpbhc6KrjizMtzd+3LBmKgfEb27K?=
 =?us-ascii?Q?Lz9jcbV1QqS09af53LSrSy8ONv9mTbYHW2WCRCeduYNnSnVhzmxuqaTin8Uy?=
 =?us-ascii?Q?zsBS3gcP3iZV7yXYatcoH6RrcK2E2VLTkZdnzzoCyJW0fde/hYseLFOXBvqI?=
 =?us-ascii?Q?MlF51B6a2r+bqMUzILqkThcBBu4+t+Igwf5QQKXkJP+zN+aVInHVWbWRl91d?=
 =?us-ascii?Q?n/SoYDIY4w1fJK2Mx3ufiEDq3ZMub+J6RaRSYHZkjFQIX+UjFIlUE5DcmFdo?=
 =?us-ascii?Q?AM0vNe54EWXgF1YvfsMJAiL3D+LslhHQOq6BcbFqxALKLTnUZpwl0gtiKyF4?=
 =?us-ascii?Q?b9yMYRO4Yh3A8oFJ1D3NvG4eIQwe5bb0npnJXqJj8q2SkXyNmbUSyrHt03y4?=
 =?us-ascii?Q?qYtX1G7Z6WSaY/EKbJItlZL3/cIExBaiCTHkgqsGplOR78MmG1OT61G1xQ0N?=
 =?us-ascii?Q?cePNW3ghOyTJI42NSJRUQHzRYa8Czf0d8hhOGQ85rKcR1AbKyianf5m2T/ma?=
 =?us-ascii?Q?Y2WTeUmmhB7WkD57nMGoRljAz9JlpTAb3hpqHmWLe0HyE7eTHkAYLF1UVQ2y?=
 =?us-ascii?Q?Bs4TuuhLEDYfKumjtAGnl9x7GceLAqMHxcI22J5zVnTF9WKac+kbbrY0WHwk?=
 =?us-ascii?Q?85u0PlPBt4/vpgzY7OlC/QtVf4UljTEVG90kaKTIC82UP4EH7cfHSdf3+/4V?=
 =?us-ascii?Q?y7KDYcybvb35EDmka6doyanUI8n0YhD021Fhf1FOtKE9N06q14Jgq2/4KOzE?=
 =?us-ascii?Q?PID6GXMcV7AGVkAzNlf9CshwHElSeOLR4dG92V1SRbklxQqS2L3CWva6fpyA?=
 =?us-ascii?Q?M6bpoxkZ+RigGbKb9Znun7bhoJ3dwweF?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2024 12:48:48.4514
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8963b6ae-3378-44f0-1e7d-08dd113d55b1
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF00000194.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR06MB6500
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Nov 2024 12:49:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114128

Add a mechanism to establish a (metadata) link between roles, in the
form of a new 'ca' variable.  Which is intended to point from one role
to another, to preserve the leaf->intermediary certificate relation.

With this additional mechanism, it would be now possible to import a
complex PKI tree of certificates (either just the certificates, or
both cert+key where available); and then later during usage of one
role, reconstruct the verification chain from the leaf, through
multiple intermediary, and up to the root role.

Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>
---
 meta-oe/classes/signing.bbclass | 34 +++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/meta-oe/classes/signing.bbclass b/meta-oe/classes/signing.bbcl=
ass
index 8af7bbf8e..f1765e96b 100644
--- a/meta-oe/classes/signing.bbclass
+++ b/meta-oe/classes/signing.bbclass
@@ -246,6 +246,18 @@ signing_import_key_from_pem() {
     signing_import_privkey_from_pem "${role}" "${pem}"
 }
=20
+# signing_import_set_ca <role> <role_ca>
+#
+# Link the certificate from <role> to its issuer stored in <ca_role>
+# By walking this linked list a CA-chain can later be reconstructed from t=
he
+# involed roles.
+signing_import_set_ca() {
+    local role=3D"${1}"
+    local ca_role=3D"${2}"
+
+    echo "_SIGNING_CA_${role}_=3D\"${ca_role}\"" >> $_SIGNING_ENV_FILE_
+}
+
 signing_import_finish() {
     echo "loaded objects:"
     signing_pkcs11_tool --list-objects
@@ -346,6 +358,28 @@ signing_get_module() {
     fi
 }
=20
+# signing_get_ca <role>
+#
+# returns the <ca_role> that has been set previously through
+# signing_import_set_ca; or the empty string if none was set
+signing_get_ca() {
+    local role=3D"${1}"
+
+    eval local ca_role=3D"\$_SIGNING_CA_${role}_"
+    echo "$ca_role"
+}
+
+# signing_has_ca <role>
+#
+# check if the role links to another role that is its certificate
+# authority/issuer.
+signing_has_ca() {
+    local ca_role=3D"$(signing_get_ca ${1})"
+
+    test -n "$ca_role"
+    return $?
+}
+
 python () {
     signing_class_prepare(d)
 }
--=20
2.34.1


