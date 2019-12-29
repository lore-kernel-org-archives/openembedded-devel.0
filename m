Return-Path: <Peter.Kolbus@garmin.com>
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
	(mail-mw2nam12on2105.outbound.protection.outlook.com
	[40.107.244.105])
	by mail.openembedded.org (Postfix) with ESMTP id 74F607F7C5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Dec 2019 16:44:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=jT5K7xWybZwp3duB1cdKrBBuPmkj9MzWDFMBOUgpLI611X6sFVqjiOK0Lhz3txcY3Ta3ST6QjeL9CSemWTpvtcjgkPd7BQbvoLCmL4tPKUHgHcCsPU22ckQOUB/aZa3Z7DMXVil5DvPT3dGQntbF9EvkFoKn+sl++ZWH7VoWin6yCdEq2Ozd2b2mnpDWi2VkF3g+SEfu2nrKLBmT///hd3OqUGwFktMyYjzKqEtVwJQPfXLCoawY4wcRIjGtAkzc/7oiC12u3ysVWiND9u5iow4qUv+6AAXoPKgk0wsfNc7fY6FPIZCpYmVHcTUYq1H7JO09OLyQQgNT6h6kTCubIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=7zZJaE2o1871VE2ybUX38Ul7w2TDQGmTpS7Pj9ZVxpQ=;
	b=UhUapM+o49bY7FQ2vxsOJCnQCuireZpd4n9c/yVasaRwOgoZ9GrEdNCYQVkUpp4xg5fFz1SJaLbCJTx1eceDbPFWkqLEM+p9Hmp2N/ao6awXoOupvlQ7fJ6C7cvDX3TT8X/jRPVMoPHYAaeAh/k1KVF8fispaL4ztUkmIFn62IkVf2zgqBAQkNbadfk9u2HtT+iin1RdULvNkgbxtUWqDEKgPDJuFjWIutPECb1l1Tve7chrnZAd8S4GWB2XnlP6EqZE4Tz+IUaA+lz0ttyUDc7M1R4AC8e1Vjn7+r0Lb9vndA+oWlInTtpLTHj+2ufXThwJYcWeMbOrXEz/yBLS4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
	204.77.163.244) smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=garmin.com;
	dmarc=pass (p=none sp=none pct=100) action=none
	header.from=garmin.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=7zZJaE2o1871VE2ybUX38Ul7w2TDQGmTpS7Pj9ZVxpQ=;
	b=QWLCXSrfl0J6zcdDgBIEwgbIviqP9wgwqp56pKeFgLrby0uSrgQ6k6dq+QXwSjLQ1T3M2K9qJQ48FxhxVsAE3ej5LYtXf/Q38b52DaHlvOyxH+e5Q5dXwV0yPzvOZNmlOIuYkoUVG4LkuctiHIbsnj/LIJ13Fnf8L5a3FhajdXU=
