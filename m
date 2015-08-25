Return-Path: <samuli.piippo@theqtcompany.com>
Received: from emea01-db3-obe.outbound.protection.outlook.com
	(mail-db3on0104.outbound.protection.outlook.com [157.55.234.104])
	by mail.openembedded.org (Postfix) with ESMTP id E252D76CBE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2015 11:43:49 +0000 (UTC)
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=samuli.piippo@theqtcompany.com; 
Received: from piippo.it.local (91.217.248.11) by
	AM3PR02MB1172.eurprd02.prod.outlook.com (10.163.183.150) with Microsoft
	SMTP Server (TLS) id 15.1.243.23; Tue, 25 Aug 2015 11:43:48 +0000
From: Samuli Piippo <samuli.piippo@theqtcompany.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 25 Aug 2015 14:43:53 +0300
Message-ID: <614e59f53b2b487dd9a2741ed5dea33f7acfe7d2.1440502860.git.samuli.piippo@theqtcompany.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1440502860.git.samuli.piippo@theqtcompany.com>
References: <cover.1440502860.git.samuli.piippo@theqtcompany.com>
MIME-Version: 1.0
X-Originating-IP: [91.217.248.11]
X-ClientProxiedBy: AM3PR08CA0009.eurprd08.prod.outlook.com (25.160.207.147) To
	AM3PR02MB1172.eurprd02.prod.outlook.com (25.163.183.150)
X-Microsoft-Exchange-Diagnostics: 1; AM3PR02MB1172;
	2:UTXrftj+s9p+c/pFtdjg/PKP2EQ6i8MkK9vIt61UjuH/VTCU3IuWrItfPyV9rjFa/7HRuPjSz2kS9Rup5+a5sW+CRN4hVJtR6PZMxviGb0zqJ2L7wW9AZRgBUJ8QBGV6zBGQeuYVI+Jok+2oNdRV7Mu4Jg24XvBXKyN44AxWAh0=;
	3:Rk71s558EUYeYdXD4Ou8JnNc7MIHp7uLkaTpL32CYB73FseXIphePbQ18mKN7rdLloqNs5P0SI0gl9AiI8TZhv1KsSS+u5h3dGRoKCSQ5LhBH3GtNd86pYvsyg8c1l1BDL52i6/Rz90bdW9q/lxMiw==;
	25:tTuusFZbNy28Pj2bteSaRfF6geibOoKrHJMKWY3UznICPRXgCElWlhg6YDyVXb7a+Gv1IZBtVPEqyvsBlnB6W0BGAffiWnekmMkjRJSzKYfFjKugLpzi9m/7ysOyG3BgWJHGa4JoN467xpszSc9tlMZWEfcdRkb/UeciGnRME6qhRckQ4SZrvtrx8yI9zDm5TendHNwIrlnYUadKha80Kuif3XHky2W+wlUcmy7dGeqy6lWaqtqZbeTv0mWr+3Cd
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:AM3PR02MB1172;
X-Microsoft-Exchange-Diagnostics: 1; AM3PR02MB1172;
	20:mrzyOV8YEEU2obfNZoc/HG5EjrUefYhRisSG/n8FyFJVwWiEo+8LI9lzM5sRlxhxn4sMxlxRMW2R9EksJMn5L+mLeOLX55e3fhRHQ4hMASnCZwIP/fi0qp1f4XHzBgb+Cisa41OcHZj039M/Dr6WKfyJVD75cCU5vPSBTcp2kTL4I/OcC0RCTaW8rudCWn4+/dnFzXzyz7kL1O4JbZ1UVTfVoa/CFZM++aELUpfMXOSfV9jo7horZiaI83vfc89qT+TsHh4cVeSz1SVBMBmS/OsImw0Z6m7ESoZTgHC6Rhq+gMmHhwwSoKNJgNI3q63G4U6xWM9Z6KJehBWL/Gev4Ezy8/kSM6Mz6ODSKie/rzK7Y5a8HzqmgmN4h1R8xC6CUWa4EiRuyAexXoNPEGT+Pwk7/ZweLqZPHSiBd7dMfN5SL0DXmuD15+85roicuE56Ivb8ll0jB69lNeUAiX1y6c1qQZH3i2tuGWhaTjr4x+5N8e0Khd9tIZ+n+azojGrp;
	4:rhXqNj4zmJQ7L2CwAunlbQa1NquMibPzSddT7KUUfR6BdJqR9j1QGpoQSymBlVj6ZoLRchB4omJseOh/uDzdiLMiL3LZY7+2FbM/bGWQxgH7Qf6ho6LCu6i+jYykQQuC0jFuuh7AjJ0GNzUVyKPQmrY6h6lUlisXmG/Scg25tQNrWCP+hLMTSWfPkNISDNY9ZdlH9jLxvK3/xmirz/n+6w4bDrmS7OF9oosfTLbgXsC0IhN/6w60s87SIc726BRjqqqys3Nymf4Y7pL20etodbiJqEDNXpIXL4MFi5FpXcDW2iWkPvWh1AGTodhmyZkD
