Return-Path: <mikko.gronoff@qt.io>
X-Greylist: delayed 41711 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 25 Oct 2016 21:42:37 UTC
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
	(mail-he1eur01on0100.outbound.protection.outlook.com [104.47.0.100])
	by mail.openembedded.org (Postfix) with ESMTP id 1D45360190
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Oct 2016 21:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=qtcompany.onmicrosoft.com; s=selector1-qt-io;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=oJpk2zVVyQbMcc2uYdXLkslk5AZN4wqNnAmskt+andk=;
	b=Xm/oSctuWnJ2LSf/HdJWG1jMMkxnVXJtOEwhTHFnIu7QI9nIdqgy+ziQ5IocuTON8RaqzClGkKExDr0h/UceHh87lzh1KiMoc8I1d27BflmSYJvYz21dJ27fSwE9tkBUamg8gkdwBTaQLArW79lNAZ7e2YU6yj38s7lGAWC3IuY=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mikko.gronoff@qt.io; 
Received: from qt.intra.qt (192.89.120.53) by
	HE1PR0201MB2169.eurprd02.prod.outlook.com (10.168.30.144) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.669.16; Tue, 25 Oct 2016 10:07:26 +0000
From: Mikko Gronoff <mikko.gronoff@qt.io>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 25 Oct 2016 13:07:00 +0300
Message-ID: <1477390020-24418-1-git-send-email-mikko.gronoff@qt.io>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [192.89.120.53]
X-ClientProxiedBy: AM5PR0701CA0023.eurprd07.prod.outlook.com (10.168.161.33)
	To HE1PR0201MB2169.eurprd02.prod.outlook.com (10.168.30.144)
X-MS-Office365-Filtering-Correlation-Id: 72cd9ff4-baee-43bb-d045-08d3fcbeb8db
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0201MB2169;
	2:+KkWA+jJR3gKufzAiYOaua/nuTyY6QRhPIa0N8wJA0goTYlGEzJH26M/9wXBbk01LFYKHrh7qr4Q2Wnizb0UwxjuHvHem9iBJvtrkcttdPpMRMswWR9Z9FQzv1ezSWZmZICmQdFOBeoRtCEQzIALJyqoAq+8lC4ayoK9sgSj76bwnTo8O8sNTTpDOgSDc4Clu8u4JIlKtqm/Rxnb1xrUoQ==;
	3:NGrMSIqp8v8jvR9qLWBmX10uTf76slzz4dBIPrc/i/WKdFhprnvSxZhFfjBlaXch3UX004P4Onlb/WIeqe/DaLyqIlW3nOPt/LIA6wZJzuQhu77fC73TiCfd0KH9Cwf2dgHJaz5gpnKkQVnDNZY3jg==;
	25:JoNu6IssRNU5gkfNltQOsydEUKMN9Wnn4hkBcXzQQx6n1wJBKz+tP6IpQrx5df8UbO/Jwfj21LSR21wn7wWSZ50+XEIwN0tNQM7XRIo5RaamgYkLnXKgTDxLQncmeSX/lF7UD152GGbnL52uwG0IvjUHygntEiA3f7a3dSe2KViFduDovQAFxFnASu3Ok6FavbxDXv5Fh+BVGnAYFozr3GLgTpWC4WOOuQVlAsaTrAFR+h0dNTCuVZXLhlJKrnmLphWOG2PWFVeomRSIYNkiMTO1GaCJzxsf+rsoHzbXhB1LAMwGuhnYKce0/24z2x6qmLQTVcjHDR9JbLMppewBVzaObjIrzVXCUgrxrk1JJemqeJxVjpQhn+2wyzsCx0wj6Fe4LqurAkI4Xkn8xjacoR3Q7Orxe+SPfRb6fz87hsd+Ry35hsQqjorh+1KFZvIs
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:HE1PR0201MB2169;
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0201MB2169;
	31:2T9ufKYKITQiPSnq6/THXGC2P+vQ8+zjp11FHiopvxOAGld01LR/eBkjOKJBBGGWGHBAHfcGNhw6Cv87hD9FpPXESg8eN2jIl7V2q7FiWhxdpp4AiNZ+Kdv2CNzS8YRfmfEvQgyWAS/r3St+A1cOq/J1wxJ3u27YABQYkhU2Ei9+Ztg85rv40VmuCmIIeEl8ArnF/8PEKQzPQQk9Bse5bpWOhBVgM3U0DV67j1jcLPlBB3es1eQ8w5auQhKZK3dU1A9zGEc3srMJ4HlHXSAiYw==;
	20:wV3y0OeCgbfijRfSar7KGyZ7bL3+qL0dZ/UH8XZ6h/BeH48/tWrtYd9le9ottEkCm0QURV+bDGZB6ncb34ClPeDbisjRXWu9GweANndJRNIqAFNvZ4mI9ZgIc8psBNuC9P7mtkWmkJE/pY50udhSGBFdr0Zmv9IIg5EYnxj8llgOP6zoQyUIHHAyy8OJeH62nFKmiP5jGu9HNC4dUIoLh8wdxFPtdXBCWBSqCJeHlM21pf6c2pDB2wvravPp7mWL
