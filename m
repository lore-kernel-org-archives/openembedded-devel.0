Return-Path: <hugo.saldanha@aker.com.br>
Received: from asmg.aker.com.br (asmg.aker.com.br [177.159.144.67])
	by mail.openembedded.org (Postfix) with SMTP id 07BBF735B4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Feb 2015 16:03:53 +0000 (UTC)
Received: from mail.aker.com.br (bat.bsb.aker.com.br [10.0.0.20])
	by asmg.aker.com.br [10.0.1.3]; Tue, 24 Feb 2015 13:03:39 -0300
	(envelope-from hugo.saldanha@aker.com.br)
Received: from saldanha.aker.com.br (10.4.3.1) by mail.aker.com.br (10.0.0.20)
	with Microsoft SMTP Server (TLS) id 8.3.342.0;
	Tue, 24 Feb 2015 13:03:50 -0300
From: Hugo Vasconcelos Saldanha <hugo.saldanha@aker.com.br>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 24 Feb 2015 13:05:39 -0300
Message-ID: <1424793939-31190-4-git-send-email-hugo.saldanha@aker.com.br>
X-Mailer: git-send-email 2.3.0
In-Reply-To: <1424793939-31190-1-git-send-email-hugo.saldanha@aker.com.br>
References: <1424793939-31190-1-git-send-email-hugo.saldanha@aker.com.br>
MIME-Version: 1.0
X-AkerSMTPGW-ServerID: 5de71414d6a5ac0be1dec76f647836bb21381a41
X-AkerSMTPGW-MessageID: 08071eccea7194ed16c1a6b157f3bee7a8530253-10o
Subject: [meta-java][PATCH 3/3] icedtea7-native: remove currency data generation expiration date
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
X-List-Received-Date: Tue, 24 Feb 2015 16:03:56 -0000
Content-Type: text/plain

Removes a currency date expiration check whis causes a build
failure.

Signed-off-by: Hugo Vasconcelos Saldanha <hugo.saldanha@aker.com.br>
---
 ...njdk-remove-currency-data-generation-expi.patch | 25 ++++++++++++++++++++++
 recipes-core/icedtea/openjdk-7-release-03b147.inc  |  2 ++
 2 files changed, 27 insertions(+)
 create mode 100644 recipes-core/icedtea/openjdk-7-03b147/icedtea-openjdk-remove-currency-data-generation-expi.patch

diff --git a/recipes-core/icedtea/openjdk-7-03b147/icedtea-openjdk-remove-currency-data-generation-expi.patch b/recipes-core/icedtea/openjdk-7-03b147/icedtea-openjdk-remove-currency-data-generation-expi.patch
new file mode 100644
index 0000000..6dd36af
--- /dev/null
+++ b/recipes-core/icedtea/openjdk-7-03b147/icedtea-openjdk-remove-currency-data-generation-expi.patch
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
diff --git a/recipes-core/icedtea/openjdk-7-release-03b147.inc b/recipes-core/icedtea/openjdk-7-release-03b147.inc
index 1f3533c..47813cd 100644
--- a/recipes-core/icedtea/openjdk-7-release-03b147.inc
+++ b/recipes-core/icedtea/openjdk-7-release-03b147.inc
@@ -80,6 +80,7 @@ OPENJDK_PATCHES = " \
         file://icedtea-hotspot-make-arch-sane-for-x86.patch;apply=no \
         file://icedtea-jdk-sane-x86-arch.patch;apply=no \
 	file://icedtea-flags.patch;apply=no \
+	file://icedtea-openjdk-remove-currency-data-generation-expi.patch;apply=no \
         "
 
 export DISTRIBUTION_PATCHES = " \
@@ -89,4 +90,5 @@ export DISTRIBUTION_PATCHES = " \
         patches/icedtea-hotspot-make-arch-sane-for-x86.patch \
         patches/icedtea-jdk-sane-x86-arch.patch \
 	patches/icedtea-flags.patch \
+	patches/icedtea-openjdk-remove-currency-data-generation-expi.patch \
         "
-- 
2.3.0