Received: from SN4PR0401CA0022.namprd04.prod.outlook.com
	(2603:10b6:803:21::32) by MN2PR04MB6927.namprd04.prod.outlook.com
	(2603:10b6:208:1e0::22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2581.11;
	Sun, 29 Dec 2019 16:44:45 +0000
Received: from BN7NAM10FT048.eop-nam10.prod.protection.outlook.com
	(2a01:111:f400:7e8a::206) by SN4PR0401CA0022.outlook.office365.com
	(2603:10b6:803:21::32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2581.12 via
	Frontend Transport; Sun, 29 Dec 2019 16:44:44 +0000
Authentication-Results: spf=pass (sender IP is 204.77.163.244)
	smtp.mailfrom=garmin.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=pass action=none
	header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
	204.77.163.244 as permitted sender) receiver=protection.outlook.com;
	client-ip=204.77.163.244; helo=edgetransport.garmin.com;
Received: from edgetransport.garmin.com (204.77.163.244) by
	BN7NAM10FT048.mail.protection.outlook.com (10.13.156.199) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2581.11 via Frontend Transport; Sun, 29 Dec 2019 16:44:44 +0000
Received: from OLAWPA-EXMB6.ad.garmin.com (10.5.144.22) by
	olawpa-edge4.garmin.com (10.60.4.228) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
	15.1.1466.3; Sun, 29 Dec 2019 10:44:42 -0600
Received: from OLAWPA-EXMB1.ad.garmin.com (10.5.144.23) by
	OLAWPA-EXMB6.ad.garmin.com (10.5.144.22) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1779.2; Sun, 29 Dec 2019 10:44:42 -0600
Received: from ola-brr76y2.garmin.com (10.5.84.15) by smtp.garmin.com
	(10.5.144.23) with Microsoft SMTP Server id 15.1.1779.2 via Frontend
	Transport; Sun, 29 Dec 2019 10:44:42 -0600
From: Peter Kolbus <peter.kolbus@garmin.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 29 Dec 2019 10:44:30 -0600
Message-ID: <20191229164431.12633-3-peter.kolbus@garmin.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191229164431.12633-1-peter.kolbus@garmin.com>
References: <20191229164431.12633-1-peter.kolbus@garmin.com>
MIME-Version: 1.0
X-TM-AS-Product-Ver: SMEX-12.5.0.1300-8.5.1010-25136.000
X-TM-AS-Result: No-0.292600-8.000000-10
X-TMASE-MatchedRID: +bMVC5hP09qrmmvFX5tNkgi0LLplf+Uvy733NwuklsJ+SLLtNOiBhkAc
	6DyoS2rIqQ4DH3i/D94l//FwVuKvPnW64iMasE48ngIgpj8eDcBpkajQR5gb3savT21DsLD/UEh
	Wy9W70AEnRE+fI6etkglCZiWSKlgtYNJC1ApjupuqD8ATdvVnUO6z/JyN8NW0MmYjictlFrMsmA
	JkqoxRbcdCCbRcxfPBz0sXSFrlvEsJBCOMs+7vRroeU3+BSDYhQCEEj7NUko7Lq8IagaXauBODl
	/4zh/FFtXIBuMCh2cM=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--0.292600-8.000000
X-TMASE-Version: SMEX-12.5.0.1300-8.5.1010-25136.000
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:204.77.163.244; IPV:CAL; SCL:-1; CTRY:US;
	EFV:NLI; SFV:NSPM;
	SFS:(10019020)(136003)(39860400002)(376002)(396003)(346002)(199004)(189003)(7636002)(70586007)(7696005)(107886003)(1076003)(86362001)(426003)(6666004)(44832011)(2616005)(356004)(8936002)(478600001)(76130400001)(2906002)(26826003)(70206006)(8676002)(336012)(4326008)(5660300002)(6916009)(4744005)(186003)(36756003)(26005)(316002)(246002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR04MB6927;
	H:edgetransport.garmin.com; FPR:; SPF:Pass; LANG:en;
	PTR:extedge.garmin.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ff4959c4-1b59-49b8-dffa-08d78c7e6874
X-MS-TrafficTypeDiagnostic: MN2PR04MB6927:
X-Microsoft-Antispam-PRVS: <MN2PR04MB6927332D94AF99C28A7C07B3FF240@MN2PR04MB6927.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1265;
X-Forefront-PRVS: 0266491E90
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MNpMiWHydDSwv5GjrMgghHhKnoBZxL/1tUnxHln97quTgdfewjgf6R2inm9P+/gH3yWVmJIzMow92rD782a5oJgHobn7MNfZQUq0Suogt2Nbxx9bEPPoy+WI5CeFGjVx4Pqw6VFt9xuzzw567nLh5s6gOq1qNgSLjMQsvsJcIrenjAvgiXfMDkxMNGO+eu/kcsqwEUQu1dXebNoPVYn9ofwBNkRZZmq79j9uVOBMPt1yqTwC2/tSFy5xWhNvOOWYkZAhAeQRZ3a91Zt0PghAceqiZN/Q6K3AJdVJczxFCPDuFlOZV0Ha4N2FH9OkZnxuSV4lS5yUdNKrjz5t9wyDYAR132zr/xCvAoYetoN076nca/+NVefxdAdNPIC8RKUPN4RDNe1HCktIssVNR609S7Di/NdZAQYRX53fi8QGcvxrAbddjqcQcRR4HANZ5xSZ
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2019 16:44:44.1391 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff4959c4-1b59-49b8-dffa-08d78c7e6874
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;
	Ip=[204.77.163.244]; Helo=[edgetransport.garmin.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6927
Subject: [meta-python][PATCH v2 3/4] python-soupsieve: add recipe
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
X-List-Received-Date: Sun, 29 Dec 2019 16:44:45 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Backport python3-soupsieve to python2; this enables use in
python-beautifulsoup4.

Signed-off-by: Peter Kolbus <peter.kolbus@garmin.com>
---
 meta-python/recipes-devtools/python/python-soupsieve_1.9.4.bb | 4 ++++
 1 file changed, 4 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-soupsieve_1.9.4.bb

diff --git a/meta-python/recipes-devtools/python/python-soupsieve_1.9.4.bb b/meta-python/recipes-devtools/python/python-soupsieve_1.9.4.bb
new file mode 100644
index 000000000..55a673ecc
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-soupsieve_1.9.4.bb
@@ -0,0 +1,4 @@
+inherit setuptools
+require python-soupsieve.inc
+
+RDEPENDS_${PN} += "${PYTHON_PN}-backports-functools-lru-cache"
-- 
2.24.1


