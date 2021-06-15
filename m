Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.62])
 by mx.groups.io with SMTP id smtpd.web11.11341.1623771682906954991
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Jun 2021 08:41:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@de.bosch.com header.s=selector1 header.b=OWkx3GN6;
 spf=pass (domain: de.bosch.com, ip: 40.107.21.62, mailfrom: mark.jonas@de.bosch.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xpa42/pW0SwoAm+7u0Xy9KEaU4hlaqz17XGnd12bNB4TEBtSFQUYFU1BJT9inqbSyixgSoLMaaa20WZqi7uRrKlekTdWUrd5MG63J3Js801QgA56zmJJiRFAhuUZGY6XcmW/eg2ZJppRkKRykWCFL9my6uki0RhUyfjqK/wXG0/Pj0/qOQ+5l8dVB8W0cGvk1GfBfT7j/JUwNHFmotU962Cbl+Futyxg6YlcEvsELHHeDm6I90fSHuZBzO/klM0nNk7L2T0zH6kDgtVp112FfJJtpEV6rf/pQeHkNCPA6ZGs7ySqfXltM8Om+cfye00WwGCxj542spvWidZbdb/s5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7E3Jp+B+ANZhNncpDyJ1wr3l/qRSKs064Dt2VoyKJlg=;
 b=mOHy0wZ+gBMuNfmrmjhAj1j8mLouaC3Tl9L0MMstUpLOYV3sycpCZb48NqyvfrS8+YYLa7KgHEf00IhZx32mToY8xNohJ16AZEMeDFyuhnSea2UyeDLeznBao58PhoRQT0go0UpKD/da9H/xynkAk4kJFrhCjIDCAczp9+MN3D+unKTOV2SsUfETc2YEniIbdhENrqVZoUDp8ZwWYvMzd9vVCKx0dwCrsvD2NMG4CPXZrckrhCfsxdx58B+ns3XU05nCU20T8s03/Zghr3qFSwSwjdEfD9ttF/sUg0KaVJmxuI2MDwsBAsMlTnlV1NgFQcMtmT9t27VlLfr6R7+taQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.199) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=de.bosch.com; dmarc=pass (p=reject sp=none pct=100) action=none
 header.from=de.bosch.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7E3Jp+B+ANZhNncpDyJ1wr3l/qRSKs064Dt2VoyKJlg=;
 b=OWkx3GN6tmjUkhm/72t0K7qCInPQtc4JhdIPJojAE7JS80PTQTMJeAIvilrnAHAS8QnS/8+/yh55OsOSyEaKL05JquRB0O1R26kChqSOAYuMHc10ZBmR5vcIyg90I/ftIrXtT9oMJzt71bCVSby3WbrWpv1aRp1nD+u1ocvKZJc=
Received: from AM6PR10CA0069.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::46)
 by AM9PR10MB4181.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1fc::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Tue, 15 Jun
 2021 15:41:20 +0000
Received: from VE1EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:80:cafe::8a) by AM6PR10CA0069.outlook.office365.com
 (2603:10a6:209:80::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21 via Frontend
 Transport; Tue, 15 Jun 2021 15:41:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.199)
 smtp.mailfrom=de.bosch.com; lists.openembedded.org; dkim=none (message not
 signed) header.d=none;lists.openembedded.org; dmarc=pass action=none
 header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.199 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.199; helo=eop.bosch-org.com;