X-Microsoft-Antispam-PRVS: <HE1PR0201MB21694174AA6AE098169D8EF7E9A80@HE1PR0201MB2169.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(788757137089)(228905959029699);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(8121501046)(5005006)(3002001)(10201501046)(6043046)(6042046);
	SRVR:HE1PR0201MB2169; BCL:0; PCL:0; RULEID:;
	SRVR:HE1PR0201MB2169; 
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0201MB2169;
	4:/tBlCjlUAe1afoBLO2Vxx1dCp5gPCXHnN67khe2mdEo3QMi98wTb2F2bmvNsorGb9Id6++LLLWLbmFe+d9Tvrbe9w9HHb527kNyhAaEDloYDQ9anZ47mgnMUUTldDeX1WSUAiKaRCWIAjJGUGW+M50hnXUIvgz800mBGOtMivppscwrCDxWi/meZoVTYesoycuMMnJ4NiPyEN1Lgh7cZb/UwnTLHXF+321WRw/4l+d1FZELHEIhCElsilFoQAoxAvFZBaifcX+S0azAcW0fsdJ+exkynfyeV6BYjB+IekXYmk7oVT6PSOVBEmsBD7NNEcDekM9HW5Qpy4NNHTz3w7MU20MkLUJFPY84Zj49WgGnYHSYyuheS7nJyKCJ1K4PJYoObFED004nybtgvnwpmMfdRRGExK8Xzeqf6I3ZvIXVGV0BVbx3MFUuvVYAmJoToJx/DsSKX5MolnCPH4olVKvZXx7PsAWHuD8gBYsqvHSOOluObLIOpHPTiC7jw20k96db+/WvKLH5H44+4XMEGqg==
