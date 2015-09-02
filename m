Return-Path: <samuli.piippo@theqtcompany.com>
Received: from emea01-am1-obe.outbound.protection.outlook.com
	(mail-am1on0136.outbound.protection.outlook.com [157.56.112.136])
	by mail.openembedded.org (Postfix) with ESMTP id 14B1676FDE
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Sep 2015 09:29:16 +0000 (UTC)
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=samuli.piippo@theqtcompany.com; 
Received: from piippo.it.local (91.217.248.11) by
	DB5PR02MB1175.eurprd02.prod.outlook.com (10.162.163.21) with Microsoft
	SMTP Server (TLS) id 15.1.256.15; Wed, 2 Sep 2015 09:29:14 +0000
From: Samuli Piippo <samuli.piippo@theqtcompany.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 2 Sep 2015 12:28:55 +0300
Message-ID: <1441186136-13539-1-git-send-email-samuli.piippo@theqtcompany.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [91.217.248.11]
X-ClientProxiedBy: AM2PR03CA0025.eurprd03.prod.outlook.com (25.160.207.35) To
	DB5PR02MB1175.eurprd02.prod.outlook.com (25.162.163.21)
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1175;
	2:g7+tld4/c/GloA+ZV9bepwwLhjym0gDzXBu3nZh8kOG5hEd5QZWpAgtZlAJY9TLzY8dfoYhG6NDcZJjTeJgqG2ycRbOu8HymGmU/0UAA3Ud73Cj00zZcclsPhZHGdOP43nlkj4w+0wae/P+ItSoNeD+2748eg6fsX5IFOAL9u30=;
	3:b7gZSYUP1z/TobsEsebE0q59BrobSAR/NQSNy4tvJMr0A07Wtq9dImqucFLu/RqJf/5VipbFM/LweQDzNp46oUgx13iAewL9SCvkAowAK2l5BY3tWbzdnVGs/tnDCw2NRvUZoVIbuMAOoe+izExxlA==;
	25:vawv8057rarW8eCl3nLOmnOKtkgPl/7QcGIVnz5m+IozqNMXLDu9/YfqwQtB0nx3hYjF8V4IikiD9x7Jn9JelcsIw89X+ZOJK5UUGX2rRej3nnE9qPOw4ohROx0OTTSoE/5V+IIn4EWjcZMvr6FTe+8Ui/jJObDTR7cXe90kNeJ4YrzYwRfIyGhimVj1jKzjUcgdK9oBj5zDnaUT27EiZo8uyBlqIEtuKCYlB+U90aq2Q5AWHUF9pfLvwDnzzLfAtxaYk/24pkum3j7SdpPPBA==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DB5PR02MB1175;
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1175;
	20:gGdgv7VF1kjvayU82PBO0GfKnzKCkRjByUYhCkKQ+nfz4EUei5wsMI4lyoYUW/FIY5rsyCZRACXIM1so2GnfPb6YxMciBuR1+rtMrJv5ji7vRpvVaYlWmuIS8DW9xY+mWyHw2hF+ArRNakL41P3j7MevkdnMvoe9yyCVyqT5wb99u86r0yhwepZBp2GuUm8VN5guEJ32Kr26DrdH4ImsLpXe3Z+FPFgRLIx2c9r7sk0SQYRYY6HMcwaBtll/rCArZLnr9nnMsby4YxfmJrl22pBc0yIePofoeP5KbeWe/b25bJP1dTwad+BI1INUT7y6omjutI0eOdoc5LA6jIf/YNOLLW29k8SABuyYP5vfRzY/6QQEMo6Kc22N/7GqZ4EXvaKQADn2zUioW+NRXUPluMp2Gm8hJuR7YFcso4Azmd6zkTxyjRzK0cyDg1Zr/HxseZGULm9SQv3PM8g41TXzklrshyHQKUN1H4OCqYsmJ1PMn33fksjEN6g4/3eUfxhz;
	4:Os78gwzbWpTcmMWVEkNbuLaKgezDpN1G7pY3x6ZcdXbLW4U1ataVZO8fggKbFYXC91RJJPgbWFYYtbqps2Ezqp9rfQPCtIPdPyeTPu4BvPJKuYX964KL1Qs9LR0gk9kbcAHskxwmqxpKwBDWDxV1RqL/sx90BB0eT/Pp0QA5sKaiGUEEFFWNd+VsbUOV0ySn8Etty2q+p/7f8wZ4Nwr0XHMlxHwocWTW433+YKaC1P6vRIOXAKGuBAninbS0mioAS+xJM0nk7lh/FygqPfUa96W4eBLh9tjM1oiIj61I9+V18h8Qz6PWwXFZbR9IJwjV
