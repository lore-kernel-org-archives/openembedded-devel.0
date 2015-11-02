Return-Path: <samuli.piippo@theqtcompany.com>
Received: from emea01-db3-obe.outbound.protection.outlook.com
	(mail-db3on0102.outbound.protection.outlook.com [157.55.234.102])
	by mail.openembedded.org (Postfix) with ESMTP id 3A68F60034
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Nov 2015 14:18:15 +0000 (UTC)
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=samuli.piippo@theqtcompany.com; 
Received: from piippo.it.local (91.217.248.11) by
	DB5PR02MB1175.eurprd02.prod.outlook.com (10.162.163.21) with Microsoft
	SMTP Server (TLS) id 15.1.312.18; Mon, 2 Nov 2015 14:04:08 +0000
From: Samuli Piippo <samuli.piippo@theqtcompany.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 2 Nov 2015 16:03:41 +0200
Message-ID: <1446473021-20957-1-git-send-email-samuli.piippo@theqtcompany.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [91.217.248.11]
X-ClientProxiedBy: DB5PR03CA0007.eurprd03.prod.outlook.com (25.162.150.17) To
	DB5PR02MB1175.eurprd02.prod.outlook.com (25.162.163.21)
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1175;
	2:8ky7joIfJIfyOpjSFKjMBt+oETlyQFK1oief/K+hK2V7iNvv13iYysbzRLczaUEWoDEtK3bVLWiR7n1KjQyFVK9o/anNLG0J38HeOFavLoxzeycIBkuSbTLNqyZRJFpJshk2HkrgC8/NhItwOKQR95MKx40EiBu8Cxjb9QtgNJU=;
	3:1Vlpo67cXAHuAtMPhf7jFNMgehlDGyBxBgBburNcTyNAmAvtXeZR28Wa/x9zDSfBE0XpLpj4E7hueJD8by1u92xN8Dqwjnfap+9d5PzDtFXX4/EQ7QugaLVK7OOMxhIs+jX0gKbcsjCf3KwTL/O/Og==;
	25:XTND5qYOMLveCwwRjvMRlI4tsAixToi0mmGVxVCbF5lJ8ILQdjWJFqUxZwe3OAVTFEoopsZqyKTqJ+Faw6Nm7eNe2TV7Iyhwd30oQhSoC/3ND1HkefEva3+caU30BQdmekRZ8PzcW3cmOdyBevni5LZ2iwnle2Uy6V1/H5aVxWupHP9rbXkA/Dpnw9UABNM0dO9Ft9V7uI5hnYpEWr6tMMg2QdbkVxi+MtduHEYRB7wJFMGVbMs7OG9agRuyDl8X
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DB5PR02MB1175;
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1175;
	20:sUQ5gkz7IpRInCz5VKt6FesItBIx/P8NpxBzECCPq8YKJ7rdRyxyInlJfkcLxjgT3QjaMY1K/503oXNAwuJl/3/19zNnbKzDKeTOXCo8F3O5HhhMhAHJM3/RGd423+vhbPyJYW5aeVqHokIKPdkiIc4WLwb6Z/pVuiJC6pMtZk8G/vaYQJvH+i+eM0iqStO/3wvX/qtg2qNAP/PJ6yK2EXOLNXJsbO6xLT2zU4QxkOMaGIm7YMiowQbbxQfBQP6QqgBK/q1BiVOq4MvVZY53QrrZXMTSlgDQ0klAc0MjdZSo6Mwmc/Mcg2I9IM2NT2LNw8ifB4kSbN2f8HEGv0hlpLg13VU/66juZLEnoODCQq9qK6KTao0gkTNJXXGVz/Eq8g5T/b8y//YqrC/XqMgUsiPXiZyPqFu9UMOgCLKTob2eDtDPkXiUtz2drCQ7qCq3XH6pJ2XtSd1t34M5b4YEk/mQTvKin2gMTvbr0Am3kH3hMjzaJpZeaL8EI7dNeX5c;
	4:1UNHEa6XLDMdxCb7V0FmuMZ+x78GdHX+WmuO3ovBYla1Jq5TtHFmVqLBd8tyZmoI4jDaDAfBGjedCafo9oAqoFCs8oXb47xoTlttOp4B/hzsB4M46eSZgaD3LAxqtuLDQ2buCXQ6v1rUH7TH2PvLE8nPxF6yx4wjgvay2woBL5dfH5V5V+zqWBc0K+AVrjAwkywlEKsBBIRB3a5AD5ToDfJI1Ea+gy+0e5X/Wums5CDhFJ7V4xxRk1/1EdrfQkRCUQmtMSclLvMdGi+l1uh7jA3THpPqKZeCX2Mfs7mpF+scB5/1akBicu1r9Delh36yISRDYxCWDc2CSm2ZrgLL+JZalgApSXuPTobNm5SNFOQC8mPtNSqnBC4+bgm84ltC
X-Microsoft-Antispam-PRVS: <DB5PR02MB1175CEAEB466E1658FB9F83C902C0@DB5PR02MB1175.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(226695750432114);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(520078)(5005006)(8121501046)(10201501046)(3002001);
	SRVR:DB5PR02MB1175; BCL:0; PCL:0; RULEID:; SRVR:DB5PR02MB1175; 
