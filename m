Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Sqr5i-0007OA-Qa
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Jul 2012 21:36:22 +0200
Received: by wgbdr1 with SMTP id dr1so1901025wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jul 2012 12:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=GMvD0LmETdx99Yimp1cg7P+0o71TWfyE7Sdcg4l1bt8=;
	b=hp2cMGiBVzkVzHWmGMyaA3P0hVl1Z+J9tZ/WGZtdUT2ilJMb+OAFyNX+s7fAqdyfnj
	U1J5serz/yI19tURMeSkE1Ans84SWc++WOEjaWmvahiGlMy3/x9dP3ARLsxeAl1T55uq
	PeOnEeD4DLJfaZg+Aic7G4RSiV3oxZrwnMjqlKU7YOHNHHsl2Ivd4o1agkuc0f+60nzt
	EDueWK1OSyE4/zg7Wlf44oq8OkSKzLk3DuGH+si/q4XrifzOWLxX69fU8hJXAiUKqUNf
	tgUkCyxaB5OpdmvUUOAJG8F4PNWXK8xS7hf1bqoQpNBlrzVQwzj4fMvztCkckUI6QkfK
	QRzw==
Received: by 10.180.97.106 with SMTP id dz10mr20471532wib.21.1342466704374;
	Mon, 16 Jul 2012 12:25:04 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id eu4sm22936911wib.2.2012.07.16.12.25.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 Jul 2012 12:25:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Jul 2012 21:24:58 +0200
Message-Id: <1342466698-9473-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [meta-browser][PATCH] chromium: restrict COMPATIBLE_MACHINE to any armv6 or armv7a MACHINE
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
X-List-Received-Date: Mon, 16 Jul 2012 19:36:22 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-browser/chromium/chromium_19.0.1049.3.bb |    5 +++++
 recipes-browser/chromium/chromium_20.0.1086.0.bb |    5 +++++
 2 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/recipes-browser/chromium/chromium_19.0.1049.3.bb b/recipes-browser/chromium/chromium_19.0.1049.3.bb
index 4c9de8e..e657c48 100644
--- a/recipes-browser/chromium/chromium_19.0.1049.3.bb
+++ b/recipes-browser/chromium/chromium_19.0.1049.3.bb
@@ -10,6 +10,11 @@ SRC_URI = "http://commondatastorage.googleapis.com/chromium-browser-official/${P
 	file://softfloat-fix.patch \
 "
 
+# include.gypi exists only for armv6 and armv7a and there isn't something like COMPATIBLE_ARCH afaik
+COMPATIBLE_MACHINE = "(-)"
+COMPATIBLE_MACHINE_armv6 = "(.*)"
+COMPATIBLE_MACHINE_armv7a = "(.*)"
+
 PR = "r1"
 
 SRC_URI[md5sum] = "0cdd94b2be21180af93f719e9a9a2883"
diff --git a/recipes-browser/chromium/chromium_20.0.1086.0.bb b/recipes-browser/chromium/chromium_20.0.1086.0.bb
index 47f0173..527f317 100644
--- a/recipes-browser/chromium/chromium_20.0.1086.0.bb
+++ b/recipes-browser/chromium/chromium_20.0.1086.0.bb
@@ -7,6 +7,11 @@ SRC_URI = "http://commondatastorage.googleapis.com/chromium-browser-official/${P
 	file://include.gypi \
 "
 
+# include.gypi exists only for armv6 and armv7a and there isn't something like COMPATIBLE_ARCH afaik
+COMPATIBLE_MACHINE = "(-)"
+COMPATIBLE_MACHINE_armv6 = "(.*)"
+COMPATIBLE_MACHINE_armv7a = "(.*)"
+
 DEFAULT_PREFERENCE = "-1"
 
 SRC_URI[md5sum] = "86535af2d00d157b358e8fd6fb6ad38c"
-- 
1.7.8.6