Received: from eop.bosch-org.com (139.15.153.199) by
 VE1EUR03FT040.mail.protection.outlook.com (10.152.18.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Tue, 15 Jun 2021 15:41:20 +0000
Received: from SI-EXCAS2001.de.bosch.com (10.139.217.202) by eop.bosch-org.com
 (139.15.153.199) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2176.14; Tue, 15 Jun
 2021 17:41:08 +0200
Received: from SI-HUB2000.de.bosch.com (10.4.103.108) by
 SI-EXCAS2001.de.bosch.com (10.139.217.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2176.14; Tue, 15 Jun 2021 17:41:08 +0200
Received: from luchador.grb-fir.grb.de.bosch.com (10.19.187.97) by
 SI-HUB2000.de.bosch.com (10.4.103.108) with Microsoft SMTP Server id
 15.1.2176.14; Tue, 15 Jun 2021 17:41:08 +0200
From: "Mark Jonas" <mark.jonas@de.bosch.com>
To: <openembedded-devel@lists.openembedded.org>, <raj.khem@gmail.com>
CC: <kevin.zhang3@cn.bosch.com>, Mark Jonas <mark.jonas@de.bosch.com>
Subject: [meta-openwrt][PATCH 2/7] netifd: Remove dependency on bridge module
Date: Tue, 15 Jun 2021 17:40:44 +0200
Message-ID: <20210615154049.173769-3-mark.jonas@de.bosch.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210615154049.173769-1-mark.jonas@de.bosch.com>
References: <20210615154049.173769-1-mark.jonas@de.bosch.com>
MIME-Version: 1.0
Return-Path: Mark.Jonas@de.bosch.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0ee315f4-436d-46ea-b3e6-08d9301405a3
X-MS-TrafficTypeDiagnostic: AM9PR10MB4181:
X-Microsoft-Antispam-PRVS: 
	<AM9PR10MB41810EC8896CC9C608288EE7AD309@AM9PR10MB4181.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bQT72+KTNIORze+BELDNgKkhDyZg45IAd6FVw8MBrqc2LQneaPN8GNEkKSvSNTFfbhhsL/ZA31mx/CNdVjr/vUDbWY2r/M1fU1qIt+YghWIAxHOfng2mFtR9tF8CJJrD4rCE3Oo9bxjOELNf4nMswXkhK9eNcAKbp8Vb0WbjEaheGyFn/5bWjcibHfFDxZg8loXGxujYxVGb4e15QnXUUkeh1ae1A5T06bgwK1BBmHvwpbO91moq1lQ9NH6SDWWncxeua1E5LYrn1AZvVECarvyVQjHIJo2XL5tg/BwKGhgQn//QL57DQWs1v422LEx2x4Ve9YCsdQBh23myJK5MjizLrVBgbFlpYajkRbope7dtW4573+SztyeoZkAPI8FqVEYNIbIW7z0xTb0ze1o03EFX6Eu9kCz6m1kk25BSUalxGNd+dOkjjY2gwFTV4/rwZerDOh3+6l+dSOYUfMiay4aHf9GdHPuFpGcy5+wMfGs578/A18rLKHFzVH9g8t5PW5GXklSFhDHqBz3kiEZgvh2Eh4V/qB/JUzT63Z7Fj6qsGcNiiSh+MN7OXOhiB0jyaY1n2AQdfbcbexq4IkRCZU6PyKDzgzgr3XDU1qUT8XRxRaVj5fa3ttbiy7erjkwl7F37bCGnuqBGMfDnUMm8sozu+jU9UROYRo5s8P9JXuriPbwTGaZELdexF+szhvkY
X-Forefront-Antispam-Report: 
	CIP:139.15.153.199;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(5660300002)(47076005)(107886003)(70586007)(81166007)(70206006)(356005)(7696005)(86362001)(2906002)(82310400003)(2616005)(4326008)(4744005)(44832011)(6666004)(110136005)(36860700001)(8936002)(426003)(186003)(83380400001)(1076003)(336012)(54906003)(8676002)(26005)(498600001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2021 15:41:20.0580
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ee315f4-436d-46ea-b3e6-08d9301405a3
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.199];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB4181
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

From: Kevin Zhang <kevin.zhang3@cn.bosch.com>

There are kernel functions which require bridging early during boot,
e.g. the DSA framework. So if bridging is always a kernel module this
would force people to use an initial ramdisk for startup to load the
modules at an early point in time. Now, it is in the responsibility
of the user to add the bridging functionality as a kernel module or
compiled into the kernel.

Signed-off-by: Kevin Zhang <kevin.zhang3@cn.bosch.com>
Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
---
 recipes-core/netifd/netifd_git.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/recipes-core/netifd/netifd_git.bb b/recipes-core/netifd/netifd=
_git.bb
index 5a8b756..24232ce 100644
--- a/recipes-core/netifd/netifd_git.bb
+++ b/recipes-core/netifd/netifd_git.bb
@@ -85,6 +85,5 @@ CONFFILES_${PN}_append =3D "\
=20
 RDEPENDS_${PN} +=3D "\
                   bridge-utils \
-                  kernel-module-bridge \
                   base-files-scripts-openwrt \
                   "
--=20
2.25.1

