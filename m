Return-Path: <Alex.Gonzalez@digi.com>
Received: from mail1.bemta12.messagelabs.com (mail1.bemta12.messagelabs.com
	[216.82.251.5])
	by mail.openembedded.org (Postfix) with ESMTP id C00A460557
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Dec 2014 15:25:04 +0000 (UTC)
Received: from [216.82.249.131] by server-5.bemta-12.messagelabs.com id
	90/10-03158-05514A45; Wed, 31 Dec 2014 15:25:04 +0000
X-Env-Sender: Alex.Gonzalez@digi.com
X-Msg-Ref: server-3.tower-28.messagelabs.com!1420039503!28379356!1
X-Originating-IP: [66.77.174.13]
X-StarScan-Received: 
X-StarScan-Version: 6.12.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6527 invoked from network); 31 Dec 2014 15:25:04 -0000
Received: from mail.mx1.digi.com (HELO mcl-sms-ns1.digi.com) (66.77.174.13)
	by server-3.tower-28.messagelabs.com with RC4-SHA encrypted SMTP;
	31 Dec 2014 15:25:04 -0000
Received: from MCL-VMS-XCH01.digi.com (10.5.8.49) by mail.mx1.digi.com
	(172.16.1.13) with Microsoft SMTP Server (TLS) id 8.3.389.2;
	Wed, 31 Dec 2014 09:24:52 -0600
Received: from DOR-SMS-XCH01.digi.com (10.49.8.99) by MCL-VMS-XCH01.digi.com
	(10.5.8.49) with Microsoft SMTP Server (TLS) id 14.3.210.2;
	Wed, 31 Dec 2014 09:25:02 -0600
Received: from log-linux-hp-agonzal.digi.com (10.101.2.169) by
	dor-sms-xch01.digi.com (10.49.8.99) with Microsoft SMTP Server (TLS) id
	14.3.210.2; Wed, 31 Dec 2014 16:25:00 +0100
From: Alex Gonzalez <alex.gonzalez@digi.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 31 Dec 2014 16:24:45 +0100
Message-ID: <1420039486-18734-2-git-send-email-alex.gonzalez@digi.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1420039486-18734-1-git-send-email-alex.gonzalez@digi.com>
References: <1420039486-18734-1-git-send-email-alex.gonzalez@digi.com>
MIME-Version: 1.0
X-Originating-IP: [10.101.2.169]
X-KSE-AntiSpam-Interceptor-Info: protection disabled
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean
Subject: [meta-java][PATCH 1/2] icedtea: openjdk: Remove currency data generation expiration date.
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
X-List-Received-Date: Wed, 31 Dec 2014 15:25:11 -0000
Content-Type: text/plain

The currency data generation class makes a 10 years expiration date check.

It might be reasonable to make sure the input data is updated
periodically, but on an embedded system we don't want to have this type of
built in time expirations.

This commit removes the date expiration check.

Signed-off-by: Alex Gonzalez <alex.gonzalez@digi.com>
---
 ...njdk-remove-currency-data-generation-expi.patch | 25 ++++++++++++++++++++++
 recipes-core/icedtea/icedtea6-native_1.8.11.bb     |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 recipes-core/icedtea/icedtea6-native-1.8.11/icedtea-openjdk-remove-currency-data-generation-expi.patch

diff --git a/recipes-core/icedtea/icedtea6-native-1.8.11/icedtea-openjdk-remove-currency-data-generation-expi.patch b/recipes-core/icedtea/icedtea6-native-1.8.11/icedtea-openjdk-remove-currency-data-generation-expi.patch
new file mode 100644
index 000000000000..eabee677fe0e
--- /dev/null
+++ b/recipes-core/icedtea/icedtea6-native-1.8.11/icedtea-openjdk-remove-currency-data-generation-expi.patch
@@ -0,0 +1,25 @@
+From 5f5ed54f7f1ed82583f0f42abfa2625a93e96dd9 Mon Sep 17 00:00:00 2001
+From: Alex Gonzalez <alex.gonzalez@digi.com>
+Date: Wed, 31 Dec 2014 15:04:10 +0100
+Subject: [PATCH] icedtea: openjdk: remove currency data generation expiration
+ date.
+
+Signed-off-by: Alex Gonzalez <alex.gonzalez@digi.com>
+---
+ .../src/build/tools/generatecurrencydata/GenerateCurrencyData.java     | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/jdk/make/tools/src/build/tools/generatecurrencydata/GenerateCurrencyData.java b/jdk/make/tools/src/build/tools/generatecurrencydata/GenerateCurrencyData.java
+index 29201c25909a..f66f523de5bd 100644
+--- a/jdk/make/tools/src/build/tools/generatecurrencydata/GenerateCurrencyData.java
++++ b/jdk/make/tools/src/build/tools/generatecurrencydata/GenerateCurrencyData.java
+@@ -281,9 +281,6 @@ public class GenerateCurrencyData {
+             checkCurrencyCode(newCurrency);
+             String timeString = currencyInfo.substring(4, length - 4);
+             long time = format.parse(timeString).getTime();
+-            if (Math.abs(time - System.currentTimeMillis()) > ((long) 10) * 365 * 24 * 60 * 60 * 1000) {
+-                throw new RuntimeException("time is more than 10 years from present: " + time);
+-            }
+             specialCaseCutOverTimes[specialCaseCount] = time;
+             specialCaseOldCurrencies[specialCaseCount] = oldCurrency;
+             specialCaseOldCurrenciesDefaultFractionDigits[specialCaseCount] = getDefaultFractionDigits(oldCurrency);
diff --git a/recipes-core/icedtea/icedtea6-native_1.8.11.bb b/recipes-core/icedtea/icedtea6-native_1.8.11.bb
index 8ed3559be1ee..4b583174a41d 100644
--- a/recipes-core/icedtea/icedtea6-native_1.8.11.bb
+++ b/recipes-core/icedtea/icedtea6-native_1.8.11.bb
@@ -18,6 +18,7 @@ SRC_URI = "\
 	file://build-hacks-native.patch \
 	file://icedtea-sane-x86-arch-name.patch \
         file://icedtea-fix-jar-path.patch \
+        file://icedtea-openjdk-remove-currency-data-generation-expi.patch;patchdir=../openjdk-src-dir \
 	${ICEDTEA_PATCHES} \
 	"
 SRC_URI[ojdk.md5sum] = "94db01691ab38f98b7d42b2ebf4d5c0b"

