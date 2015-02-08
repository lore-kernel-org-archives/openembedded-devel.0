Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qc0-f172.google.com (mail-qc0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id 6618E723C4
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Feb 2015 21:34:48 +0000 (UTC)
Received: by mail-qc0-f172.google.com with SMTP id x3so19727330qcv.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Feb 2015 13:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=FG973zI8gnWg3ttB3Cjo2BmkYtm5DZY8cSjRbLH8hAY=;
	b=UyTkR+K1TafBlA+9aby/8BcMSiD3UyZa2qo8dTuZhnfzc/E2U4e8gIiBfzuH7QJk3j
	+CKZW1UeiUatXq0f8a7Tf6uM55dxekhDV5guKS8MudbdDmygzFWcO4+VsEYYgrs5BsCy
	sINtw76P2qAsObmfl50MvMk/wD9nOJi9X2Bg/UQUz4h1yBQfgPNLkYxRxn0G0MyIqGAI
	Q4sKELzw9bbESOHbTOqj1irpk97kr/cIoWJhzk1X8+38HYy+AWMqt6nWIVMt+hhAneDU
	XniycPxsza1XjWCxnt1F4L8EboUm65J7nREakxKL/hssMC107YxzbDJQhjw/xNLCErfW
	VD7Q==
X-Received: by 10.224.68.8 with SMTP id t8mr3584059qai.72.1423431289628;
	Sun, 08 Feb 2015 13:34:49 -0800 (PST)
Received: from centrium.lab.ossystems.com.br ([177.100.225.47])
	by mx.google.com with ESMTPSA id 103sm9794660qgg.11.2015.02.08.13.34.47
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 08 Feb 2015 13:34:48 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Sun,  8 Feb 2015 19:34:39 -0200
Message-Id: <1423431280-890-7-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1423431280-890-1-git-send-email-otavio@ossystems.com.br>
References: <1423431280-890-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-qt5][PATCH 7/8] qtwebengine: Add missing runtime dependencies for examples
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
X-List-Received-Date: Sun, 08 Feb 2015 21:34:50 -0000

The qtdeclarative-qmlplugins and qtquickcontrols-qmlplugins are
required for the examples to run. Add them as rdepends.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes-qt/qt5/qtwebengine.inc | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtwebengine.inc b/recipes-qt/qt5/qtwebengine.inc
index f6b1304..46060c0 100644
--- a/recipes-qt/qt5/qtwebengine.inc
+++ b/recipes-qt/qt5/qtwebengine.inc
@@ -59,4 +59,9 @@ PACKAGE_DEBUG_SPLIT_STYLE = "debug-without-src"
 
 # for /usr/share/qt5/qtwebengine_resources.pak
 FILES_${PN} += "${OE_QMAKE_PATH_QT_TRANSLATIONS} ${OE_QMAKE_PATH_QT_DATA}"
-RDEPENDS_${PN}-examples += "${PN}-qmlplugins"
+
+RDEPENDS_${PN}-examples += " \
+    ${PN}-qmlplugins \
+    qtquickcontrols-qmlplugins \
+    qtdeclarative-qmlplugins \
+"
-- 
2.1.4


