Return-Path: <samuli.piippo@qt.io>
X-Greylist: delayed 9080 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 14 Dec 2017 17:11:27 UTC
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
	(mail-he1eur01on0113.outbound.protection.outlook.com [104.47.0.113])
	by mail.openembedded.org (Postfix) with ESMTP id 7F43D7875C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Dec 2017 17:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=qtcompany.onmicrosoft.com; s=selector1-qt-io;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=xqNcaROEi7bhb/9DZ8dLvLeRh7agQyAM/c0Izt/RxUE=;
	b=k0exoYYuAAiTzJTKbY0Zw4uTV8zYW/IPWQiPEsw4TUJ/FGCFE8bjf7nLi2lp8DhB0n3v8qQYJjI7vKon0CJK5bG3A0Lr/VkD1gOCg3J5CfvjnFMr01Fw6/8mAXl170L1ZsxhqTd7bpIz77aB7CJhcnT8n/0ND/k+2KAIlm5C8Gs=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=samuli.piippo@qt.io; 
Received: from piippo.intra.qt (192.89.120.53) by
	HE1PR0202MB2586.eurprd02.prod.outlook.com (2603:10a6:3:90::15) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.302.9;
	Thu, 14 Dec 2017 14:40:05 +0000
From: Samuli Piippo <samuli.piippo@qt.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Dec 2017 16:39:54 +0200
Message-Id: <1513262394-20415-1-git-send-email-samuli.piippo@qt.io>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [192.89.120.53]
X-ClientProxiedBy: AM5PR0701CA0005.eurprd07.prod.outlook.com
	(2603:10a6:203:51::15) To HE1PR0202MB2586.eurprd02.prod.outlook.com
	(2603:10a6:3:90::15)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b6e50873-f288-4803-e25b-08d543009154
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(5600026)(4604075)(2017052603307);
	SRVR:HE1PR0202MB2586; 
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0202MB2586;
	3:yttSIgQ8sGB8mTX3szztuZLgudf/O7LPnkPtdjHvfcqNvIPToet20jEdVoY4N2OWmULWBNQfbQyIT8dUOImIUL94tKrBFAXPcbtcNN833d80PvLho5Mnxk07UFX4VQnjq9r24ocDfg0xt6gjXN6ihX5lh2wRrV7fVmWVG5jD5i6IJTEpaAT9+t0tdatqDKE2fE8jw28fIx0tpXfhiMVqaK+QgB7uiYLbrt05QKn6V2EEem0Y2Vl28aW2CVDK86xt;
	25:50W/NlJc4sLWtVB7RzkgieFBv4EVQz+nBcyPQlkXx5uH2Q9XrKusB+ijM91HHuOxnNexCEzQ8QLgizCDkJIvN7qsjemQ0/Y/ezJwpXgwMjtA0IZSTrWOARQXmEHtI8w8qjvJGoFns8Ya8Qh4Nn+2SA/7PghTUP2A5JFhhVo3KHd6d8dtfUWWB5LU9xcUfpYINrK3f47EpYU20hPB6dQaQgnz9Z2Mds5EZevbSNxKvYCi7FhCY9Yfkd3E6vr9Q2Y+Letkf89FsZSNB/nVbPctIo1OWBn41ud8hvN0R/A1+7Xi32Un07KhwTQQYfOiBqe00v8MXNbZWZLatxxh0oxnxA==;
	31:7T9DYbRBplpEWuASpIZxbnQTv/LdlOYRCqhrapBWo4uvRE3fyza6D5MzN4Wr/dnfM/5UEONibKDMlTtV94f9zAxQlBNXpPsBdf//jNIHDRKNufg5kHo5KonySui8UeHgwdeWaI7k64UkZ9kOnXVNKqOYuQZGBjE5Pn/VqeHiGY+qTouHjrI6nXoGHUGMnLftBM70RVXxXlJIT9QEmeOXMldzxmvdokUmBxgzBC9lfZU=
X-MS-TrafficTypeDiagnostic: HE1PR0202MB2586:
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0202MB2586;
	20:mhabSdh12JMAsVi7XVDNTL1zlB4dVQm3Jsnq4DS+p+r3B+kJMpbP+80qCaC+eiwB5DXnjKYMsrAajCbsuydYGbooz2tk2F2BWKhuluOj/P37yFLtFZFp1In5nDuGoOPd5Z/K1rDE2ZBfBMB0KE72dtGKXPZ8FLYgHqYlNpsN7z6wm/0LUHN+OK8aGgGkUtFThJ/kBwxKduFQbMkZj4KzHDqWtWvlOTd1Gq5fq3dR7QhILBk225eQo4C+GtDCZxiqAz3defYyFoPj35MjZ6trv+TYqDOyXHtE/VgxrpKyyJjmrjzcNbPRhHQ0Z15F7yLeYBs9uhNcztWedPFMloz/dRuD3IXsRpNs8X6WjtblHbyqFooiFc2sHI1Am6Au3ROY/tv1bIJ7dlKKul6OTOyWFiZwqnNLViUPljoqHrpgrY3sbidUcjwzqPF96jBCYtTZAnczUmGSxwZaS001JiHhNn3GyT5bNphRAM3CurokmpzyjW3NuijFIf6WDGRQUKzx;
	4:s6m2G50BwEs1EClCSuMFWtHO+/edFD1ztS4PNdsXbjU9bEAH66Zo9ji8A3OCJZAhUtZq97+AvVPFcBUeW4/qn9F0uDZ4C0Oq5WYciXXQs56hmaZEPtYz9O8jQnS9c3T3Ea+DOAulVIBUFVnc76QIWeh3eTcP7+kkCtsHlqfoCQn4qPE95tdmeYqBHR2nKpltfSV/fFykUKGvUZd7s5g92xMugIlmLOkIGgmJaFLD9NsghrGJvA7GeOKOt+K54mTZ0iJ+vmeiqUmj1Afuzsm5peIMGzB7BbRuh4iwkBBDiXiETNnozFwAoCPS/cYtx50cfh+u0vf1Oc+yxmAPIpvDTLptSjk8tGSTOUiLgOF5iLO1Oz2h+0Q3ZwLoh7kheZhk