X-Microsoft-Antispam-PRVS: <DB5PR02MB117520EB612B0F92F0B8F7DF90690@DB5PR02MB1175.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(8121501046)(5005006)(3002001);
	SRVR:DB5PR02MB1175; BCL:0; PCL:0; RULEID:; SRVR:DB5PR02MB1175; 
X-Forefront-PRVS: 0687389FB0
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(199003)(189002)(50226001)(86362001)(48376002)(47776003)(5003940100001)(97736004)(19580395003)(5001960100002)(19580405001)(189998001)(50466002)(105586002)(229853001)(450100001)(46102003)(106356001)(64706001)(92566002)(77156002)(4001540100001)(66066001)(5001920100001)(33646002)(101416001)(68736005)(81156007)(50986999)(77096005)(110136002)(107886002)(5001830100001)(5001860100001)(122386002)(42186005)(87976001)(2351001)(62966003)(40100003)(5004730100002)(36756003)(5007970100001)(7099028)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DB5PR02MB1175; H:piippo.it.local;
	FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: theqtcompany.com does not
	designate permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DB5PR02MB1175;
	23:JTwspXFzWWDPi34La0KCyBEJkkRQaY75tsXrzKrb5?=
	=?us-ascii?Q?JkUMX7RMRUIFnztZZAhpRdi4RyyKYwz/xtE97f/hR8+GS+D7oTxJJ1/t0cb9?=
	=?us-ascii?Q?70Z7WO3D2vC2VKYXSM4MccddpAhOkqpW6JiZYLFaq0aDrNZsg5f8Jw9YU+ki?=
	=?us-ascii?Q?Vic0T2e5LAyCocn0d6o9Hop3uVUCyk13p0CXBVWDKQMBtm+2aHzD1Vb+EQs1?=
	=?us-ascii?Q?o2TQ8CuNWWUgGYO4ePRC9C5FaYjzBSQF35KvoZ2NbTfNPCi3fSxKGs1aLvqI?=
	=?us-ascii?Q?kl0IXna3xAc+KAgLkfXgaJe1W7Bv+DwTwQnT7uumIoKs0/BlA3f+aL/5iPUf?=
	=?us-ascii?Q?BaYcwebOivFTYRbl5L/Eq7D70S+g33DBI+ocQ0iZK1z6JvMZr+0rWQfAMfXB?=
	=?us-ascii?Q?w8tixF/Ryx6sNLDc/DWuafkHTQrWYdFJZQxTn1Zlf68MCUKjVcxKNvz1rBO+?=
	=?us-ascii?Q?HBvh+Ej4N3/yXFHnbSpbNhtsWF/VBInW/qVhuLJIw9RAWXw1ANrtGOLx1s/j?=
	=?us-ascii?Q?bV/l9Ki7ZdeHnAlq+2Ex4V/youEK9QpOOClIALDGd/jEGw6VNVxsaG+tygAK?=
	=?us-ascii?Q?U9DVNSZzSRbnHZrfdz/A3TvZc0188EWnOYfsQPfb5ioP4XHaPa+b1/fgqHRF?=
	=?us-ascii?Q?9l5EVgbmGpg6UhGy+NowGjF7ajQstE8lf0++FzKnBx13KOnavINLHng4ZLw7?=
	=?us-ascii?Q?75W7/EcdeUIaX0/V7ix2pn3sAz9XczBaPTbcvQdkiXh3gRWVXR9YRq7fko+/?=
	=?us-ascii?Q?kvzZh7C866p01Kj1CSfsj7icmuunoffa5sB7LZx44CZdqQYzBwegthMe2NJD?=
	=?us-ascii?Q?jLmDSbbAs7p8QzMrB5VbWl9Gl424NhHhiW02Zdj3d8DVyEntWL6FreTcHKR4?=
	=?us-ascii?Q?nk538IpZM350umTiwDyotTQZXm/BI7A+YOVxpcoNJCbqqktosvhICYTYi+sB?=
	=?us-ascii?Q?KlFVWhr7fjyKVfI5EDtmcZsFgIQYB7m+jVK90yA9ImFfiw/ptw1iG4NlRhGE?=
	=?us-ascii?Q?5OCrLfXZoH6KABdTZl5PQYgjCrEj4XtiSfMVZMcBxBgPyNAjrt7X3hQgo+Yl?=
	=?us-ascii?Q?09OApXcBPjkC9kLSA7U12Zj+ED7qCn3rkmRJPrOhIWG3bUxLWfQ24Tti7g22?=
	=?us-ascii?Q?8ppVg+Wc3CDllSDJhrZ+Aldy6HBcdv4yLqn3hKErc00KR8tj+Fdqzlf3WN3x?=
	=?us-ascii?Q?aYXqEYal11Cz0ixtNt/8zswdR4Hfv7gfrP6NXx7H64vUD+qdtKHLvHjlDeTv?=
	=?us-ascii?Q?926Q211MUJ38x/6DJs=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1175;
	5:NT6EqiNzQiB+mpFCLK/bACc7Tj/88bh/gp/ZOnKphDVTyom9KEdAK9477Kl3QtNhnl1tBiIXS7L3T+VoDPUzWRiAm4lkdtlat4SH4YaIqjwBIYYoSOz61Zv6hm/fg5XMkRs2bATRAp4mfMnHmdBcMA==;
	24:34S3M/Ur+V1Fpm1OyX0H8m8/S5aQgEy3lLZu6TFUjnYEX6UvVkGOpDxS8IBTY8Wsec35ogjHu2IjX9Malt0/N80Yk1+P6Prr2PrUii4DLDg=;
	20:+2yFbEc07eWJ/zvO3kAbJKqHm+YsB8cU++qu9Zsojek6/D5XwITHZvAXBv59Tmty7WfwbaW74ihk/fZeD9nUzg==
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: theqtcompany.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2015 09:29:14.4637 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR02MB1175
Subject: [meta-qt5][PATCH 1/2] qt5: make populate_sdk_qt5 reusable
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
X-List-Received-Date: Wed, 02 Sep 2015 09:29:22 -0000
Content-Type: text/plain

