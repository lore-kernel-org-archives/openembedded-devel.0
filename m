Return-Path: <chris.laplante@agilent.com>
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-eopbgr790059.outbound.protection.outlook.com [40.107.79.59])
	by mail.openembedded.org (Postfix) with ESMTP id 38D797F814
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Nov 2019 18:42:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=YwpqrCzh1bs4vYzz28Q5FMwlfctiyJ6VwQ28LtL4xXzWgF6U1vXTn1k3zoWe9QH6QYnshHtb1j+vMPYV5NvVsmsVXzXtUYbL5tinOyGR281s5gHjS0mYXuglCPBsTOjzR4tBQBmz2K5N+gWVA4PUvSUskbUmOJbYHPSbp26x07wffDfhOQKjOf8dqZ/VwZyJSRetE5ziBIQVyYgwfDQ2nt9ZqBJYrSqdnyLSWT/1cgLIzQIfAmSmbcb9utS7CtZFJ8ujadiRnOiCOG+qQRccPSeomf9WvCzP7zFreehFml3LqQzbirjL2yaGkoj0lWiuBdwuy7CfaLF1J6Uvs/nRCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=DhLlZAj2XtLt/WCmw8PChULwAiVoE+E30N/N2zOdGdU=;
	b=EBzX8ScWI2CzZao+wszOcRO2j0tdrnQ1zCctJccAr8+R0ALetWoy9NFeXcLCzVOvMD+RGcoTGD0AJF1WLdL38aSF3svY/a8GRHi43thA98yaene1XKouEd92nvURIPvwz7USb13T+RmvaVsnm7AFaq0gjPn8kEUDlr2TQtjFygjpOs5n+XisTBLDb/icLF0sEvrdrWVoxE5BS6JIjuresdKIzN+LU0BnWpdAbdT0KFSJFxOXsY/ETcp4AwIBLZwsyqVF9bqJcoB1TmhLWHPyhtygKWyyhhbkmZIoyQS8OkIVTJMPVzoborIgnYAdTw/4IDXxYf32HfwKiNH3GtZMrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
	192.25.218.34) smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=agilent.com;
	dmarc=pass (p=reject sp=none pct=100) action=none
	header.from=agilent.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=DhLlZAj2XtLt/WCmw8PChULwAiVoE+E30N/N2zOdGdU=;
	b=YN+LTHsZzXfi9JMXmk+wbB7+wKa9AYgLQ6pCSFdE+82O+eMCKunqSQ5vDhFxzcqSSGm7R/rO5fEunRiVyCtSlHBVYEQmjovb21dc9vJ9ZPGGdrCC9isiDWtGlO8kSRkwrmGsqLt60sPE0cqwK9uap78XDSPt61+hXJ5DOi8hIrI=
Received: from DM5PR12CA0004.namprd12.prod.outlook.com (2603:10b6:4:1::14) by
	BN6PR12MB1937.namprd12.prod.outlook.com (2603:10b6:404:108::19) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2408.24;
	Wed, 6 Nov 2019 18:42:17 +0000
Received: from CO1NAM05FT032.eop-nam05.prod.protection.outlook.com
	(2a01:111:f400:7e50::200) by DM5PR12CA0004.outlook.office365.com
	(2603:10b6:4:1::14) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2430.20 via
	Frontend Transport; Wed, 6 Nov 2019 18:42:17 +0000
Authentication-Results: spf=pass (sender IP is 192.25.218.34)
	smtp.mailfrom=agilent.com; lists.openembedded.org;
	dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=pass action=none
	header.from=agilent.com;
Received-SPF: Pass (protection.outlook.com: domain of agilent.com designates
	192.25.218.34 as permitted sender) receiver=protection.outlook.com;
	client-ip=192.25.218.34; helo=edgeappmail.agilent.com;
Received: from edgeappmail.agilent.com (192.25.218.34) by
	CO1NAM05FT032.mail.protection.outlook.com (10.152.96.144) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
	15.20.2430.10 via Frontend Transport; Wed, 6 Nov 2019 18:42:15 +0000
Received: from localhost.localdomain (130.30.246.172) by
	edgeappmail.agilent.com (192.25.218.34) with Microsoft SMTP Server id
	15.1.1713.5; Wed, 6 Nov 2019 11:42:02 -0700
From: Chris Laplante <chris.laplante@agilent.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 6 Nov 2019 13:41:33 -0500
Message-ID: <1573065695-91730-1-git-send-email-chris.laplante@agilent.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Received-SPF: None (wpcosapexchedg3.windmz.agilent.com:
	chris.laplante@agilent.com does not designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.25.218.34; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(346002)(136003)(39860400002)(396003)(376002)(199004)(189003)(29502001)(47776003)(2351001)(486006)(2616005)(186003)(86362001)(6916009)(36756003)(26005)(70206006)(51416003)(16586007)(356004)(48376002)(36906005)(8676002)(246002)(6666004)(50226002)(8936002)(316002)(426003)(126002)(476003)(44832011)(50466002)(5660300002)(336012)(478600001)(7636002)(2906002)(305945005)(558084003)(4326008)(106002)(956004)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1937;
	H:edgeappmail.agilent.com; FPR:; SPF:Pass; LANG:en;
	PTR:wpcosapexchedg3.windmz.agilent.com,cos.smtp.agilent.com; A:3;
	MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7dea1006-e10c-4266-60fa-08d762e90b91
X-MS-TrafficTypeDiagnostic: BN6PR12MB1937:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1937E3F5C55E908027ADBDA18B790@BN6PR12MB1937.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-Forefront-PRVS: 02135EB356
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x7Q+t3uaHMVRydJUhOSGm6gOM9DbOWMOCKir1zi+aSAbIGNqWZ40RWF2ZuVrMKPWkgo5pgax+Z1pR3ERqxKJtTgwckcoaAqmo8tkMXu3eSiwWbukoYuMJelI82NEkXFRGrWyrA/aONd9KgsZctC4K1crX/GcIJhzJfmV6yZeOFAavTlGN84qZI/m5ZfeD4q8qsL+lgeA1XXA7dUoTDdGVLCC6yVOgDIcoXf0StXat4P01rA+ISzWkG4synKHCzqwso9+UCEHZva+VuNZyqWYxHLUbzcO/bXbyymXmcl8PBH95x0bbeZPsl/1yZPMh2v2Oo0rGtja0LVRIyH5r6MsMaAuIAUMqJ9u2VCr2EglByMjG+NqmkKMyPkunL1saEG2Zk93/fnJPrVAfV29MI9L5WSLXVvanrO0jxh/QR43TWZg1W1Mous2cNsJnoWGFc7K/WqBFe4tk01ajV8snmN9nA==
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2019 18:42:15.4901 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dea1006-e10c-4266-60fa-08d762e90b91
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;
	Ip=[192.25.218.34]; Helo=[edgeappmail.agilent.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1937
Subject: [meta-java] [PATCH v2 0/2] add patches to fix BigDecimal
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
X-List-Received-Date: Wed, 06 Nov 2019 18:42:17 -0000
Content-Type: text/plain

v2: split into two commits; add sign-offs; add description to commits


