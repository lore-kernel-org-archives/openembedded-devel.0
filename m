Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 6B80375D22
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Nov 2015 13:37:57 +0000 (UTC)
Received: by wmec201 with SMTP id c201so17833722wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Nov 2015 05:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=J9YO207axwTN1OuBmPPiSTll6VlQ0/jnXxFdjKGshsQ=;
	b=m6RZoNQ1IRJ7sMif7567fA2eolVclRY4j+xcGvgEopNnPQYKdtC9aLO+BCJbvDsthi
	i73o0BP97H7jVp7WO6Slr+LtCbTwRci9Xm6UCg5b0iVte+EOx45P3C4jLi4q0/Auh+Z6
	zIUcXN+nWiEZ3TW+GlX5khHBhAh/wu8h4POSlCz/haFTSs1WNLmkYYIDG0dbutBwuhP7
	C9/xa1HWrYS+9PovdCVxbbtbyMBmKnoJd9y1LC5mRB7GRdR4CK+QgiJjOFDwn2AnEiJ9
	5wetz+jzT+3wEuDmql8+eXl7WLzboUISA1tl1ES6RxBj6gQpiObOFGj9qTBl/kp1XXvy
	DLZA==
X-Received: by 10.28.10.13 with SMTP id 13mr9817366wmk.8.1446817077813;
	Fri, 06 Nov 2015 05:37:57 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id ft4sm169584wjb.37.2015.11.06.05.37.55
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Nov 2015 05:37:56 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Nov 2015 14:38:06 +0100
Message-Id: <1446817092-9386-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.2
Subject: [PATCH][meta-qt5 1/7] qttranslations: add ${PN}-qtserialport
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
X-List-Received-Date: Fri, 06 Nov 2015 13:37:59 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qttranslations_git.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/recipes-qt/qt5/qttranslations_git.bb b/recipes-qt/qt5/qttranslations_git.bb
index fb584ab..72a29b3 100644
--- a/recipes-qt/qt5/qttranslations_git.bb
+++ b/recipes-qt/qt5/qttranslations_git.bb
@@ -26,6 +26,7 @@ PACKAGES =. " \
     ${PN}-qtconfig \
     ${PN}-qtquick1 \
     ${PN}-qtscript \
+    ${PN}-qtserialport \
     ${PN}-qtbase \
     ${PN}-qthelp \
     ${PN}-qt \
@@ -87,6 +88,10 @@ FILES_${PN}-qtscript = " \
     ${OE_QMAKE_PATH_TRANSLATIONS}/qtscript_*.qm \
 "
 
+FILES_${PN}-qtserialport = " \
+    ${OE_QMAKE_PATH_TRANSLATIONS}/qtserialport_*.qm \
+"
+
 FILES_${PN}-qtbase = " \
     ${OE_QMAKE_PATH_TRANSLATIONS}/qtbase_*.qm \
 "
-- 
2.6.2


