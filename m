Return-Path: <Nandipati.AnuDeepthika@philips.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D75BC433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Mar 2022 14:19:02 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.114])
 by mx.groups.io with SMTP id smtpd.web10.11422.1648477140917221341
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Mar 2022 07:19:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@philips.onmicrosoft.com
 header.s=selector2-philips-onmicrosoft-com header.b=YILtmSPg;
 spf=pass (domain: code1.emi.philips.com, ip: 40.107.20.114,
 mailfrom: anudeepthika@code1.emi.philips.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gIz+mEGoM6Zdq8FleezlZTmeppxCCSZU92R4LHEVkUrBMLk3IRCbWwSl321pypnvfZ2CiPXsjfEmZVgOJT/9TtDLVr2W8YPeN00Avj/HrY3VUjWD/Qw+zBYF13HCd5bKFQwckekhMFnIqw1HBoaZFkxinoMsglFH3JtXDsu+mGvdqVxm11rXwvHYXbL9INFax96a1ldI/pJCuB1CQ+3bCJsUkIU1ATKDtFerzixZsyIoJ2twMnDv45gS0gyZkARFffjT834n/fBCQTbP2BwWoOK82Q0cS0vyJndP4ncWAKaRqRgvjovjAIQv5NFa8e/Cl+BFbIOFQvD467dc7KHgvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BxQlITDxaCKh+HFi0CMJ8WvTgr2tzxyFAwjewNPr0Ek=;
 b=fybZtgEOZLE3Hv3Qdk8JGFVngvK9HtlPb2WdpBV6q5aa1fLqeZnQgQkQI01t8Q5P7M+B5S+6v4s/AJERRqSfrUqkfJNI2C3DGvTlv5D/PbiApxHW72GDY6vkOjLzIe2ruAB1k/1CiBNitwvYkncf4HBb3LUHdJeNw+w9xjJCLq2D3MdAbpyTLDF7m/KUEqklae1PLxthQ9c/6cx03QAObDXQ+4r6d+70Lim1TwyV5O0sb8u7vRA+3AFSMyqLb5vaHiEA34/5ujIaDN0q2iAnLvgo2iRNFQuL7RLqfvNUgLJYu0RYItAS9UrQBV3pJQSYKILdA4imwz2HkR/iSCYw9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 18.136.170.117) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=code1.emi.philips.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=code1.emi.philips.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Philips.onmicrosoft.com; s=selector2-Philips-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BxQlITDxaCKh+HFi0CMJ8WvTgr2tzxyFAwjewNPr0Ek=;
 b=YILtmSPgD7Smvswm+Lsy4AvYmW0HQur9hiiVT9KXhvrMPL59is3EuZkTIpd88zc9xFoAgENW07RCd7ECNf0rlFA9XQPnAGi+2+9UrZDGuKVebHjMmTR4YKuHc+CmCHWRak6TGGT48urbMD2ryZ2Oa3JB0Hd1l6+a07reIGx4UCc=
Received: from AM5PR0201CA0002.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::12) by AM0P122MB0147.EURP122.PROD.OUTLOOK.COM
 (2603:10a6:208:14c::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.22; Mon, 28 Mar
 2022 14:18:57 +0000
Received: from VE1EUR01FT004.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:203:3d:cafe::1f) by AM5PR0201CA0002.outlook.office365.com
 (2603:10a6:203:3d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.18 via Frontend
 Transport; Mon, 28 Mar 2022 14:18:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 18.136.170.117)
 smtp.mailfrom=code1.emi.philips.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=code1.emi.philips.com;
Received-SPF: Pass (protection.outlook.com: domain of code1.emi.philips.com
 designates 18.136.170.117 as permitted sender)
 receiver=protection.outlook.com; client-ip=18.136.170.117;
 helo=ext-asp1.smtp.philips.com;
Received: from ext-asp1.smtp.philips.com (18.136.170.117) by
 VE1EUR01FT004.mail.protection.outlook.com (10.152.2.101) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5102.17 via Frontend Transport; Mon, 28 Mar 2022 14:18:56 +0000
