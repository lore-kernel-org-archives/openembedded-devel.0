Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 56E4B6B6F7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Feb 2016 15:48:10 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id g62so34528551wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Feb 2016 07:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=bbXP73hy/SD3rKMFOkboMeRj+MtLtig8Kb0C3DANYOg=;
	b=DDwi1o9TQa7KL0MPsyUPhHjSqNM/K8eBO1aiqvx1GvrOsZmlZjLT6kTlHUsCNBWAhX
	OMjNsq65Y1CF9MsV+UDw/yWRzkUDHVDDa7tYssDET+X58r7+cxzcCbbDUjO4m76dLxAZ
	YEiXCfyPJCMmFjZr2p1UOj9Gkg2YiIUgbs86Yl+QLQQMXlqHxrMjmmEU7SoFSNcz3w/X
	r93vUClEsLmyZv9gxVwOS0lpNFUU2KOFToNtMQbYuJOO3dt3vjNkAG18YDLvP1cHurdX
	5+C8J7DiYInixHcq8pEhcwUZSBVE/zMwW1i3+osg9l/4hjFv333dWP0qBPY2xcf8w74B
	0I0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=bbXP73hy/SD3rKMFOkboMeRj+MtLtig8Kb0C3DANYOg=;
	b=cm/agRgubzfy5dqHtCGm0kh43FR66FDnoyn32uG4dHbs9gAFNk7SGfWODTrXOCDfEp
	DfQBCRQE35CAc9x4gyN53OIbHjtCeUGtiXKjV36eVaaoCqpLmxkxlD369Ghh6Eegr+5M
	sz5j3FeurgAjNdMTxPxX6isxFxGOCF8Kbfct7GsgjZxjjxfFHDXfTTlsEqi9/1BxtfAq
	jQtCn+UF/bYTsbf9ZWHYUvjMpSEz9Hx/7FFZNVUnewj5e7+o0GwigltSZezRUEJkeWBd
	j30FoJNvKRURXvB0QfeIEjAWgMwmNUkAyAn/i/DTNkUpY3PMRFKLsoOoSwsnQwBJFE6f
	OuMw==
X-Gm-Message-State: AG10YOQiQUg6NKuHzxQeUd+/4QQYkcuhLXP0yjM90swNdTQzQelcmSNpl4/ptso3E7cv8A==
X-Received: by 10.194.189.7 with SMTP id ge7mr8210558wjc.72.1455810490445;
	Thu, 18 Feb 2016 07:48:10 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id 8sm3555418wmk.13.2016.02.18.07.48.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Feb 2016 07:48:09 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Feb 2016 16:48:29 +0100
Message-Id: <1455810509-11987-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.1
Subject: [PATCH][meta-qt5] qttransltations: Add PACKAGE for qtwebengine and qtquickcontrols2
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
X-List-Received-Date: Thu, 18 Feb 2016 15:48:10 -0000

* fixes QA warning:
WARNING: qttranslations-5.5.99+5.6.0-rc+gitAUTOINC+ce85e4ee4e-r0 do_package: QA Issue: qttranslations: Files/directories were installed but not shipped in any
 package:
  /usr/share/qt5/translations/qtquickcontrols2_uk.qm
  /usr/share/qt5/translations/qtwebengine_de.qm
  /usr/share/qt5/translations/qtwebengine_ru.qm
  /usr/share/qt5/translations/qtwebengine_uk.qm
  /usr/share/qt5/translations/qtwebengine_en.qm
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
qttranslations: 5 installed and not shipped files. [installed-vs-shipped]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qttranslations_git.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/recipes-qt/qt5/qttranslations_git.bb b/recipes-qt/qt5/qttranslations_git.bb
index 5d3818e..7908a3e 100644
--- a/recipes-qt/qt5/qttranslations_git.bb
+++ b/recipes-qt/qt5/qttranslations_git.bb
@@ -21,7 +21,9 @@ PACKAGES =. " \
     ${PN}-qtlocation \
     ${PN}-qtdeclarative \
     ${PN}-qtquickcontrols \
+    ${PN}-qtquickcontrols2 \
     ${PN}-qtwebsockets \
+    ${PN}-qtwebengine \
     ${PN}-qtxmlpatterns \
     ${PN}-qtconfig \
     ${PN}-qtquick1 \
@@ -68,10 +70,18 @@ FILES_${PN}-qtquickcontrols = " \
     ${OE_QMAKE_PATH_TRANSLATIONS}/qtquickcontrols_*.qm \
 "
 
+FILES_${PN}-qtquickcontrols2 = " \
+    ${OE_QMAKE_PATH_TRANSLATIONS}/qtquickcontrols2_*.qm \
+"
+
 FILES_${PN}-qtwebsockets = " \
     ${OE_QMAKE_PATH_TRANSLATIONS}/qtwebsockets_*.qm \
 "
 
+FILES_${PN}-qtwebengine = " \
+    ${OE_QMAKE_PATH_TRANSLATIONS}/qtwebengine_*.qm \
+"
+
 FILES_${PN}-qtxmlpatterns = " \
     ${OE_QMAKE_PATH_TRANSLATIONS}/qtxmlpatterns_*.qm \
 "
-- 
2.7.1


