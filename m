Return-Path: <danc@opengear.com>
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
	(mail-mw2nam12on2088.outbound.protection.outlook.com [40.107.244.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6B29160F8E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Feb 2020 06:08:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=Pd+bajIRFR2Ih9bTn0KBb4kkciHukpVd4IpVdsM2tIg3SvabRUrI1/SEB5Ziil9yhVeaYA13uKfiMvPC02Z60vq0F1uyhK9+FG7tQn174cf1H2oTw6plva7fRQg7ajq23Her1/YOEei40lCg0zhIZmcVh9ZOhc16wf/p19T40xzjtBywza+Ilq2Xad6wZpGdTIE3MbzY6ahsU9LeA/oVG+Bu2mM9HHrejwShDE/43GKjIWg7Fr94GKiVhOLDNBOJZqIQbrZSIQZ2VzdZmb83GrfgdnSYMV+4d8CWrqK4zMTKQg8VUkUDlbbisWbfyuumduYpzv40x/nUuw1Jid8pbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=aagOVZAImak1Lbz9xYqlHm5IMYoXawnc81fnIX4bzko=;
	b=gRlk3CaxaXQp39b1AbD82or+f4uACGn6VyHqhVf8YouCT8IJ0/5imk2NvewA6rXu+7xEhkaXqZqCouYyLUMHjjN1X0CadRQ809X2hiY7PGs+rm2Ru9ByZsNnoOrUS49IRteAkL3QsYqC39YpaxBjBNsoSZugEL/rniP3zbKXBtEwhiciQL+eQjLX5IrV8rvpOzEaPjHg+3jpaDNLxXccbzVHZjCdcc4PMoBro46q17jEHfxXO79yvOnjWmo9ztp4712lS5FjWYS/QJjMftHgWUkxDk95uDvs3qHoVtYTOUFylHKY2xRkj/aYTXs13TyKR3qoFYlHMJp5jeHIu+vjHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
	60.241.24.90) smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=opengear.com;
	dmarc=pass (p=none sp=none pct=100) action=none
	header.from=opengear.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opengear.com;
	s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=aagOVZAImak1Lbz9xYqlHm5IMYoXawnc81fnIX4bzko=;
	b=Xtg2Dz1LFPRaBEG/ULSzmF258PNu2DPJvIQKsTueseHv0Sg29KMck8AF9iVpA2g3pnbfYZo9SPwFlKhYxxQoILdtCOVw+fVCOTeG1v97SUqz3GJByO3WwB3zZEpb/wFEJvr5tpa/UyiLPxc9/HTcz3lLJ2PcY4NqVff+A42rowM=
Received: from CO1PR15CA0081.namprd15.prod.outlook.com (2603:10b6:101:20::25)
	by MN2PR15MB2735.namprd15.prod.outlook.com (2603:10b6:208:12a::27)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2707.23;
	Tue, 11 Feb 2020 06:08:59 +0000
Received: from SN1NAM04FT017.eop-NAM04.prod.protection.outlook.com
	(2a01:111:f400:7e4c::208) by CO1PR15CA0081.outlook.office365.com
	(2603:10b6:101:20::25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2707.21 via
	Frontend Transport; Tue, 11 Feb 2020 06:08:58 +0000
Authentication-Results: spf=pass (sender IP is 60.241.24.90)
	smtp.mailfrom=opengear.com; lists.openembedded.org;
	dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=pass action=none
	header.from=opengear.com;
Received-SPF: Pass (protection.outlook.com: domain of opengear.com designates
	60.241.24.90 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=60.241.24.90; helo=postman.bne.opengear.com;
Received: from postman.bne.opengear.com (60.241.24.90) by
	SN1NAM04FT017.mail.protection.outlook.com (10.152.88.154) with
	Microsoft SMTP Server id 15.20.2707.21 via Frontend Transport;
	Tue, 11 Feb 2020 06:08:58 +0000
Received: from galangal.danc.bne.opengear.com (danc.bne.opengear.com
	[192.168.254.90])
	by postman.bne.opengear.com (Postfix) with ESMTPS id 3DC36DFC87;
	Tue, 11 Feb 2020 16:08:57 +1000 (AEST)
Received: by galangal.danc.bne.opengear.com (Postfix, from userid 1090)
	id 2DE01427F563; Tue, 11 Feb 2020 16:08:57 +1000 (AEST)
From: Dan Callaghan <dan.callaghan@opengear.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Feb 2020 16:08:34 +1000
Message-Id: <20200211060834.19790-2-dan.callaghan@opengear.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200211060834.19790-1-dan.callaghan@opengear.com>
References: <20200211060834.19790-1-dan.callaghan@opengear.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:60.241.24.90; IPV:; CTRY:AU; EFV:NLI; SFV:NSPM;
	SFS:(10009020)(4636009)(346002)(136003)(396003)(376002)(39850400004)(189003)(199004)(70586007)(5660300002)(6916009)(36756003)(8676002)(426003)(107886003)(186003)(6266002)(2616005)(8936002)(246002)(26005)(70206006)(44832011)(4744005)(36906005)(316002)(4326008)(2906002)(478600001)(42186006)(336012)(6666004)(356004)(1076003)(7636002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR15MB2735;
	H:postman.bne.opengear.com; FPR:; SPF:Pass; LANG:en;
	PTR:brisbane.opengear.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d12a3c9f-f8f1-4753-6040-08d7aeb8e1f1
X-MS-TrafficTypeDiagnostic: MN2PR15MB2735:|MN2PR15MB2735:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR15MB2735D5B54F4ACF5B561FDD15B8180@MN2PR15MB2735.namprd15.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-Forefront-PRVS: 0310C78181
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: asoGJomA1Grng42pxuEmtOHXjHGAw8W5dTx3AmW/2ip5N0ZBBv8Zl5HaiARedGfU9uXmIe3xL41Ox7eOZnX5W5p3RrvokKjH0exDkcf5A7MZ1PUMS83GZEotLLt7HcBZ31F4E9azfHNo2Y8GN42bi6mVBR6NUDKcID0fxtoY7O8mDWnMu6XrZEmnjDVWjMcaF7A3011KnIzVNjQjdyGjw99hBAz+zUcojXTopRoFf1QPmqwMD97Iaq+Q2Ep/lyPZ7HnHDSyux23WqpwUt/aNiKcEfAh0EDGgLC8olSpAc76HCvLCemR3oiB1HWN7isyoNDmtJRRwqYdqvjw00A5oJGKeF0Fsk0aI/zFNS1bJkGIRdiXl0FUHCVpzoqhyzbspNpckbVOAq8Ax9GeIGYhYf0/0JlJpfN+NusqO7eqvA+QNC7Od40V0dUWKPS985I4/
X-OriginatorOrg: opengear.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2020 06:08:58.0094 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d12a3c9f-f8f1-4753-6040-08d7aeb8e1f1
X-MS-Exchange-CrossTenant-Id: a6251c26-d21f-4164-a225-1f4eaebf5f9a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a6251c26-d21f-4164-a225-1f4eaebf5f9a; Ip=[60.241.24.90];
	Helo=[postman.bne.opengear.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR15MB2735
Subject: [meta-networking][PATCH 2/2] quagga: install tmpfiles snippet to /usr/lib/tmpfiles.d
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Feb 2020 06:08:59 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Package-owned tmpfiles snippets belong in /usr/lib/tmpfiles.d,
/etc/tmpfiles.d is for administrator customisations.

Signed-off-by: Dan Callaghan <dan.callaghan@opengear.com>
---
 meta-networking/recipes-protocols/quagga/quagga.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-protocols/quagga/quagga.inc b/meta-networking/recipes-protocols/quagga/quagga.inc
index 2673a8976..f35b27160 100644
--- a/meta-networking/recipes-protocols/quagga/quagga.inc
+++ b/meta-networking/recipes-protocols/quagga/quagga.inc
@@ -116,9 +116,9 @@ do_install () {
     done
 
     if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
-        install -d ${D}${sysconfdir}/tmpfiles.d
+        install -d ${D}${nonarch_libdir}/tmpfiles.d
         echo "d /run/quagga 0755 quagga quagga -" \
-        > ${D}${sysconfdir}/tmpfiles.d/${BPN}.conf
+        > ${D}${nonarch_libdir}/tmpfiles.d/${BPN}.conf
     fi
 
     # Remove sysinit script if sysvinit is not in DISTRO_FEATURES
-- 
2.21.1


