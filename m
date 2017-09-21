Return-Path: <kwangsub.kim@qt.io>
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
	(mail-eopbgr30096.outbound.protection.outlook.com [40.107.3.96])
	by mail.openembedded.org (Postfix) with ESMTP id 413B177EAA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Sep 2017 08:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=qtcompany.onmicrosoft.com; s=selector1-qt-io;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=Br4N6qVePX01DpYLN2gr/pflyOav/soAth+MdlW04sI=;
	b=fEN32tR5O+NF5uX2YkDahmoo1c0u33/aFOsRtA9YvHeX0MobpdwC5CcaPD6y6YcBxIHW1l0NHn4VfgIlBrfNctFYBsxW79c3MrqPhrDlBvxEC3gVgeMB8l5MQ3GO6mhlfDyR++8YPEPnwx278Y6MKUbCUFGsSpIRYeBK/VkM5BY=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=kwangsub.kim@qt.io; 
Received: from localhost.localdomain (175.195.156.153) by
	HE1PR0202MB2491.eurprd02.prod.outlook.com (10.168.183.137) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.77.7;
	Thu, 21 Sep 2017 07:49:08 +0000
From: Kwangsub Kim <kwangsub.kim@qt.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Sep 2017 16:48:37 +0900
Message-Id: <1505980117-24642-1-git-send-email-kwangsub.kim@qt.io>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [175.195.156.153]
X-ClientProxiedBy: SL2P216CA0044.KORP216.PROD.OUTLOOK.COM (10.174.44.30) To
	HE1PR0202MB2491.eurprd02.prod.outlook.com (10.168.183.137)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b0bb79ac-8bdf-4164-14e9-08d500c53eb4
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254152)(300000503095)(300135400095)(2017052603199)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:HE1PR0202MB2491; 
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0202MB2491;
	3:hdaWYB+ix4yxek0lfDUo4aVF6X7jN1INuVtnKR9ZPihx60cxN9iYdraWOV7QR/Wle33sStRi0o7NRpikC+0grsbX99nJGPhwWu406tQEtQQDYY47fZ5RjVJKs/aB1Nz6w1jdr7UCXygKacgL+YkiKWt6aL+netqcOgmRGy2KLUbRTgmAb2KiWm6RmfnsENqTNo4LlM6+IvXIQoIoFFY3c1yfxsHzS2bOAQoVOvA+eUd51vAGEZFq1NK4MU/ZXPlX;
	25:XHgSbsf83xE4cmnXxLAOqv5AIewr2Al6LZsJUxobJdAsH+X+cin4siJ8NhhWGF2FjSNYeG468L+oHdP4ZHGbEzerO7Dz1Pd3KR9T8CKRmDnA70HxmJSGjEKc7eNCLGHDY7oRZ4h5QMW7FFN9PNuBGESo3KY0FbJctWhcKeaqHn8DNvGRBiHdwEbkrqKpp6zcXwSEeb8KYTbhdE923OY2uGRlutrxfnQzE27oSWUFumoKey0ZJcatbi+1e3jbSq6SCdm8eC8WKcCBJcJ0pBUe/lnqBSFqSYN+qZiT7ZaTwiMG06pd1g7ityB6dqRSWYIZq/PMTW5A9WeNCXWYzz07BQ==;
	31:XO94Rixibc8HabMnny0HeRufok92x68/UTVaHClUSx1sjO3detDx/jOczazyNw7t74yc5+L3OOEA1Z8UAuJv11nlMC0NQzoQHrT7rkxlN4Ff17atPGZp7Y4L96HLhAUeHDuCAK5qjgC8UzqPdE51vaqF/428VuZx/GbLJ38BbiwNloHM7GCj5l2uY3A3CSqybuIhIGOWeF2whwWnj9Iy4JH94Hk/iY3EzDLVKftvzPE=
