Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qa0-f50.google.com (mail-qa0-f50.google.com
	[209.85.216.50])
	by mail.openembedded.org (Postfix) with ESMTP id 49E14723C4
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Feb 2015 21:34:32 +0000 (UTC)
Received: by mail-qa0-f50.google.com with SMTP id k15so18466293qaq.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Feb 2015 13:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=OTLKyKw8wbsD7PaDnFYhZJ08SGE/LOiNyNTzi9+nDas=;
	b=j7xW3r6aQBlKE82NiTZsBtEqNIMUqYQh4JVOIWtYBzXH4L1XBOwOZYUyJNzTVOY5Q9
	vcxmCwsDHQqnXlPZZPUvRMG5wN6JRWQWVTOwvaQ/3HwG6ZlL6NnlT20DcgpGveV+DBZt
	HxDOAo/WBrE6O8et2vdH+vSjFpzBfyNAkUuBidFF71mJKYHlKwSKbD51UE4/1sGnYr3o
	OPmsXbXeu4NPXUtMJzcHera/ffBo8yxSXgOfP6O8oU5IqqvYRdD+vkoKwhQRLm8XwwPR
	XZKs3V45L1JMeeYYxqQ4iOAa4kfNxkbvwCXXZ4G/eTHIn4AxAqzY4am+TR1ZuC0OksWD
	Wh6g==
X-Received: by 10.140.104.234 with SMTP id a97mr32125612qgf.80.1423431273235; 
	Sun, 08 Feb 2015 13:34:33 -0800 (PST)
Received: from centrium.lab.ossystems.com.br ([177.100.225.47])
	by mx.google.com with ESMTPSA id 103sm9794660qgg.11.2015.02.08.13.34.31
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 08 Feb 2015 13:34:32 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Sun,  8 Feb 2015 19:34:33 -0200
Message-Id: <1423431280-890-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-qt5][PATCH 1/8] qtwebengine: Add a missing build dependency on libcap
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
X-List-Received-Date: Sun, 08 Feb 2015 21:34:38 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes-qt/qt5/qtwebengine.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-qt/qt5/qtwebengine.inc b/recipes-qt/qt5/qtwebengine.inc
index 51beac3..f6b1304 100644
--- a/recipes-qt/qt5/qtwebengine.inc
+++ b/recipes-qt/qt5/qtwebengine.inc
@@ -8,6 +8,7 @@ DEPENDS += " \
     ninja-native \
     qtbase qtdeclarative qtxmlpatterns qtquickcontrols \
     libdrm fontconfig pixman openssl pango cairo icu pciutils \
+    libcap \
 "
 
 COMPATIBLE_MACHINE = "(-)"
-- 
2.1.4


