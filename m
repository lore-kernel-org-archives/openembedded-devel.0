Return-Path: <danc@opengear.com>
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-eopbgr800077.outbound.protection.outlook.com [40.107.80.77])
	by mail.openembedded.org (Postfix) with ESMTP id 7CBB07F331
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Aug 2019 03:40:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=gtAqOeF9ZHuaHwZJwH9GxiNDcv8vFsM+8TGK+SiYo3i3+kLpzNzWx3qJJKGWxrTvjDec+0O6f23D/nTncyd2jtecjV7o4KMNeBhh1ct+INuBqkrXxtn11qGtSdwFarZKFoL6djtiabNuNLLPetgBnpt9p+41kT2EsF14CDLCWS7+bR2Svd2ta2tc1jxluSGxRuUw/BAHEKRkxMd3zMLW1UO5Lpic+uLjvStIWoIg9Rs7nziKClSMQPt2Wafsl+UocT/YDMCE7dm+f7CY/OBdM0P3PnIhrqH06K7Ylvc39RddY+WHSZSoDNDHyzxEuGNtvr5BftmFZ2XowK/4q6Y5VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=JHHouS2SuKUag3FGRCZwKmomC7mhtsIyI54eHRQWtHk=;
	b=lENEDpl9BKl9Wpqx3Z+T6HwFp5ds5HxMJEOo6NyfQurfvOWa8pnrMyeVCWA/ORmbUOlaQhtEYRmCUrP0FX4EI/utycyOes+4KsyMUx4cQ6zUfFPnCbcKjOKeSB6+JljzDXYP3p8jGBN/1kvQgj+WZPYxp2oVyJ3+0ZjbEFVDG2L3/AYR9lwyNyWZEKfu/qQIcqab2Eb8nb6YoXsukENQmhcqYYboHyPOfbMOgTuEFUeWXe92QvP7z8EVbkxAufxIvaQA32fOZVFdW9I4z71SqhZvGnw+HBLliLOR+Glziz6qgTJ+HkPWga9SCzWUuYhBDI4YmI565urC8YD5z1OuxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=permerror (sender ip
	is 60.241.24.90) smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=opengear.com;
	dmarc=fail (p=none sp=reject pct=100) action=none
	header.from=opengear.com;dkim=none (message not signed);arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opengear.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=JHHouS2SuKUag3FGRCZwKmomC7mhtsIyI54eHRQWtHk=;
	b=FHIPN0X3uX02O3tjJsnAOIcVg+iD0Pz1AXiGSpMcU1uRSLIx9rQqCA7Jb/w7E3rYbMi6ModNHBKqZVTy7NX+emgCEr7tncNLanphHVwj76jO3mQVGBAdpAQE/OlcCB7p+QYXEYE5GEeqb0L2itstODJCi/19UBJO7jVrY+CFGTE=
Received: from CY4PR15CA0007.namprd15.prod.outlook.com (10.172.74.17) by
	BN6PR15MB1937.namprd15.prod.outlook.com (10.172.210.11) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2136.17; Thu, 8 Aug 2019 03:40:29 +0000
Received: from CO1NAM04FT004.eop-NAM04.prod.protection.outlook.com
	(2a01:111:f400:7e4d::208) by CY4PR15CA0007.outlook.office365.com
	(2603:10b6:910:14::17) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.14 via
	Frontend Transport; Thu, 8 Aug 2019 03:40:29 +0000
Authentication-Results: spf=permerror (sender IP is 60.241.24.90)
	smtp.mailfrom=opengear.com; lists.openembedded.org;
	dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=fail action=none
	header.from=opengear.com;
Received-SPF: PermError (protection.outlook.com: domain of opengear.com used
	an invalid SPF mechanism)
Received: from postman.bne.opengear.com (60.241.24.90) by
	CO1NAM04FT004.mail.protection.outlook.com (10.152.90.121) with
	Microsoft SMTP
	Server id 15.20.2157.15 via Frontend Transport; Thu, 8 Aug 2019 03:40:27
	+0000
Received: from galangal.danc.bne.opengear.com (danc.bne.opengear.com
	[192.168.254.90])
	by postman.bne.opengear.com (Postfix) with ESMTPS id 7F959DFC5B;
	Thu,  8 Aug 2019 13:40:25 +1000 (AEST)