X-Forefront-PRVS: 01068D0A20
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(6009001)(7916002)(199003)(189002)(69596002)(53416004)(3846002)(586003)(86362001)(575784001)(68736007)(5660300001)(8676002)(74482002)(42186005)(5003940100001)(50226002)(47776003)(36756003)(66066001)(110136003)(50466002)(101416001)(6666003)(77096005)(97736004)(106356001)(33646002)(450100001)(2351001)(229853001)(105586002)(48376002)(189998001)(7736002)(2906002)(81166006)(19580405001)(81156014)(305945005)(7846002)(15650500001)(92566002)(50986999)(6116002)(4326007)(19580395003)(6916009)(357404004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:HE1PR0201MB2169; H:qt.intra.qt;
	FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: qt.io does not designate permitted
	sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; HE1PR0201MB2169;
	23:+cXA21wDJ/GNIMv7L/u26eYnBF4rF7g6/fE86YX?=
	=?us-ascii?Q?B03KDrb0gqKZd8tIUpAIly4e3PbZP3/dsYmo9RHaHgpgRHDjLZkdyOe2yfEh?=
	=?us-ascii?Q?Bgf2PNZHjLwtaNd8MIyVVmy9ikkiPJaLelE5jdLUpZjzGCnq6wOrECfCN0lW?=
	=?us-ascii?Q?pSW5Ji0/XSjQSEjQzD/13LaQyBvoKxHAg52NoTtORLea2b0xDTphvoeCvYWK?=
	=?us-ascii?Q?/dxKrrcOcb/2B6hxEY7DAWY6H1Zw1oKbzkwNMIo5x7FGb7PbGwu4yTjhWOKg?=
	=?us-ascii?Q?t+k5E8xBLSdEdT0CjlYPRAa7u2g/66zKWwuaqch24FTVvTOSuXij419tewKc?=
	=?us-ascii?Q?w7YBceo5ZWed1tzxyydIOkJUtTO1nJsIGSeEpxvuEVK4+H63EVj7+ra/jaRH?=
	=?us-ascii?Q?BoUSc0m+5PuoYFjaWyB1rr8eyD+KmFl1rkQ8HLgOdjqEdki9OSM5H5j6subS?=
	=?us-ascii?Q?eMFnqdY4B6qrcMUcmMZZJhlVCV7MiA6rJKYaZj+4K24TCXWbDQQaOEAkjo1q?=
	=?us-ascii?Q?ApBS+nOlpKyfAbZe1DhM+k5BzXoPB14SCdbhu1AninyD2gyGl9hx1zeXYIwk?=
	=?us-ascii?Q?D3qyvyIP1wxdd9SP/jeZOCHUX1mcpFihcgDEAbvsK4vQDDGq575e76GTcjoH?=
	=?us-ascii?Q?xEp1Za0YPua9oleG3s8/cd0QIT7J1l7cKY1A4abiv0kfGsXR8LiO5SHYjzj2?=
	=?us-ascii?Q?H7Cj6nJUHwjOJXSLCX/xX/fy3817teC2rsoc8xPA+Si9WfZlXsxFerxioDXg?=
	=?us-ascii?Q?bt07XZ3ZMOHtmz3xXdLwaNTZMEMMck5b2CQxF08Dlapexl7/6B3tp69Pn8eO?=
	=?us-ascii?Q?fJhoACggHrALcmjSZlFAPoQ+y6vzofAlCs2f1YTZzPrXbZKs028dC5jQDdNF?=
	=?us-ascii?Q?H3cRC/yAz9RhagOozTUS4HcLchQs7n8Of2PfgvVgNKYUG2NxptECuYBlpmA3?=
	=?us-ascii?Q?hMV8b9/wtePEzgSW4SMdMI/u2okXSkRAM41nWqViejeyAdqEtjiLk2X9v0S1?=
	=?us-ascii?Q?xQnHsz9bWOkw41Xc6vkSr68Fdul3FH5Pxwiza8Hf2U3M5JKFxE4hd6I2m05S?=
	=?us-ascii?Q?lqRS74DB4uaeA2x2VVqgusAGNDLV5tV7Rf9d8/SRCISsgU1FlYy14D7ZAdtO?=
	=?us-ascii?Q?H9h1bKPwIG91AGKo23er5VC6Iax8aom+puMJfSPksdukooGzY+0H3jIgvVK5?=
	=?us-ascii?Q?RK6K+HIBty2UQj3EI/WDpqhzbV2uPtT5MubUr?=
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0201MB2169;
	6:sgjRwlJGJQXAvZK9qTdYxr4tPkPVqC6nOB3VxptQ8AAZv6uctRtAhNZZD2z2VqPsd4PEuePZJ++9UKNtPVD24Jza0KgwqPi9GoCaPYcIuR3rTZUcwIeHJ4GhoHyRWlCANmoweL0dG0f8dc5hUlPMKs13Lkd8TUrqKwJkOAx1WeiDiyWj7FllVDB8PPYYvqdx2s0RUC/igCL7z99Pp7LdpWDJxrbt5+AhM4RX/ArUP+2WgeU+pBWPPw7RVzpkTyNsD3py2hxibHmLKUTP9IQbOC8XjUgFUoWggkxeKhbmhgCt+0i3yLe7Xu2Vo0qlKA9gnZvjump4RhuowbvXlLUBYA==;
	5:w39Hv2zJ+yBaiacBsqGHavOfYxV2UmBqaCNeMqbxi2f+OWXVOMEYD9S5SsCJS3vRd/SMTo4NjF+yb87JLuZ1jz8LYqOWHGnVP7lVLVhOdAPNGSd0luFqWy2iy2tLz2NgW6qyVcQ5SFC3vzzoGvrJ7d+csr9K8L5i0OJXCy/qpNs=;
	24:VJbvtbEKsVXy6tBaeera7sdlWsmbje0MntKeNWIs6vfQZIoMRhGP+iZcDR/s/whs7UbLR2Yzg3bjWY0L3w5tqGExa/UDB2Jsq2A1Hc7z5QI=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0201MB2169;
	7:DN9lVNS9Z9JAATjPPkUkGL7ttMPhbbuN7w0MFoNRrTNsGKmuHP5dZtwb2psLkWnk4wla8EzRigDU8qk6WEGLVCUXv8/7DH2QbMZOHz/9IX+zbn5uy++EXm2MNVvtJDVOCFj29rD53QhA9Fsnn/0QIH/W08OSyq0ib02dQpvmVCkoliA+cubhG0aSpVKNPq+fUzg5HTd21iFEkr3Qo432uLFu4JX/U5pxfIVSOy6nUI9ZMBpGb07CFAuYK9njR2CaWt57ICsb3tCxYt6HBTc5/nO3uoiEALfoin+5wtYfKhvtqGv6hMYyIa8Q74V4c5cqTjstAv2pCqCvvxsVcLvl2Eq7h8zJ/STe+oDrYhOY7VE=
X-OriginatorOrg: qt.io
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2016 10:07:26.1708 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0201MB2169
Subject: [meta-qt5][krogoth][PATCH] qt5: update submodules
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
X-List-Received-Date: Tue, 25 Oct 2016 21:42:40 -0000
Content-Type: text/plain

Update submodule SCREVs to Qt 5.6.2 release

Signed-off-by: Mikko Gronoff <mikko.gronoff@qt.io>
---
 recipes-qt/qt5/nativesdk-qtbase_git.bb             |  2 +-
 recipes-qt/qt5/qt3d_git.bb                         |  2 +-
 recipes-qt/qt5/qt5-git.inc                         |  2 +-
 recipes-qt/qt5/qtbase-native_git.bb                |  2 +-
 recipes-qt/qt5/qtbase_git.bb                       |  2 +-
 recipes-qt/qt5/qtcanvas3d_git.bb                   |  2 +-
 recipes-qt/qt5/qtconnectivity_git.bb               |  2 +-
 ...crashes-in-QtQml-code-related-to-dead-sto.patch | 44 ----------------------
 recipes-qt/qt5/qtdeclarative_git.bb                |  3 +-
 recipes-qt/qt5/qtimageformats_git.bb               |  2 +-
 recipes-qt/qt5/qtlocation_git.bb                   |  2 +-
 recipes-qt/qt5/qtmultimedia_git.bb                 |  2 +-
 recipes-qt/qt5/qtquick1_git.bb                     |  2 +-
 recipes-qt/qt5/qtquickcontrols2_git.bb             |  2 +-
 recipes-qt/qt5/qtquickcontrols_git.bb              |  2 +-
 recipes-qt/qt5/qtsensors_git.bb                    |  2 +-
 recipes-qt/qt5/qtserialport_git.bb                 |  2 +-
 recipes-qt/qt5/qttools_git.bb                      |  2 +-
 recipes-qt/qt5/qttranslations_git.bb               |  2 +-
 recipes-qt/qt5/qtwayland-native_git.bb             |  2 +-
 recipes-qt/qt5/qtwayland_git.bb                    |  2 +-
 recipes-qt/qt5/qtwebengine_git.bb                  |  4 +-
 recipes-qt/qt5/qtwebkit_git.bb                     |  2 +-
 recipes-qt/qt5/qtwebsockets_git.bb                 |  2 +-
 recipes-qt/qt5/qtxmlpatterns_git.bb                |  2 +-
 25 files changed, 25 insertions(+), 70 deletions(-)
 delete mode 100644 recipes-qt/qt5/qtdeclarative/0003-Workaround-crashes-in-QtQml-code-related-to-dead-sto.patch

diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
index ee65b07..bcaa890 100644
--- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
+++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
@@ -258,4 +258,4 @@ fakeroot do_generate_qt_environment_file() {
 
 addtask generate_qt_environment_file after do_install before do_package
 
-SRCREV = "7bf002c3b3f8009138fca217c7fa0c234aed21bd"
+SRCREV = "b4ada3f0d8feed7dbff22aa780d38ab126020ac6"
diff --git a/recipes-qt/qt5/qt3d_git.bb b/recipes-qt/qt5/qt3d_git.bb
index 1b48caf..7b289da 100644
--- a/recipes-qt/qt5/qt3d_git.bb
+++ b/recipes-qt/qt5/qt3d_git.bb
@@ -27,6 +27,6 @@ FILES_${PN}-qmlplugins += " \
     ${OE_QMAKE_PATH_QML}/*/*/*.obj \
 "
 
-SRCREV = "7fab1fa65675dfd62b1ddf6fed3226e465b37b67"
+SRCREV = "d3889211dc245d44dab25dcc9fbbc4b57e92ac33"
 
 BBCLASSEXTEND += "native nativesdk"
diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
index 30c534e..c5795ed 100644
--- a/recipes-qt/qt5/qt5-git.inc
+++ b/recipes-qt/qt5/qt5-git.inc
@@ -11,4 +11,4 @@ SRC_URI = " \
 
 S = "${WORKDIR}/git"
 
-PV = "5.6.1+git${SRCPV}"
+PV = "5.6.2+git${SRCPV}"
diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
index 23fe64a..efce827 100644
--- a/recipes-qt/qt5/qtbase-native_git.bb
+++ b/recipes-qt/qt5/qtbase-native_git.bb
@@ -117,4 +117,4 @@ do_install() {
     ln -sf syncqt.pl ${D}${OE_QMAKE_PATH_QT_BINS}/syncqt
 }
 
-SRCREV = "7bf002c3b3f8009138fca217c7fa0c234aed21bd"
+SRCREV = "b4ada3f0d8feed7dbff22aa780d38ab126020ac6"
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index e532cdd..963cd49 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -265,4 +265,4 @@ sysroot_stage_dirs_append() {
     rm -rf $to${OE_QMAKE_PATH_QT_FONTS}
 }
 
-SRCREV = "7bf002c3b3f8009138fca217c7fa0c234aed21bd"
+SRCREV = "b4ada3f0d8feed7dbff22aa780d38ab126020ac6"
diff --git a/recipes-qt/qt5/qtcanvas3d_git.bb b/recipes-qt/qt5/qtcanvas3d_git.bb
index c7ec72a..8025178 100644
--- a/recipes-qt/qt5/qtcanvas3d_git.bb
+++ b/recipes-qt/qt5/qtcanvas3d_git.bb
@@ -10,4 +10,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS = "qtdeclarative"
 
-SRCREV = "95884805facd1721eea025467afd85ed64a70504"
+SRCREV = "85fe2daab5ed14655b456df8821c9f5f606fdc12"
diff --git a/recipes-qt/qt5/qtconnectivity_git.bb b/recipes-qt/qt5/qtconnectivity_git.bb
index 94c331b..3252411 100644
--- a/recipes-qt/qt5/qtconnectivity_git.bb
+++ b/recipes-qt/qt5/qtconnectivity_git.bb
@@ -25,4 +25,4 @@ do_configure_prepend() {
     sed -i 's/^qtCompileTest(bluez)/OE_BLUEZ_ENABLED:qtCompileTest(bluez)/g' ${S}/qtconnectivity.pro
 }
 
-SRCREV = "71a0d199a29001cc31bfde15aabcc53cf88aae1e"
+SRCREV = "bd7649557e99be543b78492d96bb2982e0a3e4c4"
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
index aabadc0..0649ecd 100644
--- a/recipes-qt/qt5/qtdeclarative_git.bb
+++ b/recipes-qt/qt5/qtdeclarative_git.bb
@@ -16,7 +16,6 @@ DEPENDS += "qtbase"
 SRC_URI += " \
     file://0001-qmltestexample-fix-link.patch \
     file://0002-qquickviewcomparison-fix-QCoreApplication-has-not-be.patch \
-    file://0003-Workaround-crashes-in-QtQml-code-related-to-dead-sto.patch \
 "
 
 EXTRA_OEMAKE += "QMAKE_SYNCQT=${STAGING_BINDIR_NATIVE}${QT_DIR_NAME}/syncqt"
@@ -35,6 +34,6 @@ do_configure_prepend() {
 
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'qtxmlpatterns', 'CONFIG+=OE_QTXMLPATTERNS_ENABLED', '', d)}"
 
-SRCREV = "a05f59388e004160899d5d311884cfabe10c3b8c"
+SRCREV = "c1d726fe19c83cf081042e55ace9d9d7b31c40e6"
 
 BBCLASSEXTEND =+ "native nativesdk"
diff --git a/recipes-qt/qt5/qtimageformats_git.bb b/recipes-qt/qt5/qtimageformats_git.bb
index 37e1f40..e7bce9d 100644
--- a/recipes-qt/qt5/qtimageformats_git.bb
+++ b/recipes-qt/qt5/qtimageformats_git.bb
@@ -28,4 +28,4 @@ EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'jasper', 'CONFIG+
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'libtiff', 'CONFIG+=OE_LIBTIFF_ENABLED', '', d)}"
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'libwebp', 'CONFIG+=OE_LIBWEBP_ENABLED', '', d)}"
 
