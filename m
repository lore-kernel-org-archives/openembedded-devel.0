Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 1175371637
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  1 Mar 2015 13:46:53 +0000 (UTC)
Received: by wiwl15 with SMTP id l15so9338405wiw.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 01 Mar 2015 05:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=E4NWJDbCwaE0j+MG4P1UFw2lrFokMpNIxVyqOKkbRO0=;
	b=k++QHdtmiighrjmj4pBjPCx0XsiinmM8Q8Wk3INVV/KBICGW9hEQ1W8H6b1noEW3Mg
	qY9ER/TPQyRg2P2qYc/nhZIiGMiJIy8sW/r8XZpSQ731fH3DMQJO1kvfZvhChKDmkCBi
	LUVMvK5gdPcGCWa+TIYKrRnfJHTe8UK6vsvh8WPvS5FxF4ybXaezSxss4j7iFlneFdWG
	PgOOVPkScG8rJrCklHAH3x5bZrwITF3+GuKd1o+6gXiMuOkJKSwj4SK61VK1qyV+c4lT
	ob6kodLgetKnso10MnAisNCokpAV1bpXe2qKW3Oc3Nn1xh6iQe/Jn+kYpaU94SlAD8NF
	ua+Q==
X-Received: by 10.194.184.83 with SMTP id es19mr47547670wjc.93.1425217614480; 
	Sun, 01 Mar 2015 05:46:54 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	gz3sm11616388wib.1.2015.03.01.05.46.53
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 01 Mar 2015 05:46:53 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  1 Mar 2015 14:47:10 +0100
Message-Id: <1425217630-10390-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.1
Subject: [meta-qt5][PATCH] qtbase: fix security issue in processing BMP files
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
X-List-Received-Date: Sun, 01 Mar 2015 13:46:54 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...ion-by-zero-when-processing-malformed-BMP.patch | 47 ++++++++++++++++++++++
 recipes-qt/qt5/qtbase_5.4.1.bb                     |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 recipes-qt/qt5/qtbase/0014-Fix-a-division-by-zero-when-processing-malformed-BMP.patch

diff --git a/recipes-qt/qt5/qtbase/0014-Fix-a-division-by-zero-when-processing-malformed-BMP.patch b/recipes-qt/qt5/qtbase/0014-Fix-a-division-by-zero-when-processing-malformed-BMP.patch
new file mode 100644
index 0000000..42159ef
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0014-Fix-a-division-by-zero-when-processing-malformed-BMP.patch
@@ -0,0 +1,47 @@
+From a343de8e9b85b98f18446d045afbf6f1d3f6c5b4 Mon Sep 17 00:00:00 2001
+From: "Richard J. Moore" <rich@kde.org>
+Date: Sat, 21 Feb 2015 17:43:21 +0000
+Subject: [PATCH 14/14] Fix a division by zero when processing malformed BMP
+ files.
+
+This fixes a division by 0 when processing a maliciously crafted BMP
+file. No impact beyond DoS.
+
+Upstream-Status: Backport from 5.4 branch
+
+Task-number: QTBUG-44547
+Change-Id: Ifcded2c0aa712e90d23e6b3969af0ec3add53973
+Reviewed-by: Thiago Macieira <thiago.macieira@intel.com>
+Reviewed-by: Oswald Buddenhagen <oswald.buddenhagen@theqtcompany.com>
+---
+ src/gui/image/qbmphandler.cpp | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/src/gui/image/qbmphandler.cpp b/src/gui/image/qbmphandler.cpp
+index 21c1a2f..df66499 100644
+--- a/src/gui/image/qbmphandler.cpp
++++ b/src/gui/image/qbmphandler.cpp
+@@ -314,12 +314,20 @@ static bool read_dib_body(QDataStream &s, const BMP_INFOHDR &bi, int offset, int
+         }
+     } else if (comp == BMP_BITFIELDS && (nbits == 16 || nbits == 32)) {
+         red_shift = calc_shift(red_mask);
++        if (((red_mask >> red_shift) + 1) == 0)
++            return false;
+         red_scale = 256 / ((red_mask >> red_shift) + 1);
+         green_shift = calc_shift(green_mask);
++        if (((green_mask >> green_shift) + 1) == 0)
++            return false;
+         green_scale = 256 / ((green_mask >> green_shift) + 1);
+         blue_shift = calc_shift(blue_mask);
++        if (((blue_mask >> blue_shift) + 1) == 0)
++            return false;
+         blue_scale = 256 / ((blue_mask >> blue_shift) + 1);
+         alpha_shift = calc_shift(alpha_mask);
++        if (((alpha_mask >> alpha_shift) + 1) == 0)
++            return false;
+         alpha_scale = 256 / ((alpha_mask >> alpha_shift) + 1);
+     } else if (comp == BMP_RGB && (nbits == 24 || nbits == 32)) {
+         blue_mask = 0x000000ff;
+-- 
+2.3.1
+
diff --git a/recipes-qt/qt5/qtbase_5.4.1.bb b/recipes-qt/qt5/qtbase_5.4.1.bb
index fed9df4..0ff611f 100644
--- a/recipes-qt/qt5/qtbase_5.4.1.bb
+++ b/recipes-qt/qt5/qtbase_5.4.1.bb
@@ -4,6 +4,7 @@ require ${PN}.inc
 # This patch is in 5.4 branch but didn't make it into 5.4.1 release
 SRC_URI += "\
     file://0013-Fix-build-of-egl-integration.patch \
+    file://0014-Fix-a-division-by-zero-when-processing-malformed-BMP.patch \
 "
 
 SRC_URI[md5sum] = "9507825e558c980fed602de1f16ec7ae"
-- 
2.3.1


