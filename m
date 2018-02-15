Return-Path: <mikko.gronoff@qt.io>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0115.outbound.protection.outlook.com [104.47.2.115])
	by mail.openembedded.org (Postfix) with ESMTP id 852E277F76
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Feb 2018 10:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=qtcompany.onmicrosoft.com; s=selector1-qt-io;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=UDjGwTGEXfz/VyNfyllCazePxcOqCwj872mTqnHo0vg=;
	b=H7y5LDjl104wLj80BSN4cDWxYTIA01YX0VGwZteWTPc2/Ni6XoQVtnIAcNuYuIYu7lMB7U3VAmKooTIvW/KQSvkRGz8ulGjTYBKmaJ6C+QU+Bbh0peyEuCuVllhAI+/jNcyA7Wic/zdUKfI73hO62sYj4rc/tbN1i+61IbcGgeU=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mikko.gronoff@qt.io; 
Received: from qt.intra.qt (192.89.120.53) by
	HE1PR0201MB2170.eurprd02.prod.outlook.com (2603:10a6:3:20::17) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.506.18;
	Thu, 15 Feb 2018 06:48:18 +0000
From: Mikko Gronoff <mikko.gronoff@qt.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Feb 2018 08:47:57 +0200
Message-Id: <1518677277-15210-1-git-send-email-mikko.gronoff@qt.io>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [192.89.120.53]
X-ClientProxiedBy: HE1PR0102CA0004.eurprd01.prod.exchangelabs.com
	(2603:10a6:7:14::17) To HE1PR0201MB2170.eurprd02.prod.outlook.com
	(2603:10a6:3:20::17)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e502ca4f-3f65-4f7b-2e82-08d5744018d8
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(4534165)(4627221)(201703031133081)(201702281549075)(5600026)(4604075)(2017052603307)(7153060)(7193020);
	SRVR:HE1PR0201MB2170; 
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0201MB2170;
	3:AeZoCpxM/+4jpEwa9/qILOYkXpOf50p2vFJKC7n0mrvmkgzUSA4xfoSdYnVW3BFkBYBEW9vOmLpGpwxjgjAZJuokdKsZw7rGiknFAb3sW+pDux/4mmc4u+oXeH6gCyLv2wmRR0YT1xMI5FTLl/G41bUXr/Ltjdr+35UZMYVwyirEkdUrw1EgVCo+eTiv8quBguAG0pkqmtxNWx7mj1LJ/E5l2t0G6CfK0nwAFZJXngrrY72ksC24hmdItLz3T9xV;
	25:KqkGj1sOQxZoMzYjCoZvVszQ6J7nt53oB5m6Thkw6UjK4p3rzVVflQFNID1rIeioxEgX2kBStujWdL9KSIt3B+PJceLLBF9R8e1ouhmA/Gx+rVbmjrtQHaVX+To249AE1lursjtv6q4w5P7Vj0WyJiswx8FTLtHiXL6SxGMk22E5ryZx0BdgJh9gcVJhHc+tOrAUWF8ONoP0v4OMN1tybmeZkye8m5gyllNO3VXc+gpXqrLC4d1PVAfW0JDGF4VQAj4rBAHl1U7x6MpObTYlbJ5/NQSGj4pHtsvLtyRmn1WIIdvbz5vjx+tWCR3PqKZie6cp263ll/A2mPbcN4HrIA==;
	31:rtxP5akCpythlB3HSqfVssr07ZzWVfqjX86hL347VWRCOBZSN5WvbWfakkyqfxvAGoBSl4wY/s3bslnrlIOPDU4Iij9HihfaIyWwSfpNBXryNI/q948+dicp5TsIrFSEabFZLA65V+LSrZM+4Sin/4PamiW6Zc+0+dyB7Mnfvo2SIspYykaGEkvnPKTCCA09ETqxfuTtKmTXhA7ooWysrAFLxOGlZXeuyOTwKdOSKoU=
X-MS-TrafficTypeDiagnostic: HE1PR0201MB2170:
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0201MB2170;
	20:PxmTDou1LXG3aOq6bjXnuIQ8LNPT8DMZwKQqQz7DPLFGzdbulrtDAnn2/h1Yw7Y0+Q7UYmwRGWtVwsTd9mKykKadeaadfETDlNZdQdPqNn92IjkEny56VGJp/twY1IXTq/1t+DNOlJ72aWuQ6hhvRJ0PzRVrun/TO8tgDwnFI0HgaeAUXcfd7JBKdgTTuOhdCXuVZU1jY7Y5CuECYnLIqOI5nRBlO5Ml7AWdPi1RwCyHVTacZ2OrnCea5f8UUgxnc3WJgbeFhZS7gFf0F96QcDiSHv+i9Ip0varvfNbpp4n5AZD+111XrLfZFK+QQ2K5SLU74mjSa+xICB5ppT7goUTrHkSkMGX/Zb5iXYqq6M9ZoLZD18JT2G17ntlaJq5/MsEdbGtIhWp8P1brbo4PVQu3kgSBERsHhy1rbTrwE2cUMS2RqYaLLdSkl1tojTvfLZtlLKuo0H09oz53Xpq4cbLZ0a17Q7/LrHRca6FdRJpb40UWdRlAYNI9x/BodVEx;
	4:DhOyx/DsfOEDvSJvvZnzVXex1m3IjtMIbJGUSaE1xvGZ0Y3qTo7OSJfxtfmXenLCzeSLGWhwn0APtEKIPWKa5DBsLIwjUD2EwE8jqcQYRBd6Y18zeH11mcDY6KBwY3jItrWtNbZu4HNnf/1eD/onxdyO3XnBSuPPm03RZsMhzAxQbgfU9KhHuiOl2wKzvyxaLY2ZGcDyssyZ1SUbHksx6aRPLxghi9u3RhH83xdtz0zEtIcALVHDp7iQzwkWr+OZjNMvR9AgIfXH4IddyN19qAkgMLtPDSI4VHoS+cE/QRaP3YXuKy5Frgv3p5WQRx2yVDUFiPVw34+iWEf5ZiixhdmIT4U+gIv+QFEoAn/kr/0=
