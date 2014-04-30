Return-Path: <donny3000@gmail.com>
Received: from mail-ob0-f175.google.com (mail-ob0-f175.google.com
	[209.85.214.175])
	by mail.openembedded.org (Postfix) with ESMTP id 22CEE607FE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Apr 2014 18:09:36 +0000 (UTC)
Received: by mail-ob0-f175.google.com with SMTP id wp4so2421410obc.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Apr 2014 11:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=x5yYa5H/B+ZX/VA9hr8EiPQScia32LT7fR079IDY27M=;
	b=LUCzdCuZP2Ev1GikvwIkWBSnWkuaPihmVOTQs3TT3thDHauWHG6CPtYVlOFvzaur39
	IAl3FdjWaB9bL9VidVmZQaJLTlkUwO5dSOJY52igtHlLWwFKZz9xOzHpXfJejH2oy0kQ
	/r715Db5oh6eYKQLrYpCKrYBffHbszluDrnXhp36QA7/pCGlOf7RydtGCO91r7lGe4II
	UvTrEnKsuJMN+Ho+mdUoVkLjS9V4mnMew/bv3SlfHO1PXKYP3kLCt5T2Xx2/ZKiQBnKC
	a9F1FS+baFoyAwbywzjo6IL5njJ+44OxI/E86xO/fiHwXclCmaCNDzYr4VkpP8Ev/YXx
	9jkA==
X-Received: by 10.60.74.195 with SMTP id w3mr6892865oev.28.1398881377330;
	Wed, 30 Apr 2014 11:09:37 -0700 (PDT)
Received: from victory-embedded-dev.dyn.datasys.swri.edu
	(victory-embedded-dev.dyn.datasys.swri.edu. [129.162.107.136])
	by mx.google.com with ESMTPSA id
	c7sm104758874oek.12.2014.04.30.11.09.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 30 Apr 2014 11:09:36 -0700 (PDT)
From: "Donald R. Poole, Jr." <donny3000@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Apr 2014 13:09:30 -0500
Message-Id: <1398881370-12284-1-git-send-email-donny3000@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-qt5][PATCH] qmake4_base.bbclass: Add staging directory for native builds
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
X-List-Received-Date: Wed, 30 Apr 2014 18:09:37 -0000

From: "Donald R. Poole, Jr" <donald (dot) poole (at) swri (dot) org>

When building a basic Qt5 native application, the build fails on the do_install task as a result of the  variable being empty. This causes the copy command in the test block to fail because it is trying to copy files from/to itself.
---
 classes/qmake5_base.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/classes/qmake5_base.bbclass b/classes/qmake5_base.bbclass
index 2db0fa3..18fdb2a 100644
--- a/classes/qmake5_base.bbclass
+++ b/classes/qmake5_base.bbclass
@@ -171,7 +171,7 @@ qmake5_base_do_install() {
     # but we cannot remove sysroot override, because that's useful for pkg-config etc
     # In some cases like QtQmlDevTools in qtdeclarative, the sed above does not work,
     # fix them manually
-    if [ -d ${D}${STAGING_DIR_TARGET} ] ; then
+    if [ -d ${D}${STAGING_DIR_TARGET} ] && [ -n "${STAGING_DIR_TARGET}" ] ; then
         echo "Some files are installed in wrong directory ${D}${STAGING_DIR_TARGET}"
         cp -ra ${D}${STAGING_DIR_TARGET}/* ${D}
         rm -rf ${D}${STAGING_DIR_TARGET}
-- 
1.7.9.5


