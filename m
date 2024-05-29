Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A3F3C25B75
	for <webhook@archiver.kernel.org>; Wed, 29 May 2024 23:14:06 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.86])
 by mx.groups.io with SMTP id smtpd.web11.3448.1717024438621852623
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 May 2024 16:13:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=aJXFGBoc;
 spf=pass (domain: axis.com, ip: 40.107.7.86, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a4VkMulHLlJqZXv+siRLWl2ufE+YsPaPyVyVeCs2XzwqwuRxmvSH5/ANtnmb8uJltCURBpBEit7DZBP8bFwqtHNVJl5/0ghn3iQ+k6jmRyEcebvbl5O2rWMgAK/U/QVvrUWb1QadHcdjRrqXZHAo4xLW6ft8jm+Q+NrUvoktt31nMuia2cq1RsVPtLz5/7Yo7sTxiJgJwrGilI7ox6BYm1WfZGu8wTTHxMC60iYYTkqzJiZfBMdrphg1EVlHR8ryxO2qnqBph/fBA9H/Be+0SK7qwvPO8NHaD/x771fF+46q7Rn3sUGxby7vUcI35bUDXQ69xVXnEjEavN5lNfIIcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wD+AJa3DL2WBzC+WvWNuwND0QzP7XJ1EyZUAPti/EzY=;
 b=k/ddUlTa4AhU+GFLGN9MOuWS/Z6+pLAcLWYMZwbcnAKPIUg1/v5LrZuNMub73/HANaWggJw+fmb8fZ5aBYgBIHlFzlWIEfRtch6sZgymLoOZJ8FImAnCK9c7vXatjBQJf/9LT9EoUTRq8qHc0577hp2LFC830Pe7VE1q00G6bkV4Cvc9/vnZN1qgebiMXpWCm0sL3LtjAGslzAU888iK3g+01VZraGmkMu0bLL7/nsjncU8POsn8jLTQ9MpW7MwPJ8L6hkV6E2N/IseHiGwk8DFovICpSyvVFG2O64yATPcvv2woVjonpgjXBCjqXdItjSaUkTNIqXvItVNozHGpbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wD+AJa3DL2WBzC+WvWNuwND0QzP7XJ1EyZUAPti/EzY=;
 b=aJXFGBocW+JFo5F/fe9W0mpFRObNqI6Ly27m4kIsNz3B95JeYMFaY5OGHAB8mEXjA9n/J3D0TWdpAcJZAlBA6kyVK3BK0pliJMFgYBZ2crJhXm83Fr2CowilUE3XA316JWd8LgvUYMK1vrHyEMwaU5A5IzMS+5Qs8FbPJBEomwU=
Received: from DU7PR01CA0041.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::6) by DBAPR02MB6152.eurprd02.prod.outlook.com
 (2603:10a6:10:18b::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.19; Wed, 29 May
 2024 23:13:54 +0000
Received: from DB1PEPF000509F9.eurprd02.prod.outlook.com
 (2603:10a6:10:50e:cafe::50) by DU7PR01CA0041.outlook.office365.com
 (2603:10a6:10:50e::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21 via Frontend
 Transport; Wed, 29 May 2024 23:13:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509F9.mail.protection.outlook.com (10.167.242.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7633.15 via Frontend Transport; Wed, 29 May 2024 23:13:53 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 30 May
 2024 01:13:52 +0200
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 30 May 2024 01:13:52 +0200
Received: from saur.se.axis.com (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id CA9C41DFF
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 May 2024 01:13:52 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur.se.axis.com (8.17.1/8.15.2) with ESMTPS id 44TNDqiN2413902
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 May 2024 01:13:52 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 44TNDqj62413901
	for openembedded-devel@lists.openembedded.org; Thu, 30 May 2024 01:13:52 +0200
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 1/3] hostapd: Support running "devtool modify hostapd"
Date: Thu, 30 May 2024 01:13:47 +0200
Message-ID: <20240529231349.2413885-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F9:EE_|DBAPR02MB6152:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d74432e-87a5-4843-4b43-08dc803501fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|82310400017|36860700004|376005|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?4/nhMaICIrp5idocNvP47QXWIAvJ6Zis/pBQwNEQMM48pFKz9eCi8NJDbWmy?=
 =?us-ascii?Q?JyVc27vWHyEpMnaOrOgxJk8tCgBwyoWr0B4vIn24iBazilbiFhpKenvlXLdZ?=
 =?us-ascii?Q?K3TzVlzO3xNgjL5Fu/fGBYLR6edJermNDMJsulIfgRWbQHLh4PHf3GuUtd7t?=
 =?us-ascii?Q?Ew5WKuZ2Lw3314rCJa+DNVpOXjg8qqjaMwH1ieZ9UnByDZqztidAFAnjs/oE?=
 =?us-ascii?Q?ADbynjRpeBVYKHddn7IdJgs+IOgMtxlw5bkdN6JZ603+0L/2EYdYBNLzMVUt?=
 =?us-ascii?Q?iia83y/+ckVr2Adc3xux9ZQBY61M6iN6N9mxi7hA1z227Q++WuEFJH9mu0iQ?=
 =?us-ascii?Q?YHMYs//Tw2CG151nUNOTJRaTS2MsxBFjTL0ATHpSgj/RyIRjtzyAXs3geoEQ?=
 =?us-ascii?Q?UkBWrSXInm2HYgwonCrP4GjXOrNVuC62yAPkPjSyJTQmL4KMr/jhmGfGUgF5?=
 =?us-ascii?Q?SbtUN/G/f2zKUqpxtefRVb1mlUowa1KUSng0SEuDtPZHU+clcOG1q9cwDmTB?=
 =?us-ascii?Q?bA1+j+WK1pIZj++8D+crP/mG0pXClHC3D6T37NL/ezdTEwOO1H58/5QrDkr0?=
 =?us-ascii?Q?2Jg2w2nIbXB8J6dz215E1c4fL2fLsMThN3n2BbIcDbw/1kE83IWcYKSFuISF?=
 =?us-ascii?Q?mnVxp36fJfY2zPp23+IMMjX+rzMHqdpQdrqg3d2Nwcy5b6fdPs2rJzTWJZtr?=
 =?us-ascii?Q?UXt8btIvANsRIFgFQSF5gZJl2HNwFslslR6RV0gHQ21k7RlU6pLXXK+wH5j4?=
 =?us-ascii?Q?MKzBtLG/kc0q+BVzEboKBQh+O+ECbqjyne3wbzjhib68vaLgGRnsiKYuf+o/?=
 =?us-ascii?Q?Ttp7UMfBrjSxv5v37UmERtDnLOWElkP6rh66gt6sQiFFc1Kj+1A+jmyfrEp0?=
 =?us-ascii?Q?q40tcgFdqTTvAvYwowVCxh0a5QgZIgXgD0JDdezVT0DAbLelFdWysn5uafHK?=
 =?us-ascii?Q?zQBFGW9QXiBXQvSAhBn1oavawXVdDi/9/zMHGTTXB24ft+67Ck3H/KhHsN1q?=
 =?us-ascii?Q?FuQRtOiXHn461v5zENeiWxOfYaH6Vac876IKBzxFVNdgEDJ6MJF3zZ777ZQF?=
 =?us-ascii?Q?uA63gnXLnr+YB/wIbSUbu7X6Oxiv9y5/fnZRigIwFiBzdHtrTa72GnkhagZA?=
 =?us-ascii?Q?Y4yVzSEBewWy1q1M0b88azDEl8l1fzutrUFXhjGPrmkcQ5bINSUH+Qx/wVHK?=
 =?us-ascii?Q?0l268NJgRJxHoHsnPmbIwXL9cx8pJLYgFKIg/LppQZAjiOqJgZ/PasykVjS4?=
 =?us-ascii?Q?mX1k9/gTy9Fm2IVmAgOOhzIXLEpGG14YQDPtV4tWZWjdUWAcJ03Koa+xf2mx?=
 =?us-ascii?Q?KtpiLuYUfUa3nWQ4UloasH6S369MHgRh3k3/6jIeryhi1m25xQFxbYtQWhzs?=
 =?us-ascii?Q?kY//wekp4SZA9Jaz2e9lrOwMz04A?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400017)(36860700004)(376005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2024 23:13:53.3985
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d74432e-87a5-4843-4b43-08dc803501fd
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509F9.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR02MB6152
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 May 2024 23:14:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110619

For "devtool modify" to work correctly, ${B} needs to match ${S}.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../recipes-connectivity/hostapd/hostapd_2.10.bb    | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd_2.10.bb b/meta-oe=
/recipes-connectivity/hostapd/hostapd_2.10.bb
index e547462bb..6eca853e4 100644
--- a/meta-oe/recipes-connectivity/hostapd/hostapd_2.10.bb
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd_2.10.bb
@@ -16,9 +16,6 @@ SRC_URI =3D " \
=20
 SRC_URI[sha256sum] =3D "206e7c799b678572c2e3d12030238784bc4a9f82323b0156b4=
c9466f1498915d"
=20
-S =3D "${WORKDIR}/hostapd-${PV}"
-B =3D "${WORKDIR}/hostapd-${PV}/hostapd"
-
 inherit update-rc.d systemd pkgconfig features_check
=20
 CONFLICT_DISTRO_FEATURES =3D "openssl-no-weak-ciphers"
@@ -29,20 +26,20 @@ SYSTEMD_SERVICE:${PN} =3D "hostapd.service"
 SYSTEMD_AUTO_ENABLE:${PN} =3D "disable"
=20
 do_configure:append() {
-    install -m 0644 ${UNPACKDIR}/defconfig ${B}/.config
+    install -m 0644 ${UNPACKDIR}/defconfig ${B}/hostapd/.config
 }
=20
 do_compile() {
     export CFLAGS=3D"-MMD -O2 -Wall -g"
     export EXTRA_CFLAGS=3D"${CFLAGS}"
-    make V=3D1
+    make -C hostapd V=3D1
 }
=20
 do_install() {
     install -d ${D}${sbindir} ${D}${sysconfdir}/init.d ${D}${systemd_unitd=
ir}/system/
-    install -m 0644 ${B}/hostapd.conf ${D}${sysconfdir}
-    install -m 0755 ${B}/hostapd ${D}${sbindir}
-    install -m 0755 ${B}/hostapd_cli ${D}${sbindir}
+    install -m 0644 ${B}/hostapd/hostapd.conf ${D}${sysconfdir}
+    install -m 0755 ${B}/hostapd/hostapd ${D}${sbindir}
+    install -m 0755 ${B}/hostapd/hostapd_cli ${D}${sbindir}
     install -m 755 ${UNPACKDIR}/init ${D}${sysconfdir}/init.d/hostapd
     install -m 0644 ${UNPACKDIR}/hostapd.service ${D}${systemd_unitdir}/sy=
stem/
     sed -i -e 's,@SBINDIR@,${sbindir},g' -e 's,@SYSCONFDIR@,${sysconfdir},=
g' ${D}${systemd_unitdir}/system/hostapd.service

