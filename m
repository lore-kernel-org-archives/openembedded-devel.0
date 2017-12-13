Return-Path: <mikko.gronoff@qt.io>
X-Greylist: delayed 7212 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 13 Dec 2017 09:57:00 UTC
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
	(mail-he1eur01on0135.outbound.protection.outlook.com [104.47.0.135])
	by mail.openembedded.org (Postfix) with ESMTP id ED23F6067C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Dec 2017 09:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=qtcompany.onmicrosoft.com; s=selector1-qt-io;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=kFsXGxFj8+aNSlwDlBF6ZkmAemjsDP7Pn9FpQYcGL8M=;
	b=K47bxTqYDODqq+bqG+gB0W57MxlT0/p7PkuZEp7AUZ3JVuraGcSl7jpZiv64hpf36G1eKaEs/joLeZsq83A/2KJsmijsog+l8wRk6ZO4IcDyF9n59EF3ezpimrp6+UuGbmWINu4SrbvreLValhKCSJ/nr0BQwNmEiunMtKP5FTU=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mikko.gronoff@qt.io; 
Received: from qt.intra.qt (192.89.120.53) by
	VI1PR0201MB2175.eurprd02.prod.outlook.com (2603:10a6:800:25::18) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.302.9;
	Wed, 13 Dec 2017 07:23:24 +0000
From: Mikko Gronoff <mikko.gronoff@qt.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Dec 2017 09:22:25 +0200
Message-Id: <1513149745-27186-1-git-send-email-mikko.gronoff@qt.io>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [192.89.120.53]
X-ClientProxiedBy: AM5PR0602CA0018.eurprd06.prod.outlook.com
	(2603:10a6:203:a3::28) To VI1PR0201MB2175.eurprd02.prod.outlook.com
	(2603:10a6:800:25::18)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b1fdbd0b-6eef-4978-cb43-08d541fa6622
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(5600026)(4604075)(2017052603307);
	SRVR:VI1PR0201MB2175; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0201MB2175;
	3:MrLdrDiQXG9xX9lwIsqUqIfzokB1nivxtvsE36noARK128ftHfCtp/qoBdXgM6pAK3dJ3o+XYsEX4XbMjcdqcNMKy8vx/mgnp7Itz0JtOw9NM3428DTnR9niPFLD8VXRP/rVoABhawxx0siFlTtFT87chlS2N2oavfelq3IZwzfKueqkyX/zIicKI9hz0Y4dI7GnjTWB5ELYnw+vMXReoJrNZqsVyvao3Dq7p7KYV8z3wJ+alMUGrbJJN4gFzvX8;
	25:5uhtZ00AWID9w2uMjETpRyMOCtUrHeDcxoiCkEpbJL3lVASZkyZj0UsIjVKDZi4w/Nn4v0LE49HR5/G9rSea5pHp9iUumLsrmv0feJzegPaITwsFapa/O4Oj1faZlrL4RpFVFourEo166Fr8WPQdAUe2DwR4PUXwY9S1ycypGFiSsO8VgtCQYlxZFZTrHJItGqdAc9P/41/baMLBOyplafcBp3wmjMJ+XXjUAigakkkPbOgvnNtrewcCVmUJis8Fp0awPxlqZP7PZYUOgBVaiBnoJMnTNlsDytuzUIiZzO69fxGzROcGGbhJl/i550SHt6vBnN3rjW4hh1eJE3pISg==;
	31:HFssj6zSbJJqWYq+TTPCki2bPyKa+6usv2fjK0gvCzqf+mp0p5O2d7137qUjn7xEdkpBMTp/JGtK/rIDMkXGHtWz03knMhWmnpwZDUwOMpOpG2QdpIW70q7sJLs/YmjIQh7OeZKm5Q4TvkcxtsctuD9Qd/plx7icbjBHk5Rv7ynewrsc+h7cMQ00Pgp0GkcpGG1CEyJ+qcTrA3rTcuCndyN7W/s8MdbOZ5SQVJLyv6E=
X-MS-TrafficTypeDiagnostic: VI1PR0201MB2175:
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0201MB2175;
	20:Qm7Ch4iH3Tsq6g5A1Fyd4K17soUjxDmd+TJsuIVsNJ/8I3kbQZy5a7BfmflSMGk6w70U6Y0CACefMtkujXoFiTxihg1bcHOKWEMnUR3xMAnz6oSyCq6FXe3OGh56X7kxwCOJWm7uF8AkEBccI5Yr+xKVg+64HQiCi176b0KRoeyItKbI5xEQ9iZhAOLMFzYfrsEgnCpK9PnPYmVANRnA6TeHqtHy3uhOPwfKigHKV9rt90C8NtjtWfi/mgUiViY0CLjj/pMsP00cutJfP+9Z/zv0hdGilqvgNvHHRfS/tVyfQBo8E8Jtxil0hpkKAO/W2qPMZg0JM2/xcz8JF/s4wUc1ynYpTYcRvZZbCFyh3gsFWXwo56lQMypWBKEVF8zKDtQEkvaCXLCy4zuL77PAk3htvrtOmojea2QIzPwp4tY39oc8N0Uw2aUtW+61Mj6/Z96mMkW4iBkbsTYnQFIIFMglxknFcOg5Y9fZwo4C+ZEakCVBIPwhSpGb0CTu7DbN;
	4:FgChHwSn4NafAjalhhkWo1KKg/UeswPX3J6+H2UK4n7Pp3esX8N3W5WKKdZ2QvxXGn21R9i9oQDGuig6Ol/n7MOt7EGt/XtSLZWNsp3Vl5I91oZarcQx+4hHxNLa+V8a30djYv1yggvHL0nPkvIHYDFgzNWuB9z8WV6AbAtg9DX8nwt/zprHbThTG0G3gVMMJoiyrKJQfv/zBhJoX1ygBe5YkDlumyyagRHJK/ZUqNJ0ndJuvGxEeEu7Zm+m8yruAmHKmALM9oXWpKK8SnYJSPIS0Ybnf8l9YRGm0E3x3Zo0hstvGAySJbOrjDlOIIpS
