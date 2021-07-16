Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.88])
 by mx.groups.io with SMTP id smtpd.web09.5634.1626439137675491474
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Jul 2021 05:38:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=PKPeX6mr;
 spf=pass (domain: arm.com, ip: 40.107.21.88, mailfrom: ben.horgan@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B5NgihmSbBxzXCcyycKCJ8GgTsna4G83Lh+DWslGciY=;
 b=PKPeX6mraPiYxUwgBzb5y9tymqApGCxsjLgXPVCpzqNEPdVodl+rUB9G40uHdVKMCnI071MasDbJQ/PWvZ5VfhT/ULKkXhn/gitWVclwGKjT0Sc+SjVU961lQKcHtrsRXcYHf+WdNBqppbhBC22Of/Xp/ytcri2bjifa0acjYn8=
Received: from AM5PR0402CA0014.eurprd04.prod.outlook.com
 (2603:10a6:203:90::24) by AM0PR08MB4081.eurprd08.prod.outlook.com
 (2603:10a6:208:12b::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Fri, 16 Jul
 2021 12:38:54 +0000
Received: from VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:90:cafe::85) by AM5PR0402CA0014.outlook.office365.com
 (2603:10a6:203:90::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Fri, 16 Jul 2021 12:38:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.openembedded.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.openembedded.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT063.mail.protection.outlook.com (10.152.18.236) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Fri, 16 Jul 2021 12:38:54 +0000
Received: ("Tessian outbound ef2da60907d5:v99"); Fri, 16 Jul 2021 12:38:53 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5b82639a87e2f373
X-CR-MTA-TID: 64aa7808
Received: from 6c48ef6c499e.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 48602A40-1D63-444E-B6F0-A04F7A162950.1;
	Fri, 16 Jul 2021 12:38:47 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6c48ef6c499e.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 16 Jul 2021 12:38:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cCHRrISz8L6++tvrQDhC4Fqc9crjiWbNnwFKBViez8rKMEVOA9piD2BgSh7BqoMYtfdMf7cA7C4Z4QJYz946pbPzzBNolgVxiz/PzBIxmR87KjjsI0xvIUGT6ZPsKNwwPpC/QU9cnFsB/iLQc5LN3kPsvKaE/Usn3vrwvjjx1f4sKBwN9dvAWaHjTJfl6ReroV+kgWnUlnDJCPoj5kRV8WLPKASW/HvZ1k2nbt9iOfQ+QfAZeHL7kxOTuBlk/gOZGrwyYKAzMwgMz6iDj+7ysM708szG3aB0YCIlOznpqkEV4PPIAYbzydiVLV7hb7TMH2IHGawZl864XzKykeYvXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B5NgihmSbBxzXCcyycKCJ8GgTsna4G83Lh+DWslGciY=;
 b=Zz8YoIoYslWuIfHuL4hb0e9XreG62Kw9Rvw7uvwiS25+EQuBHACWWD+X4gwEqltrQVYA5pRlgDuBIDdscnd3UBoY+zUmxLM+4YqGCcZ9AY4veTmRILGWzulgRuDuz87TeyXCiARlNv8kN1i1xNwuDEdYUPxZYY3QK4+ASHDKlPiTkIDIZjWAwQBA7WUmpjw9mj7MpTQ/9fEyWOnwaJAOK/RdPHeB2/B1/0Dx4PvbpzQCxxl3tRif0C/TtIZAvAflo+lptXg9zbUlhEQaLsZj6rU71Y781On/Hv+ACTyPB7SIPhYDA6jh5H2CxzDawK7dwi9ZiQjCniOvDdQtnK94Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=arm.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=arm.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B5NgihmSbBxzXCcyycKCJ8GgTsna4G83Lh+DWslGciY=;
 b=PKPeX6mraPiYxUwgBzb5y9tymqApGCxsjLgXPVCpzqNEPdVodl+rUB9G40uHdVKMCnI071MasDbJQ/PWvZ5VfhT/ULKkXhn/gitWVclwGKjT0Sc+SjVU961lQKcHtrsRXcYHf+WdNBqppbhBC22Of/Xp/ytcri2bjifa0acjYn8=
Received: from AS8PR04CA0082.eurprd04.prod.outlook.com (2603:10a6:20b:313::27)
 by VI1PR08MB5359.eurprd08.prod.outlook.com (2603:10a6:803:12f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Fri, 16 Jul
 2021 12:38:46 +0000
Received: from AM5EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:313:cafe::8) by AS8PR04CA0082.outlook.office365.com
 (2603:10a6:20b:313::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Fri, 16 Jul 2021 12:38:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT028.mail.protection.outlook.com (10.152.16.118) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4331.21 via Frontend Transport; Fri, 16 Jul 2021 12:38:45 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Fri, 16 Jul
 2021 12:38:42 +0000
Received: from e125437.arm.com (10.57.33.185) by mail.arm.com (10.251.24.31)
 with Microsoft SMTP Server id 15.1.2176.14 via Frontend Transport; Fri, 16
 Jul 2021 12:38:42 +0000
From: "Ben Horgan" <ben.horgan@arm.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Ben Horgan <ben.horgan@arm.com>
Subject: [meta-oe][PATCH v2] cpputest: Add initial recipe. Version 4.0.
Date: Fri, 16 Jul 2021 13:38:07 +0100
Message-ID: <20210716123807.23101-1-ben.horgan@arm.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 003b8a01-5475-4f63-1fa8-08d94856ac1e
X-MS-TrafficTypeDiagnostic: VI1PR08MB5359:|AM0PR08MB4081:
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB40814CE510F08151680779B091119@AM0PR08MB4081.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:327;OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 dK+9U41A32kRO/yy4Jc+9yMRbN5noc/FmiM6O3zOcfnHqakNOYKrHam8WBwtgdaTSbuX+EDbt0B2RyTC60pVrsM7ea9QLx6pt3Ancl+YGRlqNg/bif6rtwQs9l9IGCxyX1NzuQwyFrfhHhgmTmtyfqEbexlZIGAAEfWN9w4wWOIMck6WvVDoKwSY2CMG9tHEYnjVrCW+V8jMmOsXU7bw2SfprktuwhETJM1doFWueQLOnD5Gsl4LQDMI3cmCxVNY5H2cqsAWjiycC1nfy3UwWGNcmE26XzYwn2p538zGUXZSDl/P6dyUK5rtMxZImMHYllGlhG/WQONLNGzi87s/rb14oHdSoakZRmLZq21dYFMBsLnZLXW0Uf7GPxmhooNeX2ZDCAEd6Sn1XNxtBkrNTD39k5oPaOEbZUUnwOdsFf61kDy8bc0BswWyV8Qre3+a8dwqR53Faimu0+TvyooAIPJgpzNFY/sU1alTBcpHxdp/CEeh8FmBVD1QwqgrvmqLMaJg53s2pxHg5mz2GjDYx+fqiyXupVt/hj25tNXd3hPTS+ls0gZp5fo2HbfnH6QKwE1dDkn8u7HvYf7y0WKE1IR8e3VE88xMPYykSycGfPZmO9VIpAj4DEFHPDxudCockIj+ymnHwBI5TEabRrdZby4VGDBLxqY5Azc+LcmsjRJSsnSSFm3b8+bIR6qdqm6PoSBdqeY7IMdo53fHhvmIhfxtf44ByKfW4HwNntBs0TevESrgSRZ3r22AaBej54hXXOKzfiDBeVEBBWKfiRGdxl/BDOmnpZiIbRq6+IWb1nnQUd2Y+LuUYKYzJyBxdW8K
X-Forefront-Antispam-Report-Untrusted: 
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(39860400002)(346002)(136003)(376002)(396003)(36840700001)(46966006)(82740400003)(478600001)(4326008)(8676002)(6916009)(7696005)(6666004)(44832011)(36860700001)(1076003)(8936002)(70586007)(82310400003)(83380400001)(86362001)(2906002)(81166007)(26005)(356005)(36756003)(5660300002)(2616005)(336012)(186003)(426003)(70206006)(47076005)(316002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5359
Return-Path: Ben.Horgan@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	79d5a8fb-5e97-418c-1708-08d94856a73e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	q0GMYe7D6UQpJVleh5X/mSOYyWyYLc1bz8Ra9nG0TTSMipfKVVnm6RNX193JuZlfZ7+8lwNQQaMMO6pqyn2+7PE4LS+P1rQlzZX8PMypOY81OnSr6Vvl9m6/vlH/y3kFftssDTCb0/ECDiGr4mJtOkHOMFucYiSo3H9K0u3QFaYJ6qFdjEuqNpOcjfYosSTRgzQGU0hnL/VKCCMbjej3OHJLWW2cYBKGwh7DmMhmDokLw2tVinacB2L3kLX7iZ219XBY/kHrJUdRD05VIP+yChIhlt9vHUUOaepcUrAqZtqOI02WAPxxWACQkt71CGYxajcTUKJgtxqgzatz/KU+9PZHMeOJvf46v0OL/Pgk73GBwjR6sSDbZsqtEkMzXn7yrnSCwwDGTNJTHyIN4LYA/wvweIGkwabe8M38JaP1/kKwvznC56PxRuXlv+Hk74YFFVT75MsVpIuqhUN5oCjoSZmSZRDfr5b2T8GKl3SeKdLZR6p/uKf0pVuF6spoXQ0wbtRyjqWqScDSS/TYNpv+Of+rXblrL194B8KZM5/vsN5a692rqWErweo0Gn2aImERnjjMdEo7FfvY+1gmXIlsV2f0L/xfoJ+G9bVEyuT+poo60/ESMcGC5jOl7/moY53PDRe7Ip4PZUbtShJUYjvVTwoQ1oWCsOOW434rPCk2StuEPJMAjOpWzULasfihRTKRoP42ahuUHnw6DA1ypf/P4PsEojxuvgNcX89fY34QZdi3xRsULSB5mrxmCkI4ikeQKKnLKTbfX7AlO84DcQFfn4xDYWoV3u5Q8vs1TsdXPtc=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(39860400002)(396003)(46966006)(36840700001)(44832011)(478600001)(5660300002)(36756003)(1076003)(7696005)(86362001)(82310400003)(83380400001)(82740400003)(36860700001)(186003)(70586007)(26005)(8936002)(316002)(336012)(70206006)(47076005)(6666004)(8676002)(2906002)(426003)(4326008)(6916009)(2616005)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2021 12:38:54.0529
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 003b8a01-5475-4f63-1fa8-08d94856ac1e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4081
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
 meta-oe/recipes-test/cpputest/cpputest_4.0.bb | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-oe/recipes-test/cpputest/cpputest_4.0.bb

diff --git a/meta-oe/recipes-test/cpputest/cpputest_4.0.bb b/meta-oe/recipe=
s-test/cpputest/cpputest_4.0.bb
new file mode 100644
index 000000000..a17c0658c
--- /dev/null
+++ b/meta-oe/recipes-test/cpputest/cpputest_4.0.bb
@@ -0,0 +1,21 @@
+SUMMARY =3D "CppUTest unit testing and mocking framework for C/C++"
+HOMEPAGE =3D "http://cpputest.github.io/"
+SECTION =3D "devel"
+
+LICENSE =3D "BSD-3-Clause"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dce5d5f1fe02bcd1343ced64a06fd417=
7"
+
+SRC_URI =3D "git://github.com/cpputest/cpputest.git;protocol=3Dhttps"
+SRCREV =3D "67d2dfd41e13f09ff218aa08e2d35f1c32f032a1"
+
+S =3D "${WORKDIR}/git"
+
+inherit cmake
+
+EXTRA_OECMAKE =3D "-DLONGLONG=3DON \
+                 -DC++11=3DON \
+                 -DTESTS=3DOFF \
+                 -DEXTENSIONS=3DOFF \
+                 "
+
+FILES_${PN}-dev +=3D "${libdir}/CppUTest/cmake/*"
--
2.17.1

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
