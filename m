Return-Path: <danc@opengear.com>
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
	(mail-eopbgr780054.outbound.protection.outlook.com [40.107.78.54])
	by mail.openembedded.org (Postfix) with ESMTP id D912F7E1E7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Sep 2019 07:45:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=ZHuL5pbvLrFSs+fJ7iezmcglLW//NwygTxI6nb3WBkw1Hs9ggeKWG0G0sbD2lWeIikd2hi4e5PZfK/g9sdjofuQjSFRHQ5hfeldEHUJJQg4L4Ej22U3PirrPHmRQqxv5fPaMGpQ31kpopvxbYUFFTRUL/lzujqysBGt+KpGzXq9OsVG1rlXNpD4gZrb62OuJxiHJmK0exo681PARqXFPMztOgrK8f+Py8HBvCGDzlblvRQSXg0FrVfcWpKbFgF2w97hu7BDKbMHBxXOhae/fGPz1UB4DEDsYiK+HeSnBZ1+OC4fuYAiABtN33svzd0i9psn3+jeSlO3IgTCgVx4A4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=8VFbiUdc9nInrp2Bu6ntm44/e1hpssbu0bObmrg8ISM=;
	b=HG2EDV1R/05hKG3JciF0WfPxm4skbPX4BMKCsV8A9PW0GRAzLHOgTzoyoyqQ+ljwfM1aBCGryVVSdf95i+pn2h1KLVud2+FH+iJ+S1VBDJqFUTWb1SVk62SjGIi5qZ35PqMXRhe4xeRPMHhEY1Zz7845D02wnvHfU7h7PJP+hHeD0PT+SM2aO4Uwx/o850ULR+bxZYAaWJwapbDVkkgqMoV8XnJVjnLKLJo3JKIAuKJNA88gpr2/o/b12HXFI4aCXKxo2QhI4ViWl3/fODXpsaL/7gaglnbBc0OzIWdQFZfn+S2ZmlLBNgQ4oaJF1om/TyzEjqQBn6CXi/P3AbVSBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=permerror (sender ip
	is 60.241.24.90)
	smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=opengear.com;
	dmarc=fail (p=none sp=reject pct=100) action=none
	header.from=opengear.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opengear.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=8VFbiUdc9nInrp2Bu6ntm44/e1hpssbu0bObmrg8ISM=;
	b=HivQg1kjrTmc+FJGcICMGTXEWrcH1sVYpcvJpSl/4c/WgmNPfKXT75iKoYUpWEwOTzUyrNCXf0lKSfuuYfKG+DEJ4wqNXqhqsrs+fd0DqTEugTaNBIesHconM9sFSsonSAG5F61qY1gfOhtNo2kar2np5IdqH/59RLLN77DO8aA=
Received: from SN6PR1501CA0035.namprd15.prod.outlook.com (2603:10b6:805::48)
	by BYAPR15MB2296.namprd15.prod.outlook.com (2603:10b6:a02:8b::13) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.26;
	Wed, 25 Sep 2019 07:45:08 +0000
Received: from BN3NAM04FT027.eop-NAM04.prod.protection.outlook.com
	(2a01:111:f400:7e4e::202) by SN6PR1501CA0035.outlook.office365.com
	(2603:10b6:805::48) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.20 via
	Frontend Transport; Wed, 25 Sep 2019 07:45:08 +0000
Authentication-Results: spf=permerror (sender IP is 60.241.24.90)
	smtp.mailfrom=opengear.com; lists.openembedded.org;
	dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=fail action=none
	header.from=opengear.com;
Received-SPF: PermError (protection.outlook.com: domain of opengear.com used
	an invalid SPF mechanism)
Received: from postman.bne.opengear.com (60.241.24.90) by
	BN3NAM04FT027.mail.protection.outlook.com (10.152.92.171) with
	Microsoft SMTP Server id 15.20.2284.20 via Frontend Transport;
	Wed, 25 Sep 2019 07:45:07 +0000
Received: from galangal.danc.bne.opengear.com (danc.bne.opengear.com
	[192.168.254.90])
	by postman.bne.opengear.com (Postfix) with ESMTPS id 53F49E746A;
	Wed, 25 Sep 2019 17:45:04 +1000 (AEST)
