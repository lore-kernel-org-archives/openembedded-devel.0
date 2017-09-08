Return-Path: <mcrowe@brightsign.biz>
X-Greylist: delayed 900 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 08 Sep 2017 14:03:34 UTC
Received: from relay.appriver.com (relay101a.appriver.com [207.97.230.14])
	by mail.openembedded.org (Postfix) with ESMTP id 563BD71B13
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Sep 2017 14:03:34 +0000 (UTC)
X-Note: This Email was scanned by AppRiver SecureTide
X-Note-AR-ScanTimeLocal: 09/08/2017 9:48:35 AM
X-Note: SecureTide Build: 7/20/2017 1:24:22 PM UTC (2.6.20.0)
X-Note: Filtered by 10.238.11.161
X-Policy: brightsign.biz  - brightsign.biz
X-Policy: brightsign.biz  - brightsign.biz
X-Primary: mcrowe@brightsign.biz
X-Virus-Scan: V-
X-Note: ICH-CT/SI:0-1028/SG:1 9/8/2017 9:48:20 AM
X-Note-SnifferID: 0
X-Note: TCH-CT/SI:0-33/SG:1 9/8/2017 9:48:20 AM
X-GBUdb-Analysis: 0, 213.210.30.29, Ugly c=0.476605 p=-0.882353 Source Normal
X-Signature-Violations: 0-0-0-3812-c
X-Note: Spam Tests Failed: 
X-Country-Path: ->->United Kingdom->United States
X-Note-Sending-IP: 213.210.30.29
X-Note-Reverse-DNS: elite.brightsigndigital.co.uk
X-Note-Return-Path: mcrowe@brightsign.biz
X-Note: User Rule Hits: 
X-Note: Global Rule Hits: G284 G285 G286 G287 G291 G292 G421 
X-Note: Encrypt Rule Hits: 
X-Note: Mail Class: VALID
X-Note: Headers Injected
Received: from [213.210.30.29] (HELO elite.brightsign)
	by relay.appriver.com (CommuniGate Pro SMTP 6.1.7)
	with ESMTPS id 193400004; Fri, 08 Sep 2017 09:48:35 -0400
Received: from chuckie.brightsign ([fd44:d8b8:cab5:cb01::19] helo=chuckie)
	by elite.brightsign with esmtp (Exim 4.89)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1dqJe6-0004Bz-N3; Fri, 08 Sep 2017 14:48:34 +0100
Received: from mac by chuckie with local (Exim 4.89)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1dqJe6-0003XV-M7; Fri, 08 Sep 2017 14:48:34 +0100
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Sep 2017 14:48:02 +0100
Message-Id: <20170908134802.13519-1-mac@mcrowe.com>
X-Mailer: git-send-email 2.11.0
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [meta-qt5][PATCH] qtbase-native: Force use of built-in pcre
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
X-List-Received-Date: Fri, 08 Sep 2017 14:03:35 -0000

If we specify neither -system-pcre nor -qt-pcre then qtbase will first see
if it can find the pcre library in the system and fall back to compiling
its own if that's not possible.

Unfortunately, this means that if qtbase-native happens to be built on a
machine with system pcre available then the resulting binaries such as
bin/qt5/uic in sstate files won't work correctly on machines that don't
have pcre available. Even ignoring that, it doesn't help for packages to
build differently depending on how the build system is configured.

We could depend on pcre-native and pass -system-pcre, but this doesn't work
by default because qtbase actually requires pcre16 which is an optional
(via PACKAGECONFIG) feature of pcre so the default there would need to be
changed too.

So, let's make qtbase-native match the default of qtbase by passing
-qt-pcre in order to ensure that qtbase-native is always built with its
own pcre implementation.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 recipes-qt/qt5/qtbase-native_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
index 54a0b78..0951ede 100644
--- a/recipes-qt/qt5/qtbase-native_git.bb
+++ b/recipes-qt/qt5/qtbase-native_git.bb
@@ -46,6 +46,7 @@ PACKAGECONFIG_CONFARGS = " \
     -sysroot ${STAGING_DIR_NATIVE} \
     -no-gcc-sysroot \
     -system-zlib \
+    -qt-pcre \
     -no-libjpeg \
     -no-libpng \
     -no-gif \
-- 
2.11.0


