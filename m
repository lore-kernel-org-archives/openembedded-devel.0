Return-Path: <adam.trhon@tbs-biometrics.com>
X-Greylist: delayed 13381 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 26 May 2018 02:29:10 UTC
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0043.outbound.protection.outlook.com [104.47.2.43])
	by mail.openembedded.org (Postfix) with ESMTP id 2BD96748E1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 May 2018 02:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=tbsportal.onmicrosoft.com; s=selector1-tbsbiometrics-com0i;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Dp98GvnS8UY5/cDVXDQca9LAP9zEKjVwjDcGQbf4+t0=;
	b=Yzks8m2awXVJocQlXMfqSnzNqpP25QKRp3TAjs1MEfCGkhDtQvEBlirTwBTUHWnB/GO1+LTuyA+zZGtQnC277ivZJl/v3m7ngmQAJQLDIoRN8HDyI1QzmbcfE6El4JvlETbT/N/RmC5AHw6KwBq7QRWnQVqzs/qkyW1iYKUDKFQ=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=adam.trhon@tbs-biometrics.com; 
Received: from loki02.local.tbs-biometrics.cz (176.74.132.138) by
	DB6PR0601MB2280.eurprd06.prod.outlook.com (2603:10a6:4:1e::12) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.797.11; Fri, 25 May 2018 13:12:02 +0000
From: Adam Trhon <adam.trhon@tbs-biometrics.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 May 2018 15:11:30 +0200
Message-Id: <20180525131130.5879-1-adam.trhon@tbs-biometrics.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
X-Originating-IP: [176.74.132.138]
X-ClientProxiedBy: CWLP265CA0078.GBRP265.PROD.OUTLOOK.COM
	(2603:10a6:401:50::18) To DB6PR0601MB2280.eurprd06.prod.outlook.com
	(2603:10a6:4:1e::12)
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(7021125)(5600026)(4534165)(7022125)(4603075)(4627221)(201702281549075)(7048125)(7024125)(7027125)(7028125)(7023125)(2017052603328)(7153060)(7193020);
	SRVR:DB6PR0601MB2280; 
X-Microsoft-Exchange-Diagnostics: 1; DB6PR0601MB2280;
	3:jMXMY/V0Sc5L0PUDNzzZiDhn7lNvZ2U8hU4aM0sn7JZd5xG2JSRN/sH0aXiWzbW+NqLWEnUfWe8HZnozHprEYzERdj05cPFqR51YtCarT7B5U6aWMGmmTfXZScz4uMcTK6ciWYPwwdjhv8BmHzgouA5vWKBWcHiAhd6IhjyXTpuLLuGnNr35kdczoOFgRIAPa5LgzqMOq4OtKHxlqXRe2Qb2f/vI750uU2esVYDci+IvSfwdSOe8H3bCazIoBW5P;
	25:GA5qv6AOQXsGHCKLFNhtsiieJ/o6BE9N4JEFLDKO0+za6Qe0bjYEn0FZOiYEnwm1v+ghrN0oIcYFII8GPeatuQXiMnlJEzBJBABXgMzb/puAhFLMJ32As5yS7gXgNAVJ6t8RFugIolH5oJfLB+3vA8dDftn3HfmzWh2Uh18Ax2AKPxhkgNdOxaGKawkeSMVucv9JyfvyAK9dHWpQBGl0ADHfke7a5UtWZOwQWj/UIYuMmuoTHc/HhHEL5Mu7iZQyZ5DfrgH8UzuensiqHJ3h1S6twOexeSnet6Dz6Ua9RsIRV3R7vN6/V/CJKyfJM4idIcnZ7WpzEDSj/GHOOWZ4YA==;
	31:Uop2o+DG/7WcLGf+P2X/qyR9btuqI4ODi3ZJQHgD4UgTvdMdrkEWTdDIweWiAzyB1HXbqFQQjE/Me4UQbDahL2GKVhXMRp/9tV0Go3VIoAr2G48EjLI3Nj1KaY6bLyYavJoW2A2murO4ThZDcb/zmzK0cOebHyNhcD3UYrIbmwOlXl/vBk9TGYWREFUFj/CmdUQEhqkUiJMuYs9Qgby/0+0ulprGgRWY8qcOQZyi1UM=
