Return-Path: <ian@boundarydevices.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 4B1E2759B4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Oct 2015 23:06:29 +0000 (UTC)
Received: by pacfv9 with SMTP id fv9so55875332pac.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Oct 2015 16:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=boundarydevices_com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=EUh2Za+vlgakQiDJUblB90c2Hwc4Z7Nd82Fa0FN9ZgA=;
	b=D/U7jruUHBTB51XAIzV+96gkHeE7mGeRh40QTBjfvRrZXfaAgUjsxjGVAC839VPtFF
	p51OG9soxSaAqqAkr0f9LTQbp/JN204uXc2n9tVffdVpAZIQJ+0oz6atBH90CPytyz+8
	zu2nlq+Q8I7jw7aoulk16eyrYh95A3xc8i+Yvv558MaGOCQYdN1RNmhKZPJjXq69DVny
	KXxsoxeFlKw1fX8ZrWqEAVsD/7PILR5sU2EQjY946/BbyeqCs6XhE1x2AAi+a1yNXDbg
	1KQBj1yq1HE93qSpU+4r93/3oO0FRQmyV+CU9CHIuwCfEBlcibVQlSfA8KWQ6emxmenU
	iDDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=EUh2Za+vlgakQiDJUblB90c2Hwc4Z7Nd82Fa0FN9ZgA=;
	b=js+kSQCqJLwCuuF1vvkotYsgFzbKiFg7et9pYOix1tpwoJZ4/BMDn2nyH0P/2UPrFi
	/UXwGBiUhlWESb1ZvHnOKN6QZyhSCzrmDpfqHLG9wDbe5FIpYquYp1KWukkpTVFGwU5s
	yprgB1NgsikFCUwLKoze2zh4Fjfc1QbxPih2Q6hnGPwxp9MhQI2+8pGoFWTJaUI25+g2
	MJrcD6XeCIS2tC6u7CbGLm9SXwnYkL+HXpLaedORhSqsPa44bPs88gAr+WLZHgdTJFrZ
	5boxxYEOh6Nd5YozgF9d6IIyuQt/Jdav4HXbwa0Ssr8fPDmo2xwMUtj48cD6f7wbwjDe
	WJcw==
X-Gm-Message-State: ALoCoQkkUIFMSBPrC/3xAnFu0vep0mytljg1lub0d8Y5gp6BJ1bZyTnXISSpsi60ND/nwuJn2dQA
X-Received: by 10.68.65.104 with SMTP id w8mr4900415pbs.48.1446159989614;
	Thu, 29 Oct 2015 16:06:29 -0700 (PDT)
Received: from ian-desktop.attlocal.net
	(104-53-140-179.lightspeed.irvnca.sbcglobal.net. [104.53.140.179])
	by smtp.gmail.com with ESMTPSA id
	bz1sm4285787pab.20.2015.10.29.16.06.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 29 Oct 2015 16:06:28 -0700 (PDT)
From: Ian Coolidge <ian@boundarydevices.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Oct 2015 16:06:33 -0700
Message-Id: <1446159993-15239-1-git-send-email-ian@boundarydevices.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-qt5][jethro][PATCH] qtbase: Fix host user contamination
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
X-List-Received-Date: Thu, 29 Oct 2015 23:06:30 -0000

The copy must not use the host user when copying for packaging.
Error fixed:
,----
| WARNING: QA Issue: qtbase: /qtbase-dev/usr/lib/libqtfreetype.prl is owned by
| uid 1000, which is the same as the user running bitbake. This may be due to
| host contamination [host-user-contaminated]
`----

Signed-off-by: Ian Coolidge <ian@boundarydevices.com>
---
 recipes-qt/qt5/qtbase_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 4cffccf..19de7df 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -231,7 +231,7 @@ do_install_append() {
         cp -a ${S}/lib/fonts/* ${D}/${OE_QMAKE_PATH_QT_FONTS}
         chown -R root:root ${D}/${OE_QMAKE_PATH_QT_FONTS}
     fi
-    cp -a ${B}/lib/libqt* ${D}${libdir}
+    cp -r ${B}/lib/libqt* ${D}${libdir}
     # Remove example.pro file as it is useless
     rm -f ${D}${OE_QMAKE_PATH_EXAMPLES}/examples.pro
 
-- 
1.9.1