X-Forefront-PRVS: 0748FF9A04
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(189002)(199003)(50466002)(50226001)(106356001)(575784001)(5003940100001)(189998001)(110136002)(105586002)(5001960100002)(86362001)(229853001)(92566002)(81156007)(97736004)(2351001)(107886002)(36756003)(5008740100001)(87976001)(77096005)(101416001)(5007970100001)(47776003)(450100001)(50986999)(5004730100002)(122386002)(230783001)(66066001)(4001430100002)(19580395003)(33646002)(19580405001)(48376002)(40100003)(42186005)(7099028);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DB5PR02MB1175; H:piippo.it.local;
	FPR:; SPF:None; PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: theqtcompany.com does not
	designate permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DB5PR02MB1175;
	23:sJWrR5pQtAHBnywSgnkOS4kdo0CS87tTw9LJx8EPB?=
	=?us-ascii?Q?5znxmr7Oxs/cpqNvMsW3kFyFdFKd+uOAfch53BD7Vr9YvFeyWxU+8lYUmiTW?=
	=?us-ascii?Q?8i2ZK2Bbk7zBUXNuTdOgRlnS7Jg52FBIil8achZpGua18TeNiQ3MBf7fmXRD?=
	=?us-ascii?Q?pY3ZKC34x1HFcUTrq3m5eyALj/TP38JKVhKVmEhhirXJR09yHTgIgYD3XbtD?=
	=?us-ascii?Q?kh5Ymg1k5VSyy4bNkWRQr6Ylkv4vVOWjxdSBSjKVrBnj/psgKUSDwYistFWf?=
	=?us-ascii?Q?HZekSIRG+Y8q4q8TOlpQ/ztTPxULwe+2x4ROPu3+tFLEsINP8ZhXt3k0TPzC?=
	=?us-ascii?Q?nBULtXip2HHwLWRNauYu+MMIcsfRRhLie/yMQLhxFG08KNRxVuZIP7y1AA4N?=
	=?us-ascii?Q?sXgZsOsqKSod70mxu9aKdkPd62PiuRH9qAXmhed32HWPl7aBPTkwsU+iHgNd?=
	=?us-ascii?Q?TEVZTvnNRYhV0JUIOGEykXdgA7PovCr5cwpLSzuS+TfLzVPHs7PlMlcBizlK?=
	=?us-ascii?Q?RBq43+n9DLSq6FFJInw7cq5Qsl7Wl6blOE0zp8t6e3uSq+Zm3n0JAtg+HDd0?=
	=?us-ascii?Q?1gP2xpac0ZBrjUhw7vgNZJ2C6Sji1noND+CcmPZNokWkKs0IjR7UIYpBzbRy?=
	=?us-ascii?Q?XOar8EHOiNg17nmlnUR8hGLNo6UzqsjrjCE47IJL1QJdNYuhfdYPOx8P3uF5?=
	=?us-ascii?Q?amLk4ACXKEMbAPBVc9/xjrrRrQ+KQ+fPprtebD4MtP+lxNkH+Oz/dwI2+cdv?=
	=?us-ascii?Q?AQHLmtjRE3cAVDgXO4MtqC5qGerJWDjiQkknurEvIb7u20zF2AVydmRFuAra?=
	=?us-ascii?Q?UNjX6M5SC/v8k2uB29Czh1tqfbyatRQTtp37MFQLfQqYlESfEAyhYtsVQ/2b?=
	=?us-ascii?Q?cZFysyEOnmUdE9onaf0SbYLaTkvx9hOJVcR2axaBEPogGXm0XIKfjLv5lQll?=
	=?us-ascii?Q?QyBgyOf8G7jVyBrZbM6y6Hk+B7OrSboaCnLmoAmnQM545qwGrelcUyUHHtF3?=
	=?us-ascii?Q?srM9/o9K7aUF2sFuxQlgTxXNY4Hjtwo9ijFMZMuPQtBENHp00iCyjjFQvU5s?=
	=?us-ascii?Q?CVSugT+3BkwSn0Cvg5A3Uj4s9BixVsX1HoylTcSExs+WXIyEA=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1175;
	5:pENlhfZLsf988kdz0hxYn4xPhv01wXkUMG831LXgitQ5s6sZZqEWRyuxRYhpKEUPpIfenWG4lQpS58hP5tN97dD6S8uIdtMgJ5gc4BkxKjuk0Mb3IVYIE4TxU4THaLy+tHHJfSPJVpxoTvwl8ORMqA==;
	24:EGGu2hm6qQvbUwtHfXcdqL4HH4BeMI8VYz1tN+BDzvkkiZC2zEwlraundUofzVoWYcL4svmKt3P3cOdAMdaA0EHYrAlUnnCpUkIr4VClHpc=;
	20:tZYMjHMAWlWMHrzQVHbocJx3m5wapit0Dr8JdfVYuamnm3kDFwwNzlILVKOtNY4+lrzHt4mb+hSLyxdUpetY2g==
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: theqtcompany.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2015 14:04:08.6783 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR02MB1175
Subject: [meta-qt5][PATCH] qtbase: include oe-device-extra.pri unconditionally
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 02 Nov 2015 14:18:15 -0000
Content-Type: text/plain

configure parses through the mkspec, but does not handle conditions
at all, so oe-device-extra.pri was not included at configure phase.
For example QT_QPA_DEFAULT_PLATFORM had no effect for configure.
include() is conditional and won't break build even when
oe-device-extra.pri does not exist.

Signed-off-by: Samuli Piippo <samuli.piippo@theqtcompany.com>
---
 recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
index a9c448d..d377921 100644
--- a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
+++ b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
@@ -240,7 +240,7 @@ index 0000000..d0a4166
 +# for the SDK
 +isEmpty(QMAKE_QT_CONFIG):QMAKE_QT_CONFIG = $(OE_QMAKE_QT_CONFIG)
 +
-+exists(../oe-device-extra.pri):include(../oe-device-extra.pri)
++include(../oe-device-extra.pri)
 +
 +load(qt_config)
 diff --git a/mkspecs/linux-oe-g++/qplatformdefs.h b/mkspecs/linux-oe-g++/qplatformdefs.h
-- 
1.9.1