X-Microsoft-Antispam-PRVS: <HE1PR0202MB258692A573D9E230C53E1C22E90A0@HE1PR0202MB2586.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(166708455590820)(192374486261705)(78775014660990); 
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040450)(2401047)(8121501046)(5005006)(93006095)(93001095)(3002001)(10201501046)(3231023)(6041248)(20161123555025)(20161123564025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(20161123562025)(20161123560025)(6072148)(201708071742011);
	SRVR:HE1PR0202MB2586; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:HE1PR0202MB2586; 
X-Forefront-PRVS: 05214FD68E
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(39840400004)(346002)(366004)(396003)(376002)(189003)(199004)(6916009)(52116002)(53416004)(59450400001)(50466002)(6306002)(97736004)(86362001)(69596002)(53936002)(33896004)(7736002)(36756003)(48376002)(3846002)(8676002)(74482002)(6116002)(66066001)(386003)(316002)(47776003)(6506007)(68736007)(8936002)(6666003)(81166006)(81156014)(16526018)(51416003)(25786009)(966005)(16586007)(2351001)(6486002)(53946003)(105586002)(50226002)(478600001)(2361001)(305945005)(575784001)(53546011)(5660300001)(106356001)(2906002)(6512007)(579004)(559001)(460985005)(19627235001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:HE1PR0202MB2586;
	H:piippo.intra.qt; FPR:; SPF:None; PTR:InfoNoRecords; MX:1; A:1;
	LANG:en; 
Received-SPF: None (protection.outlook.com: qt.io does not designate permitted
	sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; HE1PR0202MB2586;
	23:O/imniUvR+BhsE/ROsaU24t0ibclPaTZv6W0e4D?=
	=?us-ascii?Q?xgGseGl1AJdmpY1z4TI6wDRz4HoTNX1F0alCJfTfIOBVtca7z9FwbiSHULTv?=
	=?us-ascii?Q?TC2dad0pc+RuAyfgO/BV+CI+h0hlS2YESD2mboE8LKRA3e5ZYA/r4R7P+4hj?=
	=?us-ascii?Q?KTwxgUD5SuuEPYSftmOGKxmGUjPPJ/YSE9/HKybpNSerIAnPhFDZKBgPqm2M?=
	=?us-ascii?Q?7/l0a7oyJ/Udqvxy3bAiKtgPFe0pv912wUgGnLemuTWJLkaubWmV1+CSdIJH?=
	=?us-ascii?Q?UGHwB7/ZMUYJeMnNJB2ounuY4Hgs0eKFUW9cZ4+nGoIaEC2s9vwAcATfIuPq?=
	=?us-ascii?Q?FvqArfVgjin2+R/6nYzvYrWVnRDXzFx4At55TzDgVGM9Rdk7DOND3ky+hDo0?=
	=?us-ascii?Q?uSMvz7CGbAPX8ILNQr3OF7FuRJyMYvSdHknM9TgoZ9h+dQP1t1lvHMI9+d+P?=
	=?us-ascii?Q?6yojmZOTQG1c84bF4spqko1m0/MRpE+ogOmnOX2jecb5SXkbX8nbeaHA+kqa?=
	=?us-ascii?Q?yklSfhGlc6MnNqLSKFE2u7DBdZWnyknXj1yc1CK4f9kI9T1osFeLxG1B5tKI?=
	=?us-ascii?Q?9tUfVPXNt8BTYdNhVfCvoChTVf4pQGmU/nw8xe4W3FOsXnQphjBpU9SXH04N?=
	=?us-ascii?Q?YbJ2Gy5z+Vt7scW0C/F4qy86YADsoLr9CtKrA/vCFu+NGvKhMbYCZxkX6kvn?=
	=?us-ascii?Q?hg3SxkCCcxog4xX7IJOJiswjzM/Kz0VYDeQGsdMctigo0cqI+Xi0qMa6tKkc?=
	=?us-ascii?Q?KwpT1xAx8BlTPWXesOEXEvlDuQ63MMJaNBaZVu0wTEfUhpBVsLoMxh/hN7NP?=
	=?us-ascii?Q?3jQHAzc2KRi2q4zaeO5WbNfYKnJIxnl2LuRMENmTRO6e31W4+R957M7o5mdO?=
	=?us-ascii?Q?rrqkNimARKVVJykF+CtEwcK/mXmtKcoJ7bgyI3WffV37fiEJRLohGzenehNg?=
	=?us-ascii?Q?DCsuTtrbSUGfyJI4MxunMJI3VoM83B4Pa+YeO6N7zAtxZeOYD6zY1bkwYVyK?=
	=?us-ascii?Q?6tnN4hGopVEtoUfEDODC05NQENIA76mGFQGULvAAODVg0BGGxz3c42SBZKbc?=
	=?us-ascii?Q?eN3TK81mVozo3A7DLYbQC9OVtsxTyYGC14sRUsGHRVvs5kNOgSNNO2wYTobp?=
	=?us-ascii?Q?h3GC6V8vC8qcAtSEllntjRn7tB1u8t4qwo5f+mcrse8R3SVuSr9QrlHlEIQj?=
	=?us-ascii?Q?Shm+ZZn5G1JqtcUrDug2EdWJeRNd7yHEr27S6MQsWeiMTvKB2vktyftM1Xst?=
	=?us-ascii?Q?e+JlhOUatW0TijJR0sYFkJJhuEdFOhObHS91J/vfSP1yXpaelhxIkUYVz4Lz?=
	=?us-ascii?Q?UtDPA/Pci4oJ7TaehUJy028o=3D?=
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0202MB2586;
	6:y0LU4nZaT5vHHPA/3qgQ/tEk8uH+XCsgGsqaH/kXVJPWZbNJlagAl4Que//nzOlhgaG7CrEnyYgwBP523VtYdEWRVsl6OX4TodEExaSS6VOyO1ehVredocFG+cTzh/14k/IOYk4c7rpY9VEBfWGj+lJszd96Bf63WBtZ+uh13jhNayWrPj4DbQM+eSWogmrk7rQ4IOepiqUYE6BAJpYb7CcNzx1Tlos+4dbn5MzFRDm9gi6bc29ayjej9lIreu82aWoNTqIADH9pFqRJzGu6um2+f53FIwBct7L7xxInbVIkXnO0QRLkm+u2xe1g695UJu5M/Rw0uAOS2wWJJojk7Jlas4OVC0WeRStd22wEfAI=;
	5:Ss0U/MDXj7zo8oaDh2pfEA7QeNrXMKWoc32irM/orJSLEB6xojxSlgKsbKnLPRP9olPQVEwLiGZjSIrK96Sm7xi8XNHLLw7JQ+toFrMWvLcF+nsulfF2VK4azHGFeRff2W2bKcHX3cQzQNtYnaQZZ6FpG+FH5amuqwLjdipvyPQ=;
	24:gCCkEhuHgSNPhBiJNCsG1z8yqGF5mnAjLjSK6zMwAictBJsKMp1tEnwNxTfxmJ9cjbyXIz9iZZfywbgBpOSaOKK+dY8F8fKgdnWSMFazOXU=;
	7:wruslzCgFbDHDpRqbjBhp9pSS/tvzSSGUXPdkQsD0sbIkrCsa5dq1Wd4q901YaRozw/6rxJ8Mx1Wh1904saClpmqneP++Pe+uQ/yFjU4fadJFS4OB6bOv+XhAlcgi2m3vaO9jkCYUHh+qmphid5mss8xcpjIHUe9llqgsUkEabF8NVDQENcdDL+3I01tCGXSxL2scXr6wbgA4iz79QVYOSw2ZN417t7q5essbaoeFL+6X4p3lkdoNBSqVipdec8T
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: qt.io
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2017 14:40:05.7925 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6e50873-f288-4803-e25b-08d543009154
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 20d0b167-794d-448a-9d01-aaeccc1124ac
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0202MB2586
Subject: [meta-qt5][PATCH] Upgrade to Qt 5.10.0
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
X-List-Received-Date: Thu, 14 Dec 2017 17:11:28 -0000
Content-Type: text/plain

---
 recipes-qt/qt5/nativesdk-qtbase_git.bb             |  6 +-
 .../qt5/qt3d/0001-Allow-a-tools-only-build.patch   |  1 +
 recipes-qt/qt5/qt3d_git.bb                         |  2 +-
 recipes-qt/qt5/qt5-git.inc                         |  4 +-
 recipes-qt/qt5/qtbase-native_git.bb                |  8 ++-
 .../0001-Bootstrap-without-linkat-feature.patch    | 27 ++++++++
 recipes-qt/qt5/qtbase/0009-Always-build-uic.patch  | 10 +--
 recipes-qt/qt5/qtbase_git.bb                       |  6 +-
 recipes-qt/qt5/qtcanvas3d_git.bb                   |  2 +-
 recipes-qt/qt5/qtcharts_git.bb                     |  4 +-
 recipes-qt/qt5/qtconnectivity_git.bb               |  2 +-
 recipes-qt/qt5/qtdatavis3d_git.bb                  |  2 +-
 recipes-qt/qt5/qtdeclarative_git.bb                |  2 +-
 recipes-qt/qt5/qtgamepad_git.bb                    |  2 +-
 recipes-qt/qt5/qtgraphicaleffects_git.bb           |  2 +-
 recipes-qt/qt5/qtimageformats_git.bb               |  2 +-
 recipes-qt/qt5/qtlocation_git.bb                   |  4 +-
 recipes-qt/qt5/qtmultimedia_git.bb                 |  2 +-
 recipes-qt/qt5/qtnetworkauth_git.bb                |  2 +-
 recipes-qt/qt5/qtquick1_git.bb                     |  6 +-
 recipes-qt/qt5/qtquickcontrols2_git.bb             |  2 +-
 recipes-qt/qt5/qtquickcontrols_git.bb              |  4 +-
 recipes-qt/qt5/qtremoteobjects_git.bb              |  2 +-
 recipes-qt/qt5/qtscript_git.bb                     |  2 +-
 recipes-qt/qt5/qtscxml_git.bb                      |  2 +-
 recipes-qt/qt5/qtsensors_git.bb                    |  2 +-
 ...01-Add-missing-include-for-struct-timeval.patch | 25 ++++++++
 recipes-qt/qt5/qtserialbus_git.bb                  |  4 +-
 recipes-qt/qt5/qtserialport_git.bb                 |  2 +-
 recipes-qt/qt5/qtsvg_git.bb                        |  2 +-
 recipes-qt/qt5/qtsystems_git.bb                    |  2 +-
 recipes-qt/qt5/qttools_git.bb                      |  2 +-
 recipes-qt/qt5/qttranslations_git.bb               |  2 +-
 recipes-qt/qt5/qtvirtualkeyboard_git.bb            |  2 +-
 recipes-qt/qt5/qtwayland_git.bb                    |  2 +-
 recipes-qt/qt5/qtwebchannel_git.bb                 |  2 +-
 ...ange-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch | 63 -------------------
 ...s.prf-allow-build-for-linux-oe-g-platform.patch | 30 ---------
 ...romium-Force-host-toolchain-configuration.patch | 25 +++-----
 .../0004-Force-host-toolchain-configuration.patch  | 14 ++---
 ...sl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch | 34 ++++++++--
 ...use-pvalloc-as-it-s-not-available-on-musl.patch | 37 +++++++++++
 ...ests-make-accessibility-tests-conditional.patch | 37 -----------
 .../0006-musl-link-against-libexecinfo.patch       | 24 ++++++++
 ...ium-musl-linux-glibc-make-the-distinction.patch | 10 +--
 ...um-musl-Adjust-default-pthread-stack-size.patch | 34 +++++-----
 recipes-qt/qt5/qtwebengine_git.bb                  | 72 ++++++++++------------
 recipes-qt/qt5/qtwebsockets_git.bb                 |  4 +-
 recipes-qt/qt5/qtwebview_git.bb                    |  2 +-
 recipes-qt/qt5/qtx11extras_git.bb                  |  2 +-
 recipes-qt/qt5/qtxmlpatterns_git.bb                |  2 +-
 51 files changed, 270 insertions(+), 275 deletions(-)
 create mode 100644 recipes-qt/qt5/qtbase/0001-Bootstrap-without-linkat-feature.patch
 create mode 100644 recipes-qt/qt5/qtserialbus/0001-Add-missing-include-for-struct-timeval.patch
 delete mode 100644 recipes-qt/qt5/qtwebengine/0001-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch
 delete mode 100644 recipes-qt/qt5/qtwebengine/0001-functions.prf-allow-build-for-linux-oe-g-platform.patch
 create mode 100644 recipes-qt/qt5/qtwebengine/0005-musl-don-t-use-pvalloc-as-it-s-not-available-on-musl.patch
 delete mode 100644 recipes-qt/qt5/qtwebengine/0005-tests-make-accessibility-tests-conditional.patch
 create mode 100644 recipes-qt/qt5/qtwebengine/0006-musl-link-against-libexecinfo.patch

diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
index 87bd501..710d3a1 100644
--- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
+++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
@@ -165,6 +165,10 @@ do_install() {
     # Install CMake's toolchain configuration
     mkdir -p ${D}${datadir}/cmake/OEToolchainConfig.cmake.d/
     install -m 644 ${WORKDIR}/OEQt5Toolchain.cmake ${D}${datadir}/cmake/OEToolchainConfig.cmake.d/
+
+    # Fix up absolute paths in scripts
+    grep -lr /usr/bin/python ${D}${OE_QMAKE_PATH_QT_ARCHDATA}/ | \
+        xargs -r sed -i -e '1s,#!.*python,#! ${USRBINPATH}/env python,'
 }
 
 fakeroot do_generate_qt_environment_file() {
@@ -197,4 +201,4 @@ fakeroot do_generate_qt_environment_file() {
 
 addtask generate_qt_environment_file after do_install before do_package
 
-SRCREV = "73573fce295caef35da706a8c8c796ec18e6baf1"
+SRCREV = "50117d738af526cbfbd5afa50b9a501acb0fb9ce"
diff --git a/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch b/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch
index 5aba2bf..3b0a9ad 100644
--- a/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch
+++ b/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch
@@ -3,6 +3,7 @@ From: Samuli Piippo <samuli.piippo@theqtcompany.com>
 Date: Wed, 10 Feb 2016 09:02:09 +0200
 Subject: [PATCH] Allow a tools-only build
 
+Change-Id: I4de6b96ec51fe297a0eeb757cef56d8fb40bd6f0
 ---
  qt3d.pro                                  | 7 ++++++-
  src/3rdparty/assimp/assimp_dependency.pri | 2 +-
diff --git a/recipes-qt/qt5/qt3d_git.bb b/recipes-qt/qt5/qt3d_git.bb
index 6f8ab71..34e2423 100644
--- a/recipes-qt/qt5/qt3d_git.bb
+++ b/recipes-qt/qt5/qt3d_git.bb
@@ -37,6 +37,6 @@ do_configure_prepend() {
          ${S}/src/quick3d/imports/input/importsinput.pro
 }
 
-SRCREV = "143b721249af92fc27f48fb01914195516f7a087"
+SRCREV = "7bd57d2218794fdd7bcaa4f2c8107ef60740ff75"
 
 BBCLASSEXTEND += "native nativesdk"
diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
index ffa70e5..a613d1e 100644
--- a/recipes-qt/qt5/qt5-git.inc
+++ b/recipes-qt/qt5/qt5-git.inc
@@ -2,7 +2,7 @@
 # Copyright (C) 2013-2017 Martin Jansa <martin.jansa@gmail.com>
 
 QT_MODULE ?= "${BPN}"
-QT_MODULE_BRANCH ?= "5.9"
+QT_MODULE_BRANCH ?= "5.10"
 QT_MODULE_BRANCH_PARAM ?= "branch=${QT_MODULE_BRANCH};nobranch=1"
 
 # each module needs to define valid SRCREV
@@ -14,4 +14,4 @@ CVE_PRODUCT = "qt"
 
 S = "${WORKDIR}/git"
 
-PV = "5.9.2+git${SRCPV}"
+PV = "5.10.0+git${SRCPV}"
diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
index b0f5970..4c6b701 100644
--- a/recipes-qt/qt5/qtbase-native_git.bb
+++ b/recipes-qt/qt5/qtbase-native_git.bb
@@ -43,6 +43,11 @@ SRC_URI += " \
     file://0012-tst_qlocale-Enable-QT_USE_FENV-only-on-glibc.patch \
 "
 
+# only for qtbase-native
+SRC_URI += " \
+    file://0001-Bootstrap-without-linkat-feature.patch \
+"
+
 CLEANBROKEN = "1"
 
 XPLATFORM_toolchain-clang = "linux-oe-clang"
@@ -86,6 +91,7 @@ PACKAGECONFIG_CONFARGS = " \
     -nomake examples \
     -nomake tests \
     -no-rpath \
+    -no-feature-linkat \
     -platform ${XPLATFORM} \
 "
 
@@ -125,4 +131,4 @@ do_install() {
     echo 'set(_qt5_corelib_extra_includes "${_qt5Core_install_prefix}/lib${QT_DIR_NAME}/mkspecs/linux-oe-g++")' > ${D}${libdir}/cmake/Qt5Core/Qt5CoreConfigExtrasMkspecDir.cmake
 }
 
-SRCREV = "ec16ba393baf504d4b192cc349775c62d3c96aa0"
+SRCREV = "50117d738af526cbfbd5afa50b9a501acb0fb9ce"
diff --git a/recipes-qt/qt5/qtbase/0001-Bootstrap-without-linkat-feature.patch b/recipes-qt/qt5/qtbase/0001-Bootstrap-without-linkat-feature.patch
new file mode 100644
index 0000000..32d8a4c
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0001-Bootstrap-without-linkat-feature.patch
@@ -0,0 +1,27 @@
+From b15a9aa4f3229d01d3b12e0c4498bdcd55480a24 Mon Sep 17 00:00:00 2001
+From: Samuli Piippo <samuli.piippo@qt.io>
+Date: Fri, 24 Nov 2017 15:16:31 +0200
+Subject: [PATCH] Bootstrap without linkat feature
+
+qmake does not work together with pseudo when unnamed temporary files
+are used with linkat.
+
+Upstream-Status: Inappropriate [OE specific]
+[YOCTO #11996]
+---
+ src/corelib/global/qconfig-bootstrapped.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/corelib/global/qconfig-bootstrapped.h b/src/corelib/global/qconfig-bootstrapped.h
+index dabb715..5b4ff86 100644
+--- a/src/corelib/global/qconfig-bootstrapped.h
++++ b/src/corelib/global/qconfig-bootstrapped.h
+@@ -88,7 +88,7 @@
+ #define QT_FEATURE_futimes -1
+ #define QT_FEATURE_library -1
+ #ifdef __linux__
+-# define QT_FEATURE_linkat 1
++# define QT_FEATURE_linkat -1
+ #else
+ # define QT_FEATURE_linkat -1
+ #endif
diff --git a/recipes-qt/qt5/qtbase/0009-Always-build-uic.patch b/recipes-qt/qt5/qtbase/0009-Always-build-uic.patch
index 2a1d534..8ca2c8c 100644
--- a/recipes-qt/qt5/qtbase/0009-Always-build-uic.patch
+++ b/recipes-qt/qt5/qtbase/0009-Always-build-uic.patch
@@ -1,7 +1,7 @@
-From bf173918731c626b6c8b84eb826c921e5c6d44f5 Mon Sep 17 00:00:00 2001
+From b63b2819b88ef252a078e7ef595f7f370ec0c050 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 16 Nov 2013 00:32:30 +0100
-Subject: [PATCH] Always build uic
+Subject: [PATCH] Always build uic and qvkgen
 
 Even if we are not building gui or widgets. This tool is needed later
 as a native tool when compiling the target.
@@ -14,15 +14,15 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/src.pro b/src/src.pro
-index 43fc06f2e5..1e9d4dcc0d 100644
+index a2064b1..9fae335 100644
 --- a/src/src.pro
 +++ b/src/src.pro
-@@ -203,7 +203,7 @@ qtConfig(gui) {
+@@ -211,7 +211,7 @@ qtConfig(gui) {
          }
      }
  }
 -SUBDIRS += src_plugins
-+SUBDIRS += src_plugins src_tools_uic
++SUBDIRS += src_plugins src_tools_uic src_tools_qvkgen
  
  nacl: SUBDIRS -= src_network src_testlib
  
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 802da3b..bf9540b 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -217,10 +217,6 @@ do_install_append() {
     sed -i -e 's|${STAGING_DIR_NATIVE}|$$[QT_HOST_PREFIX/get]|g' \
         -e 's|${STAGING_DIR_HOST}|$$[QT_SYSROOT]|g' \
         ${D}/${OE_QMAKE_PATH_QT_ARCHDATA}/mkspecs/*.pri
-
-    # Fix up absolute paths in scripts
-    grep -lr /usr/bin/perl ${D}${OE_QMAKE_PATH_QT_ARCHDATA}/ | \
-        xargs -r sed -i -e '1s,#!.*perl,#! ${USRBINPATH}/env perl,'
 }
 
 # mkspecs have mac specific scripts that depend on perl and bash
@@ -228,4 +224,4 @@ INSANE_SKIP_${PN}-mkspecs += "file-rdeps"
 
 RRECOMMENDS_${PN}-plugins += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libx11-locale', '', d)}"
 
-SRCREV = "ec16ba393baf504d4b192cc349775c62d3c96aa0"
+SRCREV = "50117d738af526cbfbd5afa50b9a501acb0fb9ce"
diff --git a/recipes-qt/qt5/qtcanvas3d_git.bb b/recipes-qt/qt5/qtcanvas3d_git.bb
index 17479e2..2c891aa 100644
--- a/recipes-qt/qt5/qtcanvas3d_git.bb
+++ b/recipes-qt/qt5/qtcanvas3d_git.bb
@@ -10,4 +10,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS = "qtdeclarative"
 
-SRCREV = "a1aee8ecbefb74cd5eae380ced56bb43ff3cc40b"
+SRCREV = "8137223f6c489c2d1bb2317474c99c77245bd7ec"
diff --git a/recipes-qt/qt5/qtcharts_git.bb b/recipes-qt/qt5/qtcharts_git.bb
index d494481..a416cef 100644
--- a/recipes-qt/qt5/qtcharts_git.bb
+++ b/recipes-qt/qt5/qtcharts_git.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative qtmultimedia"
 
-SRCREV = "e3af14e9169207e0e73f7e50191106895c29ddc4"
+SRCREV = "6a9606270e6611c818bdab382a29051d4cd3b459"
 
 # The same issue as in qtbase:
 # http://errors.yoctoproject.org/Errors/Details/152641/
-LDFLAGS_append_x86 = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
\ No newline at end of file
+LDFLAGS_append_x86 = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
diff --git a/recipes-qt/qt5/qtconnectivity_git.bb b/recipes-qt/qt5/qtconnectivity_git.bb
index ca9866f..3bf16a6 100644
--- a/recipes-qt/qt5/qtconnectivity_git.bb
+++ b/recipes-qt/qt5/qtconnectivity_git.bb
@@ -19,4 +19,4 @@ PACKAGECONFIG[bluez] = "-feature-bluez,-no-feature-bluez,${BLUEZ}"
 
 EXTRA_QMAKEVARS_CONFIGURE += "${PACKAGECONFIG_CONFARGS}"
 
-SRCREV = "6b3bdb84406b42b50bdf5a39ee9ca2fabd3e6d2f"
+SRCREV = "bb9b8af08b1602c7c867969b236393b3ff3f7f18"
diff --git a/recipes-qt/qt5/qtdatavis3d_git.bb b/recipes-qt/qt5/qtdatavis3d_git.bb
index 7c8eda7..1bd3411 100644
--- a/recipes-qt/qt5/qtdatavis3d_git.bb
+++ b/recipes-qt/qt5/qtdatavis3d_git.bb
@@ -8,4 +8,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative qtmultimedia qtxmlpatterns"
 
-SRCREV = "8329a8fb287094012989b965604ff9c9426f022a"
+SRCREV = "d2abb20082322167311cfe0c84afa822754b74ef"
diff --git a/recipes-qt/qt5/qtdeclarative_git.bb b/recipes-qt/qt5/qtdeclarative_git.bb
index 4ae870a..facb448 100644
--- a/recipes-qt/qt5/qtdeclarative_git.bb
+++ b/recipes-qt/qt5/qtdeclarative_git.bb
@@ -30,6 +30,6 @@ do_install_append_class-nativesdk() {
 
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'qtxmlpatterns', 'CONFIG+=OE_QTXMLPATTERNS_ENABLED', '', d)}"
 
-SRCREV = "32218c3243fb4f0da83293c5bd6a663d8e3660ee"
+SRCREV = "dac71f3d6f6bc4f159f6107c792bc70cfe7c308e"
 
 BBCLASSEXTEND =+ "native nativesdk"
diff --git a/recipes-qt/qt5/qtgamepad_git.bb b/recipes-qt/qt5/qtgamepad_git.bb
index 7e6cb1b..a59ccf7 100644
--- a/recipes-qt/qt5/qtgamepad_git.bb
+++ b/recipes-qt/qt5/qtgamepad_git.bb
@@ -14,4 +14,4 @@ PACKAGECONFIG[sdl2] = "-feature-sdl2,-no-feature-sdl2,libsdl2"
 
 EXTRA_QMAKEVARS_CONFIGURE += "${PACKAGECONFIG_CONFARGS}"
 
-SRCREV = "167566d228792c0f763b84a39ff5dc52fda046dd"
+SRCREV = "b505116ee456d7084d8f570e062b3031b77d79df"
diff --git a/recipes-qt/qt5/qtgraphicaleffects_git.bb b/recipes-qt/qt5/qtgraphicaleffects_git.bb
index 8f70bc0..8312851 100644
--- a/recipes-qt/qt5/qtgraphicaleffects_git.bb
+++ b/recipes-qt/qt5/qtgraphicaleffects_git.bb
@@ -18,4 +18,4 @@ RDEPENDS_${PN}-dev = ""
 # http://errors.yoctoproject.org/Errors/Build/44912/
 LDFLAGS_append_x86 = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
 
-SRCREV = "1f6658cbaa5ffecbf9ba845ea81683dd2215cd34"
+SRCREV = "5ca1c00b33b0e125ab60413aa0fb3c7b0f89d8f2"
diff --git a/recipes-qt/qt5/qtimageformats_git.bb b/recipes-qt/qt5/qtimageformats_git.bb
index 52dd34a..4552d68 100644
--- a/recipes-qt/qt5/qtimageformats_git.bb
+++ b/recipes-qt/qt5/qtimageformats_git.bb
@@ -26,4 +26,4 @@ PACKAGECONFIG[libwebp] = ",CONFIG+=done_config_libwebp,libwebp"
 
 EXTRA_QMAKEVARS_PRE += "${PACKAGECONFIG_CONFARGS}"
 
-SRCREV = "dc6dc3b088d1828ee6d31f92528e0c87272ad4ed"
+SRCREV = "caa90acd43684dc382f1e4f01c8787e18653ef43"
diff --git a/recipes-qt/qt5/qtlocation_git.bb b/recipes-qt/qt5/qtlocation_git.bb
index cce6601..fce37b8 100644
--- a/recipes-qt/qt5/qtlocation_git.bb
+++ b/recipes-qt/qt5/qtlocation_git.bb
@@ -29,7 +29,7 @@ SRC_URI += " \
     ${QT_GIT}/qtlocation-mapboxgl.git;name=qtlocation-mapboxgl;branch=upstream/qt-staging;protocol=${QT_GIT_PROTOCOL};destsuffix=git/src/3rdparty/mapbox-gl-native \
 "
 
-SRCREV_qtlocation = "d919f47308b209c798e50d8ca1b9abd48ba94718"
-SRCREV_qtlocation-mapboxgl = "1c633072fcea7ad153ab6f8ec40dd72d83541ead"
+SRCREV_qtlocation = "919bbf503d69fd6be87f22ea58c15872d08f8580"
+SRCREV_qtlocation-mapboxgl = "572822c8ca15be190b43afbf7f91d132e988bf21"
 
 SRCREV_FORMAT = "qtlocation_qtlocation-mapboxgl"
diff --git a/recipes-qt/qt5/qtmultimedia_git.bb b/recipes-qt/qt5/qtmultimedia_git.bb
index f42bdc2..7a7e14b 100644
--- a/recipes-qt/qt5/qtmultimedia_git.bb
+++ b/recipes-qt/qt5/qtmultimedia_git.bb
@@ -35,4 +35,4 @@ SRC_URI += "\
 # http://errors.yoctoproject.org/Errors/Build/44914/
 LDFLAGS_append_x86 = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
 
-SRCREV = "1e2702e86dbd2b3de69c58438bcfcf6276124547"
+SRCREV = "3598915a360c596da48c9e7b00ba8469cba5249a"
diff --git a/recipes-qt/qt5/qtnetworkauth_git.bb b/recipes-qt/qt5/qtnetworkauth_git.bb
index e5ca4df..4c38322 100644
--- a/recipes-qt/qt5/qtnetworkauth_git.bb
+++ b/recipes-qt/qt5/qtnetworkauth_git.bb
@@ -9,4 +9,4 @@ require qt5-git.inc
 
 DEPENDS += "qtbase"
 
-SRCREV = "47b80ecae6fe0b9a2c74f0b0feb243145695995e"
+SRCREV = "febebfb6f09f23b16ac96a5a09d2ceb5b67046e7"
diff --git a/recipes-qt/qt5/qtquick1_git.bb b/recipes-qt/qt5/qtquick1_git.bb
index c1bbc8a..85b8462 100644
--- a/recipes-qt/qt5/qtquick1_git.bb
+++ b/recipes-qt/qt5/qtquick1_git.bb
@@ -25,7 +25,5 @@ do_configure_prepend() {
 }
 
 QT_MODULE_BRANCH = "dev"
-# one commit behind:
-# 8a7b80eb Use QRandomGenerator instead of q?rand
-# because QRandomGenerator is only since Qt 5.10
-SRCREV = "9bf0edd9bd46ecb900bcdc3349d14869b87ab7de"
+
+SRCREV = "b2476dcd53f0dea1e9eb38df5add3a771d64c4a1"
diff --git a/recipes-qt/qt5/qtquickcontrols2_git.bb b/recipes-qt/qt5/qtquickcontrols2_git.bb
index 64cfbdf..2cc63a7 100644
--- a/recipes-qt/qt5/qtquickcontrols2_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols2_git.bb
@@ -10,4 +10,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtdeclarative"
 
-SRCREV = "871d8e8e2faca0be870930d83f755a2ad484d30b"
+SRCREV = "1265fef3b290665272d3aacd0ba5213c43bad89d"
diff --git a/recipes-qt/qt5/qtquickcontrols_git.bb b/recipes-qt/qt5/qtquickcontrols_git.bb
index aa0e6e3..fff66cb 100644
--- a/recipes-qt/qt5/qtquickcontrols_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols_git.bb
@@ -15,8 +15,6 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtdeclarative"
 
-RDEPENDS_${PN}-dev = ""
-
 FILES_${PN}-qmlplugins += " \
   ${OE_QMAKE_PATH_QML}/QtQuick/Controls/Shaders \
   ${OE_QMAKE_PATH_QML}/QtQuick/Dialogs/qml/icons.ttf \
@@ -28,4 +26,4 @@ SRC_URI += " \
     file://0001-texteditor-fix-invalid-use-of-incomplete-type-class-.patch \
 "
 
-SRCREV = "8476f8fff7dc5b6f140074d280828cc0f9590088"
+SRCREV = "a749525164b771452599e67e277d2ea6b3866479"
diff --git a/recipes-qt/qt5/qtremoteobjects_git.bb b/recipes-qt/qt5/qtremoteobjects_git.bb
index 1e90323..9d3135b 100644
--- a/recipes-qt/qt5/qtremoteobjects_git.bb
+++ b/recipes-qt/qt5/qtremoteobjects_git.bb
@@ -24,6 +24,6 @@ PACKAGECONFIG[tools-only] = "CONFIG+=tools-only"
 
 EXTRA_QMAKEVARS_PRE += "${PACKAGECONFIG_CONFARGS}"
 
-SRCREV = "6e0341bc878ff82d3c1039dcce09f92269546189"
+SRCREV = "e6eb6ab12daf76f3e716c0d51ceecdab61e39e48"
 
 BBCLASSEXTEND += "native nativesdk"
diff --git a/recipes-qt/qt5/qtscript_git.bb b/recipes-qt/qt5/qtscript_git.bb
index b4f5a71..5d32315 100644
--- a/recipes-qt/qt5/qtscript_git.bb
+++ b/recipes-qt/qt5/qtscript_git.bb
@@ -30,4 +30,4 @@ DEPENDS += "qtbase"
 # http://errors.yoctoproject.org/Errors/Build/44915/
 LDFLAGS_append_x86 = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
 
-SRCREV = "08b74f4f30c304b80249a593a572808bc1892f66"
+SRCREV = "0bb3f3017f72cbf8d6866b8baa1820ab3dd89316"
diff --git a/recipes-qt/qt5/qtscxml_git.bb b/recipes-qt/qt5/qtscxml_git.bb
index fc60d60..53bfcc3 100644
--- a/recipes-qt/qt5/qtscxml_git.bb
+++ b/recipes-qt/qt5/qtscxml_git.bb
@@ -10,7 +10,7 @@ require qt5-git.inc
 
 DEPENDS += "qtbase qtdeclarative qtxmlpatterns qtscxml-native"
 
-SRCREV = "3caae998c8c1770cd96cadba24d89a60005c5fe7"
+SRCREV = "bbf3be4679571edef60425c3fd12df9d3035001c"
 
 # Patches from https://github.com/meta-qt5/qtscxml/commits/b5.9
 # 5.9.meta-qt5.2
diff --git a/recipes-qt/qt5/qtsensors_git.bb b/recipes-qt/qt5/qtsensors_git.bb
index 014b68f..caa9a04 100644
--- a/recipes-qt/qt5/qtsensors_git.bb
+++ b/recipes-qt/qt5/qtsensors_git.bb
@@ -12,4 +12,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative"
 
-SRCREV = "c273f2e5c82a3ef8e55e360988b8cf31362e2ba9"
+SRCREV = "7ae7dc325648a007a72e74f2bd7784a90b4714af"
diff --git a/recipes-qt/qt5/qtserialbus/0001-Add-missing-include-for-struct-timeval.patch b/recipes-qt/qt5/qtserialbus/0001-Add-missing-include-for-struct-timeval.patch
new file mode 100644
index 0000000..070c8e5
--- /dev/null
+++ b/recipes-qt/qt5/qtserialbus/0001-Add-missing-include-for-struct-timeval.patch
@@ -0,0 +1,25 @@
+From 896e90350f94654901e88f3365dd54986a6ba1fd Mon Sep 17 00:00:00 2001
+From: Samuli Piippo <samuli.piippo@qt.io>
+Date: Mon, 11 Dec 2017 14:39:34 +0200
+Subject: [PATCH] Add missing include for struct timeval
+
+Fix build failure with musl libc:
+socketcanbackend.h:88:38: error: 'timeval' was not declared in this scope
+
+Change-Id: I4089f5a906095c21b2790d35ad131d9a0713ff3b
+---
+ src/plugins/canbus/socketcan/socketcanbackend.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/plugins/canbus/socketcan/socketcanbackend.h b/src/plugins/canbus/socketcan/socketcanbackend.h
+index 50976b1..b49d267 100644
+--- a/src/plugins/canbus/socketcan/socketcanbackend.h
++++ b/src/plugins/canbus/socketcan/socketcanbackend.h
+@@ -50,6 +50,7 @@
+ #include <sys/socket.h>
+ #include <sys/uio.h>
+ #include <linux/can.h>
++#include <sys/time.h>
+ 
+ QT_BEGIN_NAMESPACE
+ 
diff --git a/recipes-qt/qt5/qtserialbus_git.bb b/recipes-qt/qt5/qtserialbus_git.bb
index 8df8913..9ee34e4 100644
--- a/recipes-qt/qt5/qtserialbus_git.bb
+++ b/recipes-qt/qt5/qtserialbus_git.bb
@@ -11,4 +11,6 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtserialport"
 
-SRCREV = "ce5a3ced5eeefe05675736d3279d4d45bbb6df90"
+SRC_URI += "file://0001-Add-missing-include-for-struct-timeval.patch"
+
+SRCREV = "f25ddea7b12beff8d4de863fec18ce698d726ffa"
diff --git a/recipes-qt/qt5/qtserialport_git.bb b/recipes-qt/qt5/qtserialport_git.bb
index 0425e43..e48d095 100644
--- a/recipes-qt/qt5/qtserialport_git.bb
+++ b/recipes-qt/qt5/qtserialport_git.bb
@@ -15,4 +15,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "cb9ade8beabd3cdcd469a45fa82a27fcc960532f"
+SRCREV = "c7d99464c65a5bde663a8ec4daf3d343d8e9b14b"
diff --git a/recipes-qt/qt5/qtsvg_git.bb b/recipes-qt/qt5/qtsvg_git.bb
index f9e04c8..3d0a372 100644
--- a/recipes-qt/qt5/qtsvg_git.bb
+++ b/recipes-qt/qt5/qtsvg_git.bb
@@ -13,4 +13,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "bdcd7a97449502f92069d36196cc81064b1c02a0"
+SRCREV = "984ba6977201f8fbd94d44a2b67519e1faf458cc"
diff --git a/recipes-qt/qt5/qtsystems_git.bb b/recipes-qt/qt5/qtsystems_git.bb
index 0c6ce7e..bc3e289 100644
--- a/recipes-qt/qt5/qtsystems_git.bb
+++ b/recipes-qt/qt5/qtsystems_git.bb
@@ -30,4 +30,4 @@ do_install_append() {
 
 QT_MODULE_BRANCH = "dev"
 
-SRCREV = "9c204e05ae7fefe9525b30238b469b1bb65d2537"
+SRCREV = "ca54870ffdf262f072c082adf80d63c421dbd68f"
diff --git a/recipes-qt/qt5/qttools_git.bb b/recipes-qt/qt5/qttools_git.bb
index 6930519..e47cde5 100644
--- a/recipes-qt/qt5/qttools_git.bb
+++ b/recipes-qt/qt5/qttools_git.bb
@@ -31,7 +31,7 @@ PACKAGECONFIG[qtwebkit] = ",,qtwebkit"
 
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'qtwebkit', '', 'CONFIG+=noqtwebkit', d)}"
 
-SRCREV = "90a701032ec5c8898e33b4fb4df0480634caaf8d"
+SRCREV = "3ce89dc37d3c73033c18dcec9e4710afd747ce01"
 
 BBCLASSEXTEND = "native nativesdk"
 
diff --git a/recipes-qt/qt5/qttranslations_git.bb b/recipes-qt/qt5/qttranslations_git.bb
index 0238ce9..040dd71 100644
--- a/recipes-qt/qt5/qttranslations_git.bb
+++ b/recipes-qt/qt5/qttranslations_git.bb
@@ -111,4 +111,4 @@ FILES_${PN}-qt = " \
     ${OE_QMAKE_PATH_TRANSLATIONS}/qt_*.qm \
 "
 
-SRCREV = "325a90e07e9dce4e5c915549e6c31a86423dfdd3"
+SRCREV = "f4b0f1684a8e668ede23fafbff02c3910d775043"
diff --git a/recipes-qt/qt5/qtvirtualkeyboard_git.bb b/recipes-qt/qt5/qtvirtualkeyboard_git.bb
index 5b54455..2930bd5 100644
--- a/recipes-qt/qt5/qtvirtualkeyboard_git.bb
+++ b/recipes-qt/qt5/qtvirtualkeyboard_git.bb
@@ -53,4 +53,4 @@ FILES_${PN} += "${OE_QMAKE_PATH_DATA}/qtvirtualkeyboard/lipi_toolkit"
 
 DEPENDS += "qtbase qtdeclarative qtmultimedia qtquickcontrols qtsvg qtxmlpatterns"
 
-SRCREV = "87218c4e68c4ebde8f5765f0dfe9a70a359ae05f"
+SRCREV = "8546475dd5d6076a98b0700f1d70211c1395fc63"
diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_git.bb
index 979969b..e7ded38 100644
--- a/recipes-qt/qt5/qtwayland_git.bb
+++ b/recipes-qt/qt5/qtwayland_git.bb
@@ -37,7 +37,7 @@ PACKAGECONFIG[libhybris-egl-server] = "-feature-libhybris-egl-server,-no-feature
 
 EXTRA_QMAKEVARS_CONFIGURE += "${PACKAGECONFIG_CONFARGS}"
 
-SRCREV = "d483ed2927cb8d4685d5d3c7ea1c71246381910b"
+SRCREV = "1a457a9dc9c61a6c995dbe06d72267cb0412b3bc"
 
 # Patches from https://github.com/meta-qt5/qtwayland/commits/b5.9
 # 5.9.meta-qt5.2
diff --git a/recipes-qt/qt5/qtwebchannel_git.bb b/recipes-qt/qt5/qtwebchannel_git.bb
index 1e0796a..4469761 100644
--- a/recipes-qt/qt5/qtwebchannel_git.bb
+++ b/recipes-qt/qt5/qtwebchannel_git.bb
@@ -12,4 +12,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtdeclarative qtwebsockets"
 
-SRCREV = "61a638663c9061d7211849d3a9316661733a5ad9"
+SRCREV = "acb01cb27b6c4aead84435ec7115fecd2a8db336"
diff --git a/recipes-qt/qt5/qtwebengine/0001-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch b/recipes-qt/qt5/qtwebengine/0001-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch
deleted file mode 100644
index 0e9ea72..0000000
--- a/recipes-qt/qt5/qtwebengine/0001-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From d559da6ab0834aeb7307008015b6232e586fea00 Mon Sep 17 00:00:00 2001
-From: Cleiton Bueno <cleitonrbueno@gmail.com>
-Date: Thu, 24 Dec 2015 12:46:58 -0200
-Subject: [PATCH] chromium: Change false to FALSE and 1 to TRUE, FIX
- qtwebengine compile
-
-Signed-off-by: Cleiton Bueno <cleitonrbueno@gmail.com>
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- chromium/ui/gfx/codec/jpeg_codec.cc | 12 ++++++------
- 1 file changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/chromium/ui/gfx/codec/jpeg_codec.cc b/chromium/ui/gfx/codec/jpeg_codec.cc
-index 6d926378be..738d3fdedf 100644
---- a/chromium/ui/gfx/codec/jpeg_codec.cc
-+++ b/chromium/ui/gfx/codec/jpeg_codec.cc
-@@ -121,7 +121,7 @@ boolean EmptyOutputBuffer(jpeg_compress_struct* cinfo) {
-   // tell libjpeg where to write the next data
-   cinfo->dest->next_output_byte = &(*state->out)[state->image_buffer_used];
-   cinfo->dest->free_in_buffer = state->out->size() - state->image_buffer_used;
--  return 1;
-+  return TRUE;
- }
- 
- // Cleans up the JpegEncoderState to prepare for returning in the final form.
-@@ -262,7 +262,7 @@ bool JPEGCodec::Encode(const unsigned char* input, ColorFormat format,
-   cinfo.data_precision = 8;
- 
-   jpeg_set_defaults(&cinfo);
--  jpeg_set_quality(&cinfo, quality, 1);  // quality here is 0-100
-+  jpeg_set_quality(&cinfo, quality, TRUE);  // quality here is 0-100
- 
-   // set up the destination manager
-   jpeg_destination_mgr destmgr;
-@@ -274,7 +274,7 @@ bool JPEGCodec::Encode(const unsigned char* input, ColorFormat format,
-   JpegEncoderState state(output);
-   cinfo.client_data = &state;
- 
--  jpeg_start_compress(&cinfo, 1);
-+  jpeg_start_compress(&cinfo, TRUE);
- 
-   // feed it the rows, doing necessary conversions for the color format
- #ifdef JCS_EXTENSIONS
-@@ -360,7 +360,7 @@ void InitSource(j_decompress_ptr cinfo) {
- //   set to a positive value if TRUE is returned. A FALSE return should only
- //   be used when I/O suspension is desired."
- boolean FillInputBuffer(j_decompress_ptr cinfo) {
--  return false;
-+  return FALSE;
- }
- 
- // Skip data in the buffer. Since we have all the data at once, this operation
-@@ -488,8 +488,8 @@ bool JPEGCodec::Decode(const unsigned char* input, size_t input_size,
-   cinfo.client_data = &state;
- 
-   // fill the file metadata into our buffer
--  if (jpeg_read_header(&cinfo, true) != JPEG_HEADER_OK)
--    return false;
-+  if (jpeg_read_header(&cinfo, TRUE) != JPEG_HEADER_OK)
-+    return FALSE;
- 
-   // we want to always get RGB data out
-   switch (cinfo.jpeg_color_space) {
diff --git a/recipes-qt/qt5/qtwebengine/0001-functions.prf-allow-build-for-linux-oe-g-platform.patch b/recipes-qt/qt5/qtwebengine/0001-functions.prf-allow-build-for-linux-oe-g-platform.patch
deleted file mode 100644
index 275ef9e..0000000
--- a/recipes-qt/qt5/qtwebengine/0001-functions.prf-allow-build-for-linux-oe-g-platform.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 96746f09947cc36f6c9fc8631bc6a6e7f59efe24 Mon Sep 17 00:00:00 2001
-From: Frieder Schrempf <frieder.schrempf@online.de>
-Date: Mon, 1 Dec 2014 14:34:40 +0000
-Subject: [PATCH] functions.prf: allow build for linux-oe-g++ platform
-
-Upstream-Status: Inappropriate [OE specific]
-
-Signed-off-by: Frieder Schrempf <frieder.schrempf@online.de>
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- mkspecs/features/functions.prf | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/mkspecs/features/functions.prf b/mkspecs/features/functions.prf
-index 56894e58..ef418a4c 100644
---- a/mkspecs/features/functions.prf
-+++ b/mkspecs/features/functions.prf
-@@ -21,6 +21,12 @@ defineTest(isPlatformSupported) {
-       return(false)
-     }
-     gcc:!clang:!isGCCVersionSupported(): return(false)
-+  } else:linux-oe-g++* {
-+    !gcc:!clang {
-+      skipBuild("Qt WebEngine on Linux requires clang or GCC.")
-+      return(false)
-+    }
-+    gcc:!clang:!isGCCVersionSupported(): return(false)
-   } else:win32 {
-     winrt {
-       skipBuild("WinRT is not supported.")
diff --git a/recipes-qt/qt5/qtwebengine/0002-chromium-Force-host-toolchain-configuration.patch b/recipes-qt/qt5/qtwebengine/0002-chromium-Force-host-toolchain-configuration.patch
index 4a1a975..3b24e06 100644
--- a/recipes-qt/qt5/qtwebengine/0002-chromium-Force-host-toolchain-configuration.patch
+++ b/recipes-qt/qt5/qtwebengine/0002-chromium-Force-host-toolchain-configuration.patch
@@ -1,4 +1,4 @@
-From a0b1a742813d0846472fab4aada2388bf2d42d80 Mon Sep 17 00:00:00 2001
+From 5616656eb6d7423aaea107513209dac88c79d916 Mon Sep 17 00:00:00 2001
 From: Samuli Piippo <samuli.piippo@qt.io>
 Date: Wed, 15 Mar 2017 13:53:28 +0200
 Subject: [PATCH] chromium: Force host toolchain configuration
@@ -10,16 +10,16 @@ Upstream-Status: Inappropriate [OE specific]
 Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
- chromium/tools/gn/bootstrap/bootstrap.py | 12 ++++++------
- 1 file changed, 6 insertions(+), 6 deletions(-)
+ chromium/tools/gn/bootstrap/bootstrap.py | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/chromium/tools/gn/bootstrap/bootstrap.py b/chromium/tools/gn/bootstrap/bootstrap.py
-index 43d252b43e..e58347848e 100755
+index b1ff7e7..bccabbb 100755
 --- a/chromium/tools/gn/bootstrap/bootstrap.py
 +++ b/chromium/tools/gn/bootstrap/bootstrap.py
-@@ -298,14 +298,14 @@ def write_gn_ninja(path, root_gen_dir, options):
-     ld = os.environ.get('LD', 'link.exe')
-     ar = os.environ.get('AR', 'lib.exe')
+@@ -318,10 +318,10 @@ def write_gn_ninja(path, root_gen_dir, options):
+     ld = os.environ.get('LD', cxx)
+     ar = os.environ.get('AR', 'ar -X64')
    else:
 -    cc = os.environ.get('CC', 'cc')
 -    cxx = os.environ.get('CXX', 'c++')
@@ -29,12 +29,5 @@ index 43d252b43e..e58347848e 100755
 -    ar = os.environ.get('AR', 'ar')
 +    ar = os.environ.get('AR_host', 'ar')
  
--  cflags = os.environ.get('CFLAGS', '').split()
--  cflags_cc = os.environ.get('CXXFLAGS', '').split()
--  ldflags = os.environ.get('LDFLAGS', '').split()
-+  cflags = os.environ.get('CFLAGS_host', '').split()
-+  cflags_cc = os.environ.get('CXXFLAGS_host', '').split()
-+  ldflags = os.environ.get('LDFLAGS_host', '').split()
-   include_dirs = [root_gen_dir, SRC_ROOT]
-   libs = []
- 
+   # QTBUG-64759
+   # cflags = os.environ.get('CFLAGS', '').split()
diff --git a/recipes-qt/qt5/qtwebengine/0004-Force-host-toolchain-configuration.patch b/recipes-qt/qt5/qtwebengine/0004-Force-host-toolchain-configuration.patch
index bda0ba1..464c764 100644
--- a/recipes-qt/qt5/qtwebengine/0004-Force-host-toolchain-configuration.patch
+++ b/recipes-qt/qt5/qtwebengine/0004-Force-host-toolchain-configuration.patch
@@ -1,4 +1,4 @@
-From 9bdd03ad0bbb221ad7bffe0e570605c21c28b1b5 Mon Sep 17 00:00:00 2001
+From 2a3c39550955ed44cfc8410ab2da124c58ca66c0 Mon Sep 17 00:00:00 2001
 From: Samuli Piippo <samuli.piippo@qt.io>
 Date: Wed, 15 Mar 2017 13:53:28 +0200
 Subject: [PATCH] Force host toolchain configuration
@@ -18,7 +18,7 @@ Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
  2 files changed, 8 insertions(+), 8 deletions(-)
 
 diff --git a/src/buildtools/configure_host.pro b/src/buildtools/configure_host.pro
-index f1b3d47b..12123729 100644
+index dd0d3e3..70161c8 100644
 --- a/src/buildtools/configure_host.pro
 +++ b/src/buildtools/configure_host.pro
 @@ -4,7 +4,7 @@ TEMPLATE = aux
@@ -30,7 +30,7 @@ index f1b3d47b..12123729 100644
  !isEmpty(QT_TARGET_ARCH): GN_TARGET_CPU = $$gnArch($$QT_TARGET_ARCH)
  else: GN_TARGET_CPU = $$GN_HOST_CPU
  GN_OS = $$gnOS()
-@@ -29,9 +29,9 @@ GN_CONTENTS = \
+@@ -31,9 +31,9 @@ GN_CONTENTS = \
  "import(\"//build/config/sysroot.gni\")" \
  "import(\"//build/toolchain/gcc_toolchain.gni\")" \
  "gcc_toolchain(\"host\") {" \
@@ -42,8 +42,8 @@ index f1b3d47b..12123729 100644
 +"  ld = \"$$which(g++)\" " \
  "  ar = \"$$which(ar)\" " \
  "  nm = \"$$which(nm)\" " \
- "  toolchain_args = { " \
-@@ -42,9 +42,9 @@ GN_CONTENTS = \
+ "  extra_cppflags = \"$$GN_HOST_EXTRA_CPPFLAGS\" " \
+@@ -45,9 +45,9 @@ GN_CONTENTS = \
  "  } " \
  "}" \
  "gcc_toolchain(\"v8_snapshot\") {" \
@@ -57,10 +57,10 @@ index f1b3d47b..12123729 100644
  "  nm = \"$$which(nm)\" " \
  "  toolchain_args = { " \
 diff --git a/src/core/config/linux.pri b/src/core/config/linux.pri
-index 714c864d..f66ca551 100644
+index 6f7b27f..1b9434b 100644
 --- a/src/core/config/linux.pri
 +++ b/src/core/config/linux.pri
-@@ -98,7 +98,7 @@ contains(QT_ARCH, "mips"):!host_build {
+@@ -91,7 +91,7 @@ contains(QT_ARCH, "mips") {
  
  host_build {
      gn_args += custom_toolchain=\"$$QTWEBENGINE_OUT_ROOT/src/toolchain:host\"
diff --git a/recipes-qt/qt5/qtwebengine/0005-chromium-musl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch b/recipes-qt/qt5/qtwebengine/0005-chromium-musl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch
index bf1f189..1e18795 100644
--- a/recipes-qt/qt5/qtwebengine/0005-chromium-musl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch
+++ b/recipes-qt/qt5/qtwebengine/0005-chromium-musl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch
@@ -1,19 +1,41 @@
-From e695f37fc52defd1b96664b003444692e9b6cb65 Mon Sep 17 00:00:00 2001
+From f6c6a5522f006b14c4d9c4daa23f96c4e8e65a32 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 14:09:06 -0700
 Subject: [PATCH] chromium: musl: Avoid mallinfo() APIs on non-glibc/linux
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+ chromium/base/process/process_metrics_posix.cc    | 4 ++--
  chromium/base/trace_event/malloc_dump_provider.cc | 3 ++-
  chromium/content/child/content_child_helpers.cc   | 2 +-
- 2 files changed, 3 insertions(+), 2 deletions(-)
+ 3 files changed, 5 insertions(+), 4 deletions(-)
 
+diff --git a/chromium/base/process/process_metrics_posix.cc b/chromium/base/process/process_metrics_posix.cc
+index 0eb5c1f..8af7799 100644
+--- a/chromium/base/process/process_metrics_posix.cc
++++ b/chromium/base/process/process_metrics_posix.cc
+@@ -94,14 +94,14 @@ size_t ProcessMetrics::GetMallocUsage() {
+   malloc_statistics_t stats = {0};
+   malloc_zone_statistics(nullptr, &stats);
+   return stats.size_in_use;
+-#elif defined(OS_LINUX) || defined(OS_ANDROID)
++#elif defined(__GLIBC__) || defined(OS_ANDROID)
+   struct mallinfo minfo = mallinfo();
+ #if defined(USE_TCMALLOC)
+   return minfo.uordblks;
+ #else
+   return minfo.hblkhd + minfo.arena;
+ #endif
+-#elif defined(OS_FUCHSIA)
++#else
+   // TODO(fuchsia): Not currently exposed. https://crbug.com/735087.
+   return 0;
+ #endif
 diff --git a/chromium/base/trace_event/malloc_dump_provider.cc b/chromium/base/trace_event/malloc_dump_provider.cc
-index 7d0cb57931..10be59ebad 100644
+index 14ba0a2..e5d9581 100644
 --- a/chromium/base/trace_event/malloc_dump_provider.cc
 +++ b/chromium/base/trace_event/malloc_dump_provider.cc
-@@ -210,6 +210,7 @@ MallocDumpProvider::~MallocDumpProvider() {}
+@@ -197,6 +197,7 @@ MallocDumpProvider::~MallocDumpProvider() {}
  // the current process.
  bool MallocDumpProvider::OnMemoryDump(const MemoryDumpArgs& args,
                                        ProcessMemoryDump* pmd) {
@@ -21,7 +43,7 @@ index 7d0cb57931..10be59ebad 100644
    size_t total_virtual_size = 0;
    size_t resident_size = 0;
    size_t allocated_objects_size = 0;
-@@ -321,7 +322,7 @@ bool MallocDumpProvider::OnMemoryDump(const MemoryDumpArgs& args,
+@@ -317,7 +318,7 @@ bool MallocDumpProvider::OnMemoryDump(const MemoryDumpArgs& args,
      pmd->DumpHeapUsage(metrics_by_context, overhead, "malloc");
    }
    tid_dumping_heap_ = kInvalidThreadId;
@@ -31,7 +53,7 @@ index 7d0cb57931..10be59ebad 100644
  }
  
 diff --git a/chromium/content/child/content_child_helpers.cc b/chromium/content/child/content_child_helpers.cc
-index 7ddeb4d16a..b8c73b09c5 100644
+index 7ddeb4d..b8c73b0 100644
 --- a/chromium/content/child/content_child_helpers.cc
 +++ b/chromium/content/child/content_child_helpers.cc
 @@ -25,7 +25,7 @@ namespace content {
diff --git a/recipes-qt/qt5/qtwebengine/0005-musl-don-t-use-pvalloc-as-it-s-not-available-on-musl.patch b/recipes-qt/qt5/qtwebengine/0005-musl-don-t-use-pvalloc-as-it-s-not-available-on-musl.patch
new file mode 100644
index 0000000..38fa872
--- /dev/null
+++ b/recipes-qt/qt5/qtwebengine/0005-musl-don-t-use-pvalloc-as-it-s-not-available-on-musl.patch
@@ -0,0 +1,37 @@
+From 0fd704beb18948577e793b73c569dc933c478f2e Mon Sep 17 00:00:00 2001
+From: Samuli Piippo <samuli.piippo@qt.io>
+Date: Tue, 12 Dec 2017 16:06:14 +0200
+Subject: [PATCH] musl: don't use pvalloc as it's not available on musl
+
+Change-Id: I7145463ac7b9560e7459d3384a3db108bd727403
+Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
+---
+ src/core/api/qtbug-61521.cpp | 8 --------
+ 1 file changed, 8 deletions(-)
+
+diff --git a/src/core/api/qtbug-61521.cpp b/src/core/api/qtbug-61521.cpp
+index 002a1af..8fd2da3 100644
+--- a/src/core/api/qtbug-61521.cpp
++++ b/src/core/api/qtbug-61521.cpp
+@@ -74,10 +74,6 @@ SHIM_SYMBOL_VERSION(valloc);
+ void* __valloc(size_t size)
+     SHIM_ALIAS_SYMBOL(ShimValloc);
+ 
+-SHIM_SYMBOL_VERSION(pvalloc);
+-void* __pvalloc(size_t size)
+-    SHIM_ALIAS_SYMBOL(ShimPvalloc);
+-
+ SHIM_SYMBOL_VERSION(posix_memalign);
+ int __posix_memalign(void** r, size_t a, size_t s)
+     SHIM_ALIAS_SYMBOL(ShimPosixMemalign);
+@@ -110,10 +106,6 @@ SHIM_HIDDEN void* ShimValloc(size_t size) {
+     return  valloc(size);
+ }
+ 
+-SHIM_HIDDEN void* ShimPvalloc(size_t size) {
+-    return pvalloc(size);
+-}
+-
+ SHIM_HIDDEN int ShimPosixMemalign(void** r, size_t a, size_t s) {
+     return posix_memalign(r,a,s);
+ }
diff --git a/recipes-qt/qt5/qtwebengine/0005-tests-make-accessibility-tests-conditional.patch b/recipes-qt/qt5/qtwebengine/0005-tests-make-accessibility-tests-conditional.patch
deleted file mode 100644
index 8b82010..0000000
--- a/recipes-qt/qt5/qtwebengine/0005-tests-make-accessibility-tests-conditional.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 006f08373cbaa8485311f491ab8e67433c0e9ad6 Mon Sep 17 00:00:00 2001
-From: Daniel Mack <daniel@zonque.org>
-Date: Tue, 24 Oct 2017 15:46:19 +0200
-Subject: [PATCH] tests: make accessibility tests conditional
-
-Only test the accessibility functions if accessibility was enabled in the Qt
-config.
----
- tests/auto/widgets/widgets.pro | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/tests/auto/widgets/widgets.pro b/tests/auto/widgets/widgets.pro
-index 441eea0f..7bab18f0 100644
---- a/tests/auto/widgets/widgets.pro
-+++ b/tests/auto/widgets/widgets.pro
-@@ -1,7 +1,6 @@
- TEMPLATE = subdirs
- 
- SUBDIRS += \
--    qwebengineaccessibility \
-     qwebenginedefaultsurfaceformat \
-     qwebenginedownloads \
-     qwebenginefaviconmanager \
-@@ -14,6 +13,10 @@ SUBDIRS += \
-     qwebenginesettings \
-     qwebengineview
- 
-+qtConfig(accessibility) {
-+    SUBDIRS += qwebengineaccessibility
-+}
-+
- contains(WEBENGINE_CONFIG, use_spellchecker):!cross_compile {
-     !contains(WEBENGINE_CONFIG, use_native_spellchecker) {
-         SUBDIRS += qwebenginespellcheck
--- 
-2.13.6
-
diff --git a/recipes-qt/qt5/qtwebengine/0006-musl-link-against-libexecinfo.patch b/recipes-qt/qt5/qtwebengine/0006-musl-link-against-libexecinfo.patch
new file mode 100644
index 0000000..cabc598
--- /dev/null
+++ b/recipes-qt/qt5/qtwebengine/0006-musl-link-against-libexecinfo.patch
@@ -0,0 +1,24 @@
+From 59fd9db95db829e51840df09962f7c6baf484246 Mon Sep 17 00:00:00 2001
+From: Samuli Piippo <samuli.piippo@qt.io>
+Date: Thu, 14 Dec 2017 11:28:10 +0200
+Subject: [PATCH] musl: link against libexecinfo
+
+Change-Id: Ifada60f9c72691973612850121f6fb152d70839a
+Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
+---
+ src/core/core_module.pro | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/core/core_module.pro b/src/core/core_module.pro
+index 2409ccb..e41e5a9 100644
+--- a/src/core/core_module.pro
++++ b/src/core/core_module.pro
+@@ -45,7 +45,7 @@ else: QMAKE_LFLAGS += $$NINJA_LFLAGS
+ POST_TARGETDEPS += $$NINJA_TARGETDEPS
+ 
+ 
+-LIBS_PRIVATE += -L$$api_library_path
++LIBS_PRIVATE += -L$$api_library_path -lexecinfo
+ CONFIG *= no_smart_library_merge
+ osx {
+     LIBS_PRIVATE += -Wl,-force_load,$${api_library_path}$${QMAKE_DIR_SEP}lib$${api_library_name}.a
diff --git a/recipes-qt/qt5/qtwebengine/0008-chromium-musl-linux-glibc-make-the-distinction.patch b/recipes-qt/qt5/qtwebengine/0008-chromium-musl-linux-glibc-make-the-distinction.patch
index 7a778c2..d6de1c0 100644
--- a/recipes-qt/qt5/qtwebengine/0008-chromium-musl-linux-glibc-make-the-distinction.patch
+++ b/recipes-qt/qt5/qtwebengine/0008-chromium-musl-linux-glibc-make-the-distinction.patch
@@ -1,4 +1,4 @@
-From d0621f9278ddd04c05b6ab3ef638be65f96f1bd6 Mon Sep 17 00:00:00 2001
+From 2ed7538fb95ce3bb8a5917c648e2361f85b9c67b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 14:54:38 -0700
 Subject: [PATCH] chromium: musl: linux != glibc, make the distinction
@@ -9,12 +9,12 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/chromium/base/allocator/allocator_check.cc b/chromium/base/allocator/allocator_check.cc
-index 5a0564d2f3..8c2dc6491d 100644
+index 9cd5d22..1e70095 100644
 --- a/chromium/base/allocator/allocator_check.cc
 +++ b/chromium/base/allocator/allocator_check.cc
-@@ -21,7 +21,7 @@ bool IsAllocatorInitialized() {
- #if defined(OS_WIN) && defined(ALLOCATOR_SHIM)
-   // Set by allocator_shim_win.cc when the shimmed _set_new_mode() is called.
+@@ -27,7 +27,7 @@ bool IsAllocatorInitialized() {
+   // Set by allocator_shim_override_ucrt_symbols_win.h when the
+   // shimmed _set_new_mode() is called.
    return g_is_win_shim_layer_initialized;
 -#elif defined(OS_LINUX) && defined(USE_TCMALLOC) && \
 +#elif defined(__GLIBC__) && defined(USE_TCMALLOC) && \
diff --git a/recipes-qt/qt5/qtwebengine/0014-chromium-musl-Adjust-default-pthread-stack-size.patch b/recipes-qt/qt5/qtwebengine/0014-chromium-musl-Adjust-default-pthread-stack-size.patch
index f1cc205..652b89e 100644
--- a/recipes-qt/qt5/qtwebengine/0014-chromium-musl-Adjust-default-pthread-stack-size.patch
+++ b/recipes-qt/qt5/qtwebengine/0014-chromium-musl-Adjust-default-pthread-stack-size.patch
@@ -1,16 +1,16 @@
-From 72a77c994434ecb708b2790ba9efaf1decc02503 Mon Sep 17 00:00:00 2001
+From d42b48975e92cfc4510030315ad8093bece4b7c5 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 16:41:23 -0700
 Subject: [PATCH] chromium: musl: Adjust default pthread stack size
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- chromium/base/threading/platform_thread_linux.cc                     | 3 ++-
- chromium/third_party/WebKit/Source/platform/heap/StackFrameDepth.cpp | 4 ++--
+ chromium/base/threading/platform_thread_linux.cc              | 3 ++-
+ chromium/third_party/WebKit/Source/platform/wtf/StackUtil.cpp | 4 ++--
  2 files changed, 4 insertions(+), 3 deletions(-)
 
 diff --git a/chromium/base/threading/platform_thread_linux.cc b/chromium/base/threading/platform_thread_linux.cc
-index 92fbda5ee1..c41579d4ed 100644
+index 8d411ed..4b56cf3 100644
 --- a/chromium/base/threading/platform_thread_linux.cc
 +++ b/chromium/base/threading/platform_thread_linux.cc
 @@ -175,7 +175,8 @@ void TerminateOnThread() {}
@@ -23,25 +23,25 @@ index 92fbda5ee1..c41579d4ed 100644
  #else
    // ThreadSanitizer bloats the stack heavily. Evidence has been that the
    // default stack size isn't enough for some browser tests.
-diff --git a/chromium/third_party/WebKit/Source/platform/heap/StackFrameDepth.cpp b/chromium/third_party/WebKit/Source/platform/heap/StackFrameDepth.cpp
-index 1d164f510a..3358deb256 100644
---- a/chromium/third_party/WebKit/Source/platform/heap/StackFrameDepth.cpp
-+++ b/chromium/third_party/WebKit/Source/platform/heap/StackFrameDepth.cpp
-@@ -68,7 +68,7 @@ size_t StackFrameDepth::getUnderestimatedStackSize() {
+diff --git a/chromium/third_party/WebKit/Source/platform/wtf/StackUtil.cpp b/chromium/third_party/WebKit/Source/platform/wtf/StackUtil.cpp
+index 13c3f90..07308e0 100644
+--- a/chromium/third_party/WebKit/Source/platform/wtf/StackUtil.cpp
++++ b/chromium/third_party/WebKit/Source/platform/wtf/StackUtil.cpp
+@@ -28,7 +28,7 @@ size_t GetUnderestimatedStackSize() {
  // FIXME: On Mac OSX and Linux, this method cannot estimate stack size
  // correctly for the main thread.
  
--#if defined(__GLIBC__) || OS(ANDROID) || OS(FREEBSD)
-+#if OS(LINUX) || OS(ANDROID) || OS(FREEBSD)
+-#if defined(__GLIBC__) || defined(OS_ANDROID) || defined(OS_FREEBSD) || \
++#if defined(OS_LINUX) || defined(OS_ANDROID) || defined(OS_FREEBSD) || \
+     defined(OS_FUCHSIA)
    // pthread_getattr_np() can fail if the thread is not invoked by
    // pthread_create() (e.g., the main thread of webkit_unit_tests).
-   // If so, a conservative size estimate is returned.
-@@ -135,7 +135,7 @@ size_t StackFrameDepth::getUnderestimatedStackSize() {
+@@ -96,7 +96,7 @@ size_t GetUnderestimatedStackSize() {
  }
  
- void* StackFrameDepth::getStackStart() {
--#if defined(__GLIBC__) || OS(ANDROID) || OS(FREEBSD)
-+#if OS(LINUX) || OS(ANDROID) || OS(FREEBSD)
+ void* GetStackStart() {
+-#if defined(__GLIBC__) || defined(OS_ANDROID) || defined(OS_FREEBSD) || \
++#if defined(OS_LINUX) || defined(OS_ANDROID) || defined(OS_FREEBSD) || \
+     defined(OS_FUCHSIA)
    pthread_attr_t attr;
    int error;
- #if OS(FREEBSD)
diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index 50a98b6..f88e5e7 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -13,26 +13,23 @@ LIC_FILES_CHKSUM = " \
 "
 
 DEPENDS += " \
+    libpng-native \
+    nss-native \
+    nspr-native \
     ninja-native \
     yasm-native \
     qtwebchannel \
     qtbase qtdeclarative qtxmlpatterns qtquickcontrols qtquickcontrols2 \
     qtlocation \
-    libdrm fontconfig pixman openssl pango cairo icu pciutils \
+    libdrm fontconfig pixman openssl pango cairo icu pciutils nss \
     libcap \
     gperf-native \
     ${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa-lib', '', d)} \
 "
 
-DEPENDS += "yasm-native"
 DEPENDS_append_libc-musl = " libexecinfo"
 
-EXTRA_QMAKEVARS_PRE += "GYP_CONFIG+=use_system_yasm \
-                        GYP_CONFIG+=generate_character_data=0 \
-                        GYP_CONFIG+=use_allocator=none \
-                        GYP_CONFIG+=use_experimental_allocator_shim=false \
-"
-EXTRA_QMAKEVARS_CONFIGURE += "-feature-system-ninja -no-feature-system-gn"
+EXTRA_QMAKEVARS_CONFIGURE += "-feature-webengine-system-ninja -no-feature-webengine-system-gn"
 
 # chromium/third_party/openh264/openh264.gyp adds
 # -Wno-format to openh264_cflags_add
@@ -42,22 +39,26 @@ EXTRA_QMAKEVARS_CONFIGURE += "-feature-system-ninja -no-feature-system-gn"
 # http://errors.yoctoproject.org/Errors/Details/150333/
 SECURITY_STRINGFORMAT = ""
 
-# To use system ffmpeg you need to enable also libwebp, opus, vpx											    
+# To use system ffmpeg you need to enable also libwebp, opus, vpx
 # Only depenedencies available in oe-core are enabled by default
-PACKAGECONFIG ??= "libwebp flac libevent libxslt speex nss"
-PACKAGECONFIG[opus] = "WEBENGINE_CONFIG+=use_system_opus,,libopus"
-PACKAGECONFIG[icu] = "WEBENGINE_CONFIG+=use_system_icu,,icu"
-PACKAGECONFIG[ffmpeg] = "WEBENGINE_CONFIG+=use_system_ffmpeg,,libav"
-PACKAGECONFIG[libwebp] = "WEBENGINE_CONFIG+=use_system_libwebp,,libwebp"
-PACKAGECONFIG[flac] = "WEBENGINE_CONFIG+=use_system_flac,,flac"
-PACKAGECONFIG[libevent] = "WEBENGINE_CONFIG+=use_system_libevent,,libevent"
-PACKAGECONFIG[libxslt] = "WEBENGINE_CONFIG+=use_system_libxslt,,libxslt"
-PACKAGECONFIG[speex] = "WEBENGINE_CONFIG+=use_system_speex,,speex"
-PACKAGECONFIG[vpx] = "WEBENGINE_CONFIG+=use_system_vpx,,libvpx"
-PACKAGECONFIG[webrtc] = "WEBENGINE_CONFIG+=use_webrtc,,libvpx"
-PACKAGECONFIG[nss] = "WEBENGINE_CONFIG+=use_nss,,nss"
-
-EXTRA_QMAKEVARS_PRE += "${PACKAGECONFIG_CONFARGS}"
+PACKAGECONFIG ??= "libwebp libevent libpng"
+PACKAGECONFIG[icu] = "-feature-webengine-system-icu,-no-feature-webengine-system-icu,icu"
+PACKAGECONFIG[ffmpeg] = "-feature-webengine-system-ffmpeg,-no-feature-webengine-system-ffmpeg,libav"
+PACKAGECONFIG[webrtc] = "-feature-webengine-webrtc,-no-feature-webengine-webrtc,libvpx"
+PACKAGECONFIG[libwebp] = "-feature-webengine-system-libwebp,-no-feature-webengine-system-libwebp,libwebp"
+PACKAGECONFIG[opus] = "-feature-webengine-system-opus,-no-feature-webengine-system-opus,libopus"
+PACKAGECONFIG[libvpx] = "-feature-webengine-system-libvpx,-no-feature-webengine-system-libvpx,libvpx"
+PACKAGECONFIG[libevent] = "-feature-webengine-system-libevent,-no-feature-webengine-system-libevent,libevent"
+PACKAGECONFIG[libpng] = "-feature-webengine-system-png,-no-feature-webengine-system-png,libpng"
+PACKAGECONFIG[harfbuzz] = "-feature-webengine-system-harfbuzz,-no-feature-webengine-system-harfbuzz,harfbuzz"
+PACKAGECONFIG[glib] = "-feature-webengine-system-glib,-no-feature-webengine-system-glib,glib"
+PACKAGECONFIG[zlib] = "-feature-webengine-system-zlib,-no-feature-webengine-system-zlib,zlib"
+PACKAGECONFIG[protobuf] = "-feature-webengine-system-protobuf,-no-feature-webengine-system-protobuf,protobuf"
+PACKAGECONFIG[jasoncpp] = "-feature-webengine-system-jsoncpp,-no-feature-webengine-system-jsoncpp,jasoncpp"
+PACKAGECONFIG[libxml2] = "-feature-webengine-system-libxml2,-no-feature-webengine-system-libxml2,libxml2"
+PACKAGECONFIG[minizip] = "-feature-webengine-system-minizip,-no-feature-webengine-system-minizip,minizip"
+
+EXTRA_QMAKEVARS_CONFIGURE += "${PACKAGECONFIG_CONFARGS}"
 
 COMPATIBLE_MACHINE = "(-)"
 COMPATIBLE_MACHINE_x86 = "(.*)"
@@ -79,18 +80,10 @@ def gettext_oeconf(d):
 require qt5.inc
 require qt5-git.inc
 
+export GN_PKG_CONFIG_HOST = "${STAGING_BINDIR_NATIVE}/pkg-config-native"
+export GN_HOST_TOOLCHAIN_EXTRA_CPPFLAGS = "-I${STAGING_DIR_NATIVE}/usr/include"
+
 do_configure() {
-    # Disable autodetection from sysroot:
-    sed -e 's/packagesExist([^)]*vpx[^)]*):/false:/g'\
-        -e 's/config_libvpx:/false:/g' \
-        -e 's/config_srtp:/false:/g' \
-        -e 's/config_snappy:/false:/g' \
-        -e 's/packagesExist(nss):/false:/g' \
-        -e 's/packagesExist(minizip, zlib):/false:/g' \
-        -e 's/packagesExist(libwebp,libwebpdemux):/false:/g' \
-        -e 's/packagesExist(libxml-2.0,libxslt):/false:/g'\
-        -e 's/^ *packagesExist($$package):/false:/g' \
-        -i ${S}/mkspecs/features/configure.prf
 
     # qmake can't find the OE_QMAKE_* variables on it's own so directly passing them as
     # arguments here
@@ -127,28 +120,27 @@ RDEPENDS_${PN}-examples += " \
     qtdeclarative-qmlplugins \
 "
 
-QT_MODULE_BRANCH_CHROMIUM = "56-based"
+QT_MODULE_BRANCH_CHROMIUM = "61-based"
 
 # Patches from https://github.com/meta-qt5/qtwebengine/commits/b5.9
 # 5.9.meta-qt5.3
 SRC_URI += " \
     ${QT_GIT}/qtwebengine-chromium.git;name=chromium;branch=${QT_MODULE_BRANCH_CHROMIUM};protocol=${QT_GIT_PROTOCOL};destsuffix=git/src/3rdparty \
-    file://0001-functions.prf-allow-build-for-linux-oe-g-platform.patch \
     file://0002-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch \
     file://0003-Include-dependency-to-QCoreApplication-translate.patch \
     file://0004-Force-host-toolchain-configuration.patch \
-    file://0005-tests-make-accessibility-tests-conditional.patch \
 "
 
 # Patches from https://github.com/meta-qt5/qtwebengine-chromium/commits/56-based 
 # 56-based.meta-qt5.2
 SRC_URI += " \
-    file://0001-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch;patchdir=src/3rdparty \
     file://0002-chromium-Force-host-toolchain-configuration.patch;patchdir=src/3rdparty \
     file://0003-chromium-workaround-for-too-long-.rps-file-name.patch;patchdir=src/3rdparty \
 "
 
 SRC_URI_append_libc-musl = "\
+    file://0005-musl-don-t-use-pvalloc-as-it-s-not-available-on-musl.patch \
+    file://0006-musl-link-against-libexecinfo.patch \
     file://0004-chromium-musl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch;patchdir=src/3rdparty \
     file://0005-chromium-musl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch;patchdir=src/3rdparty \
     file://0006-chromium-musl-include-fcntl.h-for-loff_t.patch;patchdir=src/3rdparty \
@@ -164,8 +156,8 @@ SRC_URI_append_libc-musl = "\
     file://0016-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch;patchdir=src/3rdparty \
 "
 
-SRCREV_qtwebengine = "c11c2c8981e647c1eb2c6753ce77d436b92fff87"
-SRCREV_chromium = "cfe8c60903b327ac94406661350f4ac05aa8c21b"
+SRCREV_qtwebengine = "efa6d3f0d3a01753dd40823ce119e7d4f9765c8e"
+SRCREV_chromium = "e36dcec23b79a52fd7794ed2fad49bbf65a8146b"
 SRCREV = "${SRCREV_qtwebengine}"
 
 SRCREV_FORMAT = "qtwebengine_chromium"
diff --git a/recipes-qt/qt5/qtwebsockets_git.bb b/recipes-qt/qt5/qtwebsockets_git.bb
index eb3ab51..220f259 100644
--- a/recipes-qt/qt5/qtwebsockets_git.bb
+++ b/recipes-qt/qt5/qtwebsockets_git.bb
@@ -1,7 +1,7 @@
 require qt5.inc
 require qt5-git.inc
 
-LICENSE = "GFDL-1.3 & (GPL-3 | LGPL-3.0)"
+LICENSE = "GFDL-1.3 & (GPL-3 | LGPL-3.0) | The-Qt-Company-Commercial"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.GPL2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
     file://LICENSE.GPL3;md5=d32239bcb673463ab874e80d47fae504 \
@@ -11,4 +11,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative"
 
-SRCREV = "492981b93295f575ad77b6767dc5b8851287aa2e"
+SRCREV = "0e4b43383dd826b5927f6276033f52ede1fa7936"
diff --git a/recipes-qt/qt5/qtwebview_git.bb b/recipes-qt/qt5/qtwebview_git.bb
index 79089ae..9c84949 100644
--- a/recipes-qt/qt5/qtwebview_git.bb
+++ b/recipes-qt/qt5/qtwebview_git.bb
@@ -19,4 +19,4 @@ COMPATIBLE_MACHINE_armv7a = "(.*)"
 COMPATIBLE_MACHINE_armv7ve = "(.*)"
 COMPATIBLE_MACHINE_aarch64 = "(.*)"
 
-SRCREV = "ec640efd1d82cdc88157159cbaa048815696ee25"
+SRCREV = "54ea23243ca84ec5f086abf6c2278a025758b6ce"
diff --git a/recipes-qt/qt5/qtx11extras_git.bb b/recipes-qt/qt5/qtx11extras_git.bb
index d15fc2d..0646ef0 100644
--- a/recipes-qt/qt5/qtx11extras_git.bb
+++ b/recipes-qt/qt5/qtx11extras_git.bb
@@ -13,4 +13,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "160435b0eb076c31a021004eeede143fc265bce4"
+SRCREV = "33e3fcc1fb1eb614f8b452296f2d4c4353c413c6"
diff --git a/recipes-qt/qt5/qtxmlpatterns_git.bb b/recipes-qt/qt5/qtxmlpatterns_git.bb
index 8b706dd..e44823a 100644
--- a/recipes-qt/qt5/qtxmlpatterns_git.bb
+++ b/recipes-qt/qt5/qtxmlpatterns_git.bb
@@ -18,7 +18,7 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "8d7e1e0ec06724a4d332c050e9260530c708e773"
+SRCREV = "8b831bdb513b4f6b7567c171d09875b14214c5c4"
 
 BBCLASSEXTEND =+ "native nativesdk"
 
-- 
2.7.4


