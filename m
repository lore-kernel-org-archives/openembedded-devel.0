Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D0DBC41513
	for <webhook@archiver.kernel.org>; Wed, 29 May 2024 23:14:06 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.83])
 by mx.groups.io with SMTP id smtpd.web10.3313.1717024438620651111
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 May 2024 16:13:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=NYG4cZ8+;
 spf=pass (domain: axis.com, ip: 40.107.15.83, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XwtrnSTg4rHKC7fqobx1zRx9uOEilcAr8XhUWbjgUWgBv7iE1rfQ9jkGleeQ1U0+sVePzj6CjAqbR2g2BpqAe7/u0QZZOy2hUeSiqEpI4PaVRVxGod7SYPOAjrJubsxDkaeUFkXOYhv3cqI8+25sLZjMyRpf4rIPhwILH59jtIuNWD5HVvwCLX2Yh6yu9VqCGVyllmr1VRQk23fyewTrykrVtAGZsOSJZ5hUFj1yJ7v/W7+1+s6oxAEI1z6LEYjvrAfhl099zX0mGUAMJa931Eu86PivqYJGk6iRXZWoE0qSgKKQ34R0mIBFV3h1FQ2m4kVdyA2c0VK/cNrHs4Cvzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1OeAS1JfrwfNgQYyHX06H2ZLv/V4n2ZKoJrlOHxuuWM=;
 b=OB0K3IXxS36/DaJQVSWH9WkbvwjZdijF5tz2WUfwQwxBCewn/1k5hgAiS0gQnw8iF8hJlPyl9u4KFfpN2jEdLCK9HP2J/4Qkhfx1q11axsLwGUJ/JCYMxy+K4ee+bUa3R0XI9BfayPZvucpIHGBiAbXhsi5nb7axG6Kp6ke3P2dLSh0n+bRlowbxZr+Ivpin6B5IXXGtKi2t6T1LIgEHhjft+J/k9+5Ke+NzyFp9nj0Kjyb4tX/gr1SvC5qjUdRkgz+VtSQqaH/ZoDMQ46bWSPbbV79zFVzaLcVvG6RTicFN4HwNpjyZ9ZW54X5Fj/SUndp3hsI7WKK+gC/FU1upXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1OeAS1JfrwfNgQYyHX06H2ZLv/V4n2ZKoJrlOHxuuWM=;
 b=NYG4cZ8+8z4Vqb4Jb+X++z+ymxJ5zEnt0kaUZMi2CAORi2dkva7MNCIUe+/YngGEovxnCNY+0+P+8096yKQXIqafYHWgsqYK2td1eSCgffM+AwZ+k6tGuEwjD1ICs/7gv4LaMgatzq+mEGlQy+vPJMRStWCtcl+GDwCjn19yqkw=
Received: from DU7PR01CA0036.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::25) by PA1PR02MB11102.eurprd02.prod.outlook.com
 (2603:10a6:102:48d::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Wed, 29 May
 2024 23:13:55 +0000
Received: from DB1PEPF000509F9.eurprd02.prod.outlook.com
 (2603:10a6:10:50e:cafe::74) by DU7PR01CA0036.outlook.office365.com
 (2603:10a6:10:50e::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.17 via Frontend
 Transport; Wed, 29 May 2024 23:13:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509F9.mail.protection.outlook.com (10.167.242.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7633.15 via Frontend Transport; Wed, 29 May 2024 23:13:55 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 30 May
 2024 01:13:53 +0200
Received: from se-mail02w.axis.com (10.20.40.8) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 30 May
 2024 01:13:52 +0200
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 30 May 2024 01:13:52 +0200
Received: from saur.se.axis.com (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id EC1D5238D
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 May 2024 01:13:52 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur.se.axis.com (8.17.1/8.15.2) with ESMTPS id 44TNDqkc2413906
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 May 2024 01:13:52 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 44TNDqXb2413905
	for openembedded-devel@lists.openembedded.org; Thu, 30 May 2024 01:13:52 +0200
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 2/3] hostapd: Only include the relevant parts from README in LIC_FILES_CHKSUM
Date: Thu, 30 May 2024 01:13:48 +0200
Message-ID: <20240529231349.2413885-2-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240529231349.2413885-1-pkj@axis.com>
References: <20240529231349.2413885-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F9:EE_|PA1PR02MB11102:EE_
X-MS-Office365-Filtering-Correlation-Id: 01be0455-df00-4bc9-b4af-08dc8035030a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|1800799015|376005|36860700004|82310400017;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?KCcTgb6k3yVxxp9ZVG0ZkyDObAjenBcKSJT5t8zQg5AREZpDbhFQNaGW5Rri?=
 =?us-ascii?Q?Vy07RlTytuFNS2YVx/8TDTk9w88Lfn0ZKKcIZZg6I1v2q1z0GM1p0K4Dv7g4?=
 =?us-ascii?Q?hXN3sc/iP7cL7LlmKcnHuqyeFsI7wnVCbx5RsN+NRMUyy6H6r2ef9oFmYl8w?=
 =?us-ascii?Q?/0EE0GJMRTtDACjbMdRuyFwSP8Iu3KsVc41+nH+VR/SaZM2dCIyZjMUM8Vzf?=
 =?us-ascii?Q?QPzfc1ofcBeDb9EsvBQjWQUAHBkhkbivmneBpPRA+lRwBS8yxBGHFRcVW5rW?=
 =?us-ascii?Q?MEH2g6R9p1xA5VXyEE3/oKY5gddbj6UxYXCbk8oc5HoToSqri3YCp+kNHoXA?=
 =?us-ascii?Q?WtjTNyllpkxFTf17e0KGssOx045VoYD+vPnRTT62JepcQkZlZf6FfkNeu2J2?=
 =?us-ascii?Q?eP8iu4DuaairDxz8WV1/612nn79e1B+0OIBwrzMm3/VSydZR5Y81odP7ebI8?=
 =?us-ascii?Q?QvNn8mX1O2XLRMxyzi0zMpv7Ms9BB7SKAy3eODEqi6EMpDvlPLQ74RB1wLgo?=
 =?us-ascii?Q?m5dtCJ2jPPjd4aYiZeAOEoaqy4HV2cDeFQhWAmpGq4DBMHXzIS3PwfOy2Mdy?=
 =?us-ascii?Q?102GQ1FX+BpspEil+mKYdtGdLNXwVEOLePBfRAe6I/kN4OUNPqEgRlDYpCSm?=
 =?us-ascii?Q?VG9e7zVLGEDr5/Qw8WBnTtVDcvTOpdjxh6wwPzx3nR46UVcDvXHUjnLysExp?=
 =?us-ascii?Q?x5nAwrJWANSMes9z16GK2G2mtT6mk5rGMGDZ1Rt4khbhG1arfVzFGooOyC69?=
 =?us-ascii?Q?tXz9uRI2LNYW0efNX9d96NfNX4T6JmB990bvu6TGCjn+H4XtmOaOLTakJUf3?=
 =?us-ascii?Q?Dbe/XatlX/cLtw6HM2z0nQtUnE9ymYfJoYjjZIKCz1I6pNcTkg012LC0a6Ki?=
 =?us-ascii?Q?R7po/HcyDR58ohQATdaSxHiZ0LMZmHSTKD+OpRl9PnRJ91qT51z4xHKC1Dty?=
 =?us-ascii?Q?w7VXd/qMXyjMpoG1jiL1iQJcGbbWiKgrAHTnVCg6/ksZVwgJa5Fqzbe7qWOH?=
 =?us-ascii?Q?JdbIsCwn9SDqyJ4+oGaeUrs5y7Ov3xUvSTAivGjKhAxVMFeANn+4T9kphP6G?=
 =?us-ascii?Q?F70MlbmHt0m7ckLd/2TuT1xNppUwHAHmXNob3wptlcBpE17tEzngSJ1nXnnn?=
 =?us-ascii?Q?zZg2AU8LDU2eGqYTROybKqA9ylvT0JH83uRfcfEInPEEirJ6TE+Z78I/RmjN?=
 =?us-ascii?Q?jpUuE4eFnEvoyqzFkvHKfNF3QyrjSqzPw7b/qTJ6S9ny3FtqzHHz38pBnBiT?=
 =?us-ascii?Q?AkZOv9iPKOWoIT198PAnX7JqR8NTVpaz3yO9RWNKLCS0rSnstrSArwYDrAZ8?=
 =?us-ascii?Q?VvMPueri6QczEfur9tilX5SU?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(376005)(36860700004)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2024 23:13:55.1641
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01be0455-df00-4bc9-b4af-08dc8035030a
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509F9.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR02MB11102
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 May 2024 23:14:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110618

Only include the lines from the README that cover the copyright and the
license text.

License-Update: Only include the relevant parts of the README
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-oe/recipes-connectivity/hostapd/hostapd_2.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd_2.10.bb b/meta-oe=
/recipes-connectivity/hostapd/hostapd_2.10.bb
index 6eca853e4..44683bf73 100644
--- a/meta-oe/recipes-connectivity/hostapd/hostapd_2.10.bb
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd_2.10.bb
@@ -2,7 +2,7 @@ SUMMARY =3D "User space daemon for extended IEEE 802.11 man=
agement"
 HOMEPAGE =3D "http://w1.fi/hostapd/"
 SECTION =3D "kernel/userland"
 LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://hostapd/README;md5=3Dc905478466c90f1cefc0df98=
7c40e172"
+LIC_FILES_CHKSUM =3D "file://hostapd/README;beginline=3D5;endline=3D47;md5=
=3Daa03b8bd6216d1a7ca01fd4b89863073"
=20
 DEPENDS =3D "libnl openssl"
=20