X-Microsoft-Antispam-PRVS: <HE1PR0201MB21709B8839E407AD0EFF929DE9F40@HE1PR0201MB2170.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(31051911155226)(166708455590820);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040501)(2401047)(8121501046)(5005006)(3231101)(944501161)(10201501046)(93006095)(93001095)(3002001)(6041288)(20161123558120)(20161123560045)(20161123562045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
	SRVR:HE1PR0201MB2170; BCL:0; PCL:0; RULEID:;
	SRVR:HE1PR0201MB2170; 
X-Forefront-PRVS: 058441C12A
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(366004)(346002)(396003)(39850400004)(39380400002)(376002)(189003)(199004)(966005)(68736007)(97736004)(52116002)(478600001)(186003)(16526019)(6916009)(53416004)(51416003)(6666003)(36756003)(386003)(6506007)(16586007)(74482002)(305945005)(26005)(7736002)(4326008)(86362001)(59450400001)(53386004)(316002)(81166006)(50226002)(575784001)(81156014)(33896004)(2906002)(8936002)(2351001)(6512007)(106356001)(53936002)(69596002)(6116002)(6306002)(25786009)(105586002)(8676002)(5660300001)(47776003)(2361001)(3846002)(50466002)(66066001)(48376002)(6486002)(19627235001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:HE1PR0201MB2170; H:qt.intra.qt;
	FPR:; SPF:None; PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: qt.io does not designate permitted
	sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; HE1PR0201MB2170;
	23:wagSA009WFq9qMEsNheVGbU7qdDW1O5F7ZBtrnz?=
	=?us-ascii?Q?C7QEjGRNBw86pAxFk/CLIYjVAflF/hNw8Rc8HcKnTWU70u+b3UzpF4Cv402r?=
	=?us-ascii?Q?QMhtAKRjJfHLbJqfgR2E3fk1WUlWGhxqqbYKg5AwLeld0y8VkkS4d9+fHdRQ?=
	=?us-ascii?Q?hwilOUxn7qMx9nR1iNDBwhjGn//BzLYdwd6kyVj/pz3+tXFR39BbvUSUx9xw?=
	=?us-ascii?Q?J1nINcZnx/D/9KL3TejJa2sSEVeQP0YFXhmVh/hlZalM4wnx3dnTLBXl2u41?=
	=?us-ascii?Q?S8KJLt5X4zMspqJvH21n27DTcEPgjOOQjd3d8f0C0eSHZJ6q3PFU8HRPb3/z?=
	=?us-ascii?Q?nN08zScMkzq8O/B9a/nrkQg4Ba/BNtGY/Trs2gAokG1rT9pjiRJad5gpEPqM?=
	=?us-ascii?Q?2lw2Ywp/Lpki97//xHJsncpNxZ2ZoA0Y2D0EXH6K58J03PhwSuYeBRSFrNlC?=
	=?us-ascii?Q?ZHvj0rDzy7kKu0cYI5H8uAkrC3EAgByHwEbi9uWymS368aGA3sPR/QfL2k6M?=
	=?us-ascii?Q?8YL0nsPefW88fiLI8QOU/+XBH7MnJTtln91m4TZ+CsiyMLHs6Uag4azCQ3TI?=
	=?us-ascii?Q?zy+7CUNrXKrKO0WtG2YcqKc0aYDe6CVZyduUt+J/eQ+Ehq0XQffy2DG0CwSj?=
	=?us-ascii?Q?FhdAUVPX2c4rubuiMMl5ylDV6uqnc5pA1BsyQOe7YDrQtpy51LU0nSHyxs5d?=
	=?us-ascii?Q?qx7AHLVzH7oUxg7h2IxVcb9sDwrsUOVIk1H1ZhZTgyfjjlQA1pPlPyTyK+0j?=
	=?us-ascii?Q?GWmpoAN1/cD+02qV13UopehmKcPm5YsvACXFcaVFpvQfdqvAPxa9FGKvKNHI?=
	=?us-ascii?Q?tlLsYwVjuIuI62peHw93Gs8bpgYYBPPWtjn/ws7ITNQUWUs1SOffdfdc0MzY?=
	=?us-ascii?Q?5v9loVnGSIEfPbKX7JyiX1G3/ZdVRxhYifUCn6b49NgegSl9BlRLft70kr+h?=
	=?us-ascii?Q?hTbH/ovhMeZWM3AGOHMfwaf4NMWDMDoHC9x1T0RlyYlub9eZRo3d3Nu86s+M?=
	=?us-ascii?Q?9t0Eb2KPvMlz0hE5jO+jLY4kF2o1Z4nqZopHDE7djhIb/B7mbtjdo2tbybE9?=
	=?us-ascii?Q?pN98+/jQlK8PPV77H3x7usqcRLYbPPc+epPAhBG8dGcFTBRBv4zzeocJ7d/i?=
	=?us-ascii?Q?p28or/4FkwH280iOqNe6XHLvpV9H7fBaz6eaAo64lpTk8esM48f2k3TvL6+D?=
	=?us-ascii?Q?+kKAC3GRriFvaru9kP1SshnaRZxeB71xB4MmTKX0QWpglzCsaa3I+wSSWeXC?=
	=?us-ascii?Q?/5V8Q8xx4yh4xt9D61gEUUibeVFu5rr+K0Hkfv+8yeSXEJtp6gSE15W8JMTl?=
	=?us-ascii?Q?R+pZRiixbfpPXG3sdHVMCnqA=3D?=
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0201MB2170;
	6:mngql+MNMph4G6S0vtXwbK3FurkMKewt/QBax1PAYGeotHLgYioT0HNMFZrx+Ph1fWacMakjIt9DK3kJszStaTz5I0uVGil1+zK9rdndAr28TxShUD3h0yrPmp0prQVDOzDPaLQfpnnQegGwfPy8PN7tdidcKdSK82ms1pK5MLMVFfrvMsfKNWMFNhP77PO9IFVLLtUqclDgiISCZyjWzE5xG82U5dNnGlufkpeT9AUuRlkmSQxDKTkGVnlg0PdONHK+SyrFUmsxgnSOHjkTXt+XIGnADvJAYjstZ2+vrBqv1yaCqLVJybTb5vomjoyzl+c0QmE8e6YGxcVZeSlUS8QBz/iNtpZLXys1LVL0BFM=;
	5:bhoOktAuZ5N5O1SG67801p7gX5jV+4wQHg/Jd0IdTvfNzK4j54gtojgoYpxT+bF+9KGzVZS+PBe/RdCo4aoRAyHHNh88XgDH+4Vri0Tq7CPTo7RKIcIZXYsHbas57q2IuXv3Rl8vmkJvs7VniIm/6B7cgZCVj0PVDDbPIp7qGyo=;
	24:ThsivnCO8olHO/EmtHfKqKZoZKUOiI4a4UMzzL4ucyYEMnd97IvCDzNN/Q/xMPp/0ZDkNB+7u6ydu16YPrqgJXAoR8BYws5p/6vyK4OGqn8=;
	7:wVySrbX8bUQMWC1DsL/6gXVLW3UtB1TCtojhti186t2u9aEEc/E5LrE3+qvxBPO55Gi6LXvJINt6JlXXET7DAfqmJ/eQaIJ/JKc0hZtEMJVH6mUC/nZZRG2K9E9nzDOrPKc5krnbhAOyRbjDwr4ku6XTUbDIui9Su881H3PEL8s9NWQ/iuibm4h7rrEfK2HE46rcX2GLsOiBHd/8p/Sx99n3Bbx2Ju/K6orKwpwKKWwrDrOvLbcCHOzyaHjKHL9b
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: qt.io
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2018 06:48:18.5718 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e502ca4f-3f65-4f7b-2e82-08d5744018d8
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 20d0b167-794d-448a-9d01-aaeccc1124ac
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0201MB2170
Subject: [meta-qt5][PATCH] Upgrade to Qt 5.10.1
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
X-List-Received-Date: Thu, 15 Feb 2018 10:20:41 -0000
Content-Type: text/plain

Updated Qt modules to 5.10.1.
New recipe qtknx added.

Change-Id: I711c75253a9c0d9dcfbaac8867b35a4505d101ea
Signed-off-by: Mikko Gronoff <mikko.gronoff@qt.io>
---
 recipes-qt/qt5/nativesdk-qtbase_git.bb             |  2 +-
 recipes-qt/qt5/qt3d_git.bb                         |  2 +-
 recipes-qt/qt5/qt5-git.inc                         |  2 +-
 recipes-qt/qt5/qtbase-native_git.bb                |  2 +-
 recipes-qt/qt5/qtbase_git.bb                       |  2 +-
 recipes-qt/qt5/qtcanvas3d_git.bb                   |  2 +-
 recipes-qt/qt5/qtcharts_git.bb                     |  2 +-
 recipes-qt/qt5/qtconnectivity_git.bb               |  2 +-
 recipes-qt/qt5/qtdatavis3d_git.bb                  |  2 +-
 recipes-qt/qt5/qtdeclarative_git.bb                |  2 +-
 recipes-qt/qt5/qtgamepad_git.bb                    |  2 +-
 recipes-qt/qt5/qtgraphicaleffects_git.bb           |  2 +-
 recipes-qt/qt5/qtimageformats_git.bb               |  2 +-
 recipes-qt/qt5/qtknx_git.bb                        | 12 +++++++++++
 recipes-qt/qt5/qtlocation_git.bb                   | 13 ++++++------
 recipes-qt/qt5/qtmqtt_git.bb                       |  2 +-
 recipes-qt/qt5/qtmultimedia_git.bb                 |  2 +-
 recipes-qt/qt5/qtnetworkauth_git.bb                |  2 +-
 ...fix-invalid-use-of-incomplete-type-class-.patch | 24 ----------------------
 recipes-qt/qt5/qtquickcontrols2_git.bb             |  2 +-
 recipes-qt/qt5/qtquickcontrols_git.bb              | 11 +---------
 recipes-qt/qt5/qtremoteobjects_git.bb              |  2 +-
 recipes-qt/qt5/qtscript_git.bb                     | 10 ++++-----
 recipes-qt/qt5/qtscxml_git.bb                      |  2 +-
 recipes-qt/qt5/qtsensors_git.bb                    |  2 +-
 recipes-qt/qt5/qtserialbus_git.bb                  |  6 +-----
 recipes-qt/qt5/qtserialport_git.bb                 | 12 +++++------
 recipes-qt/qt5/qtsvg_git.bb                        |  2 +-
 recipes-qt/qt5/qtsystems_git.bb                    | 11 +++++-----
 recipes-qt/qt5/qttools_git.bb                      |  2 +-
 recipes-qt/qt5/qttranslations_git.bb               |  2 +-
 recipes-qt/qt5/qtvirtualkeyboard_git.bb            |  2 +-
 recipes-qt/qt5/qtwayland_git.bb                    |  2 +-
 recipes-qt/qt5/qtwebchannel_git.bb                 |  2 +-
 recipes-qt/qt5/qtwebengine_git.bb                  |  4 ++--
 recipes-qt/qt5/qtwebsockets_git.bb                 |  2 +-
 recipes-qt/qt5/qtwebview_git.bb                    |  2 +-
 recipes-qt/qt5/qtx11extras_git.bb                  |  2 +-
 recipes-qt/qt5/qtxmlpatterns_git.bb                |  6 +-----
 39 files changed, 70 insertions(+), 97 deletions(-)
 create mode 100644 recipes-qt/qt5/qtknx_git.bb
 delete mode 100644 recipes-qt/qt5/qtquickcontrols/0001-texteditor-fix-invalid-use-of-incomplete-type-class-.patch

diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
index 36dab44..fb2f76e 100644
--- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
+++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
@@ -210,4 +210,4 @@ fakeroot do_generate_qt_environment_file() {
 
 addtask generate_qt_environment_file after do_install before do_package
 
-SRCREV = "50117d738af526cbfbd5afa50b9a501acb0fb9ce"
+SRCREV = "6c6ace9d23f90845fd424e474d38fe30f070775e"
diff --git a/recipes-qt/qt5/qt3d_git.bb b/recipes-qt/qt5/qt3d_git.bb
index c92c81e..4dd8aee 100644
--- a/recipes-qt/qt5/qt3d_git.bb
+++ b/recipes-qt/qt5/qt3d_git.bb
@@ -37,6 +37,6 @@ do_configure_prepend() {
          ${S}/src/quick3d/imports/input/importsinput.pro
 }
 
-SRCREV = "7bd57d2218794fdd7bcaa4f2c8107ef60740ff75"
+SRCREV = "31f424bb81cd2583920d3d521e1e01f01c2d28e2"
 
 BBCLASSEXTEND += "native nativesdk"
diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
index a613d1e..7ee0643 100644
--- a/recipes-qt/qt5/qt5-git.inc
+++ b/recipes-qt/qt5/qt5-git.inc
@@ -14,4 +14,4 @@ CVE_PRODUCT = "qt"
 
 S = "${WORKDIR}/git"
 
-PV = "5.10.0+git${SRCPV}"
+PV = "5.10.1+git${SRCPV}"
diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
index ac3924e..20e24eb 100644
--- a/recipes-qt/qt5/qtbase-native_git.bb
+++ b/recipes-qt/qt5/qtbase-native_git.bb
@@ -136,4 +136,4 @@ do_install() {
     echo 'set(_qt5_corelib_extra_includes "${_qt5Core_install_prefix}/lib${QT_DIR_NAME}/mkspecs/linux-oe-g++")' > ${D}${libdir}/cmake/Qt5Core/Qt5CoreConfigExtrasMkspecDir.cmake
 }
 
-SRCREV = "50117d738af526cbfbd5afa50b9a501acb0fb9ce"
+SRCREV = "6c6ace9d23f90845fd424e474d38fe30f070775e"
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 4f3ade2..e3d26a4 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -253,4 +253,4 @@ INSANE_SKIP_${PN}-mkspecs += "file-rdeps"
 
 RRECOMMENDS_${PN}-plugins += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libx11-locale', '', d)}"
 
-SRCREV = "50117d738af526cbfbd5afa50b9a501acb0fb9ce"
+SRCREV = "6c6ace9d23f90845fd424e474d38fe30f070775e"
diff --git a/recipes-qt/qt5/qtcanvas3d_git.bb b/recipes-qt/qt5/qtcanvas3d_git.bb
index 2c891aa..af0b118 100644
--- a/recipes-qt/qt5/qtcanvas3d_git.bb
+++ b/recipes-qt/qt5/qtcanvas3d_git.bb
@@ -10,4 +10,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS = "qtdeclarative"
 
-SRCREV = "8137223f6c489c2d1bb2317474c99c77245bd7ec"
+SRCREV = "0eecd96a7b83e8b1fc2811ec366b4ca1980296e0"
diff --git a/recipes-qt/qt5/qtcharts_git.bb b/recipes-qt/qt5/qtcharts_git.bb
index a416cef..a2d4ced 100644
--- a/recipes-qt/qt5/qtcharts_git.bb
+++ b/recipes-qt/qt5/qtcharts_git.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative qtmultimedia"
 
-SRCREV = "6a9606270e6611c818bdab382a29051d4cd3b459"
+SRCREV = "9a4f99f518a49716cc9cc300eb456c6b13f9e8d1"
 
 # The same issue as in qtbase:
 # http://errors.yoctoproject.org/Errors/Details/152641/
diff --git a/recipes-qt/qt5/qtconnectivity_git.bb b/recipes-qt/qt5/qtconnectivity_git.bb
index 3bf16a6..32ccdce 100644
--- a/recipes-qt/qt5/qtconnectivity_git.bb
+++ b/recipes-qt/qt5/qtconnectivity_git.bb
@@ -19,4 +19,4 @@ PACKAGECONFIG[bluez] = "-feature-bluez,-no-feature-bluez,${BLUEZ}"
 
 EXTRA_QMAKEVARS_CONFIGURE += "${PACKAGECONFIG_CONFARGS}"
 
-SRCREV = "bb9b8af08b1602c7c867969b236393b3ff3f7f18"
+SRCREV = "2331b915d207fe794a07b834ec2bf8578965bc4d"
diff --git a/recipes-qt/qt5/qtdatavis3d_git.bb b/recipes-qt/qt5/qtdatavis3d_git.bb
index 1bd3411..ea0ba59 100644
--- a/recipes-qt/qt5/qtdatavis3d_git.bb
+++ b/recipes-qt/qt5/qtdatavis3d_git.bb
@@ -8,4 +8,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative qtmultimedia qtxmlpatterns"
 
-SRCREV = "d2abb20082322167311cfe0c84afa822754b74ef"
+SRCREV = "397e50147407c16a16b6505558992ca3180f9aff"
diff --git a/recipes-qt/qt5/qtdeclarative_git.bb b/recipes-qt/qt5/qtdeclarative_git.bb
index facb448..d6f468f 100644
--- a/recipes-qt/qt5/qtdeclarative_git.bb
+++ b/recipes-qt/qt5/qtdeclarative_git.bb
@@ -30,6 +30,6 @@ do_install_append_class-nativesdk() {
 
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'qtxmlpatterns', 'CONFIG+=OE_QTXMLPATTERNS_ENABLED', '', d)}"
 
-SRCREV = "dac71f3d6f6bc4f159f6107c792bc70cfe7c308e"
+SRCREV = "3e91062877c0853aff693799bc5e33cdf7aaad42"
 
 BBCLASSEXTEND =+ "native nativesdk"
diff --git a/recipes-qt/qt5/qtgamepad_git.bb b/recipes-qt/qt5/qtgamepad_git.bb
index a59ccf7..e91754c 100644
--- a/recipes-qt/qt5/qtgamepad_git.bb
+++ b/recipes-qt/qt5/qtgamepad_git.bb
@@ -14,4 +14,4 @@ PACKAGECONFIG[sdl2] = "-feature-sdl2,-no-feature-sdl2,libsdl2"
 
 EXTRA_QMAKEVARS_CONFIGURE += "${PACKAGECONFIG_CONFARGS}"
 
-SRCREV = "b505116ee456d7084d8f570e062b3031b77d79df"
+SRCREV = "e6f366618dc9a3d232446197d6fea7c814e53828"
diff --git a/recipes-qt/qt5/qtgraphicaleffects_git.bb b/recipes-qt/qt5/qtgraphicaleffects_git.bb
index 8312851..658420b 100644
--- a/recipes-qt/qt5/qtgraphicaleffects_git.bb
+++ b/recipes-qt/qt5/qtgraphicaleffects_git.bb
@@ -18,4 +18,4 @@ RDEPENDS_${PN}-dev = ""
 # http://errors.yoctoproject.org/Errors/Build/44912/
 LDFLAGS_append_x86 = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
 
-SRCREV = "5ca1c00b33b0e125ab60413aa0fb3c7b0f89d8f2"
+SRCREV = "a38c4da7b598f5a185d7c9f824482d418353e6bf"
diff --git a/recipes-qt/qt5/qtimageformats_git.bb b/recipes-qt/qt5/qtimageformats_git.bb
index 4552d68..d804b01 100644
--- a/recipes-qt/qt5/qtimageformats_git.bb
+++ b/recipes-qt/qt5/qtimageformats_git.bb
@@ -26,4 +26,4 @@ PACKAGECONFIG[libwebp] = ",CONFIG+=done_config_libwebp,libwebp"
 
 EXTRA_QMAKEVARS_PRE += "${PACKAGECONFIG_CONFARGS}"
 
-SRCREV = "caa90acd43684dc382f1e4f01c8787e18653ef43"
+SRCREV = "892d4a0df7dccc6e70586835bb1211cf1b79bc69"
diff --git a/recipes-qt/qt5/qtknx_git.bb b/recipes-qt/qt5/qtknx_git.bb
new file mode 100644
index 0000000..5e01e3c
--- /dev/null
+++ b/recipes-qt/qt5/qtknx_git.bb
@@ -0,0 +1,12 @@
+require qt5.inc
+require qt5-git.inc
+
+LICENSE = "(GPL-3.0 & The-Qt-Company-GPL-Exception-1.0) | The-Qt-Company-Commercial"
+LIC_FILES_CHKSUM = " \
+    file://LICENSE.GPL3;md5=d32239bcb673463ab874e80d47fae504 \
+    file://LICENSE.GPL3-EXCEPT;md5=763d8c535a234d9a3fb682c7ecb6c073 \
+"
+
+DEPENDS += "qtbase"
+
+SRCREV = "29c34e8f072afd01002ed3847d752b4e065f977e"
diff --git a/recipes-qt/qt5/qtlocation_git.bb b/recipes-qt/qt5/qtlocation_git.bb
index fce37b8..13667b2 100644
--- a/recipes-qt/qt5/qtlocation_git.bb
+++ b/recipes-qt/qt5/qtlocation_git.bb
@@ -1,14 +1,15 @@
 require qt5.inc
 require qt5-git.inc
 
-LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception-1.1 | LGPL-3.0) | GPL-2.0 | The-Qt-Company-Commercial"
+LICENSE = "GFDL-1.3 & BSD & ( GPL-3.0 & The-Qt-Company-GPL-Exception-1.0 | The-Qt-Company-Commercial ) & ( GPL-2.0+ | LGPL-3.0 | The-Qt-Company-Commercial )"
 LIC_FILES_CHKSUM = " \
-    file://LICENSE.LGPLv21;md5=4bfd28363f541b10d9f024181b8df516 \
+    file://LICENSE.LGPL3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
     file://LICENSE.LGPLv3;md5=e0459b45c5c4840b353141a8bbed91f0 \
+    file://LICENSE.GPL2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+    file://LICENSE.GPL3;md5=d32239bcb673463ab874e80d47fae504 \
     file://LICENSE.GPLv3;md5=88e2b9117e6be406b5ed6ee4ca99a705 \
-    file://LGPL_EXCEPTION.txt;md5=9625233da42f9e0ce9d63651a9d97654 \
+    file://LICENSE.GPL3-EXCEPT;md5=763d8c535a234d9a3fb682c7ecb6c073 \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
-    file://LICENSE.GPLv2;md5=c96076271561b0e3785dad260634eaa8 \
 "
 
 DEPENDS += "qtbase qtxmlpatterns qtdeclarative qtquickcontrols"
@@ -29,7 +30,7 @@ SRC_URI += " \
     ${QT_GIT}/qtlocation-mapboxgl.git;name=qtlocation-mapboxgl;branch=upstream/qt-staging;protocol=${QT_GIT_PROTOCOL};destsuffix=git/src/3rdparty/mapbox-gl-native \
 "
 
-SRCREV_qtlocation = "919bbf503d69fd6be87f22ea58c15872d08f8580"
-SRCREV_qtlocation-mapboxgl = "572822c8ca15be190b43afbf7f91d132e988bf21"
+SRCREV_qtlocation = "ec00ff89bee900a1b8925e227a892bc57839cd60"
+SRCREV_qtlocation-mapboxgl = "8c1be4ec01ef46bf453856531ebf53b48ce3dbe7"
 
 SRCREV_FORMAT = "qtlocation_qtlocation-mapboxgl"
diff --git a/recipes-qt/qt5/qtmqtt_git.bb b/recipes-qt/qt5/qtmqtt_git.bb
index 406bdb6..b705f7c 100644
--- a/recipes-qt/qt5/qtmqtt_git.bb
+++ b/recipes-qt/qt5/qtmqtt_git.bb
@@ -9,4 +9,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "45d87f0d9260ef0c42434daa329e77aecf3f5d46"
+SRCREV = "2c3c2a41c55a179332ec2a076856990f36dd5ef9"
diff --git a/recipes-qt/qt5/qtmultimedia_git.bb b/recipes-qt/qt5/qtmultimedia_git.bb
index c9c3611..1d4527d 100644
--- a/recipes-qt/qt5/qtmultimedia_git.bb
+++ b/recipes-qt/qt5/qtmultimedia_git.bb
@@ -35,4 +35,4 @@ SRC_URI += "\
 # http://errors.yoctoproject.org/Errors/Build/44914/
 LDFLAGS_append_x86 = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
 
-SRCREV = "3598915a360c596da48c9e7b00ba8469cba5249a"
+SRCREV = "038716bb1f2d9b95f2d638e2d61d297563343af9"
diff --git a/recipes-qt/qt5/qtnetworkauth_git.bb b/recipes-qt/qt5/qtnetworkauth_git.bb
index 4c38322..0180376 100644
--- a/recipes-qt/qt5/qtnetworkauth_git.bb
+++ b/recipes-qt/qt5/qtnetworkauth_git.bb
@@ -9,4 +9,4 @@ require qt5-git.inc
 
 DEPENDS += "qtbase"
 
-SRCREV = "febebfb6f09f23b16ac96a5a09d2ceb5b67046e7"
+SRCREV = "8f4f2e0cae642ff5eb0b87ae1d4e9c5e6ccf2bd8"
diff --git a/recipes-qt/qt5/qtquickcontrols/0001-texteditor-fix-invalid-use-of-incomplete-type-class-.patch b/recipes-qt/qt5/qtquickcontrols/0001-texteditor-fix-invalid-use-of-incomplete-type-class-.patch
deleted file mode 100644
index 41cf764..0000000
--- a/recipes-qt/qt5/qtquickcontrols/0001-texteditor-fix-invalid-use-of-incomplete-type-class-.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From 2eed2f2c880e38e6c34aa246d210f18c75e085e5 Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@ti.com>
-Date: Thu, 31 Mar 2016 19:57:01 -0400
-Subject: [PATCH] texteditor: fix invalid use of incomplete type 'class QDebug'
-
-Upstream-Status: Pending
-
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
----
- examples/quickcontrols/controls/texteditor/src/documenthandler.cpp | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/examples/quickcontrols/controls/texteditor/src/documenthandler.cpp b/examples/quickcontrols/controls/texteditor/src/documenthandler.cpp
-index 69da88f..9039191 100644
---- a/examples/quickcontrols/controls/texteditor/src/documenthandler.cpp
-+++ b/examples/quickcontrols/controls/texteditor/src/documenthandler.cpp
-@@ -54,6 +54,7 @@
- #include <QtGui/QTextCursor>
- #include <QtGui/QFontDatabase>
- #include <QtCore/QFileInfo>
-+#include <QtCore/QDebug>
- 
- DocumentHandler::DocumentHandler()
-     : m_target(0)
diff --git a/recipes-qt/qt5/qtquickcontrols2_git.bb b/recipes-qt/qt5/qtquickcontrols2_git.bb
index 2cc63a7..d922cd6 100644
--- a/recipes-qt/qt5/qtquickcontrols2_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols2_git.bb
@@ -10,4 +10,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtdeclarative"
 
-SRCREV = "1265fef3b290665272d3aacd0ba5213c43bad89d"
+SRCREV = "e693ad2c4ae22f8813befd5fe825c855537497ed"
diff --git a/recipes-qt/qt5/qtquickcontrols_git.bb b/recipes-qt/qt5/qtquickcontrols_git.bb
index 36d4b41..17dd0fc 100644
--- a/recipes-qt/qt5/qtquickcontrols_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols_git.bb
@@ -4,12 +4,9 @@ require qt5-git.inc
 LICENSE = "GFDL-1.3 & BSD & ( GPL-3.0 & The-Qt-Company-GPL-Exception-1.0 | The-Qt-Company-Commercial ) & ( GPL-2.0+ | LGPL-3.0 | The-Qt-Company-Commercial )"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.LGPL3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
-    file://LICENSE.LGPLv3;md5=e0459b45c5c4840b353141a8bbed91f0 \
     file://LICENSE.GPL2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
     file://LICENSE.GPL3;md5=d32239bcb673463ab874e80d47fae504 \
     file://LICENSE.GPL3-EXCEPT;md5=763d8c535a234d9a3fb682c7ecb6c073 \
-    file://LICENSE.GPLv2;md5=c96076271561b0e3785dad260634eaa8 \
-    file://LICENSE.GPLv3;md5=88e2b9117e6be406b5ed6ee4ca99a705 \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
 "
 
@@ -20,10 +17,4 @@ FILES_${PN}-qmlplugins += " \
   ${OE_QMAKE_PATH_QML}/QtQuick/Dialogs/qml/icons.ttf \
 "
 
-# Patches from https://github.com/meta-qt5/qtquickcontrols/commits/b5.10
-# 5.10.meta-qt5.1
-SRC_URI += " \
-    file://0001-texteditor-fix-invalid-use-of-incomplete-type-class-.patch \
-"
-
-SRCREV = "a749525164b771452599e67e277d2ea6b3866479"
+SRCREV = "09ebb25aa686fc3f47f860905c2abb32a95c75d1"
diff --git a/recipes-qt/qt5/qtremoteobjects_git.bb b/recipes-qt/qt5/qtremoteobjects_git.bb
index ba65b32..3f3275a 100644
--- a/recipes-qt/qt5/qtremoteobjects_git.bb
+++ b/recipes-qt/qt5/qtremoteobjects_git.bb
@@ -24,6 +24,6 @@ PACKAGECONFIG[tools-only] = "CONFIG+=tools-only"
 
 EXTRA_QMAKEVARS_PRE += "${PACKAGECONFIG_CONFARGS}"
 
-SRCREV = "e6eb6ab12daf76f3e716c0d51ceecdab61e39e48"
+SRCREV = "61d2de26db7b90ad0ed3923b5deecd1c5b3be46a"
 
 BBCLASSEXTEND += "native nativesdk"
diff --git a/recipes-qt/qt5/qtscript_git.bb b/recipes-qt/qt5/qtscript_git.bb
index 5d32315..d73eb44 100644
--- a/recipes-qt/qt5/qtscript_git.bb
+++ b/recipes-qt/qt5/qtscript_git.bb
@@ -4,11 +4,11 @@ require qt5-git.inc
 HOMEPAGE = "http://www.qt.io"
 LICENSE = "GFDL-1.3 & BSD & ( GPL-3.0 & The-Qt-Company-GPL-Exception-1.0 | The-Qt-Company-Commercial ) & ( GPL-2.0+ | LGPL-3.0 | The-Qt-Company-Commercial )"
 LIC_FILES_CHKSUM = " \
-    file://LICENSE.LGPLv21;md5=4bfd28363f541b10d9f024181b8df516 \
-    file://LICENSE.LGPLv3;md5=e0459b45c5c4840b353141a8bbed91f0 \
-    file://LICENSE.GPLv3;md5=88e2b9117e6be406b5ed6ee4ca99a705 \
-    file://LGPL_EXCEPTION.txt;md5=9625233da42f9e0ce9d63651a9d97654 \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
+    file://LICENSE.GPL2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+    file://LICENSE.GPL3;md5=d32239bcb673463ab874e80d47fae504 \
+    file://LICENSE.GPL3-EXCEPT;md5=763d8c535a234d9a3fb682c7ecb6c073 \
+    file://LICENSE.LGPL3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
 "
 
 # qemuarm build fails with:
@@ -30,4 +30,4 @@ DEPENDS += "qtbase"
 # http://errors.yoctoproject.org/Errors/Build/44915/
 LDFLAGS_append_x86 = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
 
-SRCREV = "0bb3f3017f72cbf8d6866b8baa1820ab3dd89316"
+SRCREV = "76bcf9b526f96edb35469e9de4b032a112a2b1c0"
diff --git a/recipes-qt/qt5/qtscxml_git.bb b/recipes-qt/qt5/qtscxml_git.bb
index 38ab1bf..1ef461e 100644
--- a/recipes-qt/qt5/qtscxml_git.bb
+++ b/recipes-qt/qt5/qtscxml_git.bb
@@ -10,7 +10,7 @@ require qt5-git.inc
 
 DEPENDS += "qtbase qtdeclarative qtxmlpatterns qtscxml-native"
 
-SRCREV = "bbf3be4679571edef60425c3fd12df9d3035001c"
+SRCREV = "d9b2f8c56d162c108d5427769a8e496dd7a3b62e"
 
 # Patches from https://github.com/meta-qt5/qtscxml/commits/b5.10
 # 5.10.meta-qt5.1
diff --git a/recipes-qt/qt5/qtsensors_git.bb b/recipes-qt/qt5/qtsensors_git.bb
index caa9a04..09e8e8b 100644
--- a/recipes-qt/qt5/qtsensors_git.bb
+++ b/recipes-qt/qt5/qtsensors_git.bb
@@ -12,4 +12,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative"
 
-SRCREV = "7ae7dc325648a007a72e74f2bd7784a90b4714af"
+SRCREV = "d5a94c5595170fed9a0f7d3d42ef4b0216909d0d"
diff --git a/recipes-qt/qt5/qtserialbus_git.bb b/recipes-qt/qt5/qtserialbus_git.bb
index b731371..85c4669 100644
--- a/recipes-qt/qt5/qtserialbus_git.bb
+++ b/recipes-qt/qt5/qtserialbus_git.bb
@@ -11,8 +11,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtserialport"
 
-# Patches from https://github.com/meta-qt5/qtserialbus/commits/b5.10
-# 5.10.meta-qt5.1
-SRC_URI += "file://0001-Add-missing-include-for-struct-timeval.patch"
-
-SRCREV = "f25ddea7b12beff8d4de863fec18ce698d726ffa"
+SRCREV = "d5d35d64d06729322c80327de40badaf553df87e"
diff --git a/recipes-qt/qt5/qtserialport_git.bb b/recipes-qt/qt5/qtserialport_git.bb
index e48d095..ddc6957 100644
--- a/recipes-qt/qt5/qtserialport_git.bb
+++ b/recipes-qt/qt5/qtserialport_git.bb
@@ -3,16 +3,16 @@ require qt5-git.inc
 
 # text of LGPL_EXCEPTION.txt and LICENSE.FDL is slightly different than what
 # other qt* components use :/
-LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception-1.1 | LGPL-3.0) | The-Qt-Company-Commercial"
+LICENSE = "GFDL-1.3 & BSD & ( GPL-3.0 & The-Qt-Company-GPL-Exception-1.0 | The-Qt-Company-Commercial ) & ( GPL-2.0+ | LGPL-3.0 | The-Qt-Company-Commercial )"
 LIC_FILES_CHKSUM = " \
-    file://LICENSE.LGPLv21;md5=4bfd28363f541b10d9f024181b8df516 \
-    file://LICENSE.LGPLv3;md5=e0459b45c5c4840b353141a8bbed91f0 \
-    file://LICENSE.GPLv3;md5=88e2b9117e6be406b5ed6ee4ca99a705 \
+    file://LICENSE.LGPL3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
+    file://LICENSE.GPL2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+    file://LICENSE.GPL3;md5=d32239bcb673463ab874e80d47fae504 \
+    file://LICENSE.GPL3-EXCEPT;md5=763d8c535a234d9a3fb682c7ecb6c073 \
     file://LGPL_EXCEPTION.txt;md5=bb426f3367c4805d1e12fad05bd0b750 \
     file://LICENSE.FDL;md5=3801d7932fdc07fd9efe89f9854a6caa \