X-MS-TrafficTypeDiagnostic: DB6PR0601MB2280:|DB6PR0601MB2280:
X-Microsoft-Antispam-PRVS: <DB6PR0601MB22809F30E7003A7CDC74E815A6690@DB6PR0601MB2280.eurprd06.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(3231254)(944501410)(52105095)(93006095)(93001095)(10201501046)(3002001)(149027)(150027)(6041310)(2016111802025)(20161123564045)(20161123558120)(20161123562045)(20161123560045)(6043046)(6072148)(201708071742011)(7699016);
	SRVR:DB6PR0601MB2280; BCL:0; PCL:0; RULEID:;
	SRVR:DB6PR0601MB2280; 
X-Microsoft-Exchange-Diagnostics: 1; DB6PR0601MB2280;
	4:ZSt+bP42N01czkcZn5s+U0/QzU2mWKoVUZdJM6aSHscN2NAZGRyxnFM/06JCRLRrq2+1luyFp4Ofp957BFQEXS7iJWnX1OGjnTRjtsvKmTl36TpXM/kYhrzslniZR2+tWW7wDuUoc4HRh5yu9PiiXSM7yCiYuCCtmjD7lodhyKpTuHlwOG/i1OskND3NxZ+lxp2L3QODJdpuvscLJupS9muew/JVh48XUG9+tCwekKtYyCg6RdivSGJSwlhVyBLuL0LaAUGlqFj9CmLgwjnMQA==
