Return-Path: <samuli.piippo@qt.io>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0091.outbound.protection.outlook.com [104.47.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id 3579B748A7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2018 15:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=qtcompany.onmicrosoft.com; s=selector1-qt-io;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=DwadcHKDHHwev/vNxjBhn/D5BDAANvX2aTUJJ37/SRY=;
	b=eglgj6dKACl6VlNgFyYe6gkJTadrN+xaIrha2MTELWExSB30F0yfWDBDEFpGh9jKYrJSzW3qZpdqQ5vIhkZ+dwfezPXm8lAmyLgEZ1kNfaB1ZPaVBoLysFWwLBVH5Wz1j30BwnrCOfyeS7aOPMYNT63SUTE00YkbxAD/zYKB7sI=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=samuli.piippo@qt.io; 
Received: from piippo.intra.qt (192.89.120.53) by
	VI1PR0201MB2271.eurprd02.prod.outlook.com (2603:10a6:800:52::9) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.755.16;
	Wed, 16 May 2018 12:11:42 +0000
From: Samuli Piippo <samuli.piippo@qt.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 May 2018 15:11:30 +0300
Message-Id: <20180516121130.32173-1-samuli.piippo@qt.io>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
X-Originating-IP: [192.89.120.53]
X-ClientProxiedBy: AM6P193CA0023.EURP193.PROD.OUTLOOK.COM
	(2603:10a6:209:3e::36) To VI1PR0201MB2271.eurprd02.prod.outlook.com
	(2603:10a6:800:52::9)
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(7021125)(5600026)(4534165)(7022125)(4603075)(4627221)(201702281549075)(7048125)(7024125)(7027125)(7028125)(7023125)(2017052603328)(7153060)(7193020);
	SRVR:VI1PR0201MB2271; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0201MB2271;
	3:q5Y/7tOhChus9+rm/elvV0t+xGh8G9r3GMs2BtEzcM4R36+rRnrtCzJ/D2D38pc5+B7L3xj9zQidS0W/oVQnCuyQFStgZxnpmp7peRAbjRvgDuvuI7MffGymuitNksHLB9SEKEn2R2cDiKkEVnaoQPb2uuYleJ78NzZkYmpdMNOqClNkQXqRZ7DVu/ddp1o4k9CvTrYcwe9ndhAuO79N6jT4+Jt5kkrwR6zlV9GgfEDn/WNloSCcRPvtsnwxI8Cm;
	25:nr1CazkZ2oImkm/AL28rt0LuuwKKQd4/xZ0JuXKOy5blo7Ya0oXGbCBIIR1PGz47ai6wcaPf28Ix6/i1lVHrqV63drrvuBrT36mqpzZGiLc1UGZhTsL7VEHCAM+iaciX4/6wxTyyWrGhX1NxZA6I/jcAQzpwPw2wE1HL5fg+ZlwSeS8kGMMMM2TCldl6/JeYr/yqZPmYPV5/t3vAB2S8ZjJVzXs7Q8GBpcb/Q/yQkWtt90T1W7iPPmvW0GlmkOMWo1FMFDTHjN+W5WamwVmcp0dCrGwYla42zO4zXiaKzF2+GYy4uOk37pzDQyxmdMO4ncKqyc7XEATJGie00G84xQ==;
	31:H3zfSbhN753Ktyz0GnCO9QG2ESEU5tyiUHIj3Q3IDQDmMD6ygocAin8pTK7tUFJiI/WGo8QNq8v1IIHjN6QcVtb9bmf//+iMbkUh9QEW0tUvfKkKxeATw/QhPo6DAdjYJqa8j5nQfT3X1QITKI3FHnnGPvamESu3R5lunow60BaIEx6uWWwbLzENNS3DvUjtvcBk5jZhFLyXqG4ZeIiHShlanT9hncH2lyvLXt4KRUg=
X-MS-TrafficTypeDiagnostic: VI1PR0201MB2271:
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0201MB2271;
	20:v6uB5gRcDe9gu79hUdxmMJdoibKMs1nvDfla2oMR4J+ihzdmM6UTTS4fPh563p3AJuFToxHZxmyS0bGHX5QhjaWEDshQhwOryYCls82DO2tGMQQLLd2FLEtbotgGH8gR9MpGLpWuWWdxEQ7y+u6cE34KX9hsaS8myd/Nr+gvgSfsSZ5iMo1jg6cD/WapkvFxR8nf5aGuBm8AsUstCR7dI2+Yib9AfuWOhb/LKAj0N12gGnv5Xj2vDkcPvleHRHRmlRy0g0NW7rAVlwW8pCLdyTlR7a9hxiBPjU+MCG8ykQPiOpT/gEAkRRifszYdhDI4Lgy8/3cYiQ0hE8S85iw5kDmHWUyWpwldaJAInaHGBIX/NehCE2GwXAJcl66iyWLDilXvS5p9ykNk/fZFn6YdyA52jxt+Bsz96Z6W0ItBkamhw5oU7a4DZeJKnf+Qz3gC/mfDx/Gb3N6/Jtweo83nCvL476Q14u39nN1jFqP18UvW377mCX+K15CVCq4w4NaP;
	4:5wQKIhzLh4XOp+N4nE4glMKszvfoux7PID18ciu+mdPa98G1JMO7+olHKbApG5BBN1t+8xEwJgETeRjkcGMvwhOXZ5ntBQWoa0yDF5KgQPdgIPopG+2zRYrNcaxHjdH2rthCFgL4m/VC1rxVea4iojVXRwwdLfRgyZb12RlGYUjKqit4UygQqAyp/oXSCNW58w0VRg2Vdwu9J+DbFeJM3b5iwIaJ3+7Fo/knvyV/dEZ6ORxltxUtWJEX7jVqkEXJxMRwoKV3bim99OFocc1u5g==
X-Microsoft-Antispam-PRVS: <VI1PR0201MB22716D5231B633744CA944C8E9920@VI1PR0201MB2271.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(3002001)(3231254)(944501410)(52105095)(10201501046)(149027)(150027)(6041310)(2016111802025)(20161123558120)(20161123564045)(20161123560045)(20161123562045)(6072148)(6043046)(201708071742011);
	SRVR:VI1PR0201MB2271; BCL:0; PCL:0; RULEID:;
	SRVR:VI1PR0201MB2271; 
X-Forefront-PRVS: 0674DC6DD3
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6029001)(396003)(39380400002)(376002)(366004)(39850400004)(346002)(189003)(199004)(6116002)(3846002)(26005)(6306002)(386003)(478600001)(68736007)(6512007)(48376002)(16526019)(966005)(52116002)(51416003)(186003)(6916009)(2351001)(1857600001)(50466002)(59450400001)(33896004)(97736004)(69596002)(316002)(53936002)(8936002)(50226002)(16586007)(6506007)(86362001)(956004)(105586002)(8676002)(6486002)(106356001)(1076002)(476003)(81156014)(2616005)(2361001)(44832011)(53416004)(81166006)(486006)(74482002)(7736002)(305945005)(5660300001)(6666003)(66066001)(2906002)(36756003)(25786009)(47776003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0201MB2271;
	H:piippo.intra.qt; FPR:; SPF:None; LANG:en; PTR:InfoNoRecords;
	MX:1; A:1; 
Received-SPF: None (protection.outlook.com: qt.io does not designate permitted
	sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; VI1PR0201MB2271;
	23:+BA+laqfqSq7s8PWjXvieOw92Q9qwNmj+mar353?=
	=?us-ascii?Q?5kp8sU6uOXT+bsK/rXmGypFPYqwIuMJztiA9i1G0jC/0DQwnqui85YYN9BET?=
	=?us-ascii?Q?m8XbetEc+b/JcTuHGINS72XzYNX+dYogpiPSSV7Zd87l4hyvSNkZRKCW7TvR?=
	=?us-ascii?Q?6Bom1EVaR5fkC/EXeF+vGBXtSHe4zQ5jbVvvxOCBwHRUTIpMr+6qENhY7Zow?=
	=?us-ascii?Q?Vdcp5z00IxMatKqEP5FRxTsS9UR6DMm1GHwmqSd8SLgg1K/Oi5LQtqAOGZd+?=
	=?us-ascii?Q?nqnLUk8M/HBwF+7dBlbUNiDPkY7AuARlUl44gK59styh+u6k+TmM3h48D67L?=
	=?us-ascii?Q?aex/ND3d8jOO+o/71ZkOP3eixxNfXXN2Gbk8kCQNYbRVJSJ12oPYkzMb1YJp?=
	=?us-ascii?Q?Ow2RV+LB3MgENjRdtgBrw7n+SHxwuVgGNzlABNaNl703IhbY/UHA24xpE3LY?=
	=?us-ascii?Q?GpAbfhAuTLpnRtZosMYYPRUSVddoVDxlP19xMN3PMyyFjZXI3LNuW5cwuZsM?=
	=?us-ascii?Q?84h6OEttc34SYj15LYL7bGXq321dEKM8kqbSvJUp0a/FheKhHGWUYzDqRkel?=
	=?us-ascii?Q?rQhxUfbYHOvgyyQseLlQJenqVFWR2YO8PlM7E8XrPUXHonc7lIa4uhp3VWOR?=
	=?us-ascii?Q?H+aFOhCuor4SdnWP38bAZsdwfjVdwwp+k/2T3G/ECBucMkETwOZNkWImILy/?=
	=?us-ascii?Q?odYFeMNox4MaJFsXhMGYlbdtuuQYWlQ2YGqGPIkjA+q6+Us3e76ObgrHVD/s?=
	=?us-ascii?Q?FU/cQn29n6XcQmSOs0eB+vvmOgpl428KQVvGVZtI1RaChFXxJ/DWDUKp4fj/?=
	=?us-ascii?Q?rV79pWZNuo6ENkzADi59a0OemPcEtko4nfBhbMNw5QfhGaMSCIAzigozMyxL?=
	=?us-ascii?Q?bQJHEi4fBXp4lD4ZRnONMsjZSIlmZRDlwwFuX0PZQBxXGLxi+xUJOHzZOicF?=
	=?us-ascii?Q?v7CefrhakFgkr6PaYhrAmFaHU+W1b3Jt/GGzNZoD7gagh/+WjYCsW21tzzQ1?=
	=?us-ascii?Q?EiGO39m4LWqxcz1q3RzpgRb7zAV/6kdAm6/KseHlG19lrQUDH9hBJuALXrvv?=
	=?us-ascii?Q?kpRZ253sj4bXPU6pzXriQs3x6p/gnfQVr5TwvnQGWc9AkXq2jphDCKZa0+Ef?=
	=?us-ascii?Q?d0ZIjCv9WFCBq4sco4/gaT8g9kI1wgodZUbVPu/HGqfqgxxPlA+lfFI24VwD?=
	=?us-ascii?Q?R40sA47SxnhyR2RrcpcGhcDAJKLRzklhv27cwA2cmtfuTasFMEeEvo60x9aw?=
	=?us-ascii?Q?2EkCKz6NFIy/cg2/7jMovrNJtrjFUP3joytVLF1Q1QAQjjMSfp/VY0+7duW8?=
	=?us-ascii?Q?hYIWL2kOT1WfmY4kO8bH+Edgc1bu4uw7227HSFrxNa2FOYFal4kSlJ5UCCtS?=
	=?us-ascii?Q?C+TpmXMumWyul2P9omKpc7zGNxYY=3D?=
X-Microsoft-Antispam-Message-Info: jc0i94xhNY1jtMzHnt+6TkGSYqD68anljnU58ejbp5hVTvai1dA+sM2W/N/kzqylbLFOv4GcUT0i7l4msyQ/G3hkBKxS6QlYP3r/yKETqZ5tpcrhnsW8x77lsszKEOJR/Am7ujcq7a9+Pg4jS5k8A+/4Z3U+ROB+j7F72X4fKALZNP+JW9bgUcUxKuFPfXha
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0201MB2271;
	6:mETMHh3i+nWWuOQark5Ucmp2QPTs+FWWUXLhMx56TJdOtw31S7q4dSstRlIiQ0VVm5bcHKR1izv/gajDdiIw3faXFvZdmcbN61e/0kAYSkFx2yI7rsyvw19F5KDLPGqNQofTu0bzubydibKGxjfdVXUr1ATuhogzPeXOrQfRUmIyzH1ztMKavQO3Ms8njCV4PtAcJk1eMt4kuKZRp/O138gnp0sgd7mrpMp9iwWFKhtuNraEKhQslSaKAyGfUTbWsA4GAe9Z0J4Zd8uDL+aX4DWSm2+TT75nk8s8AEP3NcxcPg2ZvyKzfEspVmNYV3r4mnCYBRhYZ1Va2X/4BGCoFdYkOZYHUUzsmyFVUBgro5M6R9K2yfIRz13+tB92R4jn9DmoYgDrH3+wYYdOwPwpLWYr2LC6ry/WSm9vNoaYkAK9pFDtWMFFjx2cmmxBe+Ku3cfldjpQRzx54AkTI9YKyA==;
	5:GoqsWmpViC/gNN8RLxmkvOdQLn8EOg7VVsIf115UhkdYB8AacgegEy5MTFybyd79PTOut6McQgFmiPhi9jK5pTBL5o/oupsANlD/3p6ZEfOozz6H08yTn1TDpmDr1jKRgsrX8VC5SXfZPfXINDTdu5c1zTYLYz6rmsh09VJLcw8=;
	24:sZV4dK28qh3tC0N8KRjufDPKF5aK+L45TsWckMktSY2WPXu5tndAUSKnk0CmL3nAir0tFo663bRLTFJEd/LL8ys7pt/JyFl99WUILnpy4s4=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0201MB2271;
	7:ngxe2V3QPtytg0l4bEj2Zbw53EHVYo34riTbKtX/LtgUOWSTAnp8+KTRrD3yKGBxsB5iF8A/AZNCqwGL3xjeFoEfRiBiQejnC2f8AnYXiQb65w5ocAIlSZSpAUGzk5tUVOqpQvJxovqUXtav7fdg1tV6sqO98Nrl9v3i+P6jzMwdqQqJhgNlH7RWz/A6sbrzp46bqbFEBBvmO5RwTFBSOyQyQ5wXy5ZqlEu96UgX8mYYEcnvQyo45Wtfhm8HFrBK
X-MS-Office365-Filtering-Correlation-Id: 1e0b1637-004b-4c6d-bf1c-08d5bb262fec
X-OriginatorOrg: qt.io
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2018 12:11:42.7332 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e0b1637-004b-4c6d-bf1c-08d5bb262fec
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 20d0b167-794d-448a-9d01-aaeccc1124ac
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0201MB2271
Subject: [meta-qt5][PATCH] qt5: add common PACKAGECONFIG for QtQuickCompiler
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
X-List-Received-Date: Wed, 16 May 2018 15:44:44 -0000
Content-Type: text/plain

The previously commercial-only QtQuickCompiler is now merged into
qtdeclarative. Add common PACKECONFIG which can be used to enable
it, and by default enable it for Qt Charts and Qt VirtualKeyboard.

https://doc-snapshots.qt.io/qt5-5.11/qtquick-deployment.html#compiling-qml-ahead-of-time

Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
---
 recipes-qt/qt5/qt5.inc                  | 2 ++
 recipes-qt/qt5/qtcharts_git.bb          | 2 ++
 recipes-qt/qt5/qtvirtualkeyboard_git.bb | 2 +-
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qt5.inc b/recipes-qt/qt5/qt5.inc
index 95e3854..edae572 100644
--- a/recipes-qt/qt5/qt5.inc
+++ b/recipes-qt/qt5/qt5.inc
@@ -7,8 +7,10 @@ PACKAGECONFIG_OPENSSL ?= "openssl"
 
 PACKAGECONFIG[examples] = ""
 PACKAGECONFIG[tests] = ""
+PACKAGECONFIG[qtquickcompiler] = ",,qtdeclarative-native"
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'examples', 'QT_BUILD_PARTS+=examples', '', d)}"
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'tests', 'QT_BUILD_PARTS+=tests', '', d)}"
+EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'qtquickcompiler', 'CONFIG+=qtquickcompiler', '', d)}"
 
 # we don't want conflicts with qt4
 OE_QMAKE_PATH_HEADERS = "${OE_QMAKE_PATH_QT_HEADERS}"
