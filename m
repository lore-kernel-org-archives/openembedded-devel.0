Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 3EBAC6AC1E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 21:57:46 +0000 (UTC)
Received: by iodt126 with SMTP id t126so165946302iod.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 14:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=IRPGoJvnxXD0wKOsUTfvAb/AP7lkG3QDerZHFuvu4lk=;
	b=i++dmvc2vqznXCqwOVPQd651HOxefPuKBxn/qdB5rmEdppJ2fAfc1RVGgXvBHA2c8r
	PKkcUR7w5ZRrSctXa5BBIJ10s84ZgzHBvzxCgF9iqXwYLCfFDq7W1g7N7SkDMjEvDDV2
	XymWDiGbqankjgs1mbFHk53JyHfIMykTsSxgqPTB8xtRbQwh6PYJglH8MacRMQIa/8YY
	tYg3xKzWsAretPEC8DevB1OpY9HLRzqI1t/MRtthipJ9mVbbupoq8IcjdZqugi5mDobG
	zHozkbLW0QCGOnwoZQ2jOXpiueeQQtmdVrWEL33Bib0T8OPKj23M5ogzNvUeLqR2EE7i
	7Mpw==
X-Received: by 10.107.153.200 with SMTP id b191mr19854408ioe.185.1440453466969;
	Mon, 24 Aug 2015 14:57:46 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79]) by smtp.gmail.com with ESMTPSA id
	w26sm1446845ioi.26.2015.08.24.14.57.45
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 24 Aug 2015 14:57:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Aug 2015 14:57:39 -0700
Message-Id: <1440453460-12824-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-qt5][PATCH 1/2] qtbase: Package the 3rd party libs if built
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
X-List-Received-Date: Mon, 24 Aug 2015 21:57:48 -0000

Third-party libs e.g. libqtfreetype when built is not packaged and hence
goes missing in sysroot, then rest of qt components like qtwayland gets
its configuration from qtbase to enable it but then does not find the
internal version of libqtfreetype.a which is what qtbase directs it to
use and as a result it starts throwing linking errors e.g.

x86_64-angstrom-linux-ld.gold: error: cannot find -lqtfreetype

This patch installs the needed libs into dev packages

Remove a trailing whitespace as well while at it.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-qt/qt5/qtbase_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 5603fb2..7d2d5ec 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -227,9 +227,9 @@ do_install_append() {
         cp -a ${S}/lib/fonts/* ${D}/${OE_QMAKE_PATH_LIBS}/fonts
         chown -R root:root ${D}/${OE_QMAKE_PATH_LIBS}/fonts
     fi
-
+    cp -a ${B}/lib/libqt* ${D}${libdir}
     # Remove example.pro file as it is useless
-    rm -f ${D}${OE_QMAKE_PATH_EXAMPLES}/examples.pro	
+    rm -f ${D}${OE_QMAKE_PATH_EXAMPLES}/examples.pro
 
     # Remove macx-ios-clang directory because /usr/lib/qt5/mkspecs/macx-ios-clang/rename_main.sh:#!/bin/bash
     # triggers QA Issue: qtbase-mkspecs requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]
-- 
2.1.4


