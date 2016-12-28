Return-Path: <mikko.gronoff@qt.io>
X-Greylist: delayed 1080 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 28 Dec 2016 06:40:51 UTC
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0097.outbound.protection.outlook.com [104.47.2.97])
	by mail.openembedded.org (Postfix) with ESMTP id 8A1DF6E668
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Dec 2016 06:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=qtcompany.onmicrosoft.com; s=selector1-qt-io;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=MBwk3SbsO3YEPYu2EPMXAgSIeWOOnKAF8jsKMJseBIo=;
	b=gABBC7pGIPWNhim296fcmFXQDQyuOHegHu3Jgr5MvWNaI/jGbMU9Gd59yY7eL2YVQ+wFrPEHHikVXGWVE3yJ6rVVZPbhy764RbsJ1uhuyV7LH4TNiWZHpyWTFj5PVhDlTbR4128etI6E9iuIdGZREKlgj3+SNb+rMHGJb5h1UX8=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mikko.gronoff@qt.io; 
Received: from qt.intra.qt (192.89.120.53) by
	DB6PR0201MB2166.eurprd02.prod.outlook.com (10.168.52.146) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.803.11; Wed, 28 Dec 2016 06:07:05 +0000
From: Mikko Gronoff <mikko.gronoff@qt.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Dec 2016 08:06:54 +0200
Message-Id: <1482905214-29319-1-git-send-email-mikko.gronoff@qt.io>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [192.89.120.53]
X-ClientProxiedBy: DB5PR06CA0039.eurprd06.prod.outlook.com (10.162.165.49) To
	DB6PR0201MB2166.eurprd02.prod.outlook.com (10.168.52.146)
X-MS-Office365-Filtering-Correlation-Id: eccbec23-fba4-4d8b-e538-08d42ee7bfcf
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(22001);
	SRVR:DB6PR0201MB2166; 
X-Microsoft-Exchange-Diagnostics: 1; DB6PR0201MB2166;
	3:YU+w/L/5faHwIqR63zcYjAcpkDuQjf583TJFhWUQFvYlZeKxIPZLEWVk4AINMe7KaDsGfu2etH0S/ObSJBkXIfvOAP8yUTwWqXgsYRn3GT5Oq6vELuaEmBVJ2WSAlV/r/QIUeBZWa/oo6RqLkfoCmoI1TnJbRI9B7JYYBXm10LWr0DkYGUxXC2KUvL4Y9Up1nfR7V9rNJ3c62RQTmerfqA7iI3cyxB+GbXKNWDBFSLeG5v9XV+F5cCXa+Je/veBOWetmuAVg4jtY9LfITEKxcg==
X-Microsoft-Exchange-Diagnostics: 1; DB6PR0201MB2166;
	25:uCks+rN6OyZabEZcgZMpEJKxR4ZpjcNTQP7ooZCUNksf85Lt3gM7Q6TuzN2NaWngI9EvjTFEXuM1qE+JC8MUFHC2b9S3u6gkpH8/2jy2ILLhc8Mw7oPUPKDWzx6dAWIIUd4+9maJvAl1/FI24ytBu1J10y4MpPIc/ouXrR1BV+1lnSkYCyO1rfmwvTDhlBlHfJNzlKhdECNrynPaB83w2xQ2QY+5hPmnpZCCg0/TTW7QoJZ5lvZe8HTjlhcBNxF4GvBXLP7zDqUFX186fDk0iDM9ncgUip1qSefre9oGvapV+M4evf+0kTkd723/Ct8Sgt3nhWg361MORLbila8nyTpuSqIlyUcJzkOjbGhuQIHl683Hi/9km4xUkUpePsbQwBqqmITlSfkgQMxjNXuzwm2ftaVDScTJylnjDlR5j4RKkynvmlN76MT0LrgIa6qz0peyrggSwrDeasJLcaqbvkZkONbYU9na4MrYeXcWfxNdcTMWlNBYs3nauigGLTWvU9Mr2QlMROjEoMIuoQPdkHza3pCxGA9Yvab6jCi2krB6IejXKPTYXFq0a1XE4MFd6Ob6KXn9SvgiPV88+zrEW5uPAnq9xKw34fVcgeklBMcIkobZ1pDy7QyLbcngqnri6IAnpaLctEorTXRpPiLOxPQnFFv7p4nSIlSxzEb9cqtKETd/6rnPScRg1X+KTQW0IfHcukZx8Q56/WeHjMwJTar2Ad8QdhoRH8T0XHdTAknYh7F4SHsxEOQGFiBSmTlc
X-Microsoft-Exchange-Diagnostics: 1; DB6PR0201MB2166;
	31:5+vOXGCJUushfymOj4TTqb2RtXRH045K4USXP/K5MLF28eX+x2DnRnVd5CzickW6fRasD5F4+HPBvyF+iJjoBy8jU4pCubEG4ATQDaJ+yEpx/86XTIRGR+IbYg31bpVW2JXXTSWhqPcrjYFugLRgeU/4i17a5q7pF4S5a8OMKhzcgWZypC22ev4DY8M4p4GHE2b/GJ1CMySPTi/HC0P5bgOEGAtULiBde1FHU3eCPfXKwkPAOpvIGCe9qr7yVOel;
	20:gVFrvY84IeMv3mHgbFvEz8R4zlQ+iCHvyO3TwfBSDpRh4n45qs2jZtEKgw3Z6+4fzJKlAaf8YHPbWpt68VSp/YRTTJCoX9mM+vpcS3uEeYS39T52TEDwAuk14fnEYLirNee5O/u9PSs/vDJhV63yOkDq+OKVIaCVubhauEc+cinC8STLZtoyqbYVUKg9Y50qFMgs/YpvjzQxw9pAoEqx1cZz8aOiqpoycJ1w2Q8eEjdFQD1pJe+7T7SXbG39ZCEl
X-Microsoft-Antispam-PRVS: <DB6PR0201MB2166E07961CA485443021FB3E9680@DB6PR0201MB2166.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(228905959029699);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040375)(601004)(2401047)(5005006)(8121501046)(10201501046)(3002001)(6041248)(20161123560025)(20161123564025)(20161123562025)(20161123555025)(6072148);
	SRVR:DB6PR0201MB2166; BCL:0; PCL:0; RULEID:;
	SRVR:DB6PR0201MB2166; 
X-Microsoft-Exchange-Diagnostics: 1; DB6PR0201MB2166;
	4:e0bRyhx2MXuKGdtOzm5MZ5zjDL1nO64PZQtZVFihTe91mr85YaLO+p6Z1eKfrf9pF1MdA6mZpIZvX+tD+lpBDGdacmIzJVKHcRe+lZyKXynUhMFXZjSXF8ND58qGwSSnqspgXFVDf6cw1zSdH6dRTa4MFKbEV0JmE1nqkzxZ3jUoZtd7UKvDQHY7Q//SCxsdotY7Zqbwq8kKPrQTdRoNsX5JFyoUy6VGxhjtk36lwSnBEY8fYbKrz4cqf0MUQ+kloI+Gb9vPlIUo1zu670pl2UmsQ667haf0D6PCvKgwq+gCgZZziALKpWUIop+Hrdxkq3BOKOBWWEBN3xfabNMXGIB/rzWhTWp07/EoSQWkvQtOVAv+kzoM0D9gLciLyxEb/nqura7r1FHOH2fM0IKjk3HklGUZ3w6KCcDUxEHmNTosljq7X9LWVxagbyU0HxePfNtFOCTDB4g6p5iCMI5dBdQbwcuPGi4Y0vuMj9i6Ta/ce5jGHs+0/HN4105mT4je0vbc4lS/OzgdX8jBzm5EXWiITLFoTXg5x2HmGOnOr8uJ3161XTMoXnI4RbIpzmLQt/U0ldI/cgmDuiqMb0/VV0HXCuXvCgM+aqjUTEYKLXG+Gc6qpqMJIWpkXpgQbV8L
