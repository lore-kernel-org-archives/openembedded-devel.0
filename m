Return-Path: <ting.liu@freescale.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0115.outbound.protection.outlook.com [207.46.100.115])
	by mail.openembedded.org (Postfix) with ESMTP id 94EA972C9C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Jan 2015 08:38:54 +0000 (UTC)
Received: from DM2PR03CA0052.namprd03.prod.outlook.com (10.141.96.51) by
	BN1PR0301MB0705.namprd03.prod.outlook.com (25.160.78.12) with Microsoft
	SMTP Server (TLS) id 15.1.59.20; Wed, 21 Jan 2015 08:23:21 +0000
Received: from BN1BFFO11FD050.protection.gbl (2a01:111:f400:7c10::1:107) by
	DM2PR03CA0052.outlook.office365.com (2a01:111:e400:2428::51) with
	Microsoft
	SMTP Server (TLS) id 15.1.59.20 via Frontend Transport; Wed, 21 Jan 2015
	08:23:21 +0000
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1BFFO11FD050.mail.protection.outlook.com (10.58.145.5) with Microsoft
	SMTP Server (TLS) id 15.1.59.14 via Frontend Transport;
	Wed, 21 Jan 2015 08:23:19 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	t0L8NEes017727; Wed, 21 Jan 2015 01:23:17 -0700
From: <b28495@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 21 Jan 2015 16:23:03 +0800
Message-ID: <1421828586-19021-2-git-send-email-b28495@freescale.com>
X-Mailer: git-send-email 1.9.2
In-Reply-To: <1421828586-19021-1-git-send-email-b28495@freescale.com>
References: <1421828586-19021-1-git-send-email-b28495@freescale.com>
X-EOPAttributedMessage: 0
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=ting.liu@freescale.com; 
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(339900001)(189002)(199003)(47776003)(104016003)(87936001)(46102003)(105606002)(64706001)(97736003)(33646002)(77096005)(68736005)(19580395003)(85426001)(19580405001)(6806004)(575784001)(48376002)(92566002)(50226001)(50986999)(50466002)(76176999)(62966003)(110136001)(2351001)(86152002)(450100001)(36756003)(77156002)(229853001)(106466001)(2950100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN1PR0301MB0705;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:sfv;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-DmarcAction-Test: None
X-Microsoft-Antispam: UriScan:;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(3005004);SRVR:BN1PR0301MB0705;
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:(601004);
	SRVR:BN1PR0301MB0705; 
X-Forefront-PRVS: 04631F8F77
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:;
	SRVR:BN1PR0301MB0705; 
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2015 08:23:19.9800 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN1PR0301MB0705
Subject: [meta-java][PATCH 1/4] openjdk-6: Remove currency data generation expiration date
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
X-List-Received-Date: Wed, 21 Jan 2015 08:38:55 -0000
Content-Type: text/plain

From: Ting Liu <ting.liu@freescale.com>

As the openjdk source was extracted during 'make patch-ecj' in
do_configure, apply the patch via do_configure_append.

icedtea6-1.13.4/Makefile.am:1200:stamps/extract-openjdk.stamp: stamps/download.stamp
| if OPENJDK_SRC_DIR_FOUND
|         if ! test -d openjdk ; then \
|           cp -pPR $(OPENJDK_SRC_DIR_LINK) $(OPENJDK_SRC_DIR) openjdk ; \
|         fi
| else
| if USE_HG
|         if ! test -d openjdk ; then \
|           cp -pPRl openjdk.hg openjdk ; \
|         fi
| else
|         set -e ; \
|         if ! test -d openjdk ; \
|         then \
|           mkdir openjdk ; \
|           $(TAR) xf $(OPENJDK_SRC_ZIP) -C openjdk; \
|           chmod -R ug+w openjdk ; \
|           sh $(abs_top_srcdir)/fsg.sh ; \
|         fi
| endif
| endif

Signed-off-by: Ting Liu <ting.liu@freescale.com>
---
 ...njdk-remove-currency-data-generation-expi.patch | 25 ++++++++++++++++++++++
 recipes-core/openjdk/openjdk-6-release-6b32.inc    |  8 +++++++
 2 files changed, 33 insertions(+)
 create mode 100644 recipes-core/openjdk/openjdk-6-6b32/icedtea-openjdk-remove-currency-data-generation-expi.patch

diff --git a/recipes-core/openjdk/openjdk-6-6b32/icedtea-openjdk-remove-currency-data-generation-expi.patch b/recipes-core/openjdk/openjdk-6-6b32/icedtea-openjdk-remove-currency-data-generation-expi.patch
new file mode 100644
index 0000000..6dd36af
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-6-6b32/icedtea-openjdk-remove-currency-data-generation-expi.patch
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
diff --git a/recipes-core/openjdk/openjdk-6-release-6b32.inc b/recipes-core/openjdk/openjdk-6-release-6b32.inc
index fb7fb35..bf5e675 100644
--- a/recipes-core/openjdk/openjdk-6-release-6b32.inc
+++ b/recipes-core/openjdk/openjdk-6-release-6b32.inc
@@ -4,12 +4,20 @@ DEPENDS += "krb5"
 
 FILESPATH =. "${FILE_DIRNAME}/openjdk-6-6b32:"
 
+ICEDTEAPATCHES += "file://icedtea-openjdk-remove-currency-data-generation-expi.patch;apply=no"
+
 EXTRA_OECONF += "--disable-downloading \
                  --enable-system-zlib \
                  --enable-system-jpeg \
                  --enable-system-png \
                  --enable-system-gif \
                 "
+do_configure_append () {
+    patch -p0 <${WORKDIR}/icedtea-openjdk-remove-currency-data-generation-expi.patch
+    cd openjdk-ecj
+    patch -p1 <${WORKDIR}/icedtea-openjdk-remove-currency-data-generation-expi.patch
+    cd ..
+}
 
 OPENJDK_VERSION = "b32"
 OPENJDK_DATE = "15_jul_2014"
-- 
1.9.1