Split the populate_sdk_qt5 bbclass into two parts, where the generation
of qt.conf is moved to a new base bbclass. It is reusable in toolchain
meta recipes that use different tasks than meta-toolchain-qt5.

Signed-off-by: Samuli Piippo <samuli.piippo@theqtcompany.com>
---
 classes/populate_sdk_qt5.bbclass      | 34 ++--------------------------------
 classes/populate_sdk_qt5_base.bbclass | 31 +++++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+), 32 deletions(-)
 create mode 100644 classes/populate_sdk_qt5_base.bbclass

diff --git a/classes/populate_sdk_qt5.bbclass b/classes/populate_sdk_qt5.bbclass
index 149a448..bbf137d 100644
--- a/classes/populate_sdk_qt5.bbclass
+++ b/classes/populate_sdk_qt5.bbclass
@@ -1,38 +1,8 @@
 # Copyright (C) 2014 O.S. Systems Software LTDA.
 
+inherit populate_sdk_qt5_base
+
 TOOLCHAIN_HOST_TASK += "nativesdk-packagegroup-qt5-toolchain-host"
 TOOLCHAIN_TARGET_TASK += "packagegroup-qt5-toolchain-target"
 
-# This allow reuse of Qt paths
-inherit qmake5_paths
-
-create_sdk_files_prepend () {
-    # make a symbolic link to mkspecs for compatibility with QTCreator
-    (cd ${SDK_OUTPUT}/${SDKPATHNATIVE}; \
-         ln -sf ${SDKTARGETSYSROOT}${libdir}/${QT_DIR_NAME}/mkspecs mkspecs;)
-
-    # Generate a qt.conf file to be deployed with the SDK
-    qtconf=${SDK_OUTPUT}/${SDKPATHNATIVE}${OE_QMAKE_PATH_HOST_BINS}/qt.conf
-    touch $qtconf
-    echo '[Paths]' >> $qtconf
-    echo 'Prefix = ${OE_QMAKE_PATH_PREFIX}' >> $qtconf
-    echo 'Headers = ${OE_QMAKE_PATH_QT_HEADERS}' >> $qtconf
-    echo 'Libraries = ${OE_QMAKE_PATH_LIBS}' >> $qtconf
-    echo 'ArchData = ${OE_QMAKE_PATH_QT_ARCHDATA}' >> $qtconf
-    echo 'Data = ${OE_QMAKE_PATH_QT_DATA}' >> $qtconf
-    echo 'Binaries = ${OE_QMAKE_PATH_QT_BINS}' >> $qtconf
-    echo 'LibraryExecutables = ${OE_QMAKE_PATH_LIBEXECS}' >> $qtconf
-    echo 'Plugins = ${OE_QMAKE_PATH_PLUGINS}' >> $qtconf
-    echo 'Imports = ${OE_QMAKE_PATH_IMPORTS}' >> $qtconf
-    echo 'Qml2Imports = ${OE_QMAKE_PATH_QML}' >> $qtconf
-    echo 'Translations = ${OE_QMAKE_PATH_QT_TRANSLATIONS}' >> $qtconf
-    echo 'Documentation = ${OE_QMAKE_PATH_QT_DOCS}' >> $qtconf
-    echo 'Settings = ${OE_QMAKE_PATH_QT_SETTINGS}' >> $qtconf
-    echo 'Examples = ${OE_QMAKE_PATH_QT_EXAMPLES}' >> $qtconf
-    echo 'Tests = ${OE_QMAKE_PATH_QT_TESTS}' >> $qtconf
-    echo 'HostPrefix = ${SDKPATHNATIVE}' >> $qtconf
-    echo 'HostBinaries = ${SDKPATHNATIVE}${OE_QMAKE_PATH_HOST_BINS}' >> $qtconf
-    echo 'Sysroot = ${SDKTARGETSYSROOT}' >> $qtconf
-}
-
 FEATURE_PACKAGES_qtcreator-debug = "packagegroup-qt5-qtcreator-debug"
