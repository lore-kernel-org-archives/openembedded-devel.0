Return-Path: <danc@opengear.com>
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
	(mail-eopbgr810074.outbound.protection.outlook.com [40.107.81.74])
	by mail.openembedded.org (Postfix) with ESMTP id B50BD7E093
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Sep 2019 08:05:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=VT0je++VPS4/xGPxx3M+ckmTG5ADnFm7T9EtbRubeL2YrzJWir1XijbnbGGgoShJCoFdDBHItU2OZWotFnMq9v5+0heNOZcaUSVOVGZYkxQzOEW7T8FfubLFHmGdVpVbk43yevkzBKkjti0rSgQVMYKnNn5YwOJsrtII3WKYEVSY40/63v2gdYrzE2qYPTEqa1l3O3dFtPtkCbTYlPCWRSJdmZb5svHCQRQgkxu4+m1+bwKXiLAHpNEIgwePXJ46wS8oEUn1gKbPMxiR2VEHfQQ/4XNJKuDBfs9lYrbw8fuZAmeIVMTAN5QuOcBZ4g4MMg3jRCHZAvJWOkFmNPV7Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=ZgD4uTMh2lW46J7VgA4voAiC/Bg+SmpzZ5O6Zj5u6Hw=;
	b=llA48mDuOc0JeRHIdPGnYEGkwKaYlIKbrVxVnj25lc6f/MqcNsaTnbVrg7dj+Yw1G9HlY4Qv9Ck0FxcLrfi4BvDZazEgSdDuPIfrDkcVgeM8hFXJU823lKDU43XyKQz+hOfQKKilNrqCPbsHdB2yNtwtmLD/+dfV7xlbb4Ux2siK7ft9ku0XpOR85zEfLF0WZ8t6tzPiwJRu6HD7liqHFohOJjsrlIfbqmbcEhgBT20x+f5wjvktII90MeMSou43aeCqO/thyTkzX/semInMuwPTvGeRuuvwwm2P1/NbpPAF+Mz/TZA+UtobcYJ/UlT1bfMMi8/sGFkjhKxtDf3clw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=permerror (sender ip
	is 60.241.24.90)
	smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=opengear.com;
	dmarc=fail (p=none sp=reject pct=100) action=none
	header.from=opengear.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opengear.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=ZgD4uTMh2lW46J7VgA4voAiC/Bg+SmpzZ5O6Zj5u6Hw=;
	b=PmkIZ3JH2XEFng2c+csykTaAF/jwUkDeJdxFCTOpI1ImTs2ttghZJymfp9iVPEBbGD2lwKgrU7pMOQH760aivFP4v/QKG8bMEpG/LY+TzUyHxwdOx/XSDmYW88E9LeO0heaq45c9ktqeplkF8mFHD9KYj7f8NmEj1LPw+5F5U+w=
Received: from CH2PR15CA0001.namprd15.prod.outlook.com (2603:10b6:610:51::11)
	by DM6PR15MB2811.namprd15.prod.outlook.com (2603:10b6:5:1b0::12) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.25;
	Wed, 25 Sep 2019 08:05:52 +0000
Received: from CO1NAM04FT006.eop-NAM04.prod.protection.outlook.com
	(2a01:111:f400:7e4d::206) by CH2PR15CA0001.outlook.office365.com
	(2603:10b6:610:51::11) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.15 via
	Frontend Transport; Wed, 25 Sep 2019 08:05:50 +0000
Authentication-Results: spf=permerror (sender IP is 60.241.24.90)
	smtp.mailfrom=opengear.com; lists.openembedded.org;
	dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=fail action=none
	header.from=opengear.com;
Received-SPF: PermError (protection.outlook.com: domain of opengear.com used
	an invalid SPF mechanism)
Received: from postman.bne.opengear.com (60.241.24.90) by
	CO1NAM04FT006.mail.protection.outlook.com (10.152.90.104) with
	Microsoft SMTP Server id 15.20.2284.25 via Frontend Transport;
	Wed, 25 Sep 2019 08:05:49 +0000
Received: from galangal.danc.bne.opengear.com (danc.bne.opengear.com
	[192.168.254.90])
	by postman.bne.opengear.com (Postfix) with ESMTPS id 5D351E746A;
	Wed, 25 Sep 2019 18:05:47 +1000 (AEST)
Received: by galangal.danc.bne.opengear.com (Postfix, from userid 1090)
	id 453C942965A9; Wed, 25 Sep 2019 18:05:47 +1000 (AEST)
