Return-Path: <danc@opengear.com>
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
	(mail-eopbgr710071.outbound.protection.outlook.com [40.107.71.71])
	by mail.openembedded.org (Postfix) with ESMTP id A0CBD7997D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Aug 2019 05:15:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=dajWDPjT+xYUiUf4cN1er8Z6LEh2AhekFQeiySzq0FdYnBaXnuGHf1HZNBx01zbzz+3MOh3Fuq9AhC7GiUncZgwwB6qIuFmsMtPvuEELruGljjFqgTXZT2THfsQijsurpxR1AvxTC165ZZ6vT+9X9c0yRQbhGyPpZHzruejJkjoWjAteSkj++SfZHd4jMbS7QyldjAVXuKuPvPyO+Az3402OqVh71qPSxjdjtAQm5H0xe/vI/NWYLz25vemw29ah8V9k0Ot7otC4lL5i5yrbTXsXyedmCWBZr1yvrMc7CSpFhgTNLqCQj+NXVOfjTVf3EuAKFh7OY2/C2Q5fX8Ry5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=HAPPdQc/Dc6Y5VX258Ghmjjmzw4cQ1Oa5TBfPC+28gM=;
	b=irYnr6YTQ+bbIh60+wFxqbvu0zzXftwqYFcd9PQJl5aKDwZKBAuadIPOJ3//QBKy2zW7qSjiIq8Fvz3+TKaHfUqRf3wrUAoWuLyA7VkhMOELKyPCVUybaWTYkQVI3c+umA3MJXoKt0UoJkRovh9yh4U5gamPaJucsOdXapcCoO8Io6N7J5oIUNJ7nUM26eZqHtr1BIgb7h2ShYGhh4/2p2cnprpyFfI46N05/sMKVuFPplk8mljsUoK6zqh0khzXEVyMHY6r26kv1iHezK+XNtYJpzJFGaFO+RDdsxvEccMOyKR01lRCZ/4kbo/ma0dcuJiDbFM75zDHRNjZAdyBKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=permerror (sender ip
	is 60.241.24.90)
	smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=opengear.com;
	dmarc=fail (p=none sp=reject pct=100) action=none
	header.from=opengear.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opengear.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=HAPPdQc/Dc6Y5VX258Ghmjjmzw4cQ1Oa5TBfPC+28gM=;
	b=AauxML6K6l/OjtK32FkFr0HwELVvGQgpOUa1acadCrYEPmxE2m8aNUzqKkjOYKSOjLCaaan9CrQ1HLcL2nW0VI9IWlnZ5WlrNGUi7TNwKcvC7wR4vZij7VjO6VAK/fevbO3vxodaTzTO01klSfphkEx/l2mNytvWM1DnLduqFnI=
Received: from DM5PR1501CA0026.namprd15.prod.outlook.com (2603:10b6:4:9d::39)
	by BN6PR15MB1938.namprd15.prod.outlook.com (2603:10b6:404:f3::21)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.21;
	Tue, 13 Aug 2019 05:15:34 +0000
Received: from SN1NAM04FT019.eop-NAM04.prod.protection.outlook.com
	(2a01:111:f400:7e4c::205) by DM5PR1501CA0026.outlook.office365.com
	(2603:10b6:4:9d::39) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.14 via
	Frontend Transport; Tue, 13 Aug 2019 05:15:33 +0000
Authentication-Results: spf=permerror (sender IP is 60.241.24.90)
	smtp.mailfrom=opengear.com; lists.openembedded.org;
	dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=fail action=none
	header.from=opengear.com;
Received-SPF: PermError (protection.outlook.com: domain of opengear.com used
	an invalid SPF mechanism)
Received: from postman.bne.opengear.com (60.241.24.90) by
	SN1NAM04FT019.mail.protection.outlook.com (10.152.88.152) with
	Microsoft SMTP Server id 15.20.2157.15 via Frontend Transport;
	Tue, 13 Aug 2019 05:15:33 +0000
Received: from galangal.danc.bne.opengear.com (danc.bne.opengear.com
	[192.168.254.90])
	by postman.bne.opengear.com (Postfix) with ESMTPS id 54473DEB2B;
	Tue, 13 Aug 2019 15:15:31 +1000 (AEST)
