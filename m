Return-Path: <harshaldhruvkumar.gohel@philips.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DB11C433EF
	for <webhook@archiver.kernel.org>; Thu, 16 Jun 2022 11:22:23 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.104])
 by mx.groups.io with SMTP id smtpd.web11.16527.1655378534936463830
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Jun 2022 04:22:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@philips.onmicrosoft.com
 header.s=selector2-philips-onmicrosoft-com header.b=WtB8Z8KH;
 spf=pass (domain: code1.emi.philips.com, ip: 40.107.8.104,
 mailfrom: harshalgohel@code1.emi.philips.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TuEP++NQI98NUHqd/fjVmg0Pi2KpzZe5ijXjZUISvbaw7u+SDl9b1ED+2SiH4ywMG8ZfgfSszxmCetmTyxzeOFQbd0xRxsPN34K1bO1P7S1f9h3Of5t3J7AwmPsAGZpwbvEzm4uBNSraDnYfnymSmkYpUsSutT9Sn2OZthgt1mSxk+01V5hJMQZGzG9OFroSeX7DcdoJK64luJ/OGABj61Ui1X0pj4sbKIwF9B0xKMxL3YM0sqkYalk+k6lYSqQPClXriJDBqnV4M1CPNMk9BF4XqgvgKsiZKMbXTQZWJYN4Tw1kpogjmW5qEIry3dEqjcokRkXWUIZ6PLev4ujPAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=geHotLVTO5VC+SDYl1S2e/sV3sXMOnpNHiUvD2pjfXQ=;
 b=Gt6f9owYNbryoBD3a//yKqQUEoZZ6SnEjmztMEB87YnOGq6wk6C7KeIZjUEL15yBBdyBT4erImxtzDNjPfkHnAJN5uZzfbbBKrDW3vu4iWrr2rCjoVxZsS0eqG2kf2gz/KJgMVf4lUWepeOZMT46ia2IjwEnBadNJIhjgm6zKw/xKJeNg9YmgiexagbWbQZLocobnswo8tAVvmL8YbCfr2KJrEywdgfe06t8lRX+t+M0xH01yfh5hDMMsx8JlFWPK2wNjNQlKOYvnNqhntzEwxxGwv2iWn3Jb1EdMLB9ZA3JhfWSuq9Ms6j/BAWlvmE4ogrJOOPS7tcEH25+/YsZzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 18.136.170.117) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=code1.emi.philips.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=code1.emi.philips.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Philips.onmicrosoft.com; s=selector2-Philips-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=geHotLVTO5VC+SDYl1S2e/sV3sXMOnpNHiUvD2pjfXQ=;
 b=WtB8Z8KH+2KOkuPUdUhtzxwgGFtmEBloUpccfproxcWdmGVnc7BBIFmAHWksPjPFAMQ6mY0Dng+dxHlVkrR+zsDkpcWbwWIjhxv8Sv1fulYP9FQ3mUi0uUZH+Qgl3C+UusMybssSNCRUHNVlGnsvUHoYDcuy8XBfbU64SpStiCk=
Received: from AS8PR04CA0150.eurprd04.prod.outlook.com (2603:10a6:20b:127::35)
 by VI1P122MB0206.EURP122.PROD.OUTLOOK.COM (2603:10a6:800:175::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.23; Thu, 16 Jun
 2022 11:22:11 +0000
Received: from VE1EUR01FT010.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:20b:127:cafe::79) by AS8PR04CA0150.outlook.office365.com
 (2603:10a6:20b:127::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15 via Frontend
 Transport; Thu, 16 Jun 2022 11:22:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 18.136.170.117)
 smtp.mailfrom=code1.emi.philips.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=code1.emi.philips.com;
Received-SPF: Pass (protection.outlook.com: domain of code1.emi.philips.com
 designates 18.136.170.117 as permitted sender)
 receiver=protection.outlook.com; client-ip=18.136.170.117;
 helo=ext-asp1.smtp.philips.com; pr=C
Received: from ext-asp1.smtp.philips.com (18.136.170.117) by
 VE1EUR01FT010.mail.protection.outlook.com (10.152.2.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5353.14 via Frontend Transport; Thu, 16 Jun 2022 11:22:09 +0000
Received: from smtprelay-asp1.philips.com ([161.92.84.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 256/256 bits)
	(Client did not present a certificate)
	by ext-asp1.smtp.philips.com with ESMTP
	id 1nEUo4oQNetwt1nLDo7ykG; Thu, 16 Jun 2022 11:07:11 +0000
Received: from INGBTCPIC6LX258.in-101.lan.philips.com ([161.85.103.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 256/256 bits)
	(Client did not present a certificate)
	by smtprelay-asp1.philips.com with ESMTPA
	id 1nZZoU31AmOTE1nZhobEJZ; Thu, 16 Jun 2022 11:22:09 +0000
X-CLAM-Verdict: legit
X-CLAM-Score: ??
X-CLAM-Description: ??
From: Harshal Gohel <harshalgohel@code1.emi.philips.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] lldpd: upgrade 1.0.8 -> 1.0.14
Date: Fri, 17 Jun 2022 00:54:44 +0530
Message-ID: <20220616192444.257694-1-harshalgohel@code1.emi.philips.com>
X-Mailer: git-send-email 2.25.1
Reply-To: harshaldhruvkumar.gohel@philips.com
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c0a6c1b8-13a0-4fc6-6dd0-08da4f8a747e
X-MS-TrafficTypeDiagnostic: VI1P122MB0206:EE_
X-Microsoft-Antispam-PRVS: 
	<VI1P122MB02066CED072448823D9CE29F9BAC9@VI1P122MB0206.EURP122.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UelIqUfyCnDW7kEB7erueIP4DO9IKfeyvXSD5zv2Mx9YLtubov8Xa03RG/PFTbKzQ2Q9Lyh7nMSmMp5uLKwH4/qPSDUCjaTLoxhiYpAdMaqEA2zWFu2v0kov5/EBBQgwu3EQbnOLTk449Czl0rDT5nt30oNsz3NsFmBzaQ5iQ8C8XPMv4BIC+KHS8wLscw3+jvMlVFHBY1Uq19CkpJVPcoIwoPP8klCLlxxD059XkJUuI4oymj1cT12M257PVskDum0cdiRnEFrnikg/GuI7A9LJAQwHDo507sLx2qW7WOWKfdEPHqoyR2BeXe+/QgRr7aFcEzevCw3Fc5VV2mCu7O6qXf6el6y0MkOFmkVoTAgxWZmL1yF3JnFGZ/Gc1VsNsBkgPrj6kCDsnWQNKcPUnCfqmZjpt+IZvAai1jeYb1TQyFtMQ4ojrp14HRKcU3hFtxbIXS73f6vNRWbonyAbqadc9NPEoIWxV3GxmfB1RjY8awkLeWtf2yPzO3k2cS5QzAy/58cQ8t0Hdmj9aj36m7olH/rWIFFsoq4CwEWIG4zZiBZrNhAY7yczPwtveisj8Tq9BoaxHl68guWxAzmTwPG9f7Me/I5k4Lm9wkSIL7JMQi8t3uRoQs+9kYfor1N57e6noDJ3zous7mXwd7ux10dYQVQlchFFOV+wH2zbTalrznDhMVPs1c9O72Q1ePKe
X-Forefront-Antispam-Report: 
	CIP:18.136.170.117;CTRY:SG;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:ext-asp1.smtp.philips.com;PTR:ec2-18-136-170-117.ap-southeast-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(46966006)(36840700001)(40470700004)(356005)(82960400001)(47076005)(86362001)(336012)(26005)(36860700001)(81166007)(83380400001)(2616005)(1076003)(186003)(956004)(40460700003)(70586007)(70206006)(316002)(6916009)(8676002)(2906002)(5660300002)(8936002)(508600001)(6666004)(82310400005);DIR:OUT;SFP:1102;
X-OriginatorOrg: code1.emi.philips.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2022 11:22:09.9870
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c0a6c1b8-13a0-4fc6-6dd0-08da4f8a747e
X-MS-Exchange-CrossTenant-Id: 1a407a2d-7675-4d17-8692-b3ac285306e4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=1a407a2d-7675-4d17-8692-b3ac285306e4;Ip=[18.136.170.117];Helo=[ext-asp1.smtp.philips.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR01FT010.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P122MB0206
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Jun 2022 11:22:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97521

From: Harshal <harshaldhruvkumar.gohel@philips.com>

---
 .../recipes-daemons/lldpd/{lldpd_1.0.8.bb =3D> lldpd_1.0.14.bb}  | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-networking/recipes-daemons/lldpd/{lldpd_1.0.8.bb =3D> lldpd_1.=
0.14.bb} (94%)

diff --git a/meta-networking/recipes-daemons/lldpd/lldpd_1.0.8.bb b/meta-ne=
tworking/recipes-daemons/lldpd/lldpd_1.0.14.bb
similarity index 94%
rename from meta-networking/recipes-daemons/lldpd/lldpd_1.0.8.bb
rename to meta-networking/recipes-daemons/lldpd/lldpd_1.0.14.bb
index cf2b156fe..eda0129fe 100644
--- a/meta-networking/recipes-daemons/lldpd/lldpd_1.0.8.bb
+++ b/meta-networking/recipes-daemons/lldpd/lldpd_1.0.14.bb
@@ -11,8 +11,7 @@ SRC_URI =3D "\
     file://lldpd.default \
     "
=20
-SRC_URI[md5sum] =3D "000042dbf5b445f750b5ba01ab25c8ba"
-SRC_URI[sha256sum] =3D "98d200e76e30f6262c4a4493148c1840827898329146a57a34=
f8f0f928ca3def"
+SRC_URI[sha256sum] =3D "a74819214f116a5dbc407a3d490caa01ba401a249517ac826a=
374059c12d12e8"
=20
 inherit autotools update-rc.d useradd systemd pkgconfig bash-completion
=20
--=20
2.25.1


