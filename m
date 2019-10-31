Return-Path: <Peter.Kolbus@garmin.com>
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
	(mail-eopbgr740109.outbound.protection.outlook.com [40.107.74.109])
	by mail.openembedded.org (Postfix) with ESMTP id DDF9C7F7A3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2019 16:14:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=cXVtnr0yj5FByC6K/S3h3u7jx3CO5igpBAr0UQRRHzvHkThYUQ2IHSq7Cl3Nt5IOI//0mfnbyb1MdsCJXCBRPppYL9jbQQp3sL/5w08/JcYyi8RhU9IbalhT7gc0VmUIHzE/lWf3WHjHF8cib6LKY+Kp4RoIn6ctOQxpDzHBGYgdHEvyy5bO0onl0qYRvtfj5WihQz/cw4DnqHVU5cCPzIH5obFH/ZDLPRyl0u8AFQ2Eeqf+87V7co1QiIrPc17FMtL3spTLvw+A8ix+YvjZAy410N14fgeUy+s4i0gLH9o725/vNq73ek3wUNXUzGw3+T2we8yAVm154jI3Mm5oLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=bHjuGLBJsIRB7S4//U91wQ9UQwldUh2wP5r6rqDe5lQ=;
	b=oIlE3Pr5lYKTvAK/eQlYp+Gz9fkrEWapnBPifvgh1jJPQE/ve/EsqnH3Elb9dVJ8PYOs7SVYnkQJZ4um/JDG795Y7ekM+9uVKgvBxOwL2Dzecs1EVjWVdWhAgoviUVj9nwsdutFhptakGmXDwc4YrMcroh3J2lbpGd/HYFrJmQn73Di48M5xY7NAk/Sdha66iiVWDmi3lGq9kN/au4j1v1aLwyUrIj8BWD7o1lYmDRgl+ApGdi2mQi6eoNJ8BBiF72CwyrgBj/eBp9nWZlxwT/R8Vcv7aJhNQchun3zsY/xeq2Z/pPnyZHxwpLJoL4oNLccHu+ckDM+HthvvOkYSgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
	204.77.163.244) smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=garmin.com;
	dmarc=pass (p=none sp=none pct=100) action=none
	header.from=garmin.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=bHjuGLBJsIRB7S4//U91wQ9UQwldUh2wP5r6rqDe5lQ=;
	b=TE9Hs5nnTyJm8im+FPSC/9/XYwedh9I2i/s9fH73BrLtaLu+UMCPXeljfGSa3VhTKSc94EebuLOCzfGhuXXGF3PKBIDVuD+XrAwVaTxWQy5TMKifzKyvP3x04edljvOOw0uxOoBZuBWw8h9hv7fLQK3gv7NsaO/5nJqTLTCs92g=
Received: from SN6PR04CA0025.namprd04.prod.outlook.com (2603:10b6:805:3e::38)
	by SN4PR0401MB3598.namprd04.prod.outlook.com (2603:10b6:803:47::21)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2387.24;
	Thu, 31 Oct 2019 16:14:21 +0000
Received: from BN3NAM01FT009.eop-nam01.prod.protection.outlook.com
	(2a01:111:f400:7e41::202) by SN6PR04CA0025.outlook.office365.com
	(2603:10b6:805:3e::38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2408.20 via
	Frontend Transport; Thu, 31 Oct 2019 16:14:21 +0000
Authentication-Results: spf=pass (sender IP is 204.77.163.244)
	smtp.mailfrom=garmin.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=pass action=none
	header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
	204.77.163.244 as permitted sender) receiver=protection.outlook.com;
	client-ip=204.77.163.244; helo=edgetransport.garmin.com;
Received: from edgetransport.garmin.com (204.77.163.244) by
	BN3NAM01FT009.mail.protection.outlook.com (10.152.67.33) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2387.28 via Frontend Transport; Thu, 31 Oct 2019 16:14:21 +0000
Received: from OLAWPA-EXMB4.ad.garmin.com (10.5.144.25) by
	olawpa-edge5.garmin.com (10.60.4.229) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
	15.1.1466.3; Thu, 31 Oct 2019 11:14:19 -0500
Received: from OLAWPA-EXMB10.ad.garmin.com (10.5.144.12) by
	OLAWPA-EXMB4.ad.garmin.com (10.5.144.25) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1779.2; Thu, 31 Oct 2019 11:14:19 -0500
Received: from ola-ght37x2-bionic.ad.garmin.com (10.5.84.15) by
	smtp.garmin.com (10.5.144.12) with Microsoft SMTP Server id 15.1.1779.2
	via Frontend Transport; Thu, 31 Oct 2019 11:14:19 -0500
