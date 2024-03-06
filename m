Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0C11C54E4A
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 16:27:52 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.44])
 by mx.groups.io with SMTP id smtpd.web11.16242.1709742465484235646
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Mar 2024 08:27:45 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=ERhijmR/;
 spf=pass (domain: axis.com, ip: 40.107.105.44, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=in0sJY5Ec4wbqacv0QYMQSuoMeQiUmsnxOgpsmsVk97OvK/fW5z0NnFgyproTCSDzFkjRXCpXdZH8SjOQxSeajZ4xMHcQ6HDxygBsdMPmMSB19XUcR1k6D3tFk1UJ73gq654tME3cuEIu7uiUi1s9urQc3z78qbI/5YMPMCKTmJ+vkXX23DRwZYKCYV6sj2Dfm5GEe7ZEE7FciFpHQi8xtojI5wYJ1JWCG43TJ0VMr7AKB4rumBI9vPi7gmZs9CGqxebeFXGYK82HOsVWJq3d1hlQZXvKCVme9i9r81RR/f+tucLSU4W5I8+kG5bn6taD967I+hNxIeF6TvBm2h1GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=syzw77dKI+Y92WSRixCNw1sWwa6PnO1GP5gR5eWLmec=;
 b=V7VAlPoev+zwYt6HTN9vLPlY5ZAZ9tno+f90fJiq2oYCZhLSsIWsw8KMyERxoCBqXudtw5ZAFwWkL5FqQRiBCvRnmP5DjPK7b1M9Z/qMkMQdOZE8yiYhuP8dxwjHaIazVrsoa9M+x/4uAWn3msl7CG0DOwdWVYqk2RwBDOcjmw1zvWGh7Mb4E0G79e5UAn2MaZO/LljVIYnzzw8q0/JEjK1my6SB2R/u0QR1Aop0bB73D8RNZcHj9TuecnWRUqvgBivL4Nb8cTpl0mToy4jlpWQRR5Gh2fjjaxSkcov5jQCQwS/v8YVNrwYTtkAPQMwVifO9ur3FUd11BjoKV/FmSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=syzw77dKI+Y92WSRixCNw1sWwa6PnO1GP5gR5eWLmec=;
 b=ERhijmR/PRV4DEbX2b+Cxjg8xpm0+QF61ju8hYfeyGV96IwvpfxWsDhpwFPkrTdSyjXNAUI3r6G2LInN1KqRhbgiRWF7pzgTb7ZYrPGYN3olvF8kquPZjKPkJLjrQZyY3kPwJSv4gz+tYkYzOBWW+vXz0dO3SjSbZCxztY3SmsA=
Received: from AS8PR07CA0046.eurprd07.prod.outlook.com (2603:10a6:20b:459::18)
 by AS1PR02MB7845.eurprd02.prod.outlook.com (2603:10a6:20b:4ad::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Wed, 6 Mar
 2024 16:27:41 +0000
Received: from AMS1EPF0000003F.eurprd04.prod.outlook.com
 (2603:10a6:20b:459:cafe::20) by AS8PR07CA0046.outlook.office365.com
 (2603:10a6:20b:459::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24 via Frontend
 Transport; Wed, 6 Mar 2024 16:27:40 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 AMS1EPF0000003F.mail.protection.outlook.com (10.167.16.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7362.11 via Frontend Transport; Wed, 6 Mar 2024 16:27:40 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 6 Mar
 2024 17:27:39 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 6 Mar 2024 17:27:39 +0100
Received: from saur.se.axis.com (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id B19F315C1F
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:27:39 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur.se.axis.com (8.17.1/8.15.2) with ESMTPS id 426GRdEv1722418
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 6 Mar 2024 17:27:39 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 426GRdue1722416
	for openembedded-devel@lists.openembedded.org; Wed, 6 Mar 2024 17:27:39 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 1/2] abseil-cpp: A little clean-up
Date: Wed, 6 Mar 2024 17:27:36 +0100
Message-ID: <20240306162737.1722284-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF0000003F:EE_|AS1PR02MB7845:EE_
X-MS-Office365-Filtering-Correlation-Id: 81beeebf-8a7b-4ebd-da51-08dc3dfa57a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	npu8nDKSrhR0gmD6uiGwkcJEBuMyVHfH8YWlLfpaT7f85Aj/wMcpT9Ymd8cbzD0wE/HXj9od7OsBdKe5kkIIBvUNQyPqqZOvJzlVFoeXxaAq7az9cb0Z+WBXWpsSxn/BWc5iqfVrrp2MwRiWkWyk8n+ChWi7fUBHAWK8TIFkKxTiXPISGNgO1fcPLV6NPYTe6WPWwCCZ6zIsPUO6rMzSj3QaVXHmC254mjWxpiP9Cn6E+WnFBsCVfp8BUbjlx1ad5KPp2XDaokoCVLg87/4G/AIsg+tPxfhYlr7a7zNQxZe/jJXNrOlQ9nZAaGhhG7lvfR7DpUEpCyE3tKJqJeNkAWGBULmxQ1h/oR0Ip5PcJMWgHnWZb9/1yUsamox3CiyuvtFqZQy0DQjK8y74YOT7OcQ/yv3OugbHsGAQfahhDjxrj8kK1rTtHAI0f4f6hXlkjLNzcZWWIa75DE/SYLbSkSM7tRpT4e6R0f0+4AypFLJnSICsKCCzcJU5iNPjLGx7MlzpLYPIa7WhG4k/WZIi+HDdB+sf7BhrpxVitcNC37LYPEMF9TacbUCHHLIswX4piwA5NRNa0n0Dn7cM0GtnKjclVwuytDiAvv7z95/sEmp5YpcsTaBcFFQyjWft8P5QFPp5EvXuko6uxT4+6gAlje+9KVnP/xsgf3vEtRECf0emrcD0BgbS2ahuRIKmxoYKKhcSceiZOH4boSPCms2L9w==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(36860700004)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 16:27:40.1036
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81beeebf-8a7b-4ebd-da51-08dc3dfa57a7
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF0000003F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR02MB7845
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Mar 2024 16:27:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109170

* Remove ASNEEDED:class-native and ASNEEDED:class-nativesdk as they make
  no difference since ${ASNEEDED} is only added to TARGET_LDFLAGS.
* Remove additions to FILES:${PN}-dev since the added paths are already
  added by default.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../recipes-devtools/abseil-cpp/abseil-cpp_20230802.1.bb | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20230802.1.bb b=
/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20230802.1.bb
index 1ce6ff3fc..667693a4c 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20230802.1.bb
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20230802.1.bb
@@ -1,7 +1,7 @@
 SUMMARY =3D "Abseil is a cpp library like STL"
 DESCRIPTION =3D "Abseil provides pieces missing from the C++ standard. Con=
tains \
 additional useful libraries like algorithm, container, debugging, hash, me=
mory, \
-meta, numeric, strings, synchronization, time, types and utility"
+meta, numeric, strings, synchronization, time, types and utility."
 HOMEPAGE =3D "https://abseil.io/"
 SECTION =3D "libs"
 LICENSE =3D "Apache-2.0"
@@ -19,9 +19,6 @@ SRC_URI =3D "git://github.com/abseil/abseil-cpp;branch=3D=
${BRANCH};protocol=3Dhttps \
=20
 S =3D "${WORKDIR}/git"
=20
-ASNEEDED:class-native =3D ""
-ASNEEDED:class-nativesdk =3D ""
-
 inherit cmake
=20
 EXTRA_OECMAKE =3D "-DBUILD_SHARED_LIBS=3DON \
@@ -29,8 +26,6 @@ EXTRA_OECMAKE =3D "-DBUILD_SHARED_LIBS=3DON \
                  -DABSL_ENABLE_INSTALL=3DON \
                 "
=20
-BBCLASSEXTEND =3D "native nativesdk"
-
 SYSROOT_DIRS:append:class-nativesdk:mingw32 =3D " ${bindir}"
=20
-FILES:${PN}-dev +=3D "${includedir} ${libdir}/cmake ${libdir}/pkgconfig"
+BBCLASSEXTEND =3D "native nativesdk"