X-Microsoft-Antispam-PRVS: <VI1PR0201MB2175F7968268E3A36EFA61B5E9350@VI1PR0201MB2175.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(788757137089);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040450)(2401047)(8121501046)(5005006)(3231023)(10201501046)(93006095)(93001095)(3002001)(6041248)(20161123564025)(20161123562025)(20161123555025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(20161123560025)(6072148)(201708071742011);
	SRVR:VI1PR0201MB2175; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:VI1PR0201MB2175; 
X-Forefront-PRVS: 052017CAF1
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(376002)(346002)(366004)(199004)(189003)(25786009)(66066001)(47776003)(6512007)(50226002)(4326008)(52116002)(36756003)(50466002)(53936002)(48376002)(59450400001)(33896004)(16526018)(53416004)(51416003)(6486002)(53546011)(8936002)(97736004)(86362001)(15650500001)(575784001)(16586007)(2906002)(316002)(3846002)(68736007)(305945005)(7736002)(2361001)(478600001)(105586002)(6116002)(74482002)(2351001)(106356001)(8676002)(69596002)(81156014)(81166006)(6916009)(6506007)(5660300001)(386003)(19627235001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0201MB2175; H:qt.intra.qt;
	FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: qt.io does not designate permitted
	sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; VI1PR0201MB2175;
	23:Lx0piN4CJM2hnzYn5zJ8o5d77XAXejJLBRo8JlD?=
	=?us-ascii?Q?pnz3ev5shssIpnAG85KReaQikay1GcWyTD2l3gm+KmSuHAdY10WpBwN2+ky9?=
	=?us-ascii?Q?aXsGjsu6sS5zB1MSgSPr3Bh6WZ16F8/rZ5+89yKoeAocckJrDdJOpV4Jro4a?=
	=?us-ascii?Q?9YIsp9BeKQ1STsBOSmFuXNiKEd8yVlxkCh86PtvVSY27fpKPaa6L6XCWV4G/?=
	=?us-ascii?Q?UjBwHAVTCMlMNPuZhzKgPz1oJA+szY90H15PAKn/4Us5WSqqfmyfziCpV9TF?=
	=?us-ascii?Q?d2EMdPFET6PNmUOMv/sZ0moAL/7LnHhM2HZd0TDwHbWtvFbXcw5ZG5IXPI3z?=
	=?us-ascii?Q?uygnqUvshbqh3Y7p9M8sKDMVH7nxfA6wkILlccV3g9d2rAvPQLxLkoGFAWCp?=
	=?us-ascii?Q?+lM3bBydV3vHhSwp/XPFfTB2w5y8QdNXNYfusnVbHIpESKkiNrCVt3CMFnz3?=
	=?us-ascii?Q?4icxygxBkOiTSOI+RpkXEOKD94XPzHGT8m3sj+wMAeQ40UzL/yEZz09c7zTQ?=
	=?us-ascii?Q?2hUaiwlbsd/Bx1KSefMenJnAVz95bw/A3ts0DAeey8xs6/wHeM1WZl1TeEar?=
	=?us-ascii?Q?v8ldgCM3jdNw2uWGDKYoV2/miqmun9D7H2DPcznZTI9fB/ZCjcKHZ2HLneTl?=
	=?us-ascii?Q?bOkWBxFNewxg1oUK4F3E3Gzjixvxn/FZH86gGXV/BfxkyQa2S3LXCgnofDMz?=
	=?us-ascii?Q?GWoEAZmr6g3IXNkCdWqMgxQ55jq1ZmSNZr+XXNzmQMoIPJoHOvMGD36oE1e9?=
	=?us-ascii?Q?l5Z2RG2SZtQvI+MdoLc2z5z4cuv2rpCFBoscj9VJ06EpEODSYUGN5q1Zkb7u?=
	=?us-ascii?Q?Be3eaaqUg0S9DAjHQX2z5wXW2Y6kncihVcEdeYlZ9J9ZL7tDOabo+YecPbBE?=
	=?us-ascii?Q?U9XVcVr2E64CkKAAjptLAPjmZ0z82ittskMe47pv9FyiE0r2aO0PmqDf7RV0?=
	=?us-ascii?Q?MygBXwvR/Mni1Hy7D6jTuriSznBYF/+tFmSXFwSRJVCD3fJQXpZuQeg/fajp?=
	=?us-ascii?Q?B7xtRZ/qVyF+GduDTFsaYRvNmphKu0XkSkZyG9Rwh+ab5eXr104TBuK8BnkE?=
	=?us-ascii?Q?gLLKR/FJaPzJY11MGZxPJ/9sIAlxOq/xf3nAJUFwxNtv+T3WkeEExugAXOV/?=
	=?us-ascii?Q?IhQzsuv/XuugygEqTNc094ZtMXPWslUgbbE+oVXMU73SJxYlMzhaqP9n8/vd?=
	=?us-ascii?Q?03dq5rbXK958lQlU=3D?=
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0201MB2175;
	6:u6eri+mS6zqjv8ugCpLV39GaSkN8OJ515NoGSvmLwlABJPioSSGaDTfbNbVa4fJtFmq1I/jJsHmZ7WVyq7KB4N0xwOPCtuFgg5Dtx26WQ0BUErqw1C+djgCh1sVtpri/BYk1hcLHN03Fd2l/iaPqE/dxm4JGrLM8F/2YLXCoKBbc4neUJ3rks0Fr7AO4P7y6Ucl5DFbrY1Fy7bbY9zMOpIRAT+GztseQiDvDHDRqGxh6H6aN9e20rxKgbaEyG+/pwePFa6HQekBb/+E7bxBmCxXKeWE2COBlLNppLa9wBlhSXDiZMeu+FUfvEUAr1Fxnqz0rtESuhfaabVdEZTQn26cE7G9orQs5wsdXOSy+QxQ=;
	5:a6e+IesxatMbdNzIiuz97WNRFOCcHJ6EgXHA/Gq3/2Fx1uZYb/QbIvD9pp6LpDKNB8cPr9viwZGoW3veiLU1L6IQ1ExIPJVquRl52AfNpKCIADHIVIRW+tijuwPSCTqd4aRGzWOFJrr7oRCGOEM1VD+8Yz/a9PrzZ0rLI9y4ph4=;
	24:4LR/wuOF287TNafgn8JZW99EQ8WLZaydL15YPJ8CCu0+MRlkvD/JqlVK+7/OezgwbBEpHSJApu7zxahnsZ97t2+woPFdPJNyJwiECA5u8z4=;
	7:z6D/ZP7HIyPhB24Y5GeEnDLSaMv0274+oDWR0GEvDeIoFAtgoXDnHEuV0aPaylowNkTRjwol0a26wsURNznKkYDOSGGhJcSdEXTyMvBj8w1piabW8ceBj+zDxtsWTWq7dN808Phiepfc8fs+rhMxlds+drU5r3G+NVr1EjkEK1kQ1luKKNh6nSCfGTbbWHMnY2iZsy+deZx+1IAQeiNi0prwa4A2tjCg6Ufi3xglB/dK1lKWE1BC0YdWzRexgBXO
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: qt.io
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2017 07:23:24.9603 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1fdbd0b-6eef-4978-cb43-08d541fa6622
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 20d0b167-794d-448a-9d01-aaeccc1124ac
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0201MB2175
Subject: [meta-qt5][krogoth][PATCH] qt5: update submodules to Qt 5.6.3
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
X-List-Received-Date: Wed, 13 Dec 2017 09:57:01 -0000
Content-Type: text/plain

Signed-off-by: Mikko Gronoff <mikko.gronoff@qt.io>
---
 recipes-qt/qt5/nativesdk-qtbase_git.bb             |   2 +-
 recipes-qt/qt5/qt3d_git.bb                         |   2 +-
 recipes-qt/qt5/qt5-git.inc                         |   2 +-
 recipes-qt/qt5/qtbase-native_git.bb                |   2 +-
 ...external-hostbindir-option-for-native-sdk.patch |  34 ++---
 recipes-qt/qt5/qtbase_git.bb                       |   2 +-
 recipes-qt/qt5/qtcanvas3d_git.bb                   |   2 +-
 recipes-qt/qt5/qtconnectivity_git.bb               |   2 +-
 recipes-qt/qt5/qtdeclarative_git.bb                |   2 +-
 recipes-qt/qt5/qtgraphicaleffects_git.bb           |   2 +-
 recipes-qt/qt5/qtimageformats_git.bb               |   2 +-
 recipes-qt/qt5/qtlocation_git.bb                   |   2 +-
 recipes-qt/qt5/qtmultimedia_git.bb                 |   2 +-
 recipes-qt/qt5/qtquick1_git.bb                     |   2 +-
 recipes-qt/qt5/qtquickcontrols2_git.bb             |   2 +-
 recipes-qt/qt5/qtquickcontrols_git.bb              |   2 +-
 recipes-qt/qt5/qtscript_git.bb                     |   2 +-
 recipes-qt/qt5/qtsensors_git.bb                    |   2 +-
 recipes-qt/qt5/qtserialport_git.bb                 |   2 +-
 recipes-qt/qt5/qtsvg_git.bb                        |   2 +-
 recipes-qt/qt5/qttools_git.bb                      |   2 +-
 recipes-qt/qt5/qttranslations_git.bb               |   2 +-
 recipes-qt/qt5/qtwayland-native_git.bb             |   3 +-
 ...g-of-QWaylandIntegration-if-some-Qt5-feat.patch | 156 ---------------------
 recipes-qt/qt5/qtwayland_git.bb                    |   3 +-
 recipes-qt/qt5/qtwebchannel_git.bb                 |   2 +-
 recipes-qt/qt5/qtwebengine_git.bb                  |  12 +-
 recipes-qt/qt5/qtwebkit-examples_git.bb            |   2 +-
 recipes-qt/qt5/qtwebkit_git.bb                     |   2 +-
 recipes-qt/qt5/qtwebsockets_git.bb                 |   2 +-
 recipes-qt/qt5/qtx11extras_git.bb                  |   2 +-
 recipes-qt/qt5/qtxmlpatterns_git.bb                |   2 +-
 32 files changed, 51 insertions(+), 211 deletions(-)
 delete mode 100644 recipes-qt/qt5/qtwayland/0001-Fix-building-of-QWaylandIntegration-if-some-Qt5-feat.patch

diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
index bcaa890..a891cc5 100644
--- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
+++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
@@ -258,4 +258,4 @@ fakeroot do_generate_qt_environment_file() {
 
 addtask generate_qt_environment_file after do_install before do_package
 
-SRCREV = "b4ada3f0d8feed7dbff22aa780d38ab126020ac6"
+SRCREV = "e6f8b072d2bf15f8b82bede48ff29ce8ac8dbd9a"
diff --git a/recipes-qt/qt5/qt3d_git.bb b/recipes-qt/qt5/qt3d_git.bb
index 7b289da..da87c1c 100644
--- a/recipes-qt/qt5/qt3d_git.bb
+++ b/recipes-qt/qt5/qt3d_git.bb
@@ -27,6 +27,6 @@ FILES_${PN}-qmlplugins += " \
     ${OE_QMAKE_PATH_QML}/*/*/*.obj \
 "
 
-SRCREV = "d3889211dc245d44dab25dcc9fbbc4b57e92ac33"
+SRCREV = "fc781fa42287a4f5db62a346ad6eb8bcbb9f49c0"
 
 BBCLASSEXTEND += "native nativesdk"
diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
index c5795ed..a17ec24 100644
--- a/recipes-qt/qt5/qt5-git.inc
+++ b/recipes-qt/qt5/qt5-git.inc
@@ -11,4 +11,4 @@ SRC_URI = " \
 
 S = "${WORKDIR}/git"
 
-PV = "5.6.2+git${SRCPV}"
+PV = "5.6.3+git${SRCPV}"
diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
index efce827..b0278fa 100644
--- a/recipes-qt/qt5/qtbase-native_git.bb
+++ b/recipes-qt/qt5/qtbase-native_git.bb
@@ -117,4 +117,4 @@ do_install() {
     ln -sf syncqt.pl ${D}${OE_QMAKE_PATH_QT_BINS}/syncqt
 }
 
-SRCREV = "b4ada3f0d8feed7dbff22aa780d38ab126020ac6"
+SRCREV = "e6f8b072d2bf15f8b82bede48ff29ce8ac8dbd9a"
diff --git a/recipes-qt/qt5/qtbase/0011-Add-external-hostbindir-option-for-native-sdk.patch b/recipes-qt/qt5/qtbase/0011-Add-external-hostbindir-option-for-native-sdk.patch
index d257d3f..e55b9ed 100644
--- a/recipes-qt/qt5/qtbase/0011-Add-external-hostbindir-option-for-native-sdk.patch
+++ b/recipes-qt/qt5/qtbase/0011-Add-external-hostbindir-option-for-native-sdk.patch
@@ -1,4 +1,4 @@
-From 2aa52f19cab8eafff84d1828367d1e38cb34315d Mon Sep 17 00:00:00 2001
+From a67370ba276ae4a098a8c34bda72dba5387d9dae Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 6 Apr 2013 13:15:07 +0200
 Subject: [PATCH] Add -external-hostbindir option for native(sdk)
@@ -37,7 +37,7 @@ Conflicts:
  5 files changed, 16 insertions(+), 1 deletion(-)
 
 diff --git a/configure b/configure
-index d98ea53..f42abe6 100755
+index 224f9f5..271c4f4 100755
 --- a/configure
 +++ b/configure
 @@ -3951,6 +3951,7 @@ fi
@@ -49,22 +49,22 @@ index d98ea53..f42abe6 100755
  addConfStr "$shortspec"
  
 diff --git a/qmake/property.cpp b/qmake/property.cpp
-index 817ae95..c69539f 100644
+index b9139d5..6725ab7 100644
 --- a/qmake/property.cpp
 +++ b/qmake/property.cpp
-@@ -68,6 +68,7 @@ static const struct {
-     { "QT_HOST_DATA", QLibraryInfo::HostDataPath, true },
-     { "QT_HOST_BINS", QLibraryInfo::HostBinariesPath, true },
-     { "QT_HOST_LIBS", QLibraryInfo::HostLibrariesPath, true },
-+    { "QT_EXTERNAL_HOST_BINS", QLibraryInfo::ExternalHostBinariesPath, true },
-     { "QMAKE_SPEC", QLibraryInfo::HostSpecPath, true },
-     { "QMAKE_XSPEC", QLibraryInfo::TargetSpecPath, true },
+@@ -69,6 +69,7 @@ static const struct {
+     { "QT_HOST_DATA", QLibraryInfo::HostDataPath, true, false },
+     { "QT_HOST_BINS", QLibraryInfo::HostBinariesPath, true, false },
+     { "QT_HOST_LIBS", QLibraryInfo::HostLibrariesPath, true, false },
++    { "QT_EXTERNAL_HOST_BINS", QLibraryInfo::ExternalHostBinariesPath, true, false },
+     { "QMAKE_SPEC", QLibraryInfo::HostSpecPath, true, true },
+     { "QMAKE_XSPEC", QLibraryInfo::TargetSpecPath, true, true },
  };
 diff --git a/src/corelib/global/qlibraryinfo.cpp b/src/corelib/global/qlibraryinfo.cpp
-index e1c87b5..d6e03ba 100644
+index 1bddb53..cd0a666 100644
 --- a/src/corelib/global/qlibraryinfo.cpp
 +++ b/src/corelib/global/qlibraryinfo.cpp
-@@ -373,7 +373,7 @@ QLibraryInfo::isDebugBuild()
+@@ -375,7 +375,7 @@ QLibraryInfo::isDebugBuild()
   */
  
  static const struct {
@@ -73,7 +73,7 @@ index e1c87b5..d6e03ba 100644
  } qtConfEntries[] = {
      { "Prefix", "." },
      { "Documentation", "doc" }, // should be ${Data}/doc
-@@ -398,6 +398,7 @@ static const struct {
+@@ -400,6 +400,7 @@ static const struct {
      { "HostBinaries", "bin" },
      { "HostLibraries", "lib" },
      { "HostData", "." },
@@ -94,10 +94,10 @@ index 1ad7637..5a8b127 100644
          HostSpecPath,
          HostPrefixPath,
 diff --git a/tools/configure/configureapp.cpp b/tools/configure/configureapp.cpp
-index f2b54f5..d973c11 100644
+index 2b7a1d6..77ba91e 100644
 --- a/tools/configure/configureapp.cpp
 +++ b/tools/configure/configureapp.cpp
-@@ -1261,6 +1261,13 @@ void Configure::parseCmdLine()
+@@ -1267,6 +1267,13 @@ void Configure::parseCmdLine()
              dictionary[ "QT_EXT_PREFIX" ] = configCmdLine.at(i);
          }
  
@@ -111,7 +111,7 @@ index f2b54f5..d973c11 100644
          else if (configCmdLine.at(i) == "-make-tool") {
              ++i;
              if (i == argCount)
-@@ -4258,6 +4265,9 @@ void Configure::generateQConfigCpp()
+@@ -4269,6 +4276,9 @@ void Configure::generateQConfigCpp()
  
      if (dictionary["QT_REL_HOST_DATA"].isEmpty())
          dictionary["QT_REL_HOST_DATA"] = haveHpx ? "." : dictionary["QT_REL_INSTALL_ARCHDATA"];
@@ -121,7 +121,7 @@ index f2b54f5..d973c11 100644
  
      confStringOff = 0;
      addConfStr(0, dictionary["QT_REL_INSTALL_DOCS"]);
-@@ -4277,6 +4287,7 @@ void Configure::generateQConfigCpp()
+@@ -4288,6 +4298,7 @@ void Configure::generateQConfigCpp()
      addConfStr(1, dictionary["QT_REL_HOST_BINS"]);
      addConfStr(1, dictionary["QT_REL_HOST_LIBS"]);
      addConfStr(1, dictionary["QT_REL_HOST_DATA"]);
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 963cd49..520542f 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -265,4 +265,4 @@ sysroot_stage_dirs_append() {
     rm -rf $to${OE_QMAKE_PATH_QT_FONTS}
 }
 
-SRCREV = "b4ada3f0d8feed7dbff22aa780d38ab126020ac6"
+SRCREV = "e6f8b072d2bf15f8b82bede48ff29ce8ac8dbd9a"
diff --git a/recipes-qt/qt5/qtcanvas3d_git.bb b/recipes-qt/qt5/qtcanvas3d_git.bb
index 8025178..bfa45e5 100644
--- a/recipes-qt/qt5/qtcanvas3d_git.bb
+++ b/recipes-qt/qt5/qtcanvas3d_git.bb
@@ -10,4 +10,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS = "qtdeclarative"
 
-SRCREV = "85fe2daab5ed14655b456df8821c9f5f606fdc12"
+SRCREV = "8bbd832997841927e0d8a433f4ec20c82cdea203"
diff --git a/recipes-qt/qt5/qtconnectivity_git.bb b/recipes-qt/qt5/qtconnectivity_git.bb
index 3252411..14272d5 100644
--- a/recipes-qt/qt5/qtconnectivity_git.bb
+++ b/recipes-qt/qt5/qtconnectivity_git.bb
@@ -25,4 +25,4 @@ do_configure_prepend() {
     sed -i 's/^qtCompileTest(bluez)/OE_BLUEZ_ENABLED:qtCompileTest(bluez)/g' ${S}/qtconnectivity.pro
 }
 
-SRCREV = "bd7649557e99be543b78492d96bb2982e0a3e4c4"
+SRCREV = "12b5e352c312a88518d6db34673350a70cd53616"
diff --git a/recipes-qt/qt5/qtdeclarative_git.bb b/recipes-qt/qt5/qtdeclarative_git.bb
index 0649ecd..5795539 100644
--- a/recipes-qt/qt5/qtdeclarative_git.bb
+++ b/recipes-qt/qt5/qtdeclarative_git.bb
@@ -34,6 +34,6 @@ do_configure_prepend() {
 
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'qtxmlpatterns', 'CONFIG+=OE_QTXMLPATTERNS_ENABLED', '', d)}"
 
-SRCREV = "c1d726fe19c83cf081042e55ace9d9d7b31c40e6"
+SRCREV = "bb01612a8809efd268903e41b9e3a17cff48f1c0"
 
 BBCLASSEXTEND =+ "native nativesdk"
diff --git a/recipes-qt/qt5/qtgraphicaleffects_git.bb b/recipes-qt/qt5/qtgraphicaleffects_git.bb
index 24ae3e1..861b9ac 100644
--- a/recipes-qt/qt5/qtgraphicaleffects_git.bb
+++ b/recipes-qt/qt5/qtgraphicaleffects_git.bb
@@ -17,4 +17,4 @@ DEPENDS += "qtdeclarative"
 
 RDEPENDS_${PN}-dev = ""
 
-SRCREV = "0b68e91d68902c4d05d0bb8aa045ae76c4e8c9b5"
+SRCREV = "bf13dd5ca02d861c3a554743948c939a339d5061"
diff --git a/recipes-qt/qt5/qtimageformats_git.bb b/recipes-qt/qt5/qtimageformats_git.bb
index e7bce9d..2d4e580 100644
--- a/recipes-qt/qt5/qtimageformats_git.bb
+++ b/recipes-qt/qt5/qtimageformats_git.bb
@@ -28,4 +28,4 @@ EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'jasper', 'CONFIG+
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'libtiff', 'CONFIG+=OE_LIBTIFF_ENABLED', '', d)}"
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'libwebp', 'CONFIG+=OE_LIBWEBP_ENABLED', '', d)}"
 
-SRCREV = "d7bdc138b89bf0c52ba9ddf22b34d2ccd06b3936"
+SRCREV = "a7a998ee6e328babaa0edfee0d156fb28cf1b385"
diff --git a/recipes-qt/qt5/qtlocation_git.bb b/recipes-qt/qt5/qtlocation_git.bb
index 80d7699..b1ce1f3 100644
--- a/recipes-qt/qt5/qtlocation_git.bb
+++ b/recipes-qt/qt5/qtlocation_git.bb
@@ -29,4 +29,4 @@ do_configure_prepend() {
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'geoclue', 'CONFIG+=OE_GEOCLUE_ENABLED', '', d)}"
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'gypsy', 'CONFIG+=OE_GYPSY_ENABLED', '', d)}"
 
