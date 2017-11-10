Return-Path: <samuli.piippo@qt.io>
X-Greylist: delayed 10770 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 10 Nov 2017 14:45:49 UTC
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
	(mail-ve1eur01on0136.outbound.protection.outlook.com [104.47.1.136])
	by mail.openembedded.org (Postfix) with ESMTP id 2456B78618
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Nov 2017 14:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=qtcompany.onmicrosoft.com; s=selector1-qt-io;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=fUd4F2SvoktJWhXB8Y4THmkpA5StZZcx8IlHcOCZuyA=;
	b=bS0D9TeP0/EBGwFIognAA+OdBM5GPBjR+hB4OJlHVSDJhJMCIkrWy6JVKBHaChTPcR3mTugPCyKffIG4YMP/o4kXXKTE9K8kMQUsWQZY4iAtTa/xL+XcjT2/kpvmGWEM6VQih6VyJ0XuuQ3EqfC1kBEndOAt0mwOthLb1kLRWJ0=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=samuli.piippo@qt.io; 
Received: from piippo.intra.qt (192.89.120.53) by
	DB6PR0202MB2584.eurprd02.prod.outlook.com (2603:10a6:4:1b::18) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.218.12;
	Fri, 10 Nov 2017 07:13:49 +0000
From: Samuli Piippo <samuli.piippo@qt.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Nov 2017 09:13:38 +0200
Message-Id: <1510298018-882-1-git-send-email-samuli.piippo@qt.io>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [192.89.120.53]
X-ClientProxiedBy: AM5PR0402CA0021.eurprd04.prod.outlook.com
	(2603:10a6:203:90::31) To DB6PR0202MB2584.eurprd02.prod.outlook.com
	(2603:10a6:4:1b::18)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eabc2c8c-5634-4728-698d-08d5280a9790
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603199);
	SRVR:DB6PR0202MB2584; 
X-Microsoft-Exchange-Diagnostics: 1; DB6PR0202MB2584;
	3:jQR/sqaRSt4gTLal7hWrhL8cONdtMrnWIVYt7ljom+RQSf84sM8Q/aHcUvYGQEBCm58FZL2Jm0uWwksMO3Dwrq9+i67ZWnICTCX6ci1By/qmCefx8622yZxX17a9mscSn1cRV9rGbZMgF+61AaExijJnZ2bTTiYls6kcX917qFWq1fRQ+i0LJGAIJT82uK7tAxOXKK8WKjMu8ip012AlSDCDTsqqpG5dytDZkMqPD/zIV+nuDahrdd4GajOYosih;
	25:4PFPal8oPDZZ/73NoujhKmZvuT7Yfhx81e+mQK5n60RIk7wK8Uq1UUrmtbpFHqJYtqGAdNqOvZGmd1aPj3nQXQlECwwaXZMUghdGRDnJ7ks76C2A95IPFwH1oEcZSxBr7PWHOIwcnfnLWPZ7FoSUURwtp4ti+j1lnAswgIAkptZf36ix9VhZ14cNxeJdjtJbDqdavkgoM1PtY9F3+SUiWu+G+0c/EbM4trID6E6eEJXozZDaZDJH/ADO06pAN0iILVtqAEuEq96blMLW4b8Sj42NlNu/TuAcTgk9LT/DDiTD4YbDvzLcpQlkCn33Gb/aRMTPljWf/ms65b2TTqOzXA==;
	31:UR9rk7noPbivuSCgTFIqD0NQXDrmCAchGVPbJgRp8Vve6ZogN3vJ6MnC4rY6bniNvrg+OxF1ncRqWAf8vp0Sthy0zD9FnhtFXVNbWPora+qvZI7Lp1Nhkjsr5v38Kad6V3WcSgibI2y4s92jZ+CTLrSt7zQ83pcPUlh88oFqiem6mTO8UUplTYemN9uJ+VzbWo+Mk4Yf1C7HRg31un3XIt1YcSu2xR7waAb5xOdAKvM=