X-MS-TrafficTypeDiagnostic: HE1PR0202MB2491:
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0202MB2491;
	20:mrxgh1V3wL26P3b2LUplRU2oS/Diu+RMtcGgrwbp2S3nidloQTkT28ib9U2hg8Z0nJiIv4Xvo+8OsXtA4i5EYrU9qjR4jcNoT6Ng0xi9kO+WxapHbFDdMGG06GJSRcVpWdxPhoPYTE+bj9yms4syP/XPxyOX2seTcuFxgiZ7sVVId2Ggm/fd2m70bm1DmLQEN87gFxp5zqb1JRbXp4c5oht+ojC1MXQG2U0OrZvboVIV2LkTeeCfTEeP1C/nGhVwY6TkEJFqFnoIqEEEXowaaAQkmgvHVOFNToDdZT2Fra1/ifeXuCEsiE2ZOKQq9s3IR/iXtPe3qjyeeBiZQFViC556g/1Hw1tKsV00eyGVLidFFVCAGGQpJzr1Uzs18WgC8Qv7NgghCHyaMCw5GfasGHq6xZ5/oMJhXldZzyNX4fliKiYobMoXEPQQPPxLyZ6LdDLDIusobJuWUF9+oJ9FaTRiFwdTYJbRPzTHyjBj4wxUvKMdkijL5lP4M9hO3s3Y;
	4:niK/IX6jbS8wV0jdqNUt0INmVQu55BexTkISjDAnw+D4FmhTQDaoJclvSm3lyo2ekA7X7rGkQIqnMnwvcrY1trZ3ttqCDGHAx1010bzGp0Xdcc4pvgrmTUCDwjI5b6UXn6ml04ulgcroSiKA9r331hmEnTHoVbfahCw0Hv6n0QIt37R/PUOSSlr/U1G4pGVjSyE/PG6QpBiOqoabQfXfX5HloYrk4AhyWk809McIr/Wm6kM80gJcdbyrhhK4DmTx