-    file://LICENSE.GPLv2;md5=c96076271561b0e3785dad260634eaa8 \
 "
 
 DEPENDS += "qtbase"
 
-SRCREV = "c7d99464c65a5bde663a8ec4daf3d343d8e9b14b"
+SRCREV = "fa688ac5c36a16aa3b44d4ca1509f9386e670a89"
diff --git a/recipes-qt/qt5/qtsvg_git.bb b/recipes-qt/qt5/qtsvg_git.bb
index 3d0a372..12fcff1 100644
--- a/recipes-qt/qt5/qtsvg_git.bb
+++ b/recipes-qt/qt5/qtsvg_git.bb
@@ -13,4 +13,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "984ba6977201f8fbd94d44a2b67519e1faf458cc"
+SRCREV = "af35137016f082c3fa15e61414f3c78c73ac322f"
diff --git a/recipes-qt/qt5/qtsystems_git.bb b/recipes-qt/qt5/qtsystems_git.bb
index bc3e289..0bda2e9 100644
--- a/recipes-qt/qt5/qtsystems_git.bb
+++ b/recipes-qt/qt5/qtsystems_git.bb
@@ -1,12 +1,13 @@
 require qt5.inc
 require qt5-git.inc
 
-LICENSE = "GFDL-1.3 & LGPL-2.1 | GPL-3.0"
+LICENSE = "GFDL-1.3 & BSD & ( GPL-3.0 & The-Qt-Company-GPL-Exception-1.0 | The-Qt-Company-Commercial ) & ( GPL-2.0+ | LGPL-3.0 | The-Qt-Company-Commercial )"
 LIC_FILES_CHKSUM = " \
-    file://LICENSE.LGPLv21;md5=4193e7f1d47a858f6b7c0f1ee66161de \
-    file://LICENSE.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
-    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
+    file://LICENSE.GPL2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+    file://LICENSE.GPL3;md5=d32239bcb673463ab874e80d47fae504 \
+    file://LICENSE.GPL3-EXCEPT;md5=763d8c535a234d9a3fb682c7ecb6c073 \
+    file://LICENSE.LGPL3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
 "
 
 DEPENDS += "qtbase qtdeclarative udev gconf"
