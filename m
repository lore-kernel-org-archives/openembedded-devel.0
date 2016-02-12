Return-Path: <samuli.piippo@theqtcompany.com>
Received: from emea01-db3-obe.outbound.protection.outlook.com
	(mail-db3on0135.outbound.protection.outlook.com [157.55.234.135])
	by mail.openembedded.org (Postfix) with ESMTP id 73CBE73190
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Feb 2016 16:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=digiaonline.onmicrosoft.com; s=selector1-theqtcompany-com;
	h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=trJHGgGJ+fq82Zn8u2VhFkiTMjmtjC9tu2j8x5KKrWM=;
	b=DDfQCUxV3pRHZyTw7GPiTiKpi507lHlgWlOxRTu8OOL4KRSUKH5XN8sblpSvECjIOcXlg+PrKNbMEQJZWO5CTUMZITKZZWuEN8lXe6iTr05cUr/LmZQzAphsuiM6CizbhlmQXmrHaT1yHPQFH0QSfpW00x5EKPJKNbFa1vKuUWY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=theqtcompany.com;
Received: from piippo.it.local (91.217.248.11) by
	DB5PR02MB1174.eurprd02.prod.outlook.com (10.162.163.20) with Microsoft
	SMTP Server (TLS) id 15.1.403.16; Fri, 12 Feb 2016 16:05:01 +0000
From: Samuli Piippo <samuli.piippo@theqtcompany.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 12 Feb 2016 18:04:55 +0200
Message-ID: <1455293095-31944-1-git-send-email-samuli.piippo@theqtcompany.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [91.217.248.11]
X-ClientProxiedBy: VI1PR07CA0069.eurprd07.prod.outlook.com (25.164.94.165) To
	DB5PR02MB1174.eurprd02.prod.outlook.com (25.162.163.20)
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1174;
	2:5fFuwLErmja86QfS7rXX55y5YjhfuUXXx5yVU3QtTtNeoass7wcJUoxyOB4kP3f3r5/qIIfmi7daWjMhQQTudSDv1dND2iqZSN0NfHqvOBc+91ythrnrj/GEqMWUylQpQUV5qHK9jtmVxE83eogW6Q==;
	3:Qfx3+h/w/VTym7mPxeEYWz2UgbUVFwyNyjx7eqb1FhblMNNNXP/qjVs41E/uv5WCWQzoosUC4waF+d56fKvAniGH9eXUuSKn/MkSFhb/8cZaOvxxtNJNWWDSWgIgDPVE;
	25:PGFpG0Od55HA9iuBZmjD0HXHxHARASajgLZsH6kSbTIU79wlYZu87Xkqn0s+6cysX4O4hgVVvi58yKKIYO0NEWXH4Vs1Yy+VZS22U9qPMQG/hw0l90d2nuWZNrfCvh5FTBvdtxkW5TK/wnQI6C3qZ5Jm/SLvVM5ilJuC8xeNCndK2YgnPmqCy9aoUWw/qI8GIGP15SBa3IvC7kdkh+MkepjFW45hmxQHUA/I+0w6CSCIwtqpvm4QUXx5Wq/cclQzfElQ+80o7t6WJpicA8m8zgorAlg1CzdYlFo+vdh8bHqkd9KhHih6sZ7A/FYB63dT
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DB5PR02MB1174;
X-MS-Office365-Filtering-Correlation-Id: 3a0a3b0a-12b2-4abb-a9fa-08d333c64348
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1174;
	20:TXbzOR0p9NzTxdW+Sx4eSmIbJOgqyew67xrfJ4cuLRLcpzyp1VxEYhW14ayt40tT1hiD1SOyJoLiFbcP9BkEBRTDfwKFe3EttvlrrWjeO1yxlhfkBSUwSAtLP9R+y6OB6xUrXNnkSV9NdHxbV9u5WmGC8ZA4pX+grELljyNJMOU6+FEfXxx0MYXHFkAA1HuNXMnH1wa/dPUpXEfAkMfgJkBCIUXpAyuTasTl4M8QDsTUOgVfCSKC15SGq3gc0jO1TJ9iufkt6nu5JOjwdVaUbUlMI4a/75RIEfnuY2MtIKoErtnH+3wOVYtN5sQ5vaTTVeRa735KBdZp+1tkBBYxE9POcw+uejHdj71wmUg8q2jlDu+5GWHlYO7F+l5B5YQsymqq4TB92D6w2wIjW0JMattOAWUQwBVvhJCHlYXz6Cj9FdMWKLfSI3IZjzhJx2SgGor+FcqtdrxAtTc3tDY7pUMpL4DHDCVrGEY5Jj3JIzTeyn3ImPrWeqXd3IE17zTK;
	4:7zpzN5KqNonheY5wfq0w/v2QQawooDrtpGTxG3GqKrdVxcYOR10j3eT1HyBmdSzh1zRipmWDOzgv2Bro5lnsZFUxL2XMvgh4RfrgwyIC/PD4ZcJvd3TQHgLRlPPcLcbIrxh64K8YXWAa++gW10TZJ7/S47/UBEh5cqQrmjcX2nhcglIJueWmKRXKGZ5WO2wjhE7D1OC+o3TL2yrUmrzc/blzSNgUfwLnV0rd6MUtOyuxwC99me8O16AHbwWHWIQdF8wtpD5yHdiCCSSdcPC/IIyZ6cmm/L2Z+0U5Q8x6RDJaqCSa90RvWtJ4YLsg0rJ8cS16EebX2gOY4dgRxdMf7/YzGVwp9SmLhylbcifMlrGMj8T6QH52lwmwXYvt43Zj
