Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.40])
 by mx.groups.io with SMTP id smtpd.web12.11336.1623771686000341154
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Jun 2021 08:41:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@de.bosch.com header.s=selector1 header.b=goTtBOGo;
 spf=pass (domain: de.bosch.com, ip: 40.107.7.40, mailfrom: mark.jonas@de.bosch.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xc0lRqYcnJrhAx2ec2mHO/6abP+VHHpB2Xdkunu74GlFnn4MHPLoMPVZQvcIwVVn1rAcTBz1uYPLMlXE7mIn3pk8DArzg5tMJuJJQKeg7PAnA5jYef6OahqU3OiMVT+jyHD80fyzIotDrb/TRrqpRoimhYL5raxRCvJ0nSikTvXBAWDPuYnwY5dgGPCdcf+sPoTKCi775XXFZ7mlzzFc2rcJTHNFlyOZqbY8FmZBfmmTOEihtZDYgjrF1bQfU70T1OGoz1qok5YNe1ywhyCnOzahBqK2QH7ocvRksHoA9wWab2dvSXkk5HdMhXqGUmxmdrc9RYfheAh2xUsEfpId0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rFlny66giQmJv48zIyozMqGKkObyT/Sz3yGjOOrOT80=;
 b=GrIxrzIZhhglfbCOtoeNnZkGoulGadSdYGCh/Dtay+1kaY5yVzjjGCJl2vtA6VSlTa2YPOPEdk4pXDa8Lpnu5qku99AkeuUP61LxMXM1jacFe5N1M7R3gf7BiTUW6+rXQzhivNKbCeDSO7WqDpwZqaFh4rYMlwMSL+XMBWac/07mV8rFGIybZS4aO9ATTiWIvPQoF0aiwbTp5ynRnHUxXXRFf8qZyhTd84xgiPXbLgQTgKCFZe18fx2RtIbmsSrFSre6lTV/JH+PnMq9ea5L9ugGRiF0eiS/BSfAlM8O99Vczhi6iaTLLDMIxZaBoboL+pc1YaVf/wc1+DkZyBsiSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.201) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=de.bosch.com; dmarc=pass (p=reject sp=none pct=100) action=none
 header.from=de.bosch.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rFlny66giQmJv48zIyozMqGKkObyT/Sz3yGjOOrOT80=;
 b=goTtBOGouKC7mestAsjw+Es/lzNqsmOlF3ucM51zn4OD0EfFTbc5hvVicvENH153XGltQJTSGj+wUcrUQJMjSR83KYnM/jmSTWMF0RTgk7PITA0OiCTgaNqlC/MAb/yZZzF9Bpma6YSYyxkU+PoqPYNG5LesbrmfvMTLF+qZ858=
Received: from AM7PR04CA0005.eurprd04.prod.outlook.com (2603:10a6:20b:110::15)
 by HE1PR10MB1817.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:7:56::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.24; Tue, 15 Jun
 2021 15:41:23 +0000
Received: from AM5EUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:110:cafe::e5) by AM7PR04CA0005.outlook.office365.com
 (2603:10a6:20b:110::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.15 via Frontend
 Transport; Tue, 15 Jun 2021 15:41:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.201)
 smtp.mailfrom=de.bosch.com; lists.openembedded.org; dkim=none (message not
 signed) header.d=none;lists.openembedded.org; dmarc=pass action=none
 header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.201 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.201; helo=eop.bosch-org.com;
Received: from eop.bosch-org.com (139.15.153.201) by
 AM5EUR03FT041.mail.protection.outlook.com (10.152.17.186) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Tue, 15 Jun 2021 15:41:22 +0000
Received: from FE-EXCAS2001.de.bosch.com (10.139.217.200) by eop.bosch-org.com
 (139.15.153.201) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2176.14; Tue, 15 Jun
 2021 17:41:11 +0200
Received: from SI-HUB2000.de.bosch.com (10.4.103.108) by
 FE-EXCAS2001.de.bosch.com (10.139.217.200) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2176.14; Tue, 15 Jun 2021 17:41:11 +0200
Received: from luchador.grb-fir.grb.de.bosch.com (10.19.187.97) by
 SI-HUB2000.de.bosch.com (10.4.103.108) with Microsoft SMTP Server id
 15.1.2176.14; Tue, 15 Jun 2021 17:41:09 +0200