X-Forefront-PRVS: 06833C6A67
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(396003)(39830400003)(346002)(376002)(366004)(39380400002)(189003)(199004)(4326008)(25786009)(107886003)(36756003)(6486002)(52116002)(51416003)(486006)(44832011)(476003)(316002)(956004)(2616005)(47776003)(66066001)(16586007)(68736007)(478600001)(106356001)(105586002)(5660300001)(86362001)(50466002)(2906002)(48376002)(2361001)(6666003)(2351001)(6916009)(97736004)(1076002)(26005)(8936002)(386003)(6506007)(8676002)(81156014)(81166006)(305945005)(7736002)(50226002)(186003)(16526019)(1857600001)(53936002)(3846002)(6116002)(6512007);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DB6PR0601MB2280;
	H:loki02.local.tbs-biometrics.cz; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: tbs-biometrics.com does not
	designate permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DB6PR0601MB2280;
	23:++fKQesuuRH9/6deiDIm//Fc/Iw5ZafhUW3fQfC?=
	=?us-ascii?Q?vYB1d9OV0WQ9OEq81gOLDkj3w/IWOuwO+KIHpgzi95jwbaJt5eu724si8VDK?=
	=?us-ascii?Q?+2lKKD6BNhs0RzWgIICNlkbpjMKU2djr1uVioi3+wsXL0cDoMlSzhmDPzjiI?=
	=?us-ascii?Q?eniOOiti0T42Da2uD8Mh2n5KQ8wiwHLsaQ4ChAwam/edMkxPukcec0Sq/vHj?=
	=?us-ascii?Q?FOzraHQGSkYAkP3x0V8D9f26asoX7CXlNtoW3pgbYBmf1TJfNBDoNEORl/Oe?=
	=?us-ascii?Q?GvR9VdNPktxkKV0xRmydsZk/3BUiCRdxGMHdUxiXehxEeAKIzoiiwL9gUhuF?=
	=?us-ascii?Q?VmLq2SR1PKFKnIKhUYDCG68It0IfnAuQjIHr/+t2fhH5j128/GTi5ylm6Poj?=
	=?us-ascii?Q?XsxuPCOxShzS5IJTRmq1+RJGxlyDmhrJEc7ebjt6DaeX/mz9OJlNR09kSphu?=
	=?us-ascii?Q?TnbFE9RPQUlFLwiUeETyuaJlKno3f6Ms0gWUgIEbZucYBg1aDsEvb18Iy5q9?=
	=?us-ascii?Q?ho6lSnXIPZ90B9Z+dDErNJYy+TpVtlqyPPSLeTMdrWG1a01zQ+rRWUctY2KE?=
	=?us-ascii?Q?nL3frj803gKo5PCprbUcnSWWH1Elvldr3QMbb2JNC5C78dyHy//0ovch/Kro?=
	=?us-ascii?Q?JuBC++OWGvvX0ASneyMFNpmDGB5ZHvtKOeUAxCKXY4wM/+BVA8r29juaQyUS?=
	=?us-ascii?Q?vqP5dpKyOP/9hqa/0ucULdMHcp3qPN1nwyEz5ReGf6opBKWhVjSECc/ACW3n?=
	=?us-ascii?Q?aisOXCUpfsrU/mLN9vHA88C4GzzDSFNMK51MdhPwgxCT5eaWDdhQJzPdhgn8?=
	=?us-ascii?Q?nn0YVD8OGVozui44XqA+OQv+8MCHk05QmGLYJrd8ZqjLbYLpNr6mT01WfoWG?=
	=?us-ascii?Q?3SkoiD49wl+UkjCe3ZLhESvkUTBvKOIQru+gqPqvrv7afRzAHmNCYZU1Ds5k?=
	=?us-ascii?Q?s+7LeIGZV1bcnz5ipq4xTtKJnYYJUeCd47redJyRVUvG6l/Yv2pojV4aDniS?=
	=?us-ascii?Q?XunI857UrT6j5TSsvN53EisAat3hCglCRMja8xU16mfX5qbimiXZAujze9Ie?=
	=?us-ascii?Q?hi5s7BzviIx2KjEeEzAKF5s0oe43Ds3KLpmLEODvd+TG+p+NZIWhPqLEg4Xn?=
	=?us-ascii?Q?v5iXxQFcOoZGWyqt4U3OYVeO2q9MN0IFX3j9UXEQCCvbb/fQgq65GJGQobBr?=
	=?us-ascii?Q?OxUEHr8TpG/Jpr5jGrKU02z7/uoxdnj0lyhGapmfTZhmRzcKkvdxw4S2tcse?=
	=?us-ascii?Q?G0BNGzTqNxTBL6FypdOI=3D?=