@@ -30,4 +31,4 @@ do_install_append() {
 
 QT_MODULE_BRANCH = "dev"
 
-SRCREV = "ca54870ffdf262f072c082adf80d63c421dbd68f"
+SRCREV = "66e45676f5f5c6251ccab36906c6324fd0065e08"
diff --git a/recipes-qt/qt5/qttools_git.bb b/recipes-qt/qt5/qttools_git.bb
index 2187f9c..2784948 100644
--- a/recipes-qt/qt5/qttools_git.bb
+++ b/recipes-qt/qt5/qttools_git.bb
@@ -31,7 +31,7 @@ PACKAGECONFIG[qtwebkit] = ",,qtwebkit"
 
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'qtwebkit', '', 'CONFIG+=noqtwebkit', d)}"
 
-SRCREV = "3ce89dc37d3c73033c18dcec9e4710afd747ce01"
+SRCREV = "03ebf1c3d6ceae715c696a171920a0204c58dd0a"
 
 BBCLASSEXTEND = "native nativesdk"
 
diff --git a/recipes-qt/qt5/qttranslations_git.bb b/recipes-qt/qt5/qttranslations_git.bb
index 040dd71..9535737 100644
--- a/recipes-qt/qt5/qttranslations_git.bb
+++ b/recipes-qt/qt5/qttranslations_git.bb
@@ -111,4 +111,4 @@ FILES_${PN}-qt = " \
     ${OE_QMAKE_PATH_TRANSLATIONS}/qt_*.qm \
 "
 