-SRCREV = "99f384ac2353df89a1522e47c96cae6a945749e1"
+SRCREV = "d7bdc138b89bf0c52ba9ddf22b34d2ccd06b3936"
diff --git a/recipes-qt/qt5/qtlocation_git.bb b/recipes-qt/qt5/qtlocation_git.bb
index 59be91f..80d7699 100644
--- a/recipes-qt/qt5/qtlocation_git.bb
+++ b/recipes-qt/qt5/qtlocation_git.bb
@@ -29,4 +29,4 @@ do_configure_prepend() {
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'geoclue', 'CONFIG+=OE_GEOCLUE_ENABLED', '', d)}"
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'gypsy', 'CONFIG+=OE_GYPSY_ENABLED', '', d)}"
 
-SRCREV = "04762a9eecafc80ebeb90c06258de551d451497f"
+SRCREV = "7d01112c36a98912706e9d33ce2e36126de0ccec"
diff --git a/recipes-qt/qt5/qtmultimedia_git.bb b/recipes-qt/qt5/qtmultimedia_git.bb
index 71e78ab..8e3da52 100644
--- a/recipes-qt/qt5/qtmultimedia_git.bb
+++ b/recipes-qt/qt5/qtmultimedia_git.bb
@@ -35,4 +35,4 @@ SRC_URI += "\
      file://0001-Initial-porting-effort-to-GStreamer-1.0.patch \
 "
 