X-MS-TrafficTypeDiagnostic: DB6PR0202MB2584:
X-Microsoft-Exchange-Diagnostics: 1; DB6PR0202MB2584;
	20:a3e+IVcsNq71v592moZ7r2VAmuzvDBOjSZ7YX/9zdnfeWh0OalvShosYH17cNH9/QcutHkL2y0+/t6eUPNDZE6mw8OI6KXrmHEfw82C6xbNtAOzV2DNoHuI6wrM2yOrmUcDUTiRC5U8IHujis2G2+04s8wa2V1yt30jMaH0qSVeAnkIPU4UJlmLT7xxvTzzTYxqD8IIFqK8ioL1SmEv4NUMlX9WGzq9QEU4SiAAZKc1r86E7SIci4npU7EUtRW5b7OfufBrFpNMwejFe1Vz0VeLiI8kGUrQzDcCu2YsjtTy218b3EdbNW8f8fld3+OdMSpaJhty/vbiZKrKhM42bPHAiWPKZvDHqqFST2ThTQkkVXh6ugJk4+leJfyz4nCfTcKHeGSMcQlOxrRkKg8GvbtRvDL9RQrymzmf89NW4lIsD7bAPKMW9NWH4P8S9lS5FNiYcT/eXV1G65SE33+PXwojrr49L+dO0BeOV5Zpwbx6E43cW0uoXlKjjjNYmC9/g;
	4:AL68Lf9CNW9Y/x0T90dw8x7Z/BK7Xv0zXBVIpqZ/j6NL8ksLW7D7GEXjH2ekq6ywywYqsHXzaboYewTMq1lAiQXg4dNln9UUD2N1l5R/4dgoY8AyiUEpmUyJdP3Oh2oVtoeoUD2xhzF61RsX0j2OA3wlvHgQJOMpCViBVpWIcnM2ECAUchDXmZUL36w9pCbu8YxF5HlQrx90ePzLTAJMQoMIRPYJCSfjYFyAhMposUldAgGJRax+iGSMRqdbhubHSlmudB7DhuN9Kd66AbcE6Q==