X-Exchange-Antispam-Report-Test: UriScan:;
X-Microsoft-Antispam-PRVS: <HE1PR0202MB2491433A0EAD6B779EF12D5F86660@HE1PR0202MB2491.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(10201501046)(100000703101)(100105400095)(93006095)(93001095)(3002001)(6041248)(20161123558100)(20161123560025)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123564025)(20161123555025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:HE1PR0202MB2491; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:HE1PR0202MB2491; 
X-Forefront-PRVS: 04371797A5
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6069001)(6009001)(376002)(346002)(39830400002)(189002)(199003)(53936002)(97736004)(74482002)(16586007)(50226002)(16526017)(316002)(36756003)(2906002)(189998001)(25786009)(5660300001)(68736007)(8936002)(105586002)(48376002)(50466002)(6666003)(33646002)(6486002)(6506006)(305945005)(575784001)(106356001)(50986999)(86362001)(2361001)(47776003)(7736002)(3846002)(66066001)(4326008)(101416001)(6512007)(6116002)(5003940100001)(478600001)(2351001)(8676002)(81156014)(81166006)(6916009)(19627235001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:HE1PR0202MB2491;
	H:localhost.localdomain; FPR:; SPF:None; PTR:InfoNoRecords; MX:1;
	A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: qt.io does not designate permitted
	sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; HE1PR0202MB2491;
	23:h8f2zIxyDzKy5SJj0VwktL+UHhvMArkwMV7YSUW?=
	=?us-ascii?Q?7aC348myAqvYTrWhpAIYsfmei14xLAGKIXgL/dNKOmR4YFKVUVcopmYEkL+v?=
	=?us-ascii?Q?F3MevySEmWvLXUjqA6u6+d7RdKi8h2o0CCqyJHdJ7jSRm+uYL5arDPapCILw?=
	=?us-ascii?Q?5Jqcvt/wKEbnXTwnllUesHuX0ILISvSIc+djVMKFJZrI9eN5cWU3THvtkVBc?=
	=?us-ascii?Q?Vzc+cDtUCaLBX+G5bqFws9lpxOiootomUJ2vQ9IqFUvoNNT80tQgn0lpYuMM?=
	=?us-ascii?Q?h/C0mhjEjHqckN7fv5F2uo/sRr926xtIwxGZ/4AWMlnH+ZSRdKEgwvYiD4dy?=
	=?us-ascii?Q?ZDP2trDDU8BhPvwSh8tKlSqp5R4LCcqRrmNLvkOCaV24kogIfgXHV88dt284?=
	=?us-ascii?Q?YgO22wmzIFj3AFy7jY20EdeiunQpBYvw2Tdn2Z+uvfnywlnmffGW2HEM4q4h?=
	=?us-ascii?Q?yEiZyx740DwfHVk1OLcb+smSTa814OMx7hzTtvwZ+3hdlzfe1Jq5f7cXCAiH?=
	=?us-ascii?Q?7ES0D9eClF3pRg+49j+3P4Pi1KAUegMzYpcsbJTWzflSV9WfMK2LVfjCib+F?=
	=?us-ascii?Q?OmIT5pJF3MFPIcmHuceOusOmulLIlvX40ejG1UilAmYwcOIDCFcR6e7ekvnx?=
	=?us-ascii?Q?aXyg1/T/nbXC+qWQBkKeomFLuMoe5ZBL1Ux/byLktm1qWCqqpgP2x1XarVd6?=
	=?us-ascii?Q?i2AcCngcQKbl5kba38MFfTa7xfuuFUFVg9bz++hbm9Di8+4xiDFoRSs1/wK2?=
	=?us-ascii?Q?fqrVBlbiWrUHpfvIDZ8ggjmiVzsF1DVxWvvzLQlxQ/TGDMvDY4dS4pHoLWv/?=
	=?us-ascii?Q?QONa9AOxCV30ncqja1GnLVPORP7LMJ9pkScTNJGyDq9m2tOGZbU1YQqXKnzQ?=
	=?us-ascii?Q?KMHvPV0kmRCg5i8Y1PS8+yN852oRJhssdptsuI7jhkUZmaKsABnlvN2rxbOm?=
	=?us-ascii?Q?9S3hlmvKBzTdSIJh1aYNDn6ra6vutXItpbFYYT+PbMU2sLb0x3ZqMhwBbZhp?=
	=?us-ascii?Q?Ixs4AKFWyezbZhPlcrszMKzJHwgGz+fqX+bgbRgs9GIcDFYWSG01lFxScf2v?=
	=?us-ascii?Q?55HYAZvfKHuHcllRNYLOjo36bC6D22mofA4lpNi5AAJk7w8tqrezkYFqvRFC?=
	=?us-ascii?Q?6QTCzXKuR3qjT/nC1kMoMqEF1xzDL+SOp974ZJL8dxT5zdR35GOlcSw=3D?=
	=?us-ascii?Q?=3D?=
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0202MB2491;
	6:sCJaibx68ag6pVaPL8qqqQDlBKp50SSQsBSw/e4SgpdMhRfBjwg8dSbgF1z9oXh2Uxp4ZsVHypOl2cOG0S+FxdtxvvKNPwglkB2x3Bc5h7ct2v4jAJwgYpTQ/eRQ6BBZimp9ro+DkbRvokphdm2t9Vdr0lXI3Hu+HK5QuKB7u3XNNQVT6iB9NT+B3n9W7TNU4t+zeR87wVxo9ou5HGZ+d0pdE9dv7hCO9PXYqL3Sn9Qk/e1jrBcn6WQS887U9dgM2lsfuas1mD8ejj27JsDAkskzOIShgVqJr7IvqP/8EUh3sJm0fZTgjNHKQ4Uss01u4kbALX3FDhgX3rCHSk/MaQ==;
	5:HcczwSculcdfK3G/2+MEtG9vxcaIn6Uby8Jpx984VZAxWJWiZragPf/TT1XW3iXKVOO6NvSf1oMq4Bx47Sxq55PLkHZ/QEC17go7m8pq/mG3O2vOWoEBoiYDbaNaPRRyCmRoTk5Ju4IEmNa7hyFRBw==;
	24:F1yM9X0ut/t5s+vBX9sk6K3v5/imUnbadJNw5kXjzVLDD6F9VxlIY/ER2cF7MuoP584F/NF0pCI0QpnlZDdZIFCAHaXRLPJeeN9NjvOo6do=;
	7:rrVj3hYmd/gVBus2RpRvtTyemu3bJ6QbNcPfAgbqWsFIlj8KTJ0VyYPJ9KHvFKfvP5qijLKF8cmPivYb+gqcqj0A5/j7W6zNyip43kntBRrLqbL/npywQciO4hFAi2aQVf66mcUMt2AfXdaQIpUC6OuaOhmmqIKQVIW1ELMUaIDnuvAspv1ZyyW4Y7MjNkje04ynbTxBpuCRgZZlcPYAtzUal5RBn1KM2Pjthm+aEGM=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: qt.io
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2017 07:49:08.7402 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 20d0b167-794d-448a-9d01-aaeccc1124ac
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0202MB2491
Subject: [meta-qt5][PATCH] qt5: add missing commercial license
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
X-List-Received-Date: Thu, 21 Sep 2017 08:21:44 -0000
Content-Type: text/plain

Signed-off-by: Kwangsub Kim <kwangsub.kim@qt.io>
---
 recipes-qt/qt5/qt3d_git.bb             | 2 +-
 recipes-qt/qt5/qtcanvas3d_git.bb       | 2 +-
 recipes-qt/qt5/qtcharts_git.bb         | 2 +-
 recipes-qt/qt5/qtdatavis3d_git.bb      | 2 +-
 recipes-qt/qt5/qtlocation_git.bb       | 2 +-
 recipes-qt/qt5/qtquickcontrols2_git.bb | 2 +-
 recipes-qt/qt5/qtserialbus_git.bb      | 2 +-
 recipes-qt/qt5/qtserialport_git.bb     | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/recipes-qt/qt5/qt3d_git.bb b/recipes-qt/qt5/qt3d_git.bb
index c354db4..0cb75a6 100644
--- a/recipes-qt/qt5/qt3d_git.bb
+++ b/recipes-qt/qt5/qt3d_git.bb
@@ -1,7 +1,7 @@
 require qt5.inc
 require qt5-git.inc
 
-LICENSE = "LGPL-3.0 | GPL-2.0"
+LICENSE = "LGPL-3.0 | GPL-2.0 | The-Qt-Company-Commercial"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.LGPLv3;md5=8211fde12cc8a4e2477602f5953f5b71 \
     file://LICENSE.GPLv3;md5=88e2b9117e6be406b5ed6ee4ca99a705 \
diff --git a/recipes-qt/qt5/qtcanvas3d_git.bb b/recipes-qt/qt5/qtcanvas3d_git.bb
index 25cd72b..f46cbc2 100644
--- a/recipes-qt/qt5/qtcanvas3d_git.bb
+++ b/recipes-qt/qt5/qtcanvas3d_git.bb
@@ -1,7 +1,7 @@
 require qt5.inc
 require qt5-git.inc
 
-LICENSE = "LGPL-3.0 | GPL-3.0"
+LICENSE = "LGPL-3.0 | GPL-3.0 | The-Qt-Company-Commercial"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.LGPLv3;md5=e0459b45c5c4840b353141a8bbed91f0 \
     file://LICENSE.GPLv3;md5=88e2b9117e6be406b5ed6ee4ca99a705 \
diff --git a/recipes-qt/qt5/qtcharts_git.bb b/recipes-qt/qt5/qtcharts_git.bb
index d3447ef..26881f0 100644
--- a/recipes-qt/qt5/qtcharts_git.bb
+++ b/recipes-qt/qt5/qtcharts_git.bb
@@ -1,7 +1,7 @@
 require qt5.inc
 require qt5-git.inc
 
-LICENSE = "GPL-3.0"
+LICENSE = "GPL-3.0 | The-Qt-Company-Commercial"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.GPL3;md5=d32239bcb673463ab874e80d47fae504 \
 "
diff --git a/recipes-qt/qt5/qtdatavis3d_git.bb b/recipes-qt/qt5/qtdatavis3d_git.bb
index 471cfee..3737e10 100644
--- a/recipes-qt/qt5/qtdatavis3d_git.bb
+++ b/recipes-qt/qt5/qtdatavis3d_git.bb
@@ -1,7 +1,7 @@
 require qt5.inc
 require qt5-git.inc
 
-LICENSE = "GPL-3.0"
+LICENSE = "GPL-3.0 | The-Qt-Company-Commercial"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.GPL3;md5=d32239bcb673463ab874e80d47fae504 \
 "
diff --git a/recipes-qt/qt5/qtlocation_git.bb b/recipes-qt/qt5/qtlocation_git.bb
index 19f895e..0aebbd3 100644
--- a/recipes-qt/qt5/qtlocation_git.bb
+++ b/recipes-qt/qt5/qtlocation_git.bb
@@ -1,7 +1,7 @@
 require qt5.inc
 require qt5-git.inc
 
-LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception-1.1 | LGPL-3.0) | GPL-2.0"
+LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception-1.1 | LGPL-3.0) | GPL-2.0 | The-Qt-Company-Commercial"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.LGPLv21;md5=4bfd28363f541b10d9f024181b8df516 \
     file://LICENSE.LGPLv3;md5=e0459b45c5c4840b353141a8bbed91f0 \
diff --git a/recipes-qt/qt5/qtquickcontrols2_git.bb b/recipes-qt/qt5/qtquickcontrols2_git.bb
index e123f0d..4b2924b 100644
--- a/recipes-qt/qt5/qtquickcontrols2_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols2_git.bb
@@ -1,7 +1,7 @@
 require qt5.inc
 require qt5-git.inc
 