-SRCREV = "d7d31d63db5f0029a4a5e24d998601baee8bade0"
+SRCREV = "20686cb51fb2dfa5973d636875e9fc20c2bde4f5"
diff --git a/recipes-qt/qt5/qtquick1_git.bb b/recipes-qt/qt5/qtquick1_git.bb
index a2163ff..6c2d309 100644
--- a/recipes-qt/qt5/qtquick1_git.bb
+++ b/recipes-qt/qt5/qtquick1_git.bb
@@ -26,4 +26,4 @@ do_configure_prepend() {
     sed -i 's#^qtHaveModule(webkitwidgets):#qtHaveModule(webkitwidgets):!contains(CONFIG, noqtwebkit):#g' ${S}/src/imports/imports.pro
 }
 
-SRCREV = "e90625f00a3727ca1c89a94407b7686327d03c19"
+SRCREV = "5eab543c5c955f5057225b9bdb6b2757516dbd3e"
diff --git a/recipes-qt/qt5/qtquickcontrols2_git.bb b/recipes-qt/qt5/qtquickcontrols2_git.bb
index 66ec15e..32053e4 100644
--- a/recipes-qt/qt5/qtquickcontrols2_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols2_git.bb
@@ -12,4 +12,4 @@ DEPENDS += "qtdeclarative"
 
 FILES_${PN}-qmlplugins += "${libdir}/qt5/qml/Qt"
 