X-Forefront-PRVS: 0170DAF08C
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(6009001)(7916002)(39450400003)(199003)(189002)(42186005)(74482002)(106356001)(2361001)(105586002)(2351001)(92566002)(189998001)(53416004)(50986999)(575784001)(86362001)(66066001)(47776003)(50226002)(36756003)(81166006)(81156014)(110136003)(6116002)(3846002)(6916009)(7736002)(305945005)(5003940100001)(38730400001)(8676002)(6666003)(6486002)(69596002)(2906002)(50466002)(5660300001)(48376002)(101416001)(25786008)(6512006)(6506006)(31430400001)(68736007)(4326007)(33646002)(450100001)(97736004)(19627235001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DB6PR0201MB2166; H:qt.intra.qt;
	FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: qt.io does not designate permitted
	sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DB6PR0201MB2166;
	23:RJbpaUAWtqaocSOCJ+2D3RycwzQnYm5aBHSdd73?=
	=?us-ascii?Q?Wu1j8zWG6rkYZM0Gg4NhdZf3FBkRPaZGEG3MqEm7vO7BESgc/Imq0VatTwjk?=
	=?us-ascii?Q?W78/nL5PRLSUmJ/uqsfK/ArO0AtjghVn6fExxLMoXpm+smR/dyrEgFRBHEnB?=
	=?us-ascii?Q?7Gky0D/AP8LRlQYFL8UnJC6JLkOjruSKSQ863OxGsuRj5NK4DwjvzKPMQ7LE?=
	=?us-ascii?Q?xmY7lHN/Pbfz5SfB+0Wsq5+7nr4eHUdhPfocTm2K603pTAqUhfBj2Et9n9cS?=
	=?us-ascii?Q?MX7bDsnCaXNO2pGXNruiNT6iIKfcZcIoMc+9oPuSgXBn8EQskPO0gBxw8U6+?=
	=?us-ascii?Q?6NDvEnLLR/ro4YgBamMs6eqiFXXFwQNiPF0Pw8vaai+++bnLsQ3DvOylhgPp?=
	=?us-ascii?Q?fzEtJDR3hrotEjUDydEfVwQhvxjNKGknBfJ3G+uIIIAQzp9uTjeARcjxoZgK?=
	=?us-ascii?Q?65vF3BUxKeWBt+eCXxaxarXac3flHTi7wsD2MzO01AoiROEsZX8l5tb+NjWG?=
	=?us-ascii?Q?QDjVr6mQi9DnV/lxnysMOrHKumuvt5u6FO88CuoiC//n/t6b497BveLRYnoS?=
	=?us-ascii?Q?7bN2qLuZr5RHmN+NtAttYSxxSiOn20ecq4pEgGMh1ZG0FhdnPg2S4Rq1eXHS?=
	=?us-ascii?Q?rqXZJFVe4L6tstoyJhIZItUp/i+XXLBnhLU/CdDgiMx8JuORlxyXc1t8n5tK?=
	=?us-ascii?Q?fuIaVpFVgKf/l2PuxSXS3P4yTNTlSlL+1po8FZ1zxQRDc+4TmGRE03lotcQP?=
	=?us-ascii?Q?5Ec9w3HkRag+BKvCMewQ5QXIAPMjBbpH8XCstyM3yDqCKqKJcmFIOomgHkov?=
	=?us-ascii?Q?1oH+cRQW3v3MZZaF0qoAZdQ1Eulh5PKaOAN/FznfdahizuNqITZAoiNRnGfk?=
	=?us-ascii?Q?LYYwpJknzOnNxbyFk/hYxAEBzkX+WiY4ebYoLupXX5CEtyOWBuKKmD5ajFd+?=
	=?us-ascii?Q?LvA0K86tiTy5oYeh0SgAvVs0h6tWU4PZcm67P5KGSdneX/OAIekxMnER0mlm?=
	=?us-ascii?Q?KnDpL7RL5tB5dcT3So36CTxFcbk0E6ZJ6CzTtffmer1h8CRP+QpACz3mhasw?=
	=?us-ascii?Q?BRnv+gr05iNdioJxJfUvm8pfXIHuCfytbExlTpTxaOUdT4Q+dll4+lDKDMCB?=
	=?us-ascii?Q?cGWERVOBhEcBF8iFlUk7/zYivhmOcFF82lfZ0m0fMfr7ok9Lem6IFzLstkHB?=
	=?us-ascii?Q?/R+7WDP/wMQRv78yg1XudQEJnEtdGx1h6VWfU0KJH43yfN1DaK9l4EFr3JA?=
	=?us-ascii?Q?=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DB6PR0201MB2166;
	6:pyuTok4jeti8GZUP59L1HhrQCtgdjLJ1PPuQAQTZiV81EEKByTHJ1CXoHJkWN8AfPuUY0aIKh+NrIuKsINZF6sKKl0NmKJZ2WRBFW3z8rxJRl12Jt7e2pk+WJ9+VMIgJ6QiJga3yVazV4V7j0IkK2ATszZ3ZIkZ/18OLtaMdP86d9PbozJKtt76t9AuNLgUNULETGxeAzGWB+UNWvl6L8JBaATOWyaZtAlhFfmGiFT9/VXCuI6u3w2hk5dEvMP5vvgmzGvrUg2HT9IziQjFxNGQN2/m6rK4aC/CmJBppL8AAm1sT8adgCicoNhrmM/Z1OIdlbr480r0xosJ8eNhW5RD0hQL3NAdSUs0hYD4XBzgZyRn6BX/u/XbQVplw1nEHMMMdCudhdcIRz+Xns2dxIKTnpUIPLEbM8J5P8500iqE=;
	5:GTjzPEnw/MYrTf/pKA4tAf+Z5olFEFlUkBymjR5FYwkMJNya7kn5mutib8s8H/ryxYBSsbK5Zp/9IX7VbLie9W+DyRlkwH0cbIRn1E2I4seSiXAo8TGaY5RvkyLyl97kFnnhaMvPnZX81sEAQcnw2w==;
	24:qMeB4784St2HKaVpccUQVlB9ctlAzKKQBsRLKRTdwZECr7yxEphLfg1TE74u4sCJClEkMnBR3TNHoA5QPe786WGzInrven4mxB40g8rMI8Y=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; DB6PR0201MB2166;
	7:oCSmTi9Uc/03hGgpduVp9k8VmaUr1AGNkvBWk/fZ8GJJvSGp5V8orEcYxnFgx63/cUJP1jlXnfvteizocES1ttF02gUUmVGBNpy9fG18r7JX0BcgefT3cEEbXzvniB9FKucLKWeS3oyGguB78doxFq4DZKS4tAv95UuWY7RgBEPIqCtCDp8QWv2y0BYGyLk8AHW67CY9HLjkvmjjU04TPQ5bdFrppNz18rpsgunoMM4NBfsuJLXKl2eljjwcattvfcrBJlcXSH/aSCoMHCdisr8P5PzFyG9WlKYkw9cLLSJ5mzOhxoXFXRZWPlK0yigULDjqPaHHrrl+94V+AsW7hbemDx/g5pnyeh0xqTzHnauf4WAWVag+5VLmJ5NgIDj9/lK7bAPboeqbcWsV9IvNo5c0KFFWQEZSUrrajs3o3jvY6LqSuRaapSOOtgjty9egX+3BVVoXINc8qL8nhCC1oA==
X-OriginatorOrg: qt.io
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2016 06:07:05.3996 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0201MB2166
Subject: [meta-qt5][morty][PATCH] qt5: update submodule SRCREVs to 5.7.1 release
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
X-List-Received-Date: Wed, 28 Dec 2016 06:40:53 -0000
Content-Type: text/plain

Change-Id: I541f6fb5a706cdec3451dad015590a6624298a18
Signed-off-by: Mikko Gronoff <mikko.gronoff@qt.io>
---
 recipes-qt/qt5/nativesdk-qtbase_git.bb             |  2 +-
 recipes-qt/qt5/qt3d_git.bb                         |  8 ++--
 recipes-qt/qt5/qt5-git.inc                         |  2 +-
 recipes-qt/qt5/qtbase-native_git.bb                |  2 +-
 .../qtbase/0013-Fix-build-with-QT_NO_OPENGL.patch  | 33 ----------------
 recipes-qt/qt5/qtbase_git.bb                       |  3 +-
 recipes-qt/qt5/qtcanvas3d_git.bb                   |  8 ++--
 recipes-qt/qt5/qtcharts_git.bb                     |  2 +-
 recipes-qt/qt5/qtconnectivity_git.bb               |  2 +-
 recipes-qt/qt5/qtdatavis3d_git.bb                  |  2 +-
 recipes-qt/qt5/qtdeclarative-render2d_git.bb       |  2 +-
 ...crashes-in-QtQml-code-related-to-dead-sto.patch | 44 ----------------------
 recipes-qt/qt5/qtdeclarative_git.bb                |  3 +-
 recipes-qt/qt5/qtgraphicaleffects_git.bb           | 10 ++---
 recipes-qt/qt5/qtimageformats_git.bb               | 10 ++---
 recipes-qt/qt5/qtlocation_git.bb                   | 10 ++---
 recipes-qt/qt5/qtmultimedia_git.bb                 |  2 +-
 recipes-qt/qt5/qtquickcontrols2_git.bb             |  6 +--
 recipes-qt/qt5/qtquickcontrols_git.bb              |  8 ++--
 recipes-qt/qt5/qtscript_git.bb                     |  2 +-
 recipes-qt/qt5/qtsensors_git.bb                    | 10 ++---
 recipes-qt/qt5/qtserialbus_git.bb                  |  2 +-
 recipes-qt/qt5/qtserialport_git.bb                 | 10 ++---
 recipes-qt/qt5/qtsvg_git.bb                        |  8 ++--
 recipes-qt/qt5/qttools_git.bb                      |  2 +-
 recipes-qt/qt5/qttranslations_git.bb               |  2 +-
 recipes-qt/qt5/qtvirtualkeyboard_git.bb            |  2 +-
 recipes-qt/qt5/qtwayland-native_git.bb             |  2 +-
 recipes-qt/qt5/qtwayland_git.bb                    |  2 +-
 recipes-qt/qt5/qtwebchannel_git.bb                 |  2 +-
 recipes-qt/qt5/qtwebengine_git.bb                  |  4 +-
 recipes-qt/qt5/qtwebsockets_git.bb                 |  8 ++--
 recipes-qt/qt5/qtx11extras_git.bb                  | 10 ++---
 recipes-qt/qt5/qtxmlpatterns_git.bb                |  2 +-
 34 files changed, 74 insertions(+), 153 deletions(-)
 delete mode 100644 recipes-qt/qt5/qtbase/0013-Fix-build-with-QT_NO_OPENGL.patch
 delete mode 100644 recipes-qt/qt5/qtdeclarative/0003-Workaround-crashes-in-QtQml-code-related-to-dead-sto.patch

diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
index 7452648..47e204b 100644
--- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
+++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
@@ -262,4 +262,4 @@ fakeroot do_generate_qt_environment_file() {
 
 addtask generate_qt_environment_file after do_install before do_package
 
-SRCREV = "69b43e74d78e050cf5e40197acafa4bc9f90c0bd"
+SRCREV = "a55f36211efe1bb0d6717c8545366120bd6dfd9f"
diff --git a/recipes-qt/qt5/qt3d_git.bb b/recipes-qt/qt5/qt3d_git.bb
index 9708ec9..2276c36 100644
--- a/recipes-qt/qt5/qt3d_git.bb
+++ b/recipes-qt/qt5/qt3d_git.bb
@@ -3,9 +3,9 @@ require qt5-git.inc
 
 LICENSE = "LGPL-3.0 | GPL-2.0"
 LIC_FILES_CHKSUM = " \
-    file://LICENSE.LGPLv3;md5=3dcffeed712d3c916f9a2d9135703aff \
-    file://LICENSE.GPLv3;md5=40f9bf30e783ddc201497165dfb32afb \
-    file://LICENSE.GPL;md5=05832301944453ec79e40ba3c3cfceec \
+    file://LICENSE.LGPLv3;md5=8211fde12cc8a4e2477602f5953f5b71 \
+    file://LICENSE.GPLv3;md5=88e2b9117e6be406b5ed6ee4ca99a705 \
+    file://LICENSE.GPL;md5=c96076271561b0e3785dad260634eaa8 \
 "
 
 DEPENDS += "qtbase"
@@ -27,6 +27,6 @@ FILES_${PN}-qmlplugins += " \
     ${OE_QMAKE_PATH_QML}/*/*/*.obj \
 "
 
-SRCREV = "c3fdb888fbd94de0f6b7b1a6859cba8132ecc93d"
+SRCREV = "0eac16fbda846c951f9b3887199e72b66f5aacd7"
 
 BBCLASSEXTEND += "native nativesdk"
diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
index e1e25ba..3e1bc72 100644
--- a/recipes-qt/qt5/qt5-git.inc
+++ b/recipes-qt/qt5/qt5-git.inc
@@ -12,4 +12,4 @@ SRC_URI = " \
 
 S = "${WORKDIR}/git"
 
-PV = "5.7.0+git${SRCPV}"
+PV = "5.7.1+git${SRCPV}"
diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
index 4da5640..ec4a9b6 100644
--- a/recipes-qt/qt5/qtbase-native_git.bb
+++ b/recipes-qt/qt5/qtbase-native_git.bb
@@ -123,4 +123,4 @@ do_install() {
     ln -sf syncqt.pl ${D}${OE_QMAKE_PATH_QT_BINS}/syncqt
 }
 
-SRCREV = "69b43e74d78e050cf5e40197acafa4bc9f90c0bd"
+SRCREV = "a55f36211efe1bb0d6717c8545366120bd6dfd9f"
diff --git a/recipes-qt/qt5/qtbase/0013-Fix-build-with-QT_NO_OPENGL.patch b/recipes-qt/qt5/qtbase/0013-Fix-build-with-QT_NO_OPENGL.patch
deleted file mode 100644
index 7b681dc..0000000
--- a/recipes-qt/qt5/qtbase/0013-Fix-build-with-QT_NO_OPENGL.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 2e176e3d10535e4fdaa6ecc919538f66f4a2930d Mon Sep 17 00:00:00 2001
-From: Andy Nichols <andy.nichols@qt.io>
-Date: Mon, 11 Jul 2016 09:18:33 +0200
-Subject: QWidgetBackingStore: Fix build with QT_NO_OPENGL
-
-A define moved out of the #ifndef QT_NO_OPENGL scope.
-
-Change-Id: I41c943b97f165b5171581e01f3a4b2d3fb25747e
-Reviewed-by: Laszlo Agocs <laszlo.agocs@qt.io>
-
-Upstream-Status: Backport
-Signed-off-by: Johannes Pointner <johannes.pointner@br-automation.com>
----
- src/widgets/kernel/qwidgetbackingstore.cpp | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/widgets/kernel/qwidgetbackingstore.cpp b/src/widgets/kernel/qwidgetbackingstore.cpp
-index 32aabce..242e625 100644
---- a/src/widgets/kernel/qwidgetbackingstore.cpp
-+++ b/src/widgets/kernel/qwidgetbackingstore.cpp
-@@ -67,7 +67,9 @@ QT_BEGIN_NAMESPACE
-
- extern QRegion qt_dirtyRegion(QWidget *);
-
-+#ifndef QT_NO_OPENGL
- Q_GLOBAL_STATIC(QPlatformTextureList, qt_dummy_platformTextureList)
-+#endif
-
- /**
-  * Flushes the contents of the \a backingStore into the screen area of \a widget.
---
-cgit v1.0-4-g1e03
-
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index eda57ac..21f67f6 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -26,7 +26,6 @@ SRC_URI += "\
     file://0008-configure-paths-for-target-qmake-properly.patch \
     file://0009-Reorder-EGL-libraries-from-pkgconfig-and-defaults.patch \
     file://0010-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch \
-    file://0013-Fix-build-with-QT_NO_OPENGL.patch \
 "
 
 DEPENDS += "qtbase-native"
@@ -230,4 +229,4 @@ do_install_append() {
 
 RRECOMMENDS_${PN}-plugins += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libx11-locale', '', d)}"
 
-SRCREV = "69b43e74d78e050cf5e40197acafa4bc9f90c0bd"
+SRCREV = "a55f36211efe1bb0d6717c8545366120bd6dfd9f"
diff --git a/recipes-qt/qt5/qtcanvas3d_git.bb b/recipes-qt/qt5/qtcanvas3d_git.bb
index 8cf316b..109b293 100644
--- a/recipes-qt/qt5/qtcanvas3d_git.bb
+++ b/recipes-qt/qt5/qtcanvas3d_git.bb
@@ -3,11 +3,11 @@ require qt5-git.inc
 
 LICENSE = "LGPL-3.0 | GPL-3.0"
 LIC_FILES_CHKSUM = " \
-    file://LICENSE.LGPLv3;md5=b8c75190712063cde04e1f41b6fdad98 \
-    file://LICENSE.GPLv3;md5=40f9bf30e783ddc201497165dfb32afb \
-    file://LICENSE.GPLv2;md5=05832301944453ec79e40ba3c3cfceec \
+    file://LICENSE.LGPLv3;md5=e0459b45c5c4840b353141a8bbed91f0 \
+    file://LICENSE.GPLv3;md5=88e2b9117e6be406b5ed6ee4ca99a705 \
+    file://LICENSE.GPLv2;md5=c96076271561b0e3785dad260634eaa8 \
 "
 
 DEPENDS = "qtdeclarative"
 
-SRCREV = "1568c60d2a0d1758acfeec9f002af7ff5b4d28ee"
+SRCREV = "8e34d6f5399a29d45f9402219f13b631e29fd4b0"
diff --git a/recipes-qt/qt5/qtcharts_git.bb b/recipes-qt/qt5/qtcharts_git.bb
index 21f6f13..d0ac2a1 100644
--- a/recipes-qt/qt5/qtcharts_git.bb
+++ b/recipes-qt/qt5/qtcharts_git.bb
@@ -8,4 +8,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative qtmultimedia"
 
-SRCREV = "03a6177a3223f928a5f329c8b1fc4d5fe376deed"
+SRCREV = "da071825245a4ec1dc4904a9d3329db5a132c074"
diff --git a/recipes-qt/qt5/qtconnectivity_git.bb b/recipes-qt/qt5/qtconnectivity_git.bb
index 67f882a..665359b 100644
--- a/recipes-qt/qt5/qtconnectivity_git.bb
+++ b/recipes-qt/qt5/qtconnectivity_git.bb
@@ -28,4 +28,4 @@ do_configure_prepend() {
     sed -i 's/^qtCompileTest(bluez)/OE_BLUEZ_ENABLED:qtCompileTest(bluez)/g' ${S}/qtconnectivity.pro
 }
 
-SRCREV = "8755a1f2460fa523782e27b6ca7a430a0176ac61"
+SRCREV = "d884d20c5530b67fbd2fba35cdb71a9f969196be"
diff --git a/recipes-qt/qt5/qtdatavis3d_git.bb b/recipes-qt/qt5/qtdatavis3d_git.bb
index 50a0bcc..b96765c 100644
--- a/recipes-qt/qt5/qtdatavis3d_git.bb
+++ b/recipes-qt/qt5/qtdatavis3d_git.bb
@@ -8,4 +8,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative qtmultimedia qtxmlpatterns"
 
-SRCREV = "d6a8da66dc3c141621c9be4b7509a6e43c60e15c"
+SRCREV = "2523056490c3f7a35d176deb583ba46899fe260b"
diff --git a/recipes-qt/qt5/qtdeclarative-render2d_git.bb b/recipes-qt/qt5/qtdeclarative-render2d_git.bb
index cb2ee8b..836a798 100644
--- a/recipes-qt/qt5/qtdeclarative-render2d_git.bb
+++ b/recipes-qt/qt5/qtdeclarative-render2d_git.bb
@@ -9,4 +9,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative"
 
-SRCREV = "13a6c51f26128015c0a3c335bdae676b46df6ed6"
+SRCREV = "fe2807312ff3d2285b51a4de363b1c1fb8d85f82"
diff --git a/recipes-qt/qt5/qtdeclarative/0003-Workaround-crashes-in-QtQml-code-related-to-dead-sto.patch b/recipes-qt/qt5/qtdeclarative/0003-Workaround-crashes-in-QtQml-code-related-to-dead-sto.patch
deleted file mode 100644
index d3ee42e..0000000
--- a/recipes-qt/qt5/qtdeclarative/0003-Workaround-crashes-in-QtQml-code-related-to-dead-sto.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From fcc2c95421710f98c7b2dec73e2c8b0d9164bc9b Mon Sep 17 00:00:00 2001
-From: Jonathan Liu <net147@gmail.com>
-Date: Wed, 24 Aug 2016 11:18:37 +1000
-Subject: [PATCH] Workaround crashes in QtQml code related to dead-store
- elimination
-
-When compiled in release mode with GCC 6, QtQml may crash.
-This is because the C++ compiler is more aggressive about dead-store
-elimination in situations where a memory store to a location precedes
-the construction of an object at that memory location.
-
-The QV4::MemoryManager::allocate{Managed,Object} functions allocate
-memory and write to it before the caller does a placement new to
-construct an object in the same memory. The compiler considers these
-writes before the constructor as "dead stores" and eliminates them.
-
-The -fno-lifetime-dse compiler flag is added to disable this more
-aggressive dead-store eliminiation optimization.
-
-This is a temporary workaround until a proper solution is found.
-
-Upstream-Status: Accepted
-
-Task-number: QTBUG-55482
-Change-Id: I7dbae6e9e613e53ce5fb25957c449bc6657803b5
-Reviewed-by: Thiago Macieira <thiago.macieira@intel.com>
-Signed-off-by: Jonathan Liu <net147@gmail.com>
----
- src/qml/qml.pro | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/qml/qml.pro b/src/qml/qml.pro
-index f4862a1..651afa6 100644
---- a/src/qml/qml.pro
-+++ b/src/qml/qml.pro
-@@ -18,7 +18,7 @@ exists("qqml_enable_gcov") {
- 
- greaterThan(QT_GCC_MAJOR_VERSION, 5) {
-     # Our code is bad. Temporary workaround.
--    QMAKE_CXXFLAGS += -fno-delete-null-pointer-checks
-+    QMAKE_CXXFLAGS += -fno-delete-null-pointer-checks -fno-lifetime-dse
- }
- 
- QMAKE_DOCS = $$PWD/doc/qtqml.qdocconf
diff --git a/recipes-qt/qt5/qtdeclarative_git.bb b/recipes-qt/qt5/qtdeclarative_git.bb
index 5cc4caa..a56e9dc 100644
--- a/recipes-qt/qt5/qtdeclarative_git.bb
+++ b/recipes-qt/qt5/qtdeclarative_git.bb
@@ -19,7 +19,6 @@ DEPENDS += "qtbase"
 SRC_URI += " \
     file://0001-qmltestexample-fix-link.patch \
     file://0002-qquickviewcomparison-fix-QCoreApplication-has-not-be.patch \
-    file://0003-Workaround-crashes-in-QtQml-code-related-to-dead-sto.patch \
 "
 
 EXTRA_OEMAKE += "QMAKE_SYNCQT=${STAGING_BINDIR_NATIVE}${QT_DIR_NAME}/syncqt"
@@ -38,6 +37,6 @@ do_configure_prepend() {
 
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'qtxmlpatterns', 'CONFIG+=OE_QTXMLPATTERNS_ENABLED', '', d)}"
 
-SRCREV = "d48b397cc79265e80c8437888f9ded0b0364e418"
+SRCREV = "2a992040e2ef3f9dab087be3bfac05e28596672b"
 
 BBCLASSEXTEND =+ "native nativesdk"
diff --git a/recipes-qt/qt5/qtgraphicaleffects_git.bb b/recipes-qt/qt5/qtgraphicaleffects_git.bb
index 6c62a68..6165286 100644
--- a/recipes-qt/qt5/qtgraphicaleffects_git.bb
+++ b/recipes-qt/qt5/qtgraphicaleffects_git.bb
@@ -4,13 +4,13 @@ require qt5-git.inc
 LICENSE = "GFDL-1.3 & BSD & ( GPL-3.0 & The-Qt-Company-GPL-Exception-1.0 | The-Qt-Company-Commercial ) & ( GPL-2.0+ | LGPL-3.0 | The-Qt-Company-Commercial )"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.LGPL3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
-    file://LICENSE.LGPLv21;md5=58a180e1cf84c756c29f782b3a485c29 \
-    file://LICENSE.LGPLv3;md5=b8c75190712063cde04e1f41b6fdad98 \
+    file://LICENSE.LGPLv21;md5=4bfd28363f541b10d9f024181b8df516 \
+    file://LICENSE.LGPLv3;md5=e0459b45c5c4840b353141a8bbed91f0 \
     file://LICENSE.GPL2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
     file://LICENSE.GPL3;md5=d32239bcb673463ab874e80d47fae504 \
     file://LICENSE.GPL3-EXCEPT;md5=763d8c535a234d9a3fb682c7ecb6c073 \
-    file://LICENSE.GPLv2;md5=05832301944453ec79e40ba3c3cfceec \
-    file://LICENSE.GPLv3;md5=40f9bf30e783ddc201497165dfb32afb \
+    file://LICENSE.GPLv2;md5=c96076271561b0e3785dad260634eaa8 \
+    file://LICENSE.GPLv3;md5=88e2b9117e6be406b5ed6ee4ca99a705 \
     file://LGPL_EXCEPTION.txt;md5=9625233da42f9e0ce9d63651a9d97654 \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
 "
@@ -19,4 +19,4 @@ DEPENDS += "qtdeclarative"
 
 RDEPENDS_${PN}-dev = ""
 
-SRCREV = "d3023be0d839440ac046adf2af75d9e4306dd5ef"
+SRCREV = "f536e36e3188903404fac78064ea7872dd8cc0d2"
diff --git a/recipes-qt/qt5/qtimageformats_git.bb b/recipes-qt/qt5/qtimageformats_git.bb
index 7f8179e..80dcdd3 100644
--- a/recipes-qt/qt5/qtimageformats_git.bb
+++ b/recipes-qt/qt5/qtimageformats_git.bb
@@ -4,13 +4,13 @@ require qt5-git.inc
 LICENSE = "GFDL-1.3 & BSD & ( GPL-3.0 & The-Qt-Company-GPL-Exception-1.0 | The-Qt-Company-Commercial ) & ( GPL-2.0+ | LGPL-3.0 | The-Qt-Company-Commercial )"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.LGPL3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
-    file://LICENSE.LGPLv21;md5=58a180e1cf84c756c29f782b3a485c29 \
-    file://LICENSE.LGPLv3;md5=b8c75190712063cde04e1f41b6fdad98 \
+    file://LICENSE.LGPLv21;md5=4bfd28363f541b10d9f024181b8df516 \
+    file://LICENSE.LGPLv3;md5=e0459b45c5c4840b353141a8bbed91f0 \
     file://LICENSE.GPL2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
     file://LICENSE.GPL3;md5=d32239bcb673463ab874e80d47fae504 \
     file://LICENSE.GPL3-EXCEPT;md5=763d8c535a234d9a3fb682c7ecb6c073 \
-    file://LICENSE.GPLv2;md5=05832301944453ec79e40ba3c3cfceec \
-    file://LICENSE.GPLv3;md5=40f9bf30e783ddc201497165dfb32afb \
+    file://LICENSE.GPLv2;md5=c96076271561b0e3785dad260634eaa8 \
+    file://LICENSE.GPLv3;md5=88e2b9117e6be406b5ed6ee4ca99a705 \
     file://LGPL_EXCEPTION.txt;md5=9625233da42f9e0ce9d63651a9d97654 \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
 "
@@ -32,4 +32,4 @@ EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'jasper', 'CONFIG+
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'libtiff', 'CONFIG+=OE_LIBTIFF_ENABLED', '', d)}"
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'libwebp', 'CONFIG+=OE_LIBWEBP_ENABLED', '', d)}"
 
-SRCREV = "d4401c9f519dfe82c38fe9ded674e454655f1866"
+SRCREV = "11300c62aa021ef07f3e4de8bd875bfcbcbe2f7e"
diff --git a/recipes-qt/qt5/qtlocation_git.bb b/recipes-qt/qt5/qtlocation_git.bb
index 7a9ecb4..351e807 100644
--- a/recipes-qt/qt5/qtlocation_git.bb
+++ b/recipes-qt/qt5/qtlocation_git.bb
@@ -3,12 +3,12 @@ require qt5-git.inc
 
 LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception-1.1 | LGPL-3.0) | GPL-2.0"
 LIC_FILES_CHKSUM = " \
-    file://LICENSE.LGPLv21;md5=58a180e1cf84c756c29f782b3a485c29 \
-    file://LICENSE.LGPLv3;md5=b8c75190712063cde04e1f41b6fdad98 \
-    file://LICENSE.GPLv3;md5=40f9bf30e783ddc201497165dfb32afb \
+    file://LICENSE.LGPLv21;md5=4bfd28363f541b10d9f024181b8df516 \
+    file://LICENSE.LGPLv3;md5=e0459b45c5c4840b353141a8bbed91f0 \
+    file://LICENSE.GPLv3;md5=88e2b9117e6be406b5ed6ee4ca99a705 \
     file://LGPL_EXCEPTION.txt;md5=9625233da42f9e0ce9d63651a9d97654 \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
-    file://LICENSE.GPLv2;md5=05832301944453ec79e40ba3c3cfceec \
+    file://LICENSE.GPLv2;md5=c96076271561b0e3785dad260634eaa8 \
 "
 
 DEPENDS += "qtbase qtxmlpatterns qtdeclarative qtquickcontrols"
@@ -29,4 +29,4 @@ do_configure_prepend() {
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'geoclue', 'CONFIG+=OE_GEOCLUE_ENABLED', '', d)}"
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'gypsy', 'CONFIG+=OE_GYPSY_ENABLED', '', d)}"
 
-SRCREV = "4e1008b4ac1eea776585ca41a6a3db127cf500ff"
+SRCREV = "de5be121d84b062f1b72c91dddc877e5e88babc0"
diff --git a/recipes-qt/qt5/qtmultimedia_git.bb b/recipes-qt/qt5/qtmultimedia_git.bb
index 3bbfb6e..bc3fcfb 100644
--- a/recipes-qt/qt5/qtmultimedia_git.bb
+++ b/recipes-qt/qt5/qtmultimedia_git.bb
@@ -38,4 +38,4 @@ SRC_URI += "\
     file://0001-Initial-porting-effort-to-GStreamer-1.0.patch \
 "
 
-SRCREV = "1be4f74843b41f8bc1d1d64e83485f4eb864e8b4"
+SRCREV = "e4aef963cbd32274669af6b66158f6f0ca4ba3ed"
diff --git a/recipes-qt/qt5/qtquickcontrols2_git.bb b/recipes-qt/qt5/qtquickcontrols2_git.bb
index 7271a19..54d932b 100644
--- a/recipes-qt/qt5/qtquickcontrols2_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols2_git.bb
@@ -4,10 +4,10 @@ require qt5-git.inc
 LICENSE = "GFDL-1.3 & BSD & LGPL-3.0 | GPL-3.0"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
-    file://LICENSE.LGPLv3;md5=8ba7f2099d17d636d5fcc8303bb17587 \
-    file://LICENSE.GPLv3;md5=40f9bf30e783ddc201497165dfb32afb \
+    file://LICENSE.LGPLv3;md5=a37e6cd7102174853307e03e6edc5f30 \
+    file://LICENSE.GPLv3;md5=88e2b9117e6be406b5ed6ee4ca99a705 \
 "
 
 DEPENDS += "qtdeclarative"
 
-SRCREV = "cc0ee8e4f3345023f1b85fc815739c0a75ea5686"
+SRCREV = "6f6e073815d5b05aba553b83809fb701541260c6"
diff --git a/recipes-qt/qt5/qtquickcontrols_git.bb b/recipes-qt/qt5/qtquickcontrols_git.bb
index 176035c..79ec3fd 100644
--- a/recipes-qt/qt5/qtquickcontrols_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols_git.bb
@@ -4,12 +4,12 @@ require qt5-git.inc
 LICENSE = "GFDL-1.3 & BSD & ( GPL-3.0 & The-Qt-Company-GPL-Exception-1.0 | The-Qt-Company-Commercial ) & ( GPL-2.0+ | LGPL-3.0 | The-Qt-Company-Commercial )"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.LGPL3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
-    file://LICENSE.LGPLv3;md5=b8c75190712063cde04e1f41b6fdad98 \
+    file://LICENSE.LGPLv3;md5=e0459b45c5c4840b353141a8bbed91f0 \
     file://LICENSE.GPL2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
     file://LICENSE.GPL3;md5=d32239bcb673463ab874e80d47fae504 \
     file://LICENSE.GPL3-EXCEPT;md5=763d8c535a234d9a3fb682c7ecb6c073 \
-    file://LICENSE.GPLv2;md5=05832301944453ec79e40ba3c3cfceec \
-    file://LICENSE.GPLv3;md5=40f9bf30e783ddc201497165dfb32afb \
+    file://LICENSE.GPLv2;md5=c96076271561b0e3785dad260634eaa8 \
+    file://LICENSE.GPLv3;md5=88e2b9117e6be406b5ed6ee4ca99a705 \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
 "
 
@@ -21,4 +21,4 @@ SRC_URI += " \
     file://0001-texteditor-fix-invalid-use-of-incomplete-type-class-.patch \
 "
 
-SRCREV = "37f8b753be1b16975220c8b611b17a428eafb9e9"
+SRCREV = "84b3cf1c0483af7ad200ab33944d8eaa4d4ffa48"
diff --git a/recipes-qt/qt5/qtscript_git.bb b/recipes-qt/qt5/qtscript_git.bb
index bee833d..460eb0d 100644
--- a/recipes-qt/qt5/qtscript_git.bb
+++ b/recipes-qt/qt5/qtscript_git.bb
@@ -25,4 +25,4 @@ ARM_INSTRUCTION_SET_armv5 = "arm"
 
 DEPENDS += "qtbase"
 
-SRCREV = "b8845794b95376e8be39dbdafca2c85b5ec4c195"
+SRCREV = "42f94f30488a01751f387dc9bd3160ce1b4dfa58"
diff --git a/recipes-qt/qt5/qtsensors_git.bb b/recipes-qt/qt5/qtsensors_git.bb
index af45d89..24551eb 100644
--- a/recipes-qt/qt5/qtsensors_git.bb
+++ b/recipes-qt/qt5/qtsensors_git.bb
@@ -3,14 +3,14 @@ require qt5-git.inc
 
 LICENSE = "GFDL-1.3 & BSD & ( GPL-3.0 & The-Qt-Company-GPL-Exception-1.0 | The-Qt-Company-Commercial ) & ( GPL-2.0+ | LGPL-3.0 | The-Qt-Company-Commercial )"
 LIC_FILES_CHKSUM = " \
-    file://LICENSE.LGPLv21;md5=58a180e1cf84c756c29f782b3a485c29 \
-    file://LICENSE.LGPLv3;md5=b8c75190712063cde04e1f41b6fdad98 \
-    file://LICENSE.GPLv3;md5=40f9bf30e783ddc201497165dfb32afb \
+    file://LICENSE.LGPLv21;md5=4bfd28363f541b10d9f024181b8df516 \
+    file://LICENSE.LGPLv3;md5=e0459b45c5c4840b353141a8bbed91f0 \
+    file://LICENSE.GPLv3;md5=88e2b9117e6be406b5ed6ee4ca99a705 \
     file://LGPL_EXCEPTION.txt;md5=9625233da42f9e0ce9d63651a9d97654 \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
-    file://LICENSE.GPLv2;md5=05832301944453ec79e40ba3c3cfceec \
+    file://LICENSE.GPLv2;md5=c96076271561b0e3785dad260634eaa8 \
 "
 
 DEPENDS += "qtbase qtdeclarative"
 
-SRCREV = "e03c37077ea4841b9e0b591d29a34737d7d8dd32"
+SRCREV = "5a57beaaa5f637070ccbf30d79ad27861134c7a8"
diff --git a/recipes-qt/qt5/qtserialbus_git.bb b/recipes-qt/qt5/qtserialbus_git.bb
index 397ac4e..d8b4546 100644
--- a/recipes-qt/qt5/qtserialbus_git.bb
+++ b/recipes-qt/qt5/qtserialbus_git.bb
@@ -11,4 +11,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtserialport"
 
-SRCREV = "88554d068d287870740b842864a50604f53e8509"
+SRCREV = "768b2d463663104daae44f564f09c3a10e2e6ad6"
diff --git a/recipes-qt/qt5/qtserialport_git.bb b/recipes-qt/qt5/qtserialport_git.bb
index d5f37d5..ef780d4 100644
--- a/recipes-qt/qt5/qtserialport_git.bb
+++ b/recipes-qt/qt5/qtserialport_git.bb
@@ -5,14 +5,14 @@ require qt5-git.inc
 # other qt* components use :/
 LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
 LIC_FILES_CHKSUM = " \
-    file://LICENSE.LGPLv21;md5=58a180e1cf84c756c29f782b3a485c29 \
-    file://LICENSE.LGPLv3;md5=b8c75190712063cde04e1f41b6fdad98 \
-    file://LICENSE.GPLv3;md5=40f9bf30e783ddc201497165dfb32afb \
+    file://LICENSE.LGPLv21;md5=4bfd28363f541b10d9f024181b8df516 \
+    file://LICENSE.LGPLv3;md5=e0459b45c5c4840b353141a8bbed91f0 \
+    file://LICENSE.GPLv3;md5=88e2b9117e6be406b5ed6ee4ca99a705 \
     file://LGPL_EXCEPTION.txt;md5=bb426f3367c4805d1e12fad05bd0b750 \
     file://LICENSE.FDL;md5=3801d7932fdc07fd9efe89f9854a6caa \
-    file://LICENSE.GPLv2;md5=05832301944453ec79e40ba3c3cfceec \
+    file://LICENSE.GPLv2;md5=c96076271561b0e3785dad260634eaa8 \
 "
 
 DEPENDS += "qtbase"
 
-SRCREV = "7346857f4f675f57572d54f15cfad9111af2abde"
+SRCREV = "0b9f41c28cece4fe51011083e646aba405ec3a65"
diff --git a/recipes-qt/qt5/qtsvg_git.bb b/recipes-qt/qt5/qtsvg_git.bb
index 21e06ff..46bbd9b 100644
--- a/recipes-qt/qt5/qtsvg_git.bb
+++ b/recipes-qt/qt5/qtsvg_git.bb
@@ -3,13 +3,13 @@ require qt5-git.inc
 
 LICENSE = "GFDL-1.3 & BSD & ( GPL-3.0 & The-Qt-Company-GPL-Exception-1.0 | The-Qt-Company-Commercial ) & ( GPL-2.0+ | LGPL-3.0 | The-Qt-Company-Commercial )"
 LIC_FILES_CHKSUM = " \
-    file://LICENSE.LGPLv21;md5=58a180e1cf84c756c29f782b3a485c29 \
-    file://LICENSE.LGPLv3;md5=b8c75190712063cde04e1f41b6fdad98 \
-    file://LICENSE.GPLv3;md5=40f9bf30e783ddc201497165dfb32afb \
+    file://LICENSE.LGPLv21;md5=4bfd28363f541b10d9f024181b8df516 \
+    file://LICENSE.LGPLv3;md5=e0459b45c5c4840b353141a8bbed91f0 \
+    file://LICENSE.GPLv3;md5=88e2b9117e6be406b5ed6ee4ca99a705 \
     file://LGPL_EXCEPTION.txt;md5=9625233da42f9e0ce9d63651a9d97654 \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
 "
 
 DEPENDS += "qtbase"
 
-SRCREV = "64ca369c7e3d61f0416bc1fd6a102f0c62924433"
+SRCREV = "d3d3db5a75fe2ba992742e418bfefa25eddf7684"
diff --git a/recipes-qt/qt5/qttools_git.bb b/recipes-qt/qt5/qttools_git.bb
index 56c1205..fbebc96 100644
--- a/recipes-qt/qt5/qttools_git.bb
+++ b/recipes-qt/qt5/qttools_git.bb
@@ -35,6 +35,6 @@ PACKAGECONFIG[qtwebkit] = ",,qtwebkit"
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'qtwebkit', '', 'CONFIG+=noqtwebkit', d)}"
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'linguistonly', 'CONFIG+=linguistonly', '', d)}"
 
-SRCREV = "0597b535f82d3458a1db1828c5e5f725bbcf59fd"
+SRCREV = "8575ed82ff0dd43aed8f5de67b4cfef06fec8c33"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/recipes-qt/qt5/qttranslations_git.bb b/recipes-qt/qt5/qttranslations_git.bb
index 2a37d14..89657f1 100644
--- a/recipes-qt/qt5/qttranslations_git.bb
+++ b/recipes-qt/qt5/qttranslations_git.bb
@@ -114,4 +114,4 @@ FILES_${PN}-qt = " \
     ${OE_QMAKE_PATH_TRANSLATIONS}/qt_*.qm \
 "
 
-SRCREV = "2209b3fd6a56bfc44da5369c4fbd345bbca31777"
+SRCREV = "c4795ce81f9165a05e6f918066c671808447c539"
diff --git a/recipes-qt/qt5/qtvirtualkeyboard_git.bb b/recipes-qt/qt5/qtvirtualkeyboard_git.bb
index 7e2f445..067f1d6 100644
--- a/recipes-qt/qt5/qtvirtualkeyboard_git.bb
+++ b/recipes-qt/qt5/qtvirtualkeyboard_git.bb
@@ -48,4 +48,4 @@ FILES_${PN} += "${OE_QMAKE_PATH_DATA}/qtvirtualkeyboard/lipi_toolkit"
 
 DEPENDS += "qtbase qtdeclarative qtmultimedia qtquickcontrols qtsvg qtxmlpatterns"
 
-SRCREV = "626e78c9660cff063e1f9370538b5a424631571c"
+SRCREV = "5ac6b611b196c66bc8b01c23aa50d175ae7a7308"
diff --git a/recipes-qt/qt5/qtwayland-native_git.bb b/recipes-qt/qt5/qtwayland-native_git.bb
index a214346..945c300 100644
--- a/recipes-qt/qt5/qtwayland-native_git.bb
+++ b/recipes-qt/qt5/qtwayland-native_git.bb
@@ -28,4 +28,4 @@ do_install() {
     oe_runmake install INSTALL_ROOT=${D}
 }
 
-SRCREV = "a172672484b9496819e588b51ac2ff9fb4a21941"
+SRCREV = "4b23163fb64a5a8d05320dd006962cf2bcefcd84"
diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_git.bb
index b208961..1c2cd76 100644
--- a/recipes-qt/qt5/qtwayland_git.bb
+++ b/recipes-qt/qt5/qtwayland_git.bb
@@ -48,4 +48,4 @@ SRC_URI += " \
     file://0001-examples-wayland-include-server-buffer-only-when-bui.patch \
 "
 
-SRCREV = "a172672484b9496819e588b51ac2ff9fb4a21941"
+SRCREV = "4b23163fb64a5a8d05320dd006962cf2bcefcd84"
diff --git a/recipes-qt/qt5/qtwebchannel_git.bb b/recipes-qt/qt5/qtwebchannel_git.bb
index 45ac814..2ed752f 100644
--- a/recipes-qt/qt5/qtwebchannel_git.bb
+++ b/recipes-qt/qt5/qtwebchannel_git.bb
@@ -17,4 +17,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtdeclarative qtwebsockets"
 
-SRCREV = "3836fd7d12777fc53836a72d6542d2fbf2f20ac9"
+SRCREV = "31eb0d8c7d78fe60dbad94091a56e97b4fcaa52b"
diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index aedd141..4712441 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -122,10 +122,10 @@ SRC_URI += " \
     file://0002-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch \
 "
 
-SRCREV_qtwebengine = "dbf7dd27428ff755444eac5e975cb69802ac9771"
+SRCREV_qtwebengine = "9cc97f0c63049a8076476acc89c875c9e240abfb"
 # This is in git submodule, but we're using the latest in 49-based
 # SRCREV_chromium = "c109a95a067af783e48f93d1cdeca870cda98878"
-SRCREV_chromium = "29c16917b33c26ad32893fa05af971c6c6f50297"
+SRCREV_chromium = "b3c79e92f0a631273b639af171e59f4c367ae02e"
 SRCREV = "${SRCREV_qtwebengine}"
 
 SRCREV_FORMAT = "qtwebengine_chromium"
diff --git a/recipes-qt/qt5/qtwebsockets_git.bb b/recipes-qt/qt5/qtwebsockets_git.bb
index 8c238db..7e21256 100644
--- a/recipes-qt/qt5/qtwebsockets_git.bb
+++ b/recipes-qt/qt5/qtwebsockets_git.bb
@@ -3,12 +3,12 @@ require qt5-git.inc
 
 LICENSE = "GFDL-1.3 & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
 LIC_FILES_CHKSUM = " \
-    file://LICENSE.LGPLv21;md5=58a180e1cf84c756c29f782b3a485c29 \
-    file://LICENSE.LGPLv3;md5=b8c75190712063cde04e1f41b6fdad98 \
-    file://LICENSE.GPLv3;md5=40f9bf30e783ddc201497165dfb32afb \
+    file://LICENSE.LGPLv21;md5=4bfd28363f541b10d9f024181b8df516 \
+    file://LICENSE.LGPLv3;md5=e0459b45c5c4840b353141a8bbed91f0 \
+    file://LICENSE.GPLv3;md5=88e2b9117e6be406b5ed6ee4ca99a705 \
     file://LGPL_EXCEPTION.txt;md5=bb426f3367c4805d1e12fad05bd0b750 \
 "
 
 DEPENDS += "qtbase qtdeclarative"
 
-SRCREV = "8d17ddfc2f62df56ac067bd0f9736c6e8d37aa97"
+SRCREV = "60cede232aca96f3f6852c54c0d97cf1771fb371"
diff --git a/recipes-qt/qt5/qtx11extras_git.bb b/recipes-qt/qt5/qtx11extras_git.bb
index 9a4d6d7..ba81860 100644
--- a/recipes-qt/qt5/qtx11extras_git.bb
+++ b/recipes-qt/qt5/qtx11extras_git.bb
@@ -3,14 +3,14 @@ require qt5-git.inc
 
 LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception-1.1 | LGPL-3.0) | GPL-2.0"
 LIC_FILES_CHKSUM = " \
-    file://LICENSE.LGPLv21;md5=58a180e1cf84c756c29f782b3a485c29 \
-    file://LICENSE.LGPLv3;md5=b8c75190712063cde04e1f41b6fdad98 \
-    file://LICENSE.GPLv3;md5=40f9bf30e783ddc201497165dfb32afb \
+    file://LICENSE.LGPLv21;md5=4bfd28363f541b10d9f024181b8df516 \
+    file://LICENSE.LGPLv3;md5=e0459b45c5c4840b353141a8bbed91f0 \
+    file://LICENSE.GPLv3;md5=88e2b9117e6be406b5ed6ee4ca99a705 \
     file://LGPL_EXCEPTION.txt;md5=9625233da42f9e0ce9d63651a9d97654 \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
-    file://LICENSE.GPLv2;md5=05832301944453ec79e40ba3c3cfceec \
+    file://LICENSE.GPLv2;md5=c96076271561b0e3785dad260634eaa8 \
 "
 
 DEPENDS += "qtbase"
 
-SRCREV = "bae8bfc7a811af2bf51b227cbf8467e50a2a149a"
+SRCREV = "d311bf931b60e91412bedd2751ad3a68095a7182"
diff --git a/recipes-qt/qt5/qtxmlpatterns_git.bb b/recipes-qt/qt5/qtxmlpatterns_git.bb
index e4c3d7f..755417f 100644
--- a/recipes-qt/qt5/qtxmlpatterns_git.bb
+++ b/recipes-qt/qt5/qtxmlpatterns_git.bb
@@ -16,6 +16,6 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "574d92a43e1fc5480a7f5f79cc6baf566a53349f"
+SRCREV = "89dbcc4f807015736a8ce3393b857735019d098d"
 
 BBCLASSEXTEND =+ "native nativesdk"
-- 
2.7.4