-SRCREV = "7d01112c36a98912706e9d33ce2e36126de0ccec"
+SRCREV = "35348e80145305778a89923d3bfe50d7baba7690"
diff --git a/recipes-qt/qt5/qtmultimedia_git.bb b/recipes-qt/qt5/qtmultimedia_git.bb
index 8e3da52..3a1ec07 100644
--- a/recipes-qt/qt5/qtmultimedia_git.bb
+++ b/recipes-qt/qt5/qtmultimedia_git.bb
@@ -35,4 +35,4 @@ SRC_URI += "\
      file://0001-Initial-porting-effort-to-GStreamer-1.0.patch \
 "
 
-SRCREV = "20686cb51fb2dfa5973d636875e9fc20c2bde4f5"
+SRCREV = "4dd780a81e886a8a5eb86d1a045716ac4194eba1"
diff --git a/recipes-qt/qt5/qtquick1_git.bb b/recipes-qt/qt5/qtquick1_git.bb
index 6c2d309..0c5d2cb 100644
--- a/recipes-qt/qt5/qtquick1_git.bb
+++ b/recipes-qt/qt5/qtquick1_git.bb
@@ -26,4 +26,4 @@ do_configure_prepend() {
     sed -i 's#^qtHaveModule(webkitwidgets):#qtHaveModule(webkitwidgets):!contains(CONFIG, noqtwebkit):#g' ${S}/src/imports/imports.pro
 }
 