-SRCREV = "eed9b9dd83f0db9cbfe794072d8f5147e3d1234a"
+SRCREV = "e93c73c0aa15cd973e008a04a70a7c69719ad244"
diff --git a/recipes-qt/qt5/qtquickcontrols_git.bb b/recipes-qt/qt5/qtquickcontrols_git.bb
index 42d504e..aeaa967 100644
--- a/recipes-qt/qt5/qtquickcontrols_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols_git.bb
@@ -17,4 +17,4 @@ SRC_URI += " \
     file://0001-texteditor-fix-invalid-use-of-incomplete-type-class-.patch \
 "
 
-SRCREV = "84a26f223b220a444dec2b43fffc71dab7e00d1d"
+SRCREV = "59c6c0e0b1b5b46747595a58e11311b7393d7e70"
diff --git a/recipes-qt/qt5/qtsensors_git.bb b/recipes-qt/qt5/qtsensors_git.bb
index e599617..345c5cb 100644
--- a/recipes-qt/qt5/qtsensors_git.bb
+++ b/recipes-qt/qt5/qtsensors_git.bb
@@ -14,4 +14,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative"
 
-SRCREV = "8b79fc4ee1c0510c13dc6f1494f37727e3f8c0cf"
+SRCREV = "922c2bb671c113b7e481fb86f823188b4bce1d3e"
diff --git a/recipes-qt/qt5/qtserialport_git.bb b/recipes-qt/qt5/qtserialport_git.bb
index 10780be..fdcba1e 100644
--- a/recipes-qt/qt5/qtserialport_git.bb
+++ b/recipes-qt/qt5/qtserialport_git.bb
@@ -15,4 +15,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "133dbd59fb04974149d2140b267fce91a7cfd4a2"
+SRCREV = "46ef9fdc130a06bd80c5c004f0dc95c473f704c8"
diff --git a/recipes-qt/qt5/qttools_git.bb b/recipes-qt/qt5/qttools_git.bb
index 87854af..0e7b669 100644
--- a/recipes-qt/qt5/qttools_git.bb
+++ b/recipes-qt/qt5/qttools_git.bb
@@ -31,6 +31,6 @@ PACKAGECONFIG[qtwebkit] = ",,qtwebkit"
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'qtwebkit', '', 'CONFIG+=noqtwebkit', d)}"
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'linguistonly', 'CONFIG+=linguistonly', '', d)}"
 