X-Exchange-Antispam-Report-Test: UriScan:;
X-Microsoft-Antispam-PRVS: <DB6PR0202MB25843B8FBECA374E960CCA7CE9540@DB6PR0202MB2584.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(10201501046)(3231021)(100000703101)(100105400095)(93006095)(93001095)(3002001)(6041248)(20161123555025)(20161123560025)(20161123562025)(20161123564025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:DB6PR0202MB2584; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:DB6PR0202MB2584; 
X-Forefront-PRVS: 0487C0DB7E
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(376002)(39830400002)(346002)(189002)(199003)(66066001)(6916009)(316002)(53936002)(68736007)(5660300001)(6666003)(16586007)(16526018)(50466002)(5003940100001)(97736004)(3846002)(47776003)(53416004)(2906002)(6116002)(74482002)(48376002)(305945005)(6486002)(7736002)(106356001)(69596002)(50986999)(189998001)(2351001)(2361001)(36756003)(6506006)(33646002)(105586002)(50226002)(6512007)(101416001)(25786009)(478600001)(8936002)(81156014)(8676002)(86362001)(81166006);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DB6PR0202MB2584;
	H:piippo.intra.qt; FPR:; SPF:None; PTR:InfoNoRecords; MX:1; A:1;
	LANG:en; 
Received-SPF: None (protection.outlook.com: qt.io does not designate permitted
	sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DB6PR0202MB2584;
	23:lg8iyFk95fGw9gwLjg5b2d7kzrGekzr72EAW9s3?=
	=?us-ascii?Q?2tos+nIrnSY+e+z52Xa2ZxshB0CINBMwFpjkAP9VFLr4zEM0umj9SYwON9Wx?=
	=?us-ascii?Q?429SRiM3DQQ593JnZhjtfMkUktZOgO+3bMNguhG7O2Vzs8YW4h5HzX07RsUx?=
	=?us-ascii?Q?1q4AmVMwF+MKJKbyuEdr5viecEZ4zplUm1MyRSsEu4PwncLPDcn7WeyHj9DJ?=
	=?us-ascii?Q?nN7nd59XMoJQq7+uIW+uDjpfJsCFFvqyD38D/u0CGP7eBLCZ4GVr6bHmwMEa?=
	=?us-ascii?Q?i+S+i1qfMbx44gsn2AOvWRyaXsGWMEAjLa6IBbPVFGYoDyqNnRlTUyY5lqfh?=
	=?us-ascii?Q?lQK/9b7/bp5fKkDcxpvOuyjvzK55eR/NFUJ28kuoNs7ISFUVFw+pOjrFRhlI?=
	=?us-ascii?Q?OEaPLTZCQ5UO4BFtDiI0fJBRTSZ/6Rgw8WKBj4DkGhqPH0A/qC4IeIeKnrFc?=
	=?us-ascii?Q?J0Dmy2jErv/SDYqT9Y1YEhrzV7X9Zga4iI1lpICjZUJhO0FY03w0g54JMSWU?=
	=?us-ascii?Q?XBced8IdB0IJ3SP/bhQV4ut03TO2BW3wZtgtj1HrlMaovzgiBgQYp8vlLOd5?=
	=?us-ascii?Q?h3wroMXF5CBnU28EVvhETtc6zwXWjG3CQNwfgsMd0rnZcoEbYPhhff1FjOaZ?=
	=?us-ascii?Q?crgjsdYodAKRRlxL1rzAnkU0DYr0uIpbHH1D54Z1Xa3VR9EkbzJhRUEBbB85?=
	=?us-ascii?Q?uH5H3ReVmB2zZV5s/75NBVwYbp4uj/HZisN/roBRdO0GSKyNwZwBDKE2W/4T?=
	=?us-ascii?Q?nb/ceGjPMYb4Qy83LEaZjvbdYUlDS5Gs4/lxjLrJyh8P68tsP2vU2U9oBEYo?=
	=?us-ascii?Q?lWWGyxx3QsfeBeWTPafWKeZRQr8KJlWL8dk3HbN6AUgAQS2yEAX6fh1FuOrL?=
	=?us-ascii?Q?N53zKV9HKy5jL0iamTpN++vTn+KrzG/MqnpDhNsmjveI1lMh9OXqUFMqxI0n?=
	=?us-ascii?Q?ddYIWKIMOHVYch6vZ8xUFd3meGFDNUxQcn75HnHUNjc9xpfe/FV13Y9aDgAx?=
	=?us-ascii?Q?IS38sh4WsRGIfauZPtEnAsqDoCleWWNwJQYdk8+wO0IwqIoDyRb6IW8tetNp?=
	=?us-ascii?Q?MwoBH0QTEgpWCklPny7PcWmJ+nz7zenGpte/hvbkk6y3DGFTiX0xrZa//J8l?=
	=?us-ascii?Q?MGHtljULU3RQ=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DB6PR0202MB2584;
	6:LHcC663AAb0AlsZqtw+mBndozOM3pfq20b4K+B5lwIQfxCWWEXBSZwMbWK+33F/72bla1Gg93hC/SDuRUr3z6p003n9lipudMJgk8xMp+I1uhnFnMPVy+Absn9uKLVvqQ6KWstV4PoU864dc1t8TpMwLzka8Ji0BpcnGnOLosyV5mQcEY+kxNy1Eat8Yc007Q9PCDfwSWZC+yJQwiSH4frcu+JRYvBFMdYcmcnEHeTQ5kxmnTZJMukr8mEP75f5wp3k0E7Pf8/U9y0IoG+Yw8H3eaV4xxjORPdV6EbcYOTRF/tyiJPo5XYdMVCLZmIsfbvgtqZ/dZNuCXQEjXI1R2H56EnKUFTLX3A8ljOaKtBY=;
	5:ykVb2IzWmktMAOg6SyWAqTLOQOrMOTj9nw4Dn/ViMGHJ0jD0IQU/d7ZhLjFMgAe687uVeV09wix9oaD7AdS9g7h4hbsmCjBZmhJk9TlHU+RJpNXZ99yl17WRUwruRu3viQO3Wg7L+FJN0OFhQih4wCFY67cFVuPmRyMjNDKVehw=;
	24:3rAUFor1fuUuc/18XiO5n/HexYaLYLfvBKKFVQ0SHXpq9G7RXgDJyqnBKgSSc/lNAMGq1BN69vedxaEeQzzb+HJzp1M7myvCsqLwmPtck/U=;
	7:LdV+JUCN4y6N6A3cHM5oCpjROI/RKIKuvLf/VnocnGG5BwLWiwueoY9k8nIRZ2Hq5wBqSYxhROU60ayna9DhITws25n9371kx8rhKHyQFfpH4I8bQuHAM/hIC7BmRSnj48S+G6jad9p3q8dOGXFxyieC0Cs5bS1DVXMWCrfZEr+cwZWU1gLDJ1y1z8k99albd+H8iNOOc+rN5dUL2lwrIUK01xkQeMugP43x4TSxxZFLWY7SjM30v+flW4Zt0YPH
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: qt.io
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2017 07:13:49.7901 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eabc2c8c-5634-4728-698d-08d5280a9790
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 20d0b167-794d-448a-9d01-aaeccc1124ac
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0202MB2584
Subject: [meta-qt5][PATCH] qt5: remove use of OE_QMAKE_WAYLAND_SCANNER
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
X-List-Received-Date: Fri, 10 Nov 2017 14:45:50 -0000
Content-Type: text/plain

This was never defined for nativesdk, which then broke sdk which
had nativesdk-qtwayland included. Rather than add it there, remove
its use everywhere, since it was not adding anything meaningful to
the build.

Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
---
 classes/qmake5_base.bbclass                              | 2 --
 recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch | 9 ++++-----
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/classes/qmake5_base.bbclass b/classes/qmake5_base.bbclass
index 8e1fe20..29e8cff 100644
--- a/classes/qmake5_base.bbclass
+++ b/classes/qmake5_base.bbclass
@@ -29,7 +29,6 @@ EXTRA_OEMAKE = " \
     OE_QMAKE_LDFLAGS='${OE_QMAKE_LDFLAGS}' \
     OE_QMAKE_AR='${OE_QMAKE_AR}' \
     OE_QMAKE_STRIP='${OE_QMAKE_STRIP}' \
-    OE_QMAKE_WAYLAND_SCANNER='${OE_QMAKE_WAYLAND_SCANNER}' \
     OE_QMAKE_INCDIR_QT='${STAGING_DIR_TARGET}/${OE_QMAKE_PATH_HEADERS}' \
 "
 
@@ -43,7 +42,6 @@ export OE_QMAKE_LINK = "${CXX}"
 export OE_QMAKE_LDFLAGS = "${LDFLAGS}"
 export OE_QMAKE_AR = "${AR}"
 export OE_QMAKE_STRIP = "echo"
-export OE_QMAKE_WAYLAND_SCANNER = "${STAGING_BINDIR_NATIVE}/wayland-scanner"
 
 # qmake reads if from shell environment
 export OE_QMAKE_QTCONF_PATH = "${WORKDIR}/qt.conf"
diff --git a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
index a8fe433..4d555be 100644
--- a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
+++ b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
@@ -23,9 +23,9 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  configure                            |  2 +-
  mkspecs/features/configure.prf       |  4 ++--
  mkspecs/features/qt_functions.prf    |  2 +-
- mkspecs/linux-oe-g++/qmake.conf      | 43 ++++++++++++++++++++++++++++++++++++
+ mkspecs/linux-oe-g++/qmake.conf      | 42 ++++++++++++++++++++++++++++++++++++
  mkspecs/linux-oe-g++/qplatformdefs.h |  1 +
- 5 files changed, 48 insertions(+), 4 deletions(-)
+ 5 files changed, 47 insertions(+), 4 deletions(-)
  create mode 100644 mkspecs/linux-oe-g++/qmake.conf
  create mode 100644 mkspecs/linux-oe-g++/qplatformdefs.h
 
@@ -78,10 +78,10 @@ index c00fdb73f8..0cf4de7b49 100644
              cmd = perl -w $$system_path($${cmd}.pl)
 diff --git a/mkspecs/linux-oe-g++/qmake.conf b/mkspecs/linux-oe-g++/qmake.conf
 new file mode 100644
-index 0000000000..c1837e6d55
+index 0000000..30d31ed
 --- /dev/null
 +++ b/mkspecs/linux-oe-g++/qmake.conf
-@@ -0,0 +1,43 @@
+@@ -0,0 +1,42 @@
 +#
 +# qmake configuration for linux-g++ with modifications for building with OpenEmbedded
 +#
@@ -95,7 +95,6 @@ index 0000000000..c1837e6d55
 +# QMAKE_<TOOL> (moc, uic, rcc) are gone, overwrite only ar and strip
 +QMAKE_AR              = $$(OE_QMAKE_AR) cqs
 +QMAKE_STRIP           = $$(OE_QMAKE_STRIP)
-+QMAKE_WAYLAND_SCANNER = $$(OE_QMAKE_WAYLAND_SCANNER)
 +
 +include(../common/gcc-base-unix.conf)
 +
-- 
2.7.4