-SRCREV = "5eab543c5c955f5057225b9bdb6b2757516dbd3e"
+SRCREV = "b934c54583adc4f9021de2753f99836f60a96688"
diff --git a/recipes-qt/qt5/qtquickcontrols2_git.bb b/recipes-qt/qt5/qtquickcontrols2_git.bb
index f481691..bfb957e 100644
--- a/recipes-qt/qt5/qtquickcontrols2_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols2_git.bb
@@ -10,4 +10,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtdeclarative"
 
-SRCREV = "e93c73c0aa15cd973e008a04a70a7c69719ad244"
+SRCREV = "0593bd577168cdf8b4318d4e46ea463f433f8bb2"
diff --git a/recipes-qt/qt5/qtquickcontrols_git.bb b/recipes-qt/qt5/qtquickcontrols_git.bb
index aeaa967..3b0750b 100644
--- a/recipes-qt/qt5/qtquickcontrols_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols_git.bb
@@ -17,4 +17,4 @@ SRC_URI += " \
     file://0001-texteditor-fix-invalid-use-of-incomplete-type-class-.patch \
 "
 
-SRCREV = "59c6c0e0b1b5b46747595a58e11311b7393d7e70"
+SRCREV = "b66f6b05c5f8024ddd9f8c46f33ccb618323999e"
diff --git a/recipes-qt/qt5/qtscript_git.bb b/recipes-qt/qt5/qtscript_git.bb
index 21199f7..6e2327a 100644
--- a/recipes-qt/qt5/qtscript_git.bb
+++ b/recipes-qt/qt5/qtscript_git.bb
@@ -27,4 +27,4 @@ ARM_INSTRUCTION_SET_armv5 = "arm"
 
 DEPENDS += "qtbase"
 