X-Microsoft-Antispam-PRVS: <AM3PR02MB117210CCA255F19DECBC92E490610@AM3PR02MB1172.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(8121501046)(3002001);
	SRVR:AM3PR02MB1172; BCL:0; PCL:0; RULEID:; SRVR:AM3PR02MB1172; 
X-Forefront-PRVS: 06793E740F
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(199003)(189002)(122386002)(575784001)(46102003)(5001830100001)(2950100001)(66066001)(92566002)(77156002)(50466002)(450100001)(229853001)(97736004)(36756003)(42186005)(77096005)(5004730100002)(33646002)(64706001)(48376002)(86362001)(40100003)(81156007)(118296001)(106356001)(5001920100001)(101416001)(5001860100001)(50226001)(105586002)(4001540100001)(62966003)(2351001)(19580405001)(87976001)(107886002)(68736005)(189998001)(50986999)(19580395003)(47776003)(5001960100002)(5007970100001)(110136002)(76176999)(5003940100001)(7099028)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM3PR02MB1172; H:piippo.it.local;
	FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: theqtcompany.com does not
	designate permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; AM3PR02MB1172;
	23:1Ns09J9+geU8eNt2K46hferTRnCdhgEXAqdXPzhu/?=
	=?us-ascii?Q?RVsZdY5E2hnRj9YIYh/AUzy/fkEDTotiYBd8vzohUuoJa2iM+5bj85/7LMyK?=
	=?us-ascii?Q?xsuU4kzqoPHxyV02utgNig6n2Pe7vVgRPd0KlOQd5JqiLirHAGjNiyguoj+e?=
	=?us-ascii?Q?HJwtec6/uw8dhPvcSP5hOxFLnCRcAWlTMgrx8AMhrJUKOXfaKUEE5RQNpzfd?=
	=?us-ascii?Q?MLTX5yQIu1XDb6MU2arkdH5t3lYlaU/BJDMcxAlMlpe7e4JooPq+IyLLcJ/L?=
	=?us-ascii?Q?rBvSoVSv/bE/3vJcHOyTbNQNwIT5fJtwqzFpZvwV8HFPNlGcqHp2li1OggoT?=
	=?us-ascii?Q?b7py9WrkebOCwvCy2I2TsJ1Lz8/6z6u+UY6zz4GcaUWtePAWBiGU/02IwLLZ?=
	=?us-ascii?Q?0N/f7wegUjrAeRFXGBGunbpUnewHTtvuHrf7rsJ18c3L0AsWRJx34yRWE9eb?=
	=?us-ascii?Q?TWmoY/hB6e5XDeokIS3DYPXwpXQhZW0Y99WjprT6iSKDHbwDlxMIZaHzPfDH?=
	=?us-ascii?Q?/p7lf1i/MKr4VpPKZFxWmhyfpxAo8H+FsOlICud6tY06x6EkB/imZ36twdc0?=
	=?us-ascii?Q?yDA3zHOQdi6DDQbblvgSrbwVWSJM3rcP0ANOE2pV6xd0kZoU7hvdjenOZsvU?=
	=?us-ascii?Q?eMZSCAcjQL4aOqt5QXVRgzgm2SqxJfOpA5qz9yibMVDUgcNoYFqtC1uMleZa?=
	=?us-ascii?Q?Jv8fULRy5rM3E7MhPRtaKx1AI8w2vAok4fIjiOo1TSXF4EiHXzKfV1i7dxL9?=
	=?us-ascii?Q?p28YBTl4QN3WcluW2ccuqoB3RA6sp9K5p4rPgfq0VceOVf9fk6Zm9R5o6fEZ?=
	=?us-ascii?Q?xz+tmPA3OWdQb1nwtcZXufly38nYXkG4Vf+9AE8wkYLMykZ3kVxWYbcMaLrA?=
	=?us-ascii?Q?owooKoeWOvvM9Bt4pDPVit7moAh90fVuUgogyPTpGcMfgWhHLUB7b3qMhu3z?=
	=?us-ascii?Q?GjIAdVj/LGhYKhzftCwGi4clgrOUK/MirlGehYbmj+3E0POJflWQuTf37ISk?=
	=?us-ascii?Q?EM0HpfPuQHmnBcb2/2147y06EvupPrvrl1zq9UO+FzkmaAJCWrnQzgPtS1FN?=
	=?us-ascii?Q?WH+2SwKqqIn2nFkNEzq5iZQVnVx25MEiB6YENIDbrNQXZqpxJRv6U5rXgycG?=
	=?us-ascii?Q?ttQYCggtHURz4LRAgXSW9Z6Ct1m8gw0hOFQxuHhAaZKCqpI5xMts2MCgmWxH?=
	=?us-ascii?Q?jThRB2O/AtzjsKQ4ScGHY4Ag8POAp/wq2+XYhkBlDzSxaz13neT/+rtpVc8A?=
	=?us-ascii?Q?9KsG9CoH0Muu+Hz0BMptDLJvVe7nGZQaVaUaXCfwZYaDSkJtpUwtsPpFBvHU?=
	=?us-ascii?Q?ym8sKymWpRN9blhOMzLm6Yox6vKzsnE1DMaLoiHFUfyEDru7mV4Pu3MJjIEN?=
	=?us-ascii?Q?EquQw=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; AM3PR02MB1172;
	5:nQoZapjuaSWEfK5N88J1a/bkyq5Dbya8A7lMgNWsH6dAXXLX+oS+3STGBB7fzVz5QgGoX65TVysoysDj04q0zd5C7vRe80BcGqJM6NRd+h/FvPztk0UCSr9txjMqGhiYjJnVbvDorSYRsEOtmcaOkg==;
	24:0kDpW/B3SLV0NWVypimjYpoHUWHKUXDBJJK7suKr89RnedOw0S0aiMDCrYi5K18RJp9FXKIttyBj58knnTnQRF8jhG8AIzZ6XGsi7lFCEcM=;
	20:Iy6EUP7oRbJ5O6ZCq0V8JBKq0kkpMCs0Jfl+/SS/MVMZPaUtgKM333okyjP0U1a2iVryRG10oNN67HuKmz/6HA==
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: theqtcompany.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2015 11:43:48.1862 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM3PR02MB1172
Subject: [meta-qt5][PATCH v2 11/11] qtwebengine: fix problem with recursive qmake call
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
X-List-Received-Date: Tue, 25 Aug 2015 11:43:50 -0000
Content-Type: text/plain