-LICENSE = "GFDL-1.3 & BSD & LGPL-3.0 | GPL-3.0"
+LICENSE = "GFDL-1.3 & BSD & LGPL-3.0 | GPL-3.0 | The-Qt-Company-Commercial"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
     file://LICENSE.LGPLv3;md5=382747d0119037529ec2b98b24038eb0 \
diff --git a/recipes-qt/qt5/qtserialbus_git.bb b/recipes-qt/qt5/qtserialbus_git.bb
index d3a83a7..0b30043 100644
--- a/recipes-qt/qt5/qtserialbus_git.bb
+++ b/recipes-qt/qt5/qtserialbus_git.bb
@@ -1,7 +1,7 @@
 require qt5.inc
 require qt5-git.inc
 
-LICENSE = "GFDL-1.3 & (LGPL-3.0 | GPL-2.0+)"
+LICENSE = "GFDL-1.3 & (LGPL-3.0 | GPL-2.0+) | The-Qt-Company-Commercial"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.LGPLv3;md5=e0459b45c5c4840b353141a8bbed91f0 \
     file://LICENSE.GPLv2;md5=c96076271561b0e3785dad260634eaa8 \
diff --git a/recipes-qt/qt5/qtserialport_git.bb b/recipes-qt/qt5/qtserialport_git.bb
index 056e237..23f03ce 100644
--- a/recipes-qt/qt5/qtserialport_git.bb
+++ b/recipes-qt/qt5/qtserialport_git.bb
@@ -3,7 +3,7 @@ require qt5-git.inc
 
 # text of LGPL_EXCEPTION.txt and LICENSE.FDL is slightly different than what
 # other qt* components use :/
-LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
+LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception-1.1 | LGPL-3.0) | The-Qt-Company-Commercial"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.LGPLv21;md5=4bfd28363f541b10d9f024181b8df516 \
     file://LICENSE.LGPLv3;md5=e0459b45c5c4840b353141a8bbed91f0 \
-- 
2.7.4