-SRCREV = "9dc78a2d847bca5ec7b1445356523383a030d7ce"
+SRCREV = "8196140bedcaca11dbe0e06342e942e52e9d69eb"
diff --git a/recipes-qt/qt5/qtsensors_git.bb b/recipes-qt/qt5/qtsensors_git.bb
index 345c5cb..c46c496 100644
--- a/recipes-qt/qt5/qtsensors_git.bb
+++ b/recipes-qt/qt5/qtsensors_git.bb
@@ -14,4 +14,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative"
 
-SRCREV = "922c2bb671c113b7e481fb86f823188b4bce1d3e"
+SRCREV = "099b3a7442a553aedf4d5bb8955dabcae4dae66c"
diff --git a/recipes-qt/qt5/qtserialport_git.bb b/recipes-qt/qt5/qtserialport_git.bb
index fdcba1e..e3a71dd 100644
--- a/recipes-qt/qt5/qtserialport_git.bb
+++ b/recipes-qt/qt5/qtserialport_git.bb
@@ -15,4 +15,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "46ef9fdc130a06bd80c5c004f0dc95c473f704c8"
+SRCREV = "2f7b2533b323644289c60370f68492aea6b1a625"
diff --git a/recipes-qt/qt5/qtsvg_git.bb b/recipes-qt/qt5/qtsvg_git.bb
index 145ac65..e4a0b72 100644
--- a/recipes-qt/qt5/qtsvg_git.bb
+++ b/recipes-qt/qt5/qtsvg_git.bb
@@ -13,4 +13,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "2d55b4996eaa26c973afdf15f6f703c0a1840a96"
+SRCREV = "cf5fa755ecd07b0f52a151ea322d52fe1bfd8d76"
diff --git a/recipes-qt/qt5/qttools_git.bb b/recipes-qt/qt5/qttools_git.bb
index 0e7b669..52aacdc 100644
--- a/recipes-qt/qt5/qttools_git.bb
+++ b/recipes-qt/qt5/qttools_git.bb
@@ -31,6 +31,6 @@ PACKAGECONFIG[qtwebkit] = ",,qtwebkit"
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'qtwebkit', '', 'CONFIG+=noqtwebkit', d)}"
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'linguistonly', 'CONFIG+=linguistonly', '', d)}"
 
