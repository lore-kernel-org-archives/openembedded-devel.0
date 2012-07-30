Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Svost-0001af-DF
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Jul 2012 14:15:43 +0200
Received: by wibhq4 with SMTP id hq4so1528780wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jul 2012 05:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=vqhMT/WJcnwVRJnGmcbMbQt82CLN0w1LW7eNLxP2r7E=;
	b=IEqO8hRh+p7LCips/6okKu8qILwPaWdIq/GwLnwRhKwmWEFt7AZiA30RHgqnagcP+m
	yBiHxChb7HGZFCigv0a31zksFVJPGsxgMJohzWwPgBBH8Eexdr3UjzAb7FVDXy+/Ug1q
	MgHBFQ77380k21vgK7TrYty6TMNUQTekietQONfVrc5OsJbnid0FYoXeAcnt3oWCP2ez
	i1cMo/JfoU1hCQ4EnCk1ZsoP120Zwrtcj26nC1Ju31pBHavqpIV1Ks4dYZryf4dF+avY
	05aCMAdkX0a+ef1KsIGUwz5mlAQOt3yTX1UVu1UiY+0KP+CA4LHJYqJKoWwv57MU9m+G
	IP0Q==
Received: by 10.216.138.220 with SMTP id a70mr5641867wej.170.1343649843859;
	Mon, 30 Jul 2012 05:04:03 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id l5sm23784092wix.5.2012.07.30.05.04.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Jul 2012 05:04:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Jul 2012 14:03:53 +0200
Message-Id: <1343649833-23316-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [meta-browser][PATCH] Revert "chromium: use COMPATIBLE_HOST instead of COMPATIBLE_MACHINE"
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Jul 2012 12:15:45 -0000

* COMPATIBLE_HOST is not good enough for some configurations:
  ERROR: chromium was skipped: incompatible with host arm-oe-linux-gnueabi (not in COMPATIBLE_HOST)

This reverts commit 7fb308d4f8d68d19a91daab8d33418cea8dea57b.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-browser/chromium/chromium_19.0.1049.3.bb |    6 ++++--
 recipes-browser/chromium/chromium_20.0.1086.0.bb |    4 +++-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/recipes-browser/chromium/chromium_19.0.1049.3.bb b/recipes-browser/chromium/chromium_19.0.1049.3.bb
index 97843a3..e657c48 100644
--- a/recipes-browser/chromium/chromium_19.0.1049.3.bb
+++ b/recipes-browser/chromium/chromium_19.0.1049.3.bb
@@ -10,8 +10,10 @@ SRC_URI = "http://commondatastorage.googleapis.com/chromium-browser-official/${P
 	file://softfloat-fix.patch \
 "
 
-# include.gypi exists only for armv6 and armv7a
-COMPATIBLE_HOST = "(armv6|armv7).*-linux"
+# include.gypi exists only for armv6 and armv7a and there isn't something like COMPATIBLE_ARCH afaik
+COMPATIBLE_MACHINE = "(-)"
+COMPATIBLE_MACHINE_armv6 = "(.*)"
+COMPATIBLE_MACHINE_armv7a = "(.*)"
 
 PR = "r1"
 
diff --git a/recipes-browser/chromium/chromium_20.0.1086.0.bb b/recipes-browser/chromium/chromium_20.0.1086.0.bb
index d1ae7e5..527f317 100644
--- a/recipes-browser/chromium/chromium_20.0.1086.0.bb
+++ b/recipes-browser/chromium/chromium_20.0.1086.0.bb
@@ -8,7 +8,9 @@ SRC_URI = "http://commondatastorage.googleapis.com/chromium-browser-official/${P
 "
 
 # include.gypi exists only for armv6 and armv7a and there isn't something like COMPATIBLE_ARCH afaik
-COMPATIBLE_HOST = "(armv6|armv7).*-linux"
+COMPATIBLE_MACHINE = "(-)"
+COMPATIBLE_MACHINE_armv6 = "(.*)"
+COMPATIBLE_MACHINE_armv7a = "(.*)"
 
 DEFAULT_PREFERENCE = "-1"
 
-- 
1.7.8.6