X-Microsoft-Antispam-Message-Info: ci+x8cwz8GeE0/WxxpRxLdSVdqSzTKJUecCfeYdU8AvGVrX9cCM2+JQ5r1nkj1fAH09PZDu6L1vh01UXoWsJtHS/QkkDbPDe5EDlOsmpzdid9cqiqfqJvl9D7wM4ienZAl92iGSLq8QERUFvE7EWHhtgs2Lr61qhmmOI+q9ZaiRFhY7LakF1MGOwZaB8L4lk
X-Microsoft-Exchange-Diagnostics: 1; DB6PR0601MB2280;
	6:DskLRXB+dR4oGYuZwYdvu3Jggnw2JONQPmUjm/Al/hlT3n6+4kXqfsVzcMVjR2+/7cGErEQURZhLOWw3fk/Sjs1DsD8x2Xt8ITez6LiD54IaHq89SPD7mxuocJIhV7EINAxPpRH0INI7e9WaWAhDSZXjB22/Z22mnVMbaQF0vHNrQBA0oFyVQS51p+5gulA8soCDndcjpvA17J84uA6N3ICTHZJx9ArmmQ//lw/SY7jOnWa6ThcrwfVPcdZEy+3BUY0PlM2HmEdM4w+qQ/g++lw2bcve813Gb9QNiidugiOHmu34TsqvnjCwvOB6GOaNJAK/10YKdP4ZnV0h7O0pgDH9e5goZuN3dem0c2prGPQzSSg1wKr60178afEFIjRfrgEJDtyvpJV+e2kEG6BXALpOBzO2raKumDJK5LIxIZCCo4aPcJt/Hpdbf0L1pd5tOHLHM/PF+2QyS8DTSZ5D5g==;
	5:c//G35ywyr/yotBY5qb4dDdPOkluwcii2zF6zb4tPnGeRu6kEAiSgSG+7rbp0d0axjHMXT0TXlIoFL9ll2WLiYfQrhInY5yb8sKQ6h6BAQuQ5K9oyYPc1BdqDssyxm6YUmXRqLO+q792XnHMvxdDjQ5oeFJLbom4w/ZVMIY7yaM=;
	24:vHHvQSrU+v0g991teSUuK+OGt6tnyeOE/9cKpDfIvLxTbAgkfrQlnwPDdexFCSdjGiFa7pkY52Jcb244S5UBhqzMHoLYuQViTLktRBfLFp0=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; DB6PR0601MB2280;
	7:pTuiyV+J4vQ89Itw2WPtXl/0gtgkAMNqpbs53XLkJghViQoekARbfDviz2E4ToKsVFBUlvy1HVxvRD9QT9QIJ4mYn7d5uszr5jmRMaqTHOEDRgBJjZvXmaJmXQbn4P+HyEWwWHp3RXLZrLJwlyaLRdHy0lJeTG4s6zcSp57G2I3HSBAXyo/U84biytp0DkCsXH/fFYAGdq3ERfXeO1qo9o9dprrXSTY5jCn3BntEVqpvcEVgvdc6zO6TzNc1liFM;
	23:qsKgjkB3NxOkJCtIiohU9zy+uTADtZ9C0rqFIXrwZ7yjx4qypMwZVNF6iPm+3K2yEaQZyHzOjeUGEnMCxL6eBwugMwTeMG1/X6W4m81gxVU2//xw++PIhKsRNjF2OmhaFcLFfhIPs2At2YiHcfZCZw==
X-MS-Office365-Filtering-Correlation-Id: 2aec16fe-1271-4d32-1b9e-08d5c2411b6a
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2018 13:12:02.9207 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2aec16fe-1271-4d32-1b9e-08d5c2411b6a
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 03c5283b-bdcc-41a6-b827-b66aa8b838e3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0601MB2280
X-OriginatorOrg: tbs-biometrics.com
Subject: [meta-oe][PATCH] libeigen: fix splitting files into packages
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
X-List-Received-Date: Sat, 26 May 2018 02:29:11 -0000
Content-Type: text/plain

Assign ${includedir} to FILES_${PN}-dev (instead of into FILES_${PN}),
as the headers belong to the -dev package and it is done the same way
in boost.

Signed-off-by: Adam Trhon <adam.trhon@tbs-biometrics.com>
---
 meta-oe/recipes-support/libeigen/libeigen_3.3.4.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/libeigen/libeigen_3.3.4.bb b/meta-oe/recipes-support/libeigen/libeigen_3.3.4.bb
index bc3b32e38..31a42a9d6 100644
--- a/meta-oe/recipes-support/libeigen/libeigen_3.3.4.bb
+++ b/meta-oe/recipes-support/libeigen/libeigen_3.3.4.bb
@@ -12,8 +12,8 @@ S = "${WORKDIR}/eigen-eigen-5a0156e40feb"
 
 inherit cmake
 
-FILES_${PN} = "${includedir} ${libdir}"
-FILES_${PN}-dev = "${datadir}/eigen3/cmake ${datadir}/cmake/Modules ${datadir}/pkgconfig"
+FILES_${PN} = "${libdir}"
+FILES_${PN}-dev = "${includedir} ${datadir}/eigen3/cmake ${datadir}/cmake/Modules ${datadir}/pkgconfig"
 
 # ${PN} is empty so we need to tweak -dev and -dbg package dependencies
 RDEPENDS_${PN}-dev = ""
-- 
2.17.0


