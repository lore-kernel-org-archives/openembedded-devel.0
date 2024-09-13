Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7890CEEE274
	for <webhook@archiver.kernel.org>; Fri, 13 Sep 2024 00:40:26 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.65.27])
 by mx.groups.io with SMTP id smtpd.web10.62980.1726188021137605612
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Sep 2024 17:40:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=GExmQ2QD;
 spf=pass (domain: axis.com, ip: 52.101.65.27, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iG5Vt2M355j3GbAE6lqUn53NTMTNNuH7+T/3wXInYXkH+cLcWY8sjj3rp6x+VZen5sPVDvCwlsjrS2dva3TJI4zS6Kxw/GUTIcKBKNOlWE0Si8xxzlSp8nzQ+TRnhlXHCiGbWqlSRkjppM6qhys0mnAXmBL/w1hOf3HNDX7SImKbJbBSEB3y7SuBZyT5PQG9y/It5EtwU7Y/+kfX+TzjRatMlvLOrZitCNercrt4oruPmOaHMjvOlgpR1xzUToIsfAveM/CdvPd9kbAC5dl8geA/qIxFQmBGWUJ/wBhAQfXe49scdnIAq/qI/5RG2dnzOMF5cdxU/giwIUXEdCYQGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dMIP9Y12Z+SvC/BuJwRgmFMpZuhiYXBzjuflEIQFr0U=;
 b=R1ubkrCgE9JyAB2JXDZrm7yCooFACsgTihg10raKa4MVxXQDca1Wt7aXIvGuiA6yJBQPJd8jn+PtY0fQhvLkAPKwjxf4XQ8CBfaAd+VIimvQJwxjLcR5tj05uv9y9bT0Qf1yK4HNA28qKMRqq/3QR87gJG1JQW9pUpXDXF4XcBAO8M0Hc0Pt9c72n09obNot+Ctpst78KcqBR7/eX+d7YumkSRPv65Lmwq29c8WvdaUcNgskMKRBHpBxZpsLL5pnQ2IvdXnZ8nJ3obg31dxF+qEjgEdzLqBcB7se/cZA/P6Mkj57R0gMY93wTP32o8SvJZNBR7gm2Ytz02ZYCabNTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dMIP9Y12Z+SvC/BuJwRgmFMpZuhiYXBzjuflEIQFr0U=;
 b=GExmQ2QD5tRNEiLopH6ywFdT6iyIFubuCw3JIeGB4yd9Cjus3w1E3uLHRjrbtvTHEOlK2B0GSHdMRmuBZiYPFpc4lGA137jGLpPGyaTSorepQ+7fEwzu8ooZ0ncsaL25a2sxy/QseGq3pAoOB3bc3LaOhnhKIt2Gn8ail26Uqow=
Received: from AS8PR04CA0024.eurprd04.prod.outlook.com (2603:10a6:20b:310::29)
 by GVXPR02MB11014.eurprd02.prod.outlook.com (2603:10a6:150:221::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.18; Fri, 13 Sep
 2024 00:40:15 +0000
Received: from AM1PEPF000252DE.eurprd07.prod.outlook.com
 (2603:10a6:20b:310:cafe::1a) by AS8PR04CA0024.outlook.office365.com
 (2603:10a6:20b:310::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25 via Frontend
 Transport; Fri, 13 Sep 2024 00:40:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM1PEPF000252DE.mail.protection.outlook.com (10.167.16.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Fri, 13 Sep 2024 00:40:14 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Sep
 2024 02:40:14 +0200
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Sep
 2024 02:40:13 +0200
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 13 Sep 2024 02:40:13 +0200
Received: from saur.se.axis.com (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id EED8B224
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Sep 2024 02:40:13 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur.se.axis.com (8.17.1/8.15.2) with ESMTPS id 48D0eD9F1554502
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Sep 2024 02:40:13 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 48D0eDPw1554501
	for openembedded-devel@lists.openembedded.org; Fri, 13 Sep 2024 02:40:13 +0200
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] paho-mqtt-cpp: Remove the dependency on paho-mqtt-c
Date: Fri, 13 Sep 2024 02:40:10 +0200
Message-ID: <20240913004010.1554478-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM1PEPF000252DE:EE_|GVXPR02MB11014:EE_
X-MS-Office365-Filtering-Correlation-Id: f725fc1a-6764-491a-625b-08dcd38ca1f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?VPNd/m7pFM/eOOj1i5GHeIMz4eCbV8LJQZMLUqHudPM9vSkss+w3ZAFzzA++?=
 =?us-ascii?Q?MIHKQuK/18T3kWTlZeNPJW6usyAKzX60zhFjqPfXflWCklOwQIPZ+20KXlEQ?=
 =?us-ascii?Q?MBwvBten3Hx2yD09J/izeeuAuuxwnKT/kWuK6LJJ4HJifQeEoV1INVZCr1Lj?=
 =?us-ascii?Q?re0HhSq0T5vjTKd1iJdzsHewwPfLlMmLRiQFKfK1zllAxUY1tLzbY56iEkBT?=
 =?us-ascii?Q?5WkMttm4GTUGI+TDTf100UtVDAg6mOq/JEvzNv7BtJFlGJMC9WsZoz5tzF/V?=
 =?us-ascii?Q?09vJPdjSZhwuFBJK+riLCZ4R8ScHebRofbxogyf+iAhl9T4Kny1LXchfTtQa?=
 =?us-ascii?Q?GEsBUCMJY9n9si6sq5V8MMYRp+u3BoZKlI832KRI3fOsNzxF8oBNKgTLLyuA?=
 =?us-ascii?Q?ulCsTj5AiG+atUYn4nfVf50C54rf0ZbaAYefvvuIBeehyl6lBUKp7Jqs04iF?=
 =?us-ascii?Q?YNUYF1UP5OcbrTorMvdRCviUeVbhi+dEGQZ9cShwZmI/e4dN+l3pekUgvLbm?=
 =?us-ascii?Q?TcbxMG7sa/GRNd7kbtD27Dn6J3lxU7DRoB/7pN2w9BtiYjxdl0eEprhckCMl?=
 =?us-ascii?Q?sfkD1BoNtPb1ezd9GRiQalWTKcois6PXr0aMz6cAxnLMSmxSAV1IPO7sAH6a?=
 =?us-ascii?Q?OQWW2/BM5vEAyB+aRjditWsUqO+10lTwX4+uVcjHOBRbND9IU9EQlMWsB8hf?=
 =?us-ascii?Q?OmNm8cvwfXLpAawYptBXVl+3HCz0XOizpXK00ZSohntjiOjeKokcGvFPpToS?=
 =?us-ascii?Q?y5IUgZyLl/xiU+1VM8CYP9DyUXv9e7ye1kSVHf1f+MiKDt7V7S5r+pU3/TPe?=
 =?us-ascii?Q?Z6k/vmJISAX3zcPVE/oJAxqn4NL7iKtZwxByI/s+5cCtAXO+le5mvlfDf8cK?=
 =?us-ascii?Q?OH2GB0uKoqRnME3hUKG3nOoUzG6RdVFEYRf1CNQ5mjhRPV2br3gV3cwXa1QU?=
 =?us-ascii?Q?ZcJNX5emJ9Qt3e/Rsncj9eXetIqwtWIQWUILSB+x90EAcIbbe3Lxc4r0Kg7V?=
 =?us-ascii?Q?07HM1BCSVtESky62sz56+FAtjBrn2sbYqBtHNaWQuYXnOpcZVorDMX5tUnOl?=
 =?us-ascii?Q?DF+flqqz/eNGsmIfmwiag2pXGmjCIoztN6Rhd5hCV7TrWqOnBeASpKnyRezx?=
 =?us-ascii?Q?+80Kv0J0jitEpSFYPRhAmWVq/VquezjnmRGDdi/C4qJ7ktsVyyyjxoBznoxc?=
 =?us-ascii?Q?HGWmLY93GVIZSfCi6TDHPXIP0vcJB/lB2Dpo5/C6FohCR0cf6vcxZuIVxUwk?=
 =?us-ascii?Q?yXJGL24NpPnDNFNrfl4BIpiL8cABqlWJ/45nJyjtNaQhzlwJUuJ0VdoWsv8p?=
 =?us-ascii?Q?/AaLmiCh+c1rWYPOytYdfX1Bpuqvlz1gOxwt37Q+tLZQEKZ2uN4+fX0okZjt?=
 =?us-ascii?Q?Dak+3A0pkLAyl3Kw9ajubz3Z7bdZC3sufnfRLTB9rrNOfLo9BYvBBQDuXA+U?=
 =?us-ascii?Q?PgmP6+ei6CRcbFgFAylFXSvRT5r3bY7l?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 00:40:14.5394
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f725fc1a-6764-491a-625b-08dcd38ca1f5
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM1PEPF000252DE.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR02MB11014
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Sep 2024 00:40:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112258

paho-mqtt-cpp is built with the vendored version of paho-mqtt-c since
commit d4f8a3074307982a45eea9551060424835e1cfde.

This avoids the following error when building an application that
depends on paho-mqtt-cpp:

  ERROR: foobar-1.2.3-r0 do_prepare_recipe_sysroot: The file
  /usr/lib/libpaho-mqtt3as.so.1.3.13 is installed by both paho-mqtt-cpp
  and paho-mqtt-c, aborting

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.4.1.bb   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.4.1=
.bb b/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.4.1.bb
index d2fbc3a34c..f0ad76762b 100644
--- a/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.4.1.bb
+++ b/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.4.1.bb
@@ -16,7 +16,7 @@ SRC_URI =3D "gitsm://github.com/eclipse/paho.mqtt.cpp;pro=
tocol=3Dhttps;branch=3Dv1.4.x
 SRCREV =3D "ac1b023eab789e829656144f12b248602c40e37b"
 PV .=3D "+git"
=20
-DEPENDS =3D "openssl paho-mqtt-c"
+DEPENDS =3D "openssl"
=20
 S =3D "${WORKDIR}/git"
=20