-SRCREV = "a9e5e09f156b09c7f65e0b57fe191d71f9c1aa3e"
+SRCREV = "56dbabb7a64a4d416e8cf7b61e068208fd032355"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/recipes-qt/qt5/qttranslations_git.bb b/recipes-qt/qt5/qttranslations_git.bb
index 5995c99..99aac01 100644
--- a/recipes-qt/qt5/qttranslations_git.bb
+++ b/recipes-qt/qt5/qttranslations_git.bb
@@ -114,4 +114,4 @@ FILES_${PN}-qt = " \
     ${OE_QMAKE_PATH_TRANSLATIONS}/qt_*.qm \
 "
 
-SRCREV = "225e1740fec4559bf8d66d915ddd06b9d4f48119"
+SRCREV = "df316bf7e6508ae1360247feb08780a77ea4210e"
diff --git a/recipes-qt/qt5/qtwayland-native_git.bb b/recipes-qt/qt5/qtwayland-native_git.bb
index 426bdb2..ee927dd 100644
--- a/recipes-qt/qt5/qtwayland-native_git.bb
+++ b/recipes-qt/qt5/qtwayland-native_git.bb
@@ -15,7 +15,6 @@ DEPENDS = "qtbase-native wayland-native"
 
 SRC_URI += " \
     file://0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch \
-    file://0001-Fix-building-of-QWaylandIntegration-if-some-Qt5-feat.patch \
 "
 
 do_configure() {
@@ -26,4 +25,4 @@ do_install() {
     oe_runmake install INSTALL_ROOT=${D}
 }
 
-SRCREV = "82e11583928d47576c160d35c9df05c0eec34df8"
+SRCREV = "70575643cfece4f0aca4b40e77ac5d7c0e8042a2"
diff --git a/recipes-qt/qt5/qtwayland/0001-Fix-building-of-QWaylandIntegration-if-some-Qt5-feat.patch b/recipes-qt/qt5/qtwayland/0001-Fix-building-of-QWaylandIntegration-if-some-Qt5-feat.patch
deleted file mode 100644
index d173e67..0000000
--- a/recipes-qt/qt5/qtwayland/0001-Fix-building-of-QWaylandIntegration-if-some-Qt5-feat.patch
+++ /dev/null
@@ -1,156 +0,0 @@
-From de85e1c1ee76be845a21b441d9e4ea12a30d84c7 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Vesa=20J=C3=A4=C3=A4skel=C3=A4inen?= <dachaac@gmail.com>
-Date: Sun, 18 Sep 2016 11:51:59 +0300
-Subject: [PATCH] Fix building of QWaylandIntegration if some Qt5 features are
- disabled.
-
-QPlatformIntegration's interface methods are disabled based on QT_NO_OPENGL,
-QT_NO_CLIPBOARD, QT_NO_DRAGANDDROP, QT_NO_ACCESSIBILITY and
-QT_NO_SESSIONMANAGER, these has to be taken into account when compiling
-QtWayland.
----
- src/client/qwaylandintegration.cpp | 21 ++++++++++++++++++---
- src/client/qwaylandintegration_p.h | 12 ++++++++++++
- 2 files changed, 30 insertions(+), 3 deletions(-)
-
-diff --git a/src/client/qwaylandintegration.cpp b/src/client/qwaylandintegration.cpp
-index 39fff53..481e3d6 100644
---- a/src/client/qwaylandintegration.cpp
-+++ b/src/client/qwaylandintegration.cpp
-@@ -39,7 +39,9 @@
- #include "qwaylandinputcontext_p.h"
- #include "qwaylandshmbackingstore_p.h"
- #include "qwaylandnativeinterface_p.h"
-+#ifndef QT_NO_CLIPBOARD
- #include "qwaylandclipboard_p.h"
-+#endif
- #include "qwaylanddnd_p.h"
- #include "qwaylandwindowmanagerintegration_p.h"
- #include "qwaylandscreen_p.h"
-@@ -57,7 +59,9 @@
- #include <QSocketNotifier>
- 
- #include <qpa/qplatforminputcontextfactory_p.h>
-+#ifndef QT_NO_ACCESSIBILITY
- #include <qpa/qplatformaccessibility.h>
-+#endif
- #include <qpa/qplatforminputcontext.h>
- 
- #include "qwaylandhardwareintegration_p.h"
-@@ -117,8 +121,6 @@ QWaylandIntegration::QWaylandIntegration()
-     , mNativeInterface(new QWaylandNativeInterface(this))
- #ifndef QT_NO_ACCESSIBILITY
-     , mAccessibility(new QPlatformAccessibility())
--#else
--    , mAccessibility(0)
- #endif
-     , mClientBufferIntegrationInitialized(false)
-     , mServerBufferIntegrationInitialized(false)
-@@ -126,9 +128,12 @@ QWaylandIntegration::QWaylandIntegration()
- {
-     initializeInputDeviceIntegration();
-     mDisplay = new QWaylandDisplay(this);
-+#ifndef QT_NO_CLIPBOARD
-     mClipboard = new QWaylandClipboard(mDisplay);
-+#endif
-+#ifndef QT_NO_DRAGANDDROP
-     mDrag = new QWaylandDrag(mDisplay);
--
-+#endif
-     QString icStr = QPlatformInputContextFactory::requested();
-     icStr.isNull() ? mInputContext.reset(new QWaylandInputContext(mDisplay))
-                    : mInputContext.reset(QPlatformInputContextFactory::create(icStr));
-@@ -136,8 +141,12 @@ QWaylandIntegration::QWaylandIntegration()
- 
- QWaylandIntegration::~QWaylandIntegration()
- {
-+#ifndef QT_NO_DRAGANDDROP
-     delete mDrag;
-+#endif
-+#ifndef QT_NO_CLIPBOARD
-     delete mClipboard;
-+#endif
- #ifndef QT_NO_ACCESSIBILITY
-     delete mAccessibility;
- #endif
-@@ -213,15 +222,19 @@ QPlatformFontDatabase *QWaylandIntegration::fontDatabase() const
-     return mFontDb;
- }
- 
-+#ifndef QT_NO_CLIPBOARD
- QPlatformClipboard *QWaylandIntegration::clipboard() const
- {
-     return mClipboard;
- }
-+#endif
- 
-+#ifndef QT_NO_DRAGANDDROP
- QPlatformDrag *QWaylandIntegration::drag() const
- {
-     return mDrag;
- }
-+#endif
- 
- QPlatformInputContext *QWaylandIntegration::inputContext() const
- {
-@@ -243,10 +256,12 @@ QVariant QWaylandIntegration::styleHint(StyleHint hint) const
-     return QPlatformIntegration::styleHint(hint);
- }
- 
-+#ifndef QT_NO_ACCESSIBILITY
- QPlatformAccessibility *QWaylandIntegration::accessibility() const
- {
-     return mAccessibility;
- }
-+#endif
- 
- QPlatformServices *QWaylandIntegration::services() const
- {
-diff --git a/src/client/qwaylandintegration_p.h b/src/client/qwaylandintegration_p.h
-index 987d805..b50ad95 100644
---- a/src/client/qwaylandintegration_p.h
-+++ b/src/client/qwaylandintegration_p.h
-@@ -80,15 +80,21 @@ public:
- 
-     QPlatformNativeInterface *nativeInterface() const Q_DECL_OVERRIDE;
- 
-+#ifndef QT_NO_CLIPBOARD
-     QPlatformClipboard *clipboard() const Q_DECL_OVERRIDE;
-+#endif
- 
-+#ifndef QT_NO_DRAGANDDROP
-     QPlatformDrag *drag() const Q_DECL_OVERRIDE;
-+#endif
- 
-     QPlatformInputContext *inputContext() const Q_DECL_OVERRIDE;
- 
-     QVariant styleHint(StyleHint hint) const Q_DECL_OVERRIDE;
- 
-+#ifndef QT_NO_ACCESSIBILITY
-     QPlatformAccessibility *accessibility() const Q_DECL_OVERRIDE;
-+#endif
- 
-     QPlatformServices *services() const Q_DECL_OVERRIDE;
- 
-@@ -117,12 +123,18 @@ private:
-     void initializeInputDeviceIntegration();
- 
-     QPlatformFontDatabase *mFontDb;
-+#ifndef QT_NO_CLIPBOARD
-     QPlatformClipboard *mClipboard;
-+#endif
-+#ifndef QT_NO_DRAGANDDROP
-     QPlatformDrag *mDrag;
-+#endif
-     QWaylandDisplay *mDisplay;
-     QPlatformNativeInterface *mNativeInterface;
-     QScopedPointer<QPlatformInputContext> mInputContext;
-+#ifndef QT_NO_ACCESSIBILITY
-     QPlatformAccessibility *mAccessibility;
-+#endif
-     bool mClientBufferIntegrationInitialized;
-     bool mServerBufferIntegrationInitialized;
-     bool mShellIntegrationInitialized;
--- 
-2.7.4
-
diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_git.bb
index 6c15b69..c904a09 100644
--- a/recipes-qt/qt5/qtwayland_git.bb
+++ b/recipes-qt/qt5/qtwayland_git.bb
@@ -34,7 +34,6 @@ FILES_${PN}-plugins-dbg += " \
 
 SRC_URI += " \
     file://0001-examples-wayland-include-server-buffer-only-when-bui.patch \
-    file://0001-Fix-building-of-QWaylandIntegration-if-some-Qt5-feat.patch \
 "
 
-SRCREV = "82e11583928d47576c160d35c9df05c0eec34df8"
+SRCREV = "70575643cfece4f0aca4b40e77ac5d7c0e8042a2"
diff --git a/recipes-qt/qt5/qtwebchannel_git.bb b/recipes-qt/qt5/qtwebchannel_git.bb
index 55a1cb9..81f409c 100644
--- a/recipes-qt/qt5/qtwebchannel_git.bb
+++ b/recipes-qt/qt5/qtwebchannel_git.bb
@@ -15,4 +15,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtdeclarative qtwebsockets"
 
-SRCREV = "3b28a6956cb3cab087481312dc82a907b118e0de"
+SRCREV = "065afc22e9cc61364968aafc74ff2ca4524fab56"
diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index 109b7c8..48d0cb2 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -2,11 +2,9 @@ SUMMARY = "QtWebEngine combines the power of Chromium and Qt"
 
 LICENSE = "LGPL-3.0 & BSD"
 LIC_FILES_CHKSUM = " \
-    file://src/core/browser_context_qt.cpp;md5=5fe719c44250955a5d5f8fb15fc8b1da;beginline=1;endline=35 \
-    file://src/3rdparty/chromium/LICENSE;md5=537e0b52077bf0a616d0a0c8a79bc9d5 \
-    file://LICENSE.LGPLv3;md5=8211fde12cc8a4e2477602f5953f5b71 \
+    file://src/core/browser_context_qt.cpp;md5=8b5dcd02451f832169d229afb56f27fd;beginline=1;endline=35 \
+    file://src/3rdparty/chromium/LICENSE;md5=0fca02217a5d49a14dfe2d11837bb34d \
     file://LICENSE.GPLv3;md5=88e2b9117e6be406b5ed6ee4ca99a705 \
-    file://LICENSE.GPLv2;md5=c96076271561b0e3785dad260634eaa8 \
 "
 
 DEPENDS += " \
@@ -107,7 +105,7 @@ RDEPENDS_${PN}-examples += " \
     qtdeclarative-qmlplugins \
 "
 
-QT_MODULE_BRANCH_CHROMIUM = "45-based"
+QT_MODULE_BRANCH_CHROMIUM = "49-based"
 
 SRC_URI += " \
     ${QT_GIT}/qtwebengine-chromium.git;name=chromium;branch=${QT_MODULE_BRANCH_CHROMIUM};destsuffix=git/src/3rdparty \
@@ -120,10 +118,10 @@ SRC_URI += " \
     file://0002-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch \
 "
 
-SRCREV_qtwebengine = "ec84507898e58a167b185ba674acf300cc695380"
+SRCREV_qtwebengine = "fad625e0ba39e855817bbf206ab9a846d07aeeec"
 # This is in git submodule, but we're using latest in 45-based
 # SRCREV_chromium = "79930a541473b2e0f950d040c16ab6f22e4aeef3"
-SRCREV_chromium = "4d61c01b71fcbe706ea4220d33294d4f5600ca31"
+SRCREV_chromium = "cb094c05c5f06489fa64412e7f5d9e194a3f9495"
 SRCREV = "${SRCREV_qtwebengine}"
 
 SRCREV_FORMAT = "qtwebengine_chromium"
diff --git a/recipes-qt/qt5/qtwebkit-examples_git.bb b/recipes-qt/qt5/qtwebkit-examples_git.bb
index 3f1ab50..65a8196 100644
--- a/recipes-qt/qt5/qtwebkit-examples_git.bb
+++ b/recipes-qt/qt5/qtwebkit-examples_git.bb
@@ -19,4 +19,4 @@ DEPENDS += "qtwebkit qtxmlpatterns"
 RDEPENDS_${PN}-examples += "qtwebkit-qmlplugins"
 RDEPENDS_${PN}-examples += "${@bb.utils.contains('PACKAGECONFIG_OPENSSL', 'openssl', 'ca-certificates', '', d)}"
 
-SRCREV = "2a143bf81b2ffb3bd7a5f47cf719e6ed347bf383"
+SRCREV = "0c623fab420102c54fa533da3b8ca774290d6d13"
diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/qtwebkit_git.bb
index 3d2dbdf..b784897 100644
--- a/recipes-qt/qt5/qtwebkit_git.bb
+++ b/recipes-qt/qt5/qtwebkit_git.bb
@@ -71,4 +71,4 @@ PACKAGES_remove = "${PN}-examples-dev ${PN}-examples-staticdev ${PN}-examples-db
 RUBY_SYS = "${@ '${BUILD_SYS}'.replace('i486', 'i386').replace('i586', 'i386').replace('i686', 'i386') }"
 export RUBYLIB="${STAGING_DATADIR_NATIVE}/rubygems:${STAGING_LIBDIR_NATIVE}/ruby:${STAGING_LIBDIR_NATIVE}/ruby/${RUBY_SYS}"
 
-SRCREV = "bb43bca1664721401c3a2c25b585913bb5e8cb4f"
+SRCREV = "95a78c9f04d9a3f954477855f84180ced556a480"
diff --git a/recipes-qt/qt5/qtwebsockets_git.bb b/recipes-qt/qt5/qtwebsockets_git.bb
index c71a69f..f17cec4 100644
--- a/recipes-qt/qt5/qtwebsockets_git.bb
+++ b/recipes-qt/qt5/qtwebsockets_git.bb
@@ -11,4 +11,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative"
 
-SRCREV = "ef7b03e3e5e20f89963bae799f7ecb753f332c34"
+SRCREV = "65e7130466963e0fd9cee8719d8b37c9fb15db35"
diff --git a/recipes-qt/qt5/qtx11extras_git.bb b/recipes-qt/qt5/qtx11extras_git.bb
index eaed56c..f81081f 100644
--- a/recipes-qt/qt5/qtx11extras_git.bb
+++ b/recipes-qt/qt5/qtx11extras_git.bb
@@ -13,4 +13,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "df10edcfae328f397c99192b322268c9e96f6dab"
+SRCREV = "e33fc10fa49da17b297c53e44d109dc4d24c974a"
diff --git a/recipes-qt/qt5/qtxmlpatterns_git.bb b/recipes-qt/qt5/qtxmlpatterns_git.bb
index f715f1e..63bed1a 100644
--- a/recipes-qt/qt5/qtxmlpatterns_git.bb
+++ b/recipes-qt/qt5/qtxmlpatterns_git.bb
@@ -13,6 +13,6 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "074571305e45d30066b199641eb5d0866e3b0a92"
+SRCREV = "50582280b10fb1962b3bdfdd06a72ae1e0325049"
 
 BBCLASSEXTEND =+ "native nativesdk"
-- 
2.7.4


