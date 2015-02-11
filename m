Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id DC9EC72DAE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Feb 2015 01:44:22 +0000 (UTC)
Received: by mail-qg0-f42.google.com with SMTP id z107so572678qgd.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Feb 2015 17:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=FG973zI8gnWg3ttB3Cjo2BmkYtm5DZY8cSjRbLH8hAY=;
	b=A/A8dZHUZtz733Atdj8I6fclz4LKuOjJ0gyxge4RJgFkiwx8iJ50ygjluGE8a0r0Tw
	t0gVRFE9yo2+eiHo98wWXl37qd9vWmz7sAEehJjC+hIsJJfEHj0Cxwll08q8P0g7vwf0
	BSp94hzXqA4Lu+wcMzIlSGgtiE4Okw/X0cW9YK5mfH2lNVQLFni5xgCwoeTt+GjlS3XI
	ktWGAXebkhp3PqEJBHlJ11QPyUX14Ect6kdJr4aWeO+/PM+uDprTAQWsGqtY4UYidbmB
	3Zh3GJmgUF2OCIfYEnH76LTNvyOZYT2tmvnoUz7fntyOSbT/yQCWFVmoMf6JJ97tB2OM
	zufg==
X-Received: by 10.224.92.209 with SMTP id s17mr61497070qam.94.1423619063759;
	Tue, 10 Feb 2015 17:44:23 -0800 (PST)
Received: from centrium.lab.ossystems.com.br ([177.100.225.47])
	by mx.google.com with ESMTPSA id
	n13sm17222934qaa.25.2015.02.10.17.44.22
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 10 Feb 2015 17:44:23 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Tue, 10 Feb 2015 23:43:38 -0200
Message-Id: <1423619019-17403-7-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1423619019-17403-1-git-send-email-otavio@ossystems.com.br>
References: <1423619019-17403-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-qt5][PATCH v2 7/8] qtwebengine: Add missing runtime dependencies for examples
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
X-List-Received-Date: Wed, 11 Feb 2015 01:44:23 -0000

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