Received: by galangal.danc.bne.opengear.com (Postfix, from userid 1090)
	id 616AA42CD5C7; Thu,  8 Aug 2019 13:40:25 +1000 (AEST)
From: Dan Callaghan <dan.callaghan@opengear.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  8 Aug 2019 13:40:22 +1000
Message-Id: <20190808034022.2337-1-dan.callaghan@opengear.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:60.241.24.90; IPV:CAL; CTRY:AU; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(4636009)(376002)(396003)(39840400004)(346002)(136003)(2980300002)(448002)(189003)(199004)(36906005)(126002)(4744005)(4326008)(8936002)(8676002)(14444005)(36756003)(50466002)(6916009)(44832011)(50226002)(48376002)(2616005)(6306002)(486006)(5660300002)(476003)(76130400001)(52956003)(103686004)(107886003)(47776003)(2870700001)(2351001)(26005)(186003)(246002)(70586007)(7636002)(2906002)(305945005)(2361001)(356004)(42186006)(426003)(1076003)(6266002)(26826003)(70206006)(51416003)(478600001)(336012)(6666004)(316002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR15MB1937;
	H:postman.bne.opengear.com; FPR:; SPF:PermError; LANG:en;
	PTR:brisbane.opengear.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3939d47e-45b6-448b-dea8-08d71bb227e6
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
	SRVR:BN6PR15MB1937; 
X-MS-TrafficTypeDiagnostic: BN6PR15MB1937:
X-MS-Exchange-PUrlCount: 2
X-Microsoft-Antispam-PRVS: <BN6PR15MB19379C6045E85D84A40A00E3B8D70@BN6PR15MB1937.namprd15.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-Forefront-PRVS: 012349AD1C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: RfXsKzNk5ou0AYJUESDPkYX+9RCEVq4cSwl8PfE/ot/mUWx9caTNsxSx/tQwP0G0BsqvuYyh2TtS71mz4dhpDDYiso9iiYqvg9vEkpmJlL6oOcN99x0ECLEX4j2jFLZGRwkISjdZZSfLBNQRvD/I5gma6w5csJ1P/ArM/NmleGg3snqMh+ogE4VOhcCiiJmaVVb2NOBlk0dKLyzhLS1dvJTWPQ4gmFqJic1Ulp8YWbzVfdYWaZI3fhn/aWukgWVjw2LlrW8KQOjJC1ExbcyTrpHylZ1GQSlhAVf4xevmqoBtwtDOCXO+TGgLIsm9hFz8MPjIEkgtVYgq9MO82Qn+l77i/xxL92OGIkfNn1Z4Q9Y0rm8Qsop2PRj9jonp7u/QUGW4019zxW6ToMMZTx8qgW99CFevrujNs8fPvMPtG3k=
X-OriginatorOrg: opengear.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2019 03:40:27.9601 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3939d47e-45b6-448b-dea8-08d71bb227e6
X-MS-Exchange-CrossTenant-Id: a6251c26-d21f-4164-a225-1f4eaebf5f9a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a6251c26-d21f-4164-a225-1f4eaebf5f9a; Ip=[60.241.24.90];
	Helo=[postman.bne.opengear.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR15MB1937
Subject: [meta-oe][PATCH] unixodbc: mysql5 is not required but readline is
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
X-List-Received-Date: Thu, 08 Aug 2019 03:40:31 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The unixODBC package no longer includes a driver for MySQL (that lives
elsewhere) so there is no reason to require MySQL libs at build time.

It does, however, want to build against readline, which was being pulled
in transitively by mysql5 before.

Signed-off-by: Dan Callaghan <dan.callaghan@opengear.com>
---
 meta-oe/recipes-support/unixodbc/unixodbc_2.3.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/unixodbc/unixodbc_2.3.7.bb b/meta-oe/recipes-support/unixodbc/unixodbc_2.3.7.bb
index 563badf57..61378fec2 100644
--- a/meta-oe/recipes-support/unixodbc/unixodbc_2.3.7.bb
+++ b/meta-oe/recipes-support/unixodbc/unixodbc_2.3.7.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://www.unixodbc.org/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d7b37bf80a3df5a65b355433ae36d206"
 
-DEPENDS = "libtool mysql5"
+DEPENDS = "libtool readline"
 
 SRC_URI = "http://ftp.unixodbc.org/unixODBC-${PV}.tar.gz \
            file://do-not-use-libltdl-source-directory.patch \
-- 
2.20.1


