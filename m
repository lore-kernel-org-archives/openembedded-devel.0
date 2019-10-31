Return-Path: <Peter.Kolbus@garmin.com>
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
	(mail-eopbgr700094.outbound.protection.outlook.com [40.107.70.94])
	by mail.openembedded.org (Postfix) with ESMTP id 6C4D87FA3F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2019 16:35:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=gUjvRiX90DSbG5DBULCLjND1bwmbCph4Sp/rJ8KB5yx9/nLmdMrHE2Df3K/HF5gwbynp+sdmZYOgN7c1oCKbrZotqcAU9wTtDQbCd3TSJ68K7/GIL3jIXBAIKzv9yzZu8je5rksbogXO1eturepbdKYB08Fu85YjGvhqkZVzqJfkCjSdNmWdQvq6DDouHv3BXiv82HIudopJBtzajGc3/1M5MzBTRdkfvtCxmpPGy9Tpjo4Q/RTvpeBEhtZfq9/1t1JjaFPe2sOVmCkC6BSH5qSY6OrAHVDK3rlkmuIDTSATXzTJLF8nSv4Y1ByZvGY/T0hujC+XU1d3HzxcTRs+XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=3uxl7sqCuUzma2GLtFLvBxAnNvXktIH75h16AJnNmjU=;
	b=GxapByIQV4ooafwgEMsAj4ojOS8BayeEQy+5P2P3zvjah6+1DJhmSQ/7wCSCARaAF37KssolUS2Bh8SlmGg886fQhxQjGRTfqhC7UHXxXmAIyP9BKcp4BdbxTtfAlisnC7fLnzPzTINIxRHNZmBNjv/WTh8p9qyRduBSXAq04yJ4e/snwTIyHr37XU9le5XALPxiy0utJx20QLWqHzY56iXSEOltoiS+vINg4NhXOUKJzUV3noGg5FDCZZsMsythxjq80CVztSO/5FNAuFEh3fpWJ6pJz+7/b2qE1FqQbGDHMUJKxaDt6DLO42lo3lt5VKlDPP7t8OHXQeyn8n7tbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
	204.77.163.244) smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=garmin.com;
	dmarc=pass (p=none sp=none pct=100) action=none
	header.from=garmin.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=3uxl7sqCuUzma2GLtFLvBxAnNvXktIH75h16AJnNmjU=;
	b=QzBl5jqAYzHSiPRrv1mMEXD9fb+1knBD+bJwvTiArCDAJVeEQ/wGhiNhKR1qX6ALAS2af/Qpt6eAH69qErR++taSUMVVmgpQa1B/Yv86LIw9ZHMIwcGmpySalj2XJXTYImX9mG0sTVQVDJp+Uh90UMIHE5++7HXIZU5RTWNLEmg=
Received: from MWHPR04CA0027.namprd04.prod.outlook.com (2603:10b6:300:ee::13)
	by DM6PR04MB4330.namprd04.prod.outlook.com (2603:10b6:5:a0::16) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2387.24;
	Thu, 31 Oct 2019 16:35:57 +0000
Received: from BN3NAM01FT045.eop-nam01.prod.protection.outlook.com
	(2a01:111:f400:7e41::202) by MWHPR04CA0027.outlook.office365.com
	(2603:10b6:300:ee::13) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2408.20 via
	Frontend Transport; Thu, 31 Oct 2019 16:35:57 +0000
Authentication-Results: spf=pass (sender IP is 204.77.163.244)
	smtp.mailfrom=garmin.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=pass action=none
	header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
	204.77.163.244 as permitted sender) receiver=protection.outlook.com;
	client-ip=204.77.163.244; helo=edgetransport.garmin.com;
Received: from edgetransport.garmin.com (204.77.163.244) by
	BN3NAM01FT045.mail.protection.outlook.com (10.152.66.101) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2387.28 via Frontend Transport; Thu, 31 Oct 2019 16:35:56 +0000
Received: from OLAWPA-EXMB3.ad.garmin.com (10.5.144.15) by
	olawpa-edge2.garmin.com (10.60.4.35) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
	15.1.1466.3; Thu, 31 Oct 2019 11:35:54 -0500
Received: from OLAWPA-EXMB10.ad.garmin.com (10.5.144.12) by
	OLAWPA-EXMB3.ad.garmin.com (10.5.144.15) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1779.2; Thu, 31 Oct 2019 11:35:54 -0500
Received: from ola-ght37x2-bionic.ad.garmin.com (10.5.84.15) by
	smtp.garmin.com (10.5.144.12) with Microsoft SMTP Server id 15.1.1779.2
	via Frontend Transport; Thu, 31 Oct 2019 11:35:54 -0500
