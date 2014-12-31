Return-Path: <Alex.Gonzalez@digi.com>
Received: from mail1.bemta7.messagelabs.com (mail1.bemta7.messagelabs.com
	[216.82.254.109])
	by mail.openembedded.org (Postfix) with ESMTP id AA09A60167
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Dec 2014 15:25:06 +0000 (UTC)
Received: from [216.82.254.195] by server-13.bemta-7.messagelabs.com id
	F2/0A-02788-25514A45; Wed, 31 Dec 2014 15:25:06 +0000
X-Env-Sender: Alex.Gonzalez@digi.com
X-Msg-Ref: server-5.tower-200.messagelabs.com!1420039506!8843069!1
X-Originating-IP: [66.77.174.14]
X-StarScan-Received: 
X-StarScan-Version: 6.12.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26213 invoked from network); 31 Dec 2014 15:25:06 -0000
Received: from mail.mx2.digi.com (HELO mcl-sms-ns2.DIGI.COM) (66.77.174.14)
	by server-5.tower-200.messagelabs.com with RC4-SHA encrypted SMTP;
	31 Dec 2014 15:25:06 -0000
Received: from MCL-VMS-XCH01.digi.com (10.5.8.49) by mail.mx2.digi.com
	(172.16.1.14) with Microsoft SMTP Server (TLS) id 8.3.389.2;
	Wed, 31 Dec 2014 09:24:55 -0600
Received: from DOR-SMS-XCH01.digi.com (10.49.8.99) by MCL-VMS-XCH01.digi.com
	(10.5.8.49) with Microsoft SMTP Server (TLS) id 14.3.210.2;
	Wed, 31 Dec 2014 09:25:05 -0600
Received: from log-linux-hp-agonzal.digi.com (10.101.2.169) by
	dor-sms-xch01.digi.com (10.49.8.99) with Microsoft SMTP Server (TLS) id
	14.3.210.2; Wed, 31 Dec 2014 16:25:03 +0100
From: Alex Gonzalez <alex.gonzalez@digi.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 31 Dec 2014 16:24:46 +0100
Message-ID: <1420039486-18734-3-git-send-email-alex.gonzalez@digi.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1420039486-18734-1-git-send-email-alex.gonzalez@digi.com>
References: <1420039486-18734-1-git-send-email-alex.gonzalez@digi.com>
MIME-Version: 1.0
X-Originating-IP: [10.101.2.169]
X-KSE-AntiSpam-Interceptor-Info: protection disabled
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean
Subject: [meta-java][PATCH 2/2] openjdk: Remove currency data generation expiration date.
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

The currency data generation class makes a 10 years expiration date
check.

It might be reasonable to make sure the input data is updated
periodically, but on an embedded system we don't want to have this
type of built in time expirations.

This commit removes the date expiration check.

Signed-off-by: Alex Gonzalez <alex.gonzalez@digi.com>
---
 ...njdk-remove-currency-data-generation-expi.patch | 25 ++++++++++++++++++++++
 recipes-core/openjdk/openjdk-7-release-25b30.inc   |  2 ++
 2 files changed, 27 insertions(+)
 create mode 100644 recipes-core/openjdk/openjdk-7-25b30/icedtea-openjdk-remove-currency-data-generation-expi.patch

diff --git a/recipes-core/openjdk/openjdk-7-25b30/icedtea-openjdk-remove-currency-data-generation-expi.patch b/recipes-core/openjdk/openjdk-7-25b30/icedtea-openjdk-remove-currency-data-generation-expi.patch
new file mode 100644
index 000000000000..6dd36af54df2
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-7-25b30/icedtea-openjdk-remove-currency-data-generation-expi.patch
@@ -0,0 +1,25 @@
+From 7df2fd1014a0c31f518be4f6a0018533f469d584 Mon Sep 17 00:00:00 2001
+From: Alex Gonzalez <alex.gonzalez@digi.com>
+Date: Wed, 31 Dec 2014 16:07:32 +0100
+Subject: [PATCH] icedtea: openjdk: remove currency data generation expiration
+ date
+
+Signed-off-by: Alex Gonzalez <alex.gonzalez@digi.com>
+---
+ .../src/build/tools/generatecurrencydata/GenerateCurrencyData.java     | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git openjdk/jdk/make/tools/src/build/tools/generatecurrencydata/GenerateCurrencyData.java openjdk/jdk/make/tools/src/build/tools/generatecurrencydata/GenerateCurrencyData.java
+index bf335fa22c1d..0e421360fef9 100644
+--- openjdk/jdk/make/tools/src/build/tools/generatecurrencydata/GenerateCurrencyData.java
++++ openjdk/jdk/make/tools/src/build/tools/generatecurrencydata/GenerateCurrencyData.java
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
diff --git a/recipes-core/openjdk/openjdk-7-release-25b30.inc b/recipes-core/openjdk/openjdk-7-release-25b30.inc
index ccb638168b65..3b7d84e76ba2 100644
--- a/recipes-core/openjdk/openjdk-7-release-25b30.inc
+++ b/recipes-core/openjdk/openjdk-7-release-25b30.inc
@@ -80,6 +80,7 @@ ICEDTEAPATCHES = "\
         file://icedtea-zero-hotspotfix.patch;apply=no \
 	file://icedtea-jdk-nio-use-host-cc.patch;apply=no \
         file://icedtea-unset-NIO_PLATFORM_CLASSES_ROOT_DIR.patch;apply=no \
+        file://icedtea-openjdk-remove-currency-data-generation-expi.patch;apply=no \
 	"
 ICEDTEAPATCHES_append_powerpc = " \
 	file://icedtea-jdk-ppc64-jvm-cfg.patch;apply=no \
@@ -110,6 +111,7 @@ DISTRIBUTION_PATCHES = "\
         patches/icedtea-zero-hotspotfix.patch \
 	patches/icedtea-jdk-nio-use-host-cc.patch \
 	patches/icedtea-unset-NIO_PLATFORM_CLASSES_ROOT_DIR.patch \
+	patches/icedtea-openjdk-remove-currency-data-generation-expi.patch \
 	"
 
 DISTRIBUTION_PATCHES_append_libc-uclibc = "\