Received: from smtprelay-asp1.philips.com ([161.92.84.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 256/256 bits)
	(Client did not present a certificate)
	by ext-asp1.smtp.philips.com with ESMTP
	id YpfXn2K74jUOjYpzBnrLKd; Mon, 28 Mar 2022 14:04:45 +0000
Received: from INGBTCPIC6LX130.in-101.lan.philips.com ([161.85.104.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 256/256 bits)
	(Client did not present a certificate)
	by smtprelay-asp1.philips.com with ESMTPA
	id YqCpnZKVgJwPtYqCtnJ3rA; Mon, 28 Mar 2022 14:18:56 +0000
X-CLAM-Verdict: legit
X-CLAM-Score: ??
X-CLAM-Description: ??
From: Anu Deepthika <anudeepthika@code1.emi.philips.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] usbguard: package simplification
Date: Tue, 29 Mar 2022 01:18:27 +0530
Message-ID: <20220328194827.317689-1-anudeepthika@code1.emi.philips.com>
X-Mailer: git-send-email 2.25.1
Reply-To: Nandipati.AnuDeepthika@philips.com
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 34ee409e-def5-4bb4-2a05-08da10c5e56f
X-MS-TrafficTypeDiagnostic: AM0P122MB0147:EE_
X-Microsoft-Antispam-PRVS: 
	<AM0P122MB0147478F9D468EE5D89B7ED68E1D9@AM0P122MB0147.EURP122.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/oZtsNyYHWXw90Nj9s7K5bxXyBBuUD1Z4FS4c6RNirfNWWCOrceNagPrHgoPJ87ZlgpItXcuxb/jYyGWU5LOIwnK7ARtTirnIlkTbTr9+EfAiswuCU8jVjwOVWtl0TlXlseT1g2iTUYJl+XicPkNy0u3KE2TjHHeZOnLO8GBkAh4nsDfLSZQVQZd4gzTGFIbHtQW/qxWssw2xZcWoNENRr0bYAsWYvoGbWYVYFAqCZU9miOER5sKdsQ7HW7nY5j9/FXGcfOjiPXk83pH6kbAAGpScTJcQWOQ7tE/v+ZCDblcXBIqdbaJQPRwfo1ts9HXMdjOyNwj0wkdeJiFjkpaoHGUhwViIAL8nMUD66ZDDOxOEN5Me1zo8edbY7WXJREhl+NduFPuIMjgQDImn+4IhymV3SuXnb/G6Su247yMZKq79TwxShiqwP5tN1/4l8RAEOnFoyBm3w2FVmGTO1TUlVLcb+HQKUvtqxdXPZuETDzat6V98SZPVbp4x3w46dDkDbLYKeQnTqWU2gm02dyDDKF6/TNhpD3PDZSWa/ZvnquCDIEYpv2k/SWOBxFkN41IZ9lXH824NC8ANZjojIhQqjuXP17kjEko3VLXvkfwHwsSepJZpyr1/s8oWK/hhxZ5dtbWl2QUJnXV/hUCUxcECXdFdXJ3Qa+1tK1wnPYnyXqsNTJsVPIIT+nYNW6cAWmu
X-Forefront-Antispam-Report: 
	CIP:18.136.170.117;CTRY:SG;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:ext-asp1.smtp.philips.com;PTR:ec2-18-136-170-117.ap-southeast-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(81166007)(336012)(36860700001)(83380400001)(1076003)(186003)(508600001)(8936002)(47076005)(6916009)(26005)(6666004)(316002)(40460700003)(8676002)(70586007)(70206006)(956004)(2616005)(356005)(5660300002)(2906002)(82310400004)(82960400001)(86362001);DIR:OUT;SFP:1102;
X-OriginatorOrg: code1.emi.philips.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2022 14:18:56.5279
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 34ee409e-def5-4bb4-2a05-08da10c5e56f
X-MS-Exchange-CrossTenant-Id: 1a407a2d-7675-4d17-8692-b3ac285306e4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=1a407a2d-7675-4d17-8692-b3ac285306e4;Ip=[18.136.170.117];Helo=[ext-asp1.smtp.philips.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR01FT004.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P122MB0147
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Mar 2022 14:19:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96245

From: "Anu Deepthika, Nandipati" <Nandipati.AnuDeepthika@philips.com>

---
 meta-oe/recipes-security/usbguard/usbguard_1.1.1.bb | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/meta-oe/recipes-security/usbguard/usbguard_1.1.1.bb b/meta-oe/=
recipes-security/usbguard/usbguard_1.1.1.bb
index 4ecaa4e6b..8df78ec81 100644
--- a/meta-oe/recipes-security/usbguard/usbguard_1.1.1.bb
+++ b/meta-oe/recipes-security/usbguard/usbguard_1.1.1.bb
@@ -44,19 +44,12 @@ PACKAGECONFIG[systemd] =3D "--enable-systemd,--disable-=
systemd,systemd"
=20
 SYSTEMD_PACKAGES =3D "${PN}"
=20
-SYSTEMD_SERVICE:${PN} =3D "usbguard.service"
-
-SYSTEMD_PACKAGES +=3D "${@bb.utils.contains('PACKAGECONFIG', 'dbus', '${PN=
}-dbus', '', d)}"
-
-SYSTEMD_SERVICE:${PN}-dbus =3D "usbguard-dbus.service"
-
-PACKAGES =3D+ "${PN}-dbus"
+SYSTEMD_SERVICE:${PN} =3D "usbguard.service ${@bb.utils.contains('PACKAGEC=
ONFIG', 'dbus', 'usbguard-dbus.service', '', d)}"
=20
 FILES:${PN} +=3D "\
     ${systemd_unitdir}/system/usbguard.service \
     ${systemd_unitdir}/system/usbguard-dbus.service \
     ${datadir}/polkit-1 \
-    ${datadir}/polkit-1/actions \
     ${datadir}/dbus-1 \
     ${nonarch_libdir}/tmpfiles.d \
 "
--=20
2.25.1


