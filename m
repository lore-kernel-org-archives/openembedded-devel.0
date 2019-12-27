Return-Path: <Peter.Kolbus@garmin.com>
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
	(mail-co1nam11on2100.outbound.protection.outlook.com
	[40.107.220.100])
	by mail.openembedded.org (Postfix) with ESMTP id 4CF787C89C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 17:26:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=gixSD4pZfn4r2BoeVD6nJl1HXGg+pIzMN+CI7JFssFyDLClle2D0v7+YUPzbpDv5hQANGQv1JPyy8qdtwxxKeVc5iQXzh9kvXuqGKGV4zTHdc3em5uqhmgR4UasVfCwAlxguwB65bEwrEa/BNkisaPPW6rl6MGM8H7wY/TFr3MxPfjZjrxEvtCM7gR7FeQyQzSziHQ5o2qurCdpLb7Kc5+Dj1lYXMaz86QosND8rsKhDT4n5SFU99qWujrmY8wIqMJa+X/qp4tQEp6brNbzxJgcbK+sYk+SiqegKac/bMkKju2cn5/3Wrxp34wEAcwnKdMUsVWklhbK99RD/wH0/Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=0OxcNg6JQnx9KAl2yRK16RqjL1FPGk7B8l1agWUbeAI=;
	b=fr6aas1cuoE/X0CFsol0yIyNuLp3EY/oC9gn4UnWzBVv8DIMv/0187TfiYDBm0aPxZpj5CAWnlggebzpaecWZ1lgwcCdIXFS2uLefgQCK9IuNfoOIYEGlUITahKbUcSz/2dGHs+0ZHKo82NK9/oNiY3hkpSBERT/VrqIigTnMiqWSddwQrTLQjcb0CFRck38Ks6lJrZGYbnpvbTPSYf1/FD3eHff/1DesglAtMt3IzfmdIZd9e9R97ideXq7Z68Ht32KREwZc/IR37FehOqBgurCSjy9YqRuX++kImk9Ih2ojfGJ2BCRawTI4LwM5DDpTEsfdYPHlGgh+uFeueMc5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
	204.77.163.244) smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=garmin.com;
	dmarc=pass (p=none sp=none pct=100) action=none
	header.from=garmin.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=0OxcNg6JQnx9KAl2yRK16RqjL1FPGk7B8l1agWUbeAI=;
	b=e0mxesv9hVLOIzpxihnvDNTRPl5QprOIgrhMVEhpqgToU+DaZIPc/A8rcMOdZm4v1copvida2IbP8ik+NNrmK7hlu9SRFBG3NQAEbAF+MM1tjCVe8HgEz5fYddhGCRLWdsuLrRw+17taeMNgQGx0lMyHA0t/izZ1OgcGeJV5rkc=