-SRCREV = "f4b0f1684a8e668ede23fafbff02c3910d775043"
+SRCREV = "c3486e072ebc704f9c82c005044143b07bb88f12"
diff --git a/recipes-qt/qt5/qtvirtualkeyboard_git.bb b/recipes-qt/qt5/qtvirtualkeyboard_git.bb
index f821f71..498917d 100644
--- a/recipes-qt/qt5/qtvirtualkeyboard_git.bb
+++ b/recipes-qt/qt5/qtvirtualkeyboard_git.bb
@@ -53,4 +53,4 @@ FILES_${PN} += "${OE_QMAKE_PATH_DATA}/qtvirtualkeyboard/lipi_toolkit"
 
 DEPENDS += "qtbase qtdeclarative qtmultimedia qtquickcontrols qtsvg qtxmlpatterns"
 
-SRCREV = "8546475dd5d6076a98b0700f1d70211c1395fc63"
+SRCREV = "85d35bb12235dd6b92c898ddb6d6e84703d25d48"
diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_git.bb
index 54d6945..75b0cef 100644
--- a/recipes-qt/qt5/qtwayland_git.bb
+++ b/recipes-qt/qt5/qtwayland_git.bb
@@ -37,7 +37,7 @@ PACKAGECONFIG[libhybris-egl-server] = "-feature-libhybris-egl-server,-no-feature
 
 EXTRA_QMAKEVARS_CONFIGURE += "${PACKAGECONFIG_CONFARGS}"
 