From: "Mark Jonas" <mark.jonas@de.bosch.com>
To: <openembedded-devel@lists.openembedded.org>, <raj.khem@gmail.com>
CC: <kevin.zhang3@cn.bosch.com>, Mark Jonas <mark.jonas@de.bosch.com>
Subject: [meta-openwrt][PATCH 7/7] luci: Fix error module 'luci.util' not found
Date: Tue, 15 Jun 2021 17:40:49 +0200
Message-ID: <20210615154049.173769-8-mark.jonas@de.bosch.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210615154049.173769-1-mark.jonas@de.bosch.com>
References: <20210615154049.173769-1-mark.jonas@de.bosch.com>
MIME-Version: 1.0
Return-Path: Mark.Jonas@de.bosch.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5b9811ef-2118-4556-c861-08d930140760
X-MS-TrafficTypeDiagnostic: HE1PR10MB1817:
X-Microsoft-Antispam-PRVS: 
	<HE1PR10MB18177CC8F36521DD7157FFDBAD309@HE1PR10MB1817.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:418;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HwdjVxSYk8OXNg+J6QEKpOlBftCG8q8RO94LvrYeYIQlztrc41f2wixxeOxwBHMNFC4tp/hQG/afeoBlAdeLJk9Iu5ojVm5YRMj8NpAhKxMpNVpOfGu4MFcMLr84bcBpA2KCFv/+7uYji+1/ouroZ91mRqoeyAJl30DeaB+6kyVfruhJrDwxQ7x0fWqlJrte91VMjhS4WjBx54idHPKsWjRF1UEBNw+HjCU/t6LpAvSS10ET+qHTTjw7gjUw+AxmAWTqjGbYLA9PTg1zvxXwMaC6M1nYeV7ps/JBA1PseFG4KSxxQuSFwGpTEV/ld8ghjC9MQcqTKmcvYdJmPPUX5WebCV+jav8PfwukZ4arq470JLQu/reVRjcuGAkKa9KLLnEkhduf2P2R5dneCM4S+7o7ZUm06iAhNpwBhwGeGrYn9tT8657HptBhcfoOC3JRwRE8kbXGVmlxLWiKnZljDI/xt8rZ4K1rPyOvX7CtejXce7ozX5NPD35l/EtLtp/0JGcgkKdJ+704qtRych2diYG6ZV1HSe3e50SoOlMZPnZT9PA//NBcgz/0xctBX+EK2vparC4LLqigm/9hUWSkbEDUhb0PUDcNisWcBF65N894CcdlKBI8TSMZ6/zt7f3/2r/bGntm+O8X8BPaJtUw+ExSx0+cFuqpyDaJmlQ9D3EU2RpSEjF1IIPTzq6uQ4aL
X-Forefront-Antispam-Report: 
	CIP:139.15.153.201;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(110136005)(36860700001)(8936002)(1076003)(5660300002)(54906003)(356005)(81166007)(7696005)(4326008)(2906002)(83380400001)(47076005)(70206006)(70586007)(2616005)(8676002)(44832011)(86362001)(498600001)(336012)(426003)(186003)(107886003)(82310400003)(26005)(6666004)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2021 15:41:22.9988
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b9811ef-2118-4556-c861-08d930140760
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.201];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR10MB1817
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

From: Kevin Zhang <kevin.zhang3@cn.bosch.com>

When running the latest luci there is an error:
    module 'luci.util' not found.

This commit will install the missing files.

Signed-off-by: Kevin Zhang <kevin.zhang3@cn.bosch.com>
Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
---
 recipes-extended/luci/luci/cmake.patch | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/recipes-extended/luci/luci/cmake.patch b/recipes-extended/luci=
/luci/cmake.patch
index 7b4068e..e48ccd3 100644
--- a/recipes-extended/luci/luci/cmake.patch
+++ b/recipes-extended/luci/luci/cmake.patch
@@ -1,6 +1,6 @@
 --- /dev/null
 +++ b/CMakeLists.txt
-@@ -0,0 +1,31 @@
+@@ -0,0 +1,32 @@
 +cmake_minimum_required(VERSION 3.0)
 +
 +PROJECT(luci)
@@ -26,6 +26,7 @@
 +
 +ADD_SUBDIRECTORY(modules/luci-base)
 +ADD_SUBDIRECTORY(modules/luci-mod-admin-full)
++ADD_SUBDIRECTORY(libs/luci-lib-base)
 +ADD_SUBDIRECTORY(libs/luci-lib-nixio)
 +ADD_SUBDIRECTORY(libs/luci-lib-ip)
 +ADD_SUBDIRECTORY(libs/luci-lib-jsonc)
@@ -33,6 +34,18 @@
 +ADD_SUBDIRECTORY(applications/luci-app-firewall)
 +
 --- /dev/null
++++ b/libs/luci-lib-base/CMakeLists.txt
+@@ -0,0 +1,9 @@
++cmake_minimum_required(VERSION 3.0)
++
++PROJECT(luci-lib-base C)
++
++INSTALL(DIRECTORY luasrc/
++	DESTINATION "${LUAPATH}/luci"
++	USE_SOURCE_PERMISSIONS
++)
++
+--- /dev/null
 +++ b/libs/luci-lib-ip/CMakeLists.txt
 @@ -0,0 +1,15 @@
 +cmake_minimum_required(VERSION 3.0)
--=20
2.25.1