X-Microsoft-Antispam-PRVS: <DB5PR02MB11749F58672A8DCB00E7602790A90@DB5PR02MB1174.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(5005006)(3002001)(10201501046);
	SRVR:DB5PR02MB1174; BCL:0; PCL:0; RULEID:; SRVR:DB5PR02MB1174; 
X-Forefront-PRVS: 0850800A29
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(2906002)(50226001)(5001960100002)(36756003)(50466002)(5003940100001)(86362001)(42186005)(33646002)(586003)(1096002)(107886002)(5004730100002)(50986999)(6116002)(229853001)(3846002)(40100003)(77096005)(19580395003)(450100001)(48376002)(575784001)(2351001)(110136002)(122386002)(19580405001)(92566002)(66066001)(189998001)(5008740100001)(87976001)(47776003)(7099028);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DB5PR02MB1174; H:piippo.it.local;
	FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DB5PR02MB1174;
	23:p7ft7amNsTBfd8nVUIyRabhDohPvFsXjpKEaxKszj?=
	=?us-ascii?Q?uB4Cvy3un2rw0RoppEUOAhNSWaRzYOV4Qu0vQNLuF5e4W/Wiw1nGae+Sa2Ck?=
	=?us-ascii?Q?omqVpnnaSjLbjEtR6K7W1V2sdQ3SljFxniw3xfiE8OMvf87k6drLD8GBYedL?=
	=?us-ascii?Q?+ZkpThm1rmC4RLCXJXBADk9uc2OuTH6AzajE7h9D383u4usdSEETnF1rceV9?=
	=?us-ascii?Q?oI8nWmfwbEeP9p2gqx+sWBd3q1wCQawGX9u9KatFNAKeMPXrNQtstpT9cs5O?=
	=?us-ascii?Q?6fkNRxz44hh4FSVcnF/fujFXj2Cf5OtcUS02fNLPJC6hapL9gBps9So3zdpz?=
	=?us-ascii?Q?Cnj6/wrG9E73uDY1uiziwm5TIATtkE/mEmr5FFWN+aQaMojCgt0EGBR71yVZ?=
	=?us-ascii?Q?GUmhBl6KfhjcveLIhCQw47p8QLffVyUyY63pJl/x8GbvbSJVASOQpI2cI1DE?=
	=?us-ascii?Q?lWp0/p7gbauQWtDbYK6HJuHFsy23KWh9BMEMMa+8Ek2fMhatpHpqGfdyccgr?=
	=?us-ascii?Q?0YZw1zRjzjyZ0bkm9XJ3tYqiIKZVyrdWjM86wjXkuwyY1yqMFrMsdskS+SvF?=
	=?us-ascii?Q?v7cBpylN983BcSQ6txEb22+F6s6AesLvxFhefmubK4pkL0+v5SW1vekWonWY?=
	=?us-ascii?Q?t1xWEK63hlp7TdWJvHi8P0aTBgGewnflL2KM++ZW6YknhzOTPExqzOcQUdLQ?=
	=?us-ascii?Q?yspMf7LRdG1TRC1YqQgjNLKuut38dCduUv587hUj71OnvCDjT6YDdLYfA+PE?=
	=?us-ascii?Q?pfMn28kTt9ZFLN5oyUWCvj/XHSjItaVrelZa6swtFM505TDgXqkQnvNFAAJu?=
	=?us-ascii?Q?YSAQBDBtngDmd6+Pz3VqNJeeUEK939mLvQeN4IQk067O2jpnRq27Cxs03t2j?=
	=?us-ascii?Q?NBL6KgT/A3P6jwWO+nLGabenGD6+FMGwCF8fzTNWIP1fIXYe1jlN+DsOOEgG?=
	=?us-ascii?Q?MlBdAZ5DOyxmZ3kEJxt3JMeLyOOxZeVvrZJEADPfA=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1174;
	5:7SGYnmdoR+Vla5f+uUjZc1vD6LETW6htp4+ImPyrDgfUe3v3A8w8lX/TvuOUCUT3oFN83wbJadpTmzwnFd6jDDfmWAMG0JIeSJX/T9M/cNgxhqegG0g4taibvG79nqKZMEjqQXSAqyTTD6wAc0SPag==;
	24:gGUJAInyGWCIyCphbH6DUNqVKDMgqNYSy0xUdRxIfkDYDuKJp+5dC3hJyUjEJ+uZt4eUASG0FeRuRpOyecvlVBWLQvTZojiQ3IihlV1QNjw=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: theqtcompany.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2016 16:05:01.1936 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR02MB1174
