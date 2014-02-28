Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lb0-f171.google.com (mail-lb0-f171.google.com
	[209.85.217.171])
	by mail.openembedded.org (Postfix) with ESMTP id D84A26F306
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Feb 2014 13:34:59 +0000 (UTC)
Received: by mail-lb0-f171.google.com with SMTP id w7so2696828lbi.16
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Feb 2014 05:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id;
	bh=97KWg22utHzYO8Af9WgaPV6Nbf1xRocOaDySnYplp34=;
	b=hYoj7lb6B6+1CJSZhXWuWCPyJ5LY2xkLY8GGgyG5MihzxEPidNck8Ey9BWZlxCDTXG
	aeCEC09VIIcgVu5V3wCMHi5YAUko+XIWN8DxgLdGuZ3xzh+jv2iGG41BWPpX9TRHc1W1
	beDvgq6D5Y7cCsebWJmlbCcH7M15/FhUZhY3v5lWqGRZIAxGLFEjhmVXzWZljWSk+9AT
	yZYexJQrxvh5AnQVbGJYWCYk8YaGTggnjFb82RlceSGrZF4oxZSbRV4v+NIpanYmPfFe
	HEge5JbmpueopnjXzwLvB82O6gGYHWY/MVydf5S4GHBeQZ7nJ4LWwDiWdaQnLJTs/DLS
	+0jg==
X-Received: by 10.112.181.232 with SMTP id dz8mr6453192lbc.46.1393594499525;
	Fri, 28 Feb 2014 05:34:59 -0800 (PST)
Received: from localhost.gambro.com ([193.15.174.198])
	by mx.google.com with ESMTPSA id k1sm3949494lbc.5.2014.02.28.05.34.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Feb 2014 05:34:59 -0800 (PST)
Sender: Jacob Kroon <jacob.kroon@gmail.com>
From: Jacob Kroon <jacob.kroon@mikrodidakt.se>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 28 Feb 2014 14:34:48 +0100
Message-Id: <1393594488-10792-1-git-send-email-jacob.kroon@mikrodidakt.se>
X-Mailer: git-send-email 1.8.5.3
Subject: [meta-qt5][PATCH v3] nativesdk-qtbase-tools: disable Debian-style package renaming
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
X-List-Received-Date: Fri, 28 Feb 2014 13:35:00 -0000

Since commit 8da5017712a7ddcb8488e095b9aa03b0273f23e9, libQt5*.so files
are included in the nativesdk-qtbase-tools package. However, this together
with the fact that the binaries are placed in a subdir "qt5" of bin will
confuse the Debian-style package renaming logic in debian.bbclass, causing the
resulting ipk package to be created as "nativesdk-libqt5core5".

Signed-off-by: Jacob Kroon <jacob.kroon@mikrodidakt.se>
Acked-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes-qt/qt5/nativesdk-qtbase.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/recipes-qt/qt5/nativesdk-qtbase.inc b/recipes-qt/qt5/nativesdk-qtbase.inc
index 3cb9b0e..884b1a6 100644
--- a/recipes-qt/qt5/nativesdk-qtbase.inc
+++ b/recipes-qt/qt5/nativesdk-qtbase.inc
@@ -60,6 +60,12 @@ FILES_${PN}-tools = " \
     ${OE_QMAKE_PATH_BINS}/* \
 "
 
+# qttools binaries are placed in a subdir of bin in order to avoid
+# collisions with qt4. This would trigger debian.bbclass to rename the
+# package, since it doesn't detect binaries in subdirs. Explicitly
+# disable package auto-renaming for the tools-package.
+DEBIAN_NOAUTONAME_${PN}-tools = "1"
+
 QT_CONFIG_FLAGS += " \
     -reduce-relocations \
     -shared \
-- 
1.8.5.3


