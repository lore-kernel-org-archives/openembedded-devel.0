Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f53.google.com (mail-yh0-f53.google.com
	[209.85.213.53])
	by mail.openembedded.org (Postfix) with ESMTP id 8B85C6EFF8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Feb 2014 13:50:36 +0000 (UTC)
Received: by mail-yh0-f53.google.com with SMTP id v1so4206215yhn.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Feb 2014 05:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=t60F2EkiUIlSi6We6oGqdTn3DSk0JmMLftPNLjXcyQY=;
	b=qScTrFzeMOpv1OHfGY0y5G1vc0Bawj+Ciyr1p5rxMe5boOSvsb9xtqhupPF8g1biNF
	4yPuTYFvtmjmorlZyDv+79Win1UdehO5Blcc/YPtoniB5cHhW7OQaK9+pBES4G9ydg22
	iGSCJWw6mzYwinUf7lE2vct5CuxPNv+4xNjOxlm2f24ykD3aPMSDJ+u3C0f3d22ywsgq
	HTDPg/s/8iZSh8DOFOFvBfWPY1q+FVgeTSZU2X6/iHv3kt2l5lmKUJmqev/H/3V52OPX
	S97CGt62JIQN+IDZZWIhQk17cXko+t22pojglVOI+U3c5mCofjS9pJd/kDNWOjOE8SCx
	3hPw==
X-Received: by 10.236.100.235 with SMTP id z71mr24841657yhf.43.1393163438009; 
	Sun, 23 Feb 2014 05:50:38 -0800 (PST)
Received: from monster.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id p63sm4246689yhl.15.2014.02.23.05.50.36
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sun, 23 Feb 2014 05:50:37 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Feb 2014 10:50:13 -0300
Message-Id: <1393163414-9494-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1393163414-9494-1-git-send-email-otavio@ossystems.com.br>
References: <1393163414-9494-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-qt5][PATCH v2 3/4] mallit-plugins-qt5: Don't set OE_QMAKE_PATH_HEADERS
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
X-List-Received-Date: Sun, 23 Feb 2014 13:50:37 -0000

The qmake class now respects the QT_DIR_NAME setting when setting the
headers path, so this change is not needed anymore.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes-qt/maliit/maliit-plugins-qt5_git.bb |    5 -----
 1 file changed, 5 deletions(-)

diff --git a/recipes-qt/maliit/maliit-plugins-qt5_git.bb b/recipes-qt/maliit/maliit-plugins-qt5_git.bb
index 273b3e4..7dc1a73 100644
--- a/recipes-qt/maliit/maliit-plugins-qt5_git.bb
+++ b/recipes-qt/maliit/maliit-plugins-qt5_git.bb
@@ -6,11 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f29b21caa8e460097bfad9c026a33621"
 
 inherit qmake5
 
-# Set path of qt5 headers as qmake5_base.bbclass sets this to just ${includedir}
-# but
-# actually it is ${includedir}/qt5
-OE_QMAKE_PATH_HEADERS = "${OE_QMAKE_PATH_QT_HEADERS}"
-
 DEPENDS = "maliit-framework-qt5"
 
 RDEPENDS_${PN} += "qtsvg-plugins"
-- 
1.7.10.4