Received: from SN4PR0401CA0017.namprd04.prod.outlook.com
	(2603:10b6:803:21::27) by BN8PR04MB5633.namprd04.prod.outlook.com
	(2603:10b6:408:76::25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2581.11;
	Fri, 27 Dec 2019 17:26:45 +0000
Received: from MW2NAM10FT034.eop-nam10.prod.protection.outlook.com
	(2a01:111:f400:7e89::200) by SN4PR0401CA0017.outlook.office365.com
	(2603:10b6:803:21::27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2581.11 via
	Frontend Transport; Fri, 27 Dec 2019 17:26:45 +0000
Authentication-Results: spf=pass (sender IP is 204.77.163.244)
	smtp.mailfrom=garmin.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=pass action=none
	header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
	204.77.163.244 as permitted sender) receiver=protection.outlook.com;
	client-ip=204.77.163.244; helo=edgetransport.garmin.com;
Received: from edgetransport.garmin.com (204.77.163.244) by
	MW2NAM10FT034.mail.protection.outlook.com (10.13.154.231) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2581.11 via Frontend Transport; Fri, 27 Dec 2019 17:26:45 +0000
Received: from OLAWPA-EXMB10.ad.garmin.com (10.5.144.12) by
	olawpa-edge3.garmin.com (10.60.4.226) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
	15.1.1466.3; Fri, 27 Dec 2019 11:26:42 -0600
Received: from OLAWPA-EXMB3.ad.garmin.com (10.5.144.15) by
	OLAWPA-EXMB10.ad.garmin.com (10.5.144.12) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1779.2; Fri, 27 Dec 2019 11:26:37 -0600
Received: from ola-brr76y2.garmin.com (10.5.84.15) by smtp.garmin.com
	(10.5.144.15) with Microsoft SMTP Server id 15.1.1779.2 via Frontend
	Transport; Fri, 27 Dec 2019 11:26:36 -0600
From: Peter Kolbus <peter.kolbus@garmin.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 27 Dec 2019 11:23:39 -0600
Message-ID: <20191227172339.10885-3-peter.kolbus@garmin.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-TM-AS-Product-Ver: SMEX-12.5.0.1300-8.5.1010-25132.001
X-TM-AS-Result: No-0.125600-8.000000-10
X-TMASE-MatchedRID: JKG42K0FC5yrmmvFX5tNkgi0LLplf+Uvy733NwuklsJ+SLLtNOiBhkAc
	6DyoS2rIqQ4DH3i/D94l//FwVuKvPnW64iMasE48fid4LSHtIAM38FNTll9lEpm3TxN83Lo4gFq
	9go7KeD59LQinZ4QefOYQ3zcXToXr+gtHj7OwNO33FLeZXNZS4IzHo47z5Aa+uz4OpD6BvJvwNe
	Tr7CSOPeuqvGAuZpzgRA+KD9zgl/60Ltm/HW2XiVUcB5qvbZOctAygzkiazaaqberp9EOMMe5Rp
	bSg8tmEnkZgNaqizbL2z+v/HlGkuMCaqSgwpYR4eYa+lS0uTdDDyDYcE1wXmQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10-0.125600-8.000000
X-TMASE-Version: SMEX-12.5.0.1300-8.5.1010-25132.001
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:204.77.163.244; IPV:CAL; SCL:-1; CTRY:US;
	EFV:NLI; SFV:NSPM;
	SFS:(10019020)(346002)(136003)(376002)(39860400002)(396003)(189003)(199004)(316002)(2616005)(8676002)(246002)(8936002)(356004)(7636002)(7696005)(426003)(4326008)(336012)(107886003)(186003)(26826003)(26005)(478600001)(36756003)(5660300002)(4744005)(6916009)(2906002)(76130400001)(44832011)(86362001)(1076003)(70586007)(70206006);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN8PR04MB5633;
	H:edgetransport.garmin.com; FPR:; SPF:Pass; LANG:en;
	PTR:extedge.garmin.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 57d45227-b3f9-41c2-256a-08d78af1f241
X-MS-TrafficTypeDiagnostic: BN8PR04MB5633:
X-Microsoft-Antispam-PRVS: <BN8PR04MB563352555E0530F6F17D3721FF2A0@BN8PR04MB5633.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-Forefront-PRVS: 0264FEA5C3
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jYwg7U8U6EhYO/pnUMKSgh1JQGGSSXHcZBpNW66ssNo+2z6tOstoJyZyvzQ2zUUXEakDEU/HNQrVdKZdWVUpPzTKHXkIArp9mrF30mReL7X4cKIl0hzPG++dYXPhDu7jYXZakglIZVoEoaHLrrONggjVDvvm3kle/u+obTwV1Kj6eEhZ5NgrSLbVJxT4IQ2wajhmALmID263Q86Pm1DxYXO7OtmfwNhft37cYbnvG4bTOtqWw9AsXMIBsG0gCjEjGub/S9I75QKkfNBQEREQq3hztEyKPEVKcraiA80RpCUtam7O9VZ+Z51Yz4cbIhOOBMnZLyNrePj7TaJBJSFTOBDzjPK9fpD0QuWNCMNLKmly9e8ewA2YxE7l2NlAnWapxI5jjclbDUAE9E1PsQ68S6PVfjy8WpuuMp3Ag0huiFuUdnJ6ujSHmVBlL4eafFbf
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2019 17:26:45.0950 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57d45227-b3f9-41c2-256a-08d78af1f241
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;
	Ip=[204.77.163.244]; Helo=[edgetransport.garmin.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR04MB5633
Subject: [meta-python][PATCH 3/4] python-soupsieve: add recipe
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
X-List-Received-Date: Fri, 27 Dec 2019 17:26:46 -0000
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

Note- I recognize python2 support is ending. Nacking this patch and
accepting the next may cause python-beautifulsoup4 breakage; will leave
it to your discretion how to handle this.