From: Peter Kolbus <peter.kolbus@garmin.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 31 Oct 2019 11:33:58 -0500
Message-ID: <20191031163358.6087-2-peter.kolbus@garmin.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191031163358.6087-1-peter.kolbus@garmin.com>
References: <20191031163358.6087-1-peter.kolbus@garmin.com>
MIME-Version: 1.0
X-TM-AS-Product-Ver: SMEX-12.5.0.1300-8.5.1010-25014.000
X-TM-AS-Result: No-5.451000-8.000000-10
X-TMASE-MatchedRID: rwxUSFQaYEHpUhdxxt+sdSL/7WCg9OOSI4Ndo8MhO4nfUZT83lbkEEtw
	ojBSFTO9RRlX6jUB37QHq/7mBVbccgMj3UjQ3RjvD3uYMxd01besZnDVEGjnwSejSyZ3UYtkwXL
	S0LkPCagM8WkpUhX3nzDRobs3qSfocfRJq1ctTfycxB01DrjF9+uLFZZYlisfHxPMjOKY7A8Lbi
	gRnpKlKTpcQTtiHDgWDaYLjwJCjqe1A9Hj8i3XZh+kR6r6IC6A3j3Y8lp4AkcVV2XFIAn1kUMMp
	rcbiest
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.451000-8.000000
X-TMASE-Version: SMEX-12.5.0.1300-8.5.1010-25014.000
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:204.77.163.244; IPV:CAL; SCL:-1; CTRY:US;
	EFV:NLI; SFV:NSPM;
	SFS:(10019020)(376002)(396003)(136003)(39860400002)(346002)(189003)(199004)(24433001)(2870700001)(7696005)(76176011)(51416003)(426003)(336012)(1076003)(7636002)(305945005)(246002)(70586007)(70206006)(36756003)(107886003)(6916009)(26005)(50466002)(476003)(48376002)(126002)(446003)(11346002)(44832011)(5660300002)(486006)(2616005)(186003)(356004)(86362001)(2906002)(8676002)(26826003)(2351001)(4326008)(54906003)(8936002)(50226002)(76130400001)(14444005)(106002)(6306002)(316002)(47776003)(478600001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR04MB4330;
	H:edgetransport.garmin.com; FPR:; SPF:Pass; LANG:en;
	PTR:extedge.garmin.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b8a96815-aa2e-4474-ec07-08d75e206796
X-MS-TrafficTypeDiagnostic: DM6PR04MB4330:
X-MS-Exchange-PUrlCount: 1
X-Microsoft-Antispam-PRVS: <DM6PR04MB4330572EC672E884110D3F12FF630@DM6PR04MB4330.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:989;
X-Forefront-PRVS: 02070414A1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +ldK1z13xwHaTCCf9ApJYxamtVRiN19pPDRN2KhgF7bKqrdJE224IAQlhrBcuCqdaRbl20vv7x/NYgodf2I6xGvAXCdgWj+Me8DTkR/nE2lxHJSEFg7bewN5MP8GLumtHI/cz1gWi2qVzNm/OAMNtVOnCovM3McPrGSlRqeYJRGRBQmKDOJ6tQoBuC9qlNiXnV3J1O6eRRYjP03tML8tD/LctCOzVWp3akUxe74zbV86bOhLdhcZaWw3Vtv+9+3w4nEcWkMvhCRoh3tWjLvrveVRfDUw5Djsac6UYB4vp9GHlxNZ5vrIyZNS2gC+eFXS8IBq8c+S1YpevoleLl8vUTHkPDfLOtK8exSuLZUdiqW0qjTVdNiwpTtbubMpyCzXOJkujx8VAu33At0TX5dGXFaCry8LcFE1UmseY5c4EPvqGh7lVOhaFNjdFwWkkrkhJUgji2AXe5ASe3jtKi3duxc1Bpc+0tDHw2Cuigo+6Mdlm85uGyOccAr8IxNKCXox
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2019 16:35:56.4982 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8a96815-aa2e-4474-ec07-08d75e206796
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;
	Ip=[204.77.163.244]; Helo=[edgetransport.garmin.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB4330
Subject: [meta-python][morty][PATCH 1/2] python-setuptools-scm: update to version 1.15.0
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
X-List-Received-Date: Thu, 31 Oct 2019 16:35:58 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Derek Straka <derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

(cherry picked from commit cdbc7cdc285d0f5ee68569ee03f695ec4529125f)

Signed-off-by: Peter Kolbus <peter.kolbus@garmin.com>
---
 .../python/python-setuptools-scm_1.11.1.bb     | 18 ------------------
 .../python/python-setuptools-scm_1.15.0.bb     | 13 +++++++++++++
 2 files changed, 13 insertions(+), 18 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-setuptools-scm_1.11.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python-setuptools-scm_1.15.0.bb

diff --git a/meta-python/recipes-devtools/python/python-setuptools-scm_1.11.1.bb b/meta-python/recipes-devtools/python/python-setuptools-scm_1.11.1.bb
deleted file mode 100644
index 2a3b97d83..000000000
--- a/meta-python/recipes-devtools/python/python-setuptools-scm_1.11.1.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY = "the blessed package to manage your versions by scm tags"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=838c366f69b72c5df05c96dff79b35f2"
-
-inherit pypi setuptools
-
-SRCNAME = "setuptools_scm"
-
-SRC_URI = "https://pypi.python.org/packages/84/aa/c693b5d41da513fed3f0ee27f1bf02a303caa75bbdfa5c8cc233a1d778c4/${SRCNAME}-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "4d19b2bc9580016d991f665ac20e2e8f"
-SRC_URI[sha256sum] = "8c45f738a23410c5276b0ed9294af607f491e4260589f1eb90df8312e23819bf"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-RDEPENDS_${PN} = "python-py python-setuptools python-argparse python-debugger python-json"
-
-
diff --git a/meta-python/recipes-devtools/python/python-setuptools-scm_1.15.0.bb b/meta-python/recipes-devtools/python/python-setuptools-scm_1.15.0.bb
new file mode 100644
index 000000000..45204c98c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-setuptools-scm_1.15.0.bb
@@ -0,0 +1,13 @@
+SUMMARY = "the blessed package to manage your versions by scm tags"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=838c366f69b72c5df05c96dff79b35f2"
+
+SRC_URI[md5sum] = "b6916c78ed6253d6602444fad4279c5b"
+SRC_URI[sha256sum] = "daf12d05aa2155a46aa357453757ffdc47d87f839e62114f042bceac6a619e2f"
+
+PYPI_PACKAGE = "setuptools_scm"
+inherit pypi setuptools
+
+RDEPENDS_${PN} = "python-py python-setuptools python-argparse python-debugger python-json"
+
+
-- 
2.23.0