Received: by galangal.danc.bne.opengear.com (Postfix, from userid 1090)
	id 361C142965A9; Wed, 25 Sep 2019 17:45:04 +1000 (AEST)
From: Dan Callaghan <dan.callaghan@opengear.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Sep 2019 17:45:00 +1000
Message-Id: <20190925074500.9427-1-dan.callaghan@opengear.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:60.241.24.90; IPV:CAL; CTRY:AU; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(4636009)(39840400004)(136003)(396003)(376002)(346002)(448002)(189003)(199004)(48376002)(6266002)(2906002)(2351001)(50226002)(26826003)(305945005)(246002)(2870700001)(6666004)(356004)(50466002)(103686004)(8676002)(7636002)(8936002)(36756003)(5660300002)(44832011)(26005)(186003)(476003)(6916009)(2616005)(126002)(2361001)(107886003)(478600001)(47776003)(1076003)(70206006)(76130400001)(51416003)(70586007)(4744005)(336012)(426003)(486006)(6306002)(42186006)(36906005)(4326008)(316002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR15MB2296;
	H:postman.bne.opengear.com; FPR:; SPF:PermError; LANG:en;
	PTR:brisbane.opengear.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a790dc7-af99-4fed-8915-08d7418c498d
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(2017052603328);
	SRVR:BYAPR15MB2296; 
X-MS-TrafficTypeDiagnostic: BYAPR15MB2296:|BYAPR15MB2296:
X-MS-Exchange-PUrlCount: 3
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR15MB2296059F14C493456D1B6E0CB8870@BYAPR15MB2296.namprd15.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1051;
X-Forefront-PRVS: 01713B2841
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 0VVxfTzc82HTHUnz5bo/JDcJk8kz9kCLDpieC6kYEf6wiUYtKY8zY+iOzkDjvaRIPVp/LaNXmP82b+y92ekeyYKX5ezbvkIEVW5++n0HBcnpR48K0OyvM936xlQWYK5kMsoE5tI8VNTnS1JDWvQGKdsW+Jrnu7vEoR059R0kIf2evglDtjbue2flykojEptAXBBR6NM4Go/zQP+Sa3Kf6wUrQ/iA7hqsiZ94Qr79DBf7G5ljimAMN9Glx0x2aUdvU1qB4x/lbIKCy4gyDxjQp7ehrUX2J085fQGV1RGuMG/NPvDkrQELbeJT0IgXOw0vlCpnXRaqqlshZrApC3gefZcdSfy6Y1qzV2aLAEvyaiyiNBjNZicTo9Isk2NDPK2SNeskh72amj1OgYcd8P16HqKWP1B+fpKy2/ddmIQZf1DH/tw2CIZcNQKl31iVJxETBXUcsAYl6T66ED++l44DLw==
X-OriginatorOrg: opengear.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2019 07:45:07.7010 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a790dc7-af99-4fed-8915-08d7418c498d
X-MS-Exchange-CrossTenant-Id: a6251c26-d21f-4164-a225-1f4eaebf5f9a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a6251c26-d21f-4164-a225-1f4eaebf5f9a; Ip=[60.241.24.90];
	Helo=[postman.bne.opengear.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2296
Subject: [meta-networking][PATCH] firewalld: add UPSTREAM_CHECK_URI
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
X-List-Received-Date: Wed, 25 Sep 2019 07:45:11 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

---
 .../recipes-connectivity/firewalld/firewalld_0.7.1.bb            | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-connectivity/firewalld/firewalld_0.7.1.bb b/meta-networking/recipes-connectivity/firewalld/firewalld_0.7.1.bb
index 15567f636..a51c145eb 100644
--- a/meta-networking/recipes-connectivity/firewalld/firewalld_0.7.1.bb
+++ b/meta-networking/recipes-connectivity/firewalld/firewalld_0.7.1.bb
@@ -1,6 +1,7 @@
 SUMMARY = "Dynamic firewall daemon with a D-Bus interface"
 HOMEPAGE = "https://firewalld.org/"
 BUGTRACKER = "https://github.com/firewalld/firewalld/issues"
+UPSTREAM_CHECK_URI = "https://github.com/firewalld/firewalld/releases"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-- 
2.20.1


