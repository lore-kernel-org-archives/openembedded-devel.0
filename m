Return-Path: <net147@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 8A5B376BD7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Aug 2015 02:49:26 +0000 (UTC)
Received: by paczk9 with SMTP id zk9so6433627pac.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Aug 2015 19:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=MxBemrHokhi4S3hQMLzoY64DnZZqYVL6Wy4E7ENhebQ=;
	b=NTIt38M198dqrVTzVOtFmpLb6AI8OFUoyTcfSt1WRd+J/pZ08kXz65gGoCkOqDhqow
	EmIn3tzLfPlEdrWyDIFdLSi8GOFRan0rLHUSUPhr3Zk352MN6nU4nBuzQTA7jPvLtYzD
	Wcw0lbKjUpN/U1mtGWcWt0Jw95Z8JXRT/Yai4xRtlaSBy/xk/1V0Qn4/Gy/fAZVnH0Fy
	zGiajFUSg96BXV5NnPXkJUSvfyaJB/GA9SOzH9KCpV+hFxpr0jMwbqlEdW4npd+gVzuA
	f73AyoF2kDyLnGCdbwS0s5r3jZwM3Abwy8bfq96fwdiQBZTMJQmRMiZxlb0WORg+lTwx
	ZX8Q==
X-Received: by 10.66.237.97 with SMTP id vb1mr26444983pac.139.1440902967164;
	Sat, 29 Aug 2015 19:49:27 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	il1sm9642182pbc.65.2015.08.29.19.49.26
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 29 Aug 2015 19:49:26 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 30 Aug 2015 12:49:32 +1000
Message-Id: <1440902972-23255-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.5.0
Subject: [meta-qt5][PATCH] qttranslations: package translations for qtwebsockets
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
X-List-Received-Date: Sun, 30 Aug 2015 02:49:27 -0000

Fixes the following warning:

WARNING: QA Issue: qttranslations: Files/directories were installed but not shipped in any package:
  /usr/share/qt5/translations/qtwebsockets_fr.qm
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install. [installed-vs-shipped]

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 recipes-qt/qt5/qttranslations_git.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/recipes-qt/qt5/qttranslations_git.bb b/recipes-qt/qt5/qttranslations_git.bb
index d5fda1a..cff2a09 100644
--- a/recipes-qt/qt5/qttranslations_git.bb
+++ b/recipes-qt/qt5/qttranslations_git.bb
@@ -20,6 +20,7 @@ PACKAGES =. " \
     ${PN}-qtlocation \
     ${PN}-qtdeclarative \
     ${PN}-qtquickcontrols \
+    ${PN}-qtwebsockets \
     ${PN}-qtxmlpatterns \
     ${PN}-qtconfig \
     ${PN}-qtquick1 \
@@ -65,6 +66,10 @@ FILES_${PN}-qtquickcontrols = " \
     ${OE_QMAKE_PATH_TRANSLATIONS}/qtquickcontrols_*.qm \
 "
 
+FILES_${PN}-qtwebsockets = " \
+    ${OE_QMAKE_PATH_TRANSLATIONS}/qtwebsockets_*.qm \
+"
+
 FILES_${PN}-qtxmlpatterns = " \
     ${OE_QMAKE_PATH_TRANSLATIONS}/qtxmlpatterns_*.qm \
 "
-- 
2.5.0