-SRCREV = "1a457a9dc9c61a6c995dbe06d72267cb0412b3bc"
+SRCREV = "db36bc0d9ccae21e84cd54be3e18ae539542eadc"
 
 # Patches from https://github.com/meta-qt5/qtwayland/commits/b5.10
 # 5.10.meta-qt5.1
diff --git a/recipes-qt/qt5/qtwebchannel_git.bb b/recipes-qt/qt5/qtwebchannel_git.bb
index 4469761..2b4a487 100644
--- a/recipes-qt/qt5/qtwebchannel_git.bb
+++ b/recipes-qt/qt5/qtwebchannel_git.bb
@@ -12,4 +12,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtdeclarative qtwebsockets"
 
-SRCREV = "acb01cb27b6c4aead84435ec7115fecd2a8db336"
+SRCREV = "7540a85c82cd940b7da3ea75eccad7e733bd0ae6"
diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index dcb8174..bd06a0b 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -159,8 +159,8 @@ SRC_URI_append_libc-musl = "\
     file://0015-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch;patchdir=src/3rdparty \
 "
 
-SRCREV_qtwebengine = "efa6d3f0d3a01753dd40823ce119e7d4f9765c8e"
-SRCREV_chromium = "e36dcec23b79a52fd7794ed2fad49bbf65a8146b"
+SRCREV_qtwebengine = "9dc8dff7a8f4d58f71d816375d49f8829f06aae5"
+SRCREV_chromium = "c858cc76099db0af82a264b3c6f921a287cfcb42"
 SRCREV = "${SRCREV_qtwebengine}"
 
 SRCREV_FORMAT = "qtwebengine_chromium"