diff --git a/classes/populate_sdk_qt5_base.bbclass b/classes/populate_sdk_qt5_base.bbclass
new file mode 100644
index 0000000..4a1eed3
--- /dev/null
+++ b/classes/populate_sdk_qt5_base.bbclass
@@ -0,0 +1,31 @@
+# This allow reuse of Qt paths
+inherit qmake5_paths
+
+create_sdk_files_prepend () {
+    # make a symbolic link to mkspecs for compatibility with QTCreator
+    (cd ${SDK_OUTPUT}/${SDKPATHNATIVE}; \
+         ln -sf ${SDKTARGETSYSROOT}${libdir}/${QT_DIR_NAME}/mkspecs mkspecs;)
+
+    # Generate a qt.conf file to be deployed with the SDK
+    qtconf=${SDK_OUTPUT}/${SDKPATHNATIVE}${OE_QMAKE_PATH_HOST_BINS}/qt.conf
+    touch $qtconf
+    echo '[Paths]' >> $qtconf
+    echo 'Prefix = ${OE_QMAKE_PATH_PREFIX}' >> $qtconf
+    echo 'Headers = ${OE_QMAKE_PATH_QT_HEADERS}' >> $qtconf
+    echo 'Libraries = ${OE_QMAKE_PATH_LIBS}' >> $qtconf
+    echo 'ArchData = ${OE_QMAKE_PATH_QT_ARCHDATA}' >> $qtconf
+    echo 'Data = ${OE_QMAKE_PATH_QT_DATA}' >> $qtconf
+    echo 'Binaries = ${OE_QMAKE_PATH_QT_BINS}' >> $qtconf
+    echo 'LibraryExecutables = ${OE_QMAKE_PATH_LIBEXECS}' >> $qtconf
+    echo 'Plugins = ${OE_QMAKE_PATH_PLUGINS}' >> $qtconf
+    echo 'Imports = ${OE_QMAKE_PATH_IMPORTS}' >> $qtconf
+    echo 'Qml2Imports = ${OE_QMAKE_PATH_QML}' >> $qtconf
+    echo 'Translations = ${OE_QMAKE_PATH_QT_TRANSLATIONS}' >> $qtconf
+    echo 'Documentation = ${OE_QMAKE_PATH_QT_DOCS}' >> $qtconf
+    echo 'Settings = ${OE_QMAKE_PATH_QT_SETTINGS}' >> $qtconf
+    echo 'Examples = ${OE_QMAKE_PATH_QT_EXAMPLES}' >> $qtconf
+    echo 'Tests = ${OE_QMAKE_PATH_QT_TESTS}' >> $qtconf
+    echo 'HostPrefix = ${SDKPATHNATIVE}' >> $qtconf
+    echo 'HostBinaries = ${SDKPATHNATIVE}${OE_QMAKE_PATH_HOST_BINS}' >> $qtconf
+    echo 'Sysroot = ${SDKTARGETSYSROOT}' >> $qtconf
+}
-- 
1.9.1