-SRCREV = "bda7ece99a8162118a91e9f475c149be39846ecd"
+SRCREV = "a9e5e09f156b09c7f65e0b57fe191d71f9c1aa3e"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/recipes-qt/qt5/qttranslations_git.bb b/recipes-qt/qt5/qttranslations_git.bb
index 5e11d24..5995c99 100644
--- a/recipes-qt/qt5/qttranslations_git.bb
+++ b/recipes-qt/qt5/qttranslations_git.bb
@@ -114,4 +114,4 @@ FILES_${PN}-qt = " \
     ${OE_QMAKE_PATH_TRANSLATIONS}/qt_*.qm \
 "
 
-SRCREV = "4925f90e9ceb0b4081649d1fc1eec10beb65f722"
+SRCREV = "225e1740fec4559bf8d66d915ddd06b9d4f48119"
diff --git a/recipes-qt/qt5/qtwayland-native_git.bb b/recipes-qt/qt5/qtwayland-native_git.bb
index 8fc1862..7c0a514 100644
--- a/recipes-qt/qt5/qtwayland-native_git.bb
+++ b/recipes-qt/qt5/qtwayland-native_git.bb
@@ -25,4 +25,4 @@ do_install() {
     oe_runmake install INSTALL_ROOT=${D}
 }
 
