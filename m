Return-Path: <jacob.kroon@gmail.com>
Received: from mail-la0-f47.google.com (mail-la0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id 02F1C6D899
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Feb 2014 09:34:03 +0000 (UTC)
Received: by mail-la0-f47.google.com with SMTP id y1so2489619lam.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Feb 2014 01:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id;
	bh=UGEprCwRSIVMELZfjTaznjYxyVeszQO89jkEbGXAIaQ=;
	b=Uwh6O/m2Ou/anRCiCh67G4Uv97OrHlXF0zWwRTb4DjQ0twwNgEQSuKJBUF/BAOYzPS
	1g/tXvAUmKp+cJPiWpP99KOxgiMoDtpGK+jqOUBek79OLedZ5QD0ylLEtKIQgA6kOVXt
	nKOcSnHkYBwYvoiw/7fFeChRO4X8hBwWtZFdormLlE0YjxfBAKhqmXFRjfNDCoVDGUDt
	J75e6yqz9Xm95KviOrIBshY0nTzQ6WhYyJ/KQW3NlEfINJc3JmWJXVEIK5qCtG0DmQmz
	Vz1+AIqiEppqh9ypPyiL2rqDzQ4BN2keLrYi/87LwlS7IpVewY7/XPlzPnPHyitbGddc
	rwGg==
X-Received: by 10.152.202.7 with SMTP id ke7mr1759857lac.30.1393580043388;
	Fri, 28 Feb 2014 01:34:03 -0800 (PST)
Received: from localhost.gambro.com ([193.15.174.198])
	by mx.google.com with ESMTPSA id mo3sm3128598lbb.17.2014.02.28.01.34.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Feb 2014 01:34:02 -0800 (PST)
Sender: Jacob Kroon <jacob.kroon@gmail.com>
From: Jacob Kroon <jacob.kroon@mikrodidakt.se>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 28 Feb 2014 10:33:52 +0100
Message-Id: <1393580032-3910-1-git-send-email-jacob.kroon@mikrodidakt.se>
X-Mailer: git-send-email 1.8.5.3
Subject: [meta-qt5][PATCH v2] Explicitly disable Debian-style package renaming for nativesdk-qtbase-tools
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
X-List-Received-Date: Fri, 28 Feb 2014 09:34:04 -0000

Since commit 8da5017712a7ddcb8488e095b9aa03b0273f23e9, libQt5*.so files
are included in the nativesdk-qtbase-tools package. However, this together
with the fact that the binaries are placed in a subdir "qt5" of bin will
confuse the Debian-style package renaming logic in debian.bbclass, causing the
resulting ipk package to be created as "nativesdk-libqt5core5".

Signed-off-by: Jacob Kroon <jacob.kroon@mikrodidakt.se>
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


