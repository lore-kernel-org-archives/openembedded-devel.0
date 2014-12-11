Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 91F0A60673
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Dec 2014 12:23:35 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id l15so14393155wiw.14
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Dec 2014 04:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=sBzv4NWwhZRiU90M4MNuBgaqfO0hVRzUptHe0oGlWYQ=;
	b=ekqMDmLrHv399pNdpd92DovXR0cRSdfNesDgYAJ7q/2OsM4BM++e/jtGcwP0rpzY+L
	QTWB4ka193PdETRNDTSqiV7a8AoA3kjMx0TX3R1v7+Mmuq47LFwGeOfr1gdjq6Y74T3m
	umBnR/7mmrfavK/GZQgB1vEFDCrb6TuG3N2dEapQf8tdr9JrJEUrm07rde0Ysfauciu7
	RXgXmJew2NXiQZWc5tAgU/4tz/Z5jbNBkK9Dcxh948YuiP6FRhHQa4M02wf+oeJvy15Z
	9rRIBId6Wu0xOaEpmBo5lMA7ArnvQOoyu47A5b0lbwcYcfZToagfSVZI92BpojTxUT5p
	kD6g==
X-Received: by 10.194.249.232 with SMTP id yx8mr16706400wjc.1.1418300615319;
	Thu, 11 Dec 2014 04:23:35 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	p14sm2146988wie.1.2014.12.11.04.23.34 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Dec 2014 04:23:34 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 11 Dec 2014 13:23:32 +0100
Message-Id: <1418300612-1383-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.1.3
In-Reply-To: <1418300612-1383-1-git-send-email-Martin.Jansa@gmail.com>
References: <1418300612-1383-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-qt5][PATCH 3/3] qtwebengine: Include resources in main package and add rdep on qmlplugins
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
X-List-Received-Date: Thu, 11 Dec 2014 12:23:39 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qtwebengine.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/recipes-qt/qt5/qtwebengine.inc b/recipes-qt/qt5/qtwebengine.inc
index 525e657..51beac3 100644
--- a/recipes-qt/qt5/qtwebengine.inc
+++ b/recipes-qt/qt5/qtwebengine.inc
@@ -55,3 +55,7 @@ do_install_append() {
     rmdir ${D}${OE_QMAKE_PATH_PLUGINS}/${BPN} ${D}${OE_QMAKE_PATH_PLUGINS} || true
 }
 PACKAGE_DEBUG_SPLIT_STYLE = "debug-without-src"
+
+# for /usr/share/qt5/qtwebengine_resources.pak
+FILES_${PN} += "${OE_QMAKE_PATH_QT_TRANSLATIONS} ${OE_QMAKE_PATH_QT_DATA}"
+RDEPENDS_${PN}-examples += "${PN}-qmlplugins"
-- 
2.1.3