diff --git a/recipes-qt/qt5/qtwebsockets_git.bb b/recipes-qt/qt5/qtwebsockets_git.bb
index 220f259..5d429ca 100644
--- a/recipes-qt/qt5/qtwebsockets_git.bb
+++ b/recipes-qt/qt5/qtwebsockets_git.bb
@@ -11,4 +11,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative"
 
-SRCREV = "0e4b43383dd826b5927f6276033f52ede1fa7936"
+SRCREV = "2160c268ec80012f86be3eef20e05c267cdd2926"
diff --git a/recipes-qt/qt5/qtwebview_git.bb b/recipes-qt/qt5/qtwebview_git.bb
index 9c84949..f164c6a 100644
--- a/recipes-qt/qt5/qtwebview_git.bb
+++ b/recipes-qt/qt5/qtwebview_git.bb
@@ -19,4 +19,4 @@ COMPATIBLE_MACHINE_armv7a = "(.*)"
 COMPATIBLE_MACHINE_armv7ve = "(.*)"
 COMPATIBLE_MACHINE_aarch64 = "(.*)"
 
-SRCREV = "54ea23243ca84ec5f086abf6c2278a025758b6ce"
+SRCREV = "7445cd28616e68af3cf5e074a5576cbe6c5bf491"
diff --git a/recipes-qt/qt5/qtx11extras_git.bb b/recipes-qt/qt5/qtx11extras_git.bb
index 0646ef0..443e9d5 100644
--- a/recipes-qt/qt5/qtx11extras_git.bb
+++ b/recipes-qt/qt5/qtx11extras_git.bb
@@ -13,4 +13,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "33e3fcc1fb1eb614f8b452296f2d4c4353c413c6"
+SRCREV = "a751298bc381b0fd0c6867e43d2613b98c2cb71f"
diff --git a/recipes-qt/qt5/qtxmlpatterns_git.bb b/recipes-qt/qt5/qtxmlpatterns_git.bb
index e44823a..77d7fe2 100644
--- a/recipes-qt/qt5/qtxmlpatterns_git.bb
+++ b/recipes-qt/qt5/qtxmlpatterns_git.bb
@@ -6,19 +6,15 @@ HOMEPAGE = "http://www.qt.io"
 LICENSE = "GFDL-1.3 & BSD & ( GPL-3.0 & The-Qt-Company-GPL-Exception-1.0 | The-Qt-Company-Commercial ) & ( GPL-2.0+ | LGPL-3.0 | The-Qt-Company-Commercial )"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.LGPL3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
-    file://LICENSE.LGPLv21;md5=4bfd28363f541b10d9f024181b8df516 \
-    file://LICENSE.LGPLv3;md5=e0459b45c5c4840b353141a8bbed91f0 \
     file://LICENSE.GPL2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
     file://LICENSE.GPL3;md5=d32239bcb673463ab874e80d47fae504 \
     file://LICENSE.GPL3-EXCEPT;md5=763d8c535a234d9a3fb682c7ecb6c073 \
-    file://LICENSE.GPLv3;md5=88e2b9117e6be406b5ed6ee4ca99a705 \
-    file://LGPL_EXCEPTION.txt;md5=9625233da42f9e0ce9d63651a9d97654 \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
 "
 
 DEPENDS += "qtbase"
 
-SRCREV = "8b831bdb513b4f6b7567c171d09875b14214c5c4"
+SRCREV = "7c4113d6e6215b26b866ed2a0da0fa5e0c12b8ea"
 
 BBCLASSEXTEND =+ "native nativesdk"
 
-- 
2.7.4