Received: by galangal.danc.bne.opengear.com (Postfix, from userid 1090)
	id 31F4342F24F7; Tue, 13 Aug 2019 15:15:31 +1000 (AEST)
From: Dan Callaghan <dan.callaghan@opengear.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 Aug 2019 15:15:18 +1000
Message-Id: <20190813051518.27073-1-dan.callaghan@opengear.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:60.241.24.90; IPV:CAL; CTRY:AU; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(4636009)(376002)(346002)(136003)(39840400004)(396003)(2980300002)(448002)(189003)(199004)(6266002)(246002)(47776003)(8676002)(2906002)(1076003)(48376002)(103686004)(8936002)(478600001)(50466002)(6916009)(44832011)(52956003)(26826003)(6666004)(356004)(50226002)(486006)(51416003)(26005)(305945005)(7636002)(126002)(107886003)(476003)(2616005)(426003)(36906005)(336012)(186003)(42186006)(316002)(5660300002)(76130400001)(70206006)(70586007)(36756003)(2361001)(4326008)(2351001)(2870700001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR15MB1938;
	H:postman.bne.opengear.com; FPR:; SPF:PermError; LANG:en;
	PTR:brisbane.opengear.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 541fbdf2-cf4c-4b64-1f6f-08d71fad4483
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
	SRVR:BN6PR15MB1938; 
X-MS-TrafficTypeDiagnostic: BN6PR15MB1938:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN6PR15MB19383DEB6C1D7A18C12AD585B8D20@BN6PR15MB1938.namprd15.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-Forefront-PRVS: 01283822F8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 2UNTVD9Iz0vYLvtXqMgQq3YEo7BuoScY+IGsR7fTSnlsCJIrTqZe+i+s7BJHNmWXH5R4XI76HE2wnHZ0XhBh9aK12PCievCeL2NSb0KZ5XYfe97+nlToA91U3aGMMs3zeBWaquTByzl9AJlm/g3BHROZx04QSAk5C3vFDDtHIN7b/vMyb0CIYt5CA0OtueUgR1Tg37NIu1DO94SbOPf7JROzjgvdemmdJkPGuTNc/IPhsUHGk2ntQ1dT2cIyfXWP7lGrsiimbMxGAS0qsN/UWj3qa3V071PKYg1odHWt45zmxMMCAJVxkd6iVEGkkUj6KGninNZj/BFcKLY6An2L4tdKwZGop/69rDwlphAC38PSTcjRxdGYUgywkKlMQci373PZOWHOhnOQHxCHeGtAQW4Bl/Wdyr27DiqLmpEMXoI=
X-OriginatorOrg: opengear.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2019 05:15:33.1368 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 541fbdf2-cf4c-4b64-1f6f-08d71fad4483
X-MS-Exchange-CrossTenant-Id: a6251c26-d21f-4164-a225-1f4eaebf5f9a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a6251c26-d21f-4164-a225-1f4eaebf5f9a; Ip=[60.241.24.90];
	Helo=[postman.bne.opengear.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR15MB1938
Subject: [meta-python][PATCH] python3-pystemd: add new recipe
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
X-List-Received-Date: Tue, 13 Aug 2019 05:15:35 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This library provides wrappers around the systemd DBus API for
manipulating systemd services.

Signed-off-by: Dan Callaghan <dan.callaghan@opengear.com>
---
 .../recipes-devtools/python/python3-pystemd_0.6.0.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pystemd_0.6.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-pystemd_0.6.0.bb b/meta-python/recipes-devtools/python/python3-pystemd_0.6.0.bb
new file mode 100644
index 000000000..6c6e9ad5d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pystemd_0.6.0.bb
@@ -0,0 +1,12 @@
+SUMMARY = "Python bindings for interacting with systemd over DBus"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4fbd65380cdd255951079008b364516c"
+
+SRC_URI[md5sum] = "c5472be419f53f53f5da089ca8c981c0"
+SRC_URI[sha256sum] = "b1fc072c87e3766711f64caf86fd633dca393e20c8a0a37a5058dd70a21d8a14"
+
+DEPENDS = "systemd"
+
+inherit pypi setuptools3
+
+BBCLASSEXTEND = "native"
-- 
2.20.1