On RaspberryPi, the EGL include paths were not included in the generated
ninja build files, because the pro files were run in wrong order. Fix the
order, but remove compiler overrides, as they would break the build again.

Signed-off-by: Samuli Piippo <samuli.piippo@theqtcompany.com>
---
 .../0005-Generate-usable-qmake_extras.gypi.patch   | 71 ++++++++++++++++++++++
 recipes-qt/qt5/qtwebengine_git.bb                  |  1 +
 2 files changed, 72 insertions(+)
 create mode 100644 recipes-qt/qt5/qtwebengine/0005-Generate-usable-qmake_extras.gypi.patch

diff --git a/recipes-qt/qt5/qtwebengine/0005-Generate-usable-qmake_extras.gypi.patch b/recipes-qt/qt5/qtwebengine/0005-Generate-usable-qmake_extras.gypi.patch
new file mode 100644
index 0000000..89f56e0
--- /dev/null
+++ b/recipes-qt/qt5/qtwebengine/0005-Generate-usable-qmake_extras.gypi.patch
@@ -0,0 +1,71 @@
+From 9d2fafdd9a15adf51d8383bdd545d73e76ad0428 Mon Sep 17 00:00:00 2001
+From: Samuli Piippo <samuli.piippo@theqtcompany.com>
+Date: Mon, 11 May 2015 13:47:06 +0300
+Subject: [PATCH] Generate usable qmake_extras.gypi
+
+Running qmake recursively does not take .depends into account, so
+the SUBDIRS need to be in correct order so that qmake_extras.gypi
+is used for the ninja files. Do no try to write compiler tools as
+it will break the build.
+
+Task-number: QTBUG-45706
+Upstream-Status: Pending
+---
+ src/core/core.pro                 | 7 ++++---
+ src/core/gyp_configure_host.pro   | 3 ---
+ src/core/gyp_configure_target.pro | 3 ---
+ 3 files changed, 4 insertions(+), 9 deletions(-)
+
+diff --git a/src/core/core.pro b/src/core/core.pro
+index cf00f39..747b711 100644
+--- a/src/core/core.pro
++++ b/src/core/core.pro
+@@ -12,9 +12,7 @@ gyp_run.depends = core_gyp_generator
+ core_module.file = core_module.pro
+ core_module.depends = gyp_run
+ 
+-SUBDIRS += core_gyp_generator \
+-           gyp_run \
+-           core_module
++SUBDIRS += core_gyp_generator
+ 
+ !win32 {
+     # gyp_configure_host.pro and gyp_configure_target.pro are phony pro files that
+@@ -28,3 +26,6 @@ SUBDIRS += core_gyp_generator \
+     gyp_run.depends += gyp_configure_host gyp_configure_target
+     SUBDIRS += gyp_configure_host gyp_configure_target
+ }
++
++SUBDIRS += gyp_run \
++           core_module
+diff --git a/src/core/gyp_configure_host.pro b/src/core/gyp_configure_host.pro
+index 3eb6738..d6820c4 100644
+--- a/src/core/gyp_configure_host.pro
++++ b/src/core/gyp_configure_host.pro
+@@ -6,9 +6,6 @@ option(host_build)
+ 
+ GYPI_CONTENTS = "{" \
+                 "  'make_global_settings': [" \
+-                "    ['CC.host', '$$which($$QMAKE_CC)']," \
+-                "    ['CXX.host', '$$which($$QMAKE_CXX)']," \
+-                "    ['LD.host', '$$which($$QMAKE_LINK)'],"
+ 
+ GYPI_FILE = $$absolute_path('qmake_extras.gypi')
+ !build_pass {
+diff --git a/src/core/gyp_configure_target.pro b/src/core/gyp_configure_target.pro
+index 4d52044..f02bfa0 100644
+--- a/src/core/gyp_configure_target.pro
++++ b/src/core/gyp_configure_target.pro
+@@ -3,9 +3,6 @@ TEMPLATE = aux
+ 
+ TOOLCHAIN_INCLUDES = $${QMAKE_INCDIR_EGL} $${INCLUDEPATH} $${QMAKE_INCDIR}
+ 
+-GYPI_CONTENTS += "    ['CC', '$$which($$QMAKE_CC)']," \
+-                 "    ['CXX', '$$which($$QMAKE_CXX)']," \
+-                 "    ['LD', '$$which($$QMAKE_LINK)'],"
+ GYPI_CONTENTS += "  ]," \
+                  "  'target_defaults': {" \
+                  "    'target_conditions': [" \
+-- 
+1.9.1
+
diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index fa0f019..1255b3c 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -80,6 +80,7 @@ SRC_URI += " \
     file://0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch \
     file://0003-functions.prf-allow-build-for-linux-oe-g-platform.patch \
     file://0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch \
+    file://0005-Generate-usable-qmake_extras.gypi.patch \
 "
 SRCREV_qtwebengine = "c6573119006014ff7bc0efb2da16ea35d302a1ec"
 SRCREV_chromium = "41a1a031cd69e187a9608359ffe56652dcaaa6c5"
-- 
1.9.1