From: Peter Kolbus <peter.kolbus@garmin.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 31 Oct 2019 11:13:47 -0500
Message-ID: <20191031161347.5657-1-peter.kolbus@garmin.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-TM-AS-Product-Ver: SMEX-12.5.0.1300-8.5.1010-25014.000
X-TM-AS-Result: No-0.504800-8.000000-10
X-TMASE-MatchedRID: IaTkbnUEhzTNGaPYFjg9zs9R/UqWnLW42gp+A6golzYHZBaLwEXlKDI3
	NdfFmGpMfS0Ip2eEHnzmEN83F06F6/oLR4+zsDTt9xS3mVzWUuCMx6OO8+QGvkwADsE1ndLKmqe
	5SUlAw3miDsLS4f7MfqQ5BDfdqKcgPXvTtlpeNnTt2d3l0tGS2eqf58py4POVSnmjaRssGE/Mjz
	RgmJhXhJ5GYDWqos2y9s/r/x5RpLjAmqkoMKWEeHmGvpUtLk3QVlxr1FJij9s=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--0.504800-8.000000
X-TMASE-Version: SMEX-12.5.0.1300-8.5.1010-25014.000
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:204.77.163.244; IPV:CAL; SCL:-1; CTRY:US;
	EFV:NLI; SFV:NSPM;
	SFS:(10019020)(39860400002)(346002)(136003)(396003)(376002)(189003)(199004)(51416003)(2616005)(305945005)(426003)(36756003)(70206006)(2870700001)(336012)(7636002)(70586007)(2351001)(26005)(186003)(246002)(50466002)(86362001)(7696005)(47776003)(2906002)(48376002)(6916009)(54906003)(106002)(316002)(4326008)(1076003)(26826003)(478600001)(8676002)(5660300002)(6666004)(126002)(356004)(4744005)(476003)(107886003)(76130400001)(486006)(50226002)(8936002)(44832011);
	DIR:OUT; SFP:1102; SCL:1; SRVR:SN4PR0401MB3598;
	H:edgetransport.garmin.com; FPR:; SPF:Pass; LANG:en;
	PTR:extedge.garmin.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f0c21fce-95c2-4bca-4ba4-08d75e1d6383
X-MS-TrafficTypeDiagnostic: SN4PR0401MB3598:
X-Microsoft-Antispam-PRVS: <SN4PR0401MB3598FBB2FD1601C39A73DA97FF630@SN4PR0401MB3598.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:65;
X-Forefront-PRVS: 02070414A1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a7gwRf2G/XLnKutLwUOXPLHsX+zWKfSb8kmCGC/zHLtFagaEoN7xfEb2NvX7Eb33vp5fTaC6lyZlkE8890K0R4lVy7uHwJj4Z6b240CjmJeWtMrMK0L5dVWqavfArBOv4ctmF8S9zt3azYCDmn4g3G5Wa2eIUUqcrP/RFOCzcfvA28cJff0En5oj4PEi3k+7hXwVchbBzHY535IDWi0GlkbNwZnnXPZLv7km2/DIwJtY9OQfsGOKW1ujsU18TjUomsT3AHpmElj/OjKzlxoSHFHuF4mkhOXn7UG7Y4gDk/adNBbBqcCfQFMgCb+5+CKAoMQ+nVMphZYAHhJWnNjDX31+ukDFkeo2n5zTfHRQxlyAxfzNx/zUKJ1ngGLMv88XutsuJlobSt31YX1vY537D8aGKIpvodTXn+LwCMwvxnYmaX9XQrHxEWsfxl9DPmF/
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2019 16:14:21.1635 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0c21fce-95c2-4bca-4ba4-08d75e1d6383
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;
	Ip=[204.77.163.244]; Helo=[edgetransport.garmin.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0401MB3598
Subject: [meta-python][morty][PATCH] python-enum34: add native and nativesdk
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
X-List-Received-Date: Thu, 31 Oct 2019 16:14:25 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Derek Straka <derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

(cherry picked from commit a838527ccfb33716ce7ff2c4b97c0beb13d4e654)

Signed-off-by: Peter Kolbus <peter.kolbus@garmin.com>
---
 meta-python/recipes-devtools/python/python-enum34_1.1.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-enum34_1.1.6.bb b/meta-python/recipes-devtools/python/python-enum34_1.1.6.bb
index e9d075f52..31d214717 100644
--- a/meta-python/recipes-devtools/python/python-enum34_1.1.6.bb
+++ b/meta-python/recipes-devtools/python/python-enum34_1.1.6.bb
@@ -6,3 +6,5 @@ SRC_URI[md5sum] = "5f13a0841a61f7fc295c514490d120d0"
 SRC_URI[sha256sum] = "8ad8c4783bf61ded74527bffb48ed9b54166685e4230386a9ed9b1279e2df5b1"
 
 inherit pypi setuptools
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.23.0