diff --git a/recipes-qt/qt5/qtcharts_git.bb b/recipes-qt/qt5/qtcharts_git.bb
index 8ef6826..c360ecf 100644
--- a/recipes-qt/qt5/qtcharts_git.bb
+++ b/recipes-qt/qt5/qtcharts_git.bb
@@ -13,3 +13,5 @@ SRCREV = "d3f9275cbaa6a6059298ec248dd28dd6ef065e51"
 # The same issue as in qtbase:
 # http://errors.yoctoproject.org/Errors/Details/152641/
 LDFLAGS_append_x86 = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
+
+PACKAGECONFIG ?= "qtquickcompiler"
diff --git a/recipes-qt/qt5/qtvirtualkeyboard_git.bb b/recipes-qt/qt5/qtvirtualkeyboard_git.bb
index f8759f1..fbacf93 100644
--- a/recipes-qt/qt5/qtvirtualkeyboard_git.bb
+++ b/recipes-qt/qt5/qtvirtualkeyboard_git.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = " \
 #SRC_URI += "file://${T9WRITEPACKAGE};subdir=git/src/virtualkeyboard/3rdparty/t9write"
 #PACKAGECONFIG = "t9write lang-all"
 
-PACKAGECONFIG ?= "lang-all lipi-toolkit"
+PACKAGECONFIG ?= "lang-all lipi-toolkit qtquickcompiler"
 PACKAGECONFIG[hunspell] = ",CONFIG+=disable-hunspell,hunspell"
 PACKAGECONFIG[t9write] = "CONFIG+=t9write"
 PACKAGECONFIG[lipi-toolkit] = "CONFIG+=lipi-toolkit"
-- 
2.17.0