-SRCREV = "d8b4bef3ddff327598027c8f94a61e3d0b61a2dd"
+SRCREV = "82e11583928d47576c160d35c9df05c0eec34df8"
diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_git.bb
index 3153dc0..d349cc3 100644
--- a/recipes-qt/qt5/qtwayland_git.bb
+++ b/recipes-qt/qt5/qtwayland_git.bb
@@ -36,4 +36,4 @@ SRC_URI += " \
     file://0001-examples-wayland-include-server-buffer-only-when-bui.patch \
 "
 
-SRCREV = "d8b4bef3ddff327598027c8f94a61e3d0b61a2dd"
+SRCREV = "82e11583928d47576c160d35c9df05c0eec34df8"
diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index 28b9fe6..8f307aa 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -119,10 +119,10 @@ SRC_URI += " \
     file://0002-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch \
 "
 
-SRCREV_qtwebengine = "808ca6e6917cf17e4c30fcd3ac609164b36594cc"
+SRCREV_qtwebengine = "ec84507898e58a167b185ba674acf300cc695380"
 # This is in git submodule, but we're using latest in 45-based
 # SRCREV_chromium = "79930a541473b2e0f950d040c16ab6f22e4aeef3"
-SRCREV_chromium = "9d6566ee193e8996fb867cf776dc13f697400f24"
+SRCREV_chromium = "4d61c01b71fcbe706ea4220d33294d4f5600ca31"
 SRCREV = "${SRCREV_qtwebengine}"
 
 SRCREV_FORMAT = "qtwebengine_chromium"
diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/qtwebkit_git.bb
index c71850a..d679994 100644
--- a/recipes-qt/qt5/qtwebkit_git.bb
+++ b/recipes-qt/qt5/qtwebkit_git.bb
@@ -71,4 +71,4 @@ PACKAGES_remove = "${PN}-examples-dev ${PN}-examples-staticdev ${PN}-examples-db
 RUBY_SYS = "${@ '${BUILD_SYS}'.replace('i486', 'i386').replace('i586', 'i386').replace('i686', 'i386') }"
 export RUBYLIB="${STAGING_DATADIR_NATIVE}/rubygems:${STAGING_LIBDIR_NATIVE}/ruby:${STAGING_LIBDIR_NATIVE}/ruby/${RUBY_SYS}"
 
-SRCREV = "a6c9dd667d534d3342bfba456f9d5c146a924de0"
+SRCREV = "bb43bca1664721401c3a2c25b585913bb5e8cb4f"
diff --git a/recipes-qt/qt5/qtwebsockets_git.bb b/recipes-qt/qt5/qtwebsockets_git.bb
index 04f762e..c71a69f 100644
--- a/recipes-qt/qt5/qtwebsockets_git.bb
+++ b/recipes-qt/qt5/qtwebsockets_git.bb
@@ -11,4 +11,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative"
 
-SRCREV = "e66dcd51d0e5517e88cd59912fd08501522a2902"
+SRCREV = "ef7b03e3e5e20f89963bae799f7ecb753f332c34"
diff --git a/recipes-qt/qt5/qtxmlpatterns_git.bb b/recipes-qt/qt5/qtxmlpatterns_git.bb
index e6962a6..f715f1e 100644
--- a/recipes-qt/qt5/qtxmlpatterns_git.bb
+++ b/recipes-qt/qt5/qtxmlpatterns_git.bb
@@ -13,6 +13,6 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "c0b6fbcadbefcc8a91e5db7fd98662dddcd7a0f8"
+SRCREV = "074571305e45d30066b199641eb5d0866e3b0a92"
 
 BBCLASSEXTEND =+ "native nativesdk"
-- 
2.7.4