From: Dan Callaghan <dan.callaghan@opengear.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Sep 2019 18:05:37 +1000
Message-Id: <20190925080537.12606-1-dan.callaghan@opengear.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:60.241.24.90; IPV:CAL; CTRY:AU; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(4636009)(136003)(396003)(39840400004)(376002)(346002)(448002)(189003)(199004)(6916009)(5660300002)(47776003)(2351001)(103686004)(26826003)(7636002)(6306002)(36756003)(2361001)(76130400001)(4326008)(356004)(50226002)(1076003)(478600001)(305945005)(6666004)(426003)(246002)(486006)(8936002)(107886003)(8676002)(6266002)(336012)(2616005)(186003)(2906002)(126002)(476003)(26005)(2870700001)(48376002)(36906005)(50466002)(42186006)(70586007)(44832011)(70206006)(316002)(51416003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR15MB2811;
	H:postman.bne.opengear.com; FPR:; SPF:PermError; LANG:en;
	PTR:brisbane.opengear.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 04f3757b-8fd0-4b5a-07c4-08d7418f2ddd
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
	SRVR:DM6PR15MB2811; 
X-MS-TrafficTypeDiagnostic: DM6PR15MB2811:|DM6PR15MB2811:
X-MS-Exchange-PUrlCount: 3
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR15MB2811E8C0C996861A48A6AF61B8870@DM6PR15MB2811.namprd15.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-Forefront-PRVS: 01713B2841
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: wm20VOYlRqAGdYWxEobfh8upD9n3aoW4eO/ASBCZxjdPyZLto5Iy/ljpWE6O+Elpc5npT8D7ELluecc4FhvM0LgG0ytU6oFou0kjpd/1Djt0bq472ijHEsB74nL4QtdCjQpXgBqNvGXAxKBWEKfLa5/+YAb/Y3itJe+r4v/XWSqHKOk1rktQxjRqv7CePzumlmKSXzLjz5uHuiVv9lf6J58R7IDvgoydiKSh3V30jeqIVUoXwp/ctIr57BvcZE1TolSvVEz13vGxIZShYvKXsw+xHJe0YH/IMsjlza499DttR9Gg0MIKeWqFhW8N/XT2o//RcMIfRWgg8r7l1TOnz3y5dMINb8zyf+ZVatm1OcoM2w3FeZtLVXJN9q8MygsOr4NHA2ufQKncqn4FvZreV9hf0UIRMpOliUwd2PCCxIcneTQTFnXh+rmgQ7+Jqdxgm9tqbpcaFvRc9yU80QA/bA==
X-OriginatorOrg: opengear.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2019 08:05:49.6979 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04f3757b-8fd0-4b5a-07c4-08d7418f2ddd
X-MS-Exchange-CrossTenant-Id: a6251c26-d21f-4164-a225-1f4eaebf5f9a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a6251c26-d21f-4164-a225-1f4eaebf5f9a; Ip=[60.241.24.90];
	Helo=[postman.bne.opengear.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR15MB2811
Subject: [meta-python][PATCH] add new recipes for python-lrparsing, python3-lrparsing
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
X-List-Received-Date: Wed, 25 Sep 2019 08:05:53 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The lrparsing library is an LR(1) parsing library for Python.
Grammars can be defined using Python expressions.
---
 .../recipes-devtools/python/python-lrparsing.inc | 16 ++++++++++++++++
 .../python/python-lrparsing_1.0.16.bb            |  2 ++
 .../python/python3-lrparsing_1.0.16.bb           |  2 ++
 3 files changed, 20 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-lrparsing.inc
 create mode 100644 meta-python/recipes-devtools/python/python-lrparsing_1.0.16.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-lrparsing_1.0.16.bb

diff --git a/meta-python/recipes-devtools/python/python-lrparsing.inc b/meta-python/recipes-devtools/python/python-lrparsing.inc
new file mode 100644
index 000000000..d125151cd
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-lrparsing.inc
@@ -0,0 +1,16 @@
+SUMMARY = "Python LR parsing library"
+SECTION = "devel/python"
+LICENSE = "AGPL-3.0"
+LIC_FILES_CHKSUM = "file://agpl-3.0.txt;md5=73f1eb20517c55bf9493b7dd6e480788"
+
+HOMEPAGE = "http://lrparsing.sourceforge.net/"
+BUGTRACKER = "https://sourceforge.net/p/lrparsing/tickets/"
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/lrparsing/files/"
+UPSTREAM_CHECK_REGEX = "lrparsing-(?P<pver>\d+(\.\d+)+)"
+SRC_URI = "${SOURCEFORGE_MIRROR}/lrparsing/lrparsing-${PV}.tar.gz"
+SRC_URI[md5sum] = "34357d69bce87654d792cd8f02d148b2"
+SRC_URI[sha256sum] = "b45afda44001dc5ba632934f74c043d40cce653f1a7526cfbcb68f6be055b8d7"
+
+S = "${WORKDIR}/lrparsing-${PV}"
+
+BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python-lrparsing_1.0.16.bb b/meta-python/recipes-devtools/python/python-lrparsing_1.0.16.bb
new file mode 100644
index 000000000..2cfe3012e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-lrparsing_1.0.16.bb
@@ -0,0 +1,2 @@
+inherit setuptools
+require python-lrparsing.inc
diff --git a/meta-python/recipes-devtools/python/python3-lrparsing_1.0.16.bb b/meta-python/recipes-devtools/python/python3-lrparsing_1.0.16.bb
new file mode 100644
index 000000000..21a80cde1
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-lrparsing_1.0.16.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-lrparsing.inc
-- 
2.20.1