Subject: [meta-qt5][PATCH] qt5: add Qml support to lupdate
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
X-List-Received-Date: Fri, 12 Feb 2016 16:19:33 -0000
Content-Type: text/plain

Add dependency to qtdeclarative to qttools' native and nativesdk builds.
This gives us lupdate with a support for Qml files. The nativesdk builds
of qtdeclarative depend on more modules (Xml, Sql) from nativesdk-qtbase,
so preserve all libs that are already built. This brings few extra libs
to the package that might not be needed, but keeps the recipe simpler.

Signed-off-by: Samuli Piippo <samuli.piippo@theqtcompany.com>
---
 .../nativesdk-packagegroup-qt5-toolchain-host.bb      |  2 +-
 recipes-qt/qt5/nativesdk-qtbase_git.bb                | 19 ++-----------------
 recipes-qt/qt5/qttools_git.bb                         |  3 +--
 3 files changed, 4 insertions(+), 20 deletions(-)

diff --git a/recipes-qt/packagegroups/nativesdk-packagegroup-qt5-toolchain-host.bb b/recipes-qt/packagegroups/nativesdk-packagegroup-qt5-toolchain-host.bb
index 4cc0b93..71746f0 100644
--- a/recipes-qt/packagegroups/nativesdk-packagegroup-qt5-toolchain-host.bb
+++ b/recipes-qt/packagegroups/nativesdk-packagegroup-qt5-toolchain-host.bb
@@ -9,6 +9,6 @@ PACKAGEGROUP_DISABLE_COMPLEMENTARY = "1"
 
 RDEPENDS_${PN} += " \
     nativesdk-packagegroup-sdk-host \
-    nativesdk-qttools \
+    nativesdk-qttools-tools \
     nativesdk-qtbase-tools \
 "
diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
index 3d4900e..4ac80be 100644
--- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
+++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
@@ -49,6 +49,7 @@ PACKAGE_DEBUG_SPLIT_STYLE = "debug-without-src"
 FILES_${PN}-tools-dev = " \
     ${includedir} \
     ${FILES_SOLIBSDEV} ${libdir}/*.la \
+    ${libdir}/*.prl \
     ${OE_QMAKE_PATH_ARCHDATA}/mkspecs \
 "
 
@@ -201,16 +202,6 @@ do_configure() {
     bin/qmake ${OE_QMAKE_DEBUG_OUTPUT} ${S} -o Makefile || die "Configuring qt with qmake failed. EXTRA_OECONF was ${EXTRA_OECONF}"
 }
 
-# Set the EXTRA_QTLIB variable to e.g. Xml, in order to not remove libQt5Xml.so.*
-EXTRA_QTLIB ?= ""
-
-python __anonymous () {
-    templibs = ""
-    for e in d.getVar("EXTRA_QTLIB", True).split():
-        templibs = "%s -not -name 'libQt5%s.so*' -and" % (templibs, e)
-    d.setVar("QTLIBSPRESERVE", templibs)
-}
-
 do_install() {
     # Fix install paths for all
     find -name "Makefile*" | xargs sed -i "s,(INSTALL_ROOT)${STAGING_DIR_NATIVE}${STAGING_DIR_NATIVE},(INSTALL_ROOT)${STAGING_DIR_NATIVE},g"
@@ -223,17 +214,11 @@ do_install() {
     # e.g. qt3d, qtwayland
     ln -sf syncqt.pl ${D}${OE_QMAKE_PATH_QT_BINS}/syncqt
 
-    # remove things unused in nativesdk, we need the headers, Qt5Core
-    # and Qt5Bootstrap.
+    # remove things unused in nativesdk, we need the headers and libs
     rm -rf ${D}${datadir} \
            ${D}/${OE_QMAKE_PATH_PLUGINS} \
            ${D}${libdir}/cmake \
            ${D}${libdir}/pkgconfig
-    find ${D}${libdir} -maxdepth 1 -name 'lib*' -and -not -type d -and \
-                                   -not -name 'libQt5Core.so*' -and \
-                                   ${QTLIBSPRESERVE} \
-                                   -not -name 'libQt5Bootstrap.a' \
-                                   -exec rm '{}' ';'
 
     # Install CMake's toolchain configuration
     mkdir -p ${D}${datadir}/cmake/OEToolchainConfig.cmake.d/
diff --git a/recipes-qt/qt5/qttools_git.bb b/recipes-qt/qt5/qttools_git.bb
index 5ee1e86..8c22e75 100644
--- a/recipes-qt/qt5/qttools_git.bb
+++ b/recipes-qt/qt5/qttools_git.bb
@@ -10,8 +10,7 @@ LIC_FILES_CHKSUM = " \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
 "
 
-DEPENDS += "qtbase"
-DEPENDS_class-target = "qtdeclarative qtxmlpatterns"
+DEPENDS += "qtbase qtdeclarative qtxmlpatterns"
 
 SRC_URI += " \
     file://0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch \
-- 
1.9.1


